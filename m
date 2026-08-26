Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D121D3E3DAB
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742980; cv=none; b=gVSrWTeILIM0+ozlt35EtfyH/+6AlJTU7DDjqTVVTBFZ+6MS59v+kAtnDvjBDqg/msa8YqRvpQ1zmooVxBJ0hllAiOBadhMEcOUmoKhjDyDQM/V2tZoW6pSz7tCkL4VyL4ffJYSNlYVHtrTPjjJS7gGFkAKlk0pjgfMxodJxOUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742980; c=relaxed/simple;
	bh=8gUwTUBHM0kNRCngutc0wZauetjjU/QmdyT5tUCooAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gyvUPaHcjwaJQRrZ1sxdTWaTmdEsJWiE4aSTzFlQl8VR9i/zqi8VAjoQGjUWBG0u1pip3+28efGIBuolhXkcpIyAjTYMMKmt/DwP8Kr8y4pxMpiIIGjLv+LpKftu2onKZy0+2/Etm/jUsa5jUdD+g9iPkayfKWEy0JyV4IiZKQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie71J7WN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKfgZj8X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie71J7WN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKfgZj8X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHuX9519849
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w2BhHbjCShFcc39eD+zqk0lEY0YgOdp55BH3m0XXprc=; b=Ie71J7WNErd5M36P
	quW21xjlH+heGLAGxlu9w+0HDBnH62Kg1+mC/BMQM5XPnuJyWFPk5eLG6XwF1kuA
	eRUwJZJxpefPkuW9+ycw0xveX8gcS+YscJ4OkG0MUPwyFIOu1u1OBLmLIxkXyzLk
	/QZD0xEy2fTBryf6PR1eClBq5XA4SihMyY96w82XXg20RUCXG/3nkWEYqt362JUR
	u/bAqSQG4U9NluwKFbqqhvIwotivyn7OnmLO5PlHMzvn2Wu7O7Z4RnZwCeDA5ywF
	QtQ22pJB3hVmwMtw8F+sqBvEac7dfwxblB7ZmYGxq/EICSpTr1e6ADbNpbz+5rE+
	MF2ETg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n087g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso23928801cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742975; x=1788347775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2BhHbjCShFcc39eD+zqk0lEY0YgOdp55BH3m0XXprc=;
        b=YKfgZj8XKab20TOMLTWJNW4/USC7eAMc90OR+Ei6peGQXF5M0MWyuiQR+/cLv8+Gke
         Z4BeqD0UARQ+eFUSVwIioFTppts1jGex2R92rU1HMfFxBAAWHfwSz67WsQlooVtFhYHT
         GgpWjkvIp52QPSQWXa98uitSWDF+u0w0GQsVWHToGayhMymEJafuRRPe05aZfHtBHCU7
         7RT/6JkWSQRnn/qIGHsoNBH2TZ1zqWaW2bVRV8NK0fFLR175gS6M7FnW7pTjm9l5t5tt
         1CXFCLIHH/611XcWv/OExSzeYZ5iK/uK//o9bLaQhpD7j+Tn7G69I7szG+njHBZL5rDc
         huMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742975; x=1788347775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w2BhHbjCShFcc39eD+zqk0lEY0YgOdp55BH3m0XXprc=;
        b=S0DX3pxd4Omd4QRLRvu5/jroyC9E/BItqSCqvi9hJRT07fxmi29GijTmHpea3IQvig
         jjT71737fcfz2KCL1cd0vuflGFBQzSTHQ5OMfxTCEU0gSm7H7ML0htHEZT4FnB7BKOO1
         0zn7nyo7oEWTYyNaH9oxh1lO8OrSRqY3Pt5LD4jOElCD8BV3nbClhu9iDS6xX0o9xJtb
         K3X82+mNgl1rLN0O5PzVGb9KwcekXXkgWZxGvYTBCAAuxq6FkyxysVNOSnWyGQcwGEDR
         QlG2q6uFEPgMOAShbcPbaJ6/mkppVEymHIYjB2yZRIDxhb+VaMbgneN839X1chLO0Pwn
         GFSg==
X-Gm-Message-State: AFuF++lR4yFihu8zTIsGXcz/555sRYU+bqaCQidT+2R86mrlsG5s48dV
	1cj4dbUk7BDw3jWUwvGEHJ95e45SmHwrr7yEQLz8WNM23jw/ZeXXQ7GzSSYTuk7nnq8tcxHNBWH
	NJuIFOMrNUUt6ylp7atjYXmmg7rJR2OglXkamgr8QebJDXu4rlM+MYIZFKNMFDMUQ
X-Gm-Gg: AR+sD13E3VHjXNeuCCCoz/DdHNvL2/gGPKILcouPcDWiPV4D30Gsy7XHjizqJDi5iim
	LT1re0PGl+D5ylRJh+fi81jgeCr5nPmNkFcgxuZIXHfROl5eig1gZEH8e13sB5ADnau7hs4aoQg
	HsdWogXfWLTPnh8My5HvzrNemqLDLgg4NK6R0XWNuVljtm7+shQH7x2hiZv6GDpB/SQPhH/q5X8
	nntUBuVQn+59SJmj933NXKrl0RH9oFpsLfM7IhSAKMumF1i5fn202PIRPOC/vv2ejCVtHK2hH7p
	v5hdyLgPOTbsd5l61vR4FUAWkA1JMZ+qOOzCHXOHQfkz/sAQuWo4BMOEXk3Wnali0vCIv7+TKgE
	n5PRdtNxMxfFYu9MY80o2Rp0=
