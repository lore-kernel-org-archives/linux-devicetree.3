Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E293CA4BB
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080873; cv=none; b=HpeHp5HszkI8f0WSCJKePcKXjIsLoS/KV4Ta/OdEeZcNgNXo93Z9s8uH9fzp/64FJ7BtZrHPc8fCQPVqCXP8f8jp7wL61A0hPyQK2oQzx+mGSjVr3gz6PkW+Vw/0fdrkmPHiGUwOMjhzJtHR3ZI6b7GQj/6IParP17OUN+6EIP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080873; c=relaxed/simple;
	bh=MF9QwdLjV3Fu08zeR2p50wNvEV83VD1tNBKFvSmjv+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SM7CMnuImqOYg8NH4U1U24VugAzZwY9u2s74NfXeMnuPYQirir+cfFKLVpkhG5FLOXpoevk/be097GoJmWm8FwYkokkIIXSDLESDfqxK59o2/JLfd3dmu1ICpewi/Vrz7kya8ayjISPIyD1+wZaE2m0rz+EK7kI2yNFGRpfdxNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRIS7KbC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXvypJes; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRIS7KbC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXvypJes"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE2tuv712024
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxCIPF1TGK+Fe0HbCGrK4L70/SyTxB7DXvT6DAXwaec=; b=pRIS7KbC17z73i0J
	aS5edeyJhA6Wz1aCOoEVmoxAa6L4px82NEaSecVr2NL04MRgG0uCBpelbqYP0ep3
	HtgQtx9ACeAZX24xH85uOamexHviPWd7FoIIAGhsRBHFtSaUUQdSQSK5eKkQT5FT
	/0Nr6Bomlt4KgUcX+WiqIaqBV2Dn5SVaMMAvnbTPjE2XNPzuCsKH9N7e/pAA8Q+8
	GOifXrILWNmdSzl+J+ndzpas1+gDCCSiJmEtU8du25g0J5H/gnMwBFcBiJizbuVF
	CxeY8I8qnKq9xDo41KimZ0tUfgk6QY31Ga3YWu0/dssb2lODEjA6D0m08E2J6fST
	nS4v8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7u748-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so235784485a.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080870; x=1785685670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxCIPF1TGK+Fe0HbCGrK4L70/SyTxB7DXvT6DAXwaec=;
        b=GXvypJesQ7eOCoAW//P74ybx/0XGw8kI/9n7HAJjlU6tyW3a1PXcmRSUMd2mCx9NIK
         oWhGpl+TiPjhx5Wg+XZ3UvGiLegULW/BW/+/9DVda2ZB9QNUsK49UH0BlLbzzTXlXhrZ
         hF6xiRkdAto1alJuFTrYE3VrObTf5MRdWi5uAAZbq3wrl1sBDa9b0gvH+iRbSqxIMoaa
         tfZD9zytWtrxBxseus/p7eyEpprwelmANfLugS2nqY+qVAFzBEOUcVDAs5YJQI8s0z3O
         +T7kzFwysJjuRPbKvLu5nNP83v+DGCZRanh8dgIqxQJACrok4erxfzdwmPL/ks/sSr2u
         FFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080870; x=1785685670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxCIPF1TGK+Fe0HbCGrK4L70/SyTxB7DXvT6DAXwaec=;
        b=GMkA4G4dESktuejoSuEIobl8mrB41nhd6zyVcx4Pxcq+HhxtaY3E+R6qcvT+AbRW8j
         90rngpyxV4X1RiY4JP+kObKShiVa/cG9+EoF8l8trnRXYpMPhukJx+TrCAAd7b+NXKFF
         Eh85S4CXBcroiqkKi88MMlzIx3DoyE5vY44RSs19bjjZPE0O0L381zEzBsebHm/123ki
         3A/r9nkv1CiGpqfJr0aE5koOYwOEfsPk13wFbitTiazI2Wwp1bw5zPYnTFNPeqZuPZwS
         mZbbu1NM0xAD6gnsJvqCMHiDbMnlXKdJufsa/bwQaUccb7uQAhtSezz509Su9fkQvZG+
         XGOw==
X-Gm-Message-State: AOJu0YzKkhxrppineTkOIy28xHTDTEiC/EmmxU8je66sr5HxuSkXLJiz
	jKLCuA/sSYeGbD0ppfFvpPgGuON6qboF9NhLNB/xy90ig9wikf3sOaxTYJrjHQgMQ2Y8mIlAJou
	vFtaAFonaStr94W8CXvV44gITyEAt1D5dD0WAfSTw2l0t3ZQbMILxvTGZCmIQ+IQJ
X-Gm-Gg: AR+sD10hTk26kQk0n+ctzcm0vflzq+wO9fImarEovHbS5sGbU6FmcLnBfT+iKKIFhYX
	PbIYLqcBUCdY5SOfno4e9NrYI4SbfsxnU8rzBozRZsYjwwZIIVyIxRqCM/YJtXn5l1RTjWtdcyf
	rqXRF1j7zIikWxEIcChdvLCZXJWVV9KlQ1I6CQhGN8R987S2FZf6DqO2styOD+lH2wIiEaSKhCX
	FDBql7e4i1HNjaOer7hetNez3Su5n9G8ewji4KWMVVugIbUljsI8v0P33lfnY+A4hDpfcefjyox
	4fayrFvtiS9xwhPCZfrya/x3GbvEPP2ae/eY+jSAJ24TwgKwdAW9dntl59BhxQRIIPMhS3rtZyt
	DOJdHTNLNI9oyl8raam9zVxEn
