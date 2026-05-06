Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF3D3ED5C8
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061072; cv=none; b=SpWFFyfCv8y9VsaFPnfzh+zT5hS8jyK0c9UGADuLENYtTJPzAqNZkDN+Kf/Yk9o42iDLtSLavZZur/Npf139nh5Edvv7lyMheBIytjuOtChjiOng7/D0Xa/vqiOwA+NaA7mrn+pz1gMkT3hTU1VAJ5ht4RLaJjgpT1bDGrKt9lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061072; c=relaxed/simple;
	bh=vfrATgQHWoLdism2lue+ijTptYIlhESry+/AqSEnFWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QR7laKwtazTRMeHxqCYGBmSUCZ8iGrkdXk0n7ZiYnJsPeXNhppzCNpn7/OVcofrJeAwQPERPHhKgEEk/2b+LrZkReFsWC173HVWDG9g/M+6R9vLYWXlTzd3QMFWdziBfbabRQi/2e+igmSAYbcDQ/hctrxB9/bX3U7SawVVVo8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FlwHvLIJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GpZ/frAN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FlwHvLIJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GpZ/frAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778061065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfrATgQHWoLdism2lue+ijTptYIlhESry+/AqSEnFWE=;
	b=FlwHvLIJRRmxQCVdcWbZhEg9KhNog04FHGr1/13+mUC/f0SIegzNsciJJMX4Egv5TUyiEn
	HIYcQ7t4YPNcOyqsDhwMZv/cO8BRSOgIJ6uJDpe6v26U3Vc9NHZN2olPHXJ4tcU/KrDFAx
	L7vU5WGbZeI4TNyonhmny5qZLyEsL9E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-d3A1PzqUPcKO2pMLSE8McQ-1; Wed, 06 May 2026 05:51:01 -0400
X-MC-Unique: d3A1PzqUPcKO2pMLSE8McQ-1
X-Mimecast-MFC-AGG-ID: d3A1PzqUPcKO2pMLSE8McQ_1778061060
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-44f56d5523eso1992826f8f.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778061060; x=1778665860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfrATgQHWoLdism2lue+ijTptYIlhESry+/AqSEnFWE=;
        b=GpZ/frANu8fF7WKTCYKQ8un0TZtS6/X0KvQ8ZchUH6Sc9IKcsS5nquQggGCVme046G
         FyaK/1lD8o9pipiL585NnZr/ChEXgARLDGMzVkBDFKxxHiPpyubl5XdFNRSlThvhnbyw
         aeFhEK8YuKUxRRO1naSZ6tEkqVWF7ViXflgSdJhOX3GrYLTHkLpDGJX+t21mV1VqSyXs
         pTsDfStdU2v4ZtAcxpn3e6AFhDKe8qJpOeWuPxjvlS9Lzs/dBn66HvkNdQuA2HvtlRSA
         lVj8LZVqtoYxf1QuuHrcXDiLHKO8htS1wf4fA5DfFmcpMxSWqwJYb424sIKqhUcyMH/Z
         VTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778061060; x=1778665860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfrATgQHWoLdism2lue+ijTptYIlhESry+/AqSEnFWE=;
        b=ZeFVaEvNLC1wqXGF1rnT04Cx7mjCStxldP1QlIJEcLJNUhrieJFMU0oyzXhQVk5aX7
         GlZD0p7edo+sRUpOIfPpSimecoMoAPFx4S5HvsT95QKTUc/tzeuDcppJw0GpcmfcGyon
         PvAVW1GhIi98v10qAOPj7zCcpIMxLP87BMi1ZpSNfR2YCqeoxN1ZiWyT1YPVwGJvyoqF
         acope/oVO9mg85r2awBrcmFkv7tJjQIlEdzjTz4M8H7hd83j+MPMrU2e6iNIrklRQbya
         af8avwLN6DYlWlQgTUzUoYFuHr0gOXBuaoU67JRpFpXP73py0N2p1kq03zW/1oSEYK6o
         6BRQ==
