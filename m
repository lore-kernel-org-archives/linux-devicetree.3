Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010121;
	b=XaWfw/jzPZt//3PutjTXKGptsgDyf9VQgYkxPL+OY1D7b6knHDJZ8+Wj1TEYpRfeKgns
	 P6fy+28bPW7eWzyHQTFcxBaGa3vx9WA0ZyHrRVO/zpXRcsLJiB5419tlR/O6DsGe8Ekl/
	 fVLkZ4lsxoGyxmBr8/Whru4bRnVrFmOwdUQcRAZnxHSUq0HOIrD6rEj6BDBSL2rGGkJun
	 9V6BA7/sIxpSOgleKI+vFBhz8j3JUoQQxKArTq0gU3fG9HyCyPhHzWcxiilQYjmlh5fCA
	 mXkVT/PxeAO+TFRV40JNUaFAddBtB7Vzkgh5do4U68xC1OyJ2yrl9ZbKWhw3AbKpDqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=;
	b=qXbc5nQjMCtIQ3IqzZ2FlGNkhHkd7DJcOBi7XBZ4fHLXduzsoy/kdZW2geqyGgIK1ikx
	 v6BM3pwS7pI4KqDSy0xVylRVkHX6YJVLp84AdGP/2cKrmIHht/pvLf3H6AVdt68pKQqjV
	 HkYRtGghN8DZ2+m/dL7kMteOKL5LcRrHvRkJEOm7bzTnDn3N4bePmW8pAP9lspRNTbXe5
	 dN/UycOpfZopfImC/Dn4KNZeYACwm4hwPlZOVDziLa4AJybXBJebX4QCvq1y8ehqYB88U
	 BEsO1jYYhun0SNP35aJf9KHJCy6NJ6nL4FOwzwUNmMaHNZ+AWsrC4lS1dqTGx1izjfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Whiq3r5d;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791B6606A325
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 791B6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Whiq3r5d
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b060ec084so1695148f8f.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010120; x=1793614920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=;
        b=Whiq3r5dD47G3/CR8yg6f4enuOc7fSamDkiEzrFlDgN31Q3DfhgVzBioNEpCmkg1xv
         4/2RathywmKAwup4MGv/z7qxz+JFLKF9i6NHmNcBFe6fQj6Xxz4p4xVsdT0TtkDdWMvG
         5Yi6Z1P2aPixbMBpTg0GTSG3X3S/TgpumBZP7sO6z3OXd608a4W7csu8OZmLW8F7KH1k
         j1UxfIyj7+c5n7Th4U1gifTAQHee8vRJu9psysHyIAIR4jgaGMQHqyCHeXyq7RsbU9f0
         EdN85/ukV4J6vJLhzyZyTM2T2VNNTBqc2xk/+n8DRtmn+w981Q94BKTfbYRnVHG0oV/b
         oAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010120; x=1793614920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=;
        b=ITIvwKaBokF6r2Xi/tJPGfTa+H36ybHOgJKLgjZ7elRm7mm2OBJamBFEVK34aYGOcc
         Gzph/FGyDHqlm/R0HHg7c9gL6Nl7YEb+79iQRDslDXclXcIUOhUP0QAlVB6tAgwpgK0a
         jfjEo+sPtPiDh++OSPP0X+cVEmvnxRV99+qNgb3ae8oZifbhc+qm8d+dtcwsK9ofxr1S
         m/gsByvBEyJwIVXwEPhRDqzK9iI5FO72YKYzcN+o3LgHjYqOg837Q0/irMpB0wiDhdQk
         bviwAQRPHF56ZlAJE5QyWTZzQL6UjcmWtZu0VpqefF+jmVouAvh3bqpX8u7n+uhkFBd0
         BmAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCfAV5BXezALTJL9Wsphh5C+THkNmX5DosuK2S0uFvScpg3HNsxZAL+983B2Xmtf9MCtGUZlM+Bj+P@vger.kernel.org
X-Gm-Message-State: AFq9FYKwBTri9MX+WreeI0UISQFlQMVYBx/aZ9+faujxkhvtFtvPVm+M
	JMYO8SZxJbWZg+s/2wWUuQSbBfLZhJ2zND+nAyh+F4aVhifTsqK8fhH3
X-Gm-Gg: AYBFou0wAHY20raN0ATOoJtvBpsdNl16KqpqekQHOcpYtWle2BO1Ua32yEQ5AxUIKoB
	kyxDdDKS8nXn61D7U2WkhHI3fJ5IduNzJRKrvUD3Heh/psARZBPYqvgXGa7GmDmGRzO2zb20bg6
	piATbKkFQVmMHqykBf21BkYPKZdE2UcKofcxB/YhXl63qhiZtXRdxamZ+NHzYyzxvlrjDiF88vY
	Txt4pcVGQFNZNZFpM8l+usKxfhWHpEleULdLENW4tGQb1HluE8unPD1zs6jGWik5SWJDbzk6ohD
	jnmJzElLSLN2nR8bfoanu3j+52KEYRtzBbo6MZkNaQLv1AuLYyyAED3Xzr3zXT7+75zpbUeMjYq
	Y6Kswr3MM+6spbUFW5xg+b7pbizRfMob1YQK7EoQmH/fS56/oL2uHkGzcCk5KYD1FqVITx4xMxu
	GzbNiTWa3+fGOKN0VFelFRI5NgHM53pxpOwNynSCw8r3Xu0IA2GDmyAKGsGby4pi/xYKkOJ+ckA
	Ej0zW8GZV/r1kOOHaaxGbeR/UBkta/7LcQqk+30pOr4+FLDif+m+2AfX8j0FDOfH1XRv+oOf8WM
	rLQxHUPGr8odea6Rbn7/VwFom+Q9z7CeJkRx3T256z8iJ4A4mVUeH5zH1yK7
X-Received: by 2002:a05:6000:612:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-48e3eba5700mr11608540f8f.50.1793010119803;
        Mon, 26 Oct 2026 03:21:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm16762876f8f.18.2026.10.26.03.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Document support for Airoha AN7581 SoC
Date: Mon, 26 Oct 2026 11:21:36 +0100
Message-ID: <20261026102138.36786-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
The MMC controller is based on the MT7988 with the difference that it does
have a single clock controlling it.

Add the dedicated compatible to describe the 2 register requirement and
permit to define only 2 clock (the main one and a fixed clock for HS)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index a4d032224dce..49ad2a8a390d 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7581-mmc
           - mediatek,mt2701-mmc
           - mediatek,mt2712-mmc
           - mediatek,mt6779-mmc
@@ -238,6 +239,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - airoha,an7581-mmc
               - mediatek,mt7986-mmc
               - mediatek,mt7988-mmc
               - mediatek,mt8183-mmc
-- 
2.55.0

