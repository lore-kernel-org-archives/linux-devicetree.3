Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBB346D2CE
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787057020; cv=pass; b=kuqpI+9S6AigrPwcy6gmMmeuGcR7uTEU1j/nCRW9x4/Y0R9ZGpY932BrViAEVnHqvXqOOIK7qW4kLmw+qSV10cRnvaKZsMTAMYVh2awudj06GQkc8l25/KBy/DvlZGMfCQcpH+VUlxvE7/Xmm9Yi6VDVQI6LJW+fhQTpUoL2YW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787057020; c=relaxed/simple;
	bh=KvVSYGZR4H/ph+5AJPdcVXh8oAtFOdEboWyWMQxt8io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+bczFt3nzVj3rR7FLIjK3rdHHr7Lr6Cjlp1asZMRXoXvD2w1Bxy8bhQiVNjgWHgJRMnsA4q2o/qMi0h9eE6bWlwqRov8mUusYVqQHlQmrZtYilBdknns+f45D4Ujx3iLSwQOF0hwmCdlHSNcnYmxl0BIoozGgC/p3uZBJzOpyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M2RqQeKv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fNYfFpBZ; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M2RqQeKv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fNYfFpBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787057018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9G3iSxs63cmwbUmYiEX69zc+tabrPwShtlbbS8QAMw=;
	b=M2RqQeKvA6wPOmv6JTiZRZpVpuHMfdnBskO2iqrlGVvHmy9xjOEWGZn7c2kX6BzEDL7CDs
	U7TgNUTg5qC+pWDXE+Achb/YYWVClXoN7Dum5VM7bcxfSN79h3RHuTs4T7Wj3Lv+qXbjTH
	Nb1QJE2vB1hmPqD0yBmSDuW+9leMXB4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-7wqAQbDsOsCfwKag9RkW8g-1; Tue, 18 Aug 2026 08:43:36 -0400
X-MC-Unique: 7wqAQbDsOsCfwKag9RkW8g-1
X-Mimecast-MFC-AGG-ID: 7wqAQbDsOsCfwKag9RkW8g_1787057016
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836c89e6ab0so65428057b3.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787057016; cv=none;
        d=google.com; s=arc-20260327;
        b=QgPRwN2mCi+L6O2sY9QU0vO3OzhszuIcLUM2HISbwsiGrfHIE611G006IXpB5Kdnby
         0TmAt+DDV0rph/gVEXsV4Be+7B9X6gBQogZP1IjopsG4PljjoMCSB0h3ukGl22XlJ7vl
         /WBKT1T1X2wu3ToTaE2lbY/v9ls9OhGc1Al5fiKUZ1iBWcCVZRlWiP5dEFbLkBOBV3xh
         +gWdUF5d7zwwI0sCD08LKAQSiSonAQOBhanzaFcAspK1NX0nuCPocr5xEMNauI3PfV8Z
         /HurIdaY+3Sc3e0kS6HhRDpIH+Jq7NHdJep20/ehAffYIMI3oykfhLBGiY5HBgx+Ialu
         IA4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J9G3iSxs63cmwbUmYiEX69zc+tabrPwShtlbbS8QAMw=;
        fh=Fm/NSmk8Hxu9crfM8TuHOmIYLlNaOrYwmTQU0XbvI+4=;
        b=WMoQ18h+JgDKnlO3sxGe/BZH0y9CVpZr/Px0Tb4IfpSuGjhyEiZbkT64MFTjJuQU1G
         PAkvgASFR46v4dxL0inVwGkc878P2mfAdWs6hISWx2/wleDLISHRySO18EVbxcDOfQG/
         lp3s82zoFxBIQ7lDS6S+DX+lEuCpXq5yxc6Pl7LynY6MUhc/t8mw2GkKzZC/HqXUdlPJ
         SkjL0r7II2MxlIDvowamg7EIrv4l+WEyzvaDdjfYLeD8D8WP/kx3jJ9WjBzWYeOInkFh
         vKxIME6enqMT0p/xXKQpbxmwgiTxSEuAhmIhZg0i4GfINfzwQYOJUcpadNc+OoRymkO1
         7ceA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787057016; x=1787661816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9G3iSxs63cmwbUmYiEX69zc+tabrPwShtlbbS8QAMw=;
        b=fNYfFpBZYu8H5ftkMZ/AC+xb2CJgyYksfh7Hb/UINmRk3U4IKUEVBrrVVngiOHroBs
         aHKr7afrQHC8wPUg42lTgaGZfyTVwVTx/ssE8fPpmk7cv9bb5hQpe0XPXh9vbpE11IL5
         o2gJWyINAWygpqWWKR1SeOR+X3YEtg3H0FoaPQQ42lfPKHJSthDqSuCaEJSD87ftMLii
         HpO+TtQY0TeiswExh2QLgw9Tk12u2ZLVu0N+1k6jkZoajS74/icWgp7HCCWKQbCYyw+J
         TLk70tKb71Ufowbm5BDMSRkF7hceHU/jd07k8gGGdj984fvy38L7BlokiDvMDclHUjPc
         Zr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787057016; x=1787661816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9G3iSxs63cmwbUmYiEX69zc+tabrPwShtlbbS8QAMw=;
        b=F564O2QSqurqrdzFV4svbWnZ6Zuw6rkW8r/gq4t1KRndfDkhFng9NS+jZyKTjPK1z9
         oFpLxlqVhMBlRjeQqllGziBSHZqcdm+CwrBtilVDNtEVb++6o5o+yJP9HPXTjBv0B4AZ
         /4CtNuMzFR9lzf6Ixcuz+Q26r3EjoP0MfS7Sg2AIis2x4jzuup/QpkMUi+3gpwc9w7JW
         ttso8GXKzMzlatTaVGWVcEpu74OGX9LQaYpBKKqUIA3uA9yMz8Vx8uCMUapV9cQBmUhx
         VBo4s2j+Tlo4CLUHr5us1j9aErTqm5QIBXHVwQbIsA13818RCj239ttiSVeGzLp71E3R
         QrwA==
