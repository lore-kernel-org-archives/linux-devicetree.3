Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3686A3C73C9
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080864; cv=none; b=GfDXN40xOHGTN8OB3GWwwhuhRoMW/rvFkiSpi3o4Ik9cXgB/w/WKwaTJMCSICAnDumAmIO32DtLLiyfhHEV9f/D0qRFjeCO/z4q/VN5Np61h20vfAe0kVLM8dBC4qTauqY0+POJR2k65+dY7dSJKSwqbhxZVoW0bDnWcAJcDk5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080864; c=relaxed/simple;
	bh=LjkbmCe6vn81FFu+ZMtn1oaw7c6HMT27qU1FnMtVjvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HpdKeWH/E8TIPucimZd3ZMFAbggcSHrrSoOXChtWhv1VYbo1rQ/GODItosnJ4rrafbMf8zQNm/XHhPN1i/mySYfY/yAIBhdDuA5uD4VUXDKtBCnOpeNfZj8fE+9Wv71b/LOD79+bgSxeVyxpMwp+PLfwqSqtHn0tjidgeTsP/ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxtDHyli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGfd4l+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxtDHyli";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGfd4l+Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE2gJG1973637
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnX+Bhb9Lb7raNVA3JPHSL8HRf4LFQTpLNpp44RNZTM=; b=DxtDHyliuaVaCGrV
	2YQdQF6ppUWM07pBVmwkOITnrAouzrHBdo8U3pDfuRTB8DwanGL06ZypgBUxwcux
	/C3kN8jYw+9viwejpSNKaLvbhUC27pZlVFuHXFyOKQPDc8Z7IG5lqc1HMdvSOXRy
	3G+Ll9Al2sD5rgynedeR4LefJPkvL4FuXxaOhnYBTdX2Xg8pZKCx8q9iSQH0Je0C
	Ijcw2nD1IFdc9rXCWA2nOO1MrypQaJgTZFi4Wny2rRnj0OaSnxiNZLEbGcDbPbob
	I5Qm6Q8hPrk+DB/tBN91jgNBwXhLEo6Y2RwLpwvbAZYc034N+np5sLxkX607lpjh
	pdGxlQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufuf75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so26197001cf.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080861; x=1785685661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnX+Bhb9Lb7raNVA3JPHSL8HRf4LFQTpLNpp44RNZTM=;
        b=LGfd4l+YQT7X8jnVSGulQqBFIKrwoX8UkTnKkB4uCO8WauCZ/c48wck5GAE6XZMw5O
         j3HoeLWY4sz80SZs+9nXPcfGhbIEq163uQse/avzVdDIyFGEeJPiVvMlj/PZQOIL97Vi
         K6sP7tNEzi4HfXrJ5jXnN89Dnt3db/FeL9gC+LhUg9hjLBQadkqrxaaZWQfOPeB09Bbv
         o2kD7+7FP4FPvQeABECFC7W9TrVfJ2lvItuLSXGd4vmaFiM0JTy21GigiUL4d/eVjWJn
         qxSOxOMKE5JWuiSdvoOoD3EtNsnwEPGgEHm+sJTPfvcbtiGP++LswIzCDrC7IAOXrcKf
         rW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080861; x=1785685661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnX+Bhb9Lb7raNVA3JPHSL8HRf4LFQTpLNpp44RNZTM=;
        b=RaCrAoC/EEojmubHufeyrmPAYlcMEGwwySEkuS7pjhccagwNWaNPZczTKIjf/MoVHQ
         UxYrOMtPNd127NzNJ9AMo/2ben9QWhuCerI6ZepcYYq2cYVnooOTQo1OoorEHtWA6zh/
         ga6keQqk8q/QGo303kSK4BzkgZKAnXfYHYtvW9KRUR6C1MhKB1x4S6W99gv4S8mLxFWE
         Iw2c/4MG6/5lcQ2i/nomVs95vTx0q9h4y1BirY/5mXncHOzMhCn/Kt8nwyj0bWgOhoi5
         IZdSH/4oTD7ty7BBgHg9iITpUKMHWBlUinvnFiONB5WTKzAQ6f3voyi8LBKrJdyGQ1im
         CcnQ==
X-Gm-Message-State: AOJu0YzQ532mzBvABFVRTgs4EzHm9XoBhOSKgc0gEI6kSgwnlKv46nlQ
	0c+YrjP+6q689wIS1DbzbsN0SYsImnEP+vYSed6uzkY1bVfoR0RHusmyDjrl/m1wo6xKutxMFiC
	eWJ2elxzkbt8clV9qqpangeFxq4JaI7aByNi02ZHWegSrcmbPEW2W+a/5w5h8DirN
