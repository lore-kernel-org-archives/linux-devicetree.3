Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE39376BD0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162288; cv=none; b=PFk0JSr96R3mljnMYZXzYvcx9H4/eOj+VvBvdPgshjfbHQOfJV2cSC1Wpk4Lx0w0IikRz7jUedRLODdp1t3GSzITavEAKmPT4N9SzSWStWExNHhjxxqXjbjJaqcp7R5SAcvAnw2rwr6h2E4lXsesrMyZ0oBzgur4FASi/AP+iPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162288; c=relaxed/simple;
	bh=kuWb0Mqad9hHP4LM+2dMuABz01m1l7JEq/GTc2/jvBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L+KL9vTv1O+4z/HTMNQsoRrcRlNBXqsfLvlqrm+hx77CbNQ1LzhEsc0k4AAd2pANOiPB0oGHmRZ4ImmG8RH/wFPXHds8vYmv1zGy8FnyxRTDI5fUELxxaNbxehf/Xc8pJA5WA4nmKkPdBZwFaOu1wa+hGYMWVC+2KBPCTjcMF34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghzqeg6+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghzqeg6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979011F00A3D;
	Mon, 27 Jul 2026 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785162286;
	bh=TmPlx2vBNr4e5UkIgBXzFpsNxpCiwlMDQbVA6kjfHzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ghzqeg6+X9rKPEg51Qnj+rDb60Vp3RjXfPdy79YUZeZBdDJEWiqEyCS02Qi0Y0QqG
	 l5dDhASwTK6g2TQNTyg46wmEoFRhOa6Qg/cc4jRK9e5jMYt57IM//vWcXqfnEuHH2B
	 rZcZLCl86dxbDStUYszilytVYQIK5CzJ5+vn74VvG0+C06pYhuwV660yHaocts4GHx
	 aX2MjKwReEybwskIAMD8Q9Ds1lwzM1YpPrwcQhPrKkZTGjI47xUY0PzVB7XOCJi7DO
	 3WdzVUg/htzXz+dTPJSlZDs5oBgEB6YSoBwM5DxG3CoVegbj0NoIavlvnq5f0dAF4c
	 OhPS4v8XvEGxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: Add compatible to the
 PCIe Root Port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Deng" <wei.deng@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-b4-monaco-evk-m2-v1-v1-1-5429cce68599@oss.qualcomm.com>
References: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
 <20260727-b4-monaco-evk-m2-v1-v1-1-5429cce68599@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 14:24:46 +0000
Message-Id: <20260727142446.979011F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch adds `compatible =3D "pciclass,0604"` to `pcieport0` but=
 fails to add the same required property to `pcieport1`.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: qcom: monaco: Add compatible to the =
PCIe Root Port ---
commit 0ca797402b7e421fe911e89c620b4ebd792ff4af
Author: Wei Deng <wei.deng@oss.qualcomm.com>

arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port

This commit adds the "pciclass,0604" compatible string to the pcieport0
node in monaco.dtsi. This enables the PCI subsystem to associate the
device tree node with the PCI-to-PCI bridge device, allowing downstream
endpoints to be correctly matched.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 64fc0d592282c..438ccf6eba64d 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2393,6 +2393,7 @@ opp-32000000 {
>  			};
> =20
>  			pcieport0: pcie@0 {
> +				compatible =3D "pciclass,0604";
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;

[Severity: High]
This is a pre-existing issue, but should the same compatible property be
added to the pcieport1 node in this file?

Looking further down in arch/arm64/boot/dts/qcom/monaco.dtsi, the pcieport1
node is missing this property:

			pcieport1: pcie@0 {
				device_type =3D "pci";
				reg =3D <0x0 0x0 0x0 0x0 0x0>;
				bus-range =3D <0x01 0xff>;
				...

Without the compatible property, the device tree node for pcieport1 will not
spawn a platform device, which prevents power control drivers like
pci-pwrctrl-slot from binding.=20

Will this cause downstream nodes (such as M.2 endpoints) connected to the
second PCIe controller (pcie1) to fail to match or correctly power on?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-b4-monaco-=
evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com?part=3D1
