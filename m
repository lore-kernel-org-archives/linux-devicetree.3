Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB07337C0ED
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376394; cv=none; b=O8ZWk7Ys3m687fmlPBdN6IOCIPAJ7qrgEVFkif+1sY4a8F3EkgrF6k5jupc/WvtXf4FYfx68shVtlixVF0wCqgKktWxG4WYGlMKS42NesMdnpb+nMejX4byBqGaULX/P2J7svWo34dkiDVS88bBfAzh2+t1OYXgaXq9GNZLPh5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376394; c=relaxed/simple;
	bh=OilalDYz3TZf1nKvQmIubMlOxJylgAFMx1qmpyii19Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RS/a7KgCvTO0tBahPJ50JgkQJAjJQzKhT+UPXMeMBYHe7Q7h4+XRdi6tMjo6ZvcQdpb4GOC49e8pRPXHIRZvbi9JDV4DCNs+yYxmETXcMN7m/fAPIrc/Ig2+200unkGPp3cGuukTH8q4/w4u5fILFSPcDEv/MpKXuHVVcRnCnzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zy6Go0PK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJErC3Un; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zy6Go0PK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJErC3Un"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHUHk1490755
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y3Xb9iWbON20hskHGG5RyV
	UF1FxesjYiFKcSfGr+YyY=; b=Zy6Go0PK6wuXRwz1CEjWBkF02T6061UNF6FjAG
	8+Vsl8C8zxf55oK7AumndOwilSG3rrSxCe/2pUgjzEoN12Z6jNMZRoOMOOkMlBBW
	6Fl4fnFnfvpIlwcLnAfUOC2OOxwCJ40TPs2lJE5yz/mehc3saUxN6UyNe0YYvzvU
	I3FT3fvih+Wa2qfsBLvkrceiSSv7JJPDCZRfD94e6nrnHipScxDdwKx6MzxN6wG1
	eCkj8k9nTaGl0h2BS4f5C/o+sbliDESw6eVdt7NdeqNYyGnUeZ3uZLptkZAeV+gA
	shIWru0AhXraVfbCrWL8YhTj2KcAHV/DwfD/SyQgaRQlik4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aarq0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so2972877a91.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376386; x=1784981186; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y3Xb9iWbON20hskHGG5RyVUF1FxesjYiFKcSfGr+YyY=;
        b=UJErC3UnPpiDS3S5rtKy1A3DBmopvkmtihK3yYxogUCuVC/SEUc/kI1oqrsNv/06Ow
         v/m8peo7sC9qK9qo/KrpWQjyjOTk7+b+dCYsr8b4WFnxhDhs9aA01hpMQ7qrJtWO9K17
         iysXr+CU2iivl7VvpPyY3SuguakwnoDGCtRpd1BsogQIeAor48gAbdY4MD8/D7b6Kc47
         gd5xYg/iL7W173ghJ01Ojr5IZ4lcBPjt96MMyonrMV5QLygQzbqsClDBaWg47R7BIUxL
         IaSq0B0IhGZ5F+dZnT0RD8V4g6tXaZpSi5StaBV8/gfQPEm6P5+hJKOswbsXxDyonWsT
         iHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376386; x=1784981186;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y3Xb9iWbON20hskHGG5RyVUF1FxesjYiFKcSfGr+YyY=;
        b=kL0YHOhSoF97/o3lHdv6Ow8p3NQBwZUYm78FZ9yG3wybHhOLlXWdF+g/KkFQZbthvx
         FaCYYp3olwCniw4FeStwfQ4jP3WI377+R2dsMYOCnwpHr4UqN2+oy2eV6RRepuGunMCY
         9WQSK2qHNhxOJ/UxMEEK7ddOf0aGp5YlLAWdwMg1rCZi5uPbqgPYRqMFyyfaMeDlhLfs
         DE4abUojYsFnFEG3uKNoKgZypdt1gXg3zMCLZgBL7bdahsEHSRPrmF6XGVX2h9RS781M
         9qBKgLXANGfOwb5db2g4MZRAhIeb9O3bTI2Rm4Pwao0lvaqukUHK5hy28nKpQA6uh7rG
         W/kg==
X-Forwarded-Encrypted: i=1; AHgh+RqtGkXf90aLmqUdgI2+pAAJF0eq7SPgztXYRBIdDRuxz3QbuQ0UuqDbz3aSM986Hp13H/e33thRdVeb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lFC7XXt4nBLPzPNye7/eCizfW3wN2nEDbc2I6fLALMt0ETzr
	GpFWuFem96qaF+0f2HfVbcqRE6WqN9sl472st7JunVVcgU/74bxok9LJpAJSIUS5zFa9y4TuOW9
	SuBAeBb4IOYTi+F2jBgiL6jZ1PGED/ZqtlhS7hCwP/o7hSeYfrPdhkNkmzaFjFyJj2YFWLA+V0M
	Q=
