Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3F23CA48E
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080872; cv=none; b=ZAu5M6+P/veepqlCXOmv+z0bRoUUe83sHFNLxlu6qDJ0pM598whMATsrmV9gZmHtW12jG7ZTC3NkEF+zbM6KAdbvKmVSxButwND9oz53qSqfwFeL0vp1hhSUqRZYxXVBEu18sr5IBPyAFP+KxtTfbBZ4NBdfT6XgeUWss2PXgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080872; c=relaxed/simple;
	bh=inJM0WuQOUq2UhYquTUeOcuxwpwuuCbsomlNwiDJGtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZR5v6Rzt+zUvIOb9fkJpbd/LJwc7v/xodmqtbkEIHwmjZHtxp+U6nKKE+VB6XFbyQ0PwOOdKGykNEgL/OuNQXeZhVfhCyHX9EN5Na59nxDGp7eagijyyJdlXmwFEXo3VCSFaL6PfdGMMNaYyOdOAGAlILFRorYqsvFea1PTmQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKzXlDf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8G4xtIb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKzXlDf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8G4xtIb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE2tHR747692
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajAhFxGlSAslhRnaJNMD4zNhWLBRzOM2YamlBBuCGnU=; b=OKzXlDf775A4MzeS
	spUbyLspxz2W/0PrkID4tGlVntt+G01XNvwwCcKNiFI7/8HEHetAD63LHG/6PIEE
	v+0/XoXyLCT0HdmneqKB+L7J8tim+wfTmBVQjhaHw36dlb9dOIXYrFwfj20EIR2l
	HIwLGUcbisjGwPcQP2bncme0uJtkNHeBTxwYentIZR6y1HFUfwKs3n1U9FvcBU1o
	HsQAN7rnK1LtNeCzzADLvFd5oWSM1DGTRI6Li1Zn3hqoYCjqz1kNgbj3KwNJMqQF
	ugsdbDD81ZWL6dRGDegOcJsPJ6QE7rWI5c6fANr36jfVdJXggVzQQ5SS8sWw6Og+
	zvnq3w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnweu4fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c110a3b6aso28218501cf.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080869; x=1785685669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajAhFxGlSAslhRnaJNMD4zNhWLBRzOM2YamlBBuCGnU=;
        b=a8G4xtIb178YucRRP2f8CAIR7qddo43erErvIhQDGnzoJrVxzBKsb1HGefgKPAPdYY
         kFyS08PLlVu3eFYNhX5YeK3sxOkRJyHHAOwF/TxiJqVWD6YPJH4TpkncLThr6VKkhW5j
         2YpIF9FnitKTlh1JMZmMuRNnlxbK8SJmh6jCzG51dK6hjW4k5gdSPX6vLYK50w7pvy+w
         ykxDfky0OiadWK7j9B6ybAuri4CmGhIZOXTYaC+KwCpKAHf/BkXWGt2CAYz4e9yUf+tM
         F4K3D1eba1EVBrWdKEieham5K2BytXx/jm2xe7Vpdshnl8q0reOIo6zyZ3vrys52plqo
         reEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080869; x=1785685669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajAhFxGlSAslhRnaJNMD4zNhWLBRzOM2YamlBBuCGnU=;
        b=GfUR9rYa49+Kr+jeeFp6QBGz0d2bEeX94/nV1ieFyS/bVqHa8eu1V9adVGaZGtel+R
         NGQ7ypgQsa811SBT/bp4ZMx6nkvd5GHK4aGYQLKoEGApsfCX8g6vTP+hXF3Lzjuf4AVP
         Q3Ik2dS0VO3En9nkwqOx9vWQtglXeHNbl22khtX9O5LSUOHYTsVVUJ+Smwc5jz49AI32
         AF/bHjVedT0NPYEIa1IV6Mq0NsuwXYcIHWqKKQdiLHMHg64Po50Q0Ej80bfxVpAvwcMF
         ftOQGif6CnMI8f3OzpqodiL8MdKSGW2stnUcRo0MdLQ3VuL0IhWpJkxofioJRS4eHTJF
         eN5A==
