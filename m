Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489F83A4539
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157686; cv=none; b=uHWp11ZeB0cBh64VYt5dzjKMq73unfDdOm0Ga7R2nCPkvVW2VH8rKkZnrX7dHjNxMUzJFF1SDVHXnvjTRZNYg7yeUCXJ5GyONpN+L0Y6jywgD//409XBdmkcsYAgJ1I+TX3ro7hjaGujAd2uDyWCEHj5gfB/ZVTHmj3eLMvzOzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157686; c=relaxed/simple;
	bh=E5Nsrst8R+oWlSFlU1iIAepfqVJ1BQpt7J6US+qhGWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZorW1P4j/AfLl39zz++4XQD2HruPmTV0PAWGqCZrVakjHBypWGNlrqpfU+3yvtIG8kG9OyecPbSkkfCJbnqpYsAup+F49MJn4qtC6lAB8oeZuv9rvTpRvpV3PO1yC1dHArFPkyyg1DVH+qqIf/uVWi9e+DVT2HpXseocE7EkzMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9gEeHmF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9gEeHmF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b27c7451so22201635e9.0
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157683; x=1783762483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkmJo/lAo5m4HMZk5yNl+7qepl+QkxWKO01Rkm0bkTk=;
        b=s9gEeHmFfhgDlyt0mVXV2zsFXSdfRvetztgdMHASJSckR7gfi+rgdcWYu9Yz2TCOoB
         DXPmsAGAg6GsusM2XLL1aSR9yre3w3kK+gzIAUXZEXtaU26TiaPzAJvjD3c9LP/ZRucz
         iIljEHEK2/k1oTkqsuw2JNTHdq77VD8vXaLCIjvQalAAqA0BbslWykUQra28sg/BbSuM
         8WRZ3bo/I52U/YvuEp1oNVQIz1PHkjDDKg0JmWhoV6rh/4FZ8Y3JPZie5U+p3lq3iVeU
         DjfFOaMbNJkaplI+7pJZmP7ZVPTiknLVw8UcaBoHNk2274Usi0KcAJLgmxEsCxEV7+Vr
         gVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157683; x=1783762483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qkmJo/lAo5m4HMZk5yNl+7qepl+QkxWKO01Rkm0bkTk=;
        b=jgl2aLYmsQzddtXIDh0jmT8eH2Rj3vEuPwHp9FkRP6F+apPVYsWcHv/MPTQ/KrYJfU
         CUZLtH5M6rkfoFLoFLRc31v8SiuByGGT3GAXdiZG9hq0qNWjFhiKVHvx3Wwq0r5P9Aey
         KMGrcEw9c3akB83Uu90nsq7haj3aVeEC3OPx5JrsoTZma9kePn82vqf7CI1a0zsC2GYT
         UmxzG0yupcfZbjJWdPSVoUWulYavKajz0X/9qSJvrEjRPou03S853LUWbHh3XCUTMS9C
         CGvTp/ads80TLhqd8HPIZfia1aiclD4FzVDFx3S7ejgzK0SMW910+mrPCy5NZxpU/FT9
         UaCw==
X-Forwarded-Encrypted: i=1; AFNElJ8JP/P7msnGhZKUH3TMIJgKNxGU4F1O9J1vYujOAZxB0fbBdQwPsKgE4L7Hg45vqe8fXS+2q/tpv99K@vger.kernel.org
X-Gm-Message-State: AOJu0YyUtO9qwARyjbkCgIN/iz1cFc7WCvphbUQjY1xTTaskORz4OQp6
	7GgMg85M2N9ElsrynKP52yI95HViz7jhtPvXqNIWw+GoYYvr2adI7Cr2
X-Gm-Gg: AfdE7cmmM5rVU2BjsjdnJU9zbpfmo2QbCSvZZFQM725pyPLWOcqZWQBmX+mh0sJ4Buw
	ntS3P6cG2dbRZP/CyZwlDTGEC4ViT9aFE0028sYqrTwFc7o9LfkVw25Bl3y+oRFnRG8yEz2e35+
	Dt4Nr3vLvm9J9e2xRhhN4b50ZFbV0/OjO+KKvXPTsiRn+H/F0qQxH0KvYyY0whUw2+eZNzzijmo
	fVboOd8tML16gYWgwxZvIOc/W4oFLjCUngrj+4f4flf33+Y+bEd7vWnPPmR+5PjefXLU7lxdwp3
	LLV14idayL1WslOaGgPScW2SZFmPo9dsQ+Xk4DXTZqt1sdfiuYHlxPLFlK7EzB7lVcHiIGiZ71U
	ZDZtEbFXHdKqezJT1ze4DglB5NqO6htSb97hrvB49n9CAg6IbLKZ2eIWcaBOGmZNEnjR7N9+99u
	A9ppsAomKd6oc2kBoijM9C
X-Received: by 2002:a05:600c:8a1a:10b0:493:d117:18a8 with SMTP id 5b1f17b1804b1-493d149a38amr16345305e9.9.1783157682608;
        Sat, 04 Jul 2026 02:34:42 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:42 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 11/16] arm64: dts: renesas: r9a08g046: Add fcpvd node
Date: Sat,  4 Jul 2026 10:34:21 +0100
Message-ID: <20260704093433.273672-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add fcpvd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 85e409ac8d5c..eb5604b84287 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		fcpvd: fcp@10880000 {
+			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
+			reg = <0 0x10880000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+		};
+
 		gpu: gpu@108b0000 {
 			compatible = "renesas,r9a08g046-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0

