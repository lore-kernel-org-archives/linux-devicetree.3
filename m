Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F7638F259
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660349; cv=none; b=Ucp2EQLQo5KsBPWDfFX2oq4QeAPEDbxUu2gw7p+ywuBZiBvCWYrnThk9HBgDWUXX7Mi3r/bXTHpMGQKt2xDc4MhykWfXoVwxCcnibnxM65w/LFOorzkVXYcZLs830ceypISgF4m34xq6g55E9oOU3D2TrbQBgdW2t7WrtOa78Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660349; c=relaxed/simple;
	bh=LjkbmCe6vn81FFu+ZMtn1oaw7c6HMT27qU1FnMtVjvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tI2GymM5vjj7OO6DBOdjrcMgPjlLESAXDwf9z6wE6d4Ys5EgulFRdPdg0cYgOhcUIjSlW7TzSDLVcRmArXb+ba4zJTSYrgLn6sAds94qw7+cn6k3d0Mkp2as7ckwg91SZ0lroyOw+6NhIM5pOU579+RUrU9aMvXAK4NiJCDkf/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RN+M2ixs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSCTczFK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN+M2ixs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSCTczFK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727ll6P915754
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnX+Bhb9Lb7raNVA3JPHSL8HRf4LFQTpLNpp44RNZTM=; b=RN+M2ixsnzx893o+
	BZ7wXZw0Q5oE/Ga074srUFzOr38MqKKRPcK1fu92eCYc1uWlFhasS3Nv0am4I0GE
	glhCGyMs2sorWIfG7QhdMeqFNZYuT+ev2RgDeqPOMC2NFbRx8VOD0krsO/2QGb6W
	p9LDLidZndwjL38o+keKGKfSUDuBtdTVsfzDrkbhtv23Jzt6dG1BPDEmOfOTESE0
	T09xR1SUYsxTcjvSITVu87lZhn3zu/9fPwwCn6IAw1O8vIKVssz9mr0yWR8JxCGI
	AHXfHPLuWtctUL/rx8fMYLumYoEYqgwDceH5HD3uzjDsV7lsmWavnB/b60PsqkmM
	e3SBsw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs966aft9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:45:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso50060806d6.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660346; x=1786265146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnX+Bhb9Lb7raNVA3JPHSL8HRf4LFQTpLNpp44RNZTM=;
        b=FSCTczFKQpGRTxZAAismvc+oosPjCXDNLQk3F5F6fnVAxER5U89XKc4Oc3U+YsRiIa
         zywYtTxS8cFXq5Qn3DUSXyiwEIcTnsLIVONF4Mr4UmpyjAG3LNS38qsgpMoNSGuI4NLa
         /5se14XXOJWfLlf/Ln3el8+dUvbwexI+569W+JlxktKFlyUZ+brX26QRZDs0+gxQCJi4
         ZJbfR1hdmcjV3+L72zNZPk8tx486Uufy2grKCBTdBKxGEzCyiE7NpZQB4itZfiRQgHCN
         fB592gWDC8gafXVjNJboNWJkrIBYFOlQ80I31HX7yvBQy+ULQzwnZJHx5heUNA01rhWY
         XlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660346; x=1786265146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnX+Bhb9Lb7raNVA3JPHSL8HRf4LFQTpLNpp44RNZTM=;
        b=FZt3RrsK78+dnihlW+C2/1811Nl4e05/xqURAaUPIM1IHtDgkRU6XOFpYAgsYQXJ4Y
         wbA2LS2pVhoZsL2sWVJr6etaiEsle8wn2PQA0wBDpqLFcWWPBsZY/9QepubYZOESKESS
         dSrABIGVe3qk9QY6yLZN1gYOHh4Yab+4lLzmi1n5NRVfUF/162XkviemOMczVRPRmkzZ
         I+OGOV3Q8udqFdc+xQso3NL5I6zD1Ti0ZHkAZut7ZALzFhO59ufdkF/uTr/DcUgOTncA
         /BMnlF0kD7umM1e9SOqj5ge6wMHBN1j5qz+A413dzNxjMGdohfeBiICyv/Llwr/mGwFc
         b3kw==
X-Gm-Message-State: AOJu0YwqwmLl6mUtIgTub+/61EQ4LroTQ8dNT1fCcjA+B3LiWDXpoKv3
	oLr0qDlfH2wSgVNXRBAZO/KWKucR9I6VnyPBl3vf7xSAbMuQB2w6L99V6Ja9RBMQk+waOkHoDQw
	PNGy9N3jHxtoMdoLz1JZ80z56bfQB5qs0PKMMj2NlRZPGB2CaU6AX9IftEeTmRIdT
