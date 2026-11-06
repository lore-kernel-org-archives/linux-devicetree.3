Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973558;
	b=owCxLOQSBnADnlGIoxc4lZJ1rOf55LORdUInPxLUhBCxdWf0vzugkipDij+++KT5CaHa
	 QSMTuFS125E45VjV4cpZTk0IaP+FAeZMRI6MaP+F6lWfzlHuZ1ROK7Wahls576wz4pXKf
	 yZEoNYqfTsjD5iLurcEx3OJ7c+CGxpwhZx/hcc94nBwzV727I+wb36z68fDIpnh4iYGH4
	 Pzxm5V8L8KS5zawa/09RYaORNq2gy0wGqY15k+pBGTIYYA1nsdKxz3eQ92Z3N8tNbUf2h
	 px67qBZHeQE2SkJ5KCp9ripascAIbRWcggDZHTGCAYgN0/wf0LWYK5hrZ5H4+/b1iBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
	b=wcLPzpwtcJB0qupmr9Xl7C9G3O57ozXD3E0DAN7fJz1NE2/O2AUzvgf02TsIq9lmW2X5
	 vBC4aWfOLUeTO0lrs9NLVHvAsPA6TB7ctbnVpxrRRCsVM+JNhraXi3HQDHsebwwwAI4LQ
	 xDcU5c905LoIkbFkGIQd/OHeJp6fGGVKxET1+7ciNXxEapnisqi/EGfY4//BsJbI0I54o
	 O8n2OjrNcgDC7Awr9BgC7o5aj0nzZ5VAz9AA8UKnu1ynEv05YvA43wzjh9l6yLWJNW5TT
	 G/CB9K1sVMrVXBBZJ+uPqzcVDm8vW3eONTJwNO7jV5bjglCaPFlj6WkzA8FySrry4YA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+QYVG9r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD4E6082BD0
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD4E6082BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+QYVG9r
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so1239005eec.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:59:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793973557; cv=none;
        d=google.com; s=arc-20260327;
        b=GhEI+KFl65hsnOUJ6s5wKD16RLL5kYLH+0TXE3ipojsufKqtvIbRqJpp6okQOdFvLg
         XF9IHEIBPcBnCsaDIMnrioaaLRcn3sJB/GsKI5YlmVIISQQUtPHJOvwrTflwO+FKTnFl
         FehDVICb338FsuYc5pZ+XOyVj38bh3Yj1nS3V/BdyTuPY7hpwTxtlWCYCgWmmwCXu/T0
         nUqP4k1bZZ8KUY/q2NEVHbFSkD4Kir4CUdSQ5Lqveog7fvLLolZsrGJQMaLI4Yx3oI/n
         obLlXDKRZOB6U9CXDW80IdggZ2iUWm+7bAx4NvLb/rN+Io5RJO2n8fCFLddXuEyom0uM
         mHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
        fh=LC6hA8LIR+oxLVZNrVF5Qov9uvdCa0v2dS52QbzKPfA=;
        b=ov/4r1c6rmjgyqbOj/EiSHHvpYkgREgf9LecDLUd4T8gNHgZtYGR0cVk1JNYApaGGG
         SpOX4vZwKQGOtIBSIXbzALEWSTp4qEHWucW0X6VXTYSPcHYxhTl7r6B5+2kKceLJIMba
         n2G1K27gIWXn1Q49A3A3ERsHHUvhsd0heggHAZmCdh15mNhbdGWMmKhgCzGrIDerQA8P
         gAXN60MPHJ+iu8a80B+sMkdB3lcX9oK50HSATIDECYssfTpf5pY+Ef49Zc9+J/aLiISb
         EPGNbf9/8W0ZC9T3063fXKsIzlQfxptHO2PS3kQfcsyYenFVcfjCPa5gReeVn2MYWuRS
         JQKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973557; x=1794578357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
        b=j+QYVG9rxlB9SEyj9nUeuS7h5AS2Km4bZWAburYtmvGchkPIuMmdD+23vuXJ4luImZ
         xXfC0+LF7Wq6pIf9bB+0QOc1DQ9Gcg2EVnV+A0Qgl/4Ki8vu5E9MqcZ50WbZbNvWXNBc
         v6q7VIxMcVYIF6kgUmr1baCFL0fswtAF/h/3rT2OC4ZZXOaJMs4ZOmV//xpCVIvMmQew
         g9x+Wrw+zIGEhdUf1dmp2zOWA5oMbUOGRWeqyUxbmACCR7e4+O5c+lDWQptUXn5LadCj
         L/iVYW2GpUUdM5s+RLiBSQelRxB65Uf0PsBgWnmeQz8/u5d8yN5TRJunR3Ev/pTGJUDz
         /h9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973557; x=1794578357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
        b=PU5Nf4J3ITTxneJNAAGfpAfXxvrMGisAxE75e+rk4zYsUNHoNW99ONPTBJjcorFMY0
         kGHwFnmoHJuu9/ATFjgdFierbweomVDtyCH1DRNMwy0CmUQ0Y20ogRopMLXAUNZKGUjT
         GqCSQfrFu27boUemth/rUNeXr4U31MGSG02MA1LKoiYG8QyBpR7zJDhiEBTAjThblcze
         DpuIjAO5i4RKgIdBWHl4qpBGwpmzm+D3AQTZbO9KUUa1RvHy9JSlmMoYh79cTNZNL2ay
         nbfWj7DiCkZOARmV0rZEd4nfYd1GqNEwYmkkV0f2kTFS6gozKCAPVx7zCWB3rDo5DVRM
         eb4w==
