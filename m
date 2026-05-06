Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D73C466B65
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086294; cv=none; b=NUjLwJo6ccD3qkKzcJKUhADAHItGioBueeI/7xOkc5vf3ZQ/WKQaYr0AXkS383MNRgx5xLMr7daq/rAUIR1mEP/pPFk+rXjTY4HJ33WO+ab4618KMYPl8PdzvjkkZXARbq5hmI2XxqO635gsSCfchNfZ2TCngsomg5U7B+Z7LYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086294; c=relaxed/simple;
	bh=tjHaye4xtZ717xh77McuvoBcjHTyO4dZVWJzKb/WY7Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QWqQe3qnNDKeW90zjgZNmAJvuf5S49qL+rVJIQxMVfVLaPHq07u/aNQb/+chttllWZJJckbYOriTTXDDjLD8XdqF+wrrT15k5VdVC2USPk5MevQ9UMQNTgrwUysUHsF8kuZ63jGqr3Rip1rgSjdHdpB318tohFvE1ZC5ZSTUqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ux9uJknh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSZBNjkG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ux9uJknh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSZBNjkG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646FU1IU442617
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 16:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y5jRm5GwQWesVDd6LymNGM
	yqSTz9fmO3BXsCvRQbSNs=; b=Ux9uJknh6B3sktohrsSk8gDQry+99E6Jqtocjk
	Jd0zafxft/B/y28Z+iyF0sFRqClx3AcpSP/lWGTOnZsDSzj0G3ZIJOn0qnbM0+cu
	f/98FjzkS7FbqGSa+Q8nUAKsWnw57D7pExJCdUJ2Gk7UFseulpOsOAh5+OMNBXNQ
	EKVxjEPcHsdQeM9gVh0IVSwmR3Mk6fuWl4sU4hpjSyPkPRxXrbHtYUAZ5CV8Vq62
	xr70bUsnuoAz5Bnc6Af0Z79H4eye+BHNXIVK2pFOvEJ7G+AnRxrhvrRghSXhcGVc
	Wn2EhPUnJjY1ZxC53r8GXVn9DgsKJkNUSx9zARBRJijcdjOw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299hush-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 16:51:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1306c2f7037so2701291c88.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086291; x=1778691091; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5jRm5GwQWesVDd6LymNGMyqSTz9fmO3BXsCvRQbSNs=;
        b=hSZBNjkGiIemAsbg466V/TAcI9IOlN+OmhPxhuN/d8a5x4djx98xG5xDEhRQtfLPh6
         eZaVFpCnkiS/YnCZpxbOpMkFiMlwpo+vlRGkaKKPRTiDSIW7KHZfIbYvi+QmMbMDhz7W
         N61D0O792rkAfJMZ/1wWbpGKwKpBXbEvB31sfivGB7LR+z8YPq9z0qpZGs1P126XXEWA
         fbF+6zHvAXXt/E1M7fPnweUrtOWEZFR5S96RCfvUwaeQawL12S9VfgywvHtQ+FGMJYr5
         ZONsO8I8YhNtxPBSPU00hUd8TSnlWDGq8A8kJ5ef9oQg+kS0fSYGibPsVoxYquRLRx2b
         avHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086291; x=1778691091;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5jRm5GwQWesVDd6LymNGMyqSTz9fmO3BXsCvRQbSNs=;
        b=IIBiitvSP3mJaxe2uvM/dRJz56Q3HGJQD/guqnvf0HKm0TqdHhnH51oYyus9g3GnZu
         4hB6XuB64ifcxF1wMu2bb2NmvtV/lVS5CZErDb3/SD9JPmNcy80R3IOoXU5wBQSXjf26
         uH3d7oimaWPA4zgmTnnu36KfRtEUK+dcOBSps//9h4UCw+US5OimZ9X9wdRZJPT4MM1q
         r/18p2jJsxPNbqWjinTdDB5J8gASPDQ+0F3/Rj8adONPYxN8miec9iq/of5m/xr7c7+O
         mVzqRFp3Q80P4zqD2vKZ2msozhGIAVo/lal2ozBqnchR8p3L//0I3oglCz4q5+38gocQ
         oJ6w==
X-Forwarded-Encrypted: i=1; AFNElJ/oz3jAE6MHoJpANtek7lf6fWCOQTb6h2IYJ9ekcTQGVqrUwc9e+VxjNthxEPyfOy2cNwnhcBSLaYdl@vger.kernel.org
X-Gm-Message-State: AOJu0YyzYi8yBB3Op02gPqcQkKPCfEWEjdXl0/ZarLKezc/vXAXvmd4P
	ywFYInbxXomE+cRn4W1S03ZnyhA5DlAO92ulz0UUGvf+lLcW/4bicyK3exQv4OIT7PcBRw5zZB1
	DVz1ZYVSx0CxvgFaPWUX2azPSxLRHMzZVuEQDiFiBbW0cRYKunLcEvBjOGYCFL/4v
