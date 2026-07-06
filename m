Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2288435E1B1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333487; cv=none; b=uguxtUrKc3mIruCVgqITDVUvUMfXmi0rl7narnS0RPvIyXzsOgl1wkKc/Z77KK40Kju4o4H1toR+INd2bLwxGPe0TndVP5P0KQCI0QoHxvxvOtFlioWvjuDzbSC2Q+b7iI+YdGAvKTJlyK7vXkbk/MmxI8WI3N1XTQhJ+3lqFmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333487; c=relaxed/simple;
	bh=Jt1iJCFPg+W1g0oYFopl3MkDK3h9X3jsj/0ljcybJ9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKqNiPJFEbQJXTb9wqgvV+BQAmhqZrsVx51HKndZr3nc3yB25ABY7U92k9mdC1xKFRPYJM80HEu0rfbU42mzn0Zf6UrS2IMjmOZUY1F/0AplHVtbLwQyCmQDsUCZDXk+poFkqbL7AkMb124yBnQageny0jQn8Xe59W37Q0V44zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5OCN/x4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JzBETS3U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5OCN/x4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JzBETS3U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669GxKZ160091
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8NuAE41Ifw0
	zjCPxifmrDef+3djlGdSfazAu7UYn41U=; b=Z5OCN/x4bC3wCq5ki9PQYHCWy2W
	oKsdcOTMYY/nJ04dF9I7Fl92As3RanosLkjB8I7goqE7q5KuD2SXjYNYG7749vj1
	Htwip1K9z7CDBClquHKFfgdfJG0pJDEGM5gsNqfT1i6M7dr9fBVN6TzbwXxBUrAt
	rQRiQn5+InpYrmRmskYPEOvtyAu5rMKV1b00MW2/pmedNJnml4DMunkAbQ7VvpVA
	IA5Gm+6osinCRcb+RZVSbq0swv6saaviaHgwSVBS3XMz/DsBLsooFR8ba9zrIld5
	mAcN/STMLKaPFx+bTjdX91Mns3fMvwQlKFYDov/vxrn/5O33uaL7Ins4pig==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr8sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:24:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eac2620cb0so38832946d6.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333484; x=1783938284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NuAE41Ifw0zjCPxifmrDef+3djlGdSfazAu7UYn41U=;
        b=JzBETS3UuvAwWfJjIozx9dKlJK+X7YjlMtmeKn+5V8rV/oqTEPiU2GDBf/6N/sjNJt
         MoXW5ncyFJAExa3zBXs2gWRfkS1aDTJxb/Cg1XRA+Dhq9AscciB89qcarCOBXi9c5nLs
         Mix6Qj1o0VtoOj8nQhIApWDRJ1DP+gcR9+nxDcjRA9JZFsad8Y5zlIRty96HxqvKP2ZH
         WZ4dENrmJC2skzpG1xhkZXxHCr2we8GhKFyETK/ZK9ibmqbZ4hN9ESmmga3qTEK7QtZf
         pk6x0N6q2z7SSOJ9+xAuxffcE/mnTiCeitY3C2XOWhtsOGJkY3PmTuYlcGjNp4gz0Vua
         Xb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333484; x=1783938284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8NuAE41Ifw0zjCPxifmrDef+3djlGdSfazAu7UYn41U=;
        b=n3z9hvu5tJwYWIc98RcIHpybmW6mUKfQc2t9MXyefA/UZ4w3M57mPyMwGCOSt0y90P
         SQvFZ0JaAiViHUFxtd3cwE9ZPaiYtJpVok6/Sfl/YV0ZeC7vgW92G6GPYFkKt8lf5iVb
         H6N6CgTakxG98VBDdquypkM+8WOiOCvpVsxGptnC+tqVpI6mRh7vEpJgv5RiHcKT9oy6
         mkkioLCKS5cOpkShYQx4yGo7LtJf07Z3hLYBhnZFw68rYkxZuYmQ591/mFJz7Wj7Zm+g
         sltc4PHbo+DBvkbq4aOk1G0qoGrJ6eXPlp10Ld5BAX/cXfoNkGjgs65rlOvTl9mbmDlh
         vUgA==
X-Forwarded-Encrypted: i=1; AHgh+RpPD6Wt1gWpZVP0PzGl848l6aBoggiXgkmCh6Ou75fn4BEZXpX/OaYzh50QJFRdN/A+Rx03ktUHZwQS@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6MQvItry5c0RRrnTN2v6kJ+V+Lsm9x37cVAydpbVa3ITTsQG
	9pAtGglSNCvdcSCh4GInDepA7yf8XEMROdUteOlsZiat3lxaV5Hln5zedOziTaGZLzrBvDFb1Uq
	ccIBIAE6aMXXBjtIe0AF6APqdx8UyD03zGD+t73wIMabK/JOLfdoHcclMPt8LLFr3
X-Gm-Gg: AfdE7cm+76jIcl0GP0ETRwliT5CJ+yCQumixCLmZVd6zhEe2UodlSDgcGIhurEjlgmf
	dop7Jh07nyV8dfjrE1vC2rfsKLgEKnMdqaCGlLWnRmKvObQTTHD7GEn7oQmpTdqkYPAYM4jYi9L
	+6TFCazFpdFzcjH1aSZgbHqNUIfUJz69pIyK3zOaj97U4NKYerFA5mACcJa3PjSqZ4EOxK8M9p6
	6pEzBQ9V+Piu3eV4t+D44oMat/a4C/JUsAOO8ktK03/e/CwQJdCXj7K0gavTBmqeMXvbqYGxBSv
	r9cG3HmjsheLT5G/WSJqCVmbkJmkylAah4FHBY9jRQ2AE/Nf69jsLDRU6uaG+hIA8gPWw8LlK3B
	X0DEad10UchzCK0O1foQpARPgypk=
