Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B852E3CB544
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880139; cv=none; b=AbZOxn1DvD6DgZBb9KSBIcJVP8UOqDBN2JVrKdCa63/Ve0X21D7TsPQW+0c5l63nUjGryBQ3gFoQh+q7PkdZQXPdCzcTM0zN6OVu/NaF8nan7+dlqZTjv8u005JX07ROLaYtUTqrFSEnLqJlTVF2is97zTgpTv9Yc6UvbvfpmW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880139; c=relaxed/simple;
	bh=vjc8kzENgz6iKNAy+aA+ET9iiFQ96+MVJmNToH4ibVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGasJcr7Gk5WFnTl2pGSQca1mjAedE02a+9GHvTaT/sSoSWZ+mIdPGmaBQ34l9rIN9uqCHjOEkCKt/8q79oGKDm3ICd62szb7AA2PMMKOhfqHbJlQs84R3mgfJxnc0gl00wEEds3vOwEliyVAQMYIbaN2bFwYHQcCa7wrSlxU9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhNsfMsK; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhNsfMsK"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df38376150so1165345ad.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880137; x=1790484937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=;
        b=YhNsfMsK0qk6onzsVi58+SzI9I3WoyBfqN4CqEjUIBImnWEhhFpsM0ryqMru1niaN/
         TtBpZo/vEaOmhVFIp+tzkY4D9aJt6pwTlv0iEFtgCTEnXIX2aRPQuVph9lfLhLDf09Qh
         rEnips7XyrbCo8HIRrawhZBA2wkgrEohk1ILg0/RSsG2t5hky4HLwVJu4qCYTdis+XbL
         9f88hWyjeJkiN7qJSPxDZcuigFbPnSUU9rWpHr6oKgKO2qZRXIT3lNY7ErKCWY+zKQo5
         nHKEUpYaPbdBg26ozTzWt3LaHhDqJusFr0DtsSvAND35I0+Nhx/by8XPxbw32ppfI0KI
         7E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880137; x=1790484937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=;
        b=QqiMEx0kXNxgdpjebEE1aU3QvT6wzCxrZtKWauGEFyU80Hod7IGDVP5urAQovVvytb
         4xKkZ4MnXmb2r95phnEe+7Nw1qFrqgelQ3lTrMg489tKHgtEpEmTTL8LoGF2VNdI3aiZ
         ps+NZwq7FYWeHqnEqGBJMTJVFFvjBbeikjAdA9hcdmo9UXG8X5w1OopKnsChtiOR3/Ec
         Fo6sNthen4OpW3VHsxwEZ6rVqlVnQjb86mJDWyvIbhABUCHOVcr1oJWmUubGXea2wV/6
         arYreYmD0Qt/sR7QWYyP+DKnrsAADQ6kqS/CLsSS7sI4/XqgX8gNf/R7Pt5/qUcRtBUx
         9/kQ==
X-Forwarded-Encrypted: i=1; AKwUvByx5oq86BHqn6XX6+3qHj+dm3kxYizSufRGeb+BHx5FWAgwC9bE2R09wBluSHwGh9W07p85QXYvPC7T@vger.kernel.org
X-Gm-Message-State: AFuF++lySe50/Y/wVvXeBuzVU0l+HiK41GB8RYELIJVnDVtLKA3TYN/W
	q+c48Adj6ZVon5Rmo3USOli0rF1/U3ROrM/h+nzZ9WHzjS1HHWkvArA/
