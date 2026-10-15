Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548002561A2
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043793; cv=none; b=HmlgSZ/RLlLS64Y0qyrx9+h9pcepv70PaySa/kkt4KwXR1KpIST6UoBUQ0Dlep9u5wYNAuswwA2caiRoS/GpqeHBffjbUbFfpQICoPa7GZ+vKUVHZW13CRop+QkukWejsfUQsZXXWrJjqN6XXM4XwOsF5PDG0Fu/x64IcszHDw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043793; c=relaxed/simple;
	bh=lumv/JLyOvQtH/70SPzhAgF0+nivbzfXBXXhMfIRVF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ckZ3J4uIesJn8+WLvx5GnhPP0PR+hX5pxpidPy6suHjIYiKnNYAyE+gZ0EMitTXta4gIwqrPfMIvd4MPEryb3wvxqcPVPXu779R84IjxzOsFAlqYpJw5tPCQwQyal/rISkzBLVipsOHJ4nioD0HpuN2cCfZiAvvRYPW0sr5PMq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4s/9+K1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcgK558M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4s/9+K1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcgK558M"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F047QR1682876
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A2hCyIQQPN6QAg3xSllRwV
	oRnMo15TmgFA8Mhq86Oms=; b=W4s/9+K13Lzs0vvvEl07xGX1x3T44G1s16/4c5
	BI9FHjU9Yj1DtCtt0YJHiBdBo7cH46OP/bPjHd84KqtWcRRBbhGrdrvUMyd2g2/K
	q0ZaWRQq2LpL2Mkk8quJt7C8FrETMFUhlCiCJbqv5Ggvfxbl+3xjc2fOl1vK/O2D
	frvRoVjsxDxcCn6QGA4kuAujDqty2dyDP1q9YfLC15eXWUAqbg+4Ik5oAdiPlLv1
	85XMCimwSZsXzeKOMNFF8UvBu8oXuutzKtCtcXPjMPay4ISGvKdGfNFszEGGRzhG
	CySch/5fDQMnauCsfONgt6JK9S77Sxq9puU557MABxq95/DA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb02w6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:56:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso7424760eec.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043790; x=1792648590; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A2hCyIQQPN6QAg3xSllRwVoRnMo15TmgFA8Mhq86Oms=;
        b=XcgK558MHK7Vrq6XBNu2YEsUjYMWiRXQ6tmoTqhKm1S5CVrNsHF3MzCa0xGYM1ZAXm
         GQmX2tJtcH/e0YL1Ahj848TvnghjgQJG31mOVa7YFohoqgWD9+f1cX3dyRkQs8OQ+q4x
         vWD2OqhFlLYyKvOGe7eQnDDQzn10MySngfQkAYzcTC2SfnuNgUqIZO8T2qhZrhOD4KHw
         2uS/xkGwf3r3FcCFV2K7N72CjIdrfni7m4Fs/Vpfa20PMdIJ7Exu/yvV+ZTHGCkZY7rS
         IgsMCJaGyRWVuU24ZYtUidFZeMUsv/lxWFpK+FImEP0XstUoW47GkRmIwQ6gUPz3MbUm
         uVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043790; x=1792648590;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A2hCyIQQPN6QAg3xSllRwVoRnMo15TmgFA8Mhq86Oms=;
        b=p74CADprWuB1Oslua3IYTRaB10kVBjyrCOYmYIK/2MmpT5ymfYO19Yd2FLWiwLMcd1
         rM3YJBTp2b97zbGRThzdAuRo8sfLZmyoEpMc+k80vkRllltZs8R2mqqnnuuvs53htmiT
         8dvRtiCmHu0TfuDn2XUjjul9y0yD6GhA249GMqjeFANzqihhVDc17ERbO4ZQvDyk0fqw
         U0ezlnNDLfS9U+TPLsHQ6MGliijRXxFWSdzngnTrUMSpdy5dOI+9+F1RqhTCNGnsciRW
         apu2k3xLTQqmciog3GChMYsJ31COOI5dJhp4DO5qkcr9vphqLuvDED0zy1sQj9UogSoa
         wWNA==
X-Forwarded-Encrypted: i=1; AKwUvByBIs1agGguk79gHgASZa/kPkcTeW+eDOher30Z4HLmKR85arJKFmbl57M4HjDHelSKi+Xo1E+rPR3a@vger.kernel.org
X-Gm-Message-State: AFq9FYINlDQ56WbVS3ulb1UM1t6bGln8+Df2PcBYZvjIBjnc0lOL8sFn
	dyzuqggXAKxj7i5cy5mSUbtOIKGKgiPCYvG1j8bgZcAvPQJB1Nd1jeZc/DOq4kjuro+Knw+4hy6
	BcBdpz3x2jqQYsNz7/bJ41ckKrAbNU7JL2TRrMJTvXVW0C7HnTM0fbRAgNO1FNTbA
X-Gm-Gg: AYBFou2jexsWxUr6JEBDxM8bZy3MS3I9jpkj3zduILaXOKrCpcI16vLHN7K/zlg3bbE
	2xI1qf3LFTifVgqd/gH7g/o7BV2yQ6zWRPfs1EZELR/5xX0tLo7uuANDS3vNHVHWc7MoiHUZvtc
	O+GkxGmFbqaFYQofWV7+4/wqPCNNxnbS0re61NUR+3FzqQOrk7kNaBCdYJ6XZmJTMbWx0uPjLaU
	RejyCDg48ect1OpT/FZpSfjLFGkUhY7frupDjfxSibW9FKEv+ud2B+QSkGwhQZo+3GR9dCymZWM
	eUKsUR7tHnuT0oomVp/G7WwuNV9fgrmEsedOGtC8JDyEyngM1Cj0fFimLt3YggNLU59rhDKj9VX
	0OJrQ30RjvOMoBH5j2km9Xif4xABqHeUaZO5rFbLysRniDI3dGve7sZ2GeG8xOPECUQK/z3hbTR
	7kK/Cmx2+RrDM=
