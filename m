Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67150EBE6
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749809; cv=none; b=u3SMkyCJocitiA/7/qg6TqTNEsZhi5gGVU2dijY142uNkE3WJIfiJtbgkr6r/7WtanrkPqG/nU5PmG1y4lW7jdc6wGWtQXqdn/vvo5G3JgaX+2q46cyAeN6VpqZ6Fm+QHAryp8rZ1Ba5IBQcTMyv4Q4qLDadY2PDqHY5U3LRzdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749809; c=relaxed/simple;
	bh=H6fsZYId41KQpeu0ypkHNClFv6JIG/e+9fOK7DhdSvA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hdb7csadf/owGee4qE2xa+O0ibSw4fJu9DzGqUtAmopA1r6p7FWCWGc1FM4C5xWzqo99Fz8vdxqgGi8JfzvUNfqpEHd3qRtFErAAo/8fZMETAr4PQKrH6/iFbWctLzQ59wg9MLdJbMy6PXuQWwe5GSCye+S+YqmM+EyOE/b8oNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCqrl8Wn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfOfIV6H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCqrl8Wn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfOfIV6H"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOXxV745828
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oA6mPBcLFH3SC1iZeQ71t0
	LSRYXqkDAN0OfRuXOGK2M=; b=gCqrl8WnlWeTApwrn8UvaGb2scDlmek50jvOtQ
	tmtkcUFRMu5DV8wOPb5CGREe0CLNtkth7AKAjkBONAkeLuOZMbYtb/W8XZ33smgT
	su/Jed6i0W1UvEBhCrkzbF5cTInqpQips5iVodenwkeyt6modgqavZj47/OR87so
	0l15fF434lPYtHdv7r5Oa8WF0KmvSznQUNpMjgVUTWQpaUPldlWRUp9qHOoozrxd
	R4Q87NPOE2J4ywB5GxYqoaRyNQhNWNEA+Ae0KGcs3ufqgnSTvqOPPqPQrRaFOO7T
	ToI6qqfKY8i1SpsNbc6fF8Bo80BB2toz3ocftzIhclJ0C/Xg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2391xr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:43:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fb956002so13427225ad.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749805; x=1790354605; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oA6mPBcLFH3SC1iZeQ71t0LSRYXqkDAN0OfRuXOGK2M=;
        b=hfOfIV6HmpRKitsL0ojpERc0+AZffrWiG7lP56BKrHeKviG6iV/Jb81qlKQK5R/Y3Z
         TTLlR8aR/Cigz/unw+Cq8rthvgztconpXD5dqvyLtoM8QV00Jud2pLjMpFrNITM2BWUk
         jdvlluCUeX3SbSb0YAjMMz+FlsqilgELxpllfOzUMh5PW8nfFEz2QLYmc11JleZUh9BQ
         uP/C4koT+ZBQMY3DeeNMAr60iq3RyTQNGltYvMWWmEawlJjrtrHTsARgRKoaMfV8Y14C
         37oUYECdr/+ygdmf4To7AzVHcuC0RuXVTzPTe7lxmA8BuTwWUaDckWj+ORQJ1oiwKX3b
         IzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749805; x=1790354605;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oA6mPBcLFH3SC1iZeQ71t0LSRYXqkDAN0OfRuXOGK2M=;
        b=SR7HAzBhC2+2nm9HUa3UqhaV9Pih1o+TDenfINfZhg0NxPCFD2O4lFBZMiZ0a0hSB8
         xMpzpesLl9hmi/JlzKZ0VH92HETDD1AbweiXEPtdKqMsRU0Pr9jtILvrP2oZCzNrpz9/
         +nnPC0d86efS89iQ/YyLBpKO8Z/iHU2npEwbmt9q3SkyMhBUVCAVY8me+lmI3MHV1i1L
         j6qFXtdmc5GthgvtP2+hUMtmus6u1+FWn39Vabb3uVUuv613W/tfSDmTVf7H7/KV0FAq
         c1jpLgaCbB2rBwJUTZ+sWmn9QB3zU8lJI/Rz/nyeyvsljeOBdQPSl7JOV+AgzUnqBxJD
         iYGA==
X-Forwarded-Encrypted: i=1; AKwUvBw0SEpVe7rWKM+oZrH/prttTcPf+YU5vGlzawjsHd7eTD/pDhwTngfmaQUC2/DOBZ59TmabhPvNRjCv@vger.kernel.org
X-Gm-Message-State: AFuF++kTa/2YKG4+HubioBlBTBOpagGntT18WnK6XELFxdlIzUHw9kew
	BgsE9kWZj/qN9J+wh9XQIYHzb8idtZKAHuowSBiI8tXmKXYBFPqNgFp5Kq9dIET75mPxUCp+Zgz
	BL/DfvlVJOT7QxK+KKFxYdNCGbviUn6OWVqh3mVWdeGqA9+Dr33715jKFFpImb5/S
