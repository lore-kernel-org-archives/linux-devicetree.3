Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254251;
	b=IV3LArh0NTqC9I3uoFhW0B6EDBUGWQGwDA5y/umwUt9B9FUXf3aNLKjGGZYx0z19HLJ0
	 dZXQ15rKTTGK2iqrs8V/vIsCZ7Jrw2ISp0rPq2Hh4Tj3kHknPfdooo0q+iqyLsxXEuzyP
	 cPVj7zaP7+1saRbKyFauUWZMcCvlLyTuCoTQ2XipG6TD5/SbloEGeoYE9Rgl3zSrZ0EKU
	 lAXYmea2bGgiA8DB+1M2tGmhxBYH9Q5bwxxjLS+Mrq53Rl6CnxNA3lnJg8/wRlNHatEQk
	 PmTs5Uci7hRmZTUj3QjDR/BCrOVmhL3ozAF3z/bieE7pCD3WtNzCcx+eAhLLATTX6bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254251;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=;
	b=5s9fTjnor+bRps6BAi5auxoM1sA/Zmpuap4Mdft3Us+aaMuqWKmDUWPE98SFsPE4XY3x
	 rIp4d8H4TJt552T8nfrevNZi24/9OrIsb8SXcGyayELAlvmdaRZUP1GH5FqFr6w9U6Pq5
	 EdN7YQLqTEo7KxDsngW9yybTJwyJHhbpoM+uyndqA4q9CenYFNnCOzJpQJjzq2vEAAfB5
	 7syYpr4ZDnY1baNx/I4uFyt5k+/LIui0p1rMjtG/WracML6zkG16DIvJm9dkSSV5q99HH
	 xUzMc6FyOnBH2B4vZNl832RrIB4050etPTi9G4xVi3EKTO8v/S+4uc1hSYnu6kIkUAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LbY/wECG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hz7VUGyy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E0606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190E0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LbY/wECG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hz7VUGyy
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HD1S3341413
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=; b=LbY/wECGN1KdvcIi
	nOYfp4s9bizNGS9J8YYIPp3wLTVAK7e4pr4qQlovNW266Kzyh6hnUE0+4B2zmZXK
	4pirrCJLei4UsZP7fBj8r/AjiNioL5Rz+yD5x3mOGo1fTfHvUrwU/l8AaPzepwr8
	3D7Vr17MKc45so0DqI8Du2/FAFXSIRDyKPLflyIMZ2fV4NwyvealP1fITW5liNn5
	NeGtYm3HFL4UcQEIegs9IFTuZBEzPGaTqI71CZRv1KiyYMbT7Arr7whc5hBKjPa7
	PbO79QoUJAuKESXOfKZ7SYbMAthmUNxra0jnD+4mDGTP1GedC2ZmA/YurZGQV2PV
	3zH7DA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3gy9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:10:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso2091282eec.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 23:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793254250; x=1793859050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=;
        b=hz7VUGyyvyXqlFxX9wMnDWWThD38tUAEQ4Tn66zocGOkiJ4yqnEZ2ZfyKbfbvsmHoZ
         C1PsU47rAOhdD8tr6+buJxg8BzXEECeAL8Saacq3weGiupxPbLlHVwzyAPyOAGJMgqde
         khIdAEAKYGoAZz8ZlgGAhhAcqfDMKtLsX9VwiLWnDOp9V6rAI7GO7TCoHPyVflUAIpeN
         gGyF3mgFIgQgecxQJMvGtqxFvsBdSfKXPs0wtfH3KI16f0vpeaYpg/+XWO7TEGw9LXRH
         t/YwbZkkzmoMsAL4nnEebbzv8UipeC85Jxngqk2zKHXDh//ZTOAPjSn6v3Y1UQyJ5Rnh
         rMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254250; x=1793859050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=;
        b=IIKevF9/46bPB+a55H5mso+kj8O3oUCjI8YAUIHoHC7ssAKTuIMb1D8QHkJmRC3HUu
         1kfLe14AkkV3qFvmYsoRg2FL7dGi8lNyHicqfss7GSuObsPh9aIRVJN3EBuhdnGpFD5v
         QbYs5/Ur3rofkcm8h/sDam4KZH9jDvvl5BDLzsgpkMJ5nH0E6HHRi2Ujg8q3r/ElBFSc
         G8mFY3JRnHkwe2dBbzw4z351DblmccuLoaMIkco9ObPa9sAKDZnvGRf1EC25AsklWwd6
         6Azb3T2SuhFbmPUlQNtJmqR5F7Mllg0wSYu0vhVtE23QhvM7VjfAlfiU5B1WtHrPt/Mh
         PhJg==
