Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DD234A78F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521660; cv=none; b=FIWO/kE6wNMooZvl7ZQgwn9864ZJvQqBZVqjRz+EoZIo8+MWnSNUpXHX4hJbjPuz1ufDkk/UnxdC5J6eGmfPiAcpsB063Ha4MIOzNzq5H11D/MPfSAJUbWbOHwW0fMNlpsetLYb2BeIYF0DSx0dJbKMFMlYIqZOSKgrg+XPiKXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521660; c=relaxed/simple;
	bh=b+pp/0eMvXfKqo7wq9dHpWibqkFfwTyWma2wdSVnAxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSfwRuDAcG6ci1Jq9iL8nXq0/M/rfXzUas9YrU1yPL4GsdQj6/6AeJYsRb9npWkoVqYYnl3kR/5+jvGf3VMYmDL1U4nsSV4MhtnKyauh0nct2A2+xOolUCMsTKUGHXIuki89ciSm6/18OL8LhLHIR5RsG/3FeV1LQMMwqmy9Wvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lukpCgP8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kz18lpZA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lukpCgP8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kz18lpZA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3D1w2751270
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnPPMZzj3Mrmv2RNnlqkr23EYkv16gUC6haf1k/aIks=; b=lukpCgP8h6w848RP
	xuIbaIhsVeXTjrTRbU0rrOQEldWko58SlhpUg0gMO/cp0dYP+TMDnex0ikb99azn
	0SPoNUEhZ768Emh+wlq1WOe52MEr3i7O6pNGtKcyiXE1XQWFnqUi4e0CxTBZXHoX
	eC/nJUA5CizNp+97+ZYg1LX9nNymmvoSOaaCo9SlO3MpoTAxKvADeWrw9HKdLgBt
	ga1aD9j2D0hCq1iFQ56lvhamhdEu4snMaLmcrs90/pstwM2Cnf5icfA688JK5lny
	8qVPD/p19M9hdyfSzv261LunVKRqRiC8Xk1ZtY10sg+r3NnD3hzvKQ8+nkujVn74
	O5obbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hj778-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:40:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso9782061cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521658; x=1784126458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnPPMZzj3Mrmv2RNnlqkr23EYkv16gUC6haf1k/aIks=;
        b=Kz18lpZA4YWtcZkW943RF1yZr3j+o8djrucWAG+fUSP+hj9YPO+gn4Vfa4lo5NNA+A
         lEKQHQQi8E2sqpXs2t3YKDSSrwXHT9HCd6SdooLMjebwqBf8vyQzuE/1YbUo1bZGegdp
         9T6I2lDymuzf8rCbS+NyvrytcmacqHvQK0sxGJD0/C5bsV14scgCnWrgfxlbpBX8x+LI
         TMpmyZUzXmP3FLhM49wRshHvE7E+gKdEBVyGky2w/QLiQzCqaPaiA+0dhD1jac+6XOOO
         Pt8m0Ta7fo8AvodBAd1BiWblR39zuZu8i4h4mcdhTYqvlU/B4/OKCdVkqI7sN3nqW+iU
         scuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521658; x=1784126458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnPPMZzj3Mrmv2RNnlqkr23EYkv16gUC6haf1k/aIks=;
        b=RHXGqwd3TRlReOs9NRvhvx93DB6SGSg89HmySM09wd7jMvZJaIyBI+hLHjph7fYlCR
         FWzL8KnXdgUJwbQpGWybhVywebBqjxvRHvxaYD9YyDSukwpSu4WwKqI6VmZG/ssZpwxs
         RntNf2KNvvi8SOoHPUo8mPYdlStbdzuO4EIK1xJQDx/EcOk+/v1CwP8HsxaiOSmsUbdE
         1Ct2b68UHTDhI4z902VVgjj8+qI46RJXApdki3Uckvg3u7D9B2YHkXYUOetx55BQKqcb
         Jkt47m2T8Tjm8e/ugC98AdWFpTEeYiDnDpVXzuJhovnmaF0O6kdqTL2VGfVCOGcfmb+Q
         6LvQ==
X-Gm-Message-State: AOJu0YwHa74R420doeJSWekuObJraLKhiwW/pjfzAbxY/6C9yUQrqPP/
	AGow11WqrflKlktv52d8t44WEApVX5pKrNneVTTJkyESpcvYCuYYjZlAmTfLuMM9z4Dm3YJbxji
	MH8RMj940aeDogEgf+O3k5OXss8i4DD0n31COqUE9owDGBYfgUXGfEsiIrZw/H1Jh
