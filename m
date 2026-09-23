Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED855C1DC
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190630; cv=none; b=oA9Vwc+9K/+yIPr3G1VMvr9meqKmus5x2aZ6uPbDLZPlRjtwIgNhdftGk/Cfp25N3knQr366SbeFI0Fo/2tnPQU+xqrY949qCeGFQDUvaG4WI9pyu0dMhYX+4jeeZccu/JXszK7T7qDqt7unEqS6sm+Ut3XGp9Mmpdesc4/jhxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190630; c=relaxed/simple;
	bh=dS+Q5YrTBm//gZDQ0F0CZTkdeWin1xpU3ZzifWE7nYE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HOAt24X4GBiDxupqV98MXrjXggDyBOIgW/XvrbEBXs9G2RObBR1oo2YO2hBlQB5oT7AXsmqKsKA23mYR8rh7TxGW7sARRS+Ujy1t+fiZSqhIL28tYQRphJ5YttTzUPQlHrAQ7mT3NXGnk21/ZIWg8srN2fAE9jPvKN5D54hGKO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcX7KQuN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcX7KQuN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso8517945e9.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790190627; x=1790795427; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=97UpkxI40FojhbMsaRc1vNaLp1lGktp8HL/rnM/BvcM=;
        b=fcX7KQuNm1JZTwoYpTH03R3UGUG3x5rskjk2gP1XIqJKcuKTn7TyTUS2pTjcv/AtQk
         qVJVcNQeIHMAupV+ClnQ9ao7xsfOfA6QKU7QBDapn1+TxNAICG4SYLk9zYLAWBO87hU7
         e4ytlfVKU65nUfK+9jjO/LAr30LGNaP3IzIkKlgW7fSYH3pyvhu38uGMwhBFz2sXvUr1
         Q9dA8RuM1/VErcpr6U4nwgRfGXbHPHyCxkHGdxj6AqvA5GtiPg/L+lXYSQCZQfw5lvcp
         ewGnk/CwGDyukTNHPG4cI1/s61cNx10ZUNkXOydFPNufSjrnQ2ws7ny8WmKXzR1UQ05u
         xLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190627; x=1790795427;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=97UpkxI40FojhbMsaRc1vNaLp1lGktp8HL/rnM/BvcM=;
        b=1SQOVaKgHsKrxoBi6PdHYEx5MPW0zs8NdWL1bH7hDAnWH8xZKfodxBB2hFKATkwZ4t
         zRnBIwyJQ8+rz9MAa8e+DfDYLsXc9p+VDCJp+/s8s6VsJc52+diTiiHp5ghi10UARI9M
         ZX9wCrRXfaRWsdCebLrpdDHeq7AfjXsdW23jH9jlQXwLRC4shNHb93GE0CViXmkZRoya
         HwMgjzJLV/g+ODi5zSNhtK4923M/YCCv+VEyHewvmlf3fZ+6URhBWid6XHnyjYn4uM5K
         eJapowxmCD8nkqR7TlwtqwSZJvbqd5z8Ckq6D2L76M1cr3q4S1ZCb+qb1IQHJ/lsrNDP
         HRFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA1Jmq++k/19H3XTIqjAT7ep6q06liLJFVFdgtZfa7z2O/GGcqpj5gWnLYyKGdTZ5QKtWlFUUw/1gU@vger.kernel.org
X-Gm-Message-State: AFuF++lHiF19goIF39hkJhzD+r7bKJ0CWIMu6R8CTyJnpyxNVxk/l9sU
	g57mlN8QUzjNHvL+639xWrn8+2BflV6s9O5MqQ+MpMLmVjBofdq/gzV5+/cgJUB0RZQ=
