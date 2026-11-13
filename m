Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556368;
	b=b2rP+67l8YXkpKYvrJBVJKtvB19x3o1JE7+lK3L9LIxKz54A02ar3G8QMNZDDGYpwrgm
	 8vkjYZkyMZ9d1xoo3r+eb6jSYiJh4l9L6x8R98xR6riay0+S/qPBya5vLpZ3NIL8Tl9Da
	 ncOK7gGfkM9yZ6ZzqiNdfEQh6zSZhRckXurVhg5qqg37hXy78bMPexl1Pxxa6nKJg56xr
	 OfjXjL1JZQLbsfyiL3GohF7rQjciG08ENxCy8BhSjL3Cb+4I9yops/NZeWIzTxOZQAksG
	 koDnO7wS2SpWLjldsHLvPnIWJ4soGu5LjW7YnHjr09GDRCOud8sG1TIWBcpTCWKItoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pacv1Ui890QsD4XuE07ii/tqMr8qbFIfMymWdjbtLL0=;
	b=478TRvaJmWq8/H+jJeUSQEgsd+6FN0ffnQf3feb+BlHkNVexmbQ7A3QtFsvSEniRqn8t
	 aLHy8HubFMuQbCLoe3JPjT+RZbL/OnH8pyhHjnuAkXh5aa4pGKX2xHDQfu4M+jCdtky4j
	 /rWL/9Qt7YSVHm3HcyQ4NmDRMqIWwRcTBSk/+NgVjA4xfWbTVcwT8rCkgkAoYtqtYvO3b
	 Zsd0BLDyXr+vaVJKuukoYy8uwrMXjUr/HeCTl4W8bTPETAgMmKCBRKPVlM7oFj7DJKWCe
	 QIjEwp9g0uGGDBJw/zVazZKd1ijWB109i1JMqs27bbKaNemNZCjgJ67SHn15gP+1l5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jvhwUJ4F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXeZL63W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8897606A33B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8897606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jvhwUJ4F;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXeZL63W
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57jRP3284130
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pacv1Ui890QsD4XuE07ii/tqMr8qbFIfMymWdjbtLL0=; b=jvhwUJ4FGqgHGOB6
	MfYFKL26eAhXmFnpVSElUTz1rvEn+/4kKFaFcNwmQMhHzsoW02sCkeTM8Dwliyp4
	BzMs9xplO+z1HALGkb+4JtIkxeB0iyKEl0OCP9Hoa7hsJvP4WYSwYZZxn7q4bMFx
	CiXuvDT9rDyO1rdn8E/1W9LpcsZDpGJuT3SQZQEK7rYiWyp8lIVHPML5j05RezSm
	sEg6g8p4C8g/b0iLHFHIYKqxeiwkajeUj1DEI7zBDtOCbYZyfI1e9QrBT8KIO6aG
	fr7PXVVTvvD2HkpJZXLlhdN+WO4vAR59rZdDtyReFiQEcmnoAm4KXmRfpczfIsij
	VcFPAw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37gjk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso569723a91.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 23:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556366; x=1795161166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pacv1Ui890QsD4XuE07ii/tqMr8qbFIfMymWdjbtLL0=;
        b=EXeZL63WF38UeMgqixgWv1pZ4lQD5OZd9+BBhAOcIZTQjG5P2HmrHdOKcIVrkS1mJV
         IyjPEkj3JYFJXdh6BEvh764Ntb67iJPTAwijnwPrxSSNPrKKdOBiucDDa7QsWfkcSM5s
         vJq7o5PyaUp3iXERgkWfVJGQof2wVfOtGVb0X28hTEsW1HVvm/D1Y6HZlSSwiEMNvcw3
         0m+ahwTZ/EvA0cFG0Kx/PwMS7kfZPqVQpYvqhjmXQYhCO10dzklFONdy5/hOBAGDawcm
         SOgY3hZ46qaYPSN1DX3Ie/Ot14QaokFdtbyGJIEnDzKtUPEv75sYt67TCqaMuvQaB/nC
         vmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556366; x=1795161166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pacv1Ui890QsD4XuE07ii/tqMr8qbFIfMymWdjbtLL0=;
        b=vQKlJBCoHryDnMLSvdmX7giqOExm37adMabfT2GDrRhW1MkBwXov4g2gNlhVG0xLAf
         mcfWQn+a7sWI6KFeRzkzoxN02g/Y4rlFDnXLBsuBIk4Tg9EGsOqRSnJ1SP75CuWnBtQz
         RBZjDS888W5jjoVJ4HfulD5/28ID0WitqdyV0lzmU8joGELksHXvVMWpXoYyDsM0hhbw
         jqy2mpX8Fj0ogclASQnvWMKRmKSVnj2mYh4fvNIaf4VoTBkf/k+WXFCYW4V52fPLgjDl
         X1UhzAcSq0eg4VkmSN9llWcKYqrGaLb7hhsTo83pDUJaUCc+BCAGoUubDrca6qP/pLfy
         3oUw==
X-Gm-Message-State: APuU4Z+/J01LtfufILF8xd5cCIY/VbttzGITlspgd+VDDYLA0pmWunl8
	zhnujI0Fer6UpdKoWaDhT0Oy7932BWBm3hNeAS5z4TLR2zw+hnQDey7D9EGJ5IeV06cMeZpvfvh
	LBmB2sLYzqSfsCdKCDE35BlCUlHSXEgUQD9oRK/XZXEYx2AjTOTtTND0A/OIr84mJ
