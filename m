Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768914;
	b=qT4hgGtbMlEfeTSP9ul1bbAuoDzCPxWgwX0QbHgnMy9+v553DrY8n4tuRdwEpUwFrLbS
	 DfTrbVYpTcI9r1+INvh6U+vlKpcUtDajN80fCVC69WbXwCmi3V2AxA5B15fil6GUZMtwU
	 nomn8XWhHmEgiMZgUT78/uvSyVpqU8eQcw2eBHerkmPPAS3AnOR8VDEd99gg2OPELK5q0
	 8Uzrp7cx/jVje5wQ6PrNCvIEKUwIcCUtakyxNtLW8EHPqyidSMgZYJMpEY+6FCzYpNLPT
	 Q3a4jh7cM3FlHYiPuVPYxUao7S/GmoZyiFTUrKsxN6IhFRySupgFWNIdXdv4VRNpAjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
	b=dMd0zShSjOnjZL3UC8hTWJsx/YGtnBfrpYAbnzLXfuJSyZDM0hCO6oLK4p4RK5pQqiaB
	 xEPALg+fZJkVa6ffkWluqRPk01p97/dVeW0DHqJ+4O9U3Xf7DSQnl5sgbhtxVj0k/r/jp
	 W+BI2M7+sULW8mu0fismTDuV+JBxzlCWFaeqdezs9tQrdt6yEEDhRfOcguoCOFXL0tBE5
	 xjrlKA0Auq9tGME82/4gDAnriOHh+3+0SI3bmJOO2KPsBUTK558mL8uw8gJx0KuZiBeiR
	 okyhty8r8QcK75Y6jpbJ9M+g6ZZc4wFu/jOA756umFJvo5vz+jHS1L9GJtp/k0RwUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l49cRqF+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aqI6ATul;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705AC606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 05:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705AC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l49cRqF+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aqI6ATul
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RL6E222122
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 05:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nwK1MVA9UCwz5756RDh+kT
	/5Gn+aYpD6Nw0j4KwOfYE=; b=l49cRqF+4xbbkWwZgLE2bW3VTcobyp7uvlEDi1
	yDEMEwT9d00k1aGQR2ak38exx1wGV7uqTIZKOIZdSR61sooEQ7uSlJkt5EWJWzsq
	SuQ/v9lP30wDavM4Qdl9VsHWmmKdtnL9iaL/aBqvAjAPETgRXgXKVtFVoKTMuvXO
	CBCozjlpoin9xUtHNd4/uXI/3pAmiQDOvMNYLeGVK10UKyKiKNnAxTkwY0aNlqrJ
	BVyhZarudSm71vtGMJzQNVvlDtJofU1VYujqUZRsmim1HgGqNH4DXkNjPKmmFO0s
	qtzlWC+A2OfU1cYsaWY1SqBUSrnm+dyQlcMnG5oGMZjng60A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubjua3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 05:08:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so391378a12.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 21:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768912; x=1794373712; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
        b=aqI6ATul4fNkxNNTs75ytyRgjjHOEK30aOk243zPIdKIwnMpHSuGTD93l60w9Qi+X2
         VufXsZZy7ZyKvYEJ2KikaNW3WutGi8BMe1OBhInpYN9AjgOLPXzUDcwQN/Zr9pOWSmYJ
         6C4+NAmsWr7539UkDLnRh0SydcWQFVtylyM23q+aufOF250wAuBdpySEIZXbTXKC5msM
         YNU3i6R7SxXkZIUPPmP+WU+WrinkfzsBjZ6tk95zkqadj/78mqVE3czXAlatwvI9jNYf
         D+icL1M3l01nkIyzcwauF7QAlXKzUiWbwXADt4GlznkZiOxvoTxTB9YV9ejtwlobKgzQ
         RQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768912; x=1794373712;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
        b=H0LFDtATRxUKe5QMNzFOEes02vZGAjzPRtCN3pFr59Ka9xangqS8OmUVz6QIzDA059
         mQ0UxM+uHgtvUiaktzlHDvVmV7YfckFDv38yZiq7HcF2BeWU//5nYdVkTSmrykkk2Q6n
         BglpqAN67SFMkXPvuP8dMLrObXkU+KhrMHfsf3C2dtteQ+M2qDgCZc6kJknCzwcQ4/3D
         zCTrMWiSbMwqNsTlCz/eHvFj1yE43UhrGl1SjSbpK5T4SGm0cbvBBuGgZQv07vxuXFzG
         TO3mu+CwostcEIMOIyntVws5vVwWKzSh4jUr0OZqr2yVCqGyU1dp7HlgD+rk7rRJy0lQ
         rHsA==
