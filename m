Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B1547A0B7
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521666; cv=none; b=DvAqELhjHth6psnvqjg3BSHf7IAWGORAK9CPyd1w9tHm6CWn+XKcFtckL87kRrp0tybpfWmcEavy2cvCWl3xwPkgRxwznMjVi4SvR98PMaluXvzhEOJZrmoGVrBumXW6Pd16mR7pda1Sh5gqFK60NNyLZPJcepf7atF7X+1Jz8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521666; c=relaxed/simple;
	bh=SD35VSoy9JH4jlvZ8TVkyOPdLnzPfa9gl7cAJRc20jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsg2b256UpWJus4o22CJNOTjfsAp/Vx2AryEEbHDFgI5e79sLhbz9lC6n2sQ1sZQ9HSZ1KWtRclQxL3GQ4x7HYrr+huYAWwmdIKXFRVwBtJ8uEoJsebESvZKfYJg2M5Et7yPllV/v0/hOJ9o/d+LajpLQ1heWXOPrDOdn1aJNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0dSveLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACbnDbw0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0dSveLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACbnDbw0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C4B8b2752259
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQpIebYENi+ihlciCMBZWU5as2aJEjk7DhaNcpj8ohA=; b=W0dSveLy6Ax4LQKd
	aIfB0pi/6NGkgC7YilRlrulXio5YjE+LF2UD1pbrY1yG12SpRPKYopEhEvmGLVK+
	Pyp5FdINPsaWiA4kdodFb48237My7e62JSD3OggYyyIHoC7Y4H4ZlRWa8BIxbnyI
	eM4cLwyjV7s+prBCWWfZvwWdUnk7x1wS60ZBGQ9EdVmqk8DWpQznm/gsiIJcVOZW
	eKRGXUajnWX1WlWkqVGhrioezJLEmFdVmwsh+HSxOr1OIKt2fzmQMOJzjSZMed85
	i79vlL4Cky2HIx2X8ni+s9Zkw+u0fb2NOffpXwKoLNhTozSLssq3qKoKPAIeNKpU
	sVQIbA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csstxpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:41:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so11693461cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521663; x=1784126463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQpIebYENi+ihlciCMBZWU5as2aJEjk7DhaNcpj8ohA=;
        b=ACbnDbw0xN1kO+D7CnO+XEiNQqMQWjdVanwMJt5eW59BGnmwErIeWmt6i1pzMao2S4
         KMkC7NxCijxQlc2fXzz0KjyEpJGCxygvzI0bBc5+8T8f0z5kRWfQGkQYwaCMRigTr3DK
         HfAyT6ImoQeFEkwmAsixx4yKUPkrziDEDo2tAVgvTaUjJM6iRRH7LNISDuLwFvqTNaa7
         aiXJt23FJBIsSw4w9yy/KQvvYtWur2yKjd2ZbZBaYUjkDiXb8aVd7cwyeacFS03canMP
         VyEv+Vg4BqFMRgNVjbXakCrUxNT8H+qnR/q065f4kSNdRO+6gk5t0PiX/KC4DwxIEyHe
         dwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521663; x=1784126463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQpIebYENi+ihlciCMBZWU5as2aJEjk7DhaNcpj8ohA=;
        b=p6LNftsuyFGCv1oN0ljq0CqKbiVwboBGvUFl7u1qiTJpNDFwh/DSHEtx/RbI3W9b4g
         Q5xfIXzvtHt8/qaW2KHPBa90nD3nCcfX6lndGzQVXVO2QlDqtv9JsDg4XNSq0SqY/nJ5
         dOkLBi7/K1C93rq+OJ1t8SJBbiw6Q7hWV3smqghT7hYI6qor2T4Q6jb3dpxpiec2Ez4L
         tEUTI+ViRvWL+tDMJPz8J5ooc7a2PCtAnuFqAZFh3xMBr13erm/HU8KDDFD7YeMbpA14
         NXAKtVEOzNr5DZgJBKEKCvsPewTxOv5+aDQGxdujvY7UJE+ol9sDQ+ii7ZOFwlUVx2mX
         mUCg==
X-Gm-Message-State: AOJu0YwBt0YcBptHHUcvJBBVGamt35qy9aaBIeCqtFt2rMuM27XEvb3d
	p0Xh2AoKfzE0B6rKbGHRljYYBhgJ+2Sii4KzdH7MjihSVWDwMlrLquDtAzVuQyVZLumDb5vu7RD
	vnbe7mKMdbe1N7vCmBcfk0jruJcaggVETLmHygPCmlu93VV2zdlDupbFdbcnc3KUlT33mHNJH
