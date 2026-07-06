Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF75430CE7
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353247; cv=none; b=c+jrHuduAP7k6V9aWWSOTSAOg8t1DRwIeQ4FvZDySc5/WM37otnSDbQYulo0k1NjL+At7OIV0tXNM6N7MQTHWEfnRyWKTuOu2bkTAYWTGLdL2DlCt7ml0CrzO4aAelbKw/5+c56Nkcx56PJa+7e7KZ/NNG6JCjOULUHbw1DshSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353247; c=relaxed/simple;
	bh=E1s0pXJdNHaHwZ9OleuVgGDZ9lbuEsZmEavlB9ekfnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zjv+socxd2JqQ+JQygeiMN0/VN+Mhx5QlABvW0/PF1f08mV1WbnL6DXzyA6A3wBby582lnqbQvwvwVQ9KD0hx/bZRojd0kKmuGRRTndilhAePJPOCYjqx1Ndz8NbbE0yyV7rVCTJmHPOFEEmpF3NugKcJlBp0lIUYwWwwctXpRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnewVroP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfHUMsS3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnewVroP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfHUMsS3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFDSR972291
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9DCYiVE/wbcIEEHkcBM4Or6y0w8uA8Kl4lJfQu60dU=; b=VnewVroP7g0CsXwa
	CdUVHLcyyoWT9Qy3C9FL47BP41uW3w61cceJrkSGgsGOIWsztyjG9Ca1JVguW33i
	j38mnDLwrfIvW7Fm1k5O6W5x2N5sqSnmSPy8JIQV0ItkjsXnsW36qlAkfMnDziI6
	Sd9MHSOcZxe6i16e0PwW1sybUdrzZk0bIULLhUrb9zVA5PciXY+rl+OhuVmlCxva
	cbtEqB+lOov3QGieB75tIQEwMXNQd7dsTpdQ7K0UDoLY2TkX2puqA381n4xbwqk5
	IIIYCgknEsHwJ529dkfEVkf4stbV/P7jgJzhBM/1KBJ4xDymnZOk0bN3yl4uEeTs
	cGwzPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r1jpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:54:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915f6ff639aso576996885a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353244; x=1783958044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9DCYiVE/wbcIEEHkcBM4Or6y0w8uA8Kl4lJfQu60dU=;
        b=OfHUMsS3Qh43OIFvvvxO+acL8vbVl5/QvKn6zV6lc3qQbGRmtU50oGuKMVkVJKZqvY
         ph3kROqdZr43wSA3beN8LuQYSPevPBKHxUWzCcshQpkK3o2gHjGZLyg3oQ4KRMaSFnIt
         TXFh/KC7Xk4bXJ6ONBbI1+Hd3CoTbxvLRloLwN/T8CE5BqeULIMq9M7je7XMD4Pftq2K
         ML6jSzYRCGb76hRoA/I8p5L8lc/5a2FqY2lTxL4RZbxmT+DZI6k2AkLzUpw0UzMYz7d6
         gDX8Yaxq/PALp9Al4SU9U6QJQ2vahZtZG7nej9wNS6ZfH1/z4rDc6sM7/E9i9gDu8Jch
         8dMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353244; x=1783958044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9DCYiVE/wbcIEEHkcBM4Or6y0w8uA8Kl4lJfQu60dU=;
        b=q4VpNRd0p5C0POJBe61Rm/ytsjV1+qVc8RJ34qY/yq0wJYqvUILYHiFKdXy4Cekk9W
         qy00fS9fPEpxCr3xoCpodBhQcSJUqwVIGJL3eDedIeiQcfrj3Sf1ymQdrZgCbbYBDlZk
         T4IsaWOIK5htdoLORE3ixYybNyfLA/+dHgHYlJovcCDm48TfrsBm3Su981DLfytwOwAD
         7BZZ1Oka+T+4iXpcWJDm5puSJmgbfR4msrraTk/NG4ZU1fq6p8rId06Xc8R5GwajU6w2
         JKcW5T+UwqcRsiDqPKea15yw134BVqOGxoThIAFCzYGwxy5ktpLdRrmrzjZ9DkSAKfdY
         UD2Q==
