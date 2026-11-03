Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793696537;
	b=q5Wz4UJfyChS+1HdiDhLjlCMUCp3r/VpfPK8njWx/kj6ozQFTwJZHRKXlvppBFapLwdU
	 G+SyCT08Zlxs5Q9QLbWvK4XtpUkfyiPHxUNahLlz5mKiy/nKFbwu99p+rPWinUrranQwT
	 OiYChj6/TGf1IKWKspLl5ZTP1BRQlQN0Y9dZafuIHUOA+lzFuntHeSwEy2EUDYf/cvfkK
	 GVguXPGT4r0CvrknuoxAMKfQtNI61EmOuq4+sPYKG4IonKavM5RAKQgFyTbki8yyyND9Q
	 BgaBLzfR/UrPfBzLWi/wubDwuUUvdTYEcBFMQKuRftesn/mb4QRUZToQyRR1HddHGJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
	b=0ePYpP5oyKlyEKuMFOwVKR7Gk0JYWiovHSOPLBNdn7eeeLhFvIeCsVM+dk1XrbQVZF1c
	 NHkVg60ZGBk7E+a0dVFi6dKj2dTl1VKf6Yrjwr5cN0QhvbmQxW+1G6tXK9XtKeSOtflqy
	 fCqs8fHai3TNEoZf1wD6s+JN1U+qORxNjljBNUgDR1lN1whLOXLjlA/R/tmyXIV4C2eNL
	 /RQS5//6ZBMBM/y8ProLe9adDAj47UIqD1PO/vyJsjH0YvGDRK40PM2e8Apo0G8scNYMS
	 bEEigFPGm5irU28pwDiD/52Rv1F+TGGKhLz0itv5k2QPw9gRd9r5X0fmwb8QVpyZ3fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ciwGRpx2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BFF606D824
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BFF606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ciwGRpx2
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5554190eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696537; cv=none;
        d=google.com; s=arc-20260327;
        b=EI68hDqqOOpGw7/r956Xjb5dTQKSacBt4FHAx93P29/b20ZmDljMUWRqirkdr6OBfK
         Nuox1Ou3GdxcNj0aJy+fyWVxLBCt/WmCq0TCCxOKnC7AMrHnLa6NpY6loVf5Y/LSOQg8
         Usm+2Y2/Th/VL9Am4Z1UJSAsYJI7LhPxAZmxyMCGiduPDaaMmKIhf4D2LT8BCrRjZd/c
         vra9D505tHYpZ/7pMxuMQIn/O4c2QduUkrut+DiHm/hU3KK/IxfU4oqjvbiFY4fVGrOB
         BuyWW/IOBFq2rtyXYrjoDvb+Cdc2q5V5JTDsiYf9iR/OvrmeWavqDlZGnl1xpWgXDJxV
         2DUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
        fh=HwavcsxWrbe0Qpoxw7cDTC4G9lMlryycarR0POiIMaw=;
        b=YRn8Cn9rniRKCCNzej1YoSHDXMmStpYzjXqD7o+K1cOL4m6QNI9xsIericZlx4ikX1
         kuv5Uy4Z4+BU8uHARNrZSipLtLfYNIunx38HcmariOwdOLX31Aj+G8/ga4iProrTpiUM
         IRqhsKqWXu6zPokAYIEqbAdsjzetfDNxJ6HeVAi8JZXjtvuQ5rrEYnPk41KqMfDznO3L
         HRbmXkLbLsVi1nnm7xJStuio4NLg+TewNDpDDz7iL5qhcgIJf9xTmYU9IqMUtfL7/vom
         ApUDSU0x14xnraGJgDkdovZ4wEYWe3LAs8UvYVTUZ7D51BHuo+ikrB52okyvNxYyQBeQ
         5/SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696537; x=1794301337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
        b=ciwGRpx2kcHNTz6ttmKCjLHvNvU4D+NrO24Iekv6nFHROsIHfJzjgzeFIvIop+cH9z
         rh0kL61fy6v4C5HPDGZYpdm8ehoxlvThnx4p2vZ5+6ij5RGxiAjHB8DiIc/iTexMqrpO
         u40ArrwZ8pGC1cU76kRdkxR+kJRe/HPVr0hbiWPjgf8ezUFsCYQTg2och8VmNHf5FcfY
         lwlVmvuFAR/1QyUGQjaQ4QIxCWXr0QUP7LMh0metD8NUvwKVGbk/5E5BzgLZcMkUGkkM
         ppJjttWc+JAv3zrtDfAaqElUmNrVKNW+l5+3Pc0he6clMhV6o15x35JflnwCHcfVwGA8
         Na+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696537; x=1794301337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
        b=mWUJwKRUf3hEyML35cEu1i8Y4tIwlzIdSBUX4sDYrwguRqmlhXBn3kLkPbK88J8Lqf
         PV+XSmr2/F/tB/6fK394aIyG8QYuBwuqitJwjP3jQcDU/7C4VWJmpIjtmlwuJTeAQNbF
         WStVG62khQH+O1B2d3JwULyrrY9FYtsjwaGbUgOgL6+hH/Tm6aZpSdVoAqxLizQ6lksi
         kF+MDGiOk8OJbyw0+wNUd50Lwxx27NxAKA1pDC3TAMuPCp0cZvSV0nqy7sxwTw6oZyyZ
         ml+nGWmyhfIFRc0ST5Wep0oBpiK/BhjirKWyw5QfcdmKVT8YfblrZcoRw4bcelROcl2h
         xXFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/Py+J3O727kJlHU7bX82MRA5oUnX+b35c4beUGelpMF37BbTyj1Ob5HbHUIIyaxjiXyjugcsMOIJS@vger.kernel.org
