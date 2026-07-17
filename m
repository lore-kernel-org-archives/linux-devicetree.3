Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCAF1C5D59
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282326; cv=none; b=aHqAqoO+y0i4PQyMpoU40Pv23ZMBkMi1zc+3I0FOYI1z9BARGhFwWXo9AfL905O2KSfbMHhG6nm5t5BF3DYxYiqq4koLVftIsMk8MpTCriqHWZ2lAB7mbLXH0d75mZTOVvdYWsvk2Gcn9aL9UKeWfSSILm7koPnhJoCSc/1+mjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282326; c=relaxed/simple;
	bh=Ve6yBk7ITkHlXZiTQ6apz02svhUHfadmlMNT57Y8PmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZRuBwzDNHpn4LahtflkBR4/4n9Mpo7H4oz/j3ucjLE+Dl4pFTWXNMU10KJAzHu5FzB17wjpuiK4UtZtt7Ndgmi+PzEsrRcY4zwh0CUxn3sw4u57QtJRicQxL+Qbr8+sSrD4l/U/wW+3wGzhw7NZW8pKOaeCfUVOsYXS1ZcIfiTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7iKQWUV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jxh/2YPy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7iKQWUV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jxh/2YPy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H9utib1120336
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zSpE6gifVlFZehnqIGyvmBQPC0rPkN4PuJj
	Xst7s3kU=; b=T7iKQWUVbCH5wTYZOe2DsThVhLNffU25dNjqX4PWynvm6+wln0Z
	Y8MoBYOEVHcxefItDfwZIiiK6LtIvVMKD+UTJb5fkNQAT2G1tWurk9+aEhUQGRJe
	OsG5oi6yMvpgTnKwh8gUg3wzsXGoS+TzXpPYjYLasfjFjHy9WlSGdjKj5Bb9Msmt
	LigmNVild3rqjdrNneBboTFhAa9qUd5+PoL4fvBxDqSLrL1NDdF4v+dH/AipYn30
	rQA0Cv2NVqOfxk6Slxs+bgSMsubwZFFQxseaflbMt57PS21ERXC7g2iS5mwDGPyr
	PEvSz1hPEh2bAXC5HuUNUAfeCoYHwKtcabg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78r06j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so4305685a91.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282320; x=1784887120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSpE6gifVlFZehnqIGyvmBQPC0rPkN4PuJjXst7s3kU=;
        b=Jxh/2YPyU+nlXSy6XCX9tighab+KiU3DlERuxriMxHqGtEUw/wrOppgmwMi5mXEbe0
         qfRiXMyxdh0QRE1NDxWlMwkTFoxzTwpHEG7Vncs9EDQ4C0s4kmb0gy6q3d8qxlXF8qn1
         w/SgefLkJ8Py1mmh8HCOrX77uVuc/6rU1R083dzpmfWMpmD66SvBRDgW1/3cmAisZ0VG
         tDRQfLJW13qLN6xly29J9kzo566H4Gvft6xsdP29YWL+SEGKSF/MCmpyPGBswqbtp53g
         psUeg+nVkZUxY6rL00VUBKM/SUf993WQt7exhDnR9jzUkmGsv/Teexg2QzgknW2j93oN
         rFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282320; x=1784887120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSpE6gifVlFZehnqIGyvmBQPC0rPkN4PuJjXst7s3kU=;
        b=Fs9bx10+eFAVEHT7ujPNEsuW5a2f7jGIcN/lkGH1xZqep5ftv0mctzBpf0m4ctHUWR
         1N2/durWAWtQU8BAmgb3a8yOfJeGdKblKyKZrYDzE77kOCBt1xyY/ugrNKmGjq0rKFsI
         NBL1L1HV8NCnL3NFEqhE/3Wi5h5KmU7xMwBeLtHgLRKQL0MfNz98DEitVuo1QR+S+0CE
         m8QYMnnRI2bLfACfZUVjL2EDT6y0fcYO9W7Y3FVDISXAgWrXbsFJ9091IaZSE5qWg4j4
         J85wUg+UA88/4Gy3oTpX5P0fZthQrGZgwvrgUg4DOuS4UNsQ0WYlKRA9tIScTz3z6Fa7
         qaGg==
X-Forwarded-Encrypted: i=1; AHgh+RpEVYI7+gpzis70rpK/rkdzm/KAqL33KsqVIk/CaQ71Vd0YBhZxY30//MvhZ/dYQ3FZKu6Btm3/T6Sd@vger.kernel.org
X-Gm-Message-State: AOJu0YyXdT/OzPaDTDufEi+slu+mTZuwCyZ5/9Ut//IcaYJlhn7p52yw
	wDkKNfHqfhnsKbNvySMub0i2CZHgqavuP1U4g39JLUtu02Dw2sIIsyEHMIrJ8br6LGwpHmsv3/9
	Z5XE6U+hwH6xQbcL1sWTLPnhlOUJdKK5xIFKrmjgBJD1SFZpxAxISMsrVYvfqlqqX
