Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794059680;
	b=Nh0h99BDinBdf67f4jV0q4kySymabCkB3sAH/wKOq2NZ5lGPY3xfIYyd+u/s6JM03md9
	 aUNKLBlG6ohkd2K922Sm335oonTlZwYGsWsLY5c/lTHHkHdgxCPk546ZGpJd5k4Ol8y/V
	 1wBi2tixCzSZH6xexk+XedU1HI24grBzvwwukZBI2u5QOJWKNyh5gVmyCLT5Q6bUTf53d
	 8mRPh1POPgb+ukdyWgNyMPvRETTo1yhEMTZpDmv7Uo3kMomDhwbLM8Jy1cr5TMep8GIpg
	 3ptiIN8LCu01Wd7uIxLFu2lrjpYlJ4njCoZ/tmD8IO4fF8UKSShzky5ZjBpv4nfobow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
	b=kyXPLJWUdExnA4NSPrr6ARXd7IjciCT0MvP7KlX0jxq4naaIqlGJH1jK628UUjFkxvZM
	 j6isg2GFeFl225hQ/sVlP2kgY4GT5eIz4UEzYosyijOPN18DWcHP3u3Q3d0wx0gssE7Xv
	 2NLBxsHffNujYDPMUrACVLjGHiufzUiv3YG1lRhCMTK2T4hMOSIsIWMmpGyebxhrf3cKN
	 t3A7bDAWnKFxDGw0BUn/CZAo7JzsRqxEmLPq4sYhJXAVHoPc7bS2svJ8eL2WvTUugYX59
	 493X/LYRsjirHLytQA1t+0/dvwww+g4tUWC9nts2kH+UZll5OpEPvIPANKOVCtrGRjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycSfE5T9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBFA606A326
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 13:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EBFA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycSfE5T9
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2554796eec.1
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 05:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794059679; cv=none;
        d=google.com; s=arc-20260327;
        b=KlbfqUn/+XLtTnOY2dGvKPFD3laW9ndAzMvz/zB6FA3XdPDIXUU5BHgsAWs0k2BtvH
         dBdyFKiosSI2ZhGYrAByoGlxj8yYKScjpHAUcRriDk76vFTQQyUGXTR2R2UBSuaYfBda
         FGXfCAQ/p/4W/G4HV3m0wcR2qpbTMZB2BiQKO6fhEBxpg42FxAL+rb/7fqj6BLMlSG5k
         MYYxyfvC/UDMHOrYmP6oUAzK0vAItNbv68FTUqCaFemXiAt7j4cGOiiCICsXFwZwJ/in
         4A7riRb/Os+Bd7I5r5vLbBiQDGbPJ7eA54oIjkzMLNHcyCCbG42xzpfY8iXWJ4tmKOc0
         bHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
        fh=JMYuUpvTY6Q8ljCDSinmQNUBa9luQjMoFSyJgp7UXrc=;
        b=FHu6RMmvDE1JbmyOHWg9F8BYa4YSgVcFZPSzTehEWmDas/Nl25js+bBa2kXvrW19hd
         cn8QO1r7cjtrlhswGiOo3YtYpaAR8j9Vul1nGK54xfUrx6ILhz/xBvm48rRSSjdzU8wV
         6jAE8uY6vcNf5m5dkbizxlyiC10TA3y+d7da8pzcb4/acbtN9DFUJSPb6B3c5z1qO1Q5
         s27cl1AWdwx7VDKsu0Vxn5nmP/Q/kj5I9m99i7bCpl4SNZ8w7UXmQaoVcxHTQtefm+iN
         mjazCpUq3YzN5XyJ0nJawUs6flUyIQs52cx8jSSLFzYxiQNGB7T5gotrVM6mEcA7SB9j
         kfrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059679; x=1794664479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
        b=ycSfE5T9N+tV8tdFDOw77jY11VyiDapgPTfbsh1Vj9BIFylqw+j3WWpeaDXIp/MKz0
         dSZL89QRvQh3oayMXqCttEIOdfeFaU4nC1pEFv9sczOxY1iYGhJdhaXNGKvufX03WVqo
         C9VU64ue/ENINEQetea26uNmPsnBde6xxxWehhkTWpYhqCCgKwEcl+f0BJoIXTyErynl
         xuwuSSYZncUPh3UUXDsebLk9cvhy90ouFYs7/uiUpM/xP8bwrb8yu7EnZhT6Jd6LmtqG
         QZMUXLuU5NIxB/Wo7P/+ZabZy0j/CZP9BQ/p8srjtGpmDyUFMetzG8bQ2fq+mZZX6w19
         2q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059679; x=1794664479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
        b=IR5emz/3yjQ+ZOMUSxm9ffVJyQQWlap6tyYDQsS7iZ/zUvU4CblB7QMReZCVIgMiqW
         oxq+xAMLqH09Wf1JyMnvr+GwIzTzXk5XGNc8+MjojJvPNbpbcm+Ra5Qqbe/McQmnOURO
         Av9AVjDk3VyYb5FzdBOYwNQ+iLI1zOHvJMLzfsKA91BoiqkamDKH07Zcz8x3qyp+kllZ
         T+hAI1qri57gYTgJz4kOabwHrAMqG6IckzT1gOwVS+VX5/dNpGfvZH/IAaq8rA1Nxddg
         AD5XyS9hfkrlECcgVoDr3HbnlECyt3dBuwcSAaH0Fu9wLQTq5XktmmPEbt1Jb1g+L3L7
         62Hg==
