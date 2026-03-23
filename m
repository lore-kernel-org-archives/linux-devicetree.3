Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA66386C2B
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257576; cv=none; b=flyri6pN9RY6INS4/v1RKSWpyU8GCPBgTAtYl4lUvJnzsQmxKTFc+HLrECi0c5I9Hg5OyuPO/BHh4bbguTm3TxSxV5Tgue8fdb7D8N0AHi6F2gkQtm1cW3ZZEME3G2NidexOQoCSPb7vU8Z0PfKY6DQiYqOPkwauh8QnTMHuXfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257576; c=relaxed/simple;
	bh=VhZ3aS0klwApf9YYw27XCWDp7hkJBDX3kx95A36/HMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3/RFESXX7fkhFlotGkHEzOEwXMsh7+++5DOYmm5bsLQCW0Q5yzksJU5mbeeOhI7V2085/ZYFQy02kRkoKTFKBFXebuFbalP1Vu7rfbRnB8Gjlw5CZ/thcNp6GxKMZZyLn2C5VMXLYmzkxImt7gyuEVNjeT+Uq6KE/VEQGT1/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7qroGpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSDJiIHY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7qroGpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSDJiIHY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tU6W1627050
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbF3nOR2X7bJ5MMJnZ3zYoEV/xjt9CKDyAMFmhAWDnc=; b=J7qroGpgmBeQpDT4
	gxLyw36ZUFsrHXM6/2Lli+APbiJrbnnBoBgq2Cnafj1b9/YscXlCE/acNF7r8b21
	EZxXCStyRBAaMPbJz6pN6OV99VsGPgCYC5UCp2nOmnWZxkAZRTyp0ERRkh2/E3LN
	epoAlU5FzhLFIRGzYgfmL4yccC1tk4fACtxEDetswJ0CAYd5ARJJewYY3iTkwz0c
	QP0wtPiKecRXfa9YYfpYLFTz89UnDsqy/wEiEQlp5m9jH/HYBjsPJl7ayKxIlY9Z
	fgzuV1obNrFd/vVJUeo+PWKUub3d9XsZBRnHXuEcz4r3SC+eg7+iIR7Da0S6fvX0
	+kuYMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc09ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35ba237d2a1so3672904a91.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257574; x=1774862374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbF3nOR2X7bJ5MMJnZ3zYoEV/xjt9CKDyAMFmhAWDnc=;
        b=PSDJiIHY6AjOKA24364OJCSVI6pKUNNDjovJamibGqFVo2sMbR54UWeGvMGREuCs+9
         0k7iBJS+NyyLYNlvqkmpPtGt7naZkQFY5a3B/e4kSbIwJozy/at0Dumrwn1l8rP2pilD
         jP9Mk3EuFDBXMgGBBeAuwAj8xuczpkg6DyePHDSSDOOJR1bbTE5qx1zfJ/LPg94ZU1c/
         ePhPuT5RBqLWb5WJdft38VA3QLbZ3zIhYNeGJCwHG+9SnogWA9ZYtMs2Jlq1YjF8fp7o
         8+rLFcDwp8pVEhCXiD7y9qN1MnR+H/yCML/jRew/AYPYA32okNZu2WnoZlH5E01jyH6P
         PMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257574; x=1774862374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qbF3nOR2X7bJ5MMJnZ3zYoEV/xjt9CKDyAMFmhAWDnc=;
        b=im+Lhi8UyGwXnemO3BtSqEtcQRIqn5zbOT0akPxUGKknmUu16x96gq6/7b7PvDNNGh
         FUxcsuBVEuGLBnqypkjqHioD/jlEurn4X9AATIuTK2XR0Arndf0dwALm70osQFU5gj40
         hAaDTa/gvjQjbNM0ET5IEbC//y0fXUt7WQH68rBo0nYOqbldmMLWxnVhR/fGDYXZOLq5
         IuMsHPO/KF8Ya3MyXkQ0PO3jZhEh4i+wktSM44EtmHq1y/fQrAPltNrmgkgrbudEwPpI
         mV/Fx9OwAPpIYo9Qdfzyga/cdTCG3QNI5I8y1mF2NYzvHX/qRMRbLHJKtTsLRtP9e5mv
         NtwA==
