Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC533AC0F4
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521658; cv=none; b=T0uh4MDx2V3EvfCBeed3l3cQNN27Xr62kv0GPEtuNKv6oA0nEApC6DrB0rs9DVK937zZS41Pgz64i3FDjBQro3umEQjRrvPTBzlqGtekvwAMixIfC78DQFVjhMBn4ZIvrAF/IwMOBoRWrTP2uXTeQqvu76KpY5Mhy4mp9Kp97TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521658; c=relaxed/simple;
	bh=Uu69emYGs2xCa2QEFBGtCQhQgg/7WJY9mNOF4Qw6r5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mu/J9Rde0891ds4Nxk1mFWN/nKKfgEHjPrIyz4m1Rgwmloq6pSONm5yWIhk36Yq+f339qNXq/ZzS8ZDNlmuIr3XFw5PT6pMQu5XmnsTEUzI5x9KwxM3I2MjpFh/TO7FYA4c2tRhgoBHr4dnUYkUHvLmZ7vbhpHQCh8FOIbnLgNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJ3jcTsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StVLNTiW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJ3jcTsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StVLNTiW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3ibb2715613
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LR/1mT0vFj+AZwZXRMTrkGiU02iXu02QvuQHVO1OrI4=; b=hJ3jcTsWMmuMKXIm
	LoXTAnabt4UCStww32FZCW63c8wb84MKnw39mQx0t0Jhc9Spo/GkvDeIVZJiHl6m
	GZDWwCBpu1TNbdPbE+j4wXfuzNhikEecZee2TgPWiiaByIaV9HTBMJNqbW8iY5G/
	vMGhhlPn5o097vRfdd6h9cNDHNhYJ5VN94oenNr4s8ZE71glEABJG+YoI3cTzHcA
	v5DlC4MDNHuLvJDoHMJfjySRJOzjR6xJfAhDMKUBrEXhT0u9gh/RXa3kcG32yxJ3
	OdPn76U64ffgIOoQ91GnOJOLG/1xvgRLVe8HEmdSMUpSnQ93VJYcArpvVpDl7Huf
	FZCImg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd4yen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:40:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso14118521cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521655; x=1784126455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LR/1mT0vFj+AZwZXRMTrkGiU02iXu02QvuQHVO1OrI4=;
        b=StVLNTiWGjQWC3oFlq2QyDa8SW1tcSOnApAq9TkThblP76k3Fh3BWNAk5dxpFYu5xQ
         FDWwIzTK83SwwXB0K6vV7UgTXwMzb0uVzXp1R8/beWWVl6ekjP7MHpUijwXCkQJRRMi7
         F9AyyKxWGmFm8hBQHbrMosf5F9otpPeXT809K4eKFi+TxFi6hlzZJ++lZxYfII2bibQC
         eTXvy9v3tJ93tdpwDkd5Sc7/vl/R9p9uXr9/cNYfJLEi6Q5tRrjxUgIUJm69JspG4wS/
         XarWb9+l59fzmaefadaOw0XYLySSZwuizb8/w2buRwUPHUAaGwSqO1EAoxboCk3I2dmZ
         X37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521655; x=1784126455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LR/1mT0vFj+AZwZXRMTrkGiU02iXu02QvuQHVO1OrI4=;
        b=fWlW2MIimyu5rAXjvZSYIXItVMjYix4oLprq7VScFWZSOGpMqpGXlYmucBmddqDyzz
         9zI49HjHAFvYXSd6UfeZDR1/A/IPH3oKZAryyiOnGs/0vXiHQiRllwPPVFO/L9/tIbCZ
         B//Mebvg7SwLYIaDh/BDfmXsEyWEBP2Wfg+0mVU99QSNk0aJWRwvBowQeJaX161wKk2m
         AFRf8Y85SAbWylrcKfV+RdbqHLFbSsQppKLqkzJRV9WV5+cIAL1idAeEfhAFecFr/5Xm
         +zt2jl8QlzS8bI6i40IL6HMTGcqucBNmXU06Rjvwkud55pxqc+nomGyTCZ1OsBw/TODy
         OOnQ==
X-Gm-Message-State: AOJu0YxdBTEUNR8LbQiATUqF3W9WUijRj9RFvqEQ5yHaTb9q0ptO+3wH
	+KyJBiv+rpFnL4e8sg+n5/NqO7VRUjYyIQV+PApUO1yxTMZjZ1BbAElu1QqvMGHE6wA0CL1i4hq
	OrQougHpRzUBLI/pqOgpb9PbU2CLuCo4i9sHw5Jtegu1zYUE2gaL3w+FT66JvEHoPvVezeEn2
