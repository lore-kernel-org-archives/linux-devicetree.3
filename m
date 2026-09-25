Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889B4D9F72
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360714; cv=none; b=dohTmb0DqQfsqMTLJelS1BOsS6x+nVU24tFLfKUD3MngT1fiV6rOOLzUx1Jc8uKjp8JDD828Yx5SiF0uXzYEgM6ySpij7wrckB6ybxXL/y7guuKAirEgOwOV8zGjvUsYTnarRwUrpYLyLJ/MjK6obyCwzRsGheNPzQXULPYN25k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360714; c=relaxed/simple;
	bh=GkosBV7eR2cJr014Lh9fIn7r1IkJ3NflQjoKUGN78wY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txNyY5ziDcD7B5yIw+OTGrcqM4S3RWieBm80pm5BkpD0Rrtb+Gf0bIpKla2bOs1uxRYAOYjfYKn8Ev1NDXr7DkJKRjcC10yzuaEaaJa+DllCQQBng8UHAf/Un8/qWNW2K9E3RT/q+LI8C8qkiYCd50VLQ9z2dOYrn5fvscYyBKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9PAPQLe; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9PAPQLe"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so6262805e9.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360709; x=1790965509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iwRhMt+5vac5hO6j1jom6ApG+G2j4KoZScdlfZjmEqs=;
        b=L9PAPQLevW9kDC1OlkRnwPTKb8Zkz2t4Pk0Cx0wZLLp9xLZ5gzBVZXychj49PdZZ6p
         KueeK4LN/LQqRy99Zz8427MkYPw5u+n4pdedIxbf9SYDY8tfaTxK/p6GTlyBpti5gAqG
         zC73qnYnaxh/y1sO4FEcZy8KON5JbJYeCGyYpErxOu6p4l4QdVRstoscsKCIsxUu+k6g
         SEe/BdbNv3QC8zkcEIjipRZduyUJlEuaTem8JMe2Cyzm8Se73lY57xBbVqO9nIH2b+3b
         dLZ0MHZYPzFeUG2cCNbIrJSvPr7vVqSFjmAQHMf6uzqIr1lBxc49uOcobRjVYXQIao9D
         TFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360709; x=1790965509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iwRhMt+5vac5hO6j1jom6ApG+G2j4KoZScdlfZjmEqs=;
        b=IZl3jYhPGGzsfdkU8exIauF6MqvLDm4k2JEzoZAIRqcIqfyOJXNeqKfpc3D9pgspLP
         UICTyZphUt8bhu6WYfXIxsm1ji79ytdqPCRSMk0HVkDXnDgFLzcBBgNm/F/294bzXvFS
         4pG6jcPr4ByOnRdBUX+qJsHvrhZCfT6Qe9Vq7HuiCkNn6xgArJ5GNt+f+nh8DuF6npq9
         bq0X0YM48n5hE5a9ybL7LJMR63M++cCKjEnU4C680DTERDO6+bbGHJEeiOvk9dkY9rfX
         of5xRC+N5LvUpQrbPaTOrhyNaTaFTOcH1dvRPvV3N/PyZSUNFJP76kqpAO7RNNcWz+F/
         65Qg==
X-Forwarded-Encrypted: i=1; AKwUvBz60GZHI15NF16Tckl3UbWgXU9nvaolsir9rUH6orNLBRzHMcnoR40enqgasewS9p53Q50hQPjJDuW7@vger.kernel.org
X-Gm-Message-State: AFuF++nr8GDTwArHtbK9ITLwWAM5BDgAIQOp8Fow8eD9YQ57xXFZTtUt
	aWXZPxa9KV+jO0gROK6FHM1jQ0Dkgc9MzXwmstM3rDnWYO3GAMonnR5J
X-Gm-Gg: AYBFou38r5D8rnLBN4YNKjxabyVt5OJbDeSGIcx8VrB0hqByGeAzMBSfMvZCOteMo8U
	R7AhGgz2Ql53SgpwPkVofBvf2OtxeVHQGxB60Xhfy0eiJoLrgQPZndXRL7dh6o5TURXtSEEhvzV
	0O+01m+vcUFxmb9NuCuO9HsrY5d1FkpZzNQJGeyZs5xEhGT4sYZpuKon5rOCUOyraRdV4q1isAp
	5BPl05wX8JXGmtJYDZEJT8dMRgSsZP7XjMsl4J+lgK5MTGd/l5t5uBi5jAW860alnv39CbXT1MF
	PHjEEWdqrUu/TMDSa6SovKwB07hyK4b7uMAWfLJMGHmpm71NUpSAzLHUhkgImiI0L30VDUcjsW6
	qxyll/T++cI3IyCrr3mN3pyU87ax6tT+xMW7g6+jGR2w/cAd1dFC83l/yhui8jGcRGASsOyDMy2
	6bE1oFwl2MIyC6RcABdoFG4IyilsnPZ241jZDbja87/r2Ev/pcgpmdoIrl/LCf6vbUzGnj56KRd
	M+TXUJvSp+pyNRlY+CShBfO6SFQLI0XCEFPerIQg0vqWFRiI76gH4uc7xkgmsTz
X-Received: by 2002:a05:600c:4704:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49fe66ee908mr111606035e9.23.1790360709128;
        Fri, 25 Sep 2026 11:25:09 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:25:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v23 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Fri, 25 Sep 2026 20:24:29 +0200
Message-ID: <20260925182435.21207-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6de1ff058db6..f6749933aa0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.55.0