X-Forwarded-Encrypted: i=1; AKwUvBzuKo4P7y1nwV0EHbdQOxg3tHBykYs4MtmjvL3JN2s3bsXrn/1i3E1nVdMlyxF+v9+uY5xgCkKeyEjs@vger.kernel.org
X-Gm-Message-State: APuU4Z9JHU16C++WDI8HhBdqNiNO8WlRP4zO77BP731ZJteKdJx47Ndn
	8oaechpwPWWi8CD23L6tBrF1o8r9U/WfXNrSQiXtiovZpzG0407P2Z/p9UcG+9tJFeLrrSDjhkP
	uOW+2+UE6DfcVj23rgw5ucx1/tK05LNSWCrVN2A56oI59YGFbYIbolpK+JkW8cZUe
X-Gm-Gg: AYBFou1nj5o+FMIKnXM9zPN5/xEv/hDLVmzrBM2f21e715r0tlsjPQtopMxkS1dV9ik
	xBtLBm3tdMvv8XuGEwmg3OhS72zJRKMFlF9WlOTaY+NVg8ctMWhxNpLYcyTMNmwNb20mD1K3WWz
	B/rtp4nLHyD/Z0/NX03/ftXOmTHfBRAE+o2kGP6TzbtgV5RXQjaZiosoF7Ff+3milYOmaaD/5CG
	JY/cTg+YhA37ad+o4qHRbgbtJNq7dgFEWZ/Mje8pfqiFMsTqK+OB5yIPYEn1ebQVh8I935insF+
	GNTCKGnA8FMLPeOaJcgsRgWh6bHzNY+eimJBRUK5m8cKd6nPx+AKo6Ehk73P7z978qFiQ7wWwbl
	Zsjc9lg6CGunU7ZCuxSwNsmn8xdyf17IOQ8RORLFl6zHs5tYc+tZX74ltCWDZIGWwRgoH5A7vy3
	QQJm4=
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12971741a91.51.1793768912022;
        Tue, 03 Nov 2026 21:08:32 -0800 (PST)
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12971712a91.51.1793768911555;
        Tue, 03 Nov 2026 21:08:31 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:31 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add support for Glymur AV1E clock
 controller
Date: Wed, 04 Nov 2026 10:37:32 +0530
Message-Id: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJS96moC/13MTQrDIBCG4auEWdeg1p/SVe9RshCdJEISW22kI
 Xj32kA33Qy8A9+zQ8LoMcG12SFi9smHpQY/NWBHswxIvKsNnHLFKDuTYdrmNRKTGVpLtOTcoUa
 BSkLdPCL2/n1496726NMrxO3gM/t+f5L8kzIjlAhxMUIrJ4XpbyGl9rmayYZ5buuBrpTyAUyOg
 g+xAAAA
X-Change-ID: 20261013-glymur-av1ecc-7522de7e4e65
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX+Y168xrDzrtC
 GBQjdnVbIM3MWKikhOGaQL/pAnZGwkcsAU1TEweafz0RlyaWCmQT6Bbonw8carHvLqhmOLaCvUA
 yAMy8AhsV2u7Gb24k8IXE1JQvSJLtWA=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeabdd1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JZxBUJHeOsY6iHg-7A4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 7hqUrDZrzibaud-kiZPZ9uPdnrrl0WyQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfXwlqGFlEFHcTX
 Dp8NzUI107s7NFIfhCHCEVZEf21VScvtCvjA8pG7ew1SW3DiwkZYazucmdEBaic9QCuNLw95RfV
 bOushaj7L7t+EGwZGvapzNcSe6ads4dZZBzXpk0WPlRIv3GL6vR/ZcPD+csry+9KEF516QnzcYu
 /WrJjqkPGx6JCDHyygXi58kiZOmj1eFIHefL8P0IhAfh9LrK+UyvSy/HS8sIQWXlP78mJ1c25qf
 5/+DMMCOC3vAN/4UL3y53d8qjk9WQycG5hPYvzcVTiE40T8uEjAe6ctv/buTsiCYIa9xLb4al8k
 2DTeFIGE5sD8q4bEfVcZN47gHkqCmtda/h8x6TUBwHbajfaCxva2x/NnSAVXnl+qNP/szr2TeUD
 B1xuqbkyaB2GfkPnHFRhLYZyuYfj3cq1cKFdLDGj73U02LicsNGZWReDBvw6QnnK8qt3Uthqx4F
 2fZ5LLQI8/P/6Je6REA==
X-Proofpoint-ORIG-GUID: 7hqUrDZrzibaud-kiZPZ9uPdnrrl0WyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020

Add support for Video AV1 encoder clock controller (AV1ECC)
on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Rebased on latest linux-next & used clk_rcg2_ops for
  av1e_cc_av1e_xo_clk_src rcg. 
- Link to v1: https://lore.kernel.org/r/20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com

---
Jagadeesh Kona (4):
      clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO clocks as critical
      dt-bindings: clock: qcom: Add AV1E clock controller on Glymur SoC
      clk: qcom: av1ecc-glymur: Add AV1E clock controller driver
      arm64: dts: qcom: glymur: Add support for AV1E clock controller

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   2 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  16 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/av1ecc-glymur.c                   | 393 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-av1ecc.h     |  35 ++
 7 files changed, 460 insertions(+), 30 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261013-glymur-av1ecc-7522de7e4e65

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

