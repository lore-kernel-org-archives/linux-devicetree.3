Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615266;
	b=WGGurxuFc5mZAyN2KG8WdrZeWAoEbtcWjNwJ1p7hGcl0Umkxk4wk2Pnt15tAwD9qJGUk
	 nidn2NMPFQrMwftO13QT+FRE/zW8Ncr+hOMqpzcLZD1lU39MknnMg+zyLK5uo6Bxb2fd4
	 DWUn/vPtf5YG39SVyl7EBl960694vp+g9OV+azTn7C4R6KpRnE3kGoXzY1qzN4GSaYQ6Q
	 PqHCMVLIoCFDHFwdbIjoIRELQZ0mSiiNblJRJ7bRMT7F33dDRBXz9wKeDHtFDZdFyVa/Y
	 nIBQoE2tBmfHhpn8VL2IcsavnURH9Z/4XOpDNngeW2hZCqDPGqCJmISQf0ruT6TK26Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YNsBSkBoPNqus6PPGs/aSyWlW1d40cN1RtIlz/2UmdA=;
	b=B0l3ZXyVj66j7BRkyRLIVK1qeVDmzhMJ1uopBvmIEUMq2PgFQcMX30/+VG/oNQAXqhpL
	 Fzx0KBxKoM8gdbK4l8B4hTXY+l2sOZOozTjZN3y68+Xonmgng86VHKRowyRc4e9v0NzKU
	 D42KLRPpRWKvLFwTPCRKo77BcBF7tSEgRXJHqIfUyfnx84n5zfHgf59715QhZIotOPcqy
	 OY7HGIL9slQPTWjX4vip/3/N1C06dBoqIDrOHfRJy/rSYkDnnJprd28KSdSfXDRtyyG6W
	 6r4Rjp/xjwH8ll7VGBPJ25S+zRFgdLFW2ujMXRgckDtiYsqlhLmStVHiuttSr2C/diA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bveRdMGB;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7770606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7770606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bveRdMGB
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso918813eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615265; x=1794220065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNsBSkBoPNqus6PPGs/aSyWlW1d40cN1RtIlz/2UmdA=;
        b=bveRdMGBHYm8lq5eRQirky26NIuXp9H65s329pB5SVV94nFKSKxS4sMTWIODZ5ucwb
         nXQ8v3H0rs+LCK7MC6SeCt06Ma0fAmaZIy970AqD83eAM4QoCbT7WwrGfI37G5ztvZdx
         YJgfoWjF1qJWvhJ7Vg9Vri/kaBWVbbUBAEqiaOeQRLaMN81M1a705fx85JvfLI/R9q5F
         yyCu/wTxUMU63tyNVBbSauoeACyNafYJJ7PXDfKVdtgn5VQ4HqA7VQe2qVyKDTX1Lcfj
         tQJrE9JCCiQa7Eu04jJb92ZO/evuYb97gycmvxZOaPQXDH/LV+YLa3XHS4cFfnoF7JGh
         LGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615265; x=1794220065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNsBSkBoPNqus6PPGs/aSyWlW1d40cN1RtIlz/2UmdA=;
        b=prP59gOce1o95DG8Jh1ZmDQf/oyNzUjxAdGUxQbag20dPL5C1nqcRDaITELe6KNvCD
         WRdgToxbiDpc1YdEvz2/N2K+o/tkw9yPDIgxodQ864OE/XyKtZtmsPYNJG/hsqcvQXP6
         UrtBYV0Yx/kEmS0ijpP0iiufmzB3cgorwK5K6gJk1LXf+NrLmLSM15Ivzie99kiYIdFb
         YC0sV0IaxhG7x2j03tbnQdsaxGGdbN8M7AlFQLQnLiqDDrwM1XGXmSOwllm4xyg+fMoX
         RC93sLZjBlwOlCTUSY2iY55suY4dm1gWr5yfXjxXjOKCLdKoRUZS87+2lhywEKAl4UzL
         9CDw==
X-Forwarded-Encrypted: i=1; AKwUvBySsIQjex5HmAGNbTWVs04cNLDnUM6+lQuov7LvHjCXFx5Cd4Ue3x26wiYLAotA3posxDqavGvh4pW8@vger.kernel.org
X-Gm-Message-State: AFq9FYLH3KyjHFacrvGn+LiCZrBEXES5rh9qh5qktIASuFozQGCuYqzl
	sNL1D1a26omSIpysfB6SdneFBAyaJdLz6nfsa3O9wuvFO66KACqe6jy9
X-Gm-Gg: AYBFou3YUTTgtqCKadNelP7bO1SrRIcrrlRAr9TfIA9ZB3HtLuNMJ2FPLioKF0IbIWK
	9ZnG60WWS5PHUmKba52K0nLTy1LWBF70YZ20FOC+2gwtQotPWW32Uzpo1ZGO2aOYh9aY26Hn8Gf
	Hbr7kQrCuenAaf/0bHQENfEsz3tJWazx4yg3hSQ8xJtYWJRJDh6PqVI7UtSEBB0wVeDfGTU7VI7
	caFP7VTq2Srl/v+4j+GHzE+SKfymuqUd5UQqqlJZ7WovRGKCXf4KexArVqhHjtid31FqJJfFRYw
	SnqU7Xk+exud8t4Ni2rdiv2WPD45Ynt3+9LEded9WQ8xEKAWXSKRvJVQjGXQfxbx8mxXiYl/nOu
	00kg010EJQX74n4zKcq7oDjEX3ili7El3p48FAyY/AMibugQnRspn0I2RTUctGfq5yU1gGsr/3/
	AefXXOdy2V7YNnRO4vD/wHP0xJIhq7I30U/4edCcYEmNoIcdegvsW5DxeYDr8z9UGQ7DlPVfM1C
	HXWUhtsr6TQKT6tUzKoGnhPd6amXjjGZf+KUPxqx9O0edSJ72eHpsYYBDyf8O52rDI5f06XVFbA
	UVAv1ss/CyFpKr1gnJpjWSz16Yp+8jZLp/IprMNV+djQeywBnZhh1MK/EcZJtPM52g==
X-Received: by 2002:a05:7022:628a:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1ac5b9cb62dmr19707765c88.15.1793615264990;
        Mon, 02 Nov 2026 02:27:44 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm56946724c88.7.2026.11.02.02.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:44 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Mon,  2 Nov 2026 15:56:52 +0530
Message-Id: <20261102102653.272056-3-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102102653.272056-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-1-dinesh.v@adlinktech.com>
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

Add compatible strings for the ADLINK LEC-iMX95 module and
its I-Pi SMARC Plus carrier board.

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
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

