Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FB431A04D
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 04:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288165; cv=none; b=NkEDfhlJF2wI+bk0ib9JonFWr1b6mWwJ9o5ws724R5b8oaf/ZY/Jdu5uVzblwVMlXM2qKu9P61A2cyavwTPJ0ti0/IkKwiU3BwkXgWLtFCu7vv7WOYWKyveZqt9cgd0Tc8QGHOZpmDgqife6ZLp45hTnyg8sIWnI9+A1uiX0Yvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288165; c=relaxed/simple;
	bh=oj9NMY0dHTGaZ+fF8PHGfV+wg6hs7AbMX7SVDbau+aE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jYzm18ngZJ/YEoU26TTZyfa9omAFFCndiqdgWnxcRbZjK1Ew19APGfnUgIeqgCmS4Kz8iVmfVEQPysYEZM+T3t6Un6FTcSChe7eS3MY+06YJn9jm/2HPRXVcFIKkTDCZXP51sBeX5Sc2JHJHfpOqii+JHjb/N420H0VSVu8La+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcBE1YZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BF6DoqWw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcBE1YZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BF6DoqWw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VFK6EL3223903
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 04:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RKGMQInl4zv/ejwicadaXC
	R+S8YrLXcWc62MxjTRBcM=; b=XcBE1YZUdE1JcLfjwWsiVHEdYkj4eBbsYoyD0Q
	PlErcJ7TNfNVmVx6GSkFjBUyO50uInsuu7kknpzsumqcxTPxRwRqm2+Gmnq+wsiP
	vqbReIg9iw3Ryt1crKdjReGCb8urY/A/3AH3oZ+WHqzC8BsM+kGwYskrrUkgbjTO
	MOK4gOj6Y+Z/6Dm0CzVYZPbp6SqB5bpgVjhUOd6xQGcnZQmfdyaSl3vpnTft5iG/
	FlNQp7VSJeS6b4wcKljaY7uxHXvIra3JaJnsrMwAMALVo5dylSwSSJTq9hda+uXp
	N2HKAarj58dMUSlNigh8/toW0T7HHAcMohO7w1m9f6rgQ3FQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyuwkhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 04:29:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf243973c2so18292555ad.1
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 21:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780288161; x=1780892961; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKGMQInl4zv/ejwicadaXCR+S8YrLXcWc62MxjTRBcM=;
        b=BF6DoqWwJKUwJ10POUU9U0jnNf7zySK76Gou2OGjTqAxgX1eAQ2KJqcmH7HPR3cYiA
         ruqHlQxRnh1zsTZ9lsK9H+LjWKJhwL8IIUnqoE4HJaDG6xVLjA6QL1LuQgmcPe1zkP3a
         3FzK5eUHbNxdJZpqMh22/ev4lIR3+UMAv9rGB/lyZefWaSOAaZnIVovpNREXcOHPvxee
         IGo/04zPmKewzl9FDfTC/1rmli3bS15MBcpEON/f8FsUjiBo7rOnBZWe4PD8HkN2venT
         FKL7bD+B2iC6DdD6sHDohk5vB0QSVtyf3Y/sYsiHnt3MEtUCRicqHrxNZldJnPBjfrOT
         qHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780288161; x=1780892961;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKGMQInl4zv/ejwicadaXCR+S8YrLXcWc62MxjTRBcM=;
        b=oijMxsPiZ7DOonZo4EMHEVJUEJI1HPVIkTCQjJV6DDhBLyK/lVr0Uy5KBHDxjBWXCM
         1a0kfXeI7DhmRFq/FX5iUlL+2YLivGTbwU3MrL8hjo1FxREO5GsS7vi3Q80ZZJrlayNL
         QTtzKT2dVDvg2oEb0dHNPd1tOS2B4jt4N7pYdfhlurug6TW+Rf2imL0j7x4Wlgoq8PcP
         tZwflQxPhHp03hFc1yTRaVXvhQhnNJHQZ3uTXF6wU4HtYWC093Z+ibdIWXNedauJr3DI
         n0swa5fO6VQgzZEJTtf19ZJNojFX1sZUWWPl2SHnV+XU64bBsWjmxst6Yg9751EAvWAC
         BYDg==
X-Forwarded-Encrypted: i=1; AFNElJ+TYN515CxQIQlBgZf9UqyliU/msnj43ki4h0WB1lrYE7uAGayByOTaT00ZIeaaSuxTYZ2AZMUTSzKZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwkaOyouBwwfeH588sub7aU3/lgK9BrLitlZMcy6vnZ4kXCBQwx
	E9n/NvKSkpH+qrWmbWcbnZSAdwwCBJAVvJqRsKqzL915Bm8dBNc2ru8e2rfeJhlW0HoHC06QGSG
	85NcpEKQJNvVzaCa49iAUBD4TDStrlw8jxA+nmztCIr4z3hz0wA8p9XGlZ1akknX7
