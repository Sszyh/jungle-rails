describe('visit home page of Jungle', () => {
  beforeEach(() => {
    cy.visit('/')
  })
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("Click add to cart button and confirm the count of the cart changes", () => {
    cy.get('.btn').first().click({ force: true });
    cy.contains(" My Cart (1)");
  })

})