X-Forwarded-Encrypted: i=1; AJvYcCXLrfm0FLfqdZrgeILQCvd/YBPSYYWuwkeQb0uHqUo4zAChkpeSflZRncbJBoiA7G/sjjE5kz3VwJV/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp6sK3/Bh9+YyJjAMxPFi2zHon/bDQ2bCxl2RqedGuAfbRQ8qm
	DWS63AnAxi7XCsI3fkhs+4cBhxx1ckdzv9TT+CCHYPmNh54yXP3k0UuQnwQxA+RL0kZf1MjDrAd
	448t4a0Efwx0VG1jShLNddSTIbMw/gT810P6LdohqTfKnkR1HGAUIPDR1/87JgifY
X-Gm-Gg: ATEYQzzObZr6amBJfwry5Lt4fuFdz9VDdGg6WXt8LDVHw0bU6+53UUwTTW6iHJfnWcD
	yvBfoxNlUj8upCxDMc8DmDs693GwFD0VNx0yOFHuYglW17xpg+/AZLIJO3Wm8XRSPtaB6rLZP/C
	9JCjs92fNnvY60hAwynQ5jnPcv0IY68gVvTsf/2/9LJOk8xz6GbTC/mmYhXt1CYuYIafKeW1TwH
	fUq5DLZxHM1yQD4iBzP7mQn75IGls5v6Mjlmd15EW60cH6bvjFSVFHnkxwowC+hYFmeB5ZQWYTp
	FFNESsb3FkXeZvNLp6K4lJu08cbuw2m+fUc6Cd4p9iLfV4QSWLr2RlrPBmu5tbWt4a8Ua921/+D
	U+tmU9LDIZg0xyJkJ6RokEtP2bn71diUlOWlKh3/XE1/Qm/g=
X-Received: by 2002:a17:90b:4a50:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-35bc60c773bmr12847282a91.17.1774257573684;
        Mon, 23 Mar 2026 02:19:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4a50:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-35bc60c773bmr12847243a91.17.1774257573015;
        Mon, 23 Mar 2026 02:19:33 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:19:32 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:48:02 +0530
Subject: [PATCH v4 09/11] arm64: dts: qcom: sm8550: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-9-e36044bbdfe9@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
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
        Alexander Koskovich <akoskovich@pm.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1452;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=VhZ3aS0klwApf9YYw27XCWDp7hkJBDX3kx95A36/HMI=;
 b=ziLvrmXi/u/Ru5MY1iY728EwAnpE+MGrhcdKhsiANprQbYqGR99rEMr4wvVnevpj3WKFmQYSq
 QiFkWFwUBYSBsN/f4yKFjp29iA0ehzJ1CU0MtRz7InoyKUilMzfpBSO
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c105a6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: T8bH8Z4YJD_pbfuh6msbaXYFI27xONdc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX8T4xmWyw7nyE
 /pRsefTBwW+Z8VC7+qzmYohkW1mVV4Lk6DK5JYHyfkyJXqdi7zwaACdaWwz4vsRvZSWxpTOj1El
 1MVKJVV+e5ER9i8aMijAu7Isa7NIqJhWoHs+niV4F3X/JqxVnrIuhDo9p7UjQcAKBsDucmhb/GI
 /tf2ecpdeYyw7ZP+vUCGJKTvTAZJf8nLMVKJ+QxyBHM/Ww401FgjYe1Z97AEPzr5SBwO/vyYrot
 sqRRuhS/eVutUnqJ/6BL7Lacz/c0A7R4MgNo3s0394R7yXqGv5JU0oHmrjXfFnq9geIegPAG7G9
 +KXU3NaAvep4uIiG9fFE9p1XzZnaZq0wFsz/904p3COYH2vxmGKbtry5yp2+FOxQNHYmKXn175N
 fR2xUOOl6Yrn/FgX3Wcu01TqevY5X+iQ0q4e9N+foAO3dFuemUKHLkE0dIYw5VQRy9zWgXZtdS8
 fkV6a44cko/6qQRl0DA==
X-Proofpoint-ORIG-GUID: T8bH8Z4YJD_pbfuh6msbaXYFI27xONdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230071

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8550.

Fixes: b8630c48b43fc ("arm64: dts: qcom: sm8550: Add the Inline Crypto Engine node")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412d..473fb4748036 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2449,7 +2449,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1

