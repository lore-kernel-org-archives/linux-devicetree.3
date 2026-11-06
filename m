Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960788;
	b=D0GyZTwaijXNZ54NfFTKDQViQ9XlxlY82YU91TgLF34jHGDT1HZfBf7AyGHhZueqLUsB
	 Hf2Xu1ZEmeS3ab6k3MFksP8Mbv7ZjdWxgeDew43xhnAu+ILMIa10V1rLmCUAImhIKdHxz
	 MFkyjwM+QVly2QPazYvaTettCQGeEeOixoUOrxVTyCVxfPHHz6Z4n12a1QsQzoIrKtZc4
	 6OTBFH1OcNTwVDtOhpE/sCMYaqyho2U7lDrpLqvoRhWmiZRyvEtT1QwvM4d/xq3DRc8yd
	 sktrxhqVgXZ4vu/t6ZkB4en91263ibabcL9SnemrtqNAgesc1ka15xfJVxKHm2YfVCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960788;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J2YlyZsVqqW/WIFQ7AkRTzmr/M9BTQxzjw6sfIi8GB4=;
	b=i2q9pqo4ig8to5J20F5gnG4mjFDG4yuJ4EOL8hOb+LyTgaNDDt56jmCFiJVJFHwPH7+X
	 xuEuUaf8pkgb2TCHoOpKF9wqurXUOQrN1V9DKgPk958pWZgu7w3MTXjkAD0zAgA9Uhf3d
	 r0a+W58yarg3M72EdsjgoA4Ow+6Dxhoe6UF+LmwGhGalY+Isacyxcwl/Y4M4ie2vzJR52
	 pr5j4y49uYwgNyhK21Wm46pjBDsjJsdIzQtbXvcwuGWqWHFVNg7sRaFLpK5m5//gt4pqf
	 kK4gIRVWgwZnde1GXQlUXFl0KHtgbYGa4hJsGinlb0GdVLsQqOEzBZZuFV+Ip41TBkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBhXgPwH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF50A606A337
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBhXgPwH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1A91F008A5;
	Fri,  6 Nov 2026 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793960787;
	bh=J2YlyZsVqqW/WIFQ7AkRTzmr/M9BTQxzjw6sfIi8GB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NBhXgPwHABFonr11fJ6AYNGW/lv4IoL7+RQ5Q+6eMBgdh40vund2I5H/KIRp5+P7G
	 arwYhS8NWga86UAil1LJ94FCxQSjEMX29EI9LWDIebpiZ/+MUFm3dl5ZULQEn0YojS
	 Vky/qzpzF5/zsl9bAlehDtLZdUHcnyuOuuJEN3hkZXPU9iq+sXpRuXfRwGsl/DizUg
	 BWtqhfidkMlfTmNa8AQVUeV0xH5AkOLGM5RUpDbylK9455Jo2FOEVnronuue/XZraV
	 jefdmveC5wKb6j5OZNX+u84Man4I77q7PLzFLwDa06ao3YjCjAefMpogG148Vtu+nE
	 jTsuLsBLSgEGw==
Message-ID: <sashiko-outbox-201214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] firmware: meson: sm: make power-off work on S4
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106101854.46569-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101854.46569-3-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:26:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] firmware: meson: duplicate meson-sm prefix in
  meson_sm_power_off_prepare()
--

commit 0142b0300be6322393138fbe4dbbf32405872dee
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

firmware: meson: sm: make power-off work on S4

This commit registers a power-off prepare handler for Amlogic S4 that
offlines secondary CPUs and sets the firmware shutdown flag before PSCI
SYSTEM_OFF.

> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/m=
eson_sm.c
> index ab9751a59b552..de0c8e809c516 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c

[ ... ]

> @@ -303,6 +306,28 @@ static struct attribute *meson_sm_sysfs_attrs[] =3D {
>  };
>  ATTRIBUTE_GROUPS(meson_sm_sysfs);
> =20
> +/*
> + * The S4 firmware implements PSCI SYSTEM_OFF as DDR self-refresh: on the
> + * power key it jumps back to the kernel instead of booting, which hangs=
 the
> + * board. Setting the shutdown flag first makes it cold-boot instead, an=
d the
> + * secondary CPUs must have been taken down through PSCI CPU_OFF beforeh=
and,
> + * otherwise the wake-up path hangs as well. machine_power_off() only pa=
rks
> + * them, so offline them here, while CPU hotplug still works.
> + */
> +static int meson_sm_power_off_prepare(struct sys_off_data *data)
> +{
> +	unsigned int cpu, primary =3D cpumask_first(cpu_online_mask);
> +
> +	for_each_online_cpu(cpu) {
> +		if (cpu !=3D primary && remove_cpu(cpu))
> +			pr_warn("meson-sm: failed to stop CPU%u\n", cpu);

[Severity: Low]
Does this duplicate the "meson-sm: " prefix in the kernel log?
drivers/firmware/meson/meson_sm.c already defines pr_fmt(fmt) as
"meson-sm: " fmt at the top of the file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106101854.4656=
9-1-christian.koever-draxl@student.uibk.ac.at?part=3D2
