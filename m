Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6614834B661
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340862; cv=none; b=L7plaKSyZsetpfTxmqhYxHeWGWcV+32iEps5GFRyhcK8kmusSqJfPR6r3rSh1M731Q62NRbAppenYiKa7XlxtFbvTOJt687dJSALyyQkGuBlrZsVsAxPG3tQVNQfV9Jgl2icbMFhCcjmFwvuATKEW7gnpBD1U+7eMr73Px0PNq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340862; c=relaxed/simple;
	bh=mFv/QysmUlFYxGHzNJM0PX9yoMSbOWdo3h4+nR7jJ3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rB+CUAxafxlSJm0I7dI7B99BZY5RKdeXQX4d100pvE1uAPEG2fc7MyIKtTG4DknQUMkIyrnt6hd+Z+fZ76YH+Xux82RQW8o/2HBQATMd7nfumi7LOqmXaiYmyp3PrQ7/gSzhox+5gOjB0KSlvSy1dCBFaju+33gS1vJsNrvWmSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIGlN83U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCBO5LlC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIGlN83U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCBO5LlC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8CLIL2575776
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85Cq5M1441DLnhTBkum4V1OGWT2xKQ9wJzNrmEMCJpk=; b=dIGlN83UuJm0iqoy
	0TaMlt8IYUmusOD87mQj5Qh5x272ngFR2IyP0C0fDgy9C1sWNRod8XUdOkVEV8H7
	30DG1AjQSemZmXeXxXi+A5L2gEbJY+mXAjAqDdWumI/Xh1hM0lGzhhe2OpiPhyOt
	NNGSBBbde+1ozWpMm5CNqBfoBrX/i2QEJWHWHDj3ZXAOZYVdKZtAhtQ2U2LInXf2
	cbLPasSEnUnGZ4+fRSQ7t6YrZpmvxKexj3ZnBjIKut+POumMQohsmsbldhOSLmgY
	NSSWSKRBWaSHjs24cKktNc/ehC9WWENFeJulws7psCfTFevISFkSL/X7hcXwhyHv
	a/CVvA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27gu83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:01:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so442200b3a.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340859; x=1776945659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85Cq5M1441DLnhTBkum4V1OGWT2xKQ9wJzNrmEMCJpk=;
        b=SCBO5LlCQe6zbl00HK7ZdKBf3666zNBkE0zrepx7+1IwJmL654ALP6mfD5qsaFqZaw
         XMY5It01rOI+ccYF0NehgH3BfB8gD+1aUmROI1M4uu90WsKGi5X10rOMx9/DzQAuJx43
         Txwhw34aK93GqC5T0FVeAT6zd9IBov8SeeEFqDkqA4lbqqYcRzblooCo0d5F+HznsKlU
         m6NjJqcfvSISopHUEg9vmIh96aYOxlkLf4QqXKVKrk1smnnOSVNeQiUM72H0J7muaElW
         53QQL3KnMYfjfNoepnqsphNYiFMIAJQAS1PJxB0vn4mqmP1e8adJhNjI4F9NmaltOd4Q
         AESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340859; x=1776945659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=85Cq5M1441DLnhTBkum4V1OGWT2xKQ9wJzNrmEMCJpk=;
        b=ns1cgiCyBQrTFwXdJXFTySby9BOMQXVrtyHidln2VcCfj6dvUSVLISWpHnREaDCTSG
         WxU7PhkU3tFUMw8TidU9hnbcCccT84NpwKAIee8ljUCd4h4ExfZT1mA54N53K8LxMF6l
         flnQlaQXmQYmkRTrEG5N4Ji2xJVoRiu8zpHis6OWmodDf0aYqjgReY/j50EpWxLsbNi0
         FS8cng9zqvSfodnQ41jITz6IgnAJQcE5ukZOu38riDdAXq4kvrGf4GxyTqabj0Yji1o0
         qYaTT+6iWJ+gntzTihM3KaMKZ9qYLGHcBKdIJPqPwU3iyj/SWGpojQfpWysD66yPhBEB
         mhmg==
