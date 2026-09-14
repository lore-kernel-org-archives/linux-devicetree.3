Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24265425891
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379689; cv=none; b=jgDkWip24DgEz1g6g368ATAQ/f+EOdDout40yovOexVrwm+UArvoXp9yUpcRjmuEl+s4qdzDNbLOn+zG+A539Cy7UXKqj4K9pKWUo2USRuTsG+CH4qnXMKDJHajmM37PgNTZuscRg6Nm9xw3wcQe4jgt4Ya2FLErX0ytztqN4E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379689; c=relaxed/simple;
	bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bthCO/suy/C3irSTCNyBIog8B7+AhAbFyOA1zFR9lMYmRpQmIRYoXVC680g3w/cnQykWsM9EVVteCBXNoFbsAD1ryOXCE1iMjCUgOmAo5gqudHMy6u61bbZyRuOe0ZjNzG/s0IMuJBjzc8Kz3l0PJEDwJ6EbD7muVhzLdOG4NSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKqz4b8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/6mHAFe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKqz4b8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/6mHAFe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nqAR1086608
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=; b=jKqz4b8iqm5r0e6n
	zBnF7q6nGdQO3zVI8h6lCJkAHEuOb/sa5WnRZy+S4qnYY+rYn1o1ofdnZNCUDvPS
	XLHTiYCazyUcoqtcNby0oxu8EQ7zfEI4GlJ+HHvsYx/keqFkv6IGCdt7IRc7I0oN
	PG7QnGRK3FjyJ2W/wO3FXWVHhC3QpOd+ubSM5FPUzG4rpmM2etRaxvT/bO+dvOoO
	ygMVKpGlA5PMQGz8BPkYRteNz1NNoWjqAqdZNmjuwDC3nXNHaq+kggaZQ9LxJPx0
	eifS5UvLw5UisaPuhiez9grtwa45xnfBhRRo9e63QNkNHsODyKQKdu7FNBzwdyWa
	gOTGeQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09vch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:54:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso1283394a91.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789379687; x=1789984487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=H/6mHAFeA8NSKnWKSFHRNYy62QNbYhUexPTPc6jX57ekYuLj4CVv/shkjEbcZFAKFq
         w3taZnJ/3lpfZlGqPI/eSdJzyTr1bF392xNNu8xO7IpsRjGJ/kVWPXioPhxPjsLq2S4r
         j5QJD1OdNDS76nED/7Xl9zjxE2WoqoHRAqSYY3BfGmAONXgJADpNqX0l/v9/4aCL19kE
         /TPxkSFVepQ69tQCDQXwI4udNZMCC+KJzsYgJgloyJ5l0M7FW8LHwQmcXJErdgdffhqJ
         QCLE51O61c+JpyHfWvB+Px6OmoeKfi9rEB/Vmle/dNDPU3UX6mYjPtmS66+Qm6K4At8d
         eipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379687; x=1789984487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=bpJpqajx849KWf8R6VKuE5BLPU/g4LbxDAd4xLWlrZiGhGrksiLY3IMNPkpzujzYm9
         bXGIVTlY/jwzRzrZdG4LA8s4rhJkm2vY6iS1dgxrnL0xxpPzfu6XnEovdCojf/ZkohjZ
         5QnIpStRxhHG/iOJ3fkfSkTk2vefjZgfoqBX64pnRVdKk70h+yi9ROFAtHZY4Rwz8sNR
         7qYRmlJP4qRC3fhi0CTq3ysOn4osjHzxCqSQqFD1xWl7bbfv1+nRPxGp223xo1T6MUPx
         hKFzIkHpW3Ao2umQB9BDQioD3g2QOHTvZinxI4MH3cEj6jxC/+MeJyUxGBihgLk0aw7w
         u8KA==
X-Forwarded-Encrypted: i=1; AKwUvBzrgKDX309HBoGleI8NIKw5ndPyFQBelI7oKLhWUVJx1/MeSZUGv4WGCzBZxONGzfYPcjp4291fmw/v@vger.kernel.org
X-Gm-Message-State: AFuF++loU0slqFAgafQmcuctVtcCp470TgA1FRLzoxrc5Sb6HfSvtDf2
	TqFDFV6JpNdKeSjWDGVFdTYEvu7osPV1SQ4tAXdkm+vhPV2Vc//T7gSIvjOm01QpJ9BSGXnZ1EB
	mh+ZmTZoo5EB0jfNVVwiARA194XnXElCCvH8gBPspNFTDBBBaz7n9Bz6/L9CXNZ2u
