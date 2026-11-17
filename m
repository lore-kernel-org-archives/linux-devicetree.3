Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943133;
	b=KMBLbgnvPyfTJqeZjgPrv8ST/x1AL9gmKRYyBt8ZojfxNqMLvrQ47XgEY+2vHxgGzv4T
	 opslIGqdzDRyMcpKH3YUyhBT85No8sEr9UoaPhvYvzzcZNE1M5ZyUhR3pRJIoaPC1kWEX
	 M+sVrWflRSqu5yigJuftM7fQjEZ8QfMKz3JesX4vqhdzs9ziKmUAx3fx6gq97M79timKo
	 STTYRJSid768UzlKinCVI+krTengxryoAfzK7l4M23RAdqRF1dUnJehdW4hgZigi5xKPR
	 B+3MOR4Qs111VdO+KkOiBLKMsLU8TAdyVMXK1TmN/GEnFB3zWeeYsfMBeKmKCoP1qZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6WtNEBbnNONmenOZy/udY419hxtAl9Rorvbbwtls2Jk=;
	b=1qFy3SoFBoEyuZ15HxkCDYbgCPAcH095AzUNbKjhZ6UDpJXmP8qLy4Qqwx+aDEKblqhp
	 dgbNApYQZBepPKGmN1WDelXp/32FvHNuYojrvV2OXPJ2oofvdMFyZ6qGxTN1O9tF2MSJu
	 spzTMvIM7f3JeropqUkGNg9GFtmV3mWLsSagyNmMagPwdbSld6qIf1SEv7iPnBwZH5A/P
	 R4bgDecorfzUslrbvgSVntBhBlU4Ai01HNyEnldPtzZRu/Gg1JXc7QmO5sCXU1unMrEMc
	 PplSp6xXekhc8TTpacrWpZKRSrcpKoGU+MC2eAx0qYu8VZgTmyNp86ohZ0vW6R3v2pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d3TXfaxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D91nJgkH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F42606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F42606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d3TXfaxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D91nJgkH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6CBe3702587
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6WtNEBbnNONmenOZy/udY419hxtAl9Rorvbbwtls2Jk=; b=d3TXfaxohU+UGELs
	rUaS8C24inW+N1r8qXo1ev31vnfAzxglCnk7PBk92XhoF9xGsG8GrWZQ/CDuaIvx
	0MQbuXSpRZo6I1nAGIkH4A261xpoV3ge9aXIrdNrGu0vmNiWya5q4g8ehu/ufGWJ
	L83XsUworFJ6xABgRqfvEyzI0mzd2Qs4XK6yGcg5VFkgIBtNrs11K3QmEn12+pmc
	GuGBqAYMt9BvAtyTgXqEqvbMEe65mbJADf2lAD/veE9OSs6OC4fqx+q/x1oQYega
	2bsntFTvJZj7wUJgVuJRMxKl/e/3NqG65zmDnD/z6rnXgLe9sRVQHTyVckgROFlX
	sp75MA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbarsx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:18:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c58d35c0aso53334eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943130; x=1795547930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WtNEBbnNONmenOZy/udY419hxtAl9Rorvbbwtls2Jk=;
        b=D91nJgkHI0+LeDRXZlDxstbNadzvvMa5leQHfe/83Jbhm6C5LdEbHpOTK962gHX4M3
         7DEtPh8G6l7OIRAT3FWAN5EnCyzD0kJmRWhMzvGWPiVLOYSTBYTDal4k4IMT2ByhdbGT
         ZrCcoPkaDw+gUlYXFXxmPAV6+ocryfMVcoffcFA83XH2XgzEP/upIhY8EA8r9lTPxeMd
         vrMzRdbuQR5W33Vye9x5xlqzX2z0sSnW8dSGPNzP2YbbU7z54h9PrP9C21j9tT4BJTen
         XyzGGKCGrqrtBWlkKzBT0nv3PzZz/01d3mX1V2ca1i63+dvARWD/Bd8XB5OFG3msYumE
         nuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943130; x=1795547930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WtNEBbnNONmenOZy/udY419hxtAl9Rorvbbwtls2Jk=;
        b=LeOlCUTzkINP9dxQTVn2fbC0G8xI27n0KZB6v8e8nQsrAtW0KqNujjf0ndbPPYb1wd
         J1u8JnKA+OhKzLGCivsKZjNyln6zenuZZ6bv+NnVFkTzHUIIonKL1kUcCNxkIlIOsp/h
         sAdHvANfGcokaEidb2Y/lYqbHUQR5uKDWTe9V0fkE4IWmBB0F+AK8AdXyQxpdXY+Vr28
         1sgj13+Sh7G67cNFq21pfGtTozSobGqScYJAxLEllruSjSPTi/ooBlRmYpm/uyJjO/1q
         F1lkn29z+z6yvpwxBdk+K7uHjyQ25OTm4OAwJcaO976B84FJZDapYD8uGVQWCRdvyrL1
         ndxw==