X-Gm-Gg: AYBFou0OXHgqwgdwvFcuVp5wHKGECcQoEl25NT52zKwU6sWJXtxC6noPGAmKR5YPFud
	nAqo4nZ+PO+iiK8B3P6fxxi+S4dNGC1h0eDND9aaA0nHOU/jjD9pZYBdlBtrlk1V7oNs4gGmJd5
	ZQJ+i9qi5QvIJqZh9yad2Q/MT8MkbpszO9SJ0q/YkPTsKzwWYbeyFRKPUAcjJL06VBBeNsMYWEF
	XJXQduKs3UzEE0FeVpQhLaihCnUxP82DLZaNJx40M7Ldme3DDNrASaqWbnW9CmlcGYdqENalfhy
	gDe0Zzx/JqH1rVES/i05wA5WWqgQNZyG6R2iMLYgn9k/EJ4sBHX6ZhgkkQEPQj0AQ+xAHfw+puV
	5SShnfJ+3v41RvLdLwRKEQpwMb/ZFIjz7zycVItpIMpfU+D1G2ZOqq+WahABgL2bcRvRfeXChG0
	lhYoYHSWWYazyeEbNYNEvz4gGFAZ4mjvviX6rSJtyK/oNf/ApJYu4J5k8jX33eHwpFzA1CpobS2
	33B4Ek0vujYKVSDhXo9CIMtaqGo7NMdYllDVQdg
X-Received: by 2002:a05:600c:3556:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-49fe6708a46mr2508055e9.31.1790190626506;
        Wed, 23 Sep 2026 12:10:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae53dsm7291815e9.4.2026.09.23.12.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:10:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] iio: adc: add support for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
Date: Wed, 23 Sep 2026 21:10:21 +0200
Message-Id: <20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0ktGoC/yXMwQ6CMAwA0F8hPdukbKDDXyEexihaExhZ0Swh/
 LtTj+/ydlBOwgrXaofEb1GJS0F9qiA8/HJnlLEYDJkzdcbiFlcJqLPLLaFIxNln2zT1Bf0Y0FD
 HzlFr7TRAOdbEk+Tf39/+1tfw5LB9UziOD5n7UTqBAAAA
X-Change-ID: 20260923-topic-sm8x50-iio-max34417-adc-209e880533fb
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dS+Q5YrTBm//gZDQ0F0CZTkdeWin1xpU3ZzifWE7nYE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqtCQg1FjoPWp7N82OJUtBxw1T0p9FJc3F+pXkbVtM
 wFz3MU2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarQkIAAKCRB33NvayMhJ0XGVD/
 9AJ/1swOUyeCQbubWH9D5jE00VUfaFKQqXg4jF/HNbZrD75qObT2fOgCytPzopFd9t0WLOaE4FPGQp
 YSghf6+eQUJn/B0Kz45UUb7u7iENNP2NrWlAmqOJNDxdNmcrEYJevOQW5076G2FGfE6RCJkoavBCqe
 b5yKYndTpHrU7Qv0TE7PR3oXbT5mokklouibZBJgk03lpwXf9ZNs8nIf4kWAKHcnXIRHKC3+pFaLNU
 3wvJNekZ/AKlo3NKzJ9S9Q5fl8jDl5ColVNi4Z+XcvI1Gmvx1jnMEHylZPlbNl7ta5tyfCkA418xVK
 MgRiPMM9+0Jk3Jvu8ONaOHQvy1UnXm6+qt3gcRAy5Rkj8/uZcSEkp1b0C0ngNum08nwM6pOSG/n5fB
 aScXMoMabTWzDJ+mT/WR+evYGivIu0EPcsX4+Re1HSOEbDlWYESbQywPmrNPhilrm+0sCyc+WVLJ0d
 +HRW77zkW6fUQ/jJHMAp8kFha2XepEmhPeerpOHvjfnOvSKAT0AIfoAfSLb5mtiVUxtvtPyjZBL2jp
 fzee2lcfz73aMeGcPr+Fuu3RxDeK0psz/V5uXxl7rRvthikmAaG9fCztQNRzlGaXXCNj6HqamjASCD
 9rLPJZJpfxk6oEvBsgaMxfjcFKVGDTaUDIG2zmWheqqsAYfZCAV4LJoCtwUg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The MAX34417 is a specialized current and voltage monitor used to determine
power consumption of portable systems. The driver support getting the channel
voltage and accumulated average power over an I2C/SMBUS serial interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: iio: add: document the MAX34417 Four-Channel High Dynamic Range Power Accumulator
      iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power Accumulator

 .../bindings/iio/adc/maxim,max34417.yaml           |  99 ++++++
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/max34417.c                         | 356 +++++++++++++++++++++
 4 files changed, 467 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260923-topic-sm8x50-iio-max34417-adc-209e880533fb

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

