Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919200;
	b=inULirbXH5tJfuofnj85W+W7SJEYNeIWCCkYu2xakTcuWmUea7e2K43Rs4iQIdFNweRw
	 JqzNPzxUrwnhk4ftMES1XT+0mt65u6LRXWKqtFawdOi92LN1cBQrJcar1xNPKj3RvBskO
	 Ty5jbNGgWs+3OjoSX+TjRxZHWgY4fbxaeOZXLhE/jU/eEkv1v6Nxu/LAg3+m1L/9LKHRs
	 Ka/DIFnVmbaqUf06onRnS0o2exI8jmEiMPNLqa+b4FTeS3URqzu2B2MANEBl1Gz9weKo/
	 qTzxmcZ78sJwrcezO8fPdh0IWLck6rtfQULGfi8qwu0A6le5gI+qpLtpR1zzOnVLzHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qFNx2PFwju3GpZX8sb85V+O1VlouegAUrn4ULDGVae0=;
	b=IoqTNJl4hgnKMs0mlBDkYlEuZ0aq9gUL0hRtjdeDsQ3cupEzLKNONNOOTb9hCVZctmZL
	 Iy/tKRhgELscpCswBlD5rtbk+1yWcK1Ow70bp9+E+hSY2OZ5E2FJcZLG3uPDRM/HJZ8SW
	 PjAlyBZnlzIGnstimohZTbOIp81yLXcWRzo6+Rp2H1l3EKUbnXc4+yewvEwUU2+KD2Jnr
	 6thy9Lg1smn48X4N/4/WMaP7IoPeJ9Gl8/rOri7K3G6xB8ZFhn/pSDY7yuPDhP3euLBfD
	 cpJCv4lAK3Dfc3USRf+3ZKA+wJZZCXzoQvuMoIliF+wGeIlyhzfMoYbgkWTeeP1VT/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="V/lyBsh6";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DCF60A5BE8
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8DCF60A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V/lyBsh6
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so42489945e9.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919198; x=1795523998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFNx2PFwju3GpZX8sb85V+O1VlouegAUrn4ULDGVae0=;
        b=V/lyBsh6gxkoHD6nVXKA0TPVLKWRTocRRXjqbnr2UjPo3cTBWHTO1g+x2t0GJeWYtf
         OU6mnapdKuQQkEYZXdAa480Ab04nrv2nsuotmGGR/B8AaB1BF3P0Tvuwvf1I/bmAkAQ5
         knX0u9WEflKM814SXPtCWZ2DIYNtcp696loqmMdM4PwxMnhhneNpIFF/1ZO24hEtBmWh
         BxQ5oBDjpZihX2IPVo/C+sdINcMhL8oFFagr9WxGoMB2Pzlz0En+6QEp/TGmpR7Tu35n
         JwAzYpk0Au5oKmDb607M7ruAzarlKLI0jrfnU4ljGPXNcGpB3phlNdF9y/OkaGEEGfw2
         eP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919198; x=1795523998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFNx2PFwju3GpZX8sb85V+O1VlouegAUrn4ULDGVae0=;
        b=uAFCmYGeYUCxMgdFNVRkJN5x0pQtjjjG83nhR/D+PT83Rg3e9ihu7fRzHJwCl9GRBM
         s1eW21Rq+Dvdge9MjJp7UANoYS41t14K3gDlOtxvCw8IMen8TCHyociu018cEmocZQFc
         /TIspBCk06cfK08c3MyCcLGsPpRsB6Ah8SahBYe1yrn4N5Uf5FL1Uezj8lVHN2dQpcke
         9jkgaj0jPz4ReqaY+t0tai3F4M+/AEedUcWkLo2vr4wWk5JJ4YgTaMMS2yxwmZDlhpIk
         cFgeA9+CnzuDZsVZCx24uRMMEacIC2J7h9mX7oe574jjFwkisdCqrHWtu+4UH7WSsuUO
         JruA==
X-Gm-Message-State: APuU4Z+tO83H8YZlV+ZV+O8oQb4f+1SI5SwbQUfth1sYyFDHiFJ2HpzL
	DxvutMvNjqH2BQKSx0tr3VNuqrPdYMCh4QXwmejNfboipMmlqoA8ev/4oImZ8IsIFsJsrw==
X-Gm-Gg: AYBFou2ay903Fb8HnMG/rOZK2F8+zwYGdp/wU7x4jLrnRs5Gp87Zi1l5auDf1c8PMc3
	dpcBRPLf9Rl/1cRXJCTkbtQeZYLYSuVfqbnmnes/OzkfYB25h2HTY8ce1I+H0fJR7PeXIqd35Sj
	lExvrJ3XS88F1J6leVcKPWNzS/0TQHKNMkZcEo9Ke49OPI7vmvwaPShpaXbTIchjt79sDgLyeuW
	zYQcqf8hTxZd/jiGxsH26t4yHJK0ekFUYI1dPxwfEXOJzgfm4RFUQRaYddMFNlsn4po4yPWprud
	nmlcuE64e+qbs2awh4dnc/tJqOF7ARSk/ag4q15xTv32KD95lh1Jzy6XNzHbdabfJRUAW52XsBt
	k96P7tIKUd8DiiKG8RVkt1HipgfgV36+zZw0ml4nwg0fRVo3voobgMQalugRjdv/AKQ5uK23bAk
	LuAnMxxoHGRTab51k2QOdSRqv5lWlsx7lqClW80LGzH+UtiLf7AIkQPfuDjOeQw7l1jfCvN9hjz
	0JBhEpuOHtTO/t0Xq/2DM8crxZF3eIbY/xQhRu+4y3OrGN6WNX3yTRiH3xC2bczZF1p5SHXMQVZ
	h06CmiL2nGZ+MXyK5CEJwFqeEiKoBvu0ohJGiwz3Tqcim0aVUtIZSiraqjlyTGjSVvbxLA==
X-Received: by 2002:a05:600c:354a:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4bb55abaedcmr286510265e9.25.1794919198290;
        Tue, 17 Nov 2026 04:39:58 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:57 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 09/11] arm64: dts: qcom: sm8250-lge-timelm: add SW42902 touchscreen
Date: Tue, 17 Nov 2026 13:39:44 +0100
Message-Id: <20261117123946.668557-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SW42902 on GENI I2C13 with its interrupt, reset,
power-enable GPIOs, pinctrl, and native 1080x2460 touch area.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index fca48472f5dfe..a094aa81ad225 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -596,3 +596,39 @@ &mdss_dsi0_phy {
 	phy-type = <PHY_TYPE_DPHY>;
 	status = "okay";
 };
+
+&i2c13 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@28 {
+		compatible = "lg,sw42902";
+		reg = <0x28>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_reset_default &touch_irq_default>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+		vcl-gpios = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+		vdd-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2460>;
+	};
+};
+
+&tlmm {
+	touch_reset_default: touch-reset-default-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	touch_irq_default: touch-irq-default-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
-- 
2.39.5

