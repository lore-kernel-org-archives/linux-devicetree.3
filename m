Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20B3911CE
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660357; cv=none; b=QXfu9FILzDtAXYAJkktwTeSOpuMa/Jp3MtJhbrRtDcqjZ9n8pACGr/N1jsAeVMVeCZYClJXFdXI7eNQDYaHjh7X2O0j48PyNOwFEv3u0IC5VodV86FibzTpbgzQZTXSO6gmBcQMBqNFf6dX9+In7/yrk0tvemb/9eHPh37PP2b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660357; c=relaxed/simple;
	bh=YE0z2ZRy+fNjyWhP8li1mcS3QB+EiA5HrR4nvwDI4xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mg3lJCE0OvFSoYNZssUGMNGT513re/qGKpOWdbiiBg8rwIvdCzopSoqGwUnv0hKOSFoNxWIHBXuH3zuFqkJs9c8t7PNoShiI4DQx4m+jSQmSjlP0gLDeEqZEx6svTruoO48x3mG4ISSefhO3FzeLzdanV+4EWG/525Z0pdJogOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Od4/iVjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxQr2s44; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Od4/iVjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxQr2s44"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727luSU1262188
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j09UVDmhRNeeJdTKDjolG1iUcKqWDW/GodeTRF2HL1I=; b=Od4/iVjr32EJSmk5
	aqVCxxwTYt5AlgI8XSAVIz47dXbukXkbXWueMk/SPnau6yGkSLELAe9wuTMKHV+g
	n6TEhMR+vkbepUuTRBEFJhQifA5pEBjetxm6Xg6KkYzKIGomTtmWgwWScKtASRTI
	2439lCRMdxTxBbnRqjOdOTPZxoRRNnf+Iwu0eeYZSnS8UlbTuFRxFgFNRUdQOh1Z
	jg3ydeDNdLxTTmYMcMjZDsdAHUbzoH/5LM6EYDhzJXalqH807mvMYQp7jEpJPRG9
	4NmNcZpqPk4OrNQQEne9kyqAElyfr0ntT/dj1fL3VfmCiFY1QBJtKVITm92PcgBi
	5cZF9g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs911agcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:45:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so23122431cf.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660354; x=1786265154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j09UVDmhRNeeJdTKDjolG1iUcKqWDW/GodeTRF2HL1I=;
        b=OxQr2s44Js0nr0YjY61ec1SzVUtzY8l6oQ1wUftCpAVHCcfUP3yAZK9zSQDPVFgpoQ
         dRvwuKfU0f4iEYKBss/BY8abz0yGskYl3293acM/mW67guxPO7yysnz+6SL+M/9QF2sA
         LH8IWemSM9+8BRXWeJj3DjUG/0oce4FL0asr+8ntnH0YqoWjkAGysbpLE1lc0C5omghq
         Mh8aPV97jUW6F0vLj4HfeeTQrA5xFHhRTufNsJgvX5CqlRM32txfZy2QglsuG7erw768
         dw8AHRE9wqBXf1Gc5ISfQUibEleAaV1LRbbBOFknbT4vUUQGk2eMYcA2IgNQC6OM1mSK
         DlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660354; x=1786265154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j09UVDmhRNeeJdTKDjolG1iUcKqWDW/GodeTRF2HL1I=;
        b=Bao0k8R9P4lALjts283hZB8V7uBR8IKkSSbW/MRpDB1uMVR31UeUiNZLC9E2nwNP8k
         SPRFF2OYzB0bLIWDE9Q0DXJzarmr0Zm1ABKTtE4TmMiZvhK1XdZUOjy60A6KrfFXYDuN
         DTZhgB3oZFbP/gQSwIVZwaIJXY7tzcqKBcdzMTD/1Gw0nOuVYcn9RxBwksZyY3wS+L2K
         +oq6W8YufVbncCnbdqC1IakSEf8mphPzHoP+K9coN2WkAbDy/5A4L3ZmSF9L6mL6uNBG
         N2JA0pvvoyugnMpBINSVTdskRTxEFIUDGk5D54+l8RqyTV+mqegJlJ9r2Cg4J2HpTyjO
         9y4A==
X-Gm-Message-State: AOJu0YyyMcM1vHUVVibgZb9S3YegngxhFB0/NXUM8oadkjIHUz6Ch7GT
	/V6h3AGO5LU56eYEgHJHe7tAJkrjtSafMD5srNDIMAopn1Ygg1n8/J/cTM6+FICZ8Gw1wJGgKFv
	pnbBjtynH0ttSCDjxx2wuWjVoMNfjAKrkcSd3NRoPyAehDkZguJkm77COKqg/pSBUN1w+yDlJ
