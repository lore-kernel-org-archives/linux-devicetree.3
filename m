Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570698;
	b=g8Ls5gTDlmHFskl6iz53FGbPRrH31+cIDT6gtx72NXrVLw9hPUnOkiEhLZFaOLEtI3Xn
	 eLgWTEnIMqMCgYMqy4x5VjlLY70IIulsbbpP79azCCMxoYwxNctwP+5c6jMyLiki7ydJ4
	 7qyJKVqYRVG1amAT5FgM/J7vNPCZLS8NZQPBnVAdzOc7U3elVhg6q/1+H1EQj4dSzqArG
	 sUyUz9L7qQ4DFoTFTTrg8XKpNJjSJyl+EgvqP3Hi3iAv8eBmaPkwwE4faY34zzY3IRMME
	 XSHNfCjsdJ5TC6neE3P24akUCrvRRPbMKYe+XTlI+kjUh0OmxCfm41ARlblfzPrBUBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y9FalgqvOBxKMHjv7jEesaNhOq3+IVDOmV3JOVqLntg=;
	b=lYNiIE7HNR2gWtamMZ7zr45dRnhZ7ODqmlvnnZOqdTh/ekF/TUQndXzkCwU+LBNe8/Zn
	 qnHa6OYtmGvr+9V1yjqJeJU+THeBgs+/rmKvw8KgCXSeUTt0n+It6l+tfDLj366HHAQXy
	 0le5Wg1rtdD8RtAnIm/AAvEFxba6KwiX4jwvSTJDCq7biBNKuPOX7b0mdpT9oEptfuf+R
	 j5sf3aXlDMprA2HEsUZR3G/3m4icPN+vD3BVXJjO3idZEAPtAjsQFMaLZaVNgusiFaIdv
	 l+G0RPenOGHkTUrDD4piEL1kfQA5aJYwvm70Fd4jvK9v4V9nNn3ECFf5so6tEjJMlkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H5xr+jcX;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9D3606A326
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F9D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H5xr+jcX
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso6160648a12.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570696; x=1794175496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9FalgqvOBxKMHjv7jEesaNhOq3+IVDOmV3JOVqLntg=;
        b=H5xr+jcXaSOD66udFCGR3/aVqwVkudH426bcE9gvymmoMQ8ShM62UwWPDrY2G4qsL6
         RgkF6cmSG9wW5B0Unz6rXD4LsYFCam7wk8DvjPFFTTcGtfhf+jiT+iWAP7kHeepAuIxU
         vlLECwjNVJ0taIUJUHg4Y6YdbisAqH78f9LfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570696; x=1794175496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9FalgqvOBxKMHjv7jEesaNhOq3+IVDOmV3JOVqLntg=;
        b=gI/CAvjjg/9Uk5RN8mDPsa03ZlAIPuKX2P4BOMjBTVTShewGvvsgOHDA8YBvWC8716
         NVTF9wKVYdqYwi1GJMaNBoT2Jsi6DSMBGXFX8kQBqUyKk0lnb6zCJbej1BsqUPK3cV1b
         TQ8oMQCpKIRxFlNTr7c0Wbnu4o9f3D/Ahb37rSufMCB5AqInmaI9i8CftwNFyH9N2Q5U
         VucWQ4RgVDC+ZfieOP8z+yu6MBH1zdeZB+0/ClKeZssfd+EIA9BobnVYmBDb7Awjm+cM
         +/BfxB9WUO5dgSQUozNkcoTALP4GN70u8dVIXqIb1OSFZ1QZsP4DSJv2yTtmuxQ9bmN1
         Docw==
X-Forwarded-Encrypted: i=1; AKwUvByK7w7iG90+4R0shJ82lniXIX11XFRZ/Cb83Hd6ME42RqHWYMWeWuvms1k0GxdsaxfP6h7pE1kmmBHN@vger.kernel.org
X-Gm-Message-State: AFq9FYILf9iZUru6heNZLxso8T6EX2VzadsnAvZTd1SXgnZrszTM6hJE
	kpIAiLdZXJ2cMWj708J1m4tVts5nnV55gFqmzBGxqfdsesz6c6V+DTC0a9Pg5MwWgkLqPKpEfwy
	S3alrl2Vm
X-Gm-Gg: AYBFou2zj1ebFdPv8BjNgOttRwHub2CDN6eLzGjFPGnMSSLvn6cV7omb8aZV7XbXdxD
	QnOjQecclz0xm8Q+h+Umm7TumcydgfPtvecHhZKUp8c4rTBmMx66KeE+aEsa7mix3kFE8YFJrkM
	VaS2xT4ecDnnh3iWKEY6RAMRrO2nhnkBlNyfUtSck+sFRDInP+f7ahEGSWOPJs+6JBe8ocgUTg7
	dJ5mFhDycjXTt44jLUkqOFBRqEHDGCzz+Uyxih0W8Ol4lf7iIo13YMRIqcRBlrAgThF2fofiJIb
	uZ3waO9Lr1P/M8J8l4gLE+ns8mFZADhpaZaNcu0m3fK5YNKcZdAJGrT35FNL3OrI39DvaEZ95A8
	wn6BDq54XHrtycg/Q+4yHsxiNHPrIxyeyfTjC1ej3Ql5CiIAnTEJLIT8RfSA7Y6TrEkI5QokHjz
	/GDXa/FFhGYEsBZca+CKL2tCxFpTv5AkSbfcq1hniTRtDde2OztlTQjPSuTOrfcu6eQ8k+SCxMt
	LoZTd6DfC8T8yVgHWdkrpCabH5WJqbIr0wS3ZuUYMA89kUaHMFYcZt7Y/fUF2vDoBe8o9882S6z
	ImUIFiv/LMvO5B6hFz+oYZfjYGkU9Q/6GIz17dYBt0e7VAPHhugJmlpkFkkVedklFLZmyGAzXlW
	SyHe/Q+xZPscA
