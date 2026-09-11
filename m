Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A4443C10
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126936; cv=none; b=Jtv9pyjAN+bldFSim8n+4FjmuWSgcC9Fwz2Kb0xv+B+ZNUfcyZscD4xO0KBQXT3d4E9KeIttiYT4Gy+DGFBWUN0zMxR6lUg3hHJfTUck7ACvwWBiLJx7PpWqYkMyVpOBVcue2GlXuQtfg0zbLRep4JV0r9VzP4NUW3yX74lHy9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126936; c=relaxed/simple;
	bh=Z07GnkEfsi380PaBy8bZduaiZTozLmF+zbq/oPkVt0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QwmCE/+1cBTwzWITBI1E7Z7tMOeGx4HFGKBDKzFZI41y9UgLPjJt6oaC6JNtj3WmPO0Nr4Vn5NSnV5NKf11l8+sLg1SupB0I+S8rRy77WS61e7SPxhzymuHuY6sZ5KfDkYxCE4Go0+8cwInyLOEHmPFg8NmJjBQBpUI00BQKbWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rju3Un6S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9hsihkw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rju3Un6S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9hsihkw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqCCI074231
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxI+tl4H24V+yhavMJPe1WNYN4AKeLTqZm4w5MZpoXE=; b=Rju3Un6SNUA/xyBo
	zaFw5c/xeF1cKBs5LmMlFsWuD9qoQs1aUvV1NP4Qb4SaZlq6YD4jMIrnc8zEE3Iw
	KWoP5R1udxNR8C+UITq0r2hzM1pPXqxca2hlE+rNy34rSOepTKhO/XgJDMuBZngM
	GpJDLQ1CYr+f9/chvp8MAmpJ0J6z1Z7Hej5KZaoQhPnQQ1ihLFeupGkYGet5qkSI
	BkTTz3NnH5u5AkkhO7+iW63/zVKbdKD2a1bUidHr2eTUI0lBJI5u47ZBR6LkEnzI
	CecYZuTC0Lbb7r4M+YMfbl2hcP6Jduba70KKSwQCc1Lzru6Gk3NpdHpPZR9u12PR
	GT9fSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q42qs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:42:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9394ad7f64aso114955485a.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789126932; x=1789731732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxI+tl4H24V+yhavMJPe1WNYN4AKeLTqZm4w5MZpoXE=;
        b=X9hsihkwH8jYM5KEcwLUBC1FbtE2QbEXOqUESTSVas0v4Irmi5Sdqsn9uWdhOYvn81
         KzlzFNSLyu2nCY3PleUjKi4O/xfrwqT+XpOptMes3RUbtsd3agEQHmbBL96AqBMpgh+3
         vBk7AfaRQJ1yH2jcvWWieKFvPyw58gU/WiXY0yhzq9G3Lbsnix/O6dWfTd5C0efvyi7K
         tMrJWROf5dFwt8VYBnsuzEmC03MJ6UxztI7zLvsZUnVOe4JEBK9Wd/a8CYLU7JPuEKAx
         z15bYSBrc+o1xHSnNBAgbXfLBW9Adu1tTfOWikiQKOK4b1OnLoJtBY9lfv7DBuI3hYJZ
         6amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126932; x=1789731732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxI+tl4H24V+yhavMJPe1WNYN4AKeLTqZm4w5MZpoXE=;
        b=OkVrQA8CKg13RYvyS7jgWQk3FbySqXXoUBKyeWFjev6CdkSIDJBto2qSkSIGND1mSC
         vRQflMR1kz305SRzPBa1ApjqbL498l63w6IW0oUX68c+0yHVfeREJPdwwpZ6KBfUSVK0
         NsVJCb4ovgMRIYMlOpHEKjREO1kOW1NRVVy2AoOYrQ+yz5yx1DDTIYgQx/sxpiORRLj6
         Mx4pB3qUHdn+nilEIVMk2tEEx3PJuS6hhdTFW4TK3m9efxRAfZdb0ciUmCAzVfEphOtY
         FsOHxwDO2SqopLAX4FCf2W/QT7bOx/mID/7OiNbAPw75m3Au2pAwj0bdYpjhOvgv2p0q
         hu5Q==