X-Forwarded-Encrypted: i=1; AFNElJ988HWOJ9deLEjSk6R3lQOVN4AnV4/vc7xwI77x6mkEz8ADW85Ake4+JyVTm5Lq7D3sR7oCR0vfi+Ep@vger.kernel.org
X-Gm-Message-State: AOJu0YxDIJj7OMh2HF/cfQaEzWDRRXK5ORVbBWSf8llqnvRYwSarPaNV
	vzWZwXg0MZQQICpM8ssrqExv+Lt0Xtwh8rFCTKBLRyvGoijV/lPvEfmLOV13RGnM01XTGWX3CTk
	fzoov3t4mjaXCsfe7QEMM4LwRIfAhZK4COPoVLGyc3fFxH+g39MUAX6TyXWt6lcE=
X-Gm-Gg: AeBDieuC0K2KfGEdhOHiipfWMNBhJQTzt0T9m3LWUvWMlQNpp7umIzb3LORTJhdld4R
	2K3qu7o7aPsSE9s33sjQGFpyfpnN+qIf7UeiSLyFEk9RYAak02XPjyCV99lrtf/piP03awU/ihZ
	KhBwcXj3pO2zmE5Ss+f2Z+puJikDpj5GPVKDqPwvwT85FaJ7muw1ibvNOrclyRxRqkwIXqY470m
	C43cBZ66BaP5Rvl56KJ3+qUtXmo5a5CyqhnXhPdZClySd6osH4H2R8i1im/gW6en+eDHWtyLFby
	PkIZdvCEpqoBFcBD82rRWezplQdepKqjRE+1ThzG+hVbTfL11RFTLpfcpU2RwoiUusTem+PPwxd
	pWQ9sK/kB
X-Received: by 2002:a5d:5f83:0:b0:446:ef9a:8f41 with SMTP id ffacd0b85a97d-4515da970a0mr4473817f8f.40.1778061060048;
        Wed, 06 May 2026 02:51:00 -0700 (PDT)
X-Received: by 2002:a5d:5f83:0:b0:446:ef9a:8f41 with SMTP id ffacd0b85a97d-4515da970a0mr4473777f8f.40.1778061059498;
        Wed, 06 May 2026 02:50:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02abbsm10793056f8f.18.2026.05.06.02.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:50:58 -0700 (PDT)
Date: Wed, 6 May 2026 11:50:58 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 06/10] dma-buf: heaps: Add support for Tegra VPR
Message-ID: <20260506-tentacled-unicorn-of-typhoon-cb4edb@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-7-thierry.reding@kernel.org>
 <20260123-meteoric-butterfly-of-imagination-fd691f@houat>
 <aY3nov29aBGWw93Y@orome>
 <20260218-voracious-orchid-malamute-febce0@houat>
 <afJSQbArB8USb6mt@orome>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="sztjivasnlwpybgk"
Content-Disposition: inline
In-Reply-To: <afJSQbArB8USb6mt@orome>


--sztjivasnlwpybgk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 06/10] dma-buf: heaps: Add support for Tegra VPR
MIME-Version: 1.0

Hi Thierry,

On Wed, Apr 29, 2026 at 08:49:58PM +0200, Thierry Reding wrote:
> On Wed, Feb 18, 2026 at 10:42:22AM +0100, Maxime Ripard wrote:
> > On Thu, Feb 12, 2026 at 03:50:09PM +0100, Thierry Reding wrote:
> > > On Fri, Jan 23, 2026 at 02:30:14PM +0100, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Thu, Jan 22, 2026 at 05:10:05PM +0100, Thierry Reding wrote:
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > >=20
> > > > > NVIDIA Tegra SoCs commonly define a Video-Protection-Region, whic=
h is a
> > > > > region of memory dedicated to content-protected video decode and
> > > > > playback. This memory cannot be accessed by the CPU and only cert=
ain
> > > > > hardware devices have access to it.
> > > > >=20
> > > > > Expose the VPR as a DMA heap so that applications and drivers can
> > > > > allocate buffers from this region for use-cases that require this=
 kind
