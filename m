Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A24A17BA6
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311057; cv=none; b=hguH5ig+riLYmtNc+LniYxCyyTZqKrzxypQ0twcKAqWEnl8fHq2l7JXTYxqK1Cuu0CRF18sY7ynU6dxe3PaUEw+i2yhYEdNR5QTkhsvpgeOpsFipKcnyn0CcRHbnmQaGijV90iNshzTSwySJFG6I+adIOo2UXwPoB46x+64bycM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311057; c=relaxed/simple;
	bh=8yH18CabF2uT8z4kGoYVPlYxmNkNb2iB2IanbQbT8qU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g4ocPSpGD4k7TPklP8TH/IGhON8bDd9v+kvUmNArT/w6qrDBDxHI6jQsV2sqRsPodp6HPR8djPooOmnYB5JCYNNwNez0vmNOawRQUXDyO2xzFd5txG3l755iPj4pLxlKFLOAJDq3V2dMOEkNeubO+83FWuTzb61e7wzNmi5IRNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axsdx0pm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCs/02he; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axsdx0pm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCs/02he"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHr9Nt2972957
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ik23EJ1+iWgB7RPS9yPxTH
	EOSriWwzsi42HD3aFTW1c=; b=axsdx0pmtfwwwmIpCMvQ/rl717t96eJTvUSAk+
	XUpdl8btdpcEw3MRzm+RcsPzpNUrNNWKXF4S/vDKTwyUru2kn5J/6WBt7qlUE/8C
	iuH2R1SHtfqmuEOiuECE3SPN5ldAKXG2Oftuu28C683zuRaK1MNBPeW+wcUCqJPl
	DdSqnVDxG8lNn8en89/p4mmW5sskGTV8lXvcOpb8GTI2qI5tkg2jOSLrqZqX90XI
	gri04KyMWYLC0v380VG0KOOSgV+QuWnJWpJmBhfPWt7sY4LkGxLSike1F5+X2tEn
	CWcmbZjMwx/FfUq2bHYLHqxzww73VaR+IgxjsjG/6BLSlzag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc37xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:10:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4987c698so250054361cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311054; x=1774915854; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ik23EJ1+iWgB7RPS9yPxTHEOSriWwzsi42HD3aFTW1c=;
        b=OCs/02heXT2Erq1PcbaL1UEXDglbSUQCbICaRMOe2OzICIIn1N1pUs+t7MVf+v56nF
         iRIFORniG8yKkucIk+XzW+nL3EmZ5xZZBmxV/bzs/2LaPwJ3+8az4li71KR5E5obxsZL
         6fYPY7L3V+0kgDNjOWkVpDe9D/qDmVs4Ag0XDgMaz0D8kGgpgVHaDGrwGK/9PmOH0etE
         hvm5niPgwO0aHt41bttQ0FzglxAo/2847EL6t872B7BhQxh9XnkmyKS3e/uELCRpHGeP
         Wkt/waDIdlbnXuDg1zXtAwYJ8W5MJX42bFhrkl7SknJzRD+hZ/FCYGzQfI/gOKoLfx3c
         7gPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311054; x=1774915854;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik23EJ1+iWgB7RPS9yPxTHEOSriWwzsi42HD3aFTW1c=;
        b=o3WLWtCzQ5P5ctHzF8yGvICliRjuysKI+lqsphlLhL5t6vtYoeMuAx0nIpXP4SLPMP
         TN1PLFXfZyPezYO0kL6VZuo5jTyPbJ2oSCXB/gVdqSOThUuWcAGBLew80K2wfR6UYt06
         11rI+v946ndhBVygXpY7VQNMWpLhYkj4tOwUQ9htW26TQLGL7Un2105IxA9lH1K65NUG
         /V78M4gjWt2cIvUYC7TT11RBdyJdB123Z1PY26KXKAdrJU16DYYF5Bx1mLprKD3H6hB4
         gJQBHl52UX9UFAoxYeMKjt4HK43Q5gSACxNb3e20mwom+8HRwLbRbuR5adqX4pP62rai
         VPQg==
X-Forwarded-Encrypted: i=1; AJvYcCWzKOmpDg7vv3YaTUkpg4YnMeDJRVT5VTzksCNm0+cuyke5BYGIyQN5PDG3/7U5Y1QUfZlxykEFFECZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzWfVDtzVEr4FYENBaa//l66J7PAic3bcq/ZiXzWw5Dh2exsdyE
	iIfCyLaTIaAkMR8c/KMEcgOdzIgXEGWExhgp1/89qcVBEj2TOi+E/HiJAxACoey8tX6h6RS0ukG
	lO6NE1rIga8H0ueQrWPfkbbNOggXxJhu6r3D/Vj3cmcTU+qHOvd+ZyGfRCMz1Dltr
X-Gm-Gg: ATEYQzyDvPN3sP7PSvDfoYklZhRmjFI/LnufoSFHmZaGZK6BTF8ndrzIGoEdiDZ019R
	eLbqWQ2heb8qgf8j2CZzR+lGhOp3/8SqCJsww5rYY10C1aHRRNXUNDGJ1MfwhWsTVWqnI7SxJ3m
	QybTfjvr7XuSqI3vl1iqYwcGPkO8dIE5gwmaOkzAyZPfgJDOxmQ3BOdU6wEVauC57NrkW2VNNOB
	09u5/9PEyMyyqxNV1OkYBZPnGXd1NY6f0voV+oTLZRjO7tKXXqVkM9A2OOqzihkNM6DAW7Ox8jS
	H0fF0kQrQZFuvA837n7r9Mu4Fn//u7Co0LvPU0BC7SJobjqABI4z6FySTTwWZpzHD6DS6T4tkTp
	jDyO7Hi47wWUxNycuCtbEATOdym74Xk2xg/iUICdQGtCRSKFRvHgrXPIVQVj6yoPNrXzr/9UURe
	494DDtu0tlNBi32MOTCIKoZrNX82p8wjvTxKs=
