Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805265;
	b=qtHWtdaz45Dhnrz3sFKBBFRC/5yzT7I6ePha0olm21zAmefMXuYROwTGUG7kKhmv+wmE
	 hht5iATZoS5Lk5OhAgA6CAExpWftPZpbIPJKNr+tUtpwNcVT6Nkkxq3UV4+Pk7XIZNzzB
	 XwLKWi3JVrjyehEe6y5MD7wanlOaO2DXI3YOkvSyah6T/u6oFRucqm2wQskaMXzDh7t51
	 BWw8+yqPNwEF8JPaVJmHr04tVkWlRvuNyO5fPlP+RWyJ4CWhIeXGpiymLOSz/1dKttY4Y
	 WYqURf6P1KGI3X8M2Kl0qQq/xVX0Ks26zM18ALFVqG1lNJ4cQGbIomv+hMEvVTEpO+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
	b=baHTk3Rn8EFARulnURtQe7whLwCVrlcoofslWuWsqEm7q2DOzGeKdGP6UoYpntio2BPN
	 Xlc8ZOd8G8Iz9u7i6yT3Yuy0EcvGNfMU2ygkh1FN7zX7i0CsVGaUilcW+KmQ5rECYuXAm
	 ZrwqzzTIuPyZebG/e/1+JmKZdauj+QNCdF6P47nZerbpBU3723TPa3Q1KdNexv/mS/tIZ
	 UcqmXxuDQwNgoykcOlK8M9RBKbQK31y+Zp2JaL2GkoXmk/Z+73XMi69TdZsmbdpbInaaH
	 4giIw6QNwRjbf+0YMZp5qanE45SitKgHX/ZC3pgfwE5whXreejDJhecyUoEPfR/FFNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jIyQGiA3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB599606A32C
	for <Devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB599606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jIyQGiA3
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so935353a12.0
        for <Devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805263; cv=none;
        d=google.com; s=arc-20260327;
        b=PQ3PTzXUxm5RZLS6rN2w0Q6+acn8i8yrR9DeViz8hOOqwDsbzdR7HpJi+FX57kdrfk
         Hsz/rAstxTuHphYMT838ykzr9ujg1mdmvI0r4KbDXit45An1ATNzISdS740qsZPdtdtw
         QvqDM0PfP8pV9Du1UouVoe8ZipLKp8KCmJvWYpTDTImQZXWTkQyH1uUEzbbGu6FtlmHk
         TS6q3ZkpEZv/N8CiQ8YD1Tg8BVsfupS9zkyFNsyeNGDGsBQiTQchGDyyZVvPPV1dHjPf
         XUXqlBD+JM6zFfPVQzRqMnxemsYMTdJoedzpuePRIUHThj9FfglBb7xMzqjJd3iuNvVt
         m8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
        fh=rgJyXdnCwqdjRDI6gvDg1jrcM9wPkXxVq5UPR7qCJyE=;
        b=aqhl/lhV0rrYgenI/ct+3Qc3pU3+QVua4ZsKuf18gakUlvhwI+LKfeyaU3KEgPd6kl
         niFPmjoGn7a+8NvRprO6HLi6wNpkCGrjGTRi4aFttlP7ONHRmNDnjKpKmrV8T88ViEhE
         AOBxLuhjTjC11AM2mY4ZxaN6pJ5gfs6Z7RWhSgqwtOQ6VzE7IFgaCyXVIJ9o6lQNpDEr
         xWaWNpL2ZQIGYXVeTiCTeRseaPqA6TT/QuE4ze4muMtVyxu2GY6khaVWb8vPr02XZY1O
         Pi8vpldJfbRNKSQiq93oGCjoB0cuxtZb5YKMi9MbSzFuVon5i4jO/mjRhfblUKjQvFGl
         3GFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805263; x=1794410063; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
        b=jIyQGiA30ggNY/gePK9uAOpdjZdjmmpf2PywAnfTbXxFbYkCteIj7r2oPuvoZxleFF
         ZO+tsaqgMRQlICWQVBxB8SH6FvY0uij7Eaq7FEtjjhp/CQrmlpsj05TdfwqvyPNIdleK
         5c2qtd2XkN51j3OvcGjx+HEh73YxAytA0K8mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805263; x=1794410063;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
        b=niNgcKA7xh9kOkiXAtCuz+SkHG+iEL7mfZO0Fih9dSx0kedJpg7ZaU4GalteEhebSM
         9NYpuPJaZwUzhR45+/iFvX16UyVU10nS2KXkSEXKZhaZhHihD/8s40sxvV92HAbLxKR3
         rKRnVHZkqqvtbWwqsYEDJ7MdTLuGOpXrpQawYu4y9uRsg7lsliYxGF6jFWKPBwmXnw0X
         ZJzppCU5b1clWVVsHwN8SuT7lONS67+Hi7QTFuftt/ngVTK0P/B6W68Ect3t6hZpSNZa
         kMVn37CZZgxd6YZhnlpyAu7u0INEt4AZu7TTC7pMuECbRGEinza1A/GWl2qK7kkJ5WNQ
         lr8g==
