Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167043F787F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253923; cv=none; b=VdaGa1TOlGw/g1SPMnho7W2IuMDt4Ty1BMIFpFdFFS+OQe6igE/RvUkV37UysuKwadQ/zq61H3YpMcCCr7hvjV7/kQJvXBx8mc/QHMzPubVToDtbzKu7DF3tV0rk449TnmQeNEysXqLRGmxEGv8lE+lvKruIOzuwaTTGQdMYW0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253923; c=relaxed/simple;
	bh=RSPgHsHKv3HIrehtClGsNwtFl5zAlbG9AEbp2U8tqtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a7kbChOiqeqQh+ywgDxhj25Ut4SyRB20BciK5agZusOi3AaeSirqamqKtMqLHGLT6dCU39iIAhdK2N9wtDs3/YUGxOMLFttgTwUhkFz1inlq2qEw6fJ7B8lGAlhD4/8Jbma3PbyWv/Cg5jUR7ndMG7T/XM+4qPJbHJq4wLXlG0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctz1wJui; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctz1wJui"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso430442eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778253921; x=1778858721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRoQ+3Yekl1sBGcIilVshMHtKIfsx7cqVK42rev6z2U=;
        b=ctz1wJuimUDdg7t0nXpjXKv8S4b97HhfvkiXTBKoS96VabLDxZkXDJPAxDxsgmK1sP
         ZVN2fIdgx9PB354V2okPs062GUhanMOokn3hWu3XGWHwF2dNkPZtsLCmq7cOLIUFjXeJ
         V9IiVH7lrJMhlNZ1T7PbCIlasYlZOjqrxTKV1yihr4SzwvwPPwEi7cr951pg4TpHGzss
         lc5i7yipQD5BAF3RbvJ41QMN1+LHJr+syk5iQm9r+qKascxOkpchGlPtXACNGpTqXSMZ
         EdJ3Rpaa7kK9QRuy5+WJwUdVkmmbVTESUrGU7ltvSC46mKYInT01PdUocsGQmaNUvgTo
         Imdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778253921; x=1778858721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRoQ+3Yekl1sBGcIilVshMHtKIfsx7cqVK42rev6z2U=;
        b=KApfya8n2njDrV/vZRGymgKGJZEBekMglIoJMt3GTZykdZ3Kw49D9uOFfKpQoGypbj
         UiNYYFP52urY9UrQNBUMUA3LJQU816Yaldb4th5flv2qXFfA46MGa+qJJFQ9a3tqIv8i
         SLfrKPiAFlvfxiempbg70E8ADE3TUKkF2d174ykzFr82EZcwRLYkLj6epMYmQd3ZTen1
         2UCJFMRZCimvoV/cw6mJCZ+eJ4AUFfTJDGSd+CcA20TNqqlJNtJC0t8MAqM0i0j+qCnr
         sRcCbpR85Ber+aPEu1tj5JKWWy7z3NxVz9jyFz+MqGQBOauT7I9xJVUPtB+XaFVfnmnI
         rTqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HkUvdrl2nqLittOXJWDBF0L9sFoG3zk1lMbU2PjfNO4BoTgF8wlnMgri1+j3ZSiZ4HGzyD4XxntVj@vger.kernel.org
X-Gm-Message-State: AOJu0YxRd6sMQWRUm1Bldm9MoVAXkHhdhD3uiHXoOX/poQwlHm1guNvV
	KZCwRTjfTAMlOwfCEgO5sTFCqAJARWk4iFmoNhGxphW4lTj/IwpynCP9
X-Gm-Gg: Acq92OG9kykerGAOh3tiZJ7lueoWcmt+DzLK7c0DLM4Jwyr8ardKD61du3YAuaBonaw
	F8q+N6fRV7SYkQc9s/8E4bSkQrBdJ7p36E5aTts0wdfJwEAtfiHH4Wsjf85bIZOscP2DUdqHTM9
	t92gk5YtSevGD63hdABeN+cEX6Ck7nf4pHX0NOyxP2U4seLLl82UWIos9WUHjh2r/CaleXYwiOV
	bW9P/tR2diAkYc1NPj6XXaXVNNz6wKrQmAFebgMh6gpb6ebYJi9mViUgIXuq5qcddUIDty9h0iA
	Y/YM6aO+T+s0W6F7KZC3K1Mktf3UjsgEIIgvQhLR8fcfjquzKA5hbZQSqHJQh7Iqibpq3r2K9e1
	v0t7Gl/tHIoB+dWnQvFIa/JG5Iazc5Ep/xUUHfKUgZVaX1nXwBpt1/jM1iAhXEGGXMR8aivwfDA
	AE+m4vkTn9Q0BB/3ndalQydwPHiz2r35dvRwf4rmOUoKxbD74=
X-Received: by 2002:a05:7300:d70d:b0:2d9:6373:ad10 with SMTP id 5a478bee46e88-2f548065445mr6402720eec.7.1778253921033;
        Fri, 08 May 2026 08:25:21 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:25:20 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Baruch Siach <baruch@tkos.co.il>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] leds: is31fl319x: Fix shutdown GPIO and update DT bindings
Date: Fri,  8 May 2026 23:24:17 +0800
Message-ID: <20260508152435.21389-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes incorrect shutdown GPIO polarity and improves
shutdown-gpios description in DT bindings.

Patch 1 adds detailed shutdown-gpios description and fixes example
in DT bindings.

Patch 2 fixes shutdown GPIO initial state and removes redundant
startup toggling.

Patches 3-5 correct shutdown GPIO polarity in board DTS files.

Jun Yan (5):
  dt-bindings: leds: issi,is31fl319x: Add description for the
    shutdown-gpios property
  leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant
    startup pulse
  arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO
    polarity
  ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO
    polarity
  arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown
    GPIO polarity

 .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts     | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts     | 2 +-
 drivers/leds/leds-is31fl319x.c                           | 8 +-------
 5 files changed, 11 insertions(+), 12 deletions(-)

-- 
2.54.0

