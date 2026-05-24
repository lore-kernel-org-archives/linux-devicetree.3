Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EB3258CD0
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 15:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779637816; cv=none; b=ldyjsUPoGID9Gea+xJG8Na7tbYMZYbRqAgynmhxF6IZIhBlAQKeoIWQr+YoKfRaE5Dq6ttxDTbBlDwgN6TOxU6YPxq+MZT155GPnKEYEPCKF450lUjPuIeoPqZkKIoU9dNg2GDYCEiCXNuQdV1UgvVFhD0CtuIpzgtkme7Rv+Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779637816; c=relaxed/simple;
	bh=8/mjomMcL/tL01rBMy4OoB6MPyHJ2iOSUQhMgcRC5yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X+mzPNsyWDDv81Vz/byjO197m1g1l+QYIX1AA/PQdE0xm/XuTXZFpeIpBHVPVewZDNHcbq52g/e5k+lHEgbD8/Wj6XEmVLcHuMJJL8efT+DIYa4EpL2Asgu4hkxx9MCvqNVTFalmP5huMztAdLPkHfGV45buv5AAKhfO2Q8ZEGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGmD2IDo; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGmD2IDo"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-835386ff122so9075339b3a.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 08:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779637815; x=1780242615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReOkgoPLdCaHd6CcEsCAqea7Z9/lGvf+pkF1enOHLhw=;
        b=CGmD2IDoKBnonh8gG3rhE30QTkqJGjNlPViueoMlrfByHWL/C3F61i6RuG5eN5Pt3C
         j62OveBck8dtdEpuLt1CenCkuOEVYrPgKQtAF+n8GLk4VSQWU9UE0xE4tFBZBaiOqzGe
         Mmx3Y7YWEOnSAveptf6ZFkuVGwWuxYMD0r+HGqXhlhCnAailqrFDDOnCFDJ0BJlY3InP
         Vysva+BLyCedNTmFDzWXySJD77pZbsTeEDIGO9Bekw4YjBv/9OhlL81JJvYKX9ylfTpN
         m4T2NcVaKhfHkSeeT34eubdvx5glmZMxsqKPCKFkRZKPSX2Q5FBQ68Hb1kfDysoY+o3K
         ntQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779637815; x=1780242615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReOkgoPLdCaHd6CcEsCAqea7Z9/lGvf+pkF1enOHLhw=;
        b=PIpmbEIp23VQgtYBFoLQsgeLB9HoIze0nftu4t42YavTPjIe6miN6viG0+3uxAwJ7J
         rwECeONyCqR7oE3ikJrjIW2b76HTDamzyb8BLegTeZowO4iC9YAUEyXooXcvgSlLt91s
         QIsO22vsUz3ltjfQdEmNRxMD44SKQb2PLyLFBfa0GUVjSLdS0D88yNXmq9gsH6r8RXDU
         OBqapO1l4eqzOpiHygnEaOsBh9vCSy9i+5iirmkhpU9saq2/CPxNRoAdf7s0qvRvE5v/
         37KLHAP+YtwXKqGqw9H/6IBYjOOeMAzPgVnzhoiskYb0bkdHstSAiDQoIo7VHtOe29s5
         vn1A==
X-Forwarded-Encrypted: i=1; AFNElJ83HFTYsi6Iq9JUt/+MdnlGKlO/D+ZCuebLXqmjw8TMRi58jL9BxHu3zCZcbzMKkOXqc7nnkFVbDwIG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw4HCzh2A1kLvxeJ5qiwQ1S/h2+GEk8vUYKEG3M+I2Br7yPeLm
	L88BtQiqxN+HsUObAJfWMVh71M4z4b//FS1jeWBCnmmZY02yWmTbu0aF
X-Gm-Gg: Acq92OFKMig6PVJBCpRMYn/CmyTeIMY5tZjQvCOmzjvSaSlH/zyt144QWS93zfivoIf
	Md5JEnBqi/1P/esFC79raSmOnN9h0/fksHDh4amYrkd63UloHTQpdhQG7C4OVVMt+49IPLTaIz+
	gNFwnGWut47wi7r7HdBo2czwGS4szidG4yaDTxklu8My2X1F6o9WCl9Ey8S3vW6P8+5KT2Q/F1D
	h5UarStSCuQtWyqhZvD3TA3w26jUmoDwPSzptZukjsGnGsoKWQPbWEfGWlWV/Nw5L5EREl2Z1MA
	dgJ12IFDLnJ4pH8Zq8wrZt5POr+Eex2OQW9N0fzDVUBVLNJdgCkzcbISiqMgzG7nmBaFo0vMy0n
	DtSiqQSc/y7BZS5EoifpYhyK+0e5jZ1Raq5UcR8ZU2yMJyxoI9APYKQ9RG4ym4BhtXGgaYRZeSM
	W2/Ybk8dj5j5k31GeNTANGI/4Ijcyxu3O8+Y1LG+qciXlpLa8i/w==
X-Received: by 2002:a05:6a00:2d25:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-8415f5dcc6fmr10442376b3a.27.1779637814974;
        Sun, 24 May 2026 08:50:14 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm6997716b3a.3.2026.05.24.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:50:14 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: meson-axg: Fix whitespace issue
Date: Sun, 24 May 2026 23:49:53 +0800
Message-ID: <20260524154954.385778-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up whitespace misalignment in meson-axg-gpio.h

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 include/dt-bindings/gpio/meson-axg-gpio.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/gpio/meson-axg-gpio.h b/include/dt-bindings/gpio/meson-axg-gpio.h
index 25bb1fffa97a..a0d42bcd9bd3 100644
--- a/include/dt-bindings/gpio/meson-axg-gpio.h
+++ b/include/dt-bindings/gpio/meson-axg-gpio.h
@@ -23,7 +23,7 @@
 #define GPIOAO_11	11
 #define GPIOAO_12	12
 #define GPIOAO_13	13
-#define GPIO_TEST_N 14
+#define GPIO_TEST_N	14
 
 /* Second GPIO chip */
 #define GPIOZ_0		0
@@ -52,7 +52,7 @@
 #define BOOT_12		23
 #define BOOT_13		24
 #define BOOT_14		25
-#define GPIOA_0	    26
+#define GPIOA_0		26
 #define GPIOA_1		27
 #define GPIOA_2		28
 #define GPIOA_3		29
-- 
2.54.0

