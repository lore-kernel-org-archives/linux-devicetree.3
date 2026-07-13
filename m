Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A8B3E7BD0
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938401; cv=none; b=RzBOzNJxHiyX2+okqs8cEDmJJcQZz5UD/AD1J3l+72FwNsEEDq+vD475Z8Or1efVAExd9fNIVkIrj3CsZQLoVvREWyg/koiTBZqUZYqB7ZFM6cuzbAh9y7fEoTChUGJEQinv4Uzcg7YHEId4MWpi80W16lE/GMqA1Nj4TwVI3aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938401; c=relaxed/simple;
	bh=pJvORH2B0CFvIb1tE1AYLEqzkZUM4Vp2vEOH40sQNzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VB32CPNhqtComD5+e6Nex9eSD7PahKHLWuevCYnPFkWXYKYur2fg3eHsKmoO6Ov3tR9/Z7Em5cKcCNzsT5R5pYUX1CL7A5MuGEd5g16OQxal1qykeYZg0nq7sfnunF1bueWCSooyk9ZIeqUVX0tw7JlB5X0rQR1Mi2becLni1wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prfvBxaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HB3DxCi7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prfvBxaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HB3DxCi7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NhQl507024
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	db+2G2/jV4f6A95sH42c8phPYnw7WNjYfywj4FppW5A=; b=prfvBxaJ7ydTX9pE
	qUv1N1nEgma783NJaafHbHRhHlqHeZM/aU1OFuccHP1Zgl5J3lEgyli3t1JWsvwy
	kXMBwDNiNF3gRCzhA6rvA58HTiu3UKIZNu8DtCYUuyjuglRdIqrT/0AouTeueluD
	JoaNtKmRbMjlT/v1OMnd39IYZdNOCJIoqWU/P46JDRo7Al9E2DhMrIHlg0CR2j/0
	one640RtpCTX1UdClBEgxddOkJUoW5oFj6hvhMC4aph3Ev8/zofjT6GK1P3pt9/G
	NfV9/yO+RKpsGmJEOCHw/Lbgos9Z7KZ3prJT5o3n9tKWS/ue4G+qKXsYxyL/SseT
	YzzgRQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h1qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so2402388a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938391; x=1784543191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=db+2G2/jV4f6A95sH42c8phPYnw7WNjYfywj4FppW5A=;
        b=HB3DxCi70uGa02Q8B7FbCOdiBEkGCTtAl1K+I0xEpb+MRqA4XUQb0UzvAoCQw0LI44
         QRLHN0C/+kgZXcfjXb5cnp6W6Ybj/M583vb0gsUG+7J55d+wWfEYu2y9h0LlKoid5rtb
         TvASONInQ3JXYufwY2/cdqTmj2EScZzMZS14g3XFZUFj20aLMBAZZI/W8c/5JIguldwg
         hBto1HDy55M1B9QVGtKM1L6bzsy4F5FqtnOJIkMaluzAIvMkZbDgaq5DXiKGc+E5DRMo
         BqZLmTg+mBjiIPHdqx7gcKvKpPIvqMeRZt4pFof1DAdRmdLY512ZEEsqE2xpjAzFEXck
         JW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938391; x=1784543191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db+2G2/jV4f6A95sH42c8phPYnw7WNjYfywj4FppW5A=;
        b=FCFXSEol/ghx/fAKWqbueYqiZZsijHsDtxqlUKb+IIC8p3RnK/r8njqC2/F9/wDX94
         EbljydNj1YfVhNC8Pl3bgOvae/qQqNzgCUrR3P2IRKdg1ZGWzEgqfrKtMcE5VB5GzuFm
         kL7Qi6EPvnPUW5DZVMkL8Vhrw+i7C+r8upn2mUWqEkt66MSrRJPErLeOpL9J8dRhJWtt
         UWbAg70n0v+13wwm6yj3siphcpbixCDAq6hRru6o5SnyFtlfimC2aP0MC+WgB0FpL9TD
         PNxrJQuOkbMsui4otQCmf7MIJH/c82zxk3uw+2frxrRj20Ycq7+g5wu4OUgj5ddQ4V2o
         58RA==
X-Forwarded-Encrypted: i=1; AHgh+RoSw8eK25n0Iiss+2ekWTHrDCWgFKPGBICDLjyy3qQDO4aSMY6K2HfYOehWfpGibcxJPJ+IgvQ/cOFC@vger.kernel.org
X-Gm-Message-State: AOJu0YxLHEr1kN65p/Tj63bu2koehGFOCOgpRw1U3nVlBxHoNMc+/Iy9
	zVz5DVQDIuS2mwLxh7es91Pe1GNR86zLNvl6O5wO27f777BDYb52Qu5IPnoBU7csjb39kxXC7Jz
	vkdVoM8zPLNw0IBMpIpMIO7M/+/UupG709aUPW1PMvUL072Sv4nPaVC6jz3FDsrC6
