Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794255774;
	b=1P23b6TmFzvLsOW4HEpqlFQ6I6bBpUY4bRCusQ7Uykb+gzM1ImxIG7sqalI9Yeoa/pl+
	 RRHlBYc2UgcANORPXS+tJ3NU7LC2IAC7jNyE8FRnetbOi8U0QvgSnjKsWKk0cHlZUZ3WG
	 /KYmidot2GOj+z9etqFW8WvdPq5GYU4g+SD2p4xgtehuWoYWn+oy+KsXUHrBHSg0vaNkU
	 5h6quD10YQXJCGdo7Ip4oZBMsdZT43fB+dCDlLaak2UW/g5sdpnAqNoaNu3Sv9jn2fzZT
	 zH2Fjnf3ZEgUkeaVHwrNaBHnHNTEQekT+grAifS5QXxmDNXoqcl+2VkHiOnDfYbuR3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255774;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=smIx/dzWoz/l44+UChe+PWPM7b7nbNRf9mbkg4as6gw=;
	b=5CsZlX5nYnHWVQoaystviFXmboJfCL9TdMy4uDmONrw4MdFBUF7G+N159EyrccU0upRg
	 Ys1OWbWwijdL3bQzSe+iZbEQY+GOWUl0qZnPrpzYgd8jBr2FmUAW1uT2zYRFoo1wbjm6d
	 azEilXtazT4yS34szmbji0iAg+QBfrZIKuQAlhNkI2Hz/MKIXoVZyf5ZqeT074CA2uq9Y
	 qbkjA7EG1sTkN9kQljqZ+dKla9dmnCXxQMfEOUv6VMqvdRHU3ZOK/lfSjjTlKIQrE+VkO
	 QsULg0I9AMheo3vIDUty0L+DyAb8AHEk6X1Dj7JkbpAome1cghgGMjMDMsI3OQcK31g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvRHP1Cs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F84C606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvRHP1Cs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7278F1F0089F;
	Mon,  9 Nov 2026 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794255773;
	bh=smIx/dzWoz/l44+UChe+PWPM7b7nbNRf9mbkg4as6gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DvRHP1CsbPArIXmJ0KGYQcF9BnwslKKad69Uz2B+ktomIMnqEnMGQEDNNtAM9O3lG
	 1hkGYIgr5H3cNN/KorGQjAr19RMezHn84j9gqerBXiqnufXmM9/6fYOS8LTQjDQx2x
	 Mp0wsJQAATGvkx2C2KVNvl4HdIOeVrWPAR7uu69QnOXO95l5S2+rOz4nl+Jhr4stZy
	 cONZgSQwrHYqJoOnt4andt0elMTGYvk7n88wqvqACUXDlPPHO3Xw7O98wRm7AS7GFf
	 wis/MpU0UIT+cuBTqgsnNNWeDSlA53xo1QV6ZnL0+xy44QZm4ujveFknhwSPeArLST
	 veaZEglvCb0Mg==
Message-ID: <sashiko-outbox-205575@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/9] arm64: dts: qcom: sdm670: add adsp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107022453.159341-6-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:22:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: sdm670: missing qcom,non-secure-domain in
  adsp fastrpc node
- [Low] arm64: dts: qcom: sdm670: overallocated reg size on aoss_qmp
  node
--

commit 09499ee58443d0f969ea496f5f01be20fd59d890
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: sdm670: add adsp

This commit adds the Audio DSP remoteproc node and its associated SMP2P,
AOSS QMP, and APSS shared mailbox nodes to the SDM670 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/q=
com/sdm670.dtsi
> index 711e15b56cb8a..e99183c222083 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi

[ ... ]

> @@ -2383,6 +2412,19 @@ dispcc: clock-controller@af00000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		aoss_qmp: power-management@c300000 {
> +			compatible =3D "qcom,sdm670-aoss-qmp", "qcom,aoss-qmp";
> +			reg =3D <0 0x0c300000 0 0x100000>;

[Severity: Low]
Should the reg size on aoss_qmp be 0x400 instead of 0x100000?

qmp_probe() calls devm_platform_ioremap_resource(), which requests
exclusive ownership of the full reg range.  Specifying 0x100000 reserves
the entire 1 MiB AOSS region rather than the 1 KiB APSS client message RAM
slice, blocking other devices in that aperture (such as RPMh sleep stats
at 0x0c3f0000) from claiming their memory resource.

[ ... ]

> @@ -2573,6 +2621,135 @@ cpufreq_hw: cpufreq@17d43000 {
>  			#freq-domain-cells =3D <1>;
>  		};
> =20
> +		adsp_pas: remoteproc@62400000 {

[ ... ]

> +				fastrpc {
> +					compatible =3D "qcom,fastrpc";
> +					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
> +					label =3D "adsp";
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;

[Severity: Medium]
Is this fastrpc node missing the qcom,non-secure-domain property?

Without it, fastrpc_rpmsg_probe() defaults secure_dsp to true and
registers /dev/fastrpc-adsp-secure instead of /dev/fastrpc-adsp for
ADSP_DOMAIN_ID, breaking non-secure userspace audio and sensor FastRPC
clients:

drivers/misc/fastrpc.c:fastrpc_rpmsg_probe() {
	...
	secure_dsp =3D !(of_property_read_bool(rdev->of_node, "qcom,non-secure-dom=
ain"));
	data->secure =3D secure_dsp;
	...
	switch (domain_id) {
	case ADSP_DOMAIN_ID:
	case MDSP_DOMAIN_ID:
	case SDSP_DOMAIN_ID:
		/* Unsigned PD offloading is only supported on CDSP and GDSP */
		data->unsigned_support =3D false;
		err =3D fastrpc_device_register(rdev, data, secure_dsp, domain);
		if (err)
			goto fdev_error;
		break;
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107022453.1593=
41-1-mailingradian@gmail.com?part=3D5
