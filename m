Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EA92D73A1
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 01:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990840; cv=none; b=cJOpczZ/LqbyuXCNq3jPoLXa/yyze9tuhXKEp6Dwt9rOax7G5cP/iwE+RgRbJxzeupYQi+ejj1tw+NYbx2DStQE0iH0gOHhzmXWWNFWKZua2QEXzZ1x9MZqmquUNdpgutpIF87aeIzOLqMTn73E6njfv5LISd1CT7iQZbZai0vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990840; c=relaxed/simple;
	bh=xzGuW9gBVTdyd8yJ5Di7BkVfGMr1p8p6MG98+qrsbh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADcDr8KKYEwWmyJiHZ+zLJMy5Rf8SxjgIVuCHtMn9Z8NBR/HipIRnbPzsFDA2IknLhqyJuuEisKdJ5lSEogabyqg+1D71BrnXGWoa1+Q4c6PwSxjU0gf9E5JzAP5LFrpFEdoyy4+62thZgwL46vD77ioMWRXkURH1AauW2+VUu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510f6f130bso126222eec.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 18:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990836; x=1791595636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/BU06CtUrguuFA4ph2pK8mOWJDR8MrG8VSMsF7a8eg=;
        b=AjKFQMMMmtpDurFxoTw38QT6Wv0jpkHl8fl6SLFWTEPjV4xGmbtRTaY1Usfp90LbmW
         MKWTTiw7DYhrMi3q03DYqxturJZbUVTZ2JM1TniKhZVGKTEr3osqDljHi9Vu4xnpNNGh
         +NF5Ts5Shm9FZJMGeH859KtWPeyKf8I3W4ZaatSUFhRgxH4t3LyUMAa70kdaDHs2sjFO
         52dI2pbw7PTT8gOhh2RFUbm6caP9y1XA6HYJCgwgjtekFaryi0ZFLfVkbIgH8SS8Cdmu
         MYh5LfRoj/UISSJOlprqv9OYAV0qspdJ7cOK4iepuN1GcXIEQpvGR6pUMobEs+7M+saK
         CY3g==
X-Forwarded-Encrypted: i=1; AKwUvBy00L8kVOjoL2tB1FqIXjxIg1CDhEXsoS1OcOg03gcarFWiHLEirj+ja1FAqHe0Ft7J++SUS3yfHoQl@vger.kernel.org
X-Gm-Message-State: AFq9FYKkxyijLJtMkh3bAtu0EpYJFjQ4F9DHCgEuuwbtZhmMPQnJPzLG
	pccm9HwGaHNh77jprZ0VqIxvVkZ5IOFwM4mKd3NyTjfUdDJ9cE8161xb
X-Gm-Gg: AYBFou0SuvURpEHwcfRZ9ZIRpZ65/aFoN+CyuAYk395YlOjRELbgNkB2FR94zaYhJ5M
	Smv0IEI/YceRnFsFDR67Ju2h6gtkdBVkPIT9SmSWD2UoeIWtCmdNhMMfQO2RPK80MGY81t5rh4F
	rfmyyXNUyxUnLIGTexAcpdeWQnDk1CKQtiEY4WdVO5F8FBBbC1k0TdgKq9x7xvbOmQdMWRIWAGU
	K2YsOGYPUmQU+XYc2fCxEKuWqxvO3EZHIuT3vWKLGx1+mvzwoCGz754dbj/QVaUuP/H1iuFUecZ
	aX6TF2otXaJqDsP+NkB/cMpdWB5EKq+DcnC7cepcG42V1bb6eSwaByXxaaZBm5zNjJ2HY9T4Wgv
	UjKUgeI54vlKOs9SCEYMa1q7aqinxjAswmylqpkU4cnGgddZH+fdV/QpkksprR38g0RSguhEMa8
	Qp2c/tuh0M/diV73wyxLlwLt+FnN4WZJJAsMUqPCiEM5G3qcSr3JLOwbFP/6xCVGcjtvzNTg2gZ
	9lHcpuVVE/rQoV3gxkoX70OQEHYam+lQv4kqLxMYH1wwIkUjCnyzEU086GMu1e4bJI9qNPPD94F
	lm0teNQgl4AroJZfTMkqnjtQqDBpsxKIE6gA3Xr634Saa0tN1GcLu7I=
X-Received: by 2002:a05:7301:77c4:b0:33b:b0c8:73d2 with SMTP id 5a478bee46e88-34f14f18d51mr4593744eec.3.1790990836120;
        Fri, 02 Oct 2026 18:27:16 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm10442242eec.1.2026.10.02.18.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:15 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/2] Add SID and THS calibration for Allwinner R40
Date: Fri,  2 Oct 2026 22:25:34 -0300
Message-ID: <20261003012534.418820-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The R40 thermal sensor node has no calibration data. The THS driver
then keeps the calibration registers at their reset value (0x800), and
the reported temperatures have a chip-dependent offset.

This series adds the R40 SID (eFuse) controller and connects the THS
node to its factory calibration at eFuse offset 0x40.

Patch 1 adds the R40 compatible to the SID binding, with the A64
compatible as fallback. The SID driver needs no change.

Patch 2 adds the SID node to sun8i-r40.dtsi and the nvmem cell for the
THS calibration.

Checked with dt_binding_check, and with dtbs_check on all R40, V40 and
T3 board DTBs. No warnings. Tested on two Boardcon EMA40i (A40i) boards.

Otavio Salvador (2):
  dt-bindings: nvmem: SID: Add binding for R40 SID controller
  ARM: dts: sun8i-r40: Add SID node and THS calibration

 .../bindings/nvmem/allwinner,sun4i-a10-sid.yaml   |  1 +
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi        | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)


base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
-- 
2.55.0

