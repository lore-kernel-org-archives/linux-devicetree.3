Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604731E853
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 04:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795147; cv=none; b=Qu/2vTFHye2YuSoeeK60QXzizRKkhTmdWaELUOe76uoMUATDi1ejAgs/wc0nCvRL5kCUpetPNJAp1FjjTuaWmHgtKcQrxum5ku1amM/iv6+QHJUJgTxmVQAoBkCuotisOKKA2/XIbpOUgpbc2Xp0q/uMW1nQj5FGLoXoGGirZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795147; c=relaxed/simple;
	bh=afMyCl6q80b5zE2nccWBXEOFfRuZfUdUC9CQcEqjYC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OSCcG1bcYvqJmN60G6zx5+S3deUZabBNFg523NbRw3FCVQk1KlWqFHPWQe9ct1fAt3yxCS7fX8buh+V1c9JDRxqBXpenH6j0EH1WF0aEtmSAxu8E76VU7I8CTePnt2Q43N59Pm4y5/DjbmDIvIognXbvGTTwZjI+sSYkh2ppTWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VErWMXR5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKyCbrI8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VErWMXR5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKyCbrI8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Kbevs2629321
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 04:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E+x2pfKVCYAegJiR8tU4eX
	nRaVp98QEUR06OD9JbNxw=; b=VErWMXR5BaE8jHyIAsg9HhX/85oMt2SUzWRIJg
	uzjUgIDencPfbD6iLBybA7wdU+LG1dxyg1iPgrQC2Fp5VVlEmnBUxutRvhIcimvc
	1lsp1C7NTyocrsisz8qtwl4JYITbQljuY6WAH3VsgDYzm6U396BzNUcoOCuwVI3X
	bhuQiysXDOONJ4yah9ZJPlAHjqC+pEHEZlDcf8YAl1BTsCeiWvkwpStOEoHuQA9U
	BlljhiBLOsVLYK/lpBoGiCf7pIhPGbZzpV0YXmLq9mB63XXDgqUEz0PUTiJto5/Q
	UNTUSkBQjuukkOX0g8fx61OUxBDkM6fWmwAVivtSQBdOtqcA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu2nb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 04:25:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a1f96bf221so57604156d6.3
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 21:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775795145; x=1776399945; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+x2pfKVCYAegJiR8tU4eXnRaVp98QEUR06OD9JbNxw=;
        b=dKyCbrI8mrwmXYf+rXvaqG6PrSRn/aPP5qzUvWeL6NomTqs87W5sB/dQ7u+wpMNngh
         7vw0Gi81/NK7o5b95G3g2j+/dTFSPDR7safIN0k5V8BTAqsZnijzx/uKA8gjlart47M4
         FxMSG5CH8ZKYrQ8pTIXkxPLcCj6eiKz7IoQ7mGbF5kPgId7UAIl64xSQ6w2rbQF9lzEA
         0wAo+MV8hLvxEupjGZztyjEqprNP8D0KVoipAONdWfkE32vRLdLrMuv7kguj/wL3ZynR
         wDmtIulTxrPZ+RC7M60R0wzwwMmnP4jMTWkMk2J8Lv1VjSDPpNEhMZ5OBNxdHaYadyij
         atDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775795145; x=1776399945;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+x2pfKVCYAegJiR8tU4eXnRaVp98QEUR06OD9JbNxw=;
        b=DLC4ZBEDUTUmLNxe7XAEOL93OwzSrER059NdPvsZOIGUT8wfsctxe8c8BBpSv8GlHo
         JcI7x1PJiZqsw7m6L48Uo/BaUh0ALSEc/taQOAcvSrSclRYlri0tkDrLEINlDLSLvPY4
         G8DON4kbJ95G0l+POXl82tmwI5WOXDCv+IQJQ3s1PFB6rXqB8wm/VAR3yLRDg/1wkWfG
         NKe+kB+bQYhmuX9mpo4CdnxqMOxEKhRDeftCYaifFa4Qx57pOlNn8oBcAWUMCrOodeyF
         UpQLijI4KnzM0awGboMET/DPWfb/UyS3PUlvPgRcL2VGL38vHzb6gMEBtTlWtUcexipI
         FzgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcAVxDxseU4lyQu996z2MxmDw8h7RXOYvoev6zHDxF3/b7Q3Zrh5jFoQ7xfLf9K0t7x2bL10auvAP6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9WLdckBdsDZDOvQllQXg7qvZBWmk+0dfZjq3OOIncBr0vi//4
	ATihO4vHimaHRmj/ZAhJvUAJli/b30dMwrvYyuxsgfeUJ2PhXK1S/0Y+q3zt8cnZgKfl1U4lc3I
	vHirpwDvl2D8R68WbVHvUC/uwqruE85C5JEh8/rn7H8pTs0WGQroClpVIJhb21r9s
