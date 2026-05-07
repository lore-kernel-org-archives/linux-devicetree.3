Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF24330595B
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141258; cv=none; b=c+FayB0m55IPhetL9t+0dgH5yy1PId8TuN9Qoh2RfbArtvlKzVikOOTMbVgGXFPRk1jrMvwY6MRWwgP5+xpzvo8qEKOWqCCHtawnnU9vjWEUWZTmx5fT0qmA1a8HfD8bmUDjsrixkZ+pV36rLQrjV5/XVCX3zrsV3LN+s4dQQQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141258; c=relaxed/simple;
	bh=J1mk/MVYikqL1goeDLu3PDJE4r9vtU0OZH36MxqS8Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvecToh4SL5KJ4R3q5Sdg21BVNjl3qlYFWiVXq4ojXEhl8NkbE6v7znUzY1IG+7LCPTlG4pc4EtXGRYa0rVwFy+RKOgl0G/jeHNP+anqd+2NlUEJNoSQ0A38F2xBZYYJ0sdSoSa0xngBa471SKAXS3QTuSdy+qtqbnR0AR98dy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFKHcWcH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTmZbURx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFKHcWcH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTmZbURx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wWf41926339
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 08:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bnjc0dzixx246uAsmR6BX8KvTfzjFEN0yFm
	FFgSNkKM=; b=MFKHcWcHNhq9GBSdJvuif++FWiNKUjWqEeh9DKByPsIC+tB5WYk
	ptH+LrZpq1lggXJXi9nZmlwR3m8bTuYW3eUXbc/aoVuJ09mC23+2n7Ko5ddXx4Yk
	XzQo9dyZoyvy764iLpbw61FD00AmUmGpaPrYFyNap5orR1RUwf2dBjroOdWaAmc3
	a+fB1I7QjaOgM8Qej0DPENwuF7P4Dp1Iilw6ic+E1vgJxaNz8e8foINhx+aEeM5F
	QNRAG+8I4xhZ3dKb90/J5eBXJk7FCB4CiaXOuVl38ZdTxmvqGDZ+WmyPLRVgyWys
	REAjn4/bT/LKy6CThXfxu1JVzWIi8bG+Mmw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g8fsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:07:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so817584a91.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141255; x=1778746055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnjc0dzixx246uAsmR6BX8KvTfzjFEN0yFmFFgSNkKM=;
        b=OTmZbURxYZM9/0pVsfhRhHgAdesF0lRcZAjTF55FqfpDddDAlH66kqLM1gLdvDD4Ki
         e1jgpdKfxyxfnvOTMN8TXgYOUFChmvlTRHAu4+gCnfSU2UrwhKbJjjGKxtUQh8O/nW36
         SzhTjeKb+xIFNR1b1g2r9SxB3StMNHFKfvVQxHQtBzkkf4o0jSXVI6IfYQ68vVAE8TWt
         DLcdGjqhrhn/hQ7/LnSpi7jPdDbh1SYc2uUqIB5L4cFFwvtBngfLu9e5NRz6dmcT8g1H
         Krvi07k8hj0FHi/OHlkrBWMp115m7OuZ8PZLLJEzFhUGLihUOUmVK8rFECHPyYTFoOoZ
         16+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141255; x=1778746055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnjc0dzixx246uAsmR6BX8KvTfzjFEN0yFmFFgSNkKM=;
        b=LPQbh1oSOdU/Xm12jX6SxV6NVOIzGEYgxVDpOs/Lkhog72baRYtKu38SWleFIxF+++
         P+ynitpUM1BF/XwqGvmAp27+2aOaoNP6TqQ++qZzvsAhvMzh9yO9HNgQ3ZjMI8BREXoA
         VzTIPGx5Y07x9shK+WCu8OT6IQXvtlVHJTgDNHVEkrqQbQ9HKSy+PM9xbszCNFWwmhoi
         hni+SP6+zVwIwpsg588gXFdIfyzVRenXPToI40WKfXR2fEo4ddztbExgg2GaZ9qQG4aD
         SCoHkEVdhfLYV1mT42aoMACBestLYL83T4x/wOzhcVs6jxE0tvzXghd91350sG7f7l0g
         u0qw==
X-Forwarded-Encrypted: i=1; AFNElJ8HqaYIIZ0Z6hHkhNywsc8u4hHXzokeW23XC7x0M8Sa3MsfE6LoYeRBUoMNz5Tj8Josn4XJuAPA7s7W@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNMCfnAnkf+ogj6LiRFNl7BO+zJ6x/XWZQWvm8Oc15ywnbjvd
	UPKqv+YlZZGn7u+ne7MHPGVN24MIieqLVn4PMf1ytBL5Fer1rnpqlOfR4MivVzuGIZyG473mxpF
	KCyT5yUu5UT8Z5J3hUJVepIuDwrACmFdD27yoV3aMPbsy85JNmJ1LeI4tDnHrMTg2
