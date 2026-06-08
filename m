Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3A03B14D3
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914834; cv=none; b=niXGGy1+Bkah9SyEyOC/DsnWeFZJkJZWvChPoXL/+H4Phw1+QGf+B0FD+NGssZle+I8bsLcoWlPhBXbWjzQIV90+NyTMpF+mVDID5BVD/4+c3/EIWdCNqH/YQJMTLr0goJ7/uoQ6L/hn4jsFY33bK3DapVD45MhTV7NJaTDy7c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914834; c=relaxed/simple;
	bh=mfALNWkEEs2WNfix5EiGhh7bb5Eqm8ervGhQXKLAydc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uFFSPoEFKloEcCLW/LomZ0oj6sd60a7DtxrGDltRuOaXIEwzBcur73cE59hF9rU7nwAFpWyPXFnN1d3uHi/LVxtHhqczu0Y3LbiJHRVUKCCv43azc3b66l5+MG9HEu41BP56/cSkRoxzBtaSTzsGcR42bv47qCFwarDpOECoJPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9nCPyJQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVNmAs+G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9nCPyJQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVNmAs+G"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OtVw2384520
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3GeAp5gromZM7NUB9+Gdl+Z3P+05LRfVRMU
	kyPBfN4s=; b=I9nCPyJQMndq/fShdXiRMUwtWy0Hj+k9aSmnI7rTDEQWYwzcZ1y
	9MdKoAr6Jf+8jDchswVlW9ZI9IeT6v3qYMQ02SaJe16bNWLSPKY7tHKdRs2xVnvB
	J+q3shx5CRMKQpRvqZi7+wWgjS3IXyNYEef15s1cdTVWkzBXoyCQ3JpKqtZ+Eu25
	b4BeGqLJLv5MIWNSZ6zu5aiU93GRzgK0+v7W4uTIArLCNe2bmfxluKtsvT77NIWc
	apOl41VOoAjrw50itfNVa7I+cRlutKzKN3uOFC7M0NV7/qk95ZJbd/wdyQDF1DKM
	idwaZG7u7tg9cH5qgxOZ4MUGbkVIYhQFtrg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1f93c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:33:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so4330049a91.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914832; x=1781519632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3GeAp5gromZM7NUB9+Gdl+Z3P+05LRfVRMUkyPBfN4s=;
        b=LVNmAs+G2hPGtq7kHz3H+RGr9ujpmAb05uzib8b3efIwel1hiXKsUQHkKzY44WQH48
         DaTNgsUAYfabjd+fNEnM/0UiyM758e49Od4HDdNj/PoK7lIOc59obCa9N4o018TKpJw0
         Roh07sTE4HNgcICa5kx5K1dhcN+V7JvWtEK+8f/VTyi5/W7CqG6Jd6IOClrxBnBqFKbC
         pAI/Lp+UGvWvfWq0AccM1txNdIl+ABNyTjpXt7duywxwU/Ld3cS3FI3jvaarBlwuUVfp
         S52/kXq6lEFIGYtxfgYWJGSvPKhTgNCqOFpKheN7Acs5a4yViD/HfHm98osMfb/Lvn9j
         z4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914832; x=1781519632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GeAp5gromZM7NUB9+Gdl+Z3P+05LRfVRMUkyPBfN4s=;
        b=pUqdLq3AQ8MhGbkO/u71mpMxyxCIvFb2XW5A9erim9rPwm4lSYNzilAMKWjELvQDNm
         5HTtowpF+wtUCdKmbgWUh6lll4aV7Z+osHSC4pOSlwnSmR+9YvCO1NR0+c8WDf4NODLA
         Mbf7TC2SKdijHR0Ste8nhVjYiHmKaFnODNwhMdMWXMnSPPN8b/6VlJhmCoplXQdc66aA
         y8PRmrrOgXgLF8qOrSbEBlrrLTz8bhJyyg7+h72R0aQ/pClUzZnKobp3WufM5KHd2CZl
         2Hsa62zJp31o6kUOw4oUOFxsUZQ48dJsOMhjObgI3F8IO5rfjkiygMG8ITg80kC9I9M9
         JvZg==
