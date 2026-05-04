Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB37B38C2DB
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888823; cv=none; b=nKKAfv00mCiSqfxEOU6VMfHO02YxZ8criyxGS5MHDfn1NBh1Bl3BrwuFMJ87CLMPFyOWs/aSzuFCkiIwEXgAsffERotDHJjSSpSe0sAOX2XZPbV2kZh2lDeO4ahMvgz91KrwvH2ThXrX+TJ2guQJ2dfP8m7voedSRPlkj4omiOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888823; c=relaxed/simple;
	bh=6XsOW6xgktCxmo428N5f8+9AEw+zHR/Tzz8edUczcx4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lKyP714mWBCV1Ccgx03niEeNe7lMXxpJyrNnWpHvGImTjite8pe4SJnvKbqK3OoREX3Mqi9zDijJSFlTACWUNYIMP+8awzcruWzJ0aqp3lJidv5r/3laAV46x/4wAuFjT63wb5wY/DNSd7Gr81SqrfsTiYqMFehEtuNdU3k1dJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwMENYRh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCY8P1SR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwMENYRh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCY8P1SR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fQrR3894123
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dCGQExVcxWHLSWb0uhrmkR
	JffcrkofUoETdXWXrqn98=; b=WwMENYRhVAxS0IfMJALsi6G9UrhRS1c8vmRJJl
	TacJC0B+LhWbDrXXdas8FJ0Sjmcv1bvXs8QfihTdZdnOg+V7vMkHgeKRuoRh1MN1
	Jl+NxP06Ux2mGF33Of2FYHo5Kg4IbQ7Hzy2pgTH8rJESLhrJzsEnzDDxGO80WAWg
	QClxkUuBkpyo37sLaXsnZomRr/yA02KtSJ4ACoNeUzHPFcrzxHxlhFSgw5tz8tew
	7BXE3XRXIsXegyIg9NrNM8/ncU6QBYD4kIU6eTa/Y6SrKFLXDZ9Snae6mkE0lfFm
	oaghNJSYacwt3+PCk5rsH6/5NLqvgQYjQFcEppYucCt6hIbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpdf58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:00:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fae95c82cso144626681cf.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777888821; x=1778493621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCGQExVcxWHLSWb0uhrmkRJffcrkofUoETdXWXrqn98=;
        b=DCY8P1SRShGkq0HRAfRDCVptVq/dQnj24YHbN7LN1ZqO/X8yBcA/97Y9jLgGD7MrJd
         2+oGDcbaWX6XzbqRgYA/pzOpbMCmaVcD//gVmIlS3wHIFY/rjXZHUwhKvLin7AUApC3r
         A/MBFAemesZ7ynvKsFpkc1eYMewG3P1UuMDJ1ddcjKpP5GPhx16ZbJZ9kIvYH3RXyYHm
         RDeX5SU78aq+kF8+QknxXos29PIb4IgWo/iblXWMCelfFc9/ZjRXulEP/J/JHtOxLNEk
         2VYyjZSjfQ+KH+zALfJv4vatJ4RmNH9QolxSd/VVFzHyrIB7TA1GPd7nyh6xLDL55P36
         RdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777888821; x=1778493621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCGQExVcxWHLSWb0uhrmkRJffcrkofUoETdXWXrqn98=;
        b=qj0vjyFpkGOODvlDCus7IBn9RAFoLbjFJ0xLDcotZghUBs3pelw8aRb7F38r823N1j
         992QViYDhEYC9rdnefq1EVUtb6i3/buccaTQ549yMxM7f38eKTWQz6yVc1CJD0zOh/9L
         96BVrZxm28uqRwp1jsVRq83kd2h1RFAtanq17ikImwLxMF3W+VL4qM5Xwm0Z9ydR9u59
         OBUARr53CkAUseL0zM4/57UpZnHeyBMSX6bSb7nftLSgDMu8Z8VEXpVB5KH/6cHFCoN2
         cMwY0/Jta9zAnnHQKneWYgSlaUcH3LOJDJVogZqIWEHoW93QKd1BMdYDQBTTMpvSuvy+
         vJOA==
X-Forwarded-Encrypted: i=1; AFNElJ8bUv71cy980Ra8qWP9M5P5qDgz9A1IDQxdDcvApeQaXNJiMXiPcJyY8kdj18wpV9qqBPtR3D7pBgfA@vger.kernel.org
X-Gm-Message-State: AOJu0YwEgs/jY6NhjWbxexgK6VUTu8VTtyYYRzJulEsza2Ufm8C8SFf6
	lMzX4mX7OPKFKKHmAbFCoqd0fUTbpTsQPjfn8a6BADt0qv3i3NbPo5xhe2UZU+5xUBnpdRx87N5
	cOp0CL4pxDkSc4DBLGW629AR/HzGVQ+mhIzFEvaU1CH2dzyPwp9LQwdebAc4KMwFp
X-Gm-Gg: AeBDievZXk1lWOxOufS6NPAhmR/XoWHjDEhKy+j9HxCGIEBIQnHYcAbFQNfC4sQ2Qun
	9pNUkShXXfhz6BS5WFO+hc+sqcYIeo+4/P3Gx+9+WvUS4XoM3Q+BH/mpAzY//JxMzRBzoV3vMl6
	4HV3d5UmapO++XN0b9s38nLrHFO3UZnnShqYmJ0Hwqb1neumnfKMr4PrXp0OMH5NRsBshvGHqGG
	m6icE3Uo4Tr81aL2IYl3NUBUR8DXcu9rh5QIVX3kQvFMY932256/YnwFekBxlbspnvuvBKfO/kI
	xO3ZUVU0i4a1SxsErvS0PdaK2lNBdoJGOM1sit9eMQDfbpcoQbe+xa0J5sI+vlYQrcwNZss+rf9
	/F0cPtGQmS0A9+4d5jA1ww6j4TwECo4+yw6HOogwx
