Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B979227467F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751963; cv=none; b=W5mr/TuwGVhw1KclQMNhh5wUbAtoA/tdtmzD52NdmMfbv56Rs6/fZzwoXPz4nRejUyPWeV9z050KlxBjgv+fPAlscYvQVhXfXkYPx4gMg5sCeE+kF7Mq7ScGygu5//bVfEFDalU90eSr6dEi6NS4bo+Xb+12rPNKa+IAWrnKSCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751963; c=relaxed/simple;
	bh=AQp3ZzFGQIxMGUgev5a0WH6gQsFnNiiLrjLAVfK0jbo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CvCW9SrxhppCL2VHxYalTD2SsI+ct23JrHpk0TUK7SnkDULMKHoz1CAWffeGd6dRmzecg/vzd3RTwJIw2u62lm4vvUPW0bNuPruejIpGexMf3/egfEADFn1fyKvvbc4DyXNwrjcQBtjrunvE4c8QcbapW3H7xbbn4LqbTZPiIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrVmYlJe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SNS+s+ry; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrVmYlJe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SNS+s+ry"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBkVv1909143
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lVVXlwrDpraS1EuWGFKN4P
	A95ibIxivwprgpu4s411U=; b=PrVmYlJeQLnOGXbM/rVA7O300WFadHHcrCI7iL
	9YkZGSp5SMAO+JEZqFAc+hF6VnsytiYFtaFGdniysh/MSRmqQaLCaiAiA06umgbr
	6YELij2KdV+vta9Of2yCxcNADIAt2WeqX6lAXFz5Hqrrn8Qbr7cipcbkUJwV+aw9
	Za7cQKKGeWlITSxRJB6wdXQWCc8bwq2NuKGN0yBbPxNDjl/wOgRWaLwspeRoK3k8
	TwCbSSxrJ5NftYm7RIqXR+excb0/8wuqb8zAvVFfCFy9482wg1v2EBWrqP2qrZw8
	dKlGQcv7kdDMbYzlrBI0UsQj6q6CR6W55fAcaED11QmmpUEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1sgxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:45:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968dfff779so473930a91.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751959; x=1788356759; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lVVXlwrDpraS1EuWGFKN4PA95ibIxivwprgpu4s411U=;
        b=SNS+s+ryTqjG/jVTYgdG3MLqQZauzetoq8kAUlDC0hHNRw3GR7Lhk6o9XDYf+JXNSJ
         61Yyl26IDdKwIK+zkMAslzwYnHBaTEwvSsG93HQA/l/V5D/P0p6Wc69LansU/STJI7Ck
         ZHrl7s2pt+47c8eJHM3t2igolgn4K8UEe20li2/HbZJsi2mAuGktEVD+LTqRP5SneryM
         xUlEoWZUDWYKlY+VsA9LIWZKJRcW5Hd6EUVQfP/+nYq/dxgxGoq2Or7uacaYUOgmGBmi
         xVA+9vJhJ28bW/u5sbI1+ts8V46AexBgF49fvn8E702NKgzyuWv3FXJEK47o0FcZmkMw
         5I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751959; x=1788356759;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lVVXlwrDpraS1EuWGFKN4PA95ibIxivwprgpu4s411U=;
        b=neDsjxI857OSq6ENOOFnTE4+DIjgIiefFgVIWj8Y1wfjl91/dGf0Qc3Cwpb7rzExus
         Q4Dg0YGxLJawvSfW/xcp8CyFOSP6hm44/I4aPJzSzVO5uGvrusDEaTclHi317u3igix8
         ghH6C9b1maP+GbkfFt15w7gtEW3PrM3+uo5win+ithCqGCFK9HqoYzW5oTog9ScVdIxx
         OzkBl0rnFFQICDcEz33PfYrdl/jwaBQkIDEOXuWhW+CMdGTPusAfUKa816tGtvdLqgKc
         4EZ7AOBHasnS1YThf1VzX82Jxgetkngp6Ke7pmpz3eSymp/YcKvlhwonzmYuz0NsyszJ
         hufQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhV/74x6gPn1IqAPBPicAnZykiISemHPAkwPZH4PPTDryhN4ServPRzfO+hGjFGc+NKXVC7dKkiu9j@vger.kernel.org
