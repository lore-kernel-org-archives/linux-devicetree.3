Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C818369236
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402633; cv=none; b=T7s8Moh9wOh+7JNusYFrGuqhoP2Ro3uNBNIEyTS1mlnxg9xPz6dLcH2fivuf+I7kzAsAvBo3oraSh4zJMcXQcukNYYb6pRcoPE8JcWkrXy7ZSap/gZA+sHsPAYlGvz77rdPvEMluv/ZWP6Qbz/9JpnONPCAp+QjN2IJodl/fXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402633; c=relaxed/simple;
	bh=DTF/btmt/0REEac1VNTgRyM88bPMcPEL04SwiJzjaGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jheI/3Pt7EIsmV2dhHroubKIGSVZmFqnCCz9Vl8/O0CfaPnv93p6u0D7otD53ffYDGiOKSpadIOyzGtURF1XAi9W0pgONrY04dxElWFfK/K7AHOzBEunBiykaY4O3gVR6d73hBOk7zU2Qa/+aV8Yzrywhae+kPli324SCcR31PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSMlH0LC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSMlH0LC"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bab2548e8bso15254035ad.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402632; x=1779007432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUQuLqpOBSAJcHe1LC1qE0yMZ0cjnVVQWqbr1WChTYw=;
        b=VSMlH0LChQ0K87Cs1v3Fvm5/AoklouohVNi5bndBp7bSqq6np6ERoN9kp8rgtw7Jkx
         NKePUwr0K+2SmdO+uck+EEsSAYOZYsWSyOPh+Z64SfZBIg2kq436y8hhvExT9fTOvLyq
         l1fw9Kkyzkdr9feQff+EWOnoXtdcsdyETbFA6wYN1mmiS9ZBxEJM3uWo4pt08fIlBH5f
         w7VAQeitAkbJebSjBVya+pUZjVdffbchK74cUBRhEvX7e3sxRMYZB0FQx/7aIGGAsOWo
         wNz8QYW57k6Q8y5U9wXb9tx7TkQRX7HkEl2XPkiRZ9Dr27cIPfmqzTSSTcS3rRrQXIbj
         aGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402632; x=1779007432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUQuLqpOBSAJcHe1LC1qE0yMZ0cjnVVQWqbr1WChTYw=;
        b=Yw3sJ4zHqcPDw0FtwBti0WSpDgejJtgKiJDaWDcLPCiK0y46nFRe7XK4OxY797QHkV
         MiVpcTkvtBHhnBgwBK1jrZd2RdRzgu9mY+GpLDk1lhHS2kHNmlAX9NNaKQMN53/I/WwJ
         mwlyGNno0ZBIHDaiYdw4vfaXYIxlvLekpxJ9/s2GXLzsYsXdmC2BnkfQJjJG6qXrxTSv
         C4OL3ZngT3+/TOFD0cfY4mQb40P+SAi+7yTyYhe//a+7NJDFcEPumXOEPYwBHtzT8hL5
         rdcb8ZhR1ryv4cZzFAYAJrlw4s5ku7ZBih4FBJejP8HLI4TXKo5yFYNZjBBrUfpF7EPl
         Wuig==
X-Forwarded-Encrypted: i=1; AFNElJ+WlJuP0k8/K2ue+HN4QLhIExGgpSJhsBO89Gv91uJgQ7/5HuFbgn7O5VVIuDfsV4wsUUlp6YcsIl+O@vger.kernel.org
X-Gm-Message-State: AOJu0YwlvYYdtxypOuPf+S8zYN4JOXvV6yggQ1ZdK6WIkhxGAmWFGmCk
	0bhC8JtxhmdmBxjeKXoFNfKYZ3OSrdjNGjDfPdPnq7QRqEveGUJq8irM
X-Gm-Gg: Acq92OGv/0oV+P4kO4jaUymnCAMZHqcSJHHnMB1stF9n6Juamm1/GTfxRRHmBBnTPDe
	QrdjBzIOdZhkTJpUF60Po/SfS1X0lZk7PpsdQD/HQxIEUsyzxrLhKo7Kjf8vLWRIIFGRC3aWX1J
	KCdRynVle/ZlvaQIiHyhog0ndBJd1LuxxrzdCfcIt14yEOqZFhKJEIRB55IrE4WwRbUU7LFVcRI
	Cnj2WAZk2PSMgRkCaPHafNc9LvFEICueS/L79l5z3J/t/XBleoKqha4BedPWlU9eUFruJIvmeDf
	uuj9KYK0Wfj7S+Z3QUEfKMLpFCzu4GAlDUFI9dGP/YdZj0IPQ//w+ZO5Oinc+q25ltqN/nrcC+6
	UVIuY8VJ3CzM6vSkWzuSXvOyzoJ1w3b2u1KVGnb0R2EbicrMbAP8q5T/NHGdaa3MQDXDHciMKs5
	xRMOOScCIwEkEd/+werxQVs3eFmFj5Iy4XQgCvjX/oXyRonSBVPBlnErqBRg==
X-Received: by 2002:a17:903:38cd:b0:2ba:be5f:cab3 with SMTP id d9443c01a7336-2babe5fccc8mr136653355ad.3.1778402631615;
        Sun, 10 May 2026 01:43:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:43:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 02/10] arm: dts: renesas: r8a7740: Add clocks for FSI
Date: Sun, 10 May 2026 15:42:55 +0700
Message-ID: <20260510084303.122426-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add the SPU clock to the FSI node to ensure it is enabled before register
access, preventing potential system hangs.
Add missing clocks for FSI (icka/b, xcka/b).

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..6f9d9bbfd159 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,11 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+			<&fsia_clk>, <&fsib_clk>, <&fsiack_clk>,
+			<&fsibck_clk>;
+		clock-names = "fck", "spu", "icka", "ickb", "xcka",
+				"xckb";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
@@ -614,6 +618,12 @@ vou_clk: vou@e6150088 {
 				 <0>;
 			#clock-cells = <0>;
 		};
+		fsib_clk: fsib@e6150090 {
+			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
+			reg = <0xe6150090 4>;
+			clocks = <&pllc1_div2_clk>, <&fsibck_clk>, <0>, <0>;
+			#clock-cells = <0>;
+		};
 		stpro_clk: stpro@e615009c {
 			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
 			reg = <0xe615009c 4>;
-- 
2.43.0

