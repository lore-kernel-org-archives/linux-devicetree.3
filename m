Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075351;
	b=5NC7ihGhmaxwAkb3fvpO0jAXoNOjfz8e1MNWZGvAanohOXWO/Cvh8R+a2xHEYwLGArye
	 QiiQS5uv274k80Rhk1mHSFZBgqj8hmm5nfa8BsWRwDd5VY3PAVykb7c4eoDMT7OMRTMGu
	 zdSyw04HrVZ16vWiW2Dp0eBjTgjSsj7dHaxWv9iB+4LDbVXdZvu9rCQWAy5K0mxWvVSB8
	 IlBnAGDll1eRyyorL+0i+wehrqCL8Pvb91T3L041NHJOM18R1aXXjLwRWuxHQnFxu2fZM
	 hP2p8s+NF1wJdYrKN8DkH5YAlLJSJ6alQ3dmUQ2U6CzuLU0O/cZZAUCxsSLJX64f7Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075351;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m/U77x0y3C+3jAaj8IPRauVnmRuyLier0Ew19PXQRGU=;
	b=0OxZer4vsCgoxlP6BpB55UugS5Kyjg/IAecTo6EMciRMXm/qeDV9csSDiySHIHxJTPIx
	 fwiLLtVchOGXrlUTHB3bkApu28gL13uiw7H3bUsEYfiLUyvp9Jb5yFhTsqedkXeWz5RtT
	 nbwOH5XwFwV3h4Z59cD+oAr2Q/g8K7MJ3hsExtijVFIMgOZ2dc8WtOnfAcDHWdCBlsgjl
	 O8Hxp4VTFzrAqTLQ3o4RJaT39yYUknH8m1OQbIJLB8WprjAfRYCIOFC7fzQVIY6+/I8TL
	 jP2BmB1wMF0st1MxTb4ZN2nYK805uJPmeX+5PeIsv0eMm6XJr+y3nVt4tZjAgT+VElA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtgKYxkN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B40606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtgKYxkN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B0B1F01825;
	Tue, 27 Oct 2026 04:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793075350;
	bh=m/U77x0y3C+3jAaj8IPRauVnmRuyLier0Ew19PXQRGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BtgKYxkNMIIggx291ONFoJqoOOjVk9bBZPvj47Y2ZuF4tXMqfcUBf1xNTEYya6TSO
	 dZm2oeWHQBOYcg0Pa5W9xDZWeIg4fDKe9uMXv6zP3jHgB4+irLomYY+UmkShf3Wc0M
	 A1JY0ju1t9SLDVMKRi1VAr8AJ5cl9ya9wcV+TgSUhSAm/PNuKDIY/hVHAsh9L58XEK
	 ah5EEmHON+L80NEDdhqb51vTTILPxPC/YUbLp7hPJw2l4dvkOTxzmh8Es5KMRDirLg
	 VR88syygsstHoPy5aUKruypRnsnXa8eZ5A7g8bZHJtJ+6W7KyG3E3wKEa+GYXFkshp
	 G5cQqaRkqydzA==
Message-ID: <sashiko-outbox-186080@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-evm: Enable HDMI display
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mrigendra Chaubey" <mrigendra.chaubey@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027042231.499107-1-mrigendra.chaubey@gmail.com>
References: <20261027042231.499107-1-mrigendra.chaubey@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 04:29:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: ti: unresolved dss1 label reference in k3-j722s-evm.dts
--

commit 91b798e074e4955950640ee6d66d8481cca226d2
Author: Jayesh Choudhary <j-choudhary@ti.com>

arm64: dts: ti: k3-j722s-evm: Enable HDMI display

This commit adds the TCA6416 I/O expander, SiI9022 HDMI bridge, HDMI
connector, and DPI pinmux to k3-j722s-evm.dts, and enables the DSS1 node
to drive HDMI output from VP0.

> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dt=
s/ti/k3-j722s-evm.dts
> index e66330c71593a..bcf8088c9bf07 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts

[ ... ]

> @@ -854,4 +991,39 @@ &mcu_i2c0 {
>  	status =3D "okay";
>  };
> =20
> +&dss1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&dss1_pins_default>;

[Severity: Low]
Does this break building k3-j722s-evm.dtb when CONFIG_ARCH_K3 is enabled in
this tree?

In arch/arm64/boot/dts/ti/Makefile, k3-j722s-evm.dtb is built unconditional=
ly
for CONFIG_ARCH_K3:

    dtb-$(CONFIG_ARCH_K3) +=3D k3-j722s-evm.dtb

Although cbass_main in arch/arm64/boot/dts/ti/k3-j722s.dtsi maps the bus
range for DSS1:

    <0x00 0x30220000 0x00 0x30220000 0x00 0x00010000>, /* DSS1 */

none of the included .dtsi files (such as k3-am62p-j722s-common-main.dtsi or
k3-j722s-main.dtsi) define the dss1 node or label yet, because the
prerequisite AM62P/J722S DSS series noted in the patch commentary is not
applied in this tree. As a result, referencing &dss1 here causes dtc to fail
with an unresolved label error during a dtbs build.

Should the prerequisite patch defining the dss1 node be applied before this
change?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027042231.4991=
07-1-mrigendra.chaubey@gmail.com?part=3D1
