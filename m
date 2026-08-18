Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB693368A7
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037657; cv=pass; b=FoarLx5NcnsaMW9RFrMZKnAXGeIO697OeX+1Cf5CfvBatZWCYVeYeLV7ZcAHvq/UleLjmP/H2qCY5lBQgDO62jJRkUFawvX83GFJsi3g7JswbbK6M2/gd/oQ/XNiarxRs2evMDx3PihJNRe48NDJE5eWmyh1Cdsaq3LK5b/NoE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037657; c=relaxed/simple;
	bh=AH2rzIzO8xOuQwuHw1E2qkQOPI5JqW1bPKl2RlhocFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZoK2hB8eaNn0R9yuANIAnT9dS9YCPCY/09MCDBof59A8bdMZFsu9bBMwLxyCVlNCi269JydJNYWf7k8ZJHiPQFKWQ+xdhDJrBe3XRt/ZeasTwtcS6RT344XyaEhnHs1txR5s89vjV2Q1Ty+iQv2Q519eYfSTo72KZ4zgS6JbAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VpDrPLdg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HZyS8koi; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VpDrPLdg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HZyS8koi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787037654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AH2rzIzO8xOuQwuHw1E2qkQOPI5JqW1bPKl2RlhocFw=;
	b=VpDrPLdgB+S20wXDQq+AFbGvnnoB19vDc5P6scGW/26SaC4btjugb9u7AVFUKpD/HUMRi5
	NK+fwfZmRKHV5f9QIuAL2dHgGi3+n8NUL2lp2j6t45RnI19Or2w5giBHGCtJgArdG5T7iG
	kWXHExnrYc68hygclOZE/sX+7QyZ/E0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-6zDxE81vNC-AzaVl9aBT7Q-1; Tue, 18 Aug 2026 03:20:47 -0400
X-MC-Unique: 6zDxE81vNC-AzaVl9aBT7Q-1
X-Mimecast-MFC-AGG-ID: 6zDxE81vNC-AzaVl9aBT7Q_1787037647
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7fe835353acso67683757b3.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 00:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787037647; cv=none;
        d=google.com; s=arc-20260327;
        b=cupJB5vuA46vxRVsxL1znZQlxHZcUww16yEzZyAODfUExut7on5cRS0fDfkCJhs0ky
         ACJzO2qQQT8rQzXFYj1xiH5Qaggc1qDgnj0cKmSZoy8/MwdS1XBklrBj5O6nv5lsCEPc
         6Xm5pPjB8is3AUyRoVp42MjFKaTg9R03h++Hqh9ykNu4d4zaohsNyoOaBshxNRql9m3X
         QifYG3u0OO/BN4FPQqLY69jgA4XMa7L2CgCHSP/vurnaoFoufTr2r06UCq0PWfnDNcWk
         492IuOc+8bFt0e2foowDLSvOLiMx04bcXFlnAHWXneua+7yT4YcWZ4n/tj2QZiZAAgli
         qtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AH2rzIzO8xOuQwuHw1E2qkQOPI5JqW1bPKl2RlhocFw=;
        fh=vH1tyfBPo8pPvtDnr6oowTd+oAuJssdrqks3PQsKWp8=;
        b=QRxfw9bRIc20MPDxYLomBYae4fpr3ZJii86NLRHfImwz+vp9h3dst9J3c7BSnLvzB6
         HHfAHVADafDYXXz8W/OK7Zyqq7Hy3DGybImAcInuSuQHLidqqN1B5GRs2DhZ/V3+evVG
         1CmfkCTIw4pg0oXAg/E/hF0KBRX0Eazb+WZRkqd8yUcuu4eHxSILnkH58FOitA8YDuk+
         guVNJMKLMMni3/7j59EtbxfVn+7kNcAwG6KSQfKJDjosEkcQTKbrhto/5SXrLEHNpq0G
         RLLodXM1KGdCgCOzqhCUqTySYbAvPgQFeHUBZwZd3XMkvwErENRkw/lD2TmXbftzrO9l
         eqog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787037647; x=1787642447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AH2rzIzO8xOuQwuHw1E2qkQOPI5JqW1bPKl2RlhocFw=;
        b=HZyS8koiDtWZ/M26K4Ha+ifNzbMB2UiawWoDOr2wpmBJ619C8QdgXMpXiaGa2MHkjn
         09Ny9UQ3Od0JxEfRRgMot8v66hCeHukEbDzZEEqDJktA+pyX+GKVrTMYpfxT4NFahYlD
         /kN+qHVq07Gc68nbEhJkx4cGLIvQEe4ny8FUGrJRdJAYqhV5GzJbrwhiH/5jT8KeIEu4
         7hkB/qDwg5hF7suud2aGmk/G3oqXJRh4vGOwGriL+gTvSafsWYwa/Ufp99OeYLFNJKH4
         EauVKp8vRM8KJiNMxD+DdTz4tXMDJkymIq/5SSo4n20HuS6Nko6dLKAv7t7r84NFojGA
         hrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787037647; x=1787642447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AH2rzIzO8xOuQwuHw1E2qkQOPI5JqW1bPKl2RlhocFw=;
        b=b9VDiYq3i8R0zRXiOHxX0xxjtRO5nw4NBKfs+gtSMwq/OCoXx6SPzxi9jmgSfAfjbi
         bfu0TPdG381gS6ULr7AZbjKL9vxRhz8JI2iaNqZ54I9gqD5ishUwKZuRDmN4X+rXPvZk
         JF4p9+2lTQsW5TjLvIxX/Pg9bveCN+PjbQx+ZX6wDbZHcir7Ulxf8s5haqE+oQDoLYkC
         tw2panZMovWfd/gbyNsEoqUwBnDnPj384xpGfg8ZPHLEUzWQxDgqJmJH628oWmQKf7XG
         wGCyOOhxNXLTAjDFlA0hdico0c96ziDYpW2TD37VjGkGmlknM5bmG0zIC1ZT1PrbtWTE
         Jv/g==