X-Gm-Message-State: AOJu0YwpqaFshyME95LBP4svtx8A5u2NT7yK/SwbUfxpgFLwACQB/B9h
	qAZ10SMrixXyV78h4dRIlk74iAm15gfUpeuNBzmvwZHwy2rQtEcYccBhx8MiPxTq2mvFMPvJcdD
	4shlaSIp81519I5O8YMbAOgIHVPWUjuGUGB7x1EfymRw/4rvl72rZrnAyerCJZVaHPIGDr+YU
X-Gm-Gg: AfdE7cmWUg4G2btU69IMnwVNuLBXbMxVMtheiiH1XE1byvu0tXmF/fEt0/j55jC9YHB
	L4XOltQl8wkH0LXFDOH/FejNlPeFBmPtKf63x9C0riUezuDir+Oinhilicyile3V69XvruhRGLc
	RmB3v/njs/gQinfsCWziS7pMOLt9yF6rsGxFZk4w/j0OrqGLifC3lc4DMPKgulMU4UWieoeXOJB
	TbfipPzo1mx7OjdMMg61WCn05Uduqm3/h9uQNFowzIlJ5cMZWNLO9eXFxu2SCBIvqNYiZmi5z3/
	r7guE8VkGGjT/pMBXPZ8FNIiewt6I271CQ0CstNuG0toYLE2EA0IaJCXsotefDqOEEzyM9XuCbG
	/Xqvf6fiZc/La/7KeFXMlU7CDMJdUfUDh2ww=
X-Received: by 2002:a05:620a:45ab:b0:92b:6805:91b7 with SMTP id af79cd13be357-92ebb5ab797mr172435885a.63.1783353244467;
        Mon, 06 Jul 2026 08:54:04 -0700 (PDT)
X-Received: by 2002:a05:620a:45ab:b0:92b:6805:91b7 with SMTP id af79cd13be357-92ebb5ab797mr172428185a.63.1783353243873;
        Mon, 06 Jul 2026 08:54:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm23174169f8f.31.2026.07.06.08.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:54:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:53:45 +0200
