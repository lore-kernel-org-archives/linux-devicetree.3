Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15793B19CD
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024655; cv=none; b=l5S2vZyYa1Ov9gZFcwhRAUiJUTpcF239/KIycJThDkuR+WLVvEq3F1gA8si6qs2a78FSieUXvz7Vn8HGPEnDjK+q3bquYtHvwh2r/2PNy4D/53Z5tny8ffDjqkNLISzynHLs9QOZju0IQrRiWWe6NWcpE6VoBAw0eIBv+DwolCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024655; c=relaxed/simple;
	bh=f7uGfWBPhAPEIOwMA/ZXAQa3n2LNQ+IP7qQffPRMIsk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n333CgSxR12rbZ/F+dVBb9aI4iF/PssZRUuRt65nkdHIywNIBZw5Nzi+QZX3th8qDVp2Ky9fK9zj0AfBmxUOfRRP3Uga//BuzVtJKr7wTLLx6Vx4ojVmKmmEwAHDM4fc0y82mU82Vi6V8IVXN/zVpgYYyckZEKHuILrMtP5c6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKIbL1bN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeNV7wUk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKIbL1bN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JeNV7wUk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GODY62748499
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 17:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5+3W8CpejAaawVyvTeR8WW
	M1plkP0ngi9KhMkGJPpxs=; b=hKIbL1bNZVf8hW2l55rpBtaTdiAUv/BwPoLKWD
	QE8tB+BqpaheGUcSQson+Tp2VBodBJh1l2WjvnY57bedTT70wlaoIxodhN75Cz2g
	Ez3OxFdO8rAr/azVsES0qUkv/GRznwWjtEmuqb7R7LGcN8GXS2uWMrr2X88AG793
	JmC1y9clVJjZoI1xLDWbXvR2XSoPZoLSa6oF7fhJTtUaz2hY6ccX4ZBmYK8QX9Z5
	Lnmeb32+Zsr/je9Lc+waMy/k7xq9brdnCPNnnO/aGBy0h/Kn/YZo0GXRuVb52t8w
	SHHAafRll12BAKTo4fKMLA8jvAe0kam8RH13sBJLFvY84Qjg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeeu2nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 17:04:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c857ebbb0easo3826825a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781024652; x=1781629452; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5+3W8CpejAaawVyvTeR8WWM1plkP0ngi9KhMkGJPpxs=;
        b=JeNV7wUkltjH4bE5fzr3G7Y4qpCGn+xtwjwyLXj3bRjnAGILjh4Hb0BBsUjags2onu
         +3VdSIJr5p22xJJYzfCE9W/B9YngNGZ7uukVmf8Dc+0bhe0Ajjf/n0crrqUHcxwVyI7d
         qUw2DAB6XoxnLJcyAHiOnSp85WvsR2JK9OuVyBqZ8aXsNr8wb70QKu2FAwDo9f77Q3ZA
         Hi3QHfVPlBvQNJk6xGPCwfRscuneSSPmN0U407otMoXX1vuG3eRqgmpJgvJcX4RTKHon
         nLWdZdh2Uj0IgWO1pbkc4IZ44/GADhIPpdATiMshxnal1cDvB9MujvPD99SjwgeuLe5E
         98Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024652; x=1781629452;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+3W8CpejAaawVyvTeR8WWM1plkP0ngi9KhMkGJPpxs=;
        b=e+L5PIqg1c46sZoxoXe0ry66iGq221zitj9xBe14AfDNpoTRz7wEgYiXILZ0cb6oIR
         Q4tEmskiD4na1wfrdIbLAK9d/2/Ttyg+HlHmAOTrnbdMqGnz3gSP/Ju1dxYC5EajBFlA
         G8goY/IC0aJetbYJzyIlU1pYmk96QXW6VIZC+CCyaXZrBsTBLonqtzyVoivZhkCYFO9W
         IaLEecXqgbYWRp/F/BUPO7wUljtlCxELsTKM82Flyy3M7gTgQss+yFfbmXyuXYuEhk+v
         PEG7rnfELYeQL8obpN6t26K2DE86xt4G3OwsKEnVPdR6CPWveWBjeykJyNJgPWk7lyA3
         wJTA==
X-Forwarded-Encrypted: i=1; AFNElJ88hHSRaikESgzpiJM8xeqhotwyhsTf3zP9Ldr3eTjdh2tq1d8sPAq+POhPmnJRv+kvdIWUrirvomSP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/gqibYYE302oihfONdwKaUpntMSfdwOnRc36V6Mp2ZXIzKPM7
	MRBNwzoqli9H7SETedIOy32lB5TuyAk4PjYjiETiDXgw/RrUMgnXDnGnX/YDcuXBBgwSqqbgg8X
	6xtTknIDT08QhLsUuNoV+W6ex6ccokSBq4mZid5MXmmocr8gffwR3duoLjAWAdSvA
