Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BCE32AAC5
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893963; cv=none; b=Xv1MXXiwo6JusmSbt5XbPCgqQfPJytdtK/lXQsxT9fnIN0tkn1ZlD+ugCbRsA0Be3Kc78vwpx7OREFpR46LAxkHSOooYGSx5I+mRbcM1lMBemekD65Dmv10tnoQ11YWEHO3tZZ97oy9PYAj4w2nt3nm8C24g1FYpZDBVT0fm37k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893963; c=relaxed/simple;
	bh=dtjhuvoCnXLccqWVZj6HsPRujQcujkj8TP4ZOO+PYU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kjAGZLZ4EfxlmpVltzbpPj/7jnefhA321St8uMhXTJpFI/unJOkf+Qt5OZjpWOftYb85ZxE8jfe3Ao83OW1lhhHZoxdGecDz+UB6rvMsbd4/scdsxOlHVKq2YoGYY8t3QmyyAKpUPdBV91ihlQnV2e/zZBtot0o3RfA6uYk+Kas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HphP/bdq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tde/JqNd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HphP/bdq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tde/JqNd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G12o417074
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fekyR3ymPZerEgvyKr3Mkf0B8N1UanGpiHz
	+MqEQZIw=; b=HphP/bdqydqVDsiIGi+X5GSqAFAurPkyr27vfZ4QCQQCE8a2lOs
	JsmK3aEZkJZWd4XY+0mFh75b7R0syFW/XDUi8ClYsQsSgrlI/1jqwSDK4jGeRuis
	I9avpBPGe1P2cNHJVtG7pqyJsfpGTjzm16biY7/shJYRVs6zsMHbphnJz+tUxMYH
	9jrwYIKpWF4ExLJ8rI+ZNElp7er9FGNrkUtIODdtjqRkY4r5iB/7stjlGu4FK6wq
	NATGzfoxWw49CdWh80R8+2+YhcG6By0sv0zGrGeYz3fbOSMVZtfKDiL9vWspFzQf
	fm9pVk/3QbyK3sPfm4jgTUewTz/2L+K7K1g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqk4q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:19:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847ac21582cso533378b3a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893960; x=1783498760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fekyR3ymPZerEgvyKr3Mkf0B8N1UanGpiHz+MqEQZIw=;
        b=Tde/JqNd98JnhDOmKx7GtOOM/KnGUzB62mlXTBkggYWYWgDg76gyS4sKN+Vr5YxF/S
         D+PlcHmZyDN6tuObKOM5UC0x7mhjZNJXfAnHEBapUdWcy0t5ZvJ+s4a6Fp0wxbi4RxAv
         x21Rh9G0t4s8W1w1lAo3G0YX+jnoTpelLaBq7YMFVhfbuo+sBNlzQlVDfG8oD5GCOiR6
         Xi8Y5qEziEB70oJWAstsejN28UASV8hFUdd6A2BnEYYYL3Lzs8+BAcTY6+RM2F3EPXrK
         cLbIksM+8pybqSOzDtkif3Iyye5h9tiqTP9wBf2Vey3r8euJ1LdOT/zrLTJLq2WSPV55
         n98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893960; x=1783498760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fekyR3ymPZerEgvyKr3Mkf0B8N1UanGpiHz+MqEQZIw=;
        b=UqbAYgVw5fUREnLWlySMm2I39VTchDg0F1QAbE0EC63Zhx4pOSpKCgICwY3IEiDYat
         vPepVLUvYiQDLudZdH/Mt5mZHE72mnAerF18b3lZ2HVPCC+IDLYcgdXfJr8GBeH9rVIq
         +LlETejvtIFvhBkEAbM6jhIQRSgqmTg9bHKedZNt3yrIAaUybT1eOxiTSLgcjiEAbu+C
         7eIiTXuNh280hscvr2EDhCtsukeE4wN7UFVXA9/OKLhs3l6rCgfesI8dXfShBc4cv7lj
         OTH49VCxP/mcfs4DyRpYs4HfiD4fASAEh4uknxvFF4Tuf0c0jti7krUofCIdL02Eg+EN
         ANTg==
X-Forwarded-Encrypted: i=1; AFNElJ//9aCCdIyXFxmJRX653k+DM4QbCh4Uak5xfIvt+FwqV/h0du2H5xhbyiZw8avmMk/ecqFIYS1ug+Xa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+tKWbQXPvwMh3k8GudxDxwwOMAB6ULY7J/1nFf7HROPaLFiJ
	khe+dBF6tAz4GVd1LoFS219+zcX8KZpbphFDzPs31jUwO5pS49128TbBU+TWUchjaEOIc8TBpHd
	/hfuipSb0fshW5kd40c1Xfexaww/EbE6kIjz9VrYlj99IperMNag021azIAv2jEZx