X-Forwarded-Encrypted: i=1; AHgh+Rr/Yff10vjjNgrqlz5eBX1Al32ZUcY+VR6y6HxgCY4ok1/TeysvnZG+04l4PASsxjZSNigyyk445qPs@vger.kernel.org
X-Gm-Message-State: AOJu0YyUlaEP8vzSuEDdxwRTyL3ukx1Qa7PjH21WTFsXCfNF0iHmH64Z
	qmL6sAcH1ZWPN+LyljPDuhHY3tGGIj75bwbCH+Ig5fcnyMTURdlFRGBXf+/2JBNwhaIpZyeMCsB
	6sONTRxtyUgeijID8le3TG25IEb/h4HPt1JipVRPHAJWUSEAsfj4XfMwhp9RvEIgb6CRypoOF/Z
	FySrqrqgybglaGvLaeRj1D9JlfWem5cTiuf2em/w==
X-Gm-Gg: AR+sD11ALZUKCOzPOzbyXuomr9FhJ+XBNK2TgCo5p9C0eMPuhfHl9R7fYLDcD4q1I0e
	eldrOHw7t+JTMWE6H6kOy5Q6KOYAZluQh+yoTAHyiV7xjyoSc/9tHrtQKJp9fD46+o0MyUMbgqq
	AbgSWY7PMexUZwFUwjQxAYXMocWk/F+PABefMgg9oxcRUtbYdyPvbR/Is=
X-Received: by 2002:a05:690c:e1d5:10b0:81e:6a10:f90f with SMTP id 00721157ae682-8371125d508mr80483467b3.17.1787037647091;
        Tue, 18 Aug 2026 00:20:47 -0700 (PDT)
X-Received: by 2002:a05:690c:e1d5:10b0:81e:6a10:f90f with SMTP id
 00721157ae682-8371125d508mr80483207b3.17.1787037646635; Tue, 18 Aug 2026
 00:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-drm_panel_bindings-v1-0-1f974508a31c@redhat.com>
 <20260817-drm_panel_bindings-v1-1-1f974508a31c@redhat.com> <20260817151815.GA757484-robh@kernel.org>
In-Reply-To: <20260817151815.GA757484-robh@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 18 Aug 2026 09:20:35 +0200
X-Gm-Features: AcwNN1XPNBWCoPE2Nkai9E-mE_8PW-Et12-aqT9wAxfp7sMMAA08KesO-xwraw8
Message-ID: <CADSE00Lfh=8CSsadEoiEAd3Ld_0=nphkYGnxNH1v1woNPbF_bw@mail.gmail.com>
Subject: Re: [PATCH 1/5] rust: of: add Node type
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 5:18=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Aug 17, 2026 at 01:40:46PM +0200, Albert Esteve wrote:
> > Add a Rust abstraction for `struct device_node`, the device
> > tree node type.
> >
> > `Node` wraps `device_node` type pointer and implements
> > `AlwaysRefCounted`, allowing owned references to device
> > tree nodes to be held. To do so, add C helpers to make
> > them always accesible from Rust bindings, independently
> > from the configuration.
>
> struct device_node being refcounted is a kconfig option
> (CONFIG_OF_DYNAMIC). What happens when that is disabled?

With CONFIG_OF_DYNAMIC=3Dn, both refcount methods (inc_ref and dec_ref)
become no-ops. Same as with C code.

Since Bindgen does not generate bindings to inline functions, the
helper functions ensure that bindings::of_node_get/put are generated.
Otherwise it would fail to compile when CONFIG_OF_DYNAMIC is disabled.

>
> > This abstraction is needed for subsequent patches, in particular
> > for creating drm_panel instances from a `const struct device_node`
> > pointer argument.
>
> My intent is to make struct device_node opaque. We may never get there
> with C code, but please make sure Rust is that way from the start.

Got it. I will reduce the visibility of the raw pointer accessors by
making them pub(crate) for the next version. These are the only
accessors added in this series. Future methods accessing struct fields
for 'Node' will have to rely on C accessor functions.

BR,
Albert.

>
> Rob
>

