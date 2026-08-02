Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4A280338
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660367; cv=none; b=jowuF1hM8T5o0NzRkCIlXdYSGRkBvSJxW1k7AUD1wEkEZGSh9gh58dIO3U7R/ib1IAjv+h+ppnHQSJq5p0fgGL5INiDNjJuf6OmMLzVfMfkw2DShzJ+67IqtMsVSUvoNuXvGa659yRZENoM/ACwVcrVYeP9KcKNrnGPMhYmKaFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660367; c=relaxed/simple;
	bh=+aQWcAZ0TVLFGD4KZ0COiKYzxux9CyMlFJZtzARC2lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jV4s7DBA/9bizCDRoLYnxEPXK8H/0nAUviTI/YSKvBgdSnZvvLcqPqTjV5oUXjnXQzmKq07GQ0Orqznih5je0u7y7tuFcNZpSO36jCi+BjJP9nptTAQtaY5piceus2HHqPYssc9RZ8OUF3btf7HQCAime/F17d5lXgPJFGbSVLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arMPNQID; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOQxwdCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arMPNQID";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOQxwdCJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727m8rC1603135
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmYeKGjgemico9wxLJemvTSdSrr/iVJh5QJpJS1sDbs=; b=arMPNQIDID8oZc8W
	uklAkqVpiFVxIS/TLdQLPj/UMv1k6bsYew/Dqq1O8Kgnq8SLnIdPXq8jtqbN8oAC
	26VEcA93/Jqorpt327cLVQ8SA8QqhWYFf6LBFQj5VSO7torL0TqlOhtZYLyYqG3/
	lKewjRGVQQe3EEO0cSdGJoZr1TP5ECrRQmDEAO04tqM0kWuah1RH6pe1X7WMPGB8
	Zcgf6dFKatd+ebqcYveU7FdaRwTOF1+DTpljzby0u6blCSWy9TcDGswm0fmWjdiX
	+hww91BMEgPHc1tSif0tw+2YhAl/MIWf8v/bjFWrFKqm7t3AV6T00tBhJ/hG6OOK
	UjIiVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qptgfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:46:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso16043811cf.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660364; x=1786265164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmYeKGjgemico9wxLJemvTSdSrr/iVJh5QJpJS1sDbs=;
        b=QOQxwdCJZ9G5a7+FlgC8aUntdolTCEv2PPHfsw41C9F6JhA84BtiT/iLJXOoxhZtCw
         tBjzrMCoCmMFba/hdu5/DYpw3WNtozDJVqzFqMMppPGsIJQ4vIZ0v+8G/Q0PPW+FcmV3
         5rIvvgMPfWhMuhShwXVmc7HLGBq7w0WfCcv24A78zv1DzFbZcmpnLR+M5ciJSzOzhWmw
         PR7LdsYA7Qco5/shP7vr2kDS0YjTtI5eHKBzLu2xdOSu8LrT44pwwXoEWXifMeN2Bbd0
         agHX/6RX0CToEv3sxxjpx8DErBranZWsAI3EQTQCUdw8BQ1W7BsnbPQhGquq06ApHXd4
         U3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660364; x=1786265164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmYeKGjgemico9wxLJemvTSdSrr/iVJh5QJpJS1sDbs=;
        b=swmlO3c7tSzFEJH+jLpLBMbC42KTM7uMqHA215coXujljYQpOJvrXybZ1lJM9BGdCG
         Qpprh/jHRWgCSfPa4Ia105P3HIiVuqx0C6AjPMANxRvF0/TEJHGFM9TNwyOe7/3YERlQ
         sP/H4d4VjEaKRrIxfuWoBPjh6Fsu9Sg8eCfungzpoR7DHg4Ux7axXXgnHK9Ax//TfXhC
         hvPKmMXrJOC5y7xT2Ynn63w4B0E5Oi+3EDuu+HM7V+XXFym37uuV2oJaCa7VojLRfLhj
         4phNoorAkbcbkJyGxWMlEptSx7EblKmwFZBkbBa0+nO2Jj3ZLu/mOaIyPmm68TYTwniv
         4A+w==
