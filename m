Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1543B9D97
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657567; cv=none; b=imuP31lAr/mELT96dktAqkxXzXZsu7WoUbNtpiW0TOHRmHl5CybfHr8aae6EfOEDE914oB0DtG5iyXl6QNHdGbJytKLXb2nYck+/UsgAOS8EWIGP8aAnx5iLtelRo8eDPl+flb52Zj7O8zUdQhsjx4RW0eo/2RM+UmYQSLooK60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657567; c=relaxed/simple;
	bh=E8V/x1G6mWLKxmhw+H2N0U4tbZHI27YliCj8HcFUUwk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CmrE3PyJhESwu7NFB7pBh+COHHh1mq18lI7kL/O/BXaVYjzUhI8TnWEWoyL80N1l6wWs8LXm4ZGupyZfgHXxlBBAEB9KIHZF91xHdijaXK8WSL/SrpELe4mglOoz05bo59LcouR1jbm5tctVqVtRpydkIMhLvj+jhEdujuWeWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHgL6v8B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjMSsZtJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHgL6v8B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjMSsZtJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2TvW3439758
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=it5ObXphukeKeuw0f0OcIK
	DADQBa8BIXKiD+JocV0wI=; b=kHgL6v8B/Lz49X32GHoMH0MLFxrhQt4GHydOp0
	BZipTzbHbqtV4k7xJmpieGBHGjkAK+DxT9C8PP5fT2HOY/nKMJdPfYiNEgi+dHvF
	Rizla3hG9fGbonzTRFEm+S7N9zRg+NNMjlbU5vcBYbtjSaitbK+wRtR0Qhnfd7nE
	/r0LhdnDrcyo2KRxXc+/s0ugDc/aSfjrL0vs4eC0abINDTj9O2cc3Ypp0O0v70Ml
	Gq9bdq6hapN2lJcs1B1/BHiAYXJyjm9gD8I3wz798I7rK9+adnKnMAxWMhbbc4Du
	tGwtiKi84iphAYk2lVVqCavWHdXqV5Eftpo4sobuHwULT6iQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nstch2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:12:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-74748e3a5b6so6564214137.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657564; x=1785262364; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=it5ObXphukeKeuw0f0OcIKDADQBa8BIXKiD+JocV0wI=;
        b=YjMSsZtJ5e84BzjatNQFS+L5uZcKbHPqGL5z6EHLRQd1tM7gEZa2Euit6JxpBnLkGd
         atKg01JTUqfsDEbnsAOjm906D7MclMbwEflgyhw4QrXK+rnqJG7PeX4zM2UZGRrCIpUA
         ZUJrXsfcM1e7C0hTymhApEEHJqp8e8D5kdNiLSai4OAYvno5nBM1J9Cmi3BtjFqCwnfp
         Jcpv9qA6r/W5etmPIQPZa7T1yDLXXKTt+mYdaAoMUwrxIKtCVwNoHL5V6lLeRURHrtuS
         AVagbDtQHbv2W4Dieuc60684dCf9xriDhzX6CZDZtUKC7TEdEVUg6hlJwXz4M4LI4FEN
         ecog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657564; x=1785262364;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=it5ObXphukeKeuw0f0OcIKDADQBa8BIXKiD+JocV0wI=;
        b=NQfMpQiI/QJhJ2AU90nU1Zqf+hJ3odF/jB+cBHi8p3e94QrshVlc/+F0yzQxr9c4Vm
         3c5NyliQE5dxJE2pXww2H1LASby9GuoeeydSk4DBzY/bMbkdteVG+W3N/9vS5mIHQ6xV
         J9ZaeUBzNJktI5XgffYhaQJsNJ8e4uRUMME08Rph/k8o3KnMtZ+3/eUqDYb6qfYg7Pqh
         8PHvUz6e5AfsYqpxCjr6ijBFYnolS9fxt9pekChuq/eZqMJFqMoNN6BmWiSHqBbydj9E
         xn1E9o1cUqARqikFPsnYSj2ezJGlm67Tc1vgVeLIbQK7g1QEE/bNCDvJ8i5sl9MnSqGy
         DAVw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4Ipejj8ourn+b1F9Ma++3GnJEnGqB18m4gZMSTWu60wXSKgNH0DscqFfaztXaQ600jV3u4n+8/Hg3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Wgj1tQCKFZuSTGxySGl7wLQIeTEHExjVuNa6GXvkt/HOKGJz
	E07cVceRTLeoJJU/gjRWflEJ81Gh5COBMZpMvbvElmtLJmR6wQpVJsx+H9amHfYNN9uHFb5xXfD
	xh1IGJ9FucJAQEvUSGnzzx42LTQDE37fCpdGnq0BmdE9rslOU30arupFliBeT51Cn
X-Gm-Gg: AR+sD10LS7dTYf0SJbeACLSamWiCz2VAhezJ8XH9XHlYo0R8cYVJEpFw9Hsg6WTmXht
	e0KNOh6kAk9Az+q9maZAVYxNGqKZjd16QiKs5HCywWLL/yJRN3EavOAETWRBfNlUH9Vxjb2xs8j
	KUWVQT2J9gIVo1oX6/KnEJh1+O2/ojy+YdH0V2abEOIxoYHe4/XpXOMKe9XLdaH1GwBU6/1YFvn
	dDkZ3pRAmnceiwqRr9d3AREPPzYaOxf5kP0vZ0Eul1jadPYB3Mc7YN9biIy24yIoHLpoebyrKaM
	lJQX6XqA0G5vidcD9lSDcpzxiGRIrKkiXAdY9Ka0qZ5GEzejf4F7CnFWG6VULWJXpcDwnaYt8Xw
	Fhvk7cPrFyvpL4/RlWEX/AAETvuQ76S7gFgYYj4sIJ/UH/4K7u18X6Apwba4J5UMwEzkcxOjX5C
	YXrIBn+5YYgrW/eg==
