Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42415358399
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238517; cv=none; b=laeYo31WmvMWX1t7+vT6IRbo4f+ZEN5g/QTLO+VAT+d1KLdDPiIXumTD4cUdH0VrVK5SSKZpozF+8ubTySGXomMsYur68oC66fNFpllBXaWPcczJvc/2iuBcs28KspvF1+gsRtXPjc2BpsI4f+qJMjN4Dt51AkE/Yoff02LyQFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238517; c=relaxed/simple;
	bh=wcNtHiPt37tRcLONgZr/t6X+o8Dp6m14w6rdasOzENQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBzPXLm8ex+PasLhi7jqtjj4Xq5PGQh+GsNtifA3XCwvYALrUvc2IOMEPZ9OAM7Mc3aGTFasx67O1KQanVzBZO3FCKcIBH0RiKOGieft4eXmsRTHwyv3Hj4eftIdVReZzxIdE9zL6Mgix567MQ2D+YioUvC7EDpjHitR1stM4tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYWEQSrA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOs92DdA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYWEQSrA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOs92DdA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665171mD183363
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=; b=jYWEQSrAUJv+G1cN
	bXwUmbtQ3c7ObjQG+ukJt9DZ40VEQ6PTa/xjw1+N2e3GCt812eSCQk+dPYd2jPfi
	rdTvb6I19xcC9R/SG8craVD0o+htkVCgDwPS6emwf2k6+vSmDtvS8BKtlB5TFCwR
	2Yvk/h9+K5xpEjlQR0+3/csSwc3swKpXMlA/fFjTxuekd8VW90Hx8V3lnn++WKs8
	uj+4EijZA6e929hOWVjRvdmmowQ8eOkNKLvKPDUsQPIEsuopeRVeIE98bduRFh/2
	dfKFu1+t9kKTb9ibDwtygmTqsxF/C+CdpJ9WnMrG8DllrNmWFT6WW5Xv5wzseDX1
	gULo/w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txej7nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:01:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810960140eso3053138a91.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238515; x=1783843315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=;
        b=jOs92DdATe+K26HJkn1IITKJ+snKneEUjyCfZfRC1W9xSDZCu8fnmg6JP3T+NhLB3+
         zj+ZDM+6x83kkmY3epvIPDtBzTFrwbkfvy8Cm8YsIbryiwlB7nmeLgD23eZuUeu5hjAm
         +Bk3RkpOMRBXo510aX8xveWtYijzLFQlth3SLpXKKYLLz6XPuURZgKRmm5nfVg+qGfcD
         I7UguDsS0TQxaOzJC3EY27MSrygVYkAcxS7XbSNa0dvrae8QiMvSc1MMlfQyeJiuBpCh
         cBu+VDR5bnsmQ7zd2XKp5WELMkC7NR70dGfrxoCNnhwT+cfscGDnjkt5M3VG+hjWaWHJ
         T0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238515; x=1783843315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=;
        b=BQhckH3+NgCg9xEzASn7VOT2oaErIm48HdXecJjbUGCXRn5eGqWoCZnlfamTZO+fhX
         AiouS8+A1wNuKyiQsuKh1e3xfcfOCdwhhnlQP4Wx44MdAbmcTbApMm+WTPW3u9rH+Jrt
         liWpPPCgT5gCOJe1Va2pX9179r86KbQ3al6JMdV4QHDFlgVuc7j7EZzMz6UPUXBZPn9C
         B87iLsXWxzu1jjvfrxSRnMWx+TY+NRJtKcTU6ww2lj1nvwnCxWtFtWv9NT4Fuatjg+/Z
         wjCZHui6s7ELrmkWLhGknIHdVwJ0QYIEL+CN90miSPM9Kyw7AuqE0Vsh/c9sNJjFPw1B
         UmZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqO9ZpGLMIN5JcC5X5mYs40JnzOGsvAVhSud9rVncpGTSrMLi3vD6mAm6D06CuCLe6EYKNVhAoLZqHi@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrdiWRQT2XaC6rETQe0AcDSaUf5v+Ym8S/NSnyqtmUNLFOFxc
	emZGX/3qUxwRAiBtI4mko6/LMUvSUDpNINlEljnWE6xy6mcSGv2uzTT+bq7VJwpumqEVU7zZUug
	jcQaA8K6Mqp154t4Xz0J5ptflNCeHm0s256Gdx46OvSeUHZtP6X48Y9D24nXgsBuO
