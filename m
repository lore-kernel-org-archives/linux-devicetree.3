Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695108;
	b=dbWM7rJyyNx+iARuFpSmOXCgARs9C30U7Jd2rXK2YvW4es53jZ5kXMLHvfETIzfeFtul
	 G+ZYqbmCMlM94Jfx9OqYk/6W9dyI0Bktdy3FHWS1rS3ZXspN4fywfrI0XksE7GuNFaP1M
	 gw+HoA2p9ITU4DHPnfpWTxY+tAIGqsi+yy62VYKj06KGVOh5PyVxDK7NI45rB2IszQTIg
	 O30JiRxSlNIkP52usxc73a4qtO8fHttBzHyAKurCQpRGh+a6cuihE5ivymsbPxBaQS202
	 ejbjIqGLMhXwZHow3wR9vDEVba7qILASJmXfkKwsstSjGQIvhRKHw4EgCuyjlMSmuSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6SFAa4c5nvqNRWfDfdP5XxGfBG+1U9dLVPMvbqJcJMU=;
	b=4GNe2xoevrnPUqHVPC7Vl5hfFrfL9tw+eVdjOr1+pE7Sjv+vTg8N3vjQYZVLH+ryQTk5
	 LmFjJQJnmYxQpYGRM2pz8+XRUeAEDTKhJHAKhOgtUp0dZAD3ewD5WcZXyIsDxtsY7axZ0
	 KNs+4h3NOX73uuQ3So0syhQx2/jOnRoWyJJQHvmJacRXFCgYmAmu7JQOJ64WDfh7sNxXV
	 tCAbTchV+iLoVvu35x29aaRSjH2YbZ7jPpTeJe0uNhcGJVHIqG9cKpeTRad/quPvcTTuN
	 fQvYpA0TeeYSKgB6DLny8EgFC5tMJeNpcvO31d1MG2zRaXLCIhJwj/eEGhbYAMK7ZEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ie3f3WKy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ure1V2jS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E52606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E52606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ie3f3WKy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ure1V2jS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVdGu2263795
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6SFAa4c5nvqNRWfDfdP5Xx
	GfBG+1U9dLVPMvbqJcJMU=; b=ie3f3WKyzA3tOSOyCvkZHZUKDRwjPnNjM4aPR7
	m/J9nm91rTiwp8P6sfsyVfN0Gj45LEQ6V4XKjBHox37BxnqZyzH+84c8FDrwea3f
	OHQHunr9JbVcrD1aZc3b5OXGNOmIHRGCGUNt8A69DukUovp+KZ49vOq6dQX5DcHT
	mYwr2BMiyNnuFp739jIc8uE0a9aHVFOMOluC9x7vJq9qBPA+cxF/IDRON/9hNccz
	0DQuIXB8o2QoLqKm8JNkvcBfoVJT5CW2H2gy0tuWEKZyWosZQcDRCzf7wfq0in81
	aPI1CraKAGr+mBz7AQ1OUcN2BUV4sjgc7MVnDTt4W3Mze4Zw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aem1ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386c3309469so2943486eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695107; x=1796299907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SFAa4c5nvqNRWfDfdP5XxGfBG+1U9dLVPMvbqJcJMU=;
        b=Ure1V2jSclxf638ytoeh0W5QdqOgB/fmZXR17ZlcJsxii8wjL/ATgrKs0J9oTNkv+y
         Tu+hVwIwpHpkf++ShefR68rNJOCqmNz+n1iMLD0ec3pGYFH7B/NXdv1T2YkaJw/eta/h
         vBXgcoqOSOq0VzyjC+9eMHa0FrL1QN5mmBS6zatwGC0GUwlYFIcMXYwHvZEcSFgfHJ0T
         3SIPPJL5v7gvSq/pSmvXgaHVzSvym1Kpfasnb5HVksSTvPrwnVVbPP+RTl0VeXOnlI9x
         pLQKRO8Ij38YeMaXQGvhLO905BsZeFca3hbsJiH3hUPytiTml3I3+P+sypeuU2dUTftg
         4xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695107; x=1796299907;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SFAa4c5nvqNRWfDfdP5XxGfBG+1U9dLVPMvbqJcJMU=;
        b=smP8eGhZP8mSnBqg1f5J+psLiDM0alHzjo1QmOWwN+UfLUGBEpEaKFsF3u0kToqQRY
         wjxd0pu5RGgYBA+0gxvs2NlC9fY37nBIFOO5fadk37ai3GwJf02QVKng4NspU2Gr5ov0
         HBNxSwCwFxe7ROxGJB+9BRRBSALh/dD1n+e7lsspmoqOEcoIeHd5Ri4okNzNG5rE1C+7
         VKiZhJGf6y5ca55P8S59jiMi6h2Tnvfx0hjwq8EWYGe9I43Z/h+Wn2bJaXF3oPPYXz1p
         6saqV0GfeSbjRK5MD2ijCzd5l0YYHZ5R43bTW9nmu+EzhLd43uNdWBFG93RaQR8eHBzg
         BlXQ==
