Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708949;
	b=x5gLQLJnNL5sfhRNadnsSPqR2+l4lz+LF2V/G7sLrvmo3MbZmy6yOh0roIvLrbp1FcpE
	 xeGBYTfQpQaaCN0kb8Xsp8aWWcxuxQIub4uby3Vmc4bAumjF18UGhxkqoAVP/6SisSjV3
	 cLxgCPoJwoiXuG3DpDPTIs+tXcWoZ/M6d9tnWarBizCXdH9WTaoi1+Z9Uh+cIMQ5gcaIJ
	 W60BB1iejfbiuNzUMDImP6VxFncZiN1r18kZmTD+DQ18QXPuiBBVXFkFay2N/0QZFW+wF
	 kQAwl44DFaYAH9KR8P8GqzLQd+vSAxHxTb5tIgnK6L2MEWjFV0wCNp2LD91Bel++3Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9P9bZiuQb+3bgepIV3kTLbZdzWdKynmmECPlKobX7T4=;
	b=Xon0XrqC+GGRR8MpVLGlyTcjdK8xDDfzowrbA2X/reH0yHZV6JYs1Vtf5Y7bVmRUCm43
	 0rgQsLZd+ilxmVXRZJICY3SPxwmvHWTxhsl80AmeLgEg6Z7c8fkcuMqtT0xbPhuyz0idM
	 Jc42zJm6SH6u431vS+gSVIU+C9Xj8sPJUDq1bnSLw6UjK817JGEKUEgxOkUZI+FEi9c31
	 GyeU+SfpJ81HJ66baQ6S4BklJsZQrUXuRLd9178L9i2lBlSVB6SIaakGn4KqDC3lKDuJD
	 jOfJLwnbzVDLFRhHKtEu9b+IhkzrV43Pz4azGfWlUS/QoANChkkg9X6hcAhG4G8FxtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rczddevy;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E7F606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E7F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rczddevy
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so3210306eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708947; x=1796313747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9P9bZiuQb+3bgepIV3kTLbZdzWdKynmmECPlKobX7T4=;
        b=rczddevya07X4qVgMl4y6PHRP0uRvue5Adw2EwSG9jG4ccSY9kiKsiMhwp+4AgI0Tj
         dywdpe4swv5CzWdCCOtVSYzhm9Lha0foPwKFkBmqbUCLCUnETqbZtV6OVY4w+W/W44n8
         Ns2jt6Yt+1kfnwXbKU+CyA8hf71WfmOpH/IPGhW/lp3CcXcCneSnJe32ml/+h8AnE5+x
         Ke1f9x4ZI/LvIhv/m6+8wusYcY+o0I1GqzjTegd4v6tMZouSmz+O8uZ0WpZubm84PX2a
         /WqTpPPnt4yShC+DKS+S3sIAygpTcBZUq22nuvhKcgMx+XBgxvtmYF2S0JP74rjxCBc8
         9jOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708947; x=1796313747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9P9bZiuQb+3bgepIV3kTLbZdzWdKynmmECPlKobX7T4=;
        b=HHM5oFNaWkNNQOJYbh9G5F4WNLkhVDVoXXMwiC9/9+DdvhotFK914XHbL+QLsC2E/x
         miICsnAPEdxOlniA7LnlOE8JoIypCq9A33c8YkExwYBtfunrrxu43LVy/FGrvoCjEhMW
         SgIEbDLtlLvflHXMvs6JPD8JcKp0aw5SqOvC4QH3jAn0AJ53nmPhpTwMwi3UNqxZl4zS
         1C1URMIr7/0hbNzvUIQtuPri6dy8/np+rYzqKGYeaTSWSoJWATVqHjA+Z34NtBG7OEk6
         QlOfqNCvz+80a/Co8ZBLGq/JX0q3STqD7x9vo3J2IRl+6plJLBOpiGASuT6SnVJW+meH
         WJ1A==
X-Forwarded-Encrypted: i=1; AL+hErF6uBRGnoGlw/PtOtAM9NCx4OcllEfK7RvBemiiV08xvcsexj5U0Lvcs/uZ8GP4W5EUIBKMBkE2njCP@vger.kernel.org
X-Gm-Message-State: APuU4Z8l/0h2L6o0d+O945Vhhd76q3ewGeBKcarYLCFplfZ3Duc9BmEn
	yVR2sbI5/oxmhsCS9pi/JMpshNtMZnf683WNHYfSoMdyk/NRFNF8ufFXeBsXvXtx
X-Gm-Gg: AZFdTZe+kGGQIg+2lAm85kkU5glJ1qxYOmIxoYQsC0Jm9kxE3s5ynsOROLOtdalddU/
	fL6phuWwOcJX/0zMpkXhG9Ny/CUu/9wLrlFHTC8hCgDW7jTm9kxH03t8bQkucZ6sVetpxzjyCmk
	klhaBI6DQYETQ0xpwXZHFGbMgi5S3/OReyfqAeNax+FRoquizdI5S8dtm9M4AVTLbdTgN3kVtzy
	Sl+xPXW6gt9N1tbKTIgqzSXVXsPO+5lIm1qMy/riEG2uu9K7+MBTbJFFEz26EL6+4AR+g8Tuctf
	u35tL9zUB8A1vcbM+fV0krNE70/dAvgkPWhvDaYvPEBrsTBDE1t15sl8hvf3ZTNVDPA8hPcvHSJ
	3EvGv54OXDN/ZADboM4Y9vCnvOgQ6GcvK8f/uB6tVlsjBogx4Mj3INa++AFrzZj/L6/cczeOQJg
	GI+/fLu4E0m/z/GKpdgx+f8kmiWu4EzpZnD/fkbviUSiHXVcRuoqLg0P7yHFmjpDJ7sWEL7RbKt
	2/Y6LNTsFHYED5meIRoQcBL9RobR+pluBxImb2ukfYqa8EyhLjHMwRcUyWjBmKbyBl2dU36+CjC
	lSlV1VyoIG7CnzXU23LyKz9AWQ5hru6DnwkVa4VBEmSt
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr18511297eec.32.1795708947325;
        Thu, 26 Nov 2026 08:02:27 -0800 (PST)
Received: from localhost.localdomain ([183.82.206.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80062260eec.11.2026.11.26.08.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:02:26 -0800 (PST)
From: dineshkumarv85@gmail.com
X-Google-Original-From: dinesh.v@adlinktech.com
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk@kernel.org,
	conor.dooley@microchip.com,
	s.hauer@pengutronix.de
Cc: daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Thu, 26 Nov 2026 21:31:01 +0530
Message-Id: <20261126160102.52163-3-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126160102.52163-1-dinesh.v@adlinktech.com>
References: <20261126160102.52163-1-dinesh.v@adlinktech.com>
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

From: Dinesh kumar v <dineshkumarv85@gmail.com>

Document the ADLINK LEC-iMX95 board compatibles.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..baa96b004c52 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1577,6 +1577,12 @@ properties:
               - fsl,imx952-frdm           # i.MX952 FRDM Board
           - const: fsl,imx952
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: PHYTEC i.MX 95 FPSC based Boards
         items:
           - enum:
-- 
2.25.1

