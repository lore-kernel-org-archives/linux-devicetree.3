Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797925;
	b=vsG9waVllcGY/TdTXIn9B1xE4k6epQEVTt1f7zq/bYStr5YCfsoYntT3ED/tnGjaACpg
	 fZctojkGUzAdllbpF6SjY4A2JhDNfNbWF+jUtBYO2a/mwWwwGVdb4gpGSEIF5c9ZTAE1x
	 Dr6jTU+kDcAuP0C4KjU5qGKPmDLjYaAVD2+FbwBjp/1w/n7SBJdlCQmww24LGkVXSeYF8
	 MKkSLUL3oaQH871LE9ZsZ/T2SPxNoYT+dnsC/Qtez6zNEMbAyjCfESlZYCCC9gLPUIy4g
	 0SxFwS+XEsyKMFWBYMPygGQD6DU9XJedD9qRFldoycfssSS58NfsTQbGumMEFrld+Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6SqwctOnSSNvEfqA9gmQV0BvERnVjb8klYQk/ww33+k=;
	b=DWHUuZwOkv6nnNP6VGSbVbhEpCgB+3fVDFmPoZbOSfr1s5xyrXDSM81FkmfsXEYJKBSb
	 VyQmfT2869+PnxTc6FUuQlWV78GlcTyDaQSh05KfS3Zjjf7U6z8Y6im7sWf+MAu66IcE9
	 RQFtmG62aD3oe0Hgb/V2oSSTLI9fe5Do7zV3CDNSEvvsMcgry8qUvVGqPI3JS2T0PkbcE
	 BJ7VsmyUCHjfUFgJhJ2S1DK3onpLwp1TgIUYvBzzheJadZgrrHjbYn+Z3GmBB517uP9Tp
	 ATB2wUeLoStkOhm51ncVxI64TP3mtVdFpf6eidMqVzbgkLxZxOUoJvI/KRy+D11BtsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RAJ+bPph;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8x57Oe8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B467606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B467606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RAJ+bPph;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8x57Oe8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1Kv25136760
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6SqwctOnSSNvEfqA9gmQV0BvERnVjb8klYQk/ww33+k=; b=RAJ+bPphriG+rexH
	g3XFp+rVroxJQBi8DBML6dl82ieHdEYUnt/PHzP59UkTl4N7GRUwlGXmSqwlz/ge
	UkVAOdwWTdZFDfsJ8M4hzvmI8Y6ye2K2BTv0N9kglyys7Z6GZzlkFBBzqfYwFWGg
	/C9MVMeENhKFKKCg/m7CsC7N0kczhu+1IojylcnNicguzlSKTI7zDyJ/dmCRYqr/
	oOJz3VUsIyIt3ITtZiQkaPidcK0yZL4faPbYGJgVONMWnWL+UscOgNnbYeQjzXpZ
	RdrVsnY0z4boxnQ9yiXWyzuX0g7L18PwTol73ERK6mIjK9Hl5CJxIQk2tPxUxqRt
	572XRg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk24fmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:58:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37628596fc9so8123858eec.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794797923; x=1795402723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SqwctOnSSNvEfqA9gmQV0BvERnVjb8klYQk/ww33+k=;
        b=U8x57Oe8jCEJuMjnDYiDcZevmYJG8VbAEzcvOo6NGnlTX2eXaPolkOtWnP0vlD+kz0
         N1GCD4DvdDSNLfX90UcsMnEXPnRaEcoeTco6PQ60d2H8x2xy76n/IdDkAhW7ZeIgKcHQ
         fH9De20WRjGIadxUrAtCigvf7h1U4ZoTZegzN2s7ptQQA+Pz0Hw/2eZIm2bBcm2lfKE0
         EvSc8In0Kl5IcRfWTLiQREhXpkVDs3JxzWES3yTthJk+s0VJjDAQ1cC7J75c3JxL49q/
         d1QWrpZxhQ2eHwsE5+7T+85cltnXvkBGZaFu3lq11+soCzZ3RAn/1DhkXtF7rUJyZZ4R
         HMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794797923; x=1795402723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SqwctOnSSNvEfqA9gmQV0BvERnVjb8klYQk/ww33+k=;
        b=g+QpUs8DOPGz71xlWoNXpE7Uy2zbsdGVvGGlCJL+075O7Z9cPvvqFs8I3p9UGrM4Xg
         HSv9hbEiOdiSEvUjp3fRpfaK7XfwDbIHjgetEWWVU77CqKaMWnUV6KesgMCZMbOJq7FO
         IsssTO6Az46nyGm2tz9PyTFscvcWlbmBtOOlsLxWR+txkYE/X5fNQ/j4GQzqQCPwmDVy
         RhZK/FElNPP15VNhbp0cFjx189f/Ywx2FnZC+jy1UkqKa9lZ+x/q3g1F+K5W8wEGmAhY
         YPQt5tPH6WEQZTfzwskHEOqOxjU1VqOXgA+cGVGXDLAQdsbZIqQcoxqhNni4a6ao3U5m
         2E4w==
X-Gm-Message-State: APuU4Z/l8103SbnQ1YIPd9eqmWrdaoIZTSa9ojwbl5otD4CQGDH9L9SU
	AEeJPZS/q/ejqfullXt7V43J5f8hm0EGHvfJt6Ie3InqgFXTptgoa11+4y/A0Zi+Ift22OeZTjL
	/f/67SX8TR7YqbY2L4jJEEDog5YGBzTSbSoTmI2PpkdscNb283zNNJD/mgtvqOG87JLWeFtQk
