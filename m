Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C855A1A682C
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133256; cv=none; b=Tsh6TWT5BDKgdwA/EhTIFrAkOCv2FnY9s7XDs1xcldoPQhdQFkTRDvZ7MA4U5ar+eVKPfBxX6ar0kWieNybsKOrM6wZ6bm0et0xfxxorjhOLgc3TZDeV2kXiRurj5VXR9HAJp0hYHgoFyVTGfJy8dM6MMjuFSi4+epwKbkwsRGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133256; c=relaxed/simple;
	bh=EiVS+p2T+GyOsQnu0/dRSpaUxiSOtXMZidUN1jtatKE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rkYZ/kgjIPs/mO8YO/NA9MIu+qtddaFdkEryu6uefdUew+5zdHWaLMNlq4OmrPUMXd7nzNoFnRfZ6YKmOvibM+8mVerOrlq4FkxgeaqhIKQWxPP9R1j8+NV4yQmz0IcRrUjFDSO/AexhGUm4eo1w5wGuGKC+bz1Njg8z1AEb0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KE1IItqP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KE1IItqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0771F000C5;
	Fri, 16 Oct 2026 06:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792133248;
	bh=k+49Oph/Ee8NVekwYbZMg2JyvpXhNgDf6Dl9UIp6wWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KE1IItqP/AzwzCuKnOUdG0kSZ0hX9X4L2upFrV4UIWtlAa/kP06lpS/VsUD4xj9ds
	 BpKviMYFQhumGudUWNkwJV/2TmQBHa1W/PtZaGmuvRsBp5mlSHlTWjRM/3h9YSvvTl
	 YlqWQeERZRYWiqj00riDrCU1q4/DzX9FeRq0mpIzu0FS1BzplnBAjSMvdRb4yivF+q
	 V0y+fwf6WH3K6DiIzXc3RzwpQ71cxZ9Qx7VAlU3T/KTLSwZIRm2uW+ByHjvCULYLQD
	 vLpF+wcEMBYwtNtdz3hitGESygzQC0SfrmWZZZf8j8I8ovdAxqm4GrAfz0jkMpEqR0
	 BQaoWVupmgk5g==
Message-ID: <sashiko-outbox-173881@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/6] dt-bindings: net: ftgmac100: Add
 AST2700 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-support_ast2700-v3-1-8d7999171ac4@aspeedtech.com>
References: <20261015-support_ast2700-v3-0-8d7999171ac4@aspeedtech.com>
 <20261015-support_ast2700-v3-1-8d7999171ac4@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 06:47:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: unconditional phy-mode requirement conflicts w=
ith use-ncsi
--

commit 400bdacb7816aa92f8043666f3a7c205e84d2f56
Author: Jacky Chou <jacky_chou@aspeedtech.com>

dt-bindings: net: ftgmac100: Add AST2700 compatible

This patch adds AST2700 to the FTGMAC100 compatible list and documents its
RMII RCLK gate requirements. It mandates the phy-mode property for AST2700
and makes the Aspeed MAC compatibles standalone by removing the generic
fallback requirement.

> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml=
 b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index d14410018bcf6..0a376b849a916 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
[ ... ]
> @@ -82,26 +81,35 @@ allOf:
>            contains:
>              enum:
>                - aspeed,ast2600-mac
> +              - aspeed,ast2700-mac
>      then:
>        properties:
>          resets: true
>      else:
>        properties:
>          resets: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2700-mac
> +    then:
> +      required:
> +        - phy-mode

[Severity: Medium]
Will this unconditional requirement cause dtbs_check validation failures
for AST2700 device trees configured with NC-SI?

Looking at the driver code in drivers/net/ethernet/faraday/ftgmac100.c:

ftgmac100_probe_dt() {
        ...
        if (of_get_property(np, "use-ncsi", NULL))
                return ftgmac100_probe_ncsi(netdev, priv, pdev);
        ...
}

The driver explicitly bypasses PHY initialization and phy-mode validation
when use-ncsi is present. Because of this, phy-mode is conceptually
unnecessary for such configurations, but this binding schema will force
those device tree nodes to include a meaningless phy-mode property.

Could this binding be updated to only require phy-mode when use-ncsi is
not present?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-support_as=
t2700-v3-0-8d7999171ac4@aspeedtech.com?part=3D1
