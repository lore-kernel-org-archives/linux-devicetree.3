Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE623CAA31
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165939; cv=none; b=FiBSUTIc3NtVIWnDJm0m0xq5+iuHLBk7M4DPXTm9s2O7RqtXjXzS+NZ4w8ovVzeV+1ca0ZHx/U+bLiUcM+FNFI/JcQewyq7uKbxPqvy04lod4h4xLPmUJGIp+TkaxqnFHFmeYQmqeOFQbAC3T1n1t1q3LdoY/hxT2vYdKAQASUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165939; c=relaxed/simple;
	bh=VE1ogEBUwe9NH3lAU37yIZeiuYSVW5+71nT+V1WfXYA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dGSBXk3dzfF+31iSGRcEyiEpzlDTqsv5W3kgwVI3OBjhJz40SDQdkeNPG/9u+kojkmrRlMlSk4oRWH5EYI6DlGeXkCPXg+gBh1pXv59qSP5g+pK3Reg74a8X6Z+fpDB6d0TIhHm+jKTsQZRpZlwlW6bfronoffFSPg4LZPfMqZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xpe2axpr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xpe2axpr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF4E1F000E9;
	Mon, 31 Aug 2026 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165938;
	bh=RBaKEzy3WJAZ5/M7he4aAXq1NYfHuJ13s4feY8ly5Bw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xpe2axprfLzQD493mgU8258l1x8RoBrns+nWZJRgHKCiTA49DCmn+VhS1SJUrufkr
	 5qTy+FvrWurKJ+QbyL2MyN5xZHFKiiZVIEln0GYZGVx9Y/hXv9pzsKsFogI4QsNMjJ
	 rYQ5rtocjR/PGv4ola6iY04ZLF0Q9S9yUO931Yq7Uffg3ihSE1A57cXYxIjSERdCcD
	 cDab5x2VE1wc7HfO4VUYwqnW8fRMiue2vN3vZ72WYcHuP/L3tUe9JJBdiwaNKNjfs2
	 NULxcULX6oNafNNf7fokECIPL81FCUCpY7eaqgirbWM+VtJeULHt/p9Tlvszp6IKTn
	 TqpKrOtAn4TXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-2-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-2-830195b9bd91@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:45:37 +0000
Message-Id: <20260831084537.9AF4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] meson_sm_call() unconditionally returns 0 on successful command di=
spatch, masking SMCCC errors from functions that rely on its return value i=
nstead of checking the output parameter.
--

commit 9dde1c44d8065dbf71f452dee2694d932fa3d6ae
Author: Zhentao Guo <zhentao.guo@amlogic.com>

firmware: meson: sm: Add video firmware loading SMC call

This commit adds the SM_LOAD_VIDEO_FW command to the gxbb_chip command
table with SMC ID 0xb200000f for loading video firmware.

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

[Severity: High]
This is a pre-existing issue, but does meson_sm_call() handle SMCCC
errors correctly?

Looking at meson_sm_call(), it unconditionally returns 0 after dispatching
the command:

drivers/firmware/meson/meson_sm.c:meson_sm_call() {
    ...
	lret =3D __meson_sm_call(cmd, arg0, arg1, arg2, arg3, arg4);

	if (ret)
		*ret =3D lret;

	return 0;
}

This masks SMCCC errors from callers that rely on its return value instead
of checking the output parameter. For example, the power domain driver
(drivers/pmdomain/amlogic/meson-secure-pwrc.c) passes a NULL pointer for
the output parameter and relies on the return value of meson_sm_call()
for error checking. This causes it to assume power operations always
succeed, which could lead to a synchronous external abort (kernel panic)
if hardware within a failed power domain is accessed.

Similarly, meson_sm_get_thermal_calib() passes a pointer to receive
calibration data, but if an error occurs, the SMC error code is directly
written into this data, and the function incorrectly returns 0 (success):

drivers/firmware/meson/meson_sm.c:meson_sm_get_thermal_calib() {
    ...
	return meson_sm_call(fw, SM_THERMAL_CALIB_READ, trim_info, tsensor_id,
			     0, 0, 0, 0);
}

Should meson_sm_call() propagate the error code in lret instead of always
returning 0?

>  		{ /* sentinel */ },
>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-b4-s4-vdec=
-upstream-v8-0-830195b9bd91@amlogic.com?part=3D2
