Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20885318EF6
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652197; cv=none; b=WES5N+x1BGJde6KmGBI29OWhU4EwjenwcjYhpg/9LjTYeFjbV2bRdCKRZ08SG6NwZ2il0DffOvxcZsUKJAK4eGdKYnPrwDW92TZYguFELboyPAyMLFPh9iPiWMf+sl4Fj6ZdckuLwOo94uhAZz4I0UdeVMds3A4bsoYcz0FLpZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652197; c=relaxed/simple;
	bh=7rayGBQKh6NbUwuE5mW9yTPwMZ0wU3HJLg8mP5slUH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMtLuDsf5/GMc68cIPNeDr/K9qKGCs3AFKldg3jaUbk+ojuUZEqo/GBr6ic0toj8IrrCVlEzEbNly6dlf0Af2K7kN7AKvObE/QfJ5heP2S0QBItl5m1GCV6z8aGZ+2BdaqoxMi1ZYP2/fb/brI4yZZ19Ple1CjpuZ4/iBJL5LXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glf0BYMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJDpg5m8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glf0BYMt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJDpg5m8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NMSYoJ3233728
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GlVMdI6iWsrQK+09Of+sgMv2sIv/9UulNUsp0d4OMkw=; b=glf0BYMtq/oMsEjD
	981NUAmbsihLePMvg+5vVK9/0oV8vQt29zeJl24xSNtHTtd02bfGxdUXS9tOz+dO
	fAARqem+/u2dZ2QNYoFWx5ExLgqeldRLfqKMnDYroOg7QKBBJgY8mNMRiPHqpYti
	WIPLOIPqU//ju7E/cLattUyQ0B587PGg/6ytPqMhQBfgguoNoVIri5OZ+gtsdZGb
	D0dX+P/PUilA6xpGfdkfUAOOjmIumDufemkHUOrD9BgIUA2imeqibB8uTHPeq145
	PzDFUHF/APgLlz5ocOwpHabfMgOQvt/TIoDtf8q6VHDJUfoZ7fHI5GBIODZ+gLTA
	Owa+oA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0u48a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso17988876a91.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652195; x=1780256995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlVMdI6iWsrQK+09Of+sgMv2sIv/9UulNUsp0d4OMkw=;
        b=VJDpg5m8qySDLAoy3y9P55LCXtAZt1T9NKN7rcFsB+IRdi0dF9jtmnkI2c1kJ1O2SH
         RBP/b6JtHcRJjWeB8ffDF37B3jHSboVOuCXwBPluuaYHsIFSbVjOeq6ykHlxCeZVUSt6
         LMb6tgilQkAHoeWbC3W1vP4rw/lGZdAbGYPmM8ckclSgKyCB8MSukdMDM+9UfsVgxTnG
         XQENxZF9cRqRDHbEpc46a5Y9jEHNBkkpvCGX5hTHOhPYBazltVvpc1C8LdjszjWre7J2
         dwmRQCtnkeONa3m1wxlSrIlVnT5JDqzBvUjayPvXKq3aI3Z75Ij5bqxoPitLt7/lBLkt
         aRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652195; x=1780256995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GlVMdI6iWsrQK+09Of+sgMv2sIv/9UulNUsp0d4OMkw=;
        b=ix7L2EmvOxYypuKrZEAIuS6Yolp1gO/5lsiCPSihbuFrEkckABb9hQC8WOUl4mQws2
         xBu3flFlQCD7yAUaPOGEZDDSjflqWE2lYrl4K+wWOeBd5aKBf9z3uCrjzqsg3gnYtwzQ
         V8R3B/ZMLKSrBWJ8+vRI9XNkir2lK8pUvSLDXgNAyysrRG179uATLWYLsaaupScqht6O
         lH8b7L7z1omc3cab0ZlNgmCTXWXENbZYlMicrjX/XmpmPzo8H9RkJDb/MOV7XA7HQWKd
         1xFj6gYdhu8y0NkQCR9QwAWiC18k3MHaK9TguXzPYQWN0WKIvZlMLUf4XL4JXXarabpj
         4VbA==
