Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96F4E8E00
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652023; cv=none; b=O2eVfbAwKHpS3EhVvWBVWNwzaRAkqJU+KmIArtVwJj1KSXHLBMnPVoZrmUz0K6ZrNzDsw6eCP+zs//Yse1uYVBpLj6ZbnxkB9z5ZF8iYKW3YDyJFWMt3c1yJPR0YoH+O2eMwZW6rNzeNNCep3WY9Rfa+DOrKvPKP/YlTTqoa3pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652023; c=relaxed/simple;
	bh=Bqh7InJ0JX0diQpIMD5H46QQxqVAhd/VnRJIu+jDp0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PNXV776Zeh5Xu0VsH/X6qsUnpP2lurvyynX5sHepVsceXF/iH5GKNA3WgKGU4TNT07XOuizFUQe4KUo3P7jo07M0xEE2KSqyNI5FPml9i3fuu0IxJentlzqZovp3sUsC+Mqxqen4MEkUFnXbIV7nn7b5e97BtCvbgHe7PjP6uAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrSyG5tz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrSyG5tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53F51F000FF;
	Thu, 17 Sep 2026 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789652020;
	bh=Pdz2DvrGzN719krerRxveEfXNudrV8DBihV2rteoxwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UrSyG5tzBQyJjUq4EAx++r58RFrx5VFICCvp8thITWl/PIgtl5p77rFwlW0RowW3E
	 29ag7OUqv2f7jzEbeIHA2/oGYG8GYGuVJvnp9I9OAM9hWzsc22Pyk90GCCz1+Q3cSA
	 IFAYTwfm8InraDK2kWTavJWKwWoPBq4NaCpCLB5jjpthhMw2ezItKQVb9KQQyehlWu
	 /bQHXncXdzzplKRUMYcPsiaebfoh7KH3pkJ2sJ42tUGvGhD9lNISJBZ4RDElSd68PK
	 0gIBSRBdQxZcoqTbPzD8nkO9iOSCeRxAwrVWw8dFpKYnRRiZJ9t50UA15baWAru9Kv
	 0p8raG+7oiDuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/12] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-2-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
 <20260917-x1e-camss-csi2-phy-dtsi-v7-2-1a63eb35838b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:33:39 +0000
Message-Id: <20260917133339.A53F51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: media: qcom,camss: Incomplete standalone PHY schema c=
auses conflicts
--

commit 0642d8e6156ba1c6d13706ca5ba065e41b3b1daa
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: media: qcom,x1e80100-camss: Make vdd-csiphy supplies optional

The commit removes vdd-csiphy from the required properties for the CAMSS
node. This change is intended to support CSIPHYs being described as
standalone PHY nodes with their own supplies.

> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 126400772d028..57a838fe2d229 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -186,8 +186,6 @@ required:
>    - iommus
>    - power-domains
>    - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply

[Severity: High]
Does this schema change fully support describing CSIPHYs as standalone node=
s?

Looking at Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml,
the reg, reg-names, clocks, and interrupts properties remain strictly
required for the CAMSS node. The reg-names list also explicitly mandates the
presence of the CSIPHY memory regions:

  reg-names:
    items:
      - const: csid0
      - const: csid1
      - const: csid2
      - const: csid_lite0
      - const: csid_lite1
      - const: csid_wrapper
      - const: csiphy0

If a DTS author extracts CSIPHY resources to standalone nodes, wouldn't the
CAMSS node fail dt_binding_check?

If the author instead duplicates the registers, clocks, and interrupts in
both the CAMSS node and the standalone PHY node to satisfy validation,
wouldn't this create overlapping MMIO regions that will conflict on
request_mem_region() when a standalone PHY driver probes?

Additionally, if the DTS omits the vdd-csiphy supplies as permitted here,
doesn't the CAMSS driver silently fall back to dummy regulators and fail to
power the hardware, since the driver still explicitly requests them?

Finally, if the CAMSS ports are linked to standalone PHY nodes that current=
ly
lack a driver, wouldn't the CAMSS v4l2_async notifier hang forever waiting
for a subdev registration that never occurs?

>    - ports
> =20
>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-x1e-camss-=
csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org?part=3D2
