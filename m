Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660E1471421
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390124; cv=none; b=Q7uGuSluwInUuJlRLM+OxTYxgrURROJh4egZsPYm5uOyxkgZsxU7Ii8Dqo+2969IpXXY4ff0WKDihSwcWPvjsDQHAunFPxTMg9MsltCcBGEbvi6hqfLD5gzrSuogKs8leDJ6uGbovbflHRrfisGBf33iFmb8Hko/Ox6Thpff6NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390124; c=relaxed/simple;
	bh=ZkmFL+4zdve8+1H8mYRDiQtW+n0qcgkEMnoxiolI25c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gXdjo/NkXigoVmQCUlKI52SVE+wtS5Fr+DhFCc7+/Y4gpOYj+UXelyM0HbWst2WQ1fQvzXVixd7gl4r6F5YotM8oaBWYvnVW/LOapYdVayJdlHbWNFMk7fVG/dA59hMKrMRlkjBJ3ee6H4MdtBnYc0CJ3IAXD6bTIKd3Bc1RApk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMS9cXL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdL7+8gh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMS9cXL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdL7+8gh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm9NH3291616
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3q+Tq58q/nvJFI7sZXUAz0iutxnjup093ZHF9S3hq8=; b=BMS9cXL30d+FfHis
	i84Ewzla8gvhwKjI9mVTCBWgO2WfiMhcQBHPMgpzODRrkSlvtfMuvkVmZ2d0wfyq
	fo7hCsL/4zY9nGEHnK+TfA0sdkQiZUmZDlRhX/W/V9mq73b7CCSJseFs5NxcpC7K
	exaAVRzuBgU3ZOBvlnrNyWr2opWX7eoiWhlhUGu9nPY1lzQw5efoZR0Vg5N2+vIo
	YRvlMWDM/YnjKZVNJs0pShyBSdn7XuxEVTu4/U6iBr2AjyvGQTB9s+3Vu+rXJxuY
	ZrvWQSxltADwn4zSw0ZSJ0VRQQMC3Hi6VOOjdIlizw5Oa1L+FhBt418XXrEk9j5h
	heKwjw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8nev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0c7126e7so282191685a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390120; x=1789994920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3q+Tq58q/nvJFI7sZXUAz0iutxnjup093ZHF9S3hq8=;
        b=PdL7+8ghwZPCME/oKilS/MVZNUWmwIBlFSM0LK4FVBbbWvWEIUZbv5lDJSBWYx9M3Z
         phbB1BdYzH3juVx5MyXXCecA75ed01wDUimkPLRbvhpoHh9xws2hzALz7GRh9bGFChQq
         wtJQiZpi85auRABXH7c7A3GaBEjSM+BwzB8dJGBhmemEDGOJun0jvqBe9oM2N2iukuc3
         kzmVpkk93JPtlMK2Rjcza6uRDXFCmzE/XCyrbTWmTspjRyj4cHlrklp6Hkq4G3pYuz1R
         7K2THrtaPAbGVxZLVu0ZdmCbAQjOt21JI5A5h+Y+o9LW/X2/LRekgF/7hBSjcDt+y0Hd
         rgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390120; x=1789994920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3q+Tq58q/nvJFI7sZXUAz0iutxnjup093ZHF9S3hq8=;
        b=QwkKir6a3MVorcKRSHhjCT3vdd3TQKcGh9chM7jYCOwIOos+tEb91cb6q9FwjwR1TX
         lKU5VWvtsKNu48zBbKtMkXpUcRAw1AShbkA//HRtI1h5llYaytvT8o4ni3lRV8v+mhDV
         qIlab3G/PIaQua1PN5zpdjDVt8m4r5mp2luowSEcZxIRCDFUeayHZY0U0XW75L3jw5ml
         LzjH5K9P4rxfJOOyZ6lgTNCSGgMc4+yuwgAOT3dHGQ8GUqcHx8Rm0aWpTlaRBSPTAdEB
         Ar+RfsM15nsPZWgWl83YosabKKiq/q4bQWgOaXo5rqvnU3h5E0dKHbM/dNOIuM6LcBKG
         IiIw==
X-Forwarded-Encrypted: i=1; AKwUvBwY93YltEmbjBnvfAhT/yf0YaB7w+j1MqbGuFDz/Xp8/cBPffdH1jKYiOKBhXXflHIyNkyrFb9NgZx1@vger.kernel.org
X-Gm-Message-State: AFuF++kfmUzTTxlMioDU6RS5rHV35U8NTffZ/emSKyfYKe9S19G6BmC4
	mFNBUBgawlSMkPT1/ettz2Av/9p2FLGe0Ok9wnChKNy62fLVciTUpOk/Cp/0OQ6VJuqdTyD/ytP
	d6FJ4DlX0+BNQVoqmmqqrFN5tI4odzNeT28kHNG3ZaLFjlIbNNwe2OBdXK+MzV2Ow
X-Gm-Gg: AYBFou0ZQ8wvDBNQIr9fVvEk1nsj6lBc0q1R/ReDmKqGE5fz7LMRLaEcCW9H2a9l9RH
	p7I6dssRx7Fm8iigoqRScEXdCyTbD3cywHZzcHuG4XDBdFdgrT2+H0ZXXmTW5/cksNSbmTHqALz
	TYVV8lnK/fJvds+i0dJQcg1QNX5UlUu1xWhvXSpJaX2rJ6wBNUzA6v3haBDoHf2JQASni+7GN/C
	C42Xkgqj4DbYEOfVAMlUHlnt5ZisEtYoaH4F0u6n+Od6FmDh9rkAJGuMOyZz3I2CraYRBegyfQG
	Rl7ubzX+5FBzMyaoCtQ4F+bH0GRd7VtAm0L3klLAslBmifqg/tykRlfB+z1/DlzqI4nma8nB9n0
	50p/LMNd/
