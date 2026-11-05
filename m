Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907977;
	b=CJLmjWlG/cywyZJofW533LWgZasKWM7NrSY3H7rFeqeOFxiWoYISLkkCSgKWtzUSRgzL
	 ATK5ldWVaQWCKr6BrEOiGukUILvQxtWIuX5nmt/tnayfvhtC4X/eqEiDntGExwE7JQ4Ga
	 e1uquWZn8epnofoCHuY2rDTxOdXH59nEeecnfY1TZ6GUMz22xF/njXogdEBUjXoOBvo54
	 rUaqsdqIhl7Wz44311SCvQomDtV68YiCIgGk25Ryi3854LK/d7s9IETNQ+uqKZ2si4CBm
	 cJA697De3Daw27aNtc7xE9MG4MB7t29n3khZD3cbivcgGlGchi0R+7mwrxXSBS8156w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629ZomjR+Ujwk=;
	b=1LJvWNvG9IaTp97GfMde116Y/Xs6lf6LS18nDPKn3ULxKq+tw+Fomcldf7G0kAreeZJM
	 6M/1fp14oQfoMfCoRg73IMGKwh2s9YYBvf0+M1x9XhUYUyN9UACm5sTbSiChj4PNadr5o
	 qbajI64TJ6Ner8uVEofoP6JJ5OuI+4gbxo+WRBzfPGXvoVQsce1Imspc5N8u/RXEoWXvu
	 HCwNrVYPKSQcNSHliQzwXtcMb2jcsdNJOA2OSzW3dZxDvA8o8A5EGGBSpzaDC4romrx2f
	 4axmGbH0+qhse5ENsDBLHr7RuFGxY//2vyXwFfQoyvlvG0CFiF8D9YSQ507ZRfKc7Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmeU8GTg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QrZf/H5t";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE996071F88
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 19:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE996071F88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmeU8GTg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QrZf/H5t
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeABC2513416
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 19:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629Zo
	mjR+Ujwk=; b=AmeU8GTgDBwiWMN4/T6A+Dyxv8IvBJZNTHbYFRpjZ0iUxpLoTry
	iYDQJARx+xLyFlr1cMwf/1d6h/ecXd8dYo5LHQ2LUchNhlMV+uUx+6NMKK/DEGFt
	wnqY72zlKu2mJhwP1xT/LY0eJsiHvTjCCPDnaQSRmf+C0TwOLjPFI88d9RINzUA4
	NWMZRH59hbmmSddTDfX7mXK+gfs2TSbZfOONFAkVgHTGBFNRQ7exj3zsfJgDcIZj
	wJ5eimlQN3NpajwbHzly9WkySv5V5CsjDseBs2vUHow2JdkBIJta/viT/JHds02y
	tlSxSTkKZXHjGsPvhB4pVymO/j0CCCrKS8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatcjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 19:46:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e49a1d3b1so574320685a.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 11:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907975; x=1794512775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629ZomjR+Ujwk=;
        b=QrZf/H5tIzT3hY67++JUZAsJkoAiBRCSnRqvUizLKYRWaE7qvKlGBvYVCDwplreE9d
         vHmA7cLiTMIbwtWEQwjYrAJojoEKMRI6mR9sag9vN1oB3fLhUV0LHEaP/ghXXA3DCurc
         PbQPcwF6UX7ChB7eLcGyW5Ir84wZujJfV14b1LibKxNi2RAoXCN7T904K390sc6jLsxc
         HnAkuY7h2xIzkf8vLkfFEJVXzd0IQ3yeEX3gpA0p/MCnEXApO80yYqISvJj3/T4qniv2
         Uz4UuMNl1WB22zWxyTUX+pQ22ilCagFtKBzV4/2OEjh5ieSFEDnPHL6hq/YVpa4b6/IW
         IMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907975; x=1794512775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629ZomjR+Ujwk=;
        b=iLCSmdVhT58ciSbwX9pMNjUtQaMLCFTd/i3QNQdYLhnDrljvZlj4F3ZWWQOxZ17DWi
         1RC0h4tBrJcdAgjoG1puSKFO8lyaVA5u+05gCxi2JNKiNd9GJGKA/Q1fGhVFKAen0J/x
         gq3saMu9cFHpdQnHOVKl2c9C8whedoCpPiNRDWuVFhHxI6sJPs1D3QN1VusEtXbMGQjs
         koEn+2D/mS0BaVrn/G215Jt6pUHLe9c3o0nL/aiL4m9erc3OpIA7WeLMDN09kH/i8Yp+
         HGlI5dYq4JhQ1qZs/HnBHTSvlwI3N+2MH+YVL9I44lGMIkCK9/l5KTIh0IeWRqrIRItB
         aNEA==
