Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425655;
	b=N1sur9zGe7Y3zoPiknlwMjmIhKlH1NoXyBGS8SeWbIV41cLdUkypPYykXUM1NmdU49Ml
	 N5wmeFTKJoKyDqgToE9aI+xHDQlL1yu+/PL3kZNebHoAMYMLJ9FW2kaOcogfofL23sgZn
	 Krt7BMCi0ADQ9bH4UxerCIRV8KxUy9z0sPldOHWXtTz6mV7UtAjXtf4b7D3JOIUZ5k0l3
	 rSrIJE2NEZ07rpnTS9JSvdq2ApPF0E4VkakMg9gB2O6cA5iFQvfJ3xhXUwQrvjUaXazbC
	 S+RZqf+qbBnIbjK6DXJLb+pDsvY0qp/yr63sLwiMMZf+yCAtJMxakhDTorJyjX4Q5hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SlPceQ/NGCnBw4wRJ/5LfNtk5NdmNItuCsSpVWw73H8=;
	b=dSsjcEaioFOZNX4Hh5i+GLrXBMPl+G0TAbtedtC2aexCY5DKOozlS2aAlVvbncLhBynS
	 GVY2M60Gj6rgJlEw3o7N/I28J12B/rpdjJbaBZ77j4Iy5bakKdNKTe0Bq0/nK9UJuPETx
	 HtXBWLbW0LjKWi3LMwFDcxb/1lUmQcgxXoQxs5bzyzU5beCk5K67Y8np4E59G95YSM7wm
	 FYYRDmENnfGcjxLoBvICZWtvzA4uPPS0uf77nCsm1zmyFxAyVS41lGDuSmDQMxQWjGfB4
	 uZJSEPIW0HJSmFYZNjFnnF0Kcv7X5XYZ4XqzB0WheVtPGF02aXHTyqbkDM4vu8dv1YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KM35NkGj;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DB9606A69C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1DB9606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KM35NkGj
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28531115e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425653; x=1796030453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlPceQ/NGCnBw4wRJ/5LfNtk5NdmNItuCsSpVWw73H8=;
        b=KM35NkGjPE2KcVY0hNGgjkH2RPxKUAVgtQ9D08LXNg+4BhBtc2t3rAYy+MvAOlzyh9
         VLmi1FuJE9FZKFlkI3iq8KJ6LfKXPvQyXi0sAc5DUz2ktutL6FjQ9sGzJLpCsT6nj7ZC
         N4LmswOu/FjnzJ+a/ZzxDMmAfBbzbUkukzCl411FZgpEyRjVIyxTFGfVOUf3ujFc/XFw
         eG7oxEr83YErWwZZMpfpJJeAeIN3Hxefo2afQqEqdABCvsyufB+eRZE2uhfZJBt96m0g
         VrexfjEFeIHZKLzzOuGd1BsvOJ0M3HRq6i+kfMfgo+WE+/PCCo04U93AvKhoGteDAbYz
         YFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425653; x=1796030453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlPceQ/NGCnBw4wRJ/5LfNtk5NdmNItuCsSpVWw73H8=;
        b=wMh3jNrUekIgw5W1KDAqIMTlhRZ8svoW+mTmXhMKfsBV7WplbtIBZejjaUmSJzYXZY
         eYOc3Cb9kpHjtbGyxe/pGpeW34BzwvEtiNGMVPOi6vmNnGA2fx6SHGK0y+Y7Hh+Og4FO
         LpNDsohrNTsSmIbmQndm/DEFHC3A6WOIu57lkA2hbX0jzySKcOfENRfNwmb6vOTR/YfG
         zlCaCRy/xXiSpqdv/4ovW3G2/cp6I0HSIsZRM33q71Fg2dmlvJhge5jYzSw9+lcjDuZF
         4oSQtuZdpN0Rqdfoa2/z2PcqKbGvfzi8Ts+m45tFhzxekYh1IXGqzVkYIbLNbbXUKT4j
         mq6Q==
X-Forwarded-Encrypted: i=1; AL+hErGWUKRRqtdVrcPq9xWamUbFnM61q5Frewy6uI3pAeaC+owb3hf7YbW5UGPoCabY3GvXcdW7Y8VzvdhJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/kCPGRkmPZWX/nPwrgJIaJT4rTI2GCNiBF7AxcJhdqvIl69Xpx
	UT+PhGFW4XQBd/P0wolWJDJ009l9Idm2iBbfvOYJYPXQADqP0hGYrVZu0ZPetX1cj6U=
