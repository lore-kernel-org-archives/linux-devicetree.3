Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052003921E4
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273427; cv=none; b=J2ih5YwVAhq0/KQBcHM/ntOmEZOtCAxvyF+Q6lyLKRk4KgXqBC6TVmfb3wfA6ge1MZEI80i4M9yn5CLWuQGkxhRoBZN1L+tBwNpcDrcI+OaXbtpDlSNXdj83xuaniNUyLM/xB3gpekTRIT++Ee6O3dM+Ai+CKAwi6080QCcXea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273427; c=relaxed/simple;
	bh=W6txuQCEUCrc1UvkuuAflUC4e6TGqcThPpWviWV42lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lg/4hFC4MySNSU6SbojGWpFakghp43X1pTLBmHRuz07Gjxld0sModRi65PyYpm7tjTW0LM39yVED3lQq5NXZCpc/kgVOs5QAyaolM0CXFza/98mJN6fT9APe5rUIG/h0bkXONudNqO9uZDqMSuPCifibBAxQZWxdQYaZwhdaImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmgOdeC8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmgOdeC8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so7627049f8f.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777273423; x=1777878223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90gzvuDE2Ybs7D8y5HYsbaHjQhyiyd4TKaAXDPG/a+8=;
        b=EmgOdeC8BKwA1JfMJS3UjuMbs5viwRI1nGL8PirOUkc843QnPBL9moM2P5QqUXTjJ7
         tuck1iorPx5Rhnd/fhzsbb+OOUiAzHgBWx/VG2FpjwNtXKCuWAxGuuxRyoSLKnEyDGi9
         Z9bgi7dkKYEAo74MbxQ+mWKfgOZ2BtlVK9iaTe07Pw8gxoJ+M+pdMXY88y1vSFeIsBDC
         4kaiY7oQJbiDPCl5ov/C671FYHo9zI+iNN3afKsqNA1Z04/bchnxwTPHj9ZwoD6tt9Oj
         ZPMrOScOYqo6qzwmT1RsDcMITApfqgNbMAlq8fTaPQCC5+a8rXMA6w7LKtoh9QK5R8KU
         Cn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273423; x=1777878223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90gzvuDE2Ybs7D8y5HYsbaHjQhyiyd4TKaAXDPG/a+8=;
        b=MZgsTbpqqr1vJsyR4ALbIm3xk5hBJEgVAhwfLG9dJIqMi347VYLMReO/mtOEBUdNH+
         g3YWpn88wUPirBqRgzo1PAJvDNNJ+z051mQtaPClJe6YGbLFvi9F5HIe3XQYkQCLoMbf
         DBSwGJfFz6gq3blfKG1G+70qpUub1MpRK8FHAOXWrnvUgBJYJ5pZUProQnBDRmTYq/Xr
         GAj7+Jjc8Ml3gcljsxWyt2HhhmA9zVClBK5xBIl21s8zWRercTWESW6B7l9jDNNq++o4
         KAJqKtOK3kRnjHAKT2AS4fPLC/1VQxGX0t5/DGvvi9tBalOyPMOGDcdOyzbk/4tqemxh
         /RwA==
X-Forwarded-Encrypted: i=1; AFNElJ8lTqz1uPxFxYP/dvO29Ovv5jz0tzEp8r5YQbt0ink4igzvC1Abd4yviQO/1AS2jrdnqOsncXW893Xo@vger.kernel.org
X-Gm-Message-State: AOJu0YxQsAgFH4JM3RoaOcLrkP2NpTzjmUQZ+0ecRTJwkWLWnhIC62wd
	1m8SWwidgc4xgjRAPI6Gd91a/m5vtI+vncQk0W3NbC/oSBkKF0aGXJBl
X-Gm-Gg: AeBDiesQQHTwJXfIfst2tZLSyBiM1PQrlXEjWC3CkXjsVLhl6r24Qzq6lP7daonTgax
	oEnDmgigQwkKzX7PGvzxaUEU/j7A7SDyeYoQxTyCxcdEu18cmG4tf9oT9arIIsOLQcwpzGMfGnR
	OAZAb/vCNmYuqlLAdX6DOosu+YGcKMWcOF5KWRwl7zexIoVDFQ8ts+efNhGNKrFENwksKPY3HYY
	Za8XZZxHauHhiA3/kCwXT7hrCrdcg8lzqSNVcss6ld4NxJuxPTGxVWbS+9RBRndhmPMScy7IDWE
	Q4N/UOT2kS2RbmkF4Z6dl42zZDZeOXDi91Ywf2buRdZl7FJiqWpbOkPqSqmWLFloocBBf7GxV5F
	CgSf1Q9pAKN+fdyWWjn/66W3SQkBTHljCVyCM9xzBGZ+/keHs/RCqMAj1vUVcLVr5H7y5pwF3ao
	b8+c+kAQYCVRTEQWb2Vx1TEfg=
