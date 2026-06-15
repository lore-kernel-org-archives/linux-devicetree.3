Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0C30C155
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506537; cv=none; b=XHhv3s4Lv02U3ffysKFsYKnm88xfa0cdcK+N8vrH5pAhQ+juuGzsv/m2dXXAd9J+/7PgSP50Wp5V2CrXGSWsgq3QfpXiLExhr7pAj/9BqZR7T+u6hQRLQuNxAXWBMOeyeUpioHbGkBdMJH21fUpE+k3xEAo5wuKPdT1gXqKDcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506537; c=relaxed/simple;
	bh=iBGkDzUSPzYK5sbtqV4KNwdIHGoTb3GNAtpbIzMSbsM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=igC1ctBmAqiLlPrNDGqNwRb2x25q65cu/RkyU48NW/Neu8mwt4+jqFblQ5rGtBa8g0z+Zmn9mM1vqMJrE5GDPQs1Ib7xCzkF+87fs9rvNwjiR1tcR4VpEut/C6obtG7UsCBcthvGwSEK9+d6nhd6Xng3CM+pPgktDFsmm1WznM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmCpdQR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsdI9wWr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmCpdQR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsdI9wWr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LiOT3853182
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VSYcYAJursS6ImGFSxYvrb
	ZBVrmINOZ1ay5tGACvxXQ=; b=BmCpdQR/WSjWM5AMaqNO410vppeKMg4NObseRO
	V4ezUQbDdRjNWsgxw/8hPMRfgY5yJUpP7Q68hvQGsyHu3uLJtmXuWgHx7K5I6j9E
	BFltSyDlzmur7L345c03O5cKjdzPL76RezX77+aO3nARvOUXI63+78iQ2uUjQ7R4
	n6x2s6EmkUlWP4gNTbygFAAvMmjqy0WcCAbZs105CDdZtLy6ntUCiYP3viFurKub
	fOrT+hwVXS4O+38mgOEm5mhdd5XSyVI5W9VKrH9YT+zyW05rqydRlTWboVMtfgsr
	NwFgWos4HT1lRX3gsGZIJB7bYjmj54+5T1NeeMrF6GMVDMQA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gx4jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:55:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304f23c55b2so3853710eec.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781506534; x=1782111334; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VSYcYAJursS6ImGFSxYvrbZBVrmINOZ1ay5tGACvxXQ=;
        b=dsdI9wWrsbSuQMe6xkhhFxyK99tsQwxAJy3XiLqI8R0LAutQzm1YaQqrc0VvuZl9sg
         383+S0KjkZqlYU5/baJ1h24C6zqXxTuZGvtvtPzQML8NxYdjukVmxwg0UhVTMMomDY8H
         eby2iWP8pxyLNOG8KqbyCV997hSGHsPURya95gnOIQxUOP9MU/pnfjPAM6rRtZeD784a
         N7i49GU7/k++zqXAlJWf6qiVMc0lVeSwju0uk/q7TcAx5u6FUObW/6xXWSWgGc2pNZw5
         DmaP387QL6+njR6Nuw9tb0Zn/VHQX/YOGP4l+DbIdm5jyqCk6EGhdDTlmubQfz2RUPo5
         osfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506534; x=1782111334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSYcYAJursS6ImGFSxYvrbZBVrmINOZ1ay5tGACvxXQ=;
        b=DIIRvbkTM8oEvcIxEWxewMvMWQ+F6nWMAIg2M0YuZevcKJtw+5jXaYhiA9NDPJQpX5
         S/Dp+hXeq9YXb8sgBH/oKTv+A1ZHe+oBfg4fYUQl7sYW5+aUvCs3hms7Q4+sPMld9ihi
         P1q8zlhVygWvANQs+0CnM2MgENtRzjtRP0RHZiYUeT5Tthj4OEL92C0GovrpCT6EIjyn
         CDd4Xm/c60JndKxYOBEOLK4ehD9GtkD9ICJSlEiImhoJWr1sKiegSYoDuY6ud6znoDVx
         xJizMLr9vTJMHbkb98BbZvFi1Go2l0Mb1st3J6HqZ7DvUPXV0JFWCNy47jBt4MQi7D64
         a/Bw==
X-Forwarded-Encrypted: i=1; AFNElJ/ztwTDxa+nScENj320mflXOakXVV0pMW8i5nrSgxAjT5xOUKvYYOWXJYLbbniTfFOiIGrOI4DCtADx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxega5ROGvsqdy7SzPByFtHkddd1H+PjlceqORfQCetGecGgQmZ
	TC69zuxirO32u990JQVrY3Vqtm3dzLPMl0iy5U7Qxh9fAJ9AG7oGCW9PGVfqRLbvaRup+tbquGp
	b/LoSwvCuV//PoLYVt7wx+rTKf8+idVM4zVYssXgylT4vFGTCV4Fgwc4TgmTAUbYK
