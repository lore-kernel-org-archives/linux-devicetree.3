Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594896;
	b=Sq4Z6+tjCyTS7SrB0tECUHaLDDF+GI1FshhOo6yKvlrmHFLTFyrZLOjCXoir5csXvKxI
	 IirOykbRxdPaDWmrfLYSky//lgGskrhQOvupsf62RjzpSf1e/u+r8UGkwuB7ZDPU97kGk
	 TJT+i5HdeI9xfcmnmH1j1g6HHMOc3LBZclSXAe3EYvOsjBMUByugl2WJX4iFiQqvKQ6CS
	 fzYNX8FTuUaizqm8teMtouJqxB5HU672+rH4KNfYf5f3R0hFUE0109GsUKDrsuvHnWQQ2
	 iYBBYSwMVm1Cq4ErNJxjPrmvWVehH78fDhyhNj4IONJxhffoV9g9MQNolyeQHZOouWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E6zYprypSazoSQu9lRCpCIibv6TncNhgzhguOa6HKIY=;
	b=2lzEQBlMPCMz1aTYl59Dcc8vYPVC/AEBYGfPwxR5rkMB6q9ZR7wZ9o/uQv/X8u5l9zOq
	 HLx9k4cF0o3bG+iX8z6AUcU1VLVcmpm98NN00/UnkQMCE2Dcfa2GuYm82lDSfcqDKspYr
	 ME1xsz+AUssEc38675RAs5k3WnqDt2Y1yN0zkpgxnTs82uybpLfRaKHYBVm6Jy5uKVKc+
	 r55/T2k3Pmy2Z5etvePtX53weOQZU7yA7JGRyyTxSb6HINqlRiruyrzaw7hr4MLtUAkRs
	 acWRlQ7HiAn/TmqO52XDO8vYzPPPL3A25OIgpOpvx+7ZncqL5kAZkfEhxNFH/UTFl0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=StzFNBwj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2p1nO+M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4A360A380F
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC4A360A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=StzFNBwj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2p1nO+M
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADH3eXE3868331
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=E6zYprypSazoSQu9lRCpCIibv6TncNhgzhg
	uOa6HKIY=; b=StzFNBwjo8AL6idEpiOklJFUIvETLKd7GThInFqFrmVG0Ouky0+
	SRc4zJzJZP0JlEoV2AzTf3u/OQO4a/KgIJawuXTrDsi8K7HdADIy099+plU2crNn
	WmJooo/fv3vnHwskAARlVOutbAPQeNODVculUrxkKny+hgr5+4u7uzloa5xkYJkt
	KPvW0vsNz0Y0bCEKsySdEXvBXvD8tsKiC3T2ByZFp/JiuGfiAwGuQYThtICfeaGN
	Zifu4b4+MYDMr4QPwwbTr2xXsyvDgiiTxG9gcY69c1FhUiaeveRm4+BtV1ko1fwb
	bj0qCL6VS0FcZh6i9V82SurC5vvu/IbfzSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx6ma8ad1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:34:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495a1f5e47so109983585a.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794594892; x=1795199692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6zYprypSazoSQu9lRCpCIibv6TncNhgzhguOa6HKIY=;
        b=B2p1nO+ME8s8fmr3N6C/hc26Am7tQ4BcfkcPuRdlCmcpD9sd2yLrr72tBK2fZ7l5ew
         eyyEZAb0r8QBTUEJsWz9Msh0D7k4aviaTjj1Ch9qNW9QLa7meEZQpYI84npFrjJVbOw6
         5Qiqz/ghB0rhwE5NQQgZSOBHgKmLiYb8qahrVSv/fWomwfC2NlDTma6xJB3MyeoEImpQ
         51St0zlh7Y4PDxuYeSRtLFreYx7JbTaB1DkreoavlO5cqvweBbbZx4xmFZI7Da5F3K/B
         YUZ3XsbBs16WmdtSKibX5yWZf0NvC6evbTtYRzTPI19pgSonlQ5JqHPP6QVD2NirVdWE
         nr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594892; x=1795199692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6zYprypSazoSQu9lRCpCIibv6TncNhgzhguOa6HKIY=;
        b=G8CIH4G30mMmlZpOOP2yK/hGooXtitltPQYkeTW/Mh30ZEiYcCzL4rn6GradYkdolI
         3SUwKVsmylY1Cz6z5Zh22PXf1CxGWhLBDDHqSZ7HWFpkqS265cRd1V52N8cF3Qlqsrpz
         zHLvy3DEHQh5BQtoE1B9pz03kzwjtbK/4oKIXubQfQjzlTNusHpurJprwbxpO+CWIz3/
         gc+VOtVjIzTP3gvbLfe1/Q2Z5e6gD/Z6qGtDn2mOzq4JQYkAbQScaVzD/S7n/zQFIgYC
         bjCiuAdkByE8A6yvQcBTUGULKUCGEkSkZMTpkJy6P1p0RjCj0VZN5TMTgPlTbkGYuk8V
         fctQ==
