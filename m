Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5321380FC6
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788717894; cv=none; b=P8yNJ8nE6GGLypSwLaG5lTE29Lnl5H6Tp3XaZ1mDPfDoRi05BxiWOI7p2WCikDOo3qQV1Tmte3qVpos8VxxHK1KEb+kKDMt+EB/idN6rcKfVqycxanayKE4F2v/sLLyYOwrT8SeKRO1YLdM8cObk7nAAgA3IPxqE5TszBbM5Ui8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788717894; c=relaxed/simple;
	bh=4+G1DhO8QSZ6NjL/LHRvU/70LWwShyeiFKsRD1+0yK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7vW3ojvMdj1vd5FfrJaX86x7Amju8IZlLFk2QikEwHpt4JL4kB9E/9mrSLskt4iGCrHmXVP+403b4EKgHiI1fQ+OVjHo3wA2ABOOJLFfS1vIRcHBMO70TaFrDHfh/38zYXplTNP/wutWvrwvgoDP/PtQHwleF5fTe8P6/atpq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecFcYVn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRB03npp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecFcYVn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRB03npp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686HmMT41603619
	for <devicetree@vger.kernel.org>; Sun, 6 Sep 2026 18:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i2C2u4PTEAq
	AICh9EfmzlncstFy7bKnlRpPnUlDaM1Y=; b=ecFcYVn9gZAj0UOo1nkEcpNXGGA
	F+/xJpW+tSYZB5ng33w3dkQqD/5u3Oxg4Am6xHW9hAgOyr6zOVmRI/1Vymtwu7Ml
	Hdss7zGlhhCFzudk5IcrJoq1fc6i4Y0L+IYK9QnRks3XkObWCNA00HnBvJHvbaWk
	IPfHAvuj8L3IQbpm18DEGTD/SU3Vx50c8Vd9IJ8BoDAJoLlvUnZlFJnm5H2OHUnX
	rGT8fIbYw1BpWz6hW61dWPmW28YEqj+A9osdm2yF9uOjF2Jfq6/2sNEnW38gtQ4K
	h6p7ki5r6mJbmpQCFYtvOKW9PC5pd2dWVVP177YXFwYbg7kk2ae6M5MegGQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhkxyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 18:04:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c683ca769dso590635e0c.2
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 11:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788717891; x=1789322691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i2C2u4PTEAqAICh9EfmzlncstFy7bKnlRpPnUlDaM1Y=;
        b=DRB03nppYQgOidKcAwaB8ojhjUrZcGRL6pOA5TiobKx/fAxkYdUWLWGsqw504+rxWi
         2TriwgPYtt3Vxq96TSTkXtB2vWAZ6mtiYn9pewBpGetSrwmee5fHlY0Y/3dMrwSiym3a
         t6df3Zn8KXEcS+K2Y4Q3mJZbN9MAIxxfZUy/wBz6oN0S2G8z4pRl4Ckpis0XNRCRf0z9
         i0l454ChqGRMJrUdFFkzYrKV8ozcczpx8uziGoN4XvjubWu32w29oJCvvmB6bV2v3Fm8
         ojvhZ0IBseU04PPBLg6QiLM9wkK/SLag2SeJixa0vZQjPISFsfTMSEe3CrF3N6LgDtzB
         lHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788717891; x=1789322691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i2C2u4PTEAqAICh9EfmzlncstFy7bKnlRpPnUlDaM1Y=;
        b=RzcJdlf0+42pg2yX79y9maMZLOw7LnHVJxEfTPdB6ZuC78U99xFkBHIEbl07Oh0/FA
         4KU0UP3bmUg0ygAhXTNCrUGaP5MzDP3K1OdzjPWg837Z9vdUqZK7/80ihYNLeHBpZ9Ef
         qfMWJrLJ1sd0rgHrXWS/8xzs6Cv3LybOGim0q00ADRC7KisXgRWE4Mum8YG2PhUYbASq
         ttrWBnBvBqqGSwzlNSJ7OWrgvsHNMTeUW3Os+9WiVg1zQ6Yiwj2VHLBSgt8IhJgx8UsB
         xf5ZEYiVgdI83SZ51tTtu+GkvXhDAacIelO6aR/TgI6BJ25MwzZlPoZelzGbMdy8lrAO
         YNiA==
X-Forwarded-Encrypted: i=1; AKwUvBwkpadXOflpaA8vOAZU9oRQdrRjuif+Z/u+eB5qEY14TN/ZSVjBc8anM2wLHtRh8IP3Q3tKjmiCf+uF@vger.kernel.org
X-Gm-Message-State: AFuF++nxvcq7md3BhfvkaJxlDPqWgT2XIy2y0uNCD32nn+WDghUZK988
	oBfu0Sk2C55epweY4cAwRN9NjowcWIt3QWA62csCDXi24oS2rMY6NLUuOhhn1SSn+m9EuA+++Ft
	Hf3LAM+pVcUMb+9Bng2G3Y4L7uu5hd/zlA8RjjJ7kh/FKIqjPINaE4nGXTJ03sXJh
X-Gm-Gg: AYBFou3ZgNSxK+UEZXDXyr3YqyMOPQQ7BmfFPRPScQwxiuCUl/T/xachLg+ipr03ppp
	r9zUG7iKpVZPYtNm/9Cgt/lQ2iHBG8GOuRDN1wFy2FfdNBXyWgaVCBHIX13XINnVg8yzJF0TnYY
	4gtKg7Qp2jPes3wbXgO7mv0WQi4gsPGgZ+TzVMVBllw9yCiqn2xQSVWo8fwwpJJJ2s/mgWaato6
	4OI+4Zbgh7zcAJA90dq6OglwyPfvEDIzQU7JmG7wQ60HrIB08vf9fD6UcsdLJzMcjiEIbROUAn5
	BOjkHp96C/OJn0T5dX/TnUY0stvdgNWJeBNexm8x1WvetzVjDHNsiPL5xKgFLTB3HuonZ7vFuMr
	Flb3UdMdgT3+X2e0=
