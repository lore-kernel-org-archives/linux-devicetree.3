Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B383F5BD6
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012471; cv=none; b=up4f2NbDkH4RKNj/VXuFKkooZ9YyqoryBtf83X40F1GUFKoAJ9EPbUc/gRvRoHprHHm7QLGQABkvbC1JM/BednG5ql4TYWHJtBCTcXVPHFUvuZ7xdW9qEK7D95FktWqIAT42q9OrZURtJGWLZwAataGNZAtTk6UrRQSWHlga2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012471; c=relaxed/simple;
	bh=FKdRkV0vik5fotN949Ln2kZ8riKGXiZc629o1UfD1IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TdHqM3wR4W8yKsalwf2+wd5HnYsD4gI3FKztv/YSx3/zLerOZNALXPo1qh/ylx79St2BOuWhBUmmdtuh8admHiiJ1ge8cG24iAtcTJ5cFZomt0uXt/rA2/7JFRDnt/VXD4QI9pfFmMdhAI6PIrsUAV+DOa/dtukU1PG/Jv/ZJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFsLlZ9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gkhe68fx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFsLlZ9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gkhe68fx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nc3T1227552
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=; b=hFsLlZ9bQOR/NP73
	Cd4tzSExM3kqVw0Ez5dlZ7+911bEkvP0Yz5fCgogyvT/F2AvyZESrEUGIVGRn3TA
	oNk4JoRNGu8PlOLAlJbcWeFgkLQlIdFz2+Zku3fRDB9RNimd56XF9AlscEUgmYYW
	UboXg6aY95cEmusObuG+V6scKNIemWIyWA03qgq842S4M510bKOVdjq7/nGInXkg
	riONp9HpICmia23gAHOFwmPABrM0PJaMPWla3aFYMLrlT9FRtVECTLWPUyueuV26
	RCCdkMVN+4YSZhVGFyAYrvTWTM7f8SA65dEwaheOe1+3D2KTmqm+LCGJbo0xOU69
	Sv6Dlw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqdugauk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:34:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848544a8496so2360748b3a.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012469; x=1786617269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=Gkhe68fx0+ggaEkEND54Oj0nM3au09yrGwgdRXTvLeJi7JCQb0ZAOIr5q7qFutwJr4
         tDdeYF748H8Y63gI2EcpCvQu34jZ8rMrJYJ5qmmM6/wNGjNmO+3VYwbDyAUNdBD6S1Ce
         Y7i1V5FAjvftumYTSD+rKPJAFZWzoezs1ojkJVK8L1QwdA/PZxJGX+qznQgmX4tmWvZ4
         qWwAfRmLrIoGd0pzjApZaQ/71NPIqPv96GbjEYS9uEFGZcJpWgGZom+74h0FHfPF5zgP
         49km3BRZAFjiW3DXxHduWHM798ad2SJc/ZmaqOtFWdU1y/qvPNhAOpvgcmHyXXp3fBms
         NUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012469; x=1786617269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=UFUkmO6hPG/PhGL0Oegc3Xu/MH3k97ijWaRy7219iaOYYhntWQnrSO9ZbyFjfKaht2
         oZUA18CPkJAb6PhJqQ2mwTHGNuCA9jeHh+YdBz20m+msbO+CmB523771w9pW4sNxxTWD
         2/iR+akjf0hp02dU0ucHK4oV3WPTqVjH6v9KvkfdQ/Dl0JUEfO3KUN45ulJc0EAInOa6
         GSean+psKiBHtcmNfAUom6HmLwTdpnvz3fdth7BRPDeU1Gb5dS1c8KWWiAp29y40lbOU
         GZS9ZnqFjQUT0VT1V511UYewL9Enh8wo4rMxeS1f/KmdgfrxsCNjxmrBtNzCNd7NKg8Z
         Th6g==
