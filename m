Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAD5222584
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 01:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777167299; cv=none; b=AdfXt8V0iB2zb5P4VZm8nDPqGiladiniiR/4ZokPLO3f7/ei80BJDM3YvgOt3MGx5ChW9POkeT2P6xgrMI5LtmaUAr4Y3p0CthEcyr6TsPHAowjgSZKuZttE9NTPpZSMIqyY4q1IejlNyCnWpI7zAmZXr/8mzyUGWbNQCu4b1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777167299; c=relaxed/simple;
	bh=mQAKuD3WeXQ1XBhUTqKiA7bfWU9ql/+TtyDJOWCNFy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDXCUxKqHgxks8VtRLuiCIDnHTGWChmMepPR8cHu7VFU7h7q0RDTF2pPMp1TPN4D7K5iR0vjj6YRc+4EomeAwRStGd8wvvB/iSeOfmi66n2GQzQJp1OvnKahxrKDJKTVYfii1ZiRTKYuEqO/OgEYs5znPk5IFWW2SOrL2FvhrLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMgeuhgx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMgeuhgx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f351ca23cso4628080b3a.2
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777167297; x=1777772097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF4CaykY6wEIrEhp/AAj8VixeBINa8eIjZeDf0E8G/w=;
        b=aMgeuhgxx/GDcZJmGfWVYAfLTyrkCY1mWbnLcmwiYElWw18AZwAlpBUfRjZd9AFdQ0
         7uA+UAlLNjaF4V9nPyx1Mq3EnhlHulUKq0U4yL9/JAtJX/Eb7BDr81t2RompHhDsm1ck
         V2GKG32CZWncNEGzw/6t9O3NDPFhiSWEEYNohyfcl6nvGnMMN7a/601SGfqDXS+7jNTE
         omdc8Qa1+XIXlvffJ4vAeW3WnPSzxjuzDVqg6Huv14OR7WbtsudIsKhLOhdHfqgqbxZ1
         uDPLf4VZoRzFMUS8pEjSGCsvAPQ+KgndgciXie+jZxArLOn8c9GvWUA4d7A19P7V3uqS
         VG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777167297; x=1777772097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XF4CaykY6wEIrEhp/AAj8VixeBINa8eIjZeDf0E8G/w=;
        b=CN0OraKNytBEwKWvIGmxgfQo7QofeTNiHONYtYJXav9qndP+pLHGII/N5cxcQKnPGm
         KVrxr03rJEkBbaAop/LSakeRyCfE7ykxbEdmm2cDGVBFUaBM12lAxytgLLPxTLf6gpva
         6mUjrDslL8W26OfZ4l0VdP1w+Gu19JsHfSJNpWa5+s61VGZ3mW4aWwS7I5A7IOARVdrG
         MIiATvKEiVy1xKzsp+ok0satFaIy1xRmjwafvstbI83vQojLRx4F1uakDLyhcW7b6DBn
         hEhI5Sl03bBeY35EmrrTCrPN1V/F/qq8gk95AAO7590RVyaoKU0PDtsfT6a+euKL7doX
         RzvQ==
X-Gm-Message-State: AOJu0YywyGVOdI3P0Av8uE2BjPQUxEH4q7kBO/MG16Tsr0bnt22fFcnt
	6kJ7FypBtKHtogQXRJdSg5OWBVgq/icNTgetqw2h6n6PF27k3CrPIy+s
X-Gm-Gg: AeBDieuMGMNbtbee8UD/54gK8vltF/XvVt82XqOoyPQVvsORi3JU6/YstFQ5mTYB4T4
	tABh3oQWQbojToRMBU7TM72jl+Ol4CA7hFr8mkEEKD4dBVFO0H5Sxu/Fykw3TI0KLzJe8v0J9qo
	kPNCVsMB5PhVj+9eHH7PUCIyS8HfJQ9kSVIiGJZB71o7NWlwrkS9U0x9hDYJ8xb7seRngxcNmZL
	G0dICLLxm0oKJG480tTm2Vp/uAaDNaqs6ujoknu3//28fw9KVIaRKumCQUqUH9JFR1TzOJoPjgN
	hN1oK5a0T5+zd1n5E7rbphDl7yU52I8LEI/xr65bCkwep7O6JTHF7AN/gGGqckH68VAuJiQ1RUm
	QP5sZVZPVpuw0BAd40G+zfBBJcB5zlr+URG161YPHoDkDQZ87VkdeahdVKOwPOs/BzvMC/w2CuS
	8qurI7FpYBlW2vILjtOI8tzaRIQgtHgbfCIg==
