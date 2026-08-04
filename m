Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D770F4963CA
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865851; cv=none; b=TzdpgG7cO7qKNWHOCFXZijIG2QEO+28vz/oDRF72K3v0nyPQ9s78Y3oKJE120aJJQAD2q8IQwRrSOnciiR+OWNVmbDNzEMl6NCA2yP9vmlsoaEPge4Sk4R6qeguUg9CJEaC/IRA/N/qLZ/kaDOhMLlAun/LHAmJTvkDmdaBwEjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865851; c=relaxed/simple;
	bh=FKdRkV0vik5fotN949Ln2kZ8riKGXiZc629o1UfD1IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDWn02Rke9Oamuu/nXpc/nTWD7sV9daWXN3sqaMqw6moAcEga3EgfueBm98ck/xr+sJhMJXgFf/Q9TZ+w46W6FoOTbZGSnriEznxAStf0HP76z19CHKN+zWvOGi0FiEPuFV0hgrxrgiWLbKjE1wM1hXWmWWXW5g0Nb5TCn7Mt18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnTfGHT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DW4hdPqb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnTfGHT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DW4hdPqb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H0MDD580268
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 17:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=; b=FnTfGHT3qahxkSb5
	/ijMOmXTgkzHc4IFg8IvtAG5p95ZuTyDoQoAS4J7wz2cH91C5Lg9kDcC7YzLpFY4
	Rn82kO7sHVRw8WSaMwAQH4FKJ2Q+P9+qQyWzT+Vp+Ff3wXJdXISNxJxhsLT+FPFU
	CoPFIaUlcb3P6DQZllZXZ0Eamhn3hwHT9lJPMdo3wli+vpmnotUE/NuEOGN6Zc7o
	/4TPTLM3uKqX2tapj5UiEZo34N1Z91jxxWC7SLod/aqPfDXfIa7J2qyxF0R+WpWW
	xSdB5T8rVfYHYqV7d15uHMFugVw20WLL9I0bgq6oGu4ISYYXJ0UHR2+WUgFIo8x2
	Jv7Q7Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3q8855-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 17:50:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so41733a12.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865838; x=1786470638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=DW4hdPqbNjocs9emhSwAZjv8J+c41ZkYa+0eXibvk0NvJB+tNipIW9HjnMoxWCBV15
         Hus1otR+UdrqjfwYl57vpdUNNSzVlPXTHyCBFuTH49D7WoSJJ8drnixynWxa3MT1bOir
         QqG3Kb3/e9D/j6XV+zpGAHBms6Y9syFkZ2onTcJwZ259kVNPH1C5Sya0y0m6/v/rHn61
         hl0QQXSYgZQtNNehVnQTGexioiKDFE7e4mLWrzPKDnYvENyhgVPRE0XmYm6/HPLNfP6e
         rC/QP8DZzUqqpepMOBlgjpR8A2I2ufzfQcClmBtkg93Iz++lub8K7D6TBE6SBS6tq8XK
         ENlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865838; x=1786470638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=MegP8ZtRfY09I71pgE9hvkvXEWqWC68e3ySxK2MB7aTEeyl0FwWG5mNWeu34PHcZSZ
         8OLzwqBAuoicgICCCRNOUtbz5sIIJCaA2FgHMjJ8GaPVVuqIzO+DvpUYzJAd02N0jFwW
         qkHRYt9BOgMTDsFmkGtyqZ54iZwzE5eazcDUji6tCLDvlTIeuG7ZXV5RLNvFCeor+QYM
         MCleawXYcjiIuXYQv5j3wXByjzmHFfmuJbYoyNazvi3oK4kUpFwTQgp7XUvJX1y7Ghkq
         YXcx6U7Q6B7q/DHG4/Ce0L9enFjriGl9bLtXvqq55kVaYfabmxtMXQ7aX4v3qvK14muR
         0xNQ==
