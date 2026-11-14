Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657492;
	b=HWiU6BANPnlVfNGMHo1EkwSiI/tekqhl7YCM7qV1SevhwCcfEs172LYigK4EHNLOUOwR
	 UQzN+wWwsYiYd1LcRatpQBSUoSmWmVwXz9r0BgLUKZAzL8EbxcWFS35CVFk2u6GWzmlbN
	 hHxy+jY8TqJPqEyBOlhaMJf91gKR1/dOt6b0S9DO5yX0YNBK74lLvlvJ3j3neC1GVNddv
	 P1Er4yZIh2GHXoJVmQjLfa5wzdJWlen4XPSYjtK+VE49lLpo2kO+zhR/VEjkP718jhoUL
	 RezJhfy3LrF8OY9JU+nJdr9Jpcx7lCdOCMEwA4fbMx0L2Ge3Uc99i4ytArdnC0LmUmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=biJ9EAFLEA1rR//T+aJGjeK6yGVa5a+nAsg2mX8Jh6g=;
	b=RwLnnyUZNaIkw925m+/T98jdLpHh2dKAC26Ds1w9ss0XB0tjyna4L2w3aViyN2GWmr9J
	 1KobSJTuw/H5iyHtqQcfDDra04bH3UbbZuGAn+m1WpOWb8fe1OlODFwrS6HNLvQ9z0fKW
	 IHADAdUp8wSiJpCSTHaoDGHwvQSkO9hX0meqz2qkeJs6f5Tns3zWAitf2/4R1JKeYt8ba
	 EP3NKGqQ2IotoxJS78DwhjtmavjW8VxqhmsHZfBXhVRXbH/aJvA0sM4LbvAo8HpBTj8od
	 iEOkIYOKvSu9dKwIG88EiKlic0s3ArVpE/TPDeFvXRrMn3QA1bAUr6ljXDloc2ceLDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKHVAcOC;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57BC606A32E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A57BC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKHVAcOC
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso2738066e87.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657490; x=1795262290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biJ9EAFLEA1rR//T+aJGjeK6yGVa5a+nAsg2mX8Jh6g=;
        b=jKHVAcOCtl0g3TbME2TVA8rBXQlEpflGEVNVnIu8kkRI5VOx8kaxiHhfwPDIO6LDSN
         8PliQDEjRwUhhPY9pLFLX1VJCV+dZra1+K56u+DxkRa+PG4pvRAIcQMeR4mL7K2TF8/r
         d2dHkwnRQEfHTw2mD/w8VsBULvHZ0MP1M/2IzPLfj3Z5SyIlVvLW4xz6ilftQu8yVdBZ
         JLc6cTJsOHmku+brJT0yxgp2PJJ4bKk6NT2MCQgZmYBIf6XbxGOXIDERe6V8nkIhKOO9
         VgmyAZd4C1NTszBkb6wphO5xC/8wPMS8WjD3NKLHj8nTim2zvxbOnjJKBjei2qxK8wHs
         leew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657490; x=1795262290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=biJ9EAFLEA1rR//T+aJGjeK6yGVa5a+nAsg2mX8Jh6g=;
        b=Eb9e7n32l7goZTrKbCFh5wiR8KFEgX/hkJS3m+HL6n65xmBTSwe4YlCdN00jRHryA2
         6Lg7Va/8ahNBVvLa9cQtidPRQTiIt418U72s7zHhRZR8P/8NC534GKxY93KZmAlbraWf
         LT0EfdJCZ2Qo2eUSZ5SEEiZ3wFjVP912WWspOY/N6P0sdSMhvSURu61J88mvHO2zTCK7
         F6OVgrVSOY+DEqzir8J5tHdWSNSJoPCYOa73Utynga70OijGt16XovLwz/x9hvojrc7Y
         xDTX21olvfvRGfoNV+qTp++OIurSOSnKuMt8aSiBksTqTMn8TBTG0P/ngn/ZMfCzeX5n
         X9Fw==