X-Forwarded-Encrypted: i=1; AL+hErEj3Pu9p/PdRAFC0UDpNFaGyU2rqfNq9iw/L8kOAmzaA0ShYegQ9iALsNpiU6l3Je9hE/rebHvG57/5@vger.kernel.org
X-Gm-Message-State: APuU4Z/WrISj6uMo0/wHD0J8Bd+Irgk5iSVM/zVK1tYJg3cq/CFpX9Mj
	zErpx1rcb++xDMajaSoLWObPdEsFFueMZx81FZb+Zf0ykPYTt9um6VCzvMjCATmfigXqam2jp7F
	da8qDq181hHDtNQYTWDUZxpCDGJ8VPn4=
X-Gm-Gg: AYBFou1xXd52WsrHDlYSjPq3ABKmXe89roDk0fCeqiTphycsf7Fe+acXzUxNRR/NjGA
	wybKKo8Oq6YTOn/f8AcadTWm7ymli2uBGaUGf+q1g3EAYISRF2+rleALKh77SeEYXPqfwx2JmUT
	FAQ7J7DiaGIfo0CNTIUP8XIJ8VCcGkLEA1XgB1z09iZqqMmvDuyzXro9FnLUYoNent3ZM7Beb2S
	Jjjdebzjb/n/IjTezhY3ucXQMsuYNeZdXJ0b6bSO79vVNc874OV14rG4PvkOunCTp4xKhsl8udS
	zwQzUQS8goqK1H2CR6+4cKf3LKHwWmNC2YIFl6pD8HQIkCVD6MmHJ3Y6ooOwosWH2uSKltpEEb7
	9xUsTiQHS2Oy7FRDZOE3LidU14y23rG+jC5CWBUEjXE6OfZJuEwBBegDcKMYAJQuvE6IxU5XX3I
	dUDk3A7Pkl2wcsfa/AKsDk6UxJ1BKAbg==
X-Received: by 2002:a05:7300:8281:b0:369:f2f4:b227 with SMTP id
 5a478bee46e88-36f75b1ffd2mr2981710eec.18.1793973556636; Fri, 06 Nov 2026
 05:59:16 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-2-clamor95@gmail.com>
 <au3NWsXz-hg2LNr_@orome>
