Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474333E0758
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975295; cv=none; b=GJYrmWLe28lNz0K68nemi1KwbRW6jtLtftQKe6yP+YyRcQU6zquE6wtwwkLC1flPDCKDuXubUSXt2kJlMYKLhZCePLcGNUZp9lT5x6zI6eaaB9NwbhpWoYHW/A+S/bq4TxMLGPTk79VYYvCeoCu6PpvZaY07pJ1dcExTbzg6Nqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975295; c=relaxed/simple;
	bh=D0k/9kMT/cL2pMsnIms6KyZ1W0wrvG21b+rTr48iBns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CIctExKGFIZYmKX08P6p/eHvHkA/fY/5u4Ie0Qpo6UORQHhh1qrik23liHlofWnFZB7tqcpYb/wMLfpbbaLrh5yZvy4PtVVYVXz9nOvJL+85fDXlKlrVSDTR7CYovrvd1gSOLku9D+PkE18l/H2NPKzNMIpznjO1qCzQ7cHeoBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPmNREmI; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPmNREmI"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so5835520b3a.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779975293; x=1780580093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yzn0YhLzTvt6pUfo05dJeo7r83ZFgX9EtU8J8f4Da+I=;
        b=BPmNREmIJR4XU8LQFxJunZZryQJ7DLcvzCwJ9h32wQtRvtmZefV1bDr7I2YJDbehDT
         xkhEbIzXVLCH8I0Wf+0r/YJw+pkx/lhMD1fM5ol7fzPHmCUeF9jdoC3zvSFFE7+IwxS5
         kDfC0G1YNl1rOUfFmKeMp+j03Z86mlCQyolnAPQYXCDMUL1tEl9wQ4LiOLZtlJQLdHxw
         BiPyf73ldvZdr7Jqzu4JuYKY4AWO1CMjcFASIYpISEpfzv0jk3rwvR5jITL4Z18Plf/O
         hnYLxaTtV697O/nhCt8+v7xVNZAINNYUXjNKgUG8c9gONwgT+LT6KFx+vl+bKnkI4mIB
         AgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975293; x=1780580093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yzn0YhLzTvt6pUfo05dJeo7r83ZFgX9EtU8J8f4Da+I=;
        b=XXMVpXIlW7KkrL9rjCtcuYo7QHxcFEv/ZMSUuVfcNRFLLp3b6eEzn0/Nbpb33M3qEr
         sGP4ieiBrHaIeOVM+qYUeHBWr9PELY/sRwnV/JJyCbKUVan8MmEnAi6pVWM7jMbORM9M
         19HXPw8cOIs8tLiLnNvibmC+TjpljSF0YKdmV903XDA5Li4xZa0r6n2AOIfYEp8DKl+d
         LGf0FQYuk+vI3xfuLPLrvTmCUQd64/9dosJZ+0IT7M1G8Dt1RAqaIGTmBmP80dOOq2n/
         mBwUXkQJ/4PgWSsSWnZCd/MNHhGb1epanSU/qxkisgcy6GL6ubNN/LN7ostTvIejxhwI
         vWsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aEOWJYw+y9VxfmI9NGd3OYZUFnVHi3z7Vrt5NHFp2Cii+ioc4aUTgExP9IouRzGQ76EWkYrXaSmgB@vger.kernel.org
X-Gm-Message-State: AOJu0YwEi++0uCn78ECJaPzWdFco/jqTo46RjaKi0hQwNK01/RS1xeFN
	TklxA6PixMfqxWABlpGfn7F3/OkfsrAB92j20J8+kh83mtiJ/KMjuZlf
X-Gm-Gg: Acq92OEWPKz12KMg1TrSDMLyoPg9BlgfGokSqKDKhUAwwf6NCR4GVFlevtxYGi1RneC
	3V1I1hcNOv2zNNwskm4J8ekG8iG7ve1pqVShdQhOEJ9V9a4J0HflkYj3mNkeHhFCDxKPP7A5XHu
	Z5Qroj4Oa2KnJ6fAKNXPyvtrbPGEY2nD1Y2e27i4eUedj+LTezpoJpunETjsQsfrAm4aXKx1YrM
	idMTdxNeXY+M9UhtckV6uM3geDt3Yc8cVRTr11PIDtdF/YFnQlzHChaVjjNakCgFF5jY9FinW4w
	bk+52N5a4awRpZr5aNws+MwfnzOgfUtEddeUirqkl2ah4u6weF68cod58ZtndwBO1QpWphcwXWK
	W7bFVG0sfaL/2Dxxf6u5WhWDFMV2auDrAYhcCmKm4yXz9YECEcn8JbzvH5pC3OiJsV+gHd2FDnx
	VzYc7AyUvxqOJpkrYpOiQ0NeXgMsqh7B9B8NYHAUsCO6ds/KaBzpJl32uyPkeINDCPiGKn7ozNJ
	Lgc96z0hhtLC3S4fp+5VfeG
X-Received: by 2002:a05:6a00:3910:b0:82a:5ef0:210b with SMTP id d2e1a72fcca58-8415f15a77bmr25792188b3a.15.1779975293490;
        Thu, 28 May 2026 06:34:53 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e82323sm5195429b3a.2.2026.05.28.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:34:52 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: airlied@gmail.com,
	andersson@kernel.org,
	bentiss@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	herbert@gondor.apana.org.au,
	jesszhan0024@gmail.com,
	jikos@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	platform-driver-x86@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 3/7] platform/surface: SAM: Add support for Surface Pro 12in
Date: Thu, 28 May 2026 23:33:47 +1000
Message-ID: <20260528133353.33312-1-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6808166a-423c-c801-497a-ed95cccc8d0c@linux.intel.com>
References: <6808166a-423c-c801-497a-ed95cccc8d0c@linux.intel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 28 May 2026, Ilpo Järvinen wrote:
> Could you please confirm this penstash is correct (sam vs kip)?
>
> Sashiko suggested it might be wrong but take it's report with a grain of
> salt, it's AI after all and sometimes seems to extrapolate about HW to a
> sibling HW without any real knowledge:

Sam is correct here, unlike the surface pro 11, 
The pen stash is on the reverse of the screen,
not on the detachable keyboard.

An image of the pen stash in use is available here:
https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/B04-Surface-Pro-12-inch-1Ed-Family-Rear?wid=1200&hei=900&qlt=90&bgc=F2F2F2F2&fmt=jpg

When using the above config,
pen stash events can be seen with evtest.

Thanks,
Harrison
