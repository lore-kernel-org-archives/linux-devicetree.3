Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993023;
	b=DZY5OQtsOtc1NC0BUSzKg6mAQhadCTPUPrd8tGD9D2XYQx5l0yRe7E8SvlEivphRn9AV
	 oV6lwIroR7arGRQM4I5GLpPTo2FBtbho4NvkpvxbEOSL1BbNSz2idBExOQl6bSORSlb0f
	 tXVtlgeCQh0e2exuVexClw96WujXzvKWWdz/i8nY9YQv2JCw8Yycmvtdull2jDDwNnrvS
	 B0SU112PwFf2O+p4N91n5GAn9rcdntDRepnA36MRIkUhh6OBaTB6P352Tzv5Wuw8Fq0Vm
	 hbZCR1v/hRxgxC0jpzeFXozhEPg2E8wydWlSBqw1vAxbKRWkHyAoypi5sxo/d8Q8PEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hqJRXOoxftCGEgfPf5VGXFGD5TQ3O48MegfhSwXB6ss=;
	b=bSsh07lZ4CAUvFoUXDY6Vx+KX4xP0cJOwyn330tsc7DJUbTWCx3jL1KPlBgd9DBNR2j9
	 jThdSA0cRIXtMMBjn75WiPlFAli5n57E8L2Vy6pEYk+2WImccNdJtQsrf08lsAuvvfdSQ
	 91rcy6dvChSEYlIRKQ/dQ7OfeYQNOQwTTNKvr5zzp4giWrUFaCtcf0T1xjAFo8PMWlANj
	 sJqCn9oQAFiVCqMDJVY1+cAxZBrHqdxJ5YNTBnIYwnCfe1iX/DycxKzvOAip+MQbLT1/+
	 QN0//68R4AkIlaCGFZvdN9EDb1xctYIQXnFmmly36HLIjZBh7EjJP8jM3ypiu/gwwAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTmHxQi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZmeOI66;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2324606A335
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2324606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTmHxQi8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZmeOI66
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8XiIY3371277
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hqJRXOoxftCGEgfPf5VGXF
	GD5TQ3O48MegfhSwXB6ss=; b=RTmHxQi8Kza8pVe54yjmXH9nA6j8MoyI4Udi+5
	LMzXCxnVA+HcCS75/MImmEYnsEm5Bw53srLNPSiBr9nNSuuqqs2/WSFfbBz7LQdH
	vzCpBwtv6e5jyyfNWbtUPyK0SyfL1XkPQFgOC91TV+suDhM8BhJtLVv9Gd/1hdFi
	MkWJ02XpDHd4L81NUOCCN6vRBtN3cIEEYwyifxL5jXxlTPjfGmBtDZ+Ch28AzIzs
	Xz1MxwxiqykzzYhpmRkXTztTjhoay2gjp3KBgaods1/xh2mwHk6oREvwoJ040kGW
	MO+Fq6orkqemA3d6pStiIoY2Thie2umh11OdcNXXdGjVjSMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8t6vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:10:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso7236915ad.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794993021; x=1795597821; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hqJRXOoxftCGEgfPf5VGXFGD5TQ3O48MegfhSwXB6ss=;
        b=UZmeOI66gXreArr7IYk4xOUk0TO879DmhjrhC8luGtj1wOtwFPj7ECfPhXsYuAaqsS
         rxD5HVCUNYY0Cr4BpHnPhM+xEGtOOrjYNLGW3NjOzp5qx08bbrBa1C9sX6MVPq4G5jA7
         iHpk0mQhgeHGdH2nv76Ps3ZQE6SaCFK8T/pZ5WHdYoi7v/4osyVOUeHdL70+8uuTUC8H
         08AfzIE69qoEDPfh7kpZHU7K55kVgrvtlhUfYOuLIN4p4rdNlX2B22kILtqdY9vAxocG
         4CUTvm1M6cAc/eQf47JM/OsrdUzBUHPzmFNOMTb+vIS8qW+oiWq1SI9hk3VUGYwvfM20
         B9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993021; x=1795597821;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hqJRXOoxftCGEgfPf5VGXFGD5TQ3O48MegfhSwXB6ss=;
        b=Q3Wm+VoKrXBGNPw9RnmN08+QxXdLcvBa0wLJBPCPzbpDbn26JaMD6Mmafvzb0Hfe+K
         v+75iNg3q/bqr+odH4/4vvafKsKZwB62GyENmuVarlbyez2If+KhBKkdf7IE/3IGFodl
         GmZXzaSQprM8Gr+2NfMlqiwM6lqOV7BNBZWvZnaCmu9O6GGtjeQsmW06ebJoDjsCXdqw
         iFJsYKOP6m8KSCJjFNGSCSzVtYkN+XA3iWDwThAS99n0yy537s1dSzon0hNRXhV4UtFt
         /r9u2csfRn1+xmcD4zsMz25V8VddXj2Z8WGglF6s3eDQ/vlfhdkOpiWg73gF2brX+W5P
         hAfA==