X-Forwarded-Encrypted: i=1; AL+hErE3a7ZaxERySv7x6NPUb2QTQjQTCEGc3RqDb5F+lZWz6cQMhR+By+8LaOORVloCpUnC4hWIenc0tRBz@vger.kernel.org
X-Gm-Message-State: APuU4Z+bM9dl4GDysvvBWziBTLFRSFV9+lqZ9bNSgSJEdI5/t7FVjaqi
	U1p1YPgYFmlpkK6MKMhqvBz3ez/YaGGFWWne3mwsO2QxZAbbPJHg6v4h
X-Gm-Gg: AYBFou1K6QPFEkCuU0H38Yv6nJaytSm+bAZuul0gMFKxDAVc5tMdP2byAmiMl5ieg0+
	JntNzvMCx68WZvW5SYoH7OWJ6zWoMFLdk+aoj44E/RUSjqg6WqrcchWBdwxq6G2huwwRwaCm6Zs
	TC/1Noj7E55wTS43PBNY5BGzE4O1j4atSvs5HvyyptlNrCP3uW3XWWO48G3YO5thqvncSisFVy4
	SSAbdMwJxSzgbMBTC0oGVvjVr2hm4eKzk712+0WbTqao0LvfSAbVM5fuNYM2i9/SIjJn3z8jYSO
	pZl1TL6nh4BvaKG2cgVSCyWjHLeBjaZ4oZYD6XRetpA7kcFxEPvBNV5yhtZ6drVyVJEA/BlDZFQ
	4qw50fy/pOoUQxHycvRvn9l+5OXo83lKax941i4CPUcyrkIaUjLpNn+8rkDGyHMq7MaoCZkHHrB
	VhR/dEa2XDnqNtUlCAcp6gGt5Bv9nraJjJiSGhagIIhPsEUGzjCYBbJsLUZFSVxLQULMBssM6QP
	hWgzF1TzDZgpiqt9xo0H0erlhDn4mUm0j3pSCJ6gRI1iqbksgY0XCeckB3lRuE7nKvWv4H3DKe5
	vDEDINhspf4Irsvz70oXflVlGgzNTb+JvT6pxeRX53SdcF1+/5HbTlB4jKSH6KkznVBIMuE5Llu
	7dB+RhfcAsygnTjdR34Zw1X97erLcshPUcNVnBos=
X-Received: by 2002:a05:6512:1048:b0:5c1:5958:a7e4 with SMTP id 2adb3069b0e04-5c17077eaaemr1886702e87.15.1794657489552;
        Sat, 14 Nov 2026 03:58:09 -0800 (PST)
Received: from yantra.. (nekmmqusxj170dz200l-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b551:8edb:536d:8395])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133c9d3sm1606436e87.38.2026.11.14.03.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:58:09 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: pressure: dps310: add a data-ready trigger
Date: Sat, 14 Nov 2026 13:58:01 +0200
Message-ID: <20261114115801.57701-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-214316@kernel.org>
References: <20261114083828.18059-1-zoone.rupert@gmail.com> <20261114083828.18059-3-zoone.rupert@gmail.com> <sashiko-outbox-214316@kernel.org>
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

On Sat, 14 Nov 2026 08:59:52 +0000
sashiko-bot@kernel.org wrote:

> Does triggering on DPS310_INT_PRS block in dps310_fill_channels() waiting
> for DPS310_TMP_RDY whenever the pressure rate exceeds the temperature rate?

Yes, without the trigger handler fix the cover letter points to:

https://lore.kernel.org/linux-iio/20261113230241.82046-1-zoone.rupert@gmail.com/

It is against the fixes branch, so this base does not have it. With it
applied the handler does not wait: 32 scans in 4 s with pressure at
8 Hz and temperature at 1 Hz, 5 without.

Rupesh