X-Gm-Message-State: AOJu0YzMpnkL4jDNTHv6SBUrkTzwfv30SbJ5h1QPEvoYRBlL1oxJavtS
	57FvY217dNIAuLo+zTWOa3zIEZcvCfW+SdNj960tAqMdWWMNC+01NM1RcNucnp2uVnalQT1nG7V
	qgoLdFzQEQkaGHyvVFJpPpzcmUG0IV/WdG8bMSpiVN3uCxfhz2yIf5n7dvAW0rldw55nQ0+Y2
X-Gm-Gg: AR+sD13jANBcbvwvojCbGHiYyVpG1InYsGxv/MAMxGJldaZqWJEr97rOsXZ7WF4xjWo
	8IMBpNlzsXuI830XtxMRcrUkmaiJjW9mSxtd9mSMW5GpxOyD1/wvP4V2G4wbjRZFY5buRUWJywf
	hJD8i0JzfAw3oAzu95GLcOD+rnFhKLLG01hDFjn9iuf1HDZYUDi2gUjAR/YmAbjbsfLQUA9YKmF
	/z1kXr9C0nvSVH3DAg1IMmQlYH9c4BbaP7B9Kj1f5v9fFBlaSIdyP/f0osHwtt1aG8Jr8ydaDuf
	/fXumYEdi4tvWiL5IxrV2iPcLOSUy0oeKw3CkhoR86/YkjwEPENl+VGCPyjj5/A+VMQbZtTPu51
	c60r86P0wUupa1YWNzgdGBYQp
X-Received: by 2002:a05:622a:4b12:b0:526:d595:c7fa with SMTP id d75a77b69052e-529a83a5af5mr53886551cf.31.1785080868933;
        Sun, 26 Jul 2026 08:47:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4b12:b0:526:d595:c7fa with SMTP id d75a77b69052e-529a83a5af5mr53886391cf.31.1785080868491;
        Sun, 26 Jul 2026 08:47:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm236848035e9.3.2026.07.26.08.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 08:47:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 17:47:25 +0200
Subject: [PATCH 6/9] dtc: dt-check-style: Fix alignment of values in
 continued property lines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-n-dts-style-checker-continued-v1-6-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8242;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=inJM0WuQOUq2UhYquTUeOcuxwpwuuCbsomlNwiDJGtI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZiwUd3mM4aaHelxntXjE3VnEOfMRxz4PHWJIR
 YQuptbve++JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamYsFAAKCRDBN2bmhouD
 15laD/9py77oIvGb6pS1oX9GeemPwWmQRKpm1wT+6NRm7Z6x+c8KV/5JpsTXixpiULxtMKw14gA
 l5VvMKPJdOeNj5SY0sB1aGz5bmktZXyks3WZ+S9CO9UsJ0VJ7TCdQ2zKJ1LVNLSmOUxTX17yK9n
 p4MpUCIoEkDIYg3Gi2nLcuJyP2L1+ueQnb3EAcM7SMuGWtKNHZDfTayg2i+ncwcjXTY6HJbhiEZ
 BLH8xX4mz2BmU2u+tKad5c/2RD6Av7U6cR6RoE7LGTVrK/B1gYI0SElL/K5aqoZ1LCtF5CZzSkN
 ijgzUZl6xfp1s+e3c8BewIVz6wXyUnLY9ofI+8+c6w//wYq/ahhWd11iYtjQpbNQY5QLa02Blly
 thtNMOE1qKLzx1VIEl8i6DZUPf1bQ9IgpvCiFxt07VoKWX92266NAbgLsW8NBh/YUgqovzpv0PL
 RalrKTjzIgvwyJRJ8Qo54ePvHwDV8KnTW9lTskNviUGprU1+fzy35wsnNJIximJkOaSWjw5EGq3
 M4RjuOr74ORah1+Cx297bMBodj2iuef6GrxUP7S1Bgbmf1v4f06OsvZLkD7jkg3IXK0x/iIqf5j
 QIX2xGhzrW4rFlDI3/uI2BIg52Q8YskZZHDPoV8zwaJVORgfcFQyawgcmW74gZWfsJ01POjPFgx
 3wM30P+xdvHjyXg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfXwT2/5hgfxmnm
 kn1hdq6Gd9wUbh81ZAAC5JUULdcsjvB3EoFohVJx4XsoUcWpV1h5tSMYtlSKsE2uRy1RfCvHqR1
 z3QMWMP+RXpvZ2mI5ASP+j3bH3qhECV9g16Z8q5I7PGdx6+c7QslKW7drdum7FwZIbSKcFrR2SS
 /JKYls9P6ojEf8Kew63S4UjTf70dAwSb9vZ3R4vnOzV3ruf9F+rQaZ/KiwCwUWu5dL7zrKT6LoA
 5JLZYsXv2I7LIvwYc1JocLLnVa964rkmm3hJ0J/AhzAv6Dm0AfU4SACDxNp2L6E4O4onRzR5Bfi
 ZdMZrJvNBqyjVQKhI39VFRbaMU25CKh3IkWSVzggO1MbUVxH2V755+TylW3fVfi2D7GSI9DVMok
 c2aEUqc2y/Rd8zzvVzdqYEo9uHIvSidQFNdiK5yEodGAl/CX67jNhKVAXwTBNDIfklK9UTmGciU
 Ilys88FVeycNED5Z0zw==