X-Gm-Gg: Acq92OHTq0sVJEz1Xdzz+q8Vorlb1KdOpcbgIKS+njMGOfdYBv8IcdwK+EN8oFDoIP/
	TG1kxjF6brLuyE+KoEIatVpBrrR2n0A8Zovn4Fbe/RJfr2lKwWHa4Xwg/Jk5iJE5KFhU61PmPru
	gCHqd0rHyCRzOdf9u82tMx0n9KbD25SwqtcZ1rNpv6eZjQevLvU/x41IeZPfY0YxAeVuseFCUdY
	+E0z4gOWimkmv5EqtoG3QVydyIteNsk+YHgdCv1tw7zncj+qSEfkBaR6AL/QlwtBtgyxVcPJ46w
	dI3ymAKZ+53P1q7oSeVQfSiibN54OpbJM2nsbrKTJrdPrFwlxIZy7cm+2+9QyMVklmKpD3YsNU4
	JrfgYYIMDkMp+PnHPMT5hzFEok2k28+NFYKztPyPxYeAG2z78bW6/fRn8B/mDjQY=
X-Received: by 2002:a17:903:46c4:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2bf367dfc87mr97329605ad.18.1780288161454;
        Sun, 31 May 2026 21:29:21 -0700 (PDT)
X-Received: by 2002:a17:903:46c4:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2bf367dfc87mr97329155ad.18.1780288160930;
        Sun, 31 May 2026 21:29:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm117215715ad.41.2026.05.31.21.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:29:20 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add RPMCC and GCC support for the
 Qualcomm Shikra SoC
Date: Mon, 01 Jun 2026 09:59:12 +0530
Message-Id: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgKHWoC/4XNyw7CIBAF0F9pWEszDn1QV/6HcUEptKQPKijRN
 P13aTduNG5ucie5ZxbilTPKk1OyEKeC8cZOsbBDQmQnplZR08ROELCADCvqO9M7QVspqZvHmHL
 oPUWoMtVorVkNJG5np7R57u7lGntn/N261/4mHLfrPzEcKVDJZFOWec7rUpyt9+ntIQZpxzGNQ
 TY44AfLgf/CMGKcIeO1wAwK+IKt6/oGB3ZhSA4BAAA=
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA0MiBTYWx0ZWRfX3jLi4Oqx4Dgo
 VNbX/PGZkYlLQ1Sn3l1kNEWL02IO8gEt58vKtVpo1bruz/yDOAJk3IbxiKhUsezk+aO36KTm6LG
 /Zr15t8nSOFSAuDFTG/zZMuhbhuAYqkcqZFJcItf0Fbj+uZXFuzYVdNK3ghdWfB/PvEOdoundip
 EaXIUQ832hDHpSi1C4K8pdqrKmZ08a2uRsTNzu//Ui9M9/+AYqxoZEYzDQAytAsx4ofcKoPdoNQ
 m7BvxQRUripua0TSM7OX+w59xgArpcpbsxZISUok1S6AdN6gN99I4xPo9JTK2OyWaJejkyX2vA0
 96EbPBe6zS0zX0hCrP3AGnAbhl+WkD8hU4kv+zZag48N+jA17Wgor0WxWTRyDyE+uM/aeAe5IW3
 goIqBVEqXGrhB7AFuzLS6AAz5X7oZ1rpY/orMe0FITsT34a0qmNsjuTv+FFEUQU0e/y2FtmsmQU
 HWSGpn4aGihhvlkDRQA==
X-Proofpoint-ORIG-GUID: l4aHO7J6AQqcd8_30CEybvCBeuvgKRGX
X-Proofpoint-GUID: l4aHO7J6AQqcd8_30CEybvCBeuvgKRGX
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1d0aa2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jEWS2u4n0fhbBKcMAsIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010042

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v3:
- Squashed GCC USB3 DP PHY reset support changes and picked the R-by tags
  from the following GCC USB reset series.
  - https://lore.kernel.org/all/20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com/
- Added R-By tag received on v2
- Link to v2: https://lore.kernel.org/r/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com

Changes in v2:
- Dropped defconfig patch and enabled driver from Kconfig [Krzysztof]
- Updated GCC bindings and driver patches
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com

---
Imran Shaik (4):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add support for RPM clocks on Qualcomm Shikra SoC
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   39 +
 drivers/clk/qcom/gcc-shikra.c                      | 4429 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  263 ++
 7 files changed, 4814 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

