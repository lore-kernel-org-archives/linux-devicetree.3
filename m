Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C971E3E450A
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090126; cv=none; b=f7RtBzpWrnbMY5I/eJJ2ZhkaOUl8qNFzADVElFzcbMUKD7WA35M41VTB8PYSHIM2oLmMSIwNZ0z7tG9QN/wpbt1KiKRksM4lYbzbvPRULiO75sfUXlTvEdFHMP43BaZFhAxfzXmPscpxWt96qUy5wIPY6N02aNH5XmRjr73IYis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090126; c=relaxed/simple;
	bh=tlLysb09uvAoVCx+1kdze1jmf42cTpKi0299Fv9fCHI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sQ8RRUR27IzKD1VEYCAbQhqykW+iUS6aDQ5ts8+feR8BFN0QWyAWMq2se4MLFwUf4UtyF44rvu1XXZPlx2POGa3avh1B2AvLsNoGvU7Yjzhz+/KpTfaAav8YqEMsB/KY+oyad8kecasjuRF39jdVWfckZfZbJszyehGm2hlS9Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TY8SB+sy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M19pLXiU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TY8SB+sy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M19pLXiU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnnT530859
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TtXn6rn/EA0ErHHIdUsuzWy/47T5NpEswd4
	MS/j3NW8=; b=TY8SB+syun3FXLlMOist2e4SGllIRfrprlPOZ7Z9x6KcXQ4BmZu
	LUQzdXYY/FWQdnirJEVVzQm9+lrWwcckavKAihj1Mpvi5RcsdxeZ1E97AlXvxUvq
	bj1OtseDYoKQed3BqOB5CL3oT9wPpS5vktlZ8q1vd1TEjW27zeMuNEU6Xh0IkQfs
	KIZdso/HHQ1CUw3S1uyYCWsiKyLVszFetYB89b42cZiEdODPyx9EfoYE7AeqSgRo
	3eqF3DzHip+DwWTCNlHCYUmEEQSQp+O8PfwuF7ZqeAVuYYFeKDmzNiOMfdxkTGyS
	D78lpqu+jEceL5NJOs38UjpCjd1SnOkW+qg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh27ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c1e08848so89907385ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090119; x=1781694919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtXn6rn/EA0ErHHIdUsuzWy/47T5NpEswd4MS/j3NW8=;
        b=M19pLXiUPNk2NLKR+P3uiIEnzGNPCArscSiYr6TiDSKErYgMUAAGGX5n71xDmJVRNE
         HGjKwnpjm0qOF9lltig9/1TVU4UWd3/3bawup34e1q0eSaQlrS/5VpzUdHl5cvDlCBR9
         LTZHszlbCXaqDxq2MGd0EkcX+KTDFZTzUjTbUgxYbB77wXcCi+m6VPh5WxTl+a0becEU
         lJ9+N/h0JLApByob9f82IjzvPvuDTgNHX/7nJTNSJduuFLRdFYg3WK/2jkd5a7I2Ed4L
         Ob3erADgopECUA8Hd7qYCdicO0g1v06MRS/QkDocp4ukOXy6VAlHrC4ofMKKg+3ZJ/D8
         EE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090119; x=1781694919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtXn6rn/EA0ErHHIdUsuzWy/47T5NpEswd4MS/j3NW8=;
        b=atlYLUiuri/cqA9IQYUnmBIZYV0EJHddWorTtPm+AiHdiBS7wR3xTh7lSkXR2IrGqz
         +WBxsDKJE9XVolSfKv2e1FKpgKtxjNLAvQID1NhX86leCLVAylT355GYFr7uPXDvufz0
         iNFXhsNAQchIFBngO5NvTZdNQhLQCr+fKH8jHNfBpOH09g1t9Zq56D3HIwcWNbmJRQZ2
         a6/odA/b5t6QVZJcnEM5ZPzMAyCbN4qtoKo58X8cqByKz8Sd0o2ouDRJvTFQq9x0v39x
         q/fGAxShEDdWGPVwfcvfFZKr3KG3mhM9mhm+5voJMMePj5Z7GuUSU4w+NnEHscW0sxaI
         juCA==
X-Forwarded-Encrypted: i=1; AFNElJ8n/a0QsRsWObdCPdR7V8yLoiQRbINECFKU/ipx3dpX9qed47CoN2ur1KbqmRi+oFaORpO99nq/ZbtP@vger.kernel.org
X-Gm-Message-State: AOJu0YzO7/yQlVVOfE5WUOD8cQpCmxPM2r7mo9MRxPkZYofXdngXDoBF
	JvHbp2PPqjQJ3iHkeoT2uYCUu/SqzpJgvvx+XcmShqMEw/nOMsjkZMnQzdS/JsLxDaUedq2JLkI
	8kLHGk1SFhmd1h7yefaCc1YyZJNzSDCTe7OGbq8PJJR53RAEVeXmVDvXpkOoyiLU5
