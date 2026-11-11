Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428631;
	b=wYQB1/CkewG630hifehyoFMgfGMY8EQL3b3dKDzc1h8t7Zk6BYUb+7jRQ2n1a7o+VoiM
	 DU6kTPzEnt4WGZKjQp8jV+t9U5/FWuj93r9xLgXhaPMTsJi/Xm3zCc62QsKRpjXaCTQH7
	 XjtYOAfCqyWLWfFrCIg9CfLQXz39FX8dlIyk8D5F+HTgMjgjQF08USfBMoE8O01Ns4bjV
	 rHIHu8WGntNKaCJhSmM6OmG13w55wbCVOUa8XsNn5sramVhbvH9DGBWMnthHFlGKhIQT2
	 WJva7AzHLLVBwbPf/GqlbJKffxuxz9KhC3c+QJ0dwrmnpgeYTF5L6stFVsu7CiY+Dhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
	b=h+lRl387Mk0/fGiWKWbjpAYOYhGXOXd8moG07FPaHUzA4yTYhzquXURkFLhKxXo40Xxa
	 uo3CBSoopmE4mROhDOs23LT8fbuESYdru2tmv8/Th/XEt/u3Zu7Q4u5qcbbCLGngnr8sS
	 iPYle9Fmf3OMtJk8UhW015Wx7k91zIUjokUBiv0NFj0flEICwQ8aqcps6f9iW6e8/CQ1q
	 jo57N3+npMCvUKbsisQomuFokLulTcsjr/639I9B765IPDw6feCyqPpmrVAk4gWEaCfDC
	 GNOF1FMntum5uJvA7qUjN8BKiysCsCxHvzVVnJh6mGUaIHwA5111i2OvhWczyqJNkiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jq7Tj9Tc;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C604606A335
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C604606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jq7Tj9Tc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48fd2e38825so2153644f8f.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428630; x=1795033430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
        b=jq7Tj9TcQUnWPrYvokOb+rKU4VzAuYMv9fm9krXCNvfKJBIuthFdJiY9BhF76o+la8
         q8/pQIgdA95MBvSV9IHXQrhoPEQe8mPM3WVaCrmCeXTJ3wH8iBgVPzXdZ4cTYvYGgNtf
         d8H1rzBZ7Qz3cn8t7CTiZDf9KLozplXpxlWRGjeNl2W0C1u2xXN476PcA6K9l7Vmge1+
         rzxWgVYS4hJATp8DiCRfISrjlzvN6UnOfnDllYEpBYendtCmKP3zHTeDAPIxKTgtTheN
         HNUgIXkDwZZyxxDW08vbdoYRN7HOmKj4j2gsUKjcp2M5WZCa5Gsuqt7tyJBYQw7JdKUg
         C4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428630; x=1795033430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
        b=kOZYyvxmF7O6lPavJfk2k4AxjNA3L8tVpBX2q2fmU04GJJmIJW+ssqOYMI0jN0Qmll
         xtXyopsB5YIfFwtFj3tDptpioA9Z67BUbQB5qNMm+4HWeK1YewSnF3pVbRWj5V2fOj7G
         nxMIFbh6kVCup9hHVrqqa0uSwnpMuMUfVBvm7pP0OcvRcphymypkbBJYgNr51OcXgf1L
         BTG9cPvWgIepjEKvjREyDN/e33CbmGADMmw3u6UZ+6Vou62bYsnhjose+xfh8lpFgBLX
         g+e9+ZezBOII9YfQYCiuhXn37dNbTVclGbwnuZp0jNkLAAO+tdceGShd2k77gsgagdIW
         mb4w==
X-Forwarded-Encrypted: i=1; AL+hErHZPB24KS84/wCsbEWjhBXbFfiU76naDt+BmiCQC7XZzfIbg6qQhymYzbZkX1Wq5UJ74kK/vESJnnW8@vger.kernel.org
X-Gm-Message-State: APuU4Z9L2759AYLqficGmV0sB/99+lUMChx701U92qb9T5bPkZBJ5sgo
	4OBmAgJzaB41jaS2Wko00F+HLHN/5LuOEuGfNXz8MqJAqH7B3gnrZX9i
X-Gm-Gg: AYBFou2D+OZsHld4aUUC7fedo3Qfgd0aoREIA/7ViRH/oc4xBhAB3shzSf+Q93Wh4l2
	SaPdsSDUl9noS+P71rcgFcFpx3FWxpAK8kyGgbWcejIaG1QcVcDVlKjdo/bCax4jrlWH7VbdtGG
	Pj9wkPKpGjMINx5mwS6Q9S6MmX8H6ENTrMjLPUXqU9NMX+SlSjVqcwMziP8R/S4KIoxatxUcJcS
	ba0TzNCXofB8IBN+oocCPEioWLLFRY6nnj6nKFYmQ5ia0PEgcDSIALSj4/DH+9NnSv6P1MTOIAY
	k4REgezzNCE+r0Mw0kQxHXmLci7RFpqwhCWLi5Tt1ZbQ30AXJuuukX042OrCn3Uap/f8zM4TFXr
	fkkM4rdEblC4UpW8Ni8tBa3P8vbj67Zz9xg0hgIXKWOwmZ5Yw8papObBzO9faNN2avRBP7X8jb1
	RPWJBIdK3XgsHoTd2v8m5O+mvmn0OtXXmH0j5zJFKGBDyZ2sOZpL5OSr0XpAy/CDen052/zqu5G
	ZdDSfO4XOAlDwwZmXhIxK52FOyDM9tICSjeGWRL0lBM051rxYkkjSinZCJdb9UsZmZFou2WFxvy
	kQuLvQGgOEDRbLUwh4UuE7sU8RWyhQ4RFBKuD8CcQoa9pMolcYVEHWVm8u1cm1JDkTx3wI4K3Gv
	t8jnkVBldqVUEIzhQgIV75JRlSrlGH+o6POt5qqJXLkKy7v+vJyajypc=
X-Received: by 2002:a05:6000:40e1:b0:48d:ed0a:e064 with SMTP id ffacd0b85a97d-499c64fd304mr6044596f8f.24.1794428629757;
        Wed, 11 Nov 2026 12:23:49 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm12079305f8f.3.2026.11.11.12.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:23:49 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
Date: Wed, 11 Nov 2026 21:23:10 +0100
Message-ID: <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794420001.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794420001.git.stefano.r@variscite.com>
References: <cover.1794420001.git.stefano.r@variscite.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add compatible strings for the Variscite VAR-SMARC-MX8M Plus module
and its Echo development board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - No changes.

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d0126f54b387..397e1cae92d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1354,6 +1354,12 @@ properties:
           - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
           - const: fsl,imx8mp
 
+      - description: Variscite VAR-SMARC-MX8M Plus based boards
+        items:
+          - const: variscite,var-smarc-mx8mp-echo
+          - const: variscite,var-smarc-mx8mp
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

