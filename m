Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533F1385D98
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120548; cv=none; b=CE86eLz3zJTCLxaqvvUy2fFcJ04rdHa6kJuxcC/YR5k1WHO+Vdw6gVtBri3iaZUhazyrgxIhePLsx3mMnLUZQ9umBhmHnXH1wZlDN/pqaLy9HAf1A/jk96rb/YpnfrT1t16fbAsFOnTby48AoKe09lrK4CmyljOYUOqXNEDW4Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120548; c=relaxed/simple;
	bh=MJ944Dtr3G19D2XynmpIhnAfwYIoBM9PiM0Uhgg8izM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ViVjN05gpZkWfzZZ0OJpXMmevzNP7xf1KlS15e8r+WB57I8Vs/QKrZgXprIjRfzFqHkta99BKDO03VKbRgjr8v8Tqi3E2aixj57AqMWg5oDq9wd3tnbMFEUr5FSpcRMlz3PY9mi416dbGRHD1LFbjShPu0chhObH/3dZgjpCZgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dwzt/Sh0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FdJ3oSkC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dwzt/Sh0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FdJ3oSkC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GO5sl1149642
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 16:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jYt+ntlGlsC9bib6n+X+G/
	QEoQvnYS0LNaVj45QyDEM=; b=Dwzt/Sh0eehI0RXM+ndq3IVg/gzoUdIkiVRxbM
	Y3/F3Bhgm9BQbhlt4DihiYzWmESx8nGJnbDmaFMSosGT6iKHViitxc1KIwOBKw+f
	a6U8fOyaUKfZFlKHJqCuWtKJghjjL0O/pzlGHDc9yjJn2dVYmYQswEqVOv1LhJnV
	n+evjcUruZTfd08fkWiwpPgTb4bHSSze91T6IDf9uyUt6/IoRW2H7bLV/++UAjBI
	Bd6RJPU5EQdSnzKy14e2hZESd8iMQSfstshg2aUR9EbHKUc3JhTa3Kg/C67FXR/y
	OO051j9++CFQ5D4bG9zsoIJPEhVfoK/4VGilaePlfqhrrFCg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwhk3gdye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 16:35:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so5225639a12.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786120545; x=1786725345; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jYt+ntlGlsC9bib6n+X+G/QEoQvnYS0LNaVj45QyDEM=;
        b=FdJ3oSkCnh2lwfC5zBrGf96AxejbZn1xggRwAZDbb4h4suPT6F565j70t7HQ3f8lQH
         NEtcXjCI897PUqAyjjC+X7MFHMaCOgQ/ISSwbn1UZqvvxher/cB5Np0rqu4L5S884Vnr
         bxJP5bpEtrhBfaPU5fGua7zg5Mhfde2nLo8dcxYJdogALAOl3qUy//WOBCGCgfMaiUru
         YKbx6JoAiLGX7kfI7VWrIKZ3qPgoCDPY3m3RWM1QfU1ortSvDkZC7bPG0Z6RVntRLLR1
         4ab/oazffMMVtOvY6OcUglb74sojlqzZAlSF9BGEBCqFgMuYhdQc8N5wzRdDAJYgcYTY
         NUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120545; x=1786725345;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jYt+ntlGlsC9bib6n+X+G/QEoQvnYS0LNaVj45QyDEM=;
        b=D70BArrjnBRR8/29iQaTNrL2cDwLFUhIj7RKODCNUqnfItTmQ7Kn41eMe+JFccAAZZ
         +wT7IELB3/SW+VUerWu+rk309dlOUu2I0HuTuQz89sGsa28NWc0mCPJ0SIxjM0VVhiad
         7Fg2JU7NRP8ptBzFoOGXDXp6sHWQrOH3zlo3nnG5YOLa5ikkdOKMU+FIVUpBi4bXvu7K
         zfoF8iayyf2tJC+iCWBcxzX6/yahdNqcV8ANreaHUQkM0OS4GvcMmhXj+h0Kj0HGKW2d
         Y5/GTwrrpbTSF61mILrF140DXHXc3ms1SD0LsY21ehjJWsrBHIBnazHKV/10KjjV5zqP
         7R+A==
X-Forwarded-Encrypted: i=1; AHgh+Rqwh05AcyTLwrZMox8NocUGT0r2LwOHmuex9ODOebLn1GcCml/prio+9NwyJbuULvQtd+1N+OdfmPut@vger.kernel.org
X-Gm-Message-State: AOJu0YywNj0tADOzip15oiQr3qxsRd3VusO6Kp7ZRzf9prM7/dgIr0Pb
	UI9Yk/cdhM2+QBJUw4pDAFYlHirKaZeP3fSNgjgKRwPOrJ3Lp0d2bKFSwBGglBqiI9JL7LrSUwi
	8eUKg7psx50+DJrhw0lnJLkILz57YFtemc3NFabZK8sZALndnzUgi7jGxrWJoAS2t
