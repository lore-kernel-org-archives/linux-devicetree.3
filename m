Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C223183C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682851; cv=none; b=maz4kIme/FcMgta9j99QqBBc8T/rIewXknktVfdc0JtyuZkElLhU/XukvJsYk+wkICI0F6U1YCJ9iMuPJqtxinBm52RNVIjqr/6Z/8/qM8xsmNScvhcErll35C5mYItsSCHTQlV+Z83NbvD5GBCt9kQbZ7CQRXKpEXoSVEwxTHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682851; c=relaxed/simple;
	bh=uDo2ajQB4Xh3El5qxd9yn446KCZ7hlt1rys8NkxD1z4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VN+cvkO4ytGLxmJsjONltTrbrGBxSURlzkUeVvqftVRoVtbpZa46PPPDooeugO9tVbK8utqDKWeW8S5KihsJRxTzSsJuNi5HDsHNlXdgX2NtCyXXTZDaP6UVgqg9CilJLYQC6hawbRD898guRcqAt7YM04+1fmsKR6YOXQnNcsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sy2B4yas; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFvN+cmm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sy2B4yas";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFvN+cmm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1C7fI334657
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E1FREXTgaVc/UUkLKa4gAq
	EqZSljJQdvhSaACy7VL3M=; b=Sy2B4yassWDj5pkFPoCJ8brJe7lEEGvuddly6E
	JWCF28/sKMWefenURTA+VdJ47QFSWvVoHI9VcjslB0ta5qQ/meMraAJmq7gJW+G4
	cOKdC8AhmMAkxW5kJrvaJbSkRJOApJh9NpISO8Kus3++OjuBXX2dF3u1LqBm9nfv
	CAa1TbitL/NKdh3tX/x/DYL62JlDaBdIkHLkTFGAuI+tfzf/4ZzePkKaamblffLL
	wWyzws56m1bWFs9ha+lTfyPnXhF+vxvwibNE8+dMHPzfD5P6qlsb56/s28aO4qeh
	8TJkmIymlo2WccQM1WO2vyzRSDZml3Jqn1whhnqobEAzn1kA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsuqy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:14:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so5838755a91.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784682846; x=1785287646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E1FREXTgaVc/UUkLKa4gAqEqZSljJQdvhSaACy7VL3M=;
        b=XFvN+cmmgzWJAf12ChWElN/kI87A/OSi4wPQOzqgjqbFxE3IGUA0jp5gYAXtha1fIf
         FkFz0kqdu5d1zL5Cyc0/fUAcwixnVsuiacTojEn+CPAjU6gz5w7xHzRIRBiP4Y38+REs
         2N5pgB2ZVZGivkBfRib4HAVutmyYTtAf3d9awEXQzLmN6qJ8nEcq1APXs2TCfAYtrz1+
         dBOsi6SVEGZ+et5GYVYAvVWMKrIPkWG1QVCH2WHAagnZ/AFwdvmjuX9ZMkHuyoV2eCWl
         4+VuPVoXdIh3jinPPsAr8YvtdV0cKlyFzcxrF0MFqRFQhE+LeUXNSSjz5OrUP6THlpkz
         E5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682846; x=1785287646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E1FREXTgaVc/UUkLKa4gAqEqZSljJQdvhSaACy7VL3M=;
        b=Uk7jZJG0EAqo9NU78oLEBhRomSoAIVqXStPt9+gBjm+aQbuVbMVc6GGlicyQexEz6j
         C3HD/Bdn218ZfaBiJNr3JPV+b+17i+WpkIiBaZLQ5u4iVfDOPJILIE7chJqXWVevk2y4
         UxFrI5KypWE0QfpdtmNIGh/PBIWdB0e9uqG+uOEiZDVQzPPUFOQn2896e+YF1P/uVMir
         4XI6DDBtNtpzjbxAtu8/ufMOqgT+rM7QIBHQv6qS2B3EI5PVRP6Yxnhy6dFSl7Qqc4+3
         zKE5q+7EFK+p8Wq1BZocVlnKtXr239xUwr42PV9topklGiyf5HF/F3NJn793l+VljXwt
         WvSA==
X-Forwarded-Encrypted: i=1; AHgh+RozeerqrknHqY7XT7TLq067tsl4BaveLNdMxPV2VjlLnX8i8pbK46nGZKT6/5wpP6Uoj5oVCvzgsl77@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4U0OpHY1cLY9ZKkCQoCcgb/Tc7XcmgObKE1vQ/8zIavCtb/PV
	TW2Chb6GNnrgld9ibu615YQ6p5aMVOrCzR7bWmpThnUSNjI9W8f4Uux2tmCTnxvkYIEaCP4HuWQ
	2jBicnB9OOf1BbUTP/MEatn3uRYG6ZB68WbmUYPlu2cCB4ehu0kCFHIT9qURG3Fh+
