Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49558313E31
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266328; cv=none; b=teFxRN08ZIHAJMBAp3ofXY5wSc6csk5VulLBkIKkAR+99UQ2TdbdChctiDjaqbVf+vSecSO0ZA8iwd8cEgGgnvuSz5dE0wZnm7ekpdPcCuOjTgHU+qJl+HlyUMZ3Dyrks1z/CwSBb9Jom9DgMeacMsE9FWM+Wtbl9q5Y48FbxgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266328; c=relaxed/simple;
	bh=bMi1fwZJqr3CFZUDEqzyx+asObpwsahfGL/FCYaVGGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LFXpZzBQmBCTtOlpDz+b+cmzUf1D5236OI0Ievv7pI7jyAnEO3+J0ySvYd8Xw+sfcCogETlJv8BRhAmTxM9xy42WeS6bLtR7MZ4BnbxfXYxmQ2o7Atgtv+ToTjuDrWX/6UxSfFWn9eQTzs6amQ+W51u8KlHKUX7ILD+tJ5ai/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDrDuHVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rz4SdTq1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDrDuHVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rz4SdTq1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33cTl314084
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i0orPxOgo4sJ62uMX+MWtC
	cWhw0MT6Y5yrOXFylx+3c=; b=IDrDuHVNRfqOPmDfHHbdJ9K4L6MxfieRFatXss
	p6vlsC0aNxwXt9z6HujdB5KJnCRnMpwiKWEZ2emNrMhT1CjZLNSYf1yV4qy+aF8D
	BTr3niPh/3Nlmx+FXgYUT8VQ/8TtBE6fU2GSyJJob2O3ecNDQo4n9tCi6pdg5Bgt
	HZfn/Tkt+OAtQ7FsoHIFZ9C5tXB0pBblsVxB++xvgHgxTLrX4i2LY7Z7gDTZuEEt
	za73vVv9hgQeR3WDQvwRg31OmL2G3T5WXofTyc9ZYvkpa1rgC4KqNMhSOQ0JkHND
	qZN9pavz6hXdqR4fsQNSoSv0dfoFytbfQjoyKH4kjex4o3Cg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8j6va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so134432685ad.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784266326; x=1784871126; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i0orPxOgo4sJ62uMX+MWtCcWhw0MT6Y5yrOXFylx+3c=;
        b=Rz4SdTq19BN2v3kHYwM2SSNW7fJKAIcYyLtYTV0aJ/3PVrEEjutt6fHe2N/lberbFe
         XBzkTBl6HND+70CyY8sr72AVE7DeNX/pD177ezS9nfEGh790PLRFuWgQ3mXmCL7Oe5D0
         oYK4Bfi91/C6qmqRr6z31TXBazgAkbE+OTo7mNeOIlcHjisbMk3OR9kAooKIsTFhFeu8
         NnpUGEOmZrfGlTut6LEX+Yrow8VE6rJ+8gAMMJwhneKyDZ+AXViFWiPCPx48GTlXyr43
         ieGMXVktHwnhdYkEF52IncRkLD9ECyB/5i6Hy0YJo/YDjO8srj2YduVf5QmscrmxsFtY
         ShRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784266326; x=1784871126;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i0orPxOgo4sJ62uMX+MWtCcWhw0MT6Y5yrOXFylx+3c=;
        b=YUEE58FTZgt0//rAqTxB2kekilUoKFVqs/6b6CbDhlwokdUaTpc7PxnQn3G3PXjDk6
         4T7dPNiRuEV6pxh3iUNO929wz4495jkEe03LEQlaSRb9fz39Zbb8ZPzbCGlmbTybHoGd
         PK/6jSFvf0uM1nosAI8a7eJ/QjnLWSUQBqe0LqfUet8xyfe7m0Q5DPktSBJQow0sqIsO
         Sx+UmhHItaQt3C+pnm4ES6BprEVPjDv+sMoM6RoGwSJulpZnDBVh9lQENOEeR2N5cNI9
         ssYFHewoew3wsz4G4M1CtzYkOu0gP7cxtnjbUvJLaKIzn0zE9sXzk8FwDjq1q+wPB96H
         hu+g==
X-Forwarded-Encrypted: i=1; AHgh+RrpQvUj1cSPBA7YF0QILjlD0WcA2bBVSC3RLcd3XiSyXYHZ5UEck4URICQ6VhlWntzRLDdGTzjMbGi7@vger.kernel.org
X-Gm-Message-State: AOJu0YwZq461blxfzQebVsNYh+MgObMHLw+0Tcae+1t9z6TnAsyhNtOo
	v0iknrFvRP49Ttw4fSPP/08HYMM+yLRs4aqx6luU7MvI8v80B0n2Xxuh3qLKSgKXe+ON/YrDeWv
	mqFMa9ZROMUpYoJPkczc4hdvlq/mXtkpwNr3QyNBwkfmDGZSzQfZBjwqZY1VY0kc=