X-Gm-Gg: AfdE7ckvGoDDceXRMHlwTnERpaotJ12L258dWrxe8nexECD5/Izw5gwoIwRWJ+NN/hn
	rlI5wGRGYg4gI+7KLvzFMQFeTSEHI3txiYimBKbWo10MW2oMFtTWmceKIpjcTZHcIeqZstUbKRQ
	bBo8En3mHcdojSo5MkzuphbjvIURtHpsFdmI27b7hNTR9JQsofSr18/c0ciXgGXYM3MCrzCLDFR
	apaXLfMtW3g+LPuemrgtq+2UWYAIWRi0NjPYzPaxn6ypEdpImFBySFgGR9poIDNuFuOPaAbhWRI
	y5DsRHyJKa1NoqZQRghOz1JmgJY8dGdxFZD9RxmcJ94rETXWJc8lW/NSMYK5L3lqSwxyNZww8Xk
	SvHevnR1p9v4cgPdMDvIDWWJ+DAqgP1bxXnY=
X-Received: by 2002:a05:622a:15cc:b0:51c:7b12:5fe7 with SMTP id d75a77b69052e-51c8b42875emr28942611cf.83.1783521657712;
        Wed, 08 Jul 2026 07:40:57 -0700 (PDT)
X-Received: by 2002:a05:622a:15cc:b0:51c:7b12:5fe7 with SMTP id d75a77b69052e-51c8b42875emr28942101cf.83.1783521657238;
        Wed, 08 Jul 2026 07:40:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15da821c58sm52543766b.48.2026.07.08.07.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:40:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:40:33 +0200
Subject: [PATCH v4 3/7] dtc: dt-check-style: Rework handling YAML/DTS in
 rules
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-style-checker-v4-3-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
In-Reply-To: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3892;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=b+pp/0eMvXfKqo7wq9dHpWibqkFfwTyWma2wdSVnAxU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTmFppAlyyirSPtnnclYvhKQAS3wbKaDHmUF7X
 UqN2tDfkpOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak5haQAKCRDBN2bmhouD
 11bGD/0bBHROobuiKuII92sQCYE7o2gOdN5s6p7mWjJQVhtm2sgR06E7BbgFfIkyLCnA6Y2Mp5i
 uolW5ikkYn7vDvM2CgKun2iS6DMY4/G3EiWjjQyP1w5XR+mmZ5daFmpQyDo/909rHUJnzVH7OCK
 x8quikCrvyj/gGWU6nKY8ksi6+mp5NsKFdx6Y2IKZjoMkAgpP6kqeqBy2dJF8WGtYmL82SYeI7Y
 zApy3NFNPK/emE3HfrCxj7pW4RQ2tIkzJlLCViuCKnnaEiKl3G5Zf6UpDYqrM8JB2xt54gOCysQ
 ZLsmmut77bgXRMhauKaTdPNqtHdVkibIhVYvl04slNKQD8mEYfLox0eZhzlUOR/nOzN/ANJ8IFD
 Dtc0+wnRZdfauBPQmOJdXTihYF3HdSZumdSFe2ec65JNVBQLnpOkgzVoSiLsCYE4o8KuUGAC5/U
 1t/VAuXsFU4nfY2IUNqfEN6gZcJkg7aD2lnski27T9OpmEQfNJ5x4lLuJoaKB+TyA8vcfpSAqa3
 oLwQgp7tDYrOMAj3/RoS75TDY3F8zCtDJ4U98SA/uR8mWtjYgO0IhIHnXM3iWk31ErwfyZ3ZlHk
 NNaQ07wP7X0XtqOMYKcg7HAeLRzMw51vUuWqUzwC/P+uJbhxIhS+ok6LkSzg8g10QAOY9C1Uu5c
 7nW7Znc1XbCbemQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX4NZrf3AvaDJc
 ckkP2/jnKlQkwlnFi5jABh+zlFae2rtryxrLWflHxF+31A22ZctEwkkC5ATL9N51tjHAAo5Tcab
 77TbDZyr2eJ2iwMgQ2oYQsttwGQ5/dxa1mRTNkv4x17EhivULE34xqHL0i+kna1qT891XxRr9WZ
 6sAwdEajSfYSc5Bq8F3GnoLPAtoq2Waa2JTDHa3gR5PeDspHrKzRmd4lhKTQmed1mZ/L1T+nW0b
 3ZSh1k3TPUNllEplK76oFIxBuUITYdgwzmliRGHh6ZFFwyVgaQ4cXc17N46aMZ9vVD7RnM/2nBU
 avpGEeHArexingoarqOv3F6tCEPDp7uZK6/0cMGTf5Ajd2P7/W2o29Rl48j6r7DSk31aTA2sykL
 IrWN6Pwi6xMU/VYUbQA9achnb1QopRWhrCsLnItc1CiOVvRm0+QJLAU0QjJzYVIiRBwm0h4niKx
 tz3PODa1tFFZn7wOG5g==
