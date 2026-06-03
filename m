Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399E03CF04F
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495732; cv=none; b=XI9TDBkDGD29vcWfgTHFMO0SxUq8icZ/UT3dogHz/R354gADgpRyH5mgUqUEeKkYAKq0WZhAZpFUk174tMyHtlD0Bp4DL/WkKNU7QPUgGHoVY13SRSy4+W3IQEHi8dEelL7+Jp/Rujr3zr91DJth0bfXiVI39iwmGgj8Ezj9qQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495732; c=relaxed/simple;
	bh=MpSgj5el1UVYK7zjYuenFbHy3+sHjfdFQmv/MNihzhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KNuKNxl5wepkzUBk0+qlJoc7kxmObsKYovYrPDYFapKMThlhpWsEloQA9pVReNcKZ5bsUoX3gnHlVqWqj//yrKRJ/eNLXbcW04l7+UZa9Sg8dQE9QAsyBKOTdZnuVUiiJRMo6bu8iJoOrEr0L4lW9hU3nGD7Q9rjLZL7Ba+L4Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TW3eath1; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TW3eath1"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bec49f7e35eso508733866b.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495730; x=1781100530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpSgj5el1UVYK7zjYuenFbHy3+sHjfdFQmv/MNihzhA=;
        b=TW3eath1yGGkCfbG6gRpcdGYaoKNvGk4RLuJ4+b43uT75HULvKRNHo/lK/IrYFiinI
         ylswzQJLGivTzSFSUfkT8sej1kyqhnfuQXoBXdXaGk5f4q0Ixvo0+MMs5TacpdIXXcIE
         vqjQUqxNJeCg05whhyH/NwXo1PXlFBzm3J73ui7uPxPcfYkJQEB2h1Z49lBPIXEpjPmP
         h9N5feHN0gjibO0AGgKgf92AkKreF9FcxBQh/zNHCoW4cgASUcetTe5wr6Notw5o9tR7
         8+LYegcLfYlhJozSvP6xWBlDqoQkRczmHknyajckd4vZVY/YlortI+WpLVqMRw5TuRrS
         mFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495730; x=1781100530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MpSgj5el1UVYK7zjYuenFbHy3+sHjfdFQmv/MNihzhA=;
        b=gDrQZnRtjYhyMsLC8kmifAhqWbyKKkHTgpE5eJV7Aq0SPbFhOkrFLEtRM3ufjpgk+6
         /w5s3WZYnUQU0berYPxvHKiHqpAiG9JfaTMs3qXATbLLbX3CrLpKmEK2GaQAVwsRKRhj
         KTZzKcpjPoAfHoCjlWAYQve46Yhley6TlWZdQPcLWYTk3SUAu8HksLhkGxf6YBza0vvJ
         vkophR0uOlEEnYuKv0lXPmvuQkrbALjITytbaxm5QgoIcgKoZjNCcPhds4Eagms0xL83
         XIPKgPVceVeT9njCNkWmPIMiIhL6ZQsK41y9EvSxk291iSFkK5ZVvHOcnPRlIhHbJ+Ox
         +3pQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VvXy6j+ZgnpJvbHuWylsAkpY4T3H6tjFL94CksWQDF298hf52Jnyy66Ia3eFsq2VP2DQzcmOWGqiC@vger.kernel.org
X-Gm-Message-State: AOJu0Yznxe3loLjp6Lk6kyyg3N6X2Mviuy5XaWoAQZaxp+W6Hrj6gK12
	laep6qb9SyY3E+MPI4vCIQy/yzih2ud1XcLiWacSwsS6AGnJ2HAfFaa7n/2X0NLt
X-Gm-Gg: Acq92OHIDo/WSMWHClfiI6llGsp7A+tipil8khkLjuTHzzaNL9q8bULh7Xvq8rl85h+
	dYjStjHyb03xpIneK8SuT1HfNr2BJoWRUoVnFjGiF2h+hr6ogZjMiyeOsCrOUmGpscQa496PN9j
	lvWQ7STYVKo3X0OHbP9lo8AJDrDKwiYik8hMJ6k6H0Zwvb7RCKvPQvI1wm7I+jWy99S6uHdyGb4
	wPjKlLYHR50epHBNz88DPhQJRUWPRcyrsTl1orii7vRXCoG+Bt7KBKAmX7gTcxV78uoqjMKh4WO
	jejsyyzBZ+QvjauJLLUKxgtBcV9jpCuX9FoA9JQyeHhryHazmIBnpy8imoIOv4WERpkWwnjxwqH
	DB1nMXLt5xMpzbkGkOqu5Xsc0pOxCrEjns405vu84V2cchTT4z5aKoYqSgaXbkgKfUPY794J5JX
	VESNQMrWAeQV+vpZvHv44uF9fojTpT0O1cE0FjDDI4b0BsiUsn6CWiUHiJ5HdCP4HXm+NhCCmCr
	liZQb7lOT+s1MZWtg==
X-Received: by 2002:a17:907:cb83:b0:bed:a213:a8ac with SMTP id a640c23a62f3a-bf0af7fb01cmr178950466b.45.1780495729338;
        Wed, 03 Jun 2026 07:08:49 -0700 (PDT)
Received: from fedora.embedded.cmblu.dev (p5df027fc.dip0.t-ipconnect.de. [93.240.39.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1ac0sm162062866b.62.2026.06.03.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:08:48 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Wadim Mueller <wafgo01@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] iio: types: add IIO_VOLUMEFLOW channel type
Date: Wed,  3 Jun 2026 16:08:33 +0200
Message-ID: <20260602-slf3s-v3-reply-03-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260601104233.310ac930@jic23-huawei>
References: <20260530205435.37326-1-wafgo01@gmail.com> <20260530205435.37326-2-wafgo01@gmail.com> <ahx5cuM1xlOVP6DT@debian-BULLSEYE-live-builder-AMD64> <20260601104233.310ac930@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 1 Jun 2026 10:42:33 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> I don't think that discussion ever finished. [...]

So i need to decide the unit: l/s or m^3/s? My feeling is l/s. The ranges
are sub-ml/s, so m^3/s only makes the scale 1e3 smaller and the DECIMAL64
precision thing worse, for no real benefit in sysfs. If you want strict
SI i change it. What you prefer?

Wadim
