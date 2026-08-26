Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB43D647F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739712; cv=none; b=HLA1BWt8BU7W7SyaAEeq/2r7MEG45X3ldK26Mb7KsGUbDe3n/6hbFJ8+/E4vgR+uujyntVUNS8aehOLafbbWiQgWLBRHn9Re3ixqlm+Ym9q/vzPS7Btsfq0hm4aP8XbfDHfK8rwsGpstkTydkydvWy4gnp4hm5oQL/47nRPJcjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739712; c=relaxed/simple;
	bh=C65UqZmpYTqSq0SMzsq17jhoBI4uhsECXL5HRiw/DMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elKtFI7kAwT4v+ibUiwWfZrzlek3xnRq0eHw+53EAMeSo12Opp39rwijxgfAa8njBw4wo06/H1SSCy5H0znmPNOMvQF9kB2y622xiZD3doLMJyD79qgZkuwIN8c4u2kXIFTNvV4jajR1/YI4zUaKVbQlgx2Kp59TpjbiDtlNYjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnCCO2++; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGXAoAb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnCCO2++";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGXAoAb7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHJxM019425
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqNcfEwqlYZCWWH4U4AgoKO/WcgVnEiNkh6PJ8wYzBo=; b=SnCCO2++0Hn/hBWX
	yB9EhnFAH2hBRNAk395sPqyKFnIlQrxPxZgdIuYXbFIbhnJPz3oG26oj15D9N+tM
	krwJP8Bt7DiH9qHYSldE+VAgnnHAG+P1LE/oXhjHKYnQ+HGpWrV3W0oTIr96h+G0
	tKSxaAXOvY7SIgTXmtbnNsfliQlgAO2c2MleQxrtp6+0/XFP7tl58NU5FhUVVblO
	rp7gYe2jNgM88CJ382unkNhNv5ErN/orRqc3Rhtu2RHrJAmiQ+GC/pqcbtBl5BU/
	zL1M6Mu5bfduyzv/bdtZLnREKGZAxSVZUJ0m8yUTh8VsmNj6q3Y1Y6vgrx2X7S0S
	yGAtOQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3d5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso4689641cf.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739708; x=1788344508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqNcfEwqlYZCWWH4U4AgoKO/WcgVnEiNkh6PJ8wYzBo=;
        b=iGXAoAb7x0msSqetoU0xv4k1F+n2NXtOPFNmpl1EEEZNz9a0qknskstkOP7SWgw2yq
         K6RNu3UdbN/IADd0y0925+Rhyy/CgqF1it7tJcOoOa84wErQMKkJ1ItyXMqJMLEMDfb7
         BffLEcPykkFtH+tyKqHZE/F1eBGRxCpQZT+0oGTSoi+bquPLXWk0lbJUEZDJB6qUtHhU
         zLdM9E6a2zgAZPOFnzu8s4aYFNIq3xtxYi1OHmu1a0LPcTx9AOrbLe12OJgwRNi0BjIH
         wbpMF3nzbIeL30vvSDncI+dmFcr6nQ52j5Xwu9SpAW6j9sP5yt/WDmIyyLl5pZ8jP4az
         3d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739708; x=1788344508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqNcfEwqlYZCWWH4U4AgoKO/WcgVnEiNkh6PJ8wYzBo=;
        b=KhZMt6Zi1nGwN2M9oN1xUF0HZY/JR9T94z+CATlmq+f1iu8ZpZaJJP09Mi6DYJIWOv
         G2voT1OUYBev1vE0B0GR4yg6/V7W2HRctP16Lxq+nUHKi4iet5aj5XnL9fSk8WoNT7Ek
         7EPjUXRkH8SpaL566Bh6m0G+zXS07c5m6NR9RqEZcdKeOxFHIzaLQFczHvDLYgP+6Jd+
         w/C1/gv/TtjiOdyGi9nxZN8+1CSAqcxYRkhjHpKfNYnI7tIEt/VAeJ9D6twgy7ybrPNI
         VAqvEoERCGTTezVba+Aq5Csrm2rhFVas/MzNIhYKQnPSmYZWC4WwofTdlDBtz361D0yD
         l23Q==
X-Gm-Message-State: AFuF++mLpsAUCbOaW9BH3hXqX1APfpVh2V65Xdeoty/KUUzWEWA4Sq92
	Mm83diIXsyZLkYZjASfaxlV7FdSDYTvjQvDcAZ2TG2ldxq+SzZaxb5nGB00+mpfaaLTLlsA4r7W
	K5j16dc+PyKLJ13QrdJMQ5vWLQ4WelVTfTdAvTWZJPbCiY7fd3V2jpuEK7zil5pN3
