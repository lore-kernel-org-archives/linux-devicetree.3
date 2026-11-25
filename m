Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565206;
	b=yrkLo/WMEOAbRNEjqAlpQE5vE8Fy1WYLHXlK/zJfVIRrZQTi32f/DKdvP4MyYZpBPTsW
	 vokoTHfVuAl4+ORAm/N7EG57n9lGFLhQeh6NiJzMt/g7ct6+xjhP88B86N6inWT417NzO
	 NaGUiaMkY0EuN8XtqXcSD3jhJxEssbVOcN+VE9cyTqaDMxp8X8pPSaVkmInrkV2FiJ5Eu
	 z1tsLzAbrChd2nGwSa59Hy92eHMtwi8YCdzXvfcoznLtzxkPQtJO+Oe8XhSl+JCtWXjQr
	 jKhHDIQJB9lHpkC5Ppeeu+2OL12UMtB4X2O3JII7kui9SbzVrFnBwx4J0D8fWQj1f/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
	b=2QX0B2MOx1MBQxmiULrSAV+QJfpOCz4DcjSuSNvkiE5nuzpXz+jZpFj/xwv1qjQzhJFW
	 s2exbfa+Rvd6aT8/9EI/Zlo6kAStEs06dtmrQyLZoFadB+73NcNpL2hwTBgLIG/WU3+uw
	 qQyiprAxd9nnPl5uxwLQ8Ko8dWnurMHksOwhp6jlV5HFcZW+/KOurEe6EE1ezkeLGVvvR
	 yC1D/PvAd/NhkOHatw8x6JAA5wTnUPPOVFO0i4UUogBgSzmzkOm86uaXas0QYmWMrWhJs
	 OOqoobM8CFqbpSkbN9n1lrxg98BOKvw4Hv0YjCNfFkQvWhgwVPrL0SK9uqSrl7lxDUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="TXyC/36H";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25814606A686
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25814606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TXyC/36H
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386ab9ab619so5828620eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565205; x=1796170005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
        b=TXyC/36HfrOvLWoyI8DqOI7OLOp3GQOBIz3kN6GF1wGrkIdv3iBBhqcHBRmcl6G4Ps
         LhZ+8mBlicdnwE820z2jq1yHE7ngXWdAY2YvDUo0+cV3l3MSa7TksytvkiDH5uLp+0ll
         nsWBisS3ZIeC8hqIRaAcFhhA8RMXWRdSuZ2Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565205; x=1796170005;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
        b=MAtfeEkuYB//wRM89mR7lODhgBeN3y/lQCxdjAl86bRWCTg0NP+qIjxZN5bK/C0kCQ
         /XmbKElt17X2U/m4CKQ8p81bN4XLXk3zmDnOdmCpcFdPYXvCZSZFp5FsG2pE7flWTcoq
         V6eCoHcYGSzglYjzkHSxi26fZKv8dbYiQ+A9drZogtFrCz9zVHW/3XTOLkM+BV4UGCJf
         jDAaq85mi/OzpcgGuyImbmfmvQ/tUTIA0x2VZdLjW/UzSZIRpmeQ8JqkvR5P4OkfoNbc
         c+053x5UcOw0JIhxHsiesDi2njAjOuJN2NCbks/3WZ99pwoelxtDujw4/hcrrN1/ynR6
         xTIg==
X-Forwarded-Encrypted: i=1; AL+hErGNCyG3PqzxJbAv1j9nF3dSNTjzShBa2IAETs65B4LUuqg6UfQFY+HN6hrcfvcyHnscmQCV4c3hDZdU@vger.kernel.org
X-Gm-Message-State: APuU4Z+TjYRXj7t0wImidwwoK9SCqPc+v4ML3C6zml04YoYVQK2fe0MC
	5tPWgSg3GD7O3TYKaxln8cfJqHajV6VI2vggxe6U0+9JsqdDpbPUo068kq/516XODg==
X-Gm-Gg: AZFdTZdDi5Ka6iKmscFm05RVbNGh8Lg0pVdYnKr23nkvTqSih/EFbP1ge5OHWkCVph+
	CoOIPXGdkEk7gz99vuQ8oNBDMiXWPfuE3wFAxupItAAM6PuSfhMqqiLWpJDyPtKMjxMjEOFpUd/
	Z+SVkf2e1BnJWDfi7PhyLv03mZVCnxKYjrQUW6BbxjVLQ39LEhjc0PPguXWz6tWBNa4tyj6chUS
	9qMYzbd0lDbYZLTJGvkLCuf7bqZ3zbSGlRqfx9/U40F8a/HGgXhJ0gH6TB/8RU5ZYVopuM1dAP9
	Ka+RDd+JxlzhlqKICKqPPNeudOvWpJxaUOO6DIIys0KEMp2YXvUevAlRuRYWTPNZOPdcAMgc2u4
	gOxX+WetUYX6fKKBcFhIqMBS1WSr0XV4Mw9pgdKhH1/wxllF9oD667OBp/sR5URH64GVEt3iObX
	BrdUtL5+lcvbg33QUN5sKjzjqqCBctHyennyiNAY/ElJznuNfWGbKb/QcaQb3E+bSPsbuCAYpZx
	7gwKQFnZCdSvsqD2hRxUWLQZvsAaCikCCTDEUlY1WU/XiSDCrJz4MU/rpPPRwTSUthBc/DYBotg
	GeFhmqD+MJfq8dAKEAaHDKRStJ+zb1hR7PGnlWLaX+FqZBa0zVImP/99EaWQV/48F4eDSvdxVO2
	RLQGiwXkfIolK7Q==
X-Received: by 2002:a05:7301:4201:b0:385:b8f4:755d with SMTP id 5a478bee46e88-385b8f47ad3mr16518134eec.20.1795565205307;
        Tue, 24 Nov 2026 16:06:45 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm59676267eec.4.2026.11.24.16.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:44 -0800 (PST)
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
Subject: [PATCH v2 9/9] MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs
Date: Tue, 24 Nov 2026 16:03:43 -0800
Message-ID: <20261124160343.v2.9.Ibb4a0adecf127291198c372da631ff62b483a795@changeid>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Tensor SoC known as Laguna introduces a variety of new
drivers, with Google-designed IP. Add entries to the GOOGLE TENSOR SoC
SUPPORT entry to cover the new drivers that interface with the Central
Power Manager (CPM).

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 MAINTAINERS | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 84b47bbc0d74..ae2b8e8e004d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11509,18 +11509,26 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/power/google,*
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/irqchip/irq-google-*
 F:	drivers/mailbox/goog-mba*
 F:	drivers/phy/phy-google-usb.c
+F:	drivers/pmdomain/google/
+F:	drivers/reset/google/
+F:	drivers/soc/google/
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	drivers/usb/dwc3/dwc3-google.c
-F:	include/dt-bindings/clock/google,gs101*
+F:	include/dt-bindings/clock/google,*
+F:	include/dt-bindings/power/google,*
 F:	include/linux/mailbox/goog-mba-message.h
+F:	include/soc/google/
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
-- 
2.56.1.831.g720f3f5937-goog