X-Gm-Gg: AfdE7clqdgJXncKaZkhbljgQSGgDhBgkCwlFwckcrQjijLTS/mcHX3czTIzhSGB4Tf8
	FYhET/0DgmjeFEO0v0DK9HuoMjbNqus6iYkQmp7Rpg8zKFAuSH5K0tOWf2KNI4LP9qqIkYcY6tf
	mj+ApaLW09YCa19zNn+TTCRRPjKv+E/zhoLTaFaBghXHNr5/fZyBTxUwcng9daX+blwZk7PHDkX
	3evs/RysgVAyOFrRd/rfOQ4kHK3yLBOgxL2uq9/kkbSmNqaeLQ859uLYkPtYEzXeezkPhpzX6ws
	7/HbEBKCsboN9iZrHJ6Vwk87BlJkRT/qUbggW3aKM1SZ1KjqeYvYCOv7YI7TyHg3SPwv+6+1laq
	lrIpAjnIUtNrUN7yoLPT750F2GcdoDZad0lM=
X-Received: by 2002:ac8:5783:0:b0:51b:f40b:2fac with SMTP id d75a77b69052e-51c8b48f6fbmr30984491cf.50.1783521655019;
        Wed, 08 Jul 2026 07:40:55 -0700 (PDT)
X-Received: by 2002:ac8:5783:0:b0:51b:f40b:2fac with SMTP id d75a77b69052e-51c8b48f6fbmr30984061cf.50.1783521654571;
        Wed, 08 Jul 2026 07:40:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15da821c58sm52543766b.48.2026.07.08.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:40:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:40:32 +0200
Subject: [PATCH v4 2/7] dtc: dt-check-style: Allow space-aligning
 indentation in DTS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-style-checker-v4-2-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
In-Reply-To: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4784;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uu69emYGs2xCa2QEFBGtCQhQgg/7WJY9mNOF4Qw6r5I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTmFoKu/5XIf8cCLIb849GOcGDe/3PiDQZ/5hG
 iSach+TfkCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak5haAAKCRDBN2bmhouD
 1//uD/0TkZ7aqZAMTOKFn8oFXb+r8+EKaxpMOS/Bavf6lbWivs+BbRKT1OMYaBs2PtDnGr8XmP6
 fPuhOTgnM7loYCopx/cHk+eLqtWpRznApc6E6ydvqHwWj+n5zlJhR5SNaxf3PJz2L4G4WtJWdcG
 x9hL8PQ1URe05AjzY/v5qL7lwlsjfmIuipr8IzyQIQ9HobHCEH4KdUfomedR/pDn/gRsXWQWNtD
 1oQr7KO7FpLSxOcR6fI4TZhslNuJRVdbcLPljh5HkOkpik7l1ZExxTNbV5wi2/dt6SfVBgITKi9
 Ce09iaxOBLJ78he1bLHWUJptraaGzaoEpFtb0u9mjpuvwAnAR/iGToiPdffc3DLEZJmBAgRRg2t
 qunFFdZfiw1UDcaM6E7Ae1WUL/BHJVjFLWiULgeSIw22jJJ2lAfga1iMFbRQpxXUrtCvfjYrrXz
 vS+EItXt2rfnTpJyLhMORRK6x5T8jbfEveLY/kPghW2Wjq+TbPdyRxfwLuBl7FWxro/zzYdBejo
 13Yk+/yZ+Q9tXqi4SO8mwyOUn9VKAlMdsFxQcS/RvRVh39YbUzJwOmThKk8FuOJ3/zQgX9ksOt+
 qGZqMpFLa6EMJ0U1GkrmCOQlVgy5GVK/bKyc7Esk+lCNJRLE3zvP6fA0dTI9R6MeTiZIjuGnt0F
 s5b2bQ1jUTpx7Ww==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX0rUtzjX3QAQk
 6R+D1F3Au5VD8ncBsm00j/KVHB5ROBWG3Su9J044QvSa/EIzsfY2pN0oBq1ATcWo8uQVUN9Nq0z
 Tbrxy5rOs4D7p06OTZNWrTAfwvw6bFLhvdOuoTq7aHmUdy59YBxTET00WYsQYKhDiL9y69CodLC
 yHyBwh0BTjpyvTkLFzndWhVyLoDyFG0COqQDM5obsK9NNZZxxClsQGVUbfXt7qm30PPq9sygNZH
 RPRDIEBy6m8XqInDgCROZJ384LmtsDfIjdZkRSziv+DR6oXHLn/FHsa5VBl5Y5GtT7AfHfUxg3w
 ageLmyTrSkDewFw2cPU+oPQdA+9Dhnw+FL9HrdZaGUIBArZGLsdIkgKeHyUTQCDcuLSuqZ8/Ygm
 olFaWWwjewq53IViUUWlgRyAatctQAXm6hy3i55Aou7QVehuF8W+LzmrFOmnLt3vzE2GzL3ZOq3
 b2mu3gjm9Zn4S2Hoiug==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e6177 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4QunWNA95kgjFIb9QjwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UQ13Q-PZ3LcC7T6o6OBVfLLdVlJnbBBr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX0nt28S8SGiI6
 PlWVG7EDPmXO0tAUO+o0K3GSkkM63Nxv+M0IE1lbL49hbIfjIA9sGxBcBG83LmwIwnb1lbkJ0Xb
 AdYxT+iT8l35dK8sdkNaR67PBwwA6bU=
