Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9EE3AC0CB
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747830; cv=none; b=O+nr//09sQXzBH8dqJBKjau+4Vg9XSt0tq8FeOKPcl7TGJ3bxwE8Q4/zv7Y8Z3pG2maiDWDDddck/nJzNlmyWYetXAje5277G8eF8Y6x3qriGolpP8C+hN8fZ3gO20/jFVF8SHg5yxmLR5KhahNe6o56hxwDs1C8/j2swDqC1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747830; c=relaxed/simple;
	bh=cBtimW4GeUT2bq8Z/kkjmsXWhphuDQBBWyDRZP70Z/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QysbblhAezcMbUwwqQCe90d82FPfadEo1A6s4Ci1srnF9pEnRYCIpUzZ397BunD/YVtmfna8hybmsbPZqw+Aj9i/Cmstt8ECLFH1Enn60FIDta+gIvWNa887SFuqPHGB6w8J+40fAPGpeNCdBxYVsKnJ3llzoXfcD+npht2PgFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elSf+vz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQmt+3Rl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elSf+vz7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQmt+3Rl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736DE6A3654877
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ihYme2F+ZG8mNB7ktOuMv3VhK+M5a9w23lt4w64r+E=; b=elSf+vz7q8pfuoAL
	UplnHgRJ4RWSearQFxzy1fcb4PqpusiUN3la/UAhdff1nXyW8UG/im6AxUUmthz+
	gW4MfL+cdj5uI7gJvc14ALMMHSCWJ5cmLnOGTngzhB/ca12AlC4SA5XZr0ybNa8l
	kuBZZMSpReaS8/KeD98JII8GrEYuGXTQ17Gt3JOzPZN9MPhdt0gLQ20qqawHdCjb
	sP9QrwOS9BqC41o2R026ER2cLQqhyyzNwZSY/x1GeXnPrir4SAY9x9pGObPUKO1Q
	jM50MBPae8PSzMv1T+eIY5qdkPZpzekTYg7q58QYGE3a+/vaIuXRO8jlx+ts1p+l
	c1HDkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb0rst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so536765285a.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747827; x=1786352627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ihYme2F+ZG8mNB7ktOuMv3VhK+M5a9w23lt4w64r+E=;
        b=HQmt+3RllGUeE7vJH6OVsPQK/ElGKZhgLvXir0WdUEEZLU0jO8rBnZzefBrr5hsXRe
         h5/z6P5uPPvRR+mXKTxkswuaHdkCotOBbBCESRQ3MEkPoCXOb1WqqwsUOMy1oJC/T+T1
         pgw+TQJIEl4K0bWSmiMXPhXADlLzvV8WtfDXJ9Im8EbU2sWOQpQK4uknVbwDzB/8dGWZ
         VXLi9U09u+DBC+U29P/hbxTKAqITHs4QgAX0yP7MolIsLGiNmAhXgb5VTAyL2b0OspQi
         KAL34/8ecdkGJs8R08A85Vn6k98uyknhEdHZaWZ8LCYXS7r0FQviboY3mg/pCbTdls8n
         4h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747827; x=1786352627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ihYme2F+ZG8mNB7ktOuMv3VhK+M5a9w23lt4w64r+E=;
        b=SFogkpFckHEJZfLqsUk2qBq+34Sty2MIOzEbw1XEnC52T9lN9gqDCEotsIHBwo1ESF
         Gxxsd3xv3oSs1tyg/6Wdj9Uxf6KfC+bVM04kS1RU6uRhXirWLxWWZuUYBRf3NigoXz+Y
         3oiRgmpmHFRum80gVOT5KB88yWVEwByPrqtlruXSKkl1qocR8eysi4kWza76d5AYxVfB
         THRoaqd0Jm0NvLjDGepzOa5VXhmx1b53PJ4Vc82l6XrzfzPZHqhXIIdvvzZCrbfcUU55
         zIuHM73KLvopGYVNA4vxAuUPMK6a4OMnRvbCWHU9alRNcgPVwlPsNjcP1rvsCecOSPDE
         a6Dw==
X-Gm-Message-State: AOJu0YyGD7NxButEGgFTzTXHmGmHZ08ZD6yiBnShoHoLm9hYqtvZM/Us
	P7cbBDl5wmFfvLNRqeCNe2m996XQ4o3SJmy6wWADYmZErB9M9EbzQ0Cx2wCG5wiD/GGRhEWl+NY
	g1TY2s842U5eDMt4F7e0jIzrM/N6MJDAC3bda/je0f0n7fzjwapnIbIefgZEKzhK2
