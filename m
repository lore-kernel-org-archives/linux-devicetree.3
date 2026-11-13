Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587969;
	b=AotDd2p5/J67g0wRzIJKlUTAE0KQbU+gUgqI+EpY2/He0JLmIC6LHkIC1LMdKpeIqK7h
	 sJIyYEPyGuemMSmmLYZz9vRgbdJZyhPW0NI6NTLJntC13taqhcFTgBHdcCno5D6zP85t8
	 llv0BJIDbLUXCAfMddbBksaQImtrmvoGFX82mxzqHty3OaeCgKujbMAgXwxNU1RTbhd0F
	 wtihEkRb0L1/S0FCtq+7rBL/nMYY4OBCdgY2yo+jcLYBovQ25b0JCf9NN7Zye2LQv0SM+
	 fdOBa2rxyBrsf8Rl++mwFVT+aSJ9+Ojmw1SGNiCMYvWZ+KrBbI8C92eIYRD1dIEutJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587969;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FV4a70Vp3RVtWK1HqXBXBGRqs0Nbda6wDSby3FpOvtU=;
	b=dAl8lpdY8ys/ebMYGtGXMW7QU4HLlVZee5fivL7O71i0EVz0/P+zxzxV4yfnag0oAcaC
	 2niPMzeY1zRzFkDVHxX/6+LalriKtVtMYP5JpfP33w3olfyj/NMUqQwF1c05PiReYYLUQ
	 jzOg+F/zxyzNkTHom8kbOaPfrkG34X7I6wlaLgcjZpYL/UsGzH6Vf0FmdpPL4HE0SWb97
	 45Dsb/OlAvEN/cVV6QcoPV3mLBmbj9qfrIFMhfbkdebpDalyGIC+35MQOUaR42mlpGNHh
	 NTOno0Kb2Zyrp85Vb4wDmIxzvSyNqoIMOT4RpuoT1csdAOvwnavMhsdgPOPy8stcWjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQjDmUgu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC726606BC9C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQjDmUgu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314891F000C4;
	Fri, 13 Nov 2026 16:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587968;
	bh=FV4a70Vp3RVtWK1HqXBXBGRqs0Nbda6wDSby3FpOvtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AQjDmUguGAwbevrUvSPrDEsENVrVWzRCgdUeYiTnHTU5qUI2a/JMJB6ouY2TyCba2
	 5O5Cv5QXooukNj1TwMnlml2QZrVWStP+p+GfuuSHlAgRLL6stcx8PxxurpcKGzI95x
	 I/MUMcytI0jjtAZi9h1dNRjK+GDeffDb0O6aJYoIUgTRS/bBCeQ6OhaPHl/SwIOKyx
	 CGH6SesthYU1H2MTZJYAza8mI2Dhd9Y4r1lRwSYuOmS6Vv2ogRw5FfQDSbwTzHFzjR
	 LFDuA6dhQqGAiSWP664MgptsNQE6QwVRSeuBKzupdHXyt2EVhrUgvYso+eaM4fxTIn
	 wMPYciKtLW9aQ==
Message-ID: <sashiko-outbox-213215@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 06/10] media: tegra-video: vi: Adjust pad assignment
 logic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261113161819.36847-7-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
 <20261113161819.36847-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:39:27 +0000
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
- [Medium] media: tegra-video: unpopulated pad index in
  __tegra_channel_try_format()
--

commit afb13afd32b21ef80b48671edacb48e14ada5d73
Author: Svyatoslav Ryhel <clamor95@gmail.com>

media: tegra-video: vi: Adjust pad assignment logic

This commit populates the pad field in V4L2 subdevice format, selection, and
enumeration structures using media_get_pad_index() instead of assuming the
source pad is at index 0.

> diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/med=
ia/platform/nvidia/tegra-video/vi.c
> index 139e3ff0faaed..f028780f07bde 100644
> --- a/drivers/media/platform/nvidia/tegra-video/vi.c
> +++ b/drivers/media/platform/nvidia/tegra-video/vi.c

[ ... ]

> @@ -465,7 +471,9 @@ static int __tegra_channel_try_format(struct tegra_vi=
_channel *chan,
>  	}
> =20
>  	pix->field =3D V4L2_FIELD_NONE;
> -	fmt.pad =3D 0;
> +	fmt.pad =3D media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
> +				      PAD_SIGNAL_DEFAULT);
> +
>  	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
> =20
>  	/*

[Severity: Medium]
Should fse.pad, sdsel.pad, and the pad argument to
v4l2_subdev_state_get_crop() also be set to the source pad index in
__tegra_channel_try_format()?

Right after this hunk, __tegra_channel_try_format() still targets pad 0 for
those operations:

drivers/media/platform/nvidia/tegra-video/vi.c:__tegra_channel_try_format()=
 {
    ...
	try_crop =3D v4l2_subdev_state_get_crop(sd_state, 0);
	fse.code =3D fmtinfo->code;
	ret =3D v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
	if (ret) {
		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
		    v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel)) {
    ...
}

When the remote subdevice's source pad is not at index 0, enum_frame_size
and get_selection query pad 0 with a source-pad media bus code, and try_crop
updates pad 0's crop rectangle in sd_state instead of fmt.pad's before
set_fmt runs on fmt.pad.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113161819.3684=
7-1-clamor95@gmail.com?part=3D6