X-Forwarded-Encrypted: i=1; AL+hErGfZpe9ncPFdGWz76y7N80xJa7xWQ3MNBB8HF/O9Gwr7MmT7ifDaWcs878QKqZxxrT1T3M0r/aU4rVq@vger.kernel.org
X-Gm-Message-State: APuU4Z/+mH4MHiCWNGpitndjixhpDyEiZ4j/lR1VCCR8Mb4pmH5XYtzR
	7QXxZ9UUCZOz9yv0WTuirw4EgMIikwIdp89jc1UQ4eLryFH4Jp1OYUH9gr3QLF86JDG0baPVpgL
	h6l91UuyzjdcoixC67ZDgV4KYHjKKql0cnQEwp3rjpfbk6gmVr6r/AQdFpSasi5Bg6pif8bCB
X-Gm-Gg: AYBFou047Onjn5lZ95MJ44HUt+hIwOUf2MXBLSjRKaOLN8XgJhHirZWme9+jJ8v+aPS
	MsUS9LTmxsCH8xVu04Eokr5ejFbGM5kmqUA6x2JgYb5pk/Ufmx7/3zGNqGASfwxvfKD8YIKyChC
	747y5AnpmTXG617vH7IQxnelT/M5w8oIoJwPwHU9aZcijpuVspJ3onmxqt7KGBKoX6nKqncQncq
	GdxjkpOGD6ff1X+ouF+OOhH1Kxtia9jceRvasGJuBK1sLecvqfm7D4djYwwlHD24yBl3P9IBRJV
	79Z2bGXwSG42K2HOeAkyrCY88ufMNMOoev1R9wnUho04OLJdk2KeNeDhInqH4O0Oq2goP7WcCRg
	XCUqX0VtwsapDN8re6+yE+vQhqjmAzeDWvgtgbX7FsFY0E4XKOLJ34cGvh5EUNQ==
X-Received: by 2002:a05:620a:6606:b0:93f:3cb0:4639 with SMTP id af79cd13be357-9494bcc695dmr519054785a.72.1794594891919;
        Fri, 13 Nov 2026 10:34:51 -0800 (PST)
X-Received: by 2002:a05:620a:6606:b0:93f:3cb0:4639 with SMTP id af79cd13be357-9494bcc695dmr519049885a.72.1794594891341;
        Fri, 13 Nov 2026 10:34:51 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm6871268f8f.40.2026.11.13.10.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:34:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dtc: dt-check-style: Check for closing bracket also on continued lines
Date: Fri, 13 Nov 2026 19:34:45 +0100
Message-ID: <20261113183444.175773-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3622; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=egqTvW9kWgGoW05fClXQCkErszewSsxAWqh6tyTRgzA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91hEWLILURS0qUmOOeTiWhHmDnQ3YyoiN/Vtk
 dwZ8Sj0J5SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdYRAAKCRDBN2bmhouD
 16v3EACMjTOkalsZT++v/jmcqzFc7y7SVVpM0DQ1zOKUjyTTUVa44QjUhFc0+H2k84QhfcUgj8C
 qtgo0N6M7ZVSZsD35EcBB3TmlB2Qk7QE1VumOrELymVOMYSSUMDPDeSsaR1OAbvWlBhYUR0nXGj
 gQ68DSApTokfyPDqRtFpKkQKY09uI0yxLj0mQkymhldchmUHTSZDyGZRH3D4Dqp5vNF7MxKNmgw
 QX/hixA3kBYb1y0N/4zYbFQ+HcZIUtIHAxGNG+wtcl70FMn0jIH0iqNA5JAyn1nyWcZ9mMZCoUq
 ND5mg064AvtFg7U3NogIy4coq0e3/tzhZP+T5tT7oqZTEm+tZDEjdp+13Zf/7laDbWTVtz/bhgD
 +GizDJhTM2b768/0Q8eYIrAoXUaRf7JOJF0dQ20itvDsN9n9iJ9UX4grEnrD7h/K2zf5tMyj1Ap
 Te0CdjU7Bzq6ufzFJ+oGGC3hks42Hevs2qSX4ZcE76QEnd9YBzMRFNntX4uILVnUPI5Yb0LGCUS
 kHpykaJBu9kdlFn1Y6X3kN5TWHEkE+P6Baox9HUtxxvqlg4aGQJ3VlfDm0AXxYwvLfFPwjgudJe
 OTyWGzcLqq/LBm+gH6kkZDRE6ATd3ONG1pk/EMyeJ3ziifbkNG1bORAT0ddI+fs6ZAQOhxQUOH6 FjExBHU7LzykEBg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QC1kB69hff3bSIFpGEran0kz4AWb_88H
