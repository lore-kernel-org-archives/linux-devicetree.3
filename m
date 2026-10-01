Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F14949E0
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873540; cv=none; b=alnIO1BKrzyN3tf2M/ac3sQtOOgpqW+CPRQR174GGoqTpd+8BTomDXjPe1/356DNy9we2VrU0vg4tie5bN4qSF2lcR3Ix4l6ZtyWiZV1aYuMCynJvFjfZkhbCywjqu9kgMy62eL3Lg/zN9TCPqUVOfqjFK00c3JVONkVw+8Tpn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873540; c=relaxed/simple;
	bh=/4c6htHbY/+pTDzTjgO76aMfdQ2UmFpC3eU2LEDgX34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rco5TYBs6ARbxWJnBEB+aHxmqD7xOMdu9FeNS7VXuQQIfslcl5H4QtBYm5S1cenEf2d6aDNmbE+l4Rz6PWHMoauF1qK613nzbSBGyhR4qM3DuKZvQMCLkGDM0jZg8oEHQlDbEOgMZ3HJ+VfZuvogVdoHwW5Tf4e6dLUpWjNk5rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzMnP34f; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzMnP34f"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so4889742f8f.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873533; x=1791478333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLK7hUg8XDSDCbDtdKxO+z/jFp8LEc8rnhxAY0EynGc=;
        b=IzMnP34f6Ei8y7ngpA7BAVCYcTb3gBGSlJ3Byb5HRla+bSIHNqqtClj6gIrw7oJSjU
         wfqdywjlQ1xuy4g2f/jxSFWfrbNlGiVxFb4VzrM4oL8UNHbX1QgIbXaJVSdPBvL7jnSW
         E4VFZRUJS8LsFxeQfgFKOSpcZuE5hKrKPufMGjD8Rwcpl7rzIAA1qMGQq4kPX45tO4ok
         K84ZlfmLF+qYQ8YDDkcb/3GjxaKVHQ3o3ZDi2KZE4jnu7ptO5S/sm7XYE52xDTPIN2j/
         gnHHSnXUpkmZGkOlPI9ugQxEG11MyfIarNG8Xkng1z/posf+7KFFn/C9KDiHuHyg5f92
         LTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873533; x=1791478333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLK7hUg8XDSDCbDtdKxO+z/jFp8LEc8rnhxAY0EynGc=;
        b=euf4r0zFZDRz/fOoAafnUBUkFnKksSmJLE5FRAg1gG/YeEve8fbXFP61uMRmwglv4R
         k1xez5rpL37kE5dTaaQ0n1nr0X5VSEKAAxoZu1cLNffJ2D2rBUCYmDSgvA6XH2r5i3OO
         ufdO+mzaySSGgVnN8m9LO7zM+KI4ZfESYh8C39iwlAWkSsrfL/yB3p5ABlIxB5QGscfZ
         m4M+31YH9YMg8IcmIvB5QTfcA+TFq5tFkxkQ5J2E8Yad/ZFVDterpGt7HHbEgDKib1EC
         aq3rmFQ0v2cDuBsgikt55NVLiijD3hKqVXlTwvI+kd6anm8Pb7gvL97JGWCOKea/UfI3
         BaeA==
X-Forwarded-Encrypted: i=1; AKwUvBy5yKkR3P30NDAj3mEGoB3pWzj07gilHNsG463B77lI4eRFgKxpRgKJ6EfOToANaPXQn8c+4bacWfbd@vger.kernel.org
X-Gm-Message-State: AFuF++lcE7ExdAOK5eRGZdxFahqbVpKylXEnx+Apl1kCi7NVJ9mP6Bsl
	KwhFkigwCwPpR30kjrL4Nu8MJLiuOjviqGGYdlrPyIS07QtP4U7hlZ3b
X-Gm-Gg: AYBFou3iDLbkYc1MEWaR+lyivdYPVuxVuycl2M3GAq1YJ1G2F9YP8H0aupJprgLlr5G
	1CZeEdkdjENGJFGSGg7E3lS1EoX8l0XqJQy3G15pVp5Q0PzoBLRTcl8CedX7MAx+9uQzTOGzlN/
	4AzPefcITWDLl+lqHMB18GMSiajfYo5OXMtUPGkBazxpZ/kprwOvmdH4wHNklsE0woZyq4UsJlO
	dZVhzV9ImCGqxpbZXeUId9MrKwtO4jIaVOwrhbSs4Oehnvug3Ir78onOcmatyiBAN9eBpuuKzsr
	AYnQ9MO/FrjnFAPdnaiZMqMmZzD88oYUi/dU71xZFIq3kBit8MUPdG3wofSO7c4btSgiHwGX8om
	HhAZNCRwKXVa4Tsj4VdI+OnvMD09NVmq4XUhK9UaTFBNH/FL/ylkqvTRXCa5hkiuS96gTh3s6AZ
	MjQyqQ3aigJA+4IE08G9hnRyRmqIWBV6NWzQ5yF1NEMnsKCTjPobF3IdYycB6tcdvxh9WJxlmfr
	JYmR5MUyFefrhTQ51ncbgP8U+qMTGOKpPKK7wSmOWoiK+Wm+EDMYTHKifFKvighxljVXD7FTtR3
	obxFs0pm
X-Received: by 2002:a05:600c:4592:b0:49f:ffc7:2099 with SMTP id 5b1f17b1804b1-4a0276ab7bbmr3757495e9.26.1790873532595;
        Thu, 01 Oct 2026 09:52:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 7/7] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Thu,  1 Oct 2026 17:52:01 +0100
Message-ID: <20261001165201.763882-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 68c8daed557b..abca7aa89458 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0