X-Gm-Gg: Acq92OG1IUgTNnPmOHPq4jIJqYrjmNZwN+V2gnI+6bO/x/l+PGn9q8rvPzjxijYxDjO
	oaVJIe2efX4d+Y7kHr7thAx0NCmHo6WK+MrUDO5VLS/d3a4fLoEY56jKAeIMF/WrtiKQeDt609e
	wahEjhhG3qJJ2JYZlBoCFF0FSyRfLqm5BLVzUnMECvFiTnKl5zm4xhhLRiXDZhk7sL0NV7KoAnu
	jojMLO9H9HJqlJaH02hhOZBcnakhuSGIZbpBKm3wx+44D+LgPZ3sxm0nAqyNzCh7cj6/3JV7zW2
	m2XpZWuVJawY4UDbPnnnFCvhMGx/5m1XnoGtM9MtJcv/klbK/nV+/Q8hKPnmOHTppuDwiI73vBq
	T3WPepQMymp+mObrkyzbvXWCplNi+2CjG81uczVRoACry52dKLQOSS/1FgeknHWGJhRmbGuL9
X-Received: by 2002:a05:7300:dc0b:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-3081ff72489mr7079202eec.8.1781506533833;
        Sun, 14 Jun 2026 23:55:33 -0700 (PDT)
X-Received: by 2002:a05:7300:dc0b:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-3081ff72489mr7079190eec.8.1781506533292;
        Sun, 14 Jun 2026 23:55:33 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm14915174eec.8.2026.06.14.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:55:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
Date: Sun, 14 Jun 2026 23:55:02 -0700
Message-Id: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMahL2oC/12NQQ6CMBBFr0K6tqQMUpSV9zAsylBkEmixg0RDu
 LsFd24mecmf91bBNpBlUSWrCHYhJu8iwCkR2Bv3sJLayAIUaKWzsxwNDSQncjiHQUKuzAXtVTX
 YivgzBdvR+/Dd68iNYSubYBz2uyUaYJ/1xLMPn6O6ZPv4FygA/gJLJpVURutcdwVCWd48c/p8m
 QH9OKbxiHrbti/u0nN8yAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781506532; l=1078;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=iBGkDzUSPzYK5sbtqV4KNwdIHGoTb3GNAtpbIzMSbsM=;
 b=HPtGWZ7afcEj2XCWwLN0m7vU/oUwToPiGwlevkGPkSA7rFnUd7vgGehvA/QU1j7fq/zHK+Lsj
 qaySgdp8i8DB7F3cur0WqzC2oeHD50YmeseC8gfxq8DkB46mfnOLfza
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MCBTYWx0ZWRfX/YPa8AdrDBGM
 XHYouEBx/tYf8uLhSKmvOfvOslAA3ZriFB8EVJCKFkXp+d+bZBGfvkKOjZCifehzErkznoo1MAF
 ozIB4fGVlayTXyvtMCVjJAR/3NUZ3pY=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fa1e6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=shj1PICiUaLHCvf5g4YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MCBTYWx0ZWRfX428hcwp5s19n
 qjmJmlEPlTBa+0wAOr72PLxd9rWjeSvZi7G66UC2GH7mCUQ2BuQ8PBgW3MRrPELCfnn2LHVFWLv
 mt2uClgwAUNkpHZSy4q1kegibGw2WRG2vxfDnXEnzdBlY9txOEhw0PymxEkYCmQdGwYJRZrzui9
 GeE56NHZrcF98Q85V4GTgLBd5HnEii1QOxqgq+rVsTXgVME/ZnKocdPhdYp7oUtlnDcaGnbau6j
 aulhO4+OxbNFjlQguAzDZA+50FFRE/0zwUX3ZiL//5/TSzaFone2aVR1cW7TzBwRN0IlkpaECun
 q12sSrWmlDio1QKrFDjfq516nP4GjHe/nmOetKqfMmGGuqrAvrUqvbF6ltsm17UXDZbUi6CTeAc
 NnafZ+PQ/V5cMyLxEBWQOugAs4hORWuH9vsoCv0zCzgkj6cUPu3D+JwFaDSE6u15+/IceSSlLAJ
 W4jjOjmK6PqM7qPCc6g==
X-Proofpoint-GUID: C8Se_QkgquRbaB3t-pTPUj2TfyLOPdEO
X-Proofpoint-ORIG-GUID: C8Se_QkgquRbaB3t-pTPUj2TfyLOPdEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150070

Introduce Top Level Mode Multiplexer dt-binding and driver for the
upcoming Qualcomm Maili SoC. Maili is the new mobile SoC, and its DTS
will be upstreamed later.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Move MODULE_DEVICE_TABLE next to the table itself
- Update gpio function to MSM_GPIO_PIN_FUNCTION
- Link to v1: https://lore.kernel.org/r/20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com

---
Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1630 ++++++++++++++++++++
 4 files changed, 1761 insertions(+)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260614-maili-pinctrl-230a8ce90bcd

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

