Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40A6410D3B
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044338; cv=none; b=Uo0XcgDUDVt1CbFMIedDGx37wKKJuJdxUy/sx7lTY5f3Qgy3nWYDZPKZcqgE2La4hMP1eoLB1/VyJuS7BPlDQLmRv9lh8ysqBk4J3ZtQARoTu4VfRvcs/IwzCdRn/S1hS/E8CaB4Sqeyr5CeFEOXoaV22Vv3CqsY2Cio/ycDmSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044338; c=relaxed/simple;
	bh=f5ZmZnFeNe9D+apRa619ltaKL3wjPFLh8/xksQXLx3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r/R7bJ8NvpnjixVmsLklBCEWfwWTyT48vcKC50N6gSl/A7L7ToUD+jZojYr2qATa4rRtpfLF/80OVpOvK46oTG5EIuyNk+OZSZKm/n2EuJeFtQJmGLe2WWIuWV9P0VVyC0e6yoTPPCrePBJIqXQyqc1xTgtbRHMcDMGXoPWGPzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llmWZq9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLMHL2yp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llmWZq9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLMHL2yp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631AJHn21562623
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kjq8IbqCSc4OyEp3nlisvk
	+bUjiYIQQ9/KSl5493Ogk=; b=llmWZq9BHz8PxW/QnQIlXKX2nQ7fF17Rto9OSG
	3c6WpDJ29Wsmwdk1PEf7XgxOAq4RkSKp8nEJAX170uinGZaYIfTzcVHXcWFSOIAm
	XvabeuqLVFaeEOLcf0WrkNc72ZRB64KYhn8DfZLWZDhyVsHjGUNH/W4JZdYIELmI
	s6PlQ8EkQ8ETUTQ2NH7sHFjNYK74Z/CxicqRsBBmE3XRrFk8FJgG+D2fALa1pgRI
	Tnp/AOi1bQNTO9noh5GejDP3K3tTCQm83FZeguZ+OZBV9emHlK+DmcYDv/37AGha
	6M6r4+bn1iZYUhRYbiLRICUBqYZj+PAHpbjn3DXcLKLHIVeA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3snrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:52:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cd9fa608bso3874622b3a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775044334; x=1775649134; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjq8IbqCSc4OyEp3nlisvk+bUjiYIQQ9/KSl5493Ogk=;
        b=QLMHL2yp91X5fc0U5JC+5XSAavCiP3Hl9IvpQzhR2HBeSkOO7vL05VKYBL7rCUBVPS
         +E8Y5DUoJUwC9DuZshDszluV5CA4AUtxKceZ5HbpV0aVUtFc5A92SBUs8y+nCc63JC7k
         eaiNROy6KHf7NPxcJrTPoRTo0Wb/7FMtW1y5kYRmdK/WOdq+2RnkRC0ixPX77krI4aQk
         dHZTts7y1tCPM+QVfzrPuw9uuBZNmLznx+jrx3LrknZ093RPfdpt11MF03hr6tY8lCE1
         xu7OVV9zJe+xkVT1VQYdy73NolcErahcFiuB8Jbp03RsIufBAXwx8XnnTy6/ZS6u7dUk
         pygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775044334; x=1775649134;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjq8IbqCSc4OyEp3nlisvk+bUjiYIQQ9/KSl5493Ogk=;
        b=sDDZwUEMmwrk6wKEJwE62822FEH7zzKh1tIyWoDQiGsmlAr8nnIlJlJREMGMQY5iJ7
         RVzSGhSWhZrGYwmv9uWO1hUUZieRMoCvNk3kUVuvK8NMfjgHNtD7ZBx7BGd1FdMk72vw
         YvfbFhYqlNmX4aeulIoZOa4hB1ylYSonxoPjeYHmGmNX5MXqqdh91hyWxmW/hbIySHhl
         dHROe1MSpN+Rie45dHEJh2PzwczWvuZNSsceWUqDhODKlGh4DsvYuGepMQIOfkpbRTAf
         xt8grjCDeOTh1tkU5tysIfPLHcjHzz4xWCpXBJCAxM6QhFcFfOJVkUEMcyyBE9GpmfNw
         TMrw==
X-Forwarded-Encrypted: i=1; AJvYcCUbrw4uguk/37ih3HkOXCFtbEzTFcF8lwdMn4Flg+8Gu1blPLgxCEn60leYVqHdQUHwcmn1hJiB8uXt@vger.kernel.org
X-Gm-Message-State: AOJu0YxNURa7AjveixlRHTw6pKANpH06e+uo2kYMdx5tO1Vd1F2kUCjw
	90Y5OYVIcMxiiV66ofZ5v1C+mKdm+3KplB5zMo9k3zrhucIJtOHGew2rtxNpFmnbYbXVdGFZFrp
	5DvkoHwLKvZjjp7RhywnQQoDncnZ3NhQXclqscmyEmNLeucr+ldW4yailIoqzhD9x
