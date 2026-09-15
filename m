Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A830429CDA
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491861; cv=none; b=BG5c8sJ05Uim30Yo/6QxyhXQYoDmJJwDR4M7VLlszDE2DWjNV+dzWiZp42P7HV8ewpt3TmUvQH6PupzTkeAH8j96NsYgaqRCzlTPMnePAYetTr/ETNEONwCaFKdotjRf9idZhv2ok8pZMOu40pe/yMAMkvLqD95pvsW4ykV6vRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491861; c=relaxed/simple;
	bh=741ERsL0tFk0OViomsB6cXeJKp3J33B9FRo8i0gUf/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADrrLbvj1dHEWFekDIFu0Vd4U7BCI49o7CBzsdopM2TkAC9t+BtxEa7NugAnFKoXCyOS1bvWo3lwPIomZWOV4oTuyfoM43oqfcIOSsgNQKjRhAQri1VTgUdT1KyNQWKPaFvocUGt6WDgtsSIJxWDh1UoxoiDWN399TliBEOmFkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F72TNFxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGUhnfmk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F72TNFxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGUhnfmk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAYLO3958815
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a64CUPH5JJ0RgB3MbwcpzE0cQIAFKA9Mj5OWDwBTcZw=; b=F72TNFxiUCAhI2fk
	UIGHht88ct1y0zzL/4xEgYz2WWIqomHSNOPaRBWdqYrZqvGRzaX9O4xtUndjKNuz
	+C7asnt4B2kKSlSvqkTt2IxZUixf665MLLnBraEeZfUGsgiEG+a/VvPxftcequGp
	dd2dD/Jj7CeMtaJq85Lf4B8JJVdom43v9gzKTxrUgLyAwAMe74dt3viw1n7COxz2
	teuMvFBl8qos8IXHyRyLmw81dh/OYNnNIlXC1Jaj0YYSt2ObDpSWV9xA3AOFEVK9
	0IxEzzyI5FMrO3o3Z50ceZK2SRczDTzM/l6a8xuVKeWdzxqtEFnlNibEkr+4Xn7W
	U+SdEw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2j828-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c96449cc2aso1369610e0c.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491851; x=1790096651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a64CUPH5JJ0RgB3MbwcpzE0cQIAFKA9Mj5OWDwBTcZw=;
        b=QGUhnfmkXG4x6wh/bWLSWGl4w6wCHgrorklazThyzyqOXqrsnyqdCpY7TKmWUveb6N
         FTBRjh3P6d7TXrfIIM2pAR48ORsquCfozBGm/IUs1CNRAWlQzXJnNTJc7oo4SYOCZV16
         9QmQYSXIbEaQcNapfzNbSV1+zE3fSqc4lkDLL+dTeCTGRjmUAcaLONith9Ad7dvwC4N/
         5YFXhvSMsCBP5EXUngqQTLNKTIT6YAVaLijnCBAxkPIw3gpENZNIINxwPeCfKUX3N7sI
         0DSxTPbbV4CgvUd+F7ZoS2+trnYvYN5ckKStqYa0Kwat+CcP+yyfleZimEy95gidDktj
         gLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491851; x=1790096651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a64CUPH5JJ0RgB3MbwcpzE0cQIAFKA9Mj5OWDwBTcZw=;
        b=Ge8VtJgh+CZQak0eJn521avQWgLfr7bX705UA8H8fYKpwlLbtFuUgMxad9qUzmdkbZ
         4iWytJRn5R4/plHbYl9t9UrXIaR2FoG6w6nN67u3hvM/UtCNgHp9ajTE3AydH+xDE3FI
         d99dg8sBIAl7iwBzB3teiv9X2ULvWNm07ZqHNujmkd0qDybtAoEmsmsCNf1qzHuq6TgD
         2DGbpNAexaZ/dDenybZUK6R5klFn4v2Ugrr7yyWIsCMEsLFbO7XkN1pe+6kC70nb9uIE
         MzgGal0XrukxuIqWe0yiIYNbDtljts7TaKHzni/35YosJOYfAjf0Z/gGzFmlR8ZC8GU3
         f6Ug==
X-Gm-Message-State: AFuF++lLQY+Cq7ZDEKct/JsGTFUhsY5BYH4+ooYA8aNYXSCop5LOLM6E
	lRcINIQtVGr5yKNTcWELwVD2nxsid630aDHg27Fm4boO9ak5N3w9rGjsDZY6y3vk14xakDaEWsm
	l/ZTeHu1VNz4m/OgvpL8N2O7i9lNSreoIWv8jeSKdMwk0568eYBoY/h+rcI80hozr
X-Gm-Gg: AYBFou36XmOs/f3+DuWtQcLWFGXWS827jI78DS8+YdX0t2eIKn13NsKORoGX6QsNwpq
	/lTCf1CEy6MxUXvZ3NgFK8eDwDbHXDTZ9PLAfccm6hrXnl7y2OL4iN1VhS2TUqAVBmwU81Vv3f9
	7zYqgqWRcIFGCJAe3Rk+3OxWpOkZHwGvJTtP43sKZkJ9cP5Wyt9wGG/pQ8apehnPdO55TAmyVsp
	PzUyKYlBFfPbzaIl4F92G+k1ztJAE6udh8CpiFFPMdsi3WVxcsXJHMjYrarH0hkHxhHYynmz5xm
	Sdox0r9BEYyTrLEzbuCGQ8Pv6VQAFvRI3nVi44F1113TxJXknBPPOq3qoLcCHhNwXGNaE4dOgQF
	+x90CxfL3I8t/nKZcNTx3zNs=
