Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC8C37C904
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252583; cv=none; b=H0JDGXuZdSPbbLwejg0oe1MFDx9LRqffuYAo7Dgme6LZGwycwpVaLCjamGVBk8ThvPOKBquXgXgEovYyHb3x5hRGrvjNTyA0YY3pIOycXrFf8dtIGCfeAJt04W47Z/JwmnsgeXmpG4GR+plwCTW+IA1MsknfKUSy78GN+DOcjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252583; c=relaxed/simple;
	bh=zkTj1FPBTPay2KEYBi9VK1EONkKuBT3XGTuds7WjW4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IMJaK5iBiAJA9FAzWDB0P1+s42AaeDbsb+Gn+pfFrgv3rVcfNXhHcFLp5XjLud0/yIz25TQhNYTxgUW95TZBg6pz0UE+/emKy/shwV3XedmK8M+8nhRqwg4ecNu/KKThToRcIBdDpONl3QbxqabeKu+WkQjSzRKyRTJJ0+DmyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmIWpX0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnPBc1+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmIWpX0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnPBc1+w"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F97vXD4052902
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MvJqQNQOqBECWN6GQMmqlr
	hF5/Geu/mthKKLlru98gk=; b=ZmIWpX0RnxT48IdcKUnQ+i1bqGgW77TDmA5m4S
	VtEfxVwA5r8WgE1UZWPN0mXL/VWkyD8W7/jzLWS2MlinOYXZNB7TaXxRC8G0W1QU
	BRvv+jAaAIF258zVGwqBhY0a0Zdcfs+PzFquPE8JACPGO9PnSAf68NL73hn1uCse
	HCxfCpXV49jp66/xlzhpbA1Jug1Bffgjw/RvpuxffWYKvm988HsvVRMUm2Gf0V3r
	6ENMn/dJwvdfeq82+VHxXgQ8I91J0ECFenFP1HkvtbS5/WGnK6nuGJ+/T6oq8Y0u
	/v8BBXCKI+Cgint9cntsZRb7DNhOfox/30ABJN0cwMgHAOTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7s5rde2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:29:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7948640854so1243105a12.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252581; x=1776857381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MvJqQNQOqBECWN6GQMmqlrhF5/Geu/mthKKLlru98gk=;
        b=TnPBc1+wQcradvZgvJ3gP0PifJHUkO+28oCmrkvbiIPRCnqsjyrZgQkAAul0nFs68I
         Kr+yxqY4t9clu9jjLfhr6y3DS9SPmszEiluEiJT3yKT7d9jGSOO9Z2rftbYjZRgND2QW
         H7DTLFEC2aLwNn9qVYtemdrqBDI5MV3bBNoGPnpLpnLasT0XQa4d5EMSiq1g1SYvOfLe
         AQa8nSnF19Y/1R+NuesaIWKmZ3F+3T1IlyX44BE8WhyX6wjbp9SDvCN/fSkIGf+4/xRP
         yix0h9aVLLTJteGmbNlV9FMPQ6v6wMg+F1FNUmrX4XpM1iihYYu9Rszs49ntnWWq917D
         4GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252581; x=1776857381;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvJqQNQOqBECWN6GQMmqlrhF5/Geu/mthKKLlru98gk=;
        b=Jdct8Gx54gdnNgE1dzCmQ1JjRtq/RSahJKMVLn74h4j75p4FZmcwhTej9X7B+YptaZ
         1Mv+aE4lGju6LYZCgDvN9PG8qa2vLnDptEgkjlPFYw5zYiYgJorLitByO8DU59zrmAw7
         rJrDUaORBsP51q8gTK4pC4XYCcIADddPP1hDbFsQV4iEsm8fBpQn7ix9AK7tZlA0GT81
         f3Qh89TLTZR8t03yiJepfFeTme2wEJy13zy2iK9XJ1/Q6fCphKLQkPxCc3GsLHi37zaj
         roZJoDYshxOaj/+BY9I8iaq6l0WbcUqQGhJHf2Dht+GEj1ZUYBOD8JBJE4Lf0uho+kkZ
         +Pww==
X-Forwarded-Encrypted: i=1; AFNElJ+/D7XLCXLCmB4blgoB1BMqXClURqQBqIyVb08BExTzryXgbDE4iAz6F+uF4wMVTE6R4INJmYyHgfaD@vger.kernel.org
X-Gm-Message-State: AOJu0YznH6ETQpdtGK2MiDUjAJVG7taEYov1AuEdJKa4s6L5lEVf+EGD
	GlLvoJN8Edkqi97flStRv2vbBYCQj/zqM8rImGQzlZEcg8dUFeMGBpxVo/BnxccxaUHuYF6jUQD
	NMvPTmLRqic+yY75ARNMNQt6Q1KodSDGiDs7MOz0j986jilljqNC/Y7tsghFsHjW5
