Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D717449ED7
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326031; cv=none; b=A2JEBrtPD+YIFlgmPeegyyQG5N6i/ImSxPk8BhuNsJbQCCK+i4Gl0jHCrubuPWL/B4w+NzyRgTHN34JJPk69ZxrUUnfMXMPgooSPpblkblwfm2CzI5vwi/I911hKEfppX0XorGW/uy4vIuZPSbMbfQ6srkjPH1IJwiW2SbCs1+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326031; c=relaxed/simple;
	bh=IHl96VfDfSLC8aLKVP1o5N9BHbNNzUMjoemjAMwnB/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjJCVj6PnNYxi+auj86T6ZHtT1FCNUcAwtQskr18JLaAUqgbgAazxHRe389aPlTMhgcJNtrA8iVDOdLYp7FgG19i69khJPr4WH3eh4dBKTtoVz2ha9yjkMX+8AA1ZTL3mM0WRlkVim0tf4KIN5JRu93L0VQ5OSP4slfBv6M4SKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFHOJl2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDeAik7X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFHOJl2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDeAik7X"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z2Tu3737364
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eEmsPPYN19I
	2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=; b=PFHOJl2V/odJamvHBpH1T7DAnCR
	njI9P+boHnY4U97nX0M8nvxKn0adteUOFi6vj4/8grFJAK0nuGbV/fPwJ9AJbUBI
	fQ7teuc1H2mFSEaWZEr8Grzy4VlUbJ8fvZWSeMTArv4lJRnFB7hcfpNTxsNrbAQq
	PSCtqxuvpKeNfzdB8p4FHalUsYMdwKzlI20ruUtxEiL7nM17qACakzHJfyl1eXoJ
	Vsk1rvGPWttafIU3ZoTha3/Vrfh8JrloMpkFqHJKmTGqVUP66g8hRdSSUk5stayR
	kw0bt137xQo/HL16SXVDb4KTJvIMpLNBWOheYCEUjl+24faORc/T1U76Tzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e3d66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:46:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so126753785a.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326010; x=1790930810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=SDeAik7XQ6aBAGo4w4wldCYpvKPp9u2ALEZ8vBMT2BjnoNfsT055aPvpY5ddRWyfjL
         J9I3J2ZGbY5XaKrQTPieUgr0U7GTvtqgkbGnbRp5+XDeofa81Txfuu0XWgqim4e+p8wE
         lhd7uHQtadsGRjlWz35wwcWRI/+6kPNPMArDbD17kr/2PnuG2FgIcr23c8EnMXhtYeU3
         YOC1E1WXvl0OjkyWVNe/82GyZ/1vO2mZSoo3Yj/EL0p2I5vuawEPWm8933ujTyJcJic6
         SL/5f9yQCVa7/qJNMrNWcWdpjy0IFJHajw/UxkPaHuJJb/R97S6izclrngnAwA2Y1ZDh
         YKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326010; x=1790930810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=a/vY3ihQsFt2DE1KKBH3MkxPECzJIOXFI418H0zUEjYcWGoj6MtjVvxrl1wcoimRvS
         gSv7fGeREty4Mx32tmNcEnHS7EoVtZcvmFcpTNzatByEvd4hYbxgBczX/SfPy7sLQIS2
         DAl1bHIrtRJklbLjrj3p6o/QBDqWK8oA3O1CceOJWrssJZOLk++qpK98KlKQBfiTGF3y
         Dd678QT8lp8T9xGTwQMVwhPEwj7c2zd6xR/RDsP5ELOJ8auILHsd/kAIFnGUJZFyXSS5
         v/iDft6CGK0Xm4JPij6AP6G1mY7DTfEqey0xfP0zf1du/GXKPSU4aKaNDNSyVMwcMeF1
         gq6Q==
X-Forwarded-Encrypted: i=1; AKwUvByD49EmmgqULjT36WoS8v1imLxn/gJnOOHY3l19YbOHWXeg2T0HkIFsKlteDWnD7niOlrHr1hk0OShW@vger.kernel.org
X-Gm-Message-State: AFuF++lsQFI6QIYGtAwmH3ug6Xzv3mnE2xqAKhGP7uok9dOL4/Seh6a5
	GSU8zTnbAyZjxPSvc7EsUzC0PODNuT+luRMLiobMf4QMyL/Ypj95GGZ5j/XIrzb4/5AX32HxmZ1
	5Tkx2ja7C/zGfRQpuxnGYPgKvI2KZ5bHrFvLiQg+Gk0OYT7PQ7awn9i8mJsCKgGCV
