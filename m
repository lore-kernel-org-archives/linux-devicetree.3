Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E171439794B
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032483; cv=none; b=HfXJS596Q1njlaljPmFOp8gGhyHj96BzZlOflG5kwj5oXGM1CtKPPlQVnqGgX3KZKuy/Tu16Wqx++0DdRh/uTAi4cuLjG1UDSpbSFZy+9l6m6A4V/0M3zNSLKSs+VlEHplum1PwQptUBwb+tk/nts1E/cE7luOW4tdDQOgFkXCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032483; c=relaxed/simple;
	bh=wmNj/WZQW/E3vvz97hrwtLTxPDsAvrHiQkKfqWO93Co=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lsWJwpuN+LSZ93dN9pD5UHiA+nweKhBCcJBDm0HCX8onxMAyvvjD521cWZ5HGg7/7OrD/7ww96iOpB0b998ZjdrS2DrMBwAHCbyP98yxqgw5V731Vk1n3ZvWDgvHGLsnbCVUvVha6kmfJowj31pvrbhAIF72k8Wz5IMDLpPiG5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcwYIDd2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcwYIDd2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815D31F000E9;
	Sat, 29 Aug 2026 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788032479;
	bh=VGu3yW7H4Rv/tYMGfEBRnUzUwLGhYF5Cjgev4OynGT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GcwYIDd2AWrpSSkioRB+e0bOddpOrefRj/BtALEcpOgBPZwRoTc7DAcobOG60CWDM
	 aSIgsEPec30xFCcqym0THGIDlKm5QUbkIxJlSYg4kO8z2VmGs5vAtD1EMS2MH3Jk0I
	 g1wfBYZSEgqK4tPwOOWt8ayXmuolso41E0hDIAmBS+eniqCQMxEfWhXAnov9YOd/eQ
	 zA7oj83nVWgLOCFBrcDIxg5GmjpWNYVgxtkJBmi/ueO4ecQ53Ox7yHWcRyRRny9dlj
	 unGJmtoGr1t/QObiiQGIxqeq9WSLhzBEBqWH2D9hKh3POEXWqVTCUGt2ypfe7QVdq4
	 74fJPEaXqf4SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: relax interrupt
 requirements for ipq4019
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Eaton" <linux@divinehawk.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260829-ipq4019-dwc3-migration-v1-1-cc66b54ce21c@divinehawk.com>
References: <20260829-ipq4019-dwc3-migration-v1-0-cc66b54ce21c@divinehawk.com>
 <20260829-ipq4019-dwc3-migration-v1-1-cc66b54ce21c@divinehawk.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 19:41:19 +0000
Message-Id: <20260829194119.815D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Relaxing the global minimum constraints for 'interrupts' and 'in=
terrupt-names' unintentionally leaves multiple SoCs underconstrained, allow=
ing invalid DT configurations to pass validation.
--

commit 245becf7a38f613732404251842cf1f13abb06d5
Author: Matt Eaton <linux@divinehawk.com>
dt-bindings: usb: qcom,snps-dwc3: relax interrupt requirements for ipq4019

This commit lowers the global minimum interrupt count for qcom,snps-dwc3 to=
 1
to accommodate qcom,ipq4019-dwc3, adding a dedicated if-then block for it.
It also notes that several other SoCs relied on the top-level minimum and
are subsequently left unconstrained at the low end.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/=
Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 7d784a648b7d9..28e78302b814d 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -137,11 +137,11 @@ properties:
>                                 only on SoCs with non-QUSB2 targets with
>                                 exception of SDM670/SDM845/SM6350.
>          - ss_phy_irq: Used for remote wakeup in Super Speed mode of oper=
ation.
> -    minItems: 3
> +    minItems: 1
>      maxItems: 19
> =20
>    interrupt-names:
> -    minItems: 3
> +    minItems: 1

[Severity: Medium]
Does lowering the global minimum here unintentionally break validation for
SoCs that relied on the global minimum? For example, device trees defining
qcom,ipq5018-dwc3 or qcom,ipq5332-dwc3 with an incomplete interrupt
specification (like 1 interrupt instead of the required 3 or 4) will no
longer report an error during dtbs_check.

[ ... ]

> @@ -508,6 +508,25 @@ allOf:
>            contains:
>              enum:
>                - qcom,ipq4019-dwc3
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 6
> +        interrupt-names:
> +          minItems: 1
> +          items:
> +            - const: dwc_usb3
> +            - const: pwr_event
> +            - const: hs_phy_irq
> +            - const: dp_hs_phy_irq
> +            - const: dm_hs_phy_irq
> +            - const: ss_phy_irq

[Severity: Medium]
The commit message explicitly notes that qcom,ipq9574-dwc3,
qcom,qcm2290-dwc3, qcom,sar2130p-dwc3 and qcom,sm6375-dwc3 are left
unconstrained at the low end by this change. Should new if-then
conditional blocks be added here for these SoCs to properly enforce their
original interrupt minimum counts? Without them, invalid configurations for
these variants will silently pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829-ipq4019-dw=
c3-migration-v1-0-cc66b54ce21c@divinehawk.com?part=3D1