X-Gm-Gg: AfdE7cnWhhA/MQJdU7WssG7O4eUynQfo/DJ6OEeIGglqk4Hi96y4+5b1YJEC8HnSxg9
	7VKfuxKAqJF30NjBJK8d1VjsbiW2u0Yhd0DSS5XrDjYpqKDc1n+yY/Alt+Ul+w9bS2P6MoGXL2l
	1PZP/qyQHG/eKY20eYn1iLXCCn9V56CIUkXUfoU0rJ0y1bXOG1uQNsMkGqtHRowVUkxtFmSIvQN
	CLuVxUA2kJ4fONA2sm4oYMvN2T+J3gr3yc/EsRbcgHBtXZZ8JaA/lvBWSmDNll9ad2XdnCyzJ5v
	6y+gFR2TIsAfNMaRA3nb3OZTIxpzMLtBGqJEpihYd5yBhBkg4Rf8td8GGzFHT5r3ObYpeybkdxn
	MFFsYaoQL+yiTj0jMNU1QQCGyWS5cO8xhUX0PYbndNV6nTA==
X-Received: by 2002:a05:6a00:301a:b0:845:d286:1fbe with SMTP id d2e1a72fcca58-847c0a064b1mr520114b3a.60.1782893960364;
        Wed, 01 Jul 2026 01:19:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:301a:b0:845:d286:1fbe with SMTP id d2e1a72fcca58-847c0a064b1mr520088b3a.60.1782893959851;
        Wed, 01 Jul 2026 01:19:19 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa65bsm3611542b3a.21.2026.07.01.01.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:19:19 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V3 0/3] arm64: dts: qcom: Monaco: Enable SDHCI storage support
Date: Wed,  1 Jul 2026 13:47:12 +0530
Message-Id: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4uzlwMSp3v2DD-hUrqoCPimUprfXwr9-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfXw5YFnhnhejAh
 UY8CFyqrUB2nuz8Vs+h/FRTVkVFKcmRleBqVOzBWoYLobeBEEzhx4vp5yEkcN55Z13hzAx/sGk6
 iYJKeVSNTHAYUCuEN9rDNNfcjeIWLUjjU16fz8/RPz/2I2MDQDhSW/tfv6ErJL2u34GA/ikcgk0
 +7CmJ8p0fKGEG/q+B9QmoqZhNbtQSmWCbwoCWTNbcv8gg/H9RnQDgqnRkuW33pJgd2z8rLI9TZO
 Fiq0ZmsOSeA2sk+IYv5ubNk3v+cF6kmjYI+rRI7KIIyFHj/wVgi3oLseXuYSp9UCSg+Wq3yZUzg
 L9aftXab7qVQAmbSpJbA6XDzAU6hjkBhEwsW0Pk/3QDNSQhJpKrPoP/XpyEmXTDBnCLJmPZ2N0D
 n0As+Tv/x5bmo/SixMSTSPzqvp9EYWQOeu1gdKE+7VxY2MOXlCE9D+vUhzIAzV46+f1wRlKqu11
 102bHhuguTuXuwfBzpQ==
X-Proofpoint-GUID: 4uzlwMSp3v2DD-hUrqoCPimUprfXwr9-
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44cd89 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=972t8ukbrjnbrM4mtFgA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX9+nHNuHTt55m
 ZKZwpEOORK0IrE1Yv0/UH6v7xURWlc358YGqjUWtGRIXCBYv0v/EgH/dDhdY1ObQhrLC4eVQW1o
 6MXIiOQApaIc/hnNbxHXgE3/zH/tnJo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010083

Respected Maintainers,

This is v3 of the Monaco SDHCI storage support series.

Changes in v3:
- Update the patch to handle the supports-cqe property for monaco-monza-som platform which also extends the monaco SoC DT
- Link to v2: https://lore.kernel.org/all/20260616130347.3096034-1-monish.chunara@oss.qualcomm.com/

Changes in v2:
- Avoids using the reference to direct supplies as dummy
- Updates the eMMC overlay to remove the static UFS host disablement and
  vreg_l8a voltage override, allowing DT-fixup to manage the UFS-eMMC mutual
  exclusion dynamically for flexible UFS/eMMC configurations.
- Link to v1: https://lore.kernel.org/all/20260227105055.2364348-1-monish.chunara@oss.qualcomm.com/

Validated on Qualcomm Monaco EVK with both SD card and eMMC modules.

Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  7 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 37 ++++++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 6 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1

