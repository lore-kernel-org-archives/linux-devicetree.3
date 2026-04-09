Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF43C3B19A3
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726496; cv=none; b=LF3Vb0vfhGnBS+0uiaEY7hg2BvxOZQunUvP8Bu2bZkDV6131TFq34sy0hW2k6jqTKOTcrqkDTKXhGc7KZv3GEZPY7W4UXEsOE6d3QjbJ5RK1iQia8q/71Z9fsofZNl7Ttq/MgEIqJZOxEemF57YvJDtbyGT3MfKQvx9SNKZS3S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726496; c=relaxed/simple;
	bh=xPEY7e6G0jNQPuQ3MB8G+gen7mL7+AC8DsoOENRbj80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OUTX1a1q2ykpjwtOaam2oekAyYLdygt0dJQN2ZngKmpuVBj/3GY898Id48nSkvZK+uX8xpWsmaiQNSpzVjE76oxpCYmsWlMzQHYkc7qEGUFYR+/qHWNIH1A4a6nvyLOE01H+v1DjAfouO8W3CxfRxGzYQoUrY7yUuO6w9FHVW2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2FqN5GN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIFUvsRk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2FqN5GN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIFUvsRk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6396gVYq4047315
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+5Ll5lRHBQwvD5gJ9LTn28
	IhpipfU0fEzspg4neK4Ug=; b=k2FqN5GNAHMsgo2ujdxy9WmGoXsbNUhScgR0un
	bIQIQMvvqafbIOn4s6LstO435Z1fM/9iqVSQeJioL39VGm13wa0qxmHKmIDFkM1Y
	nbasudtrRBDNxgmISElIuXX/dCeSP+uoRyzpWwb4N1J3r0SMb5NHA1moiFj+FyYE
	TNl53MuMZHznNkywshr2Xmfg+4W8A24nsHOn76hdeMt25R6cVqhiPLbKpHGmBze7
	Zi4P1UsbAowH/szn0VPIORrVwPEO3bMo+nbtebyIQRcKH79Ri7zbyJMuPkwlShoB
	KYQzmV+D5+TGHx9uDP7X6pRadngtib+UKv1VpAosMuELAweg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtd73bqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:21:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2497cc190so3483255ad.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726489; x=1776331289; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5Ll5lRHBQwvD5gJ9LTn28IhpipfU0fEzspg4neK4Ug=;
        b=iIFUvsRkikzO2ZF/15fdz/5TxlBzntsvhN13svhMO/tyooGYYPtinCpr/JZmJYXZat
         IyrPT84IbUBNv79mUO9pc5Z2GlKsK52lXxAg0Xw1+202QY0R1hdyVoo4go+a+Zu1zlgZ
         y+TH+NQALui+t1+mdXxIyhapIQu8m+UISuKagY0W1vG6Z8St8TDnJgM2N2IZ3AH81TWP
         2Q8z2oC5ukKo5rw4WNFLYNWYkiXP4bw4cxLAVlWB2Sks9UcDOx1Bs54xmJPKPeBusZrp
         1E8ynmwR3qr+1osVy6UU4GJKuzDlgXlThUOF8OEylhI2reTgD3WkTYbdkE+hEpYLzCCH
         ht+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726489; x=1776331289;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5Ll5lRHBQwvD5gJ9LTn28IhpipfU0fEzspg4neK4Ug=;
        b=IMgZsjuM7W/DOUrLxHTkuhkO81Ij7+w288IzF893PL0+h6Rf0VmTv6q0EKM03zWAzH
         LW4En53OMNqh9DKP1ejKrKXb+2TQTdk8P9W1/71t9szmWDi7cOvOJgs82oHd4jECZ6ot
         o0yrcbdvO/F6xoeal0GJrwSx34R/5HdjRku0aRwDU5ozFgy8cE09IAbxj3MSqy4RCJgI
         Lo2YFbn/ClqwhB/QR0e4T1Xl6BZLULOYE7a1UcSywVjRhXkRWSs4NaXTFBoTEebC5wmP
         CZtifqcTB9Xp89wWY+dryLdTI4dZk1ysMSriDHftJBcpD006BzGvcz16Ju3RaF/VUZg1
         x+eA==
X-Forwarded-Encrypted: i=1; AJvYcCXkH/CPAyq04QygI5Vaj5UjOwpRSghsMv7iywJV59d1OEO4TKuXheeg4nGFVtTbA9Upj4hLFv/nJgYn@vger.kernel.org
X-Gm-Message-State: AOJu0YxVvx0iz3vIBzNSReu2QHcBNIrMrDvpIDqFJDj6MI8JHM5sUXYB
	gfolvVdmPUdhPTk1rsnTOA1np1FPdGNMNWHn5frAJetDxKthVgw/NTqhhqvR2OrrupikvNnXIxc
	RCI4qbV7QlqyrE0YO81r1qGRnAXLnN9E9EnH3EsmWUcAGkoII7lKNniMho8q5Hc3y
X-Gm-Gg: AeBDietn4YPpwOehJpBeaLYV8Sfs4LScUdSUBV8HWpvu5b3fZnVWzfyllDwiWfYvrIy
	UJVqHdRZr+z6NdZyOyW2VDBzyPvZlTosSx4ZUfnStvhwNiBG1F1iL/8GLR12xF67h1dXgtBij6D
	EWv4a4jkAyRxxoAYQyCC2zyaJ5ovMVVdGiaUoV8q/+0xvOYPCFIDjcfL2PToJck00k/bIzm/O41
	O8uC/s+QRfn0ODtACmf+9NhcIqBj12S5tlOQo7tl6kitHK013LWJwA/cRiAT2GUgPSa9+9HzwvR
	kXnWfzzrccBlm7Hk0sCHJwBTX+9a1Hav/q7EhLgvJ2t83tfcUuJC68ubwOGwWCbuCfCt3LV561Q
	QunSm/IlS3raLvcpUpzhej9S0VWZ2R5XHoqlMqN4rc8uwLC4uO4hh
