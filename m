Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856E9368D71
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063846; cv=none; b=nNE84AiIkiznpB8/wi/o8BZSAbiQxA4my8k4TKD4UeIvZp4wjD4KTXcaWt2dMq7L14BuNkccV8QNWQ5JPyBoPutt1zP+TAdjMNB7APJzPpxDRkRGOH8BYYHvelWKdxOZ1SvMtuDdkJcuMVHJizwgWN+Vkyu4LxNgOMrsmLXLxYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063846; c=relaxed/simple;
	bh=4yKQ0kZHZv6Js/eXRRB9kcw/hSSpXSVd81QQhJTa07E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OUm+B1PQ54BACh7Y81qnAZ9DAirEY7etVR1rcyfN6JWDZDM6lES/vBl7hr6jpE4OSCT9LkGEmNiL4nNzu4Td4cziFQueagWpzfHqLiUlj+FTexUViens/vBQabMpfjNQYd2iT4Dt6m3JZIZ+i0SDsogTBUjoipwqcSZBsAwPOHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUaQCcWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+FQ2pz5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUaQCcWL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+FQ2pz5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663687PA3053805
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kRBW8lGJJxacHkqCOhieOw
	1QBlP4IW4YtNsHgtcMRIk=; b=QUaQCcWLGzpk/bBPlRB6VTKTtMoCd73cYD8BIu
	lHD0I4W5ElCgaZLwPQLqEaeVJScZDO10FTYzKD/j5EVpZm4W0vHoshVugxBJrnvd
	9APUZYFK80ezWvDQ6L04kPz66VMnsWFC1x9bimy9wKpgOGrHgXE+LnujrMWE55UM
	uZrL/wqA/dAKfTvJTqMwISB7GekBDspFkVJd7V2fv1VurOOkS8yje5LO91xyaPFK
	CB/1IOzHxOpmO02Gr2P546M3JG5o+FMwu8P60bWOMAl1PiSB7iMmVTvwJ3l1P5kN
	0wtVmZKTOuYH/cJyzZX0xi/Xy2nKL3QMatAUhtPg5qcS79Zw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00adn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:30:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84622d6102dso348095b3a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063843; x=1783668643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRBW8lGJJxacHkqCOhieOw1QBlP4IW4YtNsHgtcMRIk=;
        b=F+FQ2pz5BYH0Ree2x1ehpDfCof+wK0TXF6KfKho2moWwteZS6ytFPnbAwxeevsnp+A
         YGFXLUXCUuKohUX1JpULucVkFYzBEFFNC2wZGDBLDn3Rn+Ihv24kbjYkN07rpV3Vb/0E
         iIiL+zNNTpIwanFS9wQM5ecfpHGPbYX3fGTYPdMHfXc9pqejCbLQCk5vr1NB8LgNszb1
         J/GNXfZ18b1tEW30aIb4bNsjVNrqxlJIQc7e3M7cPt2paJqcdX93iMRm9WbhZcQp+plF
         TBOH6fXqdT8NyUFSP1b6r20EHC8UQV2j6BadCN9DNmuEDaPBPwzrk29c7nvtnCII0uvr
         LGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063843; x=1783668643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRBW8lGJJxacHkqCOhieOw1QBlP4IW4YtNsHgtcMRIk=;
        b=JH2oayeTGv12PfapGbvL854/KZHUDyWjOr85wsGRbJkJvs/jzbBcIzkpTyscB1JePb
         zpjTRgx4hKuiN2kg7/EskiCm+R6EBkWILltvCnGLdOpJCwijJDj0KNHFjzwEkdijrPG0
         zmwXqhs+5cACe1T8bXZE7SScIqWkC4VKKriyaKcaSagflqLvHoRhCxpZiUSmlMgLLzob
         OFfhZ4CLsPh28df2QYBiGfdSu5VWPgZFlIsADmINCIvMKqfJfRYU3e61QzIL7PLUqPd4
         XAV5A0Hsm6wdJe9FLg3uFybOkE6zkEJy+D+5IVP5MqjTtkaaqr7fLBVjyzVzP3OnByHi
         FdnA==
X-Forwarded-Encrypted: i=1; AFNElJ8zkcGrjhFfhR9RaVfIZIa5++VmXQz4OfZICo0yiW0QnABLoaOikoIX+FDTTgaQ7wqAS07dUAfNziYR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo7bhRBsV1ZNvu1dihohl4/m0Vj2q25w+b/hLupWCtnMII86PQ
	v1Ny23vcEZ5l2QaXFcz4ZVsjwCYUi4euUrafBcUlyEXSr9Ru9+1cUrr9g9PlPEQfs6wwWPG6yDQ
	MAoLCKAJs3Wg8rsQU3JhFycJO36uAqKHbI38X41DTMcacMz8+pDH6JEvUlj6nbYlV
