Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C124D51C322
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069966; cv=none; b=FEfTIL9zzeO32Hj4Um+vu66WMWWIZBttKCalRQFlB/C4hLnf3gQh9IdK7J2Zit7isIe7DJD2y+Jabi5SGYc8pRo8/Xahx0cRvS/oKa8lTwomw84PdjEmdh5wf5ull8hAwFgUpP9IRqqSX0fXoCXPXAMClEDmzp0fMKkzadwWy9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069966; c=relaxed/simple;
	bh=l9UNplYJIOv2bNql5t6OQ2PN0ybmSrQaq8gHkf+c+2A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5TqmTi0iSUODDd3e+y9Hw3N3J4bfJ79R3v6f842RY5xNSbF4x6OqZyyrKy2lZDsN2Lgsj/BFqRlGrGX1YW+RIyF21TY8eK4d1SLu+OzMu6aXb8WJUnkS1dT9LzLkJLQosIt9bqj1zuZucpaGsojxKqPN3IJdGxrZj/VixjAETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4k6Y2lU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4k6Y2lU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so46148125e9.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069963; x=1792674763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eYpTs37ebMsmt4FCok4Jg2bBzSQXMfDrajAj3p5BF9s=;
        b=o4k6Y2lULHW11jTQ5vb1Do7VNgkQyWsRiHzbRfwl1VMdDfta3bI0VS5XuGMtNcyp1f
         15l8VJ/IqU7LYnwqBwWIXaxYFz2n25CR4h3Ne1+Z7eYvJUCm2v/KfPWLC++09LfsFI+D
         EsBBul/+8WPnnP4+hwpnwY3EYyEoAcRL6EB4SeyiJI3pmgU6twtKJaCzXJBS/Tlr5Uzv
         Hxr9ebBruP3K1MzkQ4MqhAf9wsKGTEwnkMxKsi/qX5/nG8uj4OXxTUJyXxqlHxidxair
         rLN5WraVsA0jM1rgvntTpSFSpZvPgtroYMZ4m+Uu5mJX1GzGxlCo2PgJVUxp4XU7nXcL
         qd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069963; x=1792674763;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYpTs37ebMsmt4FCok4Jg2bBzSQXMfDrajAj3p5BF9s=;
        b=J7FBPLw0cO1gjjMf2NMfH1kks2r+NUSYYbiY7BRQ0P+i4iigBbgGVZxsOVp3N8fIbK
         LPz1Iu+DaC05xi4C4OYsqVkNbQcK0yVbZl3uMIu1ScIfjw+U8MUSYq3qqR5mrm/3BW9N
         RPPhPgIlzH0+RGMvYY5DzQCClBVkLakCItYE3viTPZjAvV2X+tHXQKDm2sIunhlxNaV2
         GEhobh0I2CLu/3P+JNEkvFxqAyoP4je4wEhasuUY1PMJjxzJEsRtN4R6Rdplm0vQTPFT
         nT8EvCTv/QjJXmogP7+DYT736UGUdZ+DnBUP0NnHwysEGk5+WVbw74vwuZGvxd4yzZiF
         NHVg==
X-Forwarded-Encrypted: i=1; AKwUvBwBPRWOEukS8et3IyduWSY1qM1/UsWkpLFCFuJ29Cno9YMzrTUhzDXK7wddkHAXGOL+baU1C8LO6FbJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJfn2/Xh/VVIp40EtjHZvSYvrE0urKgez0iDxPeq3suFEcEHt6u
	lFqQzrqKF7JNjD9taAAkSQz6NzigrF0cBq7rFFM/yXZZBQlU2RoQVB+x
X-Gm-Gg: AYBFou3ZUOODFCd1s9KeoEccY8bVCf0E8824nk1Vdr1HHQ2ySShz5wUWJoxlJ/d1Ai+
	VlANNq8k7zaO9JIUOb47YYsQRLkJ7bKMTQ9S8ysJfN+jAg7SlbfnHVfB5uQnQsW3wGIK0RNro+3
	48wYTkC89HCQGAKG66tlK4YpZ83nlJHXat0cG288LehuHJWNFWldo7/4yg851ZqohKTkTf/ZXO0
	wcCk4YeLkidonqmHwxLDEKyx3RN4P/RrwHflL04ba+ZKRiW82Zs4C9NVSVlxw5JAIu/jzVQJ2Fa
	e2VSxzVb41F/vjMBX+pDD8p0WbucfAlImcxWU/QeRH73o/9qwF8nurMSMvudlm05l5msuhsrZXP
	BCPUMBB50bbbOdiX6oOjOotZbl4u5no+uOciPdfBdefNCDkt6A8AcP1D5XXuc3NHd7Y49D4ocZb
	TnctsuincNzvu2g0ry/WhsEJfm5AySgalpJDkZqkd9Y5uOPMbXuq1z+YJt9p0SeegQOYB7Sm5JJ
	BnWXsYYAEnwvsPo8nNcuviq2aZxlCOZ0NrAZMfls4F31N5bsOyZyVFgeIlc8HfX+hIz1GHdydDf
	J8XO/JJkqZ87pJQVJZdkEmb2vjh1j7YYMrDLO3YJe9b/S27/PMLxwwK+E8cDtiG9jiFWk6LSCT4
	xdTVi37Tx8jkTvBSYtNxzz+HkBYd7Z94vRqtpKyvXfrY06WR99EdKUCjHW1VeVtLLt7fpqVAjFn
	FSNDr0
X-Received: by 2002:a05:600c:e547:20b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a1a2c07cb4mr166991725e9.30.1792069962853;
        Thu, 15 Oct 2026 06:12:42 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df0f99f0bsm6681901f8f.21.2026.10.15.06.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:12:42 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:12:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Eddie
 James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rupesh
 Majhi <zoone.rupert@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] iio: pressure: dps310: add per-chip data
Message-ID: <20261015151239.00000ace@gmail.com>
In-Reply-To: <20261015104945.2687162-4-paulius.zaleckas@gmail.com>
References: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
	<20261015104945.2687162-4-paulius.zaleckas@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 13:49:43 +0300
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> Move the coefficient count, the TMP_CFG startup value and the IIO device
> name into a per-chip structure, passed through the I2C and ACPI match
> data. This prepares for the Zilltek ZTS8032, which has two more
> coefficients and a different TMP_CFG layout.
> 
> No functional change.
> 
> Assisted-by: LLM
> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> ---

LGTM.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
