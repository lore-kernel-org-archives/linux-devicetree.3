Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511C83CF04C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080532; cv=none; b=RimQAF7JWMLgZ25vma8lLc4vCwXGk0Nsiu6RYglR41Hz4Shgrwmbokb5BPvYx9JqcWajX+K5eImuAApIgA5xJC8djB2GC6OtJJgcYBIsqR3U9VlefHbdrrvhJHUFH7eweCLCgmfz7Uy6KDaA+qs3sLLrWayVKXKCfDDmlcMOtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080532; c=relaxed/simple;
	bh=BUnkY/0PhRAAb4fytqk7lD65By8W889aQEAnDJ7aUVE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UjeddBT0ljl0IRQ1aIMpPF9+yiS/jZ1lwn3ZmbLk1DhNPEvyiSjFXVNMjiLc5eT73utUrPLlhIOG9wwwEoAqZF2SvLwFMOrlsePCbADDF6uVEk9bAXzj0MHkOs0awWC5oRZwRdeeF2AgSXQBk6riOYFEC/JC3p+xKX4eShD3Idk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqrSXaoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTbqd9Em; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqrSXaoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTbqd9Em"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BOcgJ3108900
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 12:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bgimtSI4aro2GhawYEE98j
	B/geFpQ8EBMgBfF8FzehE=; b=lqrSXaoX1UEei3eG8FEcJ7G2MaTbKPG6Wikb9T
	WuyIhFEerATSshhir549oADX71e1RXjE7X/HYb9Fz3flTfb5dSriEze7rYj2DXxT
	CBnGKYArmTIrNyMR9AEhLKhRpjZXf+tiDqpSbZpjEWxGAuEhh3ie/zUqxwSfbwoo
	iLZKE/chhvMwvbagxYtnpHJPPSofEVXbmCbK2lF3geEkhnp18O/kWGTCpbGViajW
	LPquW0SF+8rskfeXySfvQFNvpoICOjw9gD87noBDKZSA4moazue6StXXxpXnN/6k
	qoMimt/m7/YaV4j7P3dbKJw/8Y7qbyRGpBzkX5vJd4ctLYZw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eyay8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:08:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso594753a12.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783080529; x=1783685329; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bgimtSI4aro2GhawYEE98jB/geFpQ8EBMgBfF8FzehE=;
        b=ZTbqd9EmJJlkvZzTFmycIq4ppqPRiOKrRoSwqzP4KvnPV8V3rE2fy4gRrtuaOPIBMc
         Ud9i/5uenBXKhSAJsBRCbHpUGTeHJo9iKA3mNCobvaX4+gRpbR+JnxKmUvAA7D4+cPAD
         YGy3O5FcG/aPNGz+kDIePfafny03COnK8EVtcnrphOHcOXGDNyg/aXGmQnw4lS47Qu+2
         35skNgPgWW5VF8WAHFeRcDZrn67PyL9B5yl8aaS+BiRSfYvPUfqpiUGjYW5sep0JZRle
         w1uIwykRoMYQ/GvfSzWAtlfb8FsxuM+X/sWmS8a1XyeJQXp20euGwjEjh196+DoOwcYW
         F7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783080529; x=1783685329;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgimtSI4aro2GhawYEE98jB/geFpQ8EBMgBfF8FzehE=;
        b=b2DtDTnpZNIsrjZBELrL/HnhqLqGbvPHI2jjn/ZIRIDpXxZM7IXR1Fg1qAF1NsVCHd
         VabpbOzGl7yx7sAsBBYOzTeMOg1wDmQCOMXmxVNDYCJx7yrsR93ceuOWTGo5jVEl02dh
         p0IvE9p45AZWLEk2IiXYIgTBlJ9R+23/P6prTSDyylNkQnU+y+GNFUgyrJz/gcgaJYRp
         BdHCKX7aL43M5+q0aTF0UM5blKIsqoPT7miA6lZ482dg8OaOo9gid+qBnBYwSqcui1Sq
         A0c4ugVcwXdqX/Xc/mXW3dIBlnL9cAHYP2R0Ruwr8x+QdboyIXwcOejKRAIxKYe1R8Wf
         1cQA==
X-Forwarded-Encrypted: i=1; AFNElJ+qb42KoZEAl5ilYq099vAkF+2RLZ3tqhDp7Fe8gScX2wSVZ2CBM4X2lvCIQTctoxYPlYH83DjXW2pK@vger.kernel.org
X-Gm-Message-State: AOJu0YzPm6UCINyC3jD5Lv//sM6DdQZ+RQUXEuBKQnrSerHbR2zWtcH1
	vut1s3EalOBGapOZYuEX6EhSZiqcqi1HJ8sssPkSLROAD0/qQ9weqWod3/5PcWZffEzIDFYoW5H
	/NewTGXkO9Mb7oxSno1gF7M0ae8E2veabJi3rFXVODm+C2taLCrH5pccywW5tDTToH8oxadwW
X-Gm-Gg: AfdE7cmVBjCoqVBZfUCM/FNSne5KzWJYfbQsRHK6qz1n0o9IHrzg5VPRehqFgqzGIIL
	af13HgyQHYv+uQAIjP90+xPrIQr1AQsQr+dYZBM8aZbPriKkEuqQ5tYGH4EtWawvJ7pA3PnLOmS
	AmBjAZn2plAVhhJ4+4Qp10io794nLn5uVJ/W2OSdXI/LH0isyBcx1tjKyKBrQWv3zN79oLT5Vq2
	Fuw51/aBeDKPzAMy1zlw8ANLnLfBBkYaQPo2Efoyc3YbsQ2wCq/aQa/9wIk1yuHIEM2V7u/bymw
	EujOZUWcwBvL+VuLHghh8N0ZJQ4H1qLXqMKs2bNJ3nDCKY4aEzkLjyLZSVL6C7d/1zmaZ/ajGjR
	eGhaL3eiG+nxyLL8vuYTwyWW6pD6iJDiIgZTroe5kqOwUfVH+
