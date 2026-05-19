Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36702367B92
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214906; cv=none; b=Wn+tNyZCsEgJ5q2nyBd0JP6CN1g2mIT3ouMFYPDFDBgxO26XvbIMwFE/rmAthHfCCFls/L6Rwh49myY5zMflRrsfh68PzOMsr0KEH/EgYJsHDzBokkTCjbOfUuFT8nXXFLKzGJ9WntEET2r/lVQLSPSGYxEYnbtQ6Wx/GYiyb18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214906; c=relaxed/simple;
	bh=kos5+DJaOfQUVUWfj8UH95kxmZdxMBX8TC1MwIyGT8c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rC8t1S79qGOke3vdnqrFF2vq+DeFZFUHKxL/U83k1i8zHCxoxL88xpiwCcElYOyaS4dWGOhYTX6cTIfi628bAUfCBpAe0KkLr8ZTsbZ+uDRKM5YMPYRDxeIoSklB2ckN33a3lXNRlOCQKdeUaeVzQUPaWN3E6MTNl1euidIETqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgcysIwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2T9a0L1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgcysIwJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2T9a0L1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwZww629613
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 18:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aKN7rJqZYkKR/T4I+N1VFP
	xJ5Ty7+HAjZtKLNmu9RMM=; b=OgcysIwJCIlzjuTRCU93/NdlMDKC0v9yfXDkYB
	bSN/iQ0J0mKZETWiDykv5b8YDFDybfRhPaZAkmzHxnyRgINQqQPwOo6XVCyK5DV6
	tc9LbTJOnV1CYEdPEAKGAsKzKT4XQJAkC3zTMZFsvXANVDdA2LOJzkY7O/gCKip2
	q7+NefcGcdTpBYZyreK5jdRqIBJgeitd44nIOeKBfpRX8GUt+V7ZATs0usQAo/CD
	A2Bnpu4C8gHe//GB0FBYkvE4hx4z94V6GkxDAgBk3b0BI0nAuH0y3Ra8QvqroIw0
	mY6RDnpkdWAO5YypNfYnLvyNWDusFG2Xgi9J/YMI/8FfSqwg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nrwck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 18:21:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso8456844a91.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779214904; x=1779819704; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aKN7rJqZYkKR/T4I+N1VFPxJ5Ty7+HAjZtKLNmu9RMM=;
        b=A2T9a0L1kjYiyyI7lqix/BRrbsNrsGKMj8RKcY9uNc18GG1DeqpXDyo1z9FFlVv0Ip
         DfBGzBfKRfv6jszMqlHejv8lP9OYLt3kISVX7AEoPh1MLzjjBI/kEZdCmk3b7a++fbZl
         DdzEStpeoF5flIJVLtNdmB6WRIN3onMR9Ci7B5XtSD4g21Nyavc14DfRa56NwxhuZpQt
         4tbXvvaA4JczjKfoRl/ni9Vm2kkqJVRe93VlWqR6rqECoIJ4s6Ncrtcq7Xven++3urKU
         rIOugEgVxQdo509bcnb6xbQ6KvQe0Soelvpczkqylls9Pw136hyJQmmBqx8JM7T3AjD0
         Uq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214904; x=1779819704;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKN7rJqZYkKR/T4I+N1VFPxJ5Ty7+HAjZtKLNmu9RMM=;
        b=DY5bdWWdFv7Dz1+udM/barQTd23jD3oOCa124XUNEzcAYA7gI6b4vktX4WSmx0OlvR
         JXJRMozBSIGKMOhXgWxoCF1aOJSP+cPE6GgDITWPbiWeSl6fZidgZKeOLG6dLnfzlfuO
         5H8K1xS0fm9tpgUYOva8DSKiFJud8mIgGquE6VXtTKHHZureskk0Uxa6Rjy+4ciYEOsW
         RA6e+K4Hg+MCLelgtoPnmlRNTewidwzbiVcRXjYtcbNHVBrs584DEI4TgOq/GV49Ccr3
         Uzj6J4f7q/dmCpX83gfRrayVujxMGmuwbiF1K0X6iPX6mfSxlZrMyU4E53gX2LeyJ5Qz
         zWuA==
X-Forwarded-Encrypted: i=1; AFNElJ9/xLG+LAGufo+LSHb2WcZI4UuBl93kDSiFoT0oU2w2sOmrp5dtLS2EjzOJk7G9p6dmoEL2M409ouh8@vger.kernel.org
X-Gm-Message-State: AOJu0YxTbn+Prk+GheArVpNsLZcAfxM/ywoaodS5rAEjbJ/CoGGYX2pB
	TCTGQ75scLCS1VFoZ/xAtkGHN6Qp4EFDmtKDPW2x/QJ1Yh2chnnbHolCRhvAWMVqKANUJZvhLZA
	ydIOrIfHN1xTmHAlxRdbb2/Mq6iEolPDxat3zqq5NgznaOXKJB4gFfMxjrPixXnGt
