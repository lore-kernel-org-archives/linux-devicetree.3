Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1B1282F1F
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153960; cv=none; b=c1MtcU6yY/PsivBcC3HIAzjqHfbnt/jVCwRywlQOvHFohasQ6F6WpDR7a6g5Ju8YhrkhjSkAp2PFXJo5q43QhSzVcaRoRvoU14HTYj/zyyqld2vRMxQ8I+BQJj1tDtePUOuiw6xkTwRebnNdL6CbCA45mLs5ITu8iThl9AkKXyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153960; c=relaxed/simple;
	bh=B60gwn2osJeq63y28HdBWkh+E7Nc2abnJm78Ob1pKEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QD6W4HEm5cXVQq1NA/jqp+z+XUU4muoBMpkwdfx+dgBWH8b1bJCQmQrRyjrY/xhC1471F16OxqHC8WcalgTzvD17297xPjE4f8m9oRE9I5DEFvSW6wH8id2xX1M/jfRFaseTczknPEKr4CHmCex+jiurpW15F8PwEk96JiqxyS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEoJN/Gs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yy11z1NX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEoJN/Gs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yy11z1NX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0P1m11617638
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=; b=WEoJN/Gsd1DoEOc3
	0J8Jgs14ya0EcUvju2QsHnJ29IayAdBDuryKZsSBAmWI4TKIXkOrbfWImSXsUbyU
	pUCttiMlhrsWnRDScER5fwRtWmmC/mz3kD+qPQD8cAdRalhGxQKiNX2DHN8ctTjO
	ZGSXyORd6dlZdLHChN8K3Xz1TAIfDfPRTzBxJr3d9Eid3aBs4CFdiqR9LMRTGWa4
	tgBT7WrkClN5HG++5Ri652W6KY1+woRcsA8R35F4r22yyhiHTYSEgJ/v7BOc/Ok+
	xWzJ1zblQ/+iEy/3kLFz95T99rNLEAIu13prOZgmBoFfsnH8Ppu4CBxXdax5pG+I
	IV8Bbw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79hn8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so4163845ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153946; x=1781758746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=;
        b=Yy11z1NXYzyGelSPSVUYHDjQq8WrESFUI6j0mX2YVib7fRvPtkEx3Dg8Afht51BjAs
         b6oapPdVyxzcrOPb6Er6kCl6gwzykSXKpJXpq3rwyBeEFUJD1yreCcSuJcama5Bh5D5u
         aT7YWx9rNxo+/bc7P0PyV0/uPySFKeDJdolAdCbHNIvyBvm8whZuHaE0+HSLp0CCdeJs
         8/RYMfibyAZe5dWOZHhjE3lh9OR948YoDwBO6wN+JMHV9ilNtEYX8bIwjL/PGE1HyB8H
         eBlbYCIUJjnftoukUIhNKXwWYTu6vyC6svRnOMPFyuYn8FBiJwAV2F3Apx+4QCxEXYBj
         xY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153946; x=1781758746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=;
        b=GgzYH9wj6hA/pu+lp4Idx1EjDIKxSPJKaYFzM403t1zyzR335/ldofza14a9ggO+jm
         WdGIScRWDQZzm0ebU/QtB/0jcRRytqfSR2QhdDsPOUYRfu4A+TwlJoxkFjRvSEx7NMQ0
         okUOkUX5F8zt+hdPoGcNxS2Tkzngp/RLBtdx0kqLAASuZn1b7n/gwzASn525liMrkwah
         w1e2d0quNAQr+iddUWxltz7qO5y22BiK8skbrlBV8sbnXnZIEyytkfkP2qTLBQX7n5wK
         a4W3mHF3foCql8WKNM29uTHGNuWJ9u/8TW0dej2ncLcYyA+aC7Mce0ae1ExSya9h9jA6
         Z9Hg==
X-Forwarded-Encrypted: i=1; AFNElJ/AVfc3HMH9d4fgtrfJV1bnac+cScuv4qIg5bZKlSkdouNMPkxQ0mo+8oQcew2H7TXxQuQfBHiZVimA@vger.kernel.org
X-Gm-Message-State: AOJu0YyQdUATPEm7hHmkeDiEWNBr5458LlMlxK4X+Yi4eWM4djd9lElx
	v9GulKirrAGS3m85dzRAjWqNczcBw2oRiT3LL6IW+s/34M+Z2szLIOX68UCMr/ZY71fGpVr5LCw
	VL58maDtqUIyIPielxaKPwsP2yMT5Vx+yXR2XOrfeU0u7fyrYK4yiy96ILQWEB75h