X-Gm-Gg: AYBFou2yXOoi/3J41KjcXgL6+in9qxP2uWKGhd+bGQwbmDfjwCsntleazfIpDordVJH
	XFLhFNlHVnDBawd+P7P9JujCH5qhAqtarkeZtr5t44EKOlaXTWVh6Yf8gDl3CpUVg16XVu+hZxI
	2/rEHm/5LNJogK4asFxBm5rB/fr2TjfwriqXF7ZNzlZmmHdmlFTDz0AVo5pkHvcWn2w1os/GkOG
	CQleSmd/9u47ZSMXzcNEk0QhAn0GhQxs+T5Oii8gUgxOmhQMxJN9qRKjFaulpHd/q01r43Gbrq5
	kjeC1ILRHMf9uYbP/+f666kdq69xUJ3lkHUHSrJQOqUrQgSKIDKoKmznP91n6sB8EMvRKf+Jgx0
	BJSM7CJi2kr6VnsqwqrgXk3ujOjGE+YbC+NT7n91DQl635sMXnhHI5a0nFZFkKqe0eKQ+Fml9j3
	TIBKwj/UX8DjZBXqs7iGgg2fu+6MR9H4t6
X-Received: by 2002:a17:90b:3f46:b0:3b1:8301:95c0 with SMTP id 98e67ed59e1d1-3b1b0b95db4mr1261844a91.61.1794556365568;
        Thu, 12 Nov 2026 23:52:45 -0800 (PST)
X-Received: by 2002:a17:90b:3f46:b0:3b1:8301:95c0 with SMTP id 98e67ed59e1d1-3b1b0b95db4mr1261832a91.61.1794556365084;
        Thu, 12 Nov 2026 23:52:45 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm1277107a91.1.2026.11.12.23.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:52:44 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:52:36 +0800
Subject: [PATCH 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-nvmem-byte-mask-for-split-macaddr-v1-1-138f715f18c1@oss.qualcomm.com>
References: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
In-Reply-To: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794556359; l=2395;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=+A1MvkMweMbrZQuRjcv/xz8vo7SmPDeELb+4dzgq6Mk=;
 b=ODNNgjLLfwI99LX2ZaYn6W4GPYs7y2ExV9iAvV3HcG4OQZBjRLXpmXuy3Dzc4JGY2QAjLv/n7
 d1GLyH69jxuC/CZypFss3OQl3nsyyGvv3tT0w/1zXbQ9o0T17a8QCpH
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX/OvltuLSebyP
 KT2I1IeLXQ+s7vBfRyzFLrjPhC/fzXjjKsjYKQZZhPFqB3SIljVVFcO3CZ9a6c9/7l8wfS4tvFm
 WIPVzSBsuzEYaH902c3wjcot21KGtbo=
X-Proofpoint-ORIG-GUID: aWHOsS5sOdrxRES5gTpsBoRx3i41DiIu
X-Proofpoint-GUID: aWHOsS5sOdrxRES5gTpsBoRx3i41DiIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX/lxXO6C6WnWw
 BsNhsbo6aCRDwanESLXr5xcSyOLQQaEJK5f0D4yxrSnKHOm8U6tfE977XW/J35uv43BgARwLYsh
 s5gMy18jDKcGuEnOuYGLWdyYyBWMZsOPxgaY1xkJ08HXQoYgTvRwF2vZJSliH5xsgi6ckOWC93r
 afz+CtSLPjj4mkvYoBrz7HCnGiensut8j9MYi/9Ojddv3DkOihhuAMjRVLmzwHOaZK6PPuCY8Ly
 h8BcAq3TAg5Bk/LjE+V01/gDRAvHEMgxDbFr1qNtrv7Uqcedf5Sc8XI8q5Sff77Lfn0w23clqrT
 1PWUEO4YixAkFW/N0avejXA38nP8JamRGLCd9/4YHb1bqGPdly1tWRFU8/jHgXdnd2XyGsRBR4M
 3nyzS7OibrMsCzwtXXOgAZl0UiiLubRL/e/kN10656TYQz8FmUO3bWrFotf2x4k5Mz71uCM0DKe
 /b8Y/RUfXHxSiwbYf5w==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6c1ce cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3jlLlykhy1_UzDSnmkEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130031

Add the byte-mask property to the fixed-cell binding. This allows
selecting non-contiguous physical bytes from an NVMEM region to form
a logical cell value.

Bit N set in byte-mask means physical byte N relative to the cell's
base offset is included in the output; selected bytes are packed into
the output buffer in ascending byte order. If fewer bytes are selected
than the cell's logical size given by reg, the remaining output bytes
are zero-filled. The number of set bits must not exceed the cell's
logical size given by reg. byte-mask and bits are mutually exclusive.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 .../bindings/nvmem/layouts/fixed-cell.yaml         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 38e3ad50ff4f..cddda3f70691 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -34,6 +34,21 @@ properties:
         description:
           Size in bit within the address range specified by reg.
 
+  byte-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    description: >
+      Bitmask selecting which physical bytes within the NVMEM device region
+      contribute to this cell's output. Bit N set means physical byte N
+      relative to the cell's base offset is included; selected bytes are
+      packed into the output buffer in ascending byte order. If fewer bytes
+      are selected than the cell's logical size given by reg, the remaining
+      output bytes are zero-filled. Byte positions are relative to the cell's
+      base offset and limited to a 32-byte window. The highest set bit must
+      not reference a byte beyond the device size. The number of set bits must
+      not exceed the cell's logical size given by reg. Cannot be used
+      together with bits.
+
 allOf:
   - if:
       properties:
@@ -48,6 +63,13 @@ allOf:
           const: 1
       required:
         - "#nvmem-cell-cells"
+  - if:
+      required: [ byte-mask ]
+    then:
+      properties:
+        bits: false
+      description:
+        byte-mask and bits are mutually exclusive.
 
 required:
   - reg

-- 
2.34.1

