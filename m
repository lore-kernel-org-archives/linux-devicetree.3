Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B7F379C23
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037575; cv=none; b=BEzQFBiExvAWrpxz6ksZsgwyN0taCfFsayna/+7szmCV+UhSgzS2rP+MP/gpaFf4r8e04rOZMlmx6b51A6njN5ulZp6TeGQUGcK3c2qY4qnPyfSpNugt2M5PoEqYlwgbgeW2l0Cy+kMMJYNK2x3P7cNPFHOwzK06evhNlxnY5jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037575; c=relaxed/simple;
	bh=E4A+3529DCvQc6RsCNPiKJ51KMeeH8suMBGsrnaqZh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DE+FZLL56odWvYG5o+dlBs3yUIJ+dzHRNrO/EU5deHvM+TWT81ZxII21jYLB4OkYPd/hlJ4e+Px2TzouT1ETj/1Ud4itzaOER7GtIpcJ+IE8JYDdpAdICuBz0CpoVZxyaidv4LN8lwyo+TYf76gMxMq/FBmcgQVoB47kowts7b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlqcccOy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mo43g8sF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlqcccOy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mo43g8sF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xBJB1640485
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h9AQmlLMV/P
	ahTudrlV4VavQD0Olf3XcGpTpP5eYDUs=; b=UlqcccOyc+v8efZZJVs0lCmAdDO
	QrkEYu6+DWxFWN7UpGbE1oKf+bGNhljun2GcVZ22CG/7e9VX5XqHmCk7TXKTx60A
	WKPqygHtnpSaP8cUwKxj2aJgIPC62VslkcHk+Tylni9HyX+BvHIXlI7/+Mk5pbHU
	Li6QBip/jVcn2RtkiuZJeDMF93nS6onr9NJSq5sery/dgtmpbfCKO1IDqwyQ2tpg
	glbMdkSElMO0AKUJyTodhCQdypVx7aZe8cgP+FlN6WhQmgjMhtu07L40rVuTdOiF
	TBfU90wZKbs84TvcZjTwbLmy0h4Oe6BA71TZoiJl/k/S6QlVW9kmnzN5thQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhg1r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:12:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac53d5ada9so457546a91.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 21:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792037571; x=1792642371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9AQmlLMV/PahTudrlV4VavQD0Olf3XcGpTpP5eYDUs=;
        b=Mo43g8sFcvL5zUAlovaueIBCrylr23Yvkb34LGwrikWxE/wWJfv5N93hgI4rienaGo
         NMq+pVjrH3hwsnf5ph3P1vuC3qLBvRPsNy/2GRu43LD59/yaSBgz1m7Q/GUzNUvdw3fN
         wDncAwc7Ljih7LUZlw5M89E8AWDQ3GZjB9WWJrJ7M/k19JW00+PR2H/YDhMMWXGShkDM
         SnOzpgytaw4WJab6Rg18yKtaWlIH+xevYlNBt24cpiGMbDdNkPHs4f84dMgM4masjsab
         riC3H+2Ex9HR1vAShbBjAMGPi8MjxzjAzIVR9aiUH7OaI4czeAs/e/r6m1wPzKWnOW4q
         2rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037571; x=1792642371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9AQmlLMV/PahTudrlV4VavQD0Olf3XcGpTpP5eYDUs=;
        b=ODKCGttFh1+UZU8MUb8TSfTAECx/I9nJsHkFX9BTw0ZnUJ/yDX+V+NmQXrkIjyEozc
         wo0wcSzoHKqsbpgQnUSTXz8vCAsOA9H1ko3AZ+IJHjAGRjbp3/9au4vmL5oEdIt9tNI5
         5Ox1Elhq/DhXm+ouUWeBZwNCsgf6gykmINYh5VxPuMDhSkDxD8J3y5N2Ync9VXm8klRs
         tsWfrzRtKjenYATrQJ6p0DaMp7TN9Q8L+t1w2UqgRRAfb58BYxUA5vTokcyvevwzgB1/
         SBbOC74daxj3mlKkqTcrQkhWZ5OecIyAI4eblpQGvZks3roQi+fxOynoQliGqTffi2Sj
         1DrA==
X-Forwarded-Encrypted: i=1; AKwUvBwRfyTcXY7tvNqKEF8FkrnbQOO/0AxvXi7s397mOfshwjDV8eTj1xiyuU4pEwtBXNRcQzpLEUf49iMM@vger.kernel.org
X-Gm-Message-State: AFq9FYLvMGGgULFBLUBZ24DrhMLJQD6uaOE3Mx4rbbNhYxYWlhiNLAoN
	fGoJqtvAlvKg7CRn/qeUnZZ5xsiIdiFC9uVp6cP6WRyFm9IZMMvQ5dobbo7P9hkYOrCRokVE5GL
	HsRbwjYYgz2iZbEcAut+K0L4kNNMTVHYIMfqzWsEqp6W+v8BZA7ZGTiyqKBoy8Z/P