X-Forwarded-Encrypted: i=1; AFNElJ+H5ZSioJqE/hng+U51V7yEx5cJUuzU8JVOqlbfg0VUGP5ATxYRTx1X7dozotsz9v8ZIfif7yw8XZUz@vger.kernel.org
X-Gm-Message-State: AOJu0YyjrWpGhwn5pFgLJuMNPfUkkQMBJvz1Ry1cOCSQy/GAutjb4bM2
	SImT0eKNRoq2Z8laCF7vXipPMpUSYnPuomkfzs+MkDFQgto+cz2FcdIsHj1FK4IBEtZXmqBS5eC
	PORa2p4MZ+PdbvbQCrGni6raWQrbDf5QHLyjdZQ7zYi9lkfd71A9166hcAd72AYUT
X-Gm-Gg: AeBDiev8gBKbhV8RzOkn+ixe18fCKuC5PBU1pGwmzIXxlgi6RU9+wpDv1I3QGqbW2mh
	g7QMP/x0TlrLtMR4OL0gtcG4470UpqbRwlaEJILLggwGLDL+DYWAgh3cBeemc6/UBAoKSmLd4Gv
	TlNzMgYtno6xb5UqAkIiPIdqrZivh1DauzPHE2SQH5cF8oKtgpoIlH5OEOTHkontohbh6wgP4nB
	BdnmSUzH5XuExESUCsKE/X5oJSxuAuT+0naXtdhclF/mt3VRj3igR4oosVFz0rSdbTZJxqmLjaK
	L8e4b02hJfeWCySdoZOl9gZV6X4OaoriwQ06bAbFOSHYp1TvsCeHP2XI4aIZPs1Vx1EUH+XdVOK
	jIHDphoKZ5iG05+bbLGQHCjw5c2TwW4XAQ5JW4lPZDR/K9V4ql1oCz3ZOgQ==
X-Received: by 2002:a05:6a00:2d82:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-82f763f4d7emr3075778b3a.3.1776340859225;
        Thu, 16 Apr 2026 05:00:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d82:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-82f763f4d7emr3075724b3a.3.1776340858597;
        Thu, 16 Apr 2026 05:00:58 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:00:58 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:25 +0530
Subject: [PATCH v5 08/13] arm64: dts: qcom: sm8450: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-8-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1568;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=mFv/QysmUlFYxGHzNJM0PX9yoMSbOWdo3h4+nR7jJ3I=;
 b=6rIUbOHa3Mobdn5ElNpC5oH5siqhNSrqb7TZ7HbHFAKFaavnA3CE8Sb2Uf+bWE8h4UnvT9sEN
 B5e2IrAXoFCD6SjGogwZ02WRbJobAmOpzTFQ2P4KUzKy4mchl2MV01A
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e0cf7c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: qvW23SD7iEmKRVFt_ViSbdw2BIMbXRLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfX4z+VPpx8wi+U
 VmZheGkBbfCo2xb8pe6LOhWH44ukzfFR/z/ny8JiSMfQyjVsqDDGxQlAiaO0+gy/SHZkfNA04Gb
 rKipPiLqDveJlNUgctA24PBAdz5zW/I7Hg6Nurat0s4tjwZCfULtvc//45YPTII4HiAfIh58l3u
 qxB92ZyR25ZNKJdHsoBxek0VWzyUN+lm2f3beMuT/UDYM0T5rM2EatPat6vac2K3SPKz3rxr7Kx
 DySbcGsr1B5xsvSiQBzhK1NxwU18nXW5CBY2kZsSJ7sAokNSdqWurDiv4bwTGu8CnBBfdWVZzto
 SXPACeOOFZo245F7Vj+H+q2loJWlwS/Bacs9x2U6pDZQZlexvgd8wfjeFmZcSJPy38lJDmgP1MW
 g/HjnRe2Q1r/ef4RgxNMD9rb3SK2gxke7v9mq+C6CauJC6NU4mDXYQmjyv7W9CnmIuPsGRl7LtL
 j+dfGBc2K51cMZfplRA==
X-Proofpoint-ORIG-GUID: qvW23SD7iEmKRVFt_ViSbdw2BIMbXRLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160114

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8450.

Fixes: 86b0aef435851 ("arm64: dts: qcom: sm8450: Use standalone ICE node for UFS")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f28..9528baedf8ae 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5374,7 +5374,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sm8450-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1