X-Proofpoint-GUID: G2gUYSljOw9VD2JIaqXQD4l_LGhYwjUN
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a662c26 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=JHzK3u4RkIQMqoYOWxQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: G2gUYSljOw9VD2JIaqXQD4l_LGhYwjUN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfXwjYjwykx0UP2
 gMkAJB2PV4mdzQ2biBaZH/CSFIsxyzu2WWgVOTxrNFXGslzcr6QqtJy70G5/6/qvSD5qK/nTfH6
 vP3dySa5OLEh2ekfgf6mqZQ9Nm1AeyQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260160

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
 scripts/dtc/dt-check-style                         | 20 ++++++++------
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   | 23 ++++++++++++++++
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |  4 ++-
 .../expected/dts-cont-align.dts.txt                |  8 ++++++
 .../expected/yaml-cont-align.yaml.txt              |  1 +
 .../expected/yaml-value-ws-multiline.yaml.txt      |  1 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  | 11 +++++---
 .../dt-style-selftest/good/yaml-cont-align.yaml    | 32 ++++++++++++++++++++++
 8 files changed, 87 insertions(+), 13 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 4d90fbec0e39..171a5e12fcbd 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -914,10 +914,11 @@ def check_line_length(ctx):
 
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
@@ -928,15 +929,18 @@ def check_continuation_alignment(ctx):
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
+            if not re.match(r'[<"]', cont.stripped):
+                target_offset = 1
+            if _display_col(cont.indent_str) != target_col + target_offset:
                 yield (cont.lineno,
                        'continuation should align to column %d '
-                       '(under < or ")' % (target_col + 1))
+                       '(under < or ")' % (target_col + target_offset + 1))
 
 
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
index 000000000000..4619d44ff98d
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
@@ -0,0 +1,8 @@
+# mode=strict
+bad/dts-cont-align.dts:13: [continuation-alignment] continuation should align to column 30 (under < or ")
+bad/dts-cont-align.dts:14: [continuation-alignment] continuation should align to column 30 (under < or ")
+bad/dts-cont-align.dts:16: [continuation-alignment] continuation should align to column 27 (under < or ")
+bad/dts-cont-align.dts:17: [continuation-alignment] continuation should align to column 26 (under < or ")
+bad/dts-cont-align.dts:18: [continuation-alignment] continuation should align to column 27 (under < or ")
+bad/dts-cont-align.dts:20: [continuation-alignment] continuation should align to column 38 (under < or ")
+bad/dts-cont-align.dts:21: [continuation-alignment] continuation should align to column 38 (under < or ")
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
index c0801c56d5db..0047276bd3df 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under < or ")
+bad/yaml-cont-align.yaml:31: example 0 [continuation-alignment] continuation should align to column 12 (under < or ")
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
index 3df55b1762d0..dbf0c13ba862 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/yaml-value-ws-multiline.yaml:25: example 0 [value-whitespace] extra whitespace inside <...>
+bad/yaml-value-ws-multiline.yaml:26: example 0 [continuation-alignment] continuation should align to column 12 (under < or ")
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