X-Received: by 2002:a17:902:f54d:b0:2ae:5a38:96bb with SMTP id d9443c01a7336-2b2c722f39bmr27118125ad.2.1775726488953;
        Thu, 09 Apr 2026 02:21:28 -0700 (PDT)
X-Received: by 2002:a17:902:f54d:b0:2ae:5a38:96bb with SMTP id d9443c01a7336-2b2c722f39bmr27117795ad.2.1775726488469;
        Thu, 09 Apr 2026 02:21:28 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:21:28 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v4 0/7] Add support for videocc and camcc on X1P42100
 platform
Date: Thu, 09 Apr 2026 14:51:02 +0530
Message-Id: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH5v12kC/3XPyw6CMBAF0F8hXVvSB09X/odx0XaKNBGKrVQN4
 d8tuNAFbG5yJ5kzmQl57Yz26JhMyOlgvLF9LNkhQaoV/VVjA7EjRlhBOKd4GN1T4GBAW6WwEl1
 MqEtCgDRlXQKKm4PTjXmt6vkSe2v8w7r3eiTQZfr1KKs2vUAxwZJx0HkJTS7FyXqf3kdxU7br0
 hhoYQP7UZxk2xSLFEgJDFheSSh2KP5H7XwZeKQKEErQiohM0g1qnucPno3HOlMBAAA=
X-Change-ID: 20260331-purwa-videocc-camcc-d9700d0f797d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=QoRuG1yd c=1 sm=1 tr=0 ts=69d76f99 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-aA_EJKQ9c9Fm2tRs6UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lbxODyL7EInLzTVhtKw4Wp2Y8ditHcHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfXx5HBa7mzwxTz
 HhBdkmFFF6CSoS0bTbqRd7VJdkuVnk4KJMMnKg3qWr9valYVsvdmy1xYfaMJLtLrO94J9rbToMf
 WKYpUOgv4gteCzvdHesaUSYU8Me1kXMfspLto4RjTHsZGvM1Tce84MOyoUbOLMhXtFt9wYrUqNK
 D2SE+SJBTI9ODpHB4pJkxpOfO7rk3jVk3NSLtHCuroPdFrBC6Psu1c6shqKPeheUufOcvY1vNlL
 VfETmspMmBfLVVXUB+8uWuJOpO65lpxRH13RZA1iDLrqHRDjPHaJzfbZxoOf2FMuE46Q4qHb1VJ
 kdcMyuLdp+WkVFa/feqj9n7K0n9w/YcjwhJWYGnK4sb+kW9JoHTlGYq68YqPHVd+dxKIy+HPygm
 cGN2oFwPcqSfUoX7iDkh9eUJjYTeCayUpurV5hgg08LBk2+ohhTe0iYRFcmDSWWuyXLBOewULeG
 HPT4RKxIJvqkZbOwTwg==
X-Proofpoint-GUID: lbxODyL7EInLzTVhtKw4Wp2Y8ditHcHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090083

Add support for video and camera clock controllers on
X1P42100 platform.

The purwa(X1P42100) platform includes the hamoa dtsi file
and camcc node is already posted upstream on hamoa(X1E80100)
platform in Bryan's series[1]. Hence included the camcc node
patch[PATCH 06/15] from Bryan's series[1] and extended it for
purwa(X1P42100).

[1]: https://lore.kernel.org/all/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-0bc5da82f526@linaro.org/

The camcc node was added in x1e80100.dtsi in above Bryan's series
but moved it to hamoa.dtsi in this series to align as per the latest
changes.

The series also adds the camera QDSS debug clocks support for X1E80100.
This change updates the X1E80100 camcc ABI, so X1E80100 camcc bindings
and driver changes need to be picked together.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v4:
- Added R-By tags received on v3
- Included x1e80100 camcc header file in hamoa dtsi which was missed in
  v3.
- Link to v3: https://lore.kernel.org/r/20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com

Changes in v3:
- Added a sepearate new header for Purwa videocc
- Dropped the fixes tags added in v2, since no user observable bug
- Updated the commit text for few patches
- Added R-By tags recieved on v2
- Link to v2: https://lore.kernel.org/r/20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com

Changes in v2:
- Dropped new header file for X1P42100 videocc and included
  additional clocks and resets in SM8650 videocc header file
- Updated commit text for videocc and camcc driver patches
- Squashed Purwa videocc & camcc DT compatible update into previous
  camcc node patch based on review comments
- Added R-By tags received on v1
- Added Fixes tags based on review comments
- Link to v1: https://lore.kernel.org/r/20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com

---
Bryan O'Donoghue (1):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition

Jagadeesh Kona (6):
      dt-bindings: clock: qcom: Add X1P42100 video clock controller
      dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      clk: qcom: videocc-x1p42100: Add support for video clock controller
      clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      clk: qcom: camcc-x1p42100: Add support for camera clock controller
      arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100

 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   17 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |   10 +
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |   20 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/camcc-x1e80100.c                  |   64 +
 drivers/clk/qcom/camcc-x1p42100.c                  | 2223 ++++++++++++++++++++
 drivers/clk/qcom/videocc-x1p42100.c                |  585 ++++++
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |    3 +
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  |   48 +
 12 files changed, 2978 insertions(+)
---
base-commit: cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
change-id: 20260331-purwa-videocc-camcc-d9700d0f797d

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

