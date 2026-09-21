Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1B46E017
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984321; cv=none; b=LD8JrFid0pbR6l7b+oDxszCepAO9Rrpc04QJH9qIW59iarSLNq6yNrbV738HT6jlDxwtPJ1NYFC/RyeSS9Jrhi0F3RTnlfJ9UAxGefvWEvm+gOOFH/JsbIXvgpgbyDAy94Wt3W2kiEaI1RHz0ynp8jisn2BplaEDM5k0IYe/F8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984321; c=relaxed/simple;
	bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5GF6lU+O2ixAsBRtprt64KPx7tkZyDyZaMMKti2IiHpB7EyxnMxCLzLlBM7kyAMZ9JgffEsR075loaG9bQ/cWLCLTmarCWq14VHttWy+bSISGGIZFuFPYeX0Z6E9FYrqW14qrzI3xyUykSF0uk21FNd6Je6WeB7z2rG5gmZND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UplmTV/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4eABNRi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UplmTV/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4eABNRi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7AQZH3351612
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=; b=UplmTV/7wuxwGCWB
	AVMFHM3wQfVqweVSD72PmTu1HBoRa9e2DV4jo/ixiRVFaTqUpnXvhGpvDafEzZOU
	uPP0QJtbZtI5yB+6diPIdeEy/D+n91d+tic2EtRnHiO5NNqPaVSetHc6KoJdMObZ
	2AXZstib1dkV3FnCdm4nx26Kp4/UxvqmtSM6lzoV+6YlGvR1/gGShonLd2HVYGHP
	W6q5HG7Q+kB1h81kJsaMtwaei1iZQ3nqNHNDxFDhT+oCef/LbcKVrroaqXHmuNHR
	5r2FcQRFV3fbq4onOKrxFLxq7u6DulWRFC9zERG7BHszOz/6YwpW1LeRMfAi7ECI
	BD6VTQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79a250-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:51:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d63bad3d09so40338165ad.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984318; x=1790589118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=S4eABNRiXNsz+hOEG+HeCmTL3joKR+ExctmZuxfDyshtRna3RbQd4aS4ZFfzvxm65I
         w75u6NFtpqXbQoqnmSSyUzMZpT6fdCNwFXbiToY/r35xpupDjjjcLKjnIcxBhseyOYSB
         FDX3XCzn0Uhh2MwBCytNqHjeWh8AlgSt49QPFFlPMpgesbZh4guVOFND5+ffIGndtdbi
         6F0424JdOG2zNZoTyytuL7l7bb+hnpNyhQL+BerU2JhBmGFfiO+Eqq7uELeLDC43kNWa
         Oc+eRTCoCK+OjcwdoS2yCvwE1twaAU40kuNKXTFvM+qPIbNSnQNjdsMiPP2pZDOqncgE
         AIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984318; x=1790589118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=SveW/ycvYEgF72NSvrDeUhTFr/e6CvfF5MsxWzw5T25UmBvyoyQr+RZoPqCH/M4MFr
         YRX+5N+s9Z6hh3XF8ENvyCAFAudwtTzh7AaMOMPQ7SgUDK9LOBHqYRKaISJf2G5fpLZK
         VPSMOT8n7cqiqB4fNqVnJ3NTL+Iq+Q35f0bIuTgXN4BKZi0Gsa3dRo3A64hHZ4SYE8r/
         tZwNalagFPLuLEVFLaZo9+9tRjVF77J67vkEhtsVkEZ1iC0ZPFk6INMriEKb6O+WJ/aD
         dXA9WqaeG9F4ramENBWdhhw/mHNT2AHEC/oG0wZ2FXNF9e4+16GVdU4bxl/EWLYUH82l
         WLSg==
X-Forwarded-Encrypted: i=1; AKwUvBzVTtGlyfpjWe55VDMpRNPVIvpg5QBNGDpBpRNwte5FAPTqKdAYYs7ENOWf/jB5K+KDz2tgLHgnKlZB@vger.kernel.org
X-Gm-Message-State: AFuF++ky0fw56/eY37ao12eAbHPrwqDcMezZKw600hKiaY18TN8gJ9as
	plFN+Py+Usj1s40kIGcpu1bJYnLGuEq0C5H7at8FbKbf5OgiQxxT/th4fDR5j9v0bPz1Srtmv6C
	6eFWI2/aQ+ewTqFwuS9vdDVqMR5TEaPBfRUz8tkPBaNAGP7+YG7erDIvNbvuSgtPT
