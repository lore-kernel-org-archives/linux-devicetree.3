Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0793AE1B8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330800; cv=none; b=CeDejUkQBTUIBVIZnkBrLS7wZd2IuLQ7lz2pur268UmqguzVny7f11j7ud+53JvQz6YOU/ZaWwAj1ZT3PWXT5HvWtDcW9pMLs8+C9YPeeECMlxx+npJWzyW7LQNoDWXOMa7aeHwylgGjvgtBwHateRQo7BX4V3OthQUqOVPs0ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330800; c=relaxed/simple;
	bh=Q+ULKD6iTya6nNn+dmfSRnlhyOUXt+9Grq3kTmw9x3o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Li7t5CaxxKSnLv38tpxNzksNzL25YUPI/BzohhrxCMmnXyiYK9nk7XSa1lhh0YfBc4VRjFTD5EscrUTL/Mhnfz/GJEmdscU8XN6Neg1xcw0rrrkSeKP0Ul914PKybNzFI3uUNK10tawkJo0fyGEzMoOND3itPmymb9YXk9qFTuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FR3p+D9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INxNKGqc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FR3p+D9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INxNKGqc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693xg84172377
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zUmv+Kp1YC2bVA2CIqAW0t
	tgGETsQh+ZsJgZe+YBT24=; b=FR3p+D9xLZFygJQDgm5at6DsV8xur+MOB8/SNS
	ZnEDU6dl8KgeQXKTJPoCHF9I1rsaC3FkN6g89SbDa/hHVLzyomXmXSYb6EVS9e/F
	Q2emA+y4ioeFrec7kRlJ9FMPuISZsYTAVKUQQbjbZekh58k5x+heaYkXC96yxTjD
	VOwqIonordH8vjj2XCYSppPzQocIPqPO5WOjxLcywFzlLgEUUitCvehwWWcDuu8Z
	L/vay/xyClc6XQGha8jqX7Xpa+KDRoOHccaHnxWL8oKZ5Nw+wP5Wa1m0Ghk45xqW
	Gb33vU2jh9WN1fFAbq3/JQAYzk7TS9yC305GPz/usATS6GGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88a1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:39:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55721a8cso265434785a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330795; x=1783935595; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zUmv+Kp1YC2bVA2CIqAW0ttgGETsQh+ZsJgZe+YBT24=;
        b=INxNKGqckUBcGJ8sUFzhmNe9fjLtHqEBvQ8jwBEjzOMY7L/+EThHMrG30RYCnNGRNf
         x3BtOQk6TPMz6jeDNO8TLkqS15jOKmOb7/p2BBPR771QsQ7lPqeH3ZmWcpEOXY9UVoOk
         u1cknP+KL36CYQ+JQPnnL+1a5/bOTUH+aDmvfMRCfTZi1pbBSy5sEB+Qdc10sdR0MRiP
         IKqmzit5lSUNnvgUNKJH/UQ4wkkRAEA0c/bTIZESUeGYbb8/HCGwSD8ChJVajctqmVZ2
         LcSfT2Ah3n4xMSoqnKmh/jx88wJD4SZdxqHQJRwOqQKA+NvVqiCTZF7W26TShJK7qclV
         /DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330795; x=1783935595;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUmv+Kp1YC2bVA2CIqAW0ttgGETsQh+ZsJgZe+YBT24=;
        b=YYjOsfIu/mqBWfEQR26bWI7Xahh+dRM69h7xZAC0OKpRWgkbaBkrUh4/dKfmInASV1
         CI+FPVy7lf98ghhfhSBiwIgjZ4Rz6SBQM/ZV8ci6h+l+YzQ9Ia54FB+I3ubG4iYVwCJB
         BCnv9tYGxlM3aKpXVEKt7goaK9jRJ9SdRS3eVGhQFBtt1oSry/bhaSzvp8TfrpsnHdpO
         3AKiyBj6bUKN6wzn+H6WkGTgH4D+jE6b6XWnk6hCfvZEWy3Iz0omNNQ+VW2U4HpcO194
         Psh87BmlrZ5LvQ39mUwG/00buU1lqw9Xi3BRVxZR7396kfLr3GshiWDc7nmYfTs5R8ug
         Cjcw==
