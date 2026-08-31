Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4618B30D3E5
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165813; cv=none; b=e/43baqp7sfmrQoiwkaPwEE5aVWlVRIN9L5e0Ud7kVyoL/sx+An7leYdJXa/gF4clRIhMRwvNAgVM2dudnKibXOU24G5B04GiQad/rzvhcq43/lNcB9DGDNR44v7iSXoZwMjmXU/YYhoQ0Z4ZKPJd8A+EJBU23aIROEgOq2geyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165813; c=relaxed/simple;
	bh=u7g8VvasHcsluUOBpyXT4sZEQF1WsJ+iAiTVDEo690w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QilCBoPSnvZap9ZfcPYyH0FsxkPEWAqIG1YrY1w2UDm5Kt8X/v5bZdBot1/rSJpJRO8MhzODqlRma6vD6zHZFkP6s61FLlDrd72oGKuc1hFr3Nu/qpH1I/lwxIBSUBUsYk2m18CDq/YV7GO5jjeyA6/OzcUyghYWGbGGplK8jkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aViXDaZI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aViXDaZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B4F1F000E9;
	Mon, 31 Aug 2026 08:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165812;
	bh=/RB7u1Gx5WzI1965RAEtvOHVuqIDIvYsRQPq8xgHRWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aViXDaZIh/ZoLkAEsaBVS0IXL4wNKqp9rh5z1Xu47mkAQZu0BaBhI/rkj+T49gKaT
	 KCZaWrm9TDfX7mSm5VeuISFv0jKmPL/ZHP3Sl3xUMO/Nq3vBWGJYefhwVczv+WZiP8
	 JciIyJuQ09zP+zR3YAJTRwS180gmYGVgG2wKaNk/0SQKK2mV4rCKE2aE0mqn9mL0eu
	 KOf0/1Q/weNaTHpaWBqMDyxch5KMpbQe+MhxpG1xz/3Dl+1Mf+WV5uVqtjal2xslDE
	 mTaM8fLGQgKCZmiKWsAziYQXkTdkEZXzr+bWM/cTTOndQisv7qwQLsrTBtP9ucYaVM
	 1sYt9XdG4sZcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, media-ci@linuxtv.org
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-1-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-1-830195b9bd91@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:43:31 +0000
Message-Id: <20260831084331.86B4F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Information leak in `serial_show` due to uninitialized kernel heap=
 memory being exposed on short reads.
--

commit 024494408ffd3466033a6280dd28a958f93f1072
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
>  };

[Severity: High]
This is a pre-existing issue, but while reviewing this secure monitor
addition I noticed a potential information leak in serial_show() in
drivers/firmware/meson/meson_sm.c.

Could a short read in meson_sm_call_read() leak uninitialized kernel memory
to unprivileged local users reading the sysfs serial attribute?

drivers/firmware/meson/meson_sm.c:serial_show() {
    ...
	id_buf =3D kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
	if (!id_buf)
		return -ENOMEM;

	ret =3D meson_sm_call_read(fw, id_buf, SM_CHIP_ID_LENGTH, SM_GET_CHIP_ID,
				 0, 0, 0, 0, 0);
	if (ret < 0) {
		kfree(id_buf);
		return ret;
	}

	ret =3D sprintf(buf, "%12phN\n", &id_buf[SM_CHIP_ID_OFFSET]);
    ...
}

If the secure monitor returns a positive size smaller than 16,
meson_sm_call_read() only copies those bytes. The check for ret < 0 will
not catch this short read.

Because id_buf is allocated without zeroing and the sysfs attribute is
world-readable (DEVICE_ATTR_RO), sprintf() will unconditionally format 12
bytes starting at SM_CHIP_ID_OFFSET, which could expose uninitialized
kernel heap memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-b4-s4-vdec=
-upstream-v8-0-830195b9bd91@amlogic.com?part=3D1
