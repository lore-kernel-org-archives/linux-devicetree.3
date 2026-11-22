Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316241;
	b=CWWdQ14BguhwQCa2WOC4MFcPtqW4WmNVoxqcekSUo6ikksSmJyAoVPhsa6SsG2ACv2fp
	 JxxLxCKFfA0saVh0YxVPYf6ymzsDXaME15FO4PJEW6j6fIAHBumQ/sqzT/25lphVtnLXD
	 XMKOMwYLxU/TnV1RM6SnMbJDAM3iLJYk2SppNyK1ueavRWke3+evma1sv7JHY22kQGrG0
	 2TXCssFtRkIGVU4vfU6UweZ+JcXMA/E6X5rQ9D7GTvDIRYNp46CGKjSMbuI36w1Q14YPX
	 HUlMpj0mfYNzg9PJDsFa5kUcVTyYXFc9BV/iiIyE2+S+zglJUFYvJCrTQ8Lk9oNto4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316241;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=;
	b=l/+HTYP9dhbS8guqG+nTt3durz4B6nVkGF2Pe2FNd3MTxmxtb8utGEr1+TMVlaw4EheU
	 EcFV+7SDKya7F4Cq0ZAXrlrhEF4GttUKz5mpzEqIPMv4F4+6azQ1jl1F9BUEWWmzr/Ov4
	 /SIoEFKnyt+Any4jt3bLU0b2C6QLWG1K/P1fQJ9f1BZXL+N5Z3xf95UYFHDKXQrm+X3ja
	 3ued5KPIqBLPxYhoZJ02QAwEofj8AbngGhmJwvb3DcPzJXG17kyRIww6IyYucGqgw4d+3
	 Y6EeZTMA62aLQUlB6cRzZWAYqMGCPfI77XgOmVk/eFQYUpslQ/Z8ftfSHgG+pSvFc0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BT39TlH3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bC1grQZz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36285606A333
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36285606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BT39TlH3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bC1grQZz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM08jNQ1496716
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=; b=BT39TlH3EBk/ld49
	JlixeU1hA0cxiL2kEiY6fmbgKiIyJJB1u8jLSkwOTiFoOVAVkipG31qadW6sB6qv
	vj5esXrGlHynubmJj/UNOn1dOX856oSo4fPOp2uUZd2jpPknF/2vKoFF8kYBtrd7
	JTapXEd+CIhdUzrfb7DBUFnpfyfBYzRwgLwmwAEtExxpVu3s33wqAvVH5Ky+fbym
	gkxsizMBeAgx+CKUjSzORpDDuPueOF7aJQnUkAHDHwAq11zZFZX3V26CrMF5a3m/
	AU7DJ1jlD16OTURtTS0czTaEbdz+TkPT/UJkp5PkweAQF69ir5jqstzTjaBvPUYq
	C2nS5g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j342gje10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so2204187eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 18:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316240; x=1795921040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=;
        b=bC1grQZzedWDax77gPJPXgpcZd6aCRS8X+RMubfUOBTGbl8dZwJL/wcLnARYeCgCeT
         pPLb38AJHPWWI2nHxqYXLPnvcX0so9y56qSFf7lR7tLbMhEp64LQPe20sl1DCvphZiPm
         mVOa7FnvPw/L7NiUdFslA0nw/wg3isNadvHgSyLo7gRbxgm+CY6J2xFWJLFVUfgnxxHA
         ZbEpU5FElLGjlm4UspjU4OPAjp+rMAnbOXSYEFYd/R3rLNGA2KljRN5NS+VKm/KPND5J
         Tf8QHi9rXWnHgINVvLUhrXuSDE2vzRSVkU7xYbGaFcXElxIJI2Et2jySpCMaRKLi2VEC
         y+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316240; x=1795921040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=;
        b=x1GMyrO3pwCIcieXVJrVxGvGwrLSXj6uUKEEovuFQ+3QD6wuGr3Cd7qTZOU+ys7C7L
         j9IxWTBHVUrV2ivwEHKI/SKUXL5DKoFmEGZYCh9bXrQxMz3rQI/zF5qLeQvz55KOvJNt
         uNMsSneav6lPsGXgRByMSagjeechTCJ6kGp1D/SeKxBL7ZGAN/aaEep1T98PsZBrtPUn
         CGWoxm9xMh+dPcOljrkLIadBDEqFX7xWeB4x3oNlMJrVdevT8rylLmQGtGj1hJzRdH81
         QmNhW2s7FE+Q895bwnPFwae2Xdoy7l4kScpnWV53ErNlckKsVqT0S/IlipLlnQU8M6Pf
         M3gQ==
X-Forwarded-Encrypted: i=1; AL+hErH2Ck4tkgNxmZT0kUqUS/IS/Zqwp+dlMZMOskUGfcjFhYzy2FrwEBk62OCp300rSlFDKiNardfhD2qU@vger.kernel.org
X-Gm-Message-State: APuU4Z8z32c+Yi3TljFzomzzx4Ge3zCFBkGPrk3MWvH1bhZaZGO4QRpQ
	JUkLOeXkQmB6sL3OPqCkzy58KNTuI+itP8+/kK2yW/qxmzlAl9hOYZU0dD/nXmijMhNqWA0oEmD
	eff5ixqT6W2HqwcWK1yyrjF169F83Cowr/wg4Qwn0a9Xmcr4FVWRPkn6ZG8cDQFSl