X-Gm-Gg: AZFdTZdwe5Q//99jSAzOIpRMLRx69EHoirs8RrGeVrlfjgpwWHyEFEmKY2iZiNNyTev
	RWWOgsCQqsr/QSw/E9+m4yylDA2BMRN1WTNHQglyVVkSu79pnM0f2YADlzORMAxbeRBQTBEiPqQ
	M4LbZnLhHcqhjXXxrNehMQ5hmci6AR0GvF20DrI2kSAUZSoJkglMpi+7wzy+eASSZYW0w1EDG34
	yxIBOLtp9KT7wsHi6z/XaJ0eXXYmgH26IPOnTBtQ0+lHr0QCU5Lm8hRw7QfRnHaNyo2Qm9YVdvG
	EHcV7kHZxrbVIycXQkm5ikQTdBu6gn2skG/cprAZTR8qHhoE3iDC3EkzVkScpHdRGlpQDYvndkv
	kAHZM9OLLIuTBIuHrh7kOWQykuDUs9Y5OS9aL19EMseyQyupne4zQfXbsu5UmtiuYRm0CDzhA8U
	mPeEssHMft4dqDuSojxvIdms6ow0B9xnuMQESrA8Mfjmmfyo1lLxWG+QrDZC1M6fnG9MN5y3FYc
	6vUwMGyV3TqK2gNjgMIbbhAAKeEA6NwxY2esMhgQPBRkzYYmaEqr828tiRGDtQp4xNzF9Q4D66e
	/xvAVDfvOwnVyO5Rq2eGiq615/I1V6+aA4YkZ1JabkC13iNy6n/p5fSUOe6eUdstbxcA/oCCivt
	IWaH8PchlW6hR1Im6m5L0VQZ1KRgj0ozS2qLnBMr7CYEsgA==
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr218707705e9.10.1795425652884;
        Mon, 23 Nov 2026 01:20:52 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:52 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:47 +0100
Subject: [PATCH 3/3] arm64: dts: amlogic: s7: add the peripherals clock
 controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-upstream-s7-clk-dt-v1-3-95f46d67d8b4@baylibre.com>
References: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
In-Reply-To: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

Add the peripherals clock controller of the Amlogic S7 SoC family.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index eb123d022bce..5e0cce9149ff 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -162,6 +162,40 @@ apb: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc_periphs: clock-controller@0 {
+				compatible = "amlogic,s7-peripherals-clkc";
+				reg = <0x0 0x0 0x0 0x49c>;
+				#clock-cells = <1>;
+				clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+					 <&clkc_pll CLKID_FCLK_DIV2P5>,
+					 <&clkc_pll CLKID_FCLK_DIV3>,
+					 <&clkc_pll CLKID_FCLK_DIV4>,
+					 <&clkc_pll CLKID_FCLK_DIV5>,
+					 <&clkc_pll CLKID_FCLK_DIV7>,
+					 <&clkc_pll CLKID_HIFI0_PLL>,
+					 <&clkc_pll CLKID_GP0_PLL>,
+					 <&clkc_pll CLKID_HIFI1_PLL>,
+					 <&scmi_clk CLKID_GP1_PLL>,
+					 <&clkc_pll CLKID_HDMI_PLL>,
+					 <&clkc_pll CLKID_HDMI_PLL_PIX>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_ACLKM>;
+				clock-names = "fclk_div2",
+					      "fclk_div2p5",
+					      "fclk_div3",
+					      "fclk_div4",
+					      "fclk_div5",
+					      "fclk_div7",
+					      "hifi0_pll",
+					      "gp0_pll",
+					      "hifi1_pll",
+					      "gp1_pll",
+					      "hdmi_pll",
+					      "vid_pix",
+					      "xtal",
+					      "axi_frcpu";
+			};
+
 			clkc_pll: clock-controller@8000 {
 				compatible = "amlogic,s7-pll-clkc";
 				reg = <0x0 0x8000 0x0 0x1e8>;

-- 
2.56.1

