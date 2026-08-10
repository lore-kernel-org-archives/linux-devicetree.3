Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585B13B38BB
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370459; cv=none; b=KsQdsNLdzQNdSQldJhxA1xpFU+Eo2TzbbxM1kWklIecXhBWWhx55evjdLU4IUWx7QhfkN+N5zIJmQVqjOPgIEmT8jjGfqgypvtsKjbv33a3g1btXX9+GIsc2KETWv6iSA8auSAJhCrrYuspKJcnysksyS0swaypSuh7y7aC19D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370459; c=relaxed/simple;
	bh=3whydaACbtWC1hvWi5vdvcJ85l6VyHpSI6B2i+UEnGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+TEvkTRGF8vIjptvNnTtprB9penrPxhHwYAK+c/3owL8mYBp3/YA6c/aHNUEthf44Sprg79P6NeQhnlu6m5ezOH1IthburjhA0TFIcfHnTf15akt7UCb9y6jotBUQEuIY60u14BFG+S5hiR/Y7EW3CUv9DnaFiNznvB8wVkDfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIZES66e; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIZES66e"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso14223775e9.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786370456; x=1786975256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xn5syabkc8Ac7FLEHgBkaPrtGwoPhZlqa7sfgImM52A=;
        b=hIZES66erd9+lIW84KqDmncb5c0NEEJ92aG6OJq0Jqtuu3QEw5k/6Z6WDvfjPHMMqI
         vsWxe71tUrz4g/NVIn3hx/xY06XVqSqYSWEO84bW2hBdKIUBZCqTdg2Wn3maxqqujHPI
         RQje0neEXLlqnueHE8E26MvQl/ZEpkslCVIXxUkG7cPTfvoDVjIdUkuqls6k2pCuOGaK
         BhAHO4eRctxxIV2VR9Itngtf9KdwR/T5Q4jGRS9yBt6O8TLCWC9rg5n0ybV6E+c/0wou
         Anh2rmUoJhZ96dn2wGUmvJzLLpF3kNgGmH3nxXYG4HgStUHOrm1ewTpHS/lZPDF3Revt
         aRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370456; x=1786975256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xn5syabkc8Ac7FLEHgBkaPrtGwoPhZlqa7sfgImM52A=;
        b=eRQRwP0S+5pgxz6gCS/85SgneZE3rtFhG4MlgkpFnxbSUH1aimpaxVutcYc7i0ZdGH
         KSZ7lu9v0C0y5q6msb30G+E95pRkA0DFB/ZbGTyb9xsafat757HR5sO0Ppc6zhXNF5Nq
         JYhS5VF/g2ncSlvvhzuQ697IXl9hj4OXHe2TYbC7catuWMB+u3NeJNCR6CQu9fOoPK/P
         Ls8vTDpcY7xoiM92LzIBM0aKQV/rPLfUAr3DyR4pIX3YB6GoB6uz6X2ruJB9dI3aP1DD
         82BNhkosj80RjjI9ZfSpG8UqXgpZGPGjFutO85DLkKwx1DpRgQQMB6WwN0bWavoPNaPc
         629w==
X-Forwarded-Encrypted: i=1; AHgh+RrlGh05B1rWqCdTP578utWUhn/Pwq41I53yldKLGWWIK29tMPB1EQXEkxHFpJW1/hxkW5Oc6VuEF8Hl@vger.kernel.org
X-Gm-Message-State: AOJu0YxiNPj17+S4IL4Yo17+o6RZD3k5h2urZQtNjZ5PEPoUZucRFY/y
	xIYBiTKqGBAofNIeHdvWjotHwXDGN+O/Gy7EtEdb0aw3pYCjQIUAbw4H
X-Gm-Gg: AR+sD11XmIKn3dC+jFzPMADCBpFRj+D/to1ABY3Rf36KYMIihZcPU63gRJqGf0DI8am
	cM6Qz91ZbPdqWF96YuGrFnuxEJR7jB7TKxLQjdt1vErYVWFXwn/fgxmLOEVtyUr8bKdVQi4ZuMh
	ACgr1W6vPzjL3PnEklrmX3imfnY9kpFAxGl6fZfjfHCF0xVkT849cSrrPRJfEubSqNuYugQ2yk9
	aKzt/n7AzNw3abmXIcZeG93KsixZp/h/2aKVSlY9h14a3PcW3Lo+dq1SSUiM7+bBqXpLYcUrV6O
	UZSVz7adSRI4rBhgt2WSss/G1tlbfd4S5W38y8FWg9T2Y1U7ADXkz7pPKlNV9tf38CIDdeFYVvJ
	7Vt9ikVn/YwfXVH5cNF4bbKjhRrmizJK7lxQjLMiG5BjooW0jMnFDdUMrCMZpjSeBZrKQRxdiza
	U0zxMud7Gp/UXjUKF/rN7HCY5cSNp22ucyGC6du58uVqH3SpMQ0oUuMQfh1/wCxxcGfOY=
X-Received: by 2002:a05:600c:3b29:b0:498:261:dd93 with SMTP id 5b1f17b1804b1-4995e0eccfbmr294905755e9.18.1786370456383;
        Mon, 10 Aug 2026 07:00:56 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm291661565e9.4.2026.08.10.07.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:00:55 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Mon, 10 Aug 2026 16:00:51 +0200
Message-ID: <20260810140053.2793495-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810140053.2793495-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
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
index 98f9ee1..74afc7b 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,15 @@
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

