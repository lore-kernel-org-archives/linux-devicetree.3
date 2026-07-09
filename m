Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751F14195B3
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618906; cv=none; b=TzoLxywzO/sgIros8pDvc0CDV1Q005hB4vrJ133UzPFoEf4GfitXZVTU0HlCMSZU1HwgOeAbNFTbZFi992m9futE3VYEfWNBwHHRPLXJLRntTS2IajNBpAzpyDUi/wiv3JjrqUkQLivALAGoGVJKiR8Svmn0NOA4kv/YyQ2IUEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618906; c=relaxed/simple;
	bh=HbDHhLgOl729fEDYEn3GHHtDxijoT4kwtCgdIa2fMTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTd3E5xisVr24ggwCFG7woTd7jfVCCU1CegtO9vZgmZkyoVrUUVLpOoeCdLngeb1UespQ1uOaL2DSW7imf+pU6UhE93gP3fC4vHSYm4h2uWMQmmMgyX9SytH7vyCV3TYtX32A+2WuYeeCJ8MF8DH3k5Y4LZSLXxLIVYhoZuaelo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+w5cxU9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SulFaoTW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+w5cxU9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SulFaoTW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXA7d2503948
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P3q/rRtUnUE3CGutJGERiIiNbS2WKc4uDZITOx7V+bk=; b=C+w5cxU9Hoc1UIo0
	Ic/TCGpmm+tlef18uWhvS39bUF/wwWqO147R+JPdwCXAsla2RfIRkpzmcHuo1xrz
	Rx6wr5d0SOE/xMedfyrCxgrEA9/E5zegS8zA4fMV7EX6D1Tl3c1q/7kZX3L5hWrK
	cWqDC9xgKXaU2k49pVhwHMm5geeRy5+uxFlZRDnUczkbTwL9tHObaGY0vpiV1P3Y
	K+JtivrmmYdeymRE33NtOujnt/uIkl/b9V7z2De08BjmZrqfOqjEu4LeuYhe0R9r
	dgLPn8TiYn9M2bGi8QfLhhZMDNutEESoQ7z9Vyjj8dy+BVqCS1zSgFGMzJaWRkkx
	X4yxSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3u3qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:41:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1852a86fso463621cf.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618904; x=1784223704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3q/rRtUnUE3CGutJGERiIiNbS2WKc4uDZITOx7V+bk=;
        b=SulFaoTWDbdyjMvrfjjltR83mfgb9Rj/utjJ7XLHcbevBIzxnprh3UPfRR1czVhYem
         kxfXKp3kd4XapWKzzInfkzzk/v+0LRjC/fvYsPJ7S6XQ8c7LrjD57Fjpa5YXviGa8zts
         ucoqsOXNQrza0gqGVnYS3n1Vtu64abIEP8vrvp2Fnph77x0dRpitMR2snyVAReZadPDQ
         ox9cWs3IK7ACjfaRNNOCsYSL1ftQSZffzNSeNq1ej4IAhv/KlN3/IH8xF5FDD8k3WhVY
         jrtnfzMWHUtfLc5Jgwk5GnR75pfSHtgvXEQNASbjSbcD+sZF4fvvVuNe8/P7rJM40B3N
         /y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618904; x=1784223704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3q/rRtUnUE3CGutJGERiIiNbS2WKc4uDZITOx7V+bk=;
        b=cBIv7QSNvu6W6Vhqq3TWn3y/qFy3bvo3y56GA5Oh161c5cMrGvgF9JsEGQ2Li+d6f7
         vr06u4C3BdxFF88kBoiW9wPwaw9HmXzanZQoQJy6JiX5r/QLs9sz9BFYRqfPzxVVz1yE
         J9xYB2fKIUoT01o+QgeLBIIXJCqkj9SmdT9NWYXKqc6k5BWnYsQchPfE/wv/1GQUhtLc
         hjhJ6RFlGiY2/Ipqiw9Nr+9oQi/xlX9xAtGmQtBv839+8RUTj+yr4RNIWrn3aXdMPPm1
         pge0tH/fKlIPukFznK6uk0Ld1IpTHeW57K6VqSKym3o1VmxqC9+tu8Rt0G/7rmUchhkf
         BYxQ==
X-Gm-Message-State: AOJu0YwexIbwKhtzqaq7OcZWcw8MpV0Mw0nJydKWMpqebBkdxQZFKwF0
	3nz4bLzkRwwPSDtAAxwKxGWPzZ2fdJT7iucCIrgHvOGLDNAX2PAK/ERFc9cC+p6sam24VbgG95M
	rXgPM5hWtiIB+WtlrcOpUGLbRV/Ik4kbrmcOLyYPx4f2FM0IDY0O+fIXwuMA0lT5Q
X-Gm-Gg: AfdE7cmDLFGJ7JRqF8JR2OujiDg5rWZGfOYb1zSYRC2HG9z5dT138KqcIY0kawozIdA
	eTig6hRCQMt+hkY0uLMKxfTTS3um4Ylm4iR2k7rYbCXTq7IWCT0XDjXb7ZL5xuAK4ewEFo/XZKj
	3RNVC6+ZlxQ/hdu8nleBHONIwfHIdq8N5/taTdIEP/UVDMs92Ntb0KspjGlOzan3OAbh+WJS7pz
	bnohbWkM4ZVpRAqPGM1HPvIbTlbAVj/VlYO+V4lhQ19tjyHOD6ySkyvjhHFi/hOH8yEZf+wcmNY
	wB44qYc/Fw464vkKdXc0a8j97ZCzR4jmdPyPZ+iTaEzrqQKRHrrG9PFdDABUcF3fQzI1k9ndtBf
	KrfjsZtvVF5/kQlYmM+lunUZiZRDVXUP4
