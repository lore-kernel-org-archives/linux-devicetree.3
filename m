Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA68358360
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441135; cv=pass; b=LBnH/LyewmR+HZ3gwM209M1BrVh42r/4xZiCMX7fyAK56xyB7dL3bzhecdp8nokiNEwjvFKsm9zvgedvVcRUwjykKGfixDi/pUXDbSsTWilH98659Vk0Cx+QpDyvNpCx/dcXyb7/KlODjD4tivhZeMOSKmffpc9Idry7FpRLFP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441135; c=relaxed/simple;
	bh=9fWngggRHUt2YHzjxI5dq9V/JcDiDGrp44XsCU9rAHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVU9xGTFqv65eIXT7st4hlfqWBfjLFbSq1KLBDb3Zf21K6VsDpbN1vBdmYeUSPMBA/ns0pDz7RxOyH588QQB5xLFvAocjT5TiF4uroJoc1k59YBeg5nMobrcBULlh18H2imPIKJm4MoP6X0hbWEZkn1g7BvsT/VxEdKb5ZE6KkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6v81xj4; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6v81xj4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so4368221f8f.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779441131; cv=none;
        d=google.com; s=arc-20240605;
        b=Fqak3+9Uj88LOX9uIjQQ6FmwD0YgeZgFZHGMsIgdRSOv0c6YkE+6xt01KiYiue0eU8
         DyXSa213dsiX3qyAVImKYUC4CHjjwsx6tNpC8imK1i7g6YIJrjDllIXzgU37O3nryv/l
         S6MppyBCTiTPvb2tEM7gA1LofvJqhe0tFY6JOyDtWz5GCeHborL3xCVdf3VTCjGn/oer
         EsWWX6P/TXsm/b5SOUaR9Fwg/DlYHXY+Evc6R15GjBgMU15RNGhSzrRej5xlJUtLAsYg
         cjyjD3232Qv2vllN7Ykzzk0Z+T/gjLJQOxX/v6CMC7Q97LZe/tskCmQ+2zZu5HscyEjz
         4xNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cKkfdRdaKUbeh839fBeoPlWaGdp8dPg/AM/2Vj5ukbc=;
        fh=YKdudSoOubCEgd0fwpQsNBdRy4cr1tEG7SipwVSRPbU=;
        b=PpIA9g1aghs6peF/aQWW0TEIhvQXwafqAn6bBl5FM6SZaLm55XPsweapVGqcDa3Swb
         yg0NKznx5djdrZYQ9dK5k2bxVcPwbu3qZrLtqWhBp+q8X55eB5KzdfT0DVsMgIFHywbL
         lmJgtl9sLkU20+NoR755S2OLetfbnxhaA/d/7z9sN6fjFKP/yC9Fs6KrBkDoC1G+Q8dk
         wFrQPwkinCBbpx4Gwfb7oWg8HkwHSpl/lhOMTb/Wqa/ntmLCIu2YfWgWD0u5y+crVz23
         9Ld7hJREdtztybhu4Tan7pcnh01ysBt39kZuGh/WnZAXHL2yTAzFpT8j0CY5GpN6+qq5
         4PvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779441131; x=1780045931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cKkfdRdaKUbeh839fBeoPlWaGdp8dPg/AM/2Vj5ukbc=;
        b=s6v81xj45pYgS3m2ZFofgtQBkdbKjH53mgmbDwIJO9icTPOvQp5vlVqAfblTslV2HM
         H0eptmbDIKpP5Uyp57jSpMrrIeNJ58A9K4EMA0U2LFO+VJ6cizgvy+QJFIcKF16RiCTC
         wtBfYGSy8zirWrVVkt/YyLXhANF01L1v9gvejxOv4lVko19BZrmhVfjrxLqCWUZ8ujNd
         a/ZyOCP/fEH3czPldfHJPun4H61RRZzLDKDO+Hzt0h5ET4BsxLXKR5GLOEdpZSARzNKM
         hYYHynSRNfpPNtQWAgLQYlHv9IQ8jv4GGuu24zl32yA+3ejixwh0isBCoyoWwTkPMb5d
         o51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441131; x=1780045931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKkfdRdaKUbeh839fBeoPlWaGdp8dPg/AM/2Vj5ukbc=;
        b=pFa4KtNK2DSTobS3c+GYKVGdrtGuHHS5U7IGpzhRQ3TYCnWYitC+3w3fY9zIbbtdOW
         3rDAi4UBSs7XDaN1teCSt/xv7scT2zMQYDXwtPLhqt34HmWcjVe1r4G/wD39/gCKY3lw
         PPTQ/MmrlYFq6QV6fZkunTAMT1a+NsAhNUBzmzK6ARdvr4E0EnaCUyXF4z5a16szxrcd
         44cR2bWkgsBO1KtsXQS3X0cljU7POW3J+z0ywSQ9T7rglj5Qf85C77z4oH4TCOs/FLXi
         UwRipRQfxjr5l+Gjh62EcKnoYAiegpHwgra/8TM8W/4S1apblgIMLLqEOygPVvZ+tFqH
         K31g==
