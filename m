Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875E63CD8B5
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267904; cv=none; b=HxIPdOKpGgwh/qowsick7IX+CH/g+FPbhiSvR0f0NcuZikXvqF9rzvby+9vmThJIM5yJ0aopGDnIpPkbKv5XR7lRf1sTR6g2SQ9s9IWAcMJRP1+ONlmGtLofMfGxVJuygYsbAgCeKIzRwp7IBOcqRTTSMDUVeoKJNg1hIbhgBM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267904; c=relaxed/simple;
	bh=6NDzAas2NzocRdXIQyRlLp6OMaRnjX1tk1dYyF+MMxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZb5CK/PYBGNwCqGRUxXU9n+8lxVqHzYfGWcrjH+gTBBfjQ2fLePgS+OGWZNpyJw4xEHRWvVPSYcQTHq6vT9Ka/dVcE0Jmcxt9pKWhu4dcfXGl51sF7CGwGhX/n2VP1qAPEBh2lYxcRvHKWAecG3YY9/QSsFVULbJSaGnjhTf8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ozuqAPq6; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ozuqAPq6"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-456f7012050so1134426fac.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785267900; x=1785872700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ferXd6iakb7it62QEva/YVmEUp8gvzZnEnMvOHm4P60=;
        b=ozuqAPq6+2k7xVaqLHMMtE6ARb5ovSS9+93HZHh4zmhDAug0VQUmU/yx7O19owRABA
         0coCSUJGk8YTJlWgRt1S8kEwFGkAM2eZYTMKQEuAjgsYQLCIKBz/pfSuzMWhxZ+yxUFM
         Qv2faZO95OWdm5dry2BRqDwYLDKwupzQV15LmF8AUj7/GP58XmFrEfilys/Dm8i75TVd
         wBQcXmMEoBenY8A6qfpSQyTQ55n6bvJdeAVI/Szppb82odQHJFk0KV1myTFehvsQOSiO
         +8TF5J7pdmWW5b3oSvO7xly9paaAp2IYIvx/msEIqMjmx5lODuy6JQ2SLbYRgpAiF9Ez
         KlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267900; x=1785872700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ferXd6iakb7it62QEva/YVmEUp8gvzZnEnMvOHm4P60=;
        b=ftKo3/vthYGvaRgD3WBSq5IPENdS/fwIumMrWjr1iHezvz7l6KpQk6JH+P6I6+tZAA
         l1p4EhiuCYugpBAkg8s8H8XdYYzu87bjXZxR+oPReIHsDM0faVOYJaMRgNS8Cl2xjxGo
         zNHHnYtM/sa/b1cO8GO5sHnUFoBaaY4DbT4J3HMO55bGFD+bcmDawRgu+9geZISOS182
         wVmLpT58ZBbOJnvBmmtWcuJKxv0zwo9x4+PaDOnPefZiEDAmtHwIE/7a+qSNZVj9NQVf
         9NZaCNErq20/XFDzI4gWpBXFu/o5RlSkKuQ+WWUqwfsMKRsfaQ4CGogdzFbsctyt4FC6
         r+Dg==
X-Forwarded-Encrypted: i=1; AHgh+RpQuC+4hlDlJdTQ3cmQNsQ53UFYQsvFTpeVl1M1HTA9fdQ/UDFlGIiM41ZW9mdOnlRyf9++m1pIurJF@vger.kernel.org
X-Gm-Message-State: AOJu0YwF1v6Q2JOJRgNE3BOXEVs8QTeHv18p9aCZ/M70nf66vvFILwJn
	wUvEpJzesks+9VQlXmSiQsiJowUucRsYCva+Sicg5CmNkEQ7vMC95MrBoPKjxW8LNJY=