X-Gm-Gg: AR+sD12XzpbI0buEWiKjk0q6TQYukhmuOmzWVvL4JpCv19AH+BcMXtW+w6ZnA2eDpZK
	DTzl6M0O3b3Rl2BKTtdcNmSKqhQMsuOgyubKfrS8G3yh4G1brObb2H7dDECB/ei77zMkPsbD3RM
	mAnNJWo/lUXpa+ciFXFu1y69+Z7MdL9MMiqFwGG9do1Yf2ctJIwJXrBHmixDDTGdKS9ZouTvshO
	87xPpXwlLSsXKf1oildm4xiVeWBu11hCNNkpLI/Lf/hHqcY/tFCD8T/V5rEyxEQ2DcKotjlUzFL
	+Ng5HXLAwC0zX0tZHD2Y4MtsvSmjnSjbKAuQg7kxyc/rQFJWnemyQ0py1q5mFvg+LEMrNKAh5Lw
	N2gbz73kvevUQCzTeNTFG3yhK
X-Received: by 2002:a05:622a:1353:b0:526:d595:c7fa with SMTP id d75a77b69052e-52b56791b0emr183613851cf.31.1785747826697;
        Mon, 03 Aug 2026 02:03:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:526:d595:c7fa with SMTP id d75a77b69052e-52b56791b0emr183613091cf.31.1785747826153;
        Mon, 03 Aug 2026 02:03:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:10 +0200
Subject: [PATCH v3 07/11] dtc: dt-check-style: Consistently call 'kind' as
 'file_type'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-7-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3656;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cBtimW4GeUT2bq8Z/kkjmsXWhphuDQBBWyDRZP70Z/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFlbI0eGsvqlDNd2OqQ2r7x7k/qx4sagRzV6W
 UD0rR6tKtiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZWwAKCRDBN2bmhouD
 18EUEACTZoExoN5OcQfd4ZGWV7WjkxqezN8p9B9lftgb4iRcKUWQc3O4UU2Ciy54iaJBF7nfYOj
 O9zX6QcTwI4IXAFcHPAxddjj/te7k//lJb+2WXNAI3I0VCvG2/++3FfpdGNpTfNLKgyD2WJ3gRC
 6DQfzMBEFrCJwgAztQX0RJCOP11HY8X2KSbaZNTvJhNVk4LvLOva+GEM6Jp2Wn5yqseLRDeGDCc
 wn5nWdG98UD3+QrSPO/QJjTjB4Ak0+g9SliXy2JiFAJB22dOc5prcZB4kKqP7832wtKeGRqSoW2
 xriZ4yleh5eua8sK3ZAttRdXufDehwx9E+irBjtDQ6ERWf69ytdVvwJWsySnx9HBLnK5aZEYYYT
 4Po1o+BrKZ6+C6RvXMVBdoBlvBb6V/gy/zp4jsp9gHtwtdJdxgfyhn5K/LGVi8ISy2cigGrwV5P
 U3FSpmElrTVc9wVmhkhZPJj4CY/TvVBHsIOr3BPNGnKb29lxkp+AHaAlIndMOXS4b3MeB8iQhE+
 ZF6r63S3QnZ38JAPM90mZAY+ohZ+KBl5/aqNxwPo60zVR7YxoOVR0lGutjjkQdC8Reb8kpARX1C
 yqImVrgPXtxsW/+LKXQflAjylsHKSKebQPfgdweaw1eIYD1dZ/t5z2NNprhc4Gsd4mQ/hIL+aro
 HpkGhALQSqnFNJw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: RwLLmqjNGMJD9GhcjEBempWACdGt3aWJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX9+woVCRZdgte
 WEPb+JIBPCBa666Ej7T3Uwv1d6YF00MbtVGPi0Nj2pAofGvt+ax4/fkPQg+sN+GWWb93nVxRjae
 36eNiQAqrhfuzKCKCyPSTOtTvE4hhio=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX3LsCmTEZINCi
 OgCzlpPgybEo0a4mvb8LmPP29suzQ52js6vk8oFlYq+4BCXynKI8Xu9GPfaRVN7W8oq3/PctNf0
 kmcegFydwhOpNC4cGGaIACSe7M1S5usmMNNr7OpfobNurS/XP6j2Kn6Qb6NLB587x0YCJqYZry6
 UKzU3PxQmzyUpl6CNK7Ohl0ZLT63ULwrKRKRM1pW0X3yEL/VugfbstLBn2OrW7MxmMZIjO4P/V8
 p0rdLhyKe84WANO4xWi6aHXiQ93EmSo8/jL11gIPnrpsPfcYKv2Of8fsCkWEVYzspp42E72fzQ+
 Y0DCwH1HIGS7iRIvA3Vf4lutOHxTwRKb72ReTo7jwBlcFQ47/thHC/JrQOpP7fAguR2q+Hf1pz0
 HxrljmY8iSZUy0Q/DsG8yZ4bBoHSGQVLdn39MZUcgyQBx3VBTyLLnFH2z6TQlFLdN19VratGYkI
 8DCd5cFzzpNyTLDNj8Q==