X-Proofpoint-GUID: UQ13Q-PZ3LcC7T6o6OBVfLLdVlJnbBBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080144

DTS often have spaces after tabs in indentation for aligning continued
lines of comments or list properties, thus allow such cases to avoid
many false positives.  What we can easily detect is a space followed by
tab or too many spaces (more than alignment).

OTOH, DTS example in YAML files does not have tabs at all and there is
already rule for that, thus there is no point to check for mixed
indentation there.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Use re.search
2. Add dts-mixed-indent.dts test case

v2: https://lore.kernel.org/r/20260706102421.343639-4-krzysztof.kozlowski@oss.qualcomm.com/

Changes in v2:
1. Rework idea.
2. Adjust function doc/comment.

v1: https://lore.kernel.org/r/20260706071446.87669-2-krzysztof.kozlowski@oss.qualcomm.com/
---
 scripts/dtc/dt-check-style                           |  9 ++++++---
 .../dtc/dt-style-selftest/bad/dts-mixed-indent.dts   | 20 ++++++++++++++++++++
 .../expected/dts-mixed-indent.dts.txt                |  8 ++++++++
 .../expected/yaml-mixed-indent.yaml.txt              |  1 -
 4 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 29b25ecf15c6..5d7765f35ecb 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -359,14 +359,17 @@ def check_tab_in_yaml_example(ctx):
 
 
 def check_mixed_indent_chars(ctx):
-    """Indent must be all-spaces or all-tabs, never mixed on one line."""
+    """Indent must be all-tabs, except for aligning indentation (comments
+    or continued lines)."""
     for dl in ctx.lines:
         if not dl.indent_str:
             continue
         if dl.linetype == LineType.PREPROCESSOR:
             continue
-        if ' ' in dl.indent_str and '\t' in dl.indent_str:
+        if re.search(r' \t', dl.indent_str):
             yield (dl.lineno, 'mixed tabs and spaces in indent')
+        if dl.indent_str.count(' ') > 7:
+            yield (dl.lineno, 'too many space characters in indent (more than 7)')
 
 
 def detect_indent_unit(ctx):
@@ -932,7 +935,7 @@ RULES = [
          check_tab_in_yaml_example, applies_to=('yaml',)),
     Rule('mixed-indent-chars', 'relaxed',
          'indent must not mix tabs and spaces',
-         check_mixed_indent_chars),
+         check_mixed_indent_chars, applies_to=('dts', 'dtsi', 'dtso')),
     Rule('unclosed-block-comment', 'relaxed',
          'every /* block comment must close with */',
          check_unclosed_block_comment),
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts b/scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts
new file mode 100644
index 000000000000..f0e40cfc910c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/* Test fixture: a .dts using wrong indent. */
+
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+        soc@0 {
+  		compatible = "simple-bus";
+	  	ranges = <0 0 0 0xc0000000>;
+
+		clocks = <1>,
+			 <2>,
+		         <3>;
+		 resets = <5>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
new file mode 100644
index 000000000000..54ddf3608244
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
@@ -0,0 +1,8 @@
+# mode=strict
+bad/dts-mixed-indent.dts:11: [indent-consistent] indent mismatch (expected depth 1 * '\t')
+bad/dts-mixed-indent.dts:11: [mixed-indent-chars] too many space characters in indent (more than 7)
+bad/dts-mixed-indent.dts:12: [indent-consistent] indent mismatch (expected depth 2 * '\t')
+bad/dts-mixed-indent.dts:12: [mixed-indent-chars] mixed tabs and spaces in indent
+bad/dts-mixed-indent.dts:13: [indent-consistent] indent mismatch (expected depth 2 * '\t')
+bad/dts-mixed-indent.dts:13: [mixed-indent-chars] mixed tabs and spaces in indent
+bad/dts-mixed-indent.dts:18: [indent-consistent] indent mismatch (expected depth 2 * '\t')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
index 4b3d990e0824..bc3fc3cf00cc 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
@@ -1,3 +1,2 @@
 # mode=relaxed
-bad/yaml-mixed-indent.yaml:27: example 0 [mixed-indent-chars] mixed tabs and spaces in indent
 bad/yaml-mixed-indent.yaml:27: example 0 [tab-in-yaml] tab character not allowed in DTS example

-- 
2.53.0

