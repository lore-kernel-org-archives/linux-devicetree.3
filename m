Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587953;
	b=m65IZBb4Wv9JC6KdGKlUpXg4S8BVis3+UCFuuDuYj5W6TPC71r/vivNL99eaiZG9nI8r
	 KpLVPMhIdBtgdnU9fbmc6JRAwwxjTZI/V/D94LpggGVCUgs0dPGfMJABnJ9PYPP3+kUvt
	 2w1qS8JJYOevTBucx4gRjASRCCB2AO7AefyPM+3wmHGhBHEJj4iDT9tpnKdjnMHF8/OGW
	 1jeAv5fVxIjKKiQDu/12S+0uBaKIk6le+MbFtPoU55nruiRB5T3OeH6Ogabl0d4TFIfzN
	 zfNZH1ZwNu1dAJor1KJiyqkWleZgqM1NlKAHXob9NloWcjXnB5IMaQpAuLXFei82iDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587953;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jrEE3irQnpf1CHKBngSKK8l4q118MI1MJ+JFAJTGwgg=;
	b=g62gLA+8ZhMKolnTdO6sb4kp4DROBPxHv9YSlQ//s43WRQ6SbcjTKVySiYuUJFIuRvyO
	 tlVgeml5WyQJAP53lyMM5W0pGxI8k+G/K/8Y1N2nK2Yn03mV6PGd55A2JiH1ETJi0L1Hd
	 Yg4xi7+Opr/F2J8+iqHif14Rqe1O53cK/FU+87N9G4LoBVVyN4jwYqX/HH7/isjozXStj
	 3AX1brOmScTzZDuA49RI2NQ8IfTcllHXFkCj2ZC9W2ojnDvtFKTClfoTB5iATuAeWwLxM
	 j4uyRXWSPqZhvVjSfALbeQ+ShJmMOCy3joEHE4BCt7mOh8exIG+Vkd5ZJYAZP6/NGoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nw9Gr7iH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C69606A8AD
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nw9Gr7iH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AA61F000C4;
	Fri, 13 Nov 2026 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587952;
	bh=jrEE3irQnpf1CHKBngSKK8l4q118MI1MJ+JFAJTGwgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nw9Gr7iHgY5awVYoQTH+LrervxJQB6O/bbroPakdFhanHGC5psanRV59pNNc0WHPr
	 +h7Dphi2uvVIu0V0Zs3D/zUwfrynxrHRukfxnyJZDvk2MwvKqbIoGzgAh+JC+XLQva
	 soQYYJCgmCqDCv+5RgOHlOCmZ1f2HFdlzdy27f5bxP0vV1s1GzksQ5qoP9B1rJ3MHD
	 Zg0rOjvIheacxHlE5C8jznQixhDxLPlQO+k1nG2oMeB7xBZznYLx/wxRSB7HDnM/rx
	 7deAlbliY8sXB0rPy4XqYlkktj2aTGdIUOoBtjg3IdPJTgEMeVoDMg4C01441Sop/Z
	 UgWTWyGTu+Q6w==
Message-ID: <sashiko-outbox-213214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 04/10] media: tegra-video: vi: Switch to
 media_entity_remote_source_pad_unique() helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261113161819.36847-5-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
 <20261113161819.36847-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:39:11 +0000
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

commit e0cde12330277b56d30a1de11e5da15a2551007a
Author: Svyatoslav Ryhel <clamor95@gmail.com>

media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() h=
elper

This commit replaces media_pad_remote_pad_first() with
media_entity_remote_source_pad_unique() in
tegra_channel_get_remote_source_subdev() so multi-pad entities do not assume
pad 0 is the remote source pad.

> diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/med=
ia/platform/nvidia/tegra-video/vi.c
> index 12eaa89304e84..a96ef26af89eb 100644
> --- a/drivers/media/platform/nvidia/tegra-video/vi.c
> +++ b/drivers/media/platform/nvidia/tegra-video/vi.c
> @@ -187,9 +187,11 @@ tegra_channel_get_remote_source_subdev(struct tegra_=
vi_channel *chan)
>  	if (!subdev)
>  		return NULL;
> =20
> +	entity =3D &subdev->entity;
> +
>  	pad =3D &subdev->entity.pads[0];
>  	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
> -		pad =3D media_pad_remote_pad_first(pad);
> +		pad =3D media_entity_remote_source_pad_unique(entity);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  		entity =3D pad->entity;

[Severity: High]
Can this dereference an error pointer at pad->entity?

Unlike media_pad_remote_pad_first(), which returns NULL when no enabled
link is found, media_entity_remote_source_pad_unique() wraps
media_entity_remote_pad_unique() and returns ERR_PTR(-ENOLINK) or
ERR_PTR(-ENOTUNIQ) on failure.  If the upstream link is disabled or
missing, !pad is false and pad->entity faults.  Should the check use
IS_ERR(pad) instead of !pad?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113161819.3684=
7-1-clamor95@gmail.com?part=3D4