X-Forwarded-Encrypted: i=1; AKwUvBxfhJRZutoGXX467W6pVJCjMhKzf/McsOF034erDTenKZgSG9PUBFysuXtqB1YMvSXzq/HQSgFgSNUx@vger.kernel.org
X-Gm-Message-State: APuU4Z+NH759nTE3x1jQyMCrpeLGWkqZ+gDmal3rOykMGL4Z7Zl2/6vD
	N8k9Y92+T9t3q6Lt/Yy4S2CSNbx6a24kfBDRGfpPmD0j21X/q0AxBzEwHUMrlQ8U+ecmc3S0mOq
	vnxCRChgpiOc04x2g0zlo6UIGx8xGSkAm8n8OoN9IeXSyqFnJOiYn/w5BLYQ/nuLW
X-Gm-Gg: AYBFou21pmvb1dMqn4kpZ33HqhuSq1CBj/4XTI5WTYFsXINTQADr7FfFaekbC6pEWlF
	otokjr9JGcvQlh2g7+z0U+hCijEIJm2m3cItMHbXG+lG8GVXLWHEr3cx5pfekg1hmrOm+hzXPZ9
	ZgQb1QAm0QjNMi/vHiB4xhyqhqkwhy16Z2b3aJkbBbNC8DtKwWpyWUgHN1hPbQQxEvAFdMx7K8p
	2GMGyN4owwdu6qusf3aFdFZYRpAAYflc57HxIOHELpYxLTk+dOwb93/zCgQ7xWmA8DXKn48fV5l
	UWsVrFqSyYUVql3PkkvU/JJGYRLArlI2xF8EZm2PxjDrd6V7KdWytZVOD4mPUdeAqCvcPsQhLta
	UuMuUbKSI3Ao/45+GUI7waZD6sC0knnzMFRKs9AIyICpuIiF86nsx4M1NV+5RUQ==
X-Received: by 2002:a05:620a:2702:b0:944:2e2e:69cc with SMTP id af79cd13be357-945f34ce97fmr20080285a.49.1793907975219;
        Thu, 05 Nov 2026 11:46:15 -0800 (PST)
X-Received: by 2002:a05:620a:2702:b0:944:2e2e:69cc with SMTP id af79cd13be357-945f34ce97fmr20076685a.49.1793907974812;
        Thu, 05 Nov 2026 11:46:14 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm82495855e9.1.2026.11.05.11.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:46:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: Simplify bindings
Date: Thu,  5 Nov 2026 20:46:07 +0100
Message-ID: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3795; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ei0/JnfNAAX2qJbDNn+6Uyh3n+06uKHSrrdp7G2A7ew=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7Nz+q/+5a2h/Vy/JzzACmTB3XbMLDFW+T0Sk/
 hhFR3jvxXeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauzc/gAKCRDBN2bmhouD
 1wPgD/9N3au9Ru4qEGpuVNiEQ38tGsbqeiHc5J+W2pHu7VmvW66WRXXhxknNTTQeguVW1hZBea5
 ksi04j56hZ7dZXSA7q6+LP9ZvikzypImgq+GMVxm+t3nY4FlJEcOg7/95DLLbaAknbxtd6AhYld
 S7RujdhKRyul5vmnj2pxn7fKuXjl6ePoaKQWmGsyohZwMsKLEKuecfdcOTW79wN8hiFszw3OKtw
 RFR6ymuACaIK687aWKaBI+CvYLISj02Lyb6c7UZ4u/i0GJQ1YuN3aoM0b2nbpIBAZgHvCd1nYY8
 TjpZgXL0ioplBAw9xHWqT6DNwbdDvKOnpmpRWJqAF1x2r2kGtsvxtN+sb0saGZ/pyEtYg4F8OpG
 wJcu8Mhf5XGgc2BCPWPgJ+6iYVlQJPrVxiaTyrVJcD9vADPd6tInshRQYU5sHkq5jD9IalQKYWJ
 XNd1tjf/TM8cT2RKH9n8tHc87CehvG54Buf5sXF7FUX5N0YMof8MnMdeK0xy+OTiRY2An58ToC0
 me7gwJc2JQohRBHxirG4Gt6PpeiPsvVXFtX+hKQsa+4ovmNO0Vni7MgwehKbgDa4zdAvCg8khvL
 tnT4oh8HFFcQZTlYb4K/Qp/9FaBsJf5cjdsk0TTHCckcxhatEXLR9e+tL9Ymb+3JFoxDuW0yUP1 1860SmvyRqfz7Bg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX74FA865yrQ3H
 4s7q/Kh8/ciDwrCmMsohivQaYR0F3oYzEDJ62nw6oK/pyu9xuKJFmDcoKH/2srOLni7pZTxyAGd
 v0KcoAe+u3QzoIbthhaQzxXRFhY/k4g=
