Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794869477;
	b=AxpctawvQNK+EOu9jWxXRVXYZtQfMDSqzz578srVeACuveUP7ZU0kLSHUrW+5RK7x/bM
	 UC+WcRCnwpNeDXiISLyoTa8qut+MQFIvdkApyQKoV3lcUaBMviNiAsSk8K4qXKg/pbM6f
	 yRQINteqMqEZQ6WSB0P+jMNz6CrXiWglyDlfjp6n3xIueNRkBoY8JeTzBoA2mrNx9Z+w/
	 PwagNvFIihXdleQMBP5el8ciU9mlunrVt+YtiuhZme+wbkAaBOfC7RJmV+Rbb/wnWWQvo
	 Nfc0XiqAgN7O1MRdbfXUh/fpd9qLevfGo82kL4NAbDMsgL9NuUDiGpCzu9fXcGfBtuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
	b=4Dzzo/jm3X0AQksqdQkFEwC1/JYgrf9v706vmFb9oFZfr+za1/D2lMfw/MU3Hqvtyz6S
	 YC7TH40ydK1l2fRo7Dp5HVs0vqtiGyz7XT9xUDW8RlAc0ZnnoZKKUsEHUHhe0BTV0Rp7Q
	 vNnCeAPWqAvwFvLCksxEps6e3g9fDKlpRy2f3NsZhGAZxfducGfUrpFz1DmTZc63XsbOf
	 6g8emEc3nXFq3k85dhkRsE36HAqWuvgE58afAqHZ+7Yxufa0NkVGt/Rji/mA3tPCq9/ZS
	 1X9JikX5kuI/GW64fveSLhADPKFMR5K0CIbGMXuNv0ng0sHfjetUE5PZg9HzzgoB1Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kk/p/EUZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A8B606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kk/p/EUZ
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso3260366e87.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:51:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794869475; cv=none;
        d=google.com; s=arc-20260327;
        b=AYqVBznkrgeeMbwiIQpY7KmgAFNuuujeg9vKHQNRSBVC4diZsRF5sNoO8aPfwtO2cr
         te60K6TquDU1mrhXnsZR9xyVXAbyOHKsPLafO+KhS4FkrtTQJlxFGcyvFUCH0edGM1Z1
         Cpu8lqKPVmbhklW2NGscC0piYLZIidnyvpmgGBrbIxogfWRysuwhORT1Xsgqfhx7PJfx
         w9Cl4qa+36PozrYQ2YCnPpfb3nTD1Rq58dsVMpShRyU8oPn0hBAOkECPT/d0I2SE58bj
         R23YXfb3cA27XIYNrc8gkPcSLZcNhWJ3k6LvQ2M0QCP/BgnAFfYTunhmp7QlVBAidi8/
         hpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
        fh=Ez4q3yBndYZxYoTSEqa8k671Iv8+vhRJLVZaFO4e+tE=;
        b=a/hB+/foUuSEWjuEeFA+407B99pupZ5BFgs9GDONkNwX/YS6c5NEaUvaZcUYn5xVW+
         5f1eARVA56ZZoMqf4K4HCx7RYtS9xGZkRNoapz93xPrr9UWEaszP7xuhO1ZArN3MMpQ6
         KOtsiHXgSbQboXAp/LeZGHMUD7FRSPov6708L1Re6hULnVJalw3vFSqHRERStWPi1v2p
         jn4I82tcFbilzfNVHY/8XwYUlD1x1OG92GZb8W8JdjVJk6OYroJ97rd2Pj3bRDFEzO2X
         Af4FFAgQBFNt/22gX6uEBmDwpoZN4Sl2k2pXVkkFxQZQbSSbU6ot7vaeNNs+yz7fZWOq
         FB8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869475; x=1795474275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
        b=kk/p/EUZ42VJ5YgKv1Wn3i+cPwj2SErCTRW7L793OJ0KFsNhCm9BuTgxw25M436hxE
         V+gWlsQN7/eDt/WsiMaip+OKOnsd8INibpn5VjqY0nM8LEycYyq8fhFtSzsxtVa09VYI
         mX1qReotK4FksPWQDUjL98HvDzHNaBfLnKgBYWSR17ox+RhuSN+LMYvEsxJvXJH2IUHW
         BHmkCG2FVqHRuiswoAB0HnlpuNtJsPDeRalmZzkIGnNMdhEtE/lVhJyBu2SepnE9Dqzb
         wC2kJSVYH3Y1/rbV6xzEoYbWB7cHhGoewD2w7T2axTp0Mv+VXe4PGlgaLvzVgchabuwg
         wldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869475; x=1795474275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
        b=hJJ1WjbuMsUzw57vIuhyZE6xZNAwbhWu6gyrpmEjQkvM1elqQawoW8BDjWJKSwYEa2
         tNUKUVAYM612J8qvpXTdYLFG6zF78VcIHsxpIqpSQXGsYtE3XFeFm5a2eIESPwa8SSIu
         Hb9uNoRlni7nfB+CU/GAm3MnF4hLou/1cq9WRkouThqnJg5QD0U/y8p7UlJWd9lo8v0L
         GcENQDrKmiG/TYGjZZ6pFjoe6QTMP0CkYF4F8KU7QC94715pbv+YmBxJHHBqvBD1iQdO
         DEDImvub2bcOdZhft1lFup6bQAJXYtsLtBjp1aDWz/BHRd0RAXkc3gtURbtE9an2Txtu
         lzKA==