X-Received: by 2002:a05:620a:6504:b0:93a:1b82:495a with SMTP id af79cd13be357-93a299c5963mr315570285a.37.1789390120063;
        Mon, 14 Sep 2026 05:48:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6504:b0:93a:1b82:495a with SMTP id af79cd13be357-93a299c5963mr315561385a.37.1789390119439;
        Mon, 14 Sep 2026 05:48:39 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:13 +0300
Subject: [PATCH v4 14/52] dt-bindings: clock: qcom: sdx75-gcc: Add CX power
 domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-14-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZkmFL+4zdve8+1H8mYRDiQtW+n0qcgkEMnoxiolI25c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zZKQeBV7wRNeQlpoALdPUnmK/IiYeRl9vrr
 ka9a47GnaqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs2QAKCRAbX0TJAJUV
 VkiMD/9BkMn0vVK5IqwcsGzY+1ukGFhnPn8184NeSnIYs1zBRmywT70IwWdOXciuNle/vWR5z7M
 kaYc3pk0PX6TQjwpxCill2Bho7O/Y1TbiUd/4puIwiVOZOOB+pMP1LQPj+Lo5Asj/WGRxPdksHK
 GRhTpO8+Ay9D5o5XRr3TkFFXNqZAlnq2OiACmLVH23hFkfPba4aWfhwRbcJhy9hLcvyFqv0EnF6
 dGlk/Jp7g0SFJw/1SB1u3Np+Hh1aHrTWA+OwDJJr5udmnrWARJggkBNRxzfIta7e7BGdz2sHlJa
 wOyYWDXOKhVYnMOOYl1Gugzl8pU/ckyN3mY5r14wQKZBFk1Gv79jxk8iqj3S2EltmHMyaUz8J87
 bX0AwwCfQ8VMFhJ0ZjB19G4C92vJig4FyRfzOK7Eq9cFOpmhIozM9womMSfZOAtkSindQfli9/B
 sBE+T47arOBQWnmY5udaNGsTN/YBlThCSv6iiKQQx7VWD/CLF0lzPYjWxdd97lPTwaFIxiGAw7u
 /yPsfu1bOVUpGifGZkDZhRt13q2L5A4Y7wZDlm/Lg0oyudkFN7f1JtzKoXw4hSsl0YQFa7V/1DG
 14iU4WHR4c/C5pz2Oj9PQZaQ7i6NjsJVgomI2VadM4gR+iW/xbTANY1HKPI5Gu0rSZitoGS94KZ
 zy4yahvOzBF3lHg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed29 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: NQO1rn3GBNRnw6NHmv5ufzf8KS-vf_Rr
X-Proofpoint-ORIG-GUID: NQO1rn3GBNRnw6NHmv5ufzf8KS-vf_Rr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX4trx7Dr8m0jE
 F1PkVmwpwDkXXadlzFY9xoMyAgOOj1IR64kU0B3eDs40wdFCYpYsKBpaZrKiq0MEGYLMycHpIO3
 /qB9+wjwdas9PwUf4ryjwvN9i6Jq1B/5wfoaraKxp6/CCA6FTYD4igTkKeNoaltZUfcP/CIKC1W
 3hnar2bBV4Z/NwyF+fCI8UGKWGiFFrmePV218G5CADQ9rVLYGCegfJjXCv0LMj6gJrHZIDM1q3c
 pm4lAjFKm1DLsmWi1bDIUMRC2blgOqxF8926+rN/vkUno0KifkHoYZrrQGmyUxqc5YGLwCd4ZP9
 HE/+zDi36SEzuWNdbAP4YiE7u7q0wxoMiPhXcE3guyg/Z+xBRoxjrcRBK2BVyd6xcZjWwCWzZDj
 vWTBmWT0CO0CZlbKPoru2g6YHcSLsX6cFaSkdJu/Kva8eho+5Cz3V4qQ7/RpSfxeyLikaUd9BY9
 pvuitZurZztqWCh6QCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX0NkQbcdCAnAY
 uQrQ1lf4077skQaH3xSbDm45G7DEFHMjvWgNUyGAeGkxbDrcSV/zMjIVQaFV92ZruUFDxVq41ky
 Q3nJAGFry1jolgdxJjmxkLP9O97kFGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

The GDSCs provided by the SDX75 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
index 29a0b29bcb81..75a38e9f3248 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
@@ -38,9 +38,14 @@ properties:
       - description: PCIE Pipe clock source
       - description: USB3 phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -51,6 +56,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@80000 {
       compatible = "qcom,sdx75-gcc";
       reg = <0x80000 0x1f7400>;
@@ -59,6 +65,7 @@ examples:
                <&emac1_sgmiiphy_mac_rclk>, <&emac1_sgmiiphy_mac_tclk>, <&emac1_sgmiiphy_rclk>,
                <&emac1_sgmiiphy_tclk>, <&pcie20_phy_aux_clk>, <&pcie_1_pipe_clk>,
                <&pcie_2_pipe_clk>, <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

