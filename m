Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BB381EA9
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727988; cv=none; b=rhQ82M+/+kqr1jXeUNe8uZ66uNASeVbbgT4PtRMvBSNZpHJSdF7CsDkY0382kuKHWLcSgSk9ZC6oey+QHMboI+xMhGVOb3iZFBAyMK3vwVTQRlSzb6svFh74sfllDg6Gx3HxJ17NLKmtmZelq/3TSsLHcfD52KJX8EWhQ1Lt7k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727988; c=relaxed/simple;
	bh=Mw4XHK/Oa8T91FeM/cqkEoaBFhwKmiLgbMkHNgJqgVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrxfFeh0bzavmGe9F2XBstOBJ/X7t0LyLDTcoBSVA+5w8Yl71N41m7N57ddfMZzWPrMDvdC0nVRdXb67tsOESRPAq4+7woVaTDuAVhdpCOeQBBuijXnWp89jUmgJOkvQ4pQFJQmoTTQ882pIRt3ZELr4Sn7CYGYn5RCXS4bOyZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDm0X9b3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rjz/JO5r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDm0X9b3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rjz/JO5r"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rc2n3794471
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+8vOI27ZV6IEvlCRSpFBL4FoDTBUBGz58m5JqF/ZMQ=; b=QDm0X9b30PzlKvGf
	Vp3pCn2mmFhJy5TTjLhZBpgNJr18AulHm8Uf4ZY+T9E2dhCL9yvQvf7yy0rxV+ry
	4lAUVYaeK+Z/6wVi6BDd/yaVWxGPO4+OgyyCIOTn+5fO6wq+wYMBNlQIYqbQztsg
	Zldr03k1o0Beixq0p1hh0H940V87SiCH8MrXKPvTrnhoeq6nrIlruYP0K1MbI4MJ
	5doBFQK6kpfJtw1lVCpWTQ9i5I2op/GYh8GsppgV9K6bpBadeGW5Iif/n/+QQWAB
	A8+n44U1pvT9+aqLNflcZwvxvMxJr8dcoAiqUZob1sHrGl31zVpN+I0uKzjPnP5T
	blVxLA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx8fk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90ccb6102baso2578366d6.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727983; x=1788332783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+8vOI27ZV6IEvlCRSpFBL4FoDTBUBGz58m5JqF/ZMQ=;
        b=Rjz/JO5rMEpfVPV8InS/sEhzvYRMVLjzcT43t73JscEZkSWmCgPqLxbtOc+ETbLpI2
         hO7Wt+T0Rx9XhUzGUD9WWOh+tGnx8XWT2sfBTcKfsc5NpKtSroPRcovmNC+OvnDkusw4
         GP2igEWJs9JsMfdCxYgNqjaOsSOIuzKxARTrt0fBDRZ7IIuf3QrcDeZbxw2bin+W03XD
         aFjimapJUGmx3ZmFqmcP/TD3b1drkU5coJnFpe/dZY/uTI0Q/G6w0RH9n3+Xc9FA23JR
         ZysQ/Y9vTGP0nOcpfTLbRhJHjbOdUn2ecFYlU57LvuxglWkQcUPvTeoQWuhqEi2UV3y9
         wrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727983; x=1788332783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+8vOI27ZV6IEvlCRSpFBL4FoDTBUBGz58m5JqF/ZMQ=;
        b=slfFoxQ6e9bpPLJQjHC/2OchxdkPw9S9qnxEOYZn9ZMNl2IaJiHZdB9k5cXkZuAK2k
         rkZYMviRY+AdXiUNvDJNgTs0H/jZ0vDobzgMnqKjDQsUssEwR6WKCYBQSBctD+CL3e4h
         XdOEugyIMa5N9lqeSC8cwRwgNLOG77bFrEI1/B0G0c4NwxwZodyuKtzWUKLd7oOjt2hd
         lAZVvSQdrEFeIelWj5EOmi8Ae+nI2b876fIPvIjxjJ4xjvo8Ai3XPYZMbp5Y3soyn0CX
         gW3QW1Wx/bEJqmSLra7LM4slA5dDTnXfsE8MH9m0r1FwSiqSiI1ns0yKATxu62vPOIOK
         mFxA==
X-Gm-Message-State: AFuF++kGFqxD8Bb+AtzSPkWXvkoAqv1FWqk7W1sX7aKQeYuUPj6F16hM
	FBG4TAiuWik2kq5tRGRM9cmYhzq4TyT3XumOxaUe4nY5oAoFQwsVqZinmalZXk2cPO203GO90GO
	jrhjDiyRYil8AOPFTF39XW9j6Kk3/c6/hlgsBFSC8B2fzQGFguKEPEHrNxtJksXIf
X-Gm-Gg: AR+sD12YNRWXgd/U1NUJX8fy1Tz2djjO154hw8uJDue+W6dUUTGhQhB2XQduZlydChH
	638h825+6LMz7mnEW5wiHPtBn9s39MeJ6Y74riBWK3Zi9a3PG1hGrwghgtx3oiyjD5aRFYXAVln
	O68CjY0sQvWztOa8hrOuNX/QW8jADKbtl8TXSm/JduVrAJN3njBk9YTDiahnJiiJ019773lJUpG
	EsP2Fb5QVS0gg/q1UzZ8i0dL6xlaxf++iC61ceg7whICslaj9dkV1X2g5atuV0bKR4xXCrUB2qC
	+UIjwPiDHH8BuT0zR91jXpx/FWWt61uSkZSR2ngmHsIp91Lvv78aIhmBIsRacFmndsEAAWcY3Ws
	qqkoFRDPVSkO4M9B6SV9ToJk=