X-Received: by 2002:a05:6a00:2e23:b0:829:88e7:c88b with SMTP id d2e1a72fcca58-82f8c869b8emr39583221b3a.19.1777167296972;
        Sat, 25 Apr 2026 18:34:56 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm32046469b3a.58.2026.04.25.18.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 18:34:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/2] riscv: dts: sophgo: sg2044: use hex for CPU unit address
Date: Sun, 26 Apr 2026 09:34:48 +0800
Message-ID: <20260426013449.694435-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426013449.694435-1-inochiama@gmail.com>
References: <20260426013449.694435-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previous the CPU unit address cpu of sg2044 use decimal, it is
not following the general convention for unit addresses of the
OF. Convent the unit address to hex to resolve this problem.

The introduces a small change for the CPU node name, but it should
nothing since there is no direct full-path reference to these
CPU nodes.

Fixes: 967a94a92aaa ("riscv: dts: add initial Sophgo SG2042 SoC device tree")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 236 ++++++++++----------
 1 file changed, 118 insertions(+), 118 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 3135409c2149..f66a382c95bd 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -14,7 +14,7 @@ cpus {
 
 		cpu0: cpu@0 {
 			compatible = "thead,c920", "riscv";
-			reg = <0>;
+			reg = <0x0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -50,7 +50,7 @@ cpu0_intc: interrupt-controller {
 
 		cpu1: cpu@1 {
 			compatible = "thead,c920", "riscv";
-			reg = <1>;
+			reg = <0x1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -86,7 +86,7 @@ cpu1_intc: interrupt-controller {
 
 		cpu2: cpu@2 {
 			compatible = "thead,c920", "riscv";
-			reg = <2>;
+			reg = <0x2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -122,7 +122,7 @@ cpu2_intc: interrupt-controller {
 
 		cpu3: cpu@3 {
 			compatible = "thead,c920", "riscv";
-			reg = <3>;
+			reg = <0x3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -158,7 +158,7 @@ cpu3_intc: interrupt-controller {
 
 		cpu4: cpu@4 {
 			compatible = "thead,c920", "riscv";
-			reg = <4>;
+			reg = <0x4>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -194,7 +194,7 @@ cpu4_intc: interrupt-controller {
 
 		cpu5: cpu@5 {
 			compatible = "thead,c920", "riscv";
-			reg = <5>;
+			reg = <0x5>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -230,7 +230,7 @@ cpu5_intc: interrupt-controller {
 
 		cpu6: cpu@6 {
 			compatible = "thead,c920", "riscv";
-			reg = <6>;
+			reg = <0x6>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -266,7 +266,7 @@ cpu6_intc: interrupt-controller {
 
 		cpu7: cpu@7 {
 			compatible = "thead,c920", "riscv";
-			reg = <7>;
+			reg = <0x7>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -302,7 +302,7 @@ cpu7_intc: interrupt-controller {
 
 		cpu8: cpu@8 {
 			compatible = "thead,c920", "riscv";
-			reg = <8>;
+			reg = <0x8>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -338,7 +338,7 @@ cpu8_intc: interrupt-controller {
 
 		cpu9: cpu@9 {
 			compatible = "thead,c920", "riscv";
-			reg = <9>;
+			reg = <0x9>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -372,9 +372,9 @@ cpu9_intc: interrupt-controller {
 			};
 		};
 
-		cpu10: cpu@10 {
+		cpu10: cpu@a {
 			compatible = "thead,c920", "riscv";
-			reg = <10>;
+			reg = <0xa>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -408,9 +408,9 @@ cpu10_intc: interrupt-controller {
 			};
 		};
 
-		cpu11: cpu@11 {
+		cpu11: cpu@b {
 			compatible = "thead,c920", "riscv";
-			reg = <11>;
+			reg = <0xb>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -444,9 +444,9 @@ cpu11_intc: interrupt-controller {
 			};
 		};
 
-		cpu12: cpu@12 {
+		cpu12: cpu@c {
 			compatible = "thead,c920", "riscv";
-			reg = <12>;
+			reg = <0xc>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -480,9 +480,9 @@ cpu12_intc: interrupt-controller {
 			};
 		};
 
-		cpu13: cpu@13 {
+		cpu13: cpu@d {
 			compatible = "thead,c920", "riscv";
-			reg = <13>;
+			reg = <0xd>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -516,9 +516,9 @@ cpu13_intc: interrupt-controller {
 			};
 		};
 
-		cpu14: cpu@14 {
+		cpu14: cpu@e {
 			compatible = "thead,c920", "riscv";
-			reg = <14>;
+			reg = <0xe>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -552,9 +552,9 @@ cpu14_intc: interrupt-controller {
 			};
 		};
 
-		cpu15: cpu@15 {
+		cpu15: cpu@f {
 			compatible = "thead,c920", "riscv";
-			reg = <15>;
+			reg = <0xf>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -588,9 +588,9 @@ cpu15_intc: interrupt-controller {
 			};
 		};
 
-		cpu16: cpu@16 {
+		cpu16: cpu@10 {
 			compatible = "thead,c920", "riscv";
-			reg = <16>;
+			reg = <0x10>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -624,9 +624,9 @@ cpu16_intc: interrupt-controller {
 			};
 		};
 
-		cpu17: cpu@17 {
+		cpu17: cpu@11 {
 			compatible = "thead,c920", "riscv";
-			reg = <17>;
+			reg = <0x11>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -660,9 +660,9 @@ cpu17_intc: interrupt-controller {
 			};
 		};
 
-		cpu18: cpu@18 {
+		cpu18: cpu@12 {
 			compatible = "thead,c920", "riscv";
-			reg = <18>;
+			reg = <0x12>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -696,9 +696,9 @@ cpu18_intc: interrupt-controller {
 			};
 		};
 
-		cpu19: cpu@19 {
+		cpu19: cpu@13 {
 			compatible = "thead,c920", "riscv";
-			reg = <19>;
+			reg = <0x13>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -732,9 +732,9 @@ cpu19_intc: interrupt-controller {
 			};
 		};
 
-		cpu20: cpu@20 {
+		cpu20: cpu@14 {
 			compatible = "thead,c920", "riscv";
-			reg = <20>;
+			reg = <0x14>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -768,9 +768,9 @@ cpu20_intc: interrupt-controller {
 			};
 		};
 
-		cpu21: cpu@21 {
+		cpu21: cpu@15 {
 			compatible = "thead,c920", "riscv";
-			reg = <21>;
+			reg = <0x15>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -804,9 +804,9 @@ cpu21_intc: interrupt-controller {
 			};
 		};
 
-		cpu22: cpu@22 {
+		cpu22: cpu@16 {
 			compatible = "thead,c920", "riscv";
-			reg = <22>;
+			reg = <0x16>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -840,9 +840,9 @@ cpu22_intc: interrupt-controller {
 			};
 		};
 
-		cpu23: cpu@23 {
+		cpu23: cpu@17 {
 			compatible = "thead,c920", "riscv";
-			reg = <23>;
+			reg = <0x17>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -876,9 +876,9 @@ cpu23_intc: interrupt-controller {
 			};
 		};
 
-		cpu24: cpu@24 {
+		cpu24: cpu@18 {
 			compatible = "thead,c920", "riscv";
-			reg = <24>;
+			reg = <0x18>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -912,9 +912,9 @@ cpu24_intc: interrupt-controller {
 			};
 		};
 
-		cpu25: cpu@25 {
+		cpu25: cpu@19 {
 			compatible = "thead,c920", "riscv";
-			reg = <25>;
+			reg = <0x19>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -948,9 +948,9 @@ cpu25_intc: interrupt-controller {
 			};
 		};
 
-		cpu26: cpu@26 {
+		cpu26: cpu@1a {
 			compatible = "thead,c920", "riscv";
-			reg = <26>;
+			reg = <0x1a>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -984,9 +984,9 @@ cpu26_intc: interrupt-controller {
 			};
 		};
 
-		cpu27: cpu@27 {
+		cpu27: cpu@1b {
 			compatible = "thead,c920", "riscv";
-			reg = <27>;
+			reg = <0x1b>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1020,9 +1020,9 @@ cpu27_intc: interrupt-controller {
 			};
 		};
 
-		cpu28: cpu@28 {
+		cpu28: cpu@1c {
 			compatible = "thead,c920", "riscv";
-			reg = <28>;
+			reg = <0x1c>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1056,9 +1056,9 @@ cpu28_intc: interrupt-controller {
 			};
 		};
 
-		cpu29: cpu@29 {
+		cpu29: cpu@1d {
 			compatible = "thead,c920", "riscv";
-			reg = <29>;
+			reg = <0x1d>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1092,9 +1092,9 @@ cpu29_intc: interrupt-controller {
 			};
 		};
 
-		cpu30: cpu@30 {
+		cpu30: cpu@1e {
 			compatible = "thead,c920", "riscv";
-			reg = <30>;
+			reg = <0x1e>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1128,9 +1128,9 @@ cpu30_intc: interrupt-controller {
 			};
 		};
 
-		cpu31: cpu@31 {
+		cpu31: cpu@1f {
 			compatible = "thead,c920", "riscv";
-			reg = <31>;
+			reg = <0x1f>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1164,9 +1164,9 @@ cpu31_intc: interrupt-controller {
 			};
 		};
 
-		cpu32: cpu@32 {
+		cpu32: cpu@20 {
 			compatible = "thead,c920", "riscv";
-			reg = <32>;
+			reg = <0x20>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1200,9 +1200,9 @@ cpu32_intc: interrupt-controller {
 			};
 		};
 
-		cpu33: cpu@33 {
+		cpu33: cpu@21 {
 			compatible = "thead,c920", "riscv";
-			reg = <33>;
+			reg = <0x21>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1236,9 +1236,9 @@ cpu33_intc: interrupt-controller {
 			};
 		};
 
-		cpu34: cpu@34 {
+		cpu34: cpu@22 {
 			compatible = "thead,c920", "riscv";
-			reg = <34>;
+			reg = <0x22>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1272,9 +1272,9 @@ cpu34_intc: interrupt-controller {
 			};
 		};
 
-		cpu35: cpu@35 {
+		cpu35: cpu@23 {
 			compatible = "thead,c920", "riscv";
-			reg = <35>;
+			reg = <0x23>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1308,9 +1308,9 @@ cpu35_intc: interrupt-controller {
 			};
 		};
 
-		cpu36: cpu@36 {
+		cpu36: cpu@24 {
 			compatible = "thead,c920", "riscv";
-			reg = <36>;
+			reg = <0x24>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1344,9 +1344,9 @@ cpu36_intc: interrupt-controller {
 			};
 		};
 
-		cpu37: cpu@37 {
+		cpu37: cpu@25 {
 			compatible = "thead,c920", "riscv";
-			reg = <37>;
+			reg = <0x25>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1380,9 +1380,9 @@ cpu37_intc: interrupt-controller {
 			};
 		};
 
-		cpu38: cpu@38 {
+		cpu38: cpu@26 {
 			compatible = "thead,c920", "riscv";
-			reg = <38>;
+			reg = <0x26>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1416,9 +1416,9 @@ cpu38_intc: interrupt-controller {
 			};
 		};
 
-		cpu39: cpu@39 {
+		cpu39: cpu@27 {
 			compatible = "thead,c920", "riscv";
-			reg = <39>;
+			reg = <0x27>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1452,9 +1452,9 @@ cpu39_intc: interrupt-controller {
 			};
 		};
 
-		cpu40: cpu@40 {
+		cpu40: cpu@28 {
 			compatible = "thead,c920", "riscv";
-			reg = <40>;
+			reg = <0x28>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1488,9 +1488,9 @@ cpu40_intc: interrupt-controller {
 			};
 		};
 
-		cpu41: cpu@41 {
+		cpu41: cpu@29 {
 			compatible = "thead,c920", "riscv";
-			reg = <41>;
+			reg = <0x29>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1524,9 +1524,9 @@ cpu41_intc: interrupt-controller {
 			};
 		};
 
-		cpu42: cpu@42 {
+		cpu42: cpu@2a {
 			compatible = "thead,c920", "riscv";
-			reg = <42>;
+			reg = <0x2a>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1560,9 +1560,9 @@ cpu42_intc: interrupt-controller {
 			};
 		};
 
-		cpu43: cpu@43 {
+		cpu43: cpu@2b {
 			compatible = "thead,c920", "riscv";
-			reg = <43>;
+			reg = <0x2b>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1596,9 +1596,9 @@ cpu43_intc: interrupt-controller {
 			};
 		};
 
-		cpu44: cpu@44 {
+		cpu44: cpu@2c {
 			compatible = "thead,c920", "riscv";
-			reg = <44>;
+			reg = <0x2c>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1632,9 +1632,9 @@ cpu44_intc: interrupt-controller {
 			};
 		};
 
-		cpu45: cpu@45 {
+		cpu45: cpu@2d {
 			compatible = "thead,c920", "riscv";
-			reg = <45>;
+			reg = <0x2d>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1668,9 +1668,9 @@ cpu45_intc: interrupt-controller {
 			};
 		};
 
-		cpu46: cpu@46 {
+		cpu46: cpu@2e {
 			compatible = "thead,c920", "riscv";
-			reg = <46>;
+			reg = <0x2e>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1704,9 +1704,9 @@ cpu46_intc: interrupt-controller {
 			};
 		};
 
-		cpu47: cpu@47 {
+		cpu47: cpu@2f {
 			compatible = "thead,c920", "riscv";
-			reg = <47>;
+			reg = <0x2f>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1740,9 +1740,9 @@ cpu47_intc: interrupt-controller {
 			};
 		};
 
-		cpu48: cpu@48 {
+		cpu48: cpu@30 {
 			compatible = "thead,c920", "riscv";
-			reg = <48>;
+			reg = <0x30>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1776,9 +1776,9 @@ cpu48_intc: interrupt-controller {
 			};
 		};
 
-		cpu49: cpu@49 {
+		cpu49: cpu@31 {
 			compatible = "thead,c920", "riscv";
-			reg = <49>;
+			reg = <0x31>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1812,9 +1812,9 @@ cpu49_intc: interrupt-controller {
 			};
 		};
 
-		cpu50: cpu@50 {
+		cpu50: cpu@32 {
 			compatible = "thead,c920", "riscv";
-			reg = <50>;
+			reg = <0x32>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1848,9 +1848,9 @@ cpu50_intc: interrupt-controller {
 			};
 		};
 
-		cpu51: cpu@51 {
+		cpu51: cpu@33 {
 			compatible = "thead,c920", "riscv";
-			reg = <51>;
+			reg = <0x33>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1884,9 +1884,9 @@ cpu51_intc: interrupt-controller {
 			};
 		};
 
-		cpu52: cpu@52 {
+		cpu52: cpu@34 {
 			compatible = "thead,c920", "riscv";
-			reg = <52>;
+			reg = <0x34>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1920,9 +1920,9 @@ cpu52_intc: interrupt-controller {
 			};
 		};
 
-		cpu53: cpu@53 {
+		cpu53: cpu@35 {
 			compatible = "thead,c920", "riscv";
-			reg = <53>;
+			reg = <0x35>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1956,9 +1956,9 @@ cpu53_intc: interrupt-controller {
 			};
 		};
 
-		cpu54: cpu@54 {
+		cpu54: cpu@36 {
 			compatible = "thead,c920", "riscv";
-			reg = <54>;
+			reg = <0x36>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1992,9 +1992,9 @@ cpu54_intc: interrupt-controller {
 			};
 		};
 
-		cpu55: cpu@55 {
+		cpu55: cpu@37 {
 			compatible = "thead,c920", "riscv";
-			reg = <55>;
+			reg = <0x37>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -2028,9 +2028,9 @@ cpu55_intc: interrupt-controller {
 			};
 		};
 
-		cpu56: cpu@56 {
+		cpu56: cpu@38 {
 			compatible = "thead,c920", "riscv";
-			reg = <56>;
+			reg = <0x38>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -2064,9 +2064,9 @@ cpu56_intc: interrupt-controller {
 			};
 		};
 
-		cpu57: cpu@57 {
+		cpu57: cpu@39 {
 			compatible = "thead,c920", "riscv";
-			reg = <57>;
+			reg = <0x39>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -2100,9 +2100,9 @@ cpu57_intc: interrupt-controller {
 			};
 		};
 
-		cpu58: cpu@58 {
+		cpu58: cpu@3a {
 			compatible = "thead,c920", "riscv";
-			reg = <58>;
+			reg = <0x3a>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -2136,9 +2136,9 @@ cpu58_intc: interrupt-controller {
 			};
 		};
 
-		cpu59: cpu@59 {
+		cpu59: cpu@3b {
 			compatible = "thead,c920", "riscv";
-			reg = <59>;
+			reg = <0x3b>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -2172,9 +2172,9 @@ cpu59_intc: interrupt-controller {
 			};
 		};
 
-		cpu60: cpu@60 {
+		cpu60: cpu@3c {
 			compatible = "thead,c920", "riscv";
-			reg = <60>;
+			reg = <0x3c>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -2208,9 +2208,9 @@ cpu60_intc: interrupt-controller {
 			};
 		};
 
-		cpu61: cpu@61 {
+		cpu61: cpu@3d {
 			compatible = "thead,c920", "riscv";
-			reg = <61>;
+			reg = <0x3d>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -2244,9 +2244,9 @@ cpu61_intc: interrupt-controller {
 			};
 		};
 
-		cpu62: cpu@62 {
+		cpu62: cpu@3e {
 			compatible = "thead,c920", "riscv";
-			reg = <62>;
+			reg = <0x3e>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -2280,9 +2280,9 @@ cpu62_intc: interrupt-controller {
 			};
 		};
 
-		cpu63: cpu@63 {
+		cpu63: cpu@3f {
 			compatible = "thead,c920", "riscv";
-			reg = <63>;
+			reg = <0x3f>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
-- 
2.54.0

