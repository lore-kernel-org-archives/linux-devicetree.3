Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922702;
	b=CDIVUwlNOCVmYIXMNG3uXomAHXNNCu1jAeLqk2kK50fYF+AeUd1V9ULTmExh5wO+Vede
	 LFTkWhS5gMwqt7VKlcVhRGB/kEBuBn1VsodmoJoBWX8R9PyTpB5Y8zZwHxlF08THeSYwF
	 GxGJ+yKKegMfN3cNc0IE3Wu1W6hLz/Bv+hdNappXdaVOuF7Jaqtr/P5QkHikrLAWGmqjh
	 yNfbalZfXcDkgi7llwtOPj1spv9UZnRXrF5jYh0xQGyEy2uVvrsOfJmC3LwFrS1nBzjKa
	 9OTESIird6fqo1dILc+TjvTwfwxKzYPyuiWK2M8oJLdzML6LwxXL43o/ZPilQLlrqkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
	b=RDQIxm4b+rqmnTdFTsZ64/In5/xs2M399gmqBjnyOBiigVWeqtevqSxHoOB6J867qna5
	 fonQ7FJslIMfs60GvBoTxJ9xkO2PRG2DE5qIpAsizoWeL8gdbUHsmShSFh+u1Uqps4EZz
	 9PRien27dVQfIuVLaXndZRIInRB8SLTkFnqTqTSPhdaTe1EOu2u8/UVbSgRhYGLneLfsh
	 YUt6fpPVduQ8+5t/CATQg5zVt0chiWwZCWVE9wFTeyQ+EIr8wj8k1uhJsC7cve9PYTNLw
	 0XDCXBfVs6OoWe2MsOH6LbUsLg02DikC40I4ZKa6SX4a0B1VnYFxRTnoTthLHlPkMhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+UjozBm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyuUzIZG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A395F606A332
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 23:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A395F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+UjozBm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyuUzIZG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NedpY2274354
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 23:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/f
	G/eqd55s=; b=F+UjozBmVBcvwneBwTSXima+BbRVI6h+ffQRqAhkLPx0ZQl09T/
	+ZLiI8aZAdRm5chsoekTmRXL0p4A71vUvXP9jbcEeiLICqNEBwlTv2KnjFl0AIuL
	f2Oxm3hA2LBTgu3IsodErcUB/5STKF0cvsEkcWkh0hGU6s8AsYb+nSdJmCyrOiJ6
	0LitlJ2NPdsEpx5TaeXZvI83XjRjya0Ixh1c0XkcNxgLMRyYdSIPcsY80AxQACtZ
	tJCbgXITWx7evwfhOrTDD8omGbTKEGw68YxiJMY+maGKNRTPovFasS5z00qNV5uZ
	GVWAN3iEFrBVsrRfe0bc2ymz9U10qA0ASFw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa01u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 23:51:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so113182eec.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 15:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793922700; x=1794527500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
        b=eyuUzIZGudnj0MA776vVvBEe8rjoPYHQlsLwqnlZXfx8WKhla2g/T3YGDg5IyXOI7Y
         tsXNXCZLUEBbk6N/SrnrI5Hm8UsSzDvSy65X+HNefesQmYiH8pDCeaP7drmJqInN7WHn
         mnQyACIGBdP7rG/jdGUMlo6Kekn67oCJ6Gb6I+HxRX9Ti2k4qrA+EWX+KIMa1t4EvfFd
         B2F8cpB8xCE9XU6DEJfl7dM+/1omhR2PySZ6+7mg7dql7dNGY4bIjn/dPbvnIMk1M4M6
         5Iodbmfri42Oh2V9KV2DbYADUILhMCFeSuUPy11v1gkFYJJJx1EuNO0DH+3iMrK+W0bC
         a2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922700; x=1794527500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
        b=f12pMvhTSOXKoM9LNuRPD7t1Ss2vAvzAhioWD2+gACxUvvqtdu4gLjXBpANlEQIbay
         IKCCsXmkMuGD5SLkqT9/2ookkhRuR7NrVAXfb8eOuWFS9d7EHzqer3a8J3PoEB/bUiX2
         eWDq0GqkfoTr4/x+89DsyvgpwU+l8LDU9iZpnkYRKPV7w2TOTpNNbXS9wh3kHMcsIaqH
         IKBRqwKjMLfaRNOAqNe5lym5OecT2x5hQ9Zzglve7KVXYg6Cr8TUWuPFxoZGEd3o1SP4
         Fll5xA1ccDOOj+xHVuQ+AjvoF5BgC+ODzYkxY6ca2+0wyz9EhpW21hFaskK2FHoklWfR
         jioQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZeBvj4Asuo//EsrFCyjpJrMh4UgVe2b0SecpPXZBi6S6OEMCxYdM4KTVzipgEigcuK/GgCQp45MOU@vger.kernel.org
