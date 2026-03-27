Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0B3890F2
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600274; cv=none; b=L8BfKq4DUcCjVWSyoqtQLdSpjByMAjVWCoTbYhl4qN0/N/D1ZV5O06GOVlHjuby93Ut3C3WWSWpSNgBBIt96DGiToOxi5fNkJYBG0TgEhUbDerAbhHjpo6cJCRL6OOdsWKlCRR/a2raTqAVba3y5KPT9h8sYaUUg1oCYnCe5pAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600274; c=relaxed/simple;
	bh=1sVb+gA96imLMD/XZ1Jk7Rg9NjlUlDn6GhrYUfJiN+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GVG2EcwDST4BNlz6f1sgLsT6w1/acHpE+5vGe1InBV16G4P68iDOL/3hNHIO6xxkCsP9K4hMagNRrVSEu+WoeC4Qprlq47AJZkzBAoxpQnOQjyyRsgK6AX35ym9stv1neea6Plzl1qQtX/ve8BcqTppC7Rz/jj2ngSwgCzA+0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uy7AWE67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEHoI8fY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uy7AWE67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEHoI8fY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vffi1749076
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CNEVpvQsInNBh/T83gsxcLGNhP3rX98ReBQ
	TCrz8f/s=; b=Uy7AWE672acoWX6cinbSAuztHNvJPClRKCpowSCnNCLUBbHmvcG
	F1mE80tU9xIfwD8ncG8wKq46plLIaQ+jvpXoo7t//71ImOIBvfQXJjFblaawf7bT
	Wy4/D7yCkxcGK7Kxrg07jOm1FWN0yOWC/82uSpXAf7ScdRYlV9ZBDOSBfBO8N4rT
	3p7dVZY6WzxLSXybGFiMcVbiFJQY0qZsriX26FEqs8cpBuxQySqEZZGNCbhMIVoF
	UqvaUP79JfjjMcN6NfH2HVSIa+ZBV1VREXdf3FYs68+yJtZOBFmdtBDM6bHBnwst
	mln6gmA5ARz1Q5k8e4sxzfgY6CCsgm1igjA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn10fb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:31:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0b0aae381so23745405ad.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774600270; x=1775205070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CNEVpvQsInNBh/T83gsxcLGNhP3rX98ReBQTCrz8f/s=;
        b=IEHoI8fY3Ihw4kbfTHRdvxMfZzm27uAd7QlWlmyi6i50uAnD2hoMsyCUY8ULqc11yW
         wNwbrBdF6KnqauBlWW1+W1C+XVMHAMyHi+sRB7IELHal4yB7j3E2XG5nDOHu34kvRDhD
         EiheRI9g1U0U+qr500yfD/8+XkjO1YeW3AFu3hRoj4pXPGEF3Qeb5sidC39hkmUBPKls
         ueFtlktYJaQyGydETsejYWNAgCtMeNJ6y5M3M5mNe0pTNNHn2SG027wyvMiguM7gbd7P
         VZgAScgv6eSmpnQB3BKJGL0FK531msaBPMYus44NXbGWLmcemNzjMZ5Pl0rRUTaJcWJE
         6+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600270; x=1775205070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNEVpvQsInNBh/T83gsxcLGNhP3rX98ReBQTCrz8f/s=;
        b=rHOsS+lSnlyMZFebn7TEtu1ExUD4Ty7Dpo/3YjnifHZ4sv5IY9av9BNohB9oJDhlvZ
         UZKkCLQHHcvOD0YP9d6yA1S7lCEDlThAkq+o4bWsgzwtQjEZxNj7U40vvbbKZT59iIAT
         I9WcpwvlUFrkH3s+GjbJyMA3TjbNfiAAWLGwt95EwRm/3eYo3NG9u1hXX5zHu3sut02j
         pRSu8JVoP11XrJLXB6DVPuEG0ULPsbZmzfcX/kH4CAQ7z3sh9YkPODHVIROU0CO3QinD
         Oo49NDp18xgYAATS+WjGZbDEZ9LbcnePcLremcYXwhupA3FT8Efx7aPQUQDyXkeKzwti
         RZWg==
