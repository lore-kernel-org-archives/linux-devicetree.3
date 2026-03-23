Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58390389100
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257595; cv=none; b=q56n2sHQIg3LhxkBw4urIgUh/xqg/MCMAR96LqC4E9vRLKrlTjK+I31X4kSsQSgdDnz+XDp4Sass5Bbo5JV7xMl8UlvjV50nQuqwwjttzfOa8bldEP++7xaDbJdj1PbqRohJEYbaN18g3lJDZDrKNuS9Wpl2MusSJGfqoYscoQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257595; c=relaxed/simple;
	bh=4gCokkHZ2GjRf5B+A9Zqx/4PsUp2LAmyJ4JNgVsWI14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CEo75jdAkj+UNTMXOg9yC6QgnRe5gxCSFaTMhYAgUR1WBkbfwpGnFossQglV3xH9mgCOThwOTvlcKA3KJwH862KatKNl7m3baobVSlOLhA/vRgqSQzyWL3V8UirjxbhK7qDBywjbqolYFVkfFkd0LCpwjAHb27pgQ2xrtyi34QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kddp+ydx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKXNudTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kddp+ydx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKXNudTU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N73Uba3385863
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpbpg0hPnfQaJ1hYQGaQ316b4Tnqdwkw1WSwGLLXo6Y=; b=Kddp+ydx6NynhTSU
	Fnn8ufuOmm5/WZKJ69ZFHmVLX7OLuY7EZ79mFTuDVt2zs3XjC5Vm7BIDUI8hXbRC
	FUAjBi+BaFQhG5uX+rRdqWVZcG6b3GRkp9Zlge/TpszsfmMEqiW6oQpms3IyFgKh
	6fdwj04WeicsYbcskgGAaAR10m9fzW/NCiZqU/x5K8L3q8iMa6QgNQOkyV43m22F
	YEq20AKdqOpGyoosNBt/G9U8ZStB2DVMPUDcLNieIKw+iYuW2ukmhCOfE+uPGRKa
	0A23Tm5UQN2IPav7V1sUSh8h/gyyuCi5IwO5Z/junGeLez7CoK86mskz6OG/1LJQ
	m6zQVA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jmg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35449510446so4329936a91.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257592; x=1774862392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpbpg0hPnfQaJ1hYQGaQ316b4Tnqdwkw1WSwGLLXo6Y=;
        b=CKXNudTUTvvT2FPnw11mj9AQaAqnNnFkTQiAn715iVftZ/3HiXklxmZaeRJwQqm57K
         Ezhu6kgPRlX5af54eo3qlrsXnqH/taM5In3c8k7Y5RQJblbp4TBsXxkZUONwkxphsR0p
         QUHcLMOCDoKVi1XvBIALYc7+casD9WIyIENFLWxUQdBbBMGOaMR+xJEmjL5twaxlbVza
         FR1BifX8qqFd9vZ1TAxikLiRXMBjGcA4UlOKElobIWvwjrBorqmSf1Z+WT9yGP46Bo69
         gG/Th3zevvNpkVOVIIIWvIP5/YfSch2dhwCvJ6wCexj9PV7f41209HDuycx9nneu1UKE
         IUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257592; x=1774862392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpbpg0hPnfQaJ1hYQGaQ316b4Tnqdwkw1WSwGLLXo6Y=;
        b=Myz001WEosN5LrJUuZK6pwnI3gZdCjZCBHt4t+Nlm4Op9AdJDEV8u/x31WWIrdrPYn
         T7cz7Msaigg1lYiuhV4vXDE0t66JYNymItml0pIPEUbijLIuT1BRxdrZ+moS6WaeKkPS
         cmWvyEQQjZm+Jx1WR/2pUQlUZdzo/dn9RC63YwKbNotaTJdxNK+5EhFnMXJfW5uYmfwg
         q6i/bTPFzSETCQg/hNMHvBlxgipx0OoDUvmzwi+zW6y+qdCBUgap/eiNsE0uQw07bB/K
         JrqZMVTYbtEMDfVwb08JlowuYFtOsI9KeVrsy4aOeYjQDmbvQmZefGXi277WGdB1dDf4
         9BEA==
