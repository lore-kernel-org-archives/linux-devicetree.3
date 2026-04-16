Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA73A6F18
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340843; cv=none; b=mt1r3LF5tdWrEVk3hzcEjWXp9bGpdFUuMeaHdU5hytvFHPhp8fYa15KRReWcK80J9uKZbLCdfquy3mHr42iX3silAltBKjYfvhuNQ4HbhhZ5K85/9GsY2YnFkbsXAq3aI3fUeaQyFj3F3OHYbuktTGrhBFOXJGi2YKPnnDbBC7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340843; c=relaxed/simple;
	bh=LEbiblCKcyL2p/bVLgNgGMJciZnwnEoCuE0intdil4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QLJAyZcks5yaMhyFlMAhTmJVmkacH7H2Iip/ydCAAKD1QdaQpVEESg+zNDCX00rqTirh/pEGE0DR4xq3G1IiNji2a6sXDiF5Pyv5EbJL+pY0ohMP6rjXcHfk0gf8wXtS1IAAN2z3P30x76YGOOwNr/9I8LMOTs9LkG6vkdPXMCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/BzPB16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LFFTgF4I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/BzPB16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LFFTgF4I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6Prgx2654732
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86A3Mpzo70ON5GHVzRh2OgwDHBFC164e1PdRbOxYstE=; b=i/BzPB167eoItYdU
	9OoC66BGxpkflwVC2uvnkrsOoVDRXiZdEytwbPwbRadYLEiWCoFmWjM0V695gknW
	XklNgvRRubAxzmP6p4nkhWH8nZyS75Nj5M6wfchtsI/d1eGxTezGSoXys/fpXHjl
	GKf78gravvqSzS+s2jDu4Sb3u3PNZWh9jIz+RoKjDEl09zXnZEqvFHWFr/DmsvQD
	Z9BLLhc/3z6RGXEwTBElkjS0w5RWijrB76E01lmctzbIEvyOb1jTU0rdud4ROfiG
	rh7tG0Fg5/w/+FhG9Vwx7pm7lYBMrPhO9IJMUIrBWxhxHiyRg4VODqHs3xHl6NtJ
	ytSyMw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuh5qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:00:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f70ae35c0so712201b3a.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340841; x=1776945641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86A3Mpzo70ON5GHVzRh2OgwDHBFC164e1PdRbOxYstE=;
        b=LFFTgF4IIFR0IZjG/WWsfMy2cpfUqRpwLtmdoS1N/SBl2xtr5NirUBHthH9TVlCrMP
         7VNuK4dgJjcFYcMYlIzLHS8JbW/eJIJSaoXr159J8vfJ6Jnn7f3Ok6vjAdnFablP0Dhf
         lFIGWN6HxZFvvKnieh97nXxQRS/9C4gzmCCImgnhe69w/cQ5cwXe1rTQ3GjKB9ehAnZH
         Zptn0/vW/JSlJfMAVQbRI+QOB3v+MLDyReiChvpg573ZYtdWpkGaAa3IDxzmbavlalVq
         WpgWaiAvIzAB7EecsvmHiTygQ7B9v/GN5o+RpiPVgKrL2/nO0Y88Bx/qtqrd9/tY9vtn
         lXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340841; x=1776945641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86A3Mpzo70ON5GHVzRh2OgwDHBFC164e1PdRbOxYstE=;
        b=G6jZlHwiyNNJtfdlmHR2+gM1WBl1b/vo8RXM9xxbt8PhbvV2nI8XVK6lCUWfcMz9u6
         nkf/7k11Afv4kS6Mf+13+x7xeulhugQqCcsGx4vz92DHnSgAcyvj0Ro7w2Uf1QxqwzI2
         el6rbeTTNy1sLd2P9+MJJCm6h1jC2loY0Q6LzFg+ad4jVOHB6zrc7YFQcr2lQoXeexTE
         Xk0sbuySzZe3Pv8/zw06KG5iYKjn2gNjGxp/W/LbUduLQRAnV1JlxysISKC/7+NFfqh7
         J6ItO8AfWReDybDzrtPCkTUdVL9pZRBIWOs1T9IVBa6dp/UJH5yV7pSThj7cBQZcBEZ+
         zcsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rIYpH1675EFZNwhfObFWFUzg/i8YZVc6wV60kiLYegeIShFm9YRSsaMUsRAvmnvZgdZ+LOfxaYUxP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx6jnz20hWkFMYKsxqF+qYf6h5i/BE1zbl0ZFuajdizqE4bhnH
	uwzWoSylhWqFTFvW+jcWOZj35Kc+C85MdJeF1IKSTQgWo8kHxgaAXa+hz0OUJUmdk2McRTeQlnQ
	jzmEpfwh11yhWBf7GfjJjiareoHKOtqFOaEZRqaVicLAzH3829Q6sf4E0Es/n8FGO