X-Gm-Gg: AfdE7cnoVkPOKaaFWyiqUpZilLitDQIu+2edDx2oRym8rV8eAMPzZ3MY8R9ylkETWvK
	w7g2LP8dNemnL0JOqAga8EccBQkOnL4Ud2cWVbgr+x9wUQ6MWwZc6pBMawkdJ8Fm+GKSALueRQX
	Kk+RFpMsBTylIXbCuZnj/b6Niig9vyHzVXhuvegMIisXFIZx5N1/Ca5OWRY3w6SyTJRE3uakZXE
	r8HzVuaMtuCPYZdT9iSOTiNVQujmPnA/jk3XT/20VzuOh8U29nbpQPanR2osjIqgzlCIfam3AbE
	zb/Ccs2N61GwkuUPIIHk0jxu6W2PbIdJ9bc6NZWwd/MZR2lG9v/4YEElAg2PhpaJtxUw7TacSbX
	H6KignBdbzJXp2Jbm7NAbsHSN8f3JCL45/sZ0U37g
X-Received: by 2002:a05:6a21:748b:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3c110899dd4mr9265872637.36.1783938390728;
        Mon, 13 Jul 2026 03:26:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:748b:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3c110899dd4mr9265847637.36.1783938390322;
        Mon, 13 Jul 2026 03:26:30 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:29 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:46 +0530
Subject: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=1193;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=pJvORH2B0CFvIb1tE1AYLEqzkZUM4Vp2vEOH40sQNzw=;
 b=E4XHVkRxG5fZ2ltmKZ9kmfJ7/r/dU7c5zBhJjFxU9O0FNgFv9STh/UCnYCKnUgPv1ejQ+F/WI
 8wzNd6um93xCMjg1kjK8wqNNgrvHZW5FtY2gdkNvlJ2IOJ8bBxTUgFc
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: h-oZjmjn8DHW9arcJD-3DbZys3rAPOS9
X-Proofpoint-ORIG-GUID: h-oZjmjn8DHW9arcJD-3DbZys3rAPOS9
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54bd57 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RDWDdWZ4iDCRx9RkWiAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXzMCzsCUTvV9g
 2k37+gvRjZBUIkIXE+sX0RBK0KzkjTMtlexXH17waGn+cD6HoGlcCPMnuQ/I+2TIJdTe3EghIQq
 CGtgQUzlcW6oNjbeBFHKGbM0Ij0zsK8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX+VB5WD/E8iTp
 HAwpm7KH8zj5AxFt4f5UnjByKRzWYDvINKxK2NUVCCNRUwvHI1QOa4Z3sxIkuSR1+i2s38xtMzt
 f99sIM+WtwD9H2EFBbweufKUR9O+mMy9zJZ4xpVLajaeqBrHxMpPjzHOawksRkNRXIBHwnS6H35
 NkYk+vHjK7OuVJu5KbMVmUTFD6HwXxPQE7Rgxa+cCg4aIHxdBJ/MlnfzdvVGWTQBAZkHwef8RTM
 tf5SEwhyPzAiU9bh8k/cqUeUm13kaibs09od7aurLXvpczbftaQqnikn75RyiEL74ZjKq9nCux4
 3mvBcnh6aNF1UMdkyR2vl8bOeLlYImBcNBCv5bQdw2mi3+NbNaQETZBXliDiQ/qTI7U8z5wc8QS
 UgJqmpp8DlUGVvpLd0cx1J+Nzc2j82n6zAfgfzhFd58ec2tmSO8jjxbtgMARK0jp0lebAO7PSTX
 u+yhfUw+VZzAsQl1vEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

Do not mark MPM device as power domain since it leads to idle-states init
failure because of probe dependencies.

CPU cluster power domain node is kept disabled and hence CPU cluster will
never power collapse. Do not register MPM under it in this case.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1ebe2c40d64ed670752a680085b871..05505dc3b400e923a574bc89ec9a8e7382ab803a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -205,7 +205,6 @@ cpu_pd3: power-domain-cpu3 {
 
 		cluster_pd: power-domain-cpu-cluster {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep>;
 		};
 	};
@@ -281,7 +280,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1