X-Gm-Gg: AeBDietguKoZHoL5a8DjSgoXFx2ki/TiTjaqr7eTJmi/NfBrGt0ryUWAmhmzl+R/tIa
	0FJYNivhsikSXUIdi7+Xx6NG1hTAISY0uDmPnK0JUoFtAPTutVdte/Wx56kKAA6/E0UzZPYwsLF
	sc1Iz7sFKkIEpEV16AU65Cbq1pLO7IIDN/V7Ki7F+I0m6dpz6WxOf4kgG/wHv9WEsOHQM3FXWrf
	Z9nLD/IJMpSm/ytNqoSmGC9jdM9uLZDvqM8zjzmbN/RxORilG5ogheEN+YnXP37vofRvSawu5an
	5V98DrLI7lIVVkft9lcDYF4TipIRjpcXs5n1JpMSS/MIhEJuYb+R5VV7Yqv8h84r28PuhStbnOZ
	ZAFYXm3tcw3cjkqert3RuuAth8qMs8dyD4TbOBXJykFjtvyGgKlnaKltoNEYe4+PeC0BwdMh0j0
	pPB1MTVPJ2JInBTkERUu2lG56k/L/aTuH3Ydm6BLXufFzBDQKZqhGqWMos
X-Received: by 2002:a05:6a21:1b8a:b0:39f:27ab:2438 with SMTP id adf61e73a8af0-39fe400280amr25183969637.48.1776252581410;
        Wed, 15 Apr 2026 04:29:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b8a:b0:39f:27ab:2438 with SMTP id adf61e73a8af0-39fe400280amr25183939637.48.1776252580924;
        Wed, 15 Apr 2026 04:29:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1417183a12.1.2026.04.15.04.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:29:40 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Introduce TLMM driver for Qualcomm IPQ9650 SoC
Date: Wed, 15 Apr 2026 16:59:23 +0530
Message-Id: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJN232kC/yXMTQ5AMBBA4avIrDVpiyZcRUSqBiN+W0Qi7q5Yf
 ov3LnBoCR1kwQUWD3I0Tx4iDMB0emqRUe0NkkvFI6kYLWuqEl5uwzgyqYVBHavGpAJ8slhs6Px
 2efHb7VWPZnsfcN8PqYuTw3AAAAA=
X-Change-ID: 20260326-ipq9650_tlmm-2a1cea46fc91
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776252577; l=842;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=zkTj1FPBTPay2KEYBi9VK1EONkKuBT3XGTuds7WjW4E=;
 b=gct8cnLRX2BpHIVUTXwooKifRVem7Rf4JL4pVZzEVlUXczvn8jflm59sRI8dfrdgB3CDzpwGH
 v8poMwWur64AJaw6PExA/eu3zcflRzfWJtngtRWeYTW7b4GDdm3l4m/
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=A7Zc+aWG c=1 sm=1 tr=0 ts=69df76a6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=udllaobD4nFk2SGM0x8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: G_qFqtSw5GL6Pqxe7lDp0l9RW3wSEhjR
X-Proofpoint-GUID: G_qFqtSw5GL6Pqxe7lDp0l9RW3wSEhjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfXzVSjPwii3pFa
 s9xRoxzaE5uTLawtL8EKYDZqQyJake5EaMpuWScZVhYsus8mhjX8RwpdJU446ZfVnRnG7rEynMp
 fdIAIA6+PduXEDuU/HWjX2t9lmOBUh1zBh0jh2IFAwMtmUePJoGkd2pPYHZKZRGKbMTmr0CHwZB
 HW6zVuq4ejrauOdkP8DIdPIHsAEL7IAkK5C3N+3QY3+S19OY0NUwHbski5mKM5WmUuC1TAcvP7k
 H8hQ0SVYEphNh9p+96zK5qHNB1UlcQoFkqrXt77OIUyc4AGc+7CduCrtz8d60e+6uCjYrmXMqhE
 d4H4XjOXx+wUKYfmpMqQS4xxSUqEPSCtzIvGiNHK5x69XjlWtmjxG4VSQTOUpoCNL4YnMHX4VVt
 iAMboqddh+kBIDeV2awJadTWBNP4f40SXYJcvw1Jd5Ly63PEW3m4faNau8oURz8DX3Lh4hGrASi
 pdIm53IYGgYi1bj6f/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150105

The IPQ9650 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ9650 pinctrl
      pinctrl: qcom: Introduce IPQ9650 TLMM driver

 .../bindings/pinctrl/qcom,ipq9650-tlmm.yaml        | 118 ++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   9 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq9650.c             | 762 +++++++++++++++++++++
 4 files changed, 890 insertions(+)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260326-ipq9650_tlmm-2a1cea46fc91

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

