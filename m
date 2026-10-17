Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149073D75AD
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210660; cv=none; b=BoHdjhdlHRXHkKFP+22fhCbYPLh0YIR2daqywd+npTSLPrzZG2RpI5E60vPyuxhCPPcIAkI2Yh+Za4u7vYO9WDu4b87IDXuA3PnfDRJ8xzph2uEl4aLG1iPHJKZ/LVlipL28pf3971MuVIHl7DriiRvk+/aDP26Aev6IWzu5Z2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210660; c=relaxed/simple;
	bh=Zz8H7LWd8X7zK4/404T4PQqLh7JqrFJUhH4vjYg7WPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q16kEteLGhl+R9Df4+4yADnGt8Y0rIuoiGKM8nR3dOcj6Ttq58K5PiYqsdHI7hRJ3U3inwVYynYFbQxxx4mXRRuxcGJxo3Qz8+J9XBxcJnFE/EvA2xFc1pC7RXZTJwzGZ5Oq8g7+d+D4zfciCfgv+d25O0GXqwljamo1ZlyNxjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjQbIuQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTQXbqHL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjQbIuQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTQXbqHL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3YpZc4188963
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5
	Vc88bYSc=; b=HjQbIuQmwXQHOpymfxOtwCVbLj+EHY7y++oS6fnAF5hQBZyfkZe
	v8gAWRcl6EXtDLxWbiEL0wv4wX9IR58OPqLVVpMG/GX8BQyL8JdaGar7LyEdM7eS
	A+PkS8wqlBneFKxARiJdThObsm/05yRlNS6U+Ps+kKGxXM6eabg3MrGSpCZIVFBn
	qNvXOn72oAjMDFPd4EHKEl1mc/pSs1av5rUUHVmqXe1WvKcLtP14r20IetCa4or6
	MVBit35MhYvOCfaKTxzS4JXe6PWyP7y90pRQUJ79JsqTXlhc8lGpQ+lqhWgCenB+
	esxXCCIaT6BTaUBnhzPoTfn1HHVnyI4eu/w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc18382h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:17:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35a04491c56so622686eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 21:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792210656; x=1792815456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5Vc88bYSc=;
        b=hTQXbqHL2K9yyeSD9IPSgUxWmKYhV4eHRYafdiCOlKr5v5l7IDLdQ6g/tHbNS2NHrp
         ExQ1Z9bTbS/GLMM9qebYoMhCaUwek3FaqfioHnIcof3UgVLwZFYjTfaOOUEEFw69tb4v
         yC4yDCJd8Bqf8IHNXUm5DAzF307sT/vSm3W5VYyc8NwkOmYJQ/3Tfj07dTia4C+OOYjm
         euYg3WbwfzooQggaHmERCkzoukWDbyJFk7lLv0i06nSRTYNKCBBvjBATbz2qFJ5i+7iM
         9m7aP8L9pD6qXkyG60X/5Hj1lK7m1nmNRbn1zuOkkDjYNxlb0SrWsFm2iMc8KCHKU4xN
         uWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210656; x=1792815456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5Vc88bYSc=;
        b=04OBXLjD0YDgbgGSOpSzyHIQOjjoJvmXu6GWn9jAxw4XOo0OsQzBG1iFrjp6szIjH/
         SnZKgz7XM/WSkTPLxf8djv/hkjICHXM8wJt6yhtStw+uo384QslNrF2kRBZntAWXGvmO
         pedxzCUjm9MQ3MenN0UfAA0zFNSOMmIF3cyS9uggKkFGATBW2BWAq/jl9R4x4OpLi5NG
         uUHrTEkOIaLNRE7OS/DGzKO4YQ/nUl97l2eilawKhqBWaggy3CPgPiGnLXYngp1XzcKH
         hjSeVXzPLLdrF/6RilRioiuIsaDVmMXeUrtIw1Z2pFwHBClxNTo2q0llrbNr5oIjlXWs
         OUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwt4I4c7eaHgoQj7WT4Iw6krcWZ9k3Kfos103p+BzvmSkZnHNVpmbtKuy4jzCkCxscZFEuiMCEy7SuF@vger.kernel.org
X-Gm-Message-State: AFq9FYLC348veWcHqhkMcDFbRI5ebeMhEekro5dbhoPFnXb5q497JXzO
	nxCo+z5hhPujW5wa5pswnFj0HZ9mH1VQf2eejqYkzurZ5tKfGbHDwU4YrGarISHASWFEVmNmfrg
	yBLKbOwfIEq42EqLN2qfg5qWFHVi+kpyiQddA8J/RV+47n8xw3f7ln3y9TfsfkaZ5
X-Gm-Gg: AYBFou3CskqoYNj806+5Cq4uEqnFzadbf4BiF88h21SdRudORqCmXqzameGJqLjZDDB
	a4IeNsOe468TaumPBlbT1SGqnd8Gjs/qlwqd6HrTVZzrLCiIHaezdSe1x7vVS4bxnSvV/Ucby1N
	Bp0YX+C8ecpq7KeBcW5HPf5JnIadZ4bf1iq+mJwcY+LnGiI5m1E6+UpUjjruW/P3gO97arDDkjM
	Koqp3D96e6C6vt3WxyhbBj0pBIYPXePMtUbq4d7k9Xwyc+0GonXg+5jTX7LXZSEzLDIA/HHTCib
	JMwLJ59JX/ShwAa0Gf1VH6AWV1I+96IyRP79KKTVu6Ch7NoRIVYiYHar98ZRnNmJ9p9gJv6w3ug
	UcRAC8oJHl51b/oA88cQphak2e5wXmHGKpIxJxM9NcuBLSqblt2magg==
