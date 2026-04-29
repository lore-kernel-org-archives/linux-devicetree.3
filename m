Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E480929346F
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471811; cv=none; b=FpAUlzSfTWvXTKMN8FvsKNhY4vFXXojN3M+BQv1zCWIDaQreYCeesibcLTCdWtW4fu1Null3DkSVaINwxGoxBG1WaVtv6XQlZej+PYvJBImO0wkMeTJv7TNIsy5i8BjElPv84q14mYdDCTGkds3opGcudqbqd18FKpGBRDmL920=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471811; c=relaxed/simple;
	bh=UR2GNZzYk2T/Xx8WSgpWlEZS4x3FLBu7HRA8GCFdqEA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HgTLe5UVsNZ1SMwuRfwZCrLSJFzJyDZ2GbSGJ1Jqf5C7iy+6E8N18DE30PEHWpq2kdMyhRy/ROtO00evyT6x1tRhho0DjGMpcdU5p50IgnLhrASHc887NpcXmPxuztIEx/vV1M5xyEDwh4iJ7NJ9jOChjq+B6anJ31N4U6FX6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwJupxRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L78KpapD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwJupxRg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L78KpapD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qXMY1642983
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cfUbqW3/7ZCsQRX+rilXrd
	6uWuepNjMmvDVbiiMvpPk=; b=iwJupxRgFzM3W9GgTgkn6OtT74IWuLjCfn0BtG
	V33Y05oodXq+g2k+fb1oNtZxuogEYjjlLgyykjacDZSWYzs91u64poeA52pydtxx
	lfVybZHhAUy7I9Ul4WdlGgJI6ZRfvVeR5RfveWNAm0xWO3TvP1NkmRJSZxc0XRmQ
	4vHdHPrT/ZYm7/+gtqhlT7X9SnA3CGuwRyAL6MNtkAqsloEa27P8An6frVZAeeJQ
	vWt6HUrQRKF6uW9Wz/O5/+mEemFNCZXq5n5pe7iH8Pvre1/PiKrTHO7w+9U7bl/x
	RRDm7S2DDUD9Se0cLefxkhVG8srIP9uxeHmsiL4N5fbp2k4A==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj81utu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:10:08 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6583252c117so6826411d50.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471808; x=1778076608; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cfUbqW3/7ZCsQRX+rilXrd6uWuepNjMmvDVbiiMvpPk=;
        b=L78KpapDlH+uWacy7uqsbnUW3/FxIV4+cpf9ECFWv3WB2QlDp86dC/IVrFs/bCv2At
         VH1FDnCmaz/5ZfkVIlTRkqJ79H5wTipw6qZlmyZ2CW0V3VBxLbuGsa11zIMbsUFsb3tX
         vLN0yTwAXU8TeZAkdqllYAAoWDXCH54rSo/5zAIo4phpG4RbyBtjb4qWfZNodCh97Bqf
         p8mXktyuf/vcZ/wtF9AbRk0rzkRx0xTT4vYS4nm30iHfd4JJGP9rnonJqbd6hFSe/u+s
         ZXFbxbhIVhmwzCe1FcZOI0dt+7MtQFINTb3YPLVaFHAmSkBGEfQPHA3EeSKfURLTFl6e
         zKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471808; x=1778076608;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfUbqW3/7ZCsQRX+rilXrd6uWuepNjMmvDVbiiMvpPk=;
        b=gtaxVP9BPpdB7nM0XiMUKhFvpenFBSXoYe/q/mYseCQw314ukiR976ksQnFB6awmtR
         rj7FV/Z5/svz58NdMxQantjbbXBAZv9DRcdXNw1Iy9KsmmriFTu94eDowQwbRjQnjr69
         GJetNjq4p2ycUt1pvyxxzzaqTYoYZwWA8JhCfXIGSJ4Fdm8H3xMZME+UKY3yDThXGKqa
         cPY11/J0CCHaZpLbtjeekU79YGC2L4xVNpOFkJukB7b9Hkc5gtg1r8kBSbwULCBvp/Ga
         AEsZI///nqeOdIy+Gr1OkGEyAt9APVM5M067woqtSBIRWSYUf2ful5PzyaCTvJ2Av8Do
         +1QQ==
X-Forwarded-Encrypted: i=1; AFNElJ81xLw4eRvVpKQvmNgofS210dt48s8MO1dS6uLnfUEdmVZu92w8Ankt6pxSseeyPY7Um0MnM4H/v3RJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwfvbgIFARNFtnN/A7p5K5bj1YKJqRU5gSkfeWJRw9l1wgI78W4
	RRQr3PKyUmQ9YSCvAJ4gB9+SBJ6UilV/9UTIpAi99VRchZ644vLnmCOvfC+sPkL702bAC3n2pYg
	yq5Dw51DQ8HEZAO+9WPSoJ9+RB1dw2i9CzN80ES2dIh/WT+jkT3lXumdmGdYhfj8=
