Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B303D312803
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110093; cv=none; b=DFnrpu1ygcy06hmO0InXG1DPql16ET8ThsclzS9dupzXrmg0LwePZNtaNQ5dBqzewyzc4nWdCgsg9QysWYrFHlN+o8BUL4dsnl9aLdH6bslSl7lgVEXIuNTmAJIkaMDZBfEu6wkiLS1ESC77tNl19Vg6HA6Vw630TqgV/FfZDVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110093; c=relaxed/simple;
	bh=y2wQGhHfzqHJ8XiSXx6NumNVZHYZ5cj7ZzBR6/fGk4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Iv7Y5ZU9j3dKx3NgMkjJxpNwMUSohWkw1KjXmIYPTJuBJFyMHeFc4FbHbkQg2/jEpb0krjrd405JqrBxs65NlcVZEoxCAPqJrFZLnCbmjXTHGUg3rbVvYL2l2hPiJw1Rl5rINg6RutyQM5BP4nmYvbWU8zu8vgTSnYhZhYLqsvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCXoXeLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvOdfpor; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCXoXeLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvOdfpor"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59I3Y3800711
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2/zbJ7RlGGpzLIcbdISYH0
	4tzgGv8nCYhHdJBWBVGp0=; b=iCXoXeLAVipEeEmRkRlS8syMvhLY/AJADt5cKb
	riZMsjvLvjgEI8GF5tSaPVhgYeqx7NLLw2GH1tyXQaHaq4v9MFlzr2JN3uMySCLf
	9wp/ES/vlLlfSAwesU3zw9hCLvQwNstuHaLl0LRXLkBG91h52ojezasb3rYA4+WJ
	+3+bAvsqknYZsSiuOwq8gLznircQ717WrDY/EO1x/4jnFXlagI18wD5II7OeF2xN
	Mo7QSZKUkSUuPEsyjg7f4lX9YoLR2tmIVVxEAP6iziDnPHHjXnr2ninzY/9X3aLL
	GMZpvS7a08Zw0II/bkea/nPvZbl5GIcE+jDvTc85XxDL3hlA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k4x8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:34:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c85c9ac50so3572449a91.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 23:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782110091; x=1782714891; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/zbJ7RlGGpzLIcbdISYH04tzgGv8nCYhHdJBWBVGp0=;
        b=bvOdfpordPQn9v7udEnTswtuqfPlZUBvvYAEDPZmhVpakiS1KFRir32VRQVvDH+SMI
         UCdLxiSqZQ+10AG+kFR0LndjzRDaU63MfWd+wI1HCkd4RWz23bse3InvzhykJ/FKukpv
         GWxtiqvvdOy/qdqZ5Oc+L9Y/BT3svbQsUolziR3oEoi3WZDnSQ/7FkZkh5C+wRC/luLL
         1l2oswRtCUMJnHUVqfZzVj7GFndmNSRZUPw1YX6tFtzYdTjX6++vpi9W9gJNMcAr2rXJ
         iXKWca4Ny4sFpor9tVBMlfBnkNCebXZ3YFNdB2AMt6aSCa4NbeDCU35rN7jhUX+37W5D
         TLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110091; x=1782714891;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/zbJ7RlGGpzLIcbdISYH04tzgGv8nCYhHdJBWBVGp0=;
        b=eLPwLUQLjWsjp/37hGlpF1vd20AyiEe6sntWFQfPT053Mf1il8/SJjp5FHBmSGnnI4
         DqcYtWGOH7JMCyf1ukuqbHHl7W2uFfskQWLYPC1hf0u/y9pZo9PSV35NuAX8IWioobOE
         RFBiB1OZy/A5BVfxaHzKhKffA1v/MPCfqAPuRoLShYOs34kDNa2N9u6TGXuBkkTfR8CS
         SgaruehpB9lHVVlFj+Dr6mJjZDUZDs9WWDmNpiz8TW+w4rPyPM8pPDS+fXN60jt4O+gc
         0zKz3TF04O3UMgJNpW4qw5vFdQwkpisVDOz2PAKmCYhwZVljXbeV9T6+tIJULhx7diSj
         ZwDg==
X-Forwarded-Encrypted: i=1; AHgh+RrBOx8mWLU9G+5N2yjB6Z3RJ3Lb5Y56McufDzwjOhd6lOkStIgDpu7UZE0mjX+THwnJ015C95M8SpjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxdvcP0aZZ0c+YFLluS0INTdoPscH6yxakU6au63Y8orQXAmUpJ
	WFNzCI6pppdaQFcE3nelAqQnGQILH2l+KorcjjcNKKKmnTHjmFfk16x+mIktT1814wIWChKeVJl
	7LljdQdoI9dwncezc0KkITFEDJ4oGjUzk87a2wswn9MBGunyQPkcekO0VFlbLgfME