X-Gm-Gg: AYBFou0LzoABcXHIvEtu6m29bOyEaHeAvmUH7j9GGR6pXy02GfIo9y/1NYRfZVrS6zO
	cjsZ4YExEH3IXVpXLI0g5MJlMtExWVtKj+4Fdlx9l+eyMRp3praM+bXZZDZTfcUGJzWSLZh2Bwq
	DlfmBtxbgWUv2CVdz5qBbIcMYfcYRzOId+B42c38i+1mO9xw4b4qnB4tZpbyfbmPu5rtSHJHXYn
	ESF3muKmpA0sqgg380yRe0oyVgLMJKExtNjKlivtweI2lRidt+bYJlXIkPHW6tWt3Xn+/TVXPqS
	+icU01cUfvtHeswVACsbf8nM7Alrc9bYVnJAw69t4UAx416VY+tAdAnm0jkdNl/ltlA36DDF9sr
	ykEZTlFyyblPOlgW/eaJvrr26yI/G2Hm20ym9pOOo6HSA5Ra9kb+Y0Aj/w2ZgZPxYJlkU5joOMC
	H7mbLDsAxHMTXsX+6js1HcgsTholLuy5b/
X-Received: by 2002:a05:7300:3b04:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-37965daabf3mr13725273eec.13.1794797923074;
        Sun, 15 Nov 2026 18:58:43 -0800 (PST)
X-Received: by 2002:a05:7300:3b04:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-37965daabf3mr13725234eec.13.1794797922573;
        Sun, 15 Nov 2026 18:58:42 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm30469991eec.14.2026.11.15.18.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:58:42 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:58:34 +0800
Subject: [PATCH v2 1/2] dt-bindings: nvmem: add byte-mask property for
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
Message-Id: <20261116-nvmem-byte-mask-for-split-macaddr-v2-1-96f4a0c08264@oss.qualcomm.com>
References: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
In-Reply-To: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794797917; l=2693;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=D4avuuAjw64GqM9nsZUeIgyvIRyNJuNZYgwm1HEqghA=;
 b=XW33uU/Rce1+Jd+3sM0vjC3v5rVitqY4TntHxbSV1qMv4NYc2xInvWugdvaEpF/rfucMMkP+T
 bzo4POyzvooBGnths3mEXKKuLrzkeVSFOkkTbll+ew6JvpkBu052a/W
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-ORIG-GUID: FaaBBpgaNjZLNuMFANhYCvx00I0VCmGt
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afa7163 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SdM8xRJxjg0OYcpbQgEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX9347SA376Cyw
 VpUpJR8i0ROvG/KBhqh1veukd1d5I7YkBVEK5I7FLM0ewos6WmRjalsheOlBfwS6AypLSraMRfq
 FUCbvy+yZHNj/x2izxNe5/CJN6vkVhGB8N1PHwWp+ZqAlrTynlqVV0Z02XqlZFaa5vwVLIUJ5wu
 jVjFKX+BrOIHUm6/FmMXdZ0S8fXhSjGWPeulnuMoofMko2vAdUAEoft8RGreGhiapPrtCK/pPrF
 B8mb7s77WeoXPFxTC8s7gebAWK4Xb7jsCrZxcoRJyeLrMT6zSRJeFMvAltGrLn2Xfb/mFvysCzQ
 aVmQbhhLuVO1xXwVHS826bPRxmEg/MJZ01G5gTSVNLmvxASWrzcIBHSf5yVpPsqw9oZVGe/1oAP
 UfPk66uqIXs/KH3Nz51AhrIx0iSKsyW71gU31n+5YjJoKs9vTfVP9F5yv457y/Y0MsBXh0+DhXK
 gYhtI4MAL8O54UENKWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX3E/bLnw7xOwQ
 GhMajX9pMRV7NqJme1BQU1+Wze90v01HNJGICEBm/ggHpeTwUaywFWCGuh+gF0sfKFSBjABIxAo
 ximLBUecsdeD8Ku9GkM8350+jmuyxyM=
X-Proofpoint-GUID: FaaBBpgaNjZLNuMFANhYCvx00I0VCmGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160011

Add the byte-mask property to the fixed-cell binding. This allows
selecting non-contiguous physical bytes from an NVMEM region to form
a logical cell value.

Some SoCs (e.g. Qualcomm efuse controllers) store a logical value such
as a MAC address across non-contiguous physical bytes, with one or more
bytes in between reserved or unused. Multiple reg entries would require
the consumer to assemble the value from separate cells; a device-specific
layout would need a custom provider for a common pattern. byte-mask lets
the DT describe this directly in the fixed-cell binding.

Bit N set in byte-mask means physical byte N relative to the cell's
base offset is included in the output; selected bytes are packed into
the output buffer in ascending byte order. The number of set bits must
not exceed the cell's logical size given by reg. byte-mask and bits are
mutually exclusive. Cells using byte-mask are read-only.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 .../bindings/nvmem/layouts/fixed-cell.yaml          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 38e3ad50ff4f..46e1101ee98a 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -34,6 +34,20 @@ properties:
         description:
           Size in bit within the address range specified by reg.
 
+  byte-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    description: >
+      Bitmask selecting which physical bytes within the NVMEM device region
+      contribute to this cell's output. Bit N set means physical byte N
+      relative to the cell's base offset is included; selected bytes are
+      packed into the output buffer in ascending byte order. Byte positions
+      are relative to the cell's base offset and limited to a 32-byte window.
+      The highest set bit must not reference a byte beyond the device size.
+      The number of set bits must not exceed the cell's logical size given by
+      reg. Cannot be used together with bits. Cells using byte-mask are
+      read-only; write operations are not supported.
+
 allOf:
   - if:
       properties:
@@ -48,6 +62,13 @@ allOf:
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

