Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E38D41F7CB
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431388; cv=none; b=saV47d9BsX70akCywAOyYhJluWm0DS6Sc8QEg3bAuf/mF0JuCvsGFkb1MQ7ujUdwLXFvu2+GkaISgW9rHjR0psRtkgYi3Av/qrPPhc2V3OGXl6Y64PwxVrpWsUI7sj1qX+5x2DOtxUYvRkbl/IUgHJVDNniyjfE78r2tJX8UBpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431388; c=relaxed/simple;
	bh=XQKaEmXy+IkQvNCpt68fGOLoSj/EmDQxgixJ3SA/H+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drGAwSYh/GLvFpv+qqRSK9TBi+WUbAQxA8cs0IpVrc1HIl54QBw4Kb6J5uVFwEVPPYxVNPTz79Iah/4bn4DWIn/rw2M+C2ctgCby6qwB0xjmc98kf9xsy+jgt5NNIjeIVa73nLFlRoyZ3kfd9MtUNaQTHueBRcpKBKz+RMAs5tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOUjFhc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxAFv3c+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOUjFhc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxAFv3c+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8p5J3749154
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S1EgtHaaxWnA0b5bvyvYYEoM6PzdfJqkWhdR0zWP3M=; b=eOUjFhc+cvhpNz7d
	D6L/mofikMZrjEJmFzPY355TJ0ora6WLsGjVxHS8UHYJRV7DndX2kRzmoksn004Z
	0i27orBiv6MfpYdkMGfAgBxWnHWwZjX0eYl/4h018bY4WViT8+rjkKcfk7vHJFWP
	dSf+9GHQ2Ke9RMK+E5nIoJ57H7heETruyVZxaKsapAGpjgGqf4sbayaH/9umyRaF
	5EZRykWwdfpYTYp8KyxSHjeDA/RC38M4Oka8tbHSmSZ1DoaSC3h6qf+PQ3ENOT65
	1QFFr/SDLiG+wXiujBv1I7efj1qXCddjzQn7PBgFBNDJhCgYj/VL2pdvFcM7XchG
	5rPRNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj9na6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:36:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso48381701cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431384; x=1784036184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8S1EgtHaaxWnA0b5bvyvYYEoM6PzdfJqkWhdR0zWP3M=;
        b=CxAFv3c+OedGipyOheZB1TKNmepyP+Z3gatjzF54u26n3BaaWaIspFjECBdVwIzAMY
         fKGGPxa29elaudV9RbjeHF3WELrnAqxCPjKghA/XxJq5pS/pUw4ttuEZdVV2d6cYGTW0
         M1YGbYresGbqecnDXJKTnGWswtAjmmuBYbTP6svFQTMnkOPfz6Ph1Lajguxs+e+jebUF
         F8oM4OzZtEtEoo3wiyQ9bUnEoVnaNoSkh+4r5hKfgQuMiVMwmuyZi+H2XLFmHyD6DsKM
         sjNDJWadbeMysnLIPyEmFkU3P9tkWp6k6tztMJH+TQAEkCEdXtih2er5WpOsYY1uorHG
         Dz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431384; x=1784036184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8S1EgtHaaxWnA0b5bvyvYYEoM6PzdfJqkWhdR0zWP3M=;
        b=dWLW9eznB1W4ywQWFEO0UgwxW6gNu2Ys7Zvf4sZ1F29ZwTqoAIrNJiqr0WFUDKDv5k
         SfO6Z2OXkqEMl7apcOe2g8i3WxSq+FZL8s7Wtjksqtcy8J+SEGBoqF8Q/pupYpAQGk8R
         9ES0OZg+tlfc21ww1mWX+E8R2UtOf68vcV+AWofQkV0MpAiBM6SJWMNHF8/FJ4VBUvsn
         /rBV/e85tAHmNw9GPCT+0rNVC/fn/bT43UT7fHOqbbdiA7eyB2vTjejbos7kFX9/c97d
         SU91tQb0GEt4sAWpAYy8H0ffDtONuZnNwebOrSQmopzNIHsqyqhaIUqfOUWSPHNi0q4P
         wm6A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0pYsmlHB+lRPYOu0Bw5QAZvSAoOknRmjqmdTonSg+rhgQ9d6Rrbpw+ZOy6V9olXUTLAGcPjmKAf8e@vger.kernel.org
