Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B971437DE8A
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727997; cv=none; b=tgO7j/hABIyAFjhtUuC0o/tMu5mFKBBQhwB1TT55BxnjbnvLpPaOGPE5OKqGxclUpU/msiRno0gDP00cb3TQCc8RkYcxWFeeQAYVDrjPkb3jcYnCSKKE7zpBgPpQtsJ5k/33i0zZ08T/AHBG9xMkkquWKC6rGVl1ZtSqu5GerLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727997; c=relaxed/simple;
	bh=rtP39rCJDQ9qOD7qcfOYSTMsfU4y8Ra9l+LGF0SjZRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W7ILpSGY1zn6QkeFpDl2I1/mDka+2IBFQXKrjdFqmUBl4GeKxQcTY/paeLi3uXD6wA/u65kv3Fy+Fi03sq+O36jjhY4dIBlGUHdxCwffFFZrycIDAGmnxjz59KmRxtRYspwQW6oRbv/XxMCr1kzpSM9upe/sPKkmFw0aWYfCjGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CO2Ep2SD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVsB8bH6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CO2Ep2SD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVsB8bH6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RoH23124014
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6O0f6PGOaf1OINXzeSkWCK1XD8O69YuM1ACsjUOSlQ=; b=CO2Ep2SDo8ZSEGUS
	Y2IDPtVdfzDN1S15+GctFf5Tt5UjjWHmBl9mIdmdoK2Zq/SF0Gu2rKkplkxbi/EP
	jocS9ZgaLG20eOYN/CTWgOFtRhPsDekA8Ze51uX6j2diSz0YSOllVGCmZ20+CeZF
	iyUrk1AZbCJbxZjSMskuzlCn2zvNyZccdrg3c6brkDiswXfgY45h7yqru91WWRNG
	QQuERAN8STwfWBhPRAPGEzmeSSUDg88sP6J2HBFP7EMNweWTgJoIyGOoOLlr7bZs
	nP8t8FuYoivoM4fE4aPWDwsKnCNTh/XSLUnawvznDQqbHhDNXuzICdyurzUjZHQj
	2rAkXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9utjjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8b0a08d2so2666991cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727993; x=1788332793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6O0f6PGOaf1OINXzeSkWCK1XD8O69YuM1ACsjUOSlQ=;
        b=ZVsB8bH69dF+Vnhuh1HGVXc/XTO3kd5J+w5Za9ddy4n9XuhNsO5HUp+ajF1RJypXje
         UZ/tX/axCv08A2/9ok1UxG7Uz8cNANHDDq74VYPfbdDCZl6mmuvGvo358Zw/C/fP+bUa
         e7jxMsldfAqu/J+eRjz6OoKmujlPBXlF23zqXW7HZYHDP2gN7+QhmZkzOpL2D6NDTFCh
         VXA8IHohelkSwkUIno4VK/f4FGxYwn+AnDj16swNi+F9iU/dTj7nKUBtpsjoaVCluhFA
         XKFaoSm31wDOwuv65hUorovqQ8tCn7r14sLajrlMuNabVRmpA2QZI1RHUU+9+j4Smm0Q
         D3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727993; x=1788332793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6O0f6PGOaf1OINXzeSkWCK1XD8O69YuM1ACsjUOSlQ=;
        b=rFuLXKzYvtXS4jCiugy8vggpWC1zi7RWfLCa4+5b81dxK7lHJngnV0dydCYg+q6S+n
         K+blUmUI5KZXPtysNP6rB7OWdJ+ihcvdziYZEaegAC3Oz2C3/HyAoWheHmXR1NI60yr5
         DEFEMptIR2gaO36NGxorz+2ifrpy444FuKp9RLuXZTw2DoadB3HW/9q18lDsggMz4oYB
         KQiVnn0YWs0aQBwzRskwsm7vsG/I2jtyFOZmDcudGv8SekzDkt7pNRd6OEASQvnlGuvK
         nEV442c/ehguJ/OZIBGoGDPzHH2iXsCbmItEcCPb18HspyR9z5VO7ftLx0W/C8evN0vt
         CaKQ==