X-Gm-Gg: AfdE7cmsbxFLW9NyTGlaf9vc+JCMAZ3SRbWgoT25b8PEsU7pRj7TkSn15kJhnR6pxYz
	XetEE5WSkyFMs203YKlrXZMrlAzxkoGltYUSZkJbs82pXiHucr4lwyN1qg331dCstsJCX0c8nlp
	vkb0767xV5DnZ9p10yJZWeG0hcf3bLKgXXpL3SgaB6Y6oOlCfZvPRAVmr23verhTkO6RI4FQUF9
	xTdEFiWpJ6DIxyBuYDModhJ/pqs/LtH4Eym/c5Fn0DXKjZSXiKabLHNW0gVcC+s8XiMfJfn2DiK
	04Qw1m+6gLZYFqCpPjrarSqpUCIopxqaxyT8XlvVrevFwMM3U5tyEs5o0aw/CSp4iy47tFGuT1+
	ZXdLmMy/HJOkP0ani1CmsHh4EFlab+YT3Lw==
X-Received: by 2002:a17:90b:384f:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37d1a32ba39mr10978182a91.17.1782110091100;
        Sun, 21 Jun 2026 23:34:51 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37d1a32ba39mr10978169a91.17.1782110090631;
        Sun, 21 Jun 2026 23:34:50 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc2c8de8bsm5928321a12.6.2026.06.21.23.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:34:50 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v2 0/2] interconnect: qcom: Add support for upcoming Maili
 SoC
Date: Mon, 22 Jun 2026 06:34:44 +0000
Message-Id: <20260622-maili_icc-v2-0-18b5ac08c04f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITXOGoC/22NQQ6CMBBFr0JmbUkZSUVX3sMQU8sgY4BqB4iGc
 HcLbt385CUv788gFJgETskMgSYW9n0E3CXgGtvfSXEVGVCj0QZRdZZbvrJz6phrnVU12rzaQ/S
 fgWp+b61L+WMZbw9ywxpYjYZl8OGznU3Z6v3rTpnSSltbYGHIHPLi7EXS12hb57sujQPlsixfK
 x3jPbsAAAA=
X-Change-ID: 20260622-maili_icc-94001df2a4d3
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Usaz9FdBZOvZGFLevHGikz4VJLlg7aGv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MiBTYWx0ZWRfX7N8RWrL69d3f
 Ym15W9vbZ8X3eeP4X72q7ygoiISnAYk8WrH7Wg7/tpS0K9UrMlPy8IAnIYqRcjLLqy0JrYo0iiG
 tRxwFJKhX6FxoO8NZAhtWXn/zXI7rHk=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a38d78b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e3PGyOgw--WO3KluFDwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MiBTYWx0ZWRfX1pBNehmP8Awq
 6p9HtXMPTl7/uyG0YpEHJwSE0gjh47bpyPFR4TyBm+51nfxnh2RrPXT66UxL1L0q3ZOId4L5ozG
 9ilHq1DqavlsijL8+fMy/eCtAc9xuVvr7rle5guGCXjizPhaY6kKIeRtxpyckCXjMpQn20UhNpo
 cyYM0hrT4KQqwlzjMU6BfQCoUiiT73OHpmbdi5amvQGOcjh/LM34uM7PEgrzcdIbX4TgybfO1eI
 BrbnSvu3RAv78X2BKVpQS5aTtGYY2xHWB9kMcIqm9KhYk4SHVxS5+hgwwNJZi+EJCnRG7RHVIqK
 wrekZZCN7yUZynaoEXvPDM2Qv6YF2l74bepsNimPJa/Wh5oleVc5HiIcTOSomM5FlfURUAxYaOp
 y9ccvyj2mTgV7efWEVhgd8gnPm6M9mvnTDq0fqxwEPV3MRQgdQ1uvcFXsyQFbqm+YTDvWiThzB8
 HuCGiSfSSsWUrM9B8Gg==
X-Proofpoint-ORIG-GUID: Usaz9FdBZOvZGFLevHGikz4VJLlg7aGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220062

Add interconnect bindings and RPMh-based interconnect driver support for
the upcoming Qualcomm Maili SoC.

Device tree changes are not part of this series, they will be posted
separately.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v2:
- Fix the incorrect endpoint ids in binding header. [Sashiko AI review]
- Link to v1: https://patch.msgid.link/20260622-maili_icc-v1-0-0aa8286e6748@oss.qualcomm.com

To: Georgi Djakov <djakov@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: qcom: document the RPMh Network-On-Chip interconnect in Maili SoC
      interconnect: qcom: add Maili interconnect provider driver

 .../bindings/interconnect/qcom,maili-rpmh.yaml     |  127 ++
 drivers/interconnect/qcom/Kconfig                  |   10 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/maili.c                  | 2091 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,maili-rpmh.h |  171 ++
 5 files changed, 2401 insertions(+)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260622-maili_icc-94001df2a4d3

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

