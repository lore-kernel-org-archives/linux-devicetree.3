Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DC23DC871
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306581; cv=none; b=DWxF1oJ6TlKfYvcmXD9CBTgtdRPKIN3YljbCbloWY2Ih2z9OLM1PTQjJ0QrX/7V41TsPJEkwtpQhX+mto3HVzUO2Ri1YPFhzfqaPBTrOnS+amFbHkTxc8qzH1vbK+04dSFhZmXOMNnNnxLDwsIxCvqUm88eURYGF1Pcz9LlubbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306581; c=relaxed/simple;
	bh=d3z1RpIIztzftotib4BZlQb2dA86jL5CK9UV2NYGIsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhruJswtSSeE40FZ7gnt1MrXNluO72VFb/gnmJ+MnTjqbpsZT+5NZirqCqE+4PsN/bt5QUGLWJME5u3PbTuVj8qiCWfNu+bTgS2I+/hYZSWNP6AiW2m19pdzMMarJmbzY/J7L/MCb68u+sEpOrlKZ/zxQ0ludeuTpTvfDbCFuiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2BhA7Bo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6ZOcBzx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2BhA7Bo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6ZOcBzx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679IA19k3748669
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 20:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lndsmwfidtx9uHQGQyzAm/dtqIU5v3GB+9Tzq4qCPV8=; b=b2BhA7BojyLDIJVN
	px3ZmNZCSEx9YftCCpYfJyzG4utXmHC5dZQh5AX/vu+0ho02lrDQL+MlIQgOyCeG
	9qTWaWcH5IjPbDTf3dtb2RcYmqEBxEnfjxZLUrQiqHI8wu6kKLMdsqViRp051bS2
	G2koxmSY2zj4UqbQxySKKOxElVEAmvM3UYGZiFsaUorfuhrLrES4dtlHkjjvepaF
	0Kh6sBwW8LpkQphBRp7NUJG9GISBtvzvdKVHzP5zZ9aO0QXm60WRcONMDwDlEyJ/
	9cnZwyn6wM3LABsN6dR4Sn4JMyMiNSMNuww3xCLv+uSG9x8BRkUb907LEC8UaQ2j
	fgc6NA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf7bjfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 20:16:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so18348761cf.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306578; x=1786911378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lndsmwfidtx9uHQGQyzAm/dtqIU5v3GB+9Tzq4qCPV8=;
        b=V6ZOcBzxNVz2FusASj9W77kuWvgnQdN4i9eE3QaNHOxe9NseAujAtBTnObNm4AyeCQ
         ryGh3Fija4ElLdUn7WW83aPgDE8UYUMakzGE9scyvDEbcwbgd4zoIPaCHNBSX74pG777
         bWg1YW08B0899nZIa1OLgQMWHrklbMGQ7z8IMst/S/Tbi/N29em7XTFw2UB3IrqLvdzO
         K/jncw+IZ5ID69xRt6iXvbds9yV4tUpK74+WVSa97YEppvLk0jm2TyeD2eHXJGo1W3iC
         +Ivi1rcfjL42qX12eBjZ/+Zhp0uNwmWb3tMjCF1DrSTD+K3ep6sR4/sZgRlVBkz/sOLb
         A22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306578; x=1786911378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lndsmwfidtx9uHQGQyzAm/dtqIU5v3GB+9Tzq4qCPV8=;
        b=kgsP20VK2Zdxr5VISTtGZdRnLLpheL+VBKgkuraSuZYjf9f5504sSbMEzf7tmguDBr
         2+v9SF8huUpq2Z9zvhWPNkO3qhCIJize0WtJjGT1Q6BbmA+vlZfhvfiqnv+PqnIVbIwH
         pjwSMmg94Oe8fIDh7rxNeeonBFc4JxpG0NBDcTIDF2rlrGvHhKOjv1wd1ag56+YrXFSg
         1D+S+yUNFuNdi14eRHyNhInvQVY73++54+Yuaxsy6kscL0nqPUxRmPje9jMSy2KSqX7H
         7ShuiMSI9rHGFbZ1vjwMsiVYzcntVcm3GIBQlCmKRnrLVFxwFPU0+m2PnpL/QaV1nbom
         YbxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHvCUVGg+uRqYBc5OZpWP0EfJMkqlHpCE/+Ng+zf4HCu84X0urSLyYH8z3oV24u9uXlYk+P4jMe+Bq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5lX5vipefX0aaQfe0oY7mKrNup6UDvLeuvkDNWpdn/s8K62VM
	lPwRMBJx+oXeALl5KkTpP3dWiIOf6wcqoQ4tqXPVepp931yYTazsawHud1iQvJFqKb59Cnpc/rq
	9YcXW8vO7MnnrbpMgrYE14rEqG+tRcMsYwzq0kB3hOxtE6FYMd3KuZoywQ+CrAcbb