X-Gm-Message-State: AFuF++kJDrHUxCXK0gRsQjlcl6FQVEQljLglDDsdvrywnqiisDj5iKSk
	ykT2vsIeD4JfDg9AFNJr88CKWjIJogkPeTBZNIQf0gfkBBFGmAxZv3z4XRC+oM9ft/PWeivNony
	1YmDFL69e4BOXPfyKQfCQRtTRZssQ8/4xuWwIFT5qzu475GWjKFaAAyx00ze3P/uS
X-Gm-Gg: AR+sD11S2B7tnmSikjRBhpP37F2kXAEPshSDV9Y8Gp9QdpfDf6CW/owuaHQL53Df6g4
	G1D/B3Ty0iSMAz2+SDpizCtXNu8PJ6W51l9pmdHyc8iqxU+HAicsT8FJmayZXLszax5kR3tZs+S
	lPDXSaXa0G5G3U8C7aOPOblKRoHqz+FSFl4LPsuC5isBetqB1XZEXm7wYBU1zV/QVMBwSt+W3qi
	C66YUekh4YHj//k4J2Dg+/DgRgd1e10BDWzBdUnqhoxRYzmT/GwfmOfXx2okLJ37GaUJaTfsb33
	KKEpzMp5WZGUpWF9y4wg7UwN1LpPByJ9AyI1AYxCfpWJYAR0P0xhS9Yy6YLGErk00PP9+ky3x8Z
	bxjPoHpGGBAVISB8xguFvnqw=
X-Received: by 2002:ac8:7d14:0:b0:51c:e14:87a7 with SMTP id d75a77b69052e-52e4234e494mr42423851cf.28.1787727988036;
        Wed, 26 Aug 2026 00:06:28 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:51c:e14:87a7 with SMTP id d75a77b69052e-52e4234e494mr42423651cf.28.1787727987605;
        Wed, 26 Aug 2026 00:06:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:06:00 +0200
Subject: [PATCH v4 07/10] dtc: dt-check-style: Call
 _strip_strings_and_comments() only once
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v4-7-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3069;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rtP39rCJDQ9qOD7qcfOYSTMsfU4y8Ra9l+LGF0SjZRg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBe/TmCKhzRtOF5jAXTw6KXmGzmDIRC51yCf
 HbYgeP43V6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QXgAKCRDBN2bmhouD
 13IOEACM6bkJignydsi57XVf/ExX+KD3lyQ5uyKh7w06TQrlcvHC9pxOWT9Dz1Z8SYePPkMuiTV
 kbeC3O/fc3CqOdEwf2CCtZ0tlDNT5EybvkScOqvNJ7GcQM3SFoTq0K2n7Lhvv+ZJVH8VtFYgNoW
 LAvzzsEneCt1oasZcVsuFG2PxiC13u1dSADhV//s+elnzcgwY1dRLny3FRsU7c0Sg1mYENuKNKY
 lrSNF22B8heeKHqHEs1w8BxYGOhhP0pxKI4EKRBfip8D1v7sqv8q7f8A6Bil5Ij3cMOXd4XYaUB
 Wj+WCDVkqv1DpaHRWD0mEA6p3k7fwDuAPkCEVRR3oWg4K1wVvI4k4FxmXA1QJbeMa5wm+D0nJZR
 P8YwchlbI5Li5053R6rMgzu/Wgectk/vTBFD5oDy3irp/Md6Wm9KOfPMlHmc+YeSOWihyb/b+Jj
 +S8+dnSUyrBqGw4/doQ7SF64DBW3o9gwaakqgR5tgGHsu3HteaKkT3rVi0y4YxAJ7A0njfjcoR2
 tZNwJ1CuWfBp3HY3DOEMIi6VYtFvr4MqBfsaiGiZB8+1mHR60RjKOiYpCJbP3spoAOq1WZzTcEe
 FKt9i0a41dCbUF6vUVK/1kGRiia0S9LiWMlhO+T+h7/+dBhaic/7ze1TUnSHdhEgYFAQSN4/bk+
 orNMoMTpG6MjQZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 6CDDHD26RmLdKLOJanIkUc8tss5Y4tER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX2wk8j9B+/oAv
 Y9pg8YwCEXhsM/wqbjdTn0Y9qecW1z68v2P2v0dvai7pQojz8opVfeyNM67efBC1sS7NRm4NPkn
 vbCVmapbDnjZkbsN4Y+zBfbP3fgo0OQQOGykSjQ6EHkDSCynnXJJ9GBcE2wd8yM94TtylFA9xVB
 Dzoc+6kVBwbFHkN0pRD0wcAcqDJJ2ffv9wcfxgFgvqw4xqbMYxzN4+NQ13gWzMwPhO6VdXHcsPW
 PBg/FV1dg7S9RsZkg1cU1260PqqHN6+PG9PI2AH9FMMqScCgzsPPcMp6hm8snfJHqmD5DC0Y1fu
 jCuFaZjUZD7lPUdvCB4rQbXzatsnv4f1c3i9rTwurLN5iJUL5Yo+8YAxLFNriNFMK4LT61lFeXL
 FXTBw9B2t7/jtzIBjM6TW3mxt5IzuTcoYJwHftRg5CdN6VWw0xalhBSTyPvsCUfbq5qqcSbRwl2
 UGxdh+iLbgg9+4pWVQQ==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8e9079 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QeQVz4WU_SlHbdLaYJMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX8zLYSMO7aVg1
 73TM+jyjeAjQYRKFl0JQ5efcy0XOOPBzKb68+3CCRrZXO/tA9CJSC0p+dbuLRhEMZtLwnBoCTk9
 48qCI1ddTNozJQf+SOcxW12k5aSU5pA=