X-Gm-Gg: AYBFou32L46QF1xcyjQLAm5moovBvwgE2nKV9Edg+5wFGjr9LYt+MI9jggWwooYy5z4
	IN6e3WexlnpT/PNBP8qJeN0E1oG/x3rQX3FrDZ7Rb+Vx1jwTocZhuOr6YIeUGnZ1QZGXGxTtm+N
	f2PmokW7R19gG3EfnKmCKKuyEUgBqhaUqwdD8/kkT+Al6hgfvYx3I6B8H2mX1xBr6yS4r6i23/y
	sqFXlKut+FfYZ3LPd7yDCfStTUGnPESwtQBWZM7f6UrUpjz+ozYZpCswaNCI3WSG+7Ev5nBg1AD
	24hI0qVvD4zxBEEgexhgxk4kBMK//mFrK1FonS4sK2/wSVm+iJX9BOonfK/UOitRQX1NKUxtdQW
	FiVmkGtPqyjTjplBiV605Wrlx6e6QRIYFFPRoY+mdxMpQVs1KHyNcPXOD0nn2fLx11VciFRkmmZ
	FOVwxl2oLg4xgQMS+3fi/i0eAnl7vLRF5H571tBInI4bzUu76zIg0HLujT/MISiwhZyKEElJyls
	3CH1CwUY1DP/pQngnloQgMj4VGrJLOBabmWxy1VHKwDV+vg/WuId3Le08gttLbpJzS0sHifozlj
	kC2MoUq3tt7IuJShhgFTLJRbOSXTRvTGy2LBGJo3PtYeWR0=
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr42342795ad.37.1789880136783;
        Sat, 19 Sep 2026 21:55:36 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:36 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:42 +1000
Subject: [PATCH 03/28] ASoC: cs42l42: Set a faster digital ramp-up rate
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-3-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=OmSPjK7SUuOGMGgXmxuIo+R2IFqwguXc6h4eMDL7B9Y=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UPyfalrpv1r+xTfu2HLE4JBaWJnIbuCs4xLr/5f
 j7JPX+yYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNU3NBj+6VWfZumKncEUeYQh9bx1/ZJCiWl7v/0OePDm0bym69Z1Oxn+F3iHLD6
 yt/urYQ8zk7cEo0T99E9aWpIxG7Ysk69699SeDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

With the default ramp-up rate, there is a noticeable fade-in when
streams start. This can be undesirable with aggressive muting for power
saving, since the beginning of the stream is lost.

Lower the digital output ramp-up time from 8 samples per period to 2
samples per period. This still leaves some fade-in to avoid pops, but it
is a lot less noticeable and no longer feels like the stream is fading
in.

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/cs42l42.h    |  4 ++++
 sound/soc/codecs/cs42l42.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sound/cs42l42.h b/include/sound/cs42l42.h
index 1bd8eee54f66..b3657965d491 100644
--- a/include/sound/cs42l42.h
+++ b/include/sound/cs42l42.h
@@ -62,6 +62,10 @@
 #define CS42L42_INTERNAL_FS_MASK	(1 << CS42L42_INTERNAL_FS_SHIFT)
 
 #define CS42L42_SFTRAMP_RATE		(CS42L42_PAGE_10 + 0x0A)
+#define CS42L42_SFTRAMP_ASR_RATE_MASK	GENMASK(7, 4)
+#define CS42L42_SFTRAMP_ASR_RATE_SHIFT	4
+#define CS42L42_SFTRAMP_DSR_RATE_MASK	GENMASK(3, 0)
+#define CS42L42_SFTRAMP_DSR_RATE_SHIFT	0
 #define CS42L42_SLOW_START_ENABLE	(CS42L42_PAGE_10 + 0x0B)
 #define CS42L42_SLOW_START_EN_MASK	GENMASK(6, 4)
 #define CS42L42_SLOW_START_EN_SHIFT	4
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..c40e8da8f6eb 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2422,6 +2422,16 @@ int cs42l42_init(struct cs42l42_private *cs42l42)
 			(1 << CS42L42_ADC_PDN_SHIFT) |
 			(0 << CS42L42_PDN_ALL_SHIFT));
 
+	/*
+	 * Configure a faster digital ramp time, to avoid an audible
+	 * fade-in when streams start.
+	 */
+	regmap_update_bits(cs42l42->regmap, CS42L42_SFTRAMP_RATE,
+			   CS42L42_SFTRAMP_ASR_RATE_MASK |
+			   CS42L42_SFTRAMP_DSR_RATE_MASK,
+			   (10 << CS42L42_SFTRAMP_ASR_RATE_SHIFT) |
+			   (1 << CS42L42_SFTRAMP_DSR_RATE_SHIFT));
+
 	ret = cs42l42_handle_device_data(cs42l42->dev, cs42l42);
 	if (ret != 0)
 		goto err_shutdown;

-- 
2.55.0

