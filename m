Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F54BAA1A
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642231; cv=pass; b=rfitVHLGitw7ScZDQU0zTzDc2WHr6RLxFa9lLZu6vDl+ZhhrspN0/8HPqcSH85u1BEUqgW2583/CIDHMzQSDE3C4ziJi8KWkVKCiIjrKOux1p10pFXb2S9Ql7ee33vwFlErsj3etNsInijnoWaajMqG/kbqNnl+YvvKht6DlRRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642231; c=relaxed/simple;
	bh=lSkvGaijP0/9iVUmeNOEu48KokHNhG2VqwkL4j70uUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YU/pW4AbCtMz+3lnvkpvHgBp/Kv/FWOS6rHFWzKHL5oaN/avFHAqE6BbXDqByBndxiSu0Dwngr+u/dI1o+0IiqfhK057O5aKoDzzruuvYMW7acxI1xQAOme1EVcjMbEoaWbrqslZPpapp4bW1LOJJrZQ6tycmaqgGSgrcJrSF+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cnVWuFar; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=E9/TnkuM; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnVWuFar";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="E9/TnkuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789642207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u6ihbO4Iqd9EoQ+wSGF6cP/+ZqsoR5JgyUGsjJYPabY=;
	b=cnVWuFarWugzlHumUJ5HJfYhDUYhhzYAijMN9doVb2whYkxntCNPswokNufR/9Jv1tZeml
	M6NiP7TVDshHFtoiKyUaMkeBwoMkfwM1iJjicgds+R0IltXENZ83b9sTjP5IPNkvCQPCuH
	XRuXVpZqfKi8TfZXEhASCEyjNo5CvJA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-ykZU85VzPXKKVx-G3h_UIA-1; Thu, 17 Sep 2026 06:50:03 -0400
X-MC-Unique: ykZU85VzPXKKVx-G3h_UIA-1
X-Mimecast-MFC-AGG-ID: ykZU85VzPXKKVx-G3h_UIA_1789642203
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso660488a12.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789642203; cv=none;
        d=google.com; s=arc-20260327;
        b=DSd4zJCbdfSU16j3WdnA073UvH7cpJZswUKTj/BvO+kSHrjyUqk99AKa/YElTjzDoe
         7bMefw25Qldrvy2YxsBkVu7tIHSpQjjNXVwj7KLKzGvAiLSWoP8ttwtifxa1fSzXyk7U
         8W0CLAUanknRSs8H5C77V4EehGtaVSVDFE9rPLbvTseCIP+3OD6sW2QUGqtM4MvTdf2V
         RtsLUw66Xx6AZNpyng2afwiD2BmZaEA57iVpPsFdWTaEzknmPtBoSFZFITq/P1C/5axD
         9xfoN5h2l3vPGSdbkuxLjHBnZQiBXzR7Dlowu3EjZCeHcvdLac6QH/6mSYLWIMSca/5V
         4fMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6ihbO4Iqd9EoQ+wSGF6cP/+ZqsoR5JgyUGsjJYPabY=;
        fh=N8vY0a3CCjfrB8UFyDkSHU838NPz+BBYiIGwVE79DYA=;
        b=WqQkJIylzmRNoJFqjuWOXfS3upLCX5b+eZ8B0jCAbXya1scRBpkZceXixjp5ESR/Wb
         D6Zp/4bUQfQx4lMgWnopBUJX2nrbYRNqWx/guD+C7TkOBNk6Usa0EAphfnmqh8HiOaxy
         IJrvy4J3OLAVEPpmI6drbQAxIdmzXXWcK/Lh4AHs160LFNZaEM4SeJXqiW1JLnLiVWhe
         2fjsrRaUbz5/S8Dhk2NC1yJkd/peTQhM6ag3wBZzqtPQ7dIViSUPnJIzhSB36LBN12e6
         Og0n3j/On5Cwj01Z7wAGa23jMGv/7x0rnGCSGo1e8Yi/icpPK3hjajf8yS1ZbyCvmTFT
         rzqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789642203; x=1790247003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6ihbO4Iqd9EoQ+wSGF6cP/+ZqsoR5JgyUGsjJYPabY=;
        b=E9/TnkuMXlBPwUMw61Or8JTE3omfkCGb8FcyMuee/VSm+4jl0y0gjlkgmhfL+FkcFh
         wA218V9QZrz8B+ga3OAduarWV0z1lJldrPdiuT11tOoOUiTYaYXQrTyAsG0y89ZYK9H3
         CqswxAGhrOnPm2uaK2neWEZV+juSYuQLnxhNe5bhhPWwzZ/wNz4lnM4yAheHEmpNwAVy
         6Fi1I4wVJf1QmoJdeeYllRq8vMUPxMzBE7ACAa6k9sx3RmAtc7SScdIZhMOigKDLWy6P
         Q+ffFH3CeRrqCQlGoCqe4Nj+S34zTFI8dsKnsTj+94+bXKcBvkWA0pjUvNBEzRAYdRSg
         sBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642203; x=1790247003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6ihbO4Iqd9EoQ+wSGF6cP/+ZqsoR5JgyUGsjJYPabY=;
        b=RA9OkzTW90vv3/9+Q0zSst+APyciepgvkyZhnqcqlBMouUNbhKvCA7vgz3mdDvlhHS
         UXK8LKLfXlVJPlq4NkNpMqdO79xxqlCKNPkHv0tFrFMk7HhGF73m/t2eWUoYcxDN86sN
         9Jcb1KH7RSojg+FEYPmgxSdvpZpImEVc8zEBoftIVP2CIV7kdjkDHukepQBTPkjuX3KQ
         xvebPIpfVrynk7SgMfVpavOgg/fTlLdobrJjJ3wYlzMmFVKRKqrc0TkwKPvXV1hG6BNu
         Gj98QsBaoPxV9GkprGmkaAqcgOn8TYKWwuFxgEatF16qUKK+6VZviz4/ITMiRzXFsbxw
         pVkg==
