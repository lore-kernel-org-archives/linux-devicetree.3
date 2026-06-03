Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB6447CC86
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488016; cv=none; b=d1pSQOFTuJYhL4fzBx8BTPUEuGatnUzyaOPq6me6a8NTMXWfL6Xsk3Y+rGGyng1eXo7lABzd8gDQw8oGtxQUPPYKW4G36Rvx2DLokUlLfGW9f9SI0hv97ARFNEwUrhDtlqwWYTiU9C6pcciEb30TvNjXUS1wfeO3MljyQN+31wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488016; c=relaxed/simple;
	bh=Ex52IU8CCRR0vjuhVjGGFQn3zY3V8dmQNs1+Pd4lmvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cv8elwS0XVmv9mniUOacWl9cFSJRTfqNKPTcPjJY+D/DGjVEqRZ7IIZWiICqb3YVchoNmfT96Wf0bZw01dpAEg8Yg93Nu8EK8OCN+HoT70FPHhgnzqmUNGhWIGBGBFsKyWwxUaO/WLLxm0opJyjcqVhbzUXv6m4LEeBpNEJzKx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rd0pirKV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rd0pirKV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eeea039ebso2936073f8f.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488012; x=1781092812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRj4oVY66h5BGZjSvCJPxniyCWvCDKuiAB40WEEr1xc=;
        b=rd0pirKVj4sqFFmSVv4eXgFDohlpxb9QqcMKG7W8pQT3QKDkCj+kLZZvujnelf/z8G
         A2bYeFGMB+glg17EZEFwTWh/gKLlANiekOG5Zuma9W6tn94nw4OhqAbODzdi6qNAYxBU
         kCJeTucs1bnFjZGZh0ObGaoHsEhif8Wi/V2r3L5Dp127VSRWmqhRbQUGQn2PNuqaloj8
         Jgsm+4oaY4DFNIiANKofiodv0jmeOYh4SFLYWeBQbncU5RFC49dotmi+7JI5lMZcKCTB
         +OB2+HrYvOjsSty4OjVdMcyayenZ/aoAYWJkkfsMzHx5D1NWS645g1F6/lEqkHNewMHL
         IAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488012; x=1781092812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRj4oVY66h5BGZjSvCJPxniyCWvCDKuiAB40WEEr1xc=;
        b=Nypfqg/hgb+ZlHHmjh9ICoHg7cKnAhp0lYTKEBYuz0HdnXfja2qwnVNat10hi4GE3P
         wpdRXOsfae81xRD2yM5tgtHO6E/g8wKdzB0yNeZc32AfzKU/6N7a4Wzz5C7J1qcvlEgW
         MLA/K0SyHYWxvzUJkUfYFkarU0HVREteZxvjetxxTrW2H0Pv01yM6PJAZHG81b6uPBQk
         qBH5e+QVPGaLfxa+hB9gNZ+FDFX/sypuo4MsoVtstcSmnul6692p2HEFLzqXj1Jm5VY9
         VxDR3xqyJckBSpx7CeojpN3LA+zjF4FiycKLdr54EQzYuWIJEPy28KturGZI8YaFO/e3
         D5lw==
X-Forwarded-Encrypted: i=1; AFNElJ9elJBqZgVUg/ciotANXuFvaNzqEa2Q+jC/JEoIGPillb83zRZ7C7Y/3GhbZOClEaYGBoN0HtIeI+Xc@vger.kernel.org
X-Gm-Message-State: AOJu0YyQd/aQC0EPBL7QfuFfPG+3Kc45pLYtvWLmN6d74MwMHI/1NI6z
	OvLEGygoeug+xNEjcOG5Yg8DiBV4DgWQaSqOSgAG7pkVNEGDwA8aiRvc
X-Gm-Gg: Acq92OE8SOwpFxJGgH+W2cVBhe1K1/oqPwuMXm9+4Kbm5B6yjOueXZcg+ub+eG1r6Zh
	ov2cAMHbHe4HFVz3OmS+R1AyMB3Vw3pp68b7oQWODi5dviGm+s1MM7XmdMntkpQ8hX900dI70Mv
	akefle1gwVYk7UgNIQgrRVKz/wxERl569QmmR8T6iIxD84Uz4xMlR3G22JycNomIQfu5hkcWE5m
	9IaYXj6snL/uwXg8pI7CEmbEaOaLGxgV+l1TS3P+SZCvdw2wPwcxcCZa2qHLilNIh9CrvQPB2Ss
	PU3ZC/R2e1aZec0//pwT9cy497i7sTt8CZtp/Tk9gsX3oIp9ShdsCZ/A4bx2jYhgBL1Zg7W3TJJ
	oITI8XMMRoIvlXJQIjnVxGRJRmnw4mcGRlYHygohgFdxJPvQ2jfLJz5BkZu5w89CI95J3G5GIJ/
	jCrkuMoQlVdQ48Kl9qFM9MKcbC7uPnbbMVOvnVqcZypCYgBddtL1p4Z9ijviwC2TohxGwIS0QHZ
	fHhS+e1GihvqpjbrCdkEe8Pw9eAVk2zYkWzVrNUIRoVkU+q
X-Received: by 2002:a5d:42d1:0:b0:45d:b14b:2409 with SMTP id ffacd0b85a97d-46021783ce1mr3641063f8f.2.1780488011988;
        Wed, 03 Jun 2026 05:00:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:11 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 11/12] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Wed,  3 Jun 2026 13:55:49 +0200
Message-ID: <f5c19fe05ced09f638953cba857c3694f494a72a.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index d796c32f50cc..06baa19d79c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -241,6 +241,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -385,6 +391,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3