X-Received: by 2002:ac8:5f8d:0:b0:528:3b9b:4f54 with SMTP id d75a77b69052e-529a83683fbmr55946431cf.8.1785080870551;
        Sun, 26 Jul 2026 08:47:50 -0700 (PDT)
X-Received: by 2002:ac8:5f8d:0:b0:528:3b9b:4f54 with SMTP id d75a77b69052e-529a83683fbmr55946241cf.8.1785080870119;
        Sun, 26 Jul 2026 08:47:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm236848035e9.3.2026.07.26.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 08:47:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 17:47:26 +0200
Subject: [PATCH 7/9] dtc: dt-check-style: Consistently call 'kind' as
 'file_type'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-n-dts-style-checker-continued-v1-7-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MF9QwdLjV3Fu08zeR2p50wNvEV83VD1tNBKFvSmjv+4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZiwUM7nzSjAIO4HG2NOGhCts9tC1NkgzWsWrn
 OFyCk9LYdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamYsFAAKCRDBN2bmhouD
 1yoMD/9dMeH6H4oej0FK0pGNuIsmQXgu+GdH6AEQouFS/Pjrx31Bw2WsosSCwOhNseueNCz+6jD
 N2KkCqWFRQgi/lXM5VhTFJWxPWz7+2i6VQ/0uNFJ6kr0hqoOtscCaGko2KJSkPOxq94WXFx2tc9
 AtEWb6vPOZzAegm6TpqxcMkougPp5crlnon6XvVEthhOdZ8ru0JHsDVhKHqjtZUplGgBfIDHmuB
 cY0OCImrDbEDvHe8KmDjONLCEW4hitRYqmvYzUulillvrs3IIhDPzQ+wcelQdJXvETaTmTeLWVi
 sms0FLYUl3Pdm4bCaIQj/P21b6M3OgFTlVwcyV4cRWzL56yW7oT06GwluxpVTRcd0wCkBrF5du9
 ozkDQVxYqO2KbFLd4BdMzPXSW2lltrox7gPEfAEFPI/IKIrsyueWz20tLlKIPvrXtSjABIz9KhR
 15PotlNcB7pXjzKmYV3chWnPqumSIS1cMCtNbjSq7dubMsa2hHl9/6Ag4sYvZfMZ4GtghxOk8Zr
 OUnbefJDYkxzaDauGemiDLWggOuRaBCZFDGvIl9/Vi93zt6jCRZItMn/g5giarPYK1QMLxfrWZX
 NK0V0silHJQKYVBOTYCgC43QBe5HPpaundVVjVJqCSYrNiEx7K0kjLyR5fdEaPWJPd9EUa7frpq
 RB+BoGoVpP4pVlw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 22dNYYvs0gFc1yFtv1cqs6jvi1H2Vq7e
X-Proofpoint-GUID: 22dNYYvs0gFc1yFtv1cqs6jvi1H2Vq7e
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a662c27 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yJs4a0VNPpCrBZgYWowA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX/sIukHGePZLm
 Qy8RCgtB/kO84EJ8L+s1JSxrz47rEQFhuDcZXZjHrcxIwOlZlwA8XhtdQcB5Kif18B3epAqyaCA
 uVR1IaKItXvdLZRbr1xKklidln9cfAeLxylH8M6MD6E8dZlLThhC9253STyvSpylaAZNxQC35m/
 hvdK+x3H8Bzc7IckoMTjaAsvBbTJt3okh/UWTTYoWcUZEvf2zp5fCMXW1L+Nz348Oh9YW4AZGJY
 p6EhYNuGVaOtzrK3679VB3LHTH0/NR5W5SFjqR4Ot+9SFg0AzsubYhDpIhIool3inARmrtfiNiO
 53+o4AgP2lDVaYBnQLFyUtQFNP2mxOszcwKX6prYnJQeszw//lE0zrTR7fvCblU/e03uUHeycrT
 rI3fkKvH30c7n5LVs0fY66nToJ6iPHfg0f/YSnjAUM+gfyIqAo2jTSfz8o6OXKi1X8XtRlsG5kd
 Usa6O/zxWpLxuzQ8iIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX897OWkjRkgSn
 UdlDjY5LMMVhoRBYtoKO1ZdQkc1xCCFhMzkhnWQaOLr1ks7G+gW7Sc7Yqf8HgUCXq2l8MrUalQx
 Hm5bvel4vDD9+3LTJSqoWLJUl0GEC3I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260160

Script was using different names for variables or attributes with the
same meaning: the type of file (YAML, DTS, DTSI, DTSO).  Unify 'kind',
'input_kind' and function input_kind() to consistent 'file_type'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 171a5e12fcbd..8c049c04b865 100755
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
@@ -519,7 +519,7 @@ def _walk_bodies(lines):
 
 
 def _natural_sort_key(s):
-    """Split a string into a tuple of (kind, value) pairs that compares
+    """Split a string into a tuple of (file_type, value) pairs that compares
     numeric runs as ints, so 'foo10' sorts after 'foo2'."""
     parts = []
     for part in re.split(r'(\d+)', s):
@@ -1053,14 +1053,14 @@ RULES = [
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
@@ -1132,7 +1132,7 @@ def iter_dts_file(filepath):
 # Top-level processing
 # ---------------------------------------------------------------------------
 
-def input_kind(filepath):
+def get_file_type(filepath):
     p = filepath.lower()
     if p.endswith('.yaml') or p.endswith('.yml'):
         return 'yaml'
@@ -1152,17 +1152,17 @@ DTS_FAMILY = ('dts', 'dtsi', 'dtso')
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

