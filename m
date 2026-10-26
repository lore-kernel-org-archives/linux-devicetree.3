Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024296;
	b=3Zh00KRBb2AqRmdH8B1QCghiWlDHaM2014q/8y4S8Jsy/FChJOcTqrWP5VLF4tIdUQ/g
	 M2OegUiqtvxXVnS4ts9cXrk6soQ9tQNVjKV44XBGzh2nWjuhTH9IxZWC3Ba9HIfbZXYly
	 Ns2U9NEjv4gsT5ZAjpWzPs2WWUpM6X19MEqOJff0Ad3w8vVHGQkjkMK8w9ZjvILhEZFTJ
	 0Qh5aC3XavXGE54ZHzF1Hq0zE3udW7/U/LatwWniV34niKJgguKYW738mrsC64JK/s5GY
	 dljgl/0RMKK1Tur4MkilJ98KZQoYERfKPUSogo1W2XdfmNxT0SOp6XwdatBlbIDG+rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ifM+PXldux5sH2cm3CGnH/RRo/Iq9tlkwFAZTBnx4+Q=;
	b=b0Y2PuAqFW65dfWx41fzZlvI3ZvUgbloKS9O8JzhcYAyfJUrR2wti7lcLKK5pW8hb2c+
	 rDHLYS4cKqHnoMkTe9M27MwJdfEPW6sI2y/Hz/fXzOev9atgiqUFqm4uuekbjWs8VcXag
	 fjx3zUE3nDncOGDYlTcIZ7keoV/Pj2L8Q/+IS3U3Srhw+0hyVkqBU/eKfesrbeQ+CA0iC
	 Ic+1lPbD4e4HBw+ar7W0cEZhSBAXo+v2jwiHaT+gj0ltaBa+CF1CVkKg8704qsXWvoR/w
	 Fj+OmnqTkTvpqySyyZ/qJ0JVNkHBwCgnQV3iVexGFezSvFz+rd725sz8VFa9wupCrjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=arAe2ryG;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7504606A324
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7504606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=arAe2ryG
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so19845315e9.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793024294; x=1793629094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifM+PXldux5sH2cm3CGnH/RRo/Iq9tlkwFAZTBnx4+Q=;
        b=arAe2ryGITQNaEOL6zbSb3LMwQmpaYIjaYHVlzJt+RwVkXz+ibO9s+qLO7YT1Dexse
         wjEb/ve7fTopNBXX3YVni2GCZ+uWleeRmGhQOxUpH0OpM9W+4VuvjPijH+D66GQeaCKl
         trLGCt7AqToC4FKcJ5oXvR4QIrkTuGShxtajFOcIIVcNVL0KlAw3RsgRa20lHE7EMgA+
         pDpSpHcxEMQvzDhCfFJDZ5IP45budIblqKHrLqt9Fj8lrT/GY0hw7SfxT1pBYhc+6BRk
         wZ1KYLk53bpOQLyS3knUrpi7z2H9z66bVOjWZg97H07dhGu531lOyOGQ571VIaKoWRSY
         ImOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024294; x=1793629094;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifM+PXldux5sH2cm3CGnH/RRo/Iq9tlkwFAZTBnx4+Q=;
        b=UPOMfNYr8YSpwin1fB9ocziRFr498uAnon7+pv4C6Ehv6YhObdSbb/UMTHUfOjHNkT
         GgfvmDfozusItw1Lq/su01YTegU/QF77fmTKe1nGz0KsFcrk93NXD0GpwfX/IZL5HHt5
         iwKpjSW8hGPBu4TsulLwOT6FDxhcYAbRyGq3sL01fgFVz8HQcfl4/ye30Q2OXeb/uNvb
         pjCb0QYoJMuTyeEdt/3TCtXZfy8Otk9l9aNXsEAYmV6HssqDL1niE/l/Pl2RzWNPljFI
         nfyCO5Y8Og3Cjq/IY5NRDvvrCz417kwcb+bkIpkdWF92UmWIvREjuoGddJc0lNi038LR
         licg==