X-Received: by 2002:a05:6102:2825:b0:737:4ebb:b474 with SMTP id ada2fe7eead31-74ad172a9abmr242579137.11.1784657563694;
        Tue, 21 Jul 2026 11:12:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2825:b0:737:4ebb:b474 with SMTP id ada2fe7eead31-74ad172a9abmr242568137.11.1784657563253;
        Tue, 21 Jul 2026 11:12:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41c9bsm596921fa.19.2026.07.21.11.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:12:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: qcom: remove the ipq806x Storm audio machine
 driver and binding
Date: Tue, 21 Jul 2026 21:12:40 +0300
Message-Id: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJi2X2oC/yXMwQqDMAyA4VeRnBdoA1PZq4wdZhtnBFtJVAbiu
 1u343f4/x2MVdjgUe2gvIlJTgX+VkEY3unDKLEYyFHtGvIYNc9oeU0Rbck6YUNUx953ob07KNm
 s3Mv3t3y+/ra1Gzks1weO4wQc9v/BdAAAAA==
X-Change-ID: 20260721-drop-sound-storm-7226df1bc850
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E8V/x1G6mWLKxmhw+H2N0U4tbZHI27YliCj8HcFUUwk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqX7aZLl3LkSjmfDqTlXAqjPA4Da0FLPsJYVcbd
 Xf9nhsi/hSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCal+2mQAKCRCLPIo+Aiko
 1RfDB/4xuCceM0X2tbgufpxts0hkuihwIZJR1fzJ7D1ftlVhUeOJ3SRF7QLDprSax9n/SgN7s2g
 hLT3RRWaalry0RfxwYMU5FKJCNGPE2XxM2JwkW+BTOCu7YAr2lKQ2/5rlVOvGFEnMOafllzty37
 4LU3WjWda3QrvZJs+yR4AzKngED99ZhwmQSTkXaXi/r2uRiQtB6gwJdflcoabJKDDFRYTAWcW5h
 ro7phYSBhEUgbeYTjLNOhwhDbbJJ+GlyS6EZ5aMKyEy9W9XqFeGB2OS9AKx5JIJKqnyfEImU4EY
 4evWQUuAVRqKg3yDOuM7Ff/IaYQE19TWk6fg2kSGhp66iJOe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: dUY3zGNEEYxdtoZ58anx4MKw4i6miB8d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX6X88wr7knmNH
 r3WltByW/VF/BGJALz5FkelGBb1tsHhMEtVgII5pXU9740fnmWijnwDN2oOKkg9xmSjSgvbA6+z
 ifeCNcuEChsOX1hhCXS703wiLv9KQVc=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fb69c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=rruK_xjPGYUd9-Um4F4A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: dUY3zGNEEYxdtoZ58anx4MKw4i6miB8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX1zkm4iy9azHh
 Y5BKtigYplRsni9j/HD08LDntlHSt4FP2CmYsIDniDTwjisAHGT+SVJmTRutsjUgrHfv5T5I89t
 9J/q5zsSydcU86NTNpOKpzgfUc4X5bB3LLE9olj5btSkuKYRes+w+ibgxRfT84bhSbLuUPlla7V
 USVuQwRL8D34EcOaD5eou87RKPCJ3ye/L2+9w6ysvu00nIhxiCKzhQTS1qxVRGiBC1UmcH51YEo
 XriIIPNH5R16A5u5hONmrj7L4Ni2uw2E6aTEzBEhZ+jBWkwciawHHHA33D+XbNv0dcwoynkBA0l
 PXFlrm1O7FebSPwpYo+Ngz4Ox1Ku1yAE+TpiPLwYA9w/fCSVQ1M9QTFtbyRNFLrev+h/8aGa5SU
 w4KiAAdRYizSCMENJMBVN+RJPcD174XuDxfV5vEVYBgBH11+fdgq7fj19rj8Zioh6ZnCieSSJwP
 YVkRDLga9e9DLrnPxLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210191

The Storm machine driver targets Google's IPQ806x-based Storm reference
board, wiring a MAX98357A DAC to the LPASS I2S bus. The board has never
had an upstream device tree, has no active users and has seen no
functional changes in years. Keeping the driver and its binding around
only adds maintenance burden for code that nobody exercises.

Drop the machine driver along with its Kconfig and Makefile entries, and
remove the now-orphaned google,storm-audio device tree binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      ASoC: qcom: remove ipq806x Storm machine driver
      dt-bindings: sound: remove google,storm-audio binding

 Documentation/devicetree/bindings/sound/storm.txt |  23 ----
 sound/soc/qcom/Kconfig                            |   9 --
 sound/soc/qcom/Makefile                           |   2 -
 sound/soc/qcom/storm.c                            | 142 ----------------------
 4 files changed, 176 deletions(-)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260721-drop-sound-storm-7226df1bc850

Best regards,
--  
With best wishes
Dmitry

