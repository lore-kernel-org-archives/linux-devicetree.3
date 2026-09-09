Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8E355C322
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959470; cv=none; b=qDocRTqHyq15stK2/11hBvZJ8nnulFyT/ROVr3xgxCGorQQlEx9w8ynrKXecKFJ9xwXnFJuL7BbLvC+Mp1xJKFHcSFa9611l9Gcc//lJADPXAhzN0k+4a7zdijfKLKlhg1SgKIzix8NVFrjJu6N/k7SdsbnOnF7dEjYgwzjdr0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959470; c=relaxed/simple;
	bh=a5Ll65DQL/M59r5nNeLh7x1BtJXBfuJyRxs44gn+Yao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/MEtgWtZk1s+FMHajazLW7P97KUmebe1pkPuRB0vgh7PIjO8206j6jM5iiq/pPmeLPf3QCWh1MVwIl+8+hIHWcyQE3T+qlx8NN/gR70h1OBWOw/Qn8r13dlD+WVwVQYzAzc9GSHsZOWv25MXhsBcIgtPePe4DfIhsQfYObU3Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcejDYss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4EyPGsY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcejDYss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4EyPGsY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUL1p1843238
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 13:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hk1PTahrJKUV4aq/e/3rFwDxJr+19SkoWjJe/cVir0c=; b=QcejDYssY3sbzcIx
	39+VXR60U0x/WjIThqKLajlFKWhVZc5Dz7STHatGR1yFbm0uvBL5lOAB0vVfUFwD
	tXTKKoyuD9QEu8OAFKQ5qsJxAZy1pCMdelR0GVP9HUWwipRtU2ZThgK/FaW/9BjO
	C02QWfkAjr5R6cMGePDWg9M5ll2g8yL0xgo4LvDOWTCskEnTJhl6KaHuStziPdm6
	5Z0A/JKdoDywU9nkt0/U5/9vNjqxS8pMHSKcYNvrs3Tl6zYQA2kmkQ5bzXLuK86h
	+eFijkjywCpDBpy1tK9L+SmBhjcY52e4kbz4RXO0U7yIlvq8vk6uGdWkuc40FCEA
	CsCN0g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqjaccg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:11:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-785b66a7017so1380438137.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959467; x=1789564267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hk1PTahrJKUV4aq/e/3rFwDxJr+19SkoWjJe/cVir0c=;
        b=a4EyPGsYw4ZqOCyfaPTpmO0N7TbPjaGBRf8FrKozopZY0lulBrG6rQ1WSFhHjQhT8X
         +7APY5SK7s0Uhb8K1C5LJzcp0aToATVfjMh9/XB/nUd9IOZMUHXWQ8zaFjm46758gOoN
         fYtVpv68zgY9k09/42LwavpfL9ylHdfAKdWyKgVOUZ7oA9ebpdeqAE0c2dPlg00f1Xcn
         0GesUi3FRphsnj//O5AkR1jhkXfo1b0RNAX2epilqWvvL8xFqmbRMHBTHrOPM6PPy1A4
         P220rtcJXHs75w4eLP+IKIEupGE+dEJ/2Bc0AuXU2+64DvPIKd1goesB167UsK6bfcqU
         FK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959467; x=1789564267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hk1PTahrJKUV4aq/e/3rFwDxJr+19SkoWjJe/cVir0c=;
        b=L8ME1Nkc0sCfa9SzhscKqojJtS/ITgyL9SdRUXtwb3aAhp4z+A4p3+s9TRKAbGqZ5e
         LIKTZhazdI+DuT9rq8knpmqqqJZMoSt+mp1eRYPhJzNMCwPJCZClKIJjZHsfBYmhhQet
         1yLf7Z9CKHRzGWy9Yf6Mq8L+dWhFSh6X8J7vz/BFtoUtgeAuUVyy6N7yvhPLeVEcwF8Z
         wWPojhyUZsuQ2szZFP9P+KAwSV5Xm3RFE3e6vd9ExZN9pt0UwEAPmACbq8zCsy5Yse7j
         rrbLVJDAuMe038VdBCFPKU/UrBZtAGEyNR77QwrN6aB0osMTSPS7av0QGJQJOkanv1iO
         B8oA==