X-Received: by 2002:a17:907:3e06:b0:c2e:7fe7:2898 with SMTP id a640c23a62f3a-c4ca7a6aa23mr716118566b.12.1793570696497;
        Sun, 01 Nov 2026 14:04:56 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabec09fcsm310995766b.71.2026.11.01.14.04.55
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:04:55 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so20632175e9.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:04:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzIYxZgG9vfVSHLvOxaUX1wDR+pSuS9ICJW5UNyP+fkufznTlSCgo9eItcaTf0ttyf60LNmPEgJ1QkW@vger.kernel.org
X-Received: by 2002:a05:600d:1a:b0:4a1:d49e:9ce with SMTP id
 5b1f17b1804b1-4aa86e16223mr268350705e9.2.1793570694243; Sun, 01 Nov 2026
 14:04:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-4-dianders@chromium.org> <CAFLszTh+c8H6Xcz0LXGjO40XA4=y0jdyAFUr6ygc2OkS9GrHYg@mail.gmail.com>
In-Reply-To: <CAFLszTh+c8H6Xcz0LXGjO40XA4=y0jdyAFUr6ygc2OkS9GrHYg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U2RO=3bnQayb34+PPD+_PHgeQApVaZv8Y5kc0Ot=O88Q@mail.gmail.com>
X-Gm-Features: AclHuK9dhvNlRKCOtArNyGs4fDmcQo0yhLCkGwe8OeUxFLPcZab45mJ1XIw39r8
Message-ID: <CAD=FV=U2RO=3bnQayb34+PPD+_PHgeQApVaZv8Y5kc0Ot=O88Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -929,14 +929,16 @@ class Property(bytearray):
> >
> >      def as_str(self):
> >          """Unicode is supported by decoding from UTF-8"""
> > -        if self[-1] !=3D 0:
> > +        if not self or self[-1] !=3D 0:
> >              raise ValueError('Property lacks nul termination')
> >          if 0 in self[:-1]:
> >              raise ValueError('Property contains embedded nul character=
s')
> >          return self[:-1].decode('utf-8')
> >
> >      def as_stringlist(self):
> >          """Unicode is supported by decoding from UTF-8"""
> > +        if not self:
> > +            return []
> >          if self[-1] !=3D 0:
> >              raise ValueError('Property lacks nul termination')
> >          parts =3D self[:-1].split(b'\x00')
>
> When you split this out (as David suggests), please can you add tests
> that call Property directly rather than only going through NodeTree?

Done. Split into its own patch ("pylibfdt: Handle empty properties in
as_str() and as_stringlist()") with direct tests on
`libfdt.Property('empty', b'')`.


> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -1214,6 +1216,261 @@ class NodeAdder():
> > +class NodeTree:
>
> BTW in patch 7, fdtfactor adds 'phandle' and 'fixups' attributes to
> NodeTree objects on the fly, so they carry attributes the class does
> not declare. Since unflatten() uses cls and create_path() uses
> type(self), subclassing already works, so a small subclass in
> fdtfactor declaring these two attributes would be cleaner. What do you
> think?

Good idea! In v3 `fdtfactor` defines a `FactoredTree(devicetree.DeviceTree)=
`
subclass that initializes `self.phandle =3D None` and `self.fixups =3D {}` =
in
`__init__()`.


> > +        node =3D cls()
> > +        for prop in fdt.properties(offset):
> > +            node.props[prop.name] =3D bytes(prop)
> > +        for suboff in fdt.subnodes(offset):
> > +            node.children[fdt.get_name(suboff)] =3D cls.unflatten(fdt,=
 suboff)
> > +        return node
>
> If a blob has two sibling nodes (or two properties) with the same
> name, one is silently dropped. I checked with FdtSw: with two 'a'
> subnodes under the root, only the second survives. libfdt does not
> reject such blobs and fdtfactor reads input it does not control, so I
> think it is better to raise ValueError here than to quietly throw data
> away.

Done. `DeviceTree.unflatten()` now raises `ValueError` if a node has
duplicate property names or duplicate sibling subnode names, with unit test=
s
in `tests/pylibfdt_tests.py`.


> > +        fdt =3D sw.as_fdt()
> > +        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> > +        fdt.pack()
> > +        return bytes(fdt.as_bytearray())
>
> This reaches into fdt._fdt and calls the raw SWIG function. It would
> be worth adding Fdt.set_boot_cpuid_phys() to go with the existing
> FdtRo.boot_cpuid_phys(), and calling that instead.

Done. Added `Fdt.set_boot_cpuid_phys()` in a preparatory patch and updated
`DeviceTree.flatten()` to call it.


-Doug
