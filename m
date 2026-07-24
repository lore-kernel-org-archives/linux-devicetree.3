Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172EA3F660B
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884515; cv=none; b=Ul+GqBrVQfA3xtc3HoFMLr5TRVROABGlDSmb2BYeCQ3aAu6zJqLN/Xm6bTtMSKDbxOW6LIlRBIp/eb4fPvVEStah+d2ukGUww0TxzVFXFgdx1o4CMj7qWDdBtfEWII7IqrICyWiCOd15zpPQB0YLw9xkXIBQw0n62bA8Lt1XfgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884515; c=relaxed/simple;
	bh=yKkOBIWDLVzZbrFG3yiQLyXNfyi/iupP2ISmcl3yvxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UIdNWWb3QgRJNuUfNiz3CEqUnLw6XtW7V8dW0B5GLqRcKyP4GEPLaBVCZkCqLpFdcoSZ+Qo86lptrday36N+tBLFIqJtskDA0rA6/oYmi7tIQ7O5ftxOvjZVqJZ5hGC3FKeqhH7wOnySE7sOXFFbjnvGlHhmtVuZDkislOXLO2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAv6dcXe; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAv6dcXe"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso222579b3a.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784884513; x=1785489313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=;
        b=jAv6dcXePrxt8FCLYrkVcjLb/PgvrIFQInCmW6JXs2MylATchqRHhOoIhkkHl4Aqwt
         9n/8MxA7sMX5fA4H9CXTWz2ehszK4rcuqM7r4tXyKn18ajibHKMVPdtd3ykzGX+yB3MK
         P0yPNp0HfL7tEpWFbNPOvgpYwRtyfduPdjJrAHjXmWwDw5p8bRg912pTZVfAjOUf4eUJ
         Q5fxUdhSwGuiwDep28rrhiHNBItk6y3w0bAOMYvrPnSLXcI9PCevKEdQO2nBCR4KHPkC
         UP3haOwM+O4iemClMxyMzWY81uAJR1vWJ3cDExBIXkC+Gz2uoSXWzwsrJ4+T8xPgsNgX
         nvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884513; x=1785489313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=;
        b=Hmr86uandrvMl6St7AoiS745y3hS61Vpcuw/D6GKfSdRNhQseyVaoBlOSuxD5C3Nzo
         5rYvL3SS91rTBeNVo2GKxUtm1mQke/4glrrHwfOs8PHEmgYgyW38PIqQlaIfZZHh0zpI
         p3vQhsS/vCifsfTkc+3DbfqBzjV6gEGkacs7Q0SF44f10ZYylsufUY80o8X8unqwSujy
         VCFMIn5HXrM0+Ry6ks503420VPEe03/6LlO8626CBjstSTe64S37XIEUx9Cv/PriXcGn
         tdGQgdy+j33Wi05x0Ovi+XJoL2IeDuYvVpENVl88SdBuYocZEbjblJUJJjBJiiKCEIhq
         TdZA==
X-Forwarded-Encrypted: i=1; AHgh+RondxEBZ0/O8Wqm8QDXDyznNVvDW3vwe3qaCY3aukCmutboUaH8QbZ1IE2dRXg2lI/MEYo4JFbDM1O9@vger.kernel.org
X-Gm-Message-State: AOJu0YxRfEiEWIouFKQ+ffjkSoBuclQ2kok3QWJMWNoOcx9HvI8WlCae
	Sw2viYU50o2fik0v/7QM00r5Wg9Z7vHSgyMQTopsqI0Urdt+kjYATyDk
X-Gm-Gg: AR+sD10rregLuZ0gl3/GQ74RJA9H/zYOnzbjy5btjfHwERL1VyZBZo1R8U44UPzp5Jh
	M4Dod8PEQnQkJX5TUpbOyBSlNmX/+ZpB8MftKzJsiuQQpBYgRf3YztWsePZCbeU48nKk/S2DjSY
	bdduCeAepXgIPSqvmrppylDBcC6RDs+U42wmxZO25mwSBaq30UyBR1y7JoLsdSO9eZwbQV06BGM
	4XUKhqlGwen2OfuFammduI4O9V2dO1I5BQYdhQ9oFTCGvjbBOYAhNhB2wOfEXjkhGQMg+vHDPyF
	m7NZJ5ufzRgbPFSCnYeAK7+4gVjgpTHpANFEKGLc710t2ufxpfIlKrz90zPZ1ZosFUP3e2J06pg
	anbQnQZhtGse0vLUdc2IHeo1smB42zfFuxmA3dXipgSxeUPheue6hmua7cs+xigmjZWKjzqfhq/
	RjeaoLVrcqdsGJUkRZ19V5fuhqioE3TNVHB2CC+pWWQE2sHqlmfCmY8f70AqvY
X-Received: by 2002:a05:6a00:180b:b0:847:973b:3d04 with SMTP id d2e1a72fcca58-84e2b7e7296mr7121012b3a.10.1784884513359;
        Fri, 24 Jul 2026 02:15:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm4410519b3a.9.2026.07.24.02.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:15:13 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: nuvoton: Add WDT node for MA35D1 SoC
Date: Fri, 24 Jul 2026 17:14:27 +0800
Message-Id: <20260724091427.1689980-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724091427.1689980-1-zychennvt@gmail.com>
References: <20260724091427.1689980-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Watchdog Timer (WDT) device node to ma35d1.dtsi.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..14fd17cfdc5a 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -82,6 +82,13 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		wdt1: watchdog@40440000 {
+			compatible = "nuvoton,ma35d1-wdt";
+			reg = <0x0 0x40440000 0x0 0x100>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk WDT1_GATE>;
+		};
+
 		sys: system-management@40460000 {
 			compatible = "nuvoton,ma35d1-reset", "syscon";
 			reg = <0x0 0x40460000 0x0 0x200>;
-- 
2.34.1

