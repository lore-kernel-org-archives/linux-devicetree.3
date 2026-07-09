Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F83AE1A8
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587662; cv=none; b=iBeBfr6wNdjwpbk5sjHA99TjYNG4/vO1BbJAyN3Xl0+DIQAfVv/txOCZ+EYH8wJUDPcgbxCC0xnx4PJamlgleROhdbTl6dDv4h5BxMd5+/cEdIGqIydPyDKRuo3+eJAqAYqAAP00cMqfgJD00y9Wyggm8GUae1Bsgi/23u9/+OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587662; c=relaxed/simple;
	bh=BeSVdKrAnPMc8L6kwICGK3FH8fyPNK1WzmNhjpa/igc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RzSAKuEMDJNbt0uvxZAE+lNqqMEMGLLfJ6TpJzRRSPiYyjgxRq4loM3jrGfFfwGzhl9+f9vSlcUZIBA12TwYHMgFavrcDxtudl8+uUZk6VhLOTW06BUFHAl1rcJCSrc53m24GvUWotlPW5mbw1qWvlhlbfVHVqWjLUtRyErTBPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4Zd/68D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4Zd/68D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C37D1F000E9;
	Thu,  9 Jul 2026 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587660;
	bh=FLyeUEguuVMc9/4iLV6Te8wOO62Lb4v3sSJB91QEoOw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X4Zd/68D7tvUBE9HpPHXaYb7YMoZbCvYNCL3uBm9h3HJjadCoa4k24nvDRMyYwRVR
	 JtHhwDIY8yJBy3s0P+Yqd4e1uwaW+7gVVtRUfRkyxKxY3ogpb8IyZZinQPHAXCWekY
	 5VoD895BmwYvH0tc7Gdk2ooUx11FMg5GpLKyGhbXjYl6DgtQ/r39LLAXK2vUyRVpnr
	 u+Qqpt8fwbYcFWGbbbcaxXpLgQnpMMINUsoOrCOw+ji7DTRCS9lAYp3z6cD5Uojw/E
	 N1xbPcVevcoBaSjmpzXrcPNvtk0yQMWX/VfUAJzH0vw57x3wobH4fxtBRH8vay1Ymm
	 bdWeAHN2P1nyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:01:00 +0000
Message-Id: <20260709090100.7C37D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `qcom,has-eusb2-phy` property introduces a redundant boolean=
 flag that duplicates existing hardware topology information, and its descr=
iption incorrectly encodes software behavior.
- [Medium] The driver implementation for the newly added device tree proper=
ty is missing from the patch series, despite claims in the commit message.
--

--- Patch [1]: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property ind=
icating presence of eUSB2 phy ---
commit 9b14e7faf16aedf430d06c05d4c7f31252c58f4c
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

dt-bindings: qcom,snps-dwc3: Add property indicating presence of eUSB2 phy

Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
or not. This is used to modify dp/dm interrupts during host mode suspend.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/=
Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 8201656b41ed7..0c6a839be82fd 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -152,6 +152,13 @@ properties:
>        HS/FS/LS modes are supported.
>      type: boolean
> =20
> +  qcom,has-eusb2-phy:
> +    description:
> +      If present, it indicates that the controller is working with eUSB2
> +      phy. This property is used to modify dp/dm interrupt configurations
> +      while entering suspend.
> +    type: boolean

[Severity: Medium]
Is this new property strictly necessary to describe the hardware topology?

The hardware topology appears to already be fully described. The standard
phys property points to a PHY node which has its own specific compatible
string. Could the driver deduce the PHY type by querying the linked PHY node
or by using the controller's SoC-specific compatible string, rather than
relying on a custom boolean flag?

Also, the description explicitly mentions software policy ("used to modify
dp/dm interrupt configurations while entering suspend"). Should this be
updated to describe the hardware rather than how the OS driver behaves?

[Severity: Medium]
The commit message mentions that this property "is used to modify dp/dm
interrupts during host mode suspend", but the driver implementation for this
feature seems to be missing from the patch.

Should the driver changes in drivers/usb/ that actually parse and utilize
this property be included in the same series to allow for a complete review?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-eusb2-inte=
rrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com?part=3D1