X-Gm-Message-State: AOJu0Yzptw6JktChysAxCG2i/Er0Mmxz7tpdVnNdPRMm9BFxtUz7T7yN
	ltvoGu4SyL25gEa18OVJIk3oYHoBgBXSNVFliSa9bpQgz/nmr663EiEBleibyd4WZO9YPyWZW/9
	WEF5Hy8bytHt6QZ98DzN3CLJzuI1ZQlQD37efYh9G+0FZXMNqMPb76rFscEsQVGch
X-Gm-Gg: AR+sD11rYojQzN3mFzy/OHqNcVZwhEShtIYVNZf9abWxnALe0ML53Wiv5chsKpw6lFY
	3LLJ+pkykZtdxqY6obrpWp8BNR88D0ZpS04Ubqk8NSkYohJ2HOArwRIuHoJvig0bMGZU43Q3hUW
	EBlXpfOWX2IOKYRJXo4iJ/LhUAxtFvzuUvChDXK2PrT8RRwNr9w79g089K8L6ZbsuMh6Poax5If
	ore4NJ7v92d/mGvrmv8HeP7AxFB66KgDOHC6XhWQec63aK7c//Kxw3QyOFyTxYvBzqR2eIyiPPN
	OrSiIhW+dR8U0RC7k3Zpj3QQf1zZ4QPmToTSKmJOjs6+wSHWZ8/J4dsHVAtVW+7LJCFLbNA2EP2
	gxcG9dzGiYW2hg1XvCxwOiI++
X-Received: by 2002:a05:622a:4c17:b0:527:73d6:f6f5 with SMTP id d75a77b69052e-52b567f7b9bmr121759091cf.41.1785660363524;
        Sun, 02 Aug 2026 01:46:03 -0700 (PDT)
X-Received: by 2002:a05:622a:4c17:b0:527:73d6:f6f5 with SMTP id d75a77b69052e-52b567f7b9bmr121758801cf.41.1785660362971;
        Sun, 02 Aug 2026 01:46:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:46:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:32 +0200
Subject: [PATCH v2 10/11] dtc: dt-check-style: Add warning for redundant
 white-spaces
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-10-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10971;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+aQWcAZ0TVLFGD4KZ0COiKYzxux9CyMlFJZtzARC2lo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOyrWBV7CWFh9ikkpBZpm6JcW9GXMtUcSX+K
 l6jZ0LGrFWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DsgAKCRDBN2bmhouD
 1zOeD/4letudxEtMtgywYxU9Zee4QVYFZh+aVDHG0NiJn64QxseIFOeMLcAgbJjl7z0I26q7Lm3
 UW04UHKIgNlqHlwKoD2/eogDbqNbHofD67igRiylOVBszlGIPrddI0YYYL/8C2UR3XXvUqv1QlD
 miTghiU5FZsrW1qHZ3n/hhU2DqcK1t3J6a3zQmbMRa7hBQmtjATIm6vvEbLLf3uTvfimTsUOuu4
 tCFtdF2tUk415VX5mAXss8jpi6nXUzm8HIT9GRxKEf76JVfdenAugKyMCLXFMJAof4x7S3vWBGW
 oypo5SraDYz+ZkZqG5Qr6EWBmta1jefTHchjlEVOewLJJhXC76tCwqFhiq+dqOyqSaa51jezIC9
 Fd+j2v93kHDyGt6cfB91syBf83AL294MHXtBq4TON8NN6SzXd/yHEYWXg+xq5OMEAE681+AItCh
 iLVYYk6vbEM+VfLzPplpcB7VgG2s0nle1Nbi78ZAwfTI9g1jhVJRExnqtoludK5ZZHUyIWg3TIx
 LxknV1VA7fuMAETdclYsjkt6LiA/aGKkmepXmjM44ieZRU0qG9fu7yLfLqfNuxe0j0PdFyhOnZz
 yzpJtXVYouDAU0CK9S3Ci4rlv069splPiLdHX9RlQSUC/eG+kvmDhJfBGPNPfqKFyfWuEIwvvmZ
 8aFj2skq+KA3y9Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXxEKMMp8kLwK7
 LpC3jYEfQvMpBP0RDaGpyolzksF+dWPeDFmwWKPYtZd+AFvVZrGX123lzfJfWeZ7iwItnMJjUYt
 Ckq51xgXdH05vzBczRbAgukNdobXI5j/gm+um4OhunyaSJKGqFuldaiItdWVQdCGrBjAoCX1GLt
 Sqhedmt9GSzE3DoCtZqvMyEOaoMHH2iYdfWJM+VwNdsOzEvmfKVbc7AEwio/E1nFHNabRudn2P0
 Gfi3jmbBQB1qE9Vh46P7Ua1IMk0aFWtAP7pEiXlDaqPar9GRpuozUPyhCo+tQzKwJdWv0i+uiTt
 ciRRHudMBcGiP5jFLeG2EvhSYEPybu+TUHhw5FIVt4hBgZvyML5GaLQCpqy5rIbsoRAu2O5Btze
 2U3kLcNLJtVOs1zgJQ5zbOhJ6XDLmK2SZcfu3qovFB0B0sNN3Z+TscU2z+MKs3H96/JCDmGdurB
 9GSW2U2NTS7zYHvCcVA==