X-Forwarded-Encrypted: i=1; AL+hErEfnG7By/gCAtfBl0DHmNBIi4pRjwsW7deS/eTxafw6vuOdPQPz2uKj8d+yGQGIas+v2IVI6SlBSqn8@vger.kernel.org
X-Gm-Message-State: APuU4Z9h4PZmBaKrZqIWrALOTpYo3Lq8xmEe29fRIQHEVgmSjXetmwma
	FAIhMUJ7HqIv6GOmimbM+siVR1sJeSG1fvb9EoGljI7umiQnWAjd1gbi+iUDGNDyJdTEx6UH51Y
	v49fduktsnoN+40o8dTf+ie+OXwnG8tnzNdtHASF+mMvPv05K6jjtoKyNauewHYKU
X-Gm-Gg: AZFdTZfrILZU+n3X+vE1z/zgMSjJM3KSB2bSjcL9R7RRpZpudOhrxgd0ELoGzof1mxX
	LdvK4Et3qCRvNTV7znla8M2PtUKuPquy1U9t7Pi9zM8WkUzoIb0qwkEaDCS9chCxt90USxiGdK0
	pJ3Rre8nqQenerFiVdmpjpmVdPGgITflULtaR1KgRvKhaWGGpOu+9H68TJMEHo581w6uCF4erem
	7VPDPnvvnetY9xPIreKI4C1bRphEnHSwKGh9hkijFkYDsbwemMItyyk2a/yweOktl+rcUQgpp5H
	SbNzdA6I4esBcZ/22yDnjhnPvdToXjMnZt25WHmlkpuCpzebK1EwOio2jkElnCcW/5qcr5aa7uk
	1Dp/2uB2s//NtTH/cJbePPqv/WuMsuDzcL9zBbZ0ZdlXxsQ0B5brTx/Ry/IcPiFbW6J1Vt7rN8u
	vkjg==
X-Received: by 2002:a05:7301:d809:20b0:386:b070:6f1c with SMTP id 5a478bee46e88-386b0707151mr12614082eec.21.1795695106327;
        Thu, 26 Nov 2026 04:11:46 -0800 (PST)
X-Received: by 2002:a05:7301:d809:20b0:386:b070:6f1c with SMTP id 5a478bee46e88-386b0707151mr12614057eec.21.1795695105708;
        Thu, 26 Nov 2026 04:11:45 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm58457549eec.13.2026.11.26.04.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:45 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Thu, 26 Nov 2026 17:41:38 +0530
