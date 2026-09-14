Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8DC3A16B6
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374131; cv=none; b=VnxjAfi4fW6UL3Qk8akLRHOh+6xyxHXeeRd5+4qt3lxZEBzWDXM5YH/NfO2y/2MSM/kT9fF+fVlKFCPJ1kMfpGS+iViz9ynygovSXiN3Ai9zU0dRJ11KXW3EYh31xOaHZA2gGIQ3u/k1RX3UMgcYYo6D4/MaBs/1UldAewGM/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374131; c=relaxed/simple;
	bh=o/HJQw4CZTJ87WfaUX5MlKoS7VM4RY1p6K29KXn7XhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c9CagYKS9H1q5bFTNVu0932Be3VPgu3ciVLQoEHoSG4lqcbKUYD0qttOwMQYTAm1D7GP1DECFvepos0kzJlVrxVa2NR0hBiaD8HD3IrPQXM4nqgkLXaP7M/ixwIBh27sML8N7itQFl5LtJKfOokD40H/nMA7YP/jEtP6v9rSZA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQcnj0Xc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQcnj0Xc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07391F000FF;
	Mon, 14 Sep 2026 08:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374129;
	bh=Ya+mF+antM4J5XtVgltbSZyyhQ3bptqwoug1LCd7lmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bQcnj0XcWZeTCGBHe3S7ThRlAMvb7lUN7L+/Ml0K79AmxuPEva3uDOZDx4KoKEsjL
	 KB2R6E92wE4TEq7d8ZZEkPOOd7zIp4/91NSanJ7uljZxVzqKlxHejCtilbNZFxnB1u
	 lHULhghYsV10s7GviT1+DmAwTPj97wmZdTdfWRM0afO8naQSlrT5IFBIHEo2nUGSAM
	 7MD5BgovOwVMUv3i36Rbc0UYC3O90Iyfar+ZHfQkP/mQ3PTccVAvzlT0rVczKJpsY9
	 G7rDCCr8KyvChcND3hmSvP17R4P1pZYHSS0cwjjvo5KKENTHrtrS/TbELilkSF79+7
	 qfYRD93EvmIIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: media-ci@linuxtv.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260914-b4-s4-vdec-upstream-v9-2-72fdb0d71b02@amlogic.com>
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-2-72fdb0d71b02@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:22:08 +0000
Message-Id: <20260914082208.F07391F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing synchronization around shared memory accesses for SMC =
calls.
--

commit e3c062e69752dda5c782cbb1944c0acc0d0866c2
Author: Zhentao Guo <zhentao.guo@amlogic.com>

firmware: meson: sm: Add video firmware loading SMC call

Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
table to load video firmware.

> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/m=
eson_sm.c
> index ab9751a59b552..887caa5c625db 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip =3D {
>  		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
>  		CMD(SM_A1_PWRC_SET,		0x82000093),
>  		CMD(SM_A1_PWRC_GET,		0x82000095),
> +		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),

[Severity: Critical]
This is a pre-existing issue, but is there missing synchronization around
shared memory accesses for SMC calls when handling these commands?

Looking at meson_sm_call_write() and meson_sm_call_read(), data is copied to
and from shared, unprotected memory regions (sm_shmem_in_base and
sm_shmem_out_base) during the SMC calls:

meson_sm_call_write() {
	...
	memcpy(fw->sm_shmem_in_base, buffer, size);

	if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, arg2, arg3, arg4) <=
 0)
		return -EINVAL;
	...
}

meson_sm_call_read() {
	...
	if (meson_sm_call(fw, cmd_index, &size, arg0, arg1, arg2, arg3, arg4) < 0)
		return -EINVAL;

	if (buffer)
		memcpy(buffer, fw->sm_shmem_out_base, size);
	...
}

Since there are no mutexes in meson_sm.c or the upstream nvmem core's
read/write handlers (nvmem_reg_read/nvmem_reg_write), concurrent access to
the SMC functions is unsynchronized.=20

For example, two root processes could concurrently write to nvmem, or
concurrently read the world-readable sysfs files.

One thread could overwrite sm_shmem_in_base while another thread is
mid-sequence (after its memcpy but before its SMC call executes), leading to
the SM receiving corrupted data.=20

Similarly, SMC execution and the subsequent read from sm_shmem_out_base can
be interleaved by another thread's SMC call, causing a thread to read the
other thread's returned data.

Could this concurrent access cause data corruption during one-time hardware
operations like EFUSE writes, or corrupt thermal calibration data reads and
lead to system instability?

>  		{ /* sentinel */ },
>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-b4-s4-vdec=
-upstream-v9-0-72fdb0d71b02@amlogic.com?part=3D2
