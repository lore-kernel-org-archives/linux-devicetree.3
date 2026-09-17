Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C3C4DD3A8
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647346; cv=pass; b=YM5BcDHXexi465wZDRhNqKh0WfaTltEEy9yRHObyoAXHZ2GLLPfciKfWZrsVMgmWc1rc/yJ+eEaTNAJMEdFNRRQehjTqS8iCjiI/LWvvSucP7bGvzf6LSVjNHjIuvvaZWx3eqqceapHLklXer8rWNh97KTX7oW8eHPsAfjq0g8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647346; c=relaxed/simple;
	bh=LZFYhEhHWIHNXKUGiHbv+ydyuO6lOjysOTH2X16TZjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYC9Il3fgOlDVb3r5VOKUjJ0U+ORaaTP6a7FrJOf3AUrHYJ9pVmRbDEupt3echlCvm8xC64wvPREJz3rj1Y0bvo2P8VeeCMyRLjHBFtPyjp5HciVLcqCrInIN4bPXV8h4S7f+5SMWtVRizDJUgkQowpZrsYCwnubhXQylIavUCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VpXOrcp9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Egr6ewo2; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VpXOrcp9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Egr6ewo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789647331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZFYhEhHWIHNXKUGiHbv+ydyuO6lOjysOTH2X16TZjw=;
	b=VpXOrcp9SbJnle0PB+7ggCErSJXVC9d9MGkyjWHxtBkzviFC1GLA9FBIu8lZGVsYGRRFWX
	J1JsuM0YiacjVQYzjCmN7KNAqwB16BRg3dO36+VxP6KyKJ1KpxETw4etQRin1QDVP33Tu2
	nJ6KepJyehTzGaVGPBMm3piw1L0+Dmk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-tONJLMk5N42b85AUTnMLpg-1; Thu, 17 Sep 2026 08:15:28 -0400
X-MC-Unique: tONJLMk5N42b85AUTnMLpg-1
X-Mimecast-MFC-AGG-ID: tONJLMk5N42b85AUTnMLpg_1789647327
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc2229450b4so716890a12.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789647327; cv=none;
        d=google.com; s=arc-20260327;
        b=pi3KArY+nE1MB76oYQskWxd1Qf4AHptANs8J39hXgfralqfrrnludIPhHqHAYqeYds
         qL8AMnWHh4JpJ3xyj4Xd3f76XNZnYoLUrslwaBXZF6oTI8QsE5rCb5lYdYG/PVLqc6oM
         yMNM/1wtNgkB8oJYBNOooxcvzE3KehMrbkTGD7KFGcbv3OMQjJ/uydZIblEiRW3lf0/T
         bBtIF08Ktupe2WDFqk+VFP71272iU04Dsl0/6lClHB8sOG3ZDSeuh10V4cDgYfW6FPVj
         pRssAksqHmTM4uMrLWvs3rG+LJ9v8qUTu8DTOlujCQuvo3ggamX1tSbD78Zk/HHDNhWa
         HeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZFYhEhHWIHNXKUGiHbv+ydyuO6lOjysOTH2X16TZjw=;
        fh=DZavaZ52h/MsZyWgoa3XEpf7zgg8c6KU2782nr0SCF8=;
        b=VKxpyQAojtzYDmQqahOM6cgvQ0TSwM5EY6H0Xxg4BeiJVs/wFFkVD1DLWnbkdevsV/
         wW/pHR7T3fIerGlQ0Ti3YPl6C8XjnJWmfpnav+3pI5evGCvjM+xKNBooL4eEq6iFkCHX
         26YNMVJBhnNhGCTVOfGu3gptDA+IM8ubjvg4LF+EGDalKgQu9PjbKM69CL9pzFM7x1mB
         UHa1hnR0O5VaFINrF/bC+7KSFEDmxSWrH8R2sXhKl9jHIacOa3/xBGOTIxXndr/xi+ck
         5BIYUq4Tl0oHM9HumKC8BxwIh1uCV/Rh7gLdGJexubsZSs9dIh0O76rCRYwfcTbVdKRN
         NfOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789647327; x=1790252127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZFYhEhHWIHNXKUGiHbv+ydyuO6lOjysOTH2X16TZjw=;
        b=Egr6ewo2RvzGR9gRf4KogPWedBgMxAJvmGvToLCzD6Zvwj6yjnr+wgVMrv+zI0pRyd
         s5bNzEv6rb9GtRN8VoFri/bLYD2rjniWIVpvVi35Wr0nu+MtpiD13CAXbu8WThGPXQIZ
         7VMkJ/LmeBA+681jP7yw/DpuqKoC1riqRF/oARzdo9P7X3sonAHoJz9TSItiSX73SJcB
         8ZPF5xhlEdzhwPZXvyDthLdOiO7m0+LQ+S59TIbMawbF9JhBXLUuGZHdbyuVa72/zPC8
         V3IqHgGSepgs0mJW301rN+gTyWtqIv3+nYn8Rh/Eofmyh+X7w8UTRRzW92v7Ila/O0Fi
         Tjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647327; x=1790252127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZFYhEhHWIHNXKUGiHbv+ydyuO6lOjysOTH2X16TZjw=;
        b=ZVgwKEgYsByVYN7/MjXoRm74dpE5ZifUj4l1+Q5BBBM1JAW7/wmGhkuiNYggAffjO/
         /C3KZqL9B4J8/+oDuicPyfMptTukDSg3JhUb9EHCUMy260P2SnfickIW0rkLM41NACCt
         oVltVtef+YR0I22Cipx74Q2Q8Fga07TL/EJ+cj8ivKPRq2A6IqsrV6Exl6jb5XNIMsAU
         6QywfDLkgGqpUUKpHzHKJewSo/FlhGm1JECdMmuyYCvNzoHZJlKOtCOr7su0Z/YHM+II
         i0oAsSoGyBsNXWOfL+A5aRzgxz/bL9Whk8OAZJukiCtkc0VGpMnCgKhUMAqLCpB/rNkW
         QD9g==