X-Gm-Message-State: AFuF++l6bNywDuN5CvAkyMTpQvmCoydT0M3QnYBrldoBulxWdGZ+80IU
	PnMJX68XCAPCHKrekCJbjgfUPO/cQgKjPgFHyeo1YCssH7Ol846JLBAK/w/OmQOz/BPH1RnASf1
	KD3cWp19AB88IeGa5wklh5aFc2uS1JpWhjcAY7XdVdqg2ba4IfX7n0E8sfsNlDZpe
X-Gm-Gg: AR+sD13dhotyvHrq2/7bwQ3CMPvfTMaRKtGMs2VhQUE0vCAIzhQceEX8uoWvgPx1dri
	itUiFsOsUOfn+Ztbl8hpm83dW/sDEFFCGZ9qcuCAkYCjlP0DvT7PYjTB2sTZ+2EK8idazsKAJCk
	w6qpexOYIAYRHGf176uyvCa7GU5rdz38PSFfeTytygfaovrr7GV9qMRjmVH2PFK6eQWsaOuzxQ/
	Lj+QSSOZ2iHuTODMCoLbt2VjB/d4kv/PtgeueDrWYFTcRKXXnqbAJ5LuRs2+/59ENGt94t0W+kj
	7Gg2oGU2xrE04zeWSNreN8NOm2Z6hanujt1UnmyJBJRUGTU7XnaWVwDSKIopMmYQ3qx6/q31p/C
	IcVdvyShh95n50rLksxP0gDIVHs0M2ES8cQ==
X-Received: by 2002:a17:90b:4d81:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-3966d8e8063mr7894150a91.9.1787751958574;
        Wed, 26 Aug 2026 06:45:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4d81:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-3966d8e8063mr7894064a91.9.1787751957965;
        Wed, 26 Aug 2026 06:45:57 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8179696a91.8.2026.08.26.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:45:57 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH 0/6] misc: fastrpc: Add extended IOVA mapping support
Date: Wed, 26 Aug 2026 19:15:42 +0530
Message-Id: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbujmoC/02OSQ6DMBAEv4LmHEvDYjPmKxEHLxPiA0tsQEiIv
 4fAJcdqqUu1Q+IYOEGT7RB5DSmMwwn5IwP3NkPHIviTocBCIRVK8Dbz4NmL3kxTGDqhLZJFV+Z
 IHs7bFPkVtkv5bG+O/FlO83yPYE1i4ca+D3OTGapQsXJoa106xpoIc62opLJ2FZKUVkqtJfwXN
 dnVo1ALv0wicfp1J8GmMM4Yl2tdNWsF7XF8ATmbigDiAAAA