X-Gm-Gg: AR+sD13PsUoV++6ZjeUDdVDCPGhGpt0u+zPmtRYQctik0CvjpmY8brOuigqnIdLcX9c
	B3ugHwBdqyr3t+U7zmd06Ib5EBduhm+HICjtNA+Y1D2C2hleV4qj9X91cEuCn/uHweOXImP/Vos
	HkqktGUJQEIjuitRAt3Yky9Ii02VrxhWqViBhJ463Ga5ewY66DoedVReSZ3Gzdodnxh67149SSU
	9OrIRglipm5JTIVg7WemBlREj3zYneYMkDdQIblnVjt+diCucU5e88kHMF/+oaHlPrxKCk6noHc
	79yOsf4MdNrC1C2VZwudJyUsmt4MntTOx8EV70E+hoRsmblAzTJzU78tdlHS/JtW7PKwYiUNCqn
	e3YYjgbIPYuFREMQ7PBlOF7yRzDzdtposL/n7mweYv5a2+rgO9wABGzw7kj8Ueja9LLTCGUYYW2
	QN82qf+O0=
X-Received: by 2002:a05:6820:823:b0:6a3:7681:1f0d with SMTP id 006d021491bc7-6ac96c650c1mr1638351eaf.21.1785267900394;
        Tue, 28 Jul 2026 12:45:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:3026:75d1:db9d:8984])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca5254057sm290017eaf.4.2026.07.28.12.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:44:59 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Tue, 28 Jul 2026 14:44:37 -0500
Subject: [PATCH 2/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio line
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-arm-dts-beagleyai-gpio-info-v1-2-783ec90d54da@baylibre.com>
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
In-Reply-To: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=6NDzAas2NzocRdXIQyRlLp6OMaRnjX1tk1dYyF+MMxg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqaQazZEy4mSpZcVwhOr1pVGmB/zn+SLZHNZae7
 M1fzVXTKkSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCamkGswAKCRDCzCAB/wGP
 wCvPB/9X776AlVD05RxR4JtcA4ai2byh711XTSm/ohs8uh2tnsKhkQtwYJ6hirT4lWm2kJy/L2a
 2PhqrZoyQ2Zs8tpatiSq2JfkjAW0xo1i+ARMa73tSX/2+os+doEhN2dmvPcnsqxPF2MtK1EU55f
 h4R3oXzOVkzpo1J23Y8t4ClfBNWCUH0fMQA3wRryU8E5vOygoQB2eVwF7CqXUlTyM9vtC5Q92BQ
 fZYn6V3WKp+5E/dDNSE8BTOiz0b4LEhu+TJZor4v+dvUHf9it3HDidudzBvfd35Gskc0LkvfeEn
 6kBWVd5bkY+ITzL9rzyzBFoL0HfoaRektW3Bw3//b3H3Ny1F
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add gpio-line-names properties to the BeagleY-AI .dts so that gpios
can be requested by the documented name on the 40-pin header (and a
few other board functions).

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 599d576f694f..173c091116d5 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -267,9 +267,32 @@ &cpsw_port1 {
 	status = "okay";
 };
 
+&main_gpio0 {
+	gpio-line-names = "", "", "", "", "", /* 0-4 */
+			  "", "", "", "", "", /* 5-9 */
+			  "", "", "", "", "", /* 10-14 */
+			  "", "", "", "", "", /* 15-19 */
+			  "", "", "", "", "", /* 20-24 */
+			  "", "", "", "", "", /* 25-29 */
+			  "", "", "USB_RST", "GPIO27", "", /* 30-34 */
+			  "", "GPIO26", "", "GPIO4", "", /* 35-39 */
+			  "", "GPIO22", "GPIO25", "", ""; /* 40-44 */
+};
+
 &main_gpio1 {
 	bootph-all;
 	status = "okay";
+	gpio-line-names = "", "", "", "", "", /* 0-4 */
+			  "", "", "GPIO16", "GPIO17", "GPIO21", /* 5-9 */
+			  "GPIO20", "GPIO18", "GPIO19", "GPIO15", "GPIO14", /* 10-14 */
+			  "GPIO5", "GPIO12", "GPIO6", "GPIO13", ""; /* 15-19 */
+};
+
+&mcu_gpio0 {
+	gpio-line-names = "GPIO8", "", "GPIO11", "GPIO10", "GPIO9", /* 0-4 */
+			  "", "", "GPIO23", "", "GPIO7", /* 5-9 */
+			  "GPIO24", "", "", "HDMI_RSTn", "HDMI_INTn", /* 10-14 */
+			  "", "", "GPIO3", "GPIO2", ""; /* 15-19 */
 };
 
 &main_uart0 {

-- 
2.43.0