X-Forwarded-Encrypted: i=1; AKwUvBxAwQ7fss2teVlqvZNN+D6zC9FhiC+juWiJrGueoZ2eyJhLbhUrVlFrynA9qZIO9DBUhg/s+vi+9ihK@vger.kernel.org
X-Gm-Message-State: AFq9FYItqCqUeVsT7FKLufbHTwpkJFPnWuXFct898xrjp0rwGCGHvHRP
	lZkFWq78jVDXsCGxOrZNGAzhv+qB/1zc/Ezz2xZ61sCXs+ddJJ7Avgu3
X-Gm-Gg: AYBFou2CcIVN0LyPkqAczspkri8tZIEHjQqZoWHSsXDFadhFyPCNIfL7+lutVwlXqj3
	f9kPW1lsFH1Yw2KugItoGBxT9/tOa+fWpoIWjwi9m30TpCxdttYdgxJGVgr2+6daHGqnh/ssaZq
	UoWmKHaaD8ndSPchSxA3Yo+65HUENKDFpSqVXWXs7FaSoi1PQ8RmO16Z5pYxo5OKLT7U3iEzkha
	y8CeQQigdD75RLUH6+0BpwMlHOzhjiHqpCAW9WasY6P+cbsNowWEuxVZyGR+WKHIp21Dx3ySLKe
	wrBAfafIrn+VqdUS9WEkpRaHn6R/KSHOFRCYM6apRRkMHfL35y24ql2trsglq1L9C+0hCZctQua
	O4cUKoWjtLo9tN5H7PR4JUTJNh29sOZat8usCC+wgMHQ58VpovuUFMbDyi0tHhII2qhqydDjxFk
	2UGdaPCp2ic02RH8krUnIHf2IX0NGlAZ9nsAdOHma/pHtmKvwlzWGYmA//mRmnO7JM3MpG/EDhX
	kpY0IKQ7xAQUJyeAs5s3p1MsS12iFO8ffDSYBBX9SfjeojLq9NCesTckXnS53ttcd1oMgtmu60X
	du06Eg5x+HITHbqS8NGQM0g5RDw7NVqdxBRQvYOsQO5cT9ZsBEVCP1j9X1AUaw5BZN0p2gSZRhi
	mk52ODAxvStwd8tG+ymDZxKnXhp/Y1DOohYjA9QJkJ8yAVkp4qPaLduKM0aTGzF6clkYcKCjk1d
	mqIk15L5gJZ7GwCQpJU66TzDoOD3nO5bLYTGthDgUF32V0EUZoGPNfbGENkCYIOBNgKgbRcggOo
	r1d3tEZlXI=
X-Received: by 2002:a05:600c:a318:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4a35aee2cfdmr95663085e9.31.1793024293964;
        Mon, 26 Oct 2026 07:18:13 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm246428935e9.13.2026.10.26.07.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:18:13 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:18:11 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Message-ID: <20261026151811.00002233@gmail.com>
In-Reply-To: <20261026-hungry-masked-anaconda-7fadb6@quoll>
References: <20261024041357.34346-1-olivier@mgcrea.io>
	<20261024083809.000026e5@gmail.com>
	<20261026-hungry-masked-anaconda-7fadb6@quoll>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 11:50:44 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Sat, Oct 24, 2026 at 08:38:09AM +0200, Joshua Crofts wrote:
> > On Sat, 24 Oct 2026 06:13:56 +0200
> > Olivier Louvignes <olivier@mgcrea.io> wrote:
> >   
> > > The X1600's SAR ADC has four auxiliary channels and none of the
> > > touchscreen or battery engines of the JZ47xx ADCs in
> > > ingenic,adc.yaml, so it gets a binding of its own.
> > > 
> > > Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> > > ---  
> > 
> > Please use a cover letter when submitting a patch series.  
> 
> It's fine for two patch series. Please do not make it more difficult,
> than necessary.

I'm not trying to make it difficult. The cover is usually a good place
where to describe your motivations for a new driver, plus with a cover
it's easier to pull via b4 and Sashiko will treat the two patches as
part of one series, not separately.

-- 
Kind regards,
Joshua Crofts
