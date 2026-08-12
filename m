Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6535453A2F;
	Wed, 12 Aug 2026 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546544; cv=none; b=su8x0Y5hsMbiLAtl3ii0FrAFd8u0QAYGdure3PzM3+YpSqhaZX1bN1ovNeUcdJV5oazCZhZ/95X+iESR7sgShJB2GGZdefRHAs5B4JZMuam3hxBp+yKxUY6mi/L8du1OU6j9I33/yBS6NozM89rv1t3Z5Qs6uuSFSeWuUzs3Udg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546544; c=relaxed/simple;
	bh=rwTTkDd/sqAj0B4tX69OoEXT3ZCtJMDKCXWoA5d6zgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiRReyfchjjrwGEFzLHF7ZO+ZTIEvUlxJNP2hqI0x2YKhCOW6N7W/Ah+JLmO+VVuJZo63tmCEO5GeHctDU/sqDbqRNyOIBTJipGtfPemp0Ifzlpd4j1KYFg4+i9h4LljdU2zBU30Twgk+htyyqGCifnF6LMvkipH50nc+6smQT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUXVOJVi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUXVOJVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8811F000E9;
	Wed, 12 Aug 2026 14:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786546536;
	bh=uUujthjix+bSKif8wzF6gzmFVaCmYoprfmT7tPKE5sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NUXVOJViHgWTEPUGLytbX/XfURMj6hoSSD1Ehzjs3FnkgOLMEUEspu3gIQJY+d6ZR
	 +MYix+BRrdflP7JJsRr0YA5nZbB0znN4B/05MFlZ4J+61eWli/fpZ+mRXPvu+NVmLO
	 JXpKK4eShK7hodL3rNQY9gus5HAvgEBLV6sX79s6BJ9gxm6ePRuJMSifABDTiiQ0QS
	 Mgk/t4U0k3wJDTyY998orZWrPmJk7RY249ibNrfsImrsLrXcYzhdzUi4oyo3OGmaEN
	 jO0w1xcUHa0jYOjFImg0Ny6Yu9t+435cltWZzHP2XBf6CTshjHk3llr2WjKdSIxEsu
	 yZbE3sOovZgdA==
Date: Wed, 12 Aug 2026 16:55:28 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanley Chang <stanley_chang@realtek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/6] dt-bindings: phy: realtek,usb2phy.yaml: extend
 for resets and RTL9607C support
Message-ID: <mg64koywc4r5fwszio36jgxmpjh5fie2jdzxvi7s4vuymrcixx@76s3nekoynbw>
References: <20260520175728.720877-1-adilov@disroot.org>
 <20260520175728.720877-4-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520175728.720877-4-adilov@disroot.org>

On Wed, May 20, 2026 at 10:57:25PM +0500, Rustam Adilov wrote:
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
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
