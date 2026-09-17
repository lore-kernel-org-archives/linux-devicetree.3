Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE86D70808
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 00:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603539; cv=none; b=RDGKQPA4tbBpH5uj7m/PZ6hryl4LSIuc/8LUkdZuvwR7ZNZqhKO2k6bBsbDO7mA4TYz0gbNrQpYP9n6Ubj/tliQ2ClMK5bHAZCNpHGZLc3WvFNwZIRnPrcpN4gaJDgmt2e2DTAchmJVni/gLj7lIJ4l3sL7ZyyCV8JO3xVhg8bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603539; c=relaxed/simple;
	bh=axkPoRml+MK/FZAD19d30hUeQytgIADQBPQxL0aVvBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vy1AN7PNtGb3enjlVGVN2KV3lUXHqOjnLTeqCLg2QbIIzncMBONvcXb+4KW9/mhXCRJgjCEbfcQZRf11vOkz26JwOM3le1x6mZ6wdXVzt9wtUbsnPHjYCqbKBLV3UjfOn28wfYpZPblfQLQqFs9E9Ny0e6o/aLdEbkTNt0l+Z48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdmbdRRk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdmbdRRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7241F000FF;
	Thu, 17 Sep 2026 00:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789603538;
	bh=LaTXhBOLpDYl5c0g04j5QXFoyBzEH7zQCsn3AEdnAsk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XdmbdRRkXYoS8TMwuPfBoP8LFQRj3Fh6wAHsUwIFohD/cQoxmnqi8gfhOrQFXbkvT
	 g2bAU6qLtdHX7hhElqXv/dQcPBUCafgU9yFUb2HQWQpkuK0ZVPKlc92CDxMrpb50bf
	 e9X9TZ29aGOpNvqEoU424+WxTd18vIgomStPGhfZNeQzB93P2GnzTpaBfKvVrT0hsr
	 4fcehXg3f+OS1JP+ZmMgiekLzfRrRfVJCkWZoCcz+SDWLTb33g3Ag7dd+CkHZakvI+
	 rHlu9naiSdhXJ1BlNeJ4aC1o1lcIE3VA3piIXi2tpznYct9b0pswW/Nit112sCuBDv
	 vuTSsFc41NM1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com, media-ci@linuxtv.org
In-Reply-To: <20260917-x1e-csi2-phy-v18-1-6515b5255fa9@linaro.org>
References: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
 <20260917-x1e-csi2-phy-v18-1-6515b5255fa9@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 00:05:37 +0000
Message-Id: <20260917000537.EB7241F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: phy: qcom: Incomplete constraints for DPHY split-mode
--

commit f4a95bb9fcce6ee77a3c3f8e0b0bc0bc538a0aa7
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema

Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. The schema
supports both C-PHY and D-PHY modes, as well as a split-mode allowing two
sensors to be connected to one PHY.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..dc64af97da6c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
[ ... ]
> +        allOf:
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    data-lanes:
> +                      maxItems: 2
> +                      items:
> +                        maximum: 2
> +                endpoint@1:
> +                  properties:
> +                    data-lanes:
> +                      items:
> +                        - const: 3

[Severity: Low]
Does this schema lack sufficient constraints for the split-mode endpoints?

The split-mode definition in properties.ports.properties.port@0.allOf appea=
rs
to be missing bus-type restrictions, clock-lanes constraints, and an explic=
it
maxItems restriction for endpoint@1. Without these, a misconfigured device
tree utilizing split-mode with an invalid bus-type, incorrect clock-lanes, =
or
extra data-lanes on endpoint@1 will pass dt-schema validation silently.

Could explicit constraints be added here to enforce the D-PHY bus-type,
restrict the clock-lanes positions, and strictly limit maxItems?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-x1e-csi2-p=
hy-v18-0-6515b5255fa9@linaro.org?part=3D1
