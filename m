Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1333B47D94E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629968; cv=none; b=pXS4rPFE4Y53zIbDXVS+uhLQ95V6/PGMF/hbcfX3gnTmOA2FB6hFxM3yVAcGU+VwFB+u39Lm0MzWZDtnbpyDQ+6BuYUR0oba4oyRMbluwJBqgw1LwbVgWc0Ar+JdYeuFcal+h0nAdM8jt6LR8RKNY4EjeeMWFKK1UMhBLJf/8qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629968; c=relaxed/simple;
	bh=bEcIOZ3o4/YBQO9AvFUt5JfjZrSfxQHFfPTUj3NXnoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=no6IlhleOmQ8iNPO5oRetGWLF6rc8IPRbdDXFgVsL0Osh/GBRwKVcUWlDzyBEyzKwaFBN6PO5dNjQXQlLFpsoin5EEdPm9wPxX3RgWlP2Mcq4lAdt2AXuF2ruOoX8GA3fkP7VkkArwpuBSUKkf4dC6+ypdIIvUhF05q4fzamXj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUb3OluX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUb3OluX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so693007f8f.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629963; x=1787234763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=hUb3OluXe9zoAyOp1iD2i20oVBQjH9oqEJ2gZFnym/6fjahGbMi2TNyxH1ZEbZkJ7C
         jnLdZt+O2mZGf5MswfGDmPjDlDopFDe9jWtxYWx+/NtM2aqtAfxRyiA60iD+pxztPGWG
         qWYFZxKGmRb3ysufdaAvk2KbuOxBiTyOtB6uUFDZdUSSKE8NMQL65JrQ+z4hVEdF5gtC
         ZpSv4YDlaB83pP10ps5RLlsTUc+2MuFxVlhoIPwjO16fA1nIouIoCrS9FY7ntCApmNhe
         S0rb07atq8vvSd7V5dRAJPzpTq5PGcNeokorWwEBCM8NWLhyBm4+tGebBeHjqYQiQCAI
         Drew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629963; x=1787234763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=Ct6vmlM1roHvyWSJWrxRvV+xI4AwtlNgk3nLxXetzF+AkoFgNPqlzqXxascyUjxPTG
         Y2UmL+VRrJmGGqTAYIRfVKGBQhMxpnADW5+c5uTI7eQWd9zCABxsn9lfv8Ll+EruEGen
         6uN8xYe1i8h4axQS2AdGN/5F0BkOlZ2N4QAXtfyZeefmLhtSfDgh8lNSUIzYbbAHi5hb
         jKB4LJhu016u/p3AGtoLd29nvZOvwAQQwNan9Za98EY9VtT8c0XAx2EdASzo7KO+kyH/
         McfTt/r6wbrwEtMOZwu0m/w3J8BxB0ruiX+B5JhipSrXaOh/oP2tJSUlPWVRpYQSAzVn
         XT4w==
X-Forwarded-Encrypted: i=1; AHgh+RqyUNRo1unRInqbzYmUjZkfZcGRyVF9Nbz6Z1w6TrbdarzTrpI4kkBX3DPTYU/wfFXU5d2q26IWQu1K@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq0JSnWFtGerV/+PYvlfm1eU6kmQAPXSHI37PKzzoDv4kTDzaN
	Tk3YKVvtZQWTthGHMJ0TcRCfzwU8znQF0pEqGpCg98Vqk2oXV9LzKxk6
X-Gm-Gg: AR+sD124UNhm3/sRwxTiOkv+lzeCPmfxvXaeT03mVKr09i79eRfUt3S3CGyLq7JqxcN
	1KA+OeMwv3bv4fqFGvm7xK4lgkFhrsjUFHWoU8kkzrirIp9lpydQFAdfmallVdi+twV/Qco0XHI
	PCNgeAxYcHITaMVtHGLxDvn+H5aAcotLaHVQPdXpW5BXcl4gg7okHrDIqJeV3gFBUrBEPue4GYa
	GPWXN9ML1epRgWYAG1ZJlzkAOlzvmQorlYjfVU7iwonz/iSZs3bs9vqMjm6W7oNvek8UK407ER3
	V/rM2keqIbmUJ8wKUuNmlDKlPXZZgjfgxaFUIEVlzbMA+paY3bhdehfB8Y7PnDW8bopMbZgsRDG
	IVwe3A80yG8fyZTJedjg6eBtSIQE1h7XamyLtFuTowi03KvMW0EIOEBGJWKt7R3o2JjqAnq9rCH
	5zF+y+w8jgYY4XBjhmb3YKKYI+cRjT1AHbyacndXnBYv8U6pc6Vup7XbItjg1SWEsTtYNkNWn1a
	hAW3nb8yEeCcKJj
X-Received: by 2002:a05:6000:1844:b0:47f:e8b9:8b60 with SMTP id ffacd0b85a97d-48159ccd2damr8227155f8f.6.1786629962866;
        Thu, 13 Aug 2026 07:06:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Thu, 13 Aug 2026 16:05:57 +0200
Message-ID: <20260813140600.1824949-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl_gpio_ext describes the three Colibri EXT_IO pins, but no node
references it, so the pin controller never applies it and the pads keep
whatever mux and bias they came up with. It is the only pin group in the
Vybrid Colibri device trees that is defined and never used.

The three pins are GPIOs on gpio2 and belong to no device, so hog the
group on that controller. Referencing it from &iomuxc would work too, but
the pin controller would then depend on one of its own children, which
fw_devlink reports as a dependency cycle.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 98f9ee1b0030..74afc7b0d74b 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,15 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio2 {
+	/*
+	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
+	 * than on the pin controller, which would depend on its own child.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_ext>;
+};
+
 &iomuxc {
 	pinctrl_flexcan0: can0grp {
 		fsl,pins = <
-- 
2.54.0

