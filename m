Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5425D3DCDAE
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273550; cv=none; b=Nd4FA7VBTMc72LSdNCJEUQkwVALun6hlayFH3fNiSG7ZdXkvNX0LvoA6GTbIXNHr9SOPZ5NdbDM5Tmrlz8GLbCw9CjQ1eJEtGTNLFpP1oNV/difceAB0bIRjFPyLyUO6QzVlt75U+Q5PnqTFw75rroQpXq41m5pn22TZgqVEMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273550; c=relaxed/simple;
	bh=YGVvXMXUYLnOZMf8Ms5rV1I/iooKVaJYiXlCUiVTNGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QjVX2BTN7PQGRwHTHp6XuBxa4EhXfWjyw7B6o00TNIioSX/EZ3b4ZhXYD69vxDeMgUAfSTo8MgaQHNM2qs0eSqi4iQw//MfR4TNOGhyUA3rY0y0DBRokfHw8h5Y3SytNOCVWQzSpAzq6Nwx9FZwcuDPcaXsgRRPbvLN8Lyh4/Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Py8LvuyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdQp3CnF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Py8LvuyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdQp3CnF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6chU21093058
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=Py8LvuyPCUYIugxd
	Mukqf1gED86qPjIRSzkMHAAQ2SDPMh9f9EHtAIZye6NLkJAHu0v+APtVuJZ7SRDY
	/gYgu91JHoE/72RYW58t5VG7SU+sjzN/QOTpLqI11qyGpTZpbhhcReQb4ct592DK
	DAbflv93w45hVGFolfXUKyx86nfU+BI3yT/BcRGjjyKsB8vQ9b0jTej3KoeIjY1a
	jTqzH5Cyi9YDkerkFg2AoMM2bEEP6zX7B6W0enyB4rF5D4tbyfXykCLCecj+RfQV
	uJTkP0LwF0ZnsQLXKcBUmT1QFWMb6p+GrL4FwzZJqD9+OxUP1B9VzFYNcfBBbvnK
	+bnK9w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0urh02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:32:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so102351915ad.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273531; x=1784878331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=JdQp3CnFwCX3aAZEpii6JE+oVhWsoj8S7YO0oLVgi7ywM3TlG3JZy1PDBkcNeF+UhB
         ZZ+ite/EXyFeqS2BO8qGIY9ykhyL9cspTBdI3DzcprRHAEcevdY5nbrPx8wze9MBwMRp
         qI6IBPNegYAAFsKd166B71ElR2ZYOjnD9FCwKZHytisLJNdmzDC7v3YDNP1DBxY+AuoS
         a0iwUDdl4ZtiTrVdXW3S+mOvWB9UZk6sVmEfcK1KDh8AzJWSzoaNhjV14jLgsnBvJhy7
         pf5pC4lr2niTZ9YTSmB6iPFYo4pVs3gXTH3jWQTm0F1VuohaFYj53hsmaVb8+Ed+Zpuv
         1mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273531; x=1784878331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=HsyM7sBhlBSl9iiDXtS9VICCg3PWfWBpBqs5kU98OJ7jOueg0Bn/tTit5yXt4f8k5R
         wrLkioAR6qcT9eRzZl0MgPIYGtaWPHxJg4zujXutSM0jRYcZ4pEHmzx3GnYOJAE/2mjg
         Q3BVbiy+EVRxeifegJXPFXBHHrkCdIo+VUomtiz6Udv9WLz6pwHGkfIFNlihe47SUnMo
         BagIY37iluLhkTwmyZAJYLmOW2kfdCB4Fi7DuJUqkcosyKQjqX5CSr4enIZ2ALZcyA7o
         RU5PmVVv5IWssVFHGtO6LLiD4gJV1m4G3KpeBXlqXKDDv1lGPeZp5npxYkqEY67s7sIe
         Nvgg==
