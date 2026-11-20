Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180899;
	b=QRGfeGuya4kElpMtLvEPKSDgd3jlo0HvbufPkQ42RmuDkB5sFADafLMiNDg5C3oAdhHa
	 yP6UtSnthCKv4TtqHBx7K8fJLk1DTnFx8DLYBEDFvKn1L+4BU7bbaJqxKuTPCtUoCvPjZ
	 f0GJ9QVXHyHTATyzfILRCDnbPFOxGupU8dcw1R6JR2BFxYUI7SF/tpfjXybODcO85g3xd
	 ogSur0gjNbE2DgPGbljoV3RfhgGzCCgiDl1gDmMgw+4yB0naPs+am5N+TrUEJmNOePkz2
	 XLCZBcLurPT8DPknLXVUYq4yr2yIOCznqAOvxvIkzpqfBOZ0WzzWK5PbQSmW5aFWstQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180899;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
	b=WItU7spLDHSVpcD8/lpovoR8oRI+qSIhABZ226Ai+K1P/04Z9WkS9pzQRoR+DGeeCvmq
	 q7YzgT65hwEFYGz4RELbNHsigxSkeAts4jtM2PDyy+15zgi3NqesNpj7ur5TRxbvthDFg
	 qMVJZEDVUH6XElUdIv+qH5jC2dW+D9MLvks5C2FJnqY2nO9mMT9GfF/Cb0Ihm4fQp3LCI
	 70ANyh5xlkKty3qt4i73v47airXJPN8KH3nU7TfJ77SD+sHoEOE5Z6Xm/Oz+vwPfnLjSH
	 AxzsMPOqwbfIPUKTj79S3qdp55X+9gDCTZClx/QbQRkcGg4u2E8pTFBdob8G+3qgERA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfsTI96N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLqY5v+P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10185606A331
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10185606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfsTI96N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLqY5v+P
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkEr81017083
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=; b=lfsTI96NcRfym0qx
	Ewn7J8yRv5lN+EMvbcDSaMPlD79smUlb0JsvejSWU1cxZGYZQPkWo65wAkzIs1D1
	xKoVsjFE4le4RADHwA6KvZ9Zb/eGPtAel9CyvR1mwphr7PuY66NzKNVnDEwyrQ2S
	lEtSxeUyZpFvI/DtpzNWlhmEiSh0KfnOu//G1F/BLE/qvJR5muNFYssKvoFQ1d4+
	PXu7QiKN2so0hiNvMU385u/AXqfI5D/HkqRebioYUcHbZ70qxGSumvfyNMwfaJD0
	ZkiU8vh7xPRgagQLFyGWJB4MFcC2dydhwRvBJ7qCtq89EVlydFDuKAFblwbwKwlA
	tOk2gA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqsqwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so906026c88.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180897; x=1795785697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=RLqY5v+PFCJL1GkAxOClAljxH8xlU5Y9zCAOJ3Qpd74Z2EKCfYnMR1kHQOML2GoPOD
         t7+jkJxIGvLYCEm7BupSDIvuxH6ZniXmpAZCAki300WyNhRFPbmHnq51qycdS4PvnyLQ
         /SQE4+LFTsML2c6mdjoTayll/VYLejF/gIkvM2UPx8dUcrUnNvCe2yJARNs5hLT13yYn
         eq1uuVMuivOce8kxGU1FgWfnG6rCllb4JAy/N2mXKJhTOqPKwHYiAhSLtaCGwRcgMZAi
         8C3mu5le/Az83YIR4YkhlR2fB5kIzFv5clJPTb8p7SQxnsfQNwJ9oF7KlB4f2rP5YEOC
         SNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180897; x=1795785697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=eX+EtwPBizHgc1fTlz0yutlMtxdDYC+tW8dyQiH2Pbr3nroYh+sdnue1TxsYoTrC4M
         nrTnvKVO3iEVupIubJWICGIVBoJ7+MCNupuA4FZH1EUelqM/dxC1s7e/IedSGNqk2hkL
         U7p0Kbqx2RluWxrk5e9h0mmc5ygK4/ETmCZm+he92kQD+sjLaLE5cZzBzIRZmTBoDRQD
         c8NM8PVW3p5mQ3ekes/iewfD+c5ujKTRWUUYP4U5FIg9hRQ3e5k7dyCDxfOjlicBHcfg
         wHghhKksFO6whyx4oSOC42j0QEniwvE11CxJs3lFjVbC6is5CQpqs9jwZabXeTic00K3
         QAgw==