X-Gm-Gg: AeBDieup9IniiYlNOh/1ATpSzGnHy02LCWFL9S44KkE5zuxzelFV2dQCn7iOz2HhP1T
	RZDdsBhRAmQzTmCDzpdnybdLIxcx5lertrBY/M0Ztk3CdtjvdxJ6fcx27jBtdggu3rj4XTL6Jbf
	QeK2SWEAewQ546TiQS6/9bmp/2oYAmgyM/82rHPv7BhQ84F1x0HPnhhb6TGiR2SD0ptp8AHslDh
	70QdUC4q3A2uFqMrIqWmfGU4CY5S+5XI+Czby706k7ABL0XnEKRRd3RX6hg0d5/ZpFWMMXGTJmc
	HYlEvq0ZwHyepREaPHqHgO6ycDU5yPL0EfhSSWxnHilwVDAGqUeyElU28XpnoTl8d1twDTYv1/S
	XbPQ3Ra0h2o8Lmyp5PirnM69VqfOCCCsEbGkVkDV6otiWLCTqz5v+T1IoorfC7eKGdZqJjf9Ys5
	OoWwLUDBtfy2Xf
X-Received: by 2002:a05:620a:468e:b0:8d8:2a0:e17a with SMTP id af79cd13be357-8ddcfcb2d46mr231434285a.50.1775795144719;
        Thu, 09 Apr 2026 21:25:44 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:8d8:2a0:e17a with SMTP id af79cd13be357-8ddcfcb2d46mr231432085a.50.1775795144215;
        Thu, 09 Apr 2026 21:25:44 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb934d8e9sm121757785a.35.2026.04.09.21.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 21:25:43 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/4] media: camss: add support for purwa platform
Date: Fri, 10 Apr 2026 12:25:30 +0800
Message-Id: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALt72GkC/22Q3WrcQAyFX2XxdQXS/Hr8KiUEzV92oOt1bK+7J
 eTdK9sXpSQ3A0fofDpzPrqlzK0s3XD56OaytaXdRxH049KlK49vBVoW3SlUDg0GmB7zb35NfFs
 WMN763sfeFzKdOKa51PY8aD9fTj2X94dA13P4jzlcDqLWdBJha7ncUwIhy5uDR8xYffB52A74F
 6uykKfrH5h4ljRQnmsZ9/hga8ohcs/V0bDRV7NFTwhPKpCWpmCHVGe0ic5S1jxs9juPJg3RwK8
 2Pp4wyjmQBKhBxnld2s7rkRDhLIcsuupNjAeRjhgTr+l6EGOyMWhFiZThmIMjLlQdOsKcjPNIO
 fXI6X+Xy9rVwqxZySEdqlTPxjN7Y5RmsUkxNbpv4pNS7kz2uk5vEGVdhz7Kl/d0uDsiL9LI/XZ
 r63DJ0ZeaiuEim9kWo6qt1hrVV6tCrU7F3lWO3cvn51/FxIVbRgIAAA==
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775795138; l=3887;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=afMyCl6q80b5zE2nccWBXEOFfRuZfUdUC9CQcEqjYC0=;
 b=CdBvw3hrELo9xP28PYSiKqqhcA5eiB9AakDjInbtyboiDdpVfoZ9GnV06wYlndEMam1zmJZh3
 Newvpy6/FIPD/acEKDNmDOcxhtiHcUpXWhsBZ4zCiMsn0tPzVnvEnFp
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: Hm62u84hbtd6rLmj-FZGzOR4CSn4P4SS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzOCBTYWx0ZWRfX/iesdNU2DQ+4
 CLD4biYSQnssHZlaGfWmeomq67OdOEu79L1NAvyFe65CidAZFq/yKJ6HS6qiNsvic5BJtRC2LuC
 XsyoyADxgLzBsEoIJan6iJZDADDZtt99Ta0qJjHhky6l5ZwjoMxVl2xlYYtcvZPoiH6YZDEoDQR
 wZlz//xmZWLGfnZVLGZc3T/EvtB9ELN/Zy0dnRHYGDGWkXJAspqd7FHF06OxKguVZxyMZiCGNBo
 qNtB6AKOwyRZnguU4PPQ9yhLJLOj4ClOrdN2vu/pLgY54iopxPLBf4Ei1ndn6ixD/9TGgmomikr
 S7lvPrkPTOuaEm7k/dmKGd70a7RO0F1GdgZE/44SphmLoGaQc0quWWCBMP7heNiI4Htv8asOGVX
 HS2WlowmXkcLWhBq3fkEEfVZ1wkGUJ1d3d+08btPKIdAK1OwPB8IQ6O8mnzYVfNWuKuq43vBxEF
 MaT8FBaNKVpA2g2w1Cg==