X-Gm-Gg: Acq92OEoIlgDCprtZPA9cJXGf97vY4xWGlNTRpEdQBAOuCQybcgVqNIS7licSg0rT42
	iq5FacmPfIFk4+nTWu6V4WWl+0gY/Uhimxq6+ZLGOS4Nn2F6mWMaMzzsHcMMK4uVo340T8uUEiH
	n6lzV9JVs/g5gS9UOEm5MwhM4BHnEZK6chZiI90lzhsUUQ2Rzpqh3ACmhSgteErSLQNjG/LbD31
	OsR9nYY5n3ZGXQgoHhGBocRLKus68f1TUT6VhgkExWhPCabUdldCPTjnCwcofxhhE+8Ivs9IpeL
	XtUFSPPAqZMiKfxe315nQ0kyw8Mao5ZVcn5i/rtFRhvbzUM75Vlba4RsOvkL1C6pwT0LNtkxj+v
	sm+oBvStsAWhc4xc6t/4mlvNa9UeM4eNqS9sFW2UDadNGs7ASiTc4Q9qaHJb3dH/DOMs=
X-Received: by 2002:a17:903:22c4:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c2f23a9918mr9446485ad.28.1781153945927;
        Wed, 10 Jun 2026 21:59:05 -0700 (PDT)
X-Received: by 2002:a17:903:22c4:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c2f23a9918mr9446175ad.28.1781153945461;
        Wed, 10 Jun 2026 21:59:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:05 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:39 +0530
Subject: [PATCH v2 03/37] arm64: dts: qcom: sdm845: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-3-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=970;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=B60gwn2osJeq63y28HdBWkh+E7Nc2abnJm78Ob1pKEo=;
 b=WAuRvAqZ0V8gHSSh/wAesBSkUyVvftM/XLTzCf+URxDgqm0vNhN9Ec8tYaoHHc9MDbJkdPsA5
 jjQ1jXdS/CBAkuFh+48CjtZjQ0F0hQ4GbSkHwEMyWeq/K8bCxM3fgX+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 6FhSQ1Y9Iff-xckV16psY66XBfFCATTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX7/5xK+BBDfDk
 BY0fxkb5Vril6hNj7m+7iF1PNsNHiHoCq/OXdc7VraF3lbx9VM00R6DuZOMrqz6U5W3SCYVzbSr
 adV1mPOr04CRN5pjpooHqgBtLAAVvrKJlmGnWmy/Ss5B/UfnkUAkK6AHwWjAmbxnNAfzAS+Y8sB
 OjgR5ofOkJKp1DW12xwGngkCSFeQZUyj41++1CSx2XaBeMNBmGJ7hAPZiG6EZF/lqRIOj65S9bu
 /LGmByO0SasitbNOb/YATkcJJ3ANd7TjtAgMP+vCgoOo362qxIcgtLBRs/5k5X+l4y57kZnfY+3
 w/OSMZuCJfLRgQpCdtF9wCfQvgam3lUYJWx3wdC+AFSpXDwk6gmwZpH1Wjbg7ojy7aW2W3kO9AI
 kaasUNjZ4Ni7Vu/6yR9tgIsI35oyhGkU4VDcjPOxF8hft9DTRtJer8klAR539Bylb0G2hi/aQtu
 ZDX0Yir93dQ2uL1bSrQ==
X-Proofpoint-GUID: 6FhSQ1Y9Iff-xckV16psY66XBfFCATTV
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a409a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX+ofO7S+fxtj7
 v/XZPo2rYB7NWnELAVLtqfyAL4blb8AtYsKhi8tbARanz4f5/dQ1DhYbhHr7AdM9MgidKvLg0Kb
 LIVFnQsYu3lS0LnVb4tMGNZq7kKbXD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 02416812b6a7..24c0e97bb122 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -619,7 +619,7 @@ &mss_pil {
 &pcie0 {
 	status = "okay";
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 

-- 
2.34.1