X-Proofpoint-ORIG-GUID: 6CDDHD26RmLdKLOJanIkUc8tss5Y4tER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260058

More than one rule evaluates pure code - stripped from comments and
indentation - thus store this pure code in DtsLine class for
better performance.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 5da3df25c3fc..dd3828b14638 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -79,18 +79,19 @@ def is_preprocessor(stripped):
 
 
 class DtsLine:
-    __slots__ = ('lineno', 'raw', 'linetype', 'indent_str', 'stripped', 'is_root',
+    __slots__ = ('lineno', 'raw', 'code', 'linetype', 'indent_str', 'stripped', 'is_root',
                  'prop_name', 'continuations',
                  'node_name', 'node_addr', 'label', 'ref_name', 'parent', 'depth',
                  'closures')
 
     def __init__(self, lineno, raw, linetype, depth, indent_str, stripped, is_root = False):
         self.lineno = lineno      # 1-based within the block
-        self.raw = raw
+        self.raw = raw            # Entire raw line
         self.linetype = linetype
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
-        self.stripped = stripped
+        self.stripped = stripped      # Code without indentation
+        self.code = _strip_strings_and_comments(stripped)    # Only the code, skipping trailing comments
         self.is_root = is_root
         self.prop_name = None
         self.continuations = []
@@ -811,8 +812,7 @@ def check_hex_case(ctx):
                            LineType.COMMENT_START, LineType.COMMENT_BODY,
                            LineType.COMMENT_END, LineType.PREPROCESSOR):
             continue
-        text = _strip_strings_and_comments(dl.raw)
-        for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', text):
+        for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', dl.code):
             lit = m.group(0)
             if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
                 yield (dl.lineno,
@@ -860,9 +860,9 @@ def check_value_whitespace(ctx):
     for dl in ctx.lines:
         if dl.linetype != LineType.PROPERTY:
             continue
-        segs = [_strip_strings_and_comments(dl.raw).strip()]
+        segs = [dl.code]
         for cont in dl.continuations:
-            segs.append(_strip_strings_and_comments(cont.stripped).strip())
+            segs.append(cont.code)
         text = ''
         for s in segs:
             if not s:
@@ -895,8 +895,7 @@ def check_node_close_alone(ctx):
                            LineType.COMMENT_START, LineType.COMMENT_BODY,
                            LineType.COMMENT_END, LineType.PREPROCESSOR):
             continue
-        text = _strip_strings_and_comments(dl.raw)
-        if '};' in text:
+        if '};' in dl.code:
             yield (dl.lineno,
                    'closing brace must be on its own line')
 

-- 
2.53.0

