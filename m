Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A03237DAC2
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 20:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764382; cv=none; b=U1q8XnMuZzI/PwQuawswm/FWph4pBpMlneD+KMTNLKdQ4qBtMuiU9b4T+3Zb4byD4TFI7p/Bwr/DbqmRDYZbXzrXqHiUMKawjIo5f0EyvodejO7eEfmAL2GxqgUacu3F7qL8rcRiqbU7/o46Qx1h2x1gpuyEq35HqppZlEFfplY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764382; c=relaxed/simple;
	bh=qBWfXMK8NShG6BVaJl9G/8xNVbc3kadCRpe7nOtCDL4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DQpAIBtKQiMKxQ3z3Z1DfuANkKhlFrSehFXw2KPgBcshAGPEoELJIZlInQ4wLTrLiGw1V3YGdLhsxQHxbhmZ1RqqYNt34+iPb6CNXOO1YRfqI77M7ImQzjsGZnJ9qcXayCn3diUSbsXlI4eOOYKeBzBhd5W7O0/qE5K+SQrgIqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OatlEDlf; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OatlEDlf"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8479f1a86ecso153597b3a.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782764376; x=1783369176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RN3ly0amkqfVWnS6oZWUFFDffiw/D/CaNP3X9CnZ4y0=;
        b=OatlEDlfsn8TqzTdlAVqvuM3QPLelJgcFn4Wzhem0WabGbVvH3y6yIgBO4xQ1PGU5+
         qyWLH29NZoDXjVhjmqQTdP6aaIqOmNQsMK83K2dhwqf0b3YOx7tgMLEPgWCgxmHwe1Rc
         7ftc4czkMHipxOCeQFohKimA6htL7ne0zxpNaXXpGKKKTAT2bVQqK5st69TXAeebjdSa
         sqmKFfOUfjEGCtRl1WCeph92/itGeybyKiI1fEBy8yOgPzRx5zY1BTgTQsK2v+dWLdkb
         F1IxzOCH3Z2mGDdkfkkrHD1gsKu9mm99xtpeUXNbIm9U8XvmfHhvRzJcFtTcsrZmORGt
         Lusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764376; x=1783369176;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RN3ly0amkqfVWnS6oZWUFFDffiw/D/CaNP3X9CnZ4y0=;
        b=lwOfYR4nrBzN/vzt9KijY3z34sel332Am9iDiubUr7zLxerql2BlMNRBJwq6trSjnf
         O/DHphaHFw588lcAP02ifxSfdaAAms/kcU6yL1dHxc8WnUjumVdVw9nPap0Cs5DQH0Yq
         25KYtIQSY8cv1y5cfOIP76ECvR1biM80TIcEO92E2uSY/2XN6zY9QHCHYEy61QgYn+a7
         bcyl0YFXGtwaUUjKL1Wmz9p8Wx4PXOO6/ElqwniGaOvLHMfDbJRTS87HHiORgi0u4U1y
         L/DeRmAQpXlDjR4A/Ld4ybC5ai6KGKLLvMx6j1o3IPV1A/di8OOLsYvRwzX6F9cs9ekH
         J6oQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cA4CX0WLdijnXIsbEz8NbGjLwLbVZWpegYSU0B0WgabNLBV9BD1fuq3efKp1jcf5FSgUI5CMlfy/P@vger.kernel.org
X-Gm-Message-State: AOJu0Ywad5EcklGylVApk9/fSOxOz80H+e4atamVSaiEkIOEnrLvcauB
	PXcfLRVyICDxEdu8ln2Y8hhpBMm+5LaeqABuCMyGU+PG5WrJIoJcirqK5GywWOsUkjQ=
X-Gm-Gg: AfdE7cntNYAmGqyYhpovyne7BKPgNrO5BJCVF9czE5CLs+oQy91s7ZeT3L1gMnpcavH
	Q+9/c/t32PyE5/Bu4buTM07tnz5SFlM0Df8sLc9+cJIeYmmY8Gr6IvgkHZA26XqsKc4rJ0lO6Ru
	65sVA7k6/vsVKrrPs8jCdoOetRBTZX7JElF6pzEvGKmO+gipxC6in1wgzP0ScJhJ7sX9lvrHpEr
	eUrDQlNytIfF+9S9/wHu9TcxUYNJoXqSXE3VM+3VeHh9nJx0AWBwnEOkKAjyd+r2y36NQWfw5K2
	u+i0JESoHUWr1CLVA2fPlXQUG7S0m1gPcS93W5zxZcbIELEzg3VPdF6qaPdkaE6wqipFCYNfpa1
	R4GKj2Mk539w4IgbUg7xxXCguo4P4QahYNUrppjfNIcp30koHE0Qm/gvOT3bQFGU/ohnatsZhET
	XHqgMPofeQCw==
X-Received: by 2002:aa7:9314:0:b0:845:e105:1e6c with SMTP id d2e1a72fcca58-8479f2d0fc7mr588972b3a.62.1782764376433;
        Mon, 29 Jun 2026 13:19:36 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8479fff4c7csm330037b3a.16.2026.06.29.13.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:19:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Vidhu Sarwal <vidhu.linux@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
In-Reply-To: <20260626111720.56688-1-vidhu.linux@gmail.com>
References: <20260626111720.56688-1-vidhu.linux@gmail.com>
Subject: Re: [PATCH] ARM: dts: ti: Fix typos in comments
Message-Id: <178276437558.1055800.3079252935866099561.b4-ty@b4>
Date: Mon, 29 Jun 2026 13:19:35 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Fri, 26 Jun 2026 16:47:20 +0530, Vidhu Sarwal wrote:
> Fix comment typos found with codespell across DaVinci and OMAP
> board files:
> 
>   limitaion   -> limitation
>   swithes     -> switches
>   converstion -> conversion
>   differnet   -> different
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti: Fix typos in comments
      commit: 21e741f3922c40305d9225c7a3b2557e5d926cd4

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