X-Proofpoint-ORIG-GUID: zsmQdakUCohYNe9NJ6s9Xq9Hi4vsAPiS
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aecdd08 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=hpx_vC1UKZy5HMHMfZkA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX50AtRg9oJ/fL
 EAHFD+BBbteXWWHjmvguWdcfoMyrurEuAJ4C+jAS6X1dD6exRsBh7cHFhvh1r24Cw6uxCKHUb2X
 83xmFHhJuI8vb6sFrMB0DV9Mg7D5c3ANMTpo2OSP8JXh+/dDNaiewKfA++6zrC0QwrTHcFqUMS5
 K3fWm7n4lfPwmWwIPPugl3MBV2mhdrLao3hDxSMA21T/5RNI5uS6t5GiURALK3X4gNlRtFy0AZI
 OKzMeBC+f6/BkwC744m59VU8CzSiQPCRrEMXvEN/AQNU9Qs7yRnsTRoqiMvw5HMbtYKUjJF78yF
 OVPMam21gFQ9WnIzx1QhkCBnm17jtA5qLCcnuQEENUkFhlqx+XAfNWULIdE53xY3G5qPyfWX+xo
 k3RRhkzu1ICqb/eicSApbbj+g1JVnKNGGyFEs2TSO0QGIYr26rgI2N2VM3JgNanjcc99jNZq9KU
 Nul0LYvNqyiao7JpVTg==
X-Proofpoint-GUID: zsmQdakUCohYNe9NJ6s9Xq9Hi4vsAPiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

This binding selects a few top-level compatible machines, but since
commit 389de9c5a677 ("dt-bindings: cpufreq: qcom-cpufreq-nvmem: make cpr
bindings optional") only qcom,qcs404 is present in  "if:then:" clause
which enforces specific OPP properties.

For all other machines, this is a no-op, because there is no schema here
enforcing a specific compatible for OPP nodes or any of OPP table
properties: one can switch to standard OPP table (operating-points-v2)
and this binding will not complain.

OTOH, this binding has complicated "if:then:" blocks so is not easy to
maintain and causes false positives when regular OPP table is
encountered in matched machines.

Drop all machines except QCS404 and move the subschema to top-level.

Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml  | 78 ++++++-------------
 1 file changed, 24 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 547265b8b118..dfc7a27a7bdd 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -25,22 +25,30 @@ select:
     compatible:
       contains:
         enum:
-          - qcom,apq8064
-          - qcom,apq8096
-          - qcom,ipq5332
-          - qcom,ipq6018
-          - qcom,ipq8064
-          - qcom,ipq8074
-          - qcom,ipq9574
-          - qcom,msm8909
-          - qcom,msm8939
-          - qcom,msm8960
-          - qcom,msm8974
-          - qcom,msm8996
           - qcom,qcs404
   required:
     - compatible
 
+properties:
+  cpus:
+    type: object
+
+    patternProperties:
+      '^cpu@[0-9a-f]+$':
+        type: object
+
+        properties:
+          power-domains:
+            maxItems: 1
+
+          power-domain-names:
+            items:
+              - const: cpr
+
+        required:
+          - power-domains
+          - power-domain-names
+
 patternProperties:
   '^opp-table(-[a-z0-9]+)?$':
     allOf:
@@ -48,10 +56,13 @@ patternProperties:
           properties:
             compatible:
               enum:
-                - operating-points-v2-krait-cpu
                 - operating-points-v2-kryo-cpu
         then:
           $ref: /schemas/opp/opp-v2-kryo-cpu.yaml#
+          patternProperties:
+            '^opp-?[0-9]+$':
+              required:
+                - required-opps
 
       - if:
           properties:
@@ -62,47 +73,6 @@ patternProperties:
 
     unevaluatedProperties: false
 
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,qcs404
-
-    then:
-      properties:
-        cpus:
-          type: object
-
-          patternProperties:
-            '^cpu@[0-9a-f]+$':
-              type: object
-
-              properties:
-                power-domains:
-                  maxItems: 1
-
-                power-domain-names:
-                  items:
-                    - const: cpr
-
-              required:
-                - power-domains
-                - power-domain-names
-
-      patternProperties:
-        '^opp-table(-[a-z0-9]+)?$':
-          if:
-            properties:
-              compatible:
-                const: operating-points-v2-kryo-cpu
-          then:
-            patternProperties:
-              '^opp-?[0-9]+$':
-                required:
-                  - required-opps
-
 additionalProperties: true
 
 examples:
-- 
2.53.0