X-Received: by 2002:a05:7300:e9cb:20b0:358:c707:4c3d with SMTP id 5a478bee46e88-358c7075049mr20219200eec.4.1792043789747;
        Wed, 14 Oct 2026 22:56:29 -0700 (PDT)
X-Received: by 2002:a05:7300:e9cb:20b0:358:c707:4c3d with SMTP id 5a478bee46e88-358c7075049mr20219177eec.4.1792043789181;
        Wed, 14 Oct 2026 22:56:29 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm64791975eec.0.2026.10.14.22.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:56:28 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add Glymur OOBMSS support
Date: Thu, 15 Oct 2026 11:25:48 +0530
Message-Id: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAORq0GoC/22NQQqDMBREryJZNxJjFdOV9ygu4jdqivptvpGKe
 PdGu+1m4MHMvJ2RcdYQe0Q7c2a1ZHEKIG8Rg15PneG2CcykkLlQMuWINSc/z+gW3g3b6B3XSt0
 znaWyqIGF4exMaz/X6bP6Mfn6ZWA5n85Gb2lBt13WNTl7lyARQv0TrAkXXOUARdsCmCYtkSh+e
 z0AjmMcglXHcXwB40pH/80AAAA=
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792043784; l=3143;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=lumv/JLyOvQtH/70SPzhAgF0+nivbzfXBXXhMfIRVF0=;
 b=k6uFWDZZaxoO+16SXFvC0IFayik6ugC7lYRub5Yh4FCQ4MN18+Ly7v/NgSGTd+5H3Nl9yLBox
 PELKREMpEPFDLgxAW8Xgcwqf7xRG9X4f5a1rpaxL57F5v9pKe7bU4i2
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad06b0e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=YuCc8ovvcE5DR3EE8bcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX49fgvrhDwrxY
 t5CAbNnw3X+SY4/IvijsLkWI8ggfOALWal1NJIFlH9PNSP9ILxED0Fbxr/2RCCM1D2sDW7FEQPR
 R78pfgEQBUg7bqqiOnbFF7wkGcIx/XM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXzgFwuITgFbQk
 Mi+YamEoRffG8McEjG4TVkDoPTAwoUPOtu5DBRi9rFwiM7Vp5knRkZn0+252Gq74hhMyMEYkz2p
 tN++IQksg9gCj0lJrT9a+yc8BWLQd/8mfIfQU/+zRssohxdO7ZNupyCCPrUQr6CZWZsD6cr/TB1
 izAopjAJtP3L/lwvqdr+pSrq9Kxl91Ff5EC3qBLGW+rKUUwbmg3lvNvlp9aQ9RdT4pQ1P2A5u/s
 ZEBuXriFQsrpoCDka8o4ii/mbNGeO9Kdp6uFnl2mOuxn/AscELmWhnwCsxMoRW0yIVxnIGe2Ueo
 EoGyqbQ25gsbD+5ZAOLGZWERgImKPY2q9jkFsAkZx/GwzrE5zSRSzYEyTfSAMnYGqxzpPdtm22e
 qNvG2AT/YhmShSlMH9ebfgW6T2GFW/oxazaOIh3omWsvn8wwf6G9I9ScmUDR7fyNVxHAlYun3ye
 Xg/191iQAOyuRnQNu8Q==
X-Proofpoint-ORIG-GUID: EyBNQnmckmQbpYqGwlmMveMkm5f6TAf5
X-Proofpoint-GUID: EyBNQnmckmQbpYqGwlmMveMkm5f6TAf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023

Out-of-Band Management Subsystem (OOBMSS) is managed by a common remote
processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

The series adds the OOBMSS device-tree binding, generic support for
secondary images, Glymur-specific PAS parameters, and coredump support
for PAS remoteprocs with secondary processors.

The OOB diagnostic path also requires Diag Router support in userspace.
The related open-source work is available at:
https://github.com/linux-msm/diag/pull/26

---
Changes in v2:
- Drop the redundant “binding” from the subject.
- Rename the binding file to match the compatible.
- Remove the IPCC definitions and invocation from the example.
- Make the coredump commit generic for PAS remoteprocs with secondary
  processors.
- Shut down authenticated auxiliary processors before unmapping carveouts
  on start failure.
- Release TrustZone metadata on all MDT load failure paths.
- Assign secondary PAS IDs only when the corresponding firmware names are
  available.
- Keep PAS carveout mappings active while coredump and debugfs trace
  readers access remoteproc memory, avoiding a use-after-unmap race.
- Support coredumps for relocatable PAS firmware.
- Free registered dump segments when removing the remoteproc.
- Move the Glymur OOBMSS PAS parameters patch to the end of the series.
- Link to v1: https://patch.msgid.link/20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com

---
Anvesh Jain P (4):
      dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
      remoteproc: qcom: pas: Support secondary images
      remoteproc: qcom: pas: Add coredump support for secondary processors
      remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters

 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 367 +++++++++++++++++++--
 2 files changed, 492 insertions(+), 29 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

