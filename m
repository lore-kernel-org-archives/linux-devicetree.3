Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0CD364EA5
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261493; cv=none; b=tzK2EqrFFAWUqOoykH/PniOA+WUaAxTisRgd5T1Spq8ehRYPBlaSxcUIO1NHFv2/EfclXeJmFzlb1B01MaDg0ysLhNKRensCYndEjS4iO7VPSyeraH9faRmicx6H/uG2Z7y9QtZUlK1cT2lBEQHKgOmtYeh3unei4wYm4+d8pOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261493; c=relaxed/simple;
	bh=AlqGAY2/4NNL+jMyIRi7fYh3ze89oIFRvHFa0sQLods=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCAdjgZiAgV3p7iVt3Buf3p2Gq/2HqyLGpAfD2q6DTuDZkuBNKwF5/p/E1W2LSnh0VNcEjH6/lk1abmvv1fcpp891Wz95QOpgZ7WxubpIt4phwogMfniReHzWpMLMdL1xszjg/YPw6vFS3XpbwwPQ0kDakQOIaF5bAOaS/+y+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EB9MyRgC; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EB9MyRgC"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-362ddc1de56so2429473a91.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 20:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261489; x=1777866289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWnGZIr20U/8NXRxTbpdrnOVEAiLhYCZ2NPvdWXNF8=;
        b=EB9MyRgCDNMOAifBuvL4E/fQOTgUNA45DUQiiJdXbk9hqZgkr4JlYgNPPBQjQfarxx
         BdBcc8374LjSIsy6lnebz+ZishixE19m02QOzwqsyn/rDCaJpTXZ3vn0jvt0s9CwWl/l
         mwi/2IiRnnbIrNDb8Ixf4mZy4742JbcaoB1jTGUVvL2wXsFb8N3ZzW90GpmT+GKIxtth
         pkIwueEZpvi68Dms/xVG+FT8s/HoABSIG/UQaHMScDlR7J3jV072O5shvdfrrngDZime
         7xOw0txPoPaJWBVW+yw9JY/hFVFJo892GV8ikjTHpCQ7pcnp8x/lFbYORbfE6bGLzUEv
         vBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261489; x=1777866289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KLWnGZIr20U/8NXRxTbpdrnOVEAiLhYCZ2NPvdWXNF8=;
        b=oaTVE78fhpz3KEzS+z1stROlH0zRMzH1whHDw4I5BdUpUlGE36D3OSj81zmjRhJu99
         Mb7UwJf5GErFe5+bMp+DDzVI4aK/ji2lKM6qXwEeUDVShCfiqkNS71EGbYDoF5E1K5iP
         WX7Ay6juPdFNy/pdiuT66g9uNh0Xjculv3Q8w/euk1PcqlVKL092JBgsvKLAdgc1usdW
         /eBCU9D3L4Rd0WL2E47AfjBCxyS5jd/EWGALWWg7cFhTKMHeqElvlBQx1zhg7Ql286gH
         1Nba6hvJPQkbdPKMvtkqQIXszNjnv0GPk+48KwQd3yk+uSEPSde/kU2qWE3xGYKmwdLM
         8dtg==
X-Gm-Message-State: AOJu0YzzmBrHk5en9pRVA1Mm+eSq49Fydw1pgcr5PoRqaV8ZPTKI5Nnq
	nb2jkhb6oS/4/5U7yt2Y1hpIA4uSw9vU0lOAdb2lvU4AGKeCKb/ys5YNqXfUhA==
X-Gm-Gg: AeBDietPmm4pUhFCfXIOhkWSly11FUogAKoTxOp8eS5+VrN0NBeBlKjz+fITsu7/Wry
	puUzSiCxFlVvLLlG3LxfkxmpfJvuwhDOGzD5LDGnC8NWiDc3x26uL8O6OgDqXUXEXFzzcfd+c3P
	x0vXz13ICW4ifX1wlZd746bfThA+6e70xMgJPbn5nsbro64g1r/w9jzQFWy+3+fl22SbQFKCcQK
	1tAQ3IyDHNfo3dNEkjoeEdCVDjma9XIX3MIOCJqUfQv9F4Saa0FVnpdvPjHtslnkBMsXm3Lu+9r
	Rjqzwx4ag6pC3eK7VdLAob6nGymka4V/qWcJXryyi/5LXPrzP2t8DW+jm37sDb9SsmFJUKWMOA7
	Y6+YqxGz1ZZgCc80vc3V0LyKt+tVh/EYMlAq1yvRhTV4Pf+F9AV51qXikqCoxo89tE2AQlKK6Ur
	k89QT0mXYQ3MIqCdI8URKptprYfblk9zMVVDt/N6qPdqnZApt2+QLve7aWNIdK1K1m6bBCh4U1W
	TYwZShR+Z78EL8eE1q8nzZigQ==
X-Received: by 2002:a17:903:37c3:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2b7aba0aea6mr161097325ad.11.1777261489333;
        Sun, 26 Apr 2026 20:44:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 2/3] dt-bindings: net: wireless: mt76: remove mediatek,mtd-eeprom
Date: Sun, 26 Apr 2026 20:44:26 -0700
Message-ID: <20260427034427.881389-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034427.881389-1-rosenp@gmail.com>
References: <20260427034427.881389-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mediatek,mtd-eeprom is a widely unused binding that predates and has
been replaced by NVMEM. As there are no users, remove it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/net/wireless/mediatek,mt76.yaml  | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc44b..482c22cd6627 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -87,21 +87,6 @@ properties:
     description:
       EEPROM data embedded as array.
 
-  mediatek,mtd-eeprom:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      - items:
-          - description: phandle to MTD partition
-          - description: offset containing EEPROM data
-    description:
-      Phandle to a MTD partition + offset containing EEPROM data
-    deprecated: true
-
-  big-endian:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Specify if the radio eeprom partition is written in big-endian
-
   mediatek,eeprom-merge-otp:
     type: boolean
     description:
@@ -314,8 +299,8 @@ examples:
         compatible = "mediatek,mt76";
         reg = <0x0000 0 0 0 0>;
         ieee80211-freq-limit = <5000000 6000000>;
-        mediatek,mtd-eeprom = <&factory 0x8000>;
-        big-endian;
+        nvmem-cells = <&eeprom>;
+        nvmem-cell-names = "eeprom";
 
         led {
           led-sources = <2>;
-- 
2.54.0

