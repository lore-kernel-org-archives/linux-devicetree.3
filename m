Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483722;
	b=cQt5WSWF3aNRfmnzlHlCWcYXaFgeWI8EWPFbkgRZht/qY0tPHBa4X+6drcljXXpnTd+z
	 RvkybaLxa0OV5cIRROnZUsz7OWryak2HUzaFo/8N7QxvEHePDPj4LPEy65Gr4TMSy95l3
	 kOxRPTBfAYxOxB9PbegsgkFW34CdbwwYCa6T5cjeWgKBDyndsuKnN6g3d8Bphufw9eQrq
	 /QFZmR1s9Dsv1ei/YLJJl3BqCxdV2XcFaw5O549pX60KQM4N7WX/Sw0VZTF53cpI0hO8V
	 SQWPAHAdZXy7aEhVwtq34T6aqF0StlhGxPpkb+eP4sEBPuwnv5ldN3Z8FSrY1w6LlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
	b=ah6jdB+b0qj421gi2VTpK4n+mtqg4cP96sSaSDbAmCo0cI2/GnIuzONvGi9BzlZTMIH7
	 FL3YplLwrufbuncHWaxDjh12pnw8AvWFYRFKoD1xKJeMeKL/iCPCOD/xhnjQEL+ftCFx4
	 vC4Z1g6LmCYnxCF0KAdSR1REAJ/C5vaW97I4oyFVgrzTeTDAx45Rzs0LGJpPmC2udF4V4
	 KDEKqfYOqOQk0zWAH1ZMPJYWO5TgP3f7WoEtAP/uhhbaAXviiNIx76PEynYNSZ0Te5gkX
	 UelC4rSWp4wCQ+Zf/T4RcoRIJLskcbYQW/x4nuGSqiez0sdHLXvvXaWvPv//9zohLPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Tg/baRzb";
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B8606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tg/baRzb
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1840168b3a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483721; x=1796088521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=Tg/baRzbsZ4MOxkIjrZ/B5lU6Fg/bjyV/logqMV1Ui1y31rDJSBd9tR660cSMf2F++
         C12+iqoEf/yPkP9JuTucDcpS1R0J6l9bUYC27oXB4I72759oIrBEBlx2Dn2Eoa2pOC9Q
         Nj/x/6fCVuoUrS3+FYMUcxMX7jGfl8E0Fo8GBLQxh/yrgJX3SxEsZhsWxCxdjKp8ti4b
         QWg7SWwnG4Xr/JLzzZymTqF8Iul2/6Mb2ecmHBRH9d+Ya4iWf5LkSGdCUzM7ZUdcZur5
         3TA0usdlayEF04ePUUIlLrCZFy1fGrabGj+Ae9XiHvZPm8H91gmpmH8MHsmCoJz019k/
         6tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483721; x=1796088521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=sLEEFzv4pumqjA7Ep0n39ZeVOgHmb/QUms6oHxYrmivnkFqwzve1b0zOlDtkqTvBm2
         jA/oypWP/SsestxTlWM3mBqQxHOhi+iX7mWocoIY3AD7prrjZ+E/GK4ygnhXDKnzoI/p
         /FSX9UmbdC4DP5k98ZDNM0HcfHpkCA5qYHVTBYM4opl6XAHiKAoCD+dGKzNkLKq5A6SZ
         n+lZO1osArqm3+y6B7uliYt5FouK3sx/UlHtgj6rzRU2pmhzFszbru5z/0YurlAlk5rH
         Xn94q1/XpnnzFcNH1r3DV57bRM+lR8IuBGb5CrZIuepDD/rCeAX8tJmVxDny1qHw4HmC
         TrHA==
X-Forwarded-Encrypted: i=1; AL+hErHST9H7i82zE5wSOYSoxlfCdUI88GuQG/nkyXB0ano4TOxbZVQCe0u8WDJWX/GkKerpS8okYwd2QM9q@vger.kernel.org
X-Gm-Message-State: APuU4Z8+jQPw6cqNL8lmPLZnCUisN0E7ULpmVWkWJORAVi3DC7l2es4H
	xxh/cN1BeHletYUFrPSSba9BlIa9FVNKycfAuS5+s9cWx6BG3A3FCTF7
X-Gm-Gg: AZFdTZfxCY6zZhEDXDbbs8CB2p6zmuBmgRZ/4bC5kfVUcNsNXvRZcuMZuMAbKYfEwkD
	ytBkQ/+IIFmAwpEvx9nIyWX7xrmYsjlj1doA/XOLBxWZkIIPAcbL8MjoMC337knJO00nH4YJ7lk
	le30MxXuaafi0c6AyuJyBePGoLfwTSVnS0aGTymcKlJx5WTBZ39wb6aTae9LawCYJ4goNo3rkJo
	pFDU/Upw0Rw2gceA0Tq9owk8l4CIA/lR4dMXbrTUJyOSGkE9X7A8R8hM2o3pY765Yd+cGs/eSwC
	GG/UgVIy0JpP/dI/AQWYDYm/Uk1IGtlpUxCwsYWWeos2mI6SXfWue04nGFw2zhwweaE+KCye9dI
	whjmcP4wbO2qOk0cOMYRLmle1CfEC0UuOn1Dwzqf7SfaOue0EfqC8EWsXAWDSvSBQA/HqbhO+5A
	MAJBQHq6ek1G2rBoDqg1HqKtMD1v+dF+I9f7VOBjTEwYT0g9DUAA+cYK4d0Oqp2EK0j8a46BDox
	FnSBO/fpggxYjEaoqwLet+Clw/qfaTqk3Lrk5hRzbFILqdrScRrovlGLRHRiIEegfb7/GQJD/bI
	A2L6inxuQcAjCPCXrA4ZlX0DeI9sI9DypU9kxqJvboYm1f1rP4zJcBU=
X-Received: by 2002:a05:6a20:3d1a:b0:3eb:37a7:12a2 with SMTP id adf61e73a8af0-4014cf57a08mr12321296637.33.1795483720826;
        Mon, 23 Nov 2026 17:28:40 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:40 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] arm64: dts: hisilicon: hi3798cv200: Add watchdog node
Date: Tue, 24 Nov 2026 09:27:37 +0800
Message-ID: <20261124012755.328774-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124012755.328774-1-mmyangfl@gmail.com>
References: <20261124012755.328774-1-mmyangfl@gmail.com>
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

Add the on-chip watchdog controller node to hi3798cv200.dtsi,
backed by the new hisilicon,histb-wdt platform driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index e5010c9d4c39..169a919bb282 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -254,6 +254,14 @@ range: gpio-range {
 			};
 		};
 
+		watchdog0: watchdog@8a2c000 {
+			compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+			reg = <0x8a2c000 0x1000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg HISTB_OSC_CLK>;
+			status = "disabled";
+		};
+
 		uart0: serial@8b00000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x8b00000 0x1000>;
-- 
2.53.0

