Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197669;
	b=U5y9kG5oFCQqu4ETacNKIrQundOrFrkC4OpIyns3ygQ38RpouVYDAUWNbpew2vghKkdm
	 7c1mk876AcCCJ8DO4tYHiOyDT3LyqH2JxqLqTD9OATGPqbC1OY884bjdf88PkGUJPMJe4
	 VJ1tPTfPOEOig8f4fwSv4y17VAE0E1iFAbWL+ayRewtum2upvmvkwO4hGzuZy2f//eS+T
	 u2Ja8Be1kEdDeMZPUmjk2rDvlfKwDeCbHCgzfV/fME3Hf2GGG2hIzawEb55as9s3v+hmQ
	 7bD4sDmmQYMD9Rc3xi3AkWgEadLS3Ilv0neC/OwXbtU4jNhmtIJvmr8A33d7oIGmvZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iriUQT3AzRrdfB9ami6Z9V3Qer8kviuIexFHj/Nsehc=;
	b=l4mlBAFad98+N+zW3svTQeb/40MqoEIxhAEIleoOCSHCLfZDVF5SYTG14fI9Ahw58rgY
	 E2DWxaL+CMiQJxd2H9czdLYxvhI65ol0QfKP2A+58bllJP+bC4zpb+EDKNvazognKGWth
	 CDDZnsoM/xjXjSOcBHbHBwGjKNt10Mmuh3c64wVnesiqhrny7aj/oi9U8MyjCbgexIxFL
	 BNGF9/QBwtcH+mhX3gtIEjvS/g0VNaWKeNWonHOv92RIa8qRlJam0u4MuEJib26qi1vDL
	 I99Jwu4iftXtiwWQ6qnbOiPWfth7hDCrdG3XqpBDPleZRy1oAdo3bdqmDm4bEMVHRQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZxC82Wi5;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DF6606A339
	for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8DF6606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZxC82Wi5
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so1515323a12.0
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795197666; x=1795802466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iriUQT3AzRrdfB9ami6Z9V3Qer8kviuIexFHj/Nsehc=;
        b=ZxC82Wi5S48M1TTuYgWIaneFE8IjRRr/0xBLleHE6b/fNpx6AdPV4e/8sI5xq3BLVl
         iBGGFtMenXD6tz4wQbiK0N4f8yUmpFwKKppj4oQvmjNbcHT3NpZDCr8Y4ZJw9ScGUzwn
         rE31CLmlEqMTlVPPlfkYLi6wxDujTDJegD4HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197666; x=1795802466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iriUQT3AzRrdfB9ami6Z9V3Qer8kviuIexFHj/Nsehc=;
        b=O+qpPtKWl69mYO9FiYWjPUKmYlNIln54VJFXVVdCiYe5rZC9BFRWtYUOJ6F9ocCFE7
         rzBeoAiEau4+29uRUIYICvnZio2uONWQW3lq5lOD5zwdyQn22uIquEvQNFAxwc+lvC53
         dDFAErJmwX/T+PfsAVsTfaPtlnv9CGzAhFlPVZh2Z6p8FAuFunE1WULXLe8dUQXLuvPP
         KCtHDQw5YtyFH09OT26YyLIOudB7nOq3iPMi5h3wUpwMnXMNLmYJfV5sHk8i9WPCgC3/
         wnU0jXhr3k4ik1YJFmsd3HXC118NtwWL+L7DzVjRLN10sggv3i0MjbrZ0PhHRDyqMebt
         TvdQ==
X-Forwarded-Encrypted: i=1; AL+hErFISyJo6SQ0hn6ycmPD1GSaw1ebrSNGTR1xikLq3UZT037hwsHIXdbfgcUgehSZGvodkbTwFN7fGFaE@vger.kernel.org
X-Gm-Message-State: APuU4Z/4OiGN1ZfbvQQ9Sg1nKuah3gPU7AtD3rpVJH8MwlBEfZgUPj47
	4oHZU6e3emZUtPHuW9HAal0OGn0y1kNr34f72TRhKskKxo06n+5XhEjC0H9PHxPbb6+uS4GmA83
	/0w0lDITs
