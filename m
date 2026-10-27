Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124520;
	b=UUcYqZs4ekZZ7QaZJwaERdT7xsmUJx1CzSRrtaNDIsHM5jQW1ivdkFQBOM/lkpWnFPI5
	 aD/7DjHDauEJxM3p551lP7BQk4OqwqHeYnbhc+aZgkKhfIRxKiloXsscgDl/LnfgdhPW7
	 JwXHTwP4hUkbk1K37R4Wz0cNsn3jpeBnNW/5UKIceSrBhX9a7dJ8I0jp33SNbWIppBSOQ
	 1sPhIcZhagAyRUZfIPqCVd+0Ac1/+SOEidYwT3w6US+dOW5btmBWwj/QFjaAkWXT7MpT1
	 jPsdxwscO6n2f88Jp4h/iuep+hieE3VDCKMck4FJz5WKTY/JWRSeTV/SKlPn6RNF2ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y8i+0/bYzkCsLjnd3wJ0YPHFhoKgmno2YUxASoV3BzE=;
	b=2jqWXzzYx1D6em5V8+G1HvQBcmWBafEjNenCG0xh8OCXu6Cv828Bf0FLIOugBqmHLPYZ
	 /hEW0BVVtMZlVQowuZaTc+feKhtNEXCF7zQX8G+dt1iajltvKEoZI26yx5i1cEmsLcO/6
	 JA3KR5R/f4MdR39wDxUnyoozM+MdAnn+aK1fwNvbxVL144ydgBT5bSpjmxXSywmWS3B75
	 OMZm4T34CwPbpHwA/8Q+3iEINRGW/20jkPPxVxVU2Cq0x3EZKG7aGtIeg/5GjcEN+4TFi
	 OMm6JyRzOxmgeC8a18Bl7MLfvCjjj4crJVoZcupdBgatH8NubOY29wjz6K+8gM2cNng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="f8g//xNM";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hv6GFNR5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601D606A329
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2601D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f8g//xNM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hv6GFNR5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RH01wM2772459
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y8i+0/bYzkCsLjnd3wJ0YP
	HFhoKgmno2YUxASoV3BzE=; b=f8g//xNMWARPJrmhNIZvM2Uf2d32EzrzVbirA8
	bOnsZ8u1Q+5QMeB+xxuRJiEOGcpFuX02Mh0XRNv+RJp8R6u0szL6wFr1y7gaG+dn
	HawiE/+/7MBgF45zk7X0fKuwJGhJ84W1J/4gWmKIj0O6tu3KHg15w4p9JMH59rN9
	gO+CHVNDRYEW58UZfwudfxvJbRlffKe+DQLKLqi3eIM29UsRTw2fUxXT9+iuNU2m
	8NXtnE2tpj4ekgTOwdhDEVWh9cm2d52xPZwzzVFELBD4MLcQaDu4msqNbZGo3Rr8
	kiHYtsWznAGyV77PjI6Ad1wjZVr3id0CpaW+7eLhLk+qT8LQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6acbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:08:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2f2ea3c3cso162869c88.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124518; x=1793729318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y8i+0/bYzkCsLjnd3wJ0YPHFhoKgmno2YUxASoV3BzE=;
        b=hv6GFNR5AjGYikFcKglsYPutYre8VVxY2P6NJpOMP9lhefPYt/vk6k4Tbj1rcScMLn
         t2VE8Ug4eNp5qfW1SXfWAXMd4+xvm8oaMHQO0YOVwKFVHxGJ38duKmF3hhVciAeEKyNY
         Fss3eGDYizKTeLqCLLJU8wCj7AhZxXJfQ54sIuXIV6mDjll8GA7RP8kcecfCJzqFXkWM
         oLYMXgm73BEMBjxyDX1HpL5/WjTHEeH3NlUPoSDq3KSmfSeQsNDNJPNi2NjAN0XIpZ2g
         xbcoUm3eqG3hxNX82q4JuXv1TB3qWd4bRF6AHyG/UiK7bZEZ1v9qMFgil6hkwSewWn17
         VJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124518; x=1793729318;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y8i+0/bYzkCsLjnd3wJ0YPHFhoKgmno2YUxASoV3BzE=;
        b=dYRPBO22essYiPgiO4R1Btd3loOPLuDwoDhNviukK6LfqeWcOFToQ9iyvo5lY6uQGB
         fo4/X/DnNI/tFVU9sRug9IIDVXybiXHOrKXqvPf2evKRes5o6SKaT9wBtBUXxFEwp/Bh
         tC5ZbTF1TmhMwkfPVGb45wGR6BY/63xFdcP6N0c7FG9y0ZzdF3/UV2NCMbrE0m5fEozn
         u0dd2qfaxbsqdc3hNnNtCxaolyjCZRiz6DlBxqrN28Syo+WqYubmso/XIcG83jduNCEV
         6Wfr21HV8CZIlQYNBT11QfudvDj4jqjXLvQ0lT3npO+SKnKXpbarwiYIltV6YvOBp8Je
         LEsA==
X-Forwarded-Encrypted: i=1; AKwUvByq5mIYo7IILjaiLrPFINdB0wyUyJkbCGuF0rK7vfXauiwz7Ac4bRkLsixFoSEUgscxHvxHqob4vdFC@vger.kernel.org
X-Gm-Message-State: AFq9FYI6v7Scg6DCj/161W3iC8Y370+mt867RvFJ6PHeoPFzD+S3XZ9n
	kAfnYBh8fQVLxIk2WV2hGlkNl1+NNTSe+6Uko9OTaU5ToaECtXeCPkEjvy1ZL4TTChKePimchn1
	aot7Uaf8wPOv+LjWk/7wn7Pap7GjB9vfk7XzREOcuhtYKahoKcBZlGkqBpDm4GGyv