X-Forwarded-Encrypted: i=1; AKwUvBwoB4C/zmPTL4uCzEOwurJTbcDGBG6IaWXvZI0WKUQyyrOf5HGCvC2n/yrdbLn0GeYSuJtuAd9uDhmA@vger.kernel.org
X-Gm-Message-State: AFq9FYKFJreStNaPalA3Y7orWp6RiNcXj2NqHYBkP6hpWVmshemHFnlP
	WR1J9gujgY5Y4ZqzqtxceGHLtUovbFHCtKEJS1FcqnyEOI53cXrXFOW8OyufPz0WXM/YpFOAiTg
	ALrb7KJlfGxhQQ+aphoF6UD8enhAwnI8kxRiWiqEqo6T3LUrp07kiSa5TByB/Uqzf
X-Gm-Gg: AYBFou0R6qtbaSlrMpEMlJlAddHpRIU1RxAcrDDL8LJp06OhXj/JgRp5G6wTdVD0+/3
	u46AWIC/zNFsmDeaO0fvc5WYK5hqv/jIHKyy7YJFYqhaNh+0u8c2mflP5Q3fgP+0aGTAOFs9EGc
	+G1I1f4LN3jc4uMgcGbfaOVtje5nfIk7a0nWIvNE0vbvXE5eWPolvdM3achGhF4UBQnOZ7tTDWq
	/c5YAn/1Kd6EFEux0IfKDdg/QdMMx536fQP8hhBO+xD2NHCMvScPqCAY7zNYN7S2fADKQZl7IqU
	xT1ajobnetAbPpi+++CwUMbxTyKpKJcCTi2nP8cUA7pSc46Z/6190ZYEi2FQYLcCzfwu0DlwaF+
	91z2akGS528aLt5HvXCLZzdReu2DEP/Spx9V4zCjL4ibVMOw0OLzLyQVacuAmX46plXW5oOAj5o
	220WqHDto=
X-Received: by 2002:a05:7301:1a08:b0:36a:dbb:2607 with SMTP id 5a478bee46e88-36a203ba789mr5853254eec.23.1793254249661;
        Wed, 28 Oct 2026 23:10:49 -0700 (PDT)
X-Received: by 2002:a05:7301:1a08:b0:36a:dbb:2607 with SMTP id 5a478bee46e88-36a203ba789mr5853211eec.23.1793254248817;
        Wed, 28 Oct 2026 23:10:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a2e29sm14038935eec.26.2026.10.28.23.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:10:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:40:16 +0530
Subject: [PATCH v5 1/2] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-nord-v5-1-1a13c214e89d@oss.qualcomm.com>
References: <20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com>
In-Reply-To: <20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793254236; l=1074;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5BpZafnsEX7T5i/WZquEyzAEe3ckLbNCfbpYPY2ev+A=;
 b=9/mtuPRHFjU9hftDlwFyl98mTojHjainBfGm9kDBYc3t+dgIKw/cai9hgOJEcUbaRVe05SckT
 /rPArPfRimAB4bsDcsiBYz8BUs5ieEvmn7qezfChXhAgp3aj7cTw/tm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfX3vIy+e+pfHTr
 RnXDfdQVcT/5h3cNEOhpb9MboeyEw8RGsWiQ1OBR5HJsaCS/OmNH4WgyXqz51L0rffKsg4wR+dy
 StVSuF5hJ9hTOwUdfLfP4kh+yIaPIUE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfX1KYkbd2G5PyL
 OniSPFo+NmKelDva7YsTEu1f3DRBX1WsMkH2qXZNQqJiGWnWCEBm94toCz9V7Nwgz5KQ8h8A/Bw
 1lcJd6qdhr5pKzfc7vjr6u8Oz+utPEZd8qFNqGTx5a8uK6rVheX6YhoCfxKrU2CjbmTidf1xMJc
 tWn9Rlnrph4bw9GZsJth2NksTIWW2EZYw9dEjtsjcLYEYbzhbzF1VPHkDSe3sXvGP7djNiyilEE
 ASL9ad8D7sqGFnycvgEPQInXh+A1ag1RMSeNWxzbUzAopYyMWocbMk7AqzFj1ZFTAR1P2aHJxIk
 9HmjzSvLBcjMjnL40a6ldVvuL3Wq4zrN2eUxePZXopr1do89TKx8erGw54VUj7W8H/Fz+jM0BnY
 LP5OGt+iwUeHOfWtCucQ3V7VXKAi5eW5u+SV8e1vo0CA5v9ThpIzo0xu7EcT2elpz3303ZSkqv2
 7XsxBmNf7T/ROdA70Cg==
X-Proofpoint-ORIG-GUID: MI01UTUQpmgIH108AaRNhZ5IqSUIjKz8
X-Proofpoint-GUID: MI01UTUQpmgIH108AaRNhZ5IqSUIjKz8
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae2e36a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290023

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
index 63630a814f28..b8ba2c4449b7 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sa8775p
       - items:
           - enum:
+              - qcom,nord-pcie
               - qcom,pcie-qcs8300
           - const: qcom,pcie-sa8775p
 

-- 
2.34.1