X-Received: by 2002:a05:6102:508a:b0:779:dc0d:2b2d with SMTP id ada2fe7eead31-78a4a917628mr5428192137.8.1788717890752;
        Sun, 06 Sep 2026 11:04:50 -0700 (PDT)
X-Received: by 2002:a05:6102:508a:b0:779:dc0d:2b2d with SMTP id ada2fe7eead31-78a4a917628mr5428166137.8.1788717890088;
        Sun, 06 Sep 2026 11:04:50 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm316638975e9.3.2026.09.06.11.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:04:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] dtc: dt-check-style: Properly detect comments in multi-line properties
Date: Sun,  6 Sep 2026 20:04:39 +0200
Message-ID: <20260906180437.166760-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906180437.166760-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260906180437.166760-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8529; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4+G1DhO8QSZ6NjL/LHRvU/70LWwShyeiFKsRD1+0yK0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnas4/zBxar3lfwITbEVJ/63YdrQTLE0gx9sJp
 oNUY6v2rfuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap2rOAAKCRDBN2bmhouD
 1xznD/9XEpgzf/DwgnAzjCREWSEFa6ad7hICBcG5M9/ACvBIHdoPmc1rhDpnTpa7kdcMGg44nln
 /DMC9ZEhLsGQWP1upFVTQlBdug5FZ3TeeHH+msc7193nDYM+RJMhoyEqGCNOJXqwBt+SGu5LX1+
 n6f0nXUtkrX7W1HcWNoN5FmFuUyrnpsqJW6QvmWR5i53Yffi/nb7sRU+VynQVTWv9dyhZP0LNci
 zto6GrAcDcT1gdzeMM4G65Vh4QclUZSJ/lcJdB0KliBvtXQWp7WFZtC3if+mRjNU8MW3datuA4t
 JoU3Xj1WSTCVwiG0gMVgEc7B0yLhsvoJvgpZlDmv4YKBE7EoHWY9o8JJ5umRWfL5IApQBMz9vDT
 ojQdyHlAgCTq6fadbsAHbEXMndudQepjF0veB+IqRLvnjol4nS2PQZI5MgroEeM8AbmPevKMLxi
 im6/uIM8vUCIjqf5RFvVLmy6OmQhDHmbvXbhwhJj3JRjfWvKgdQJyBxxqKwKuJJ3dgcHbpEz4B2
 xHLkfG61O/CqOz9AXSqiodqiw1w8/fB6jrzLe/QCwTyw/ujbhmuIvS2eUyjyy15I6Sp9HSatJwg
 3pn7F8xV4P10Ak2PGItj+lDiKqo82CI9lcCJ2WDQ8ldSexobu7Gtz0Bj7f8GFGZLM5PyF+tT9D7 IFx2R2+vX7YBvAA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nFUgvqhw73NYU0J3ALBK6fOAR777Fh_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDIwMSBTYWx0ZWRfX2pX7cxJIkdZz
 gPKV7WjMvsxSTJ6Y4E0XT4+VirYS5R/Pydurp+rqhALm66CU1aHBA3HhQFiAPeUbOq644j1765E
 2SkYoODnxsXEklqjhF1bDHn5EWxV5y6qKFPToiah625QSGAyJ7Tqd8nmnraUio1NKfRKVdeqDPG
 ZLSCGVidP0wdABrHV9rNbLW87t/FqZwkWVxf0zObgLTQXZ0l0X5ilwEW9GUjM7M26kpZ6nKRC/O
 6t/3i0h7K6odKPF2Y3DD0tI72dCotv7jLTpIN/iLuin5MBQLAd6YZLlGOvsoYONHR4elPg8iOnc
 OK4amt+XedZ1d7Pkpy2/RER1OOTLOZVZs3fN3xlL8mKyi77Dy+I4Jj9Kn1RjwxKC76GN7NLaFyr
 4fO+kzCsBj6R3asqoLRpfzyGktz1chdiZbXZPGP4Dlg55FcrL08ipIvQ+//tjan9JaaPkJ457x5
 oj7a2Eepxt0VmB0P5hA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDIwMSBTYWx0ZWRfX/AjWyrCny5OJ
 HDYiQ9Us+ubM8H3ae/4l77KBsa7+fIo7IrNZZo4VuD8PIt6tbaKulBUlgSOgV9Ty1FTLjYlkFfj
 X4eJTF0dFXtgbXGzo7pf5Iqlt1tKgZ8=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9dab43 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Y8AG2edEbfE3NdgbFfYA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: nFUgvqhw73NYU0J3ALBK6fOAR777Fh_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060201

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
 scripts/dtc/dt-check-style                    | 19 ++++++++++---------
 .../dt-style-selftest/bad/dts-cont-align.dts  |  1 +
 .../bad/yaml-cont-align.yaml                  |  1 +
 .../expected/dts-cont-align.dts.txt           | 11 ++++++-----
 .../expected/yaml-cont-align.yaml.txt         |  3 ++-
 .../dt-style-selftest/good/dts-cont-align.dts |  1 +
 .../good/yaml-cont-align.yaml                 |  1 +
 7 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index dfa9d3687852..6050b4a70220 100755
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
 
 
 def check_hex_case(ctx):
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

