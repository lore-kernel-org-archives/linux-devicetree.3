Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF8362128;
	Fri,  3 Apr 2026 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775201335; cv=none; b=MocYomdewt2I6F3F6UzMZqZWlx2gAer7o9G6BbgU8y7u3P7wXq1EkP74Z2PQNtzgPI/c8JsDYlbnxYLd0bYskAn2asL/up6Qs9wxhR01Wlq9Pr9D7SfnrLrF0G0xkskIcqQSXZrOrnOEkgV/a1z+8k/X+nYtrfxw0BfBbgh8Xo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775201335; c=relaxed/simple;
	bh=SPbL2mrGyczm3g6hukeAuJmU2/lyZJSEF0dZ4mt/5ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIJ+gOmvi5QGfuRt5GM0EJfRKLljMu3UQuUv0R4LRyEjkatxUuaZ827CpvOZl+hvGqn1RLA67odI2ATaT/S6qXCX8Oq36yGkAyJwytV4EpfXtZ3zctDmLqC4FT6Y4pih3PIAhrWmhZO0gQDuO4z1lgMIZ+nigEUQxU04SXdDjKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTQ6fS9E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTQ6fS9E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5C4C19424;
	Fri,  3 Apr 2026 07:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775201334;
	bh=SPbL2mrGyczm3g6hukeAuJmU2/lyZJSEF0dZ4mt/5ZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTQ6fS9EWsdi0QVCIAZs2J7Vlda8cVCmFfMlrbnit5AdxL5FrvXBUomk4JR6bY2xy
	 hpED+Ic2b1ygWFrl4rE1l8xYgDeFhiyylXwdX16JDnnJJqnBVr2T05eJBJtpi2nIOE
	 OEEIO2KErKTE9TPSo6VwbpGDb2s3nuEws75Gcg84WPyZlp1dDpX6vevyMw50Kb4gSS
	 vEIm/7k1S7EyngzwVEC2+YZNFEqxK3dRb+9bzOiskHQ+D528dTAy1TLW8Nznab1Ebx
	 vVYmOqoT2+4mNnoWI7lmjPKi7A/IZ3ckOkA4nJ4vydGKsTANDsCOGwK3Pe5scyqOuO
	 RYKFwjlqjO5CA==
Date: Fri, 3 Apr 2026 09:28:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanley Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: phy: realtek,usb2phy.yaml: extend
 for resets and RTL9607C support
Message-ID: <20260403-striped-magpie-of-purring-ade9bb@quoll>
References: <20260402154414.196012-1-adilov@disroot.org>
 <20260402154414.196012-4-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402154414.196012-4-adilov@disroot.org>

On Thu, Apr 02, 2026 at 08:44:11PM +0500, Rustam Adilov wrote:
> Add the "realtek,rtl9607-usb2phy" compatible for USB2 PHY on the RTL9607C
> SoC series.
> 
> Add a resets property to properties to describe the usb2phy reset line.
> 
> In RTL9607C, USB2 PHY reset line is from "IP Enable controller" which is
> multipurpose and handle activating various SoC peripherals.
> 
> It is unclear whether RTD SoCs have something similar to that so set
> the resets to false for these devices.
> 
> RTL9607C requires the "resets" to be specified so add the corresponding
> if check for the "realtek,rtl9607-usb2phy" compatible.
> 
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
>  .../bindings/phy/realtek,usb2phy.yaml         | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

