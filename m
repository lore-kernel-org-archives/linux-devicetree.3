Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39170370AE2
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784078201; cv=none; b=fimFsUBh5D787hLADLr5TjLiRq0SzIsS+F4zKoaTDHrFcMtkp6+SrqA6iYhVEhcqTbh+7HfG4vFDb3JpF6KnItILEZQJJi3H425/QzuaVQCOtb/p6Xss9zySHsi0cviWqTLpZwHnm6HVBwlHUxS6Sp9He1jC3TvOfIWEQHiXVJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784078201; c=relaxed/simple;
	bh=aFIWDU6AlfYlaPP8X5OcNF9jcaSZ/urzY1gk6bBHoCE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cePh5jQlQBo9ihYD1bQCalcW/eIMCdxvsS8k9Gbc1l2qW5ceuUJPBFKgUTfjJbDXWU7JaBrwV63dS8T6nnWL68wfTmioOL7ncGWA6mJSjyqA2phOqCpsCSCR1ILltRE7oz+/cNZl5W8qIg9t7fI0a43F/FcXET4Pujcx6cB3OoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iii4boXy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RO+68lDg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iii4boXy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RO+68lDg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0uXAo2249054
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pAtH5G57y5Gbyi1Jlqywtr
	XzbSjK544adRCQmBhjzoA=; b=iii4boXyuleGRQ6V5NlVuC5I8eyHZ6YgyCZQOx
	1zZSqWLNeL1bN0G+jwsidoGpONzkVtOPPQ3bLg2tIEswsMCIQKxwzwqDETz9GWa7
	EnHGaa7veKyZhZvFGblqkUi0ShjeRDOcw5s1lezsemkX3D6+0pv452AYkNeCSqng
	PfRQngf0op/0NPE4WguuQorCokY1ks0tsQlg76eyBGH99uhl1yGth66egjzuuaRm
	wkb42OlLx20Mz+fZCFutBSZFkW5yFPpZMKawuSRp1UXxeaiTLl+khejmtj/v05Rf
	hXKCeWt0pPtHFgxZzJgkwtOCFiuh2vgC64IQE6ARUyanI+yw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vg1fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:16:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce02cb769so20061425ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 18:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784078198; x=1784682998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pAtH5G57y5Gbyi1JlqywtrXzbSjK544adRCQmBhjzoA=;
        b=RO+68lDg3Scgsm0HRtJOzUb0djs6DXlmaw/af+jhz+ULV/F9TBdG3nK2bz4GW1d53G
         +tK42ZOh0EL0pIM8KOdow7HXpHBDQLTAX5cV69XzNFVlHqMBz9iqf+KCCihomn9S2p9w
         XIQclOakGmnIXLAg2OsaYjQduS1bAU2z5mjMhiunX+EEaBc/3CoB8Sd7UPZ0bB+czNDz
         U7BW45NgblB/bacptn3idnWpmzhNTCWXzql3B/JS6JQbEcB/9AEhvHFbiW2JlNf+77k+
         omAGJhtZMobnisqnmzHgcT2WuycRSwFoSbfIjOvEbIrWlsoHmd8A9OQqNwvg2Rn6MbCw
         qazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078198; x=1784682998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pAtH5G57y5Gbyi1JlqywtrXzbSjK544adRCQmBhjzoA=;
        b=cSlX3KTkr5e2qMu36W/8X4+U7t5jVf4RugDvOCbTdnq46LPCMN+BKRRPbqlz0R8Qtl
         rcfe6t4KB1/SG1PLU2+WxoCeFLCMkOvow87n3m4ygrw1nL8YWXQdtTUqTE+8186PR+o4
         0ZDxdzQguii1D1XRqLfkRBlJcMkUutiuTj29j5klhlNNwDiYzu9NsHCnRBtm/XSLsEyw
         WMfUhV2IQVWiZML3lQKyyIuPluOXfbQHKFjO1RWgR6YIIFURF2ZPN9C0sIeucH2fw91+
         YjKY+UZViZs4KvEUNXuwKvLPRIGeOMc4vkv641exvCBzzstIShxkChvL+DK3Cavja++X
         kpoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpY4Z2ihUWuTC2Dv4UW7OOiSeOWhdv89syrK8TbY1+m6fGnWAIvB2bcGrvroOKirs/CMluuVlDImC0@vger.kernel.org