X-Gm-Gg: AfdE7cmfC0DhJFiCr1pA9wclmQh3zKwFWrlXcL7IRONqXDs92+QhWkj5I3jW2TAyW2L
	Si8nZRXErNGn1GxsYpX6LP8VPFYhBeVmnF+3CdY4lmdpIDxEd1nlNZptBMay0Hn9NtOcNlqMFj0
	SsPUFjNES8HXzFemyz7LLl6OW6LFvpuDFytsaywm896qXyL7I+vyIOMmgkGAq/cbqKuO33RBag+
	LBvpFGQ5x9BkLTnrmA9QWctHVma5hRIsStxDQYAwYFLc5xeSJM+eaUpmUT4/3wy50FFecS+sWFr
	A2kHn8+utLE7Qqr2myJb33RC1SXtIQ/Xe//u0bvUK5kwndzepjqmiZ98Zs6P9N709B3Cb9Sms+a
	PDiiKWoLamT1nvFKDkX2tl2RHdF2Fnw==
X-Received: by 2002:a17:903:2f8e:b0:2ca:c79f:75b5 with SMTP id d9443c01a7336-2cf34964e69mr11800605ad.28.1784266325876;
        Thu, 16 Jul 2026 22:32:05 -0700 (PDT)
X-Received: by 2002:a17:903:2f8e:b0:2ca:c79f:75b5 with SMTP id d9443c01a7336-2cf34964e69mr11800365ad.28.1784266325475;
        Thu, 16 Jul 2026 22:32:05 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ef6asm4189885ad.9.2026.07.16.22.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:32:05 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH 0/3] regulator: qcom_smd-regulator: fix PM2250 supply
 parent mappings
Date: Fri, 17 Jul 2026 11:01:58 +0530
Message-Id: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE6+WWoC/x2MWw5AMBAAryL7bZO2ocJVxIfHYhNq0yJE3F3jc
 5KZeSCQZwpQJQ94Ojnw5iLoNIF+bt1EyENkMMpYVegMZTUmVzjyheEQWW6U1pPbsSt1R4Mebd5
 biLl4itK/rpv3/QBWEYFGagAAAA==
X-Change-ID: 20260714-pm2250-fix-supply-parent-b91bed1f65c6
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784266321; l=1313;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=bMi1fwZJqr3CFZUDEqzyx+asObpwsahfGL/FCYaVGGw=;
 b=pMnxghExo9KG3zSbmy/hkwvDREW7Tjq78yA5xA0OuqaOlGuX/QjWuo/Vxh+pDdgYAgrd0Javx
 HykJsiZ2gnmDPAQqqi8YXCkAGRWUQGKN2ZN3RJ/dca6OoCrSnrlYJqh
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: 8113jyA4ajMmHxGvWVDdA7fw7J2jYeks
X-Proofpoint-ORIG-GUID: 8113jyA4ajMmHxGvWVDdA7fw7J2jYeks
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX9JxU6Q3DbWBZ
 C0oRFP7Q/ZV6ikXJzSbAH4AReyoaaRigzKBZhl0cUBfZs5j98BQzWp7aP+obH4kccA46vq88XLp
 VVzyU77zXQ8KbtGiQDZ2JkjQ8iSVBjk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX0n7CrHV0I5Dr
 ThmJ3tLuS77LX3HeF4i4vMza64wHIP4RNo1YJVaGaRAsK+nCqoRxNZu7gyHMcBzfM4Ofw3J4TAa
 W7alqQNLKcotTBasEANQYlPHnwcf07kjPQYlSHHuHqgTsH09kiGWBis3lhmNdsgABow/9mG+I7M
 WSNvo0FcBrv0diLoOyWdignei2dyE33x+0ERyzulaWd8EVIid1HpgVedPJLCL2aKko16bhLPGQU
 JQK4TnSE3HpCp3/bEHBJ5MZcKS597Kk0WlEaJS0A0j5n4HBDBR2R5MJyR3H7x4PULkt4QKxLjO0
 kV7dmDlgcjrXbRcBTrvN26HmXN7BX/hL0szLyRDd1DIYTTLSSL9qXAUUeRGHlVLUXFmHPXd7OkU
 ZrHkgNoOIXGaDjvoEmCzsJ5s4AldKPc05bg5Uy0Qz30fvNgrijyqF1FHesCpDwZstH5mlILJ3Pz
 0eMxXtMzmzFkCz679aw==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59be56 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=W-yECum41WkdzmXz4YoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170051

The rpm_pm2250_regulators table hardcodes supply parent name strings
in the regulator descriptor, causing the Linux regulator framework to
vote on parent supplies from APPS unnecessarily. On RPM-based platforms,
parent-child supply relationships are managed entirely by RPM firmware.

Fix this by setting supply names to NULL in the driver descriptor, and
correct the supply parent mappings in the qrb2210 and Shikra DTS files
to match the actual PM4125 pin connections.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Rakesh Kota (3):
      regulator: qcom_smd-regulator: fix PM2250 supply parent mappings
      arm64: dts: qcom: qrb2210: fix PM4125 regulator supply parent mappings
      arm64: dts: qcom: shikra: add vph_pwr and fix supply parent mappings

 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++--
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++--
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       | 31 +++++++++++++
 drivers/regulator/qcom_smd-regulator.c             | 52 +++++++++++-----------
 4 files changed, 77 insertions(+), 32 deletions(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260714-pm2250-fix-supply-parent-b91bed1f65c6

Best regards,
--  
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