Subject: [PATCH v3 6/6] dtc: dt-check-style: Handle properly DTC-style
 includes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-style-checker-v3-6-03ffacff9226@oss.qualcomm.com>
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
In-Reply-To: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4332;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=E1s0pXJdNHaHwZ9OleuVgGDZ9lbuEsZmEavlB9ekfnQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS8+LNUjsfTp+aa8lgvMdH5G9RoZwbc/6+tlUU
 B9mZ8FlIz2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvPiwAKCRDBN2bmhouD
 102AD/477iv5ZVoZ7hZCetzreIsTGB7FsXzRho09/4MUVl4jxyNfdFiEJPv6LcKUeqTYrgmljNd
 CO0p2U4iBOcijB3dfXkZmx1jmLfAafbASTVpQW34opqOcYZyMdelJ/3l6bfy1AZJyXZMfpqesjA
 sGqMPkcDhwwJ4+b00wKJdwNbJVV1JQlHdQoCPgkIClLffdH9bfTj6N3wKTlc2vkseAk8Cde3g5n
 ErXtj3E1acmCWXQBh+SuZRtsr32VxKIYDiNC7YDWolzSCW9NRC6tLBFsN2ufpS9YdLnYQXel7ZU
 BiJHhH0kN49sp39SWAnmjLZlhc9PSyOBnucOkv1la7G/MI52TS3K9ZtP79KWTdd5M1bZPTn119O
 uAbNq3eYRRRuqLl69nHJSOpk9wku6wSuej3ccFxmbqISnJTmGp5KDg4tRL6vBP/IGvBsILT75zd
 ehZKrDKB3PMlJhC70XNwGtXOiNMzqlqK0keih+sl6BiIOqSlsk0ogZCAu7Zu35K6vIR2YEsXReu
 SFazbLC1JFnXmUFYglXzjnJLUMIrhGlpQFL8Cx0fQtY0M3ZTHEvwa58DOxEP1NMNJ6msj6pXdeM
 lrzZcMvgrksMIACRbl4qo9VQx1DICm8BEytWov8zfmod7K/XHVIgPcU+DUb6Uapk3xd4cx8itMv
 TqVnHZH7xWJnUTw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX6aaJ8j2eGrVg
 5mn3Fr5owVMp/YiCAPyFvzNmk3QHPRrRZWwI4cbGSJ3kv4YtK1LSltTA/k6zt6e04TE1nsuoah1
 kiuamYKoexknfZ9d1ZF4Ilk2dhZbkfhSDhh+hsDBgqVaP+WIKznpQIlR54ePCVxf7ODaF63m/mi
 ys/EtKgG6GQlJAqlyPPKgIJJBOaIdUO+Ry9NMktEdJzEgWRyJeUGOf87XHJoUbr705o2FDqgL8V
 9rq3pFLTfqJu6LqI5tcsBWCiEvVxVEMBGYWuNifH2GvsXg5KhaqnY6+dZmD4M44dMoyXpK1tSss
 238oSgHtr3L8Y2sAn7rT3QWonWeubmyublvwnSQnpb7w0jAMIROVU6Vk579l8AJK8qf9KwEOglQ
 dpIgvBPaNqvMvPHxUPPzybz6LLqsIqfA9czxI+tsII6n3eAbgXyCPIpYRSzN19B+qAGYvgSUpFs
 TiRxYMz0t0jaQxtRP8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX6d+eoFNVnG/L
 Br4EZxYdEGx/Fg21vAEMtxG2JbxCiD2c7490ZFAidcRGOLcfzHUtnw4rc8uvo7ZdmIIqj5GE6cB
 ijNrxwed+rbUIgVUCIAarT3GwwzKSns=
X-Proofpoint-GUID: Qvs9Ec5evligkVlaAyV9CDNCLv9wbOc0
X-Proofpoint-ORIG-GUID: Qvs9Ec5evligkVlaAyV9CDNCLv9wbOc0
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bcf9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0y9rCkXEhHseLPfnHlwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060161

dt-check-style was not properly handling DTC directives (starting with
'/', e.g. /dts-v1/ or /include/), thus a few DTS files had false
positive like:

  apm/apm-merlin.dts:1: [indent-unit-dts] indent unit must be 1 tab in DTS, got '\t\t'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
New patch
---
 scripts/dtc/dt-check-style                         | 11 ++++--
 scripts/dtc/dt-style-selftest/good/dts-dtc.dts     | 20 +++++++++++
 .../dt-style-selftest/good/dts-preprocessor.dts    | 20 +++++++++++
 scripts/dtc/dt-style-selftest/good/soc.dtsi        | 40 ++++++++++++++++++++++
 4 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 3c1aa9e28347..b8ba6dbee86d 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -49,6 +49,9 @@ re_cpp_directive = re.compile(
     r'^#\s*(include|define|undef|ifdef|ifndef|if|else|elif|endif|'
     r'pragma|error|warning)\b')
 
+re_dtc_directive = re.compile(
+    r'^/(dts-v1|include)/[;\s]')
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
index 000000000000..4f249e9406c7
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-dtc.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: dtc directive
+ */
+
+/dts-v1/;
+
+/include/ "soc.dtsi"
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
index 000000000000..86cfd33086ee
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-preprocessor.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: preprocessor directive
+ */
+
+/dts-v1/;
+
+#include "soc.dtsi"
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
index 000000000000..af7477cb8e3d
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/soc.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
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

