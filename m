Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4873BF689
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773421; cv=none; b=TkMmzb3HGR44dXvXVfP+MNsVVLdZ9kDu1A4u9xqMUGFd9h+bwAsZzynFTCyRfVR18OJEVIrGslbeezgS2GC+ekf2j+raa5LxdIaO3KJsz2Std0qbxZI5hlwAiaKjDVyOuIp53SalwZBO5BYI1B8NB1zPZisAWcgqQ37AsAI1fYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773421; c=relaxed/simple;
	bh=SmXOInYNnuuWw9LyfstHCgLf7UMa4kUN0xkTlOURXRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/bGUUcnCtdESNCxMlxTOhWco88n9UjaAracSx5Snzu8IS9ok2EZc7HbFy8e3Pqj4QkKvdYu1nkUZT+AUTPf9qR2ieDhDwDRUE0P9dPwpPpoX/Kr7S03obN/wVnSc8utl8laO7XVKIx1hibHHiKD0l4pmuDTjAfhB+uUMm+nRuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzQJlEGW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IclSXTZR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzQJlEGW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IclSXTZR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2obLa3794474
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vq7BrayrVFPFC+ZcpVlN7OvCC/ZbYB0qftswyZgjhdY=; b=CzQJlEGWlesiVrHn
	FYVPkwDMk4oia5pSsFHfoL4PmB60lqVqLF1mc06sV7As83qPkyYD5A1gXBqNk/O+
	s5bPglkNWkKjV4yJnRk6rYfrd1yy4vrpAC6K1wQ0mOt+G8tk78+MoIAv8u2xix6I
	98YYEdBnM77oEsy40QyXop1HLqmTHD4N9DlphQueAKs2JIxBJmzNosNVeCyBkfW2
	iPDeVDQAsV6tR91ELVZfD9LTVeqMSsDdLjAWFZ+9HJsv/R/KKWTtfn50kxmd/wMq
	Rk+9dHHu6ZSaNQz3j9634R7WPVARLZZgeI/9o4kh3NUToE5+dQHhfMgP44g3GkX7
	JrEMNA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqx8a7qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:30:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba838d3fa4so101848375ad.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 22:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773418; x=1780378218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq7BrayrVFPFC+ZcpVlN7OvCC/ZbYB0qftswyZgjhdY=;
        b=IclSXTZR3bSLrkWQBOokrYTlJ0rtS3vj3eFqimTk+J3T1JwJFGWHrf3rYIFiuzvqxk
         PjBGTzgU5xXmGCAek/MGtaSCSf677Bkqq9zntDaZn/Yu1dOL7CV1jI2SfPly4TRNCKc3
         fnyLpqrvCB9ZlpzxZF76KDl4igDp6se7DAHwwXUJ92zBtlLBWoToPHuBo/FWDvOJlkCX
         ZHcNl8DEJmCPtcbq9+xTkhTW7ZRjLJ6roIboxdlqKC0r4LOoCgueq2ctKQzeSnCV3nBu
         0sgdOawbOQhyJA7EAJv6vT89Zw9T0BYCGKumNiHP1jaqOm+DGHRKWW9AyF4Bw/P20jNK
         O4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773418; x=1780378218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq7BrayrVFPFC+ZcpVlN7OvCC/ZbYB0qftswyZgjhdY=;
        b=XCuoZ0/jahJnHbMsQOkp7S2IOFpoXgJPfxe7803YhnCJtNum43ZdmpbSUotiwCvVgr
         7TUp1irJIGDG/3D0lQpdvhEJjIdlSD3JFFOi+KFSzparXj58N/Nsejb8ATTyzPJmskZ9
         eh342w6LcBehh3wkqLHTKZkq2BbboicGJiMHcBsA30I2psn02GMkzyg8ZXu/y46aiJup
         I5CumSMJfcKzMkaC3GNAurTUi3g02YJoiYKSpAK+yPvaOj5JiSTHSljNTidh5zV4Di4m
         1Yp7Y7PsnufMxYIRlPRePQXuahzhpNO+M65ZVRgrLQyH9UgwuQmOgwKLSVFXszG2dAi4
         zbUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KmSA1btPYjUH5VaU0nQp9sPZWZVP+snzIdHvUZ2bMA0RiWjqJK4M4aizHKoE1/iJ+M8dC0GM6lC7g@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4OoOPTUrYDUvb9O9V7YAGLE7JO6LD7om/vEKX83pRHN9Ej9U
	pMQlPYGJTHpx9R0Anwu8N7z9eKiExXoPA0Z4QGMo+daR+rn3abx5GzWii3/IWzyhWAic3y13xuW
	BQdLh4YHKSFeihdEcq16sLpo0ewKvOjeOec8fJWrkid4z2uNlsxvB9SM2TLI/rpdA