X-Forwarded-Encrypted: i=1; AL+hErHtO5+bvhN3Eewxxa0iSxQNH5294x3VgThq434qN0+Osvg2+OILC+7wcBDgAQFLtB90S6rIbLG4WTzA@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ov8BhZfS8P9LJfMIBsP/eiOHVJ1Uh0b8GBHHhaEsw9XgWtoDN
	WxCGYkIQg26SNvHXQU6xKAssHMrk0CJHJ4oYWb7UUxxfK/hw1qVJV37T+cfGonSeQeNBVxQJmRJ
	gBdSpsiYUAdaQKqaScNrUH9KYYbWng3nN7wCMC+X+dXUdDzGh4MnfIcknBHNtjdRbWcK/fKl6Fn
	8=
X-Gm-Gg: AZFdTZcCCjQkfJRazBpJuqBA1NYXPLCX34MBpnECcVHxhCaGOD8q36NFu8Va1qwOCbo
	aeCDBCXB+28julixx3x6KWM/qxcqNmShKJzcc4ygPWLQcuyutu1lDgymZM8Y9R/gpoi98/SFy5h
	dKMKG8okDMSOalNFKFRSflTgt+Mo+gRhZpBqiHlOr6rLlbIKGUoCnzWz8NeJJOmQxiFqQAIrel4
	CoiVN0pIlG8ug4nGBoxZKZe5h6ba+Y6auuF+Ec9VHIOTQnzUwFaCm5ltOSfXVVUj9aR7O5/tfFm
	WQKZWXD1bYl85klkpmbTcdhP6/9aa4/8seXq40xR4gXRiwa4VMO+LpktcxMEMv9W3Px47d5I+JG
	FaeYDJY5YvjBe0/m/bjmcC39DL0Cj3BFOxY99iUiqouSyjXMOjOuHW6pqZWXs6+Y7lQ+Q70SR5s
	9emV5qxxOZa1st0izCE95R23kj/GhntyLqK1W96bFoLV+UZQ==
X-Received: by 2002:a17:902:f687:b0:2ed:29a5:7828 with SMTP id d9443c01a7336-2eff72f1016mr20317155ad.11.1794993020911;
        Wed, 18 Nov 2026 01:10:20 -0800 (PST)
X-Received: by 2002:a17:902:f687:b0:2ed:29a5:7828 with SMTP id d9443c01a7336-2eff72f1016mr20316835ad.11.1794993020437;
        Wed, 18 Nov 2026 01:10:20 -0800 (PST)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm10147735ad.71.2026.11.18.01.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:10:19 -0800 (PST)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable ICE for UFS on Qualcomm Glymur