X-Gm-Gg: Acq92OHzvRsfNPf/dpLd77HVjZAjh49f/+gmAX/YnWTOAe9N96+8oDhtQU+yEcc5jzE
	co10t8KPaBhOpSfDViF1mbh+7PwXFBI5hk74a1BU6+Rgn3W+j4WSK4J1YKDmAlpfXf47o6zAgKO
	1gQlMBCA6+VoZmFkvx/NLNdxjAAcwptpml+CYE67jRNXo1vlPxGSOJcKZVYMz9vOQQTjH9yCCd7
	oUy08WJ8WVgNpjsdlx9MXoO9ixYR2UOZad/dXMYIN9KtUpx+v5ypzysreFtSmGQHD0E3YgVEx+y
	pFSMH8ad1i4HeCXJCYtgNBma9+xG2oi1R6071qQjVMDZuLf2UW5oKA8Du3Z+YHIXoZ+P00/C6Pr
	pLhvAxnTYP7J1ark7sjFeUfSOMzWuNQCFf5UQeVBCM36Nii52v2wHUj6TzBU=
X-Received: by 2002:a17:903:15c7:b0:2bf:1e37:a2ff with SMTP id d9443c01a7336-2c2a19b70c4mr91205395ad.0.1781090118770;
        Wed, 10 Jun 2026 04:15:18 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bf:1e37:a2ff with SMTP id d9443c01a7336-2c2a19b70c4mr91203235ad.0.1781090116067;
        Wed, 10 Jun 2026 04:15:16 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa213asm256052545ad.35.2026.06.10.04.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:15:15 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: qcom: Add SD card support for Glymur
Date: Wed, 10 Jun 2026 16:45:04 +0530
Message-Id: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfXy41mXDM5t4yb
 /eqcjDFDdXLiuk6zUiYUNj1y8R3camJ6AaYF8NacewaTRvVfMJCg9g/mmP/2wn9n7Bhg/vI9hOl
 5yc+QfWS+zHMnSbTU+kIHf532indWSdXZ/u3dH/eMeEOav+Z81FbZiP6T+xe+eJSylHMYoB6X+i
 G9ai7r1YLd4WlakC226Zq7603kttZB9MxUkw92JYIillbVKxxnlpomZkam5AilUjcSLsDTzOJb0
 oNrFYhn9PyKuOj4BDdFUJXjCV2X4LRclYSzCJPvLf/D2zOzh2LArereSvsEh4S8UmdV9yIllzdZ
 q5kxqgd1dc0snJvx9pRHqMIPleLjGqnXNfq0Bc1sy0y4I/NH2uxqsW9dNkhRz9rmUQZcjleCrVu
 60CLTQxezBYTrH5yUgkpMV0osr9FEy0qOFCoArDlEGBT79mJwizRMTmvHgnE+Oj499lvFNWMOgb
 1vVcqnQnYIyJofm8a/A==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a294747 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wwrRmPaMfoP2Nk6XddEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Wf3DDgCDTDbNOMarzePe032WxtCCNkng
X-Proofpoint-GUID: Wf3DDgCDTDbNOMarzePe032WxtCCNkng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100107

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

This series adds SD card support for the Qualcomm Glymur SoC and the
Glymur CRD (Customer Reference Design) platform. The changes include
updating voltage regulators to meet SD card requirements, documenting
the new compatible string in device tree bindings, and enabling the SDHC
controller at both the SoC and board levels.

Summary of changes:

Patch 1: Updates the voltage ranges for vreg_l2b_e0 and vreg_l9b_e0 on
the Glymur CRD. Specifically, it reduces the minimum voltage for the
VDDIO supply (l2b) to 1.8V to support high-speed SD card modes and
increases the VDD supply (l9b) for stability.

Patch 2: Documents the Glymur-specific SDHCI compatible string
(qcom,glymur-sdhci) in the sdhci-msm bindings, using qcom,sdhci-msm-v5
as the fallback.

Patch 3: Adds the SDHCI (sdhc_2) node and required pinctrl
configurations to the base Glymur SoC device tree.

Patch 4: Enables the SD card slot on the Glymur CRD by configuring the
regulators and GPIO-based card detection.

Testing: Verified on Glymur CRD hardware.

Kamal Wadhwa (1):
  arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage
    for SD-card

Monish Chunara (3):
  dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
  arm64: dts: qcom: Add SD Card support for Glymur SoC
  arm64: dts: qcom: Enable SD card for Glymur CRD

 .../bindings/mmc/qcom,sdhci-msm.yaml          |  1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       | 25 +++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 10 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 91 +++++++++++++++++++
 4 files changed, 122 insertions(+), 5 deletions(-)

-- 
2.34.1