X-Proofpoint-GUID: XNAnp-fKrm_T9F__7SGGzqbfyLQeY7MB
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6f03cc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=B8xk_V0qu_cBOhDEdJwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: XNAnp-fKrm_T9F__7SGGzqbfyLQeY7MB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX8w1UZIl/4aiM
 DtJhYhSgrMqkWaw8Jt4QCWyhlTBBbVRKjm6K4UcHjx3svTXQB0xPujy7xu71BODMmpmSJ0lhz0V
 uQq8eEyadFq+krLuwTS0FHEi0hdLa0E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020072

Show warnings of too many spaces around '=', before '{' and ';'
characters, or using tabs for these.  Both in-tree DTS and DT bindings
have many warnings for the first case (too mant spaces around '='), thus
keep this one only for 'strict' mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 38 ++++++++++++++++++++++
 .../bad/dts-redundant-ws-strict.dts                | 27 +++++++++++++++
 .../dtc/dt-style-selftest/bad/dts-redundant-ws.dts | 27 +++++++++++++++
 .../bad/yaml-redundant-ws-strict.yaml              | 29 +++++++++++++++++
 .../dt-style-selftest/bad/yaml-redundant-ws.yaml   | 29 +++++++++++++++++
 .../expected/dts-redundant-ws-strict.dts.txt       | 13 ++++++++
 .../expected/dts-redundant-ws.dts.txt              |  9 +++++
 .../expected/yaml-redundant-ws-strict.yaml.txt     |  5 +++
 .../expected/yaml-redundant-ws.yaml.txt            |  3 ++
 9 files changed, 180 insertions(+)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 56d8d0c217f2..6512cf5cfdde 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -348,6 +348,36 @@ def check_trailing_whitespace(ctx):
             yield (dl.lineno, 'trailing whitespace')
 
 