X-Gm-Message-State: AFuF++k6G8bT6Vus3O8DZ/BrtTJxFOWpKdVg5ijVX1kelOf8/qGGkOHB
	s2zFPGblGVLH3mIq+HADB/yubc8vHbJQpzc8ZSnlxu/pARvApW0fkCWPEle2kYEUSRPSL/11x1+
	xOj1w6llJFherNdv3Zr0C8Z54bDj2IEoMcqAghvcbVLulIjrtdUeuAL7njH/54LA1aaTjz9x8
X-Gm-Gg: AYBFou1a66fuDZVeA7aROJA5VlGwMSgGEED+riWyMQKuU746JbaF9XKrtlxz69mHuGJ
	ECTN9fsFftvCH+cRh9UY4W148Ey8+atzOYuoirihy2jsw7X/u72Prmpp8H2ts5brzLuguLPDWqp
	GNRW6IsSZ1/MrMmPZ7A++cAqPKOBaGs9sYIHDBlJYSE8ey3c9t/90CwebNdhfjor8dPanuqU7nr
	m098tP3RtQ72hXRNd6IWCy4xDhIfCT5WdBVRCztyxViKrlV8fM8bU1r1zFpPcigyOVLr7sshbZb
	XLriILj1PpIU1/K4xVvT4F+oZJui/oXoFEBGnYI0jFL9Ro7MldcZ1GRCle2bhw7AfpcQNEOBx+f
	YZ7o0hWIiWkZFphdoekAFYL4=
X-Received: by 2002:a05:620a:27d0:b0:939:6de6:9518 with SMTP id af79cd13be357-939ea2c0e49mr518327785a.47.1789126931759;
        Fri, 11 Sep 2026 04:42:11 -0700 (PDT)
X-Received: by 2002:a05:620a:27d0:b0:939:6de6:9518 with SMTP id af79cd13be357-939ea2c0e49mr518321185a.47.1789126931280;
        Fri, 11 Sep 2026 04:42:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm5501948f8f.31.2026.09.11.04.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:42:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 13:42:04 +0200
Subject: [PATCH 1/2] dtc: dt-check-style: Re-work classifying property
 continuations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-dts-style-checker-blank-lines-v1-1-85e779600d98@oss.qualcomm.com>
References: <20260911-dts-style-checker-blank-lines-v1-0-85e779600d98@oss.qualcomm.com>
In-Reply-To: <20260911-dts-style-checker-blank-lines-v1-0-85e779600d98@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7323;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z07GnkEfsi380PaBy8bZduaiZTozLmF+zbq/oPkVt0U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo+kOqEx7eppwiUgjfzv7VQMkiSnJ887rndPVs
 ZLrz11MkeaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPpDgAKCRDBN2bmhouD
 16WjD/wJeS8YpghHLavZ47Gq9mlOjb2/SjNkdGLTBo1DsCL17OkyMV576vieF5mnCaiy9Wz0XkC
 fHDBxuj1oO6j6caP8U8hv/dTtTAN8Xv3Z+DT1lluYD+EytQtqRzH0K1taP6tnLT+C5fj+eBGyVa
 B01qxbAYOZ5IZ6inddoAOh1mIB9fZ8JuCb5I/fRdCIT3DGndMK637CzLDABaTYKdv7OWzwCSBlt
 k8uNJmWSafcWMMFZ+GpmhH0g6Zot/4cU8WF6kawJJRfvvN3ZW0tBDwVlxCkb4wCUoC35IQqxwOU
 qCz2BUnK7PqMffCWgNazdmofInxlsISt1ckVXxWu4IJ1jp9gkz8QC92MFFGOXswt12m00wsC7q0
 lRTbUYKl6XO7+fJwjUwv0hQ1y9S/18jdywQiEFFXUPrMnHS4nvUZcc5BAR/IEp5fo7OS8xW9vQn
 CU87VedTyHLJbrFHsMi7bR+XUWWWwf6LGvbFxhz+mZ9kysN8xEiCXKonAto29j+KvlEaUZ3/DQk
 b1mRt29bsRave6ycWv0e4xhHopdGmZokAZlt+wfMs3nRQxU3W3u0pm5GtSU6BJxdRB2Wcfrcm1A
 +MJDA+78RAi083x+YNU58n4+JWSBEHMBKLMC6AuEactbwDgZ9UGnS/vPNgVcs+EKtayXgXeWrOn
 Iah4AqZDzmkCP0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ZqnQPRM-CjQRzLZjfuwWbVmIZ0rYCdDj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE2NCBTYWx0ZWRfX/u6S9rRe4rPn
 RQrZaap1hryRIYE/wVmhacKhkjuvpoNK9gfELWtWn8BpJsA78SuoHoPXxUVuUL/HbI6+mevEBqa
 5t4VLFDwU0MgPAqJtiFYdejlK+aDrOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE2NCBTYWx0ZWRfX6txtpOFVFglC
 xzNMt+wfd7SyiRK7Dw8OFf/lUxGSncCCosHN5P49RFunhTTtfUp+SJ7DF0cH0HkAvsfBrjXy6F2
 TmLNUDmqqvigZbIEsTictFtolJzQs5mwj/NPkNziy661VCx9yH8KLWCADHpmM8t1RmvMbI9+7TC
 +6WxDstcTI7vZHKJrm2lKQWgbsF6EIDyEWBneIHoC8JfZwdTVrfxZF+yqlmbB68F4Jp4yhcEH/E
 hGw5NKITaM7hXiRZzN27gEcVpnvrAy5QrCLqCcptirv2B0lQd1/mgCq34xDQ0/iU1IXnwqhD/TV
 +IFyPEw25MXHwvz4mYqYPS7TTcDqxRBo4CoFVXCS3ORM9fltNK7uwKthDYEOBc/dOECqk7V+2fY
 YME0fZBFNhQZ4ZFz9fPqU4/zuFL7cNm4NsrSrVAyyTzspEYfOK2t33iyWVGSpZIXkxXXdRnibp2
 aS67OLWwGaKDN7aEUQA==
