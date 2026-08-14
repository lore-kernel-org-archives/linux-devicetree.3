Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAA341A938
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693636; cv=none; b=oKksYQ5YadNXjBQ8UFxq3P5kzn9uYg+pghVxskXofpHPiuCq5jPykCZXpokI5a6b9CX9e2KR4zPz6TzxyGbG4rDrRImwv+HxLslLT4PnqV+u/l29gnfACUoM3p84QDE5mT771bpIivOfQ6ajK/V2rl8wxmcee+XjMlDbKVzUYXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693636; c=relaxed/simple;
	bh=bEcIOZ3o4/YBQO9AvFUt5JfjZrSfxQHFfPTUj3NXnoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gn/yJXD9G63GTveSg2hrzlD/4J0tlfNxYtzlnagbJtMZeOat5cPnh20rbhjFxOe2etGzOrvPcnCQ6Pj+5a32hidanDrEb3eF+ybShj2VFvnRufCqCd9YcCPyMbuYPNVSM267MyOIMo5TG1GHGf+vG5j4p/YE22zoIMfjjCoOGu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmWSaIqC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmWSaIqC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956242332dso7287255e9.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693624; x=1787298424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=nmWSaIqCfG8pOjfCcBNq6WtUCfx1G/TTERno2KW022rpNxyWgPZFVELgzNpPYdQnN+
         JJIhKtZpeJB+r2dg+qeNrofiyHiuKWwb8W/RWZqolj4saGS0UWHiAj3O7EtFiwei7Ju3
         NsLtHHoH7d5msSk05a0fxb6CinbRIOvtXLuHOkiJs+yDth6hG3i0EG4lu1BpWsC5QjVf
         y/PgYi0gjZp8MtB3CMsBNz+B9gjm/MZQtse3KliSaoXUSdKYlK0y2JFCOMJwOw6DjxYs
         vWOg20p9PgvZQpmSGKidIgknkISgakyq0LKZcaY35UTYJNGlETqTgC5roOUBAoeHr/7T
         id+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693624; x=1787298424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=mxk/RIppulZkj05MajTyg7vE/YlTuPhcTE/IsX8DyzlXg/RtMnrrlZG7tB1xHwLyVj
         KcrTd8WIbGFpEtAMJOlo4angiiv9+Qi2iOhrEU1o8nt8EwyX00XnaiAmO9vkXglO723C
         9ns8hfVVvIq/4LdCsug7YpxTxJetCXYuede4tcDqM0P09FLwzzaMPGzbtbxREaJCemHJ
         F+Rgh5HQirH93m/YD1ncF8+sq+a8AJ9EJmLR8of0VvQhQSGk/w6V/XJKjjtXf/flI9Ao
         X4XJw0Son654V+8dqxwXkFFT0IsWvNEPE5Kz4UbKBFiuRRH17gHiD9BYBc8C8DAoHcxx
         a/QQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFWHG7Nb/HydsICH3zWUdG0N87/ag48ry1sNxHBaiCu0Hu7Cdrdk4BCX+A2B8AHldv4N2vGwvvivoX@vger.kernel.org
X-Gm-Message-State: AOJu0YxMXFxj1JJr5md8KY6X9me4+ganP4fvOAyn5nMrabz3MsqfveA3
	D8elhaR+3Z0QtLav/QwjGOg849/gZIoyo1FNBSlAfbBafFO1oVABoGJ/
X-Gm-Gg: AR+sD1361SO3oFz01ZRbM2MWbdXzRXwQci8XgX/DXOZu1dL3sM5pNkbApHauuiQRz1j
	fpWZXg3w5sN5vzuqLSo+AVPZckhgqiLaGvgySnYB/ZSRJe5rDj6BIW01QT7WAgnB+RwgANPNAwt
	QvpbAF5daN+cJCo5ybfIppsxhOyafyCQ3fvDJVtN0sKtezUxxzmd4yt2bvT9QF2vHpEtXkCTW3y
	jU4eYp3PrV4efjnkWBy3qgMvLhdlaCyy9U6se0g/B6r345lppv+l6dJHXbA6u3m21EdvqBESloj
	dZWNt2jk0TEz1mhTc8mMJFXkDFp7xr/SfvJL870BUeG3hpYpRWr4HRuOGRWYJSThqT/51C/SbSp
	EhoPTKs+X4h9j7AgcWOfEgfyOe70tYDLigwGiAgs8ax2kVHjdn/V+rZ2dqe/GKuF77Idv+DFL5C
	iuUf0tg4gUy+2nYttHm8VgbH+rwgrTaw4BZqLRRgNW17rb3EcBSK1IRnwTMCFJXF8MN+AE8syey
	bmn
X-Received: by 2002:a05:600c:5494:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-499879a52aamr48387325e9.14.1786693623509;
        Fri, 14 Aug 2026 00:47:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:03 -0700 (PDT)
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
Subject: [PATCH v5 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Fri, 14 Aug 2026 09:46:57 +0200
Message-ID: <20260814074700.2491256-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
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

