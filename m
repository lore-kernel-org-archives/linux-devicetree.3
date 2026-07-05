Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE7E3624B2
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238484; cv=none; b=rzR2zd13erY03BBUKdJcPFqlQprzwSproI0AbDyY3Cuv8cbvD4yOmRy17qciqY+csvy+zpngh59o1PKLsu0ods8nTiDpiO9qN8VAm59tYtqqpYyWRy2xni/8111s9tqXavmDdHGpd/Uzx2wGVOZoQr+KbcLAi2n8TEB89iQns1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238484; c=relaxed/simple;
	bh=tmq2w7iFHaSf5G1N9NwNT8S+dyPrAg6brA02Af+BVoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhXlRDEgckLNAhwrZXCQGpBeIHtQW9KnXlfshr0usQ91qqIXDuU5Nczq7cBeE7yzelRIE07OGqs1yQ3GRmdEiCBk9dgc/DSwTmF31okQDOTJqORSP9ag9XXaANBuGuDl4UMwnG2tgvVIVLCZpxPY91UIDeB1Quk6tMaYN+vvMLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUdwCw0c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PpDdhu7s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUdwCw0c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PpDdhu7s"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6653ZCgq559406
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2tXzOW+S2Yl0q+Uq06qicu2OVLdBJOKKhZnmt9rVFc=; b=VUdwCw0cILZ8JMr4
	3q2tqSbWj2siraqnE8Gnpv7whpKslc9d6eoRsi+NbHZmhTUdXk+w4NjYYp9dHmcl
	kWeHfhNilPqHWc1uYnY/EqWiA2RCxcx8H9zHxFijKH0xEVPjjdMWp84IcfsHtsQ/
	qRBgwoUpyNkqSl/7A/3mooRXdysh98qMNDe55QMtytTRkG/3uCtLYP0nJZg39dcw
	V4ZTJ6vBLZwUthTvkMP7nH7ryE4RvGTCAqNCLNtj7o+cs6u0GIPaPicWyVyqj35i
	CjZm+Cn+7Q/c0p3+yynKA6Z06hEwlqbdDMyk2VZrMafLUV11hsuLr16B2STe8iql
	ni/eHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnjm92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:01:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380c178acfbso1639637a91.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238481; x=1783843281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2tXzOW+S2Yl0q+Uq06qicu2OVLdBJOKKhZnmt9rVFc=;
        b=PpDdhu7sIX8eMK8C3sDedwsYoNVnGObh3NPCpBzSFGPA9IcYZs5cNktBSVFP8Nj93X
         U8weWnyMU3TQqFUkMd2H3/PP/J1e8VTVJqvuGVQ9gj4Hyapoqu9ankFdHu5lwWGX07nb
         FmOI+sw/gSYTVse0dAhygCC0M7bIoIpXZgoFbmOLHpxuzha9eGWuy1TLKmwl3nE+ixVu
         TblIcci3PuxYAUc1xGna0ESrWTaYBomIukOAKTfE2HEKKAitmaOSfF4dOyvjR9az5Js+
         +TSewpceHo6UzqbD0Xh5AuWV9iITNxQ0YbV8YTXgx44fjDyfW+HkQAuWT811ps+XwQv/
         cYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238481; x=1783843281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2tXzOW+S2Yl0q+Uq06qicu2OVLdBJOKKhZnmt9rVFc=;
        b=jp+4HbHUTtmm6KFYq22MUDJdsOISQ2hF8/XJ1aAAkXiG8/iWXa90V49vT5TKwNeMBe
         QoLNtFEEfDVDwEqH5iYqlVhoxm7sgZpYcpjr55ENxqYRiE4oYzHpa0YXBNE4CrlxkPHw
         OM75QP08s0Px56W+pfxNBZsc5Jk3x6Pxnwhj1TmadppQpHq5RamzzgKB9bm1FnXxXO12
         HJ7oj3dsxb7+yLu3qocP4tJohXhlaQbVkdFla/uqRJNF8VL63tezBstysXLKuBC/cLHm
         Vml+bFpkVRIsglzPIx4MIyzUKqJr3hlpZ/BqSd21mH1hJJ4u+jort2uQxMu00QhtLKg1
         cnrg==