X-Proofpoint-GUID: RwLLmqjNGMJD9GhcjEBempWACdGt3aWJ
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a705973 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6JaV1sFd9OF9Hac_-DgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030080

Script was using different names for variables or attributes with the
same meaning: the type of file (YAML, DTS, DTSI, DTSO).  Unify 'kind',
'input_kind' and function input_kind() to consistent 'file_type'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 1c67348fb526..e3adaad1be63 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -314,13 +314,13 @@ def collect_labels_and_refs(text):
 
 class Ctx:
     """Context passed to each rule check. Carries the parsed lines,
-    raw text, mode and kind."""
+    raw text, mode and file_type."""
 
-    def __init__(self, lines, text, mode, kind):
+    def __init__(self, lines, text, mode, file_type):
         self.lines = lines
         self.text = text
         self.mode = mode               # 'relaxed' or 'strict'
-        if kind in DTS_FAMILY:
+        if file_type in DTS_FAMILY:
             self.file_type = 'dts'
         else:
             self.file_type = 'yaml'
@@ -1069,14 +1069,14 @@ RULES = [
 ]
 
 
-def select_rules(mode, input_kind):
+def select_rules(mode, file_type):
     """Return rules that apply to the given mode and input type."""
     rank = {'relaxed': 0, 'strict': 1}
     out = []
     for r in RULES:
         if rank[r.mode] > rank[mode]:
             continue
-        if input_kind not in r.applies_to:
+        if file_type not in r.applies_to:
             continue
         out.append(r)
     return out
@@ -1086,12 +1086,12 @@ def select_rules(mode, input_kind):
 # Block runner
 # ---------------------------------------------------------------------------
 
-def check_block(text, mode, input_type):
+def check_block(text, mode, file_type):
     """Run all selected rules on a single block of DTS text. Returns a
     list of (lineno, rule_name, message) tuples."""
     lines = classify_lines(text)
-    ctx = Ctx(lines, text, mode, input_type)
-    rules = select_rules(mode, input_type)
+    ctx = Ctx(lines, text, mode, file_type)
+    rules = select_rules(mode, file_type)
     findings = []
     for r in rules:
         for lineno, msg in r.check(ctx):
@@ -1148,7 +1148,7 @@ def iter_dts_file(filepath):
 # Top-level processing
 # ---------------------------------------------------------------------------
 
-def input_kind(filepath):
+def get_file_type(filepath):
     p = filepath.lower()
     if p.endswith('.yaml') or p.endswith('.yml'):
         return 'yaml'
@@ -1168,17 +1168,17 @@ DTS_FAMILY = ('dts', 'dtsi', 'dtso')
 def collect_findings(filepath, mode):
     """Return a (lines, count) pair for filepath. lines is a list of
     formatted output strings; count is the number of findings."""
-    kind = input_kind(filepath)
-    if kind == 'yaml':
+    file_type = get_file_type(filepath)
+    if file_type == 'yaml':
         iterator = iter_yaml_examples(filepath)
-    elif kind in DTS_FAMILY:
+    elif file_type in DTS_FAMILY:
         iterator = iter_dts_file(filepath)
     else:
         return (['%s: unknown file type, skipping' % filepath], 0)
 
     out = []
     for text, base, idx in iterator:
-        for lineno, rule, msg in check_block(text, mode, kind):
+        for lineno, rule, msg in check_block(text, mode, file_type):
             abs_line = base + lineno - 1
             ex_tag = '' if idx is None else ' example %d' % idx
             out.append('%s:%d:%s [%s] %s' %

-- 
2.53.0