X-Received: by 2002:a05:6a20:2445:b0:3bf:a489:1483 with SMTP id adf61e73a8af0-3bff4255df7mr11649243637.33.1783080529193;
        Fri, 03 Jul 2026 05:08:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:2445:b0:3bf:a489:1483 with SMTP id adf61e73a8af0-3bff4255df7mr11649190637.33.1783080528550;
        Fri, 03 Jul 2026 05:08:48 -0700 (PDT)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10638sm2530779a12.2.2026.07.03.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:08:48 -0700 (PDT)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe
 compatibles
Date: Fri, 03 Jul 2026 17:38:39 +0530
Message-Id: <20260703-vdev_maili_dt_bindings-v1-0-c9df0916cd5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEemR2oC/4WOywqDMBBFf0WybmSMWh+r/kcRSXSsAz5qommL+
 O+NdVG66mbg3Msc7soMakLDcm9lGi0ZGgcHwcljVSuHG3KqHTMB4gwJCG5rtGUvqaOynktFQ03
 DzfAUEJIQmjTMgLnnu8aGnh/xtThY47Q4/3yEX33u/cpb+aDyaA0XSVzFWZOAalRuA7a7WjLzq
 F+fzS7aZf/m2YADB4hSmUYKVSwuozH+tMiuGvved4cV27a9ARxJl7sPAQAA
X-Change-ID: 20260702-vdev_maili_dt_bindings-80e0730f8390
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783080523; l=1468;
 i=vivek.pernamitta@oss.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=BUnkY/0PhRAAb4fytqk7lD65By8W889aQEAnDJ7aUVE=;
 b=IIvPLEPo3ILp9Ml/IKyB60FD/DR1nBHlasElwM1yCiueOsNQb+FaXoYLj0BA8j5VrgH1TnA1P
 nRIggsUh3VGAp7smc+TYGlcTGklmUuwDq1XxSbXaEbmsXjLqaV0aShA
X-Developer-Key: i=vivek.pernamitta@oss.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExOCBTYWx0ZWRfX9ponm1ZJV1DX
 ahNwaoULO/VARlQ/YMRjQGgrJqdTuY25ZL6zs2sDnOw10fUggWr9ChncCEwhnYXtUJrgw1QJ8XZ
 ev+912rgMAxHiMc+4CJGP7zynY8wVDuFD1reaHKrnfmxsWCK9snMnvXQXdw9JcGBEQQ/ROIdjb8
 k9bi5JKz/c8YvC+HSZTvCycubLpVBxUNy2kNwyxNs7x6MBTPoc9SOrDDe6u2bzhwgS70lfGitqV
 I3OBSns+ToD2zXViTmpNLGlRf7SnwpPw2sqDF1dVrXcqID/6cAcDHPLqPkymWt8gq3Ns7njTBH8
 +XPRWf9nu9ecVmQCaDRZhc9BFlG5Y/X6UOjW7NqkbnRc9KejAvfRK3DA4M/vpGvuabxBWqQw820
 fSqyTOltYJEV8HdeXRX/8kwU8n1LG/OfXVvVQXEnQXbU+XM8XPhp0LUWoVwfqWoEkvHHTBW8qxz
 p4ErI4qJcW5g5JRgaAQ==
X-Proofpoint-GUID: HKncPwP-iZ47vzE-M-xCY9hU944NaRL4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExOCBTYWx0ZWRfX/XVxF+vqbLKW
 u7rvqR8p/Cx61LYIM8JroVDoywxZH1eqtAvsQo3QC4tml40qT+AA/fHr9U2Skxm1FL2nv91SlqF
 RN6HXcq8IYnTFkT9K+MvGG89+UouulM=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47a652 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=suQaG4udzKv4wnHqcH8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: HKncPwP-iZ47vzE-M-xCY9hU944NaRL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030118

Add the qcom,maili-pcie compatible string and make it fall back to
qcom,hawi-pcie, as the Maili SoC reuses the Hawi PCIe controller IP.

Also add the qcom,maili-qmp-gen3x2-pcie-phy and
qcom,maili-qmp-gen4x1-pcie-phy compatible strings for the PCIe QMP PHYs
used on the Maili SoC.

The Maili SoC is a derivative of Hawi and shares the same PCIe
controller and PHY architecture, allowing reuse of the existing Hawi
PCIe DT bindings.

Dependencies:
- PCI: qcom: Add PCIe support for upcoming Hawi SoC
  https://lore.kernel.org/all/20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com/

- phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
  https://lore.kernel.org/all/20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com/

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Vivek Pernamitta (2):
      dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe compatible
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Maili PCIe PHY compatibles

 Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml          | 7 ++++++-
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml        | 6 ++++++
 2 files changed, 12 insertions(+), 1 deletion(-)
---
base-commit: ac5f929f2f373245abe6fac242c8d3fec4ca38af
change-id: 20260702-vdev_maili_dt_bindings-80e0730f8390
prerequisite-change-id: 20260702-vdev_hawi_changes-275c59f70bfb:v1

Best regards,
-- 
Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