X-Gm-Gg: AfdE7ckIevZ8OgIW6KEU3gxisnj/1XSMK1txbe9R1npszJNNSNT45VtaYvUziEiY/vw
	3xXKop7kPgGgiBNsCBOkFu2t6Q+o8Ig6aoUmnYEfEWm76W0dNWyYQoCOLyHul+JW8k+SmHGdHyT
	5s9m9WH/0q0PU4bxJwik28tHNKSMjSjtMRXZZvTGM1qDwz7Ua84k7hd4/0TubTaEJJcSk3DNVPM
	hXDj8AKVm8qKPS9/JDvJW1win2daMERguBebVFw2uN8ohKnbc6YLj5yMQXUTIx6YA/cWAwPtnyL
	jIu89e85G+uK3dT7LSaMARVVVPWF4sJd59r5/0l2oZXepkQzoHXsiSPEt6BPgK/NBjgAk08SSVk
	89YpcxcZZfM3zkdX+lay1IfUAQJxLlOfnzuWR4Eq2jOhn8fa01Xw8PUEKy1Als95e
X-Received: by 2002:a17:90a:e7c5:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-38e4b244fdfmr6603853a91.0.1784376385827;
        Sat, 18 Jul 2026 05:06:25 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c5:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-38e4b244fdfmr6603813a91.0.1784376385376;
        Sat, 18 Jul 2026 05:06:25 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:24 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Sat, 18 Jul 2026 05:06:20 -0700
Message-Id: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADxsW2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0NT3SQT3ezEnMTcpHzd5KIUXQszS0OjRAPjpKQUIyWgpoKi1LTMCrC
 B0bG1tQCH2z8lYAAAAA==
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=1363;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=OilalDYz3TZf1nKvQmIubMlOxJylgAFMx1qmpyii19Y=;
 b=8Ltq8rNeSZIokzkpU6nUTPuUF7C76Q2Fa1Irz8M2LKpOtBqV6IMwjbQVWIivYOF1OhWa6ObWI
 9ev/RKAvOZ/AQp1NXZwFSwqHkqkNG/FHMr0WktQeOt3esFhP9+tCvnq
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: Erh16fBcZQSzI8suOBCybus5tY0qU8GS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX366FzfLvPi20
 0mMfC2JdifdXyl5HCpzYjj7midfqZnpJuPciGl/7n1O4Ne5v3Wy9EX4RLdV/8pk0LQ9oCeVjzQ7
 Cl+h9HZ6IriZDV6ys+UM+HTEmR/mrv4=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5b6c42 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dSOnKLZ8RJAofC3uZQgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Erh16fBcZQSzI8suOBCybus5tY0qU8GS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX1tuV0NjEkf8k
 3YkwJFQLjwo7/k74AisRmt69vcxWA7MxJ32SGstzlSlO8JDophJngkHQA2L0oAqkO4YlW0YxYqC
 xw8agljWao0bNhOvqxiR+UJrB9Rj0DlORbfEXw0UvUZ66PiqQQuJLxL9Ed/BbEfeO0fcT37jDHO
 DuoXWGOZaL1xRAqTBTnz1vlZOtXXa/86n3CkThERpVjfNn/5+xAJr8HsZpj0ZleD/wsTeDJq1En
 KwltLckLE/vGYvjvB6XmMbAijxdsNopcjTr89EClTGI/SRKhPm9VGqlPG9un7JoQBUr6Q06sU/f
 KZdEPLpJPxLzTmNsJ1r5+M6Rj8riPXMCzMD2kn38X3L590cYUKb7Ev8CLJ8EeovHfHpYIFdGWiw
 m/4I7otFDVR/lddz3arDKiFvtbSRGmDQbz5cTPy7UMEvNGHQO/wIn5wDMYTaUvB4Xp6mPBs5nqN
 jN9QZwXJCUlD9BCW3eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180122

Qualcomm Kalambo is a Mahua derivative with CPU cluster 0 absent,
leaving it with just cluster 1. Everything else should work as-is.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees. It also adds the Kalambo
compatible to the UBWC configuration table and allowlists the Kalambo
CRD for QSEECOM to enable access to efivars.

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

 Documentation/devicetree/bindings/arm/qcom.yaml |  5 +++++
 arch/arm64/boot/dts/qcom/Makefile               |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts        | 21 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi           | 29 +++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |  1 +
 drivers/soc/qcom/ubwc_config.c                  |  1 +
 7 files changed, 59 insertions(+), 1 deletion(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