X-Forwarded-Encrypted: i=1; AL+hErFfeH1zJOdSSSi2e1ZJhT8knXt85CtqLnOnKxNZ48hP7i5hFzl9O9Sk26mV4hhEL/l6RVE8GfaeRGpv@vger.kernel.org
X-Gm-Message-State: APuU4Z8FGaiqfm/OQZCeKIFZHjxP2yMt2C4gbANZj8umw+38y3xiudoh
	Vq+8F1W5hGHGg3s29FVFfExtcQOFomGzmqpmXdsIGomRQ+tGNCIQMd+5HNbkDTyQqhHmowRVkB1
	wRSOjD6NXSAKCeVrBUdXnWFScWjCniSQ=
X-Gm-Gg: AYBFou1unhaI4XRYKaEJgnAFoFRk33SJTQuG+nyQzV27tEKYZDs91DrCT/od/S8VQjI
	tp9OtxyHsoss6y6koUZexPCBM1WKoqfutusGRzrnnHg09gwEYKg0G6LSvBhENnmUzakJovJy22A
	nooQq4Zjfbdn37CstXPOtoHInHouAzqsq2jfskG/xinwc9WriOo8famu4enCtz4bR+12Rf8CIhs
	jUfF6nFe8D5eUOXAG+UMHDbxjpDu1bSizvVaK9Z2eg5kNsdEY5NMCfu8ykfixxC7b7PQONxitL+
	0CVdG7yAIbbuLdmAwznMmgr1Z1X1/SNYKnTjf76lDecY4tx+ETzlpHGBTgnMtOv9QO+lZ5MtDaQ
	a5/2o1KF4CnRg9FD3UrfwLLF0rPpxMx99BBDBfGBIOtUOcE3bygWHbUhdBgn5aRJYmqOT07wTwu
	k8rlRdDjKyYMjNeiBwUQWg5/JoAbqgWA==
X-Received: by 2002:a05:7300:ed13:b0:370:121a:b2f with SMTP id
 5a478bee46e88-370121a13b0mr8606853eec.11.1794059679071; Sat, 07 Nov 2026
 05:54:39 -0800 (PST)
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
 <au3NWsXz-hg2LNr_@orome> <CAPVz0n3_oRz8aMr1W=8K7dnHhM=vuGpHjpq6+=80oXiFj5wfSg@mail.gmail.com>
 <au3telUE9A43PDWv@orome>
