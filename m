Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2853B2FCA
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377708; cv=none; b=JvWBgPPsePnr8B2eaIJYofAcxoBPKywKnMmeaQuXEs9maS4fMBSTBKCI7IVa/ELn8pT16z60yp3YunRTGo6egpmkyofWTOB6vlBr9o00xS09RRIocRL15EdES0mPDBkGOyi64X3gD/SovLRugiU4WRU2XVbg3buMhWBb0r1lJvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377708; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTQslGjGBMVLX6Srt5WMAAKVag9XTAeKl+tEt8Q+DtoI42jIeCGVhPa+GCcw2oUh0dquG1YuZMms7n/VbJweIr3w9LkM8jdCTB9hwljYJ/q8HcYJ7eBCLZsbcaUiv1W/UlhDeWtrdZ4oBtGyHizvlLNvrT+AddNmJOlLWRqoPhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK9fhsdq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK9fhsdq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso1593804f8f.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377682; x=1788982482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=XK9fhsdqDFBXhDjSuvWJfNE5vT/jVeNPYAPP/NsbbmaD3WbbBJ8NmTOZ9mY8+VzunN
         KdMH+E+kYoUcuDdKeZfyf+1jRkx1ke28J3+mJxybitnpa9GE4lBGiOwLiQyZUrsi3NaQ
         d0itTIUnxjzeyI0qb1nEyA1sVdhEI0tKyoJylS0I1fofsuoD2XAW9fSCMkYPTeFTR51l
         J2JLqSmJjWuq2NXZP3vy/SS3Qsn/0TSbIo6dLmvzySLHrtcj8M3mS79hUxkWp5KYUrsH
         VwRRvKTb6J64DZPSekFwGbiuS66QqX8vv8Q5C+MqTKv8BFOQABLWhFgiZZv2eUPkPR5i
         ffDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377682; x=1788982482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=Ive5W20tfAdguGMZ6vdvyB3gXQKcof5c+lDXsTCOaDTQArObLmoQar2KEyI8gvCKMS
         8Fb+arEsv0/nXiuaeIA2Qw0l23T7v3Jz/RqGxDkluF71cTaRkG6+fI0rGLOomDaUfM/c
         gLdChPvjIc/W+THjAPruVHkFEbHqkU5emK5W1z5jvEOdltXNWi2EqdPPnNbDtOBaUjpe
         7x/dxmSeYJeRpU0dR89Kza0U90rLBKKxiyjwsm1TELMjRl53XC6oSOQ2mm9fRRY56IBP
         6n76B+KxmCxXfecQAUDZQnQLAhnC86fIO1iEYiV2SmZY7KXLkHuVR3gdy86FErPyteAm
         ZVrg==
X-Forwarded-Encrypted: i=1; AKwUvBy31AMGYuzhIHZEz2n3h1LKDbrvcTbZh6Wx6yz5QojeQ50JAd4i5FYD2xLWC1Hj8Nc2l8+LECIrn2mR@vger.kernel.org
X-Gm-Message-State: AFuF++nMbs2HCv/8t+0QHh/Bj1exkggABQmRoP9qx8u/4026QAZQZmUH
	tShfsu4iOS4VaIkU4XWuyKMa7XhlNqqTkfK0xRlg1Yb8+4p0ouEQxshn
X-Gm-Gg: AYBFou032CkXitgjc/uD3P5Cu0pGMsOKBqYM10KcaXFcvsG72siKw0C02ao3q6P/zEY
	Wimg1wNWH5rc1uD5e0+XxpRgSOIN581RvYGA1AWLJ0RcJseK7qMDSRc9lCKKAbubWE99zCB7PmM
	DbLVEsffCHuNwkIe0xYISdR+imcXQ7zEoxzFSLD6RGLQt6VNLYvmvEEC3XDU7bV/K4iy/iyeA6y
	tJRtziy6LWa2rO6BVKPZcnZXnQZwIUAuCVsWa6vHVcW6cZGQ0fAlPbf0NMt3vfuac/nwo87mVDi
	6D7BXhwaQCb9XLtRY5y49ZTPa4ShcfETtDGiz+7Ta6pzZabRRNEFL3LfCwcAtio3Y7ZsLDTEgJk
	YPs5gczTMXFY4XH8noQky1+PiE47vuRM9/a0sGHyl4KXMKbawVkoFwjJUYGVh4HGVxTeD7AVLul
	QsyOy6UTUEUGzVrzbIVFdHBlR57bS+1T5awwqV+jmG4P6oEN3f1cdS+csF
X-Received: by 2002:a05:6000:480a:b0:47f:eac2:6f55 with SMTP id ffacd0b85a97d-48488f2229cmr14997817f8f.19.1788377682430;
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed,  2 Sep 2026 21:25:38 +0200
Message-ID: <20260902193351.185771-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