X-Gm-Gg: AYBFou23xuOJvFOEZFR+t1t8jd2VbAz34FKcBu3Nt0gSYO0E4qg0fy90W9EHgFuMhEZ
	f9QR0NVBnsTx1goJWaN/s5gwNlotuwtpueDGo66STxtx6Dgr/Nlzm5hsW64GlRFKYiORUGUCbua
	MMXx6+654jx+spniRFbHYzpXgo9bMrGMsbnmeRmkj7uNsfocg7yAKpevEv9Dnota/5REsJz+1fB
	4iPZafIlnw7sgzwDnqrZgwzMVnZRqRqp6zWZFJD+fh7RGf8hyz06JCUnVADRS6hllBn8niRbCvD
	ilp06CirwAuKIGwBmUg3tIpfnKPWOzkUSlN3Ix/6fkdESQDoDbABNaFy79q8rwqqPc9DSn4SINA
	cmVHW1zQuttMoC+KW4Q==
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr71307735ad.9.1789749805248;
        Fri, 18 Sep 2026 09:43:25 -0700 (PDT)
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr71307305ad.9.1789749804649;
        Fri, 18 Sep 2026 09:43:24 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:24 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH 0/6] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Fri, 18 Sep 2026 22:12:44 +0530
Message-Id: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAARqrWoC/yXMTQqDMBBA4avIrBuYTNT+XEWKaBzbKVRDRosg3
 r1Rl9/ivRWUo7DCI1sh8k9UxiHBXjLw72Z4sZEuGQipxLstTPje0GIt5GudQxjjZByWlJN1V/I
 OUhgi97Ic0+p5Wuf2w37aT7BtfwIjf8h2AAAA
X-Change-ID: 20260915-pm8010_i2c_support-3062421372c3
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=1613;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=H6fsZYId41KQpeu0ypkHNClFv6JIG/e+9fOK7DhdSvA=;
 b=qKnWaYqEKCCysF3ieQyz7rqHneuV3s7N/zgJRNtZUrOVX0OAm8QMt2iZoZ+5DeMvSI7wQMd1v
 E2dbxY4M1tNAbrWRqW5vVuSIwCccSh59OHswK9t38hVxp2mrO9bCJpc
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX5ZiT0Hr/Yj+m
 xQK4rWLihdsqunnxDNTKwaaUZdM3+W0Jz5a7ZzOIGKEw81u7l+3X37bEx+y4UJEq8L3Hni34hGW
 zmAFjEZfWwzcK1dT1lFye8WytlGy7Gg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfXx6HdvXaWzgb/
 PRD591VTvnygvFI0M37Yr19B0ymGKZOoSHKEzPryMwqOv4uYv6x5rrSpidHWUtgI3ZpISNcAYtL
 HTpyttv10jwp+b6jFdyG8sdVw1k93aHL7OGBsH6Ubn9tuZCKiUDZr63rbUkvy4Xnoz1T3BWd4PA
 FKCyCE1htQWK9kSIl0zdNbPldLO3KvxpmnJmYBWDcsz8c3we2aHS6GYQV26y2rJQ2GXgJFpMRvC
 fR0kZzk5J6u1x+yurMluy9gCnwQIxJm961k3gmayLMLuVwNJ7igDw6PAgKJ4nZIOTM62+IwgzMa
 q22bhGVzFNEqSHhYsmSBgXlpueNOHI+JL+vtC1jCBWMurxhzVSuKV7prdkFtU7gkyThN/09nJlS
 Lno6q8RksGoSPosQ1OV86yfH4XJ2SlFS0AQ0n4SMnikBFktS3EHQeTGik+f4+riEU20NmQnvglq
 SEYGSPOWkakZt7SnvxA==
X-Proofpoint-ORIG-GUID: CBWHJPAu7gJUJdEJy54SSy34VAsg9hZm
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad6a2e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tWdyBv_7HfDShhJaVkwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: CBWHJPAu7gJUJdEJy54SSy34VAsg9hZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180238

PM8010 is the next generation PMIC following PM8008 and has similar
functionality, providing 7 LDOs that power camera sensors and associated
hardware, with some differences from PM8008 LDOs. The series also adds
support for skipping interrupt configurations which is needed to support
SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

Patch 1 adds the new compatible string for PM8010 over I2C

Patch 2 adds PM8010 LDO support

Patch 3 adds mode voting support for PM8010, which is not supported on PM8008

Patch 4 adds PM8010 support in the MFD driver

Patch 5 updates documentation to make interrupt configuration optional

Patch 6 updates the MFD driver to tolerate a missing interrupt

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Dhruvin Rajpura (1):
      regulator: qcom-pm8008: Add PM8010 mode support

Konrad Dybcio (5):
      dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c compatible
      regulator: pm8008: Add PM8010 support
      mfd: qcom-pm8008: Add PM8010 support
      dt-bindings: mfd: pm8008: Make interrupts optional
      mfd: qcom-pm8008: Tolerate missing interrupt

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  10 +-
 drivers/mfd/qcom-pm8008.c                          | 108 +++++++++---
 drivers/regulator/qcom-pm8008-regulator.c          | 184 ++++++++++++++++++---
 3 files changed, 250 insertions(+), 52 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