X-Gm-Gg: Acq92OEiJWeAaFXsy5K55uKTHp6p+zd3M8SCL9L9MYg5ViejEV4i8Kd78Zin9riVUs8
	pUCMNnfQrUICAahhyNcQfCgHEgBd3nShImjB80JnNTcDoQBnbNLUYiknZMYb5hGiXdBOVuysOUS
	M308HsR0hrGrUowJo5FHPLk4wtZJbtAa9lQwZ9efu0PubpRg3gwEFhSwN4rAUOItfPe6Qde3Cut
	FAS2DX9siAS65blifO/dNuXz7unQezokWvhOLxMuPNeyeflAPLUjc422khyGzOe7QNfLxccWhw9
	P7WSYIF5las48OomhVw+MPP8JWmEFlKmYnKdRDTNwCDW1lNY42MJnPTtSyaUQbSMnmeNjAVyeLs
	TRhkHaeL/hayBSIKqr7ZDolNaThNimyEE3ruuCGoiQpqWSau8PrfOh3bpSb16eSb3keeE9ptlu2
	Spq0GB3nCC6a5qqbSxWbzKLUj20Iw+dtjng7YOBe8h2hHiS8w18b7M/Lbx0wMBUxGlZf8=
X-Received: by 2002:a05:6a20:748c:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3b4d3ced3cdmr20503343637.12.1781024651554;
        Tue, 09 Jun 2026 10:04:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:748c:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3b4d3ced3cdmr20503310637.12.1781024651118;
        Tue, 09 Jun 2026 10:04:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b9b3fsm17739119a12.28.2026.06.09.10.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:04:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Move PHYs and PERST# properties to PCIe RP node
Date: Tue, 09 Jun 2026 22:34:04 +0530
Message-Id: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIRHKGoC/32NQQ6CMBREr2L+2pJSpBJX3sMQ0paP1AjF/tJoC
 He34N7NJC+ZebMAobdIcDks4DFasm5MII4HML0a78hsmxgEF5JLLtjgIjYTegpNcI2fmCz0qVO
 6OGtTQppNHjv73pW3+sc06weasHm2Rm8pOP/ZP2O+9f7oY844qxBLXfEil626OqLsNaunccOQp
 YB6Xdcv3Dw2bMkAAAA=
X-Change-ID: 20260602-move_perst_to_rp-63b4fab37bc5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a28478c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZjL6ptMYfJ62ds8jHLQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE2MCBTYWx0ZWRfX4pJrjOx/b/or
 zNMdnH1KCnw9OAdnq1ph0I/Rzzwfl4pCrnMSU7KSLT209DJN5CI1riUMWnN+87o3kKUGiP27iUV
 TxK736oCbBvVYuKGxnPAP1RubFN9gjOZGpMoUDTKgvnrgtoyprNXPF1m7w3c1k/QN8Yc+WfsqxM
 MY3CWZek2JYNzEL1uI6hcRCcdi2RyrALfpMTC9mAWlwamJk4B896HnkcrNNF1WOXYyjiBz6Wlps
 n5YUlMm13bNB/1dniwbkjhQFbo/BdjGU8RbXmkf0ShxbEbX4zYDUU7q/vd8oWx8R+l6QGy4s8mg
 r6dnCpCtYsI2vAi1SA7ucoRi6xaiHRsL6/ej0UovTxFcy+o+YywQu9VquzwYeJY6fIs0wGME/Z/
 ZYhq3OsbK5iZdpW+NsacskRm9+axW93lp8T1sBUaAavh9Dc8ghm0I2hsMV7eJWWATPn5MRNaIVe
 nW7m7pt4CcWkzaN8x8g==
X-Proofpoint-ORIG-GUID: iQ2l1_5X0JKkEMj9wKJT6lKA9T1IlF_e
X-Proofpoint-GUID: iQ2l1_5X0JKkEMj9wKJT6lKA9T1IlF_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090160

Follow the new binding by placing the PHYs and PERST# (now RESET#)
under the Root Port node instead of the Root Complex node. Although
IPQ5332 and IPQ5424 are intended to follow the new binding style, they
still define these properties under the RC node.

Move these properties to the RP node to avoid mixed configurations.
Also, drop the phy-names property which is deprecated in the new style.

Other IPQ targets still follow the complete old binding style (no mixed
configuraions). Convert them to the new binding in a subsequent release,
which will also allow me with enough time to arrange the devices for the
sanity checks.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Move the 'phys' property before the #address-cells to align with other
  SoC DTSI files
- Pick up R-b tag
- Link to v1: https://patch.msgid.link/20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kathiravan Thirumoorthy (2):
      arm64: dts: qcom: ipq5332: Move PHYs and PERST# to Root Port node
      arm64: dts: qcom: ipq5424: Move PHYs and PERST# to Root Port node

 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 14 ++++++--------
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++----
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 24 ++++++++++++------------
 4 files changed, 36 insertions(+), 30 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260602-move_perst_to_rp-63b4fab37bc5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

