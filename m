Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9374D596A
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646112; cv=none; b=N++pVUwg9UWYo3IDqgUcSvIf9YyXgFqAHGvgUvSeRaw/71d1Dfsyu99y2pi7kop9XpmExzolxZLT5GL+uW0fC6jAAW0RjMc0biilQtKOVaqszXe5xir5cKFhHQYniYBrtZvMJOG3+Nqg7D7vw9xMa7O4A0WZrHAXec4xS7FRMZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646112; c=relaxed/simple;
	bh=gQZNieaeVgO3r96DHqxzosd4XX0UGWuir/0zzaJ4Df4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FD22J/JJhwOHFVvcevYRNJZkEH4/7ADdvSjk0SenKWKLz23HRf0t7ME30hm2nT/tM6mjH9o6NkuEDRuXsQ4NEVwk4IyqFO11HNB1Y1RQNAEV7kt2F/Ax6LbF9MMj3pXv1ImgM6kwpzMu3mp/n32rupG5ne13kx+Hj/mCE/hFTCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDHea4Q5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjFrUzbH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDHea4Q5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjFrUzbH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZkP81520224
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=; b=aDHea4Q5t0/5PTsL
	Ib0az978oOquI9rjq64Wm0ZJQvdhFNjcdJE8mcWDI9c6Ikpfue7gejs50wvB+JPR
	rtGvyPaoQb7OXvJWRF5ysv0cOGpjff3rLzakd1aWwn7r7T0SIcIPLUlBzGu9kMzD
	KaUkFf+c7+3MHLnIZanI7uBXs9rpjngs0fVaXtBxkFbqpDf5LoHQRitWigllSUas
	5iFsWYOU7/ZYN/FJ9rU7TN8RW7dealuovGsnziDG1tEfXjS3xog6dcsOCJYfOX4T
	yXioax8BtTPSIN1efiaa+/qBujhUponCtKpMYsICpYmrRr4uBNVPVbA9RM8ddnR1
	Xps4AA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hc3mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso1373101a91.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646093; x=1790250893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=;
        b=QjFrUzbHviyKwROwHgqfO1tBfbjFQ0jiAyjEpfcvVoB3Ubr0fyOaRg14yERTaUOW5H
         Mxnh5zSQ6rGU/r3hKfVsLRPLriOHxUvxL14wQk8ysI9np66N9gt3LGcM4HSobT+y/Eco
         QTp2N1B/RpuEwMOGfKxSqtr+Yfcmm7Z5jTTIH8fWjgZ2IaOlHP9OZfJM4LoLG+Xs4hZW
         atpGUrm9haHipHqLKjn6bfZpkOaHwS8SPxeUglJalNtcPhK7KBEqV5uhvYwk0YmEBw2W
         097Y0e3HJ+0iQsB48TYRss61grD19cn+Pvfc1YSRZpML1Z18A4TJb0fO/LhpDe6aAtqS
         G76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646093; x=1790250893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=;
        b=faGT4R/1TJYBYPyIAe3QDG89bLZWSpN8S9ZpS0NY2Wh5jvQ86vbGUCOcqP6Dwa6dPm
         YXs+mzpjLFNa18CmxzluHHAqZYHL6kAjqYivHUdDX4DMVeX/A5OxybNKUUGAg+kjCmBz
         +jesn6XyIIj8gryBBY3kkMTfJecX10nZIzVdteVdsyN+gVISVUqlfngRzc4WLqxuRnPG
         4Vjrxjujqg2/Ey3sDjfPuXI+Ma4oSG38I5XMudBhXKWIzFwan67ruOuo4g3+macoOyIN
         bJGpJolHOaIFwYQMxaZPA2HKKPTPac4jlRsdxsgm48JhqXQqu2/LZFkHtPrOW6+VCzFg
         gqNA==
X-Forwarded-Encrypted: i=1; AKwUvBw3n6uL6BO2mHr9C5QS8XrNHtKDyNDTnsxalHSLVyjzIPKw+FV4wMHYOBj+KRssJ4LgO1HJdAWM68j0@vger.kernel.org
X-Gm-Message-State: AFuF++kFuBmqry01q6qtD1prVYIGo2fG0+qLEguF5dYrp8j17LoD1KPt
	xKlw2/QqF14sAea/6Q/7+HAzjtAjwzuxmqYqiJOWgfwiRSx31r3AbyNoUKmQolUTwyhHw5todvr
	smgg7xGwgo8iPyNYGvAKb+qd4XC81TIJj4JFiKOk5c27CcnD6580IjfBV3C3KTyqk
