Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A153E3DAB
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742990; cv=none; b=rzXoyv6a5fO3IB15ZP94Pg4+jXsUUOo9O8AoSanYNjSQHcm2SxonKZvuo56YipFKDHgkzpe20fOQ3zN/bYHScqYU5Azi/zy/7+oG+9bOpAGctbuaHaMR8SYSYMIrOL5IcCaU+wQz9XSBkrR+Si4IVj6bPPIjATdVGrUGRpEFs0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742990; c=relaxed/simple;
	bh=+eb0h22jivPbCiyNZVJ/SonWgPLlpoFK7nMKA9Ib+ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JguUtmEZWDpD3tk0IlnIO56bHFRmzOIXlF55lPQHLz85bqkJL5MfIdUbKdXyfYeU4tfv6hGLclvn0agXmWrBubNIXwmah/wAamsQgf0xUd0rBbMg4k1dUFHVJK+MoR8SP9pqEGr7Vv2db9Im+1ug7tTbLjep1zofVY0kpxXxgqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=El1Mltsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIHF1bX6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="El1Mltsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIHF1bX6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGpGu107574
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M5ET4VH5qnmWPvY4Kn6EAmWGAJ2lzFw/g2+/xxP1MPU=; b=El1Mltsg+c/+Q9lv
	GjEMDhgpN+cb8qu7qahHbxvlLiYcCf9M2pauaJIJDuQEc5TotB7DXm2w59B35l4W
	xXF+gzmB/9FPTYVfIQ3qFEgCzbz9UeAuPaulwNv+IxuNBxEdlZM71mdG0Ruv4jRI
	fyLcrWb0cLxZmIDG0Z+MYsv3HzRam/0PphHEjicNCWKXXtWVD5co/h84MQaKR3KC
	aeClSsXE8lywGz3mEU00FrmFguQ0lpqHJBfKpkJ+oNPefx84pTrfpmnP1+MCKOwD
	qAVvpT5bqE4T+vV//m8O29vJyc2qUEYNDCmf/36KqGo31k9DMMp6EOrsiOKwDY6u
	BaH4WA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g9hjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so11467431cf.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742981; x=1788347781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5ET4VH5qnmWPvY4Kn6EAmWGAJ2lzFw/g2+/xxP1MPU=;
        b=aIHF1bX6HBWVbxPPf1Zn4deb910/lsXYm9i0/ADVHzb48hVnZZ62WyUo0RC7UxruLt
         CBi7fckV599bytk/h9I6svfty7fxpn9Ggt0Gs2pIsnm8tr3ANZi01LdcDCSJrVtAczJo
         lyRyyOb/XIPowCtBx+vbSbVNLTN009sAeyZPoktIjEBW7Z1fWS7N4kUlmE1XXAwVkCWC
         tD9Im8JuOen+X0FU5oUMR5Egu4LSHD9oXGGrymDsssDc7eSjkdqRZZrdbUJvQeX1VFCr
         PpmNe/8zKQNrcMIJwJWQ+uIoR/xYHjcl5Wq16CJ8D4zRUfGe7/MtNxc93tDBpfFwsxDn
         Wxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742981; x=1788347781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5ET4VH5qnmWPvY4Kn6EAmWGAJ2lzFw/g2+/xxP1MPU=;
        b=TQs5k52phuGSnel2jEpw84jJj/tw5b/uBnMZXruTkega7UJ0Ev/Xpu+KLV5fCQ0iiI
         KWUsAoqpFeZ7Kri3eB7yCsWp8FNF1WdBOs8ngeFfmqFGOK5NbTzDY71bXUcVTAMo5dy/
         m6448WnMw+E8qn2wDrqQi8kIot5+9vzg0IKF6Qr+4X35/8OqP9faQQ+ZIBM6MJKxpTJX
         20LZgelluLTuY2OGNR9Aox4Mxwsjvg/i8bGCq9QgBCAC5yK2BtB/Tm+38O2FjUAW2/qt
         A9x4ZYCTWTbqQA4DtmsCA8b1jABJpIYAF5u/24tLqD1Z6V5fn2TASlSw4q7TxE92ARfO
         zvDg==
X-Gm-Message-State: AFuF++lL+973+gCU6faudCAbqdB0DYefHUVH/4X3b71QIsfPiz6+wr+w
	yr7C8OWA/Z3Tfsax+SikGNIeIO8JhcQbdSsLKImorVsy65iEloxCajfetD1JU5blqSR1NyBFooQ
	uQvczj/yXlUrZK0DqIg/tL9xNPFGoRCdWzA/jU70jqlKL/F2kye6Ok74B14h7ZX9n
X-Gm-Gg: AR+sD12QOAFhQfFdxywtIdmo/1beG0Ja7Pd6n18xSU7pMfDNsmVWVY0zTLg8WYsvqll
	HZz2uSN3KaCu4ba3hooSwerzkhbyEZPsNu+nce6Wfw1+i2yVOW827KGEYW0vtuIg8A5RsSve/NZ
	vkz/RJgwUyN8mJwnTemxZ8FvaqHbP3N5Zsqf7GRRGsnvIqAuVj4N3+Ef5ed1IsZP55dPiiyPIua
	XCoHedYUu2Yn3i8CgFE3trJP/66pZYWj2BwM5jrCt7ZasvGqe/szxqeMxgJ+dCtwikfBLNar+3/
	UGSAGJ6CyYnVqEpkV8s8kIoYJsr2KaalPY/8iZRd6CM4ixO0FYem8y870P8WwphZeRntyGbxf/r
	oY5iS0a3J0TvumjrYGyoTTjM=