X-Received: by 2002:a05:622a:588a:b0:50d:7f4d:93cf with SMTP id d75a77b69052e-5104be06ee3mr152162591cf.8.1777888820715;
        Mon, 04 May 2026 03:00:20 -0700 (PDT)
X-Received: by 2002:a05:622a:588a:b0:50d:7f4d:93cf with SMTP id d75a77b69052e-5104be06ee3mr152161591cf.8.1777888820129;
        Mon, 04 May 2026 03:00:20 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f7csm324355955e9.12.2026.05.04.03.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:00:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] soc: qcom: llcc-qcom: Add support for Eliza and
 document bindings
Date: Mon, 04 May 2026 13:00:06 +0300
Message-Id: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACZu+GkC/yXMQQ5AMBBA0avIrDVpSxBXEQvGlJEGaREh7q5Yv
 sX/F3hyTB7K6AJHO3uepwAVR4BDM/UkuAsGLXUmU10Isnw2wlpEkSjdytyQQSUhBIsjw8c3q+r
 ffmtHwvU9wH0/INFXvG4AAAA=
X-Change-ID: 20260428-eliza-llcc-312b07fefc10
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=875;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6XsOW6xgktCxmo428N5f8+9AEw+zHR/Tzz8edUczcx4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+G4pr/Tk6SOz0Fiz3WFiKw52rDwKJoSFDHjE7
 Dbu6j/4QyuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafhuKQAKCRAbX0TJAJUV
 VsuREACQwaUY0+HOoNCuQ9Q+JesxiBC+sioF1kjfEPmibB05RzlnIsq10nOYzttTghXdGvPqVyR
 roN5FIrnYpjIT6RM/n5BZ3jMEbVPQ9+uJ5TrcAQuTzGJVwi8ogITnL+xR2RYs9Luem0HhMqkbq8
 ZCq0wy/YQCch58LZYMCfENji0+MLcQEYeGZrpLVKwOtLGxu1mllNxSn8fIC4DA01kH5x6OJosAT
 X2r9JFmln4sWLXSt7LTnBBjdU1LRjCT2cIJixBXpnlzT8DdSYGay7qtOhB8mab51StIHkDTrHBd
 xKwFWCnUowDdN9uzpiMCCh4F+P8VO9w2TEZdsYQlnT/pohnwapxUy6tZFzG3TXk7Rq2TWJ5w48n
 pLrPz/mxXRvni3aIhhhxvMHY25SLW8IOstLFhPwRulzk3qGtMozOK6LrpNeoFz/QJjhlKGK34E+
 58OiwozQdo1mIpOAgRTMV7qWpekKMclH/omAzkkzpSFd+ALw8FHFVb6rgCml/xTYbyMN6ZzYbkM
 LxcxKVOKcBPhvSyKM+jlfz8jDJt83FAYecdajkf49qCNmyT4J+j1lb4Tlwz4qsp8XdbpBHZ53uO
 LA+Ax4LWxra7T+PF0KFvtLlnnl7M4/Oe3kJo24nIjO7t/fhm7UwjPByXJELdhQwAnrWy08XyJDq
 nJ77o21U0DPODGQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f86e35 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=r00G0U3fHvqhUe7YmHIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfXyjUUK/CBJkzn
 kOnh17753vqhh29U5uV0X8xifCZOqh7xfHiJpkq668dytOHQVMG3vxIjEVvpPpZ3vkZUGP05UK4
 dKLxXsqO6zjMctSb70HysuUdBScmUrjgyB+Ja08hDc7GdgONExjAvHthrkbzDpGk1mwIWwypm/D
 Qm8WARH3SyGTkYLDnYKm+ZLKAbaLC4LKB0zrAtKovNmSgFIur47pv8E9c0vERSe6GkjcQ8ZMaNL
 NliT/f5UrqpCWAy1u8xMDgn2DUUxfvTAHWe0Jbr2PfGO+YgsVdrarmSx00wUyIgMfGBXjgiZtQc
 wfwQiT8eXuu4V6nfz/mvFeCPO7i8NxmiEOLB/nA061iwuziB+QX7d/YUFyFElCsNSCSGSNntk9Z
 zepu8WS+FJkxkySS+3ljLyL8iwERhoRlOVDBzcubPTbv8GyTNIWAsCdRGN6P6r9BOZ4ccH1DOr+
 LyUDfKOEIK0TbAXFCLg==
X-Proofpoint-GUID: bREyeNVAhytjyksMoAPQ2m8kM11jUJgZ
X-Proofpoint-ORIG-GUID: bREyeNVAhytjyksMoAPQ2m8kM11jUJgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040105

Add support for the Last Level Cache Controller found on the Qualcomm
Eliza SoC.

Eliza's LLCC uses a 4-region register layout, with two per-bank base
regions plus the broadcast OR and AND windows.

Describe that layout in the devicetree bindings and add the corresponding
slice configuration and driver data in llcc-qcom.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: cache: qcom,llcc: Document Eliza LLCC block
      soc: qcom: llcc-qcom: Add support for Eliza

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  22 +++
 drivers/soc/qcom/llcc-qcom.c                       | 180 +++++++++++++++++++++
 2 files changed, 202 insertions(+)
---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260428-eliza-llcc-312b07fefc10

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

