Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330686;
	b=eaiIQ5n2BJCO6dqO4sjF7WO0949rooBNARKRy8XCbZrULaKoXk6vGv85NS3rLkGi/i4Y
	 QtE4MbJVf31wEVTQqWmf6tJE/f9VqZMWoAqQ+FkTXKydxKdC4VMQWmbUf5TCVGVVrc9JF
	 sGW8890V91rUxwFo77f7SiVdOG5+VlqP1e3BYQ+s6639jje7klb5vm6MF2JyN6/k05AvY
	 nkcmtdtqo5jlC6rmUuRiWlQifZfwWF17PMiFLe60WL10pMSLpjwqg49elHDVaupM3Vps6
	 9+gA/iimIDSnqO1k9aJDDDiTsM16mDT2bJYNzKAQjrxPYQ5nwnXAgR4NAzFtROvSa0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
	b=zb6TZ3/SSPCIrRx8jAqmr/w+yw0D/j0c/UYd/YtCGc6VXXO1uoRv226Fb8w/xN1w9VyU
	 ZUMEI/R4qKk3BO+K/ZUV164MnOQmujD3cYyYpZ+6CgGH8gDxm1VBcq5LsCvDPc5uRpCM+
	 o/eroLOm32SRiSB/jWaQV70DLDUB22UiiSVdm8tW+OcLBpx1jNUujlC8hBgg8Z9wxHjba
	 +cbE8aHNYyVTC6Dwtw4eU04YIFDetzVqhKm58TyoSIItP1BZjz4nqLthqkZe2zrUNi72s
	 7Gjk0pyMMWOWVumF2A6TtsS/EM6XMc7pPRTnuif916tr1Nd1uPRIBlgQMZSzZznHvgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGnsl5ob;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0718606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0718606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGnsl5ob
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f05b465cd1so6800075ad.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 22:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330685; x=1795935485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=GGnsl5obNSAzL9JzBsJqbnJfphbo/yKRmtuO93/mO2oOHN51qy2xcn3vCmoci4ikgX
         QzykZFk/BDowePozc8O/V1gurohLuy66GvPn2Yk/QgoJtNPCJ50QcWmW3hjyGTOccIcy
         lZxaYgseFAQEn2MUiZaBpiC4iGoMQSKj8hajJ1675YxvfZhAEO5PnPNe8KRBVdQ1FNhp
         Gsb5KoOy6WOR8aFDcQmO+BAS6Nu7z3kVwOJyqBkJvYQuJbZNamDrfH5BQy3v9x2sEZJk
         N03YDny6w56HsUoifAV8Pbsg5Y0bWn3SOhkZz/bRvYt6+XDnqCV3HUBf4NQlyR3SPq8/
         59Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330685; x=1795935485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=t/XonQ09a78Z7EeBpisTNkOc0wm6ujmGBtvdJNGRXtVjYQM1lOgEJa2AwXV8izMnBR
         FIQ7F2WSAXFF0bzLQG7e9ersKaSaTEBA2D6IK0zSWQwBo76KdvEpQqId3wk6wgexi5HP
         9ITHr1uyAMyir5c8UsWZ3eositCQBKoYPZvmL6ri3ilcY3oHjlwbvNxAgVEZ5LhoKZht
         mKfJHyODH9Db4ayg9hYpxSL6CW2k8MBfjeCMAfFOunvNYRiGtYfvqHv1y9joUC9zUvL/
         LrsHPYgb9JnAny9PtjxgW8VDPKS8ePZRVRGFa+Fc3QkNAYFGZUvwonmV8HNiUqQkAz4i
         vNEg==
X-Forwarded-Encrypted: i=1; AL+hErFblSCCcWjyP3lZpVNr3Pb2I3JKXClSQlwZO+yQaUZZLX9A9kHAY3jmBtz68ZQB9vjno4fIFqzc3ELv@vger.kernel.org
X-Gm-Message-State: APuU4Z+09OTCGKhthUQXHHoYg7sogfyAeao5vVQEvuT0pfFXLOnGZhYT
	tnlS2993UOQbUTnOAPlcDBhzbdT5Ji+/jMU6DatBT+Q2L4fyQpK/4UWI
X-Gm-Gg: AZFdTZdmNLwDx4ZbiKFIwoKNY4ITxtjZmJ15nqcP8eCXfC6hHZi5IkEFDhD80QICCJ1
	PSD2S1xMWfRK48Pgu4b87bbngHS0N1rn5usoLyTgFTfzRYZ4oiqV1lKUStYRBuxAmdlxbA2Sg7v
	FON5GTlrloFUcpwtI2Q/DhdXHMLIeQg9kGuweb+f6fuQMkM9RUEokKWpatkA+K+N/RVQVtW7uiQ
	XAWUmjW0zeWumwJnxeO4ZIYPpJUNUPkiPMFIm9w+6WwJxvkntM9OBwX2qMXookBZaXt11jsBnFW
	JzqOts+hRvZQoIhfROFTL2BgJ8tC7W/Ay4S4/JyzStDap44c7JxxP71QQmLR6PLtel3RvCxLSRw
	uvo8vEzdqer7daOZbAfNgGi4WVvtjNcPqljN3XKTZ5uvZkjZD7LUNAjiVNqKPSVj/xRbZU3C5EV
	pKwvDOcimRvD9cNIH65eJCrmr6CDTm4+/pesqnRhnGDtG3Q5l1essbA9+A6BxSDXcu5SOd+7zon
	Aye4b3TwT3i+Q7bwAtnLpvtWl5qxH6a2B93ADMUArG1hYh7/0nAl2eU+BpVUelpVkfjYasmDWsR
	4TgFhY8H5Vu6fP5do71/HjkbdRRuzVe6UMKBS1lIZ5EHTqvOQ1+YSAeNku0MUN03b6heyWJ6Lw=
	=
X-Received: by 2002:a17:902:ce85:b0:2ed:1350:59ff with SMTP id d9443c01a7336-2f03ef594c0mr76278785ad.3.1795330685150;
        Sat, 21 Nov 2026 22:58:05 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:58:04 -0800 (PST)
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
Subject: [PATCH 3/4] arm64: dts: hisilicon: hi3798cv200: Add watchdog node
Date: Sun, 22 Nov 2026 14:55:22 +0800
Message-ID: <20261122065549.3265519-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122065549.3265519-1-mmyangfl@gmail.com>
References: <20261122065549.3265519-1-mmyangfl@gmail.com>
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