X-Gm-Gg: AfdE7cmCEYBmXy2an3eirbhuUdoxUfFxzCYTLfHxppPFzjqU7rb6xgAFYYqx8S7l59t
	v5jMOK4h1ap3g7nS8L+Bd8/ZdTQbTQGG5ffuoeqtczfXMLFBXOq3c3eEcRNt/qXtYLkGXFP7PGK
	y0kHTO6WuIUbKC7XsqRhdaQ5QghYF47UE4KkYDLd26+il/yZSwtT8K58mF6GwCtOSS7TUXSC000
	fevyFkO2mV7tkQIpbwlxTxKsS8EHRKtzxbniKFnLuVjN48Zsz7Nh4Mv4BQ1e5bZ519mxpeTZpO4
	ahpvCs9T7UkQSSNltDKcMFWdM30LwAgedDH5gGlZygzcbMQPUXDWo8aZnV+bEPMuNcgDy+wpfOF
	Rh+UcXto/5JIJqz06G1IAYVCFCZRVPhSFg2s=
X-Received: by 2002:a05:622a:144f:b0:517:9570:c1bd with SMTP id d75a77b69052e-51c8b3e2e1fmr28973211cf.25.1783521662860;
        Wed, 08 Jul 2026 07:41:02 -0700 (PDT)
X-Received: by 2002:a05:622a:144f:b0:517:9570:c1bd with SMTP id d75a77b69052e-51c8b3e2e1fmr28972591cf.25.1783521662327;
        Wed, 08 Jul 2026 07:41:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15da821c58sm52543766b.48.2026.07.08.07.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:41:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:40:35 +0200
Subject: [PATCH v4 5/7] dtc: dt-check-style: Handle properly DTC-style
 includes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-style-checker-v4-5-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
In-Reply-To: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4497;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SD35VSoy9JH4jlvZ8TVkyOPdLnzPfa9gl7cAJRc20jo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTmFr/ATYn845lbBe9AGXNhkrhN7DIBNdfMHmv
 ecFVrVqZLSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak5hawAKCRDBN2bmhouD
 12WOD/47xK+MgyamBz8oAceZB7ai8jru9TZqHWOAuiOM8lR+BKG330nF7K2rZNGYEeRbtDDPx5B
 TRNrFQFMtSdGDdk2HOBCK1/UiiOacDWLvk+khDvk1i5etm+2KuTpt3F/X5ROfhTsmiCMed8FCA6
 SOretcmayRCztQg7TYBfD1RMvU72bWq95fi85ljJft++jdhp0wO9ZcgBO3gFFLaaGVINn6e5Uo+
 BnsEZetSEwG32Jec4Lu2jaUeGLGLt4RcxcjEBWTJu9sjynQKN79Z20ScCFrkfb4XnV3egAOGa/a
 rC6cqQIiJIAXvI+xP/KK/ojamN40PDGG6WR/QK49XbnPvLEm3GjJc2JJvKTtZbTmsPfjBhxc89T
 EZcmlEGvzaYt74dehoq1/P/svGvWm9AqjqJT2P78ix/pxHIWUHELn9cpm2JHFzjNj3tE6mgEPfQ
 uzaoGGuxH4T8pJUsEdLi6gBzSi4xft15nJdQKhPEgpwTYponOIvUVfDplFVTudHyeadBU0U5DCL
 JOn8INHnJPujjiizKbSLjXf0qoUqnf92VlY3k1jnffODVJq46LOdAGYYM/020pxf3JuOvpA6BZB
 CjImJlmCDCUxn6CcFAJNwc/3jQGKivWeWSyMIzFyiHkzkYJq22AvlNbOMwok11qs2H+2f6bN2cx
 vBGiOlhzG6T9iHw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e617f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0y9rCkXEhHseLPfnHlwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX8u4bpMwIk8KZ
 cFpT1Izn6IHXgiiWznmQ/U44QOAH5onn6IjaPfow/oMOyiGyLXBIdZPmTRGBd9xe2YiAptpzyOu
 YgKE0UdeWVobcLcK+RLHUe2CaN2qIJKMVum92T6kdCmx3aBupi1G/hiCS/tpTc3dEaAbXkZ5tio
 BBPwOtJlVOG9AqqvLSsyqB4c5TLWyQLRq/Bs/8GShwO6F8tHW510pIA44weFujTrbHGeNGrmquU
 +dHeG7fCbio7a9WJ8OGsun0R254NGDb7ta3GwVr4Za7GXTloedzoimxf3GIg+9+pstlOqp+8WoI
 dZ27wICnDUMf+9tYF+KxL2l439Ovr7pj5vOGvgkrK5ucRI7B4QSO0sLffVoV9wmuwnuhyPeMCx/
 mQjL1Ulp/zYKeU9SiQTEcyASulJ62YgJmUCXKUhu9F8aQfWnsjWi937bhz12JLao/Oe1QWSiS3d
 1iJAH2OuG+jEtdmUqTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfXzOzaZlI+5ZID
 jipaaFWVPFOM2KATe9SW6zuppbHhePyAR2osV/jbTim17ojiN7xE0/7LlIqwuBaOHp5tKONbxPR
 cxuRJN+YQtIE0YaUsvCujMuCFwVJDpk=
X-Proofpoint-GUID: quzOrMUR-lpLv5W4e82NTN1GQkgCwtIk
X-Proofpoint-ORIG-GUID: quzOrMUR-lpLv5W4e82NTN1GQkgCwtIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080144

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
index 23cdfe78b189..9a5263a30663 100755
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