X-Gm-Message-State: AFuF++lEs08g9MOwoM3gZY83rmghbQaVtiQY38M1G6iItAHKefJxU2GU
	o8+e1xMQe2tRDd8OBbO2fQ6cWj5ZdGJIPt2zTjoXMZ9nmqUOeEr3HkT25CNGLI+LVJg5VX4L4/Y
	YDR8jYqXJ7xjjkFe8qRU6N5r+jQS5XmgAlS2LdYX9eaMVLrzPRdihtKntxcryKvTs
X-Gm-Gg: AYBFou3s4fs/EHfhV7eTo0EHBW717/Ur8z53N8yWgydKuDKbhsH/0huOaftP7GWRhGO
	kGjtw/J3yD3EAhZCyw+L5Pn3C/bxx11vx+WExA31HEuNZbD1+/kKq/f1qbVTw0TeF/8mdlA0Qap
	LTq0yur0K8xi2B6lmiigNOlILUaSNYgDVhP4OmX5DiBfkHlwa62+TUG2J0C+sop+TssN6Nvbe51
	DTfGNG6DNJdrugFC7YqzjY8hkiwkJE18cwLY1axzkGbLCofBjkE3bJwKy6rZlrrHHfNt0MIqNwG
	fwp/Ye6cnH0c/66ztiykY+dMbl+MLFmOszT7bKSizwiZJ10RwfpS0FP5kiovl2/o2TDiSnP5Rt8
	M0IB9V6fEFlx6Qrl4ZYTtlWs=
X-Received: by 2002:a05:6102:1606:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-78a4a9621d7mr13640075137.11.1788959467037;
        Wed, 09 Sep 2026 06:11:07 -0700 (PDT)
X-Received: by 2002:a05:6102:1606:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-78a4a9621d7mr13639737137.11.1788959464962;
        Wed, 09 Sep 2026 06:11:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8993253b3sm114594e87.52.2026.09.09.06.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:11:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 15:10:40 +0200
Subject: [PATCH v3 6/7] dtc: dt-check-style: Properly detect comments in
 multi-line properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v3-6-474bb324ae53@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8587;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a5Ll65DQL/M59r5nNeLh7x1BtJXBfuJyRxs44gn+Yao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoVrTPm7Rix5NOzayWIPaO9i1d54MCz9hrT4X9
 gIeMDWzUvCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFa0wAKCRDBN2bmhouD
 183WEACLnXwXJW5RrMqHIVXCOyKTXHDmWb98aTxjEXNl2YvXiFRuox42RvtI9LiGcN1zDy5y4Co
 hIlAB9Bc/T7dCocBbjjOwjtDWGs32hTEKJJVXZ78XdQOJOLLgc5lziAxJ8jAJfJ8CuI8IGJgxBL
 pPHPOGrhAv21bIrSdxHHK8Vz7NqdZIccVZWsedmhAHgH2ySq5hNYYGabxP6QZFRSOAjOiteM9oT
 S75XBOLlbkp0Sy/U/PEaxy+Q9zdS5ciNQTDjtCLprQhAFgSYlHr/TpouqjF0aG00niHeNBPiVYO
 S2N1kkGLxMugUFzkJJcWwqTz3J3cSFZzAh4cf6Ujy3mYAk68E7+e+shuYD4UCl/uYgRDdvQ1YhO
 c66LrihOqzdcXgq99Vz/TM7Fmqv5UG+5A+KUreCEOmuWU65zUYs5zw8Z1wALGH3jL9ag4kqIdYJ
 7ODQcNuuIr6RjdzWIdBuAYtupeWmtquyTQfxIbhW3GmLaDgzit6NZ+YZOBCsnMo5yNBA6Zx2cTs
 8CDyfoUJVO2QJJZBL4hCLIY1cE4vyj2BRiKPEoGduKcdlQzl9/M8SRSVsy8F724AwXUaw4stvX6
 rPYViSpWLVNgp4Vr7aN+Jl4aOLspJv873GoRWIr5BwgXxfcOm3V88WWSiJtz0rVc/nyUqsFgoZu
 YDuZ7Chqrvv7fYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: vwbO8v8Y6BXmiB9NFNZfkCCJurfjjOND
