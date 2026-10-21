Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568232;
	b=kzS/rx/M4gY9XyFh300V40CmYrsOP5sz2I/6l4f6lTmEKC1isI4TP2WVBUWiBqJ69oPR
	 9BTy/P+nkQJsDyqroOASMCgv4kuxvX3qGS3Rki6qOHlVArrvk2G/jdHyxQCP3iKpsAjrI
	 6hwzxgJTtXacUXllET0tl3efsNlpJrzR+om9xCNzJH12oFZ0qucifL9iGLjgp6htwHfxu
	 eX0kS8bx+FOjg4QtyD6IjzAF67rx14kTJzQCKJVPk6/nWktCIR5zFi0Q3Fd3lPNFRUOaI
	 SbjBthVPXPmjCYB+qsczQavcHBd2fVGZ1OvWBdbg9hINKdG4J1yAn0EpvGChy9LJP7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWel7qB4uN8=;
	b=ZdlVBBzI0b1wVF6e7F2orYxeubGFkLsnCxV+hWr4shA+FneciwWRm64UeJPgG7sunlTJ
	 17yjw2HMcwfT5BT6p6N6lGntiEkimLeboKmBMHBzAMDB5YSsXsqO+BZMSEgLC/2A9LwLp
	 QXjI+C35jxsHzItwwzp4pZfBRlyqkKJ8vjoG5bWXJpR+xIvIKdQmuyVdt05rG464SFlmc
	 WbB5gc2UxeyyGXXhAo/r7TtPNPjW2itr8QJ8zhDxmFq+bTJEgkVV+nNEWa2x4zYWwo2Sz
	 h90QHzzhe+7eci4qc2ciKLg3gHFDhkwJRFuLvw6sFn+JoYDYsbMlxxf/5eOJTE9ThAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSPmCIGv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH4mUFxn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55724606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55724606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSPmCIGv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH4mUFxn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jOTL3573327
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWe
	l7qB4uN8=; b=eSPmCIGv9OEppJdMHqrGPqiV8wCu9d187Eh/9VFPGW89rbPKFuk
	SgZ32OKgGqxFjqLpqcd/gXgqj8bi7EY7wNS407fhgrEJmrq1ZIrP2ZFBuHlnEuDD
	Feeaee3Y3yHhZtfhF3SNQKmmwVSaxvtlILvctvkT7j359xQqCHXKtR6BWWY7VFwY
	HdvH5MtcdwyxvFNbXP9j85wD0qRCJ0UXoixFgVhWeKrGDqTwLmksrvPJk5V3gfJi
	EVzyn+MWx1gUDBKghaj3ba98TVwapUp+xdHNLRbNYmVzGXjDnGxCCdDwCvb7muwC
	B87UgaDDYtUDncI7nxBRGfbIgf1n88fmDMA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htknv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-366c279b454so889836eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568229; x=1793173029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWel7qB4uN8=;
        b=BH4mUFxn0ULmvuyBws4GKxkoKPIQaDyFYZ2+v24z02ShETiOLe15Vb1qIa1V+hXC7m
         JP2SK3eAPhS4MbRUgZtBPgEn/olph9YZcFsioETCtVk54ITPXJOjn8s7hNsjqS117wSa
         feFv6qzdj1ZLKB0INiU0M5Os7/z8EPaTG60NQ2rpJU9CPMVVNcLf6WTTG27DAdLvD6wc
         VVm/wZK7CGfihHO39pPF1DsI7BLTtse9vVBAWKnQ9P63Sl+hdyLeanbkuVXns3zl6Lfs
         xc1k3g+zsGMJSvij+zGnASWp21VnDf9TW2lCJHcAz5fLhco3h8Q0nlCSdD9eii0ujmbz
         ioEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568229; x=1793173029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWel7qB4uN8=;
        b=cfeo9FocqU1yC0bdiQ3WHZ8OmUjnXByQVw0EtcZZl9za3YLNwbH7gEWccdkbXgpPvp
         sd94Peas1b3irg9INWmoH/mrF+hxP+bcq4vKezRGDSCpONYA2hkRT7L0106m0B/R/WoU
         SBxfuSvfYJcqqw4nQplXc0ePE2Q2kFAU/PtLUKmlLV4f82KV8KTSgRNjKf4NXdSnZnyX
         9H0fGp1m3NaoQdL7Y95/8l4p+KRH/Tyd+r3In9fkp6qH0wM988KKpJZ/d6oEz0JEw1eS
         UvWr75oSpDFBb3wPrSCEsuXCUYcan8c3p5/e3FBnkkHTLW871p/wHSnm7JGylEm+yQ17
         m+bg==
X-Forwarded-Encrypted: i=1; AKwUvBxEuoEbGknFPaZoaBH24dSb7QVwMRUhYhkWj9U8aNb/RIkczvVN4z1ck0cMrW1pGdKk/3y+b6KXo2vF@vger.kernel.org
X-Gm-Message-State: AFq9FYIy1eqpnySHSqMz/SEaLwVzbL616gbpX+aKTavXtievSiAybGc+
	3hi6M6STRosKqpDO+PRI7haY/GLcB0OL2mR3pcfsMpMbYYMOUdZRWXlk8f34i7RDSOkqQi/XXUb
	y8c9J/uecKGd5U1pqh7n6gWJQB+V9j1JZlcPkhPW5D7aZk8qFKcuL5cJX1lidNDz1