X-Proofpoint-ORIG-GUID: ZqnQPRM-CjQRzLZjfuwWbVmIZ0rYCdDj
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3e914 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eHNqD1d492Np1W33avEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110164

Script has an enumeration of DTS Line types (LineType) and one type is a
continuation of multi-line property.  This has limitations, because it
basically hides true type of a continued line which makes certain checks
difficult.  For example detecting consecutive blank lines
(LineType.BLANK) will fail if the type is continuation.

    clock-names = "foo",

                  /* Comment */
                  "bar";

Above code not only fails check_blank_lines() rule, but also messes up
how DtsLine array is constructed - the two middle continued lines are
not put under the DtsLine.continuations array.

The concepts of type of line (blank, preprocessor, property etc) and
actual continuation are orthogonal to most of the checks - the checks
need to know what sort of continued line it is.  Fixing this solves
false positives of continued properties with blank lines and comments:

  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi:135: [blank-lines] consecutive blank lines
  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi:135: [blank-lines] blank line at end of node body

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 99b22364d866..0dca31a0dddb 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -44,7 +44,6 @@ class LineType(Enum):
     NODE_OPEN = auto()       # something { (with optional label/name/addr)
     NODE_CLOSE = auto()      # };
     PROPERTY = auto()        # name = value; or name;
-    CONTINUATION = auto()    # continuation of a multi-line property
 
 
 re_cpp_directive = re.compile(
@@ -80,11 +79,12 @@ def is_preprocessor(stripped):
 
 class DtsLine:
     __slots__ = ('lineno', 'raw', 'code', 'linetype', 'indent_str', 'stripped', 'is_root',
-                 'prop_name', 'continuations',
+                 'prop_name', 'continuation', 'continuations',
                  'node_name', 'node_addr', 'label', 'ref_name', 'parent', 'depth',
                  'closures')
 
-    def __init__(self, lineno, raw, linetype, depth, indent_str, stripped, is_root = False):
+    def __init__(self, lineno, raw, linetype, depth, indent_str, stripped,
+                 continuation = False, is_root = False):
         self.lineno = lineno      # 1-based within the block
         self.raw = raw            # Entire raw line
         self.linetype = linetype
@@ -95,6 +95,7 @@ class DtsLine:
         self.code = _strip_strings_and_comments(stripped).rstrip()
         self.is_root = is_root
         self.prop_name = None
+        self.continuation = continuation    # Continuation of a multi-line property
         self.continuations = []
         self.node_name = None
         self.node_addr = None
@@ -175,7 +176,7 @@ def classify_lines(text):
             continue
 
         if not stripped:
-            dl = DtsLine(i, raw, LineType.BLANK, depth, '', '')
+            dl = DtsLine(i, raw, LineType.BLANK, depth, '', '', continuation=not prev_complete)
             out.append(dl)
             continue
 
@@ -184,7 +185,7 @@ def classify_lines(text):
                      else LineType.COMMENT_BODY)
             if ltype == LineType.COMMENT_END:
                 in_block_comment = False
