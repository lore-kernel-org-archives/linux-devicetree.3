Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E04480348
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846382; cv=none; b=gGUPyrm/ni5l9YlW2sLNL3UFNPJyURjrzrq5zF7U1MJERbJfYtL95N/X7IytOkgI+PQtwpXGoQr15N0TD+QI6tsY7HMFkh9mF5vRpXdM7ww7XKaAQAnp1TAJpYh4YiSI7O6A3kRia+JR+uMWQHttgQa1DoNC9J4fJn/+6x0ochE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846382; c=relaxed/simple;
	bh=m9X312GlyTzYrjaE5voUXDp0+TdVreRfHVkajhAsNBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nr7xSVLxQZW85BkO5JZ3U2/T/mtdMQsgo0geIGf4muBUDKngzBvczWXrVr0bwYh7c71p3hcEJV6G2WVo+1ea1P2LlZ4efCSx0srRsiHSs6NBjxebgtU3K6Wgwebao2n4/Odi3HdytE3yOXUoqRq4POecGki3x2HI9NkJEWxcITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rofz1WSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+s5rcpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rofz1WSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+s5rcpP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9HdQt1714936
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=; b=Rofz1WSwC8NXFeex
	9wimSd1UWAgNAkFqoJbtrRAa1pZVR5B3SHpcVlyWEe+goM4vyPCN6d8+G5ZDweZX
	rZizdsdd8AtwfxVXTZEYKNBldbqipNUlAdWqUVbCS4KwL3nqwNhqbuWAAF67GIqS
	jxhugyQgtkBqSYc2l8cTvIl8TWrTfPU3/gWYTTLDWRzubeNHN1WuO2t5DrKo5kdf
	nj1aqf4xNG/YFyKeyuB6PPj3W1l6Eb9jOKl/vUy8UPt3RcdwPOuZWSlaSHwl1thR
	3ZtjQKIXStJnR03DZ+L12Z8akNScM6VcyotOnKsFLKJNjwgw0nftVy/Mmnj4vbhk
	TpcCoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxswm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:59:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90e4c9dd865so759593285a.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846378; x=1779451178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=;
        b=U+s5rcpP2Hl20XcT3x+zUXnnzsWzT9SPsipOkpZgoXiAqXSd754MCXtR6GLAYKvLdY
         zC8cne9HEzopqkbXylOB+zeubNlc/25ZaslW2qNv1ezOjoaP+q79I9rEEzKNz79H3oa2
         vdByDm0ptLt3Trg3Sx3B1wJ8hMl4VNl3TkVokuKcAyfoVDVBhumEthK6sw9Mp2MTCTmA
         QwgjF9ZgHMWeFb19cKaX3Gnz1li0I4eA2Ih1AFgt8LGrExbPPQHV9xvdpDMMX9q+Q7iB
         6HoHpRoNpfULsIb+wXswqCA04xCBfIv6HwMQFy2ePQUJwmvvO5hiYpC1TuH0FYEAMIy4
         W9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846378; x=1779451178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=;
        b=ZG6ihsljAX4DADAXAQVhSGRAad+5ROUVOrtGz5JF3vgtCwGKMLTINdvQjAyEl89qHi
         xQx30oKn601X/Bl3LN8e7nXcsEC+v4zaQ+2angDiC7Hyeo97x/ZNEPiT8zrfAqIUmsqe
         ztl8PXlnidZFDw992wzRBnHyYwD7sjjbX0Hp5oVpfPyXn0FGoxs+e2dvWgJrMjq+10py
         nCkgHkwoF/UbdGxmH/DL6XxxztLyW2USGwkNpsG4DOBXFBvjpKgKsstp1ULsN+omjwRk
         r7hg+bo+mjm4OG8fEUTvXLEfZlrg4e5Z7s/P1U2AAZfDmUlhz2hG+W9gyA5FzrtgriZe
         qWbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HJtYIymH9brZrS7rrj/9+edsn4Ch099nNA59RvCudRlsrhS7Zzx+lDBWHwRwprgkwPnFuTvJ3By5O@vger.kernel.org
X-Gm-Message-State: AOJu0YzgPFAsPm5R1/tx6tW5flgZOBUSsztTXRN51HsCBW3BEgoI8NLI
	DUujMri7ehsysm2aw71pXt16UXzwwqIrR5t1qxlLAvSqpd4UC/eFO6QqSKBFgS1Tb/Nz9YPdYpt
	MiwSPgGcY0EguRfNy89SbocB7Rywyglt4YdM5Fvh2/uKhlFxwZQpCYLQknWDI9pRN91Bn3iRo