X-Gm-Gg: AR+sD1125irjDmZT+j5EIC8Mgobw5Ujo6J39mF47ssA2MilPdQp4oXv3EKY3hQCHqOW
	ssOS762PYUEe3Q9Yox2kYkWRcf5a0XphmjhijeLSqKJT/rTvRcHK68okcJldVXY+CLi0fe9Qn7a
	qCeew+bqwODgxuaiwu50vqp2WY7W+HZk4gjuRoTFheNv48e8vUFZixaepG59Hk5OZCPOar1/T1R
	ZjO+rWgGtbzTkiBSky45P0/7+vbEEsgPGNFi6GCFVAj6fy8LYr/klX8Ru2SBCnMcYukh5u+0Mtd
	0X9JTZQXOwDaBBSCHSKejAEXJSwLXlAW8xFp45CtbTJAfFRfg/lYZJosQaTLxGW61rlSk0Zj9rd
	f2yzzHfnf8Uuibmfl3mJc33EK
X-Received: by 2002:a05:622a:2590:b0:51a:8c79:a2d with SMTP id d75a77b69052e-52b56673ed7mr118358031cf.1.1785660354133;
        Sun, 02 Aug 2026 01:45:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2590:b0:51a:8c79:a2d with SMTP id d75a77b69052e-52b56673ed7mr118357841cf.1.1785660353707;
        Sun, 02 Aug 2026 01:45:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:45:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:28 +0200
Subject: [PATCH v2 06/11] dtc: dt-check-style: Fix alignment of values in
 continued property lines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-6-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8500;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YE0z2ZRy+fNjyWhP8li1mcS3QB+EiA5HrR4nvwDI4xA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOvOiayFFnEAivgTHfQW/FnFwLdcyv7B4ZXd
 oECqnVOKGGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DrwAKCRDBN2bmhouD
 18tkD/4pA/O5NjkVPWDyKxxm/wGIuoDtayJv4Vtl28kcbcZ+pfv3EynqgPYbMEH6CQAxuEh3caI
 4XLUt91o+NsFSS+KA2NLiFDyg7wf8exrNCdwu3gC4oQtfa1XI9xlgT2Qw2exUZ0Wk+1mJVKt1oK
 0fwwEafd4N2Jjcl7+iy5/Muf41yKgX5CQCh9evJqc2I1ixpdWb/J8R15jIk+dYPzIS5sLwfOsi2
 SrPazmRaGzZVqTGLPzOjpY4MNazRhBJCbe844sAjN6obaNHjMju923SnYiN8NXupe+frBil6ofa
 fbfUuC1+r7Vv6gC6TsS7ilzTO7yyqfu5pZ3kPg3BdbVxd5SpJCiZ3QDT7SbqSOZiQwyiLWyQjJt
 r1rlP0WeroityA82zt7xPm66U9wRlA9bFidEBErWTcM6LirOI9xlvazVCBelzWNcKehrExGKc9H
 490UUPfUaGfxIgYfL6MD3RqLXMBJ751AzfkKBkeB6VtQutZ2VnHkoXAVxtAZ2UAy1KD5WJzqN5m
 DEKRXdTVRBYdgZ7qBAD5cPPZpxpa5i0ZTskCJa2vJoQ1FidS6W/TXPVJ+8gGH4Myl7kgF70/bJQ
 ogX4ILTzv8SdzXyrMJpBsCiG+tBGdSn4uG40fgAx4a4kjH45M35IwoacJr7k2kdII3hDhiHVbbT
 XqCl62qGosY/N/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXzuwJglQKsUqc
 LwvmtHM+O27O7phGTa9/R4C0jxpdwTRv7tah1EIBsZIfhPG3RW5jg0gnus1y/LOS0Cb4Q2mlPyn
 hz6T2flwQxlVkhqeydCOXd75qGB3q6c=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6f03c3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=JHzK3u4RkIQMqoYOWxQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: T624gsb5flVMmwZl-37VB9tNuelcGuYy
X-Proofpoint-ORIG-GUID: T624gsb5flVMmwZl-37VB9tNuelcGuYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXyI/yzy6F5AQ0
 Vr3ybY6iWp9xE0pkFIIgv9XhiL5WzUT8su7YE2ti6yDPObqlffZPIyp08Nce/+S0wym10LkuUR5
 wRBO/2aoJ6Fi349/7SfN4ub2ra46W4cNRzDlYlbWt1nptS4EVRz3ECaFRW95y4H9ma7cWtIbk3H
 EU1yBvsqeiZqX/Bs1ZefypSLopCpDQTKCpnKlYcd8LLvSXb9mnecQc5cI2uFg9VPvq/PRM/Ni0t
 vpIe1iaD+Y8RPSwVbvK2ItYCEs4SqBNNtN5nhgMHNEo+k5rUUwPvYm6oiMLBSqzrxJ8ylahMSMV
 EkrWShrzpeEva91syZt+xGL5rLN6TWu9Baqkodai1i0W4Gzebc7xM96v3Ht0nREIXUxFrVW9LSX
 fB+sjpAKDC+L/vI5TNr0sVNUzdx/XqRrOAcI9I192G8g5ZL/4L9MRMA7qOouPnjU9WYHC604FAn
 iErK7LNA1JDL0zBulOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020072

Continued lines in property assignments should be indented to opening
'<' or '"' if they also start with that character, e.g.:

  reg = <0x1000 0x100>,
        <0x2000 0x100>;