X-Forwarded-Encrypted: i=1; AHgh+RoaQrvXRF++AaV60Ekdmo8CMj6xZnQ9cIS/BsWOZlxmi/td7vInVVX5Im86/r7rgRq1/dXocBMQPS0q@vger.kernel.org
X-Gm-Message-State: AOJu0YwiG+w2XTvBO5aNFbkhLn2QgXEROEhbodEWsJexv3mnqcggL7Gp
	nU8sbxqqjRlWXlX1xckd9/+aXK5ndLr3xkDc49tN7EdhE2C2Bg+pOPq03I/7JdmwNOp3IpuvupW
	OmP0BfNHiYmlP32BhwvRL1PCwhtz8D08PgIpYBVifEo9KkUBCjWfOKg+gGVDll7ruWzX/oFHBj8
	QiWImM2JBkG9Es1YXa4A2xyvhscjE+GTNxJQvN5Q==
X-Gm-Gg: AR+sD12GRH0SAEiC+z8SJq78LKhSRC+SiJntwGVXkwziGfhSl0wl1OA7eE7kBf0/nrx
	k3MikIdVzGO4fYV2AYvDvZCN/gCTlqc18AWg7xANIArAstGz9qiEa0pA4z5/JwnXBNgrKS19bz6
	LwT0/nIHsEubUKufX2pGuUrb2erqxDWAg+NJ/tLAkw60JEVdUdLch5wQo=
X-Received: by 2002:a05:690c:6807:b0:81e:45a6:bd5a with SMTP id 00721157ae682-83707af976cmr125335317b3.0.1787057016202;
        Tue, 18 Aug 2026 05:43:36 -0700 (PDT)
X-Received: by 2002:a05:690c:6807:b0:81e:45a6:bd5a with SMTP id
 00721157ae682-83707af976cmr125334917b3.0.1787057015697; Tue, 18 Aug 2026
 05:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-drm_panel_bindings-v1-0-1f974508a31c@redhat.com> <20260818-encouraging-lime-kestrel-d0d819@houat>