X-Received: by 2002:a05:622a:8316:b0:501:51d4:df30 with SMTP id d75a77b69052e-50b6ed42bf6mr18143301cf.8.1774311054364;
        Mon, 23 Mar 2026 17:10:54 -0700 (PDT)
X-Received: by 2002:a05:622a:8316:b0:501:51d4:df30 with SMTP id d75a77b69052e-50b6ed42bf6mr18143011cf.8.1774311053876;
        Mon, 23 Mar 2026 17:10:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:10:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/9] interconnect: qcom: let MSM8974 interconnect work
 again
Date: Tue, 24 Mar 2026 02:10:36 +0200
Message-Id: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3WwWkC/1XMwQ6CMAzG8VchPTsyCsrw5HsYDnMUaeIYrko0h
 Hd3knjw0uTf5PstIBSZBI7ZApFmFg5jCtxl4AY7XklxlxpQ40GXiMqLN01dKXZOaesqh4aKsrG
 QFlOknl+bdm5TDyyPEN8bPhff788p/5y5UFrVpsGL6fY9kj0Fkfz+tDcXvM/TgXZd1w+izc11r
 QAAAA==
X-Change-ID: 20260322-msm8974-icc-0ac4c28e139a
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8yH18CabF2uT8z4kGoYVPlYxmNkNb2iB2IanbQbT8qU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+bBa63aVkviZ2zIPJnwJ3tO0dGI0AWvfSV1Mz/z78/gf
 uEaNVGyk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATufSIg2HFPdVzO5kfOune
 SnXdHr207ZUPq//FBWzt5x95RpjmL9XUtSmqjUz1rkn+tFZsiuLfY0nFl7g/OR1MlMg3bzzWduF
 bBaf4rbxFK58oZLBJa97oFwmMmf0vTdkke+qBnRkV7et6+hRrCkO6Wi25ohKeavwouZBcfOb+ly
 ymxJVube06i3qY0wNCzDx2BP5P3tJwQ7laU3BV1oUbk12nPfi/u8v4SEeg3eI6xk8P9Q66xs52s
 GJbX7r265GGHqa+wqNTlLIUv94x35jMp6G9xnrfwuJrBmXuKmdmG9V67dm3e8Z07eXav8JE5s5S
 y0y9kjhtu63+/zXXa62b5XLL3BfP7tpQaH7hyf0eAy91AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1d68f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UYl0gxALbNRs-l06lEwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 1JLnuQcjxHJUHet_Ly0RkViQ0b01BiHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfX9FVHuLHYNWbe
 5bsKCyX0zGxSRBMxfhbpsVklnKFGx67/738Qd3Vs2AKEENeuXeo+uGu1iGjfulQ4F3k6L30DUON
 eEIH0T49pnMuUFB99uouO+MFfQfEJdK0CDsxgQj1o0tzkeIbVOGLdK/dRG2OXuSc/w4R7z/m+qe
 aFAKriyNoCrhVmdVUf7n43l1BAfsY9dmOfxN6QIjEZMmJ5LPbTmQMkfObP9km8oqqJRNogFlAJt
 Ei6nFbkRlq3ytGxytmnDUjC/cp35wpsjH5943Psxs40ASnf18PGUmN70Eu0budYsC+7txg8QMak
 sz7ZedVbUOHnbg1eSO32o2iBiaPhCVMj5fFmqmTz6ddrUMLoPXNCwZLuQCKX7g6yrYDpk821l/U
 swFIQOIvWJNtm3oNvKH0wdPDqalqIF9sWiZVrew7xaG+C5WfmIE0Y05ab8TYZGr5Za9UiVTWMmi
 ctx1m8wRszNYd9nxPwA==
X-Proofpoint-ORIG-GUID: 1JLnuQcjxHJUHet_Ly0RkViQ0b01BiHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240000

Commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus
clocks") moved control over several RPM resources from the clk-smd-rpm
driver to the icc-rpm.c interconnect helpers. Most of the platforms were
fixed before that commit or shortly after. However the MSM8974 was left
as a foster child in broken state. Fix the loose ends and reenable
interconnects on that platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Swapped order of clocks and clock-names properties (Konrad)
- Corrected the ocmem comment regarding core clock (Konrad)
- Link to v1: https://lore.kernel.org/r/20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com

---
Dmitry Baryshkov (9):
      dt-bindings: interconnect: qcom,msm8974: drop bus clocks
      dt-bindings: interconnect: qcom,msm8974: use qcom,rpm-common
      interconnect: qcom: drop unused is_on flag
      interconnect: qcom: icc-rpm: allow overwriting get_bw callback
      interconnect: qcom: define OCMEM bus resource
      interconnect: qcom: let platforms declare their bugginess
      interconnect: qcom: msm8974: switch to the main icc-rpm driver
      interconnect: qcom: msm8974: expand DEFINE_QNODE macros
      ARM: dts: qcom: msm8974: Drop RPM bus clocks

 .../bindings/interconnect/qcom,msm8974.yaml        |   28 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   21 +-
 drivers/interconnect/qcom/icc-rpm-clocks.c         |    6 +
 drivers/interconnect/qcom/icc-rpm.c                |   18 +-
 drivers/interconnect/qcom/icc-rpm.h                |    7 +-
 drivers/interconnect/qcom/msm8974.c                | 1637 +++++++++++++++-----
 6 files changed, 1274 insertions(+), 443 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260322-msm8974-icc-0ac4c28e139a

Best regards,
--  
With best wishes
Dmitry