X-Forwarded-Encrypted: i=1; AHgh+RoQJdN54biikMOHH2lf8h3nQTjNTc4r254BF8kwzXnUdSrevkJYRRRwynWoYK0MwbCXveycLa49KT+3@vger.kernel.org
X-Gm-Message-State: AOJu0YzFBjimOn4tGlldjcINBGX6W9OnlXn4NN3QMg1xasl4j4z3HXmh
	IzWU+l/tyI9whixLdYgi7aLWxwhgpTe+947z/2g7t8ParTHA9YJ7RAypBpJfgKJpj4VPdD1tnya
	VRvsrvvH0i95bncE7hXCbH79WRTlqSzaXVxclwjfVdLbj+DRN2gvcKb6h26F+TVsT
X-Gm-Gg: AfdE7clWqJiLTqG4FA5jAKxBRoSx8Qn7RwIeYv7zyMGTM0kH7Nc/RaTbZxKnx7wLWp8
	sU7YtUfkHV25rJ7nN1GfGeAj11APDy9DN8vU3cyxxPlBKvY4rWZx38e73SdZlmJjV08+2sq3mX8
	IN+L/jom85OkDMpgIiEQNw8jC8CgVsdQvl8oDPn7RE9Zb792tYrNqWArqWXVQuCmYvDI0dnFexF
	WAxRPlfiZJ0igXRr6u1J7z8gLk8F1DZjTBgTjQLJ5K52HYkS5nIcYkEhhdD6BpgdjliyusOm3X3
	F7VtumfnY3lfRUogd6/TfOBZ5FLrEOkddQVmZl3ycj+7HLu1a/smrklJrAN6CxELpHfbg2jUaO4
	raQi6il1jfO0dn2b6xAW5n+5vjFVJGJPfqbA=
X-Received: by 2002:a05:620a:278d:b0:8cf:c106:faca with SMTP id af79cd13be357-92e9a43b60cmr1279594785a.36.1783330794286;
        Mon, 06 Jul 2026 02:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:278d:b0:8cf:c106:faca with SMTP id af79cd13be357-92e9a43b60cmr1279591885a.36.1783330793769;
        Mon, 06 Jul 2026 02:39:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb566csm259144095e9.7.2026.07.06.02.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:39:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: Few style cleanups
Date: Mon, 06 Jul 2026 11:39:43 +0200
Message-Id: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6dkjbRCSuvIdhUaaDVIFKpxAJ4
 e4WPICbn7zk/f9XwRQcsbhmqwg0O3Z+SKBPmcDWDA8CZxMLLXUhL7IAGxlG9D1wXDoCbAlfFED
 J0pRnSyilEan8DtS4zzF8r37MU/0kjPvabrSOow/L8Tyr3ft7MiuQoAqkUhtdY2NvnjkfJ9Mlt
 89TiGrbti+l0yWW1QAAAA==