X-Gm-Gg: AR+sD10Z4RXWjw0KnVF3OapVjKvMPG//Px6lFhmdmL/3IM25uYzDpygno+Xr7Qjf6UQ
	mpdFynCLqZwC2ITIjRT7U0Gby2Njcz/K0B38K4HyM/h+K7Yj0DMSjCzqdFe01b3PSY2ujbxGSnt
	OA75XSRk+iN1eBjg8rJw0yOzTvxda8aoJkFDEhvXWaLy76bQzEFbO9U0a5QUIEZJSNtGy9NOWZy
	34uc9fp9+NIvgfzpRAoeLps9EBiQVoKjkoTIEJf2UIuzh3qv39z7s3j7b+PqT00zrYtnt8aOoMZ
	KC3zFtbgdHWJ8kO+DWDba/iTS4FWLRuI4qML0tATeIunjZ1GUcZap3MR4s2tbrHbHpJyjexX9Ib
	wHYrRw5/Oa0mHNYHkBKXtXqToc6Zfj5mf9YXpmexF4m0A3+hwG969j/RHfXjXqvA=
X-Received: by 2002:a17:90b:586f:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-38ea344e49dmr1545349a91.10.1784682845694;
        Tue, 21 Jul 2026 18:14:05 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-38ea344e49dmr1545317a91.10.1784682845162;
        Tue, 21 Jul 2026 18:14:05 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7b4da35sm160380a91.17.2026.07.21.18.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:14:04 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Wed, 22 Jul 2026 09:13:46 +0800
Message-Id: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEsZYGoC/43NsQ6CMBDG8VchnT1CC0Vw8j2MQ2mv0ChUe0g0h
 He3MDmY6HLJ/4bfNzPC4JDYIZlZwMmR80OMfJcw3amhRXAmNhOZKLM9L0AZA9oHJNd2IwzeIIH
 1Aahzl6DAWqtEyVGZsmARuQW07rkNnM6xO0ejD69tb+Lr92964pBBw7WtZF2KQsqjJ0rvD3XVv
 u/TeNi6MIlPVf5URVSxMUUlMa+V5F/UZVneB6Ik2SkBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682838; l=1591;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uDo2ajQB4Xh3El5qxd9yn446KCZ7hlt1rys8NkxD1z4=;
 b=gCxZ4KUBkLroE8drdbEOYnQrtjIsToKzsxc6tBDOnq30rpj0eu9O19HNM7FYGrjOcMJ/7NshY
 MIr5W8M2tmWArmW53ttDAo8qY1pOgpGl17SriSOLJZkwIuVidvUcmqs
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: _c7wDiQy9enVaRDzDAONzfIKItZZcDIH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX1B5PXxOq7P0m
 3nqIVWV/FuaOVg7GHQ4j/jlERe0jq9GzEqyqNIDaCoRN1by/P8T5nmXFtCZL0zcto9MUMaVCslw
 nHCML+6nQQRnFm7aQTRmY7W9fzj4AVE=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a60195e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=anp7WcwJjaQlINPkyJkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: _c7wDiQy9enVaRDzDAONzfIKItZZcDIH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX93ZpAZIDxlq0
 q5nLS3FXvTcnzfE8KLscVfe8cc9wO4olgW9mEc1rIiYtcjYv15PG4kN6uFi+6iCmL0LpLk8w9rN
 19Wbvz4knbrNgndPiY0yfT5SaGr8v1JGSFDqiYiBCX2LvLhEhxyuGQEcerM7Vs8Uaro49DLv7di
 CNEtx6nxQb4tPnQn+NJT6haadWaz9wKWZiT4mdgmQGCEwsN9/K3Mp4Kx8N+v8jLGqVNn9+aoX3U
 yvQIww4mNsrnh1cmYuZgEIp5IPUue7IEHUIFhwJ4oA9zmfD+1ch0tnDlnUzfS40ahgF1BPq5gw9
 IG0s5/Vt4fmGg0ZeFeGx11bCG0QszbfO2DTUIXpTQguCGDMTQtSzUkjoKNf77DooHHHVcGsGBqI
 O4MnzDTNETDaj+M230U652RQGZA/+XSLerej3yDveHri/ZBgn/cQS4xjzQEQ8XSOB6Jk83VAx8H
 u4yJ2lROGYMGizixMUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220008

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v3:
- add correct subsystem prefix in dt-binding subject.
- Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com

Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

---
Jie Gan (2):
      dt-bindings: arm: coresight-ctcu: document CTCU device for shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-coresight-nodes-for-shikra-fffa261ead64

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

