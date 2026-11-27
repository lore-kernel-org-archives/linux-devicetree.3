Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780902;
	b=3260J8MAasitqsNWj+fstWQIGeMDpErL1rWehqCU3qVn/SsZIOfPpvobHkZwDNcF1540
	 M48fqUvXn7MvHG2/GskeItkZsDvjnpd+2+hWfuyIjT6J7NUa2iNE9lXBXj7OJSozBp+CW
	 v+IGoxlPJc5riDZWn+TtobvLLrq3nW7rEl3zSu+malFSE9oo7aNtXNH9S+cfUjrhQEAFt
	 3rmKd+b/LeUAOnvm+IMb7+tq1YB5imwABrIROqfjZUSo0uuRelHV+YYmU5sVMc/f3p66w
	 pAd5+3+HyHRgdhQOt0Z1H9ogD8KjqBXgGDBhCjc1a8r4I2/IpFk9+agLVGv0TnZwaLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
	b=lSaekDEu086KfiJWsVZFduMvivcE2W3vyYgz2FG/rD4Qx7ajaY6RWcChMjLpluO7ec0M
	 FzXddtJ7LRMTfaC+UXqhfHGt9R53R16WXO+i9s9Ec1pxtACmOR0vXf7d0326Fq1q/1bD9
	 e1cjG/FSeVV61CyT2jD18gS1VXgaFEIjqW/AqDyxYFYDm74D7P+2HyeV8Ke+Itrq0V7yr
	 jX+lfSo6345cC9OOt0OaiHy86npVpn7u2d2ZZKWCH+JQo+lkqzLBWpHx+x1eu5O4A8t1V
	 9XVagrzXPJcIgUq/jiDhnkUXX9PefaXZyUMFRRvXfyw5rc/yJGnu2AtFzZfPi1chs3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNU772Qc;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669F5606A333
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 669F5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNU772Qc
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so7093592f8f.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780901; x=1796385701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=nNU772Qc31ky9w5QzgVxAOC1j00tptej2V0oWLgAT9UahtxswncL8n1K+pL5lyrjF0
         givymn75R2Hm/8Tx5V5biAjyoH6v1+6JT/uISqum6PLkLUoqCigPCdE0ssdDJ6+ix0Mu
         VhPzyGSFWgQAwy0y1QggxjYaG7xhHwiXo1C68CM/xBIAzuiaJLkps6rotRgcd/eORh9V
         +IJHVF2gc2nNEYIv4hmpQU0eDdGVwQ5+0Ey0M3FYK5zfsMBwXktyullwcro4AnwkZxrj
         GD4alXg1cpuSTR16C6+pdAkVIIt175K3beqI03Du2ol03H07eR+18OF/4/EIfKc4ZU4O
         H8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780901; x=1796385701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=2OPpxmT/q4xXYF/HPDc5sgHNFPeW0VWIPYLb7M4H1EdI6JYqIiP4sUU8UTx8mbJsgX
         naiNoRWeL4/ksK2gsi8lbuzirg+kt2HDRIE9LFj1hkxrnBKTLoW7KE5Wfiob9e2OBqxs
         OVZjJBSWUqfL3SLHTIhSC2eWIG99C2BIPOdxM2+x7wByh31jBd1RVYW1smuPuOGZN6mb
         mGWRpTVyF9KZFPuzrRoMH2PWCtHcjXtY3jxfX0Xw+VnL/+VPUP7k84paa3pQ3lqLB/XV
         urzgoZI3DCOivzawLNwJTkdfCbFQQ8txridUbKfPV2MuXSPQ154CopAgsFjhDDF7LpZt
         GLDw==
X-Forwarded-Encrypted: i=1; AL+hErGElEAaL+VEaL46xsmw5i7oBcN/vmGC2OJ+BbvJJOOUtKV1BAgujnwg1swv65VYL4qL+4WcAwGOBhGX@vger.kernel.org
X-Gm-Message-State: APuU4Z/rWjiguochECnVowOD4I2sOpJt7EIhvREJgK3cdmnIyfLSc73w
	seLSFgswdjQnGR6ikmDMurlYkuScHxB8+uTo1sXqOVpD4OXaTP6nRuoD
X-Gm-Gg: AZFdTZcDDIVb3+7VW3bTPE5q0+Y8LATiUnzyCgtTl0kbUfOmnqKUVDMnvSZKaHEX0xH
	pL3Kuxtzj7pCpYCDDw0DqWHYcWV2kNA9ZTM7lgvGe2B62dUhbp4ABP26O3MshTo58gmnzO4YsRj
	vV0zT0N0IqwB1PKI0FId0kEbfACgKgjQoKR5e9kayJQL5GtD0LygkWECKAzt49A5O7MpLECsV+i
	9oxnXkhmHduQ50XM3+zwhSNSKMDp/k4gFRDGuCmyVp6hl1KjprN5t8UglYpqoUcTgyjk/QqKPJB
	19NjODGQKLD31GdTZFnZey60QjjEYKhOWEMwdBSBcIFSblyddIrzmZ19Nd4pO3/edngGKy/cPfq
	qN8ETTGKUwO9zoPy/bNW7TJqUhjKbgggrw8DxCmUiEKf80yLhuYau7SX9zB/EwAu9aC1/dXEZ3Y
	3kxGqaycC0KPXbEK5nyZFgX6Vzz5dbIjhW8wu7Zdht0PQBLkPezY1IWu244/2o8JKraFmISJda6
	0NMFJZ0bMw9pI62gs75pRAC9g2S92qm5yVaRcSqelbDCSD+u43OP4MJtr6dzUkmjwbT5yYqJCQu
	+W9fDUpmQlKaklZXqc89X+FklODTiJ4x48OYRcx7XhK6IbCk
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb88806292mr505131085e9.15.1795780900684;
        Fri, 27 Nov 2026 04:01:40 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:40 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 15/30] crypto: amlogic - Add support for G12-series
Date: Fri, 27 Nov 2026 13:00:48 +0100
Message-ID: <20261127120103.1532882-16-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index f530e238812e..0fb0da20e06b 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -282,11 +282,23 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.support_192bit_key = true,
 };
 
+static const struct meson_pdata meson_g12a_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 1,
+	.hasher_supported = true,
+	.support_192bit_key = false,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
 		.data = &meson_gxl_pdata,
 	},
+	{
+		.compatible = "amlogic,g12a-crypto",
+		.data = &meson_g12a_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3