X-Gm-Gg: AR+sD10ccaASMvD3/7YiYqsnzHeS0JvtG9PnYSjqRP7sMJINmSKFQDis4myBoDD2uOY
	A+IF5e17AfLijC9Bpc9IhydLB+zz4Bfb1jn8B1imRpa4v0kflYB0vHFACWIAHHGN4hdIMDbJbvB
	bVBrffQwB3VJ4SW7ZsOJr3aXW3P/PFp+D+lACx7zdPg0JIGDOCCstAYbWsXBpgH1ZojiRxBzlQ6
	+1CAzYaMMvwDAv6652VYzRV66rf+/3sUc6re8GIDKtXYpsxqgZvcWEIWqb/f9wFJt+mMbS5Q87a
	B8igREKd1k9l9zSt+HbrZrObpmA/q9VmlChIhNzc8kMmCb3LfxR/2ZHzPyO97zanjGlky678F10
	8dEwqq8nmwnvgf1c/D8Ffnp+EqT31o6/prv+do7bzQOZfUYIFYavsubf05o1DIIeIBuuqDqGL55
	tF3gpzHxCjk+Oe7g==
X-Received: by 2002:a05:622a:5889:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-52ce5faa390mr418012361cf.11.1786306578150;
        Sun, 09 Aug 2026 13:16:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5889:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-52ce5faa390mr418011841cf.11.1786306577703;
        Sun, 09 Aug 2026 13:16:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:51 +0300
Subject: [PATCH 12/12] ARM: dts: qcom: msm8974: add the IOMMUs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-12-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3876;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=d3z1RpIIztzftotib4BZlQb2dA86jL5CK9UV2NYGIsA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/vddgoDzEMAW43xRxwUMrvR2gEnXk7MPZLF
 iM00Re+zKKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7wAKCRCLPIo+Aiko
 1Vh8B/9UwFNa5oRKlBFbtHGLftufbQjd3wp6vkR9tLBIAyaiOSwB1uccTgLwitwP+qgVzM8mK1s
 K+HBJFly4IR07lUBgq3pKbSaOsC7RyF5Xi91+irfPW+V6FyWC1EESUL4ri7Ew4KOwgCa1B3sqRu
 OSpGvhxS7wdd6g/0dyG1ARtH4lba4OIFoOMnBw2avRmzJiW7Lt4MxcMkYmKKtEp8oE/dcGNieAS
 OwAyTfIJTa2y66WDwkBUgPhzL/YdutUu4+5RcpbGwHxmTESoXdewk58pmJGo4PU8eo3wF062ffR
 sjctDaTHEwBONx4SZutIkpYkYK670J62/U58OeXDiKoYlinR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfXzjhz20V4GwYp
 DViIYuYGPG4cBbWFHpAI11AF5kIsLmFBVJYi0a8wCu0nfeD5iI25ma4725IrbKiMz5rT6C4OVeD
 8tFmE6eFTpnqR43eGOKVWlYifmWe5TY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX6sF0ZP7oECN1
 BPdznpdzD/W57f2wjMI6PlfuOKpm5SawPNhn+bpso2dl5bY+XW4rWHHH6TP8+R92LiY3YTdS+CW
 r+kaxckI1AbgXr/fGNosOgs2Z89WfrCQRtcI6kedZKLaEGhTaH6akQD4U4To/C3IKImaGxPuR14
 vnmiRgGorogX0O2Iq/g2mwwBNuhNMSye67YZlOYk+gJP26IEXHRnkh39TiTE1LZUaILM0ur8X/B
 zbPIMpK5m5md/KSLymHyQK1rut8egrNAfz2S0VXQq1MeigxXb9iSAGFdaxDlkfNFzP7fXoB/aBc
 S9QuPRYM8Oe2ipX/U1GrjpeGgYcjJcqU0ygmHRdLtxcCCq1OUdMqkay5i42d1vngHc8CP4IzjQe
 9EgprxV6m7WYrAeUzLUw+ErE7SO9KTvLzPWn+dGtZnTEbBm+BFsGxMLlE03/TR7sTJtMbr5kuDR
 ExbkYNFrnIP6bFN/lJg==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a78e012 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TYXsMWFz8_iR-PVXkd8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8KXBw1BFmULT28er8zSroyspY7k9V9rw
