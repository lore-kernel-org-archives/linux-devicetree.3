Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F91735294F
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774424124; cv=none; b=MeaQOEcxMavhO0X56T3E7pTHZkVk6jTj9vcgE+zhPftR6r0/bXQKqcPz1/tJ4EE9cD260tNxK+fbNkZ4wA57ZtqREJSUyX/WAcpNADFMQ1xzl0fYPVsahU+ufYkbmFQYVrCsC6IbZdfKfPtjjBEDjQWDljtfXt+y4bHr9uozfkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774424124; c=relaxed/simple;
	bh=rnMA1FHdt96n+5Z/F/ztIUjvAXDoz1qDvjfSjRdv2No=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=olM2Ko5remzxAZLC/4FSKO2386p0wiZGJf17LAjZZMVPgTr2HVvfsKtkJS1OckP2JjAwwyD/Mh1FMwfuLVFBTL0AvFfRbOOUNjJl2fDSO8gXu37h2lqVEFNQLc9+QaMFqhYcjH02YmhtBMqxB+TVx2pwdnXkRth0HC0ULrFkC60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgRiCr7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSrZUwRL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgRiCr7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TSrZUwRL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P2JAU73057336
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eWN5vlTiFn9HW+Uy2PK2ok
	+Hs/VyEd9WSFLrAPs+37Y=; b=NgRiCr7S6TsjSiEOSXOcsXfQ59Ute2pxl3i9uo
	cUh1pAKHm5u8XzlwN6bg46wTwZ3Sw91tUmj6eXFe1Jx00QG/CgoMpDvFeS9ZgGtt
	V8sMD3MzsEihpiMCWIsmYsNM3HxdT7q/az6UNW+G67ASn2/TdT4IUCx0nbhDfDBS
	TzJq98GdRTZveDTSZLmFgXeyvaGrTbZ4XTmlbjutxnVzwgj/J34g9JM7FSOrFlL+
	WSfVkRTHCwYyNhX+Zformr8WVBXI6ZsytAaIjooXgmWbhS/AF7Hc+x3RJO6+6LnD
	rzRvhbxHCOKJwxrZXdm8Yeq2r6czSelmT5f76Z1OaDViyCWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp0xsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:35:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c0abf427aso1289061a91.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774424122; x=1775028922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWN5vlTiFn9HW+Uy2PK2ok+Hs/VyEd9WSFLrAPs+37Y=;
        b=TSrZUwRLTdD/89Mcs5y82PEpu61yCvOwcb/Mr4IrjWFPl9yDnqgxzCti9ZRLfVhsUL
         bzUIN8Q6yGFElmQ7wZyzH+UWeA86QS0BEMIqyYm6mQMFtzvx1mdIq7NjvnuDb5RZs59w
         rSCZ9W1wJNoUryimZOVHXrv3yWwlP9aofL9K0REUAjHfuX6fyD3+GUH6TSF//hriFybf
         za5IsAhrgGsoOZzau4UcrVU2EO8JTW+h/SQhUWqTohSHh/f25C3ZEJf8V5x1Ht4hwP7r
         7Ng1+KSKuVK5MZwmqVBORljUjZ+tI/P+/LVOuxGiHChlpBQTJ9Spl2Vn1LZSTZUXWr94
         jQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774424122; x=1775028922;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWN5vlTiFn9HW+Uy2PK2ok+Hs/VyEd9WSFLrAPs+37Y=;
        b=YYsvNFuo/3Ekpe/rM4S/DbofLuncKmCR4GO0T7AZMeytJs45/Bc30VrgUP5YqXDfTK
         yczgiANaJBsB51Jzg2D8WoLgo4cs9UKI+41vYosC0LqtmGtiOvVqgDzsrnroH4hLoKMs
         +3NgZl2nNcjPjNxJN7ZyUbgWqexgQOzZZGn7KYFgJuZ+8AxLM2LsWtgX9V74OquT8YuP
         TrXw8EtvYuSZkkxef7pNt4nQj6nIg/maNJ0m51JEaJcxmIo3sLgkypxeFREbkHShqkcy
         QG9bZi5ZHhsCacUMlaQm8IrtMiwUm90mFIv4SbFo3ekITs1D7sv4pifap+Yp9uasP0VB
         6IyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSyny9XXVQH8DEMCSAjhBhuJOtgcGM5vfxLUpFf5G6lDzJ2X7raWJCQ+JDyCjEOJBlZaDhlGM6MnDz@vger.kernel.org
X-Gm-Message-State: AOJu0YyRQ6xMVQOleMrcvDq43cc106mH6qZ4CwLIPRTG+BUQjKLvdUpD
	HQY5l/I2Me+7H8VMb6ZDVxTil4XneztIspONge7a8h/XM4zgyqtRzI6R2Oj2hMXXxG8HJh/ZHwA
	ibmyTR1mwF8w2RBn1dyXX09OtEgoeTRNEbri5Oe6a3cVwbJ5KxJTKSV4OWZLmfRLJ