X-Received: by 2002:a05:620a:7008:b0:92b:6805:919b with SMTP id af79cd13be357-92e9a51f051mr1380454785a.67.1783333484323;
        Mon, 06 Jul 2026 03:24:44 -0700 (PDT)
X-Received: by 2002:a05:620a:7008:b0:92b:6805:919b with SMTP id af79cd13be357-92e9a51f051mr1380452585a.67.1783333483815;
        Mon, 06 Jul 2026 03:24:43 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm25593106f8f.1.2026.07.06.03.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:24:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] dtc: dt-check-style: Allow space-aligning indentation in DTS
Date: Mon,  6 Jul 2026 12:24:23 +0200
Message-ID: <20260706102421.343639-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706102421.343639-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706102421.343639-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2843; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Jt1iJCFPg+W1g0oYFopl3MkDK3h9X3jsj/0ljcybJ9M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4JWtaRn7Wi8AcAaEUYWLxe2BnGGF+yiI7j2g
 SKW7atZsf2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuCVgAKCRDBN2bmhouD
 1z+pD/45L98+Er2G6WN+watSADaY0BYh65vzv7okf2KEJzkYOMavGPEHrcX0xeDReNpLW6rYQYO
 l520MLtoumg/3Ax95Cr7mkmXiBOqWpDW3T2+Ds9VFvcheHXtguvbR9S1q3hNobZIw8lhZUv+7HO
 OEH81R19dLE2HQBrewRJa/t0/2DlWlnr71eyDA4/aKZm7TirfDq70xXkB7tvz6mV+1WQ8FnL6Z0
 TRqI2yJyzf+XrETIdPSvBjONGMZDSosUSojzkSXNM4Kg3zzmJGNB34YBa/Pv3TLxnsy2uAeGdg/
 8COnS4gja7nrAEEzU/xPWt1ZaPOqmmuZFy8WQuJbi7UFfmyw6ZXpDwauQ+oYB6RpqOvSXtkN9lM
 /L7F5/P0HzFS6dkEVVLskLNR+NKoGA5Lf5w5chaoAL10l5i1tCUuy0El9DnC+IHC8uryLBFuOkZ
 LG23/fctH/Iz1OQB9aXMrnCaD7VuWfEvYVEo7FMz25svSVeQ4VCT72I24JVA67h8Ff2RCQ8Bu2g
 PfriFKf/xn5CBhRIxTKMs7QY/loe5zVlm99JsoE11MstDSb932UVS2mIrMj1pa1M92AEA9JiT5Z
 Zn3VCVJZOC3i2X+hemTYK7xlL+bNj/iuKjH4klgnb94ziP1nqTWDXTedS+mDup2Ni/YZc4EPgjx IXIthQGx9WQ/IDg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t51sGuA9j1G2VKSAKlXjvUcYKyBuDAJG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX5Q6BLS3xT87S
 sXizpnIIwiHZwOEqHdR/psJRzfdXPE7b7+hr1/xYF17xn8PLnguYguCEBt6he9a4lFGO6R3A38o
 GO2Ui7n46kNKHXzT0Lzcp5wnh6hx5rN7nxMVAqXJrmkgSMq+oH63DJLP1uZA7ut2gFoheaZXdZC
 2XgWUzWo9/l5NT8RLWYFQsMCUqrT5xR5ojPBYwbPL1V4NOPGhRLfkl2k9gvlURAUzVWudJ9gNbL
 SXRShEGRH4MWFNqfkU4xJoNzBi1+CdKt6UvcRY7/qnwRwpiZ7dEpWx+Hh4fM+3h2SosHQc7ZuYu
 tMRSbLIchpY+N+NSwrs8j4UfX6aL1QWi2Y4EsKMXUTYmU744q478iQ2tDo6ijnv7re2ZkQXAnEK
 s0p3ztxLEesiWoj2xGXuvVdc3Lre34IF0DWlT8z+N61SZ/6QJCZoYLvErDYo1woSGq++PEgNSFp
 gxfky90129HW3uSPT7w==
X-Proofpoint-ORIG-GUID: t51sGuA9j1G2VKSAKlXjvUcYKyBuDAJG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfXxuLQggBMpRYF
 NvYaQ7/xItTZNoozfa62LnUccDW5ZMKLrxWuVhGx6DyQ0IPLp8FuIxDYCTz8jqmXItFDJxS9wJq
 OMZ0R3ACAWdoH0/4kYoeF56Q6KsxkQU=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b826d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KtToflQ-RCh9Wo7pbgkA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060105

DTS often have spaces after tabs in indentation for aligning continued
lines of comments or list properties, thus allow such cases to avoid
many false positives.  What we can easily detect is a space followed by
tab or too many spaces (more than alignment).

OTOH, DTS example in YAML files does not have tabs at all and there is
already rule for that, thus there is no point to check for mixed
indentation there.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Rework idea.
2. Adjust function doc/comment.

v1: https://lore.kernel.org/all/20260706071446.87669-2-krzysztof.kozlowski@oss.qualcomm.com/
---
 scripts/dtc/dt-check-style                               | 9 ++++++---
 .../expected/yaml-mixed-indent.yaml.txt                  | 1 -
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 34e0f7e2a57a..e49b7446a2f7 100755
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
+        if re.match(r' \t', dl.indent_str):
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
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
index c989f8f19853..0089c62963f5 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
@@ -1,3 +1,2 @@
 # mode=relaxed
-bad/yaml-mixed-indent.yaml:27: example 0 [mixed-indent-chars] mixed tabs and spaces in indent
 bad/yaml-mixed-indent.yaml:27: example 0 [tab-in-dts] tab character not allowed in DTS example
-- 
2.53.0

