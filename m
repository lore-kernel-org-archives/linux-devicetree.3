Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565201;
	b=GkCjbbOo0RDkWf9A1ITVQdk+OVeqa1rhxtzIoVhGORfE1E6u6fG0S8fh5ENoTLYIlgNv
	 az/8iiLDWXvssJQ0j4KA1G8dvrG6+E6a37wySJr4dfV/5wc2xlVH4P1N5kfRfXky5HZ01
	 Md45MSbEsWKfBSM4YXAwXf5F4pwqZumwpkdMcvu4IYfVxz+b5fhQi+K0AYTjDuRzvnI52
	 FVPvNR3gBrU/LBICUC41Q+ln2RbpJA9DO6nBZhiTmbneyaYVqbjUlMGJBcDCyJknc4MjN
	 OUZ+v9ccUiZ0HAh3h3zP2Dn8OjDtraaS8suE/T5jVImJZx4SNu39dHFX4WvtmbalDrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
	b=jPDOpl5/3kd5S50Yii8AqfaXchfgK5ZoEpJny/VI+y3AQSNkOoSo9LwrpLknqtKgG4Pa
	 mJbVZYXfGLjNehLJY9TPrg82uiNXVmAx81CP0jnBkOc11DKHlxccKw8Ot+0u8Kv73XkdZ
	 fjsb+AKC7gcxk/H+w49mhp3ed7n/UwIUSw8jzbUCNh1gQgACL1uSnN1id70AeA+QgL4aM
	 W5X89qj3Pykg50D3VbSsWwysqTfFyXnTR7l1Wujikz5uk0TpZV9udLiDPtNAF6Yeun6WG
	 EpPY+cMisbovMpKaahq3xB2QSwRPqZavfAYycssodmIYc3cphzq0yFB6GOzD4W+MPUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="ZINEXKJ/";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD335606A686
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD335606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZINEXKJ/
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so10330040eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565200; x=1796170000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
        b=ZINEXKJ/7u9zktdrlz6SNLUJveG3csKZZd0U7GFCzQrGmozhFUGvmul1SJyNyrAl07
         EvJo50x1fGHaxXQfDIYrKxj9oq2x25tZgUUTPN2kJ0b7PoMZ1x5B0fWx19hbll1FgAj/
         4sTlj1pth8dIRDrr70XK+wrEvuXJOKVDqnAjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565200; x=1796170000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
        b=knJ9f02LNgh/ws7lFVISgHuJuO/UXmjtNj6rkmQVGhDbuekYcAQYz6AcGs+vCx1cpe
         iyj8iczorx48klcPJdkBk6UtvywWB+ck8BBwSvPJ2WNHsmW0hMGnf+8EN5GkDthHTbWU
         Nc5uR7VrxRZURN7vBfvJ+0op7r0CTzX+c8R2+p5x+aiHg5T1nDK9qt0sC1QhlTzm6O2T
         6QKDRk01l02JGA+Yzdg8WRnXwpZa5ofCw6wHpL+ZN+0yl+8kQg/7pOTyZPtFnx1vBUDS
         tLU9viNsXtJf2DzSZ+96nGSPIQUUwcxMsvhOi4SIW33RP4t8GL364xkqkporWUKHPyPs
         AKXA==
X-Forwarded-Encrypted: i=1; AL+hErE/OxpgBxWGNBwf6/ZcvqCPQISriVB4GJAZK0d7Ihm48iHb9MXUeIB/v0QwJSa4YVTmutyeY1+Qr7Rf@vger.kernel.org
X-Gm-Message-State: APuU4Z8pbASAwHwtejHc/uxnSUvr9U6HNHrdg7GK+APUJ9eKgCCPhToh
	y+lFKEDOXHzf/0qxphObmVwgcwFYOLfy4IWFzS4OSQQQ9LBqAKeltwjIZuJmH+JISw==
X-Gm-Gg: AZFdTZcIZkmPMCwPpBTS4s4NWMLmZjdZZIXP1oBKxYSuZofT6NP+uEvL4jeB7ii3wMf
	08wEzPKwopse3meFUKhwfGhHO4FIx3DITUqM90YR++xf68P/rPV4LNg+zl9P1A1bMbMae0BrdWn
	4HyPpxK78UnKBC3TRZpYA1uUSesaFSmdow03Njg3zFCPkxUIliEs17Wbl6+snQyU5IkOpNlqlJg
	F2MT1a6DYotnwL/a/ZJhP3xnkehYx2nGA7Uw1Av+H5+a+AqRnIrONgb4r6hpg5up7z2yWN0+dol
	1tAGXabdn386GDURbNESZyPuCXAUyDUiro51N1Hv3p3i18zmNldqltbF+0Ed6MFo3FGMwtrhRQ4
	mRwV/+VbQo9QYt+N8m00AwOrCvh6s94UyjdlmwfX64P9sCwrEH3cPNaNEI8QOjFvEiXCUEvh6p9
	RlSr8xe6WrsPBX5moF1KxNhdODg9Bt7fN1Ysh4NyA/aes3LgMbfeduZdmZtVPCbMqmmuTBTEFRG
	Tj0oEDcTHhRjvNYVgMd5D8o99CvLxIve6/nio/mZRO3/GaBP7gPjqdlfIeNiAW/ApuHNIgoCbUi
	X5sjU/Io3MpuUNixw2vzsujNU7amSvWkTA5oHYrbjweId7W6GABWe/c90e8WpI/44Uh5
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr5742665eec.40.1795565199973;
        Tue, 24 Nov 2026 16:06:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-38566cd4efesm50070598eec.12.2026.11.24.16.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:39 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 7/9] arm64: dts: google: Add Laguna CPM mailbox array
Date: Tue, 24 Nov 2026 16:03:41 -0800
Message-ID: <20261124160343.v2.7.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
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

These are the request and response channels used for communicating with
the Central Power Manager (CPM) found on the Google Tensor SoC known as
Laguna.

Tested-by: Peter Griffin <peter.griffin@linaro.org> (Blazer/Frankel)
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Based on WIP bindings from:

  https://lore.kernel.org/all/20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid/
  [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings

which is part of this series:

  https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
  [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver

The binding is still under review, but I include this anyway to help
prove out a working solution. This patch should not be accepted until
the binding is settled.

Changes in v2:
 * Move later in the series
 * Add Peter's Tested-by

 arch/arm64/boot/dts/google/lga.dtsi | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 3e670e524c4c..6ceb9ea6a100 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -365,6 +365,36 @@ soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		cpm_ap_ns_mba: mailbox-array@5240000 {
+			compatible = "google,lga-mailbox-array";
+			reg = <0x0 0x05240000 0x0 0x00010000>,
+			      <0x0 0x05250000 0x0 0x00010000>;
+			ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpm_ap_ns_req_mba: mailbox@0 {
+				reg = <0x00000 0x1000>;
+				interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,tx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+
+			cpm_ap_ns_resp_mba: mailbox@1000 {
+				reg = <0x01000 0x1000>;
+				interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,rx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+		};
+
 		gic: interrupt-controller@5880000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x05880000 0x0 0x10000>,
-- 
2.56.1.831.g720f3f5937-goog