X-Gm-Gg: AfdE7cmDwXbS+PxbAKEm1tkCFGCDQH8tpyxH7WVuMf7yaAtOBe7BjRNcTN6oj9EEjn+
	LxTZTVfYNjyTmn+oYMGvT55xB0FRGsuZCtcIau4Y1u4kmEW1lWCq6Yz5V0fOXuiMCyMTO3dGa0S
	9g3zISIG3QDc6NIAJsZEb65iYrBFgWUIWZFOaeiB0npL+pVJN9eEluVm0HGsHyCHtHGgH6lfl4B
	xiHdBwWun4OcCut/EgXPcXDkQqXITWZPi5UWG4AnPZCCLEV94Gne8ZyiN573q37qI03Rj6bdv/t
	r/NPkrTd24ceKpoErvlO9mUBTwtwE6X1z+nfxfDWxRIC6qOiskhxcJ2hY5NjNAhn9J2I9aDaIIf
	VMDmf3aosvukjMvxiz7xKf+1AfDw5zPLu/lw=
X-Received: by 2002:a17:90b:184e:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-3829f0074aamr5305990a91.16.1783238514872;
        Sun, 05 Jul 2026 01:01:54 -0700 (PDT)
X-Received: by 2002:a17:90b:184e:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-3829f0074aamr5305915a91.16.1783238514228;
        Sun, 05 Jul 2026 01:01:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:12 +0530
Subject: [PATCH v2 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-8-6ac53de56314@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=851;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wcNtHiPt37tRcLONgZr/t6X+o8Dp6m14w6rdasOzENQ=;
 b=URv+TD6nyF6fnwSALrkof6UTYsZQKMpZN6Rz87h3njAQB0CgJ4EMV5S7W8k1U/tDgpRf3l9zN
 cRBp6AKKgf8CR9cghxKkqama10bv835Kb/xUKijDgF/ifhTGcqEIvaN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXwHmpby7jtCRu
 bGZHa0VG3gWd/qG6w3g6QUfMQtbcpK9udwjn7GTjRPLZ2FscCHe0kr+cOzacijIHEao0K+XJ2I6
 omQrundcOaPbePgCq2FQIXuQroFnUM8=
X-Proofpoint-GUID: TgSW3Efh5SZqDsxP0Yyi-tKjkw2YCpCq
X-Proofpoint-ORIG-GUID: TgSW3Efh5SZqDsxP0Yyi-tKjkw2YCpCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX2ZeZtUIdHJPj
 edqowGXAKjYbgE4pVZgePG8d5GR/kFslNYtc73BnTAP4hacQvLsIru5ZMQ9JwYO2uH7C55/diik
 4XaljCPDffYAIqDHfZUqxXpNHKngmaxxCPSPcNwlZnSmbQtYPW7fTevXTFUrGZjK5yA6li7+nu2
 JyXFZsK2W/MGabRpwov8OEdUWDa1jd8PSBOXjSb9VaKX9pQ9BOwPy1+ICP7YLNRjWdt4PjPTB/R
 ShMEC0Fyj8AkyiNjEs7ipdMtIjrDq8UUu9Ddhml/XgAshovHZd9QfcwXPAOH8s/CV0TlgkpqvXB
 ZpdeCdBDIbvPehT0julOh1kcWBI3pGdFU370klRmGVDzhuYEbjfXm+vuLrC8Uci4JMExdNoM8Lw
 T8cny6cAmXVHpDOte9nrlI8UB8wuZlz0HHDwL3GIdD4tC0SOMlvXMLSAOWa7EUkOGkG/93aBU3y
 ZYzBCknx4KBg2WOUxEw==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a0f73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ckKq4DLX54o5ySWhiFgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081

Add the secure firmware name property and enable GPU support on
Kaanapali QRD device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..6bef8ec151f8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -693,6 +693,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &pmh0101_flash {
 	status = "okay";
 

-- 
2.54.0