X-Received: by 2002:a05:6000:2c0e:b0:441:377f:82a7 with SMTP id ffacd0b85a97d-441377f82c8mr14271384f8f.32.1777273423028;
        Mon, 27 Apr 2026 00:03:43 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm84245734f8f.24.2026.04.27.00.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:03:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/7] ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON device-tree nodes
Date: Mon, 27 Apr 2026 10:03:10 +0300
Message-ID: <20260427070312.81679-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427070312.81679-1-clamor95@gmail.com>
References: <20260427070312.81679-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add EMC OPP tables and interconnect paths that will be used for dynamic
memory bandwidth scaling based on memory utilization statistics.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 164 ++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |   9 +
 2 files changed, 173 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi

diff --git a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
new file mode 100644
index 000000000000..b40a1c24abab
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	emc_icc_dvfs_opp_table: opp-table-emc {
+		compatible = "operating-points-v2";
+
+		opp-12750000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-20400000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-40800000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-68000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-102000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-204000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x000F>;
+			opp-suspend;
+		};
+
+		opp-312000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <312000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-408000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		/*
+		 * T40X can work with 1050mV for 528MHz but T40T which is
+		 * in the same group as T40X requires 1100mV. If there will
+		 * be enough data that T40T can work reliably with 1050mV
+		 * for 528MHz then voltage for 528MHz opp can be lowered.
+		 * T40S should remain with 1100mV for 528MHz opp.
+		 */
+		opp-528000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-624000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <624000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-792000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-900000000-1200 {
+			opp-microvolt = <1200000 1200000 1390000>;
+			opp-hz = /bits/ 64 <900000000>;
+			opp-supported-hw = <0x000E>;
+		};
+	};
+
+	emc_bw_dfs_opp_table: opp-table-actmon {
+		compatible = "operating-points-v2";
+
+		opp-12750000 {
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <204000>;
+		};
+
+		opp-20400000 {
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <326400>;
+		};
+
+		opp-40800000 {
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <652800>;
+		};
+
+		opp-68000000 {
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <1088000>;
+		};
+
+		opp-102000000 {
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <1632000>;
+		};
+
+		opp-204000000 {
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <3264000>;
+			opp-suspend;
+		};
+
+		opp-312000000 {
+			opp-hz = /bits/ 64 <312000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <4992000>;
+		};
+
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <6528000>;
+		};
+
+		opp-528000000 {
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <8448000>;
+		};
+
+		opp-624000000 {
+			opp-hz = /bits/ 64 <624000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <9984000>;
+		};
+
+		opp-792000000 {
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <12672000>;
+		};
+
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-supported-hw = <0x000E>;
+			opp-peak-kBps = <14400000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 7e8f90d33935..6c2b79b35938 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/soc/tegra-pmc.h>
 #include <dt-bindings/thermal/tegra114-soctherm.h>
 
+#include "tegra114-peripherals-opp.dtsi"
+
 / {
 	compatible = "nvidia,tegra114";
 	interrupt-parent = <&lic>;
@@ -323,6 +325,9 @@ actmon: actmon@6000c800 {
 		clock-names = "actmon", "emc";
 		resets = <&tegra_car TEGRA114_CLK_ACTMON>;
 		reset-names = "actmon";
+		operating-points-v2 = <&emc_bw_dfs_opp_table>;
+		interconnects = <&mc TEGRA114_MC_MPCORER &emc>;
+		interconnect-names = "cpu-read";
 		#cooling-cells = <2>;
 	};
 
@@ -655,6 +660,7 @@ mc: memory-controller@70019000 {
 
 		#reset-cells = <1>;
 		#iommu-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
@@ -665,6 +671,9 @@ emc: external-memory-controller@7001b000 {
 		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
+
+		#interconnect-cells = <0>;
 	};
 
 	hda@70030000 {
-- 
2.51.0

