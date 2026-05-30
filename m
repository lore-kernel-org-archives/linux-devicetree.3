Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFE3C277F
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165699; cv=none; b=LXsBFt6BK+YUxZacWfelrMzVjz+tqe1bDvPvBMNONZ4Hi8r7OuCjvO7v499irEAJFh+fufCwX9VUwYoI1tnDNa1ju+VcMUwrDCdAYaGT1kJCRrH20cWe0R35iZWacLp7OMknFeBr0kA7m6yVfC4hHwYMGLGJlIkcTndKD5wmXNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165699; c=relaxed/simple;
	bh=86lPrtRRC68324GBhKs+vwQEKBOkSk9+14YWGTO4z3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PiJOz3P4ZoNnctE2Nurv/Gd5WA8SFXJW9hVr4fl1vhKB+dyrI19HEPhxieWS5h0eHkGA8dvrODnh4tiSmZcTBwrwAMDUBaFwtZdV0k1MCvId7eyZF8Fw0odvZRtLxAt2NuL3Vs5yuq/WnG1LKk4Jx75FcodjlHQZdNs6nqFpR8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SsngdvJU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTdAS+1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SsngdvJU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTdAS+1c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOS913071454
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Slub8Pw8ysKXpaiVe5IGzxnoE2Fy4UyZFu5zqxaUWts=; b=SsngdvJUz7ydfAD0
	fM5nBpaqxUwA7mWqPgNRIeTBcAauuu6NrQ3CNViRTJowweR6n86ALMW8yQTPEdeN
	yaSPz/bGmxrKygplb+eWO+RuyJbi2tQllqSwkpG8n6cK9D42ZZgTJ9cqWEsghOZi
	cr2qD9IhxIQFD411bmNfQhaUkWTsCCeyAOfm0bx5QKu2W10B2htuKT39o/JQ+nDu
	lK0yEdyQXN5dSY0dzz0gctFv6+2UCPHMCNRcyCS4depfzBoPwIn+4d0nFPN7eN3g
	GFCEVTnPfnQqGcziVGXiuE9cVGOlZEEsNkyg3d3y/XzouS3Dic0YB1T2RgrdPljk
	tE1nGA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pj9pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf243973c2so12316415ad.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165696; x=1780770496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Slub8Pw8ysKXpaiVe5IGzxnoE2Fy4UyZFu5zqxaUWts=;
        b=aTdAS+1ciq+utM0k0Mrpg8MLuuqSkV495Z1OOlteG/lPjiUH8dRXE5ziWe/FM0Flgv
         vG8QnccoFxuI1axJ4QbXt66I8PHeuNN9m+j1aLZwSckKOxVSIQ7LE1iQ7pNB1XPC/OkI
         Dbcg/Hdx95MocjYedunGhR68/PuvA+fQjinYem6rPUBbLbpqwNjea9MhQfeCxowYsZJv
         nlmUKoyO0bhE2gZb3Ba4GO+0P15ANGcopP1/vlD310IXtgoDftBFL4OPAZVBpDe4Ptyr
         cdc3SqMJAfeLabnfNpTFM32dLAdbp/7/ABPvhI1fY7MqLvzxzNB/aVxlPjkmT879kqeP
         14Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165696; x=1780770496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Slub8Pw8ysKXpaiVe5IGzxnoE2Fy4UyZFu5zqxaUWts=;
        b=PVXUttIkSehoLRQfKC72RQ2YiwhFg2yieZ/Y6Mm5LKai+FSfBybBArCp3W2p/PIQlg
         Ic5/PfpMOt6MNjYsA5JhakgPSVd+fxAmtIbhwxCofYmtaZr0xpEDfLYEQe57dk9RBuLm
         TlYVLAjJ7cfbMzP06/gxJS+PANYF5m9/p/tTPBnQWWCwTK9gERnzjIKHWsYnJ136oRZw
         vlEWo9s8o52sJ9kpSgDx9+bKN6Idd266O4sC4z4UyJsm6UdXptfwsCwP4Y/lxLdpi+Kt
         aDJCXlhn5kIoqehWLnJE9UeuSwVLYdftNWSoTGKXhCP8w4nAb3JW4R4pii1aZrQ3DI2m
         HWVA==