X-Gm-Gg: AYBFou1wQ10G8cRVccxc6ZRcb7vWTBvtjJdKepAyUnRD/XKBV8UQo1EgbfH1IZlT0VQ
	1o+V3paUwfiBeQaGKDtvY4ntDtNcbh3ab8HDHMDLUIneXM94VcZKsEybOqsXWblj0hCvE3IheLZ
	CB/51sJtH5J705jqLm0z2L+vNM0MSFozcyAb67GmNYGo6iK/wIpMadeblVQMb52aTA6vYYRcUzR
	wEjXg/Dr/UqAfpUFaf1Uj8/h4/qWwHSEe7V6PNIv6/6SoKFrbcvU7q/4TLjSFcDnbtUwGcoOy3G
	ktDrJzoqnwhHlZ+TMLTvT0M+AI0NCYZxuYTYdnAxovFuFgLnR/XvR4EwTZIyfI797WZKz6BQG6k
	cXXXadWqRgbLbk9E7jlBQDNq2Eieje2TNRxlLppoA4K3TXwVYp2cNmGZ7ifnMQbc9fTvKEHLFyQ
	==
X-Received: by 2002:a05:701b:2405:b0:193:3274:aac with SMTP id a92af1059eb24-1a6cf72b9c2mr925c88.37.1793124517459;
        Tue, 27 Oct 2026 11:08:37 -0700 (PDT)
X-Received: by 2002:a05:701b:2405:b0:193:3274:aac with SMTP id a92af1059eb24-1a6cf72b9c2mr894c88.37.1793124516585;
        Tue, 27 Oct 2026 11:08:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:08:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add Nord DPRX clock controller support
Date: Tue, 27 Oct 2026 23:38:25 +0530
Message-Id: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJno4GoC/23MywrCMBCF4VcpWZuSG0115XuISMzFBmxTMxoqJ
 e9uWhAquBn4B843I7DRW0CHakbRJg8+DCX4rkK6U8PNYm9KI0ZYQ/aE4yFEAxczxgmL0kYqrVt
 BURmM0To/rdjpXLrz8AzxvdqJLt8vI7dMophgIyRTjjtCr/QYAOrHS9116Pu6HLRoiW0EJn4EV
 gSnBG+EJa207o+Qc/4ArZ2sUu0AAAA=
X-Change-ID: 20260903-nords_dprx-4903d7acc841
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0e8a7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dhWb7Yg5Oiobcms0P14A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: x_qdmNXo0KG-sFUcAbZxT1yYit191-4o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXz8/tpA9kn6WD
 eya6kqDixtB0K0NwI055YNM5eNr79abriM5gw3URsa5Bv1ZgjRh2P7DjVpwJg3BUPzQnaUFaEFN
 RN4YtIKtbnt25ApZ+DxRKU9bD70YPK4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX8XcrtMRjnfa4
 jQIG3/97OhDX0WR/2dLs5UE+udf1j8jUX5dAS7RCUuRjqVYTrDh780WiO2+aV1IYslgjDyNocnU
 l47GDj1QHeortmDmywgg89MMR/RNe2Zj+ztS1SsR7+9r9G/9cB34N5XciS9aaeZqrDf+ZG1ww+h
 60nbPOfj2UxXNk1wAj9kO4cuoU7r+m/RjxmWgEZqfihcsJ2cuQFqrpvfjJDJsyXvbYOqwPq8KeC
 GmPTY2caUJIUSjzVf4bA7glwmevATJfUfbmQm6IfcPdKBI+rjoShqdgwmuUkK1zgEh3nKJhaVQo
 lZfXcNhlssioaHi2ZyjhBfa95E9vLBKml9fQ2nC65YfKW3uahxJGdtzAbU+G+YXoGoqWpqA8RvO
 SD6VqQzglv7CVAbuHi8qo5VkzdrUj4i6/ZqoTQW3gRVrxhjVP2N4pLRhtVsuDLBC9Vqtetf0DB2
 XA4a/go3gAIiDNwS3MA==
X-Proofpoint-ORIG-GUID: x_qdmNXo0KG-sFUcAbZxT1yYit191-4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270072

Add support for the DisplayPort Receiver (DPRX) clock controllers found
on Qualcomm Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with their core PLLs.

The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
been widened to 28 bits to carry the fractional word at a finer
resolution. The alpha-PLL core must support that width for the DPRX PLLs
to lock to and report the correct rate.

The series is organized as follows:

  - Patch 1 fixes Zonda PLL L-value rounding.
  - Patch 2 adds alpha-PLL support for a 28-bit ALPHA_VAL width.
  - Patch 3 documents the Nord DPRX clock controller DT bindings.
  - Patch 4 adds the two DPRX clock controller drivers.

Changes in v3:
- Add a separate fix for Zonda PLL L-value rounding.
- Add runtime PM support and use masked divider register updates.
- Use the preferred items form for the power-domains binding property.
- Link to v2: https://lore.kernel.org/r/20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com

Changes in v2:
- Address review comments: remove unused definitions and includes, rewrap the
  alpha-width ternary, and clarify that DPRXCC provides clocks and resets.
- Add RB-by tag [Abel]
- Link to v1: https://lore.kernel.org/r/20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      clk: qcom: clk-alpha-pll: fix Zonda L value rounding
      clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
      dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
      clk: qcom: dprxcc: Add Nord DPRX clock controller support

 .../bindings/clock/qcom,nord-dprxcc.yaml           |  67 ++++
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  10 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/dprxcc0-nord.c                    | 441 +++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c                    | 440 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       |  27 ++
 8 files changed, 995 insertions(+), 5 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20260903-nords_dprx-4903d7acc841

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