X-Forwarded-Encrypted: i=1; AHgh+Rrq7iv/k/dwqe81PLDKsGKVMCb0E4Qs8wSAX7JJNUj4gbFrvVRJbIiDiPgyPig8mkkDahZJbEwomkW0@vger.kernel.org
X-Gm-Message-State: AOJu0YzKMTob+53GWgVf5/JceXXbCGrX13oy2ozt5Lw+wQLCP4ErOMRi
	owDQWseM2iSduqHXd0WL0W9VgW/MAOm7QJdWDcXrbQsJMX+QDFpczuKKkgAKGg6JPyDDxkcXDeQ
	ZqNG7YhRB4LCUGrzESJ6ImpXu2878ytS6SNVCGQ/Mb8rRe9NUhOCP87oAySrrGE48
X-Gm-Gg: AR+sD109jcpJMwia3SBq7irOVcyfCB3bVnKEb2ajhr61Lxk/vtEqDEk+YsRCI96Nw2F
	9T+AmGbAx2cXyv5NwaAPW9J2ti/KwKMPUgskPZhtVDAx6Ifqk1LYl9rahDVRYH/ndEEiBGCNu3/
	v0NxGXSgzf6ClO1WeESNzmDnsekgwwmCIySjJQ2CPZhkOcWZ7BOfbF73Fa+dvRYGjXpf2B1+NWP
	btwqhPtLLwtH2BArLZNnE9vAaIwSbo9xPu+HsNu7/+XNuXPOBcJpjbyomNkRGC+sUBW/r5cDMGv
	dHEm30qTIiIl+hR54POW5KQymxM7wN99/zLfwPbmbbslJGydoKVFVQ4rCP40b914sA8jZD1MtJx
	nUap1N/4pIVGcqx147hJ1ocPk
X-Received: by 2002:a05:6a00:b8d:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84f4fd9f762mr441444b3a.6.1786012468737;
        Thu, 06 Aug 2026 03:34:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8d:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84f4fd9f762mr441336b3a.6.1786012468266;
        Thu, 06 Aug 2026 03:34:28 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:06 +0530
Subject: [PATCH v10 01/10] dt-bindings: clock: qcom,milos-camcc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-1-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: KUiSZ2O6uaD8T-YoZvpU5lTC4-NWWKWr
X-Proofpoint-ORIG-GUID: KUiSZ2O6uaD8T-YoZvpU5lTC4-NWWKWr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX5RGXOfRNsaJc
 mrhvhGyd+yzszJjsiqb0oWbjsa3dW2+FOLK0WdguIQnDtOEasWVdCGBmz0BhjYg9s/98LP8I8kw
 vu/VsCwkm67IKRYhaqoqWCd+OlAhP34KpH6F8ubaGLmX23u6wETXiuD8V65GX30pF4C/VlHq+q2
 es7kPz1dHNnwxYkZcr9KqGdii7CkayXlt6KDEfpKllA/qNvF8Zh3khiOMRXpTmeNNkC/6ro/uBO
 yVSBR0STZ4Tal8l2kHV1bYB0mpk+VmvgCu5pa/AcGNmJHzF+W05JX7q9RzUhBhiMxMHjsgrgYVc
 tGM1qvg7BZgETYv+k9tvM8eQALMqOUcqJ6PtzkKqMvwekndlz7yvZVkN/N2Pe67rCIKiWRt30eF
 KO1HnrkDbcBIOMz5F6oo1KW6yyyYtgbvit7pNm5PhoI+dzZkxnCNG07FqgTKD4RfNoyRGjtSScZ
 iALNccVmPiK7DCCi/5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXy7TRMFcHhGvS
 F8hgH1SMCZvgwnDeGvo+2XIZHZCiEP/gqo8ya65KthCXLIHVkun07trPBt504qYfPo5I262NkqM
 MxmX0cWZWYRgp8HHUjgNneAVcYPqUW8=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a746335 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060082

The Milos camera clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented qcom,milos-camcc
compatible, this is an ABI break for any devicetree using this binding
without specifying them.

Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index 707b25d2c11e601384b9b21b7e73bebf72c674da..c4aba40e316ca746c7ecc6955823c7d1292d5547 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -29,9 +29,21 @@ properties:
     items:
       - description: Interconnect path to enable the MultiMedia NoC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -43,6 +55,7 @@ examples:
     #include <dt-bindings/clock/qcom,milos-gcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
@@ -51,6 +64,12 @@ examples:
                  <&gcc GCC_CAMERA_AHB_CLK>;
         interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
                          &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1