X-Received: by 2002:a05:622a:cc:b0:516:82e2:7788 with SMTP id d75a77b69052e-52e2ec1e3c5mr123570531cf.1.1787742975389;
        Wed, 26 Aug 2026 04:16:15 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:516:82e2:7788 with SMTP id d75a77b69052e-52e2ec1e3c5mr123569981cf.1.1787742974875;
        Wed, 26 Aug 2026 04:16:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:15:56 +0200
Subject: [PATCH v6 04/10] dtc: dt-check-style: Consistently call 'kind' as
 'file_type'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v6-4-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3656;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8gUwTUBHM0kNRCngutc0wZauetjjU/QmdyT5tUCooAc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsrvWMHbv/g24lyW4B6vDZOp9OqkBLpH4iPLW
 YPeR43PpCWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K7wAKCRDBN2bmhouD
 1+k0D/4nIqpEUWqGVCGmdbhwLB8tx6uNHTICJmKnwbOzQ6hNJjBGLLOKQSRLB7RPYGxw0aPsDoX
 LVKSyPiwgl53RU1QAUaeFX7sHXH/8prS5m0NVd0iEnGrD9JN09BwcIMwKeU8/MHDZAqK9ZiWjPL
 CrIe1qWDrCFptgNjyhSJPIgrQZ/6Ex9pPL8Af9QK2IVzuEadyKuaILVYSxxN5BJEqkOQI6fylWP
 Vcl5SrJZDlXDw82otgdH9p3WBHtLgXT6ZI7GbZ7z3I5EXCOnp88QEhRYr1upBndX1GtPJJMv60Q
 V7QXK6Zw9Y3p+aTsU1H/F0WRSmt9XX4KcsFqZNA5JwLmAumGH72YiHFqaF3l6qQFvnu0VbfTNrh
 pqeQfG8JU9B0mF5tYeBz1cJg6hj6QqYQPwa1YcqC0ixjBmhQz6U4zP9wa7Ugr7C7Uvac/eEx6RZ
 3mncEtUKdAXqeb6bq75u3BiYZAhrWXZopmR5u2gr0m7FdmYCIa22x1LYmqapZK8TQk0jfQ6nVRC
 QLYauPkdcyCYl0BcAjmCQlloY1zRfQia5vljEwAOyfyr1PgGU9aA7id/7Xkw2V646/1z5rul6aN
 Bfyqa9fxxwqVwdaRi+udspM6MxRQWHDMVkilbzZHX03SODc4jqQQJGIDoz9CgEVU+hk/zu9b33k
 NsXiYeHA1QjQz2A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: fO7sHt7ZLNBdcCP6aAYyHhppDnWX4skz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX2e3dJ8hKZXUJ
 tFodgKSWPB1wx9iJrEbisZkgmP81zN+dACChE2EB8o7xif26JnUyZ0gju1b+z8Dy0O4aGjn+8OL
 TGVlowbqFkU9ICPZTo4GzsqhBbYbGL8=
X-Proofpoint-GUID: fO7sHt7ZLNBdcCP6aAYyHhppDnWX4skz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX1Af0Xmvc8rPz
 68R+e7NYRIz3rfgHBHZ5P4bMU/xt8MU8vh7RZTHLG45tkjShwe0GUA4TdrCJwDMml4D5UbTaB7Y
 bCKm4IhaKkLwNY5rn3rW8S9QTk0SBXx9QR1hrt64rsuf8NdkJI2LbLbHjDdLt5pU/bBIjKtQQ06
 2t8mDhAZ21/UB5ecACADlIlgi4M4Yhi87pL/m0kspwVc8lugYKZ/SsfEe6WtKQWC10roPgz1zQQ
 wsMU8F5sq44YiiYq0mRZJuLwFDFkcAcwDdcsaiEL+Lv7TQdaiN4PPA3XilrWAMYBJUsBQ18LKK8
 frspkp0jsrzYtseP8Fnp1gpg8ME/kZcdis6uhyRbY6lp2pYCSgCl2l2KG3BkldhXsqiFsx5+CAK
 A+2Ydhvc+t29v5LDUvOu0DLnCeuXIrWjgWJ+8XdPv66n3RK3oggIA8H4mhRLTsTmu39AZmxvR8v
 EEOGeyZbXpPqlswH6lA==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ecb00 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6JaV1sFd9OF9Hac_-DgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260093

Script was using different names for variables or attributes with the
same meaning: the type of file (YAML, DTS, DTSI, DTSO).  Unify 'kind',
'input_kind' and function input_kind() to consistent 'file_type'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index eb5045f0ad9e..17332018d70b 100755
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
@@ -1071,14 +1071,14 @@ RULES = [
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
@@ -1088,12 +1088,12 @@ def select_rules(mode, input_kind):
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
@@ -1150,7 +1150,7 @@ def iter_dts_file(filepath):
 # Top-level processing
 # ---------------------------------------------------------------------------
 
-def input_kind(filepath):
+def get_file_type(filepath):
     p = filepath.lower()
     if p.endswith('.yaml') or p.endswith('.yml'):
         return 'yaml'
@@ -1170,17 +1170,17 @@ DTS_FAMILY = ('dts', 'dtsi', 'dtso')
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