X-Gm-Gg: AYBFou1uES8QW+mzdWQinuX0EEIU9seETailqb9gYEjRng2XBDZsa+dnCrGKebVVqz+
	9RplTzikknL8q1wueACA/dBwRc1TTYpMA17v916pl7nbpQWCWfGpwp4mvFGAOq7JSIUONtIRKz2
	OJhwF24juv771VwWRMRfr5nDCwoPpzxvHXKJxIxkScJqQh1lV5DqLIavaETdMe0x0zo9Mcp1V69
	fP6PE7lb53K8yq0Gm6jQVIe1QIWyN4r/aMgyzaQIlpH2eifS18iHHRt4sYGIGNKV8yD2kPcA9BT
	w/jM2yEBPw1xxKzKxkyDpxZegwbc/EnRtC2hGiZAxReKQrG3egKpI+nQX89QTntFnBAHik6DKwF
	VQk5ECSG7GX1BaeohZoJfk0wazoaV
X-Received: by 2002:a17:90b:384b:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3ab3a8f8f1fmr25571074a91.4.1792037570964;
        Wed, 14 Oct 2026 21:12:50 -0700 (PDT)
X-Received: by 2002:a17:90b:384b:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3ab3a8f8f1fmr25571027a91.4.1792037570349;
        Wed, 14 Oct 2026 21:12:50 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2267762a91.15.2026.10.14.21.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:12:49 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [RFC PATCH v2 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Thu, 15 Oct 2026 12:12:38 +0800
Message-ID: <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX084EyO8j4ZGK
 8bn2vC0SVFT2aafwjISb0WN/7Dijc2lgqcvXJDj2vUp/h0e7QqtkQuUN7V2HMcsb1yQUOu7hgIx
 ZqKCvbj2xkrVDi768ZPqlTebJxPUnZdx58uMdXDP4x852r+7NH6B2YQ8Zu6x553mYLEqtutVx5r
 266VYlMSPUUQ4AW9QJAki42s0zrc/BAXxhk3+NRD/mTVT5ZQrrd45ckTFXHaCiigD/4aj5wkxxe
 ua0p62tYKOIQ9P+Ii3mcFGjvkLV9vs+vp80rR1wkcwfDVyQ64SaUN7WGbwZ+e167jTepotDtotR
 /74oa15vfxBpYJy0oJDlM06iQabXbXJLBv3lVh/x4Gfd4nDdxW5DOuoy5FaD9qY2KawHISRWs1w
 I5ygz6SNi4rVuqXipq5ue6x021R3tEeeHjk0RnYNfK4QwFRyKNjSzlEdo689OTULUyqLIDjCUIL
 053fbzeATp7PS2Tw+UA==
X-Proofpoint-GUID: MH_fOvOFbwQizYHADDIgy3btc5AgV6xh
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad052c3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Hpyza0Sh0NQsHZQy3zsA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX9YvKTWF7hMuG
 AFJ+ia+wbEFIdW8vlBr3MbE6GAttJZuc4Mf2njh5njO1Pq4TRfjLUcF4K79yX58xZ/h2NqMmV0l
 dVnxqEJalR8za/iiX4e8lIcpHBIsibQ=
X-Proofpoint-ORIG-GUID: MH_fOvOFbwQizYHADDIgy3btc5AgV6xh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150016

Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
resources must remain available while the application processor is
suspended.

Teach the Qualcomm WCN power-sequencing driver to use the existing
SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
as a wakeup source. The PM core keeps the IRQ disabled during normal
operation and arms it for system suspend.

The series documents wakeup-source for the WCN PMU binding and enables
it for the Shikra CQM, CQS and IQS EVKs.

The series is based on next-20261014 and has only been build tested
because a Shikra setup capable of booting linux-next is not currently
available.

Changes in v2:
- Derive the wake IRQ from the existing SW_CTRL GPIO with gpiod_to_irq().
- Drop the separate interrupt description from the binding and DTS.
- Focus the description on the functional behavior.
- Rebase onto next-20261014.

Linghui Wu (3):
  dt-bindings: power: sequencing: qcom-wcn: document wakeup-source
  power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
  arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup

 .../bindings/regulator/qcom,wcn3990-pmu.yaml  |  6 ++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi  |  1 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c    | 36 +++++++++++++++++++
 4 files changed, 44 insertions(+)


base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
-- 
2.43.0