X-Gm-Gg: AR+sD12FveO+VWgLdiipk4jgUWOumOeVRPv0j3bnLQ9nzDBDshUa90Fpz6KR8sGiDvt
	QyGg3Uw5+1zp/30iz31jkrCRa3GcdX9FptMWoo5oow9nCULU/ED0QiaxQ6NlvFkStaeggkPs22+
	wIsuedlTlLy4ckFXlUDhAnb735IyCi1dIIn3581HvAGX5LQhS5D3Wb1cVfkeWsPnsYFtmdeCJwK
	szzjKSbFDMgYp3uvo77j3i+Upv4EHZNb56J13AWsZXUzg5Z6Tu5Nolt4IFiFOGrBuX6Vr4QPK+W
	2zuzemNbnTxwmds0jvq6mTh/6FxX1qJyudzHyMzJUPymLRk7haSGxJC6cXldIRyX/DY24m89Wpx
	xSHLVZHmD61a8htOtvdZmqK8e
X-Received: by 2002:ac8:5cc7:0:b0:526:d946:fc15 with SMTP id d75a77b69052e-529a87260c9mr52132191cf.66.1785080861385;
        Sun, 26 Jul 2026 08:47:41 -0700 (PDT)
X-Received: by 2002:ac8:5cc7:0:b0:526:d946:fc15 with SMTP id d75a77b69052e-529a87260c9mr52132041cf.66.1785080860918;
        Sun, 26 Jul 2026 08:47:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm236848035e9.3.2026.07.26.08.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 08:47:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 17:47:21 +0200
Subject: [PATCH 2/9] dtc: dt-check-style: Simplify setting depth of DtsLine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-n-dts-style-checker-continued-v1-2-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5042;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LjkbmCe6vn81FFu+ZMtn1oaw7c6HMT27qU1FnMtVjvE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZiwQdTRoHXqL1qAvJRLi8aZHFpzIz3LONH3b6
 NaWRjrn/jeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamYsEAAKCRDBN2bmhouD
 16J6D/92DQSK5f9BP1061ohm1iqvV5zEwfJULFn4V/Ot0raAeDfBx2EFTnuhQyagAVsTeo+b10K
 5jq8i5FHBcyh2Nrbk7JMEVYzfrgK55GBarRoMksAm3WsE9p+xIsWWTtY84wYpZJdN7o7ZvmafWH
 PcMzG3J9SAXudlROV5az9/dchXsrGWfoECAnE/yXJdXQy0X9xCvG8E4pV66W0J9q/ZEa0CtWW2s
 +gMHDDGfKH/1TCASMLw2D0S59+0WzKRyQnv2ImcZNyHRVNubR8Xh0/T4dRym13oVTpwzDBlI0fw
 iR2Q9oJV5KqQu1c/VEGVOgnYR6VQu9jZIbhG9Q3CPrai/4wU80yErK6Bsvuy2YnX7i+BLwYlzxn
 zxo1z3a3+OBncMFRR92TQNl8lDdwnYriqHqC9b43CaHjr505KE3fC0cZHkPOUuaL0BKi9z/AQkL
 KIpNkFInJ9nt2U/u/HD6tRHCUW2LybV3l1V4O24Q5gDCFiN8jjl/42MLmjBEl37W9nRz7FRkSQL
 1VEnflnfgzV1NibrewkCQUOEGsIkTAn21W91o6+INX7TOqNIIsUpNbxwKg3SVewUrPapmpfcyBn
 rlbnJRL3No1uYNip8VqjB3w79VLD2z3vQFIeRJT0u1co6CD1YO8cyzI/ZCjE2SGFlChM8Fl4aeu
 EWd3Twe27RaQ5/Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 5rRQ35iUGT1cT6fXrdPW_H5M81HNMB5D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfXxKgrgpXNhPb6
 dI08Y/bmrszIeDlJRDbqpGEsJ0roEBvEy9u0Hd1C4/nfU9O2xuOl27+6DrTz3Uc4y6qpui9q9I5
 7C8q/mxtlYX0PnyNs1xIB6sO7ZoHBPs=
X-Proofpoint-GUID: 5rRQ35iUGT1cT6fXrdPW_H5M81HNMB5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX7tcRWShU55zF
 fuVOI+UZXkAM/VRi7pVehuydvQng0qj6/x5tWZKNT/DDWQdJApeVJJPP4I8XcC16CU4CR0v1cLD
 z4ElWCgEhoilLIr/iicLrMdqKnvWq8gykwbcAIrS3u/F/llaqOLlGL5/JiGlOouWvCFKFiWPf/t
 5zG/g8+srh6zK+9/ci5w61oV9aWAbxeawGg4Cb1IaFytmkBkRtGqSYyKJTLxx1QwVN6+rUqPdZF
 Qf1hljQHWb2zZdEO0YOMyu7AMwc17S3q7V+9VZGqpXrViQerKIc3PGc8lBjOjiMS5uk3LqolzGy
 4pvekev2uUWkCsV/xlF5XRIIanWn3WHtlXW0SPyxxPwzQxfqCHs3BQZcHg8JkkL77rYSd7MneYG
 3FKgwkQm1eTG0QBWc19cDIk6xWWWKX9A9EecWIwfHKug5up4TXMsh28g+twAqmus/kasl2mFNTw
 gyl6DkC+pnUbkE9coVg==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a662c1e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8sziXlxsN6MBhN6jAs0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260160

