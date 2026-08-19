Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F1A44AB9A
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136040; cv=none; b=SkYy9R8s8kuUJDSe3u4v/rBV+XY22bO4BoA01yU4kqC4aC2BsZRpKI0lrXdQAam6sVyRXdrvz6ixDMoOoft2NcNVFvyOU+/Ir0wBE8Q4LqlhY0j0aV8wl4toMVep+oixhW+ki6TqxgUFKnAdgFuVUOHAzKYM9gPBOqfYircwvLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136040; c=relaxed/simple;
	bh=RCjmT/Q7v1w5wuF6vPZbR3owes4uAzeW/tyOyXg5scg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGVzxISlw58Z66S4RboQOk1JGvB7zy0IE+7dEz49zfZa6jkSUqE6dGIL0pK1sSuQoyHPxJrdMm+pNPylzIwp9xY4nr6jcVRPIj+p0vrQTdYXzG6/kS6o/eK6Rik4Wo0b2srMGaqQOowWFGRdurZV4+KZRiZ1XtboYtB5lMH8HFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gioJdU91; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gioJdU91"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca7c1176317so591398a12.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136038; x=1787740838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dnzc7GZdTOxbd3quZMussPF4U86iKiRKoVv0Cicg+UM=;
        b=gioJdU914pfgZMP1JNEi6KSIhGuzS5bFVENuZcuuP5skVfDhcmUHav8nmA++Hufmwv
         Q9ltH+CPhJIMx9ORbptz4I2/Mog4bhGAnOzyRK4v3Y+tb0HFBBiY+nOjBd0qz8kg4MZo
         Y0BN3WLb/8NEDcd+M+yMbZ+miNr399Qd5UhORvKf1GVKAoobaB9c21NIkdXwkl9NwtbM
         qz/zvcTS3ToFCOZvprSWcqN0VscrtrdS9lJmFVYv8S9chOP6ZmQexyUqEC6e+8ZC+Hn6
         MAkOjrvdmwN2xopiA8nukpT2mb/8Lyduppq82Ej9WEcCA4prlnbLMFfBvuMagU3dFWnI
         VkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136038; x=1787740838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dnzc7GZdTOxbd3quZMussPF4U86iKiRKoVv0Cicg+UM=;
        b=WF8JEBwh4+TI2Gfm8qHlGQbyjiQoFkJehoK9Vq4imOco1auVUWN5R9KI2Rd8h5PegO
         cMbt2/qSvASkKl8zDz6PJUOcSE4FXpo5U7KEn+8DQ1OhUCsh3Ee7F/lhm3iD41pm7EXL
         HPzt1V+SANOtQWqoUnhl/o8pQS2V7x2R5Nar1h6KHNYnxmQTetASleV1kyWcYKp5awto
         4ZcviriffinGDK6RgzOn6J0NjCYLYedC36zQy2NHVNTlfFpMHsfWB6fY/u3pDAZfPZZy
         4LyvfP3E2/5XfAVVJLkSSDp0FdbwfbmjwBozEWtO0yZdXDqgpyRL/lRV+XOmruO6EWm2
         UfBg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1qxsDm8BxuTaBQNCe2trFrt1lp2HTNT66ij1OE58U3eGt0y4tOTxR4KYtYoKiSBApHdxxAJZk8s1l@vger.kernel.org
X-Gm-Message-State: AOJu0YzYLZLFW7adQWrqnabxzTV0AF+hi8a3oI2gNf/hveupjmf2e0CR
	CRfFd3pKDb2CL3yBQVs2DSMTB5IxfyiX3gGTRR8hrvyn49TqB7HQwHbK
X-Gm-Gg: AR+sD11yhpDY4vEKD146RrNiC+eHDW9pTcbA2eTr3zv899nClNxPJziXqtFOLSqFTkx
	1OTgKKIwbP73/CsxNFoAtw0jm0yDyEEHt9j1uU5TSkgGmNOwRk2Gs3VDWPgFfghsfRygZ+1kPDV
	BDPKoJTg1OYp0VZMumtTbiPqCIoGbqDEWStKHzrwE8rdBHZUFp8sjQ/hC8A+CIBFyFNxE6Rb3GI
	+Uvzj9Lp4P0TdIvWuMVSOMClRBY/kfGTXnb6S9PPL9B77A98sE1urWkC3eCADot2XYROYyo8e7h
	stRTCkFDmWvibuv6VT3vCUh6q3L2NE8N41KbLjam3ecTtNWgGiOcyh5csOWbKjsf9WgIl85gNCt
	ov3AZJPhMYXstyv83vZ+YGcTKoqR/EYuUYgXDQxbXdOQhyG1JGBik4lRK5aN4sUKs7Z9Lv3Hu2J
	IiaWOCMvxktMIX3AJ4UJiZFQN1Cc/4aGoSCGr6gi3DGHyAw+CZO644WOEtYl0oUM1eEPoli7UEt
	8SxvEsy/VSo5ZZJC/NFobYhU1QZRhIMJNbgezSONeMw0kEGvS9Cn71zIgSQ+/7bgJUifbEwYY2w
	lsg4u3bDQGZp12Z76bfV
X-Received: by 2002:a05:6a20:7f92:b0:3c3:a3f4:5485 with SMTP id adf61e73a8af0-3cd00e53f45mr7055144637.6.1787136037960;
        Wed, 19 Aug 2026 03:40:37 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:40:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 08/15] rtc: rzn1: Use pm_runtime_put_sync() in rzn1_rtc_disable_hardware()
Date: Wed, 19 Aug 2026 11:39:19 +0100
Message-ID: <20260819103926.2136712-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index da7d13337c0d..425d9590c55b 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -379,7 +379,7 @@ static void rzn1_rtc_disable_hardware(void *data)
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
 
-	pm_runtime_put(dev);
+	pm_runtime_put_sync(dev);
 }
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
-- 
2.43.0