X-Gm-Gg: AfdE7clrRtw+SDSQ+6vxVjSQaJ5cZwktULhIoKestVSGMospxMLE+tBfEZiBJmlu9UZ
	3Kfu2BCgbsc1fZQ8j+cl+Cohb3GmK4EUkE5m/KrMZnwweWZXOW80H5NWuaDi0zHDdqdhcljJtfP
	O3EDQ8hCv0FhU/X5inErsxCKyDjSRlrEjwlxxEGl/SrDzc9s5qsRlbxo/hy8Lz9mgXfeX6hpcAP
	ccZhcqfAmdHNf+qxFq20kQehkoiMRrA495ctvSCFRkxxIhCrhDNXG88/HepwVey4BuQoP5jAyLN
	Cf/FGYVjZgwEN9hd71T67tBcIXYMTf1g9CA6yHgOV3icCIj9/z5c/Gfop/jXxInwDJ1sahPGIrb
	BT0XDoE4vWidHnRHiT111EbGHgMS4JMi6MoXJ
X-Received: by 2002:a17:90b:5824:b0:38e:a74:dfe4 with SMTP id 98e67ed59e1d1-38e4b51447emr1813846a91.25.1784282320120;
        Fri, 17 Jul 2026 02:58:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5824:b0:38e:a74:dfe4 with SMTP id 98e67ed59e1d1-38e4b51447emr1813831a91.25.1784282319686;
        Fri, 17 Jul 2026 02:58:39 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm2661071a91.2.2026.07.17.02.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:38 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: qcom: enable audio ML offload
Date: Fri, 17 Jul 2026 15:28:22 +0530
Message-Id: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OCBTYWx0ZWRfXzAsoxfJGExZL
 jXQ3Q40276n0hccilRCCZniyL9Ylo4ZEe+GFdZ0djgyR1H/V4lI3xJx/u3RnX8rjO+EafYCRJ1p
 g7nou5dKsT25+Yl4c/JuFaEJzCTyvkRPMyoN7Cj2AZoR1GDIEy1da6XH21IYWHpzXnKlhOm8HaB
 0zEoHmIbQVy9e/RmOkclLHxinACT2EXJxC7Cbbo7lCrk9SImPyQrXBNFlpry5MjXmvg1TTjwxK3
 BF3DWihFYDlI8md+PfyC8HMPO9G8ISUoujmfBfGfFwRoCmtHof8Lqvy5Z13acFhHCdH3vpRoOC0
 vPXWSE3RuF4YpjrUuww5i7Ozqf9/PSANQIqaF4nJ//Vve8UR21e8md9S4Fy5cGJN0DyGX6J3UMT
 TtQ6PXDPpAoW38uimsYhO9H0cYIwg71xmszvZjC81UAe4FG64zb5rPxMhQ8BIcEQzOg/x5qZIRD
 OcWEXLOivkz1uO2FPUw==
X-Proofpoint-ORIG-GUID: GalyRp7bsvIANtc67yOjVqipEwxgv8L4
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a59fcd0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4P7nMa8YD1JmJx7unSoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: GalyRp7bsvIANtc67yOjVqipEwxgv8L4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OCBTYWx0ZWRfX6JN/tfZsgIBF
 x/AbEmuhW06N/hMYNDJdXKBW9UX0lGTqZRSqDNUm61f8trqYM8E4uu7pfnTSITBCTZMPOl9OHOR
 P3jvgej6kvnpiBocw7pOKQXyJulQN8E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170098

The audio ML offload use case on Lemans requires a dedicated contiguous
memory region shared with the audio DSP/SPF as well as corresponding
SMMU stream ID mappings under the EL2 configuration.

This series adds a dedicated CMA pool for audio ML buffers and
associates it with the q6apm audio subsystem. It also updates the ADSP
SMMU configuration in the EL2 overlay to include the ML-related stream
IDs required for DMA transactions during model offload.

Without these changes, audio ML workloads may fail due to unavailable
contiguous memory or SMMU faults caused by unmapped stream IDs.

changes in v2:
 - fixed dt binding issue for iommu.
 - v1 link: https://lore.kernel.org/all/20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com/

Pratyush Meduri (3):
  dt-bindings: remoteproc: qcom,pas-common: allow up to 3 iommus
  arm64: dts: qcom: lemans: enable audio ML offload memory and SMMU
    mappings
  arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU
    mappings

 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml  | 3 ++-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso                 | 4 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi                     | 9 +++++++++
 arch/arm64/boot/dts/qcom/monaco-el2.dtso                 | 4 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi                     | 9 +++++++++
 5 files changed, 26 insertions(+), 3 deletions(-)


base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
-- 
2.34.1

