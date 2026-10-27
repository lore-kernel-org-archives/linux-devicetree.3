Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099332;
	b=Zys3DSzUPs6kGjgD1T0RSaZ8/A7Rr5oCpjSzaIa2rweJIOx/UWJWI0GakmJOoD0KmJwD
	 uT7Dz2PAc4y9idx/P+LaQurSfsUEdgTpVUqZAvrU7kVcc5/4Tg0J/KqNkFCmnUM46tlG3
	 6i5Q8qlG4imX1kfjWDOVzgsXUryTDy9K+xXUXNFVC1LXkzEyDDBhM7w6BtQItLV0f3x7R
	 KTEwNGGZ6hPBGTkneliM+yDk9QQLJ7/uvxOrDf8LmdjGRNi2CikbNWRvagegnETlQrYa2
	 J1JimzIYvCvGTYF0Ts081DhjowbQTESNVLtJp0H9rCOA6crp/olrFaBOEPoo0cmpuMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099332;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2hM9mxHhLuj1we3DZ/m/4m/Qo/lNtvCzpdhphngvTyE=;
	b=r37eI2//d90/U0NSShyEOVjJKbz+1Gs31Nmi4iJSUX0S5/xNaK5N3jicXKWh9k5lqVCW
	 i4iBB45wlAUeugs091xcI8XjNNAb9djY3+tmfGGhzNAwd47E00ytchC7tdnelk+y/e1SG
	 X75v/c7Fzch1Hf41h675LhXb8EzuK5jUHQPaZpJKHacliNAEugeF8T3EyHR/n9gzDoKW3
	 vl50IFbxJG4CaNrFY0jYFiV32s7zcK2zvqe4Eek3AQC/Kpe+kWxfoOJ4dlcIppQErIGBR
	 xBc4+7DO7wDtBxC8TdGNrnoB94e2gNRzTdLIQHpseOXYOJqtDviyN6IiVIj3vAdAHfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKzvnqdS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92C6606A32C
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKzvnqdS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA31A1F01825;
	Tue, 27 Oct 2026 11:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793099331;
	bh=2hM9mxHhLuj1we3DZ/m/4m/Qo/lNtvCzpdhphngvTyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SKzvnqdS5TT0q14wRUOMnTlfWips9nx5kkEh8UJL533oq5T4II6Y0ePrblzyAS5I9
	 7QKWGFSdJzkCkzWwKtOKkJErnfxIxRN8/DCibQ78/kFhA1UVFGu30ZajqvFbevsaL0
	 0RmVdOyZ2T41pqHmtfDxCkxAIpOr6zlJpLGuW53Z2mnK7c8OuD/fO8JxVLmdNLCdUr
	 QLvQ1Np7Er5PSjXYm1ByM7lCgdgVZUE3cGgBt1XNU1SJB7rDxu7r+COtQsEc6B0QYU
	 TOUo3dHuzrFumO2VbNTY8ABIr+oIaVhxWfrPzx21h7sxeU+VwYx/WBdDdEG2uoSFNx
	 ROE4JVui6Q8pQ==
Date: Tue, 27 Oct 2026 12:08:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-rockchip@lists.infradead.org, 
	linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
	Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: rockchip,pcie3-phy: Document
 firmware-name
Message-ID: <20261027-majestic-perfect-mule-a746ee@quoll>
References: <20261026074003.1169669-1-shawn.lin@rock-chips.com>
 <20261026074003.1169669-2-shawn.lin@rock-chips.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026074003.1169669-2-shawn.lin@rock-chips.com>

On Mon, Oct 26, 2026 at 03:40:02PM +0800, Shawn Lin wrote:
> RK3568 can load an updated PHY firmware into its internal SRAM. The
> firmware file is named by the optional firmware-name property; when it
> is not described the microcode already present in the PHY is used.
> 
> Document the property and add it to the RK3568 example.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> Changes-in-v2:
> - Add maxItems: 1 for firmware-name (Krzysztof)
> 
>  .../devicetree/bindings/phy/rockchip,pcie3-phy.yaml        | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