X-Gm-Gg: AeBDies8Dnec7RvGyj+8DBsOVlrbjaVEqn1fTs9qWBMCYQ0m9q2pYClRQD2K6U7/sMw
	PW3g6BvbQFEQPO2cxQvUtRPmYZmVkDvimfYAtLW0sXUXvYRJlQECs2W/dWlkmHy3O7MdaniBX5/
	Iti6ygGSqN/FIZV8d332QkXY6YBBPblm0YjBSUxd0BzSagnAYJo9bXHIhHa8ZZ9IujFoFxvuyZy
	9m2WVir6vUHokT8Ikp4QiJ0vPAqg9g4MXNiJOxzL7mOY7iTuhneXyuzhx7nmuLZoW1/lJY17N45
	ON3Us5y2A8qChxm/jKtEo9X67UN/cFvtGlhok261k9wPwlXA5+O7jhQuwSBTxCrHliePVDlE4Ov
	atgwsUe0j98Mxwa+NGTPok9Zorriu1f5NxsWxpQfjyuv2SC4z6T/amxIm60EzMg==
X-Received: by 2002:a05:690e:4841:b0:653:61a:2cd with SMTP id 956f58d0204a3-65bfb5f1d20mr3421498d50.16.1777471808207;
        Wed, 29 Apr 2026 07:10:08 -0700 (PDT)
X-Received: by 2002:a05:690e:4841:b0:653:61a:2cd with SMTP id 956f58d0204a3-65bfb5f1d20mr3421455d50.16.1777471807752;
        Wed, 29 Apr 2026 07:10:07 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff7ce720sm1286731d50.21.2026.04.29.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:10:07 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH 0/2] power: qcom,rpmpd: Add support for Shikra
Date: Wed, 29 Apr 2026 19:39:55 +0530
Message-Id: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADMR8mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNL3cSUlPiigtyClPjijMzsokTdNFNzC3PjJKO0RPNkJaC2gqLUtMw
 KsJHRsbW1AIPyDG5iAAAA
X-Change-ID: 20260429-add_rpmpd_shikra-f57873b2fa7c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777471803; l=643;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=UR2GNZzYk2T/Xx8WSgpWlEZS4x3FLBu7HRA8GCFdqEA=;
 b=QC0TFLRbV6TUimG8J52sfoFg5Chz3LuycquIGqUzRedPuKXO7820cBx9z6ySXgwbGBh7WCFpo
 GQYFLhWseDfBYhBxQMBGRQy6GMpgirSX8L+8Zjrvex89YNWnXrulOaT
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: kZt1Lq3Qhp9qnEna4PrzBcuMYxvhc_S1
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f21140 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=w8gYdMrFLoSuhkYnXDgA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: kZt1Lq3Qhp9qnEna4PrzBcuMYxvhc_S1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfX0XNIFGKWU2VC
 h5yYAQAXUOmG6JeQAVtkUcHX6XkzfY0Oio3WzcyW/+kvaqLVWluhJUDrFDMEDUBtF+/5+Icq+R0
 b5PW0Kxx174owfwQfIrMhfQ46jsFaF4jrB37E87EheQQnhWHhPyNgfk2sPC8H5GWtzDVogNv6dL
 KCdNtyUWKlqDKgEqDyLVDw6KiAvL4jLJOUCe6yis4FBR+Z0scsUTeYx2Z4ebad5u3acInEBenLu
 O7FA6hmO69vKgAXbunU8sEPDx4QLThVi1i4TUHPesBjj7uN9aB2xp49CqUvkyB+LxMhsZBaJDyc
 4kW7q48wgqn2W5QN3Bakdj1SxfoKTELTJHQ9lmQWZEdR16BD3/e+z6iO0Pb9yQkZGbh3Jk5PP2K
 /6Od+R9CmoodRLjSshQ+QGGJ5dRNjyw4WcNHXzPSDgFcx7SeY6B1nTYyNYgTyvFCeXfIQ8Xqb27
 GqxU9BfHgCKY5ya0BpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290142

Add rpmpd support for shikra Platform including RPM power domains.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Rakesh Kota (2):
      dt-bindings: power: qcom,rpmpd: document the Shikra RPM Power Domains
      soc: qcom: rpmpd: Add Shikra RPM Power Domains

 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/pmdomain/qcom/rpmpd.c                           | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

