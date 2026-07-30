Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF77B3F9F2D
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404109; cv=none; b=ogEk4oLjGgzfRKMdiV+eM2Mf88kO45IPUrlrKo68gMHr+NuNZpIzoVfQEiKlSURIJiNthWVlD7KqLRGwAX3+xmpJyIhnPhBJnbU4HuqfalCP/3ZMinQb+VqwObw5sPVpi2VQBl9XsoiJ5ZoY0BdSAFKWZN4p3AWCS3/2ILTV6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404109; c=relaxed/simple;
	bh=vuwucA9vipnQ6DR1ZbZrDDrjcEvHXJZFOVBWKVa4tds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CqGdWh2012E/ArDI/BI9MTE33BeerTrDIt6Ja7fe90fzqCXrsx0rHdDuPpTir5VlpTWKl1M8G9XBWuffauQWwK4R5Pn6DQ5u6A9Hs+o/JepibO+W28iSvhrrzQZOZa/oCRY59hxmTwLSVd7C5sQZ0SMh/KHvw+Cag5r7FTrN5aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJq67jNz; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJq67jNz"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1677c91969so224315166b.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785404106; x=1786008906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LorXrpjvB9CH6Civ3yNIe2+RrIhqKWqCrvDhWx+glCc=;
        b=OJq67jNzp82vgB4CVKRXaMGpzqr5LOcQ+F85YYJf6h0iTH3RtFbW0NmM8Jz2ftc289
         ZiROiXTkzR86Q2rheVQN0LmIy//4otmwhibj0EOc7g/roeKzueK5k8bM1Z+J2Y8PHa3n
         ixDT9DalEC1aNW6m2kfBHDdWULd60wuHOYznKi+9QObqpdJw0S5HctwCkpJuq/kdtIY4
         txaDXvZFTDQSfLfvrHebm12I8Jn8xyhDsGATMkAn+DsToFha4oiPX8dbZbE7GXulMFm3
         h9Rm06lgHUF4sT+VhXQ19LImYNKr+DrmnohkeUjSBswdhh5q9CzpNr1OubeVO2s+Nq9c
         3dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404106; x=1786008906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LorXrpjvB9CH6Civ3yNIe2+RrIhqKWqCrvDhWx+glCc=;
        b=JL5Q3yC18NzbEMoZQpG4L4B3fnvE8E9fy61NGn4f9+0E+76soikw5dAFyiioT3JvKV
         rRKvGCNIXquO52AgtkPETADFc4NeYbHJa45yDIV2NCGY/3/+ZVkc2fZ9c5r5UVrdseMo
         wUTtoaFZIOxCGAbSuQXLJ/AJET0/lhzDt73ySGOCpbxXXxcRXY+5sJJc1O/661AFlsBd
         3dDO6bp+q8SGR9RP3q3LXuUlOYwceZ8JQ5PprucRStT98ecH7BP55+N7xai8int5bCS1
         n+ZQoubA+n82Nem71N5R30SkLFfOekKan+ckWkcsc6+nV8tsQgWcf1wcd068I7/CoOmP
         gtIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2ho6dpnI53zrQ62PofnQbJg7Ljp/UiOIur7FPw/i0oG0hxeUA1GhFLg2kEVO1ynZBwWC48Eo38Jit@vger.kernel.org
X-Gm-Message-State: AOJu0YwXNw9xuYeyEQqtNsAcgmuvzST6tyw64yzGhw2bJf2Dv2HZozeK
	SGQFPJDkZFGIaMSRvClG86Gj7zOnYsQJ8yccFJEKFid1SXGWatKBS9E4t6OD6joE
X-Gm-Gg: AR+sD11yI3z98fU8N5L2eJ0lcN/gxjSf9IYPt6y/XM1JOhvXJkr4h3DplR4Gjm1Kodh
	Xq87+gK2Og8zw7BskQ3nscy2FqqdvTTsL7kM0bbrRrY2tEg+EC2VsfImxC1xjw19/jxVsKn8H98
	6C64CZGQUtyfC3hJEKFUcMpljOfnze8VRSUwH2r2tKZ+tMC3b0QvzNe7dZ3EKioJlq1pdQLP1WT
	Pr6Z03tXHEEr+ndlvAdIvkF/ZzTRTNkMmsXEtZECHu+evsElS4xH32uvITN/VJBV1yXPNK3elov
	DSVq/X1rNcI3CxavJbei2ize6DaqI9+3KUuFU85hqyoaqaTm1YlV/LiY8aSgzhBp2wYhSqkTPxv
	fX35so7ZQ3+0G0fP8qdPNYKo94+/dRg2c3fuMnxE31GV6NOpjKEahMCv4Q73If18G65MT2Q4U+N
	m00kyqCHjfrK+26KHXoHPkmY9/Yv64AndSsRRFDB4FXnwNQXiza4HKvfmq8Il6pRhZND1Rldeu9
	db56EFT/kX6NYRk2VzD6g==
X-Received: by 2002:a17:907:c08c:b0:c12:7934:52fd with SMTP id a640c23a62f3a-c1fa55ce082mr100963066b.32.1785404105894;
        Thu, 30 Jul 2026 02:35:05 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8577e78sm46733066b.20.2026.07.30.02.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:35:05 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [RFC PATCH 0/3] Add Xiaomi 12 Lite 5G (taoyao) battery support
Date: Thu, 30 Jul 2026 11:34:59 +0200
Message-ID: <20260730093502.689505-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiaomi 12 Lite 5G (taoyao) has an additional property with ID 12 that
breaks the parsing in qcom_battmgr. Fix that by introducing separate
maps for lookups properties in both directions.

The other approach that I tried is manual shifting properties:

+	if (battmgr->variant == QCOM_BATTMGR_TAOYAO && prop > BATT_CHG_CTRL_LIM_MAX)
+		prop++;
...
+		if (battmgr->variant == QCOM_BATTMGR_TAOYAO && property > BATT_CHG_CTRL_LIM_MAX + 1)
+			property--;

But I found that more obscure.

Will be happy to switch if the maintainers prefer this one.

Stanislav Zaikin (3):
  dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
  power: supply: qcom_battmgr: add Xiaomi taoyao support
  arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific
    pmic-glink compatible

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |  2 +-
 drivers/power/supply/qcom_battmgr.c           | 86 ++++++++++++++++++-
 3 files changed, 84 insertions(+), 5 deletions(-)

-- 
2.53.0