X-Forwarded-Encrypted: i=1; AL+hErFhjY1w8CFZzdIBBYHtpklcLKpd5hv1c8n62RBF3NPiyTfuPdHsAZFTgd0CSo9iMhkc5WogvtYOxWPA@vger.kernel.org
X-Gm-Message-State: APuU4Z+pome6jpVlUPgfXIyKKaJjBGSN6yHBwRN+fFU9QYDXpKVDAk0Y
	ITV8Qn0M3GJP2nf0LYcSObKoupPAF/gL/eCo2g6fSGtbHrDmo7R8lFrFwnILdqV8KV0AwD7dBht
	+6jILujonRXFdX3E2hjfwLZuHpyAP8KUEm7dHU0+9qMHsM6utG667J5LPGE02btei
X-Gm-Gg: AZFdTZcjQ8e1CqEIMY2BCflygjlCixHgeriTVGyJ8/dLSHucneF8NpxVqSjMP5djmjv
	ovIPCK/fDV4Bpr9SkwkUjcvj8rKh2qv6kq2yGNe+tqXG4JUw9ZTrjgyZgzn1FVt7o9dIqKxAwRQ
	hZJyRXUiTGh0i1A0DrB9Xtz7LSO3usPmyo/09wmmzIFwdywd15SrMQzoTpUJB6luHpTk1Z0d+MZ
	u0aSBkIgVnQH7tUxLDW8++2aFuwcr4+SJ7+JDAQGAuek6JjRZmceXrqy8+peJTSO8TYuOlZRXyV
	bNSYZYUfpd3IX110u/uFqXk53mfAJMmDcXzWuwRvGQBCm6+HhxQgCfBs3cK5tdr5pJ0Vb9NO/Iz
	qrAM3VWtGebO8eSUn9VNAUx6Z6w08VyHbtErp6lDZN1yg9FwC6/eHrWqOYR1X1c2xzVGB/dmQ2e
	AMcU1R
X-Received: by 2002:a05:7300:ce88:b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3827b0ca41dmr541526eec.0.1794943130179;
        Tue, 17 Nov 2026 11:18:50 -0800 (PST)
X-Received: by 2002:a05:7300:ce88:b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3827b0ca41dmr541493eec.0.1794943129531;
        Tue, 17 Nov 2026 11:18:49 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:18:48 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:48:20 +0530
Subject: [PATCH v4 1/5] dt-bindings: arm: ras: Introduce ARM RAS error
 sources
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-aest-devicetree-support-v4-1-936587251e8f@oss.qualcomm.com>
References: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
In-Reply-To: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=9889;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=79NjS3d8FLkHxoX2p2VWA63uMGScO/3PHtatyFaIXEo=;
 b=uf86oRyACdFsVDW/dEEUvCcvSDDZBrw3rFI3RVRe7znb15liCX7q1jett7B1hlljwmD49D5lB
 qS+iiOqhRfUBYpvWl20SNSWD56T5cT/IQcu8OJno9wmX5ZAPtDCNVew
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX9z+PY2qAmC6+
 HQnUT99+eaLnVRa7AT28uQio/rEryk8Z9obX90PfTpraS9Gve/sbqajlCmzCEAEWXT2AwXN2iSG
 tw+VxcXkeMCBr0cTNuJoh5KzsnOsKoa3OH78PyAyFptwmA1wJMg7AzeBO0y+pFT0VUHQ+nvENpz
 ePPPu4IbSan7Pz2pbk9wuhRVw8ujuc3NLE5KGJWLuEwWibB/dbgWLruU0c6zWxUZDCg7Ykl2Tpu
 HkMzx5W/eTxW9FRWvHkyVQp/YXU5UEj2n++qPAV1QLgx8OWYwQTrB708x8xrI1COVqVjThp3Gkd
 uaxIwzK/QwxynlI5V0dJ74GtpXshc3PNuSlC5zufnFfPy2ho9msquoTvPhNpBul9Rl0L+g3C+iy
 4+KgG11rt3PpyGsi7nnfh28z/E2R0R7wrW/JPzcT+rd+7dUEwHcaUB//Skl/f4AXpQxPGy6Kyni
 4yeWz6nJsaVM8J+7qXw==
