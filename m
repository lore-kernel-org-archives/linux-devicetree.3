Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B73533D6F9
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365068; cv=none; b=gHdMG83jIhrnB8mrLLqdMKwRwQIf28QJ9uux6qgPSv7cOweI79aI+RdZT9zm2GTe77QHiBc9A4JBB99KWyWgmgpIFfRiU1LJbtJ2PFgwehdqXkACrR/Pee9o7zs86L8sbE/Dg8J3IWOpcQhVjEldWPnn/vjEHxJKlJ/xXnvP5ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365068; c=relaxed/simple;
	bh=FBKBF74RW1jmtaWW/YnMsgj9Hhr7SISvBtJONmdABjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FotUrSpOZc4707vQahHm+i5TpjLRw8EScucdN5NCNzG7N9JKA34r3/zstlvzzGSBKexLcpcRKraVnLJZdNWd5cFvveqmh88PDKcl3gGAooey1A9jfIh6wUcF9Y8/137y/2mNwtkKwRfDIoa034w5pEEATJPsj74xCYjN2o0X0nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFe/+oHG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFe/+oHG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49253e951cdso3707985e9.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365065; x=1784969865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HzdZoi0bv+xxuKeJljmyb5SqIlDMVTBvbaIEvE8LEk=;
        b=aFe/+oHGG2z/Gb6U1Q8F1yN/JL4u9iDUNBxI1KkftcvQ38F7M9NNbOoCBAgmrh2kjo
         S78FppExqboE403aTMOXATmrfAQsODJDCQ46fgCnkY8CzQOoXIgPC1eTYBPweMhODlsr
         ta0qNWbMShqjqoU3tyDA/jdgAd7or0lHjRiBvOooauS5lkbwtWbWJlDxuWLAgnOzz2DC
         aFdsfjYP9S8WgG77KfGRXkBOK9zjWmbMhF4LNiv7HYeVPxH/8D2DYwMpaEnhvazs0PbD
         t2PWuXpKKnmyCAnN030zEH4AMZeCqqd8Ot1Z9rwFLXB7HXpW0I/wZrOvJWsyYKBZxeE2
         FLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365065; x=1784969865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HzdZoi0bv+xxuKeJljmyb5SqIlDMVTBvbaIEvE8LEk=;
        b=D/JSCAuWzvTZ1+uud6z3RpCNiHZBd1bNmYgDjM3Yx+83TbBb6etIfXpuo5rdf/ypmY
         HCpYOv5hSyW0tS9elBBBHG328a8vo7EmYutL077oDtVODSfLG8b7WsGEa/QRKW/xGWLW
         9YVxXRbwkP09mEAiRktf1DbYoNZ55ykSe5mS7g58+YovYWB6Oby7hEjCxHOSnCxgH3Pl
         tnN8U9hgv1jUaVxBIl//lVUSpNsp2fKGRtoIMZNfQTdd0Z6Wb3N2bMe3U6dQ34Osez48
         iiyhJ9OAkkrREQEPOBc0xMa3yLYmNtnZgoEx/rmBJWZ9oSB/94MMSltlb4z0fwT8oD//
         tGIg==
X-Forwarded-Encrypted: i=1; AHgh+RpeDiOuPRjtwVrvQYn1L2VN+0waEtkq5sAwaj29daJCcr6QUjdTf8t61kMR9zk60k/35tESzQsD9uwo@vger.kernel.org
X-Gm-Message-State: AOJu0YxIUcJKHfdCF1YLQBf99nceif4brKMHAhNKoSNzYM6peMkhtreb
	Vu9nt6K1iAPKZ3OnOu7R//mP6XzZyye/k6qAGm7sQS1kTP/EwwdfMmUn
X-Gm-Gg: AfdE7cll/2Q3CH5yPcIvK7H9AbHSKwuXoeXeaF6phYHzrXZPBsxs9D/0/ofhSsqJwub
	vuWqnQ/CfaMIOmIiL4VmneMDk7wWJGoRkE/1TirTra4DNqcgcL34wYOiZzlyQGX6nmo6rgtbv+x
	3baFL0F2jRGeDGNGO7dBYIWRuOLdsErXqa/e7nNUnzluv5j222SkGaX/Gn2hyose4ICE6m+eqB0
	WrxiZlX/yoVJRPHd7+1j3yVQotRIiNewqlO3dwueHj6cDY5Jr6XLpkbGDK16tTxVMdmBPbbmfQp
	L/qCmddE+wQSEs15WlXFQSs8BEl2OvEpnQ5jSqQ34W3eixOV/+2y8AH55mkkT4KriI7eVRe8o2L
	0GxLrV0B7kWxbEDCVnufswSRZGqYWyp+H373zzWlVjqv4wfkt7ev6WWSqQHnzHwrt1ABYQYrTT+
	0IKJp5LxQbM5JwdbYcH9ZSCNnwydCUFaHLKWtHXh2HAe0n8xF4e5VKWTVDmWh1cvDjdG2l+oNdN
	7DOA45xkg==
X-Received: by 2002:a05:600c:35c8:b0:495:4505:dad0 with SMTP id 5b1f17b1804b1-4954a3eb076mr54474895e9.2.1784365064613;
        Sat, 18 Jul 2026 01:57:44 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:44 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
Date: Sat, 18 Jul 2026 10:57:25 +0200
Message-ID: <20260718085728.6797-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718085728.6797-1-royalnet026@gmail.com>
References: <20260718085728.6797-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI RX controller can expose the audio embedded in the incoming
HDMI stream as an ALSA capture device. Document the #sound-dai-cells
property so that a sound card can reference the HDMI RX audio DAI.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v3:
- no changes

Changes in v2 (all suggested by Sebastian Reichel):
- reworded the commit message to describe the hardware
- property description now documents the DAI indexes (0 = I2S,
  1 = S/PDIF)
- moved the consumer reference into the binding example

 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87..fa6cd0d 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -78,6 +78,13 @@ properties:
       The phandle of the syscon node for the Video Output GRF register
       to enable EDID transfer through SDAIN and SCLIN.
 
+  "#sound-dai-cells":
+    const: 1
+    description:
+      The HDMI RX controller has two digital audio interfaces, one for
+      I2S and one for S/PDIF. The DAI cell selects the interface, 0 for
+      I2S and 1 for S/PDIF.
+
 required:
   - compatible
   - reg
@@ -129,4 +136,6 @@ examples:
       pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
       pinctrl-names = "default";
       hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
+      /* referenced by a sound card as <&hdmi_receiver 0> (0: I2S, 1: S/PDIF) */
+      #sound-dai-cells = <1>;
     };
-- 
2.53.0