X-Received: by 2002:a05:7300:e9c6:10b0:351:606f:2832 with SMTP id 5a478bee46e88-361a16689d6mr2385561eec.3.1792210656397;
        Fri, 16 Oct 2026 21:17:36 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c6:10b0:351:606f:2832 with SMTP id 5a478bee46e88-361a16689d6mr2385521eec.3.1792210655817;
        Fri, 16 Oct 2026 21:17:35 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm10867636eec.18.2026.10.16.21.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:17:34 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 0/3] phy: core, qcom-mipi-csi2: add generic MIPI C-PHY support
Date: Fri, 16 Oct 2026 21:17:30 -0700
Message-Id: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfXx7EI47vgfU9T
 2IWtVztqzxW+3HcZymgaGf6tJ2UGjPTRZhKgODPpXDhV5CvgV42EQy1Hh/kgEsLB+F40iKiqw06
 gjirApMj85PjYi45ngbG955G/mTr0ac=
X-Proofpoint-GUID: pKmLu0T_PDMNEUrl9QvcMCIWimiQu8mq
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad2f6e1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UyFj12KqJ2bFa5q0Gy0A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX5lyY0Q6N7LyQ
 iyaB9qIgVOMxcqkzhrxXlMTK1PVWODLxY+PH257QB9N1bHxgeDZ8Z6tgQnkXOTvN3kJh0f9+RjD
 +qBuZ/C//FNtBpHwHivOoLaenFaoscCfLUomgoN4wR04zVhOB7gzNSYtWBMHrMfUUN3W0kFnzWz
 HCWs05rsFaTv41y31TDXb2zICMCNtcV5MmJr+8SjWNVxKhWlR6kEPFwafzCR22n8ecqZ5UwP1Vr
 tFu3fFk0xqyZp5D7bV5DD8b+ohqH0cvKPfqHL/T+ZY8GHzi/Cyiic0FWmj/i8/rb48xKUes5EEg
 B5xlsEIFiKGUOjnWjevm0jCCMWYh4qFJKu0L4lflEEUKzR2wN0/kpLBy9qv8S//XhbI+bWHtkNl
 KTPKooqO5OyVkJJ+lOlbzarckkhzLzsXYsQuD75lWvbo/+LXAFifJ2ihbaVkwHH6Ugi6eHymrBN
 PljcX65Lb/Krk7E4xUw==
X-Proofpoint-ORIG-GUID: pKmLu0T_PDMNEUrl9QvcMCIWimiQu8mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170016

This series adds C-PHY (3-phase) support to the generic PHY framework
and to the Qualcomm MIPI CSI2 PHY driver, mirroring the existing MIPI
D-PHY generic configuration API.

Patch 1 adds the core API: PHY_MODE_MIPI_CPHY, struct
phy_configure_opts_mipi_cphy, and the
phy_mipi_cphy_get_default_config()/_for_hsclk()/config_validate()
helpers, following the MIPI Alliance C-PHY v1.0 timing spec. It has
no functional effect on its own, since no provider selects
GENERIC_PHY_MIPI_CPHY yet.

Patch 2 wires C-PHY mode into the qcom-mipi-csi2 driver for SA8775P:
the PHY mode is now derived from the devicetree endpoint's bus-type
property at probe time (D-PHY by default, C-PHY if
MEDIA_BUS_TYPE_CSI2_CPHY), phy_qcom_mipi_csi2_set_mode() validates a
consumer's phy_set_mode() call against that DT-derived mode, and the
configure/power_on/power_off/lanes_enable/lanes_disable paths dispatch
to the new C-PHY 3-phase hw ops accordingly.

Patch 3 extends the same C-PHY mode selection to SC7280, porting the
legacy in-tree driver's SM8250/SC7280 C-PHY lane-register sequence.

No dt-bindings changes are needed for either SoC: the existing
qcom,sa8775p-csi2-phy / qcom,sc7280-csi2-phy schemas already document
both D-PHY and C-PHY bus-type values.

Depends-on: https://lore.kernel.org/all/20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com/

Jigarkumar Zala (3):
  phy: core: add generic MIPI C-PHY configuration API
  phy: qcom-mipi-csi2: Add sa8775p C-PHY support
  phy: qcom-mipi-csi2: Add sc7280 C-PHY support
  
Anusha Arun Nandi (3):
  phy: core: add generic MIPI C-PHY configuration API
  phy: qcom-mipi-csi2: Add sa8775p C-PHY support
  phy: qcom-mipi-csi2: Add sc7280 C-PHY support

 drivers/phy/Kconfig                           |   9 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-core-mipi-cphy.c              | 129 ++++
 drivers/phy/qualcomm/Kconfig                  |   1 +
 drivers/phy/qualcomm/Makefile                 |   3 +-
 .../qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c    | 561 ++++++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    |   8 +-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 133 ++++-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |  31 +
 include/linux/phy/phy-mipi-cphy.h             | 177 ++++++
 include/linux/phy/phy.h                       |   5 +
 11 files changed, 1029 insertions(+), 29 deletions(-)
 create mode 100644 drivers/phy/phy-core-mipi-cphy.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
 create mode 100644 include/linux/phy/phy-mipi-cphy.h

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

-- 
2.34.1