X-Gm-Gg: AYBFou3Ju8Oxws2eeKBV0pIrHh5Ibq2WlECMHANqHpPjD1JTFromL2K49OJrGQgYwpN
	5nAd2+6WcJ0soXDOHOcu3upBpvI1aVUVnuTels5gpCC9qM8V982SB0bsJrH2KUNs8E3xjeO1Glm
	h20dblYTMJXQ37zZdpiRFDD2+UqmXyxSe81XB+52Oa3E0SvTzj2qjo9aYLpKAz47nznuZAX8MAq
	ubzUE+iiqqo/9gWAD9aCg3GnpzaEsn6nvq1tk/OzhauPA7EcmNDRxDUTXtlPH0MI4KDTvc+lggM
	t9/J2HtOXkFytwBq6mwA1D0wm3xoeujCqr1CBhpOEnnIUgEspK6jdSo4LfkORjZ8QSsNXXTpX+D
	oBZEQICmJOhWf
X-Received: by 2002:a05:620a:8009:b0:93b:d79a:c465 with SMTP id af79cd13be357-93c43e0fbf8mr320420885a.61.1790326009866;
        Fri, 25 Sep 2026 01:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8009:b0:93b:d79a:c465 with SMTP id af79cd13be357-93c43e0fbf8mr320418385a.61.1790326009352;
        Fri, 25 Sep 2026 01:46:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/4] dt-bindings: clock: Add LPASSCC and reset controller for Glymur
Date: Fri, 25 Sep 2026 09:46:33 +0100
Message-ID: <20260925084635.112399-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfXyO6Xqma6rzu1
 1BwHLZs50VVZunSxOtNVwlv82ABoWIQcNgoBCPjJCxJ8i7c+XIbOIydbN8Q2C7tTlnyWubReLbJ
 Nr2JadpE2jyN7l0ROig+jxo28kxZQBf+4+v+GIYwYCZF2voBmocMkADV65uj3cLsiPsxkHVQx55
 6Jgbz93E/U/dP6Sh2E7TkWIFWNXjfvhnSw/GmkYVaeEp9qik3Xxr7n51bAsyXPSc4vo4lkenWaa
 UupHlrp39glMvzBHwBOo4ulgSODPWPGEe7ML5hfGabkp9qfuZdtBnMj6nbGTAwzyAQg1pHhAiO4
 55Z8WQCnYS+3IslyXIY0FKGYPhVb/T3h4PIHjJnRm8YO7kz3JbCPZXvaZTgO0s42t+4rAu7D7C4
 X/9b5DE6mICRvaFkWwP+3yGAVSYscBW3jlM4u8li1lb8lD8n5JE30URYrtd1GbVdQL844VHzYkE
 Wi/Wl5bkkFrscGpJ+/g==
X-Proofpoint-GUID: ho3-w5xC1-IsJfHRlSw-LMan3nqe3lYl
X-Proofpoint-ORIG-GUID: ho3-w5xC1-IsJfHRlSw-LMan3nqe3lYl
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab634fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-l7Lzzg0JijIaF3KBckA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX9I6qPeFIfLsn
 Tn+MCmWROcACOYqjj+NaW6PRoS4SuXQ5E3d1wsk3DN17AdfCv+/WSSUS1XfR1F8bJ+W1fSvhTHp
 YpacBsEezyM09pcIYmUl4v/NRT9YeF0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250034

The LPASS (Low Power Audio Subsystem) clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-lpasscc.yaml | 10 ++++++++++
 include/dt-bindings/clock/qcom,glymur-lpasscc.h        |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
index c047c0174a93..916ab1b3dbee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-lpassaudiocc
+      - qcom,glymur-lpasscc
 
   reg:
     maxItems: 1
@@ -47,4 +48,13 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
     };
+
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpasscc: clock-controller@33e0000 {
+        compatible = "qcom,glymur-lpasscc";
+        reg = <0x033e0000 0x12000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
 ...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

