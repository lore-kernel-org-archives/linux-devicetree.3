Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32384A13AD
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865854; cv=none; b=qC5YufQp0DRJw2BE63/aZTyAET52WYWdrd0+Qxt5OCxBrNmxDTdD1Pbl4vR6iA4MfHssRM1kzh/pDWK2XzRra51bfa/iCO2aE+qYiQBVYQ6NG0KHmiZwqRW74RdFfzcWXz2sfIXipAlkbMJj7TpWKPiUjWGckD2gBXletV2WsQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865854; c=relaxed/simple;
	bh=YGVvXMXUYLnOZMf8Ms5rV1I/iooKVaJYiXlCUiVTNGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQUyK4qicE+Xw0MB6bGhcWo3U+SVnAmlJ63tRNZWr5i3PjxSA+kwOowt5LZXujO+b2HTYAGYOCUrPAd0cryUThHw9Fl1PyAhhOsgRBJXmvryK8gbO3oN57NVBSaAXWffbPUHy5bOxYAsyZ1/DD//WZl3sMCdSzf9c+njOhqFVGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHxsLfqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGevgd7K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHxsLfqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGevgd7K"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfUrs1254839
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 17:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=DHxsLfqdjvdMgVXa
	YmK4jdlhDcrc0L+8Q+HtCEOSh19NqDnTdQF0mPeunZtdn7bNW+g5/u8iM+yROZkx
	ZvQiu/0Et/0fZwmJnAEkbtowVB7WTX0ZoNR8yyD2KbofrcGy2CFg/tZ2mdfp0O92
	QPSuwOWHucgUF20Hov9wL3vAcITh1PLrNN9NWulKm4TrL5obijdn0H2IAtXSXS07
	qVS/0aII1AKut+2+jEsUhIXzPL1pDaJe1mPH5janKzWJ72M58Co9IJ4z3l0f2mVB
	7rkd4eEXyhvgKcJxk2HZFWZEPp9S8qu7XGx06GbS9Wq2g93oa3m3EzK7umIxDPcO
	mGK2PA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud1djd5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 17:50:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so80264a12.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865846; x=1786470646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=iGevgd7K8noINI0G99ITcpM16/uQEuCuaSb97j/H0mEIjD+O0UInJtO8xt+phLQz/7
         xtAaSO4/ItQryz7X4FwH1QRj3Mmk60mrd26SPWqGXp9H2SaRM8dylt2ZvcsDxbKcyrkB
         nvu4FVbzm4bGqb8h8Dyj0QtV++tPlIC54OJqqSAk8MwYo6OIZgv6LyO80FxOotrknK12
         l+uhVsORQqfaMsnh9wO+ngzJiEwn58mziq7RF0V1tZ2ZFC03Y/sUuPpIvm2TOZKxheTW
         iSQALG4YG/Rrfnsd3V6hxzTXjoZvIeOMtsj9tHzTDm7QjytGQ832GsBAlsBkw1KzgybH
         /y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865846; x=1786470646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=SnPcsgY4M3NMUunc+QWRMFN/kmrcCT275nkD1efVuWyyfHBhaITwWiejwP20LHcZul
         CokZ5bxWEUsLCtuA+IBsEZ6RUqDAX110fvyyj+r2AUedxr8L7WXG5uPsbJ74JD5EreRF
         k+XvJbFAu1BjjOEwzmnUaaJ1dMu5k/rWcVW3q4kAY1U1LDKe5ajL/lqEe4upx5VkI3f1
         MZEq0Yx6/Nbro08ioZRojfVmCMGvlo3oqa9QDAiCajy/Zqc22uAcswWuRcFZ1h/q+Dqn
         coZveEgs9I04QClQJFCnzCgNIdaJ9AoCEDGl219SLIIRVQgME4pdOryLUTZpFWPGUE1O
         4JWw==