X-Gm-Message-State: APuU4Z8fSYWkl5iZF/cdeLUzfmwAiSNTKVaNNDWrc7EaDfvw7BipisaK
	KMvBsiE18D4YSoc1p8eieCp2wYhs9PsYZD0w5mi9EjdcdNtRUTMVDf70e6n4AdlXdYXZ4Oq1p5G
	6qrIOMXAvRaXqDUsTMM7D2j8g/Xl65FI=
X-Gm-Gg: AYBFou2JkldVhdwjY5sp5KzJs4N8uZZBVk4+aLZhHqpHzz4KtpsAVBqyc0gPABfSyCu
	23I/KsxnExYEyv5AFEizNEVCkIPZKdpcxqy7tKcfi4sztoKAf0RD6qhknNqVOGRINu2HyXLMDFz
	tJdzjzMCPfwf+KPnXL5/sX+8HVzqnLJc6pPNUMDC4UfmG+MPM7EEKnBCHsDHpA2M1tqVfo3umXQ
	L7OTIpfmD5wiAjM0QedJSfGShyiO5PgWkbHcXkgwzju05slv4z/YFxdXPnGE3B4tz0+VttcN+cg
	0pLmFB7N8BQGjW0TC277Ui9GDNhLn06hdr7/eNx/VVzd5NOWoFAdN2NxC8pLCcdlewuXU2hW+lo
	XHHjWI521QkqlHWMEv1yRhqxlBK4Nm4lenzUh7nhKeGJaViAvjZSmt1CgHvGE2OpCa8NAnw==
X-Received: by 2002:a05:7301:1a05:b0:36a:11e7:a11a with SMTP id
 5a478bee46e88-36a4236241cmr19980626eec.12.1793696536533; Tue, 03 Nov 2026
 01:02:16 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <179362684510.3310106.12424997423646231725.b4-ty@b4>
 <HUi_TWCnQA2WP19xCg9CEw@nvidia.com>
In-Reply-To: <HUi_TWCnQA2WP19xCg9CEw@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Nov 2026 11:02:04 +0200
X-Gm-Features: AclHuK9kP2YZS9qM8orBh3iwFzVk5JoYyyundAYGnDH-DFMvjVyJq8oHL57nrh0
Message-ID: <CAPVz0n0fpR553WL7bRYKFcHgGrc2pauMsKs1PTnuZVpN8UM5oQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/7] drm/tegra: Add support for
 Tegra20/Tegra30 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:45=
 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, November 2, 2026 10:40=E2=80=AFPM Neil Armstrong wrote:
> > Hi,
> >
> > On Thu, 22 Oct 2026 16:22:52 +0300, Svyatoslav Ryhel wrote:
> > > The display controller in Tegra20/30 SoCs features an 8-bit SPI inter=
face
> > > that closely resembles the MIPI DBI Type B protocol and is referred t=
o as
> > > '8-bit CPU'.
> > >
> > > Add DC parametrization options needed for fine tuning by bridges.
> > > Add 8-bit CPU interface in form of a bridge linking to RGB port.
> > > Add 2 DBI Type B panels used in LG Optimus 2X which work with
> > > the 8-bit CPU interface.
> > >
> > > [...]
> >
> > Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (=
drm-misc-next)
> >
> > [1/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and L=
G LH400WV3 panels
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46011a636=
fd729c99781533e265297748b5a0b0f
> > [2/7] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9fe804e2a=
3001fd024c0809678d09c5e0ed359ee
> > [3/7] drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d87ca1bec=
bb095b6204cf657508c91e5e995d9b5
> >
> > --
> > Neil
> >
> >
>
> Unfortunately these panel drivers are not functional -- they rely on a
> contract with tegra-dc that we've changed in v5 of the series.
>
> Mikko
>

Panels are functional, but they require specific configuration
described by Mikko. This is not an issue. Since We are working on mipi
dbi bus for Type A and B devices I will just add commits converting
these panels to mipi dbi panel driver. They will be as an example how
to make/convert dbi type a/b panel drivers.