X-Forwarded-Encrypted: i=1; AHgh+RpQwAcJ02ndDwgCpVEhDs/MMflgE/HpL4N0ML8pLF0sWNZZOFUXmDZdrR7xp4oVc+DcsNtu8JXwl5qZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzymDqlRenbGk0nJJeAyQLB+GjhlpjEK7e89dMF8TKhg9maof16
	KPU8RhhuIAYzmlQm/jnVudi/ceEu4MuMJbatZ8LvuDd0FgxW91QFr/fMFDB8FVz33HFqP6guyqf
	4yy9o/cjrwLdbdcLqZjUxkuqYjvxub7wsqmyL4ePhnZwd34PLoG6BdTF+o82yAOSV
X-Gm-Gg: AfdE7claAXou2oBAYGlM6i45i/Q72InxJN7PTn1OedWWftNwqStpn2dKpEkDeHymD2O
	zSYoza1AbW2rGFUlakBhmufD9g+NJclSJoLfMuxwz1tdCYG7Zo6AHpZO8wmZsMR3uDdYQmXWsIZ
	839wGtTgMAXGQif+5SsIdINufsAWh1MxKztvkRkDbOizgLNcg5cSZX5nogbJ0sB6moYRQ8aly1j
	7aiY+Ozz1/Dp+1eo29VPy98bVxGHJISyvWVqpdlu7yYRAhbSWy6M5TcXzqw3VaRGZMsHStBve1H
	cagXXCpnGfI8347UL9xIgY5FWfIV08kPZVPEnowzxDw2v3QqN1R1LNjxzXprlrxBridrfBs9/1n
	FFbShRIG6LxJOjqVHtlNWdNMEkkbRBRwBHqE=
X-Received: by 2002:a17:90b:3808:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-3829effb428mr5736458a91.24.1783238481396;
        Sun, 05 Jul 2026 01:01:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3808:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-3829effb428mr5736407a91.24.1783238480880;
        Sun, 05 Jul 2026 01:01:20 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:20 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:08 +0530
Subject: [PATCH v2 4/8] arm64: dts: qcom: kaanapali: Add QFPROM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=1012;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Rh9iMVK1VvEe82MbzfkSioOLphwmD07vDxc9YOX1LZU=;
 b=QirepiWSprygCdEJpVf63TbnYQtCy6LXKokXYpNSjgpaqD0KgQ7t8Cn3O3YrHCcD8otxXqu1H
 DORiZTSw4phC+My0GtSwo9tg4NvRUijt3W7PfDvv2IpCpJBeYGXq650
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX7NE0/wG/HekX
 WUy71T0fKVhaRwZlPTHJBGOi1+o2Y3LSqvpccn0qoxBbId+b8k+Lf2EcowyyLsBdqcrsisvL5q9
 29Zs5SQ00tszYqeK+TBdSIqsRh2aPG0=
X-Proofpoint-ORIG-GUID: QeAFsc2liJASba-mT4Mf3-fwSLp0pVX4
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4a0f52 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXyGzeAzbRRGBX
 TkmDSB2vNbYFobB+0OoWIg8ewD0DdwDP5YfYumEzVcLLkHukqMtUiBSjzsxbbOddZhYtWnk6BUJ
 43X5UviJ6/mCUzz1ovXigYYFVYJSUeRGIefux7qGBtfkeROmHRFsRKdq+Xvt9oYVHko2+KoWfS1
 Q6wiTfH6WGxuXcL/FZND1w98u6G+J7aUQAiI7mQdlgwphQMWlkYAqkayWfScPJ7Cw8MOQ1qDhw/
 o0Zyu5z+OC9g+ibuiC467fLlEUX0aSJWIwfMgUKZDgZipW4ieXhznhMnRB4tbeU7EhmM7x0ta97
 Sw4EU2FQwS9dhwe8gVIPantTCUzaHSvMGizuwDlrGydZntLGw+y0RNZ9jggiNLdicnFrPp/jzIo
 mIpnZOIkbGp0O+C5PXqejMHw4rv0EYEfEPRceU/eLcmj3vZBngZWs6RcdwHT25N3BpW5EDB6fiR
 h4Vqrj33APE/wUksWNQ==
X-Proofpoint-GUID: QeAFsc2liJASba-mT4Mf3-fwSLp0pVX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081

From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Add the QFPROM node and GPU related subnodes on Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 19eceecc2a19..8f71f9dc26e6 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5874,6 +5874,18 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		efuse@221c8000 {
+			compatible = "qcom,kaanapali-qfprom", "qcom,qfprom";
+			reg = <0x0 0x221c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@142 {
+				reg = <0x142 0x2>;
+				bits = <3 9>;
+			};
+		};
+
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.54.0

