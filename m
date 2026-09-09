Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13325456293
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942964; cv=none; b=KoL1jdb0PeXKGyaCEYaWrLcZsPnTKxs1S3VGCFout1inV9GeHYKBqy/pCq2yqsbH6JkEMB0kmO6vhbPzAeJ2kCGsMluXLGs7k7Vvcp0UGEWvHnpfhllnYc/naVm2C1x0BimA7sdQv73SRk/S4yYv4zsa+dE1rqp+Cxig0n2Y7OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942964; c=relaxed/simple;
	bh=RpsFWGOJ/fmrFBjXtNLPVOkO7viH6czPpMx9xQdFNUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4DIihwbdPALQ8y0bKobQWqb41j+DjTtbnnW5XD00esxKikfrHshO/Z1TZmNgcp8Eyl5HAZrigQ+DlayZhrusX4IaNqPCWlGmUdIrif9PDe61bKpC4YagWlJwfAY9+jrgl++0yaZ4y5XMpjxFS/8Y/hpeaEfCR1HC8P2cgXwyhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtwqYvGt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQsTJplm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtwqYvGt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQsTJplm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893ox6Q3771173
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 08:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOiYjCn1nD7fLf7vrzvPOq3oVs5fH9mikkYiajsOtfs=; b=JtwqYvGteBBlCoHd
	Q19JF+O2q0h0PUl1vXChPHh19lw5c0PC8rLBHal6gny4IgFcyZNxsGryBIpl7E0T
	oASjHV74BQLB+/ShHnOQk5/zOfKAp3VQ/YB9yhO9AoX5LzxeWaeUID5PGyNtGnCg
	Xna9mV7iReCoNs/SB0ABTkgWbWMZuGbH6b54E25p4FXRSN8MjUPVMmNbYN3w65P8
	F293h/m4uq/eyv06Fpw+0qlHdUeqpbvQ8OwtSFEGNIO2V0eURam7AzLvaT/wllYh
	fZESAEwo4gr2QWUnGdh9q6HV8pCZvG96jR/DrCG7fg9Zs76LfEqflrVLEYPeGp2n
	9ZICKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr122f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:36:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so921593585a.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942961; x=1789547761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOiYjCn1nD7fLf7vrzvPOq3oVs5fH9mikkYiajsOtfs=;
        b=NQsTJplms2lrRMlcpO2Zs/KBp7lxIpxm86UG6Km+d4l0BU8ME1LpuYyJwEUW2mnhE4
         oQovHScUts2GoBXpz9ZhDz45IFT0/eaRewrKiv+uiSQtsF3tUwyc3hSfp9naP5f/Ww35
         l2sfTKnfqEPQBQaHAFy/cTHnc9uadDjAmjiP27ryRVJwj5XSFkaZJYU/ibUUvfShCxE8
         AseH4yiGS9lFfp+0jY4BVA9lpGuRZ2BLzA45xqTFVpVmvHkeuVZX2D7vIE+VZBPyBVgA
         rXp/7Yw+i3Q3OHQ6uCMflPCTEsi7hzWcwVFiL4rlwpCQ7haArYFfTgge8G6vcHMK1T+C
         /J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942961; x=1789547761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOiYjCn1nD7fLf7vrzvPOq3oVs5fH9mikkYiajsOtfs=;
        b=YDRwGMavdeMEW1gwzAIPrQCLF9hwmZez7jhiqDG7AVRyG+YiPZan08d2MMpF+BQ6da
         j8XL1qa3sei2jdqgfkywxAwpOZr/LwJ0YBTEzsL9tMnoJ+U+N1Q0VzDOMS18vk3f4X2f
         v25OxsABo+9tLbyl7JiqKQCZpjyiyF++z1X98qdGRpFxUCmPw+/vSeuca6gN0P1Eb+Zp
         t11zfcbsoCphZ2aBIQh3wzD8sR6gVb9bcHMwCQsEmTJI4cpaJwlPoScv+kJi0zQj2kFn
         W3+ipjPw2L5KZEpe57YpmeugugQQisojAkax+F55VBdfuzi/lhO68eWL1BakenFmEBoB
         vptA==