X-Gm-Gg: Acq92OGPWGk8kXa1gEPbMLRVeNYtGa7AeBgYokLq6qb63tChxTKCoZAiqZsaxn+aq2d
	OMvsZY8/8hxHV2U5wPqD1DNFBwOw+HgzIe8Tokcxb88JFV++3zc23JRntrlHAMW9+QOsxerlKaV
	3APdUINrX8v16m+/X7mRMNgcZo7UmzAF2OJZls9afOVR5lQwHKJFaFCHjPDa1//wqkQ3h3p5NQq
	9QFuzoUJ0qM4Q9ohGVRhQlLQ1D0fVCHRDzMPMmrpEyIbLTngPXph3KQe/vgZonCW1S40mO9VXz2
	CEEONBAq3acBG3Rf+kRQdLQs/gGV28elTVGDqZbtqlWH7+F1PrjNrwhLEva//WgsPQGMk3a9RbO
	/USxYpG8X/Qn/xqwf86gRjU9bNTDrR2jcWKPvVa8YYzZgEKRf8tMD9GPPS7kKpwvKV2szKxmWu6
	IrtVaPKFPPj0iIW6EkiNvkN62eqhAvncdZwzq9QwLtKW76gA==
X-Received: by 2002:a05:622a:8c1a:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-5165a27b291mr45163671cf.57.1778846377783;
        Fri, 15 May 2026 04:59:37 -0700 (PDT)
X-Received: by 2002:a05:622a:8c1a:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-5165a27b291mr45163251cf.57.1778846377248;
        Fri, 15 May 2026 04:59:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:59:26 +0300
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm6115: add venus device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m9X312GlyTzYrjaE5voUXDp0+TdVreRfHVkajhAsNBw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqgnkK8T5+7VBArmDGhOKqMgQ7aFld7PTRcY
 M7vxipk9RqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoAAKCRCLPIo+Aiko
 1WZ2CACL3N4/XJFOIChQ+TPtlId7HFLg7XpZbJGG/9XaSd5YSfYG8p18jb0GUxSivqXVHC+j/Ij
 fq7MKkcCM8hi0kaamX0R/NNWCQ75qaYrncC8SEkz/3P10lSzFWXcA8vSxKgCtqZF4i+Sq1l0siZ
 teAkeLoanWxXxfSe0YxcSppfX+SSMhWDiCZzTjKuhBf5zV+5FYQ8BTCDUtOli2I1bC5HJHzS9Fg
 FYJS2O8nzBhPExSTFOn4GeoH8DorDvNS/v0ZShmLBPCzBPFoFs76bifkjZsPrZf4BPFpKfGWiBL
 RS7i/pL8cuIqGZiZuytBOUwZsg7QET5n/DU4bl5MA8XG6B9u
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a070aaa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RLkLXjOyRIPW4P0KXqIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: mL3MxFMCdWFbUntzxZCzGD5TeL7QK69w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMSBTYWx0ZWRfX1UfRfZnguaPc
 aV/Uu1xOqwzJSODl+ugU1MP9F65r42T4+eayxrKbGg/8jPJ4wIToH906yML9zfwiLmJSQMSgafN
 xizLRJ2s34MdkhfLLx2PrvT/uvt7m59Ro8vwgoGQWGPC+IWcWKCV92AB9qpTKqez3WkKOshM3Dh
 G3sdt0hHpoB0QVJRpa1S+5VLe7Zn4Vxl0L/bRkfdt+JzrT/FX+CC7DaDAvXDIGceuiO2lEUKIt/
 GsWzrc1QPlwmcQqDxxhUj5pYATzNgwdzKhIeOMLK0lpI8tKEQcLmIHAPsSIwrIiXb4GOVfsFcvK
 6IQ3d1zasTfIrhSHGMVDXG+fnxM6DsQttey3JaN7Sm7fgLIoN388W3uEsIMRFIvzBRxlHnW95tb
 sEsrebdclu03TeHa5TvSuuhznfm9iKNnoCpcGu3aZ6/g9+AjirJC/ynJXKGEPrPo2zin4GFAN7R
 opwl+UBEDMzRkyfVNhg==
X-Proofpoint-GUID: mL3MxFMCdWFbUntzxZCzGD5TeL7QK69w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150121

Define the video en/decoding device present on the SM6115 platform. The
core, AR50LT, is mostly compatible with the one present on the Agatti
devices, so it uses qcom,qcm2290-venus as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index bd94eb87d6f9..3520802d1fed 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1853,6 +1853,71 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,sm6115-venus",
+				     "qcom,qcm2290-venus";
+			reg = <0x0 0x5a00000 0x0 0xf0000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd SM6115_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&bimc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,sm6115-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.47.3

