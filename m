Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B60547CA89
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934600; cv=none; b=Th4TZf0QikdIXdo597Vh+cXGQAMDR/pLQaUNC0NdXhJFo56E7hpfntCKo1TPHZ2lPd/F/gTCEJsPAWImCKnjSVD76SOU+AIeNbWvS/DwFV6jLo0M5/XKG1sJdIU+Yel/+qG72pI2gJYmFFfirImFt+ShLqT9LzBIzY2sxrfhrqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934600; c=relaxed/simple;
	bh=3lOlktFAqnyOdTTnxV1RDi3COlBrsI3NZw3sXEpqQYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdKceFXwigi6Vp4jdhWIJq9BYwoYzO7ex/7AYT3O2t/sN8Sft44bgJUyS/YB6yWBzLdHchzc2xXYquJ82f7GEvccUaIi0FUiJ8Y8vlzwKe/GEswrrszCmW3oBdrcjF+tBpeZnp06QWNjfHvGRu+CaAX3IZ6RYXO0275haYEbiJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=p1tlOw1+; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="p1tlOw1+"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c4f4daso2163262f8f.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934588; x=1791539388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwpDabsocINC12W3N5eBh0bHuZzo2UoIUzRt8IiGg6Q=;
        b=p1tlOw1+jSEtCEh3ol9yZdBWpUt0lygal/yA4Dbyivo3/sU8/UmEDahI7OPt0yIq2n
         0h+mo3Ff0RuFwfAZ/MXeDdMmJY3Ufzybkw4skpe8fAf6S4NiRJKTnJdKg03otGkwSM41
         cM4hlMhGlR/50SOFlVBTnYry4QkthrOry1jlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934588; x=1791539388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwpDabsocINC12W3N5eBh0bHuZzo2UoIUzRt8IiGg6Q=;
        b=mGZ/kM8B5ZRVcGjskT7DUNsBlxHFV6AzcVdt5vbJClnPO0etfZrnpqwjkgbBaoR9fA
         joSTGV0DW9fDYnB+WaKYLAVRxHk053dgYvhmz9XY+bl94IrLqEliCHSvRR2v+6lU+YU4
         Sm2Pk/jIwvMtfcz5gsWjM98gRzxNf0rXYk7urd0pc1j5ABgOa8Vg0sWZcejae79pBBt9
         j/kJTvctIr5vsqPQWdnaYo1GEh1+knu8cNMucZi3m/3LNmFQgPvCWGJNPgwb/jTLAVsk
         3MS+K3i+ZWg7dtVhILiJd+QpSnNl9uUb/4Z/R+JbQRp0ZzUAc1oja8B7HAzqNacZhXJj
         mkag==
X-Forwarded-Encrypted: i=1; AKwUvBxf2TFFGTzcd720ZWNdY1Ssj7YNS/hIOaX9SFjAHh1+97gEpvBbkXBo+aRqBuW3wCU8DwhijRAFiKc0@vger.kernel.org
X-Gm-Message-State: AFq9FYKgDixL3KMYfY0VTcJuWQQ4fMnhnlatNHSQuj9WejelhqHmSWQJ
	pquGYazJeXzKLjQEeAkZ8VB76n21oB/lIsj+lyTYZXl6n8vK/me2JSKYpac06kch3P4=
X-Gm-Gg: AYBFou2bxe+384PmO00WsBVWKneRR06Klu0nbuY4oowlJpY8Ywy2C9mhtUESz9SyU3Q
	7I39Mmgg4kTCLv7LJ2ITYsHPJIOO2lOZIS43UraRuTmvLwRQUihwcwZmoBzT/XdPPftJ5WKxPWt
	8l9NoYxuXCZ5AW7mxdZyTq5DHx36AcfaHRfVqVIqwqkWvri79gJCLh1CIY/qGOZUq5zEF52J9ZQ
	R94VfE8zN4LQbZuBhMBg6UJOdP5wMP0FzBD4KyiEUoNC875Rdva5x5AHPyGDqKu1iz7gj0r6kNw
	h7fLo7kQbXE+7keNUs4iC001YBK1OW450dLLD4lbIi+5nL7jvKYtKErAihJ3MhSmlQVuGXD75X0
	NAsZEAbeNwK+cuaV9hsb9OVmzjJ81OsA7TJ2cymPuHii0djEiJJfJqg4sJ1hBb3IWeQR20GPXDV
	VmC3gcGZLS9gSk2QF5ZHi/E8h1U9ryexkK1+7hp6/RRO+bxVGBc4vPtzZJTHu/ULYKbbNbkbOm/
	PIIef7t98rSpQ==
X-Received: by 2002:a5d:5f8e:0:b0:487:bcc:2c08 with SMTP id ffacd0b85a97d-48b1271cd1dmr3972478f8f.14.1790934588564;
        Fri, 02 Oct 2026 02:49:48 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f89c3sm4149829f8f.34.2026.10.02.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:48 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:32 +0200
Subject: [PATCH 3/5] ASoC: pcm179x: Add left-justified formats for pcm1792a
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-3-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com
X-Mailer: b4 0.15.2

The left-justified format is supported per the datasheet, but was
missing in the table.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index 61b87dab3266..c059e410cbbe 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -75,6 +75,8 @@ static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
 	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
+	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
+	{ SND_SOC_DAIFMT_LEFT_J,  32, 3 },
 	{ SND_SOC_DAIFMT_I2S,     16, 4 },
 	{ SND_SOC_DAIFMT_I2S,     24, 5 },
 	{ SND_SOC_DAIFMT_I2S,     32, 5 },

-- 
2.55.0