X-Forwarded-Encrypted: i=1; AL+hErGW0YTp9jj15d67MSTTTH/F5p+NZV/3R19kYwh+69ply2DO/vlDdwlhIR2Yq/QAgtIm/jH5UugVQQs0@vger.kernel.org
X-Gm-Message-State: APuU4Z9upzwlUl3jLJsjkpZ45nUCNFtzFGs9L/aGkguYbtB/WBLdgHLd
	m9PvyByWroennZWj7dxHCfZmZfB6AYrfdMC0G6bbJISDsa/8D8XfIIjuU0OzSWzytt4SkfBjI4b
	iT7y9byigk5lAz2emYUQSbbGsldQc2K0=
X-Gm-Gg: AYBFou3uwoNAvoh9sP+WGjyqh3myessG5Ifahpidjtq8gTong5COI94G8Us5UKNdJZz
	hjjqLZ8uo1UOUYFWBjhEpHA0iodAXsrJOVwUbcMpJzhO+xmnELzwttYWJ6mebJO71yrVEN4RKN+
	Y0ZHe0bk4JQffqvMutX7lamc4L1OZj1qUx49ZuFbQSW+n45Y1wghPGI5U3Et0TpgR/VjGFGV5jF
	ftdPa/3LrSX701voZNGuF8v63praMxVOz5EwBq1cqIcqm+/EbmbxBpQxt9SGDzPJJo74OOi2s2V
	o9gg3B7knLYwpD9GR7vZRV2RYol/lpxa5GA8OF/E1W9wX1zPcWk2Nwdu2QAH7ljyRe8Ib8LOca5
	Mkzz/u9UXvETZNtG488ICUNBoytVvwPP0L3nw8oonnulxXzU3VnX1vLgNX777iG4RCcNVn21z6k
	Gq5NrJxyEjzFvORvpXCWPDgmEknw==
X-Received: by 2002:a05:6512:31c3:b0:5c1:4f6f:564c with SMTP id
 2adb3069b0e04-5c1709c5b64mr4475988e87.39.1794869474886; Mon, 16 Nov 2026
 14:51:14 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116224803.61154-1-festevam@gmail.com> <20261116224803.61154-3-festevam@gmail.com>
In-Reply-To: <20261116224803.61154-3-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 16 Nov 2026 19:51:01 -0300
X-Gm-Features: Aa3M54oXe-IAn7x15degHvby6uCIkABaEwDsnl3MJEDi4r1Iu6Ak5t9VY_ssJ7s
Message-ID: <CAOMZO5CPym+AYFLv7D-mAH+OQXL_83yForV3GaSk4ReT_x1HrQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mfd: mxs-lradc: Pass parent IRQs to child drivers
To: lee@kernel.org
Cc: maz@kernel.org, andy@kernel.org, jic23@kernel.org, 
	dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, mfd@lists.linux.dev, 
	linux-iio@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	stable@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:48=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:


> Changes since v4:
> - Map the LRADC MMIO range once in the parent.
> - Share lradc->base with both children.
> - Remove duplicate child memory resources, preventing the unbind use-afte=
r-free,
> as reported by Sashiko:
> https://sashiko.dev/#/patchset/20261110141934.42490-1-festevam@gmail.com?=
part=3D2

Sorry, the correct URL is:

https://sashiko.dev/#/patchset/20261113013212.470981-1-festevam@gmail.com?p=
art=3D2
