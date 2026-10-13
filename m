Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F5F499F24
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916360; cv=none; b=DG9oOHKJsZwqG9bVIp4KdN9X1euPXLAbyKkCDUb4qtwzxzzSx0tq+SB3kN9qGLgFZAKWG+2mCtw4TJAcVqOpJssY8Vo8GwzK6mXrggB/NIVy2FJvVvUDdxIzX46dLGKA9StihGlXrYK9H6UYAKpb+ZBkoFGIKf/FecaMygdUPS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916360; c=relaxed/simple;
	bh=coCkx+On/PYyms59yzcyUxSZaTFniVRkfGkf4kFQfdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h4+RYyCjsjTZZZzK/2HFZznTEhoLtONmgNI0RUtTgJBHv+aQbPWZstINQpoybKBdo+D88DR6vWOAoggs1Iw86XHufmthS1zzE6POk2cm9wWbx6RK4YB2UihzDPaLaiywU4VkdAAstnTaBDObMvOaeoGQbp4bFcoasoE3k+f3XZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flswW5Xp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flswW5Xp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so1886105e9.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791916357; x=1792521157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6xu/m6gLmnhmuK37G0mkWpbfD0iKHbUJbBWVpw5Q+Q=;
        b=flswW5XpxZC/2Q8jDTyXpWt9BiMv+mvr5R/28HN004YKnIFZjdaWyhvcKlObT3dKSL
         HIZ3v+IZTgwDdIDtBRAwgSiiJIYDKsJcczvBZokR8gORGxRdRHKDJYxKD47lSICJXJBk
         d+ryhQwA3gdu/Tejk/DW5RVdoGWc2l2XGxLn273PRsf/oR1Fl42AfGFPw/JBKMYjpx29
         uP5gbm3g9IhOn5/f+UBaNvZzk+LxAaOaSgbWrCIWgXWuaNPB6QauZIaP0b9I61IoR1pp
         WnwlvajSk4wUo5jOlEOT6LwHh6s4XekGwmDNwgXYyRM4ud4SPSr5evnG1VMiX4bMMNIx
         K/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916357; x=1792521157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6xu/m6gLmnhmuK37G0mkWpbfD0iKHbUJbBWVpw5Q+Q=;
        b=iZVGuwokdZy0PZdxZm/n+yjC1i4+mU7MIy55jWwE1ACjGD8TUIjyT5ytCixwAri43Y
         HacoZHUtroknNCsRuYbs45aEUTIyuFSXnY8s477aQSkObfgzL0PiZY4WL8H24bKU6wAF
         rdILNi6VfhtIKkizpdNcB+Ox9lGfvEIJixDqC9/4e4op5hA/6ASUfgfFWdZjA5Kw5TIH
         1m07GdH5OsIVcwzRKBDn8crTPU7NSyRUqC8js3Wwr+OsM51CJtIU8oVDPpk5Is0n6Dej
         xaULCj9/pE7HuNm8hH2dkNKNZ2aGKqrzX92uvMeDi9Y1ImUyuPyIw14e9ALSASHd5gqQ
         ha9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjSfdNlo+c+x9VkaSfrjEVRB+eE4N/qE+fSYqjmS35T0TAmwIFzRx3ozlUbxWdW2npy2uT1lMjPAj6@vger.kernel.org
X-Gm-Message-State: AFq9FYKTLNtgRjLfINJOJ+yCi63bY0vpDLENbBZp3cIH3SHbxzIBMAoD
	NTkZpMJkN5G0QMDHZXvsqfYCKLe4xGW4f4SEx1ykLrspCveWmwn0mD+t
X-Gm-Gg: AYBFou3L0MsccjDxfZZai6HODqbc7A0tqK7fHaPfV1R9GOwfPFfLGfhqqaFW4CEjNxO
	unJnc5GWs7JfRkvoRe+b49DkJfRjOfL2JU7Jcqhra5cFlhkidJ9CFraznTPfvjkwzup8i0K2Aun
	ejtn4nH+hpNs3g4i0QX6SYDFk9dAeiTSnQte8IuwW8kyPhmtVhGdf02sXRntb3blp0/kxxTn3WL
	AlaKXUiM4OossrIDIYH6Me1ls1N3/UFYo6rCsonFR/bvbO58zL8zYRjTTW+3qYw0nV/BGi1giZN
	ALbsJWwyRRp5gR2TaktnNyW+ZFBbRBcAzHWHXau/ivbf9LgmLOKMeALMhQkWm+otevFUjHBk2Zq
	xAwknR4epmJtq6dI9pExhTcCypSAScG+rG12PAtjyarrL8Ty6SmkBSEIyvfOuZRzDWorVALGAdv
	i4AU+zuQe3nXQ3w5lICaIwAQl6Q9QEIVPe8mSkd83ICzeResUZiNLnVV2JxvnewfT3jpqPJiDpm
	N8sf1MqY1xVhtt65Yo=
X-Received: by 2002:a05:600c:6289:b0:4a1:a475:d885 with SMTP id 5b1f17b1804b1-4a1a475d8acmr98966005e9.34.1791916356633;
        Tue, 13 Oct 2026 11:32:36 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm548921305e9.9.2026.10.13.11.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:32:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: tegra: Support WM8994 by machine driver
Date: Tue, 13 Oct 2026 21:32:24 +0300
Message-ID: <20261013183226.513658-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
machine driver. The WM8994 codec is found on devices like LG Optimus 2X
(P990/star) and Samsung Captivate Glide (SGH-i927).

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: nvidia,tegra-audio: document WM8994 CODEC
  ASoC: tegra: Support WM8994 by machine driver

 .../sound/nvidia,tegra-audio-wm8994.yaml      | 109 +++++++++++
 sound/soc/tegra/Kconfig                       |  10 ++
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_wm8994.c                | 169 ++++++++++++++++++
 4 files changed, 290 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

