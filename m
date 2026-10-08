Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3153C376A17
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 01:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424256; cv=none; b=YEOr2fPejyhpGzopHp/427QpUqJpUSvYc/0U0DauvpblHfMRlryQOsXW/3GYCgr18otYKS5svuHxdpPCvGjEp1OF9Htr0WYd1cEaPflBa4m43ieNL73FiFCH7HYiocjOEAg7uSz861LeV2issJFpuhkq2kCE2qsJ9u/BD7P4umE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424256; c=relaxed/simple;
	bh=jbfW2dh69ZgGP9uLkvYBYX7FLH5kTWOCnEzgCNeNJUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BbqMGFLqQfZ+KqF24xhEXPdifmlOvxYOceR4kKgG8pwZK4DbPk3+J9nZLNBDvEex2y+lVw55lsNiLm20/L9ECpgyAtZauRpbdMGbpUhGaboed4A13ITGfu3AcghlPgDLjCqdNm12dlrM13vH7WyFSQO6B4jY6Ek4Sv9uj00KZOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNZiUt1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxN6ugpA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNZiUt1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxN6ugpA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hcVH2575225
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 01:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FPQv2BXDyf9TNW1n7k+P5bScY5jgJTIXz5h
	lo65sNBs=; b=fNZiUt1CyRqyIvjI2mgVnn9In0nLOZdBFOErt99kLe9R/iYqvOh
	anX/VWD9/wJJVC2OyvVPkLDRHuTSnm5uLAai3YtdYgQagIFCm45+CDbD2YLcUyte
	/GaRERDVrVW4QJSp6W/eJlZxsPrCrvFQqzKX/Yb18i4j6qxSG1IduOBrv2QvVJjc
	JdEB3RnHTCX0MIjBnhNf83h7lGh7YIGIfZW4hB8R28E7FXYGvFdDMGwmqaHYKfKC
	d5Dr6yeYVERw03sVY580XKPSs4kaCoGUqx08L/g36ut+np7/u3PjslW46PWE7EFl
	QMXZhNA2ojTEE2bgeaAdAmNv043ugu4c0lg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg866h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:50:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so6197936eec.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 18:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791424254; x=1792029054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPQv2BXDyf9TNW1n7k+P5bScY5jgJTIXz5hlo65sNBs=;
        b=GxN6ugpAWXpZbsrNHFJr2ByjB8KwqURrMucBUL9+PtvA3wkEn9X6/xRaVAcTckJRuV
         rWgMWyYPs7sJDhhjMGSmUZnu67YE5L6m1yTNm0xGE4u/OSmeWLukfDVcJac+MrJqC330
         AEt+Dj/Vt2HjRtj6njoKd37eHegetY2nup3zQP1XOpPBx6T7oO/RpzNzm5hbCwrf0VQR
         JV5WlrVUFPGQVXzeK6CLnmJ2O9pK3XGCxlKviuClwY37fHyc/yikmELH+GK3NfAg+ozY
         bUl6LZTvyZgOfSMZFlzJOMQ86VA2HyVJ4Gtv/oVhI3NhpASa+lY/2WaBgd8TPddnyYo1
         E9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424254; x=1792029054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPQv2BXDyf9TNW1n7k+P5bScY5jgJTIXz5hlo65sNBs=;
        b=RatfFXdQsnW1lI6x6aTrhTBt6o19IaZTlT7pzTG6U8tjkxeCghSLJXuQfEyCG52aAL
         fpMLDLLoq7b+AVWoOe42sgLXAwo7rotC5K3q21NvXtp+9tGzkDXqUcDooYH9+eW9rhW2
         HKb8MYnJNKv0S6iI5zgsHciBT9G6S3KruyniJq7cpGKuy4nB0IU7jZV0kpgfezpgkSIQ
         9lCeXf8HtuPY5T3DGbXRqIJybTGv961/VKqmlaCcmE3889cy0s/XODxHTNiLzdsis+UR
         dP5fVyYeUp7qZZaolh1a+95Bmv65D7lEYCC67KrsjKsyPZGODYega4WSQgNrrUpcQNQw
         fwjw==
X-Forwarded-Encrypted: i=1; AKwUvBz0BK0E/G2Y/sjy+YAfG1PtsaAMfA4i1fVChJUnEVACpr8KsXS4WbIPutXHpTwjVTyNSHlLh7EOJV4N@vger.kernel.org
X-Gm-Message-State: AFuF++kmlEUuSJkDnoeyzwtXtgE6+6t+d02y5+0uWqP1jaNsMYyrtHwN
	j7rQs90Q0oJLtsq+nbJsQwyZ+TjJCXtkSFU2j30lLj/FQ3HjGfZ6o/UJmDgIpGuXRoK9hKDKoP3
	CaB+La2CZ9L9rSURi38Utjrp8SSKltGPDgBJQrbeG49ZO+SNJFx9N8HQGM3vD7cQhgy4LOyvmHM
	A=