X-Change-ID: 20260826-extended-mapping-9b08b0c3108d
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787751952; l=3128;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=AQp3ZzFGQIxMGUgev5a0WH6gQsFnNiiLrjLAVfK0jbo=;
 b=kM2egXYF+WCbAy4qPAAH2BpmOef0OYYIbft1VAzscD98XzphvisNkTKE7EB3aJ4oIsxy3dGGO
 2odqsO3elrGBd6HghJdh7est9z974QicZKu7Ddtj69xeYsaSby1tmy0
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: 3EIG8ItZwTYJw8W8QyTEihchFa6dsbBb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfXzDjNcatb+RtB
 hHZ+aPho6ma8WvqQY8fdihLluQDKBkCWBc6u4fh7W7yFdKiT8mp2iFEoR50o5pifyq7fjEsgw+N
 YE5NJyPHXJXQZj1XSuj/ZQtJPBERi9qoSMrVvTNgd13GS9Nqs8eBjRmrS7IUwV/gxzlPaeJfxLH
 YURyCLpPteECm+3hrdTneIRR04LjreVVzzBhjjLvTRIWNIsK87SYuFZc1HD1+3oxuVvppUYCen1
 rfciPulZrFPk6r3V8CqrO+yeX3+rBZtV71gOVKf9+o4eYA12YmRw1tBWJuq3bFtAP0a0IigWUB8
 gVwm5l6Vxpj3NT/woKGPGcdziOyU5N7SNEe++f2pqiFrtQQyixkdPd1PS8Rj/4srqfoCL+Nk1OS
 C48vb+NveJLfVdMkzCI3IX0BR2mWc36HVt3O4v23DYE//nwozjyI0i1RvPHwMxrFPXGieGMm4ht
 fryqZjKOVVtg6x/ZADQ==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8eee17 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jGj642yAPOClK7eN77YA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 3EIG8ItZwTYJw8W8QyTEihchFa6dsbBb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX42Yn67RHsISh
 en9pu2e8JMdCfDndcv/QpoIqC2IT2Fzv7x+NAvKtHVfyM4/IuOSoMCkITdaNHFfZK6VIZPazvou
 YI/Re9v5ckEFVjQsnDR8m0ue44R0FEE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260113

FastRPC context banks on kaanapali and glymur are limited to a 34-bit
IOVA window. Large compute workloads such as LLM inference on the
CDSP require mapping buffers that exceed this range. Dedicated extended
context banks exist in hardware but were unused by the driver.

This series wires up end-to-end support for extended IOVA mapping:

- The DT binding gains a memory-region property for context bank nodes.
  It points to a reserved-memory node whose iommu-addresses blocks the
  lower IOVA range, pushing allocations into the extended address space.
  The driver uses the presence of this property to identify the context
  bank as an extended mapping bank. The binding also relaxes
  #address-cells and #size-cells constraints to accommodate the 64-bit
  values required by iommu-addresses.

- The driver is extended to read the correct SID from multi-cell reg
  properties, which are needed on platforms that use #address-cells = <2>
  on the fastrpc node.

- kaanapali and glymur are updated to add a fastrpc_far_region node
  blocking the lower 16 GB IOVA range and link the dedicated CDSP
  compute context bank to it via memory-region.

- Extended context banks are shared across all open sessions and carry
  a 40-bit DMA mask. They are kept in a separate cctx->ext_cb[] array
  rather than the normal session[] pool to avoid mixing exclusively-owned
  and shared resources.

- Two new UAPI flags (FASTRPC_MAP_FD_EXTENDED and
  FASTRPC_MAP_FD_DELAYED_EXTENDED) allow userspace to request extended
  mapping. When set, fastrpc_map_attach() iterates cctx->ext_cb[] and
  retries on -ENOMEM, falling over to the next extended CB if one
  exhausts its IOVA space. The SID offset is corrected per-CB so the
  IOVA forwarded to the DSP is valid.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Vinayak Katoch (6):
      dt-bindings: misc: fastrpc: Add memory-region property for context bank
      misc: fastrpc: Handle multi-cell reg in context bank probe
      arm64: dts: qcom: kaanapali: Add CDSP FastRPC extended context bank
      arm64: dts: qcom: glymur: Add CDSP FastRPC extended context bank
      misc: fastrpc: Add extended context bank support
      misc: fastrpc: Add UAPI flags for extended IOVA mapping

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |  12 ++-
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  37 ++++---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  35 ++++---
 drivers/misc/fastrpc.c                             | 114 ++++++++++++++++++---
 include/uapi/misc/fastrpc.h                        |   7 ++
 5 files changed, 159 insertions(+), 46 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260826-extended-mapping-9b08b0c3108d
prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v4
prerequisite-patch-id: 15f76eb917232e683ce9271fb3f0f465a4d60abe
prerequisite-patch-id: f225961fa033cae9dce14a906752e1232b052290
prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

