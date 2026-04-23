Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1427340273
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 16:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776963047; cv=none; b=s8UYRQHjx15Xr69Tr4Bl+lJyFqoyLKO9MhvmskNfTn+BFt6g13w7wOZHKuLtQeonBgOKJzFcqJS1kNaa6Nxb2I0tACFxRdUegP0zS/zqyQnxiA2R7y2szJ3Jt2uHE0u9J0KSOhIuM3qpHK8ku5Hksewo7mIODOT9J6tBZSfbSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776963047; c=relaxed/simple;
	bh=rS4hUoC/4HYht4I0BMRV5/JcGv4WplCHyNyNQb8pSqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NhwHXY7WyyCu6uqweY0cM26on8ZpxbWoy8UXZN786ZlR7Yv/HMZmBgW7nZyYlkuyWqSqPZq++jdkkxyxiHBGIpalUSYYtIQiLJAm1/CxiUCL084IQAhNNInGwb2vIySQbmQmxYFBlcWxF/niFbyrVtNeVIFs3+40o74JkiEtvRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=CL5aZxjB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="CL5aZxjB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d734223e4so4762791f8f.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1776963044; x=1777567844; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2EeSdYfWoTiuD63VKetL3V9sK1DuMijL8TRltuUAE/E=;
        b=CL5aZxjBzuPYhKSXsiBispFbtuzQHLWcYj07yGKOJ2IH0ZeO3JAVf2wKDCOrtH1oQy
         +Oc1tX+7qWUvnrEBsKCkGDfhLMCPOL4Tq5Sl3HVIBEs3VODLBaSquDsASvKNFr0TUNzf
         N+KcXf1yrWNXYw6NcDAI2bKLZIj+G9EuSBMgihO4Ea4CkPa30FS/XTYRi8/9yQT0en1M
         4v/ukH3DL1ILWSOC9lujRYjcFxNuENvvoYi2b0YLs3Ayz/dbIKYH9j3k4qc0R9T4d4j0
         RR6c+AnpzGkVWU8f/+kv+0NIx32oZcYQLfh5aBtthYAz/0qfXbejP6Gjz1JKnBWOHXH9
         9oKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776963044; x=1777567844;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EeSdYfWoTiuD63VKetL3V9sK1DuMijL8TRltuUAE/E=;
        b=jJ4NNFAoPgnBOQuK7VxqGy3XYRZecx1Udihy8U8qO7nu3ty+w1lzQEY8SNmRmAqFB6
         Sf4SgdkMN2wB0VR73UpypNKEAey6cavKMIJigu2OjQA08P0UkpzWRkZoDmF1PrWqVU2x
         vs286spWlZszmZnXjYeBMws+9I+3q64uWe2jRlHHEtYIsmBge73HMQcbMrh2rtS6KJxX
         FUOagcgPv0ShYFB9WqNEpj05jVjMLR6D2JS5435vk5eYM4jfHLslCZaGUaPXpAbizSZr
         RcduNPdlVstagLrcpDAkyExnnXcAFs4fmncWIpgmifxIsUXJ9vPf/QjCBo+HVtGYKatk
         wTrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TWrY3lwEDwEa784KiQW2j4UpNjc505aeEpb+o+CgZh7dhQDGMmUARhESK8/lLYZZgJJ0CgmDtDKsS@vger.kernel.org
X-Gm-Message-State: AOJu0YxB+wVSFjz/u34o8iyOaInNVONT+uGXLL8xBs1ssxHdPrjCNWtk
	t9hgy8QX9sdB83V9uvdLLOly7VCRqQAaDk7hfD2xf+IU5f3qiuvUi6s1ud18+KiLy+4=
