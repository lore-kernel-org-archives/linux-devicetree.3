Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6B5356751
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707474; cv=none; b=tz7r2lffE/g4zNPH7rBIqkUb+/cM1PB1RoKwUZXAWZ2AzonHuaJysbXPI/BVOOJydNPyfgp32zq1DSaJTA+43f5YcSWiADentUrUWAZwq+nsxgg9RmNLUA9ixVg/64J97o30DcAkCE0EW1ds3zEehfgkEHba8PWc3ENSTG6Sw6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707474; c=relaxed/simple;
	bh=pKSQ0omTuskZq+kor8UoJ2wNfDWorQkFIo60SsXbA4I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KQO6ACFqX9Z43E+MFo+XTKuPhcappAPkpMNVYP0bHBF33J0kesXsYsEsWODOzpXJ4bEE05CBmjUSDJWaTh/nYRzEi+Fyvtc53NGTRBRd3J5YM2Prea0ZoMiwyK17l2BNfkfisuV98J6ri1buPuUTYWjd13fC458tPxfTXxMFsQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csr8yTRf; arc=none smtp.client-ip=74.125.231.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csr8yTRf"
Received: by mail-oi2-f8.google.com with SMTP id 46e09a7af769-804d58d09e9so93629a34.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707472; x=1790312272; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FL7nLGZapJfQ8aVhLmuBZ6WgKTHLgrmHKnRf7yd+OgQ=;
        b=csr8yTRf+bRSBK7/gr3+Wdl1pFk5BuUep4Oz0HE/L8o1g96WDkJt5l6BcmAivzh1tu
         +rRgIJctKKsF33eLzd5Q3qyKWEyxz97crq/NV2sZyNMD/NXRnX8DKYqhcJ+wA0PJECIe
         koYmOdrpDwCLsukGKOHfNcudXgZA4gx9bcJbnfwxzhi0UjhkJFd9CBn9by69q6DBfAec
         r3oHs/RwP1wTdmJsUU8jvQ0GaauCA6jm/7jaXpdvGpLay/GBhwXTsmQSJom5NJ0uReCI
         LWfJ4k6v1hN/1nGK7ZIIxPghf/yr81iUZhcY8wz+a9L3m6le1xWBWOQzyiLLnILyk0FX
         ZM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707472; x=1790312272;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FL7nLGZapJfQ8aVhLmuBZ6WgKTHLgrmHKnRf7yd+OgQ=;
        b=DK5CmM42efurvuoCfaIjrO+wvpHioA/MoL2S9EtNAvlgIuunecrfmVX1/ZR89JQJw6
         eHD93tByPi4R5Te0ekLFmyjnX8bL82vD+NZc7UAd+UZODXb4pKpE5UPvexpFKiVwZgpg
         R4qEF+XaOx7v2bVbW9OPaEr4zk3wSMp/0L3UaK60WXHMVlCyqWk34GYqNSfKxDGCQ+MP
         LLw4+cj4TZjdIxwK3V8bMo0flDYMyDei7NBgZzCIDbIIcWHox2t/OkXzNI6sC8NyqZtu
         gUUsjt2idkL2GIciPCF57W8vRn396p3mNLMl1Im7fkmGOSOiNEmOPo/g3Fgl34A+QdUr
         YAzg==
X-Forwarded-Encrypted: i=1; AKwUvBwMxMNtbbJMn+nQuc5Np8pJ6R1MgSzTOUNvajwwT8eS152eBbqNEVWi1DoYAjCY5Bds5ejgmgvSpClQ@vger.kernel.org
X-Gm-Message-State: AFuF++mHOZswRNUT6Y4dWwOH6TaZmA9zRP/XO+9fYAJIY9h7G4K1CAki
	2d6PYfyZ3x1GWkhYtvbe3y+mpiVwmRN4F/OcZ9EbH0qvV1rCmGGM/sSd