X-Gm-Gg: AYBFou2E1ZrVQxdxMwOfBEzxFGE4DnatPhRnIwUBjsQ1s3s37OVJFRJH7iKzf54wE6r
	Xu7v6gCN2XTCvr482z6EWP8KhwQU70F46FACcR1UiNPpAOzDYBwWUs6idfpcQzkMY7FrqzBVIkj
	wl0MRRiyfmDuoefT6YsgRuMotIeEqHHf1SOBy1wI1ruddNRa+LQXaDyitpy/1qUG0SKCqts8Fq6
	Ljj6ozXLhtgIs2IrqfvK7WwuCOZ+GZK8JHM1zY1gPLTMV1BYuhb2QmnMYtb6rJArW7rVz0CsvoS
	mH7Ced40sIc076BPzpU1aNVAE58k5JhW59lFbBVGoWSq763krhZCGCJDMIouMAojicdssBlAyzx
	pcEdViFS2tqpxwlLuPUV5GL6JTdm7+feO1Q==
X-Received: by 2002:a17:90b:510a:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39e1e23d5efmr15033560a91.2.1789646092658;
        Thu, 17 Sep 2026 04:54:52 -0700 (PDT)
X-Received: by 2002:a17:90b:510a:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39e1e23d5efmr15033505a91.2.1789646092216;
        Thu, 17 Sep 2026 04:54:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:12 +0530
Subject: [PATCH v2 04/18] arm64: dts: qcom: sc8180x: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-4-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1599;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gQZNieaeVgO3r96DHqxzosd4XX0UGWuir/0zzaJ4Df4=;
 b=F7cxYQaXZq7rXI0CwvoamBxVButAINUO+PFl5RGSYPvHlbLsxJMIgCQ6uVDnD1Qzse/gJQQXG
 /8G0h8vonEfB5yE43KMvuAxX76brPYgLaEU8p7TWiwxG/0KoLgIqSvi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXwtoHDinAnRO/
 3JyejmWUVIGpjZHYh7SXmzNOgpPDBVK3p4v7HTnoAGwSGs1fG8K1+XGTgbdGecYNRhsgX9B5J47
 nplsnbgBq1UdqvjR2ENG6CHkvQ0xnyN5Rrd70caVqt5VbexTmDVH7XiTo7nXulZZx1pT0+EN/AH
 260+QL8Y42H6h/jvdkVa/VvH3mOE6I3GN8106amJKMjAYfns29q0rN2rJSHSmO/5/GoT+XgimEd
 Sujg5fjU63qQZyxfflNylUn547QLHbStwyVUsQDyGlH0DWTXSCl+zyfBSdAyTZiGGUYfJRhrUOD
 SuN3/9egeG5VGuh3jpyxGwNwJiBeKEnoqScq2nw9asQgAy00zXX5O3GUiXoBNceEALmA55gILNP
 PCKTMdDgwP3iGfH0xOGlRq9vxB81KwSGKgKkmW/ecu3GhE/xdTb3z5io9h/7q3L5gfXUgFpU+wj
 4hZQY9JUJLP89AFCKWg==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabd50d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: nByipVJBIYptEnFT_1n5ZnlLBhT-KE9o
X-Proofpoint-ORIG-GUID: nByipVJBIYptEnFT_1n5ZnlLBhT-KE9o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXy65zFBnm+ViY
 7uyd1vOk1fgZeSCr0iBIh4WM3hG5nQV3yt0vOzXTQPVvEHhWcrbCwRaBRC+AZrVgk/Gho/Ktfgb
 TBO2IeWuCnc9a5mUsdVIVuQW3LFuZCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 565e5a9979b1..e6ab523d249e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -492,7 +492,7 @@ &mdss_edp_out {
 
 &pcie3 {
 	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index c10a936b320a..327dba55a5ec 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -593,7 +593,7 @@ &mdss_edp_out {
 
 &pcie1 {
 	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 

-- 
2.34.1

