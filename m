Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606777;
	b=SqCpKiJIDaWNNbSAc5E307TxiL3Q7RNS9KHe9Q0xNiJrM3KekBaD9IDbvEmg74UZVaXH
	 /ZFYu188eCARLzeAJ4dNDV1oTCqaj9yXbxF8TabhaPtwnt3bGGSaLTm8wVkr7vB5LMHwb
	 sdF9C0ghfOW8InRxfwA34GyGkx//P30qQt/BlsVJbeyq+y/ZhYfvFTqHG3Old2ft7EfzH
	 I7z1WZ2nrcAbOzDVGz0YA40/TrJfkTZSNYwXvQ3eW6dBbqK1z1KlWqm7srdQ2yDZ/EVf1
	 sY/e5hyf1LaIIzzcfSlNkMcccXJqY+vpo5cXDgr+wEPZ0czhu44vhPleL2j7+W6geDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
	b=aShMy+kYUrycJ0q0Z3t0I5MMfBCJnWkWxIEyZjfOcrsYK85foLrz6AaQoSdRyLfkcEA7
	 mIY4gJIzaRDEcPT8w54TNcwb5iypmEth2U1Smy/HY9xB1n+uKiYK7/bi0igrEhoZjYATt
	 JOwTMXs/WqSxl6xhjhZhYCboXTptK1jkJzr/1JFW6T1RcvWwflpC9X+ITOyuMXN8rmz/T
	 skhmfbGtIxQKTYHsi054r6tNFmJlVKxNwvPqnSjw91vgWMTtZO15iMbvypUuzeM10yPP/
	 HJuSHbJn5iu5hpocX5weegxMWqcDz+7UJTf12cIn+zSdVCJMTVNlGmLl7316DzsU1DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AmW6mSBe;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98697606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98697606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AmW6mSBe
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3866a784546so7540493eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606777; x=1796211577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=AmW6mSBewLuo3q21ShOYUpipeHpVIKrIaJxZgpebBiXZKivKxtat4FrG9ATEH9jKaV
         mjZGrNAXaRKmMtclVItMJfc9eREmtrGX1HFypdUZzYxhLa3vLQtyEF5RnMCSMXsohGXh
         oJ6fgyhC0C7OIl5+M7WTYIkVR9z6BEPcb7ofBCT9TzRAbPRYPUi7xogl9FFLCvLM7O4c
         O0JGe2mPfT1SA5DNfAAtuuyjq9v01lmM4RIUIaW//TEvhNsJDY+vuAE9WSb9vwdrDp7C
         027K49TEJoUXgy0fXdShTXOp/oGpN1VhP3jPGIXkXIFl/LpIdFnEmSEQb3GkqVNZEgun
         Bzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606777; x=1796211577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=tWi6CAyPVrsxMWyErDFoIX0dIWvOa92TZUNOy53yJsiLBJUrZ1r+SwAQdvGbM3hG3H
         3DxvRtwG5X+YLNPumqKrtvvGySHLxppmmngcwRKey65O4EKcoT/PzE9mA4gAbJ2ilm8C
         kH6hPgA3Ke4VXAbANuEbWt1ei8T/VIg2oe0zL3/NlZ7HdlueIkgeF2GBVLZZD2LGWQgM
         VGEF5mA99Q5hxXXZk5xbsOAAzwlJsqW8M18lx059w914iHMMzP09QbU5ZYO9qDWyc8l9
         7sgh35lZFamE0uVfLO3PRFcH0FhzRzCiQdhnmQGfV9yLYxAQSyVMWaKkELrXLhHrzVBh
         +aCg==
X-Forwarded-Encrypted: i=1; AL+hErGQhU8yia+Fo+3zfuwDN6dtRhTsLRCPFjE2mEPO31/dlxRzGd28hWlzhxh1BZsQpqu/p0k4UQFddfaR@vger.kernel.org
X-Gm-Message-State: APuU4Z+thbulIOK2x818sNkctGjTgDUYsX1a5q4sewcYBVIoTenhn320
	CT6jiWgc6PiiErfVDu1TkxakPt+nBa1UqthhtmGY5I0Zc2JtzUVNIPOZ
X-Gm-Gg: AZFdTZduXUiPGutX4nqNMmHA9OGKrLBSehCkTFwPFRyOpenqvha5Yfb5q6VPv42SHkV
	rjGhHCdFtPmfO/8ZnN0w3bKDBgihdDUd7nXXtqufNPxHpd8OPshNtXoXdkeVQ7SpITogUfJuRcu
	yJUY/fpMcJClX/z3Ie8RBI/4pKZG4EAnFJRzrOVFRijgttjQ0Oqq8T40c4O8wmLSyrCWTiPo+oH
	Y7YqY9AEPuMKIuPFterisuxDvmIbzp4PNsmW5HJNX9eqXzKP/XbhD5gdY9P5FcRqIEzUpjL6GJn
	NoL+G6ZxfC6m/hdeWMQsYz/TXJ8POvZOYCakLLL1e+kpItoudxsTQsAX5qSi5uIJ6jyiu6ojFhE
	HgaaS2YOklSOLCtndwmtRc4UBD/1Py10u9dH+6ks4qS+DhIBT6cEadBC9DveBbHHSm+RvAS7ohJ
	VUiof348sUsUO4EgWN+HzwABYYuNMRT+cn+VRpLaMZhEDKQ9HYWpqVBfY8+7JqvrClIPEdfv5iN
	KtNkhzy/oB8rnnSn2FL0d+YQY4VtQk3Gj9OUh7QuI05DVCkN/Qq9juqwyg9me7ky46zkYbMxAr4
	nv3CLWo1dVWKKHQPT/dgqTn/fJMmnROBJFQW7YB5acjnB9U=
X-Received: by 2002:a05:701a:ccc9:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1b5568b3e73mr17483022c88.15.1795606776639;
        Wed, 25 Nov 2026 03:39:36 -0800 (PST)
Received: from localhost.localdomain ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm47479629c88.13.2026.11.25.03.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:39:36 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Wed, 25 Nov 2026 17:08:44 +0530
Message-Id: <20261125113845.297658-3-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125113845.297658-1-dineshkumarv85@gmail.com>
References: <20261125113845.297658-1-dineshkumarv85@gmail.com>
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