X-Gm-Gg: Acq92OGuR8QPbadMY85xPg01vMoO32KDK9hNbTp24V2e1Bk1PI3y/HPtJcQ+17+UzO9
	8cNi3gWyhSboMEz3pAPhrim0jH9TpipMY/tRpOfedlqCIB359XmxRiM3YyQ64khTRTMEqf/1oFU
	xcIi1jW5uDWLFlyI7wur94JjCsjzzgzrMq+F40V1Qx3vaOn9vNCJrGO9Y7ov5KxhE2hth4a4Fun
	yhZsDwJH30W0WKIiXPNsUYurqQ4xJRFkwYYmt7FdLHxGm2mZ4sxFH9Pk2f266dBcfA6+O31fe4j
	IwVAVAlC8rVM2jEBu3uFSCWGx9kAWE+dS2cdMvMDLWaAzZ8lIEL0UogiN7Sr+ImXSq/5/OroPJ6
	QsLP9QgDWPNP5qsbSqiU/gZBXSUxnkB6thlAxAT5444Go4KJumzIt1r0lkJtdc1bDZ831D8W1So
	Wvx65QWcrSp+JIj15WLdVywtfp0MLx2f8dmpYG/xDA9QHWdw71US8=
X-Received: by 2002:a17:90a:3885:b0:369:a359:b192 with SMTP id 98e67ed59e1d1-369a35a15cfmr7832597a91.10.1779214903630;
        Tue, 19 May 2026 11:21:43 -0700 (PDT)
X-Received: by 2002:a17:90a:3885:b0:369:a359:b192 with SMTP id 98e67ed59e1d1-369a35a15cfmr7832578a91.10.1779214903207;
        Tue, 19 May 2026 11:21:43 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369514aecaesm15434362a91.17.2026.05.19.11.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 11:21:42 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add regulator driver for MPS MP8899 PMIC
Date: Tue, 19 May 2026 23:51:04 +0530
Message-Id: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABCqDGoC/x3MSQqAMAxA0atI1ga04lCvIi7URA04kWoRxLtbX
 L7F/w84VmEHdfSAshcn+xaQxhEMc7dNjELBYBJTJHlqcT2qylpUnq6lO3dFUvGsOOQ0lmSznko
 DoT6UR7n/c9O+7wdBlYDiaQAAAA==
To: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779214899; l=1133;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=kos5+DJaOfQUVUWfj8UH95kxmZdxMBX8TC1MwIyGT8c=;
 b=frRRtluacWR5rBh9TAT0oiFIBy+2J4GCADA21nVUN/6y6Fo9K3TgeNqPKG5kg4s1Qb5rcaQpF
 ljAgK18lHQHAmhPr0/y4Hy9UR1NmwyL4aZgqUwZk+Ws/Td1vzVkO5QK
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE4MyBTYWx0ZWRfX5gS4unZeA8xR
 eqgGkYkgBYnhUqqfTIsRSTjgbEN8hLHcTfAKteK2lieu3vVQQpMsuWxV0vIjdzHE5mmC+4/1o4+
 syx3d+y+L5D/z+KNccSORV0nV3Qq9xfQ+hR8DAnwhR7N8hks2cduUtYsVTcopo5pJcRA+9v/6yX
 sr+Pf27R0gP5mxrM9vn9n2fNDaDrE+RQLXg72s+/pp3n3uyI7sj4oYp+2bmzO1O1pRGEiZRcPkv
 oLlNmBUyeLqhpknu7SxoaoECy+an2aE+4UYxOYRzBBbLyKVQL8f8pjn/d44/3N75oWXYulQH/lC
 tVGm0/ukQ0goNBcJoGc6dgxUsiIn/Nq/3SlR01tkTYt+OJjoYwUEeL4+NRy8StY+tYY6FUbNumY
 RPYycjBnKGQay8ATjyGTiUkEv8O9OvxrFJosFgeJcRGopCc/UC2ouH8cbIMRE7DDX5Gl08vg8EM
 YQB/kwqInAQFohoZhcQ==
X-Proofpoint-GUID: f9Ulp2Sf8tly95L-emNIQKkuS8kzmfNs
X-Proofpoint-ORIG-GUID: f9Ulp2Sf8tly95L-emNIQKkuS8kzmfNs
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0caa38 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=le95F6jzAP0OJalJjBUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190183

Add a regulator driver for the Monolithic Power Systems MP8899 PMIC,
which provides four synchronous buck converters controlled over I2C.

IPQ9650 uses MPS MP8899 to power the APC, CDSP-CX, CDSP-MX and SOC-CXMX
rails. MP8899 PMIC features quad buck converters with an I2C interface to
control the voltages.

This series adds a regulator driver for MPS MP8899.

---
Manikanta Mylavarapu (1):
      regulator: mp8899: Add MPS MP8899 PMIC regulator driver

Vignesh Viswanathan (1):
      dt-bindings: regulator: mps,mp8899: Add binding for MP8899 PMIC

 .../devicetree/bindings/regulator/mps,mp8899.yaml  |  66 ++
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mp8899.c                         | 994 +++++++++++++++++++++
 drivers/regulator/mp8899.h                         | 151 ++++
 5 files changed, 1223 insertions(+)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260519-mp8899-regulator-driver-c5df7d93bd72

Best regards,
-- 
Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