X-Received: by 2002:a05:622a:1819:b0:51b:f549:c706 with SMTP id d75a77b69052e-51c8b2a9ba0mr86214331cf.16.1783618903727;
        Thu, 09 Jul 2026 10:41:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1819:b0:51b:f549:c706 with SMTP id d75a77b69052e-51c8b2a9ba0mr86214091cf.16.1783618903214;
        Thu, 09 Jul 2026 10:41:43 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm55174048f8f.21.2026.07.09.10.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:41:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 19:41:33 +0200
Subject: [PATCH v5 5/7] dtc: dt-check-style: Handle properly DTC-style
 includes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dts-style-checker-v5-5-fcc147cb697d@oss.qualcomm.com>
References: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
In-Reply-To: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 6Ms4kraPd4ZeHfTNAY9r_qle-8hpxGmL
X-Proofpoint-GUID: 6Ms4kraPd4ZeHfTNAY9r_qle-8hpxGmL
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4fdd58 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0y9rCkXEhHseLPfnHlwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfXwpxTpWkqdFd4
 c2M58+8lFCTrlScncuZpZ9g0RLxvwssNKEPMQiOJnqiT6v40ABamZkMKLY+X03xzMogkzws8Tga
 HEHY//bCtJKYP638t+IiDwR/CwD0Z2c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfXzfyoijHM9P0i
 mfTP6N+ELDbphYrbcKIsnMRIRkzwwo9jrL1TIqei7y+E334ZSOvZ4762a1Hg24v9Q0witHtcLid
 AmJ0jyoUHNg1g/vpqTiOw/kvlg8FmlROQRFj4TPC9ap08awJH/uBnggSnbsOXtL7be1T42Dwcut
 zLApPlSTZrrcSMWiuSQTWsbOR3o6R6JRDc57XsFdZg0cQORjcENOT5YRLiQi/rmpYIqQ6Lht/xt
 ujEgNLVvWmiDou7KfR9N973TF95TiAhMkq9utINma1du0/oDtpGjCjv0+qLdkn3YUL+KAZowsQA
 6wd7ECw5wuGQPIjPu7f+c19APxnrlzZH7yKD5eorIsEDkur8MJ2YFMjfrPGWD0+XX68ys/aCj4V
 xocChGSs3FygeFa/U5/TU+LBljGotsjT+STrU8svAtMXpcdGjbwuYrdicMaqMpPZut9LJJJU9EL
 lEXFgzEnqFdmtvQrQqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

dt-check-style was not properly handling DTC directives (starting with
'/', e.g. /dts-v1/ or /include/), thus a few DTS files had false
positive like:

  apm/apm-merlin.dts:1: [indent-unit-dts] indent unit must be 1 tab in DTS, got '\t\t'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
New patch
---
 scripts/dtc/dt-check-style                         | 11 ++++-
 scripts/dtc/dt-style-selftest/good/dts-dtc.dts     | 21 ++++++++++
 .../dt-style-selftest/good/dts-preprocessor.dts    | 21 ++++++++++
 scripts/dtc/dt-style-selftest/good/soc.dtsi        | 47 ++++++++++++++++++++++
 4 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index d19ef26c2213..ad07b0d27470 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -49,6 +49,9 @@ re_cpp_directive = re.compile(
     r'^#\s*(include|define|undef|ifdef|ifndef|if|else|elif|endif|'
     r'pragma|error|warning)\b')
 
+re_dtc_directive = re.compile(
+    r'^/(dts-v1|include)/')
+
 # label: name@addr {  -- label and addr optional; name can be "/"
 # Per the DT spec a node name may start with a digit (e.g. 1wire@...).
 # The address part is captured loosely (any non-space, non-brace run) so
@@ -66,7 +69,11 @@ re_ref_node = re.compile(
 
 def is_preprocessor(stripped):
     """Tell C preprocessor directives apart from DTS '#'-prefixed props."""
-    return re_cpp_directive.match(stripped) is not None
+    if re_cpp_directive.match(stripped) is not None:
+        return True
+    if re_dtc_directive.match(stripped) is not None:
+        return True
+    return False
 
 
 class DtsLine:
@@ -178,7 +185,7 @@ def classify_lines(text):
             out.append(dl)
             continue
 
-        if stripped.startswith('#') and is_preprocessor(stripped):
+        if (stripped.startswith('#') or stripped.startswith('/')) and is_preprocessor(stripped):
             dl = DtsLine(i, raw, LineType.PREPROCESSOR,
                          indent_str, stripped)
             dl.depth = depth
diff --git a/scripts/dtc/dt-style-selftest/good/dts-dtc.dts b/scripts/dtc/dt-style-selftest/good/dts-dtc.dts
new file mode 100644
index 000000000000..a3207196214c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-dtc.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: dtc directive
+ */
+
+/dts-v1/;
+
+/include/ "soc.dtsi"
+/include/"soc-other.dtsi"
+
+/ {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	leds {
+		led-0 {
+			compatible = "example,led";
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-preprocessor.dts b/scripts/dtc/dt-style-selftest/good/dts-preprocessor.dts
new file mode 100644
index 000000000000..bd6d9dddec73
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-preprocessor.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: preprocessor directive
+ */
+
+/dts-v1/;
+
+#include "soc.dtsi"
+#include<dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	leds {
+		led-0 {
+			compatible = "example,led";
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/soc.dtsi b/scripts/dtc/dt-style-selftest/good/soc.dtsi
new file mode 100644
index 000000000000..c60274469555
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/soc.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+	};
+
+	pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>,
+				     <4 5 6>,
+				     <7 8 9>;
+		};
+
+		serial@20000 {
+			compatible = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			reg = <0x30000 0x1000>;
+		};
+	};
+};

-- 
2.53.0