X-Forwarded-Encrypted: i=1; AHgh+RoV8ZA+YgRst7SS4E7X/G+Fb1bKjkjnEFzXqgOvn2Dp3awkeyDQ++TYy4UUmDo5Ib1xt6e90F0uuOun@vger.kernel.org
X-Gm-Message-State: AOJu0YxSyOKeU0sCwDNh3khiKcLZWmX5aQa0o8DWSp5IUBuVl4kHJtWL
	isVeYaWAVHI6dWd9QsfYvIJAHckjx0El6b8dsgpApze5gQ9qEepF3LqiOl6+f8GyoN10EEnsxYT
	NsHoJgBti84p366k+ssRsM/L42nA76kpzlL/N/m9A9vTsN7gEiuUmVNaYNBD8+eUcUASkJtZn
X-Gm-Gg: AfdE7cm+4y9pUNYFfZVEHEkoBsIqPboUpVKYIKcBs+ALbS3k0Whg/guCyK3Jg6fFYRs
	X9PUn2mRKHsDM1ZDVoTadL/nDhXveBYaFHu4P6hyyKGFISqtkIXKU+Mr9m85EjJEp/IucN2uP6k
	M1VaOwqUtsM6T3g0A9iui9dYcd2GuC7LrqNLYew4Zep/qUdbIH5FOvcCCV46J6XsHcr+Bek0rrR
	iGOaLDKbQEXGDDG/InlaFRaRidyfschva/dTTGl9EJJhG6IhYV3RF+fFHuM2AGXLKW2QRVZodCv
	sRhFWZGAGz/vB3Zx+rB1lAGO1HoDfA47h+Vn5Ljsu1UX3btXFS1cSfTr3xvg97LUFkEZ/we0LcQ
	ZKMhNytpfnKGWs63y92WJTGND
X-Received: by 2002:a17:902:ce10:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2cf34a0a416mr15804685ad.24.1784273531043;
        Fri, 17 Jul 2026 00:32:11 -0700 (PDT)
X-Received: by 2002:a17:902:ce10:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2cf34a0a416mr15804455ad.24.1784273530594;
        Fri, 17 Jul 2026 00:32:10 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:46 +0530
Subject: [PATCH v8 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-2-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59da7c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX1HIr+WyA0o96
 rhAFKU0E0t9iBT6I2vPtiDPTl6o55+xmQ3RR32C/qevBk0gRhyeoJsLdXpU6yO85J82dWvAxua1
 7coIcQmLkuPrJCkqyS2Csbcd66TpPFuCSP1r/EkyfKmEWTsRO2Vup0WKE0VfVo98ifMNU9RzLev
 M8GZ/s7sjrqLawBhrZRniT72rwUX6kEeC+yappfjCJt7jfOp/YI8xYhKCz9HHfdLh2uzq9Ph1mL
 /JfOfD8fqLNovns1FcjoE2R7s3X+qf/E3Bpo6/pzRpsvhYezCkKXWnR3p+rE6y54no7kDohOnF0
 eZ2tr1KArgkpI4Ye9+BmW2L5/jRDjW0PL4fUKaghqXKvHJk62AgcDf0rXs9ygYOpJoiuz/eU+C/
 1SSc42gBMCSy96wyAtVGx2CsNoPc8CvJiELnfb8ym5n0L6pMbYWT20QZzJ3JLQth7/KdYsbHKCt
 fti+xq85M3T+4Ztb61g==
X-Proofpoint-ORIG-GUID: UP5YbpjSylG3HK2rGeRBb17ojPCTpa_O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX1tQjgppNlPxW
 JDCSkvMN7yDbvhHk4QmipX8WoATPUzeeQCszVvsFoRp7HVMz+6Lgur83cHrf9604coPKNGbfKUn
 b1tO879d0Hl+t6T8fskqahrjSFPMiJ8=
X-Proofpoint-GUID: UP5YbpjSylG3HK2rGeRBb17ojPCTpa_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073

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