X-Gm-Gg: AYBFou1/wA5FLeYvGYHtPubLKBC9r3snomH/4ghzVcpPd5c2Tb1SSs3wiyuqvA6LsZu
	KTezPOwX7gq83j+tMCfA2y6Rv18BGGugD3Hi8lymKCaTyKdD1NJuRthb8T92oT0tyVot3L3XTgt
	mZ7ujaTfB+Lb1ZSDzfEUSmv98Z50rxAjQOJHFuv8xwK26EhZxTREkJFbAwsvI5BT0hZfU6OVa4N
	XDFBOPNN3kTZEa6DO9MkCJSSTHV4yEpDGsrhMHcAdBY0UDT3G3Fon4iaazMZt5qiECtZDEfqthC
	syMHWmUU5Wn1H4VwYymYKsu7u/DDYnB3b9qTsrGuZFR/sw24UxL+Pbm3SkrrXfQ4ee1MJyCAQWw
	YPQ8SDQ825q6vEJbfSC2TeOmaGIhXk9/cg4fYr4YQmBlkjtzHnauj3LU35lg+ycBTua3w12fwZQ
	==
X-Received: by 2002:a17:902:d54c:b0:2dd:c053:d742 with SMTP id d9443c01a7336-2df4e82e854mr14988875ad.41.1789984318002;
        Mon, 21 Sep 2026 02:51:58 -0700 (PDT)
X-Received: by 2002:a17:902:d54c:b0:2dd:c053:d742 with SMTP id d9443c01a7336-2df4e82e854mr14988625ad.41.1789984317548;
        Mon, 21 Sep 2026 02:51:57 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:57 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:36 +0800
Subject: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=3494;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
 b=7ssA7Wks0KxchVzEmbYB212nWzNSZL7YMqagt64wU/Xw6u+8OVPJOBgb0k+jdIkrbas/LN/fb
 DpiXriSOpe1Amfa+vSuDkkOFK1hxSgd00HI7tfEeLdnV6BAeAi0buSP
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab0fe3e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lXaTmLNGT-RzeeOE_7oA:9 a=eQaGosDBtpkPWATo:21
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX2gT3Ey5R78tf
 m6YoNVvf0lC7UV0igP2TTSd//KuCeEgyuOZ8nCR2XrYj/e6yVEmzcJxEYPHMFhFvKbh+PMsDc4g
 BJnGK9zzF34lB+lwJeFgEfZsQl4uwjg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX0ZcyaUs6oGtZ
 muGeD7GQe54FopbTY2Ga9wz6yg9D+4wFqncJcng6Nc38R3BgP0w8lMyT9l0MGh67v4v4RjL5avx
 HAzC5ZqWhD3JFxhQwFxUW1Ho1sxsx6+bdev8U3jZAyeKgWOlhiByW0vvgEnIvNY5PsPNE3Xcc/e
 oT8UH5xI3F5YUCuYl03iAHWWrTutcHf14Dt0NOvrqCE5jL9QiMM4HKB0kJZC6wBgVPNsujbpHXW
 ynUznqHcJvMw0/CYd/I6tqWc2+cCPfEYNyKZkl8yEsupe+IOyfrJP5srnr7Wf7/JW7sND0pVh/z
 Lh6kooFIgVS9lPD6+XaaRY5UiE+C0lIocp2v2+rgObdRi5hUXK2c+yflgoFKB1PicNyK689wJoO
 OmRtmK4c57Mtn3SPdrE4VOXYd8jGwu8BLOJQFWt37iqLTmrkgJ7tOCPDub8OFlGjGEiW9YwFwFH
 P8c+lWkK1JexE8gSBtQ==
X-Proofpoint-ORIG-GUID: RgvI2kNUwvnfwHRy-pC0xU5spP1-gC3F
X-Proofpoint-GUID: RgvI2kNUwvnfwHRy-pC0xU5spP1-gC3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210141

Describe the Iris video codec hardware found in the Eliza SoC. The iris
node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
support.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd075893304a9ab7bbde84eee5547491..5ebd2aa0a520a7c3e08eaff03e3220469cb64f23 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3357,6 +3357,104 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,eliza-iris";
+			reg = <0 0xaa00000 0 0xf0000>;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_XO_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus",
+				      "xo",
+				      "core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533333333 {
+					opp-hz = /bits/ 64 <533333333>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,eliza-videocc";
 			reg = <0x0 0xaaf0000 0x0 0x10000>;

-- 
2.43.0