X-Received: by 2002:a05:6122:d17:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c98a4ff3b4mr3133286e0c.7.1789491850265;
        Tue, 15 Sep 2026 10:04:10 -0700 (PDT)
X-Received: by 2002:a05:6122:d17:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c98a4ff3b4mr3133075e0c.7.1789491849495;
        Tue, 15 Sep 2026 10:04:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:04:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:03:50 +0200
Subject: [PATCH v4 6/7] dtc: dt-check-style: Properly detect comments in
 multi-line properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-6-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8586;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=741ERsL0tFk0OViomsB6cXeJKp3J33B9FRo8i0gUf/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXp6Z10oOYuzUR/KSjMvmLKXL6UwPnrgZpcj4
 rZ+TO+sHoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6egAKCRDBN2bmhouD
 11QID/0fA3EIkkIejX03IdxoEs8ukFgYIps20UGxVYbZAAlAUiAzS8TIP24ptYZ4caJXqvkMLHz
 IUsjOBSfpTEel60ddpjuTn7Q7t7T2jXreJ8ZWEZlRn6KDmmlU0KZSW6EOXUa3PoPt3V0bExUzIo
 V9I6jxnZhJddizI8ku4GbmeDNWU4o1gS8REELetNcWQvj4QjNPA8j1WjeyXM2yus0JCIKRBUyH3
 gq/HgRUw4ut3/AJaELhXKZqxmnikekVugp/hls3cVicZAYGXngxH4zvo8tMlLGWJUOdaUINY9Hu
 rwATWNzZfX27SQoYhHHEyM6/B8kgEMlTSO/oo1rN2gfsKldPQshkSMTUxwqLwzLjg3a6IsrlHpv
 6KCM8u5c9tNYHa2yq7gXWdu20Dqp3dDmb3KbOyRVoRukoR8ew0W4bbw/JfZQp4tLAs6NLYhEiiG
 8bA4RvNbRi5lJ4gcpP4PE6MphAcPBBtjxiTGUZN7l4cgzd390+kHDav9ZCnyq3F3MLSQXtibQe4
 mgqI07x6oanEnWv976EJLPdTU7RRzxKFswXYPa4gDMXqFK/IfBs9Gz0yzvt68+LfACuR/S5zjRn
 V9ttZCA0lTtoJ3R7yKbDjLjf20BSHwf2v26OtnbJJiqcnJOiM+yn37kPo6SYSyMOBHzeterYzEc
 GgWJO+GKsIqCn4Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 3TaeAOKs5jkGk-y8wwtOrgFuG3JUXW7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX2r+ZQZOfVfNm
 xHHIkBvRrYqqdXTqvSpcHIFLuq6KQqj22rwsr/rUM6SWcD4/usz94QAp1OgBnmZ3IpCNO1DqD8p
 DTtn0nrG8F+8gsXI0pA11izGFOG2RivshWLSAe/c1mDQKdMosIdZYHZ2q7p2tAhbX/Jk7eSpW/j
 JpFlEOfoExnVXtLRTzSL8gGPFJUi1OS/BD6aNAZIfBTnzgAu51lmPydOtXlVTAnSlPWQYu0IePz
 NHCpnVi4B3TVnFA7c8yDq1JUg277QlIeEtMHHh/Qr/aJ3fUALT19qVp1wO/N3TKTGCSeFHYw09p
 1aZBrfUJm87gpB0i7NfItIoanTB+sPdDA26jIHZD0hGuTaaPD8et3CRyVnero67SkbXYSZASXCt
 yRBeN2l6zEOgjt613hd8fDM4h08Hl2sT4WvaUodKcx38ukzC9GdsRw9Um8uTdLZ+oYENeJF7+qf
 k7KQlltDuIVty2gwpBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX2iufV5c64S5u
 p+WWLQZIn7OWMFFQQ4LQSe3nQa7MuUo6et6GtiO80/Jw3Ny5ffzG0t57L9jk9uTxEufAVM9L8q0
 4OA85TyS2OA8cqIR44P0tQtkIoZmzfY=
X-Proofpoint-GUID: 3TaeAOKs5jkGk-y8wwtOrgFuG3JUXW7H
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa97a8b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Y8AG2edEbfE3NdgbFfYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150249

Code classifying given line exits on first condition match, thus a line
consisting only of a comment in a continued (multi-line) property, like:

  interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
               /* Performance counter interrupts */
                <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;

was treated as a comment-line line, not as continuation, leading to
false positive warnings of invalid indentation:

  arch/arm64/boot/dts/tesla/fsd.dtsi:456: [indent-consistent] indent mismatch (expected depth 3 * '\t')

This needs two related fixes:

1. Move the judgment as a LineType.CONTINUATION earlier before one
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
index a36c45c29476..cbbb8d384aca 100755
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