+def check_redundant_whitespace(ctx):
+    """No whitespace between brackets or other code elements.
+    See also check_value_whitespace() for more checks."""
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.COMMENT_START,
+                           LineType.PREPROCESSOR):
+            continue
+        if re.search(r'(\s\s+|\t){', dl.raw):
+            yield (dl.lineno, 'extra whitespace before {')
+        if re.search(r':(\s\s+|\t)', dl.raw):
+            yield (dl.lineno, 'extra whitespace after :')
+        if re.search(r'\s+;', dl.raw):
+            yield (dl.lineno, 'extra whitespace before ;')
+
+
+def check_redundant_whitespace_strict(ctx):
+    """No whitespace between brackets or other code elements.
+    See also check_value_whitespace() for more checks."""
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.COMMENT_START,
+                           LineType.PREPROCESSOR):
+            continue
+        if re.search(r'(\s\s+|\t)=', dl.raw):
+            yield (dl.lineno, 'extra whitespace before =')
+        if re.search(r'=(\s\s+|\t)', dl.raw):
+            yield (dl.lineno, 'extra whitespace after =')
+
+
 def check_tab_in_yaml_example(ctx):
     """Reject literal tabs in DTS lines when input is YAML.
 
@@ -1002,6 +1032,10 @@ RULES = [
     Rule('trailing-whitespace', 'relaxed',
          'no trailing whitespace on any line',
          check_trailing_whitespace),
+    # See also check_redundant_whitespace_strict() and check_value_whitespace()
+    Rule('redundant-whitespace', 'relaxed',
+         'no redundant whitespace within code',
+         check_redundant_whitespace),
     Rule('tab-in-yaml', 'relaxed',
          'YAML (also DTS examples) may not contain tab characters',
          check_tab_in_yaml_example, applies_to=('yaml',)),
@@ -1052,6 +1086,10 @@ RULES = [
     Rule('unit-address-format', 'strict',
          'unit addresses must be lowercase hex without leading zeros',
          check_unit_address_format),
+    # See also check_redundant_whitespace() and check_value_whitespace()
+    Rule('redundant-whitespace-strict', 'strict',
+         'no redundant whitespace within code',
+         check_redundant_whitespace_strict),
     Rule('value-whitespace', 'strict',
          'no whitespace directly inside <...> brackets',
          check_value_whitespace),
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws-strict.dts b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws-strict.dts
new file mode 100644
index 000000000000..d73908b2ab0f
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws-strict.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+#define SOME_MACRO(foo)					\
+	(foo) ? <1> : <2> ;
+
+/  {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* comments  { are okay  =  though ; */
+	soc:  soc@0  {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells	= <1>;
+		#size-cells =	<1>;
+	} ;
+};
+
+&soc	{
+	serial:	serial@20000  {
+		compatible  = "example,serial";
+		reg =  <0x20000 0x1000>;
+	}	;
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts
new file mode 100644
index 000000000000..2fedf462ca56
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+#define SOME_MACRO(foo)					\
+	(foo) ? <1> : <2> ;
+
+/  {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* comments  { are okay  =  though ; */
+	soc:  soc@0  {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	} ;
+};
+
+&soc	{
+	serial:	serial@20000  {
+		compatible = "example,serial";
+		reg = <0x20000 0x1000>;
+	}	;
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml
new file mode 100644
index 000000000000..14c2346d7658
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/yaml-redundant-ws-strict.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with redundant whitespace
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-redundant
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    device@1000  {
+        compatible  = "example,test-trailing";
+        reg =  <0x1000 0x100>;
+    } ;
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml
new file mode 100644
index 000000000000..db265402d0e8
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/yaml-redundant-ws.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with redundant whitespace
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-redundant
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    device@1000  {
+        compatible = "example,test-trailing";
+        reg = <0x1000 0x100>;
+    } ;
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws-strict.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws-strict.dts.txt
new file mode 100644
index 000000000000..ac0d57bdecdf
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws-strict.dts.txt
@@ -0,0 +1,13 @@
+# mode=strict
+bad/dts-redundant-ws-strict.dts:7: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:13: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:13: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws-strict.dts:17: [redundant-whitespace-strict] extra whitespace before =
+bad/dts-redundant-ws-strict.dts:18: [redundant-whitespace-strict] extra whitespace after =
+bad/dts-redundant-ws-strict.dts:19: [redundant-whitespace] extra whitespace before ;
+bad/dts-redundant-ws-strict.dts:22: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:23: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:23: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws-strict.dts:24: [redundant-whitespace-strict] extra whitespace before =
+bad/dts-redundant-ws-strict.dts:25: [redundant-whitespace-strict] extra whitespace after =
+bad/dts-redundant-ws-strict.dts:26: [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt
new file mode 100644
index 000000000000..c18c1972bb47
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt
@@ -0,0 +1,9 @@
+# mode=relaxed
+bad/dts-redundant-ws.dts:7: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:13: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:13: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws.dts:19: [redundant-whitespace] extra whitespace before ;
+bad/dts-redundant-ws.dts:22: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:23: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:23: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws.dts:26: [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt
new file mode 100644
index 000000000000..a70b365b6cf5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt
@@ -0,0 +1,5 @@
+# mode=strict
+bad/yaml-redundant-ws-strict.yaml:26: example 0 [redundant-whitespace] extra whitespace before {
+bad/yaml-redundant-ws-strict.yaml:27: example 0 [redundant-whitespace-strict] extra whitespace before =
+bad/yaml-redundant-ws-strict.yaml:28: example 0 [redundant-whitespace-strict] extra whitespace after =
+bad/yaml-redundant-ws-strict.yaml:29: example 0 [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt
new file mode 100644
index 000000000000..c85e80ed272a
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt
@@ -0,0 +1,3 @@
+# mode=relaxed
+bad/yaml-redundant-ws.yaml:26: example 0 [redundant-whitespace] extra whitespace before {
+bad/yaml-redundant-ws.yaml:29: example 0 [redundant-whitespace] extra whitespace before ;

-- 
2.53.0