X-Forwarded-Encrypted: i=1; AL+hErF3z5js12wWNwWx9A+qPKBzZkgtJqBP5XEkOC2Px95LsX+SICluzo70n58KJOWhvAMy1gDGZT/TKIys@vger.kernel.org
X-Gm-Message-State: APuU4Z8PIvU4OAGEK3+VniE+vQXq0AxJWlPCAQbcHJwpIwI4LO/UrqqF
	pTdstq7qUGpMgG3mL/o7TCGZqNPZ/zgfRmzKTGQXBhCSTma/iql+PMVofzkTEf3RNspHnz+HvK3
	CRclEkG4DCMSNUpsjImkXzoidSQbdTwajHovgE8xC00kfpS2411N/olxj0bX6Go8W
X-Gm-Gg: AYBFou1dDESgtrsvS19iMd7IrPh/p9x9VmvBk2xySe931DsLmXwsWHgaPtZMuDu4S34
	Z9FYC6nxgivbTONBOxP1w5jtCvUE5b+SCGcwfl5+0k6oWCwfmTP92pB8GthINmlBsoy4o4XSTfr
	iPfvPfdycSHJJ0/LdpQAdnoiT5AGCcAfZeOQs9PR0aMVc6hzBmHTKIAZ6jaYSvYypGWEixT5jMU
	GLwZPID2a1KLCQYLBwHIv6n02tdgytmGwBZ72WVDKud+9+B6LR5ZsuD93Swvu2XfHHL47DxEuIf
	gX6iqloOkLR8h8Zuxvy6c+RVm5mUzklbf1j0LI33CPtmOy1TNz2chYsFtXAqEzt3vIC1qxv1XpD
	gILkwgBMZOUGN/OuqKWccuqvdXe9UFERApWe+0IvE0ALEGP5772PO4JPEVQ+s1CDS
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr3009489c88.16.1795180897491;
        Fri, 20 Nov 2026 05:21:37 -0800 (PST)
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr3009452c88.16.1795180896843;
        Fri, 20 Nov 2026 05:21:36 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:36 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:50 +0530
Subject: [PATCH v7 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
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
Message-Id: <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=1991;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OnlGB0lHwx5DBBI0YdWS06WaZEWTOr+RBHGa82co62U=;
 b=mc1Vfk3i7aEY4zzE2pKuvjFl/03FLuO2BqaPMz5KkwZdee5r8qe58VxKx/y12U2T+2v5CtvSx
 Ztss9gKJkR7Ag+5kMMq3xwyHUxHgcALmfGpPFe8NCjeGlTL8ezMb9Ga
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfXzVNh6FmtYNVL
 cc7j+KW8mg1pjGz6HNPQfidwvvKAmv3jCmoSyiQ1FcH2rMs9maspxMC0ErTldWZqxX5Y2kH2PnS
 Hm1u3ktc5lMtvfnNXfrAqg23uvVp3tazLhfJrqZN6tcl3F3YGBTbHe9E0EKNVEhLQzOpM0hK2Sr
 R694LE6kbDxd/zmgjLjdG6OMaRlDjSvDl8lO1kwQJcQWGsW8aGtMgvAmjbonfjara8JBfM5tIl/
 qyLsB0P1hWfemau+awUsGwbEfGrtaSV44U2K7/LJFOtdzx/86lGhpVu4ILFEf+uq6i+/fJOH0l+
 +0kYWjJA/UwnUEA0s385DE/nZMOEOgVaJtnQRFrHFO5pgpiNdlM4QQ1Z5ZOD4NYnL3AdR6mGCo0
 2xNwSh5cuTsmlKG0O5G4re+tY9+SZWuW7FHNQtNm0tgNgmxS1Xm9xq/V6rzrTXD327o8Hck45Qf
 gVm4HKXxq4jjbEixaYw==
X-Proofpoint-GUID: 98An_6tiaM86akm9cDQbw0z70Oo2JKM0
X-Proofpoint-ORIG-GUID: 98An_6tiaM86akm9cDQbw0z70Oo2JKM0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX30pp/cxcaaRW
 9SjYZblJq9sUQss0d16AU2/VJ3XhLJmxYLQpTDW5LyYCtGCNNCn6I7DomPclo+2cPIRsJCvmVzL
 /GhfU5wVNDQ7/x/6HA4MLDbQFI8UW/U=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004962 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BudFWd5Wdpf3J2bc0pcA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200053

The number of IOMMU streams used by a remote processor is not necessarily
limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
and MPSS does not use any. The existing single-entry limit therefore cannot
describe the LPAICP firmware streams.

Increase the maximum number of iommus entries to three and constrain it per
compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
one for qcom,shikra-cdsp-pas, and disallow the property for
qcom,shikra-mpss-pas.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 74f83b7ce08d..3b827f2aadb4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -92,7 +92,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
 required:
   - compatible
@@ -125,6 +126,25 @@ allOf:
           items:
             - const: cx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-mpss-pas
+    then:
+      properties:
+        iommus: false
+
   - if:
       properties:
         compatible:
@@ -140,6 +160,8 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          minItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

