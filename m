Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B981494822
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786049847; cv=none; b=QS/hhiux5cMV3biI0ABFS8f8ZF5ffCaJHdn2FRgBTR2AQvoMEqS+BJQ21WcJ7ND0IRtVPiqwGjQyB/0xRFzAgbCcExXpp7s+kB0CewR2MqW8Ldhcj3Z/p+YIWVd+be3NKZ9lC7ATUkjrWhs3nvC8ZjdaWRnLcJlRU4cpfGWjTCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786049847; c=relaxed/simple;
	bh=zwg1PWhkT+s66AP87LA1pYO8qx4GSQurd1KZURCWRGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QvsEVpDPSoDHIPHnwsB6zKdt9AHIJjtG4EsQxl7ZNhLT0MWb60a7mO14y7V1PpIvqcyPEO6jz77srNoHPuIIkKSAnSIAXsY43YHQLMK9Y8D76Bh+5TMa3UgZv8a/C4gH+ok+Zperx/GNgDRVeza9FD7p7Www5WB2sfakscPj4iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmKF7GTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RL00Kr4R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmKF7GTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RL00Kr4R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHlC03288244
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 20:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TNn8dvyR8MKVhHoEzNadcA
	7+HBIVRs71on16l2k2cZM=; b=ZmKF7GTFTJVCKcPaFOTa0ojgxZ2gi2CyGffcWV
	Sy2iG2Ts3cWCELR0UdqZH2XtNRU5w8fJaoD7VLkUPrdk2pDgzxgC99x7hIBgFl3d
	BgrhM6WtsXgnzv8Ih+Og6dqGJ1nYiR8ip/TO1i2xA1zcDFNFUclo8o63UAjWvunt
	XCgmmSg5DBUZ+QA/6tYkCRLvS1RDY6Q28pcAN2XTx3rxenu2CcGqccqwhu54AE9r
	o8t2ABmZYEMGRYoOycLmy+g1L0dw0K7xiAsjyrQhpd6saRbZoErlUtjlwdTsBoHn
	nrLlBD/5sNYgA1ucSdAYLckHs0zCwemlDTgXLOAeGxalWOdQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6h8prx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 20:57:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1745500a12.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786049833; x=1786654633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TNn8dvyR8MKVhHoEzNadcA7+HBIVRs71on16l2k2cZM=;
        b=RL00Kr4Rc2mLFW8PNFf9hmWwNLgkvdgdzH7em+66+ovYdS8qv+W6yNJnhOZpZjhx3u
         qMCxtk72ryHixcPNZqWO5yPzJCXKJ7fQqGpjFd5aYg7kAxgK6U/uUlV8Xjwhg4QDoYFd
         rrB/uvQM0nlM4ndZSWXw802TLVnqhRuciJ7jK64vrWSiTGghhn+J/gYBMLGjK9hqSiAj
         XVn4lDwnFyPYN8PWAiM5xGjK+JIxNIV+4AQnOPdP+psaKThz8eu0fwhOZdlxxmWt8tF4
         zCEFLn6vrZiTTKrU3WZtNkojlWAQyofStLi/YFlq6MMitYNsEzgQQXxALSVg1AnRIRqE
         XuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786049833; x=1786654633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TNn8dvyR8MKVhHoEzNadcA7+HBIVRs71on16l2k2cZM=;
        b=TNHjQHyZkIxEt7iuxgK0oKN5CRpUiniJq/zn0Id5rjMN/jKkgCCe9K39VfEItvExMR
         +/2ZN+oLSkV4yV/f3Z2xk1rEZFvwmE87drQGRlw2/zF4db3V/mTTArH0quDmXKo9Ofpi
         DeiXpX/hRMxosMHqfrNz0w7mxgPsc1/dXwOjONtMNdXxHvrNAeCcDWsj5M7goCJluflz
         yHsC61wIs+dqWguo7jA/4QkQfQfj4gKVwBDNQvmi86Lkk2cuLVtmmYNQmj+22Wp33Gg2
         XFTFONJxqRhWVbRjk0AllTCjJLg2X210MpkkItfWCXT8PsozILB7HB6oymy3QAfmJwZE
         Yt5w==
X-Forwarded-Encrypted: i=1; AHgh+RqFPIX1p6zSlPX83g6Gcs5DWFJQi2vLoHZFF4bMGSa2ma2nLNtXMUHEQuByeIEWOn5rBnGhaH32pzKN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlc7l6MasEZbqbagAzl5lOQMTxUZ7UV8w3H1LG5HG9kbrgwkik
	9JD4biofCKjVeXd9nir4x+SRKOdGweEFEwWDbTMlZhvtn3kO5S/ZLgrZYaq2aklFbcccWpF8FIP
	cdujSCvjwU3+mDN0+HGaIXMrXN18Xh9mkgXW9wkayKapQvzdJGp/EzHiIwykBFxWM