X-Gm-Gg: AR+sD10jj/JcaPyNiT7wGDwO+USYxDnRPXtm3CpW94DBc64yeeuK6rZhZpTJhsZQTBr
	dVkkyDN5Qa3BcvWd3BACFB07fRylxA+1k6Xnj2tUb4KxtQCMLyR9O6NA5zWOoxofGNsDp69t7Zf
	zJ9/RjdR5ybUbiV2EaV7hZIIiFGdXYHPP1IVav0UvFLSuz/8qXfFD1Jh4P+h0TcYXCtuPRcnbke
	iQ3K4PEMkyY/myIy62TRhroyj6vBlMEwUditYjJUB0VROJNa5h6xxQuO5teJd7j2YeYL6QRdCF4
	U3p9tRaCqXI/ywit0V7REZt7xpE2NcZ5UEu0poOrwphIW0JJJoJPsGiz02G91Ck/XjMlTdVrap3
	kk5nyAssJwIN93ZlZNtLuDeY=
X-Received: by 2002:ac8:5907:0:b0:519:8b76:2ce0 with SMTP id d75a77b69052e-52e423ab046mr55084141cf.37.1787739707497;
        Wed, 26 Aug 2026 03:21:47 -0700 (PDT)
X-Received: by 2002:ac8:5907:0:b0:519:8b76:2ce0 with SMTP id d75a77b69052e-52e423ab046mr55081171cf.37.1787739702184;
        Wed, 26 Aug 2026 03:21:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:21:24 +0200
Subject: [PATCH v5 03/10] dtc: dt-check-style: Fix alignment of values in
 continued property lines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v5-3-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10257;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C65UqZmpYTqSq0SMzsq17jhoBI4uhsECXL5HRiw/DMM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4nFw0TqJkYcRgGV0JIctJAc3bXmX6EhZFnj
 yw4aEBa+N+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+JwAKCRDBN2bmhouD
 14SjD/4sHX/OuVZJh3n//TiPdaahFenUeb3DMi1oekjkveykq/HsnzJ/Bd9zA9p9Ylk8t8U7Z0j
 pzksrNMefHhf8VogNfu9tHJZzUHR6l10qv2N/XqMJJnPaxYSvkkMQjlc1zzD4ErU9sedMTVxrab
 AvQCYm1IuU16Z7T9w8yV4oqvsnB7YWeOVcTPfu86EFlbvlAWqEMUoS6hbAoGMLJVmMjhW7DBhq4
 TURrrzdwGEszsumBFvZkd42JlqTN6yKfLr6InbfxusrOTzOKXzQGMucyIu4eJ5z+saI2NuAhv2z
 N1KSc42eJ+iXFtrWrf5yx6cXBF54J9l+SR61XVAjOqHb95m41V5WgdQD783iMV5E5NBEe8aIFBr
 vhRmoqMosRal/jO+jxnd31CDrkaKPsrlEhjq2u02dSaBHbAwO+asbZtZmiMhEbauXon3xJzjL2Z
 AA0UriUQqNzhG1Kftp//szZ8u+lXzV5sC+mTdY5Lo9pL+HXrPDGqZWrhUQrFC9SNtYM4WG/8DVz
 uB1d37HlJ8/3NWglGFwrHq8MhAuFF/JPHkMc6K0NAwYZ9Ql2nXKWsaeLIR2NOwIjCHUKm/A8mti
 Fwjtp1Ku4FD1Fa4x35sV56RsBw+bO2FYvwu55oTXYNXlCA1DmXo48sYkmq7ZE9cC5mq7+HDtz5W
 JHmxsw7Bm+7RZbQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: JGZt7sO8I9AZxpCCYD0OToCIwXLj1Jvt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX/3COD6ajtmIg
 YCN3NaL+I18IrFvwqDQoZdJw61Uam5sVio+UtE1L0EYKGituNq6ura0W9qSqzBrXFsuKVmm49za
 wKsIXAL59Mu9J7WSvEovzLqBUY8aRPI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX/8ZPx4AHx2xB
 OHV5VQaqmGr9CcwTjDtSRrDy6VS86G6F2V+b3jMDrh1JOkENKJQ4UxrFsIU7gBdbTggO+7qQr+i
 xwMcMIktJ6c7CX6yB6Jc8ui2uL54xHXE9af+LMXXhMVssFuoz1XSI0uvGg4p9zH/t+EJWNLbUaY
 4fF1TJ06cqLoIvNfETdULAj2aE85dTL7I4R0QC4bR5xyjBbeyOG90CsmzxZQagED44s7Hp8ANS/
 kfA1BQjnQufwhtR+65HkBZVxs+U3PfkRY5iStxM3+uDwekXT4Jklba2yZB36u9vZuipa8eXwsTf
 o4+WBkIIDy1o8uACJ8WBFv/VQjCaD9kahtOSruHh6cpWsBaOjbDQE8YWLgyYm/yRz4n+JSHF7+O
 FD5AIZNKxXxuVwMKd6jOy1HKFAAtl7b0LmbVsU6fBEBQHX4SnHxNrcfsQcP4hc97UKBubVBRbK1
 6/ex6zQnFwewcHNXuhg==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ebe3c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=hSPt3AOBSVI_F3cxmAoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: JGZt7sO8I9AZxpCCYD0OToCIwXLj1Jvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

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
 scripts/dtc/dt-check-style                         | 32 ++++++++++++++--------
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   | 26 ++++++++++++++++++
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |  6 ++--
 .../expected/dts-cont-align.dts.txt                | 10 +++++++
 .../expected/yaml-cont-align.yaml.txt              |  3 +-
 .../expected/yaml-value-ws-multiline.yaml.txt      |  1 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  | 13 +++++----
 .../dt-style-selftest/good/yaml-cont-align.yaml    | 32 ++++++++++++++++++++++
 8 files changed, 104 insertions(+), 19 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 833f8a03ddc9..5ca477d60889 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -926,10 +926,11 @@ def check_line_length(ctx):
 
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
@@ -938,17 +939,26 @@ def check_continuation_alignment(ctx):
         eq = dl.raw.find('=')
         if eq < 0:
             continue