X-Gm-Gg: AYBFou3dadYrwM3Yk8r4sVA3zPOZlkoA9H9iS9MFqHwtgSDz6Fkn/jurx4AlCRRIi1o
	AyL6z+mgZc6vbNZOnSAGbf7nPAJaeqZuaE2G1ZivfXJxt4X04abTRq5//urH0eAa4CIrxeZOVVS
	hq5t+R8uPaeYmRTKxN4avrJ79GObyHDC7wu8D7gHvD+Z17IJPgSFS5cm3XX2SSYgPkGOM5cOlXp
	Q2buaJp2v8Kg2rGhQ6MdvuTZCOlZtBrjd+B1H8v5gWCcmqvWWmz+sf5FIlOnfVL16vGTzYVpAyo
	70RUiSTCKi/wTKxHX1OK4VwmPyGc24tOmdNTP+OvVSPVCfJh7tfSj0lEOUtGvJnV8jyXDca7gk8
	4eih/u9AT1o6drHlgazDCwmoZeWI40ElOmhgrWeSTWq9D/Xc7EX1d1OkAgFs=
X-Received: by 2002:a05:7300:e9c8:20b0:34d:3ad2:680e with SMTP id 5a478bee46e88-3515dd51cd5mr5153699eec.14.1791424253607;
        Wed, 07 Oct 2026 18:50:53 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c8:20b0:34d:3ad2:680e with SMTP id 5a478bee46e88-3515dd51cd5mr5153648eec.14.1791424252763;
        Wed, 07 Oct 2026 18:50:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm11761823eec.3.2026.10.07.18.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 18:50:52 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] phy: qcom: Describe the AHB2PHY bridge clock on Nord
Date: Thu,  8 Oct 2026 09:50:14 +0800
Message-ID: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7bqt5TB7V2bQfcaZ6tE6xNf7AdRSWZ2B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfXy59fSQR+RiL2
 DDPo/tafChohHTRVtKg6QYPGw8CdylE4GXjZasoXHA9qtCpkXgPaBJcPqT33JCJfH7zwJRt+rib
 s8R1Cs9COi6pXyHpCpCeP0Jfj0XiXHw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX/51dtAhgg5wD
 +qSIxqBU/m7w+yb+4EiJ4k16ys+GzrlTho14/UQlv+HetFVRz25orabuoJAvBQjh0FfjLtTtXkx
 CK3cfwc97JZotDZF0+Ne2fZAMHCr5KqmWJwJDqktrpyjHkorAhpkmBf8wXOjRRTPHs37oHMUOI3
 AmYRu0PO9DcQbn5BmeG6xkV8+CgZ2P7VxYrnldjTx1+GhTm4GJSkA6e+qhs7rLpvpKMR/NxdxBJ
 e0MU/tF0lMHSXANymTndYJ75xDWnJwCyaA5hNs44avIjPrAIJPEnMeZw8Gs9+QeDb4qL8rFEZts
 DzOhSGPEbK8Nnfr1E7bt7ZKp0p3tUBcsc5Ja6WCZ+ECBONWpRECREYkP/kTj9zFyi4X52+V/WbU
 39cqtkL3OLJtXSnxzScAp8/uGdniC3eUpsC/4HrJ6kfI1RZhltmQen+uDIYJW2BNxg5qgsEGP/6
 Pe3Rkg4l4f1rKNJwT8w==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac6f6fe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oDUT7GkQECwNgSz8oMgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 7bqt5TB7V2bQfcaZ6tE6xNf7AdRSWZ2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080007

On Nord, the register space of all the USB PHYs (the two USB3-DP QMP
PHYs and the three eUSB2 PHYs) sits behind the AHB2PHY_0 bridge, which
is gated by NE_GCC_AHB2PHY_CLK. None of the PHYs currently describe or
enable that clock, so clk_disable_unused() gates it before the PHYs are
initialized. The PHY init sequences then never reach the hardware and
the controllers fail to come up:

  dwc3-qcom a600000.usb: DWC3 controller soft reset failed.
  dwc3-qcom a600000.usb: error -ETIMEDOUT: failed to initialize core
  xhci-hcd xhci-hcd.2.auto: can't setup: -110

As a result, USB on Nord only works when booting with clk_ignore_unused.

An earlier attempt marked the clock always-on in the NE GCC driver [1].
This series instead makes the PHYs consumers of the bridge clock, so it
is only kept enabled while a PHY is in use:

 - Patch 1 adds a fifth "cfg_ahb" clock to the Nord QMP USB3-DP PHY
   binding. The qmp-combo driver already gets all clocks in bulk, so no
   driver change is needed.
 - Patches 2 and 3 add a "bus" clock to the Nord eUSB2 PHY binding, and
   Nord-specific match data in the snps-eusb2 driver that enables it
   alongside the "ref" clock.

[1] https://lore.kernel.org/r/20261007073146.3162478-1-shengchao.guo@oss.qualcomm.com

Shawn Guo (3):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Nord cfg_ahb
    clock
  dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus clock
  phy: phy-snps-eusb2: Enable AHB2PHY bus clock on Nord

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  2 ++
 .../bindings/phy/qcom,snps-eusb2-phy.yaml     | 22 +++++++++++++++++++
 drivers/phy/phy-snps-eusb2.c                  | 13 +++++++++++
 3 files changed, 37 insertions(+)

-- 
2.43.0

