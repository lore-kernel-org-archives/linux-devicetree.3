Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0D53E168F
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217439; cv=none; b=Qvze071jtz9wMZ4EOApV699SI8i81CdR02XyzeY4eOSdIRYuzqNdXFmkxpAbtfQDbr4di+6gYL/XnL58MTMMj3ZY7WTwtu+VBJihz+gPVZuO2x1gLEbkhQ48TKSC2DQxuMjb/X1D7Qnohl4XiXxNY/hmhBHYsjz/DbHBtxIEZe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217439; c=relaxed/simple;
	bh=9IgDtyv6yAMUkWsg7RNaWcItxtFHo8kakpm/KHcWfnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9cFB4WaVH0tzrIywWB6eVLmn2h/pWWZqeNTG9E4cPsx2K9Hbax5mJpIzBqTSYw3hKBpJwUtW38u09ssWXvJzJiD/HQpoA4vcpWeytLBWVFkekVuSr9tilo58MFxL4HuCL0yPjcbGL/sIlmTyL1Jk70awbDL/d7l1LjPHLtZHhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ii9ohhI9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ii9ohhI9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-480033bdcf4so1227529f8f.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217437; x=1787822237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=ii9ohhI9dYIKqxMbQo/O858JaY6cYij70c8t7zY2mtHxu4QXxT9oFjB2fv3FuC4wBO
         JZ4I4EtcfivwdLVzKvLshjv4TqxGXSjt2LekdZgC5YvIqtvZGU7fzzfdeL6R5Z/ga0sR
         PJkvWEztlnaPmOJfbU7rGQ18NJVuDqGk3loEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217437; x=1787822237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=V7NZnTbVhZ7qbgqQyDSgnj5Om0B5+OQfqDHYBJeNyIxRPJZvrWg0U5G5FN1MpplA6W
         KKYKexSJ/XqovModwnSRywoZPWZvwfJqp/T2cZTs9hzlIoa0j1DtBeTergneuE0laEKY
         zrHHN13kQx0B4SKd9FxkIENcMRvD7GRvtyOKdDef/zjN8ZfZ3fwDYUFFMEgRSSPkhTUT
         wrKi71cAuLDu+B3d07FdO3RFN2lRN9glZ/r5lIjJE5K752C0M278W+kWZ4ODcrJd6vRn
         U7y4OHXkWvyK6+yJS5SfV1BuBEVu/VP8wCtOIoDZ5TTmlLkovNs3RlYuvIn/8KBGmWvS
         srHw==
X-Forwarded-Encrypted: i=1; AHgh+RrEesfcknAqhP+t153z98uR6gCaY7ivBsrUuH4+i6E+AzrXgE4bWmqOQxxGXI3paLuT6iny9jXKhBSp@vger.kernel.org
X-Gm-Message-State: AFuF++kFstas4ZkCkTlpj9dUoOKLIy7ac9AeMlbP36Pq49s3b6dNrd5W
	lfj9o/K+Ut/5E5n5CVKmDoKh1NOyis1nsluYJdmgJcUyx3WMH+sb2OCa9hnvACKP780=
X-Gm-Gg: AR+sD12e3ZnUv5k9LHa7gc9Ur8IPoZGRdhPCgyzUxNXEF/TyOGJHIIEzIzjlbmuUoho
	kkilw971e3eyblgGGuuxHWS+0SFyNnV6hTDlvkLEIaHraRZJLUPk6Kdwiq4QLI1YeYY9ZH/L7hc
	WIwq3zO4PNeurWVF+KLCzEeaUjS5VuK1Socy61bNsHSAuUpnJqDnYirhRlQBWi3uyEu5Awss3nN
	zNyzTVfCLS6lLeCzJZxtuW66Jwzhpqc1QBOLaOf6Cre0IN0WiWgb/+RAFBV8zusuAE/sc4F7ZuO
	ALUHY4MMb887AqeC8bB+fWLGKveyIR1JVn1I2WptJl2Bysd+GrRqTb7U3eecjCopEZpLkLsZ0Jb
	Ekvj8diiDY7f0acfEClLY98ay9SHJdI13ckvG+8nfiPBhus198JSDmo3aTh7u3cYWh5Nle5i7z2
	8OWLEtPihlk+7p9mU6vjfo3HD1KC2mJVEivEeBZxO4+ns5oKyHl+T7AXBxLEiLM+Gu8G5JrlHrk
	VjmQqgTv+r0lZLs1gGI8Q4UU0OYMW63ea18MpsUueeYl/lK3yzW8jXCojZ2wnxoRDup4D9KziY/
	fzGVUiT5MFRSAGRxb3JrgDSIhcAwEDgkmHhQ6uQUe2QHZM4WITh1eXVsA+cqAQ==
X-Received: by 2002:a05:6000:490c:b0:481:56ec:b422 with SMTP id ffacd0b85a97d-482b1eaa195mr20533368f8f.9.1787217436548;
        Thu, 20 Aug 2026 02:17:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 04/16] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Thu, 20 Aug 2026 11:12:12 +0200
Message-ID: <20260820091652.43541-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index ae36d703532c..44938c036e30 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1668,6 +1668,22 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0