X-Gm-Gg: AR+sD11vwkouOnDFHgYqUm4Q6pf4vlShB1b3lkRbNsnRrRX0Ifq+CypO0I3owMIGfR4
	6RjwqxbIO+V4YG4yvps/42TVs1J0XFv1xkhUJckTzu2bs8IpVuNxBpO5a5wQL5OUeGcUd4uD1S6
	1JB1G2/hYgfjTOT195GZmXc1cMQRi4BJfMvPaJliVwYKE0ugIiL5cCxZ6sMvDOE2ki/jKjy+Rtw
	TFHOPkG9wmHEZfSmWkoU9jI2lDR09uKo61TQvFWOKG6ZQirzoBo3UEWaUMCUDVzbQKpLPHR2Beu
	ts+Y5A1M1OI9IJJL9qP7P36tWXPaUHuPorDWlfFOIckOaCVy75EFyYuz5KT2AtJWuV/GCrLu1RM
	sdN09XWJ7m3P+g5AV4HfkH9OtZtJkSQ==
X-Received: by 2002:a05:6a21:6089:b0:3c4:2fe1:fa36 with SMTP id adf61e73a8af0-3cbadd74818mr5812849637.36.1786049827580;
        Thu, 06 Aug 2026 13:57:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:6089:b0:3c4:2fe1:fa36 with SMTP id adf61e73a8af0-3cbadd74818mr5812802637.36.1786049827036;
        Thu, 06 Aug 2026 13:57:07 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bc667f1csm116641eec.12.2026.08.06.13.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 13:57:06 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH 0/2] rtc: Add Qualcomm PMIC RTC-GLINK support for Glymur
Date: Fri, 07 Aug 2026 02:26:29 +0530
Message-Id: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP30dGoC/yXMzQ5FMBBA4VeRWZtk/DVyX0UsqgbjSkmLSMS7K
 5bf4pwTPDthD7/oBMe7eJltQBJHYAZte0ZpgyGlVFFJCt1qsJ/E/tFMrO22IGVlojLKC921ELr
 FcSfH+6zqz35rRjbrM4LrugHE0cPndQAAAA==
X-Change-ID: 20260806-rtc-glink-cleanup-038163045afd
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Raj Aryan <raryan@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786049822; l=1734;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=zwg1PWhkT+s66AP87LA1pYO8qx4GSQurd1KZURCWRGg=;
 b=LOKErvm6JLx4BuX86tRV0YI6PShIU9b1NqyPmRAFS6Wr8SXiByIjjxaNmc0ZnE13+V7aLqMz4
 XXt9YJMfoJvBqA4UI8BauPAzEyN5F4rPIu9TCJ52wymtjmJI6xLP7sK
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a74f531 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WiWho93J9qY7Nhnkw_wA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: j4fOV9s3ihr0ahfDifLXvWTCDP90QXpr
X-Proofpoint-ORIG-GUID: j4fOV9s3ihr0ahfDifLXvWTCDP90QXpr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfX1lsk85/pvSaJ
 birH6ZVm0NZzKNvT7d3UCfcGutJo5h1YF2bR52RMYDiNfTed+T58ElG1/BiyXpuzjUi34fko5f9
 pd6Bk0wwFeZvWn6r8bonYWLQq97tGRo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfX28UsyAFSg9CZ
 o44iv5h4MRlierx/i+HDXTHd6hxTwXNlyWRUmQXwqbuUHT+jm/Jd5OvxXdUVsqtV4QGDFxnHVVi
 XwP170ZAu6m8ne+51G27atCTR8DOCuLMDT1VSCwRKyK1zbyUj8DBxU/Iz6IgusrkxwEsSxZc3QF
 nFGO8bmO6s+bouJ02DZHUoPcIXAr3yKo1EGjCapSGQsdALxX344GllDh7b5crkCbfbx/0AadWYZ
 MXZvIbKvFwNfZttJbF9IM4Gshs6a5OmwIifYra4PDtkKlQpwETx/MNpnFF97bmHNvY4xTZaVHDc
 5NU023LbodNQlEgs2IaaghERbzAj7ljouHWOdkcBOWi5nBYhSHzZAxnMAl5tWurQ/jTnB9glSA7
 Elw+xaUfrFRfHvUS/rM7sqxGYieeLp/GAQ+UjYfBNr4izBGZzbKl+3KApRZxMj7f4Ed9jclGg9h
 rfbRbATnDVnY5VYwoDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060163

On some targets like Glymur, the permission for receving the RTC
alarms is routed to charger firmware running on remote subsystem.

This is because Glymur boards have to  support MSFT's `TAD feature`
on the windows OS devices.

So rtc-pm8xxx.c driver cannot recieve RTC alarm IRQs via SPMI on
Glymur. So in order to make the IRQ available on the Linux kernel,
the PMIC RTC Alarm IRQ must be routed to APPS via remote subsystem.

To implement this, add support for a New Qualcomm PMIC GLINK RTC
client, which will request for RTC set/get calls for time/alarm IRQ
 via the existing pmic_glink interface to the charger firmware.

Also, add a DT property to explicily support enabling the RTC
writes, keep RTC writes disabled by default to align behaviour
with the existing rtc-pm8xxx.c driver.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Kamal Wadhwa (2):
      dt-bindings: soc: qcom: qcom,pmic-glink: Document RTC client properties
      rtc: qcom: rtc-glink: Add PMIC GLINK RTC driver and extend pmic_glink

 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |   5 +
 MAINTAINERS                                        |   7 +
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-qcom-glink.c                       | 690 +++++++++++++++++++++
 drivers/soc/qcom/pmic_glink.c                      |  22 +-
 include/linux/soc/qcom/pmic_glink.h                |   1 +
 7 files changed, 735 insertions(+), 1 deletion(-)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260806-rtc-glink-cleanup-038163045afd

Best regards,
--  
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