X-Forwarded-Encrypted: i=1; AFNElJ/isTV4VL/PINg6htanVH1s2EaZDKTlnUxMVT/JTQfgv+hkIXpyvhhfdEXGle7aZXmTDD/NS2NzJUIx@vger.kernel.org
X-Gm-Message-State: AOJu0YxDIggVdTnegX8s86kXU3I94mkOoST6p2IA5T2r/ERG/IgUxhQs
	oiFPxaujyDkzi2ssm8xqRQ++nHPGN+YH5bOo4Iv1p2Q9rsGxl7bcsnpPPkdL2agVjEtPSJWOFMA
	AAKsdtW8Ppa/XsjWpIOl1De++s88RxUA=
X-Gm-Gg: Acq92OFKxf9vSszxNSMI7FpF0T4wGdpT/oPLLkdY6yFclAfE5GwCA6PtiuQVzYehWOQ
	xYXmnQImogyajkLkzpevdD007sskjBeOlxlTlfcSy+Y5KDjuV9zA/OTFZoSYEbe0qSNhr68X0Ef
	bxGHcUkFSHqO7Vj6LrJQCDfmrsxHC/Qk6a2u2+zCvF0RrT7SfvPYIsOnb9pXAB1qLsxAyGv+/07
	fU6fPU7ifjOJwVdSEgeE8V8tTeLzKKO2xhsJ1gf2HI0HxjVfyvN5PckLkmsC6PtDDlEUVKwRG94
	ikiaTVrsTmx43R02hL4K6gA/Oqq0Z0eI/6ZhS2Nq3wxniEl1RkooHnEK/3+JRdGiXIFp1UVxVfE
	0aNdA52Kw5VIXRnKqn3kb+m2CNUurtuyMbRWfRtCw3FHls+TjkFmAlA50C1AdPg6VOYopHaQLZ7
	+vUKPBTA==
X-Received: by 2002:a05:6000:41f6:b0:45e:6518:3299 with SMTP id
 ffacd0b85a97d-45eb38a84c9mr3475115f8f.5.1779441130829; Fri, 22 May 2026
 02:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521164323.770626-1-liviu.stan@analog.com> <20260521164323.770626-2-liviu.stan@analog.com>
In-Reply-To: <20260521164323.770626-2-liviu.stan@analog.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 22 May 2026 11:11:59 +0200
X-Gm-Features: AVHnY4JVZQLZMPg8HkwWJ5xWtqLlMUlA1CXMw-hpC-90Gaz8cVJ0XRdpkGJH-y0
Message-ID: <CALoEA-xwm4bM+qp0jHu6SxcBz98y9v4jvdiJMdWWADSJBUdy=w@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] iio: temperature: ltc2983: Fix macro
 parenthesization and rename
To: Liviu Stan <liviu.stan@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Francesco Lavra <flavra@baylibre.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@analog.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 19:19, Liviu Stan <liviu.stan@analog.com> wrote:
>
> Wrap the 'chan' parameter in LTC2983_CHAN_START_ADDR() and
> LTC2983_CHAN_RES_ADDR() with parentheses to prevent potential
> macro argument expansion issues. Also rename LTC2983_CHAN_START_ADDR
> to LTC2983_CHAN_ASSIGN_ADDR and LTC2983_CHAN_RES_ADDR to
> LTC2983_RESULT_ADDR, to better reflect the datasheet names and avoid
> them being confused as related.
>
> Signed-off-by: Liviu Stan <liviu.stan@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
