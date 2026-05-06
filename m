Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF9B3D332C
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 17:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088245; cv=none; b=RVhn36d3CoOWExPgK5+wwaahyQszj1Zp4C65vxg7kgi6FuX/OaoT7wy2mLBU2BgLL3Z8siH8zYATAU6Q3dRjBtcsRGLrXHwvW5nDyr9X4sRv0wNTZaM/H/waAhxvQLZ1CHCFBU4+CckP0Tol0w7WS4mnd2aG7r4he/A6ESqDzj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088245; c=relaxed/simple;
	bh=pVvPgOiMZldoz4gPD1EEb+lZDazWRbOkpKXqmjJsD5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WnOsycJFSq42myNHdt8KNkbYZU2NtL25X5v/TAHDlMxscIwqcZuZ05GGZjihwzhGEcWmMpl0QXTE0ioaMJJKPqBdeHi9O3nX7W2Ox3GeGq9qkoQkqzZ02rl0qWq7HeM4elO1BptPJKxVJtwpfzJM2Jr5SXOFztTVCN1PMOPCyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=NLYckDXE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="NLYckDXE"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36528851d7dso2025853a91.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778088242; x=1778693042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w9iJVVyuUDRZ2l55xQGBHnO/PNzQ3VP3q5G/LnaoPA=;
        b=NLYckDXE0euVEA6R+RicvNAUXTqbTUGPHSCHpQ0yZzHeaGTJK1MWKXNZHkjm9QVdOz
         5j4JTuQWECr3aFcL7uIFw6xbJKV25GVuY3M1i0pTXMHgDEa4acqzdZdTz41uLDAXzqdQ
         E1Jadnhyy1BzBYVrTqfMmKgr5KsbVtVXsgFKVeX5h1Xw/DLXod7QJRnb28yKzH7giqav
         mNV0PUng4hW64DV5xTZRZyEy/RJjS0fRd1CIr2B5RJ886chkWZUrM4fommE5k81gw1Tl
         D7eSg1HizbXGGlE3UbYyKfFjnoYk527KlTvEwNaf7O/iSGFxdZM6MhO6qIMJlbThybfJ
         yxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778088242; x=1778693042;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4w9iJVVyuUDRZ2l55xQGBHnO/PNzQ3VP3q5G/LnaoPA=;
        b=P9EVtplPHPMTH9/CpAo01/8FmaziTDC1M6z2uBeEKye0cXVDUARyRnhsO5mapYuE1F
         XMeTXPHvBOvkt3EmfhWwy/Ai+vVw1RvSX1XBAcQgXL8JpZPPk3qdzlO49nhengDjsA1L
         YCcPjQAPt0ZFLLkr1YWxgYPzIRU3gSNnDeJcUjNSlSZGe7f6j+L1dAGuBBlAbBBR5MAW
         eaSP+6uzKgWgNsxZLg4hlp6QviuGKneOwK2TRo0h0v7FvCWwv3uf6bTAB/SyZpk6uVBW
         U2yWyL9JXlkkOGiI1usWfrYOtDAFCllpQKxIa4MzCQoAaiO2ZZ4XsVvlaI4kvpDPaf1k
         dQ9w==
X-Forwarded-Encrypted: i=1; AFNElJ+cEKKk/UKoMJrTVBWSCqOTw/qOE61zye0+yLD2UbZDYiORgybq38iwunadTPiAE+/iDZ/fF289/4oB@vger.kernel.org
X-Gm-Message-State: AOJu0YxM9pFPeJykaB73l3mSMvobB7bo75uMblPWr2avJ3LLMbEFIIIs
	QqODjFKqr31N53rkjOzQU6ARGVUX668iBjPMdPtUoWPqLQF1kV+IJoQ15kXasDS710c=
X-Gm-Gg: AeBDieuOVj7C7nmljR0jQvrMN/x02C3V5fLKj/ntVTIDh3vJ+VZ/HiP0dfrlxcUrlFk
	UJo09sMAs9SuxijSh53yGZwOfVfcnUQeYTTxA7fQcHNh5t9Zs8Q1P2ILM5FKvz4YVPMTIVToQqy
	kqSqje+eUIdJaLSt/3i1p/C2X+jBDRZ/embOH3aB6Em/zABYBeN324VmwKPJk5Vcrx7tLLla+r4
	7puoWH1ThutfdkcVb1cuNwi6jSvFuhZwa86YxpyFeqoIY/uoP3syyO+DdvDg4DZ8zgx9s29uUbG
	DmEMGKsoXCoyWHc+XS1O3X6IRZZaLVIRCr4MO7aqzY+OW9X9PNpS5f0tKWFzuQPj2VmBShBeucd
	+w1XxH96/m+YyNvSx4oOHogafjMnKgp8WWRQUJehLb2VMoVzzVoPHZM69Tanwa0ydDmZA25dgKm
	6CC161ynTX1FnrB5JztVsVgKf39RN/LwYBQnFoeaKY
X-Received: by 2002:a17:90b:1c84:b0:35f:b288:8e4c with SMTP id 98e67ed59e1d1-365abe8b23dmr4046962a91.15.1778088242197;
        Wed, 06 May 2026 10:24:02 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-365b4fb5f1esm2984917a91.14.2026.05.06.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:24:01 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, akemnade@kernel.org
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>
In-Reply-To: <20251231-mpu9150-v1-0-08ecf085c4ae@kernel.org>
References: <20251231-mpu9150-v1-0-08ecf085c4ae@kernel.org>
Subject: Re: (subset) [PATCH 0/2] iio: imu: inv-mpu9150: fix interrupts for
 MPU9150
Message-Id: <177808824115.2120464.8993137097234559712.b4-ty@b4>
Date: Wed, 06 May 2026 10:24:01 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 31 Dec 2025 22:14:15 +0100, akemnade@kernel.org wrote:
> The Epson Moverio BT200 has MPU9150 chips. The devicetree has a simple
> typo regarding the interrupt of that chip. Simply fixing it unweils
> problems in the driver causing IRQ storms by calling
> iio_readdev -T 0 iio:deviceX
> 
> With the fix applied one IRQ comes per sampling when calling
> iio_readdev -T 0 iio:deviceX which looks like sane behaviour.
> Probably applying this series has to be split between different kernel
> releases to avoid having fixed devicetree with broken driver.
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: ti/omap: omap4-epson-embt2ws: fix typo in iio device property
      commit: e0abb8a515cdb7613a15ce54910405ce8110e4f5

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