X-Forwarded-Encrypted: i=1; AFNElJ+A7HQ3Wuu/xdRw+vAe8KRN72pAdkxTmbwYVMB8xmrtieLMCQ1YqctGx6D6v1gAuqKHpZaUTCqoBMU/@vger.kernel.org
X-Gm-Message-State: AOJu0YxnP8atELvszosKi9kCkXKPb+Raq9+B6x80g7grbxdVNpiiMq5A
	xkmskjP5sHlT6AbCz7CSoAOgkESbJNJKvUA5zPtsJ7b9zKD+lDHsivbfmg+gHXDsnpasJZKv8JG
	srfLEOM5y6AeM1LLa1dlWP/Gcx+AfDgRgflAZFuyt5HlvuS6TfXniYfKSTKr3X7I4
X-Gm-Gg: Acq92OH+nB0CyFHNdGuCacmVZH1ed73fS38y4yw/V/FUq1CtUW/OKzdAXC51eGRD1WA
	kPAPp+dADYEyVjmfNLoUaUnq4VRGRqAX3hj9EO+yEVPLE2IQXOZ5CbdqiS0BAUOWgIYHpSAbV9s
	N/MzXJgfr7GSZWb6hyggtyVC8KaDnOicztmqDX/07GVmN9tivnA2WMITNyx+AeDsYoYk0nBPnNL
	tAY/PeLljZER6dJ869AainakQVSy4p1wbcczvPbzEeF9xYHsRcfxKgDO7OymwdM8YYW5mCK6fg3
	LVcfHrGZeP584xWkqj0CudheH5JUeZbQPNhOED9KJ34QHlzYkABx2t0lOKfR0rgKlrc/S5KTADY
	E/g4FKmlQQXpNbReVykrrSlpMjavb//cm9+pnyLUHkqbV3x8=
X-Received: by 2002:a17:903:380b:b0:2b7:a350:463f with SMTP id d9443c01a7336-2bf367c0cbdmr56458715ad.10.1780165696475;
        Sat, 30 May 2026 11:28:16 -0700 (PDT)
X-Received: by 2002:a17:903:380b:b0:2b7:a350:463f with SMTP id d9443c01a7336-2bf367c0cbdmr56458525ad.10.1780165695991;
        Sat, 30 May 2026 11:28:15 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf28973335sm51702635ad.63.2026.05.30.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:15 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:57:22 +0530
Subject: [PATCH v2 04/10] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-shikra-dt-m1-v2-4-6bb581035d13@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165667; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=tn3IGq8WrOemms6NfQb1GjtMbRgBWAwqXyYL+aik15Q=;
 b=KsffD1NMjNJfuDmwtCqOrxLoLEA9krJDSCScwkD28ixyYV0gfrudV7WNjFiOGxkxL+DDmgD+a
 xlJSI5X8tsUBpwVQnBbRlIpYJFp6ZAjZkMiBXd9v20ksc+HyAH0YVZi
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: PvDqp0WzyuCRaFq9mBSathZldwu5fq-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfXzKL/tQvue648
 yav0fN7sb6tqXAXAB53J626d01KCneTEPx/t1zPwPzY5D6uhHslKoNIqSC/Jk/7+GIggG8KZFYI
 3fVMBnMYnH0ucCkD8n4XcGj6sUcIQvg9l3DMdnGPDD/a06bBoIrfrvIq8LQcKyca2fy2Vur+/sn
 6wuw8xGWFaXcvn2Tk/A1h2+gIFWuUNCTFI2pW1GkpjLX6yr+E/ACHHRlvIaaGx67PBbIHMAfTxJ
 VdsSqEzxAH9wKDDv5nvQkxKV3agcshmcRWb0xEAn9g/VvgDDFI8A88holNWwqgR79u4nhwurBK5
 EEug0PPdgeNk3cxscG9xjrz+2DJBXu0ZcyAj5bD5Lx0a8V/U0xsJnQKFps2vd9gxxg7KQqC3oxc
 pY0BeZw1JITZpCPmtHnhsfsgDcucEtVOqj2mX1/wxYRHboRZ8yZgdIDbSjzXfTjRKWwMtjuUOc4
 37NaMUqBwwCTsbuzyQA==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1b2c41 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PvDqp0WzyuCRaFq9mBSathZldwu5fq-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2751b4f89678..3cdabe718714 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -661,6 +661,46 @@ rclk-pins {
 			};
 		};
 
+		pmu@c91000 {
+			compatible = "qcom,shikra-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x00c91000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <1200000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <3072000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6220000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7216000>;
+				};
+			};
+		};
+
 		mem_noc: interconnect@d00000 {
 			compatible = "qcom,shikra-mem-noc-core";
 			reg = <0x0 0x00d00000 0x0 0x43080>;

-- 
2.34.1

