Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801702A1CF
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367882; cv=none; b=l/2f9Q0V1dViMrq5KmtOM14O8bUTc8GhSpqJtvfh6pBDoPBxHEDbTSr+E+5PouWVf56ovDCzDpq03twtE/Fr2wIGIis1f3Vtod+I+0QYiNkkoDgXYug35kc1AM7HnLI0J/winBfq0viIUoRJlBNMDELMClsf7RUUbPOmPXQdL4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367882; c=relaxed/simple;
	bh=KhJP8J3d+cslr81V2e60vUEUuMY3jbRP1BeHMIkI/xg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ehez12Q+RPAHS/QY7TzuB3qHuhJuy9wiL8oN/jOf2G0T4ZSd1usZz7sOeiT9g01Cx+lmIdM/eGYsPYhXKidYLVG0PK7hCMdk1sSPX6SvyTJAouua/PGvdu/TDrDJUyR0lTQmRQsZJyuwPmAuK1nSrbGM7W6YLeXekK8U8UPeDmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzVEvxl/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnL9R5rD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzVEvxl/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnL9R5rD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S4NFuE2006325
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lLkw1O5fNcl83EO+1TghwY
	Eyy1UKI9leinraRTuerVw=; b=XzVEvxl/CXMsD+Sx5WPvHVjET4sCY7JdnUHqEj
	XXHyBU3EwhD6b+Dq8+Z9fKy4Lg4Z0mBjPv38FhuHuTj2K4nbqpEnxdF9cqi2a4Ar
	Kre7x7hgAZJ5CBKD/ZPbomgWIxSH+quYzSC9AlnKjBdYCRT0eYUUHkerhxKoP7cW
	5IPbLyg+IZr66z47P0tGoyEEz7hr1UXx9XGA/LbPePXyD55u0Dn+luCba9t38Zu7
	SLz7hjrv8G6H5LlE5WrsCE/91ok4FuGxIuNsNLIheE6nwuEdEY0mmO0kHVjyTQhp
	SvhCYyktm4ByOIanXAcdDzJNno0Y4GNUui5n15RbMX53DTyw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkmc0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:18:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso102617955ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777367879; x=1777972679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLkw1O5fNcl83EO+1TghwYEyy1UKI9leinraRTuerVw=;
        b=FnL9R5rD40z6RhHo13SwwYP4z9/8v1FtZDUTLIMCWmFK0nOFCOEqYtJhH1oRhEMd1W
         aXzOTG/IfR/dSCUMD3EuTvdj1oYZToixrAnTdSLlzg9r3nsy6N891z2526BeYZIW3gzz
         1QXw+eO/HTbnV8bL6OrIFW9EsFH8VDzPmwegutUF2yphMVXXJdV/JFypUg2Fp9rGb+vM
         EpAidF2cXpptMDyfuNn2lXONFLMGI1UkkR9Nyqiz7bblwrx4L5QNZ9mZah+Bmck4tRAW
         Tey4oriM8qBNpsgAgGS9fGsWH4ycJzN5tc7csWj06fWkwkUCDp27Xlx6orqALXO4KtTF
         0rOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367879; x=1777972679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLkw1O5fNcl83EO+1TghwYEyy1UKI9leinraRTuerVw=;
        b=fEFcshN4bCr7o4nQR11yGkIyND/rdZVXvu0oExXR0X1uuiUmr7ros1cMz0J4U6fu89
         fXno3EUDvUd5IwXK5D7JflkfqwgJZP1kfJxWWUweHoURgaILC0yM2Wr5kcOKNRnrBbhf
         gy1dD74Z29NDnoGbvnMWq71cHSHn9K+RaHoNaapqvmdzhofDgyeefLK2W9NjCLbciAfR
         kyA3dm9xdbn+nVFlvPBzbibu4RVKaQYJu6Hs4FoEauVF3vSpjaCKm/R5piFwY4vgGIGd
         /Rz9zh+bLGIV7UZ6oXi976fdmWO5vgoLQHabQ5IfAQop+VBywnl3WMOLkbtgX5nu9cvJ
         J1Ag==
X-Forwarded-Encrypted: i=1; AFNElJ+TTp4GNPRwD/teXXuYkDvT75eTkhVGS7BJqBZJ3N2NNgnAKGHUh80EzdUjd6VHqB0DPH7yGta/c/yf@vger.kernel.org
X-Gm-Message-State: AOJu0YzVURu9fKT8kGTOTxqfhcqd7Vszy8GswfcIPTaoIWZ8lGW/EDa0
	/+3cF16MCEtZLvOLsPnuE0XxeLIvJeYzET6e6hekBwgwFqe9VFF75DGB/bEQbkpalZbnE8B2rOj
	vRx7HV51uMkCHMXvBBLbCiZDaR1dEMPxBKW6n9YeR7LxZHGChytzMK59/Ufxjn3xa