X-Gm-Gg: Acq92OHDQUNM4Bfg2KJuwopFwm2omDopNZlAoxUsN6/TNSKIBc8RVE3N4KyDbSPzKi7
	Hbr+5kc/MxNBOzmQaAIWymP08y8yOCMCXbb/zSVmQMzBJ1qMHWBYdDcB68+OM0zLDre3Y23u9xJ
	PbshWuS1Z57OVe3e1pnxcj5KFUbkWfxNZW7Mc49U0N3icPE4hCwvjB2WmHRY8eZTTuJPO8NsnFc
	h0Gxmi0X2s0MTUaOqQuDcUAUiUlfKkPUfRnYEEd6+aDsdBh0iNWY2RvxbqOh6ckEcIGMgF/L82h
	mFRNTvSQUfRvM27ysb5Iy1syeDS3Re12DFxRBkmNpapxAxQFLy2Deldp2PacDtAwYGsfivJ1Tc5
	kge7sBwuufnyrVU//UXOj8FUsTpeeIv9DAsCI8vzyV2qcgg==
X-Received: by 2002:a17:902:e548:b0:2bd:4d97:b5bb with SMTP id d9443c01a7336-2beb0385f86mr195646475ad.12.1779773417320;
        Mon, 25 May 2026 22:30:17 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2bd:4d97:b5bb with SMTP id d9443c01a7336-2beb0385f86mr195646035ad.12.1779773416724;
        Mon, 25 May 2026 22:30:16 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:30:16 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:59:47 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=HITz0Itv c=1 sm=1 tr=0 ts=6a152fea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Juf6bUmjuD87IqhQNpkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: pd9ZmvWLJLxtYqvym1f98lsqx_u5TjEO
X-Proofpoint-ORIG-GUID: pd9ZmvWLJLxtYqvym1f98lsqx_u5TjEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfX31jOayfY/4Ky
 pzimezg4Rrj21QeDOGKlvUW/UfeuWrB6w1M0LqQqTWsu/0hzDtVTFJvy07OUTl9fqt+gxtmbxD4
 jGuKLdOZedz+1rPrYcqyZQzo3wxh+YNUTf5Vi0g0STh2p2IQJC+PXSSSsTbXwaeEpNnmwgIuht9
 Zvg9+SvGkmlVPUgLeejjqb9cUMFw9xn15G+VdbjwrQ1SB3QYGlipIEG/ngvLeAPgAgzknSEPaXn
 Qcmx64NSi91iwMq4nunQmVanXeHMmSOd7VDO6p3/oP6KC1UJGBOW18yDBBkJyYGFkm386xkKDBA
 ufGdQfd9cbp2weYQgqtsofrqUCGCkYRQq4asAJIGszZf1GyZmVARIEsBA1+ytvdOZoYJoIeq3+S
 gvIw8Mnf1rSWkOTTeAyp3kiUVvDJHk2EZ8P+pESItlqipXqWUkosDWxUEq6+anbuFJ8h+btb/bg
 22v9mBtlus5LxZUSRqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260045

Add the device node for the EVA clock controller (evacc) for Qualcomm
Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e9549d126aa50a0dc7a90943a3249..66948808d197bd17ffe65190b472bb845cba0eb8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
+#include <dt-bindings/clock/qcom,glymur-evacc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
@@ -4804,6 +4805,24 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		evacc: clock-controller@abf0000 {
+			compatible = "qcom,glymur-evacc";
+			reg = <0x0 0x0abf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_EVA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