X-Proofpoint-GUID: vwbO8v8Y6BXmiB9NFNZfkCCJurfjjOND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0OCBTYWx0ZWRfXxBfAlIrGo1Vo
 qFjNf2cNcd+YX4XPH0uSSu/Gpu96sEH3cvtTbnoHbtMW6IS6uTLfsFPH+2rQpjqIVB+IWoxY53X
 +MBbDsn3P/JXo8VA6uWx1Q9e415gy+1RhOnC1qw+EohBzGt7/GHj0+vuHpxtzU+l0+z24cPWuKn
 zki0Dh26gVNUkWatWoS8keIaGXMZPNCo3DiWrEIVUeiAyq8W3pabtQeu/xV5H+tPjmFqk6g3NpG
 B0UrcpgoqkMBEwF/j3OxhfFMNG2eepGCuFZ+PJY8NqvzeUELuERZMNCJKv5GKufPmgnc1JT3/Ag
 p16VwB7EMx9u12r4NmJI4ATro0DLt0gEyqBS0KRtVim5P2nKlxTSMOnux/kR7HUyhGOHRQLpgm7
 uMvDH7VfkLD837d0UVgNU8UH94t8cpX5nBNZJjQpkIsoHLEKLG4KR4vG6QduH95mrsEZLh+yAZb
 h1o3MI2DtLrRxyTYBqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0OCBTYWx0ZWRfX3zeq5dX8apHe
 2zCwBYB1zqlSkIVDjOnZrJI/JwYksdSTfddCA3dEAZA9YIOqGMCWluK9y5cOKShgutp8LmFiPB+
 cVAr5W5hLnG1jLNceC1iDUmz/a1Shuk=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa15aec cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Y8AG2edEbfE3NdgbFfYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090148

Code classifying given line exits on first condition match, thus a line
consisting only of a comment in a continued (multi-line) property, like:

  interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
               /* Performance counter interrupts */
                <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;

was treated as a comment-line line, not as continuation, leading to
false positive warnings of invalid indentation:

  arch/arm64/boot/dts/tesla/fsd.dtsi:456: [indent-consistent] indent mismatch (expected depth 3 * '\t')

This needs two related fixes:

1. Move the judgment as a LineType.CONTINUATION earlier  before one
   classifying as a comment

2. Check the comment-stripped DtsLine.code, not DtsLine.stripped, to
   verify if it is a continuation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                            | 19 ++++++++++---------
 scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts  |  1 +
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml    |  1 +
 .../dt-style-selftest/expected/dts-cont-align.dts.txt | 11 ++++++-----
 .../expected/yaml-cont-align.yaml.txt                 |  3 ++-
 scripts/dtc/dt-style-selftest/good/dts-cont-align.dts |  1 +
 .../dtc/dt-style-selftest/good/yaml-cont-align.yaml   |  1 +
 7 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index b10e30f9d5b9..9fcb2eeaf7fe 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -202,6 +202,14 @@ def classify_lines(text):
         if opens_block:
             in_block_comment = True
 
+        if not prev_complete:
+            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, code)
+            out.append(dl)
+            prev_complete = (code.endswith(';') or
+                             code.endswith('{') or
+                             code.endswith('};'))
+            continue
+
         # Pure-comment line: nothing left after stripping. Classify as
         # COMMENT_START (carries to next line) or COMMENT, and skip the
         # structural classification entirely.
@@ -211,14 +219,6 @@ def classify_lines(text):
             out.append(dl)
             continue
 
-        if not prev_complete:
-            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, code)
-            out.append(dl)
-            prev_complete = (code.endswith(';') or
-                             code.endswith('{') or
-                             code.endswith('};'))
-            continue
-
         # NODE_CLOSE: the canonical form is "}" or "};" alone. A line
         # that is nothing but closures (e.g. "}; };") is still treated
         # as NODE_CLOSE for depth tracking, but the multi-closure case