X-Gm-Gg: ATEYQzwAitzafMo4ipMRBbrg7M0kY1+A2E1s8IdsoXDQ4D98H/+xAvTIHzho9Iy90G1
	zSITJ1oa4LDUoz02LpTddfRAtLOG7sN6Y+BD/aOegWFzoLAgUqhXp+R2KUFnnXoGZLNFs1YarXl
	OVGRo3uT0FclUHVTl7o1ZKDknHt73vMxBGSpYZagwxUGYbWXa3CMau0Gjxg4QO/MNOvXiGqchbV
	8O1fA06AXGbyYA6PC9d8/cG1FSqxaT/u7sTuv0fsX74XhA0qmF0y+uCud4H7xAtNybRQyuDw78s
	bndLTYfrfDP2EnXNlWgunU8nFLgHKdhsZYBYPP/MJAHan+6qu2dfeEBVG7EzxsNPYdyKrcNnKC5
	Iw72zDeO4Ss3ACGwaEVdVGc3uyejl1GYZteNLxf/Ws+VyptK6
X-Received: by 2002:a05:6a00:1951:b0:827:343a:a1ef with SMTP id d2e1a72fcca58-82ce8aead3cmr3757188b3a.52.1775044333679;
        Wed, 01 Apr 2026 04:52:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:1951:b0:827:343a:a1ef with SMTP id d2e1a72fcca58-82ce8aead3cmr3757149b3a.52.1775044333085;
        Wed, 01 Apr 2026 04:52:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8465785sm18128456b3a.18.2026.04.01.04.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:52:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for Hawi
Date: Wed, 01 Apr 2026 17:22:06 +0530
Message-Id: <20260401-hawi-pinctrl-v1-0-4718da24e531@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYGzWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwND3YzE8kzdgsy85JKiHF3zZMu0NEMz46S01GQloJaCotS0zAqwcdG
 xtbUAbvSE/V4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775044329; l=722;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=f5ZmZnFeNe9D+apRa619ltaKL3wjPFLh8/xksQXLx3M=;
 b=N+o+sJkXtlG0fNbp7rzR575Hc4i96x68cRYUgib4vHaXfoIAoBG8dyl2irbOxwobBsRMwoIS9
 +Ck99sR6WfaDiJOafCbVocYkBk4ryoedLcttYrrHXCxNnwRB7ZCk98G
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: J7KkthAfSNLBZZOulRvm1GhCOI4Moi4W
X-Proofpoint-ORIG-GUID: J7KkthAfSNLBZZOulRvm1GhCOI4Moi4W
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cd06ee cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JAQA1SFX2CWciKQcUckA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwOCBTYWx0ZWRfX5g9F1EE8fXmy
 QBpu7N/a+Q3Yb8h58K1VD6VoGlWeGE23MJoF6uFJVON9oT85KKD1PNliTAMua9Up5YTTahv7uWh
 gCGOX1x6173xZ0JFqscrIIqSeXgnrL5jzMVjTOPARa52OJuWM1wc+FOcsyFhF3uOPoNsnRPpi+w
 IB7nsJGMhgo9/7WSoPwgyomLnqH3/XvCvBqxJ7B2J6ladqBROdA/fVGMiFL9AtsqJc9ftSj+ErJ
 ZIBlytvYDGpfqVvlCluHhcAnqsAwlShTghVwzXDGRQVpA0WuQKytduzVKxQR3/DGn5eN0Um13LR
 /cfTN7ywlvLWpFlSPuETq91+PZuFuBpOHxurXZdd5i+I+b/xeNuVV14Wmdcz1+8H1JeNJ3l7fPk
 VLJ69wYUjgt63m5wZnfFraeXHK8DwJaiHlAuwLXcvGDMuOCt83ni993GMrWTdJ3wbpbLHhzY3vG
 ThsjK0cx4G76UNV8X6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010108

Introduce Top Level Mode Multiplexer dt-binding and driver for upcoming
Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Mukesh Ojha (2):
      dt-bindings: pinctrl: describe Hawi TLMM
      pinctrl: qcom: Add Hawi pinctrl driver

 .../bindings/pinctrl/qcom,hawi-tlmm.yaml           |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-hawi.c                | 1716 ++++++++++++++++++++
 4 files changed, 1850 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260401-hawi-pinctrl-7c9ff163bfec

Best regards,
-- 
-Mukesh Ojha

