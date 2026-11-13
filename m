Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587870;
	b=5ELEhh7neCo/i2iEq7deZDsa33doVEGpa2J4A8aa+CpgAVaWPEFiFrhXAKyzKmkqvw6u
	 AJxyF2a25EzWsTg/o6DranAHa/bmOpGloSOGqKeK/CKaqbIxNvT3J8VR2vQRAMp2pyvZ3
	 q5UHejVyWNqtG4D5FPR+86dwZebgABaA89eF6nehVgb7l6NRuqz3y2ZDVeYpWbj1t9i71
	 VseIe3UVK2FG916W4tm+9rvRGOxbHuwkrGj8z2hb2HDJrQzkMmLrbKQ3+E1eEYtDMjX9L
	 iag1hzCLMJB7iSH73SoNgbtDwtrT7zMca4uwn69G5JxxYUX77xqrkuB7REf9UWvMRtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587870;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4GYsJjeVwNvoTdnxgd8HArSGDa2MXloHlDbq3rrEYf0=;
	b=w9ysq1ThIVQvI42zyKMOe1yzGU1pGt9HVpKgXGTM/+rlfReM69Qzs4Bw0FGwIpwQapso
	 OQgA8AXBD0gJug1mikXv1HJuTArJZY7CU4rtIO9lAaxWTJJh3Va+MFN5POgaukPK41o6j
	 XltcIPCQGl3XZWxngWf98E/5NsAIj9yLLPJlIpYmKjq8NCA1TDIs7LDdq1KwmnXpME298
	 sD11peFB8dRGTx4VZS9q6M1GpRmqC5g3u6Q5Ni1zl2h7MxTCPr3LjOP3jf/38qok9JRA1
	 c98QyweAKPWw505p9xzHMkEGfYF+ntMifMb3/DLaTrNTrDG0b+iLVRW4N+wj91giXIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BsOjIGaW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DDA606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BsOjIGaW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54FD1F000C4;
	Fri, 13 Nov 2026 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587870;
	bh=4GYsJjeVwNvoTdnxgd8HArSGDa2MXloHlDbq3rrEYf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BsOjIGaWtTyEwE0lYoy5qXp8NBes/ZLNqmLtCPQ5k8mkMfEAB5tBg1RuFCNsfTcWU
	 K8fA1Ue4akPXZG4AdjTkHwqMyA60AlVWe8ZgN0lx5MT0unPnKlbAKRg5yhIW5Gewy0
	 1VjlVVUy5fwak4WJa5KnLbaOOlL1gzv31rVHqZI6JO2QOQsLrWYG1iitb/0UhqqNtk
	 R7xrYR8jP1TvB/JWz4A/zIZsui13AdMN7nSeolSnkYrieTpSiyqHdmTAb1jThf/YnS
	 URwMdEQ37lGAhsdRQAXqy7RAgQX7d/niYMHrt4vj/yiLWaiaoRRdUIzUjiZBxgwm+6
	 QWoH570cUVs/w==
Message-ID: <sashiko-outbox-213213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 05/10] media: tegra-video: vi: Use entity function to
 check subdev type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261113161819.36847-6-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
 <20261113161819.36847-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:37:49 +0000
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
- [High] media: tegra-video: ERR_PTR deref in
  tegra_channel_get_remote_source_subdev()
--

commit a0a0dd1c4d66f50cccd70079714c29c0b22431b6
Author: Svyatoslav Ryhel <clamor95@gmail.com>

media: tegra-video: vi: Use entity function to check subdev type

This commit updates tegra_channel_get_remote_source_subdev() to stop
walking upstream subdevices when it reaches an entity with function
MEDIA_ENT_F_PROC_VIDEO_ISP or MEDIA_ENT_F_CAM_SENSOR instead of checking
pad flags.

> diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/med=
ia/platform/nvidia/tegra-video/vi.c
> index a96ef26af89eb..139e3ff0faaed 100644
> --- a/drivers/media/platform/nvidia/tegra-video/vi.c
> +++ b/drivers/media/platform/nvidia/tegra-video/vi.c
> @@ -189,13 +189,12 @@ tegra_channel_get_remote_source_subdev(struct tegra=
_vi_channel *chan)
> =20
>  	entity =3D &subdev->entity;
> =20
> -	pad =3D &subdev->entity.pads[0];
> -	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
> +	while (entity->function !=3D MEDIA_ENT_F_PROC_VIDEO_ISP &&
> +	       entity->function !=3D MEDIA_ENT_F_CAM_SENSOR) {
>  		pad =3D media_entity_remote_source_pad_unique(entity);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;

[Severity: High]
Can this dereference an error pointer at pad->entity when a pipeline
ends at a non-sensor, non-ISP source?

media_entity_remote_source_pad_unique() calls
media_entity_remote_pad_unique(), which returns ERR_PTR(-ENOLINK) rather
than NULL when an entity has no enabled upstream source link.  Previously,
the loop condition !(pad->flags & MEDIA_PAD_FL_SOURCE) exited before
calling media_entity_remote_source_pad_unique() on a single-pad source
subdev.  With the new condition, a terminal source whose function is
neither MEDIA_ENT_F_PROC_VIDEO_ISP nor MEDIA_ENT_F_CAM_SENSOR (such as the
CSI subdev in TPG mode or an HDMI/TV decoder with
MEDIA_ENT_F_VID_IF_BRIDGE, MEDIA_ENT_F_DV_DECODER, or
MEDIA_ENT_F_ATV_DECODER) enters the loop, receives ERR_PTR(-ENOLINK) in
pad, passes !pad, and crashes when is_media_entity_v4l2_subdev(pad->entity)
dereferences pad.

Checking IS_ERR(pad) instead of !pad would avoid the bad dereference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113161819.3684=
7-1-clamor95@gmail.com?part=3D5