X-Gm-Message-State: APuU4Z8kNThO196Oy2YWP4KIPXxlqke3HzKGOVPDsOWHyjY8DlIIw+1O
	xz2G7R1uX08mAV81KDwySRBIYU1RoZdGctByv3AeYIyyNqDJP2jGXflKDv0DnO1B11hUWCjKbGU
	uX7J5sL9xtmfj16JkPxKiYXcQoxAfxAfve2RtpnZ2ilJJx+Ypa2oGUmwMErMBaqYC
X-Gm-Gg: AYBFou3C6S7WM+dTByho1SGO5PxbqbArraqIBtfr3wri3E/13ZxQ2AlwIze/VaOy9Ji
	7//C7uBYk83VzLB/5OQ8OMQsfBFEz5bbkCufPPxZNrfA13O9pATz04evWSSA5b7NeCjOLJ/hn2H
	KGZNO4nh5ygGB3wdRhkkoA9gymhcF3Z4lZ+TaQ+nj9MfoXSBLm0JP62TXcalNVkViBkRxFonlzK
	qYb3h08mIdoYfYGCiZ6oeBRnv9GmdvPLRwUFMJu+d8QAHHp4cSsZx+RiNaXgkVVOwJ24F9QduIY
	Hjp4JDnUlQ0nOynFtHOwtShbmnSdztSX7DQMoenaZ3mtdgxGuVjTmUnWUmZ58rucla5R0z7kxpg
	n38syiam7z8wET9iipp8aR1m4vo0LYsb31IPxjWpjCUW1I3G7GRlWVYRdDrm77qfZLCUFN+U1qD
	hS9Zic8/88yNr3s27TW8fDN6tG7OQ=
X-Received: by 2002:a05:7022:b90c:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1b25d31e64bmr690547c88.16.1793922699478;
        Thu, 05 Nov 2026 15:51:39 -0800 (PST)
X-Received: by 2002:a05:7022:b90c:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1b25d31e64bmr690523c88.16.1793922698781;
        Thu, 05 Nov 2026 15:51:38 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm389041c88.9.2026.11.05.15.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:51:38 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/4] phy: qcom-mipi-csi2: Add D-PHY support for sa8775p, qcs8300 and sc7280
Date: Thu,  5 Nov 2026 15:51:33 -0800
Message-Id: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX31JyiQKmE5wK
 C9ctVW8XTYiGyAjGhZd1R24SHihk4cvJZL4lF/IYuem/m2qZe/tQOuhduVTtHBPW/+uPlg4cy8Y
 2ni9WLbxkFbCT5XjzeyuNl1F6QNX2CTVtq65d7rbblHGekKepEYSorb227cgmWldbRcMATLCvj4
 5FZQIrx5wvcuIEPYVDnWIJRqld8biCueFb93DiMhN+YRxD24QP3MERDFHMQuwrca1qL+sxoPgLw
 RCxgN0C5XNqyQFnNdj/CDsrb+3jsKEfNzvavTQBCAVsL61nKLqjQLmvcKq1fGEwA7ji5iC6h+3S
 bp14C0xYiPRAQdijnNeJP1xfG099wOrLcHGK8KFikg7Eqg6Ob2XXVzzsFshtR08ONF9rNWYrwPK
 bmmmOdaZ4SbRFvyXs+QSqAc5oXGEvyfsfQpCZtj3kO1TZKA5qbgqDRxiEKS5UIeiwEXNZFmtoBm
 yjj53pviig/iqMI9TYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX7/hHqvD/fv0w
 rwAnyjx8G8rUsaQZvQJzRxFUZFvrMxm8KId5LBpEZ9JmdgelgXCorKW8/pwWIluF4/d0XxjdFAZ
 qvsYYXu5TIH3Tc9/7ojx5WLWkKm3zjY=
