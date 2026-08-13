Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C0548A8C5
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637468; cv=none; b=OiTRs2Zu/NUqOhEWGxedFfIpSTJfstklkUz5g0LIUR5f5YmcY8gFbq0X8xeQc3Ork3cPLGRkfwVdsWx+dNhi6wFy/8s3pfwfpL9Ch1e9fMY2glyRvA/0GgsTsrUstIL4Q6j4gPjgBuwthK+j4lK9/950NzNCP0ZLsOzyrHzBrmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637468; c=relaxed/simple;
	bh=bEcIOZ3o4/YBQO9AvFUt5JfjZrSfxQHFfPTUj3NXnoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EuxX2IaTDXpNrsLRmqA2gRliThiRLAk13TsiKxVzzV/WIfXjYXJFZFjqrSgLrGVoYR64741BFYNGY4pAMFoBNrj17rkatwfJNSHWs52tASTKgRtGDJSbhP8w5ZFCPTBlro7UXP0hEFq8LXRn0G2SO/IL9zdSGwJ2RegEsmPn/jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eabTRIHI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eabTRIHI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49553515a8bso1702495e9.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637464; x=1787242264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=eabTRIHIGdDNpHAf+jhFG/eggbsr2hSUxUalIFyLsgFeM13R+PGuc36gxJf7oZC7Fd
         U1n42TDWF3aGc0z3NM4aPfymTlZTx1iwRLHSRKfv2CVWf5Dr58t4Y6LEUdBpgkuvk8Wi
         RmXOhMjXPPZa0Zqp15SPRIP463A+PKvjlUbkeaLSlJuDNZOcJI1I4rpky0C0lXOVfsJv
         uBr7+P0Y+PAbMECeGCNCuR0UwvMcvwGWPKo/H4k1CHfYCAneyoADV2Ch8p57xesNFUQC
         4Ex4bYg5bDTfkZB58WoMOQMHCZydb+EKqcH+HEY3sVJpt19NKWz8pYxrlruhD1W21v9D
         gxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637464; x=1787242264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=Jm3MJv3jdqVJuIh+5M6kAFXE11aqHyo9UxvQV7WK+xB0dS/2A+NjALO9kptu8HxS5i
         gP8qPfI+KIQLjBcFejQ/tpLTStRvljVHR0XJNEoMr9xia6QF0QCi12c2ndy+yBFQURav
         8h3+6BPnT5hzHT2ECZ340TMOxycRbNK/nDXO2R8M1p07EFDld/uhwIlKRCr1Q0pqvNOr
         Nxf+WFIMKdjFTec4TzKiE8TCCCGt+UhOCgj/94BBKdnQVNA4gkBtZnIm8Vw2ggEIzKGH
         uHd7VEdfPSwQoplmLrfseAQmts4ybQqPaPstWXd1PpHXdMRAP7y8VOgQw/AnoEI68Tmx
         tkoA==
X-Forwarded-Encrypted: i=1; AHgh+RpogDQp06xVEpwiOPwzpozYGYmK/Ws2hhw+Ptof8s7tlgDPFOeKLlRYF0lWVbWYzj2+u/yWtbVbmSQE@vger.kernel.org
X-Gm-Message-State: AOJu0YykgMCxpueyDFytZCXW7Sk0r7JmQGzy0JAU6jyMvj/dJpWAeByR
	8Mk7dkm2CJgRYgZ65aRszcaZ4rQ2xUTV6TqJJaPk1XS9Xl9ZSrx20450
X-Gm-Gg: AR+sD13bDlKS+xtEnHGC7TEAtbavS1ct8kQZX7DmIoOI+DLIBTSbTumnPYLxK2te/AY
	yGnQZmcaxA9FTVQTsDXy/I4NYBh1bNS1lAgsVSMradp2iLG4EZ8U0r49E6a9LeRhchCap3ycn19
	QtpUYdtnhIhMjq8XTMYqiOIRWDZmjgfgIclEYsuG0WvSDlyxgPpGAJJhjQjnthpXII7rs+nhgJO
	Qar7b+OW+ZPi0ZWMHkoYjZrs+cNK3xkWyLc7+mn1jUt4q3cvXb6vfkM8+bcUCv+oPRWaxFl3jA0
	XxWcSjDURxArhN7hJUXdxXkIe+rxl9j77USorkqVNj2vS7BlW9iezWBdl6DeN3XCmK9VHO0lnGg
	jTu2++MP2PdfrHF94AgYysEoSteMCm+J8omfaj/D/LYrD7T/Ba1lhHkqZQdNfcK938/tIqZkuuf
	w59QO5zXrhQ+QQx6hAvFRHLf3EI2yAoDs1kg6CAOyGtiKA4238K7rZAkm+n15FYzQLDQ==
X-Received: by 2002:a05:600c:3b88:b0:499:7aa8:bd09 with SMTP id 5b1f17b1804b1-499821880edmr89033725e9.4.1786637464204;
        Thu, 13 Aug 2026 09:11:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:03 -0700 (PDT)
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
Subject: [PATCH v4 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Thu, 13 Aug 2026 18:10:58 +0200
Message-ID: <20260813161101.2274327-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
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