X-Gm-Message-State: AOJu0YxeOCdNpnqAx3SPOqFbKvUa04w19bu082T/pMxTbGPzZHrUc5Sj
	5foC7sI9tZL41f6uH7TFJqx39eAfeP/obt3CHS+XoxaZvmJRIWYFLxH7C1Z8eMEGedDtZdfqoLT
	usFahhLK19QNLpPd1gbTohgvi321CugXKiHsNVFvFSz/4OXAvWPUrN2Pl/q1xMQTa
X-Gm-Gg: AfdE7clm1kiyWPNkdRc3/u8fKg2hdCGNCipDhwf4jStCj0LcRew/Pgl/e4Xjmf+YDbH
	1zKtktn8rxSbg2UN3hasyP+IBGZr3ki5dcPS+t2+pRFF5+Bg0oEW+mDgLCm1PnEIjnxsCia8Anc
	y/2n3/9tHu7NE4xX5+rFeosAffyxFmDBIKDGDEFvJocBkuJqBXcJQqAK4WmEdAH+hoKDYcSTr55
	RSdVToMm165P50sTZcOC5Bw3hZSuFPWCfConcCtd5jUdmknnVbsIshcylJPJkAWhsYpEwv6fIY1
	0M4qdGJT3206LExuVCWw15lOfZGqLsEhmTI1USrHumOKUtK59ouBTDPLw9vnHBS12JzqYkKv7dW
	ORE0y/1bvnyfVQTX+pPQJV0sZxXVq40COBSmlSMV1NIuK/2V3Hb07B6WQjR8VB0NQoa3VSdm6ig
	==
X-Received: by 2002:a17:90b:3a83:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-38dc74d04d6mr13821928a91.5.1784078198090;
        Tue, 14 Jul 2026 18:16:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-38dc74d04d6mr13821886a91.5.1784078197613;
        Tue, 14 Jul 2026 18:16:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a3fesm2207487a91.13.2026.07.14.18.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:16:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Wed, 15 Jul 2026 09:16:13 +0800
Message-Id: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF7fVmoC/42NTQ6CMBBGr0K6dghtaP1ZeQ/DorZTOlGodpBoC
 He3cgI3X/K+xXuLYMyELE7VIjLOxJTGAmpXCRft2COQLyxUo0yzly1Y78GljEx9nGBMHhlCysC
 RbtlCCMEqI9F604oieWQM9N4Cl65wJJ5S/my9Wf7ev9WzhAau0oWDPhrVan1OzPXzZe8uDUNdR
 nTrun4BMGpfPNMAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784078191; l=1381;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=aFIWDU6AlfYlaPP8X5OcNF9jcaSZ/urzY1gk6bBHoCE=;
 b=WEFYv59/YJRcXk5HjnUKTQ+mT91vfzOOTpTQoQY20Vt8nnM5uVg9+ccZhEhHFAl+sTdfH6+09
 fDtaLiZtefRAzHpWJWnHQCV0A7bNjLVlQFQvvbiro07GyVvMDvcCNA3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a56df77 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=anp7WcwJjaQlINPkyJkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lBD6HxbIxVouCPxJq_SorK3uIjm0s9bX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX0JDoouus3Mb1
 n0vph2fldY9f3SW2jeSFmU/5jWsU+RZRUH77TsiEI4B3DrwcCAs0VR7JTtb/s6vrmB8F3jI3W9g
 IREe8b6joPJmlHCFuCf63xP5r0iV+Z06lXULL4tO+VFsVlkCsW1SzLwUCUCfEXzBmUenL2D4FE6
 NCWcCjOGUpZKhNLun6SlJ8ApdhGw0gz+3rGu0n5IEfECIE9XrtmtvT5qsSpdyEOsI08OQnF8zC1
 ovkLlF2U2VHu6OYkdc8lD/56IKr4wKeLCEmXYDyNooJd5O8ZLaBg1AIcjSPdc/qDEPeHifUBYh/
 6DYV9X6/vnKhpveelyO7z9uVTb7jbBCpkXhoKgXOw9tnVg4L9vlG0EmXTPDvHLBsE5QzgJTqyVJ
 QZVoWCKq0NKAIYeSWR8cSAGttVSU6XJylwB4oSXkHQAxHbUiA72xvcpy481POir1NtHCqy5ZVaw
 j+Wx1OZ+WKrmzR59IDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX58QlOqxwyswi
 KfJIVPzGoE3Cp9BH7MCgeUHGGNW2A0O8dbIr8YSm9YkgW08nRq2VHElR5TPaiUxQFqks3K9LuB9
 zeJrXFrZWi87Dikdlc9ikzAyDdhIoF0=
X-Proofpoint-GUID: lBD6HxbIxVouCPxJq_SorK3uIjm0s9bX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150008

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
Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for shikra
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