X-Forwarded-Encrypted: i=1; AFNElJ8M6wtAjpoyAFUzO0XdledBKuFf/89kPgry2PNdPMDJG7Nyb3rIWG2RT9bScAzk8kkYU29yhOtyl3Tw@vger.kernel.org
X-Gm-Message-State: AOJu0YzqZz4YBejsHq/WySxEwyn8kBumxLBW66NwyoRmfSZT8mcke1a2
	fe4EVP4kbt15V2okKUU5kVNmO155ShNAsKySjWV+1F4GNhRn9j70ck6GKf+H9YHqXdj8N0a/j4R
	gnWjd0eG0aXdvGYTl443wLQHRRbYd0R3QLx6CtVrP4puIXBJI5564MEn7x/4mOxni
X-Gm-Gg: Acq92OEXL8iTRXwIWrcbV0NJcmzSyMc72934cXa+9blkr546RB/paZzsWj3kV7dLZ54
	6NQtYxE0aaZGvfm1EL5cQEHCfU+ko3O5dnVgcQd8JftZ25QPKsOeV+NnMJFIe2/D79DVFIlh4Ci
	IYBzCaRPSqHqB1oUZOPJ+dQNSWHdNatN+hdzI5CmHtKW3mKHmwjwMl0B4sJQGMIjQTvChjNZ7uH
	Vb6oSfIRfkAvW/3BW3r9+xiyQlqTZOB2L0Js8IIR34dNLdTBja/Y6Iyrr+uP+NnENf2u2+yybW/
	lhYiqnsOLeWalDjqzaZcx9t7iwa+4KopZdXDx72LFQUfsB33EitdGZJ9JuOfnEdZdYEru+3y7mv
	QXc7ReVX960nl+1BqqRXFvfhawzW2CT47H4p7OVUixLhs3Aa6ybHbcu3ncOBEl3z0Cc0YmUlDOd
	89gyJuShT+u4uPXF/OImdQ+DpPKRMe65mkJHb9Vmfldzdo+uGPogfJFFORlRb2PA==
X-Received: by 2002:a17:90b:1fc3:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-370f0b554b4mr16414532a91.16.1780914832246;
        Mon, 08 Jun 2026 03:33:52 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc3:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-370f0b554b4mr16414515a91.16.1780914831731;
        Mon, 08 Jun 2026 03:33:51 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a2600sm18571570b3a.27.2026.06.08.03.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:33:51 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add ipq5210 USB phy support
Date: Mon,  8 Jun 2026 16:03:42 +0530
Message-Id: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfX0yBSL+OaUGIz
 NQuSFGNDsNM+QkQQ0iLtBSsM86bn8BvdEhW8yaEf8juZOdp4VpoI5cYGyXej2OYT5+v9XYi0v77
 ec6K0aSIS1cShgcK5XVCklHhe33m4TF+HWc6ELGXvtO/R0/QQeeAiE5z7bzpjpjng4wOXt4qDxI
 7G4k7Rkzf+JY1JLdY6r0Mz57vTKFyw+/NPXMahj38lA7/dQRlkLnQDhsnndhSMpF7KIPZUNO+iG
 sadkUcyiRmlE5zX8/I0d6NJhFBuRJUnBSb8obLEM/UtSKCMu26DShkl0AfQMhFZ1MYZz4KLhWhQ
 8pdGQX9XeE9HvPzbN4ErrPv03sEdjPjj3up1DCl8ndir0OEO4fipCcF4ALbCR+SJlrjsZrSdxJ8
 WbvFt8hShCbVJXk/buJXVUxIJ7F3CtYv9ZODz0B8wc+PYjgV2zegnAainn1XyfaNiVDNQErwWog
 LlrUbaw4grBXt7AcNTw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a269a90 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rhUFs459tUsHgh-773kA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: X3pHslwy5BsT9jhtulsFtPinM2TFD_h-
X-Proofpoint-GUID: X3pHslwy5BsT9jhtulsFtPinM2TFD_h-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080099

The ipq5210 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
can connect to either of USB2.0 or USB3.0 phy and operate in the
respective mode.

v2: Use ipq6018 and ipq9574 as fallback compatibles for qusb2 and qmp
    phys respectively instead of introducing ipq5210 as a new compatible.

    Dropped driver changes as moved to fallback compatible.

    Separate the controller and phy patches

v1: https://lore.kernel.org/linux-arm-msm/20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com/

Varadarajan Narayanan (2):
  dt-bindings: phy: qcom,qusb2: Document IPQ5210 compatible
  dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY

 .../bindings/phy/qcom,qusb2-phy.yaml          |  4 ++
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 46 +++++++++++--------
 2 files changed, 30 insertions(+), 20 deletions(-)

-- 
2.34.1