@@ -545,7 +545,8 @@ def check_continuation_alignment(ctx):
                        'continuation should align to column %d '
                        '(%s)' % (target_col + target_offset + 1, err_msg_explanation))
             # Align to the value within <> or "" of continuation (so the previous line)
-            dl_value_complete = cont.stripped.endswith('",') or cont.stripped.endswith('>,')
+            if len(cont.code):
+                dl_value_complete = cont.code.endswith('",') or cont.code.endswith('>,')
 
 
 def _check_hex_case(dl):
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
index 5390ebbf4059..91a74887c774 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
@@ -11,6 +11,7 @@ interrupt-controller@10000 {
 		reg = <0x10000 0x1000>;
 		clocks = <1 2 3>, /* comments with " < , should not matter */
 						     <4 5 6>,
+				/* but comments should be placed properly */
 				<7 8 9>;
 		interrupts = <1 2 3>, /* comments with " < , should not ... */
 				<4 5 6>,
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
index a5a9eb17fc17..0189b654a5b0 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -27,6 +27,7 @@ examples:
         compatible = "example,test-cont-align";
         reg = <0x1000 0x100>, /* comments with " < , should not matter */
             <0x2000 0x100>, /* comments with " < , should not matter */
+            /* but comments should be placed properly */
               <0x3000
               0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
index a7ed62677a2b..fd7f389d6cce 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
@@ -1,10 +1,11 @@
 # mode=strict
 bad/dts-cont-align.dts:13: [continuation-alignment] continuation should align to column 26 (to < or ")
 bad/dts-cont-align.dts:14: [continuation-alignment] continuation should align to column 26 (to < or ")
-bad/dts-cont-align.dts:16: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:15: [continuation-alignment] continuation should align to column 26 (to < or ")
 bad/dts-cont-align.dts:17: [continuation-alignment] continuation should align to column 30 (to < or ")
-bad/dts-cont-align.dts:19: [continuation-alignment] continuation should align to column 27 (to the value under <)
-bad/dts-cont-align.dts:20: [continuation-alignment] continuation should align to column 26 (to < or ")
-bad/dts-cont-align.dts:21: [continuation-alignment] continuation should align to column 27 (to the value under <)
-bad/dts-cont-align.dts:23: [continuation-alignment] continuation should align to column 38 (to < or ")
+bad/dts-cont-align.dts:18: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:20: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:21: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:22: [continuation-alignment] continuation should align to column 27 (to the value under <)
 bad/dts-cont-align.dts:24: [continuation-alignment] continuation should align to column 38 (to < or ")
+bad/dts-cont-align.dts:25: [continuation-alignment] continuation should align to column 38 (to < or ")
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
index eb9a84d5c222..9e98c28867aa 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -1,3 +1,4 @@
 # mode=strict
 bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (to < or ")
-bad/yaml-cont-align.yaml:31: example 0 [continuation-alignment] continuation should align to column 12 (to the value under <)
+bad/yaml-cont-align.yaml:30: example 0 [continuation-alignment] continuation should align to column 11 (to < or ")
+bad/yaml-cont-align.yaml:32: example 0 [continuation-alignment] continuation should align to column 12 (to the value under <)
diff --git a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
index b52ee6cccd8c..e6450a1d8209 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
@@ -17,6 +17,7 @@ interrupt-controller@10000 {
 		reg = <0x10000 0x1000>;
 		interrupts = <1 2 3>, /* comments with " < , should not ... */
 			     <4 5 6>,
+			     /* but comments should be placed properly */
 			     <7 8 9>;
 		pinmux = <0x01
 			  0x02>,
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
index 8463075f9f4c..4a5b5ad43ee8 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
@@ -27,6 +27,7 @@ examples:
         compatible = "example,test-cont-align";
         reg = <0x1000 0x100>,
               <0x2000 0x100>,
+              /* but comments should be placed properly */
               <0x3000
                0x100>;
     };

-- 
2.53.0

