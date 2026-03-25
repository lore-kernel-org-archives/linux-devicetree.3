Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3E411637
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462057; cv=none; b=oHBCujNDEmNdB67v1PyxweGEGBWi9/RneiMndQuc+aCXAGMsX4W5ov+SGxTBpBUEn42SzKoolZfFDIJLeav7c0ojoq22XMw4YOTO7VWsmq/auxL2gzGdjLP6xqwA5pbkydmMxpqlC1iY7fFU+7xJejGbae2viSR+G1jTZZiFB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462057; c=relaxed/simple;
	bh=JX1VT9zgv0Pae5sCQylMsKS3FziR0eu/Z48DU4Modf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YIlSSo8bFiUUN0xPrX2fcuhL5b2waZ9L3mKj0rH5xNDUp8iH/8wrBWqVdr6zV7WS59+TNhKOkb3Hn3v3vy12FHAq2jgS8yi16/a+ROk3a5qsue0HddjcwqcAZJSuFsRBEODAd19RA+7Ut5CRbuTN+Op5/ov0OoPT2UBFkYbkyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGNxcxjU; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGNxcxjU"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so579074a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462055; x=1775066855; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28ojK3/EzMg1N1ScywDMizt5NQH1Eo8ilmYAqBf6aac=;
        b=YGNxcxjUtxqB0bxk2tWvfN7+xR7w5l4EPzffIkE9kPmXTlICzJIeyPZ9R8Wemy0aZf
         km5qypmOEeEiuh3nm0eKfELVG/WyEKJ/ZS+vxmpUZUg4ykLjpIfIpCH0Th+bcobdDkgg
         M4FPuIkKLRcPUk99D/yR9Bh6/kZ0Kd4VGmnMC2uZB1oMnayFNY4hdo5QiD+p8DAFoHyJ
         82Z7k45+bhOaVT+9oVGwkMnZgUxtvVGS+6nBTSS4EPVxD/+xVREtqLxunwogYzdC1np/
         ttQ80lwe6wOeD52LxyW0LtjUtkMNIn+/ehhJ3XjMIl4OjKjuzUHpY7ObQJtDXdpKhZf5
         bxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462055; x=1775066855;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28ojK3/EzMg1N1ScywDMizt5NQH1Eo8ilmYAqBf6aac=;
        b=WkjH87xQ7b1nPO59ngT54medqr5NMOcB+lEycugY6mMfkX1PtqJYoJHWRbtF2+uhIn
         J2Vll9Su1vUoDD5MPWluWwStgbh/uhrUx4HVc2nbWG+rzGTiAzmZsIY5G/U2wvwwOfcW
         1rK3QShbsuEZ29GHRapmimXiwreji+QYIYpDggd/BSv0MbJ1TZxXhpEwQ1rPKwSr4mRF
         TZvc7QgvbZqYsB/nB04/CqSut5W+DK0c49wf8MrrjVrlhbkK4AeYIjsi6Ig/Z/flHl44
         KCqw0TreLsItP4T23iiEEG5F13ZBPSH0nGatAz9LsjLTvFZ6WigxdDi06PlU4kDn1wSi
         XfUg==
X-Forwarded-Encrypted: i=1; AJvYcCWLCdLqzuI8IbzeYSqqlhFnBoS3dxUvHLshATtYGjSWDwZA5NoLdCuJA4ly09Edyarfxd4d4lJtfwYL@vger.kernel.org
X-Gm-Message-State: AOJu0YxlkpRN0bohtgSIIMU+tnSTkMtw7mqnNumeZi3vCfHZ+Oj4cm+j
	dP0XBdJdln9UKSgANLVMslVkPf/clp+oh+zAA8KKTNYMlk8vnKMy2xFD
X-Gm-Gg: ATEYQzwU7U5uPpfGiiOQJSsdGGTSH3PTSFSYJG0JW7syLNcccQ4+pX1P+3NSaPr+P9R
	MP/QhmYKn+Mc2BPi3mOP24ZRM5bNJWghL02Pcjqz99GOBE+11Y8QpdPIxGJVe0XmTJ8fHNqI4ai
	q9xPjshypoY68Uj9yMqz6Xi77NCX8HHrB6CPR70Kn6efZJxs2zTPuXQeJ7G1/v5tEWYNpgxeJ3D
	LzZHUk9ftmftLIzxeayZwfJaG6cCpPlQ0udSu+ftcIJfh+cNyFUp7Hr6T14BrcIb1Jayti/Pcr0
	y6J+vd3Owim/uoZpZMXHr3VQbOaMZyK8WMpsvaTb41caS6FbmeecV6JWD1TuAEdq6nP8z4Mwge1
	zfzTCbQU3LDzQA057X0fxxbTtD0WCgd/5GN1CgU6pdbhp6fHguXeV2h7YzJBU9i324M1/6QDfHt
	nfXEE/ne+bX+IjLXLuet+C5BjRDG0k
X-Received: by 2002:a17:903:22ca:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b0a4dace22mr76613765ad.10.1774462054938;
        Wed, 25 Mar 2026 11:07:34 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Subject: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
Date: Wed, 25 Mar 2026 18:07:23 +0000
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDugqQrtVaSLjJnEaSFKRkUQ7
 96oy7f4fwflJKzwLnZIvIrKGDOqRwH9YGNgFJcNpjRt+TQNBom/MKJ1DhcllISrENa2qci9vG9
 rgtxOib1s17f73NaFvtzP5wyO4w+tnvDleQAAAA==
X-Change-ID: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1316;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=JX1VT9zgv0Pae5sCQylMsKS3FziR0eu/Z48DU4Modf4=;
 b=FTGDeN4f4HSu3HsrxdqeKr4af3eKQ0NpAJch2iaq19oGsccNrLS+g9iaX+SYWX5PAjLHHCMD/
 G3XSfR0V/MdAl0iw07TAOtfNpDU4LgFGi2V9fIgH6cXkpvWlUy1Kr8m
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

This patch series add support for various components in Xiaomi Redmi
Note 8.

Most notably:
- IR transmitter
- USB-C OTG
- Vibrator

Also, fix some bindings warning as reported due to previous commits.
These are tested with linux-next tag next-20260320.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
Biswapriyo Nath (7):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      arm64: dts: qcom: sm6125: Enable USB-C port handling
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
      arm64: dts: qcom: sm6125: Use 64 bit addressing
      dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
 .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 168 +++++++++++----------
 4 files changed, 152 insertions(+), 77 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b

Best regards,
--  
Biswapriyo Nath <nathbappai@gmail.com>

