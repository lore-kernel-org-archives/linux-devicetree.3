Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179C44BD363
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006794; cv=none; b=O+Zj04mRWbrqSnzK695klw5WccMtnou1Rjs+zoxbu9sHez+7EhcOfeOAzKhdO6gJ/QD4/DtL44l9q+I87dPi0zUbDiud6U9+JBbRFDBShz7UU0mKpPh5AHzPdxg6HgVsuurx5W/sOQQsXxI06JZ8JWg6bUTXqS7CjqlZK0EB0ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006794; c=relaxed/simple;
	bh=UOTeQSx76a9v/ZV3YujOIEiYlAr7+SRsnm3/O5Z68jU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LHRj5271k2xtjOOFjQ9J+JZkeEFLGTPhnunUkPkc9704gx9iL3tAtjevNtjGGnQOu1nXiPJyBJFvOgJmCRsixbXnNc3qqJCQJkjnRDWL5mQrCKy8UI9ki6aJXRuWqGe45+xtZHuxVHtlpqX/WlSwgSwNEaCf7rWiG5uACw/gSew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jNIPkims; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jNIPkims"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso3784349b3a.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790006791; x=1790611591; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOTeQSx76a9v/ZV3YujOIEiYlAr7+SRsnm3/O5Z68jU=;
        b=jNIPkimsgzwGeAPw1T5J0ZZWbbWbvmf9gqRj40Y/atoUYgKG2yWh3HESwt6126nUDp
         FD+Rmk79KRReyBBYIl4nF0UXejvRBciVXLpQ0x0P4HGhci5O8iuKBzqiPsMrmLMZpiFB
         lTbphc8C5mH2TgoQvoSliu53nlAZUPM7gnPf6JVk1XoAUGXqWGbf8eYG4gdjGZ8Be6kE
         0hW1vjiNk54/tiLuCoDH+rB/8p0unN4PncOQIY7I8fOQderqwGHSfRx+8mIky9QBPvd4
         jWCVCSqDpodMotBD1r5UZ3EgftUBugTYiLbiO0CekAfIDwDxZ7IOPCqLCaPurh0VfluR
         DhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006791; x=1790611591;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UOTeQSx76a9v/ZV3YujOIEiYlAr7+SRsnm3/O5Z68jU=;
        b=zSkzF0lzWZNIqrL0Q1HSdPwyPlc02p3pibP9utc7icoIlaiaPQnZ1cYbsVoBXwpJLA
         u9zvV7/pgR5y4tB1j2DrmKDmshuCvflOC0LBrdOcjG+v/geqAXszte0CkJ+bepumzB4p
         dyil27GTF8fUs1IpU25nWd9I0QvZ+L0/4AGlSgeSflb+A+tvCFUobOeWACB2kYaqKExJ
         u0CKUPN3WPKO8Ck/SdPFkjMU0p2h7piiiauczqb3bqhHQivmqXJOxHtXvN8rUbSQjJLX
         D8tFVepm2fTr6MEEvNc58w5jG52S4sCCrNCReECRpNEKVFMOfJPI51SB9TTTxt3MUP0u
         n3AA==
X-Forwarded-Encrypted: i=1; AKwUvBy6MYaqUw42Z502XVdD6CpNUiRPM+HCfWVtEVdhCi4GHYdn/LWglgBs4dTRgJ29vcE+0qFsh3ALnX+U@vger.kernel.org
X-Gm-Message-State: AFuF++mu/cfMNw1jfjh1oOyCJ516FF3jcGqc5i9Bsl9U/AUsS3JMCfNq
	cIxZTUUZlfftUuBIzg5ohlRT8deQLCj4wkBdJXLGD8xaEMh1R3d1aJnOQyPtRN5Ua50=
X-Gm-Gg: AYBFou1nI09mxS4KFUzvls4QhXIOfF9h8dhJXXKJ7S878G9Lfz49S8MeWMgBs8vWVSY
	LpYwF4dsWju1bWhgYwH4oaspUdTFLlimNSKYu1zhNeYjkLaT92Nrlx5ILOVDyCQCcBzxHCcQMvA
	DvyWhooB/ZOQPxANADeQnjF8fiR5Uo1uSbRzA69+PrMZMJuRtx5+VqlLpsK6vcjrLRfd3vAq762
	Jrlfg+wCnHBxHNVqBXvGnoQ2Sp1t8GUcSTlt9beaKaNQxH2RHVCU1mJpX1YhyRTZdR0Pfg4kdft
	5PSJ0q+CqMmuOPOsG0dNP6LzUM972dd2f1LTgYnYuro3Ama0zkeVZCOHQ1L2nq1caNwYEf1sKjm
	wXMmcHKrgS61D+8xA5FTI3A2ragpgHnuhiOcP+uJ7JctO0G8M1Gg712DQA2AONtl2Ntmn/KtVUl
	NWN1h3HB2lJL8wZer1r9XnVPsv7nSDniEpmTgcp5d9QynbhmUb+2s1FZ+dyWGKBAHcDgU=
X-Received: by 2002:a05:6a00:ac8:b0:878:34d7:6a30 with SMTP id d2e1a72fcca58-87834d76f20mr8319100b3a.36.1790006791257;
        Mon, 21 Sep 2026 09:06:31 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-877a95f915csm3487490b3a.29.2026.09.21.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:06:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>, Andreas Kemnade <andreas@kemnade.info>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Paul
 Walmsley <paul@pwsan.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Helge
 Deller <deller@gmx.de>, Tero Kristo <kristo@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Aaro
 Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH v2 06/14] ARM: omap2: remove omap24xx support
In-Reply-To: <20260914140821.1805449-7-arnd@kernel.org>
References: <20260914140821.1805449-1-arnd@kernel.org>
 <20260914140821.1805449-7-arnd@kernel.org>
Date: Mon, 21 Sep 2026 09:06:30 -0700
Message-ID: <7htsnid1x5.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The omap24xx SoC platform was used in the Nokia N800 and N810 tablets
> released on 2007 and was among the first ARMv6 CPUs in products that
> made it into products.
>
> Unfortunately the early ARM1136r0 CPU cores had a number of quirks that
> caused a disproportionate amount of work to keep them compatible with
> later ARMv6K/v7/v8 implementations.
>
> Drop the support for this SoC in order to allow removing ARM1136r0.
>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Paul Walmsley <paul@pwsan.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-clk@vger.kernel.org
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de> # omapfb
> Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Kevin Hilman <khilman@baylibre.com>