X-Forwarded-Encrypted: i=1; AKwUvBwN6HjgQG23yzWwEouS4lWrvdlK1J4kRs8bdMEL2TUhvAttk9aQ64hBDoTP3nS19NvbtzJ4N2LubX4k@vger.kernel.org
X-Gm-Message-State: APuU4Z/aQfuGidsNnVck7eNdwHiLL42qRFw+sEzQCFnwlOa9Ruoo4m/J
	siN9zldQjPUFUBlNHkiDzF2Uo3gRgfvF+T73aigbjikhSLZnnuAolE8+MUKLg+Xd7xK5lURGEcL
	TDwhbi8FkySupLkXtvsRDY/8YaGb02UwAEGvBMSfvfaWPJu9hAVJqaw==
X-Gm-Gg: AYBFou18geojJ6TPBz1cD3++xovkhVxv68/aI8dQSPaI3UwTd5sQh27d+inhWy6HtSR
	G+B7W0f8cOhOSmxswf/WnPLY3fBKTo/z5XIfcY+DlLCTvq65SdKYsB3YOBuEsckVViWny9I37Dv
	b74nmtTL9ULZt4ypT/DlyOWCeZg46rxdAz84qze3129YR7rEd0IxWDmLr8mfrUwHL21Q9y1Zmme
	3232H/evL2Y88Z65jixihKAMIFzjD3+x6SOup+h31duhPo/7uvkBAMcuLLM6OeRBggq9QFWuFOk
	taRQEyZ25GY5fv4ecqrdU0Rg55NCNpuaG/zV5zBeX53/9Wjt1JzFe/80z6FUj8gaonwLj7z2EJ8
	nIYSuWmnjPgCJUhlP/2Z8EMKJ//z2c0oqS+8JcK6tKrI2s3E88r1gl95iwDwH3oZAngYXsEg=
X-Received: by 2002:a05:6402:a6d3:10b0:6b1:e072:763b with SMTP id
 4fb4d7f45d1cf-6b4b0b821f0mr10620274a12.5.1793805263475; Wed, 04 Nov 2026
 07:14:23 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:20 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Nov 2026 06:16:54 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-14-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-14-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:20 -0800
X-Gm-Features: AclHuK8NWGTzSKUvVKtQyz5aMNFmdu9T2RyI_tRUYr7JqriTGegWmwNChaR-jTk
Message-ID: <CAFLszTjBv_oQ_hPY=rzwuiP3sZTHPzBGoo1zcBgktxYO8Va1jw@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] fdtfactor: Add -S/--strip-local-fixups option
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add -S/--strip-local-fixups option
>
> By default, `fdtfactor` preserves `/__local_fixups__` on `base.dtb` so
> that when `fdt_overlay_apply()` merges a `.dtbo` overlay, the
> reconstructed device tree retains full `/__local_fixups__` information
> (for instance, if an OS kernel wants to know which property cells
> contain phandles at runtime).
>
> When `-L` was passed to `dtc` solely to help `fdtfactor` locate phandle
> cells at build time and `/__local_fixups__` is not needed at runtime,
> retaining `/__local_fixups__` in `base.dtb` wastes space.
>
> Add `-S` / `--strip-local-fixups` to omit `/__local_fixups__` from
> `base.dtb` (and therefore from the merged device trees produced by
> `fdt_overlay_apply()`). On a set of 47 Qualcomm SC7180 Trogdor
> Chromebook board DTBs, `fdtfactor` without `-S` reduces total
> uncompressed size from 7.69 MB to 932 KB (88.2% savings), while
> `fdtfactor -S` reduces it to 634 KB (91.8% savings, saving an additional
> 298 KB by omitting `/__local_fixups__` from `base.dtb`).
>
> Add a test case in `tests/run_tests.sh` verifying that `fdtfactor -S`
> followed by `fdtoverlay` reproduces DTBs compiled with `-@` (without
> `-L`) via `dtbs_equal_unordered`.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  README.md          |  9 +++++++++
>  fdtfactor          | 34 ++++++++++++++++++++++++++--------
>  tests/run_tests.sh | 18 ++++++++++++++++++
>  3 files changed, 53 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
