Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E12247A860
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942969; cv=none; b=Sg/RYa87S+lncld06AfV9jZFeVO91sYliudLSy78b/G0+wxQMRD2H2fXvljw9PsxKUKH6G/hdBqlUaFmgW7UxAmzfRHDQHZHU8R3XVfEev5siQlAc+ubxEtNyhWqEnKSMuqmRFiQKHA9OMyJ8GhzqM5uNEskalBLIedmXs9GmaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942969; c=relaxed/simple;
	bh=7lpkyblVXFRJvW4/uj7BYSCP9fs7ua9tALdDgwCU3XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1yG4G3ftUPy57SSvTrumi7dxGOdQW8EP0WCzHd+R4/AW9DZr2jLlcPiI5hGDTd3Hyci1jhBjL4zsEvogkSqtnlfZ+F50up9goRv1Fwrze7a8zy1cEC3kPVzJDIcRrBB6KyIA1J/rVUwmaZqDB3JrRpCslffhgdBXnedfiHdirw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJK6cWtZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iczNBR7e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJK6cWtZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iczNBR7e"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896JM4u1274417
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 08:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QXZHWAJDo5q95UrPYw6QXLGKZ8eqcpYLyi7q1UPoimU=; b=nJK6cWtZncSJ1zrj
	lcK8CVvbFfyvno1UfiIeFULKmPDEFa76anYM+ZwIXTEXWH+oa9hdwBEe9b59OAXK
	XIEW9nGetVwMJp3E/OGcj4nsy/Xj69jqMW5nHOvnCOQm2fvhZVk5AZo+xEXFCOf0
	3JwBDGA5av86/2aOoaMH4wauBrgYgXmBttBOoTT1j7xqK/8Y74WXOeTL1+sBwwTV
	gOsoT1HL+ley+v8DTa1I5ua3Jhhw0seW/wfoQF/8W5gG8xpw1QpgKg/wXCfHRst+
	BDATAgKss58ZXYLLdxMhZlNdQtQHonDHEF4vEsNc3IzeRGAIYvAiMBWEYGHK6ptn
	oLKo3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw357q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:36:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9382f9430deso942641385a.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942965; x=1789547765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXZHWAJDo5q95UrPYw6QXLGKZ8eqcpYLyi7q1UPoimU=;
        b=iczNBR7ejZHAuaRhYTndm/O+6cbLXfX8bAwyyNoLBVCY52krI0cI0SDbGT8MOZFjU4
         aB7y+O92u+9WkxvCalwudymvU+EDT+S8IjmGovqIs1c0q2RbEFHCzDjhggodpkUhZJVL
         B6115wdQBK3B+3Rr+0jsAXW+XSVKls7JrIxTSNYmxZ7KRb0q7F6VHSvUAPp8zexYndXg
         3x7c8/tde7KTsRMDl879zHid+w+jfgWlp1ouOZ0hlggH6AOZMwl1yVIjp4RynnIf48U3
         ZOGRFTF/UYlaWlirrwhfzYkg6PIINSx7vq8UPm9IFDfSftHNg/VO21VzeCsZWpgyNmaD
         p7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942965; x=1789547765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXZHWAJDo5q95UrPYw6QXLGKZ8eqcpYLyi7q1UPoimU=;
        b=J889QBrjb/gGWHYwyLZRIsa5vVafsYx6W0Uzsb0JUkz2saY3GNETTcrxl+3G/y343y
         gaqkhOhBWSJfCe2sTFMlbvEmD1IdqZAdoWQ2umbAc5pYQ4lVlOeCG6048ofombw04eRw
         /GVJIlkEkGAEmtfD7p9LbDxgSIBdL1RKi1KyVvnQvqG/oDdbHuX6/B4z/pJfvS7mYxwa
         DXe+q+wcjML/b0I8PNhy5PBUPt/NkRjRqFLeBSVnyrwiFX+pzfUh+OwFSuizuS2PhkEJ
         m9K73t+voWshyJxbqbLlBsJhnByMsF3J1cT0cn5C0mBR5bz6TUN0VY6FPWIgn8JUJkeH
         G+mg==