In-Reply-To: <au3NWsXz-hg2LNr_@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 15:59:05 +0200
X-Gm-Features: AclHuK-j0iaOa56-THlEL2TIjiQTJ3K-OFRxGt-N5L_ts2vcZPaUDw3mRDwDbl0
Message-ID: <CAPVz0n3_oRz8aMr1W=8K7dnHhM=vuGpHjpq6+=80oXiFj5wfSg@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] drm: Add MIPI DBI bus support for MIPI DBI Type
 A and B
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:14=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:01PM +0200, Svyatoslav Ryhel wrote:
> [...]
> > diff --git a/drivers/gpu/drm/drm_mipi_dbi_bus.c b/drivers/gpu/drm/drm_m=
ipi_dbi_bus.c
> [...]
> > +/**
> > + * devm_mipi_dbi_device_register() - create a managed MIPI DBI device
> > + * @dev: device to tie the MIPI-DBI device lifetime to
> > + * @host: DBI host to which this device is connected
> > + * @np: device tree node associated with the panel MIPI DBI device
> > + *
> > + * This function is called by DBI host driver to create panel device.
> > + * It automatically calls mipi_dbi_device_unregister() when @dev is
> > + * unbound. It does not automatically free passed device node pointer,
> > + * it must be put manually.
> > + *
> > + * Returns:
> > + * A pointer to the newly created MIPI DBI device, or, a pointer encod=
ed
> > + * with an error.
> > + */
> > +struct mipi_dbi_device *
> > +devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_host=
 *host,
> > +                           struct device_node *np)
> > +{
> > +     struct mipi_dbi_device *dbidev;
> > +     int ret;
> > +
> > +     if (!host || !host->dev || !host->dbi || !host->dbi->command ||
> > +         !host->ops || !host->ops->attach || !host->ops->detach || !np=
)
> > +             return ERR_PTR(-EINVAL);
>
> Do we want dev->of_node to serve as a fallback for !np?
>

No we don't dev->of_node is hosts node, and np is panel node.

> > +
> > +     if (!of_device_is_available(np))
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     dbidev =3D kzalloc_obj(*dbidev);
> > +     if (!dbidev)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     if (of_node_test_and_set_flag(np, OF_POPULATED)) {
> > +             kfree(dbidev);
> > +             return ERR_PTR(-EBUSY);
> > +     }
> > +
> > +     dbidev->host =3D host;
> > +     dbidev->dbi =3D host->dbi;
> > +     device_initialize(&dbidev->dev);
> > +     dbidev->dev.parent =3D host->dev;
> > +     dbidev->dev.bus =3D &mipi_dbi_bus_type;
> > +     dbidev->dev.release =3D mipi_dbi_device_release;
> > +     device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np)));
> > +
> > +     ret =3D dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->dev), =
np->full_name);
> > +     if (ret)
> > +             goto put_device;
> > +
> > +     ret =3D device_add(&dbidev->dev);
> > +     if (ret)
> > +             goto put_device;
> > +
> > +     ret =3D devm_add_action_or_reset(dev, mipi_dbi_device_unregister,
> > +                                    &dbidev->dev);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return dbidev;
> > +
> > +put_device:
> > +     of_node_clear_flag(np, OF_POPULATED);
> > +     put_device(&dbidev->dev);
> > +     return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
>
> Don't we need to of_node_put() here on failure? Otherwise we're leaking
> the reference that we obtained inside the device_set_node() argument.
>

This is fully repeats device_register logic of drm_mipi_dsi.c so
unless DSI framework has leak, this should be correct

> > +static int mipi_dbi_drv_remove(struct device *dev)
> > +{
> > +     struct mipi_dbi_driver *drv =3D to_mipi_dbi_driver(dev->driver);
> > +     struct mipi_dbi_device *dbidev =3D to_mipi_dbi_device(dev);
> > +
> > +     drv->remove(dbidev);
> > +
> > +     return 0;
> > +}
>
> Might as well make drv->remove() return an error and propagate that
> here.
>

Have you even checked the code? remove() callback is and should be void.

> Thierry
