Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10D34E761
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 19:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779822919; cv=none; b=aAldcqcdKDsDXpOlyCQq/lZoQ1VjtBF6A2Lqjp4YR7tf5nZrEl9J0B31nl5+9JE3YKO6U+VV42pjzhc/mJ91kIQCzeye4HIL2BKfDd0etuDF0kKw2zHAzqWCc0vgbMHZwJ73OKJ/PECZYqMNOM4h2AjAzhyQeKnKX7k8EuWmuFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779822919; c=relaxed/simple;
	bh=eoCJgcYM1yujDL9U1kzpU4aIjm2NQbARQG1YumkHmzM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kp85NURsk+cf464hfMHdS3rjsEJXNbouYhwCzQMNldwl6LTN4LHDJgS3oV8pDOBMUTxESz/lqrcEAJsk9lc22cNTekILbMZ/ihwTBs/SUZIe5wxSuDz1jI6iNWVCkA0sUFq0yDR2ARVvNWxVeD5styBzdSfuTKCIXJi2MVd207w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bf7kF/00; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bf7kF/00"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ed18d8a1bso1108064f8f.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779822916; x=1780427716; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy19ecE8GioixiZIbwDMok7h01mlgdh+LSZaXHeNwwI=;
        b=bf7kF/00tbpn0W1CuonAS4C6E4azX+0yO7FTrPh3DqIGOyHxIS5VUKYkt9disXDbuV
         itU0aZlZQ7TpBnrMRIbYgg7n1hOnu2mMvO96cfRyvegjpXTBgGyLnSRG2UJJF+wJTcuJ
         r3tNZprTaYXJnrpGu/SSwB8ArpL+7t7zoWaMogGYWx2S0973S45GjJNPiU/UU3XlrfD+
         LIJuE97vXWGrP/froCnhb6Z/gaY13W0uBOjLmPcLo/mQJJD4itGzlwAmbranbquhCK8b
         ncE2cpPEs7j/DVEB7/Jgmu8yZ7WgtZvikw6erNxQBg0BQjKgrGYTffxUVCLgSPI6IP7e
         BaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779822916; x=1780427716;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy19ecE8GioixiZIbwDMok7h01mlgdh+LSZaXHeNwwI=;
        b=F+ay2f6ap6qXIZdRJtyg2/xUUvZ0axgX7sIw+r5hq7554C9Z0c/T1e5phhgiAq+FKT
         8KOR+AKeItgtPqYUeDA3b2880Q9/lqs4k84AIRqd9tKIRl+BHNi4FXl/Tft9ZnaqUMKE
         IovRjW+CB0mJZYm7EdUT1YZET1Hh4y1sVweuimtunkHCgdkl3i9lNUVNi/aqvMZ/mnsa
         ukQ5S3aFraUGnuCNUV8xzsB8JTNt57GsS9bUWOMNu7mpKyZUOynMCfid1cAEkLQ/JPbc
         yL59wBj1XGOda1i1SqaWLkxXt6r+YdgibWxqAt1JlzekK5ztqT1tt7yNzyJLJvIN8mg3
         8V/g==
X-Gm-Message-State: AOJu0Ywxztt0bpGcIal4b0CaZJxATvHapPmv9JovY75/qtpNzvdYeFUF
	3bkrEA7CaGRQtk9pD8XjO063G8WRPzLf9PFxrA8ghvSoz+B5Okf/+jkMqZCze8LG
X-Gm-Gg: Acq92OGmSrBhSpYURemVoUsjOgFzV8QUlwmRsspwm1QXqCqLYQVsb93KOMEJcbAnOOG
	9JUTe9xRe6GambFuBUMGoJBXrR0WorMFD35Ro8L/S/M+Jkl8+7/s+Aa907jBGxiCEo3EpEBmc6o
	RRHNhHsAWd3vDK8H+FSRpLptwZaoHCvdvFq7CO0TLOISdGcOxLXCLhdKadTo+B+O8GeMWhN/IAp
	RWlTLgo8Yv7Sm36A/rPjDrzt0m7YZChjsrU/wXJ1O9etva/tT0XQhgW42vJzSh4wwAC/vd5vmQ+
	32+BKTgnkZkYqTTcCGgd4xts/jBSmZgUhxin1QUUKdyQOdiGSxZJLdAxuLmIcbvN8IvwUCWH6ov
	TmDAz51wKW9xuCF37qXOJo+BmuaQDovFekqxKMKI/YlYXprLWJdcfSxxn5CrzB5eCFwbgH6YUL3
	z6PwNrDD6Gep1nW/WhG/gCuxpvYxSyZqyGbJcNBScVPWnLlRpZoGVFm+WLYmIZ6hybxzwru4RmK
	+NuKxAhDuHZop40MRrxy5qHXc5mQW0=
X-Received: by 2002:a05:6000:4b06:b0:45e:73eb:1ff7 with SMTP id ffacd0b85a97d-45eb3688819mr31060150f8f.3.1779822916508;
        Tue, 26 May 2026 12:15:16 -0700 (PDT)
Received: from [127.0.1.1] (93-143-222-3.adsl.net.t-com.hr. [93.143.222.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b1c7bsm261529f8f.29.2026.05.26.12.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:15:15 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH 0/3] 88PM886 Vbus regulator support
Date: Tue, 26 May 2026 21:14:46 +0200
Message-Id: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBBA0V+RWWviEU35FbEw7WAkHukgEvHvi
 uVZ3HuBkGcSqKILPB0svMwBaRyBHdq5J8UuGLIk00mRamXMOhmj1YG7qIJyxM6VFlsHIVk9dXx
 +u7r5LTuOZLf3Aff9ANLE/L1wAAAA
X-Change-ID: 20260516-88pm886-vbus-5e3bbfd9cbad
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=910; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=eoCJgcYM1yujDL9U1kzpU4aIjm2NQbARQG1YumkHmzM=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJEPzpu7TvO57zKSugER8e1FNHNE95+Xm/ccr1vVb6Zd
 C9DtJxiRykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgIlMWcvw3zlDy0OP471badAF
 MSmdLUf4tgQHl9YVFHF3rYtmv+M0jeG/73LPXyEXBZZa7Hx53mDXdaGfvQpP1Nb/dZqs8eWHk84
 pNgA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

Hello,

This series adds support for the USB Vbus regulator found on Marvell's
88PM886 PMIC. The regulator enables USB role switching on boards using
the PMIC.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (3):
      dt-bindings: mfd: 88pm886: Allow vbus regulator
      mfd: 88pm886: Initialize battery page
      regulator: 88pm886: Add Vbus regulator

 .../bindings/mfd/marvell,88pm886-a1.yaml           |  2 +-
 drivers/mfd/88pm886.c                              | 21 ++++++++++++++++-
 drivers/regulator/88pm886-regulator.c              | 27 ++++++++++++++++++++++
 include/linux/mfd/88pm886.h                        | 12 ++++++++++
 4 files changed, 60 insertions(+), 2 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260516-88pm886-vbus-5e3bbfd9cbad

Best regards,
--  
Duje Mihanović <duje@dujemihanovic.xyz>

