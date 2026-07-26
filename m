Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB84134404B
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045164; cv=none; b=umjiQ6ZRAloL0zjfkRUO6KGMloYA42oTeayNVM6U8aPryuH6O+4AU8si6bs5qEh6JzQuD5+6nWCyZWYcmG9KPF0t3RROifYGOpi94RIPZJibfNsjkCId36WJITpU5gMomFekTO/0YeSJ/hJ1QI3B9099toDZmrMnzLl6AnNqFqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045164; c=relaxed/simple;
	bh=REoCkpjZG6EGkwi3/NcgXDxk3dKaXNO/giFq0Nnxt98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bSVtOfb7uOJBL3+6IzWl55K90THrGOm9Ic2IpVvHIMGeanTXv15coH9h+HSUO+6yYtRp3YyjQ6OLSyejPPPQPCka/3ESpY2PxCQVDAm1/biR/TnjbOnQm8WeeLiND506Ui+MQGZajnoQqc0Z0qacresTj2oNcJ0l6tG36T9dP40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJThtp4H; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJThtp4H"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1612057a91.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785045162; x=1785649962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m1fXiu6dhRaWyJR5HnGju+ApcgNO/yV2Ni3ZdqRUJ+o=;
        b=LJThtp4HthDk69kI6+4TRoE/HzktsW7urAYabvxIXFaP1xTGJCf0CC/8869h3Q9iXu
         /f9OaQX+H++bIwHoVmCRbVr3S5grYgZUdXeXWUSBiFgud3atMKCgqlQn5GVLZUe428wV
         h6KmSD4oyIziN0FrYE1SocYhI6UNqvqqO5HlztxXFbs+69Wq3+qq5F8+VqJaCukB9bNG
         N8yp+l+pMEByC6yp/TF0cb/jLXdo5kda2PBOWCRoiIoLcSzmH+b9y6+F/CRCqGk2qRnI
         MoBjB9kCT+4gklyra9qlQiwsbKqkauW+sVKQN4wZx7yzAs4DGtdvcUSHJ5DLjFtIg++V
         QMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045162; x=1785649962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1fXiu6dhRaWyJR5HnGju+ApcgNO/yV2Ni3ZdqRUJ+o=;
        b=N+bIUbUMS6ofC0A6mXEH/tV1ZPQsfU+EM6GFOA9On1TVFFqwtsTomNfJ2Y7kdAzd/L
         0mZNymyrk64l3dg/zBug7rst1D58f0W3I3aQOqnnJ2K8qXQmU0LK97HFo1dgdFa1OpSD
         /FT0sMtUy7DNnEQFli1mQPTr8wYbysJKPFuiLz2VzDRcARUGAEg1CT4iUTEXbvZmoKXV
         Yy5WPpHJhORfMqQ2eNYMj2Fqz3ySjIxPPnyE18CZPDwP1VcaNs1+AKJJd9tOi1bsMl7X
         nApkWZJe/YhgtIa2wFjjLGDqQv51EDuYZdSxxkU3zfN/N5slBRSpekb+yYuCXElV3c8E
         MmNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUfnjGbRvZPUpyHzY/4l9TidhLaGg369SKE34dQapsLwCpz3ezxN1md/xUcpQyda499/UpAcwMiQfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxByxWimrZsHnPZhfByQQi31z/Xnjv/JxvFqRUiqeFjKk8HuVZs
	2V9C5M+gL0yXsbszi7KjjLPJaJ+0E+IKoRvyjhyxG4iwjrOb5bM7wkwZ
X-Gm-Gg: AR+sD12xf9VCXSeJN6zb0uledjXJg5asTdQ1CbGllpxNjEoU/3d+izng2F7gM+rsScB
	xdAXPbw/IK6w/o3WmyYhT6ns6Yq6W0yjcEQ1OAXCrr0NucYHdHPMylYzw3MP94JIpzZk6yY6GW/
	vP3G8a2g8mvT2tg8+kgJfDx85206Ny4CJWLufOWYqkNZ7u022+DE0ZUwnvGY5Uw1QR4ceMrFuLo
	wEngJoYZL9vT1GV2Fa+Fev7q2MOsg4M4HVLg0CYPwYxNAOWzPPfn0sZ476flVC6W/EKVBV0HFfK
	yK2Hi0ZSAlinVG4UW7okV6jZfjYm1o0avJmCTdxEFyTlOBcqxFEeuZXo//pW7QuB66rxqYGkAyS
	50jUsFQaiY/9RZ0ERqZDyBK0GSbHVlRCEpLJorlQD5i3XP/vbD+5XHr4iJQS72rsO1LALRAGajI
	6nbN+zpgSgDs91z0YUTdiVoRF74Mj4eNgdmzxComJPJg==
X-Received: by 2002:a17:90b:3e4c:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-38f2952ae80mr4111975a91.19.1785045161885;
        Sat, 25 Jul 2026 22:52:41 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292d2eafsm1418969a91.8.2026.07.25.22.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:52:41 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jack Yu <jack.yu@realtek.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: fix spelling errors
Date: Sun, 26 Jul 2026 11:22:27 +0530
Message-ID: <20260726055227.18123-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling errors reported by codespell:

  susbsytem -> subsystem (amlogic,axg-sound-card, amlogic,gx-sound-card)
  vlaue     -> value     (realtek,rt1015)
  spped     -> speed     (st,sta32x)

No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml       | 2 +-
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml        | 2 +-
 Documentation/devicetree/bindings/sound/realtek,rt1015.yaml     | 2 +-
 Documentation/devicetree/bindings/sound/st,sta32x.txt           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
index 4f13e8ab50b2..177db900d4a0 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
@@ -30,7 +30,7 @@ properties:
     minItems: 1
     maxItems: 3
     description:
-      Base PLL clocks of audio susbsytem, used to configure base clock
+      Base PLL clocks of audio subsystem, used to configure base clock
       frequencies for different audio use-cases.
 
 patternProperties:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 413b47778181..6fdf605ad59c 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -31,7 +31,7 @@ properties:
     minItems: 1
     maxItems: 3
     description:
-      Base PLL clocks of audio susbsytem, used to configure base clock
+      Base PLL clocks of audio subsystem, used to configure base clock
       frequencies for different audio use-cases.
 
 patternProperties:
diff --git a/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
index 880196081a60..3c44ebf93a44 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
@@ -19,7 +19,7 @@ properties:
 
   realtek,power-up-delay-ms:
     description: Set a delay time for flush work to be completed,
-      this vlaue is adjustable depending on platform.
+      this value is adjustable depending on platform.
     maxItems: 1
 
 required:
diff --git a/Documentation/devicetree/bindings/sound/st,sta32x.txt b/Documentation/devicetree/bindings/sound/st,sta32x.txt
index 52265fb757c5..266b6fc9f009 100644
--- a/Documentation/devicetree/bindings/sound/st,sta32x.txt
+++ b/Documentation/devicetree/bindings/sound/st,sta32x.txt
@@ -73,7 +73,7 @@ Optional properties:
 
   -  st,odd-pwm-speed-mode:
 	If present, PWM speed mode run on odd speed mode (341.3 kHz) on all
-	channels. If not present, normal PWM spped mode (384 kHz) will be used.
+	channels. If not present, normal PWM speed mode (384 kHz) will be used.
 
   -  st,invalid-input-detect-mute:
 	If present, automatic invalid input detect mute is enabled.
-- 
2.43.0