When creating new DtsLine object, pass expected indentation depth as
constructor, instead of assigning it immediately after, so the code will
be easier to read and explicit (depth is not supposed to change during
DtsLine lifetime).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 3985923622e8..96deffc0d8a7 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -82,11 +82,12 @@ class DtsLine:
                  'node_name', 'node_addr', 'label', 'ref_name', 'depth',
                  'closures')
 
-    def __init__(self, lineno, raw, linetype, indent_str, stripped):
+    def __init__(self, lineno, raw, linetype, depth, indent_str, stripped):
         self.lineno = lineno      # 1-based within the block
         self.raw = raw
         self.linetype = linetype
         self.indent_str = indent_str  # leading whitespace as-is
+        self.depth = depth
         self.stripped = stripped
         self.prop_name = None
         self.continuations = []
@@ -94,7 +95,6 @@ class DtsLine:
         self.node_addr = None
         self.label = None
         self.ref_name = None
-        self.depth = 0            # filled in by classify_lines
         self.closures = 1         # count of '}' on a NODE_CLOSE line
 
 
@@ -162,16 +162,14 @@ def classify_lines(text):
         # or a blank line).
         if in_cpp_macro:
             dl = DtsLine(i, raw, LineType.PREPROCESSOR,
-                         indent_str, stripped)
-            dl.depth = depth
+                         depth, indent_str, stripped)
             out.append(dl)
             in_cpp_macro = (bool(stripped) and
                             stripped.rstrip().endswith('\\'))
             continue
 
         if not stripped:
-            dl = DtsLine(i, raw, LineType.BLANK, '', '')
-            dl.depth = depth
+            dl = DtsLine(i, raw, LineType.BLANK, depth, '', '')
             out.append(dl)
             continue
 
@@ -180,15 +178,13 @@ def classify_lines(text):
                      else LineType.COMMENT_BODY)
             if ltype == LineType.COMMENT_END:
                 in_block_comment = False
-            dl = DtsLine(i, raw, ltype, indent_str, stripped)
-            dl.depth = depth
+            dl = DtsLine(i, raw, ltype, depth, indent_str, stripped)
             out.append(dl)
             continue
 
         if (stripped.startswith('#') or stripped.startswith('/')) and is_preprocessor(stripped):
-            dl = DtsLine(i, raw, LineType.PREPROCESSOR,
+            dl = DtsLine(i, raw, LineType.PREPROCESSOR, depth,
                          indent_str, stripped)
-            dl.depth = depth
             out.append(dl)
             prev_complete = True
             in_cpp_macro = stripped.rstrip().endswith('\\')
@@ -205,14 +201,12 @@ def classify_lines(text):
         # structural classification entirely.
         if not code:
             ltype = LineType.COMMENT_START if opens_block else LineType.COMMENT
-            dl = DtsLine(i, raw, ltype, indent_str, stripped)
-            dl.depth = depth
+            dl = DtsLine(i, raw, ltype, depth, indent_str, stripped)
             out.append(dl)
             continue
 
         if not prev_complete:
-            dl = DtsLine(i, raw, LineType.CONTINUATION, indent_str, code)
-            dl.depth = depth
+            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, code)
             out.append(dl)
             prev_complete = (code.endswith(';') or
                              code.endswith('{') or
@@ -227,26 +221,23 @@ def classify_lines(text):
         if re_only_closures.match(code):
             closures = code.count('}')
             depth = max(depth - closures, 0)
-            dl = DtsLine(i, raw, LineType.NODE_CLOSE, indent_str, code)
-            dl.depth = depth
+            dl = DtsLine(i, raw, LineType.NODE_CLOSE, depth, indent_str, code)
             dl.closures = closures
             out.append(dl)
             prev_complete = True
             continue
 
         if code.endswith('{'):
-            dl = DtsLine(i, raw, LineType.NODE_OPEN, indent_str, code)
+            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
             parse_node_header(dl)
-            dl.depth = depth
             out.append(dl)
             depth += 1
             prev_complete = True
             continue
 
         # Property (or first line of a multi-line property).
-        dl = DtsLine(i, raw, LineType.PROPERTY, indent_str, code)
+        dl = DtsLine(i, raw, LineType.PROPERTY, depth, indent_str, code)
         parse_property_name(dl)
-        dl.depth = depth
         out.append(dl)
         prev_complete = code.endswith(';')
 

-- 
2.53.0

