Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23CF429022;
	Tue,  4 Aug 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830873; cv=none; b=Rg/93OWaU/GIYzl4vXLDvcKkEf593/ykiFjzoG7GFD7RKiutYbtu3P6B+TcP873cpLpghfzP0qiXJXsOzv9cqvfg0rQZUPDbHM2TXccKDqFF7mPSk6k3dK+sYWusFPFBSrfV/HSqzymqorEztQE53dzLvgT8drKXOoU31q8+L4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830873; c=relaxed/simple;
	bh=BrjR6KqhaxVvFyZUtkSJCeMpzWdUAtkfi7YU5t8nuEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBAEAzW+CKFL05Rsae2Kgv1r+x8AaSKyGVzKk75TLyo5XgVbATLU2LY18fsOHHXArXfGCQD7GQ6LhsAYdcEgK0GKpAR1BaxJ7bFnetY+5IkJOu09SJ/B5T9d+iF4qqg4gyGZxx/p+HE7ZjqCtMuYXCKjnua6gyBckbUQ6a1k1BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Drn5kOPd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Drn5kOPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26C81F000E9;
	Tue,  4 Aug 2026 08:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785830871;
	bh=96QAblQgxs5giL1aBFkUCjlInxNt133EFpvfjqgdHBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Drn5kOPdRxZal90axb1HjUVJ5oMdCRXxkBMudyVqlaNd90X7Tzh35f03hKBwcdHxX
	 bgD9zpDnnpDd2BAtBVjPc7iVPzlCpCCaru+IipkSfdcVGJUPJxTvomav4ktKzM2aqe
	 7z+yCrwa0LU1D/BzHknmr/Ggyj1dPh70ZV5hD2ixyrk8hNHhC/8nToTDf+vaImuclA
	 J+aoHHfh7YQvcNLV4bC8qxDszRguw78nSrllNZNQeIAifxio3jpqXjR6/QRHnnb4xE
	 NlK7L+aqZFzqOcQED04NwrCz0eu9fuYEd5dymEl0wzK1Fu3K+i8wpHkQvMOjHqxFW6
	 IIZkR+CGP2w+Q==
Date: Tue, 4 Aug 2026 10:07:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY
Message-ID: <20260804-active-sensible-reindeer-f459a3@quoll>
References: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
 <20260730-phy-qcom-snps-femto-v2-8255-v1-1-8b8bf5105a68@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730-phy-qcom-snps-femto-v2-8255-v1-1-8b8bf5105a68@kernel.org>

On Thu, Jul 30, 2026 at 03:58:14PM +0200, Mattijs Korpershoek wrote:
> SA8255p platform abstracts resources such as clocks, interconnect and
> GPIO pins configuration in Firmware. SCMI power protocol is used to
> request resource configurations.
> 
> Two power domains can be requested: transfer and core.
> transfer controls clocks and interconnects and core controls
> the GDSC, resets and TLMM (GPIOs).
> 
> Add a new binding for the Qualcomm SA8255p Synopsys Femto High-Speed
> USB PHY V2 found in SA8255P.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
> new file mode 100644
> index 000000000000..09f7ca6e7f72
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,sa8255p-usb-hs-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SA8255p Synopsys Femto High-Speed USB PHY V2
> +
> +maintainers:
> +  - Mattijs Korpershoek <mkorpershoek@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-usb-hs-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  power-domains:
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: transfer
> +      - const: core

Here and in your other binding you call these 'transfer' and 'core' but
all other bindings call them 'power' and 'perf'. Why this difference?
What are these domains responsible for?

Commit msg is pretty useless here - repeats the diff. I can read the
diff but I still do not understand why such naming.

And why core is not the first one? It clearly feels like the power
domain thus the main one.

Best regards,
Krzysztof