X-Proofpoint-ORIG-GUID: Hm62u84hbtd6rLmj-FZGzOR4CSn4P4SS
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d87bc9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Qb1CgdutHYG83UUbXIIA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100038

This series adds camss support for purwa platform and enables TPG for
purwa-iot-evk board.

Have tested with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":0->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
https://lore.kernel.org/all/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org/
https://lore.kernel.org/all/20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com/

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Wenmeng Liu (4):
      dt-bindings: media: Add bindings for qcom,x1p42100-camss
      media: qcom: camss: add support for X1P42100 camss
      arm64: dts: qcom: purwa: Add camss node
      arm64: dts: qcom: purwa-iot-evk: Add camss node

 .../bindings/media/qcom,x1p42100-camss.yaml        | 424 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts         |   4 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                | 158 ++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 109 ++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 7 files changed, 700 insertions(+)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-purwa_camss-475787b87e14
prerequisite-change-id: 20260331-purwa-videocc-camcc-d9700d0f797d:v4
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: 2f4d4c5c118e057c76e6d2785479df01d5bc1c7b
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
prerequisite-patch-id: 66096b909debe4d942eee972948d5a138a5be427
prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c
prerequisite-change-id: 20260325-dphy-params-extension-5fcd9ba8af61:v1
prerequisite-patch-id: 471e9403130bb3e65cea1d2365d75ef664662306
prerequisite-patch-id: 075fa72fba3c4f51138b88972e6a5e240038d90c
prerequisite-patch-id: 4edca361ad7d370a338641d1ebb5ca65b114a244
prerequisite-patch-id: 32dd1b55ba678d00088b376e33e12d9da6241aca
prerequisite-change-id: 20250710-x1e-csi2-phy-f6434b651d3a:v5
prerequisite-patch-id: 5c8b5c0011e54921bcfb64b07f0468977f44290b
prerequisite-patch-id: 22e71ff566976c8333537b09b2721116acd267e1
prerequisite-change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a:v11
prerequisite-patch-id: 6e8e67cd3ab96a602971bbeeb7dfdeaf3f1426a2
prerequisite-patch-id: bbf431fcabc17c30fa5e804eb4accb8275198b37
prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
prerequisite-patch-id: b6b6c4e7a5818e1b93fe2758902bd32d2be48509
prerequisite-patch-id: 4f11e3d079a484008a03ce750952d6e2933c0253
prerequisite-patch-id: 5f5504fd7b5eee72c3fb8c045fa57219fd2f0456
prerequisite-patch-id: 570b65b326f4c684d813f6ebeda152378dc2a47f
prerequisite-patch-id: bc5b9321c124abd961ae1f60610dc46701dc80ac
prerequisite-patch-id: 6d36feaa3a210039f87ea47aa74423a670260fb6
prerequisite-change-id: 20251226-camss_tpg-b23a398bb65a:v10
prerequisite-patch-id: 520491f0d518f3463d429e77444e231fa6016dd9
prerequisite-patch-id: 459fda84ad92fcd4a497d00ce1690cd19f2cbacb
prerequisite-patch-id: 82330aed01b91c49acbd577ba75bb73bcae6ac90

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