X-Gm-Gg: ATEYQzwhB6ze6ZqgzxUPx8CS4W5uUuUE/aWLKT5//jom9+xYRD6C4HIZqUPw+8bhcvc
	o9VJl9i5e1Z7Si7zNVZiIM2eRP6YVObkvSaDSby1adNJWprfV/Q39o4bg0OFpOVx+Eq3fb1p4Y3
	uT6rNUcur8/bSRVfjOovdwhiVgD+ZG0S4aZpHyst4/L+UTqLmfhPxvpscHpUlHsFOSmsFkGbr5y
	xH8rBaiLRepEx2bk3UzPUhLN44CsqU7VUbA9wx/3auYMVg1UO3bv6TYJbztWzFzEgT5ACd0aMRJ
	d+Hv6DJiSOgnyvjaNKhtPAUDcw6sRHbH/qIY+vfa+aRTg25018zBC/9xdyGDqerGVpG84oO0Xwt
	9cqE+Glq302VbfKwLsjMcumCYn2cesO2FkYPG1qC6u5Oq82FlsbG/U37AgFnImC07CbFHR6Ychx
	cRYWDHJQ1VKi0yRR/tk1XozwbXuDPK4TxoeEQnm1KAUCr7iTELjNw9NubF
X-Received: by 2002:a17:90b:1b43:b0:35b:e4d5:dc71 with SMTP id 98e67ed59e1d1-35c0dcd49e6mr2351323a91.14.1774424121652;
        Wed, 25 Mar 2026 00:35:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1b43:b0:35b:e4d5:dc71 with SMTP id 98e67ed59e1d1-35c0dcd49e6mr2351307a91.14.1774424121151;
        Wed, 25 Mar 2026 00:35:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03206dcfsm4814629a91.13.2026.03.25.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:35:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
Date: Wed, 25 Mar 2026 13:05:14 +0530
Message-Id: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADKQw2kC/1XMQQqDMBCF4avIrBtJRlOlq96jSDEm1gFjNLHSI
 rl7U6GLbgb+gfftEIwnE+CS7eDNRoHclKI4ZdAN7fQwjHRqQI5nXoiK0bxIFPy+jtYy3SMKZQS
 XSkKazN709Dq4W5N6oLA6/z70Db/fH1T/QxsyzkSNuqxUoWXJry6EfHm2Y+eszdOBJsb4AX/yo
 96vAAAA
X-Change-ID: 20260317-ipq5210_tlmm-df221be105b5
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774424117; l=1505;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=rnMA1FHdt96n+5Z/F/ztIUjvAXDoz1qDvjfSjRdv2No=;
 b=tNx0j+MNihk/1BxkYrSDSUIv8s51NjBDo6BZ+Nl9MhqJcxPjyITk15mSQbHvKl/F2hog+EHg5
 Vs84kCDTWjbCxm1p6emGguxAx3k2KQjQoMiHT320tedDzjaJ1ervmzj
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: SVxeT5wAFEOhpn3YPUO23zVWeVgz46wi
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3903a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DebfbtQ_iApC_oJ65UMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: SVxeT5wAFEOhpn3YPUO23zVWeVgz46wi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1MyBTYWx0ZWRfXwj2fEV1BWZ8F
 Q4IEYUkXcQLVhqqky1uPt/PVu+X/HX9PKFyP20brRFhjotBeFjh0SD8VLCzCyMTuJfwDjRkHiWZ
 f/VCyvFD0D/mxbJuuXYat44aIhIZjKw9ZD/VL4kPohUKT9lYcCxfJ5ZCEuQqvOUHmk61GeQBjvH
 eFtn+gSFs0FWiTTx+fg27MY0EorcN06iX/YAfmrHsKW4ZhxejaEyaePSWuZ+iLqb2S/i9ABeZei
 Ec2BcBXvWdvXeyEHPR5CrrSQjZiYhnRY0OEhQbPAZ8WZM/lmeAWcLbu7WKh6ZVJgVnhoogkQwa1
 VpsLUh38SABWQUIHo7keNy8Kt++HlvlL48dO5nWkHxqI7pb7QmvUZZf+EOI90reN10VYvtG+1al
 mj+40jjpooJMXDI3q95P3A5OlB0xCvBio2RHvnl3uM7fsHYVlzUQaYfxUcrtOP9v4XuSYrWlRLZ
 1pBCX5OzNtvkAAZxyyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250053

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Grouped the QUP SE pins instead of mentioning by function wise
- Splitted the PWM functions which I messed up in V2
- Audio primary and secondary mclk function names are expanded to avoid the
  confusion
- Dropped the R-b tags due to the above changes
- Link to v2: https://lore.kernel.org/r/20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com

Changes in V2:
- Split the TLMM changes into separate series
- Picked up the R-b tags
- Grouped the led and pwm pins for better readability and usability
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver

 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 123 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |   8 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 898 +++++++++++++++++++++
 4 files changed, 1030 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260317-ipq5210_tlmm-df221be105b5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