If the continued line is part of previous phandle, then alignment should
be to inner values to make it more readable, e.g.:

  reg = <0x1000 0x100
         0x2000 0x100>;

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 22 +++++++++------
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   | 23 ++++++++++++++++
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |  4 ++-
 .../expected/dts-cont-align.dts.txt                |  8 ++++++
 .../expected/yaml-cont-align.yaml.txt              |  3 +-
 .../expected/yaml-value-ws-multiline.yaml.txt      |  1 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  | 11 +++++---
 .../dt-style-selftest/good/yaml-cont-align.yaml    | 32 ++++++++++++++++++++++
 8 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 04247e39a78e..cb3cdfda5e73 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -928,10 +928,11 @@ def check_line_length(ctx):
 
 def check_continuation_alignment(ctx):
     """A multi-line property's continuation lines must align their
-    first non-whitespace character to the display column of the first
-    '<' or '"' after the '=' in the leading line. Display columns are
-    used so tab-indented .dts files (where a continuation aligns with
-    tabs plus spaces) are compared correctly."""
+    first non-whitespace character to the display column of:
+    1. the first '<' or '"' after the '=' in the leading line, if continuation is with '<' or '"'
+    2. the first value, if the continuation is still the same phandle.
+    Display columns are used so tab-indented .dts files (where a continuation
+    aligns with tabs plus spaces) are compared correctly."""
     for dl in ctx.lines:
         if dl.linetype != LineType.PROPERTY:
             continue
@@ -942,15 +943,20 @@ def check_continuation_alignment(ctx):
             continue
         # First '<' or '"' after '='
         rest = dl.raw[eq + 1:]
-        m = re.search(r'[<"]', rest)
+        m = re.search(r'\s*([<"])', rest)
         if not m:
             continue
-        target_col = _display_col(dl.raw[:eq + 1 + m.start()])
+        target_col = _display_col(dl.raw[:eq + 1 + m.start(1)])
         for cont in dl.continuations:
-            if _display_col(cont.indent_str) != target_col:
+            target_offset = 0
+            err_msg_explanation = 'to < or "'
+            if not re.match(r'[<"]', cont.stripped):
+                target_offset = 1
+                err_msg_explanation = 'to the value under <'
+            if _display_col(cont.indent_str) != target_col + target_offset:
                 yield (cont.lineno,
                        'continuation should align to column %d '
-                       '(under < or ")' % (target_col + 1))
+                       '(%s)' % (target_col + target_offset + 1, err_msg_explanation))
 
 
 def check_unclosed_block_comment(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
new file mode 100644
index 000000000000..2087dac23d96
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		interrupts = <1 2 3>,
+				<4 5 6>,
+				<7 8 9>;
+		pinmux = <0x01
+			 0x02>,
+			<0x03
+			 0x04>;
+		power-domain-names = "foo",
+				"bar",
+					"baz";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
index 92778540b056..d4662acc7b8f 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -26,5 +26,7 @@ examples:
     foo@1000 {
         compatible = "example,test-cont-align";
         reg = <0x1000 0x100>,
-            <0x2000 0x100>;
+            <0x2000 0x100>,
+              <0x3000
+              0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
new file mode 100644
index 000000000000..a4672206859c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
@@ -0,0 +1,8 @@
+# mode=strict
+bad/dts-cont-align.dts:13: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:14: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:16: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:17: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:18: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:20: [continuation-alignment] continuation should align to column 38 (to < or ")
+bad/dts-cont-align.dts:21: [continuation-alignment] continuation should align to column 38 (to < or ")
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
index c0801c56d5db..eb9a84d5c222 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
-bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under < or ")
+bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (to < or ")
+bad/yaml-cont-align.yaml:31: example 0 [continuation-alignment] continuation should align to column 12 (to the value under <)
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
index 3df55b1762d0..d25b5b425e3f 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/yaml-value-ws-multiline.yaml:25: example 0 [value-whitespace] extra whitespace inside <...>
+bad/yaml-value-ws-multiline.yaml:26: example 0 [continuation-alignment] continuation should align to column 12 (to the value under <)
diff --git a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
index 36fb4eefcd83..1a1c07c09a41 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
@@ -18,9 +18,12 @@ interrupt-controller@10000 {
 		interrupts = <1 2 3>,
 			     <4 5 6>,
 			     <7 8 9>;
-		pinmux = <
-			 0x01
-			 0x02
-			 >;
+		pinmux = <0x01
+			  0x02>,
+			 <0x03
+			  0x04>;
+		power-domain-names = "foo",
+				     "bar",
+				     "baz";
 	};
 };
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
new file mode 100644
index 000000000000..2e7b8582bb7c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-good-cont-align.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with aligned multi-line property
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-cont-align
+  reg:
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@1000 {
+        compatible = "example,test-cont-align";
+        reg = <0x1000 0x100>,
+              <0x2000 0x100>,
+              <0x3000
+               0x100>;
+    };

-- 
2.53.0