X-Forwarded-Encrypted: i=1; AFNElJ+eUUhEU01uGnFZxaLvWRSCqEjDdvgyJN+JI/cD/HxmpBucwZZIedFaxaWA7hlFJebfyeIxxu0qHS6w@vger.kernel.org
X-Gm-Message-State: AOJu0YzgXsJUnV/b9WWWjcP4Nq4jV3VrZuKhzg2pdxkJ7/PxPlmNsRwQ
	VSdbbmRGFGgN7HKV9lzcKYcMyivK/29KnghEKzGyWDaNDcxEYknuXFJpVIhffMB17govRNapZEU
	EL5bzTI16MV/EYdZhLqy2Rcn/fOpl/nWohsKFBu08IxNtyXCli1JtnhSZU/1br4hc
X-Gm-Gg: Acq92OE3hTOwTjyGBWJ4Jz2NY7wIV8lNza5Pg801LZXmtiB3g69NDQUWKvFhJzGMAI6
	kjMO2jexR6o/0wEM1fXARJDEAztXFKoDYXWCJxBnCGyyDyIKRjF/qcaK+pm6wcJgMQaHoCdKFKo
	CH007/iaR7gLFrEdbFsGH9k6ywL1RU9/zsbITWVz21Fzc3KooLxpx8f4sCYHMIoVF5Tk4MLlsUv
	/jduEsLtscsEbTA03oIuEJXVk4hz6OVhX1x6a32DKIiFQcMMd3gYAzI00strNM4Nu/uriMoieW8
	FfYohilktKZnwUuOWsMqIkdqlKv+tp9JGDs1G1FM9kKtWpKyI3z6ncLxiVldxepEk3x3d7jrUTL
	MH0y2G/xwpBbTOpDnd9BMmWv7fXL7B08/i2Bf
X-Received: by 2002:a17:90b:3f8b:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-36a67454586mr11597150a91.12.1779652194875;
        Sun, 24 May 2026 12:49:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8b:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-36a67454586mr11597136a91.12.1779652194341;
        Sun, 24 May 2026 12:49:54 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:53 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:09 +0530
Subject: [PATCH 05/16] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-5-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
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
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=1702;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=SxVgOdo9GtFzDEX1P8cyQC8v0IJByE8HPx0wGhmlVfQ=;
 b=4BIAOkrGoNLKhsxYF2SHCN/F2zjMSvgbkxJBxuVCp9VKMpXHKRuJevKKshH3Xit7SoxPsxq7v
 rbkj/2o9pmSD7a1yur3icDAevKhy2fgKPO8cog45qT2gWAyHt8iptBk
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: Z15IZ1zFohNqMURXruLYpuVVqvTAi0Xq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX2MVkMeVS+E+H
 XyZtpbDW8rbGaJYdz4qr6j8slAW78wDapZoLtCNmnlIAaenKHAGu0+En37Nvq/7hrmc0hSXuKbw
 EumR3aw4y/3s1pHBQ9LmRjiB3dgUP8vpqiYwVS3DZiBilYLa6WzUDvjD1BqqtfaHN50rXFHidmr
 fs4jcxc9wjKFw3z0w9LRYn+f94rA0OM4CkZifkJ8uqKr3WDitzL84CIIYinUSfT4Kv5VZ03sUW9
 PpxjHMeeo49Yf0TshHepylWCDJebUSUDugRKB4ouQDa5IwAP8dM4zumGdoE70tFImpYYicZM/Ft
 1iKycFCMXQkuWKlBYSDuYPoM5JHWJ94vl6pZo/u5HwXRPXcegBGACGHaMXrft5CEO+xZO/rCc8Q
 gbldTT9ySTObIe0zk0wPy1ViwWCSxy2b9dsp+grWxSgNWkmDYGG0VY4Uunh/6Yhe4muN5NEK9VF
 TP7PKGZbi7QBhh18VPQ==
X-Proofpoint-GUID: Z15IZ1zFohNqMURXruLYpuVVqvTAi0Xq
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a135663 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 35ab7072e20a..238772f064ec 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -673,6 +673,46 @@ rclk-pins {
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