X-Gm-Gg: AeBDietWO7HqFr3fioXAkoI342Xir128EcTMyMZFalzoAWYJ2gbvarG91oPWHMoelM5
	beS9zDQPSmxovC8KXtCxc/hVLQn+cHseyE7EY22eINL9eNzn3OKGz9/lsZho+8coEt7tUTl8BYf
	T09qPj7XjuKkNPIsKXoHHJqkHJcKFXbFUW7LrR3xDeO8Ox9NG7o45eq4/hemXphKo/nGB6mGi4V
	RRRM+EXHNXj3t6PnXl5oBugdgSktm+SQF9IolKfcQnyGbnpayCSlFNzilsUb9HCDz9s4rLMQ7jy
	VXDq1BWUNHJU3FtfYBdkqW5Yc6eEsi1zwO0NADme+QGdwyXUjuf8kTma0CYgisYjM8Im2PRs66x
	68kVtUQ5aGdIBxE2P8Z/P77y/FY25VcO79eMf7BJla6dxfFA=
X-Received: by 2002:a17:902:820c:b0:2b2:454f:b951 with SMTP id d9443c01a7336-2b97c4c98aamr16821315ad.29.1777367879049;
        Tue, 28 Apr 2026 02:17:59 -0700 (PDT)
X-Received: by 2002:a17:902:820c:b0:2b2:454f:b951 with SMTP id d9443c01a7336-2b97c4c98aamr16821095ad.29.1777367878594;
        Tue, 28 Apr 2026 02:17:58 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acaaa2asm23069505ad.84.2026.04.28.02.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:17:57 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: qcom: Add SoC ID for Shikra IoT variants
Date: Tue, 28 Apr 2026 14:47:45 +0530
Message-Id: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADl78GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3eKMzOyiRN3i/OTMFN1EI/PEVGOL5CTzVGMloJaCotS0zAqwcdG
 xtbUA7uXH4l4AAAA=
X-Change-ID: 20260428-shikra-socid-a27ae38cb7e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777367875; l=886;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KhJP8J3d+cslr81V2e60vUEUuMY3jbRP1BeHMIkI/xg=;
 b=ld5x9rlrmNUN3g/dYWtM9x2czOT4GOihAFdlNYof4/7dBCmKpxtGak8+8SOB5UQupxAO8gZWs
 eQVkqu3EQ4DA7JKpIZfh1a8qNfPNLcQG0nP/G/vK6WhYww4IP+7iTjm
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: P4BiZcjP8MR6Dz2Scz-GG4Ii572YCgTp
X-Proofpoint-ORIG-GUID: P4BiZcjP8MR6Dz2Scz-GG4Ii572YCgTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfXz1RzsGwuh5Uq
 l/TJ7KmzcNSMd2CtmNqj33kxqDXjDXTlQcG5dQOTaJCUrA2LH3riVrq+rk12YYigWvmQZXYKWcl
 /c/YhFe/JWSQ50WOlhDShF09uOA+amJbf8QBi+8/3/gNHTNLgQeR4PgqTKyaI9NRQgV3X7qG/RP
 VU3dUa6Tl8VJQPlaMffUmpQ/BHw1w62OxPN8HxpRg/VrHIr31pqh6OuogRhHa1xOBo/CAI8SkT1
 nIlcSXP4fj/wLvVJ9H75P6x/Og0WQlcDIArxM2HNTx4jMSLACLYN7Mbt70jtic+ZswgfchJ1Yzc
 YVDrcEQRcOfcq4uW/qUJMYwymmM3A5d+OBRpkho3K/u/a4IhbfvN6bPn9XCB0Ubgm26ZyvQIzYS
 AvX/V2eUHqN1wWQYpr+pMwgN18fC8hPuSY9t+9FxUKEJr0YzGj8P3OwYKFFMka9U7ATJBxSU+Cf
 nsuenDGjVb8jc+n7FsQ==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69f07b48 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LvLIYPk_e027418G8rwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082

This is the initial posting for upstreaming Qualcomm Shikra SoC.
There are three variants, distinguished by their respective SoC IDs -
- CQ2390M: Shikra Retail with modem
- CQ2390S: Shikra Retail without modem
- IQ2390S: Shikra Industrial without modem

This serial adds the corresponding SoC IDs to enable proper
identification of these variants in the kernel.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for Shikra IoT variants
      soc: qcom: socinfo: Add SoC ID for Shikra IoT variants

 drivers/soc/qcom/socinfo.c         | 3 +++
 include/dt-bindings/arm/qcom,ids.h | 3 +++
 2 files changed, 6 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-shikra-socid-a27ae38cb7e3

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