X-Gm-Message-State: AFuF++kMoovSNgO+MIVaRujHL/4q2/aQVKRVHP1oY20TqOZkKpIKBNF9
	bPagC1ExUOl4QhVOd8NxsYp7l1XV1P6e2h6B1qQRyPt3VjsXOmA81q0XmmDj89BaiVdCinJyiD/
	mgqayVN6BX6lxnX1ENOIOcSh4J30aSJ8NW/7GnrhNXAdO1Sc1svc1wYYR2DSnIAnC
X-Gm-Gg: AYBFou2Y4+Yqb1gy6mVZXVaNMXSBjcjvqISAPbO9oYFdLTEIlUUYxVtmi8BdU4fFBYd
	nB08KEnfLnNTO6fyJ12VUKptJxfZc4NYR5LYJuWho3qkLMZuTuM61wdavXQVMa8tB9SLDO0afBZ
	RgX7AsEAqZNCdaJ4DAehJk4uVSqmeaACusOb8OUVKC3ACKxBa5iQUZO2QhY3e4PvwxURUdFA7e9
	d3jd+JUkcFHK54t+iz/oPzFdqM+XZwYtQkBVYdDZflne6plg/0/bXxYNjdb22GxMYJ/wiMrffzB
	uepSpq0onjTzl/iqOBfh5pwpmliNJerJO4zJgfspjP5K66uwC4AvrdJgyPZCSJdRecatzH3ANgk
	l50YLRXhrzCfYUlc9i4wpXUc=
X-Received: by 2002:a05:620a:d8b:b0:939:9e33:6a63 with SMTP id af79cd13be357-9399e33a8fbmr2737743485a.45.1788942965338;
        Wed, 09 Sep 2026 01:36:05 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:939:9e33:6a63 with SMTP id af79cd13be357-9399e33a8fbmr2737739985a.45.1788942964943;
        Wed, 09 Sep 2026 01:36:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm43210269f8f.34.2026.09.09.01.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:36:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:35:47 +0200
Subject: [PATCH v2 4/6] dtc: dt-check-style: Unduplicate checks in
 check_mixed_indent_chars()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v2-4-c5cb4c9d9b66@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7lpkyblVXFRJvW4/uj7BYSCP9fs7ua9tALdDgwCU3XY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoRpo+bO2K5XvBJowQZjjUU2EC/K++SyGPlZnl
 rt5ANppDxiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqEaaAAKCRDBN2bmhouD
 1wlMD/9emqfZ1088gJoh/dhPQ2xD2C+9Fk2DkB+i1FsnignTsGbJIIUSEd915OshUg6XWbb+4hO
 2hgTi6AIqiSFBjFhkAKz/Vc+HRF1WmJpLTcskEe2UyiQgV/PmahPWZzOerMG9xrOHKSHwJfFy4C
 zc3n347etS/0kjAck1drVbPhyRzp2Uh61TEoYYst71j4I3Uw8yvXb7Lg5ZK7q66kVvAYn3rre60
 +Hp9IaGYsF/4EG4VS7RMzVqd0bwp86EeJdcEcjiYvQeXtFla1BKZbonGAEr2zsjtQupYFaqDJKn
 FLyI7YBVkbYPzc2ubrZKK7HqKCxV+kNvxAyFC9kKlGLVRz66RLsL4F1gJeh6ALCUbl5yQbVEL7D
 zIMlmdZHJc3UjkL+OjN6a0/P6tA4JS/hUeEDK6cZkVklDIj6+2X0mJim8FqxTvNeSNckU9l7iu0
 /fAUb3fl9Fpvk5a8d4aP21YAlpZam/FPsMQp3lz5nwErNgdzV7tyj037VQwZMiOWb/AxOlCiUZN
 30NSXWb7siTPDw3eUoVuKalfazn4/OCYy8U4vapFbifPG5pFqXOarf99V6sxHCPGm2GwRplBujy
 m9+ICPv6wwY9GNi3vsZcffhDXKVnvWjkn2oduY9BjQVOl5qttS6cRQs+bgHbGuIjUmiVQc6jD1j
 3lPXAR7qaeyMloQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: xRLbbd2-_aQsZDFX0TWDwol4h6_pJGxN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX06CADdq6mYmP
 Trjtv9wKX9InnQTdfo0v8Nn9wp9HzRig8qURAU2QVj97f3pjgAtgizGe4rHbn3eAYHIKNVVg04x
 gAPslEldmZem3csZSwFdzCtwC1ztsZc=