X-Gm-Gg: AR+sD13TIIH4iSdo0w9Ct9bCs8x67PDP1yj3sHnVXfGkLTeSsyrOQqsUJLnQxOCMxOO
	jXHRaG/YJ9cb0MTyZpF0e3w2hy4Th5En24n/igEKPJscsP10kZfNsibwkm+Z6iH33FBIYCfNOSV
	kkAOAma2HBI8M9YnvdxfAmYgPBMkm58yiBeqqFslD683mE7j43/vjTwYnROj2fyNIALYyZlCtlz
	yY9YpGkAhC9GTzrjn77iGa0sY9qsCNpZn1TcI1ysR79wa4Fwj2yGGzi5IWnqAuTtPNB2BdnG27s
	Nw673alkWA8ONexvdcpBLxe4hWvfn631AXn/+u3yc+GRpkra/Eiw3fRQYaprFBN3McMgtoYbzi8
	t6KEhuvJQhyMkafC/odzSbPsy
X-Received: by 2002:a05:622a:1f95:b0:528:3142:d466 with SMTP id d75a77b69052e-52b567cdee3mr116610091cf.41.1785660346446;
        Sun, 02 Aug 2026 01:45:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1f95:b0:528:3142:d466 with SMTP id d75a77b69052e-52b567cdee3mr116609911cf.41.1785660346066;
        Sun, 02 Aug 2026 01:45:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:45:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:24 +0200
Subject: [PATCH v2 02/11] dtc: dt-check-style: Simplify setting depth of
 DtsLine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-2-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5042;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LjkbmCe6vn81FFu+ZMtn1oaw7c6HMT27qU1FnMtVjvE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOr+xMGJHJD8LHj5ZskrB4xdfmm7l4v8kI2A
 /s4tN8Z6qqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DqwAKCRDBN2bmhouD
 13ZrEACREmeEmZuuA2LeEluiracxhINn/TSx0C9uzub5udvEmZR3UTVGVUoGMFlOG7pU+Sve580
 odCpWfCybB4KMvFnD6KlG6gomNLDXJLxONzNEHUoYIrue8+2nHT0ju/lo1vapBcWeaBSvj2LDS9
 drv1gUCryV7CbzrowqYS+Vub1cCFlDH3D6PBHTtPsnN0LEsOco8GPp9mQaKnuo/2Tt9YDoGqwE6
 6sIYog8o6qas8iUhmB7Xe7TXnRCv0bfzokyYboTpEeO+i4Qk/0j87TVBe8b5vknfDSt9jEHthu1
 j6Mt5oqFPlAjz3LdHbb6qo58P3CkG76i6FzY81noDQEpT/R80BZMXmYA6dixn5vTPS37mHGJSqU
 Juue42Y7gjprbXJjFS9boD7UsNHyijAYj8S/rqHPQtQdIePoT8mucW0NWouxZw+cjTVtnViY2b5
 soZL30GZ/wioEsOMVookzyYVbkon2mLMBEspW1ygR/S4i9/e1j+/Txo7HbHxVEgDTjpIPo+7BY8
 WHwoHh1y/hLfadw7i0d4SfZsDtUpUPCYm43iIrMzEDQcPgcMuiXEvzPUJJ1DlsRYGS5cvfC10YR
 kX2KL3GY08KMBr6ZJuvh2Set5zTK2fRnY/A221VMcw5aoh7Xy8zdQ0fFNUyx6IS7/WX2bWa0H8s
 WgKu/V1z/r0GkAQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 8K6SoS441ErW-CbHv48LtdPKpFVLR1Gw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX29DuEFZhsYIL
 RzkGzUjNkPZtmI04TKccCz87O/4OmwYSZ4UecfF0Vhim3pXfJJnZkPbPTFv5z6nuZoyADxezC+S
 jUYsRaskHfnGVRTFxg9DdM77Ne7bQ4B9nFT6eH1qZBgSONjkXoYPTpR6BIEMLKNe9hODxFW3oop
 RUWKbSGoxGzGRbyz7xNfgtiXN7Z08CrbGoQroOooc6PDwLelhBR+In0Y1cdbhMOwzbotZV+k+/t
 Ys+qE+/7p7XeEAcFSBi0c6OCDERtnKrRzE/bLGGw2gaC8YDmheGOU11BNF7V8Mhp6iXYLEJi1JX
 NQ5z7jn/xtjc0YxWWpZvCu7RqlazanLpeqziHtFhJD1kIH4ggDqLM0/ADX4EgizP0NIbHwA5y21
 ZuFGiuRWkywvJEIgOeX9/afTapXR06uVkEqQDBHw/4R6LDOnCx6WICjYIw36T/xnWHzzgr8fV0b
 W0dUOdDpf6EIoW2UsFA==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6f03bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8sziXlxsN6MBhN6jAs0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 8K6SoS441ErW-CbHv48LtdPKpFVLR1Gw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX96sB3BHda8Nt
 tcOFav9LwvJmoEIpqanT9xVk5LvcfhzFsTEWLFBagQssvbggyx4F134p4FbVIIS2UxjdLjB+HqV
 s7qFI6HZNUV3ghdd8Ptrp8UUhu3wuZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020072

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

