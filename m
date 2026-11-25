Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595002;
	b=Ow2jSKyHO4KCbJxDB0UyA7KGclbMJnSbX9cfRlkWzsbfJIvTqOLQTWOQipbsTnsAgJSA
	 GwHPuXzJR4JJWyDUU3ZC9bbIJf2Po5s51UyPFiSibqXpbBIirumkIp70YF3LqO/3elq3x
	 flJZX8x6+5S9gK1Gls3/jE+UsSDVyprQmo3o0BFYOlxPU3KAoSq22sr3AKkJ23dFGjKee
	 PwlA8MoJ2Ag/iU/Cio8vz3xYEGzoO2yyuKPfuj7vDphsGQXtRghRVYfQzLCORXljc1LjN
	 eMcYKl37o9TchreYuxzpznFM3C2l7fs/nZkwMGYJqLqi9GupdkVHGHFot8973GjP+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
	b=CVd/mF7yz9WryfBKnxTwsFPDuKa7ACKhndiPkffK2UMCxod5vvLHxCV7WMNg6dsOxuq0
	 RnthDRwkwpwj84WOydkAvKfVa8UCLojL7lgJBenAhVYHe4w7cjvHB2UdUupDJb4/mJLxM
	 yqgDo3KMgeI92DeYikdlFsXthXsGQJJYCoHhFgQpOiWkvKJYU9REii3Dm68p5BJY8Kw2F
	 XkWZ0HrKgllHOTTf+q5ev4k+vIKCa7WdDoLTTE2JK+uWfbSMbwtM0C0UqwpRUjYjdwNX3
	 ntv98z+CIR7hpENlHtNU/eL7lwttPQWNX++Vx4lTPlybAa674N+4D/k4kJ+8GgS2oEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Job0aGyd;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D72606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D72606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Job0aGyd
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11760590eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595001; x=1796199801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=Job0aGydyRzHGFob9KXbzsL2eylbJ7xu7PvsPMy9a81mycXrMx9gtRwiB5Ekv7b87+
         T9kWQHtfocq62eprB6pHSUUVeDsdVhIHQJqrsi2Og8QCyBdZ7drX/PxnIh/IjUkNVaJQ
         5nIXwyTsVBXL+UhIFrJxViAPQpSmv3M8cwa3k84IQ1B84xvLImpyjSzx0zxT11ICuN+8
         9eYEFCZaoh+pqADMlFqcTaMDj/z1q+MDi3Jr9aGYxBLo2mWnXe15HM7roqg1oSszBtKx
         7TRI3J+X5uS6k4AM9uNgyQqsqAQIJdQuOqHZPPs07XUHBo1X3kRSmxLsi70TM9RxWQ91
         jeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595002; x=1796199802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=euk7FyOA4no/LfA37aSS9nHk1j4Z/m2DhYePYz1ZV8Gr4ypcla6h3nPe1DlH5p7YId
         xw4KIL4Jmqj4oPOL6feKS6XI0NTYrdiB4gjgivhxta6Yuaxq7sR8ZcFifsjuRJCbBRM6
         0qtrweBp23VU5gtc/4gqI/I1s3ath16tpPyIMYsS4aeEMvravHEC9UDCvQYJti78zhF7
         qCGG1pRL+sJiM4+ZN8W4djeIFt9bvembaQI49ROJQa89ccFcHbY1y60VFVwwVXkX66Cp
         EDKFB/R5KR6prcUZbaJegk2UD8Duq4W5cY7XvrBZs7g/tdfG8HpsKqgZXxw2BJvzQAtK
         Anyg==
X-Forwarded-Encrypted: i=1; AL+hErFGx5XvrNzfxqFymWGcKrJS5mrfRIecMN7Lq1sKwJntb8y1zqryS6fAKFWLrdxLmSwb4ziJB4Q9cdSS@vger.kernel.org
X-Gm-Message-State: APuU4Z9s2Nxwuh6xi5VQeu51ED41k/SFDCroM1jIizKQTH4/kVTp32Sr
	yQFq4pUC/4bbWuQwH+ZaBEJBBWRTLBqCP5F3dYkLIZYOHsR8o45pMiGv
X-Gm-Gg: AZFdTZdNhaMP4PICKtAMX1XxDIa0+nmsS5l65PpiJ+n82Es+4c0W5IZHLZ5KzlYs7ur
	bFAjH7h+LIxu7s2qzlPk/p/R2aCoLLymejuT6kECVnpQB4Es58idofK5YOA+hd3R7p8uFX/6yED
	fvKhRFM5Pq6o5oNqxjqpFvPeyYMBYXdHi+/Deq7rtNrNIektx5jcKtWhsqc3MYWSa8vTTynlRyV
	spwctqnvLZUzyRVVcAUfTwxq5Z+CdaA0sQs3+brX173jQnRKT6kSSR6vIkbnYzfPF45/rI7ljjk
	EldLZ5lX5Gorxm8K2XNfF9alAL6GCLySF1Wj4CwkNyfiqeP8N+MGPIev5uWZLhAjQt0kk26kzcq
	+X4sgluol8eHpKVmApFrn0cA2QzQCQ0y2CgfuSjPbngcGyq8of7d/zAEOtXBoXjJ1cIdv3vzmJE
	VA56srzgUwljQH0rEYdB8RfYTGKbOgbgaZTp3x+DntKaRCsSid/Fife0XvWA22tqTcY6jRGFdJn
	3np33hRlKfPu+SOxs6AqJAEtLd4zOlPnB9sZiXxZr2aTsSJWAsa/vvvEoDmwcliY30+0eDzMHPu
	+S9eto2F/FnpJw5JmzfI8hCdnatenQAc0rj1mgKldNF68ZOTegLF+GEXEXCnZn9+OR70QVM1
X-Received: by 2002:a05:7300:cf1e:b0:36c:b138:651e with SMTP id 5a478bee46e88-3857093fd1cmr21332699eec.22.1795595001427;
        Wed, 25 Nov 2026 00:23:21 -0800 (PST)
Received: from adlinkccoe2-Dell-G15-5511.adlinktech.com ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm50919906eec.23.2026.11.25.00.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:23:21 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
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
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Wed, 25 Nov 2026 13:52:21 +0530
Message-Id: <20261125082222.136238-3-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125082222.136238-1-dineshkumarv85@gmail.com>
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
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

