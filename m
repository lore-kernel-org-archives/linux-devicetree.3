Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E65360EF0
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093902; cv=none; b=nYuueF4MCrj8lJECmrxKieJl6OeI1EHFSujiVgiorPvFrcLs410YneaufYSFXCfIrJmWNRZwK5N1+axvYXY03X7W92lPOzOERKFqhc5dmD8tvd8yAalbLx0cAzUg415r/DAO3oEjLVchptXh1lqKm+7Uvt6cKsUIq8oaZVaQvDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093902; c=relaxed/simple;
	bh=Tg9Fb0S/kn3WqXmtsngaJ/pCDuNRSXzw1e4JgFn2CV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcFNcHge4qL/f9fXp6zndUAasMi3FHdcazrsHLi0B8b0CoKSnuK3LdGmP77IjPwmkvwsK6A09cnKYNqiUP24N43vOtiswavbKrrD/ovhnp02Li6+JM5of2RPnRjCqxjlUpx0Un9SCAi7NVr4MocsTz06Ar4MmHvceEWpUckr6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUXH9Tqq; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUXH9Tqq"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381b831d535so613755a91.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 23:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093900; x=1791698700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=;
        b=FUXH9Tqqy4+V/J2BXYW0s6bQnwHBaFsdUebF3laxhqnap8pKjApMFX5pm7Atq9QUsU
         FpAvpESLLfSIRKBNbj5ToTmD7ftntfOQzyX1wgjt7ku5jQIGEHau045eGctWdRzCcEHW
         9r+EDIMDBZ0Lc64IuCMfv+1jxbMjzrNgTR+jRijzxNkoTe2g5EeWdZMhcObQP/xXPhvi
         D0zkJQp1Qvl6a/02ndQ7XwfKXXXITZS4InG5hKfAoj8/I/+PC7a4G/9UDMkvhDs6nSCS
         A5RBARpTAA2DrxgJQDhtXagYbMbPHhwsIPQYed3Rys8SDngl2O7j7AOjj94mLPY7231s
         ey3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093900; x=1791698700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=;
        b=DV8UTpyk/jHH/WU/7d4d7XILvNYluMh0nu6CAsKdVWGvZSLTELSsUgaMxQ8cCteFIe
         R7qRvxwCrLuHOqNJ93aLTF5MYuTvGdTVmNVS3+HcvVBXhi6oKcjPa+R9HOLRXbFK16Zm
         t4TsL1+HN2p6TAKjUYvzuixXH8hlUxrKat6sKMXSxeDSsmsntCwqFfbo9ckPJLpZ1p6k
         Y8i4U9awqLTp8i/3OCjP3jS7s7JG6STKy8g83227WCY90XbWOc55svfDmZKHXqEOVZwT
         K5M69ETkuA6pvmyKb4kevWhidj6OIloLUdcKFbbQxm7+1pn8VlQ+IwO2Jjom5UP0NmRS
         G2TA==
X-Forwarded-Encrypted: i=1; AKwUvByaw6Huj8yYNERI79nWsLmYxWgJ8+eSL620A2UpjcE4PKimcXZKoOmyaEUhOnG6kBhXi4ZumU6eg+Jn@vger.kernel.org
X-Gm-Message-State: AFq9FYILQzPtzrDmbCnGqmgrA5ybY9fsnWN2c001dDdsVTgRxQYiggBv
	yTJv7sA8Lsm/ncCA5QgyYkxw7ArziPnHo2Q1WGhcNsBaqD8yO8WhVSRA
X-Gm-Gg: AYBFou2I0EDgaA/x1ePRhftTRRz8O3wITAtuB4iy1/Cu1pK9ImIaWgosy2aL2xDk/v6
	0mNFDcMfHOK9drzhuwUC1oQrfxR7wmOMsMGMqzrFil2F0ejSKZHzhAqfQ1R4LI7GCpSOtAXav4p
	74Tcuv95OE51DVo/EY8COC+VkoyKNHsZlmFvxshFFSzGKRPyjTQHPGGbU1TZKz3dzQXI87AchXs
	rI/mUvdePeM8nmDGgYkIEbnDzqViD3knzuZgSXn2Xp9CBsltoZvc32PMWHoXL6gRszIsy5Jn8Z0
	KY6wOhuR3/+lZLb0k+pjm4eAMD9ao7NQizxrKS5NP/yJYNQUqt0pJvetHUzjWpBlvEg7pDZUQzQ
	0qYtFHLnkIc5B8lhwLvpmApFztf1kHEHlzBljsoM/UVTNUMd4CxSYNoVnS6zHyEQ2hPQt4AGKMb
	tff9l5eMba01ELIKT7ttOM9u37qAr4wWLs0sHK9CFZA18ZYgee7pyLKdXK6XVgvrgPFgAy99n9H
	g428eM3akKy7nKBhhx+TM92bVYpfULRJ2yW7Aoi80fWEPE/KYjK5SwZLZ4/3NhyFcekGDLW5lIC
	ib/w6C7DKSJoSVtwfEEZ1ttjkhJhAs4FvzhSOacFvFqFbs17
X-Received: by 2002:a17:90a:c2cc:b0:3a4:e89a:21bf with SMTP id 98e67ed59e1d1-3a7873db396mr2835623a91.39.1791093900190;
        Sat, 03 Oct 2026 23:05:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:30 +1000
Subject: [PATCH v2 03/21] ASoC: dt-bindings: cs42l42: Document
 #sound-dai-cells property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-3-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Tg9Fb0S/kn3WqXmtsngaJ/pCDuNRSXzw1e4JgFn2CV8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+RM2Kmkv1uvQWTh/GVrPtZXmXm2312b5qR2vFcma
 s/nKbo9HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKme4MHwh5/zmoP++ubfe22u/Q+uY2q/VPFuA/vh/VM9301VOuK8YRojw9Fnp1N
 arHpenZUxm2ntFt9WGnNK5VwTo6rAozy3h72anAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define #sound-dai-cells on some machines where this
codec is part of a simple DAI. Document this property to keep the style
checker happy.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index 6c100cb36699..bc759eaadeca 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -26,6 +26,9 @@ properties:
       The I2C address of the CS42L42.
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
   VP-supply:
     description:
       VP power supply.

-- 
2.55.0