Date: Wed, 18 Nov 2026 17:08:52 +0800
Message-Id: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIACRr/WoC/12OQQrCMBBFryJZG2mSOm1deQ8pJZnO2IBtNbFFk
 d7dKIrgZuAN/Md7iEjBUxS71UMEmn3045BAr1cCOzscSfo2sdCZBqVUIY+nez+FZuLYeCTJOVT
 cMrIpUaTRORD721t4qBM7G0m6YAfsXpoC2XFRIQCCoTIryOZbbR1n2xwIGFoojbHwUQW6TCnp+
 vN1Pl7HcH/3zur1/aaV/2mzkpnUzJQ7VxllYT/GuLlM9oRj32/SEfWyLE+wNEALAwEAAA==
X-Change-ID: 20261117-glymur_ufs_ice-f469fdfcf38c
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794993016; l=1435;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=HD5BWujXmzSaC5arEux6XMyih3/IQEomEjheza/5lOI=;
 b=Bybijm/RVYoSy41N9ZP1x8T9/D/ZxiZ44CI5ahXO3ZFbgDELjR5XpIZxoAgPCicSTpe7XnE5F
 Whzg90+soPnCP6TQCIcrswbHD30Q/AcqO5dFG2EVAZPI8ASAIDb3vrM
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd6b7d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=r359bwwMCglhQnJRRFIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: sHpu7DyCMbLNBbGUtA33eZCXdCBYSwAj
X-Proofpoint-ORIG-GUID: sHpu7DyCMbLNBbGUtA33eZCXdCBYSwAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX/7W61+8GZWX9
 HYO3g5LYlQwQONNMI3EIRQL884LTQUD8RvClcVj8FHmfN6IrNnIyz/QT4W9edwbyEp/Ay20cPdf
 4Zifnzv1Y6fc5FPjbksVwNJWlBBrLUc21077F5rk+3dYQYo3P7J0rA6DgFnbvDp5J85zMHOc5dU
 gdG+wqeDi5/SsFfRiChedjD8uRWpJ0VH67cQaHVs2DmWpD7x6Z/w1LdnEOxx5y9ql1MdthD+3ER
 zZXynFxYm92fH01zEzPt3/YLT8Wzu9r3ZNQxd5BDf2k3NEtje3UkOEG0PDALH6JECqAT5gLnuqR
 xJS/FZuYGssdloMgVzo7kOGKxEExT8+m9lHQx+hDXDdbpNnggzCOQ8ZqM5fgMAyFVfXhyR6+X5V
 KRJKJ2J7HQytTuKdibsy4Pu4+nW1okWXsDlFdh/y5b87MAe0LsWT7Lon9suiywCMEAkdwGS8BqD
 40ZBV70/xESWfbVxmhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX901+zcvE2nuO
 v6hF8FLG5G6U2/O5GT/GaSorVFj/P2opFWW69+2xd917r30AxB6e7wwo+mw/qX54+dX/stBjrbb
 KAtUa311S08ydZXpG0ohJfDzIdW6/ak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180036

This series enables the Inline Crypto Engine (ICE) for UFS storage
on the Qualcomm Glymur platform, including the Glymur QCB board.

The hardware reports ICE v4.0.3 with Hardware Key Manager (HWKM) v2.

Patch 1 documents the Glymur ICE compatible string.
Patch 2 adds the ICE node with its registers, clocks and power domain,
and connects the UFS host controller to ICE through the qcom,ice phandle.

Validation:
- Observed ICE v4.0.3 and HWKM v2 during probe.
- Standard-key and wrapped-key tests passed
- checkpatch --strict --no-signoff: no errors, warnings or checks.
- Targeted ICE DT binding validation passed.
- Glymur QCB DTB compilation passed.

---
Changes in v2:
- Rebased on next-20261117 (7cfbf79c66c6).
- Removed the prerequisite metadata and dependency sections.
- Link to v1: https://lore.kernel.org/r/20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com

---
Wenjia Zhang (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Add Glymur support
      arm64: dts: qcom: glymur: Add ICE node for UFS inline encryption

 .../bindings/crypto/qcom,inline-crypto-engine.yaml          |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi                        | 13 +++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261117-glymur_ufs_ice-f469fdfcf38c

Best regards,
-- 
Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