X-Forwarded-Encrypted: i=1; AKwUvBxZgk33zxuVI87WHV7itur1JyCgoeviFANkhotB/dbKu4PYV497lPNfTZ/zamsl34DTVtoE9JkI5zrR@vger.kernel.org
X-Gm-Message-State: AFuF++kVOVL1DYaiXnSo3R5IzMj70QdvApP5j8JPBBqcqh3QrilAoeY9
	RN3wRMIGDbdy3q9yzmqmvfPec/dfnO0YvcSzwygcN+5fYVc+raXhBAdRpaV9er5yEVuIyFvlWI5
	VvUz3CZGzqBqQl0gJuQhvmRtzqIzpHFT4U6xTxSbIauBrJLqytvqz6DnOOF9IT4Bqo0hh5mmBXO
	haVCqdheBpK9rRGlgdBDsm8N43NJ+mqzcml7i5vw==
X-Gm-Gg: AYBFou1wulT0lduFaCir0U8gy8tdMeQCg/X9RrGk3fzJ1CioOZ9SVt8RaszoD+XnStL
	19LsZM43b9+NXfa3ogya+7oNY+9YEgy5NTgOGcyPpLAoIbUOYOQPM5sqpzUBxd+EDdp1P9XRZX4
	JkU8BPCp+gJbhfzqCBDj5pSETIHMeOO5KWUsuZ0N2zcTDvK55me7dNLdHK
