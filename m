Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188565;
	b=GqtyGVNmlZKNCY0+BtrM9ivmSVFyDoJaX/o4B9krOCaK9bNisXVhhJ/J+q3NCH+ojFXY
	 Q1QNEF0u+59ZeBZ2Bbm5T63RIYcIlNgl12tZqsdgu+zkT+tEOTs+bl6DLwcugZS5kgr03
	 8PadsfECp6xGXzUKsmCg62UMOchnjqLYO4t9CSaiSt6GY26ogRriYybnRStrjDIxKPV1i
	 FPKH3S6tSCGCIuJFiODp/18ZcGcehnNnkynTAQWAjB6ACrXR63NjS7ak//FgMs6aWnuso
	 l6a9QiwUjYhOVInzTw2VmxuzbclaKKjJDFW/YjEZ7WO9zAlVJPHOsyDEMDwT2F6Dv7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
	b=QgttY0vkLOe5Rzj/aBWTI4a3aYGXQ+YjbkegwrUdHT9vwIgC4C8ToYBVUgRqBs9g+sJZ
	 p+67zaVp4+EQPbKaBNZMW1AonO0KDeXPXrhRIN4rSOc+0PWYvpoe+7O4Y5ETRK8Szv5aE
	 JzDMhl286i851lgBMVTcT+StjJL9NbDqmErj9NQZBxMJnxWRDZ+Nnu+KYE3REFcpyQbL9
	 NCbG31de4TqT8gzcpVDdIKnQi8N79lMMTyOEn63KaadFCvD0oiDJpZeC1mRizxdBhV9If
	 cF1EFfhTjEB2E/WkGANplYhN6d0LtHNamPg8aOskUGbPEl03BejyoGRwvOMGmgxIo3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hCzH85BV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA53606A32C
	for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA53606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hCzH85BV
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso478332a12.2
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188564; cv=none;
        d=google.com; s=arc-20260327;
        b=B+318u7DGFHqRUnG4PdoCIsa9yxj5zJIDIAIT5ahkLMoUtYQD2XY9YuZ6UBQNaS4ha
         YFZ3JXDC/otLNQ39Xa+qARFs7pMB1yYFu93pyQZyVORs7LbHPZ9EhInjZaiX/P6URmbx
         pamlL1ycd2OCFQbeHpTLcftORS8iJGUt53NGWiyDD1gg0oxkeKOCox10Wtz6/X6KQhSs
         MSdEiRoe/hJwMwBAnKi5nZDRkm3fuD7baZ7VXXnkQw4HT0UYrixMw0nlK3IrQTdLJCiN
         5qBsThjf0V8xIihCqZOzaFnpxmX6TmPjCV0dYGmP0saHjppWZdfishYSJOu7e4aQcvHr
         LG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
        fh=oCTevKQCrqu/SGqArD/M9K37RRK1q5IJ2EtPxnqIHNw=;
        b=IgoqVlYFWlkwL6S774fYp9iA95L8w93VsX7ijGLh2xsC3gguoiO/H0UlWgFpP+fdtV
         HdKitRLfr1XPN7Q5m0+IRZmRho0ZuaPH2s+4XASevf0dRT5nkgBmJOsIaYclffT8Tf88
         p0KRm9jApIHcbLJq6bWX3EJAOwaIOszg9tuzC+EFiaL1JYiFOUVgUUE8qIMIBkOUss0l
         7kRrVzQ8fNbUv/h8mE8B70CNjhgX0fB6BW3H3GI4xYDhAzaiUc+V0liGhSmSm1PjUroH
         Sv3hGCoYvbcvMsot5hUKVrpdA6ecxIlTjBnOBQ17g2hxdTGAO5UBiKOa/t5FHUatP5fR
         /QZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188564; x=1795793364; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
        b=hCzH85BVPDhLO7lMrTvWeF/3llEmVxOgnazI38Q1Aw4R2uV++6lMSeDT86PyrWhCK/
         7FxiYQNuKkg5Szh+/Zun1ocRUKYdRdonyhbZq+3IcZvT0M3l6Wzoz6+FP4hdgW8NTCsJ
         fJLNAgsxfsNN8mM8MZeianG6lWMRzmh1BR2WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188564; x=1795793364;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
        b=Xi/rT0I/AjlNBs5fmUlg//oJMXrgd0kH1j6N74r73ogFJ24qtCpmjENW1X/57/XyM6
         Qmu9QTAKGCVUd1KXOugpEtQEg0T4fascpnkaMkSWhyEwzNWPFTVO83yWZRfAi3dWbPif
         UF1Uoac+qnY/3if8DNDKSQKxpKemx3Jo1xe8aB9KadFRNYIMk43YMqFrcfaKNaWLE7xX
         kA2iuHZ0lMTrIbyEUusmU8mMlAaacNPOcvgDt17fgkFZBCV4Vd0vLYYzyhF5ym7G/Sz7
         wdz0pDGFQVORdiBpZdS1ruRK434t+2ETDdw96fXv2msefWZ/6wDB3lsXfS8syCV3O0q+
         TagA==