-        # First '<' or '"' after '='
-        rest = dl.raw[eq + 1:]
-        m = re.search(r'[<"]', rest)
+        # First '<' or '"' after '=', but ignore comments and strip trailing
+        # whitespace (e.g. remaining after removing the comment)
+        rest = _strip_strings_and_comments(dl.raw[eq + 1:]).rstrip()
+        m = re.search(r'\s*([<"])', rest)
         if not m:
             continue
-        target_col = _display_col(dl.raw[:eq + 1 + m.start()])
+        dl_value_complete = rest.endswith('",') or rest.endswith('>,')
+        target_col = _display_col(_strip_strings_and_comments(dl.raw[:eq + 1 + m.start(1)]))
         for cont in dl.continuations:
-            if _display_col(cont.indent_str) != target_col:
+            target_offset = 0
+            err_msg_explanation = 'to < or "'
+            if not dl_value_complete:
+                target_offset = 1
+                err_msg_explanation = 'to the value under <'
+            if _display_col(cont.indent_str) != target_col + target_offset:
                 yield (cont.lineno,
                        'continuation should align to column %d '
-                       '(under < or ")' % (target_col + 1))
+                       '(%s)' % (target_col + target_offset + 1, err_msg_explanation))
+            # Align to the value within <> or "" of continuation (so the previous line)
+            dl_value_complete = cont.stripped.endswith('",') or cont.stripped.endswith('>,')
 
 
 def check_unclosed_block_comment(ctx):
@@ -1052,7 +1062,7 @@ RULES = [
          'lines must not exceed 80 columns',
          check_line_length),
     Rule('continuation-alignment', 'strict',
-         'multi-line property continuations align under < or "',
+         'multi-line property continuations align under <, " or the value under <',
          check_continuation_alignment),
     Rule('unused-labels', 'strict',
          'every label must be &-referenced in the same example/file '
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
new file mode 100644
index 000000000000..5390ebbf4059
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
@@ -0,0 +1,26 @@
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
+		clocks = <1 2 3>, /* comments with " < , should not matter */
+						     <4 5 6>,
+				<7 8 9>;
+		interrupts = <1 2 3>, /* comments with " < , should not ... */
+				<4 5 6>,
+				<7 8 9>;
+		pinmux = <0x01
+			 0x02>,
+			<0x03
+			 0x04>;
+		power-domain-names = "foo",
+				"bar", /* comments with " < , should not */
+							"baz";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
index 92778540b056..ccf443173dca 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -25,6 +25,8 @@ examples:
   - |
     foo@1000 {
         compatible = "example,test-cont-align";
-        reg = <0x1000 0x100>,
-            <0x2000 0x100>;
+        reg = <0x1000 0x100>, /* comments with " < , should not matter */
+            <0x2000 0x100>, /* comments with " < , should not matter */
+              <0x3000
+              0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
new file mode 100644
index 000000000000..a7ed62677a2b
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
@@ -0,0 +1,10 @@
+# mode=strict
+bad/dts-cont-align.dts:13: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:14: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:16: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:17: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:19: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:20: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:21: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:23: [continuation-alignment] continuation should align to column 38 (to < or ")
+bad/dts-cont-align.dts:24: [continuation-alignment] continuation should align to column 38 (to < or ")
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
index 36fb4eefcd83..b52ee6cccd8c 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
@@ -15,12 +15,15 @@ / {
 	interrupt-controller@10000 {
 		compatible = "example,intc";
 		reg = <0x10000 0x1000>;
-		interrupts = <1 2 3>,
+		interrupts = <1 2 3>, /* comments with " < , should not ... */
 			     <4 5 6>,
 			     <7 8 9>;
-		pinmux = <
-			 0x01
-			 0x02
-			 >;
+		pinmux = <0x01
+			  0x02>,
+			 <0x03 /* comments with " < , should not matter */
+			  0x04>;
+		power-domain-names = "foo", /* comments with " < , should not */
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

