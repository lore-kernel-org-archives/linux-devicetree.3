Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8DA43991D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222281; cv=none; b=O0uehTd19KY9bXWB/XibdQ/P2hOi0Ey8PWKTc99v5RfW7XIw4rx66I71+DQEuMCZxc6kT1ctV9UYr07HQzdUtazA2S3HSE/7OjI2t1N6U5L93tntBhZAetCtpCJjQ27NlrwnsApHYdjU380KThNP2nYof4Zjfm9O73HBO+/20Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222281; c=relaxed/simple;
	bh=J0ZsmPYEowQMOMxEQ5XSmmwU88gF6MVEkonHVpC3RRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrgbvMISEtBG5w6kOMQHGitcNAArckEvZxMgyjF1mfzruCFmRXoxfJUC2Qq70EkTAa6kPqsFpUW5AI3/61Z0yCFRglbZXC1E4PsFnZ0TKMP21m7td4kX8yZHxrDtuynxjPhS8NN7kU2aZw+pLi4YRUq0b6pA3d0ivccailBUQCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvO8J11s; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvO8J11s"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so79496555ad.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222274; x=1784827074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YOzE4Dspd5jzvIIg5G/ODj4WmBPO1vOc7GQ0jrswag=;
        b=GvO8J11sQSGQQ/sF8s7uiraCEKVdK14TEzPca3mJldVAJXX5TMO+ZLewJ3cQkQ4A64
         fzmIFzBW7JZo0E3z9Dq43hmR1uSxAwQBzHWFzPIAlqMafTP7YZMiuCfLEDio2TsuyNMd
         3IwOtW8yg6uFrof9WyAlAT7IJyvK6UQJVLhmn+jGnxYdGYQgzeYI8mcbTUjgpRDTPetQ
         PLPLcvbVE7bf/53UM48B7/+bzTEOQwGmsRr460oYRr+FCZIOj4mHfCzQ04APMvg2FQzp
         9uaSbL0t3pbNJ7zRRebtxDaIx1Kjb5SVFGuZp+KEZvHPgIQZ1+RiY2v/5fVuOjoDuJ6q
         8KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222274; x=1784827074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YOzE4Dspd5jzvIIg5G/ODj4WmBPO1vOc7GQ0jrswag=;
        b=njYHEcTO8xq37iDAMAVhzvQyH/x5TsbRwQNie32TdmWaM2rHv/WoSQJUzXujyyYCk1
         uSOfza9iL1SWDXt7Wx/nVyvWA1O/SMaC+OrpNkc+LB926EB81hF776PHhfBjy9BjhXTe
         2147w90USlwXhKceBBKb1cYACelRTNjVV4mMmX+YYjn/Fr7Jf7gxMXEwEJLytIVMZbK4
         q47l99fXqB7KsiCZwEBGEJ4BvN8BbDSYjLin7qFu8N5n2stgR6kaFduRX7ImPrJLe1BJ
         gEJBgeL5QdKzEz1k5EtumZYX4p0Rd4iIJs5RkyZ1rgl2+iGXfxE3fIlb4xqxkHglUBam
         hA2g==
X-Forwarded-Encrypted: i=1; AHgh+RqnOijfHmkrGFbrtHxSp3LpsgtfASXaEJjhJW/jPrtj0l6FDnlAyDVdUDiOPDyFfzF6YS7NAAHY6TEx@vger.kernel.org
X-Gm-Message-State: AOJu0YxpoSgZATDE/CBy61BH3ST4MiuY11KXeCAyzkEnnr1/D0Eqy3ni
	g/NXJ8nm2EX/xs0qe0OlsGTofl2tNzLrsCpfsFaGBwmtFBHZ6JoNkvyk
X-Gm-Gg: AfdE7cm5A1LrF5mLhlzSNOeFAnNqDgVuea4vKzS9+xQfk1Ai7LRBJBqUO5K5CtN2EuF
	CsVR3C9yEwN+pr8WacthqMMCRVWbLuBZV0FVUSSPlId6S8efKYWWtjLWThMW9bJhJFX0hYJlG7g
	Zv0jG1qZVUd8HggKAeSikKrcLYr+fV7h55Obe5SH+C8dmEA6DmXLDgNodY1Mgme9H5AFu3OKemK
	jaybc+qv0ROzdu+s4BoYHJDh9I1Ei0MGrXmuYVa756CtdhxHsCFiGC9ZPoOq0y6I6DQIDWchJdq
	ygkJN136gZYq9EzGL1T/i2RlqKqJYc47N+9N4QHZkSQRTGCVlfJY0/pMWQ8U1PSNbCFOISSqRFr
	q3pn2/aurhqbIBgMQO6pDDE7Vgo82Q+9lqun0oxW/oBZmBolkdFZwCr92frbM80+7bq6UIWv1bQ
	NS3kXKB1lj6KT5CdaQvW1Wl5fN4Aix41JFEQ==
X-Received: by 2002:a17:903:1cb:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2cf03c36420mr81705655ad.18.1784222273587;
        Thu, 16 Jul 2026 10:17:53 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:53 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible for MT6589 SoC
Date: Fri, 17 Jul 2026 02:17:31 +0900
Message-ID: <20260716171733.300885-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for MediaTek MT6589 PWRAP.
Also update the description since MT6589 has pwrap bridge.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..a487ed39e6cb 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -19,8 +19,8 @@ description:
 
   IP Pairing
 
-  On MT8135 the pins of some SoC internal peripherals can be on the PMIC.
-  The signals of these pins are routed over the SPI bus using the pwrap
+  On MT6589 and MT8135, the pins of some SoC internal peripherals can be on the
+  PMIC. The signals of these pins are routed over the SPI bus using the pwrap
   bridge. In the binding description below the properties needed for bridging
   are marked with "IP Pairing". These are optional on SoCs which do not support
   IP Pairing
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6589-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap
-- 
2.54.0