X-Change-ID: 20260706-dts-qcom-style-checker-108a85dec00a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q+ULKD6iTya6nNn+dmfSRnlhyOUXt+9Grq3kTmw9x3o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3fjsuMkvMIjuFjC/XdExuMoIJHAd3KXGEhYb
 6OnfnTXnZeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt34wAKCRDBN2bmhouD
 1wgID/43r76RJiUEme5FgTB/d24XU54KyOV4uEUR7YcCTeToGnZtDLM2r4ckIj+Qk5T+U6G9I+V
 vHAQkbImK6E0z01gZYYoiz1k8/hcMNC0zLO4X0/S3/G/MlIQyrYk43kOyYUuhxuFvso1rRTqLWf
 g/GcwIh/vAZpjaN6yTJbP6K7de8zRFyz+Rmb21SXbLdKqpkYJJyZ/IZwhMPlc/vKp3DSbp5XpgC
 S0+1Yvu0jBpd0QzuUdgczHRz9NenoWOUqvOJL0FCHO/sB1Ula/YOQgI/ACsD4Ye6ae+ho+et9HT
 zFXDv4R3jZJnTF4ipHpOt9zWdSLT1N57doc8f8jwIVzfUrL+xyVLX3BcZxx4drkU+y3ey+RXnC7
 BPKJxF9A4TgQhMS0b6u5VhAYhgXlViN6eafhiabEKBbc3t/tJqsOAPBofjhI8AzzkPvww1ma/5b
 fMnfh9RhlwNOv9yoveIHIZGhzKfjU/+3JgcfozfWpBd9OWIzxKNurDUAg7RXYOUTBQpQ0OaX1Mm
 m50xfPwlfBKO1LzOauUg+fG99Yz/0UTx3m34/qV/lxoaMHnZ8x5IBSmn+HAnArLnkXxJRoipUiC
 T3tLaHfR2RGGfoVYXQCSl5l9mzLR8EhdEUS6XPiSqzaaQbqJJw+lgtPR6SzHayDrtXq4ns76NtH
 RSCLgNGlj5cx+7w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXyLUF/WhRVi9c
 U9E8WD8wPGwHyxWz3Fy2cDGuFQsG2Sv6byyo3UKxGWwT0jBRQKUVEu2VXIpJRjRGCbYzvciGucO
 2e+JSwgUpJqgpgMRpb1iV9U5QFdpSM0=
X-Proofpoint-GUID: oKvl0Edx9Qg2JxMrMl5IHniMPFNAYAnb
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b77eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_MK1DrSDlyI1SG9V7ZsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: oKvl0Edx9Qg2JxMrMl5IHniMPFNAYAnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX9N5xrpEiEnbz
 TIz7eDAaT/HAD0eU7nD2Vfnm2rxDD+erqSzh9KijlN40P9yXJndLvoKpPBD6C/EH3bZ1r/H6RqW
 jTyJy+mtFX/t1uQdgJWpNPSYvVxa/RTnhYhU0zBya6PIYhaGjPL3PjTbPUqVpZ/UI/mDmkXA96D
 6iwMuxyOiktt6NcAn+lk1OMxA+2ybbIT3L0Vtj5+ZnYhNxPLzTTDjNXZ3UnaOmetD+/xpX+605g
 3oxyD3Clk0CwVrqeab+xZqOpLY6RXeKEUkObG7g+V7GVBjRgjiW99ITamJuIfxMquzgk23TlY38
 H5ixmoKM4QmvK5k2wXt+U1vDym+emEtuQhoDJjtRjs9u32StoEdFWL0Knr6Yc0o3n6YxxVa+XbN
 vRH9zU6ErjcXDX33qs7L1jJSSVblUF/aZybUYlAQfJtF0Sub73G1KR2OwN0eJGd6pbIMJtMAdrc
 tVTkEok0nCbyX+In2Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060097

Changes in v2:
- Do not fix splash_region@e3940000 in Milos (damn ABL)
- Fix indent also in qrb2210-rb1-vision-mezzanine.dtso
- Link to v1: https://patch.msgid.link/20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com

Few style cleanups from my scripts and one thing pointed out by checker,
which we will roll out gradually.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: Use hyphen in node names
      arm64: dts: qcom: Use tab for indentation
      arm64: dts: qcom: Use lowercase hex for unit addresses and values
      arm64: dts: qcom: Correct whitespace around '='

 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi      |  2 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  4 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts          |  2 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |  2 +-
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    |  2 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |  4 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   | 20 +++----
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +-
 .../dts/qcom/qrb2210-rb1-vision-mezzanine.dtso     |  4 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |  8 +--
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  8 +--
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 14 ++---
 arch/arm64/boot/dts/qcom/talos.dtsi                | 64 +++++++++++-----------
 16 files changed, 71 insertions(+), 71 deletions(-)
---
base-commit: 5c92e2084d711fb164cddf9875ad9ce849b67177
change-id: 20260706-dts-qcom-style-checker-108a85dec00a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