X-Forwarded-Encrypted: i=1; AJvYcCVx7CwfzUE2YuOzoMZ1e/fd/urNXQgfu+vt5WnKJpphzbHxqG8kvWaFIYDAv2Lc8UE0t8Yy+QHM6nrY@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzsRG8uROfAdtrLbGeH2yRMlQqHTKLQOQPUOTET5s9Bvozf8z
	aXmQv3q9Q+1ulF/EJzDoKOYr4GIahAVunfThEC+IsBaKOWBHeE2RmOg2d5s65LAvk7U/jwXIzac
	/8I9rbbisbjndLRTDw4c1ezy3EFdKA/FwdajcblOAShwmC/jlDFv34UwaQkPVtEaP
X-Gm-Gg: ATEYQzycjtB0MHxCOvwncYv/j1ylx79RvOeXgqNsPt+488K8QtFl2pkznvxjgEbGcAC
	0d0CmMFQdG5x2knpiyLwZcNQ4yQ45zS4paECwc6MSxTz0UUiT3L1G5yTv5Mhfmz0NwpjsL6vVOA
	Nsem1fl0LyXLy5XOIpLOEcMa5wOlctopkAJmDZje2OugzpJKeexQWKJ9slg+H9KkfgSNHWKbwK+
	rcueXdZlBY845B7PpZeCJswgwxhQnQIGmE1hsOeyazeMeL6FI5sHxZbcgxie3I5Z/dP+Sf/PIih
	ij98AZDg2LtxL+1Mpb1uWxlAxsa9JpARMJHS0WcC/ORRdoAeHD01RphWwbGJBJBBxQbbjZLLvkr
	gO4rOyOyaqjAym2YcxHK31m76ma+5LOngBQMpF8sJrnJWbqE=
X-Received: by 2002:a17:90b:3d85:b0:359:1063:6aed with SMTP id 98e67ed59e1d1-35bd2cb3e52mr9251835a91.22.1774257591870;
        Mon, 23 Mar 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3d85:b0:359:1063:6aed with SMTP id 98e67ed59e1d1-35bd2cb3e52mr9251785a91.22.1774257591273;
        Mon, 23 Mar 2026 02:19:51 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:19:50 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:48:04 +0530
Subject: [PATCH v4 11/11] arm64: dts: qcom: sm8750: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-11-e36044bbdfe9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1456;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=4gCokkHZ2GjRf5B+A9Zqx/4PsUp2LAmyJ4JNgVsWI14=;
 b=RswpYVENgXtuJbX4xVStbksk7BFMx7jSFT0f1TB6KQum/olhlBcJk/LgtEnVSjBqp2WNzexDI
 j24z+9Fl6TJC6vKXj+9p1xre4eFuyfcqRcwxcl1ntu5GX3AGZpbp+7L
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfXyKtWHK+LfIZ6
 LUV8sbeCBABjoXjPjNDeQDEY7z1prMS6KuNy5+yviGtNJmHm26dMZ0uKlnHVO+2L4fKqOLfi+Nt
 JBnSEy/TTEmIARi91zWF52DYfSsi62EbegU/LbGXD0ytxwuq2UUb7U8iPN2oVnmQ8dUt26hldLn
 9v+8s9HQWaqdkC8nSVTYp569ozU2DCXHiGu2ZK97ZgA6Gzk6CwUy9DEPzQ5couRumUxQmPIGf2e
 Y3QHnKO8fMnjG1mlS5P02j1lLgd7bCju2x+y/IbYHrvnDz81InSH1HQeIWgw2EsQkGvEV6lKhnd
 /LEWKuCQYtHy0r08nRiWoMWVfBu+ESJ2BlQmdmLm00/jxeIIl9Nz1cLec5PFC+1og7cJadQEN8K
 T/DrtJIturGlI4tdvmiB/tZLymG3OtZ5IXOjbgqrngOpmhceSK5afacgtzMfNj2N24FTedBMWfK
 O6zRe2CWAGyZSrCWCVg==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c105b8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: zZefZzrkFS57fpdBV3gKfGj3VYgabmkU
X-Proofpoint-GUID: zZefZzrkFS57fpdBV3gKfGj3VYgabmkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
sm8750.

Fixes: b1dac789c650a ("arm64: dts: qcom: sm8750: Add ICE nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..8c33bc3620ef 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2083,7 +2083,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1