X-Gm-Gg: AZFdTZe0KGC26j99Ey2brp4e5KMBIQBJycyMFZ6W5bNJXXm81kIsNynVz8wdxSmVmeL
	N+sa/LkGEbrpnOgyk8UIJxvDsfgXXHAQumA7ZhGsXjU13TIItSrLaBl75cx+6KhyAg1y1DnOVy3
	s0PEPDrn2WjqPp/Bi5PZPpf+aqn7OxQEhDgcaGEuuHoDgLg+XpNfPIKoaxM7/YwGYPmEHV8P6mA
	KtFR596dNJZ8/RM3G3ReyyR1G7OhTyjnkckpHhoetxLwbQjHJ5QJj8fAQMaE9pHgDRCYgl2TQXG
	71xdrmzN7BJ9cxvJMR3Qd8RR2D8rludm+xEdMkIgYUSWvyCmD7OZQU4XQCV4zANFd+jl9L8KnKS
	4zEuJwbAM4xUmdZHzU8ufsovJCujSsvnDb1UD6QiCIz2p3P9B6pR80Jl2oitQCCkM9eEBg3oIgC
	rMVfnTi82so1sOEkW9tcbkOQUflBuIIe6idjqEoYfxg/lF4FScojH86bmmfpwHiKQ4KxrW4/Oh1
	8ULUSM/bcFtZMqA1z89IPeBwslbdJaNpVlnlDEBRa6p0cgnZ1GxNxhF+b9YjYUI7NOnc8iShrJf
	kmOil9MM+RFGYAIm68v3w0sou0MqTNwH1/Kp1c6hxxfy9wDwxxNl84nXfNtQ5w3MECeH
X-Received: by 2002:a05:6402:1f84:b0:6ba:1f45:324b with SMTP id 4fb4d7f45d1cf-6ba37ed972amr2839354a12.40.1795197666246;
        Fri, 20 Nov 2026 10:01:06 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37120beesm1444867a12.36.2026.11.20.10.01.05
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:01:05 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso1445829a12.1
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:01:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEPUURxSit4HL/J+KLXR67elMV6xYLqyhNAYd9gUiomP/fdPAWbYXboBEcPKmK4d8frvZAcd2Cq1kSv@vger.kernel.org
X-Received: by 2002:a05:600c:530f:b0:4bb:680f:9a3 with SMTP id
 5b1f17b1804b1-4bb887e220emr85956855e9.2.1795197199813; Fri, 20 Nov 2026
 09:53:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-15-dianders@chromium.org> <CAFLszTjEczj5OYCV4sXuAHieg4rWZk7F24V-uME9Jvv--=9x0A@mail.gmail.com>
In-Reply-To: <CAFLszTjEczj5OYCV4sXuAHieg4rWZk7F24V-uME9Jvv--=9x0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 09:53:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WC+2qPD2vgsDfm5fVjEH+=YT6pSDqMyQ8Z++XWb9n0ug@mail.gmail.com>
X-Gm-Features: Aa3M54p6je0a5w9XNpmTKTy7gXFNUMhYRhpYs55-PBkGHvfL4DfTkPTkx_OnFMM
Message-ID: <CAD=FV=WC+2qPD2vgsDfm5fVjEH+=YT6pSDqMyQ8Z++XWb9n0ug@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] fdtfactor: Parallelize blob compression and decompression
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Fri, Nov 20, 2026 at 7:29 AM Simon Glass <sjg@chromium.org> wrote:
>
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -140,6 +141,32 @@ def compress_blob(raw_bytes, comp, filename=''):
> > +    if pool is not None:
> > +        return list(pool.map(lambda t: func(*t), tasks))
> > +    with concurrent.futures.ThreadPoolExecutor() as new_pool:
> > +        return list(new_pool.map(lambda t: func(*t), tasks))
>
> Is the shared pool worth it? Creating a ThreadPoolExecutor is cheap
> next to compressing even one blob, and factor_dtb_files() already
> relies on the pool being created here. If _map_blobs() always creates
> its own, the 'pool' argument can be dropped from
> _extract_fit_fdt_entries(), _strip_fit_unfactored_local_fixups() and
> _factor_fit_group(), and factor_fit() doesn't need to be re-indented.
> What do you think?

Makes sense. Creating a `ThreadPoolExecutor` inside `_map_blobs()` is
in the noise next to blob compression, and dropping `pool` keeps
`factor_fit()` and its helpers much cleaner. Done for v5.

> BTW the default is up to 32 workers, so with lz4 this can start up to
> 32 processes at once, regardless of any -j limit in the build that
> calls the tool. It would be worth a -j/--jobs option, perhaps as a
> follow-up.

Agreed, adding `-j`/`--jobs` (or jobserver integration) as a follow-up
sounds worthwhile.

> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1668,7 +1731,24 @@ def factor_dtb_files(args):
> > +    dtbs = [
> > +        ParsedDtb(
> > +            p,
> > +            comp=comp,
> > +            fdt=_open_fdt(raw, p),
> > +            uncompressed_size=len(raw),
> > +            compressed_size=len(fblob),
> > +        )
> > +        for p, fblob, raw in zip(input_dtb_paths, file_blobs, raw_blobs)
> > +    ]
>
> This was the last caller which relied on ParsedDtb reading and
> decompressing the file itself, so the 'if fdt is None' path in
> ParsedDtb.__init__() is now dead code. Please can you drop it, make
> 'fdt' a required argument and update the docstring?

Done for v5.

-Doug