X-Gm-Gg: AeBDiesqslZSWNCXjWIVBJvHC6ONT0nW+sn2sCxFMdgLjfeY6RUNBVkYRijAKeFhA5G
	SFrR3EGd8lsIGoRnHrThTCz5pXMOCakaYz5WKM3Cj50wRrOENJzkzLVP8m6zhEFB/T3EG6zZQHm
	28NoQBrEaiF5cUxgD4C10qUSRI+H2bwr24atil/s4toNPZZkLajuSvqjHxjb6f33W4y+NxWTo1v
	CitfArDuQGImYonfv13dm3mPOZLKj1ZeHHyjIVmMw9T4YK5ZedUzKZSrtmZpGqhUptni8ss6cNz
	Sn3PjDBxEfKKUFswo+NV7hiqxU9Tjq7MtOS7zAvwMaNfV0IxdWQXABq8vG3TPcl1b/weUG2BCHg
	UxFmgrce74mmmwmkiYLhTqgQCLO5fxECd3w5xujiCIZ8y5zHF6mmSNLQm1UpidikCmhbjhVYuxe
	VXSK+5qEtUDMo=
X-Received: by 2002:a05:7022:123:b0:12d:ca32:5a7 with SMTP id a92af1059eb24-131969d27aemr1847327c88.10.1778086290524;
        Wed, 06 May 2026 09:51:30 -0700 (PDT)
X-Received: by 2002:a05:7022:123:b0:12d:ca32:5a7 with SMTP id a92af1059eb24-131969d27aemr1847293c88.10.1778086289894;
        Wed, 06 May 2026 09:51:29 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:29 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
 upcoming Hawi SoC
Date: Wed, 06 May 2026 09:50:39 -0700
Message-Id: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9x+2kC/22MzQ6CMBAGX4X0bEl/oAIn38N4WNsqG4Fqq1VDe
 HcLMcGDl01m882MJFiPNpAmG4m3EQO6IYHcZES3MJwtRZOYCCYUk1xR3V1oC0+kHEyhwUhlFJA
 0v3p7wteS2h8Stxjuzr+XcuTz9xuRbI1EThMJUEpabmR53LkQ8tsDOu36Pk+HzK0oVr9g9Y8vZ
 n8LvCplVZsa/vjTNH0AysFDpOcAAAA=
X-Change-ID: 20260316-clk-hawi-1ad4cad36d6a
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=2472;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=tjHaye4xtZ717xh77McuvoBcjHTyO4dZVWJzKb/WY7Q=;
 b=WAG/vm+Kob1W6hfEmeXQsfzRbn9uyuKe44+zOU3HxBuVk52CaTtWmI7cOyRCKprAklF4VgS2+
 cgU0shJAVh0DRlrtAq2cLtHceKxSbxgHCXgViOSPy6p63IF+8uTJVps
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb7193 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tIqp-kY1CHwBKU6mdUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: D15nwXlEnCeED_6pLLA5rWE193jGIwBK
X-Proofpoint-GUID: D15nwXlEnCeED_6pLLA5rWE193jGIwBK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX7wjvGBZQPYTE
 teX+bi0GZuAmEqa58nkdY4NGQ+JAq3gQd1Znx1FSAE6greviVndNPZXUZWnUvrhygI19mEMZvPG
 Hp4P7s3UB1ezmADRVJIOwPWzfl5qHC2eIb0kMF2AmNuLxXIBPrzfkBkbqpW5fRkN8w8vk6y4kVX
 KYnzD6SlZid/hSOAsVAN3H//cAx1A3YbSPMV3HNsOPch9FF7ARTuAHZVdb9x2lx6lltj4gEPHpY
 HZUbWGtowYaa61j2qMyg/9Z7L77Gw4aY6mjjVO6kOpo6XKIDhPXdURTSSg0xAeU0ZFjPI+jdBct
 xFdA1iZnbzzvGkfVSa6GEjZnbAZ2ID2EY4QEAHVEVqKWWWr6yQE9DJ/nn1YPxSZKlQOFL4qILNl
 3vZOp7O9CwSEidNvBesqbhwjsdB9tsY9+c5bF4i1Cj6gl/JQzhj/jB8jwB7Ns8AEtX065SDCOe9
 V3d1NzV7gjbXuzxviJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

This series adds support for the initial clock controllers required
by the upcoming Qualcomm Hawi SoC. These include the Global Clock
Controller (GCC), TCSR clocks, and RPMH-managed clocks. It also adds
the PLL support required by Hawi.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v3:
- Mark gcc_hawi driver data structures as const (no functional change).
- Link to v2: https://lore.kernel.org/r/20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com

Changes in v2:
- set the use_rpm flag for GDSCs to support runtime PM.
- Use clk_rcg_shared_ops instead of clk_rcg_shared_no_init_park ops
  for the UFS RCGs. This avoids a UFS GDSC enable failure due to a
  shared PLL used by the UFS RCGs being disabled while the RCGs are
  still configured to it.
- Updated commit messages wording to explicitly refer to the chip as
  the Qualcomm Hawi SoC.
- Collected Reviewed-bys
- Link to v1: https://lore.kernel.org/r/20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com

---
Vivek Aknurwar (7):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      dt-bindings: clock: qcom: Add Hawi global clock controller
      clk: qcom: rpmh: Add support for Hawi RPMH clocks
      clk: qcom: Add Hawi TCSR clock controller driver
      clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      clk: qcom: Add support for global clock controller on Hawi

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   63 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   16 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   33 +
 drivers/clk/qcom/gcc-hawi.c                        | 3657 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-hawi.c                     |  158 +
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  253 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h       |   16 +
 include/dt-bindings/clock/qcom,rpmh.h              |    2 +
 12 files changed, 4209 insertions(+)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260316-clk-hawi-1ad4cad36d6a

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