X-Gm-Message-State: AOJu0YxDtVPS72wm2BFYglFqDMg/GNKvHcSMH9nfcM4T6vIjRwWd2J+5
	GJXlsJNzAv2wjTi8ZyKdQ6+PCP4I4JPUkpas+QGL/Bxj52scus2WZbQjBp/wnkzs3wndrHob4ar
	ybinXJl9EFhD9wO2UxSE3uwL8ColNf3vXNRCO0G+S4M5v2WqX3jjNMTIkr6ghdm+2
X-Gm-Gg: AfdE7cmmVcYegl8/LgiCITBojGcvRJJbXeRoTxXqyn3zma9t4R+p7AZ+88RyPY+76dL
	UgTc0TwqpHSOcDhGDZmsfuPHjKDYEe3zFWXtDiGFQ5wxs+/WU+vo5feqiCxOmgqkAxE/KFh65xd
	BXuiuO8JaQ+DeDI+iR+g8Kjm4XepD0h7n2rgMjjDHYOQgRhgX7bqjxD2Yk9OfKQQBAjq6uWQrOw
	XXihqoUImkbOS5NrKnvT6exbipwXfAIh0kCRQBsR3jn5eIbDB1PEI7A5nrnhnn80Arri6cAW2f6
	aubDutVuvxfthuk3wAxpKRdMWTNFz3Au/DVTrNAftJGtGYf0cK7znW/ziS/qhFyOg2m05PM0GBj
	PSp5kQIeVkVPXuVaSkLfJEs6uFz1RXNtri4E=
X-Received: by 2002:ac8:5806:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c74829b78mr51640071cf.33.1783431381829;
        Tue, 07 Jul 2026 06:36:21 -0700 (PDT)
X-Received: by 2002:ac8:5806:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c74829b78mr51639541cf.33.1783431381212;
        Tue, 07 Jul 2026 06:36:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm34258187f8f.22.2026.07.07.06.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:36:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:36:01 +0200