Message-ID: <20261126121140.1716190-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX56/o0KT637IG
 jRJ/2s7clU+4B5yYcheuA8fT+g2orY2/ZYwg7fzmd1LbEYDdsJKZKSQmZlDXveKiryTpSfk3IhT
 LVv9yl7YGsskCxlh7ETB++Sny75eAiBs/mQ1aywLAAe3GMawzaAdi8k9NYmDgsY3lE9WIXALzEn
 cm6RtoA+/v0Z1YQ/EqpR9OPDLfksSkOV401qSha/udqm2ijX+WJkAyyDo8YrsKxMgkZTopV+GAw
 AoGTOMKVuof6mLDJ5xUrA5Wy6+JDnMaj6RSiXMc172ZmFbcn3nZhEpeDMB7HLYihoTy4pMnF6QT
 DzOiNKygcIKYyRQ1XbNJMBWpxUDFntW1615nRyVTlruNjWah6HtwTvRuo9hRfz/7ZL31w1phbpE
 gj8sWXQjhB68rXRQtccNBo2Kmhi3voMazLVvRrhnsIgMIwNkdowvZjw+458aWce0QTO4pE/u7e7
 VXIYt/kZJt1UCbkLtBQ==
X-Proofpoint-GUID: OssFu1DJ8HoBP2Hr31Ny3Vnj6OljbsNr
X-Proofpoint-ORIG-GUID: OssFu1DJ8HoBP2Hr31Ny3Vnj6OljbsNr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX1REXq52CRoy6
 XEpRloM6tPz59wVy9xRSQtFcgaJ/2mcU1r2axMibNIYOmUEhG7ST+4FoytHFccgMf1MQpvEZk6+
 ZyYMr0X9LBTXW7W9YOPlOLULl3dnhWQ=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b082203 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TYia5Kd-hLhucc7yLcUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

This series wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [v1].

v2 [v2] split the change in two and addressed review from Dmitry
Baryshkov:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

v3 [v3] only added the "v2" tag that was missing from the individual
patch subjects in v2, with no functional change from v2.

v4 [v4] added a base-commit trailer that v3 was missing, again with
no functional change from v2.

v5 addresses further review from Dmitry Baryshkov on v3/v4:
 - connector@0/connector@1 are carrier-board-specific (a different
   carrier board could wire the same SoM differently), so they move
   out of the SoM-level typec@40 node in talos-lyra-evk-som.dtsi and
   into an extension of that node in talos-lyra-evk.dts.
 - The endpoint wiring for usb_1/usb_1_dwc3_hs/usb_2/usb_2_dwc3_hs/
   usb_qmpphy_out is likewise carrier-board-specific, so it moves
   from the SoM dtsi to the EVK dts alongside the connectors it
   feeds.
 - The sbu-mux node drops its select-gpios/orientation-switch
   properties (no pinctrl was provided for the GPIO line), keeping
   just the mux's endpoint declaration.
v5 also rebases onto the just-landed Talos Lyra EVK board-addition
commit and adds orientation-gpios to the typec@40 node, needed
because connector@1's SBU mux requires CC orientation to steer
SBU1/SBU2. connector@0 is USB-HS-only and gets the <0> placeholder.
GPIO104, which this uses for connector@1, was already claimed by the
carrier board's DP hot-plug-detect pin, so dp_hot_plug_det moves to
GPIO80 to free it up.

[v1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com
[v2] Link: https://lore.kernel.org/r/20261116114908.1701258-1-akash.kumar@oss.qualcomm.com
[v3] Link: https://lore.kernel.org/all/20261116120623.1726089-1-akash.kumar@oss.qualcomm.com/
[v4] Link: https://lore.kernel.org/all/20261116130520.1763088-1-akash.kumar@oss.qualcomm.com/

Akash Kumar (2):
  arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports

 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     |  41 +++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   | 109 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/talos.dtsi           |  35 ++++++
 3 files changed, 180 insertions(+), 5 deletions(-)

base-commit: ddf1ba39f517292164e13baa8d2ece96cddc7aaa
--
2.43.0