X-Gm-Message-State: AFuF++m9UELwHs8YzrsXq5+HiC13XZPTvDYq2n2Qiv4hU9HVE4fLoNpw
	nLLvwDkBtf49uLCG1CofLJK/fVEPFXqqcbzZqWJqZReb7laDkysr9nRjgumoVC3IrHyJaFEU7JZ
	GTPUszmfegRHwu5473KXFEr+cm8XIsVhJU3+uMCsFGTkskHocWs5cRYC615aHi9kz
X-Gm-Gg: AYBFou0wnm5fDEOzYK8Ryt9z7Ca841N4Hih+7w5WH0zDoGwICJJeepU4OtWMrZu/Cjv
	xL7XdDL8YZrN0ouEdsDNci9rHBW714rcIux9SqtGNGGc/EpvPcs/XDdFGXLQTHxhUpqsRA+8djo
	G4PpTjY/Jy8Ke74wD5H9LWfP/4zDUHVoQuwWx420+/YOF4VikVXMgBOWJNwlrujGD6bkUjQkLks
	vRU+ucHlmPVatJZjzmJfh/SPE07SYEGYYRMBR5mbXzKGFdH9uwOnUy2TYsEx6gc79KiFf8rgy/D
	3R1Q0rnB9SOx4OlS68b8+40aE36yTiRDQcjeOYFiNgmElTQuyMJOT9nhA95Rt6L//w9188ePApz
	oG95NXSlQibbwcKNoWAhzx+E=
X-Received: by 2002:a05:620a:6015:b0:939:7cca:ed30 with SMTP id af79cd13be357-9397ccafdd2mr2772149985a.45.1788942961234;
        Wed, 09 Sep 2026 01:36:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6015:b0:939:7cca:ed30 with SMTP id af79cd13be357-9397ccafdd2mr2772139685a.45.1788942959154;
        Wed, 09 Sep 2026 01:35:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm43210269f8f.34.2026.09.09.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:35:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:35:44 +0200
Subject: [PATCH v2 1/6] dtc: dt-check-style: Handle continued lines in
 check_hex_case()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v2-1-c5cb4c9d9b66@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3317;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RpsFWGOJ/fmrFBjXtNLPVOkO7viH6czPpMx9xQdFNUs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoRpmhPHdIrvukJy+Dz0gqu+ohDhxPjGperCVF
 J+WBZ4DL4SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqEaZgAKCRDBN2bmhouD
 1wztD/9Wq1/D0IBgCJdcFKWr3XtxZc2CQ3RtOQo4hJ8gVMh77TCCsBb/OmtP6j1OHbJR5Yzc1cl
 iLi+hLegBZESOt/yef8ksxAqkDi0ENqmOdw9iRaBtpDHR8FwZdAtliyrG2f+PGecUBe7rYk0ZsN
 QrDv95kiwD3KGgfHo4yhKy0pCWxY8FSb50zgRiLAyWhUUyiznsQEKPU1kEgovDC/rRNKpzIOvgO
 SUrSu7fdMhNavRJI9eH86HOzj/fJv98S6a2SI0RGK11+HLFkbTAzyGhqIagPspNGojlh0dNVrDD
 lHuKkVqmgI4Hoi57quPzZaIzpaWEsWQ4DcmYifX45RYE8fo6oR+3eRU/NwYzI+n3EvbxTF6qTqc
 /OoCtvEXJHi80DLRKtBm6QlljGdzxq7wH6CUzNPHJeVw60vYBhHjT+NIM+Im6/RRBfvqY09Fs2b
 BsYdI+XHKwS74YSu7rHoXqzQOQaijRnfLCHnKTMHXfNTH0yUelRdQrnE/4RcIxJX0pqilt7SG4X
 WeOtWoQCp9+ygj3nomvDZGg9KN7E7mHMHyK9TdfcLmunbXNVUTzuTcxOmQjV4adYWH7IiX32vdd
 NiKcGZDGYC0TG0yB8qG4bU86xaG+WnzEr7GEQm3p+PBejsMXWSEFlzX2TLkJxFU643lH4TI8j/y
 Du5KKQNVHtwhcxQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa11a72 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SU40fdrgiSb2mxkwluUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfXwrRAhA1V1oU7
 LRmbbDkQqhxwhvbKowkwKOJVyV2E/qbq5eN2o5ncJlL0IPqC1NyJl7mvfn1sFYrH5LMWaEsUBUb
 8w6bos2Vo7EC8ZIvexEk+sIYjdw1WNwe3fhO+yUpf6rf8gNJlnqxABmwpG2LavX30YfFilJ39kj
 bT0TNvOoSqBcciaWNj/brqYjexIFvka//plIuXnIozYxpgHUucofR+j/Bpjd4kICQ5uOqyoN73J
 j8bBRdXsL/0Hrd6UK3Cwt+ejJT2nTceYB7bC8m1YDFA9Fr3ElIXgfuePLBiJDMFdjCzuQsHsRYF
 Ub4febeWKkHpUmnXDMIuOqmMFMTv7ACb2FA9gI6YfmaBY2EennX+Iq4VmgMPeASZ4YknwDSxJvS
 H5Zlk2SIEmelY0dFoIFlw6e7pQI3QBOtoqb+chTK8mJrpztunPCCSybCUYrTDigBUHOoUSTssTV
 xyTg5O9X8zXgYRp4DjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX7lq+oBvbvrHS
 V77nNAcEtHeLBlqlD5K7VsafCH9lijMwz4fDAfCMZR8P32APTw93DL42tAQhFHdZ8tX3Jqg6+88
 T+fRdONjCNGCUBGdIZt4pYFoh4YGdsg=