Subject: [PATCH v2 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dt-bindings-qcom-soc-naming-v2-3-1b7d695be2e1@oss.qualcomm.com>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10555;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XQKaEmXy+IkQvNCpt68fGOLoSj/EmDQxgixJ3SA/H+M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTQDJkPs7S2N7YzThoHU5gWfvzN7jntYz8DT+F
 RaU1hGVoiGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak0AyQAKCRDBN2bmhouD
 1/AuD/4wFiKzwwu+rdd6PQUIuFOlV7kwafJTtWZi2xVPvF9tZ6+xdIY+fbeVFaLvOowjaRs4pmr
 aP3wEKRGahHe1ftanfEteW8wUelMQryFXx10a1K2YayM7FtATwDewntJ1AvKZZRQH//9hzfJSCY
 y2ZaQKLxxd1ZhL0/xzFsfDtCY6JBHT12vOOst0Ml8zoNXxqXa8rbvFn+Tz93C/pHZFr+Cw9fvPv
 91KY9R8AAT6jAZ3dYv3rbUBOhDHnTo84DcTpeyp2urf3sOFEH6eODsSwEMzSn7Yhl3Wv4/2Kmpd
 PnqMKooLZAsUOdIehW9bOaNHIBPQWDi4V9gFhXvxA9e0Hdg8PrD5O7pDniI+34NHR2+9rKRJZ54
 0C4Z/LAxM3Jj4uBidNc/3VI/F2LcCDvK8K5B+HGum8IWC/bt/v7BjROCxZ7gKQTIghcgudxu7Ct
 77uqDYVt74SPsnC1iIuNa42NuJs2y4+WuNN8OgEb6qhh+fgVedZq6v9odo9ODTByaNP4oSW0VmV
 U/lP/4KCElXEovsX+n7XTFh3mfQonPzrBXZDAu6eDeyUFppnpdo9/TckT5GHoQHwYJ8CwTeKNS6
 Ib71bGsu0moOBf099KW/zF3JiHDY/iL121e2jI8fc2PYV3NRbv8foCrYR/eLObcXjaHE7/GNys0
 SsiA9eTnyyegElQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d00d8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lNdm6IUHfFykFOeWzTwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: c6KDlH4EqQaBIHeGcKD7xwakmGX-Uw1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX/ebF50zyC9Hd
 UPvdq4VFw78oA3HebjcZpfquptWnhhLbEQE/sIUE9hAH6MA11jQpezs6xbQVlWpifb8ncVvraa3
 duINxC/uxRG3jMXxUxA9yXlz4ICKlkJNF4QXvgupyFd/H333hSRpWYKZOHz8duMtnKlSti6oYO2
 1iMGg/8N1UJoJukX3aQIxbpknmIXd0BW8xVhEoHTF33BWj+4hzq1jqUwVMK0QEiq873OOIJYUCf
 ASZw8l9tjlveDGabz3Uu2TfTzRBKSGuyGeUKAAQf2ivhPsIbDF0yM+ZNRuS7oC26QMflQ9V9ONC
 HtLe+BAT+VEDoyX2nQdcnerbAKbaZth7Olhgl4KUzOQtbULybXTcK1G55XRILhkI+GnQNeINm0d
 pcUoPQepFNef3k0V+rLk37XKDRoFGc5gSTpZWmojhyZCmtsSHguLpNc9ulEuBTWFSXO5hSNUGN0
 XcDi9EshGaW0VrJ922A==
X-Proofpoint-ORIG-GUID: c6KDlH4EqQaBIHeGcKD7xwakmGX-Uw1C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX72wavPSh9+7w
 dTyy9JgwJPJkO6e79aaUhvM+lJNjIyVpsl6CstWHpDo1WidYE1ddmVWWpTcWl8RUOrnLiS9h2Qg
 9dcXlYjHMbTc+39sgnD79nwXoietNrs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.  Fixing this and applying schema for nodes with fallbacks is
not trivial, because obvious solution like:

  minItems: 1
  items:
    - oneOf:
        - pattern: ...
        - pattern: ...
    - {}
    - {}

is not allowed by dtschema.  The binding should also skip root nodes,
which have SoC-based fallback, but completely random front compatibles.

Solve this all by:
1. Extending the select pattern to match all nodes except root node.
2. Apply schema to all items of "compatible" property, which means it
   will be evaluating also all sorts of generic compatibles like
   "syscon".  List them all and let's hope that fallback list will not
   grow too much, because generic compatible fallbacks are discouraged.

The benefit is that this schema is finally very specific and evaluates
all nodes for desired naming.

Diff is a bit obfuscated, due to indentation change so briefly
explaining:
1. None of the patterns are changed (neither in "Preferred naming style"
   group nor in "Legacy namings").
2. None of the enums with "Legacy namings" and "Legacy compatibles with
   wild-cards" are changed.
3. Add pattern for sound cards.
4. Add enum with qcom,hamoa-crd-ec, because it is used as fallback to
   SoC-codename (Glymur).
5. Add list with all used generic fallbacks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom-soc.yaml          | 190 ++++++++++++++++-----
 1 file changed, 143 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index d934afd59df1..ffdaff073c92 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -22,60 +22,156 @@ description: |
 
 select:
   properties:
+    # Select all nodes which have SoC-based compatibles, but not the root
+    # "/" node, because its front compatibles do not follow any SoC patterns
+    $nodename:
+      pattern: "[^/]"
     compatible:
-      oneOf:
-        - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+      contains:
+        oneOf:
+          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
 properties:
   compatible:
-    oneOf:
-      # Preferred naming style for compatibles of SoC components:
-      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
-      - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
-      - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
+    # SoC specific compatibles can appear alone or be followed by another SoC
+    # specific compatible or generic fallbacks, therefore check for compatible
+    # should use ideally:
+    #
+    #   minItems: 1
+    #   items:
+    #     - oneOf:
+    #         - pattern: ...
+    #         - pattern: ...
+    #     - {}
+    #     - {}
+    #
+    # but that is not allowed by dtschema ("oneOf" cannot be used as an item
+    # for a compatible).  Work around this by defining schema for all items,
+    # but drawback is that we need also to list all known generic fallbacks
+    # like "syscon" etc.
+    minItems: 1
+    maxItems: 4
+    items:
+      # Use anyOf, because soundcards will match few patterns
+      anyOf:
+        # Preferred naming style for compatibles of SoC components:
+        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
+        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
+        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
+        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
+        # SoC codenames used for non-SoC components:
+        - enum:
+            - qcom,hamoa-crd-ec
 
-      # Legacy namings - variations of existing patterns/compatibles are OK,
-      # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        # qcom,apss-wdt with codenames
-      - pattern: "^qcom,apss-wdt-[a-z]+$"
-      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
-      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        # qcom,scm with codenames
-      - pattern: "^qcom,scm-[a-z]+$"
-      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
-      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - enum:
-          - qcom,dsi-ctrl-6g-qcm2290
-          - qcom,gpucc-sdm630
-          - qcom,gpucc-sdm660
-          - qcom,lcc-apq8064
-          - qcom,lcc-ipq8064
-          - qcom,lcc-mdm9615
-          - qcom,lcc-msm8960
-          - qcom,lpass-cpu-apq8016
-          - qcom,usb-hs-ipq4019-phy
-          - qcom,usb-hsic-phy-mdm9615
-          - qcom,usb-hsic-phy-msm8974
-          - qcom,usb-ss-ipq4019-phy
-          - qcom,vqmmc-ipq4019-regulator
+        # Legacy namings - variations of existing patterns/compatibles are OK,
+        # but do not add completely new entries to these:
+        - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          # qcom,apss-wdt with codenames
+        - pattern: "^qcom,apss-wdt-[a-z]+$"
+        - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
+        - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          # qcom,scm with codenames
+        - pattern: "^qcom,scm-[a-z]+$"
+        - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+        - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
 
-      # Legacy compatibles with wild-cards - list cannot grow with new bindings:
-      - enum:
-          - qcom,ipq806x-ahci
-          - qcom,ipq806x-gmac
-          - qcom,ipq806x-nand
-          - qcom,ipq806x-sata-phy
-          - qcom,ipq806x-usb-phy-ss
-          - qcom,ipq806x-usb-phy-hs
+        - enum:
+            - qcom,dsi-ctrl-6g-qcm2290
+            - qcom,gpucc-sdm630
+            - qcom,gpucc-sdm660
+            - qcom,lcc-apq8064
+            - qcom,lcc-ipq8064
+            - qcom,lcc-mdm9615
+            - qcom,lcc-msm8960
+            - qcom,lpass-cpu-apq8016
+            - qcom,usb-hs-ipq4019-phy
+            - qcom,usb-hsic-phy-mdm9615
+            - qcom,usb-hsic-phy-msm8974
+            - qcom,usb-ss-ipq4019-phy
+            - qcom,vqmmc-ipq4019-regulator
+
+        # Legacy compatibles with wild-cards - list cannot grow with new bindings:
+        - enum:
+            - qcom,ipq806x-ahci
+            - qcom,ipq806x-gmac
+            - qcom,ipq806x-nand
+            - qcom,ipq806x-sata-phy
+            - qcom,ipq806x-usb-phy-ss
+            - qcom,ipq806x-usb-phy-hs
+
+        # Schema matches also sound card nodes and its front compatibles can be anything
+        - pattern: "^.*,.*sndcard$"
+
+        # List all used generic fallbacks. The list can grow, but in practice
+        # it is not expected, because specific compatibles are preferred for
+        # fallbacks as well.
+        - enum:
+            - arm,gic-v3
+            - arm,mmu-500
+            - generic-ahci
+            - jedec,ufs-2.0
+            - mmio-sram
+            - qcom,adreno-smmu
+            - qcom,aoss-qmp
+            - qcom,cpr
+            - qcom,cpufreq-epss
+            - qcom,cpufreq-hw
+            - qcom,dcc
+            - qcom,dwc3
+            - qcom,epss-l3
+            - qcom,eud
+            - qcom,glink-smd-rpm
+            - qcom,inline-crypto-engine
+            - qcom,ipcc
+            - qcom,kpss-gcc
+            - qcom,kpss-timer
+            - qcom,kpss-wdt
+            - qcom,mdp5
+            - qcom,mdss-dsi-ctrl
+            - qcom,msm-iommu-v1
+            - qcom,msm-iommu-v2
+            - qcom,msm-timer
+            - qcom,osm-l3
+            - qcom,pcie2-phy
+            - qcom,pdc
+            - qcom,pmic-glink
+            - qcom,qce
+            - qcom,qfprom
+            - qcom,qspi-v1
+            - qcom,qusb2-v2-phy
+            - qcom,rpm-proc
+            - qcom,rpmh-rsc
+            - qcom,rpmcc
+            - qcom,saw2
+            - qcom,scm
+            - qcom,sdhci-msm-v4
+            - qcom,sdhci-msm-v5
+            - qcom,sec-qfprom
+            - qcom,smd-rpm
+            - qcom,smmu-500
+            - qcom,smmu-v2
+            - qcom,snps-dwc3
+            - qcom,ssc-block-bus
+            - qcom,tcsr-mutex
+            - qcom,trng
+            - qcom,tsens-v0_1
+            - qcom,tsens-v1
+            - qcom,tsens-v2
+            - qcom,ufshc
+            - qcom,usb-hs-phy
+            - qcom,usb-hsic-phy
+            - qcom,usb-snps-hs-5nm-phy
+            - qcom,usb-snps-hs-7nm-phy
+            - simple-mfd
+            - snps,dwmac
+            - syscon
 
 additionalProperties: true

-- 
2.53.0

