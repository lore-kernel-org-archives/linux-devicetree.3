Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C1440A13
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284522; cv=none; b=fULf8Us5k34iMrl/N4MJB077k4iIb+b9eUuNm+hLDFWCKrgjXbw/K71+mZAdL7UeXD4/B5uisCGnFaE0rt7qNvyJjck1gb1kbyrrpKyHu8rhTQB7TXFYkA4KOGyeKYuSq3fCbJFMtG3If4KiRgr0C0qBruq+zvt3N0b3DpKa6n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284522; c=relaxed/simple;
	bh=NMfZqugoEO/0q2ugQAcHFhaYmO19tdYtxAa9pCn1gGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=niwMiYVjKGZIgLZqrjC5Hj9Ixyx8sH7dxO2InuvWPjDc4IqfhDy6IpMfNFMe960AFhzV7gjM4JTI86n1v/PpIrvrDGpi/ilMoR/x+hKJw/5J5p7raa60ma9fgaMpmAHvS0Ezj8dqwlQBlhWb9FRphTwataDzsbgO+c493ZqnQnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m84GtUdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/yEfpaF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m84GtUdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/yEfpaF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdjrW2996413
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGkBawBsWkDYfJFvup28CeJU80F1RrPvHMm0I/iA3OE=; b=m84GtUdNnS3RSDz/
	2LcMPv/qnjHMd6nCe0Plp7P940I5ry01S6tnXMgIIZ4JgijUaB/F9l51/yvhErmL
	6jhZ6DvMjzIPuynDPZzho6V0mFZHBxQpeE93Kc7VqcxQhlyiIoyvQRi972OYZDcK
	VJJYrvTqULfeZB1kkJDlZXcVxgh4v/tQynmIq0hCMrqzY/LXXADTNJ5Fk/ofg6X1
	x5CRNCKDYbgnyhH84AwZPVpa3T7v1glpL2QDk7UtFrq0q9CXcUhewX3O1visyfMf
	A0MRxn2Wlv3wnnHkdGv2/dz/q3vwLF49FCE3uIrR6hQcwuj98I0I9ymPjcSrIAxW
	VV2Tmw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw46522us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:18 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so974934c88.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284518; x=1790889318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGkBawBsWkDYfJFvup28CeJU80F1RrPvHMm0I/iA3OE=;
        b=R/yEfpaF1sUP+zl2JkXsZcFn7dPHkHHN0PBW/8V7H0iZSJmKLp1jZ6qR3pxUZfpAN6
         nOS2hao1L1c/KEWG0H4rXdh4141SDFvffWRW9Jl+soByMaABVMpE1RVIUcCxmqAFTaHn
         esqxZxLMJHFp2G2YqjXwHt4pXlsqmDte9CSN7OjYpAQp6+CtlcN/BNiDw/jCvVLrvC99
         6d4vhhIvxy8AbZN4ZIuSToc/IEJs+RHjsBzk7T9RfIskI85xLLAoX8lnO/e32UbSeccE
         YQFRCFvMej7j+bymHvtb9RcVEtt2WXS0nn6X2hUepYTVsTgJ7wu6rbImV4Z/TSICwuXI
         eomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284518; x=1790889318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGkBawBsWkDYfJFvup28CeJU80F1RrPvHMm0I/iA3OE=;
        b=Rr+aXZoX/G/01UkI6KlC/QpUoH4Fi3wHJC0BUH6Klp+4iFO/hu6YQST/XR64jqX+lW
         3yNdI+VsXhCblIDRakZLtnbGPVkvTpYlaKnqLlITT4dkVDYb+9N/A5jHfYSqrkpDn31J
         ozUb705ARfi3VGY8nqS6xXIskABKAhUU0jmUwZ2DS75lIvQjwrLYvfn9scUwV7YRss33
         vyKqXVd76d7pp63jsezO8kuQz2Raf/d2QS/b3VVmp1Le/THjs3YReUzaDYysSn+6JWoR
         BKb6nG6S3MU/CtXAiyQe3mYcLUf1t50pktM9fu6P/yVk8x5G3azwKiYiq5RxTAcfgsxB
         8CPA==
X-Forwarded-Encrypted: i=1; AKwUvByKLqFFSyqQDVeD/PH45cAml/Ldr1Pgisnh+Uae0CQEMG+CCM95p1A9En/QUnaypDpkKbs0jCc83k6L@vger.kernel.org
X-Gm-Message-State: AFuF++kkICanqJfeEcIR2QNRfJBm6RQwYPk7jf0u04OTNjmM1lW2EwuO
	2W+cQP9lkShw7bfnu5oEnMZhgVB+7iUoyfQOXYGq0pqALy7RcTrUw6T8UvFLGoqafKsHY/JmOTq
	g34gqVYPK9c6n5e01sLPXFY4pBNWNCmrPG+iGHLGPzyTNpvlKF+0+RpMOKyohCBC+