X-Forwarded-Encrypted: i=1; AHgh+RruC29ylFIZRkqLnzK7AAjdI7+tqh1fX7IHRDypxGcQ6k6xwiy9rkIX2g6BMlQp18d5YPSuAKJWIMyx@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWeSJ/Psb4HLO4MHIu46VTHwyZ4fcfsiA76a7Ju6Oc7pZcmz5
	P79gHdoLqPLYsZ6PpPbZD+q6+/OI3wRYmv+KHx95kIQhbCEKRjHKQODL9hOZ2g/vV/bDw58zRKL
	nIp1KK2BezYl4xi/zg4eeIKblwkMUyVSin0Gzvqta/m8jJ0nvjNFAuMN5MNbj93dy
X-Gm-Gg: AR+sD11B3/ULDmOHy0d1OfL6aK6ngLs5PvT3kcBsQrv/RmbRVm0pTqBX4V8hQeJo3/b
	VJb1ITbQPmPOXGDMGSyrOfsCXKi8HkNMS2crXF2QslBA2iFwnu+q4iwmLr2pvur4rS/EZxjBsp/
	4P0DknrqxVUb6VxqGul+MmG+bMLztTrSf56PkjV5IIYeV4V/SSX4GZ/DYjKB6p5gu/GIBVprgeW
	qb/GRPOQoYa0+xjBwyTafnjwzDqpDqkcpruKIiR69uaXmNTY978un3TvElrN402Vrx2oNKVH+yG
	Ya3lxw/fgLQUbtTYOUD4B1prVUaYltzOdbdoh1UGiTBnCJIrYUVKHdFoGt+uCP8v0pWTNzO9pef
	E7EACx8VjHld5AoHq8WCIGUTb
X-Received: by 2002:a05:6a20:7488:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3cb85eb5c82mr580072637.30.1785865846406;
        Tue, 04 Aug 2026 10:50:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3cb85eb5c82mr579974637.30.1785865845105;
        Tue, 04 Aug 2026 10:50:45 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:44 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:15 +0530
Subject: [PATCH v9 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-2-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: zKRy6F9BwWWcOOxpLJ89jDzOIXOcY6TI
X-Authority-Analysis: v=2.4 cv=SJRykuvH c=1 sm=1 tr=0 ts=6a722679 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: zKRy6F9BwWWcOOxpLJ89jDzOIXOcY6TI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX7EoxEWAbSkm7
 VYfTSsq16OiYV4Lxh0wQzUrmJxEqMCwxkhJCeEJjcaAnotfgjKUL63ppKAbAL7m5klssj3P+R2V
 7HdeTad1xnjsKTj+GbKbl5+4B96uy9A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXw8voQWk5FqCO
 aeqwO15Pi0L/TDFDbcimukZjG2xNgcCXEIRIjOfJ/guzBhva5XYF1n1I9LZTugMts5PDlCqqlmr
 DExutnl+sYkrCWfF0Eoo+9Xp/pnfX4cBGuMQArJ7xJErDtoShhh4rgg23PxbCv5k9whEfTsf1CI
 4OVJbQaZSsO84FXeO4oojBRQLZweZHnAG07VJD+GGbg5zonGdbq7/+lf7F7PNtFOER5tvIS2x81
 Luv82Jb5bmBn10W5++X5hauWmJLDBlyFGno04ofU82RpRnUnEHXf/WzhNO3OvnKoMO3G5Sdqe6g
 H4McXehWwjtSkvlW50/55eYn5ABOuiJaWHuBO9m74ST10nwEBVgDNaSoPPdGnoJQaPZD7CVieg/
 FXoR4nTBab+bPYG4qovy5wH/iqDY7nk0zQjLsjRJhyN0TF9at8mEwwMixpgC5Q1a2WPaASyJ9m5
 0DIv02wPC2nN/waJ8eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144

The Milos video clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented
qcom,milos-videocc compatible, this is an ABI break for any devicetree
using this binding without specifying them.

Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..4d8d109cd304ef0f5afc5c3fc7961a6156003d4b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -26,9 +26,21 @@ properties:
       - description: Sleep clock source
       - description: Video AHB clock from GCC
 
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
@@ -38,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@aaf0000 {
         compatible = "qcom,milos-videocc";
         reg = <0x0aaf0000 0x10000>;
@@ -45,6 +58,12 @@ examples:
                  <&bi_tcxo_ao_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_VIDEO_AHB_CLK>;
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

