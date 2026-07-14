Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82BB3EC2EF
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013592; cv=none; b=dPCMKh6Mawl2Muh1GhAAjKAf5sSJOv32ZrrCAHlSg0+baZS4SKFll7GE+A7He6OPO10R/xqLWS1v1TMlVvjvmvCx9AYE1WjR/jCwBxIVbugMrC/acHJwZBd7Qd3StZxzygZFF/wOx4AFHFD1KH4jFMr7XQOb39FAe4mHBJ/auH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013592; c=relaxed/simple;
	bh=2olSJeQThdFIjSb/qGPFCp0Sj552lGbJGxTPH5sNjyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EKGJzfVFvi7XW6Qye/MvrjezhsjlqglTpTtGemetYop+2RHJxIFoYfu2uzD5igeYexV3Z+rSH1WtX0sE4EnRXZYBfIIq6t6KAC5oVRtS1MPtuNCENDx9/RCvsUIgTaVUBVfDvF2TeQq4yvzDyHYFJhkjSFVWZutY/1XP4ch4aBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oelj8v7M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOHlzRMD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oelj8v7M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOHlzRMD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SdEM3929233
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UwLKmPd8Wf72kXwCBZSNtT
	R/YasAOdt1cfgbUUtCPco=; b=oelj8v7MsYOKvULX3HZRX9wAwfAwPowgvPAWCL
	RjoynuPTXx1YnnzvWLGdo+WWkH84gg97i2OOtKOz5h1CBwt57xtouUUGpgM+RUiH
	rsLa1gKkbYAXbe9Aizo+fojSK1/ImXz8s/p9PYE3H+mSdXUJeeDjezeWW2pOjx+Y
	YUfXxgrV+eL6KbPzlLOgMiAz/iLgnuOv2t1tgl2+0l1bSy7ivdYkkG7YiwgqqnAr
	Eju/Hqg3Mjo1dTV9Z0FJAV81KIkGexhACunNx+fc3Bk2DnygOQF9V5DoCiU5E1gT
	XfujyvmuMEqho8ejOqTmlXPmrs4uWrKbCWfulih0GBS/dUXA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xau1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:19:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so85444825ad.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013589; x=1784618389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UwLKmPd8Wf72kXwCBZSNtTR/YasAOdt1cfgbUUtCPco=;
        b=hOHlzRMDVtSzqr2Fp0ebwXvvBWizGhK8fyJIzO5rc4P1LwXJB0q6PB1YFlRipU9p3K
         bw8LihjryuzrTPa35SPAKqCc09n5YYEzO/QOa9bB+vxt/YboYUEfTNHMvwHoYiRfOoB4
         9UTpy848XKKCiH8igaWcrS1W6mRUe5bKeGlYndJtxQyHF7SPj7NpTyh8FV07Rer72V/u
         EYRKq7mZiEgJHNjub9Sf5T8jrtXwF09EYn4xmKIvPPTvI/SmZjVqPmvgDYNP5HPN/Ad9
         oHfC6BtN67MymXP6/jFkhS5hPisbV6TqYbl9ri76Ou5akHAdaKscfV44QQCFQNyaJxx2
         zOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013589; x=1784618389;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UwLKmPd8Wf72kXwCBZSNtTR/YasAOdt1cfgbUUtCPco=;
        b=OiisYR5uQUO2I0lg2xEtNQXy3751bnU0dM/wtflAK2IVPXRH9wcV5RJLlb8CTngc0M
         J1K776bp7e+2QFBRauP0gmvfiVm/wvcm3Gf284QrYqIMIB9Go4J68Q/Xp67giP5lLQ5b
         bs/2+z5Llrnh8jgeHecD64bgpBiKljOinhL4oGq2HohqRxffPfdOAw1DSo/wnM5QMcMM
         t1PenIBEYGoxRTud2zFpVLPSe8fgRnsrIxi+91667EK91WDsK8uzRJ+b4iayepBn5VGc
         pcQ9IriliBRMs3XahW4diYnIDWmI5zuqIzhN2zWP3HuK0TFSKHuT06hkw6siQURNjnyQ
         HGQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjEizHxl2Q9uqxg3yTSyfLCN1cio5FeJRta4Yk18jAP3GgPltHIRwyALKRVD7zTxwLA5TVHSTCGDJT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh/axodvfc5AyQj3ooittD5+fiCldzxPTAWUE1RLnNmqppuE3G
	3jngSQuSgZECj7MFY4nzyMc0V05LQO/uTx9AFbZRdP3BgJggbrsvDk3krAXCsvKraVmlnBxmNJb
	jxm1Qqgf7jr/unBz3HLJre4HzIUDkR6NkY54n8PlS9qdF33w1ihg2cA1ubVmWa/tZ
X-Gm-Gg: AfdE7ck9Qqy0r8jxwp9X/APdFMzhkb2p8NVfy1AtbTRsYjzX/jnar/JwlaQHVlIGBu4
	IdQ8RdZGuG1Bf2OZr+RMWjZztXwgD7Ecgb/8+P0KRmnaUOFPLqQtSXpiFnx6UdyzhGzX4Itkrwz
	uv0WUhL2C+MbN5jORlll5nKVJudzJfXf174OZCvqkqIom0pCPZUkeHs2gKA6Xem40PoOleLvsvL
	qp1uW7hUKXYxVqQWGohFNqd1TEKmO5qkqIo6PUcjz4GyXd+k6D3ds8iA/H4RvytVHWfKHLHiRL2
	XEdMpCJwK4OZAXdcavPKpnP67V9ywDAgoD1DRrXBWlDezbFhyK2qV0J8GXIHSKMt0fsscJjFxl7
	3jq1jpiadX8uJk8zY6QxRsBO5MTKunFVgwBFndw==