X-Received: by 2002:a05:6a20:d70f:b0:3db:2c66:6638 with SMTP id adf61e73a8af0-3dd5f471e3emr17197366637.10.1789642202648;
        Thu, 17 Sep 2026 03:50:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:d70f:b0:3db:2c66:6638 with SMTP id
 adf61e73a8af0-3dd5f471e3emr17197287637.10.1789642202196; Thu, 17 Sep 2026
 03:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com>
 <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com> <20260616083921.4066690-1-zaq14760@gmail.com>
 <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com> <20260617020926.114947-1-zaq14760@gmail.com>
 <8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com> <20260731035705.3198816-1-zaq14760@gmail.com>
 <20260916082924.956116-1-zaq14760@gmail.com> <0a13ccb8-8817-4223-a4a2-0de594ac8c71@suse.de>
 <20260916094453.1062125-1-zaq14760@gmail.com> <f4c6feab-b1ec-48df-81a5-888444b243a3@suse.de>
 <20260917025644.1262504-1-zaq14760@gmail.com>
In-Reply-To: <20260917025644.1262504-1-zaq14760@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 17 Sep 2026 12:49:50 +0200
X-Gm-Features: AcwNN1UM1luWQq9ihk-KOU9oijNFKfCQk8IyuxX6LfLxCouMc1ifgDhN-sy05j4
Message-ID: <CAFOAJEfnDrGTg40h=R0mfZasroPkrSsmbVmmMA91O9uOzu_gYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome
 e-ink panel
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Devarsh Thakkar <devarsht@ti.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello LiangCheng,

Thanks Thomas for CC'ing me since I missed this patch series.

On Thu, Sep 17, 2026 at 4:57=E2=80=AFAM LiangCheng Wang <zaq14760@gmail.com=
> wrote:
>
> Hi Thomas,
>
> > There's also the ssd130x driver under solomon/ how does it related to
> > the ssd16xx? Is that similar as well?
>
> They share the vendor, but not much else as far as I can tell - Javier
> will know ssd130x far better than I do.
>
> It is an OLED driver over regmap, while ssd16xx is e-paper over raw SPI
> with a BUSY handshake, RAM address windows and waveform LUTs.  The
> register maps do not overlap, so I doubt there is much the two could
> share.
>

Correct, I don't think there is much overlap between the ssd13xx and
ssd16xx families.

There are a few bits that I think are similar though and could be
reused, for example the pixpaper_spi_write() helper logic is basically
the same than ssd130x_spi_write() AFAICT.

Same for pixpaper_send_cmd() and pixpaper_send_data(), I believe that
is the same logic that we now have in ssd130x_write_cmds(). Specially
after the recent commit 3e391b0b516b ("drm/ssd130x: Add SSD135X_FAMILY
and SSD1351 support") that introduced a cmd_params_are_data flag that
allows to send the operation as command and the parameters as data.

So the MCU interface seems to be the same, in particular for the
4-wire SPI interface which AFAIU is what this new SSD1677 driver
supports.

> Its shape does look like a good model though - one driver covering three
> sub-families through a variant table.  And if you would prefer ssd16xx to
> sit in drivers/gpu/drm/solomon/ next to it, that is fine by me.
>

I think that's a good idea, as I mentioned above some of the helpers
used by ssd130x could be factored out in a solomon-common.{h,c} or
something and be shared by both driver ssd130x and ssd16xx drivers (in
insight I should had called ssd13xx to the driver since now it
supports SSD130X, SSD132X, SSD133X and SSD135X families...).

> > If the ssd16xx does not make progress, we could also try to merge your
> > code as ssd16xx and Devarsh would then add support for additional ICs o=
n
> > top.
>
> Thank you - I would be glad to help that way if it comes to it.
>

Agreed. The ssd16xx driver could do the same than ssd130x and support
both SSD1677 and SSD1683. They seem to be quite similar by looking at
the datasheets publicly available.

> Devarsh, it is your series though, so please say if you would rather carr=
y
> it yourself; I would only pick it up with your agreement.
>
> I should also be honest about what I could offer: only what the SSD1677
> and the PIXPAPER 4.26m need, arranged so that further controllers can be
> added on top.  This panel is the only SSD16xx hardware I have, so I could
> not implement or test the others.  If that is too small a starting point,
> I quite understand.
>

That's OK. When I introduced the ssd130x driver, it only supported the
SSD1306 controller and over time we added suppport for more ICs and
13xx families.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