X-Gm-Gg: AfdE7cnsoqu2I30LLHp0px+92nr+2TofzvMjf3jPf6URqojWUE+Zz7oWmdySikRa/ko
	kowqrAeQIOF/4n8mEZ0PpnrZyIpw5GCA/qrGNPw3FwbckMPAXS8cPDwHW/t1ds8tzPCIGWH7kP9
	63rGrHmYJbfYitrN50VdLdtM6Ft0tHGPv4hNOo7Y2dbkRG5rN/norpEQahSb33682qjQNhPfosW
	OGLlWUJP8ywAIWK4LYyHyEBM9cJbis7zqRK0PpBuRh/aI9wnUS+2P2X6w7YZXhF/81SorBjBmMB
	riJOzxeELDU8sGdsiiMBIEYhhznGWlIVgRUjP3sNfom1vMlsllMhmjMUCid/Hp2J+5xWMfml+Q+
	F9BRZD6rXNadnK91ze7tvhp9UFPs1qQ94+0kuD0Vs
X-Received: by 2002:a05:6a00:3904:b0:845:4142:b8b7 with SMTP id d2e1a72fcca58-847c5070887mr8202705b3a.24.1783063843059;
        Fri, 03 Jul 2026 00:30:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3904:b0:845:4142:b8b7 with SMTP id d2e1a72fcca58-847c5070887mr8202681b3a.24.1783063842545;
        Fri, 03 Jul 2026 00:30:42 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9902efsm2456176b3a.45.2026.07.03.00.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:30:42 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
Date: Fri,  3 Jul 2026 13:00:27 +0530
Message-Id: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 99uPhHL7UbF5p2q1RaXNt_LYvfEJBeJ5
X-Proofpoint-ORIG-GUID: 99uPhHL7UbF5p2q1RaXNt_LYvfEJBeJ5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXwlZfbmwBYkvv
 7lbSLtzQD3p3btXlNMC3Ma45SuYFTDaFvHjcswnifIGV8eamK3wufD6bwrHOnbLhpw9qsyr+RVx
 e+a0E3ALauuJYrHqdSAD2dyz7dCrbuw=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a476523 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3m4ceKHbqf4I2ffRd28A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX7r0kUiwQIKx1
 RjRDHOX5ylDZX31En0ZSjOJSy7XfqJZ16ptas0+JnBAo5EoEsfrD0jKddaqglMQB3qXboEIx8uW
 hMX8/4Bu9eBBbX1kRed9NF1+mnDgW1bL/HGhngArpWpNHsCa4LoaPZ/Iv3T6TBOr49LPI01vANQ
 1KXV4nfAKTgjY2jI54vCX0sdoPhey14VzspBpSnKsttgbw+gkbq1HnoA0crpD7kznQK3R9oQNbF
 kIsiF21QUUVMAlL1Uvizbz7mz7r0uOnW6balOZ+fNYnu6f8ssys+Mj8b2dJRUbbdQ4UD93UzB9h
 lxWgE/bdiCexU37XXmjYJVVq3SZDCdChHQ2e4nMdDSd9TvzeUhxB9mMZqBVeKZ7ZQCgwG67eyV6
 u74pa19diphD3zbklSlRtGgH4qNPAL/+TNutjDY06QXO0rNTpYmPtNaKyZ92VmLQCDrEvLQEmnR
 BJYbOI3MwZ3VjLPYvUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1011 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069

Eliza is a Qualcomm SoC that uses the same LPASS LPI pin mux
functions as Milos. The key difference is the slew rate register
layout — on Eliza the slew rate field lives in the same GPIO config
register rather than a separate dedicated register.

This series adds support for the Eliza LPASS LPI pin controller by
extending the existing Milos driver with a new variant data struct
that uses the correct slew offsets and sets LPI_FLAG_SLEW_RATE_SAME_REG.
The pin descriptors and function table are shared with Milos since
they are identical.

Patch 1 updates the binding to document the new compatible and the
single reg entry used by Eliza.
Patch 2 adds the driver support.

Ravi Hothi (2):
  dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
  pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 22 ++++++++--
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 2 files changed, 58 insertions(+), 4 deletions(-)


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.34.1