X-Proofpoint-ORIG-GUID: _1qu3H6FzVxMHjHnYfJPx5h4CF-XpVMH
X-Authority-Analysis: v=2.4 cv=Vsy2kO2n c=1 sm=1 tr=0 ts=6afca89b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Lrng1kJLq-4Mmy5ilNsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: _1qu3H6FzVxMHjHnYfJPx5h4CF-XpVMH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX1oKZVIUViJM+
 cYYbto/sO4270yKSLoW98y71cNaIm/FiKpmRkqDmMgR9PYOBS7EGZQ965wX6rrBcSwTnvIifSbN
 iEu3viBgxyT0KigjhpR6mx0T1QKQhRY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170076

ARMv8 and later processors implement the RAS (Reliability,
Availability and Serviceability) extensions, exposing hardware
error records through a standardised register interface.

Add Device Tree bindings to describe RAS error sources.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/arm,ras.yaml | 241 +++++++++++++++++++++
 include/dt-bindings/arm/arm,ras.h                  |  11 +
 2 files changed, 252 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,ras.yaml b/Documentation/devicetree/bindings/arm/arm,ras.yaml
new file mode 100644
index 000000000000..257a5f5375c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,ras.yaml
@@ -0,0 +1,241 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,ras.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM RAS error source
+
+maintainers:
+  - Umang Chheda <umang.chheda@oss.qualcomm.com>
+
+description: |
+  ARMv8 and later processors implement the Reliability, Availability and
+  Serviceability (RAS) extensions.  Hardware blocks that support RAS expose
+  one or more error records through a standardised register interface.  Each
+  error record captures information about a detected hardware error (cache
+  ECC fault, TLB parity error, interconnect error, etc.) and can optionally
+  signal the OS via an interrupt.
+
+  Each DT node described by this binding represents one RAS error source —
+  a hardware block that exposes a set of error records.  Error records are
+  accessed either through system registers (for processor-local resources
+  such as L1/L2 caches and TLBs) or through a memory-mapped register window
+  (for shared or off-core resources such as L3 caches, SMMUs and GICs).
+
+properties:
+  compatible:
+    description:
+      Identifies the class of hardware block this error source belongs to.
+      arm,ras-processor covers processor error sources (cache, TLB, etc.).
+      arm,ras-smmu covers SMMU error sources.
+      arm,ras-gic covers GIC error sources.
+    enum:
+      - arm,ras-processor
+      - arm,ras-smmu
+      - arm,ras-gic
+
+  reg:
+    description:
+      Register windows for this error source.  When absent the error records
+      are accessed through system registers (ERRSELR_EL1 + ERX*_EL1).
+      When present, each range must have a corresponding entry in reg-names.
+      The primary error-record window is named "err-records"; additional
+      optional windows are named "err-group", "fault-inject", and "irq-config".
+    minItems: 1
+    maxItems: 4
+
+  reg-names:
+    description:
+      Names for the register windows listed in reg. The first entry must be
+      "err-records" for the primary error-record window.
+      err-group is the error group status register window (ERRGSR).
+      fault-inject is the fault injection register window (ERXPFG*).
+      irq-config is the interrupt routing configuration window.
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - err-records
+        - err-group
+        - fault-inject
+        - irq-config
+
+  interrupts:
+    minItems: 1
+    items:
+      - description:
+          Fault Handling Interrupt (FHI), fired when a corrected error
+          counter overflows or a deferred error is detected.
+      - description:
+          Error Recovery Interrupt (ERI), fired when an uncorrected
+          recoverable error is detected.
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: fhi
+      - const: eri
+
+  arm,group-format:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Layout of the memory-mapped error-record group window.
+      Determines the number of ERRGSR registers available.
+      A 4 KiB group provides 1 ERRGSR, a 16 KiB group provides
+      4 ERRGSRs, and a 64 KiB group provides 14 ERRGSRs.
+      Each ERRGSR reports status for up to 56 error records.
+    enum: [0, 1, 2]
+
+  arm,num-records:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Total number of error records in this error source, including both
+      implemented and unimplemented slots.
+    minimum: 1
+
+  arm,record-impl:
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    description:
+      Bitmap of implemented error records.  Bit N set to 1 means error
+      record N is present and active in this error source.  Bit N set to 0
+      means record N is not implemented and must be skipped.  The array
+      length must equal the number of ERRGSRs implied by arm,group-format
+      (1 element for 4K, 4 for 16K, 14 for 64K).  For system-register
+      nodes (no reg property) a single u64 element is used.
+    minItems: 1
+    maxItems: 14
+
+  arm,status-reporting:
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    description:
+      Bitmap indicating which implemented error records require direct
+      polling of ERX_STATUS by software. Bit N set to 1 means error
+      record N is not represented in an ERRGSR status register and must
+      be checked by reading ERX_STATUS directly. Bit N set to 0 means
+      error record N is represented in an ERRGSR status register and can
+      be discovered through the ERRGSR scan path.
+      For system-register error sources (no reg property), ERRGSR
+      registers are not present. Therefore all implemented error records
+      must be polled directly and arm,status-reporting shall be identical
+      to arm,record-impl.
+      The number of array elements shall match arm,record-impl.
+    minItems: 1
+    maxItems: 14
+
+  arm,addressing-mode:
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    description:
+      Bitmap indicating the address type reported in ERR_ADDR for each
+      implemented error record.  Bit N set to 1 means error record N
+      reports a Logical Address (LA); bit N set to 0 means it reports a
+      System Physical Address (SPA).  When absent all records are assumed
+      to report SPA.  The number of array elements shall match
+      arm,record-impl.
+    minItems: 1
+    maxItems: 14
+
+  # Processor error source properties (arm,ras-processor only)
+  arm,cache-ref:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    description:
+      List of phandles to the cache nodes (L1, L2, or L3) that this
+      processor error source monitors.  A single error source may cover
+      multiple cache instances (e.g. one per-core L2 error record group
+      that monitors all L2 caches in the SoC).  Each entry is a bare
+      phandle with no additional cells.
+    items:
+      maxItems: 1
+
+  # SMMU error source properties (arm,ras-smmu only)
+  arm,smmu-ref:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SMMU node that this error source monitors.
+
+  # GIC error source properties (arm,ras-gic only)
+  arm,gic-ref:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the GIC node that this error source monitors.
+
+required:
+  - compatible
+  - arm,num-records
+  - arm,record-impl
+  - arm,status-reporting
+
+dependentRequired:
+  reg: ['arm,group-format']
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,ras-processor
+    then:
+      required:
+        - arm,cache-ref
+    else:
+      properties:
+        arm,cache-ref: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,ras-smmu
+    then:
+      required:
+        - arm,smmu-ref
+    else:
+      properties:
+        arm,smmu-ref: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,ras-gic
+    then:
+      required:
+        - arm,gic-ref
+    else:
+      properties:
+        arm,gic-ref: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/arm/arm,ras.h>
+
+    cache-error-l2 {
+        compatible = "arm,ras-processor";
+        arm,num-records = <1>;
+        arm,record-impl = /bits/ 64 <0x1>;
+        arm,status-reporting = /bits/ 64 <0x1>;
+        arm,cache-ref = <&l2_0>, <&l2_1>, <&l2_2>, <&l2_3>;
+        interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "fhi";
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/arm/arm,ras.h>
+
+    gic-error@17a00000 {
+        compatible = "arm,ras-gic";
+        reg = <0x0 0x17a00000 0x0 0x10000>;
+        reg-names = "err-records";
+        arm,group-format = <ARM_RAS_GROUP_4K>;
+        arm,num-records = <1>;
+        arm,record-impl = /bits/ 64 <0x1>;
+        arm,status-reporting = /bits/ 64 <0x0>;
+        arm,gic-ref = <&gic>;
+        interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "fhi";
+    };
diff --git a/include/dt-bindings/arm/arm,ras.h b/include/dt-bindings/arm/arm,ras.h
new file mode 100644
index 000000000000..cd11e360fdae
--- /dev/null
+++ b/include/dt-bindings/arm/arm,ras.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_ARM_RAS_H
+#define _DT_BINDINGS_ARM_RAS_H
+
+/* arm,group-format - error record group register window layout */
+#define ARM_RAS_GROUP_4K		0	/* 4 KiB,  1 ERRGSR  */
+#define ARM_RAS_GROUP_16K		1	/* 16 KiB, 4 ERRGSRs */
+#define ARM_RAS_GROUP_64K		2	/* 64 KiB, 14 ERRGSRs */
+
+#endif /* _DT_BINDINGS_ARM_RAS_H */

-- 
2.34.1