X-Gm-Gg: AYBFou0w1H4CcTpCKGK+vJKGtFgfNNCkeyoaSHjNw1y41Q8KlYRJ3ffX6d1UKony9Nq
	B0/XS5JIMyw2+2raXJQ7u4E9UpvASpeij6xeT96Bn+Lq5LmYTsr396LpsnDehwlon6R7dsAYU7M
	m8ovGIJ7eDls1uKsS4QLhYRQq76SGWmUo2ulz97hyEMzc2Rp80/leP7qihjiBcon+5FECSC00Nb
	HhagPSqainLLrEgNFD2nXKJWIlUgJo01Df4IoD7C0jvZ3V+JDg9IvFIFFTwRXho87jBWtcTadnX
	9H4NzfieTbhbuojbcnz1PyQQGDeJdHHPyk4D5MTqi7F/f1vcbbkUNEDNrSGPvRQiycF6lOVT3gI
	yQL+6b/Byn9LKv1hJ5id9q6Q=
X-Received: by 2002:a05:701b:280f:b0:143:7330:7fbc with SMTP id a92af1059eb24-14503fb7d58mr2637775c88.21.1790284516714;
        Thu, 24 Sep 2026 14:15:16 -0700 (PDT)
X-Received: by 2002:a05:701b:280f:b0:143:7330:7fbc with SMTP id a92af1059eb24-14503fb7d58mr2637727c88.21.1790284515607;
        Thu, 24 Sep 2026 14:15:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:15:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 02:44:33 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: glymur: fix Adreno X2-90 GMU
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=927;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dqFAneSd4zL7363Qe2/8VcryWwTx+SO9Kj4pOL4oJBY=;
 b=Vebdhc0T+mrn5mzFGJiB8rbqLfgC1XngpTlhfJp4Xocf8bgEq3CCYSI3kLNcd7cYnxbcdvSi0
 6T9GY23MvQZBL0DnKWA447FGx116TyNTUJWbfajiYPcvipqc2JR7efQ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab592e6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: GKBDD_XSiXw6PU4u_D6WJhg30iPsJGqZ
X-Proofpoint-GUID: GKBDD_XSiXw6PU4u_D6WJhg30iPsJGqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX1u5hXOefG0FK
 +d04H3QzJfrs2BQEJ9waLWSWdd6OgHKQCsU9FuICnEDFF2r0cFWK+B3o8vvAwGU9aWBd+zkXnVF
 9Ha1tuSrOHc7yJKFSHdi/fR7N4UZ9kBLOHUbElRpESba8WdznqN4hbjKI+uXjo2nyeXq6WaZ9qI
 oIVCcLEKRBjOxO5bijMLx/c00dd5W2zSxYslvDyiu93iPg/k7EhuF3JrldPBPu/1f4nbcM33sfc
 5nvKuxQlzpnLb9DAC60OAlzeZpXlRriQpjtNWbHDthyRCR7UNZ2+ffGnetbM8jRgYGNZgVMmWl5
 dqES1ain/4XwbLdYfFYw97SGtBFY+tr2RwjZekJfXaO0zfkw+zXAdfnIV04P6zSJerKwRhpuGJh
 LwbxL+mecTZvIVw0aW1YiPyHRy6BJYog0j7sU9Xi65tjYlsEr7ejwvPnKic/56g+nEMj6BMuwQc
 LafFJ4Pf7MzP64EVfMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX7IbekPZMONTw
 OpgGHdxXP3KT+Rl2UbtzXw5rt3EQ/CYaiT/a5LSghCve5uk7zk5BvP8ZtDrtzC49/eN0NW8rz24
 ETkD6QxdHJ9K3NZBd8JcNWli7yv1904=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240086

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

The Glymur's GMU compatible was set to the wrong string
qcom,adreno-gmu-x285.1. Correct it to qcom,adreno-gmu-x290.1.

Fixes: b6ff8cec8aaa ("arm64: dts: qcom: Add GPU support for Glymur")
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..29c62118cec5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4286,7 +4286,7 @@ gxclkctl: clock-controller@3d64000 {
 		};
 
 		gmu: gmu@3d6c000 {
-			compatible = "qcom,adreno-gmu-x285.1", "qcom,adreno-gmu";
+			compatible = "qcom,adreno-gmu-x290.1", "qcom,adreno-gmu";
 
 			reg = <0x0 0x03d6c000 0x0 0x32000>;
 			reg-names = "gmu";

-- 
2.55.0

