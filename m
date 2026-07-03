Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF573CD8B0
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080539; cv=none; b=t5OP+ton1pykU0WengRjAPWb53Uz1hHfhipGsRQ2N6O+0a110endRamIr83Ztqqz+5BYG7rmd3G3hMByCxY+2HePtzaFAZov35PcIJ2twjRpQxEn6+lRyiRAwFw7zIvLNDzRdBAc5+tkAjuMFO5Bxrz6qmjs7ts9UFN4Zq18OnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080539; c=relaxed/simple;
	bh=5V7HWccyjDE1PHzPXsSESrD0TYABSrEnhJQ1xPdGWYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sG9l0rfp9AMMfZpm4DI0BTgD31SXa886NBYa241YrDh/kO8e41DZu7nm0MfQfpeuDZcnF+p1EODJmC8XWOHt0c/p+Tmpv3ojgey9vWwzraZMT2pg9KX/Ts2puSjxHexhiq/UEFq924jPQKUZuphJfvgFZNav+oDCNYUYR3NFjCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okwbLleI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdTix0RD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okwbLleI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdTix0RD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BOCVl3126425
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 12:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8d2V1J0QbYdhiQA9M9vo6lfgb+kQCAkNzZdrKE10Kg=; b=okwbLleIILn08seE
	iseaDqo9uGQ14EEp5eg63/lUn6m9EzBaz0Upd7SuVI84STt/xCR+tE/MJU/ZE4i5
	CvQUTa0iuSxmeGlBnFLP4k6emqLDeDFEgLCjYsbN07njEzLceIEYrSavppzW0317
	XT43Yc7rVqnIqFPnvRYL/B/UnIKhtfquSAaK1/U/rVBwNkYzgkxWfjyqjLWtomV7
	ImMiSTKpHzYGwgnYDIPUuEuQh3+tsQmurUXpN+PdCyYwHesrtTsrhVIAquey3Uqe
	j9xcV+Fld1RI5UltHW0QP4oQ3pQAtC4xYIYzxK1yunmJh30TVw5m9rn8o6b6/4eg
	mQ4tVg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnmcv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:08:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so704089a12.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783080535; x=1783685335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8d2V1J0QbYdhiQA9M9vo6lfgb+kQCAkNzZdrKE10Kg=;
        b=DdTix0RDKqCL+qdpxWzgjJtYs7loULc3w/t28syzAIhDn1W1R0wQgHQaA8nC/ooQtk
         S7tFCXcCVURV7hxuUzvSXNRHR05J6KWjWgVgUupSkk+PPYlCJ7lAdsOsozNAOs4KnGKM
         kZmgCdKPgQNTLoV7I2uWX+iNVBP+2/diLhz0hE1J9LRumlm3xfID7THyDuM8AqhgwAXo
         T53FBnSPYhH/GArUmbmTpsy8Hz573tBv33DA1bzfQtLufW23qCgVUIwaf7bW/uTIajSh
         w6b+vNIZFOwZMdg8bzT4PGbG+UdqBlk4tWX+f6SxSXmo4kwVZq2r/L4eWNITH/xzkygY
         yqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783080535; x=1783685335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8d2V1J0QbYdhiQA9M9vo6lfgb+kQCAkNzZdrKE10Kg=;
        b=eUQEYMMWQv8JKDdq6bgy4SaIOoY/aouzgo4txrLB8RWp8A294cDNWi0Y5/zUZB4kiB
         JfW5eh/Oz2HuJzZacxl9CPI5cg9pJneJmV6Yd0eixU8p9dASLb3LkpWiZDETtx6RbHSO
         fR8U23Wdsm/47jTUJU50scNbyU1jKIoxujP4KQHFDeNERjckdOstH7RAuEdrGRMSEoWN
         wrzOk1LtArCYn+nQ4hOZpuVWL4+japUMMgHteKBDKbUmc61g23RMgMcoQFCE6RTabZLU
         su9R3+uCIxGrL286jTliiR3+ogD94dSpqKGcHKb24RSo9y9kVe5+RGiEHUOV/eGiUyq3
         TzIw==
X-Forwarded-Encrypted: i=1; AFNElJ+suXapwkuw42Isb1vfjhiT8NXo1Y68CxR0dNvQOkpRM8umQ39XbPNVDJCELtZttuef/u8zOfpZCpr4@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMvfsK4kRyYF2uL1glE9uz39pcrMuaMApE0Sdr7JyhChozQ7/
	/9+xTcZWS5DD+TeMA4x457d9/lzTFJrineuwG3v2Tm4nbJZdNhbj7KMy+mIrkO61kDhvl4ddrAH
	DFgULEEC5URrS7IWzyLsff6ufhBN6jUzXb/G57BdrhCVCF5qCbiQdJPsNA0NUncdk