In-Reply-To: <au3telUE9A43PDWv@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 15:54:27 +0200
X-Gm-Features: AclHuK8lORI9v0DJ7PzJIhwANBCoAngQBMqPQ00GdlIqFV0vGLKb_MHLVYVyoL8
Message-ID: <CAPVz0n0z36TnRJ87itGALHLUvNQJ7+NoOAKdhU=PyKpJhB8WFg@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] drm: Add MIPI DBI bus support for MIPI DBI Type
 A and B
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:19=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 06, 2026 at 03:59:05PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
5:14 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Nov 05, 2026 at 04:05:01PM +0200, Svyatoslav Ryhel wrote:
> > > [...]
> > > > diff --git a/drivers/gpu/drm/drm_mipi_dbi_bus.c b/drivers/gpu/drm/d=
rm_mipi_dbi_bus.c
> > > [...]
> > > > +/**
> > > > + * devm_mipi_dbi_device_register() - create a managed MIPI DBI dev=
ice
> > > > + * @dev: device to tie the MIPI-DBI device lifetime to
> > > > + * @host: DBI host to which this device is connected
> > > > + * @np: device tree node associated with the panel MIPI DBI device
> > > > + *
> > > > + * This function is called by DBI host driver to create panel devi=
ce.
> > > > + * It automatically calls mipi_dbi_device_unregister() when @dev i=
s
> > > > + * unbound. It does not automatically free passed device node poin=
ter,
> > > > + * it must be put manually.
> > > > + *
> > > > + * Returns:
> > > > + * A pointer to the newly created MIPI DBI device, or, a pointer e=
ncoded
> > > > + * with an error.
> > > > + */
> > > > +struct mipi_dbi_device *
> > > > +devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_=
host *host,
> > > > +                           struct device_node *np)
> > > > +{
> > > > +     struct mipi_dbi_device *dbidev;
> > > > +     int ret;
> > > > +
> > > > +     if (!host || !host->dev || !host->dbi || !host->dbi->command =
||
> > > > +         !host->ops || !host->ops->attach || !host->ops->detach ||=
 !np)
> > > > +             return ERR_PTR(-EINVAL);
> > >
> > > Do we want dev->of_node to serve as a fallback for !np?
> > >
> >
> > No we don't dev->of_node is hosts node, and np is panel node.
>
> Fair enough. The parameter name is a bit generic, but I guess if you
> read the documentation it becomes clearer what it means.
>
> > > > +
> > > > +     if (!of_device_is_available(np))
> > > > +             return ERR_PTR(-ENODEV);
> > > > +
> > > > +     dbidev =3D kzalloc_obj(*dbidev);
> > > > +     if (!dbidev)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     if (of_node_test_and_set_flag(np, OF_POPULATED)) {
> > > > +             kfree(dbidev);
> > > > +             return ERR_PTR(-EBUSY);
> > > > +     }
> > > > +
> > > > +     dbidev->host =3D host;
> > > > +     dbidev->dbi =3D host->dbi;
> > > > +     device_initialize(&dbidev->dev);
> > > > +     dbidev->dev.parent =3D host->dev;
> > > > +     dbidev->dev.bus =3D &mipi_dbi_bus_type;
> > > > +     dbidev->dev.release =3D mipi_dbi_device_release;
> > > > +     device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np=
)));
> > > > +
> > > > +     ret =3D dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->de=
v), np->full_name);
> > > > +     if (ret)
> > > > +             goto put_device;
> > > > +
> > > > +     ret =3D device_add(&dbidev->dev);
> > > > +     if (ret)
> > > > +             goto put_device;
> > > > +
> > > > +     ret =3D devm_add_action_or_reset(dev, mipi_dbi_device_unregis=
ter,
> > > > +                                    &dbidev->dev);
> > > > +     if (ret)
> > > > +             return ERR_PTR(ret);
> > > > +
> > > > +     return dbidev;
> > > > +
> > > > +put_device:
> > > > +     of_node_clear_flag(np, OF_POPULATED);
> > > > +     put_device(&dbidev->dev);
> > > > +     return ERR_PTR(ret);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
> > >
> > > Don't we need to of_node_put() here on failure? Otherwise we're leaki=
ng
> > > the reference that we obtained inside the device_set_node() argument.
> > >
> >
> > This is fully repeats device_register logic of drm_mipi_dsi.c so
> > unless DSI framework has leak, this should be correct
>
> Nobody said that drm_mipi_dsi.c is correct. I'm reviewing this patch and
> it seems like it's wrong. If drm_mipi_dsi.c does the same thing it
> probably is wrong, too.
>

May anyone from DRM maintainers clarify this please. I would like to
know if I need to change here anything. Thank you.

> > > > +static int mipi_dbi_drv_remove(struct device *dev)
> > > > +{
> > > > +     struct mipi_dbi_driver *drv =3D to_mipi_dbi_driver(dev->drive=
r);
> > > > +     struct mipi_dbi_device *dbidev =3D to_mipi_dbi_device(dev);
> > > > +
> > > > +     drv->remove(dbidev);
> > > > +
> > > > +     return 0;
> > > > +}
> > >
> > > Might as well make drv->remove() return an error and propagate that
> > > here.
> > >
> >
> > Have you even checked the code? remove() callback is and should be void=
.
>
> I don't know what you're trying to say here. Yes I can see that the
> remove callback returns void. My point is that device_driver.remove does
> *not* return void and since this is merely a wrapper around it for DBI
> it could also just return int for symmetry.
>
> But there's also continuous work trying to convert all driver remove
> callbacks to return void, so that's eventually going to get "fixed" here
> anyway, so might as well leave it like this.
>
> Thierry