X-Proofpoint-ORIG-GUID: _pxLwQsm2v8zZzxflzKJZa0G-PKgh4N9
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed168c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iQrEevU3y8pT7K306hwA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _pxLwQsm2v8zZzxflzKJZa0G-PKgh4N9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611050095

This series extends the generic Qualcomm MIPI CSI2 PHY driver
(drivers/phy/qualcomm/phy-qcom-mipi-csi2-*) with three additional
CSIPHY variants: SA8775P, QCS8300 and SC7280. The driver currently
only supports x1e80100; these SoCs let CAMSS consume the CSIPHY through
the common PHY framework instead of the CSIPHY logic embedded in the
legacy in-tree CAMSS driver.

QCS8300 shares the same CSIPHY D-PHY hardware as SA8775P, so it does
not need its own of_device_id entry: the qcom,csi2-phy.yaml binding
declares "qcom,sa8775p-csi2-phy" as QCS8300's fallback compatible, and
QCS8300 CSIPHY nodes bind through patch 3's existing
"qcom,sa8775p-csi2-phy" match entry.

Tested on sa8775p, qcs8300 and sc7280.

Changes in v3:
- Patch 1 (binding): renamed vdda-phy-supply/vdda-pll-supply to
  vdda-hs-supply/vdda-lp-supply, and restored the DPHY split-mode
  port@0 definition (two endpoints, lane-count constraint) that was
  dropped from the combined schema, cloning it from
  qcom,x1e80100-csi2-phy.yaml instead.
- Dropped "phy: qcom-mipi-csi2: Make timer and OPP clock names
  configurable": no SoC this driver supports actually needs different
  clock names, so the patch had no real effect.
- Patch 2 ("Make OPP table optional") no longer depends on the
  dropped patch's configurable opp_clk_name field; it now adds a
  plain no_opp bool instead, with "timer"/"core" kept as hardcoded
  literals.
- Patches 3 and 4 (sa8775p, sc7280) dropped their now-unnecessary
  timer_clk_name/opp_clk_name overrides, and renamed their
  vdda-phy/vdda-pll supplies to vdda-hs/vdda-lp to match patch 1.

Link to v2: https://lore.kernel.org/all/20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com/

Changes in v2:
- Dropped "phy: qcom-mipi-csi2: fix -EEXIST probe failure on single
  power-domain SoCs" from this series; posted standalone instead,
  renamed to "Add support for single power-domain SoCs" since it adds
  a case rather than fixing a bug.
- Squashed the standalone qcom,sa8775p-csi2-phy.yaml/qcom,qcs8300 enum
  addition/qcom,sc7280-csi2-phy.yaml schemas into one shared
  qcom,csi2-phy.yaml, modelled as a oneOf compatible list instead of
  one file per SoC.
- Dropped the standalone "qcom,qcs8300-csi2-phy" of_device_id entry;
  QCS8300 now binds through the sa8775p match entry via the binding's
  fallback compatible instead, since the two SoCs are fully hardware
  compatible.
- Squashed the separate "Add qcs8300 CSI2 PHY support" patch into
  "Add sa8775p D-PHY support" to match.

Link to v1: https://lore.kernel.org/all/20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com/

Anusha Arun Nandi (4):
  dt-bindings: phy: qcom: Add common qcom,csi2-phy
  phy: qcom-mipi-csi2: Make OPP table optional
  phy: qcom-mipi-csi2: Add sa8775p D-PHY support
  phy: qcom-mipi-csi2: Add sc7280 D-PHY provider

 .../bindings/phy/qcom,csi2-phy.yaml           | 201 +++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 228 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |  74 +++---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   5 +
 4 files changed, 474 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
 
Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
-- 
2.34.1