X-Proofpoint-GUID: 8KXBw1BFmULT28er8zSroyspY7k9V9rw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183

Since the switch to DRM_GPUVM the drm/msm driver can't work without the
IOMMU, breaking display and GPU support on MSM8974 (and MSM8226).

Describe the IOMMU instances and point the GPU and the MDP at theirs.
The nodes follow the MSM8916 convention: ranges points at the context
bank array (base + 0x8000) so that context node offsets equal the
context bank indices.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 85 +++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 06c0af0aa317..ac3058995d49 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -1958,6 +1958,8 @@ mdp: display-controller@fd900000 {
 				interconnects = <&mmssnoc MNOC_MAS_MDP_PORT0 &bimc BIMC_SLV_EBI_CH0>;
 				interconnect-names = "mdp0-mem";
 
+				iommus = <&mdp_iommu 0>;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -2125,6 +2127,28 @@ mdss_dsi1_phy: phy@fd923000 {
 			};
 		};
 
+		mdp_iommu: iommu@fd928000 {
+			compatible = "qcom,msm8974-mdp-iommu";
+			reg = <0xfd928000 0x2600>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			ranges = <0 0xfd930000 0x1000>;
+
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_AXI_CLK>;
+			clock-names = "iface", "bus";
+			power-domains = <&mmcc MDSS_GDSC>;
+			qcom,iommu-secure-id = <1>;
+
+			/* MDP_0 */
+			iommu-ctx@0 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		cci: cci@fda0c000 {
 			compatible = "qcom,msm8974-cci";
 			#address-cells = <1>;
@@ -2180,7 +2204,7 @@ gpu: gpu@fdb00000 {
 					<&ocmemnoc OCMEM_VNOC_MAS_GFX3D &ocmemnoc OCMEM_SLV_OCMEM>;
 			interconnect-names = "gfx-mem", "ocmem";
 
-			// iommus = <&gpu_iommu 0>;
+			iommus = <&gpu_iommu 0>;
 
 			status = "disabled";
 
@@ -2201,6 +2225,65 @@ opp-27000000 {
 			};
 		};
 
+		gpu_iommu: iommu@fdb10000 {
+			compatible = "qcom,msm8974-gpu-iommu";
+			reg = <0xfdb10000 0x2600>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			ranges = <0 0xfdb18000 0x2000>;
+
+			clocks = <&mmcc OXILICX_AHB_CLK>,
+				 <&mmcc OXILICX_AXI_CLK>,
+				 <&mmcc OXILI_GFX3D_CLK>;
+			clock-names = "iface", "bus", "tbu";
+			power-domains = <&mmcc OXILICX_GDSC>;
+
+			/* GFX3D_USER */
+			iommu-ctx@0 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* GFX3D_PRIV */
+			iommu-ctx@1000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x1000 0x1000>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		venus_iommu: iommu@fdc84000 {
+			compatible = "qcom,msm8974-venus-iommu";
+			reg = <0xfdc84000 0x2600>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			ranges = <0 0xfdc8c000 0x3000>;
+
+			clocks = <&mmcc VENUS0_AHB_CLK>,
+				 <&mmcc VENUS0_AXI_CLK>,
+				 <&mmcc VENUS0_VCODEC0_CLK>;
+			clock-names = "iface", "bus", "tbu";
+			power-domains = <&mmcc VENUS0_GDSC>;
+			qcom,iommu-secure-id = <0>;
+
+			/* VENUS_NS */
+			iommu-ctx@0 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* VENUS_FW */
+			iommu-ctx@2000 {
+				compatible = "qcom,msm-iommu-v1-sec";
+				reg = <0x2000 0x1000>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		sram@fdd00000 {
 			compatible = "qcom,msm8974-ocmem";
 			reg = <0xfdd00000 0x2000>,

-- 
2.47.3