X-Received: by 2002:a17:902:d489:b0:2ca:7131:cace with SMTP id d9443c01a7336-2cee9b6b5edmr23000555ad.31.1784013589258;
        Tue, 14 Jul 2026 00:19:49 -0700 (PDT)
X-Received: by 2002:a17:902:d489:b0:2ca:7131:cace with SMTP id d9443c01a7336-2cee9b6b5edmr23000245ad.31.1784013588641;
        Tue, 14 Jul 2026 00:19:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm113037435ad.39.2026.07.14.00.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:19:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH RESEND v10 0/2] arm64: dts: qcom: kodiak: EL2 overlay for qcm6490-idp / qcs6490-rb3gen2
Date: Tue, 14 Jul 2026 12:49:41 +0530
Message-ID: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX2m7PAQfcr8QW
 /5ZWGV6yiakuUQjKUWrceBURSFWTsv378+17HQx8lFbAjOs6xxID7Ge0Fc8SXe+6tmWoIQtE1VY
 fN6b+YzzP9/IfIXHt5VuvY5A0CfgvlZUM4NAPbDu/D7mq91L6cgTJEN87YvNjGi1LN7J4mOKh3b
 0MlXpbfXweRNYpegbd9pkVpp3Ki6KJ1MuMzKk9BXUNobFVhIU48iAgfPdkSKzVuJO//jAllU4vK
 3RFfANnlWEp3oYw/PbHCOu63Q20uawGEkWZO/NRFuHb40jb538xaailoTvt4hYQmNLg7FmR3C49
 j+cer5vwjFZc8+UqnzsAIRMcHu8dfeuydoB38W4w3lrPGJ5VCJ1B8JT8L9REkx0vhsjiuqtVmrc
 BHHr7sEBIiZ7OL8qX/12pnHKgOoEgPisp0AVnbMOcjIzX0rGRmW8E/fFQQoJJ7VjXdVG5qgq3kE
 v/TMMrDPhfJdJM5RYRg==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55e316 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n0mgBXbVGTAyQq78KrMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Jy6cg9qfCWt1lBjbh82j4qNjGln-zjOp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX9XqhkRWmzUsU
 /2l4VY8S+AvvPxRlR446OrR05x7NPDQwWFdJWTwu5FpJSZACdQLhw42fyNzfWF5EB/yiwlUaa6U
 uZkiwNZb2qivONqbzo2Sz0r4pvlh4as=
X-Proofpoint-GUID: Jy6cg9qfCWt1lBjbh82j4qNjGln-zjOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140075

All existing Kodiak board variants run the Gunyah hypervisor, which
means Linux can only boot at EL1 on those devices. It is possible to
boot Linux at EL2 on the qcm6490-idp and qcs6490-rb3gen2 variants;
this series adds the DT overlay that describes the IOMMU streams and
other kernel-owned resources needed in that mode.

Patch 1 is a small independent cleanup of the two board .dts files:
keep the wlan_ce_mem reserved region (its /delete-node/ was erroneous)
and drop the redundant wifi memory-region override that duplicates
kodiak.dtsi. Patch 2 adds the kodiak-el2.dtso overlay and wires up
the -el2.dtb variants in the Makefile.

Changes in v10-RESEND: https://lore.kernel.org/lkml/20260713160754.1250988-1-mukesh.ojha@oss.qualcomm.com/#t
  - Nothing, just  removed  In-Reply-To tag from each patches and
    cover-letter and added RESEND as part of the subject.

Changes in v10: https://lore.kernel.org/lkml/20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com/
 - Split the wlan_ce_mem retention and the redundant memory-region
   removal in qcm6490-idp.dts / qcs6490-rb3gen2.dts into its own patch. [Dmitry]
 - Drop status = "okay"; from &wifi in the overlay so platforms
   without wifi enabled in the base .dts are unaffected. [Dmitry]

Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
 - Instead of adding wlan_ce_mem back in the EL2 overlay, stop
   deleting it in qcm6490-idp.dts / qcs6490-rb3gen2.dts so it is
   present for both EL1 and EL2. [Miaoqing]

Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/
 - Added a wpss copy engine memory similar to chrome for Wifi to work.
 - WPSS does not have firmware Stream, so that was removed.
 - Added wifi streams similar to chrome for wifi to work.
 - Removed this patch from Generic Pas patch series, can be followed
   separately.
 - Moved Sumit as co-author as part of modification done to the patch
   in the past.
 - Added some more kodiak's board variants in the makefile.

Changes in v1-v7:
 - mpss was disabled and will be enabled once the dependencies patches
   get merged.

Mukesh Ojha (2):
  arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and
    drop redundant wifi memory-region
  arm64: dts: qcom: kodiak: Add EL2 overlay

 arch/arm64/boot/dts/qcom/Makefile            | 12 ++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso     | 39 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     |  2 -
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts |  2 -
 4 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso

-- 
2.53.0