X-Gm-Gg: AZFdTZdX/fUshI2ul7TUxYfOoE1oEC11kfp4Imm8MlpPSYZhwjjAqic05N+R1mURk6r
	SBHIkoBNEqwuju0CunZOLE0HPu5a+cpA95jVQ4NzgItGMCeBEQigIreQD07sF4slm+Cs3GrU/c8
	khavwqMYO56d79ZnzT6Sro9qew2eUEXisiu1zjOGTrB8Mf90GLAbMp8n1o+3+9VMT1Nh6Oj6b/s
	CxkhbNDYSj+fxX5ERF2T1YT1GpNuIuu6RoqHBmCokB+3/yKCOd1mqL1nbz5W7dprm5UKj/X5BVw
	AoNNXA7crqHiN403Ib7i+hmpden7IZSN4qDnm7xjpYa0zETW47hLf0yHv6LQkeMed0HkKv5+U4b
	uYGVqCN1I0hv1382bRjlKXSYH/yLAVKi8vdUvxLHHob7Pvt5mXGRDbYPMjiIvJmbFsRICpqp5z7
	evMvq0n2tg
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr8559643eec.40.1795316239902;
        Sat, 21 Nov 2026 18:57:19 -0800 (PST)
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr8559612eec.40.1795316239376;
        Sat, 21 Nov 2026 18:57:19 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:19 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:20 +0530
Subject: [PATCH 07/11] dt-bindings: PCI: qcom-ep: Add Nord PCIe Endpoint
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
Message-Id: <20261122-nord_ep-v1-7-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=2668;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JAHLcpWrndJ7vGe/EsN0GzNIf7dKlfRU1FzcikKsx5I=;
 b=kghpNVosYGIELkZVpk17V4n6t4JpVd1dJQKucE28HGajI72vINW5LpLNGFPaZ5JvvIGM+RkW8
 7mmpI8gxDj9CTU/PNuAn3ONGLtnOSFqxRWzq6KRvIPQ+7FGZS/vLPe7
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=H+5OUOYi c=1 sm=1 tr=0 ts=6b025a10 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FC_8z62UfPBbNpSbB3cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: VFdw_VAbGEsus9Kq0beb7MjSbxiBRMAN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX8amO87CVHHF+
 w+phHdatRdJcgjmYcBYwhTraSh2W+mFtLhquNO7bBA/J8fNljm1yoO5L9UqffN8J2XoYPgmM3Uu
 iynMf6Z74oAQEeGSwW0F0ZbZFibXRm4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXxGYezgd7epAc
 zVcC3OrHQZCQHUgwOfRuLYZscc7aguWu/XB3R2gO/afFkZ6px7gWYJsm4CTQcfvxe9SSsOvKr9P
 snNrY3TLY3dr9ksj8JXD4OkJw1zdE6D4RRFgjBW2Vr05/RevBjJLVBSZ9mj125BTo+qJiodF5AE
 3JRc1UGmeP+3rGVmwBtZpgFQXrzag7yUIifVVYVmRUaY1v53jsoBZ4WO1vx/Zrlg+3/97KUNG8q
 dpT1+FVPBT7OU9WG6Tr0KK8nps6ywowfOdcfvd8wTZ9WTBS5FWCF83XEJOJ+B51+StVk7KCBsMm
 Ar+qMG65SHToZdxnPOyb2Y3w1gOqIamza5L1OF+GllOP0fWnvyjsHKfTJ9zqfU3DAeSkNU9N0Ry
 nefAjA5V5tUV23rtUFzvhnIY2eCnanyD2ASad6ZigXUhDxA97eou7vtJJc0KhkMvbHKB+UdPZf7
 yEC/mago2w2n2mkzsiQ==
X-Proofpoint-GUID: VFdw_VAbGEsus9Kq0beb7MjSbxiBRMAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

Add the qcom,nord-pcie-ep compatible for the PCIe Endpoint controller on
the Qualcomm Nord platform.

Like the other DMA-capable controllers, it has three interrupts, requires
an IOMMU and uses the same five clocks as sa8775p. The instance that
supports MSI-X additionally exposes a dedicated MSI-X BAR as an eighth
"msix" register region, so permit Nord to carry seven or eight reg
entries while leaving the other controllers at seven.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 38 +++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bed9a40b186b..9a6a7f6f7f62 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,nord-pcie-ep
           - qcom,sa8775p-pcie-ep
           - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
@@ -31,6 +32,7 @@ properties:
       - description: Memory region used to map remote RC address space
       - description: BAR memory region
       - description: DMA register space
+      - description: MSI-X BAR memory region
 
   reg-names:
     minItems: 6
@@ -42,6 +44,7 @@ properties:
       - const: addr_space
       - const: mmio
       - const: dma
+      - const: msix
 
   clocks:
     minItems: 5
@@ -185,7 +188,39 @@ allOf:
           minItems: 2
           maxItems: 2
         iommus: false
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-pcie-ep
+    then:
+      properties:
+        reg:
+          minItems: 7
+          maxItems: 8
+        reg-names:
+          minItems: 7
+          maxItems: 8
+        interrupts:
+          minItems: 3
+          maxItems: 3
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+      required:
+        - iommus
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,nord-pcie-ep
+                - qcom,sdx55-pcie-ep
+    then:
       properties:
         reg:
           minItems: 7
@@ -263,6 +298,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,nord-pcie-ep
               - qcom,sa8775p-pcie-ep
     then:
       properties:

-- 
2.34.1