X-Gm-Gg: AYBFou0Ld8Ht2eVkWmQpaSH7EhvWjxo1xHVbXjEgYvBMmfjRShDaGBuoEXn4FwDmn0R
	p7L3dJwZExt3ufCfPNeXyWLipOfaaGopRm5ISDNw0Ylv5crzl/zICVXPuzuB21uTSkftlLWD+Qo
	XE2ibUZzu1zus8fIaF/bDC0+jKPBmkeO5GGBTS0+6P9UNUY9M57/d95yHfkCb9T1oP3F0Hx/bFB
	6XWEAkqIUNsIvKtxsE6m8KCWprF6imzKTvHByL4k8PEzXNARqkG8bD00VeZwQRToAVsV6lobo0X
	o2NU9kLh5mTJvzGFNPHNPc634S5wn8nZbQ83GhpivZF0275d5L17C/Bfd6zemvLCOriiWlfRNhJ
	dcddwhWE+BCSN3JNnk+BVAbb3Bt6J+D4aBquwWH96W/JjyDWi47NvbYAzSNTqPMfx8FGabRvFL6
	Y=
X-Received: by 2002:a17:90a:d2cf:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39dec1426bamr4651578a91.22.1789379686842;
        Mon, 14 Sep 2026 02:54:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cf:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39dec1426bamr4651497a91.22.1789379686334;
        Mon, 14 Sep 2026 02:54:46 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm20664313a91.1.2026.09.14.02.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:54:45 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:54:25 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: eliza: Add iris video codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_eliza-v1-3-e8ccd9b8cf7a@oss.qualcomm.com>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789379665; l=3494;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
 b=zBLhplctgCAcoOe7FRxCtyfBa/oyBjq6g9Z0IYe5L9MtrLmJaNd9qDct74OJnaUKtQIPvIUGt
 uJ7riScJQHMD67yjPn3qcLObw/T0iQbh1O1ZlbZsl4aMUtuPM02TzF+
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX11KDGKfrpoSU
 EYuYnhX9XLR4YQhk2B2yjPnhXjT4WYCBRV/KWAxdcXQB00J/2wA2+xibgrgvv5dykRaNPFpUdlm
 jGqV9c0QFttPRNv5LMeuKKiDIOq6S78=
X-Proofpoint-GUID: TA8IK6LDpq1FhXE4GC0Iz9m4SbYq_GBf
X-Proofpoint-ORIG-GUID: TA8IK6LDpq1FhXE4GC0Iz9m4SbYq_GBf
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7c467 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lXaTmLNGT-RzeeOE_7oA:9 a=eQaGosDBtpkPWATo:21
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfXw+Clv4gIqwJe
 ypciH0/RU8lYfDd9DoBzoj7MdBM3Opk6qflHC/BB32yc2qruKLJscHWh2MY1ihY9Gv+IAr3QMMR
 LZFbYsz31Y3RUwf//J/hef4nKxhzG2gDfYOTZpUjX1QRl7Dtg16RSmzQxFDC3Ai9kawU6Rj7NNG
 KOLd8GrXqj7DaAfuki+kX7x7ZFrsp/pZh6Ld4DFWZN5Np0Au4s2sYNWDTIFX4+931M6vjW1VITe
 0ke0eYOVIPYKmJFl54trBpTO+l9U3p5uwDjep4s+SUwESPSQeSjUYfLBRTz2obpQ1Eb2Znl7L5L
 6Wrf5mMBg5MouOvPVHAWOSPHr12wUVriLJZo0ZKJnWMiCRMp/K76vNUTFxFp7IIyXUhWmJNCo5H
 lfBY7iDLpi7cEevw/VpyMdE3pOcfo6ir9z3BKdJ3tFx3LYzmLOVdSP195InB9z/B3HaQl0yqPN3
 RZdrIUkzFGeQUHbOrew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140141

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