X-Forwarded-Encrypted: i=1; AKwUvBwqSfjHoZ31JFYcgRnzSn3nkNApjOE5Evo6NlVB18M8alQr5VQG7larUzGNh1tYnBYNR/0vnTEtD33/@vger.kernel.org
X-Gm-Message-State: AFuF++nBTdNU6vbfcuwPwMMHhcSMgahARvaNfmpeX4itwr3I5gun3CGK
	xa/1Gp3ta/o0oH3VXvwB3/mDDJgjPjTZ15I0lKpsqncdX/gRfaMhGnEMwMhjCHi300IWJymqRjl
	2eO76YqxlnnR0pAPqCvNMXl3/PsDyFWm6S3mwto5UCavqVr9WRh86HrxQwQmoajWZewlwxZCKuU
	KJNpv7JlnuMr1A3FY04yQfJG1NDvpOYLZfjMtwoA==
X-Gm-Gg: AYBFou3GDSgbHXp3J1l38v38QFoImbtt1BkXC1UYqz2iCUHrApfpcFUYgmFSuYJIoyt
	FdBZYCLs5LLYyK8NlGEbM13j0KFiFru/KcRxpvKNpKgsUMgi3JB8vp92nR8s48BHe/eNI2J8PFj
	nwzKxxxsr1eQ1RErjGUURW6PmPsDjvw85Mo3rhCaR4PIpe23auy4QVrvMB
X-Received: by 2002:a05:6a20:7faa:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd5f5b29c1mr15338799637.15.1789647326748;
        Thu, 17 Sep 2026 05:15:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:7faa:b0:3da:7140:da35 with SMTP id
 adf61e73a8af0-3dd5f5b29c1mr15338675637.15.1789647325964; Thu, 17 Sep 2026
 05:15:25 -0700 (PDT)
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
 <20260917025644.1262504-1-zaq14760@gmail.com> <CAFOAJEfnDrGTg40h=R0mfZasroPkrSsmbVmmMA91O9uOzu_gYQ@mail.gmail.com>
 <0259fb51-acb8-4b07-a6d5-2fe25fb0de9c@suse.de>
In-Reply-To: <0259fb51-acb8-4b07-a6d5-2fe25fb0de9c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 17 Sep 2026 14:15:14 +0200
X-Gm-Features: AcwNN1UH5rUGs68RRraAabQu2d2krHmsXTgl_y76k48XKzO4lUNKUp0VaqGzlHk
Message-ID: <CAFOAJEe_7Cqo_=NWPGyYBTu3mD3CjPMC92ZZR6qHPjAhQws7pw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome
 e-ink panel
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: LiangCheng Wang <zaq14760@gmail.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Thu, Sep 17, 2026 at 1:34=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 17.09.26 um 12:49 schrieb Javier Martinez Canillas:

[...]

> > There are a few bits that I think are similar though and could be
> > reused, for example the pixpaper_spi_write() helper logic is basically
> > the same than ssd130x_spi_write() AFAICT.
> >
> > Same for pixpaper_send_cmd() and pixpaper_send_data(), I believe that
> > is the same logic that we now have in ssd130x_write_cmds(). Specially
> > after the recent commit 3e391b0b516b ("drm/ssd130x: Add SSD135X_FAMILY
> > and SSD1351 support") that introduced a cmd_params_are_data flag that
> > allows to send the operation as command and the parameters as data.
> >
> > So the MCU interface seems to be the same, in particular for the
> > 4-wire SPI interface which AFAIU is what this new SSD1677 driver
> > supports.
>
> I cannot advice anything here, but at least I'd like to get ssd16xx out
> of tiny/. It would be great to have it all under solomon/. It looks like
> sitronix/ does a similar thing.
>

Yes, I agree. Especially since there is even some (albeit small) code
that could be reused.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