X-Proofpoint-GUID: oeLnLU75J2GIbONFhl6HuX0MvxOATXdH
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e617a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZK4BJI6VOU2p3dBXLA4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX71eqg0Vt09s8
 qcMW35cELkK+YK7k1ZYmVYITiHuI5ilYi2Qs41gzXHW2ynKWdsfpa0bEOy/C21fpzrPzMlW+6Zv
 EQX8cnh8n1vbibmsKn/WyzIu05hd7cM=
X-Proofpoint-ORIG-GUID: oeLnLU75J2GIbONFhl6HuX0MvxOATXdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080144

Individual rules behave differently depending whether they handle
bindings (YAML) or DTS, but the code was focusing on type of indentation
(spaces vs tabs).  That indentation is actually irrelevant in some
rules, so differentiate based on file type.  This will be more relevant
in the future when more rules act differently on DTS, than on bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
New patch
---
 scripts/dtc/dt-check-style | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 5d7765f35ecb..bb9ec5b82319 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -311,13 +311,16 @@ def collect_labels_and_refs(text):
 
 class Ctx:
     """Context passed to each rule check. Carries the parsed lines,
-    raw text, mode, and indent kind."""
+    raw text, mode and kind."""
 
-    def __init__(self, lines, text, mode, indent_kind):
+    def __init__(self, lines, text, mode, kind):
         self.lines = lines
         self.text = text
         self.mode = mode               # 'relaxed' or 'strict'
-        self.indent_kind = indent_kind  # 'spaces' or 'tab'
+        if kind in DTS_FAMILY:
+            self.file_type = 'dts'
+        else:
+            self.file_type = 'yaml'
 
 
 class Rule:
@@ -347,7 +350,7 @@ def check_tab_in_yaml_example(ctx):
     a #define value are tolerated (those are CPP macros, not DTS).
     For .dts files, this rule does not apply -- tabs are required.
     """
-    if ctx.indent_kind != 'spaces':
+    if ctx.file_type != 'yaml':
         return
     for dl in ctx.lines:
         if dl.linetype == LineType.PREPROCESSOR:
@@ -420,7 +423,7 @@ def check_indent_unit_strict(ctx):
     unit = detect_indent_unit(ctx)
     if unit is None:
         return
-    if ctx.indent_kind == 'spaces':
+    if ctx.file_type == 'yaml':
         if unit != '    ':
             yield (1, 'indent unit must be 4 spaces in strict mode, '
                    'got %r' % unit)
@@ -431,7 +434,7 @@ def check_indent_consistent(ctx):
     unit = detect_indent_unit(ctx)
     if unit is None:
         return
-    if ctx.indent_kind == 'spaces':
+    if ctx.file_type == 'yaml':
         if unit not in ('  ', '    '):
             return  # let check_indent_unit_* report this
     else:
@@ -1016,11 +1019,11 @@ def select_rules(mode, input_kind):
 # Block runner
 # ---------------------------------------------------------------------------
 
-def check_block(text, mode, indent_kind, input_type):
+def check_block(text, mode, input_type):
     """Run all selected rules on a single block of DTS text. Returns a
     list of (lineno, rule_name, message) tuples."""
     lines = classify_lines(text)
-    ctx = Ctx(lines, text, mode, indent_kind)
+    ctx = Ctx(lines, text, mode, input_type)
     rules = select_rules(mode, input_type)
     findings = []
     for r in rules:
@@ -1100,17 +1103,15 @@ def collect_findings(filepath, mode):
     formatted output strings; count is the number of findings."""
     kind = input_kind(filepath)
     if kind == 'yaml':
-        indent_kind = 'spaces'
         iterator = iter_yaml_examples(filepath)
     elif kind in DTS_FAMILY:
-        indent_kind = 'tab'
         iterator = iter_dts_file(filepath)
     else:
         return (['%s: unknown file type, skipping' % filepath], 0)
 
     out = []
     for text, base, idx in iterator:
-        for lineno, rule, msg in check_block(text, mode, indent_kind, kind):
+        for lineno, rule, msg in check_block(text, mode, kind):
             abs_line = base + lineno - 1
             ex_tag = '' if idx is None else ' example %d' % idx
             out.append('%s:%d:%s [%s] %s' %

-- 
2.53.0