X-Gm-Gg: AeBDiesB607BPUNbn1AybKh+fLHPQK9sDRkD69r5ZocyQD33VJ+CNPlDaMOjTD5DErF
	898qnKaWV6e5layjqk5RvHYyh1X3/eU+88eNiuhXDSMBAHketTXcNOm1yf88pLkbHcdwCCfUDcL
	YKuoYBc9svYPv8KWvXOVTw/hKmUGY1+sGbt0xjLIEhp7SqncO48zKlgfRdaN0+GYQIY0fNNQ0YG
	N9K80O7135tM9NRU9uYera5AnNKnnYW8OYTJcXTV3daRRVAdQuViIZoEtfpzF9/JSa8fi6POXOK
	rgL1aKHHnJlwhor651R3xm7jncrBcP2VVYmTofDR0NxFqjxuAjTFUNdvsEZ9fLUb/jXDKTnYEfg
	H/OPuGY70CDmL4iMMQk6M32nAWfhBa5GlKvsAQpNW1RDpD5e+ioZUNPzSrw==
X-Received: by 2002:a05:6a00:2190:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-82f0c3256e2mr25219053b3a.44.1776340840936;
        Thu, 16 Apr 2026 05:00:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2190:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-82f0c3256e2mr25218961b3a.44.1776340840181;
        Thu, 16 Apr 2026 05:00:40 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:00:39 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:23 +0530
Subject: [PATCH v5 06/13] arm64: dts: qcom: sc7180: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-6-5ccf5d7e2846@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1533;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=LEbiblCKcyL2p/bVLgNgGMJciZnwnEoCuE0intdil4Y=;
 b=0l5AV8MgWXyQHRAPJBcMxCawIilnbY7Jw1JjX7zKCnHnHb9BcISfQr55Jx094Ha34FtuH7hbB
 gNsHb725uU5BQ1/rJke8nrt1o3JL8W8fkfqg+kx7UO6zQIGyANEnVvO
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: SPxyYSrPiAe0g5v7M3w8s5RxWhs0TMyc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfX500xKdRmm7S+
 PzUOwNJHiqUYbuvDfUDZznOyF7y5C2J+fIlqLgruzwh3oBV/0uYfwH+EM/7OLitXPUvqFqDv3U4
 ZdZa2p5sNQBKG7DKrKUtu48eFs5M0laL8aXXlrXSUMcAODJmYn8g5b+LhHL130rny1Nv0zkHMnq
 eyQzN5U2/fFUKlYUgGerFAjchfTdJ/JWgDNTBevPBGGAZz3u8QxIBIhyKIMbIOeIR3hixQ5sHWm
 rRZ4jxeCRjJyWap3P2HgNQnfNupgCJKtK4G6PIg4j4HyZD6IEkOeo8/QdL9oAUcM5N///w2LK1V
 2SqV71+wGJq7Qb7JLkCwTZW5S/OXS9SSga+mvL5m+MH2yogXFFMRnT8xJ+8G1PTwkAtum0YDi7S
 YfBznus8JCh7cJZe5uUUN0yTIA+BAl2RIavRXMktxEcX16W+DPcQCoLiFwQTLQ4ZhC6yZkSX5ej
 kpl9SFPqM28sDGwiwxw==
X-Proofpoint-GUID: SPxyYSrPiAe0g5v7M3w8s5RxWhs0TMyc
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0cf69 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160114

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sc7180.

Fixes: 858536d9dc946 ("arm64: dts: qcom: sc7180: Add UFS nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index a4b17564469e..94a699cc2688 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1605,7 +1605,11 @@ ice: crypto@1d90000 {
 			compatible = "qcom,sc7180-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d90000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		ipa: ipa@1e40000 {

-- 
2.34.1

