Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589093;
	b=NQeJ5TS4BjtNtUGC8Yua9aNVpSZfi3Rbtho192vsDQvUKpuDYwyY/zXxoTHHhxbdF8s/
	 KAkCuXqEzH/I1Oe0FD6o2mLY1JP4w4ysdcDvr6FuuqPPy+fPTWziZYFWHczVd1PyqFB6c
	 wZSpjbNNqrcJbiYPaYEAWw0YAryeXFmj5dqrTPXuEAuV2Aqs4spylXwis7o9JTUdfxKIn
	 pKxVhA350TGBr8F0RDDxw11WbYfThwfRSvVfFhw4yoTtTGncvF9sx4j5kVdxDcgppx6Cf
	 +AiDvO+Pbm8cESRbrEEfZ5gn01QgIny/r6kKWhDRKvw1yU/+q6zaBA5Yk9N0NG2AM0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DfLg15d2NsC8WG4F+8NUyIDwq+mbAzZvSv8g7DgQuf0=;
	b=rDR0qqcpBrjvm3LzFLpdrXpf1/lV86uZevd+PUr1vcZtmaS6lf3V1hzDHO5zD8mVphot
	 LglOp85nromw+dhNbOXpLXz9RaijJKytdXfZa7CzDoryAAjgt6u8BzR8IE7uvGJknAMDK
	 y3NMrXQ+QxN2V4QC46HN3Q4ZYQ+r0iVYJePP7PZyGlZeavpOt5F339/KkkZjcsOyVOeeV
	 rQ/pSGf+vpbyWEoSCY2vehugQYNXbijVveY4azKPFzFtD2XjduD6gumQdM7+o6NCnq+9L
	 xyBkwiCteLj2tOn0YLb2qE7punSPUslSlLuJRyaf6BTQ2XySVPTH8RL7sDLrS1b2tMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DFN1tklU;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81741606A331
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81741606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DFN1tklU
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c445c95d553so89896166b.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792589092; x=1793193892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfLg15d2NsC8WG4F+8NUyIDwq+mbAzZvSv8g7DgQuf0=;
        b=DFN1tklUulxevp5e23DDQwk12D6ac5gehXefCmPIk3ujm87X145Iltk3nXTTJy10Co
         18aFMXxMs0ITa744yyaA8coIk8ixafXJoH+P2cxkRvVolGZtNXcjQJah39i86ygQ6vDa
         +99t2ShsDmh/tvedHar6FjFJfigremGZZVxAJDG4o5coiF6bAcm6M6xs4ybCKGtgClnL
         l5OOZx+SjoAEToexQ1PuerbtVhpUdLGXFFshGdvMRUly8FwJwMta5oyLxtSTvLLGsP3X
         lt+BLgsYkcghrABTaGAGNrvkqd8/1EUZqnrVutMlXxygBFmBdiNYwNo5pnLVhrScVieF
         RAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589092; x=1793193892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfLg15d2NsC8WG4F+8NUyIDwq+mbAzZvSv8g7DgQuf0=;
        b=bJHctEg/a2wroNaSpJFNi6iQnakxKd1yXGLjw7FJLDMBFfTu8zwgCIto3iNka32SRa
         cURdyGj4qUNJjKPg92Qo0Q89ztMl7f/s7YeWBY2nl/8oBuZy0BOoLjiCynn3cfdT6MAU
         kvdQtozIWg/y4nOVsaTLn8ql0i/FXJpCDILfk7mlaRTJIdlJHaHJUYekqNEUxO5BjBok
         MNdliVvSWBm3ekbWZ9O0YevuXg3rYEJsmsgx/6JFMdrbeYq7x8hcCHIxwZBocOM2zdul
         HKY//bV4rVY55cIqCojcvxj+dlX23BlUYJ2bXV0EyrwN7vbkiuglI0AZYJJEh+z2/jCc
         dWVg==
X-Forwarded-Encrypted: i=1; AKwUvBzzgHP/l2uOr1Eql8rc9YFPWG2cLWwucBdntGGlkBPbrQDy+soHFpYOCC03iuVDJyT+eMjV7CyFxxsa@vger.kernel.org
X-Gm-Message-State: AFq9FYJqDb6OrJvQHXWoszEfP1C0536fP8nNxC7QnjQmzM8Pvg2yGhRN
	gaapfRnYlZ5V+XPg7+1gja0fZRYjU6vEuesZJ/d2MGR/WV+ZONOhEWkw
X-Gm-Gg: AYBFou04eOBok9XkIkAQ/4WtgH1xXL9yhAyh3lzuxNmcvxgF9PmjBgmV4HrqAiXKGTD
	TyJwWbZZTIGtLSzLH/fFqhJomFDhYO0OvSPdGz5D5noU/2UXpz/Cq4o2E5Vm9nXax5jvoXA1S5K
	LAYOierS2BrXjA2cwgSUt728T5Z9nfFVpnre2PM0zmsz/+frZzMYy7+EqgnthJ4NDJWn/so/4hu
	A5hAz0jF+DjQ4cczWiWANWsHO4tJVEajSRnOT49EY6BAAbkxCwdBKmfTG9VPZIAGyRwHzBpHphX
	2ELIB6XLpSTg2TGN6m2jdxQr867xVsS3lthrjTDczy8RBRv0rT6XKLICeHGFawKFs+cMToLuPIx
	BoioCnm/OA6xdMHa9ijWSwgJB5OkmBOd+ulVfRIh2EgusqUj7F0v8C7iHWxfpa3ogoHvAcNhOgA
	kKgZiWm7ijxpm8DUcVYba5k/o2mNvKXOJ7xVXzrZTlHszXOykpb54Sak4ihVDx63FGcWvKtx7VW
	KClqV/ALVNnbkegQVuP+cl57T3COQYRBREN9rDwoPMEpLqp3FgQoQ6YMHWUR41gaGwAz2QPc3ee
	qmjCx+aiYebLKtk5xUliCou8d4qCEYqyCnkQNO8Qfh3X6xDkzWmPC4f3wuI4NWgFcpRe636Mkij
	APIhrkevu
X-Received: by 2002:a17:907:608d:b0:c2e:46d0:b802 with SMTP id a640c23a62f3a-c46797af00bmr188075166b.40.1792589091580;
        Wed, 21 Oct 2026 06:24:51 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a592333sm1418266b.46.2026.10.21.06.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:24:50 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] iio: pressure: dps310: add Zilltek ZTS8032
Date: Wed, 21 Oct 2026 16:24:09 +0300
Message-ID: <20261021132409.3742735-1-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019141646.49599-1-zoone.rupert@gmail.com>
References: <20261019083620.1285782-1-paulius.zaleckas@gmail.com> <20261019141646.49599-1-zoone.rupert@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026, Rupesh Majhi wrote:
> Tested-by: Rupesh Majhi <zoone.rupert@gmail.com>

Thanks for testing on a real DPS310!

Paulius