X-Forwarded-Encrypted: i=1; AL+hErEt0EoUsCMLaKp0YLFTNLfFKjA5s5CTq6NwNtD4n/QKphuF2Sx0nPw2qGBixD0dLm+/EvdiUDhGM7Hh@vger.kernel.org
X-Gm-Message-State: APuU4Z+ktNzIjI2fuent8wmoF01CDftiw400XGRSHMCx4FJd12Ydsdk1
	N08QQcENG3pBkVvyfmuLW5PmUbqS9iULB6EsOpesVoRgGTNKf++O+u0VggEW2tB4QoDBAAA7qVl
	lY8+giwrAJOh9pZ1O+s45D63hSK4eZadSmMBsZ8wVN2QaIwkKrKsbiA==
X-Gm-Gg: AYBFou1CSGyJ9WrhUFfO9dq5KhQqEtGfSnfEFY4Xvi14TbsglMwJjoM0LyKFnfmg0xS
	NiQG/1gdqRs/27T+ZwLbEDW+y183MG+oS5SoRFnm0zdVzVKyeIlkGxLfhrkOOlapfFfmRF64y/x
	fVSxnu7jjytVqhDA4yzNjsETOY+xP+uLUVctOJgvIsWwWP8yGBuWxe4seueAgl6OzFxFlnnVOmC
	y1SpAm5OGKhMEWtaNGB4ickal729spcLcX99WSzs/PHZrUOpUOPG4tKJIh2jYkf80q7tXw0h+Ng
	KlpfIGmrvXQ2rKkU+apgp7KhAJsctJCCRZkltLeJBeO1pz17U9c05OKBXC5rf6oZ2Jqm4eq1P7y
	bHnVx3eh6OjyrZWOQ47uwv++3/nPrvn6nay4WQ8rWYkhX3uYWsUkySh51nKaO65BupJSwHe9Oo1
	Vd7M9kpnEzjeMDmm0N
X-Received: by 2002:a05:6a20:3d07:b0:3e1:89d6:ba1 with SMTP id
 adf61e73a8af0-401493a748cmr4551292637.3.1795188563880; Fri, 20 Nov 2026
 07:29:23 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 07:29:21 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 09:29:04 -0600
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261116205320.1621386-15-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-15-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 07:29:21 -0800
X-Gm-Features: AclHuK9eiK6dJA-hmCi_yTft6UpmFh3_W8w1gc2pLqne4iXEAqPidl99ghlI8xc
Message-ID: <CAFLszTjEczj5OYCV4sXuAHieg4rWZk7F24V-uME9Jvv--=9x0A@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] fdtfactor: Parallelize blob compression and decompression
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Douglas,

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
>
> Because Python's `zlib` and `_lzma` C extensions and `subprocess.run()`
> for `lz4` all release the GIL, add a small `_map_blobs()` helper using
> `concurrent.futures.ThreadPoolExecutor` to decompress input blobs and
> compress output base/overlay blobs across worker threads in
> deterministic input order whenever multiple compressed blobs are
> processed.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  fdtfactor | 190 +++++++++++++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 138 insertions(+), 52 deletions(-)

> diff --git a/fdtfactor b/fdtfactor
> @@ -140,6 +141,32 @@ def compress_blob(raw_bytes, comp, filename=''):
> +    if pool is not None:
> +        return list(pool.map(lambda t: func(*t), tasks))
> +    with concurrent.futures.ThreadPoolExecutor() as new_pool:
> +        return list(new_pool.map(lambda t: func(*t), tasks))

Is the shared pool worth it? Creating a ThreadPoolExecutor is cheap
next to compressing even one blob, and factor_dtb_files() already
relies on the pool being created here. If _map_blobs() always creates
its own, the 'pool' argument can be dropped from
_extract_fit_fdt_entries(), _strip_fit_unfactored_local_fixups() and
_factor_fit_group(), and factor_fit() doesn't need to be re-indented.
What do you think?

BTW the default is up to 32 workers, so with lz4 this can start up to
32 processes at once, regardless of any -j limit in the build that
calls the tool. It would be worth a -j/--jobs option, perhaps as a
follow-up.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1668,7 +1731,24 @@ def factor_dtb_files(args):
> +    dtbs = [
> +        ParsedDtb(
> +            p,
> +            comp=comp,
> +            fdt=_open_fdt(raw, p),
> +            uncompressed_size=len(raw),
> +            compressed_size=len(fblob),
> +        )
> +        for p, fblob, raw in zip(input_dtb_paths, file_blobs, raw_blobs)
> +    ]

This was the last caller which relied on ParsedDtb reading and
decompressing the file itself, so the 'if fdt is None' path in
ParsedDtb.__init__() is now dead code. Please can you drop it, make
'fdt' a required argument and update the docstring?

Regards,
Simon