X-Forwarded-Encrypted: i=1; AHgh+RphoEP84Vk2cw5sHQi7X1uOFvqgqziNotiQSphdCuCo9ZJIVBM02KF0vQetHeA7mCsSBuwed3BhFByS@vger.kernel.org
X-Gm-Message-State: AOJu0YzbiDpYXrcympmJDeUuxLSmV5l2xg/wZrR/ssqhmuoOr7kkJpot
	azn4YWrnE86rA1ZauP4OPMgbJhT02HrU9FZjhkWK8TawE7cXlr4jxjH8u0QWmCC6O+UZTJcf1Cm
	mut2U63deRC9jijAl7kFtb6ZlIF6tnX5dx1ACFELCSii7aE2h7SnVzHxNFJ0Q44L9
X-Gm-Gg: AR+sD11wLey0E1BY5hSw9QODFYOGHcu41NKzMA9mOgDrMKjL9ZU/4q2dk6sy5pdYtUF
	UsJ0g1UgkBrI7ZsHhW2JK7pvAnkOz2p3QJEd0uPoHr/qFQ21EJp1JRN+WpYnJ/WYQKRVb2FoadM
	d6hZ0VE8hf5qAKRSRjNvZliaFRbLYIe3xEtj5P0w7YXz9c9MsAVQEr4NwyMbIPbm1Tu5wbDG0DF
	vBLGMLjk6OdxnZV73gRj5DD0EQqeFYpEbn56nxQ4tXymdiFTzmOEEBPEnM8mIvDdhtNKgaGUwTr
	AaaoFM8VBiEP+qVJaLY/BmNXXmG/aQ9nuw/ohnDsMTXBJyNPGchF/aZE6HEf+BRxlF9j04TA3Q1
	zEC9bIsOEy4PDM9XqIR+2a/qg
X-Received: by 2002:a05:6a20:d48f:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cb86027257mr488669637.35.1785865837970;
        Tue, 04 Aug 2026 10:50:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:d48f:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cb86027257mr488615637.35.1785865837508;
        Tue, 04 Aug 2026 10:50:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:37 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:14 +0530
Subject: [PATCH v9 01/10] dt-bindings: clock: qcom,milos-camcc: Add missing
 power-domains support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-1-39067760dc3c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX8qu+photvFbf
 Jp2vFcQ8Etn7GUVRZ+v7OhMGdLuoBdL/K4t670M66u1xgWFzTyl6zV/EUFRHkMGsD6HRL2LClp+
 FsZGYeVXa4Q0jaDqkumwq2IzkL3kfLC8e69v+3d9yjJhXpEFUXd2uIgZ8pl9qcm7F7CFnu/w8eC
 G2i7IFP23Gfx4gKyGzZ5rJAy7B7Mq7EPh4SwXLBdLK2W1W9ROlHJWRr4Z6h96YvCiteWBijMcKI
 pe7ZywUwaLtQiEzLG+R/bt2vVDsBlB26hyy6JNj5/ovJOB0hlqXl0VEGy0BxildMTHa/DzogPc6
 8OMW/C2u86de59gFHtfqON1GwUbBN039hLfP2y5+fg4vj5PjQ1Qg+NrPXKf/e6LVtyx6gDp9o0d
 TefdZGtYjYBJIbhydeesriutTki7sXilfl+ydpWtqgoD5JaLnvwIAlWZHujvH25nqNDIEGtBwmM
 CDlSfZwn7MnzYt3LDJA==
X-Proofpoint-GUID: 8mzCaeZJXlboF6-fZsjQzU3gb0J6t8-0
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a722673 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 8mzCaeZJXlboF6-fZsjQzU3gb0J6t8-0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXxkTM9ZJMJfg+
 RQH2INCoc4th7BcdP7GZMZB6s6nb6uQKdUY7nMzARwBXXZOuT8aCv1mWSv3VcIYr4Qosuv5KUs+
 f2hAbZAAurT5iYVe7b32H8nIK6DsLdk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144

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

