Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB2391833
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660359; cv=none; b=Gafi5QUQRtHGk2ZN7rV4SyKgLjIzqJR+UVt+yGAwLWzSeDoi9Yu3Dz+V/vlR5vrPujqumYhAyA3jcqxPKyruBs8xTbj4J+KTE7RfHLtRzK2Zke6IviO2IpDY+ZMGEJxCPnw5VYF2Cmm/0KoXN3Mbvl+w51RnSkzC9zBMTMugisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660359; c=relaxed/simple;
	bh=F3qDszd8b3qEhAbjqQmPZyN8vW7SQcHrcvy1x7lehKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uL2PlgzJhxoLfPuTNliOf17Hh2hzpIftefVk1kZUz3nHV4i2GpHLywtDiDqi6RXn8GeUtRyI2tnyCAS5vdgNS2AkhMho367Re/l5zIOYscMjCmfHFFLKWw5BgZ8/grZlnHnm4eOZ3ujZqHg8Hxe1dOxhVAeEYNxDBDe06I/u/ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXMhNnAX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FymJaE2d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXMhNnAX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FymJaE2d"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727mci31102096
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmY6NfDk7e8bWXk5V8DV7c3Igj2HUItaahf/PSh5N8Y=; b=kXMhNnAXaMjO9p4u
	b7EAqL2byrnhHyxYhsa2QZ52i+7iYuhdC3YALzHzpR1pjI/iFWUphe6/+tYsRF9I
	5xzoJo5aZKzN4yiIT+7lKO569R9Sipz0aGXLfktFex3pYk2WxvNN3+DmbhtFTSj7
	erhmt+Oi6MvSoW4XtCttps/aP/OCA4mp75IN5/0ttl6SYcbOcR9emyRIpKXbUYnJ
	DoI/eG9E3tHMj9GNF/NDb16T0INV945/vRPKyjd2odNPWJGpNU19R+YRMgq04TET
	a2M+j28NGv+bSI1Z3UBc93zELdbx/QeexazhFZAa8CyskXT7mtMJCCY2Hq9Zz74d
	NMsCEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u9ahbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:45:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso42191321cf.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660356; x=1786265156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmY6NfDk7e8bWXk5V8DV7c3Igj2HUItaahf/PSh5N8Y=;
        b=FymJaE2dLaXYuUer+NtR0qKUl8Fu2qc+ZIPvnOD/3iulGdsyiwT4vFa8hhsYxRK3cj
         jRiVBmlZTkOxKqUReM/Nh6Wrb0UyMwqKld1JB/+v5KkD8TUZF8R1vxdvxjePfxWqNjEM
         p1tfwSpoeaxKQEvC9SyeFCOacXtve/oh7z33aYZcABcYBzNuVX1JEsDJpto1E8lkn7gD
         sU2OGDkXZC198RWHzxkWU8sSktaA/Kq1U6tRQtF99b4gwbuX5kmQz+0S7szXbcXcKBP/
         q30ukOpWe5djxLkV8L9x7G/FeEYYPk1duG1avXXlPTWo9BFmnfq0EYUBeZjz4gnNKiDu
         f1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660356; x=1786265156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmY6NfDk7e8bWXk5V8DV7c3Igj2HUItaahf/PSh5N8Y=;
        b=ZSjuewb/5t94QAe+ZyRmIL/uLo5z+qh1nRX7+dh9LkOBIhE25/iIVE/VoW19U5XVzS
         lxWxuv0uKLcXM8vnJaHuZGBGVXjwNz1rnOaY7WcB4FuKwzQ0QdMQ+umksKyDAUWTCVIl
         Ucv0AmM10LpO954Hkp/QWlHTjjeMkpYilKsR8JEXsDNXvDLYm5xlhaO17WEFUqxjwFpk
         nPrITnNolYP2JGkQ50IIyc4poavLQwsdLE6BxF4msQ37A3BSiItDO7DsODrMtvwva47H
         FZO60qKzm+4tYh88qq+juHAHGQrWqwM5A5jb96dwjuspGslqg68FprVtG9Upj1M9hkiv
         +ozA==
X-Gm-Message-State: AOJu0YwarxgHyL+1CaXc2Vo8/LQDzzwJtpexwOSUxYeC995Ttyx0EyRt
	3DntemXiDwoJMXHW3uvAJ8U/6Dra3VbanfB+Cd3ZOPXOBqqN8PR5PRr0yWVVhk+yIa/cwOxx4Fh
	Ie6Pxskq0lit7He9FjdkuEgXuqm7uJfb4A9rvuUqVIGzj8F1Nor435WnotISpe+cP
X-Gm-Gg: AR+sD10QyKlvgggsYFvJI0zghhT+zdf2dqUcU0Nk3SrjDBXimzshlLK+PsKaYLCAP4P
	lpjTknVblW79qlTzwYZLtzNe9gZKAskNjAxaNad3H9qxxZT+QtiAab8urLp39s7+Y0ifaEJt1+4
	VoqU+usroear9wXAcLjaBAnx1pejjKGtHp9irEfqRnwz3SxpOfgPWuD/DSFXYb0kBlXMkzQTjkG
	9Zw/R9fWf3bDwnQzQstlXgDz9Vwswj/7sLcg8c3T0w4+lHJKurmcxKcjEImoB+nQrVopBMuD+9T
	dkyblA6o/tyyLRwIGr7Z73U0oCak3lvfFEQhwpN2dVP5fQ8MpDTXP5t9DIuFawAGWq0yCyiBY50
	Bm2QzEXmvSrvHyQCkHDrEZy1b
