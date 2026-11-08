Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175678;
	b=JYQqYtMZGMyTB24gUA6eHnnBM6Ca/FezSPp88+MnslPPuIL023uFcNoc8O1JsHLW7DJj
	 FmtxBmYmE2JOc2FnUe7YWVEDsu5IbYUAXNXKHAYbHeTH+SCj+uBPo4A1FMX+kk2IKuBFi
	 Qu45XdLfQmb/0UrUDusYQfCoXvWd6gIFVAefPmMvSEpLGBoeJDir0BQGuV9MtvjUNsBzE
	 xYtRLnlDdmhIb4IDt+3EPAIcRH+U/5QS7XpH/yeQZqJcTCBxtZlhUuitlXB2onjMU3KGK
	 u8OqoNFK8EW9Ofh4d4J/zqygGzB93btHIxn/kI+rbOPhoALexIs4rWMYrKyGVVhvYew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175678;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=v0eejaiBFkeUZP6gkE2+qDOnCeE0Ygw6Yg4Ofv8gSs0=;
	b=PFhMUITPqLErwhtCSHjvNjYy0tOGiI09ETcyO2BdLu98g+gCfJBR1x6Lp0FfsEflNpHE
	 2g4R7x/aJn1gtHal3t126tfz0zmpuQEk3cO324MKXy+PiMmzWfmXnEs20TdwYpodyQRl5
	 bwt2PF+2HYigwEe8jQPKIy8se5VhFcr4mTCRs+rLA0iMdjaQzXZ+hgXiQN9tSb0FGPseo
	 AeXWwXJvF/a7LT5/tFEn4eH5lbZXmdRCEHCIAkPAjomMnU+HJGKVgGQmkbv1njzZf6hLm
	 n4BKyXgBN+jfTY92MyHsGxZprVblx9dc/iL3Iu+JLZvNcxSlqsm53EOIfhJWpMk9CXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE84E606A32A
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 22:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE84E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987b4a710so1222255ad.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 14:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175677; x=1794780477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v0eejaiBFkeUZP6gkE2+qDOnCeE0Ygw6Yg4Ofv8gSs0=;
        b=cKYHDuYLGLT3ONH/vsZtYYKRIsBdrVnOVFNkp9hglfV0sURG9z/d1dSHaHrGhGxx53
         yeXIYjBHNnJ41o+7ZcKP20+1UzgD/a3eRPDyGiXZl2qttmUZlWd4xNupCzjMX142UWN4
         woy8DdLtVmK9FWlKK+UGEY78Y1Iuyo0j3uouD4f7wPos8IqnIC+g+lsAo7zybT7ebzXT
         rfzNarh9vVrMHyUksPtRlEea6IZmZKMFco56iH4XmHLBcYdSOQa2VoHflSED7aULk7A4
         5ckDAR2nanlCIWVEjrcNT6iPXKzqZ1+L6237Mv/P9RE7kaR44rsHia2J4ntSI5K94g4p
         C4Fg==
X-Forwarded-Encrypted: i=1; AL+hErEbrPS2S4fBW2tKNlw+72nSOvAOtuWEiPcjJoSU0cmfZCqOzAXUqMo+q+KFXWSy4m9h6S9WSdDDuKFP@vger.kernel.org
X-Gm-Message-State: APuU4Z8oMCjySItWKTRcIQGGM6dYxKMx5jlvK9IRvU9/917aGwp3ZGZY
	X13Bebg7VFPdA6j27QkdqdIOKq06l52bUHAthiL+fmV9C+877M68M2piYlyVtmnr
X-Gm-Gg: AYBFou3liuuxumYccpmXbgKJwx0vVXn4J0TAWNOJExesStvOpRx1emVC1scwuWByB37
	UQRj+zDZTzI45LpR6yTOGSyX7OG69BzcqJzCHbdDeKg1DNbSh5SRXNl2YGVc1UV6nwpW6DEsjt7
	fff5tfNW7r8WaPYdu7a6I1deI9J+FNnwgBQ5wqzfsiV7qa7EdIih7zp3kRGlhqfeBOOXSovwEAq
	m9xgOV9uNqc8txttYqpCBKzQacqAjtqc37jlC1tufVmEDYtZj0AOY3L9SlpYBnsSDNKobw0NSz3
	7PWXKjOv5736nDkb5hrtB+4ATWFccKF3j5kGZW55fgQerNKRwicxuLl1xVs7hAJfeiALviMDmb+
	coXBQY6K9ny3acatdHe4EimEJgUps5tMHKwoQSU5iP/X2xohjoJgxNl8BnwgHDXtJlqqi2b3Rkm
	fuEJV0zeprZXgq0E0wxBj+KuVnrRU+gfTIkZNI8T8eSmpgvmXQHkPcX+Jmwax+czLfJvsiNevOm
	QBSTsHIJVW9O7uSjfgUoPwSB7MySpbQnfY8MHEtkQCTnrXfPeQORUWfnatBegOSVESXpjyfLW6K
	ZycybyXeFMoDeogkSmPDRibwmuL5B9x+c9z9D4NA5XDqayGRH+Npo9JTshTE29nHBdsHJWJYLp4
	g8/jDEsOW3AihkN2M0gH3IfUMpA9vSJ2SnNkW/xc68/w=
X-Received: by 2002:a17:903:3244:b0:2e4:ade3:7290 with SMTP id d9443c01a7336-2ed681867b8mr37647025ad.30.1794175677180;
        Sun, 08 Nov 2026 14:07:57 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e829bsm5783765ad.15.2026.11.08.14.07.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 14:07:56 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so320727eec.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 14:07:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEImv4NVS9lC15ftvViUgzoZDdIbdHVWG+E0wlCIEcRSo4A4zk8zBQVyS+13JX9ZDFDdq2eSQGKszpe@vger.kernel.org
X-Received: by 2002:a05:7301:1630:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-37250ee43c8mr3901672eec.0.1794175675139; Sun, 08 Nov 2026
 14:07:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev> <au4HsW2aMYKyMspF@monoceros>
In-Reply-To: <au4HsW2aMYKyMspF@monoceros>
From: Joseph Telaak <joseph@telaak.dev>
Date: Sun, 8 Nov 2026 17:07:43 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4O=_44w52Ci94wjmbgZfFKp15U1o3t5rodC2C6YB7CnA@mail.gmail.com>
X-Gm-Features: AclHuK-O2KZKYumWb4i3a2AuPWKubDs7etlgwM1RvUJeTI6jva3RbnRyGORGlNc
Message-ID: <CAPY4CJ4O=_44w52Ci94wjmbgZfFKp15U1o3t5rodC2C6YB7CnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.

v2 will include <linux/device-id/of.h> instead.

Thanks for the review.