X-Authority-Analysis: v=2.4 cv=RbcFmFtv c=1 sm=1 tr=0 ts=6af7584d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SugtBgs6HSOQlyXiFc4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX+w+T3USTpJrp
 vdGuFUMe9qdstAnPLW2mdNRs6tmZ8UEHFezr/2jkDF4YrJv/tLPixlrcqSI3pZhtNTKDoRiJSs8
 z6SpYHiPwmOFpLI6qOAkmhVeHyrdNzY5xuvvn9553PHQ1hCTdu1NWaJ8TavP9FBzRysF3MHanC6
 PfspWN6gzh2Tzh+bLz9mHt6frYPiRHctnpd8Sy68n8lN/Fuf6zPIFF/Jo55xDRfU39PU07Du1+9
 CbeD+TZQFcwp0xTOVswjpM3vU8oGIqSwzlc4JzkpO4LcYmqSwVbix25+A3Vqfvoy4x3tY/VeDss
 LBEohdQ4dG4tcxW94uX6FlfLSICuTB2zW+DpCa6JBwDqEAeiHmt+wUv3SXdCKFvtV9CAZGGeBU5
 SLBRgo3XJZL+Psq8KlZOPnQO2fRE95H1SWsKgzNtG9d4+Y/5lFqXgBJNDpDy9p/NrFEMI0WaAJH
 OI+J7+N6Pc6AYe0BxZw==
X-Proofpoint-ORIG-GUID: QC1kB69hff3bSIFpGEran0kz4AWb_88H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX2/1jUN/IOfgU
 DyLJMWgYvHfdp+3cebR83ck1bkQSlnkuXI4R/mcNkXTCgWr4WxEUWhENaLZPy6pLmAvi8aD3F9O
 ZkUiaXynFODEcrvVbhxZCtwbm8HUO6E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130074

Fix incomplete check for closing brackets also for continued lines to
flag code like:
        reg = <0x100 0x10>,
              <0x200 0x10>; }

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                    | 19 +++++++++++--------
 .../bad/yaml-multi-close.yaml                 | 13 +++++++++++++
 .../expected/yaml-multi-close.yaml.txt        |  1 +
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 6bbd12b308a1..65d76f506518 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -675,20 +675,23 @@ def check_node_close_alone(ctx):
     that is all closures (e.g. "}; };") is still NODE_CLOSE for depth
     tracking but is flagged here via dl.closures. Any other line that
     still contains '};' (in code, not in strings or comments) is
-    mixing a node close with something else."""
+    mixing a node close with something else. Continuation lines of
+    multi-line properties are not part of ctx.lines, so check them
+    as well."""
     for dl in ctx.lines:
         if dl.linetype == LineType.NODE_CLOSE:
             if dl.closures > 1:
                 yield (dl.lineno,
                        'closing brace must be on its own line')
             continue
-        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
-                           LineType.COMMENT_START, LineType.COMMENT_BODY,
-                           LineType.COMMENT_END, LineType.PREPROCESSOR):
-            continue
-        if '};' in dl.code:
-            yield (dl.lineno,
-                   'closing brace must be on its own line')
+        for d in [dl] + dl.continuations:
+            if d.linetype in (LineType.BLANK, LineType.COMMENT,
+                              LineType.COMMENT_START, LineType.COMMENT_BODY,
+                              LineType.COMMENT_END, LineType.PREPROCESSOR):
+                continue
+            if '};' in d.code:
+                yield (d.lineno,
+                       'closing brace must be on its own line')
 
 
 def check_node_name(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
index afc202a698eb..80cf44340e4e 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
@@ -33,3 +33,16 @@ examples:
             compatible = "example,test-multi-close";
             reg = <0x100 0x10>;
         }; };
+
+  - |
+    bus@20000 {
+        compatible = "simple-bus";
+        reg = <0x20000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        device@100 {
+            compatible = "example,test-multi-close";
+            reg = <0x100 0x10>,
+                  <0x200 0x10>; };
+    };
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
index 637d0f8ea103..ea38befa1bc3 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
@@ -1,3 +1,4 @@
 # mode=strict
 bad/yaml-multi-close.yaml:35: example 0 [indent-consistent] indent mismatch (expected depth 0 * '    ')
 bad/yaml-multi-close.yaml:35: example 0 [node-close-alone] closing brace must be on its own line
+bad/yaml-multi-close.yaml:47: example 1 [node-close-alone] closing brace must be on its own line
-- 
2.53.0