> > > > > of protected memory.
> > > > >=20
> > > > > VPR has a few very critical peculiarities. First, it must be a si=
ngle
> > > > > contiguous region of memory (there is a single pair of registers =
that
> > > > > set the base address and size of the region), which is configured=
 by
> > > > > calling back into the secure monitor. The memory region also need=
s to
> > > > > quite large for some use-cases because it needs to fit multiple v=
ideo
> > > > > frames (8K video should be supported), so VPR sizes of ~2 GiB are
> > > > > expected. However, some devices cannot afford to reserve this amo=
unt
> > > > > of memory for a particular use-case, and therefore the VPR must be
> > > > > resizable.
> > > > >=20
> > > > > Unfortunately, resizing the VPR is slightly tricky because the GP=
U found
> > > > > on Tegra SoCs must be in reset during the VPR resize operation. T=
his is
> > > > > currently implemented by freezing all userspace processes and cal=
ling
> > > > > invoking the GPU's freeze() implementation, resizing and the thaw=
ing the
> > > > > GPU and userspace processes. This is quite heavy-handed, so event=
ually
> > > > > it might be better to implement thawing/freezing in the GPU drive=
r in
> > > > > such a way that they block accesses to the GPU so that the VPR re=
size
> > > > > operation can happen without suspending all userspace.
> > > > >=20
> > > > > In order to balance the memory usage versus the amount of resizin=
g that
> > > > > needs to happen, the VPR is divided into multiple chunks. Each ch=
unk is
> > > > > implemented as a CMA area that is completely allocated on first u=
se to
> > > > > guarantee the contiguity of the VPR. Once all buffers from a chun=
k have
> > > > > been freed, the CMA area is deallocated and the memory returned t=
o the
> > > > > system.
> > > > >=20
> > > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > Aside from the discussion on CMA, it doesn't look like the heap def=
ines
> > > > anywhere the attributes of the allocated buffers this heap provides.
> > >=20
> > > Attributes like what? Where would you expect the driver to define thi=
s?
> > > I don't see anything in struct drm_heap_export_info that sounds like
> > > what you expect, nor does the allocation ABI provide any means of
> > > reporting attributes.
> > >=20
> > > There's also not a whole lot to this, other than that the memory
> > > allocated by this can't be accessed by anything other than a select s=
et
> > > of devices. You can't have any CPU access to these buffers (the hardw=
are
> > > will refuse to let the CPU read from this memory) either, which is
> > > hinted at by the fact that no mmap() operations are allowed.
> > >=20
> > > Can you elaborate what you're looking for?
> >=20
> > Are the buffers you're getting when allocating cacheable? uncacheable?
> > mappable? physically or virtually contiguous? etc.
> >=20
> > See
> > https://docs.kernel.org/userspace-api/dma-buf-heaps.html#heaps
>=20
> The CPU doesn't have access to the contents of these buffers, so
> cacheable or uncacheable aren't really meaningful, but I guess they are
> unmappable in that sense. The buffers are physically contiguous, but I
> think "protected" is the right name for the heap since it most
> accurately describes what the purpose (and access pattern) is.

Yeah, that's what panthor has been using too:
https://lore.kernel.org/r/20260505140516.1372388-1-ketil.johnsen@arm.com

--sztjivasnlwpybgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCafsPAQAKCRAnX84Zoj2+
duZVAX4rZKstjm4yGIoK4/qxMtpVXLGWXrhCS66Fx3Nz2VUdigwaNxKdo0VUnHgz
6sVzgJsBfRq2AlW+F/stHpXM0fMsHUXere2S6tyHKPw8gwt6dAO5rXziaIeIl7HL
rUTTJPnxiQ==
=nQPK
-----END PGP SIGNATURE-----

--sztjivasnlwpybgk--