X-Forwarded-Encrypted: i=1; AJvYcCUhSRDu/PAjYlBIPFo2XnVfXfdt3/zoLoJFhZMg2+aJSJSRBVMYHvn1b+CfF0ca7yTzRVRy9jXzqvSX@vger.kernel.org
X-Gm-Message-State: AOJu0YxL5H0P9BdjSyWpWRDwa5NKfa2gBZPLM3JERqkB81K9c/3+E8JQ
	8CTdxNYu1x3dhvVtQupdxLfmFbzMduJSZDAZyC9rwSvWzMS2+SLAsbw2bWmGhM156GvfZWZ1DUt
	2mNjr/lfxzEEtN1ZrfkolNtJU+rW9GHbgozYa4NYbCEaFLYElWHjjc1rM32DqMtcD
X-Gm-Gg: ATEYQzx6QH2qeWHACESjUEHqcJq7gRVBP+NqroiWCkQAgwxI4h0VmlPePVfS29Ym8qN
	bDkvBjELRPTEMV0254O3ikOZdg9mytzz7Dok3QvmUnJIaG3gwMEbq77Cip4d5h4Mdi1pyIpHD8H
	S2z4E5uKaU48lCxbzqTKDeySjjoZmCuKhfvtLgynDvmmWA2Vy4hlRJizx3tHEiURu4J1pkIwwxe
	fMQK0oI/rvyXp+UVmdTxF0RquvtcrGW/EfygSb2Wv0MRdTLhjKPaDnlR3ExByqI2qSedBHyThTc
	v4wUyFsCwTdL6+RCqDvS/3Nq9DycdojpyVTOmfTrXtSsxO3IjfH72RWdgPBqhIPUEJ3lN4PZKfM
	WE4fAk/4+ZwQQ+Lh3UnQk9Lo9+rODELZplXfqZLNSHH+N6YEgRy4+ZIDSp68=
X-Received: by 2002:a17:902:f690:b0:2ae:cb0e:fd60 with SMTP id d9443c01a7336-2b0cdc23332mr18319855ad.5.1774600270186;
        Fri, 27 Mar 2026 01:31:10 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b0:2ae:cb0e:fd60 with SMTP id d9443c01a7336-2b0cdc23332mr18319455ad.5.1774600269707;
        Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
Received: from robotics-lnxbld008.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm56234905ad.0.2026.03.27.01.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] arm64: dts: qcom: enable UARTs for robot expansion board
Date: Fri, 27 Mar 2026 16:30:59 +0800
Message-Id: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2MiBTYWx0ZWRfX4cPXhwfd+IAg
 civLaQk0MB4TX60NhBBFadbYPcuhWUfJVMgR7M8dGHsxAj1zaUU4Wqj4e8BZdGkm0uOQEFACH0S
 Ov8XtpbXRHEF7kzUvtWusnvcv3jZMKJ/ZvTDPu4SiPMmsgigkRYUMdhJjUDzKhJiJJYtF5HJ6xV
 LGFneLxgldyAH0yUtyqUaLcfl4f0hwBJBe3uoSF+VFIMVJwB5DUIoSFue05HOFL92IACJKfsdnY
 iGiDJV/kXe51GsXfPhLXchh2C07/GGOW9yiUJ5HPMk27yysKdwozvI946kB53uOGi8q03q+dfx5
 LJCF9ODywd8s8JfOfeHWtGdZyiugljgo1X0qbGQ83A4vrc9f4A1q1Y64BgNOGu5DDqKy6bt2hUs
 jb1tbq0HFmTW3Leq90V8GMZCw2KeHj9WNguN/gekTGEfwurmhvBtZYjU68w9pe4syeLEVkPcn5g
 AGotEbOcxNqwtZ1f7+w==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6404f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=x6rImnyG676cKauWAWQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: z4CdT4Lc9CJP67pcIQg_a1_YrB2TCSHG
X-Proofpoint-GUID: z4CdT4Lc9CJP67pcIQg_a1_YrB2TCSHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270062

The Qualcomm Lemans EVK and Monaco EVK boards expose a mezzanine
connector used by a motor control expansion board.

This expansion board hosts an MCU running NuttX and communicates with
Linux over UART, with all protocol handling done in userspace.

This series enables the required UARTs and assigns stable serial aliases
to ensure consistent device enumeration across platforms.

Canfeng Zhuang (2):
  arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion board
  arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion board

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 5 +++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
 2 files changed, 10 insertions(+)


base-commit: 46b513250491a7bfc97d98791dbe6a10bcc8129d
prerequisite-patch-id: a877aad0127409ffea7c0a7411968d336497b035
-- 
2.34.1