X-Proofpoint-ORIG-GUID: qwp0kKlLk_2TFmuBH0_8apPxUGVy7PHZ
X-Proofpoint-GUID: qwp0kKlLk_2TFmuBH0_8apPxUGVy7PHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

Continued lines are not separate DtsLine items in ctx.lines, so they
need own iteration.  Rule for hex case is applicable to continued values
as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 24 ++++++++++++++--------
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |  5 ++++-
 .../expected/yaml-hex-case.yaml.txt                |  2 ++
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 15a3ba82fd5f..6d978c4d9832 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -547,18 +547,24 @@ def check_continuation_alignment(ctx):
             dl_value_complete = cont.stripped.endswith('",') or cont.stripped.endswith('>,')
 
 
+def _check_hex_case(dl):
+    if dl.linetype in (LineType.BLANK, LineType.COMMENT,
+                        LineType.COMMENT_START, LineType.COMMENT_BODY,
+                        LineType.COMMENT_END, LineType.PREPROCESSOR):
+        return
+    for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', dl.code):
+        lit = m.group(0)
+        if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
+            yield (dl.lineno,
+                    'hex literal %r must be lowercase' % lit)
+
+
 def check_hex_case(ctx):
     """Hex literals (0xN) must use lowercase digits and prefix."""
     for dl in ctx.lines:
-        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
-                           LineType.COMMENT_START, LineType.COMMENT_BODY,
-                           LineType.COMMENT_END, LineType.PREPROCESSOR):
-            continue
-        for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', dl.code):
-            lit = m.group(0)
-            if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
-                yield (dl.lineno,
-                       'hex literal %r must be lowercase' % lit)
+        yield from _check_hex_case(dl)
+        for cont in dl.continuations:
+            yield from _check_hex_case(cont)
 
 
 def check_indent_consistent(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
index c55359a4ca68..b0b8683b883a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
@@ -25,5 +25,8 @@ examples:
   - |
     foo@1000 {
         compatible = "example,test-hex-case";
-        reg = <0xABCD 0x100>;
+        reg = <0xABCD 0x100>,
+              <0x2BCD 0x100>,
+              <0x3BCD
+               0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
index 6600f7cd1ba5..f42490256939 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
@@ -1,2 +1,4 @@
 # mode=strict
 bad/yaml-hex-case.yaml:28: example 0 [hex-case] hex literal '0xABCD' must be lowercase
+bad/yaml-hex-case.yaml:29: example 0 [hex-case] hex literal '0x2BCD' must be lowercase
+bad/yaml-hex-case.yaml:30: example 0 [hex-case] hex literal '0x3BCD' must be lowercase

-- 
2.53.0