X-Received: by 2002:ac8:5955:0:b0:517:87df:d8ec with SMTP id d75a77b69052e-52b5666c4e5mr112014051cf.9.1785660355887;
        Sun, 02 Aug 2026 01:45:55 -0700 (PDT)
X-Received: by 2002:ac8:5955:0:b0:517:87df:d8ec with SMTP id d75a77b69052e-52b5666c4e5mr112013831cf.9.1785660355400;
        Sun, 02 Aug 2026 01:45:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:45:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:29 +0200
Subject: [PATCH v2 07/11] dtc: dt-check-style: Consistently call 'kind' as
 'file_type'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-7-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2975;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F3qDszd8b3qEhAbjqQmPZyN8vW7SQcHrcvy1x7lehKA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOwqrQXiD03TLg7zGr0r88nOPg8vkhm3b2z+
 6hiRJMBCUqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DsAAKCRDBN2bmhouD
 1ykLD/9K4qeA1I2NjR6Ux7Wz08KU4QJB++5HEuY1SrEh6/8OdQS9dGkdaQGV8PGyuYfqLWkiTyj
 AYfa6noZq0hG48jZFR+mbBd1OELhmnPaI5TfaBM/Y6nirAqbbbT/K8i5hFo32WJ1aTwhqNDz+jE
 FBRow3y8lo9CxJtMX2m6n6CtkZd++8nvD7Kd7I9Hm8+fD7s5m9ikhP7uniNqeak6qIwyoNwANGj
 9uAW0b2udRTmypVzA1DIdNsgJEg8f0cNytKxyghZUIFpsHxt7mKEbr9cSFSF4GY0Xpx9n2lguZa
 +3WYt+9IumBHFLJl89+I2jg1ZbU+At01dMIZvTPMIzPFZ1LvfEhdsJ5R/etfjfs/KvkF856WEJV
 eckMGqm70HdrbHh9oHA01cfD0u/Hm6WuFMxlMKeMRliuiZEmJJ8B+c8a9QB2Eps/vSjkm9JKrlP
 FJlf93z13tcl3nvxHcFi8lAjpdBx1iI1os/iYR8q+Lxv0lL1Y7GxRuMhgRfQxtdPoAj7BgRRzES
 2TLp4VrtMjbQQBCI2fi0HAzmE8/Q081Asp/OPYhyDjJY/BYf2vn8GcN1Ve2H0RQxWDb69la0hnu
 q1i/Gnq3ZwAJP0vyQ4YzeNRJgpiHCc6r5jI23nNWgIWMBoQyNlLcxrrhn9yP1g3kBdGxaZR+eph
 StQ34f/i6c/z8WA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: xZDmXmnpgfL4A36fwYp9iIlcURJEiL0B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXzkNm9eERm7IF
 Ga7ienD5b+ATsowr3LDWosScUHxl1mAlEDisRcXZT1ZnL8F47jMOPRdfgLHdRYGLRF5CbmjMGGI
 YU1Qxn8qxKIZN/Eq/oFo+QVwAalqcE8LsrpsFe04WmDi4rUz/R8LhdwjEiYh4ac3YW8wI3tkhsR
 EQhAeOvIiETdGwY1zygz+IjKFZodcYrFroVd8vkQvYIBBRfsIK5FGmPkIWlPeqgKYDOx2qPmtIT
 UgEY9YDbuKyOnA5lgn2WNJLms6WcEYHfWHJI8iE+qfsjYUazeKt8iCd/+BPwNOtseoKmQxVTIP9
 5j0l+zZ2vOocnfUeA72ir1LUze/O7SL8tHUDFSmME9/uXaJOUfFA4XDKHBURFsh5wX76U4olHi1
 0C1vmwEEgRG4EP6reR8PzG7QOWFlD0C8hcbMwmMQb0xJs+XTZ5MSORyfMHhj6VFmgspLGZGJUOq
 P8eahf2fYnp9RDDtATQ==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6f03c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NTR9VLuwmhvBj-zWrF8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXwDkwzAUEFoRF
 8fdbBQMd2HvGBYBVpw4v/ScQFcPZ0ahNh+CvmpqBvYbm4JygYy/Dt9fwWii08itG4VQM9PBcFPg
 Ic3oEV4pq//R4zzndk8dNHDu+LCd1QI=
X-Proofpoint-ORIG-GUID: xZDmXmnpgfL4A36fwYp9iIlcURJEiL0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020072

Script was using different names for variables or attributes with the
same meaning: the type of file (YAML, DTS, DTSI, DTSO).  Unify 'kind',
'input_kind' and function input_kind() to consistent 'file_type'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index cb3cdfda5e73..54e96ce04b20 100755
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

