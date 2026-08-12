Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905EA37F319
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 02:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786503009; cv=none; b=LvHBkmrXcWo7D6biLwvT8zw/dYn1H/nTlT1NNfc/NWncNWL3jnQc3rtg4S21D2AQzlK6pMA7FYRV0mlkFGSblT0JoxhetW1b7qfqPKZPDB8VXGs7Tdf28U2OlhGols9eFgFLBbeNvUxVv4eNkHSH4q20C2KtTRsNidgdS5xVWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786503009; c=relaxed/simple;
	bh=jnsyTB/V9NSapBBLZzXlJnwhn09GaBc0QseVa+6rdxA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SE3APLqDvQXv3BIYMpDgI0o8t3CGQP3Z6DvsXp70libcrG1iC3G9xJrnsMO7F1632uLK6qmG/eoESueOqAvtDoijvhxK/SYrmAapLNtptPnOTS/D/rp5s6FExOWRGW52jU8SCY9o+Yyg6aSG1KAcO/r71qFQisDlqttZIkSpBfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6hqhd7x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6hqhd7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2E71F000E9;
	Wed, 12 Aug 2026 02:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786503008;
	bh=3G8bz6FArD9ag213ihkE7TWlP6mqXljmu8jO7p6LG5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d6hqhd7xplOVbI+Aj6u0kKC9ygbIOhHDtnRNBE5LnEhNj/FTHskDeRQuNC1gWmGyV
	 FWbPvaZXn1hKEtrKqkTnXj2XzXTjvetoHnM7wyhK5W4RP/WhkP/vSeorRxMVEcp4QO
	 wUl1efFoO5R9zpcyLRgPVHmjybn3oIEo1S8Pm2oSCGqcPaFqaP1J5HHSE48Zm+O/NM
	 SEWIoyGFkyjPuB+x3v6xPNGYGdxNHcf23c90DkGdSfOOsuHIKbw5iTQZvLsleP4TFh
	 UaIp6241z5YGuOx0KkAd1IREm/IPQCsFQ0pWZDiGvF2S6y1AnhlcBkX0nlZHDvDfv2
	 O4+f4REvvQ2yQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, media-ci@linuxtv.org
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-1-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-1-3fae085861bd@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 02:50:07 +0000
Message-Id: <20260812025007.AA2E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The `SM_LOAD_VIDEO_FW` command is added to the enum but lacks the =
required SMC ID mapping in the secure monitor command table, making it enti=
rely unusable.

Pre-existing issues:
- [High] Missing synchronization in `meson_sm_call_read` and `meson_sm_call=
_write` leads to shared memory corruption and race conditions.
- [High] Object lifetime mismanagement in `meson_sm_get` returns a dangling=
 pointer.
--

--- Patch [1]: [PATCH v7 1/6] firmware: meson: sm: video firmware loading v=
ia secure monitor ---
commit ee0d9a884be177be69f150b77b1f3503c328edfa
Author: Zhentao Guo <zhentao.guo@amlogic.com>

firmware: meson: sm: video firmware loading via secure monitor

Add SM_LOAD_VIDEO_FW to the secure monitor command enum to allow decoder
drivers to load firmware through the meson_sm interface.

> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firm=
ware/meson/meson_sm.h
> index 3ebc2bd9a9760..3b90b49d05529 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -15,6 +15,7 @@ enum {
>  	SM_THERMAL_CALIB_READ,
>  	SM_A1_PWRC_SET,
>  	SM_A1_PWRC_GET,
> +	SM_LOAD_VIDEO_FW,

[Severity: High]
Does this new command also need an SMC ID mapping in the gxbb_chip command
table in drivers/firmware/meson/meson_sm.c?

If drivers attempt to call meson_sm_call() with SM_LOAD_VIDEO_FW, it looks
like meson_sm_get_cmd() might return 0 because the command is not mapped,
causing meson_sm_call() to return -EINVAL:

drivers/firmware/meson/meson_sm.c:meson_sm_call() {
    ...
    cmd =3D meson_sm_get_cmd(fw->chip, cmd_index);
    if (!cmd)
        return -EINVAL;
    ...
}

[Severity: High]
This is a pre-existing issue, but will drivers loading video firmware
concurrently through this interface encounter data corruption?

Looking at drivers/firmware/meson/meson_sm.c, meson_sm_call_write() copies
data to the globally shared memory region and invokes the SMC without any
locking:

drivers/firmware/meson/meson_sm.c:meson_sm_call_write() {
    ...
    memcpy(fw->sm_shmem_in_base, buffer, size);
    if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, ...) < 0)
        return -EINVAL;
    ...
}

A similar lack of synchronization exists in meson_sm_call_read(). Could
multiple kernel threads executing these functions clobber each other's data
mid-operation?

[Severity: High]
This is a pre-existing issue, but is there an object lifetime mismanagement
issue for drivers obtaining the meson_sm context to make these firmware
calls?

In drivers/firmware/meson/meson_sm.c, meson_sm_get() retrieves the fw
structure but drops the device reference before returning it:

drivers/firmware/meson/meson_sm.c:meson_sm_get() {
    ...
    fw =3D platform_get_drvdata(pdev);
    put_device(&pdev->dev);
    return fw;
}

If the meson-sm device is unbound via sysfs, devres cleanup frees fw,
leaving consumer drivers with a dangling pointer that will be dereferenced
during subsequent operations. Does this require a fix?

>  };
> =20
>  struct meson_sm_firmware;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-b4-s4-vdec=
-upstream-v7-0-3fae085861bd@amlogic.com?part=3D1