X-Gm-Gg: AR+sD10d1qA7M76fyrQ3t1I6TN7flAZks5EZNUQmfVsENatMQN+4ztL9txEM2U44V/h
	nZMQloy4xLqinOukGIoLUwkOFy0siFkbw5AqlGaBXobrZmKznyXvCKlbSg9Wzlmac1gdnqBXSXl
	K1hxKODtHL08ISyJhVjIPJBfDb/YmbnfSUsgfQiHJXKntNH9A6Cvg2hw4kl4lk7XkxqutZ+eUFo
	lh33NpB9xeUchbyPfMOQ7CfGLbdlNJI5jAw6CovLfHckr8wOVOAEBu7zP8RKi6tTb62obcZM1zW
	cpVC6v/RnW9X71ViOLjMpssv6OD82Seizuf4OORJtI2uEAQoZ9EuA+dibb8vgou3ichwL9oMgQG
	7ayd91SdGm1yOjpT2aoIWu6/oeBRD4yrLu59qUyaauuLbjOMAJZwCpkq5jAfjqtXfwtvcE6rF5l
	4ay6SQ949F2Dg=
X-Received: by 2002:a05:6a21:164a:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3cb85ef9234mr29856206637.23.1786120544894;
        Fri, 07 Aug 2026 09:35:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:164a:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3cb85ef9234mr29856099637.23.1786120544299;
        Fri, 07 Aug 2026 09:35:44 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde2e6sm8918689eec.21.2026.08.07.09.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:35:43 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable quad SPI mode for SPI-NAND on IPQ RDP boards
Date: Fri, 07 Aug 2026 22:05:30 +0530
Message-Id: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIJdmoC/22PQQ6DIBBFr2JYF4MTgthV79E0DeK0klStDBob4
 92LuGw3k/z58B6sjNA7JHbOVuZxduSGPgY4Zcy2pn8id03MDAQoURaKj5Np7k0grmpjhdTSCm1
 ZPP72+HBLQl1vR/Y4TpEYjiWrDSG3Q9e5cM56XAJPVC3Ufr9DIpN8WfQfRZl0fAYuuEaroUB4A
 NSXgSiP1Wun5XGw3dg6CoP/pL/MRVL+PnsuIquUjVZlBZWU5g9r27Yv0zW5mhkBAAA=
X-Change-ID: 20260716-quad_dts-6bac0484c08c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=RKaD2Yi+ c=1 sm=1 tr=0 ts=6a760961 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JIWmn_IX-yUVY0fGI_gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX5zFKRL1F0tOg
 t4B8jYWGDozJyvuQr38wZmb4GSU2sFD0/N9k51UBB8qBNNlx8RDt4kWzyRaKyz3mbQpJPWu4MDC
 4UfNJmxu5J4fWZ8k2C9bc+qvtVmbDsM=
X-Proofpoint-ORIG-GUID: zINrrgUQUCxbsnQXEPuiPQAflUJ-Lb-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX4ajEjXHqqmWw
 MS7EGaefYuHBkUo+VZVcKlr1MY+7rEJNGbPxRhLWKJps4i2LFg53ZycS5iKe4wKI7gXG9NuHg2y
 N5q1352hsMJZvYmlJq2Kumt+dryqWz9TqUDjRj5+Jeq7jMHhyia6CjJEjYyaUqP+SrlNyA1WzsN
 55CYmoAEMGAQfJYMEDFK1zJScPOPy5IEymR54zWLvANOaaywRv3GiLkqzzw1kpU5uQX+E6XK+IV
 8HwATPnkf/KJ13j1dFV6oPlawUKvs4ao8uR+sgtL1n67EAMnpg4h9M7mynA2Mk6aMDwAWVyRStL
 QGA5MJzPtlCpR4PkyLoDsBeune9MbHV3tO+1Xmd1Fci/Rg2ZsQj03eiRMIAWokGuCm/BLOlWSZe
 mtbR4y/HzGUWpie/nzDO4QUyuSHir7+Mt6mmR5aY3I09X0jk0AxleEIcfk53hI3Ta3+iuDma4o2
 PgV4bPEtx0BZoVnh8nA==
X-Proofpoint-GUID: zINrrgUQUCxbsnQXEPuiPQAflUJ-Lb-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070129

Several Qualcomm IPQ RDP platforms support quad (x4) SPI transfers
between the QPIC SPI-NAND controller and the attached SPI-NAND device.
However, the corresponding device trees do not currently describe the
bus width capabilities of the flash device, causing transfers to fall
back to the default single-bit (x1) mode.

This series enables quad SPI operation on supported IPQ reference
design platforms by adding spi-rx-bus-width and spi-tx-bus-width
properties to the SPI-NAND device nodes.

The series updates the IPQ9574, IPQ5424 and IPQ5332 based RDPs.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
Changes in v2:
- No code changes
- Pick R-b tags
- rebased on top of tree
- updated the dependecies
- Depends-on : https://lore.kernel.org/linux-arm-msm/20260807-quad-v2-0-8ec821e2f22b@oss.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com

---
Md Sadre Alam (3):
      arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI mode for SPI-NAND

 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts      | 2 ++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
 3 files changed, 6 insertions(+)
---
base-commit: d56fa0b2bd2d9b2fddc10e8f5bdd42d56676935c
change-id: 20260716-quad_dts-6bac0484c08c
prerequisite-message-id : 20260807-quad-v2-0-8ec821e2f22b@oss.qualcomm.com
prerequisite-patch-id: 912ede01168ddf0476ba69ab0db786186073f817
prerequisite-patch-id: ab86c050f49d3180b10e61ec20bdcc6272c8100c
prerequisite-patch-id: 932ca3dc3893df6de25928b24c7c24550907088d

Best regards,
-- 
Md Sadre Alam <md.alam@oss.qualcomm.com>