X-Gm-Gg: AfdE7ckuacvbJl/SPbtOdgYtlA2nSit+Si0fsnVwhDvESIwxpKTF6BJf1evYJpC1sdq
	9R/LNdpFDlSrHwf3RkqmRegmjoqywnSxO8pLO4JC4oDwUCHJnx/W31Mazdv4SmDAYnzwRtvLmyY
	f02pCsm78Ti2xoVfULZXSFyMXNYCpXRl5FRqrtrXNlQR+cSxux3jj7a4F6+ZP/rpXeI6550ls1k
	AC6nS6I/LDu0APs21N5h39F60HxSWwaZHF14iMxRk6PIZc58g7oGEot/gksYMEth/Qj8BOH6I96
	a1/L4pmVEG85EBtzqN/Cg6ZqEIukp25ZgQkGrZ6q6xhAhrrlvacfh3QTQaYH2P6REKVPpxy1D4j
	HCgiozvYAB4OwNH6rJ94Dw/ye3ldLBzfeSlwy0FwcBuR49WzV
X-Received: by 2002:a05:6a20:7489:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3c01caaccf8mr4338117637.22.1783080534566;
        Fri, 03 Jul 2026 05:08:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:7489:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3c01caaccf8mr4338059637.22.1783080533846;
        Fri, 03 Jul 2026 05:08:53 -0700 (PDT)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10638sm2530779a12.2.2026.07.03.05.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:08:53 -0700 (PDT)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 17:38:40 +0530
Subject: [PATCH 1/2] dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-vdev_maili_dt_bindings-v1-1-c9df0916cd5e@oss.qualcomm.com>
References: <20260703-vdev_maili_dt_bindings-v1-0-c9df0916cd5e@oss.qualcomm.com>
In-Reply-To: <20260703-vdev_maili_dt_bindings-v1-0-c9df0916cd5e@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783080523; l=1283;
 i=vivek.pernamitta@oss.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=5V7HWccyjDE1PHzPXsSESrD0TYABSrEnhJQ1xPdGWYU=;
 b=J4GGGQ7hcYdgtXJBassBT6Xw5rLDeYRwM7rV0JCtvJzey5nqajrHDYeUihNHUapO7wgdAt5e+
 Lq3SS+5iq//AWGUj8V/QkT/kRdmF+LWBJVxg/h6qhD3F6X7gH6bK8VX
X-Developer-Key: i=vivek.pernamitta@oss.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-GUID: 8ZeaZjKvzF4uQulhd_oBAwKwaSbExZw8
X-Proofpoint-ORIG-GUID: 8ZeaZjKvzF4uQulhd_oBAwKwaSbExZw8
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a47a657 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ELRmBhIVfrytVPIx1VcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExOCBTYWx0ZWRfX0/BG+ubmcdza
 BpK/xZuf2vDcZPST4KvFquxwPiU1sDi8GHbvhCZ+048eglVJyEbDoEVmnX+cv17dD4sYJcILC6K
 DRJ/y6EDWkoCwQpP/b75Y+2pWZg0b8M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExOCBTYWx0ZWRfX0QIYoitH1BQ+
 o4FemKVPgezp2tVKEBOLNC+TACzdva1hFvQZYhl0Mdg70/mfjS5JIs1YdC0RbZ81+XNIX9VJtVz
 O7cx6jWQ3y/iSnXKNdy9bMT9gFquHoXOrVm3/eT4a1pgJYl+u/cYlKiF66BUUR7MGucmAxm1cYt
 2eLFAE2ZnYD9utdpvTkW0iYcIzzHOC1tPtQ5CsgH2PRbHyQpDmq6cUwk1Nlm4zSbV9TPHXrmdV7
 YdE7llTz0VQtOdk2DVtxdzCftWBFBFcpvL94M8NJxUnXLb+5wkcDqUgz0pbOgx/7X17+kCwI9p+
 Ny1cTttUzz4H0WyLk0VnmMdzyk6pAnEk3AUXMmZKxRZ5RiZ/jisbkv9SJthoNqsO4suFXdM0cby
 GSoasXPjYYoNW/H6JaRJdowXPNdhpjffmVH/+OjjZD2fFgWXpv+ieCqNvbsQo0lwZGQmDlilMac
 JXgT4d608mAd/WAlNsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030118

Add qcom,maili-pcie as a compatible string that falls back to
qcom,hawi-pcie, as the Maili SoC reuses the Hawi PCIe controller IP.

The Maili SoC is a derivative of Hawi and shares the same PCIe
controller architecture, allowing reuse of the existing Hawi PCIe
DT bindings.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Dependencies:
- PCI: qcom: Add PCIe support for upcoming Hawi SoC
  https://lore.kernel.org/all/20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
index 2c999ca6b2052760a192e9c464d86b73e86d3a88..aba89b59915528ef112e74982bfffc79ad6f93e0 100644
--- a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
@@ -16,7 +16,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,hawi-pcie
+    oneOf:
+      - const: qcom,hawi-pcie
+      - items:
+          - enum:
+              - qcom,maili-pcie
+          - const: qcom,hawi-pcie
 
   reg:
     items:

-- 
2.34.1