X-Gm-Gg: AeBDieseCRRmUE7XMGyGHJRChrYXcM5l3Mozd4skWelYk2p47JAn1m2+9fZbvv5t8Bg
	D+x9LlwGFMbHQiPRFnHrjsaXiZnCbniMNCFROHIfzdUna913IsLTDWvCMlJtqi+TGD3y+ENwbOX
	91bFbx222kHNPJbU2MRtCk2WDYLFPjO39KBaZPPT9Jh7AmaJnsr26seJSnJwurFPQZmylVjAk9Y
	UEPUkdpP5UH8nCcaGSVrXXTcxmG9pch/5eZIAn+jlVhH2UO4S96bmfBZj7olcZ6rZ6PGsxa6yj1
	WeFNsKTvcKN06RiMsS+VtSU6aYaI56lbZOxil0b9EefR61+Lk1hjFKkHBSVQZiAgBUIsKvR7nJf
	UaHU+BoQ7ihV2pJBJlv47N+NUm8x+IXNVf35zUnNEJ86W45SrkO7qKT90TQc=
X-Received: by 2002:a17:90b:3a0f:b0:361:472e:3be6 with SMTP id 98e67ed59e1d1-365ac79e167mr6668974a91.26.1778141255317;
        Thu, 07 May 2026 01:07:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0f:b0:361:472e:3be6 with SMTP id 98e67ed59e1d1-365ac79e167mr6668916a91.26.1778141254604;
        Thu, 07 May 2026 01:07:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0560fa8sm1986094a91.1.2026.05.07.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:07:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 0/4] firmware: qcom: scm: Add minidump SRAM destination support
Date: Thu,  7 May 2026 13:37:16 +0530
Message-ID: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc4848 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Uf9RHLb8GrDHKnSoJrcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: sJGuKqMdew1AS09ObliDFLYm85kT8KqC
X-Proofpoint-GUID: sJGuKqMdew1AS09ObliDFLYm85kT8KqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OSBTYWx0ZWRfXzypHJqmdyMJw
 bWNwaT0afDeBO9B3+PF7xzv6MBVZzEoc5JfQbASQp1jNVFOQHFaMKsO6Jc+ulLmDhjvZ27HvX8q
 29MYbs8JjNrHya6gfDQnuoPwzusTyMklJ84uOmg73NBJd+mF75Bj9RolMoIjsKtr/JhDsvTYzak
 +p1lyj4LOGR4JmhWdhqb4TfYvwQ7p3052pLZPXqUQYnC1dwEOkAHpULGUuaicRX3lQvsr2vHaBy
 y/sBFljIv+wP3qPEh6toiZ9CdhxWxLJHA2EdNSPm0LF3kSrNylOESxMOioh/wgq1/L/+IKwGxWf
 3r3gw3MOQmIhGTf/s2m6YyhexZGPM3+qPhORkhH5KjZLHqbrc9D9PnBkQivQUU5n5fhVCtUOgdJ
 ojk70w9nlKONYd3g0fNqhW5WlIcA87UXDOFVLYQ6+82OZId6j6kDbUYidTesnKRV4zFUAFCXFms
 xhRyVWVxTZdkEVCEyag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070079

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
to deliver it (USB upload to a host, or save to local storage).

This series wires that mechanism into the SCM driver:

  - The SRAM word location is described via a 'sram'/'sram-names'
    phandle pair on the SCM DT node, keeping it decoupled from the
    driver and extensible to future SoCs.

  - A 'minidump_dest' module parameter (default: usb) selects the
    destination.  Custom kernel_param_ops expose it as the human-
    readable strings "usb" or "storage".

  - Add the support for Kaanapali.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/lkml/b33938e9-bb5c-4743-866d-4cdccf808a02@oss.qualcomm.com/
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>



Mukesh Ojha (4):
  dt-bindings: firmware: qcom,scm: Add minidump SRAM property
  firmware: qcom: scm: use dev_err_probe() for dload address failure
  firmware: qcom: scm: Add minidump SRAM support
  arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node

 .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  6 ++
 drivers/firmware/qcom/qcom_scm.c              | 98 ++++++++++++++++++-
 3 files changed, 160 insertions(+), 1 deletion(-)

-- 
2.53.0