X-Proofpoint-GUID: xRLbbd2-_aQsZDFX0TWDwol4h6_pJGxN
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa11a76 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZNCJMhPrvMW_IMsXWMMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX8N2c2ZVYLtcI
 sKcuOCCQZ3PUELGxHb4UoGLkg3xls6bo0xpiNtHQcdk0rwzlZMWsB2oweXcYBOjaE3UIA09Oe3E
 bVAjzQlkQp/Ow5uvjHaRRT8HsE+epGBh1Y5pHpDqCGMHsHODBjMd7qeDLQqOjhg0xQ4DF9GwWZb
 U0IjvYp24OnIyFVAWTEGHXkebX+IGDcS1kT19Zv/r4rvi/DUEtPIdZCs4jy1Z3wGtJ7GKF8Eo71
 JEQ5G6cBD+fr2coy9PTFd95B/iPZeZ6mWfyQmJnDpcIK4M3dfax3UyAckVmjxUl5nUt3VjBi5kO
 zlqBPElQ6+goYlX2zkqSClpVnlbpNvfB6FhasBRZN1E+N6nTNBB38iCyob0OJo/2SXVvwnmZcrJ
 N4KfJiqYDO3PObNXTUH33tfDILetZZWiHNZCZnT9BPlkQuxMJ+Lt0F6kGL625U/R5MQyyUhrMWF
 QD5aDcvrPYXamcig2Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

Code checking each DtsLine and continuations is the same, so split it to
separate function to avoid duplicated code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 3694b0b1ebb6..2ff9fdc50367 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -645,27 +645,24 @@ def check_line_length(ctx):
             yield from _check_line_length(cont)
 
 
+def _check_mixed_indent_chars(dl):
+    if not dl.indent_str:
+        return
+    if dl.linetype == LineType.PREPROCESSOR:
+        return
+    if re.search(r' \t', dl.indent_str):
+        yield (dl.lineno, 'mixed tabs and spaces in indent')
+    if dl.indent_str.count(' ') > 7:
+        yield (dl.lineno, 'too many space characters in indent (more than 7)')
+
+
 def check_mixed_indent_chars(ctx):
     """Indent must be all-tabs, except for aligning indentation (comments
     or continued lines)."""
     for dl in ctx.lines:
-        if not dl.indent_str:
-            continue
-        if dl.linetype == LineType.PREPROCESSOR:
-            continue
-        if re.search(r' \t', dl.indent_str):
-            yield (dl.lineno, 'mixed tabs and spaces in indent')
-        if dl.indent_str.count(' ') > 7:
-            yield (dl.lineno, 'too many space characters in indent (more than 7)')
+        yield from _check_mixed_indent_chars(dl)
         for cont in dl.continuations:
-            if not cont.indent_str:
-                continue
-            if cont.linetype == LineType.PREPROCESSOR:
-                continue
-            if re.search(r' \t', cont.indent_str):
-                yield (cont.lineno, 'mixed tabs and spaces in indent')
-            if cont.indent_str.count(' ') > 7:
-                yield (cont.lineno, 'too many space characters in indent (more than 7)')
+            yield from _check_mixed_indent_chars(cont)
 
 
 def check_node_close_alone(ctx):

-- 
2.53.0

