Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4614C10F0
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728019; cv=none; b=aqWGVncUlZeNdIocgd5kJ28/NmwMy0bAhPW9wWL4KQKMj7iAJsotYD9gkhNeYBrTRvOti9UaBycEb+ExaULt5Y78dA9CEPVNkmiePSWurywoNq+fd8wpuSbYMFVACehNQe2HmequTTQjEBnmtSWlL9pFxFLI4BcsdL6IHLJAtA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728019; c=relaxed/simple;
	bh=I1mRwR7K7EnzLPFseGGbpmG4c+9ay/Pl6zNSd0sY/J4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRTRMAscjXFYkAWRla3Yr7XuJqcbJsgUr01G96TlKiyg5Po8GdALX4WwUGOEijn4jNHhjbDZFQg5LKZ7exhvnIrZCqzx5QftElUJVQ+Svr4S35TrZ3p2jkyONSjjm9I51SMTEqWv9EP+INivFkvc0OOO6+kvGPGpnaEb+umNDF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UF1ExfZN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTmM5rYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UF1ExfZN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTmM5rYv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dPYF250743
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFPu2RI6hiDBD6/m0GKoUaVlJ12SxA5BFYsofXPkU+Q=; b=UF1ExfZNM8odd+dp
	iybtbJGMm3mS63gkUMW5jdU3EU0nHKFctcH6Xz+BsUqWXzjzRON5bm7lUTkjniPF
	g8c11R78qbzKtlZUffFhZIwddJs2DGtClSXFUrZRA6N+ABUDnRLF0Ye+zr4StahU
	cEKQzub940ny15PiaL41gFjNhFw1swNIpBMFIXsWtOw1FeYFTDozFYZyWer0ckpw
	AaifSiSAi/75s1yiYNBk+Dg3xUKlB8VOiDLb5BDdVsQx2U926U+IKKP1jwrnRL+c
	MInAMZ25YP1rqNqyqzPrNZE54PpzgM7OfgAR5McB8B5oSEHIVLK9nvW5R0Au3Brv
	Xqq3FA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2390ets-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:40:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1284110a91.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789728009; x=1790332809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFPu2RI6hiDBD6/m0GKoUaVlJ12SxA5BFYsofXPkU+Q=;
        b=JTmM5rYvW3qqGZ6u1L4BGP2EMeeB4+CtdrgLpWUiFN27rEKkdcapcqMtesUUgYQYJn
         9l/JOHXTwJPoQip99n1WJ30JrK2BTMsi8qxU2f7SNr7pcItHM65ovQfjj9Hz1S2Q0vPt
         gErz3HaWzzBX2ixebRLfxeyB48ynCoXneAmLERZHP2u+sDPGSO56sGe8YL/SqYmqc+GH
         0Lh3MsRJ2ejt/Oa2KT4nYmhDiiGrCqFUZprmSYZrgMbOSoyU5/phxyv6OQLADkESQlo5
         pNb4NTuB/cRJSMLpBR3sZtbQsxp7TTHmNKeXfeOqLqO83nJoRS6z0rX/pBwjRyBJU02O
         6UdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728009; x=1790332809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFPu2RI6hiDBD6/m0GKoUaVlJ12SxA5BFYsofXPkU+Q=;
        b=gPdhohWytmzlnq329PjZb3D7J7wvqHM95O7QXgcH0pQnycFeKw8zwQKjPtRFFrFO8P
         6LHp1BZXrD51i3v+sDOf+vKWdm5jj7OLkQcNU3v4E9l1t7ccl6qvkrIgPpSGmKDsgWsv
         TgmpyIb8tWutkZ2CUyFyPKxAbvvoXjavrP05N383ER7LxUrwXFgGVqhSQXL13/AQnZZH
         E8jzxpotOcRjkc/YPTGMM9L5GcxJ53CIUHrhvfdpHLxWvnNRzFNqpT3Epd+Qjqzgldnz
         Dm2d0RgIxwM/et+mJGWcR1nH3U6m6QHfbFcxTSdlwMe6ml0Qx4pcC7JLsrpYzqN9bg+q
         PptA==
X-Forwarded-Encrypted: i=1; AKwUvBzErbCOUtt/LN1qEe+kIAHjZ53srJzCMRW6O/oDmvLSImoV8CL/+3N4QB2CBEtrNow9Df1uab3wfS0O@vger.kernel.org
X-Gm-Message-State: AFuF++lvactAU566sG+kFitGZTaY0SnZTjAGmgIcvfiZCppAKA8xDkVS
	HHEWNkUnnyFGXFA8UDG2Jh+6QnHYFyR7+XsFo7z9l4JUnyJiKNszWbdUXM9UnblKhcwwUDevpSB
	DDnwQAUKOpdyZN5jajn/45dmShTif0NfhrhEmV9u4JS/GmuJiTwGLvSgj7S6KH6Yk