X-Received: by 2002:a05:622a:30f:b0:52e:3f51:b791 with SMTP id d75a77b69052e-52e422132d8mr44219631cf.5.1787727982786;
        Wed, 26 Aug 2026 00:06:22 -0700 (PDT)
X-Received: by 2002:a05:622a:30f:b0:52e:3f51:b791 with SMTP id d75a77b69052e-52e422132d8mr44219261cf.5.1787727982392;
        Wed, 26 Aug 2026 00:06:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:05:57 +0200
Subject: [PATCH v4 04/10] dtc: dt-check-style: Consistently call 'kind' as
 'file_type'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v4-4-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3656;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mw4XHK/Oa8T91FeM/cqkEoaBFhwKmiLgbMkHNgJqgVo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBct6FLatngNABGCvSUr1gI9O3M1PsEMHrE+
 6ejmnSKeQKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QXAAKCRDBN2bmhouD
 18j2D/9lyf8WOgUhHR1gGJmWkghgz9Ex3a+Byf2LixGOD/WfhBKVrUETREapb8VDN5FmHes515d
 3VhF676ZT8CyLNsKkKRKjoIk8L6FeDB4ddYtjwUii6gEhSKp2ZP5rv3wHiEtE6evBEtpePlBO1w
 eAlFeyUviPFyv420yjs6EwQ5Ppk6Vb0Z+Mx9TqyUfsQMCPayctg5asIKY1f5RyLgDXmfbtppzI1
 6OIQebF9kBsc5gtmMADHYCZoO37SXCSkJfg4n8dd6RJRX4tLcCGU/MYQXBmJCKvibQgwa3WadDg
 u4X81KZg3Q8jiizX0FbnVYzXGbhyjkQPVR5ZQ6mAbYPehfPZP5w1YtwN3HU5kVZQ1prJp1wRXLW
 BxfyIsEs+qmcbH1S2tJ+wHoY9fViBH8Ahs+H0yqC7gKeyeHp+jAtuvcFUH8TA5L56HM2h9ysFkY
 qAf1BMebTi2NuVZYjwyV1jgQWgtRvlEysBICkN01VPkt3YutewLJ7ypaJRjrB9Y5icTPJFtaYSn
 EvLkREEH/mwVNh8VmHNFqUl+GKi+Gb41Qfz1tpVf1dfTxkpvrFtPh0DhVaRYAnPrntA4hJDyTzr
 OLFA3aXGcz38GOiYG7rJtdIsgxTQViYD7ephMfD+KJFW2yeCykTWd1C4eVAlhSBpJQHmay0l1NM
 K2HX1/DwuonQuKA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8e9070 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6JaV1sFd9OF9Hac_-DgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: mzu-lSH0X6VgmHYRKPGPyAY2nga6RGa7
X-Proofpoint-ORIG-GUID: mzu-lSH0X6VgmHYRKPGPyAY2nga6RGa7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX6cbk85OACQt2
 iiU62nsb27iXPS2qSeMkxVELxpvLVDhIhhQDRBQ0y3b7WHfor8QnAVOz6kZ9y1oeoff9Y2P5xKp
 JKRBUu5aioLme2gXOHs69T1ZaAmJX0TfM6mrK9KXkd5GEmnAHAzo8VmoaKk3DGDgR2ethl02Pca
 j4SUNi+86dwc2uftPiGPeYqsSQZ3XWIEDDfw+O7Dj5e6WgnZcmMVBVZZgOX4/CnD3TOsJsfDve8
 HqllJOWn5iX8DQJC17DjD9hVYR9/pGmvtCr7ugrVGMnEmo/282X66G/DutejmZMD2xp/CtKGE4o
 f4OVxrcjuo7TrKLjthhZ2EpHcZUSZ3p3fyAhWUkRA75a1pP/odZ3nnjdqR7pzo2OcnRLg6++F27
 Wv/gQjMCy1zAPqNoIyShNsE+/kNO5qdZhyi40ch8FCkV75PXOTN9rc8UhWQFkCbDOw3787hrR23
 Heka3Mcl+hIX2v4cpEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX7hoAeUPh2NEt
 frFesaBrSFZuyObYV6QJ39w0KdcZnJcOsLH/Y1vceEmeJCl/bndZyk+TkA0mhlegSokHx9t+jB7
 o2Ifc19v22beDYmKffo9B772nTmRJ3c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260058

Script was using different names for variables or attributes with the
same meaning: the type of file (YAML, DTS, DTSI, DTSO).  Unify 'kind',
'input_kind' and function input_kind() to consistent 'file_type'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 486dd1d6bb9a..a8a3b6e0f7db 100755
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
@@ -1070,14 +1070,14 @@ RULES = [
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
@@ -1087,12 +1087,12 @@ def select_rules(mode, input_kind):
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
@@ -1149,7 +1149,7 @@ def iter_dts_file(filepath):
 # Top-level processing
 # ---------------------------------------------------------------------------
 
-def input_kind(filepath):
+def get_file_type(filepath):
     p = filepath.lower()
     if p.endswith('.yaml') or p.endswith('.yml'):
         return 'yaml'
@@ -1169,17 +1169,17 @@ DTS_FAMILY = ('dts', 'dtsi', 'dtso')
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