X-Received: by 2002:a05:622a:550:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52e42323355mr56371301cf.26.1787742980455;
        Wed, 26 Aug 2026 04:16:20 -0700 (PDT)
X-Received: by 2002:a05:622a:550:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52e42323355mr56370551cf.26.1787742979994;
        Wed, 26 Aug 2026 04:16:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:15:59 +0200
Subject: [PATCH v6 07/10] dtc: dt-check-style: Call
 _strip_strings_and_comments() only once
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v6-7-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+eb0h22jivPbCiyNZVJ/SonWgPLlpoFK7nMKA9Ib+ag=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsry1F2dlr4RW+XU0zb3A06qO3hoPhOxBAjKg
 JIMjNKnuGSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K8gAKCRDBN2bmhouD
 14zJD/9BNdmxutTyf467F7+Vv5C5SPSghxXFVuZ5F2Zs8mv6LO2MMfXR6PYgA1sMnQjio6QMpHa
 eP0LaixY3ryEc2oDpoxSdYlSh8ULI+GwbGvyFLAJUhQqzmCkGYN7nLRZs26fxpBT1Q2QNHqfvLF
 tdQU4yb6iXMsU1wKVFn557xizQ+R2HUJJlrqXPS6xoeNmTCRPhlSBWnYHEdz66uLBxJmgAl/CAr
 OPTPzj4htJDVrxNHypplvbuKUwm2RMnhDuewJu1jOtHKNXzi6FQkhYq+0MGwWUpfwX0giRr+ieu
 jhl07YsW90zwaZwFNKjH5rZDXroKDaKIqYKxZGLSgYmbpwAOfpRZiExEpbY0KEjbj7pDetttR6S
 09Dcq9ygKtsvw4Bq567ytzNxTOyHIpasn4MsC1foqVaPLjP/Ql6jJBChAprMQGfcjhH5AUQKGx/
 w1U4oJGhVENCY7Bxll/xR9A+ZEuuyFBcBcavfE5GuAx6CJx2qUP0J4UsQ00cCwJe2kp9/0cdZ1f
 33c7M0yDH6YhbK/NXzbbezEKRbsgZfEnlunn1KPkZShmYl81wX2KBus3EkfWceZMz0XzK1iOjGE
 SNU51pZ8udfWKfM6p8brXwvafHU9hq28P7EvtvQ2WN40BIEWNpgWN4mrXYeqCezT8TH+GFkCuUu
 FjWsLX4CfOyexdg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: TkbQsAnMBfxGAXPZIJWaSLEla0hzviFY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NCBTYWx0ZWRfX2xqmlEFjcm4J
 +lBKZD5CSvYQbF9D6C6qYna6lULtJKXu+1Zm2PzM4O5SN/2mXi4uF4XCI4MO2PuMHK3glWK29vt
 +gh+bpw0ie4saBVXMIRClms6HH3D18B89VBG9CF1ZFB6xRI5NBQVo2JoM5elRQsQm3TBeJiZ2eD
 fv/HaXWJjoTvbF+g+4qfg825o4nvfBE6VwthtbsrSyLlMUbfNLQzbDLs18Bqk5NUhKr6KPmH7Bf
 6e0HHd1JU1gZxBRGC4vdjJj/imAqxDQ05SOkBayKA9g+23XrKWpqlSKZaFusBa2NspqS2eBsqhe
 dOaSEVGEayLwt7YrWuzyRQ+NJPGLrvIMRrtJwW37fwAefdoHaZAD2H31IOSK3AXTQr5x/0J9TJm
 ID0UNFyNher1e9KFHoL+nJVd2uDoo6EGdpd/GT4ELQY973+hrTZ+7GS2qgxfmIjJxnInFq+80FK
 lvrERSvGdPZuCL2SStg==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ecb05 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=w4kPxWdgdsGoh0WTy7oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NCBTYWx0ZWRfX8D4mqQiRnzzS
 b73asH7DjOcNtgCX8ruJVPVlyjfwcF95qFhUG4ETcKaXfDxEWgSZ3sgIRGz2XKr09kTiw3B7cid
 gWxwiV63+0dL2UhgY3vkhZ63yUczGY4=
X-Proofpoint-ORIG-GUID: TkbQsAnMBfxGAXPZIJWaSLEla0hzviFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260094

More than one rule evaluates pure code - stripped from comments and
indentation - thus store this pure code in DtsLine class for
better performance.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index b71e6bf815a7..43069fc1fac9 100755
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
+        segs = [dl.code.strip()]
         for cont in dl.continuations:
-            segs.append(_strip_strings_and_comments(cont.stripped).strip())
+            segs.append(cont.code.strip())
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