-            dl = DtsLine(i, raw, ltype, depth, indent_str, stripped)
+            dl = DtsLine(i, raw, ltype, depth, indent_str, stripped, continuation=not prev_complete)
             out.append(dl)
             continue
 
@@ -202,20 +203,12 @@ def classify_lines(text):
         if opens_block:
             in_block_comment = True
 
-        if not prev_complete:
-            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, code)
-            out.append(dl)
-            prev_complete = (code.endswith(';') or
-                             code.endswith('{') or
-                             code.endswith('};'))
-            continue
-
         # Pure-comment line: nothing left after stripping. Classify as
         # COMMENT_START (carries to next line) or COMMENT, and skip the
         # structural classification entirely.
         if not code:
             ltype = LineType.COMMENT_START if opens_block else LineType.COMMENT
-            dl = DtsLine(i, raw, ltype, depth, indent_str, stripped)
+            dl = DtsLine(i, raw, ltype, depth, indent_str, stripped, continuation=not prev_complete)
             out.append(dl)
             continue
 
@@ -245,7 +238,8 @@ def classify_lines(text):
             continue
 
         # Property (or first line of a multi-line property).
-        dl = DtsLine(i, raw, LineType.PROPERTY, depth, indent_str, code)
+        dl = DtsLine(i, raw, LineType.PROPERTY, depth, indent_str, code,
+                     continuation=not prev_complete)
         parse_property_name(dl)
         out.append(dl)
         prev_complete = code.endswith(';')
@@ -254,7 +248,7 @@ def classify_lines(text):
     last_prop = None
     grouped = []
     for dl in out:
-        if dl.linetype == LineType.CONTINUATION and last_prop is not None:
+        if dl.continuation and last_prop is not None:
             last_prop.continuations.append(dl)
             continue
         if dl.linetype == LineType.PROPERTY:
@@ -535,6 +529,8 @@ def check_continuation_alignment(ctx):
         dl_value_complete = rest.endswith('",') or rest.endswith('>,')
         target_col = _display_col(_strip_strings_and_comments(dl.raw[:eq + 1 + m.start(1)]))
         for cont in dl.continuations:
+            if cont.linetype == LineType.BLANK:
+                continue
             target_offset = 0
             err_msg_explanation = 'to < or "'
             if not dl_value_complete:
@@ -582,10 +578,10 @@ def check_indent_consistent(ctx):
             return
 
     for dl in ctx.lines:
+        if dl.continuation:
+            continue   # continuations align to <, not to indent unit
         if dl.linetype in (LineType.BLANK, LineType.PREPROCESSOR):
             continue
-        if dl.linetype == LineType.CONTINUATION:
-            continue   # continuations align to <, not to indent unit
         if dl.linetype in (LineType.COMMENT_BODY, LineType.COMMENT_END):
             continue
         if not dl.indent_str:
@@ -899,6 +895,8 @@ def check_required_blank_lines(ctx):
             if d.linetype == LineType.NODE_CLOSE and \
                     d.depth == body_depth - 1 and depth_inside == 0:
                 break
+            if d.continuation:
+                continue
             # Track depth inside nested children so we only look at
             # immediate-body items.
             if d.linetype == LineType.NODE_OPEN and \
@@ -918,8 +916,6 @@ def check_required_blank_lines(ctx):
                               LineType.COMMENT_BODY, LineType.COMMENT_END,
                               LineType.PREPROCESSOR):
                 continue
-            if d.linetype == LineType.CONTINUATION:
-                continue
 
             needs_blank = False
             if d.linetype == LineType.NODE_OPEN:

-- 
2.53.0

