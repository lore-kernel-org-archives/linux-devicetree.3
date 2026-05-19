Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F1C34251B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172531; cv=none; b=PECKNw/quQj0xzOUMKQap7Y16JLX7ei1K6VbtHnsTXP6muc9jpMv8Fe2BGF1U+owk2j16dSfQd7x/FWtKVJGS29C0qcHkA7L7UfBl7HvVWIAXN+SjLmwptQemvPQmL+2dBmfD6kiVhi28sBTy4WFgttCDNuSVlqQ33zqbgBFXao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172531; c=relaxed/simple;
	bh=NC/ZY+idUIZlGAn73lQ1rgtFKQ5JJg8HqlNadEGzgaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fEsQZPr9mLdvGP3fB46v6s0EBQNpWw35nt4JXtypS+tn5K7+Kes5obJzfobeKmVMykcwR6NiFlwJTztz4gV2yUuI/vEute8gcWSY19xjOPSZYyH6ArHLObUF2iYaLNmdlC57nlNVn6yMS3ZBo5Q9yZr6odToC/QzG0i/w69zH1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2kXfKGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foM0N+N+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2kXfKGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foM0N+N+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5URqU2701160
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R+tevW8hmJ6cwfeoghQQ+v
	saziQ6etj+POjKImStc6A=; b=a2kXfKGXI0wxv3ADNBYbtqLPHr1Sxli5q6pDIL
	ulQBMeFjQ0mPz/b+BP+aUi+RoHap77eY+yD5qbqCSAy1/oQT/bhqUVnNRyH0qZT0
	9TwMeqxJgp3O2W9rhZ++04yxhTys/WvOjThW99qOlNmmTYM+UIxDc6Vyoy7btcFJ
	vRnmJrcU/yM3quQ15c8wwUSQGHT1GA6awSkWuvvOgukrJygQXE946LzFgBCw8tGn
	1ZTRNxYTBQpm3JNYD4u2UVnTTE1QZFcjSZu8JXqH2AI6mkkRx5SRYQy/JZUtA9/R
	G2+1W+4cNomtCz8KiRC+dZetmX0OLEfsZr32oTu526LBjv4g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82mekjay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:29 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1353ac304f3so5704494c88.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172528; x=1779777328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+tevW8hmJ6cwfeoghQQ+vsaziQ6etj+POjKImStc6A=;
        b=foM0N+N+AkBlSHCc5v5OO6isW+TWRt0sPhDlPBQ8WIt2Wjtn5WLTa35K+Ex1qMGxgy
         wKG2ZeMdcnfQworx2MGoDVY/qDxkZoOvpRlZ0Ttk+mwQQi9rejCTgd7492h/76be8ekA
         Iybx85pjM2teVa42juUMBNMJbqjwkCN7YzJ2dc689OyouV5TckdYk88Jwo6jc3FMHlcX
         fLNW7UzCnzoLzNxBd6dGkM2dQar3x0+Z3wbx7wcFyLiA3jBSKLksRXhCc5n0tO7bn9Ym
         kvNzZ9bDWYl0JOmp93m8YPM2OW6bwj2IOhqZh9DkS2TWQ3PmxJ79ES0Lq0nd2U9c0SPC
         Rf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172528; x=1779777328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+tevW8hmJ6cwfeoghQQ+vsaziQ6etj+POjKImStc6A=;
        b=B5U2mmO3YH0dHWRCudh/cYWKi6yqAAGDfyU9ovpjMYVzalFgIxHjCDFIzIbSJVQ6U/
         j/M1Lfy38OCVBdK3nQ9BVjSms424JyrXzwhJ4i44fXpuBmUMcmnBWWSBrHdQheXUhMei
         b0ePPGi4N9MIahrJY7d9HVQ0PD03WqJ+TQk9jbbzxEw6/RlgAKZs8ogaLLeI7BYRQevD
         lQ15y2YauTEUMQcmONas+R8eb05N24/ObLEk+3pSjjpgnVZugxVSuWv9IJbSxrXNhqVa
         +JZGdH610KX0l2zonfSsw3zIaxztSYEUIm75W8fBYjkz6p37pc8OeLt8FSIZHypWd/Dk
         Tq7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6H+sGFdmYDnGoiwIwy8G5O1RDAlohvlhXFF7dnNm1KfUAW1ivcKyg+2+T/CTowCwO4G7lFGIQ4VSq@vger.kernel.org
X-Gm-Message-State: AOJu0YzNa0XWNKWHxXtfG9Ptl5K7f4dpF8gPsY4zAhEpL2ZU81f/OiiN
	009lXSbx1BaWKfAHBWcPRwfV98ve4QJpMB420IxA7H/jmAFygvg6NuPnO+Cx3YqKdUTtto0tufM
	+/PqInPbT1ohHWi6IBJx+QgsvECrTgXXal1TlBuHT7Chwln2B9mcbcpPUECy6dR34