X-Gm-Gg: AYBFou3ouQ2iZ20JKTNGiqNc8SKuaNgvN4vJVRsrNgSm0TtOU8pED02OsDkuKHSW2nb
	ObJuUe1uXY8dmQmkRydmP756/8zOKPpCHBj9wT/j75jdSOUMO72BW73G5R69PD0CRluDN+guMoz
	gxbOGyhsFQ+kFTSLPrx8a6vCEqqU7wJp1S2xDeg+TvPKoD95h8PRNBE0rrU07bEx5CfZZF9qCp7
	Xvv41RqVCmAWcQWmrJOjO+vRRGqEcOUVrm25Of/9cwx/8xEoM9F0m71vZQ/ekTpTQnasKK+Ywlm
	A2dO8+L4EgfvYekchSkNqPU6W1oN5x0P0EF6HeTYd6o/B+1V7QaZ415Xcx4gZj2t/TVafoRm7BG
	RSUKyz3YTCGm7epmk8qIxUa6r3AXPaESfOXDH5Pahxuv5GvLkEqEdCleTBX0=
X-Received: by 2002:a05:7022:7e84:b0:143:4450:e1e6 with SMTP id a92af1059eb24-190a7660d75mr1788380c88.35.1792568228914;
        Wed, 21 Oct 2026 00:37:08 -0700 (PDT)
X-Received: by 2002:a05:7022:7e84:b0:143:4450:e1e6 with SMTP id a92af1059eb24-190a7660d75mr1788331c88.35.1792568228241;
        Wed, 21 Oct 2026 00:37:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:07 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/5] arm64: dts: qcom: Add audio support for Nord platform
Date: Wed, 21 Oct 2026 15:36:28 +0800
Message-ID: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad86ba6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zx-u8faYscwgyrAVXPQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX8rDmYgu94erO
 3JY3gOYHsUW5PNHRqBbJJwYmzuUQi/PXOECVVyN4sHRNfFxLPlGYL0/ul4HRXc0slfWZMPIxpHi
 6XBb0fbo//z71x7PM8wz5MN+7fMndlo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX3pu7DQ+YWz+X
 +KlGOX7J81XTTkfWLY0yVUzws/+uDHgpw2Mxf+RoZopu2e1Nf68aWkVhc/x/9Oj/cfqEqwG617m
 b/3YaY3KWgoDvzSPGkeC5cqpYs6PklALJv8qfkT57NVZ09DJqCy4jfaSKFTPRStC97cx824kdpj
 8PVLY9dTf1u+h2pnDIpOdu5dLkpReLSmRXej87RAtU9oIvBzTfR7A44SSKZaJqGkQ0WXFRDJ1dV
 Y1JC/+Keer65OavhGEqgGDzFhGR/tfVAVY1CuVWMvknQJkbKx4FJbIPVemEcfPM/OHkll95MT4f
 ajnP9U48Gri2bLzDWyYiHNbE1QRbl9DX9BODjZcZ9RL+tMYHPYIJmy29koEigvr8v68BGheIw8z
 TBFYj85CdPtlf5QJ/ycFZEL6q7tA9yeIkLRaXnJx23mTVU/xT1Gpq9aIBDNXA0yUqL633wU4+bk
 wgeBa6mNNdm7EZXQj3w==
X-Proofpoint-GUID: 2ye8zY5f2A1xkIicUlFUcPKGoPFiyHF0
X-Proofpoint-ORIG-GUID: 2ye8zY5f2A1xkIicUlFUcPKGoPFiyHF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

This series enables audio playback and capture on the Nord RRD and
Nord Ride (nord-ride-embedded) boards.

Dependencies:
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Rebase on next-20261020 and drop Assisted-by: LLM
- Tag the series with RFC due to dependencies
- New patch for pd-mapper change (not a DTS one but targeting Bjorn
  as well)
- New patch for i2c18 pad drive strength change
- Support both playback and capture in TDM mode, 4/4 channels for
  playback/capture on RRD, 6/4 channels on Ride
- Use lowercase hex for iommus property in q6apmdai
- Control DAC_ENABLE and CLICK_POP_MUTE_N via regulator-fixed
  and simple-audio-amplifier
- Recreate RRD patch from scratch (mimic the new nord-ride-embedded)

Mohammad Rafi Shaik (3):
  soc: qcom: pd-mapper: Add support for Nord
  arm64: dts: qcom: nord: Add gpr node
  arm64: dts: qcom: nord-ride-embedded: Add sound support

Shawn Guo (2):
  arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
  arm64: dts: qcom: nord-rrd: Add sound support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  32 +++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 153 ++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  40 +++++
 drivers/soc/qcom/qcom_pd_mapper.c             |  14 ++
 5 files changed, 404 insertions(+), 1 deletion(-)

-- 
2.43.0