X-Gm-Gg: AYBFou1+nd5urSE13QtkgpcJnJysKfhbQMEs1hpPvRdZTq+ukv/owqvWoCyQM238oTz
	gpETdWaOlAYhsoZ4GGbXl3VfZ2iJWcnHu19Ck4yHbIy7ife9NAkdTabmyGy+HxYvjz01ztXvVwi
	H+se+e6tnD0FGkqLV8sF9PHD/LQTBIkUgoUbmnTUPJ/PeQYHQpxk9iy55T7ex9tXUZENsqotBwZ
	YiOV+qEW8wm5v9XiwEhbrYgOmys/+R4o+cOD40+prDyG70mRkUR19XQxwv+j4BzjeJAWeIOBwsi
	HuUWJRZdsWkRO9LrgdjhCyshRNHO4WpNhU4v2m2oRVvxri/+aXbZvfVfqvjmsw4Q+c3qlCvoCR1
	gGSQf6Bg98ydlva1mza9s4M1q2e7sDi+DEbWUwJjzmIrb9BP2El8ZYq/xJjRWAsF5zv2/PXhPFT
	C8q5v2ZeefDrV28Po9TxgoJmwKx6CrSJRr2LfQ8mBAbz9BE1Nfu1vqnAuduEuTrTYe/t4P4iIPy
	djs
X-Received: by 2002:a05:6820:f007:b0:6b4:3a06:c251 with SMTP id 006d021491bc7-6ca9ad3aa5emr1276873eaf.29.1789707472079;
        Thu, 17 Sep 2026 21:57:52 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48739da0d0dsm256318fac.12.2026.09.17.21.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:57:50 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] rtc: mt6397: expose the RTC's spare bytes as nvmem
Date: Thu, 17 Sep 2026 23:57:45 -0500
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQqDMBAFf0X23AWNELG/UnpI9Wn3kFR2E5GK/
 97Q4zAwc5JBBUb35iTFLiafVKG7NTS9Q1rBMlcm1zrfjt3A+tICtoIvl82yIkRJK8fs+7HaPHH
 aIyIDLvTOh3lYHNXapljk+J8ez+v6AbkEtDF5AAAA
X-Change-ID: 20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-ee2a326ad7f2
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789707469; l=2221;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=pKSQ0omTuskZq+kor8UoJ2wNfDWorQkFIo60SsXbA4I=;
 b=D2wXBjz7609fl7tbdcv1OCK2Vh4M2UOlYFbDFGfPMj9WSbvog4bhWkntuU48WNlEyAVi731X1
 mTV4XKZ/YGDB/yukOfu0K8mkN81aRKfm+RoXS0pYHAKLn1q/1WbZXok
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Four of the MT6397 RTC's alarm registers use only their low bits. Each alarm
field lives in the low byte of its own register and the driver masks its
writes accordingly, so the high byte of four of them is storage the clock and
the alarm never touch. MediaTek's documentation names them RTC_NEW_SPARE0 to
RTC_NEW_SPARE3 and assigns the first to a fuel gauge, which is how its PMIC
battery drivers carry a state of charge across a reboot.

These patches describe that layout in the binding and expose all four bytes
from the RTC driver as a battery-backed nvmem provider. Doing it here rather
than in the consumer is the point: a write then lands under the same lock the
alarm paths take, so it can neither be lost inside mtk_rtc_set_alarm()'s
read-modify-write nor fire the write trigger in the middle of one.

There is no in-tree consumer yet. The one this is for is an MT6397 fuel gauge
that is not ready to post; its other dependency, the MT6397 PMIC AUXADC, is
on the list now [1]. Offering the provider ahead of the consumer follows what
the subsystem already does -- 32 drivers under drivers/rtc register nvmem --
and it is the part that has to exist before a battery driver can stop reaching
into this block behind the RTC's back.

Tested on an MT6397, in an Amazon Fire HD 10 (2017). MediaTek's spare map for
the mt6323 matches, and the alarm field masks are common to every compatible
this driver binds.

[1] https://lore.kernel.org/all/20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      dt-bindings: mfd: mediatek: mt6397: describe the RTC's nvmem layout
      rtc: mt6397: expose the spare bytes of the alarm registers as nvmem

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  9 +++
 drivers/rtc/rtc-mt6397.c                           | 91 +++++++++++++++++++++-
 include/linux/mfd/mt6397/rtc.h                     |  7 ++
 3 files changed, 106 insertions(+), 1 deletion(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-ee2a326ad7f2

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