X-Gm-Gg: Acq92OFXc7bhhO6kB0pZQvFaB4nzhXN6ySzPkTxAwHaX4SeAWemzlLVS3cANt58yfO7
	9kfqYWeLWDJ97tWriIistonISV6XGhE0wo/dEaJX1I4lyWo7hkYiyWFESGuLvZ6fzq0i2XrxQ8b
	BHbt31BvsN4y4iL8n85y/IH4YGLEXjS1bcI+F9k0aWJMtUVLoQz5TXp7tchk7jWVEjXoEHOWDn8
	RenQ836ma8QR/0PB01z6QSibeHhqvDJDbqpDu6xeXehntnVvweIhAVNEAPl2zwoPm6+v1DqLq9f
	zoOuJ1S/483AIT8mnARN0yBgii/XSUm113I2DourvlJDXUBgzgZvscnRvLz8JaEA1CfR4pQucdY
	HmWzYhMp6UfRkMu1AMxRnfJ6yXJVCxj0HPbxaweDsJjOPboan+HcmLNqwKK0Ehn/QcKanR5MpCO
	iMQkOmEA==
X-Received: by 2002:a05:7022:6082:b0:12b:f616:1a4e with SMTP id a92af1059eb24-13504740a2fmr7007226c88.23.1779172527821;
        Mon, 18 May 2026 23:35:27 -0700 (PDT)
X-Received: by 2002:a05:7022:6082:b0:12b:f616:1a4e with SMTP id a92af1059eb24-13504740a2fmr7007207c88.23.1779172527288;
        Mon, 18 May 2026 23:35:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:35:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Add initial device trees for Nord SA8797P
Date: Tue, 19 May 2026 14:34:57 +0800
Message-ID: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0c04b1 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvxB5pMcHL_gHO18BLkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: -TGyVoguv_7ImFKSvKzobgk337-ragNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfX3pA0aEMPje3q
 2nlZjj1CLA1SiN3GtcyMEcZ3edGmn93avZfqJ7rT+se5h7ltp9IiCt6L1FxXeOiQgN4gte8s4m1
 13aD7vTbiHm2H5LSBFPnpMszYnsxulITIGYp/HMlfDD/woVKTUrvrWgxFLyDjWwPz1aTZ/t50QC
 C3K+MAFpHRBQhciGgp2ANLigIauUoFcEgliDHA5UGjYrZye5nIR9ck2tQKHUFomy87lXpuuf8Zx
 XtNKRpo1Wk5Lm0VSYdAAyysez9tqWO5/CsYFonxb35L+I33JO65WkW9EJmi/1qguoxFfin/fiva
 4QXrjf7OD+Hj3npa4ShIBBWDabRqa2NoMmn2OK/3ZvNMPsdv3j04N08oKQQb6yQHxPFSVMFy13z
 PTawH0N9jl32mGLULnu1l1rWzfkEouUq7NKYxKvreIOqun8VeukF6Ua49OLlVzsW77QZC7CnNSQ
 GqP9vizV4wNiHcvzqGQ==
X-Proofpoint-ORIG-GUID: -TGyVoguv_7ImFKSvKzobgk337-ragNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190062

This series adds initial device tree support for Qualcomm's Nord SA8797P
SoC and the SA8797P Ride reference board.

The Nord is a new generation of SoC series from Qualcomm built around
18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
is the automotive variant in the family.  The IoT variant IQ-10 will be
added later, by sharing the base nord.dtsi with SA8797P.

Dependencies picked up but not hit next-20260518:
- CPUCP mailbox: https://lore.kernel.org/all/20260427005236.230106-1-shengchao.guo@oss.qualcomm.com/
- TCSR: https://lore.kernel.org/all/20260504081122.825635-1-shengchao.guo@oss.qualcomm.com/
- TSENS: https://lore.kernel.org/all/20260504081236.825755-1-shengchao.guo@oss.qualcomm.com/

Dependencies to be picked up:
- RPMH powerdomain: https://lore.kernel.org/all/20260414035909.652992-1-shengchao.guo@oss.qualcomm.com/
- APSS SMMU: https://lore.kernel.org/all/20260519013950.873105-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com/

Deepti Jaggi (4):
  dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
  soc: qcom: socinfo: Add SoC ID for Nord SA8797P
  arm64: dts: qcom: Add device tree for Nord SA8797P SoC
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (4):
  soc: qcom: socinfo: Add PMIC PMAU0102
  dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../crypto/qcom,inline-crypto-engine.yaml     |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi    |  937 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4511 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  306 ++
 arch/arm64/boot/dts/qcom/scmi-common.dtsi     | 1918 +++++++
 drivers/soc/qcom/socinfo.c                    |    2 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 9 files changed, 7684 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/scmi-common.dtsi

-- 
2.43.0