X-Gm-Gg: AeBDietCZqO1bzyzr1xJrXVw5J1Oj1xzMmJFOctoO9gYYI4z6aicpvV9QxqRgndOKGU
	0RWOmXKVzkgyOf1oQIeOQLuQmZti5b4o1HCIOnOX1d13CYvnCi827jV25qHoUydUJeuPb4Yk6Xw
	GFVPtC4pfTA/6jfBKNzRyouOtv499UGtItwr8ssp0pFw15gbRQYb5DLOWWwiNt74UZBCMnY0bz2
	zuD+p3H0Fqb5fpkpb9tYZDkAlsczKGeWdPgXrEGXebMdtdoVj/1088BUBVKbpEj6xOdilLJcxus
	5uOKanH3W3ikdZPu4cuIRybrDnvAgZOTeSyD42W3BAYp3mtWPx+Oyr6t3fDlJcljd5BzQFjhEke
	01Wo3pzoBnY9D8t6/0oShdCmzoTjby8OmT7PE6tInvuAAC/9sV+6+TF/uGbGDMdF3jVgwPhUXuQ
	r5SOj6EpvfEh6NTkwhO8WKBSr3KQMUI4A3TSg86AzzHqxL4dHVK7eNkR+X+U37AO8PkAyJvzO+Y
	nn6NkduKfhDeZHIjP63pvVZrkn3dtatGg==
X-Received: by 2002:a05:6000:208a:b0:43e:531f:720c with SMTP id ffacd0b85a97d-43fe407383cmr42200378f8f.11.1776963043960;
        Thu, 23 Apr 2026 09:50:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:ecb5:414:3f67:410b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46471sm52418423f8f.28.2026.04.23.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 09:50:43 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 23 Apr 2026 17:50:07 +0100
Subject: [PATCH] arm64: dts: qcom: sm8550: add SDHC4 controller node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-sm8550-sdhc4-support-v1-1-93fd81fea5d9@imd-tec.com>
X-B4-Tracking: v=1; b=H4sIAL5N6mkC/yXMQQqEMAxA0atI1gZqbUW8irjQGscMqKWxw4B4d
 6su3+L/A4QCk0CTHRDox8LbmlDkGbi5Xz+EPCaDVrpSRpcoS22tQhlnZ1Ci91vYsbT1MOnKOGU
 IUuoDTfx/tm33WuLwJbffLzjPCzpZMpl4AAAA
X-Change-ID: 20260423-sm8550-sdhc4-support-358bf264c04e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ram Boukobza <ram@imd-tec.com>, 
 Tendai Makumire <tendai.makumire@imd-tec.com>, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Add the SDC4 SDHCI controller node for the SM8550 SoC.

SMMU stream ID 0x80 was sourced from the UEFI bootloader IORT tables,
as SDCC stream IDs are not documented in the register reference manual.
Unlike SDC2, the data path is routed via aggre1_noc, matching
MASTER_SDCC_4 in drivers/interconnect/qcom/sm8550.c.

Tested on the IMDT QCS8550 SBC at high-speed (HS) mode. UHS modes were
masked out as they failed to initialise; the root cause has not yet
been determined. This board is not currently supported in-tree.

Co-developed-by: Tendai Makumire <tendai.makumire@imd-tec.com>
Signed-off-by: Tendai Makumire <tendai.makumire@imd-tec.com>
Signed-off-by: William Bright <william.bright@imd-tec.com>
Tested-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..5abbe519781b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3280,6 +3280,60 @@ opp-202000000 {
 			};
 		};
 
+		sdhc_4: mmc@8844000 {
+			compatible = "qcom,sm8550-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08844000 0 0x1000>;
+
+			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC4_AHB_CLK>,
+				 <&gcc GCC_SDCC4_APPS_CLK>,
+				 <&bi_tcxo_div2>;
+			clock-names = "iface", "core", "xo";
+			iommus = <&apps_smmu 0x80 0>;
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc4_opp_table>;
+
+			interconnects = <&aggre1_noc MASTER_SDCC_4 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr", "cpu-sdhc";
+			bus-width = <4>;
+			max-sd-hs-hz = <37500000>;
+			dma-coherent;
+
+			status = "disabled";
+
+			sdhc4_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmhpd_opp_min_svs>;
+				};
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		iris: video-codec@aa00000 {
 			compatible = "qcom,sm8550-iris";
 

---
base-commit: 4f5b4b748ac75683d61c304ee3ee0db235e8f312
change-id: 20260423-sm8550-sdhc4-support-358bf264c04e

Best regards,
--  
William Bright <william.bright@imd-tec.com>

