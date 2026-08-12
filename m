Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7927741A902
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528306; cv=none; b=n5xkqzIzGbg1RTpiM9AccCUanrAlyuSQOwkpTFKxZTtX0scOHtvYqEgaEoECS/po53lYj8rUDouD0SkWeOrAdYRnWWkAgfoBoQA2WSlTxBkqE1mnl4O6UaCQGePlrAOFLoKmCmUBSRcr3SZLMmDmmiQ3NRV4nALLiHRT3Qala0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528306; c=relaxed/simple;
	bh=wcXgyuOnuInGSIwidSGyBoVh/W3XPRHrmWz4N4NcwrE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kHmu9b+XF2zgBIQ3P6UXesq/VC/OoWQV1MvxqSQATSA5CkSRBTKovG26covWP67DpRQvoAQevZVFXKSxdrRNXOuebc0MDSt/YAhrUBGkT0FhKCtXoKg7idyaoO1zekzPnphLL59uRiGkH3Elu3+MK2DhAUYZpeYodma84e85vM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5iymvMx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5iymvMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AE71F00A3A;
	Wed, 12 Aug 2026 09:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528305;
	bh=UKIehMH39W++hJqkMr0V6sFz8zeZKfwtHjPjQARHT70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n5iymvMxjMom/yTet7dpJTzN8q0IuIJxG/XagiSLBJUM2mNTHIklVVW3c7o2F56t3
	 maLWxkHK7kdNvQpDt+6Nt5IjvI/jK209JN7IZjVtpcL7y557E4v6g1NPR2t33O/j/w
	 ttMEXn+2CZolTPIA6z4W28Th24VvuLl3LdXKfex1d291Oxi2Fg0zymHCdlybZM3UcZ
	 /GfrFbT6Q2CHyW5F3XNpbXcXKhDhHZVnMD7Xa00t6/CwC4d/KZJljoxXjDlvD/ZP1x
	 HFjjbIsZKegOAcpTZ0fVRgCEJTXNx5gOH9D6ny1/+92KQHpMwBKNofNrNlgOs8SQU3
	 lxiF05cv2rP2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/14] dt-bindings: usb: qcom,snps-dwc3: Add clocks
 for USB3 on Qualcomm IPQ5018
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812-ipq5018-usb3-v2-7-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-7-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:51:44 +0000
Message-Id: <20260812095144.E2AE71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] DT schema backward compatibility violation: qcom,ipq5018-dwc3 ma=
ndates exactly 6 clocks, breaking existing High-Speed configurations.
--

--- Patch [7]: [PATCH v2 07/14] dt-bindings: usb: qcom,snps-dwc3: Add clock=
s for USB3 on Qualcomm IPQ5018 ---
commit 52d44d5749e478530dd0178f543b2a151efa9d68
Author: George Moussalem <george.moussalem@outlook.com>

dt-bindings: usb: qcom,snps-dwc3: Add clocks for USB3 on Qualcomm IPQ5018

This commit adds support for the aux and lfps clocks for the Qualcomm
IPQ5018 SoC in the snps-dwc3 device tree bindings. It creates a new
conditional block to specify these extra clocks and removes the compatible
string from a shared configuration.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/=
Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index e59fbfc1af71b..e3e22ac8462de 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -181,6 +181,26 @@ allOf:
>              - const: sleep
>              - const: mock_utmi
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq5018-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6

[Severity: Medium]
Will this break dtbs_check for existing High-Speed only device trees?

The commit message notes these new clocks are only required for USB
Super-Speed support, but setting minItems to 6 in the allOf conditional
block for qcom,ipq5018-dwc3 in
Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml mandates all 6
clocks for every device tree using this compatible string.

Since older configurations only provide 4 clocks, they will fail schema
validation.

Should minItems be set to 4 to preserve backward compatibility?

> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: iface
> +            - const: sleep
> +            - const: mock_utmi
> +            - const: aux
> +            - const: lfps

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D7