In-Reply-To: <20260818-encouraging-lime-kestrel-d0d819@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 18 Aug 2026 14:43:24 +0200
X-Gm-Features: AcwNN1Xf5TcQWb8-1dGKED6s68kinvfHK33o_OU_E9S6-z4zydpISHNRJ6-TMKU
Message-ID: <CADSE00JgK-CYnBiCA8aB2tGXG2CqC-zB_Tvz3eU=2ap00th3bw@mail.gmail.com>
Subject: Re: [PATCH 0/5] rust: drm: add panel bindings
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 1:45=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Mon, Aug 17, 2026 at 01:40:45PM +0200, Albert Esteve wrote:
> > This series adds Rust abstractions for the DRM panel subsystem,
> > covering both the consumer and producer sides of the API.
> > This helps closing the gap so that future panel drivers
> > can be written directly in Rust.
> >
> > Background
> > ----------
> > The DRM panel C API has been progressively hardened over the past
> > year (see [1], [2], and [3]). All panel drivers were fully migrated
> > to kref-based allocation via devm_drm_panel_alloc(). Panel lookup
> > functions (i.e., of_drm_find_panel() and find_panel_by_fwnode())
> > were also updated to acquire a reference before returning.
> >
> > Note this series depends on [3] being merged in the base
> > tree. Currently it has been only applied to drm-misc-next.
> > The other series mentioned above are already part of the
> > base for the current version of this series.
> >
> > As a personal note, part of my motivation for creating this series
> > was learning more about Rust in the kernel. I would appreciate
> > feedback on Rust-specific idioms or kernel conventions used here
> > that I may have missed.
> >
> > What this series does
> > ---------------------
> > Patch 1 adds of::Node, a Rust wrapper for struct device_node
> > implementing AlwaysRefCounted. C helpers are added so that of_node_get(=
)
> > and of_node_put() are reachable from Rust independently of CONFIG_OF_DY=
NAMIC.
> >
> > Patch 2 adds drm::Connector, a minimal Rust wrapper for
> > struct drm_connector. Its sole purpose is to provide a typed reference
> > for the get_modes() callback argument; no ownership or refcounting is
> > exposed at this stage.
> >
> > Patch 3 adds the consumer side of the panel abstraction:
> > - Panel wraps struct drm_panel and implements AlwaysRefCounted via
> >   drm_panel_get/put. Consumer lifecycle methods are exposed as safe wra=
ppers.
> > - PanelOrientation wraps enum drm_panel_orientation and provides
> >   from_of_node() to read the "rotation" device tree property.
> > - Registration manages the panel's presence in the global registry
> >   via drm_panel_add/remove, decoupling registry lifetime from
> >   reference count lifetime.
> >
> > Patch 4 adds the producer side:
> > - PanelFuncs is a #[vtable] trait that panel drivers implement to
> >   provide their callbacks. All but get_modes are optional.
> > - Panel::new wraps __devm_drm_panel_alloc, returning an ARef<Panel>.
> >   Registration with the global registry is kept separate via
> >   Registration::register, following the pattern of drm::Device::new.
> > - ConnectorType mirrors the DRM_MODE_CONNECTOR_* defines from
> >   include/uapi/drm/drm_mode.h, required by Panel::new to specify the
> >   panel's connector type.
> >
> > Patch 5 adds gated tests, covering data type conversions and layout
> > invariants.
>
> So while it's definitely welcome on principle, I wonder if panels would
> be a place to invest in at the moment
>
> The series
> https://lore.kernel.org/dri-devel/20260814-drm-bridge-every-panel-v1-0-19=
cd5277cc8d@bootlin.com/
> is likely to move every consumer to use bridges exclusively.
>
> https://lore.kernel.org/ksummit/0fa2fb42-0714-49f7-ba43-22928e1dd488@lina=
ro.org/
> raised a discussion that the panel API is very limited at the moment
> (while the bridge API isn't, or could be much more easily extended).

Thanks for sharing all the information and links!

>
> This is supposed to be discussed at plumbers, but I seriously think the
> outcome of that discussion would be to just deprecate panels.
>
> Bridges would be a much more long-term-proof investment.

I picked panels because I had recently worked on their refcounting
improvement efforts. And even though I saw some comments in reviews
hinting at what you pointed out above, I did not connect the dots.

I will certainly pay attention to the discussion at plumbers. But for
this series, I'd be happy to drop the panel bindings and switch to
bridges for the next version.

BR,
Albert

>
> Maxime