X-Gm-Gg: AYBFou1GCuZuBcz3KddSJR3YBkdCfoOzEgOeqiVVxWz4uqqoGKs1koDPEHDRWM/uZ0v
	R3IMtexc0Ecs41g9cmBDB1vr7XJUtYrJzIg5uTd9RHS8/K13uVxOlyN80K17LshHG6SqbLKmD7m
	Z39I1FMEUREYE1ZxKZF4lArkjFS4Nr0U4kTX9YUDj0U/6huCtyd/s9HZqFurYVYFyVj3DlxnMrb
	38wBX12EjTrRlpu1lhh2KjZYWzcto14jmpF70Zth9d8nrjhGy91s6VPplg8gc4ta+UzxFbNrEOc
	/848XkyyPHsukPzolChaTnbKrGWbzv66HOYlSYwVB8xOHJTa5gaNKm2xzgQ52Ymwnq4lezHR4Tk
	0pQ7a1if0mVl06WZTcwyMYIPdsA==
X-Received: by 2002:a17:90b:2b43:b0:39e:1ff0:331b with SMTP id 98e67ed59e1d1-39e54d37ad0mr4977680a91.2.1789728009115;
        Fri, 18 Sep 2026 03:40:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2b43:b0:39e:1ff0:331b with SMTP id 98e67ed59e1d1-39e54d37ad0mr4977586a91.2.1789728008619;
        Fri, 18 Sep 2026 03:40:08 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4020702eec.9.2026.09.18.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:40:08 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:09:10 +0530
Subject: [PATCH v2 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-glymur_ufs_qcb_enablement-v2-4-16619f7e36a6@oss.qualcomm.com>
References: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
In-Reply-To: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727970; l=973;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=I1mRwR7K7EnzLPFseGGbpmG4c+9ay/Pl6zNSd0sY/J4=;
 b=DfM4/laHLX4xA2mks5Zzb/g/4Wz3+mAzBmMZrZOblqmoTBlaIWSm4NNTAIkn7kzpKrmfwLqba
 W2aVf9BEHHNBGg51mkYE/u3/ijAPrIUhR5HVXUMZ1tEwXnoL5aCEHT3
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX5rGhwDQXkN34
 VdXNfeL8VdhRpv4pCyM96ew47XfuqmsWm7YKw9O7wVJSn6UJyEsfn+ywzpvncPUU8BemGXVcN1C
 LT2yrKBHfMukGZNpXOuq3j6ZI0QsIKM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX/QUt3RMyN7QA
 BiTMYnmoUzCSxaKKWYAKncQEtgXypBD8NYN5in0/l2n+AprEiivH3h1ImhGAmcF1vHc/Ot7gPKv
 icMcoQKPh7hlVbuGU9q56GIlItKCJngfSw/9XMeWvB4xguwpfJPEI+78kiz/5Nc/68Keo5st9o+
 D3MOikMWr0t8QUTrAp4fWYyRrtx/6KEJULjD7FvkO2d4yr3x3dgVyid7O9QhhYaJNninMR2VHSy
 dpsAQVTddc5/65IWb3dJ40jwZUxyb2z7yDRPwZp1deUWjozDtxcj2vr8EBZqdsdGN3j1BbWBAYa
 vmuZJsE/5Tpyhh6Hk6pDxZS3IU25jzFvWpUBzHH2Kb5A0CSh1stXXC9FcVMQ9fK/R4gAlwbtPUD
 P+KapBgDVTlNLXWPWKLfwGSsJ0LYe2sJpf2zTo8t7SteY06/P+YWQgVGPj4lCeYFzvXy15dfitB
 VR+MKb3qws1BmcptXBQ==
X-Proofpoint-ORIG-GUID: o6EtHBcg6PEIpP1LbMyqS7Gv5csNntZ1
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad150a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cMKPt8sKVRzp0kMMbBYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: o6EtHBcg6PEIpP1LbMyqS7Gv5csNntZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180149

Enable UFS for glymur-qcb board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f17181bfeadb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -697,3 +697,21 @@ bluetooth {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 	};
 };
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_e0_2p4>;
+	vcc-max-microamp = <1200000>;
+	vccq-supply = <&vreg_l12b_e0_1p14>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

-- 
2.34.1

