Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8698F278161
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593647; cv=none; b=akN4Nb+/FkEFBBMGhCvWFuhAhumu12VntSB6SPIm6SAKnbYliFEfZu/ihi0b8r7ZHdRXkW8tAaKsdVnkVXlFfgMjSZM8eQmBLN3Wm+PIhTZuTBQH78DPxA06Ou16pHEgS2ShJw+HeXS74AwdggX8Xf2yKRpK1pciYoyrBMawajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593647; c=relaxed/simple;
	bh=P0/Yeeq7cIt6/u/YPxpzy3YUTDJy7Y9Eel10Z2r1iy8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kmxJcMBTg/CWYDriEILMr4H5Fd8DMyB5fWAIedqeLF34p/U4f6SDLyLg8r16pn86hANlisvRfTkQxu4cL1KkeAjLt1A/e9bp4SzxJQlOBqevNNc1wst1d/0SIncxLv16/oA0k0Fl0ZxBJRaD0mL8IbWh6i1+PH7gNtHg58geax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVG9ssbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clpe+U7I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVG9ssbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clpe+U7I"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CaTWv2779382
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 14:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1UesC0VYOtxC3+9xvlKyBD
	jWvgFU0kwUIpxcXtCaCYc=; b=UVG9ssbE97+8cAU7kdJ4PaRyOVlijuKLXCqT9Q
	gCtN3DAlpAIEo1sI40F5cdi/FYxGefIJOfevzEqbm13ZqLEYFimAKWAx4Lo4QQgb
	gNqhHhtOFqEotZG/JKB/6fEkMmTqLHd+JCeq0Hmy/TqikX1lJi2Ne+BwBu83sSw+
	5JbOpHntGFHgjiVfZGuhhPkJo7HUp1p5cjbsWoFwVUvKYDXC/OqiDnT/IklKAA+y
	97kHU3b8bKAAyYhLlM4tzQtYOJuNltafvtG2xvh6/mjsZwk+xDM0FrG8bGKjKqo3
	bJg6Zm+FdxS/23L3JJ8zmSu/F0nV0bVe5RAdktkUb0UvpvDw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9668yy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:14:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7621655eso3456863a91.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 07:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593643; x=1786198443; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1UesC0VYOtxC3+9xvlKyBDjWvgFU0kwUIpxcXtCaCYc=;
        b=clpe+U7I7SdK6DavLIWUWxNxOjUWGGcqYdvhhHLNSp+e4nuQycuAJ3pZKnAkvflnhD
         qVHUOxDio+Fk5bUVXuS5QWBIqk3KQfAvxIFEEtj5u1qDPJj25zi6uuHHn1Lbe5y8lAzj
         9mRsG8wSyVDTFZNWrz4ToYH3lLsTeUAx3BiurOqCSQiISaj7rGZCrhjKzY5MrnzAI+LK
         Vs53KM6ITCQSp8pp3i7WhrssVxgufqrc81UkfgwCf0kf4ddu9vkKvrTrk7xcSBJi8mtv
         beZw2LWxTXJlTofiJG9Oe31F6U0QCntmVDOQZN4v+Vef6d1fYlamhLVsYQx1E8i837PP
         0KKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593643; x=1786198443;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1UesC0VYOtxC3+9xvlKyBDjWvgFU0kwUIpxcXtCaCYc=;
        b=UJuNKyCGS5d40rT92D9rQ0rGiMQSwMo9jMS3fizA9OX72vpjotOGpP0aOLNXseDD6Y
         bOO6aeIxzRfCRun+J1GzyStz7LpscGbaFDTUVaeXsrhIFmf9phf/0l+bJACdKkDBmBBh
         coIxJGhrMa/3f8szkgBMPQKKgP1HyoAMYxAEE+Z4tWQHzKtLTPGAsIhk3nj3tDDUD+kw
         YcRtKSRBVxI035XSKW85vgipMZX4RrHShgDth5vMT5SCMn+V/XxSq9WF6BI4CDQaXVwf
         eUjC3A5gCsCVUitbE75hidjK9PjfSGCOrcVwyRByOkYr7eFt3U5dEiCWmWl79XYjIhdI
         9ElA==
X-Forwarded-Encrypted: i=1; AHgh+RpcxRjsRrEtqQ4aQl/WUEgcCoDBMxExhEjL9WHTKhuYByhIz6ABJmyVtM3NDu9RhGqozsLjFBIK0ZXT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy5CJIhvI9rpBisH2ffzMuFvXrPYvjLM9AMsN7mHJ8vM7ml2dY
	TXqx0nlrzPqawuPTUfPwC+I82arQ+pzPBdWfSzG55sKLAsSamOhoRL4dKB6V7/RD5F6ez8oP5nf
	XeQGKjxYZ8+rBgQhUzguTjXbIDrjSCm/tn1/dm8q8fXDRE8fT0vWoJDBfegxDr0qR
X-Gm-Gg: AR+sD12XibW1nMosalpaU+tRz4GbtT/TTHKI+pTzBRUUbMOzlMc0hEOdINd7M/P1VQf
	I6rW06ZOWNFMd0j34IDZq6JPhXtuHWJ0VkKJZeuaH6b0FplBDp2JXancc6weh7I5wsrCnnM+sMx
	NeWMXUgeRcUY3KjJKTBE0fHSoEKUoHojQZdhYxDZaf8RT76l9pshf6ho5+XdnL0FiovAvNGbwlF
	JGrYk/T2XCHNdpygMep5xpC0crOeI6ZRXgIstz+nIIY3VX+fi+NASsOc5TZhZdfyis0BAah73OZ
	eC77ji+IB9f09Ppod1Wd/YZLw/2N/QLuo6uMUqHDwrYwy6SCYFWIngTaNY7oGdzeu1+Q4Y8i+OB
	hcT4aF2oYnZusJYrB03V51vsS
X-Received: by 2002:a05:6a21:3086:b0:3c3:a1ed:3c23 with SMTP id adf61e73a8af0-3c92a53bfc2mr3734810637.23.1785593643278;
        Sat, 01 Aug 2026 07:14:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:3086:b0:3c3:a1ed:3c23 with SMTP id adf61e73a8af0-3c92a53bfc2mr3734785637.23.1785593642826;
        Sat, 01 Aug 2026 07:14:02 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:02 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/6] clk: qcom: Add video and camera clock controller
 support for Nord
Date: Sat, 01 Aug 2026 19:43:51 +0530
Message-Id: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACD/bWoC/32NXQrCMBCEr1L22ZRtqv3xyXtIKel2tQs20USDU
 np3Yw/gy8A3MN8sENgLBzhmC3iOEsTZBHqXAU3GXlnJmBg06gprrJR1fuyjjOyIejIzkWoOzVD
 sddkiVpCGd88XeW/Sc5d4kvB0/rN9xOLX/tXFQqEaDJcDt9zWNZ5cCPnjZW7k5jlPAd26rl8cv
 /XZuwAAAA==
X-Change-ID: 20260706-nord_videocc_camcc-858b14239006
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: nvwC3FUMu6NISIhcsr1vSs5NzYLj2rMD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX+D7aFbDNxToL
 BoPqRdMQP+adiM/df6SE4TWzRJgyrG7oYJMJ1pK6OglG1/oPRlSo1LMNNUHZvYklTASkeRZk21g
 gt5TbK7sHH0I2HMeIoX+Z+p2ueFrH885XLBkNJPAxEFSmknQcCoSkbbN6LmyrHZO9t9DIOHoLe5
 HpwIe5j0wE5t3i+6qVP1X0apO+d6+yArSiQEaDH3bhZznMpilKzOoKXNp/4mO5Ttn9JTGMIPrJw
 fVEZxSpczr0igjdlHYGbrc9AxmAem7iLXZYEz2+wUkn6Wh+YPGYiCbvT/U9MceXDwj4GpEvkomv
 26yPHe6CGjMagtAv/hKd+oI/yFXnkbv6MW3lqg8Qr8AuAGWNf/+MtjrLH7TQy2E7uWXAaozhvoB
 i9mvdqiFsFsFeKhRIO9Ly0odGhbGKAqD7y8G9U+LhPOgkzii6pkV6V+2p96VtgkXKRraCz4XjQ1
 8MUxz62wWQPSVKT3+Qg==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6dff2c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9cNAs4AFZOH6BTihgbEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: nvwC3FUMu6NISIhcsr1vSs5NzYLj2rMD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfXwKPQd7gihC3I
 ab/b3z9U7nBBGJOPNj2a0us9sOT0e33GP5VR8TZVGf5rg5wJ6+qmy2qZkPveFqLhTt6Wao8Vn90
 +BPH9yIOupknKX7qaSuTQLbmVPA+Jys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010114

Add the DT bindings and clock drivers for the Video Clock Controller
(VIDEOCC) and Camera Clock Controller (CAMCC) on the Qualcomm
Technologies, Inc. Nord SoC.

The VIDEOCC driver enables video clients to request clocks required
for video encode/decode, and the CAMCC driver enables camera clients
to request clocks required for image capture and camera processing
on Nord.

The series has the following:
  - dt-bindings: clock: qcom: Add GCC video axi reset clocks for Nord
  - clk: qcom: nwgcc-nord: Add video axi clock resets for Nord
  - dt-bindings: clock: qcom: Add video clock controller on Nord SoC
  - dt-bindings: clock: qcom: Add support for Camera Clock Controller
    for Nord
  - clk: qcom: videocc-glymur: Add video clock controller support for
    Nord
  - clk: qcom: camcc: Add support for camera clock controller for
    Nord

Changes in v2:
- Add GCC video AXI reset clocks and their DT bindings as separate
  patches, needed before the video/camera clock controllers.
- Extend the existing Glymur video clock controller driver to also
  support Nord, instead of adding a separate videocc-nord driver.
- Pick up Reviewed-by tags from Dmitry Baryshkov and Konrad Dybcio.
- Link to v1: https://lore.kernel.org/r/20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (6):
      dt-bindings: clock: qcom: Add GCC video axi reset clocks for Nord
      clk: qcom: nwgcc-nord: Add video axi clock resets for Nord
      dt-bindings: clock: qcom: Add video clock controller on Nord SoC
      dt-bindings: clock: qcom: Add support for Camera Clock Controller for Nord
      clk: qcom: videocc-glymur: Add video clock controller support for Nord
      clk: qcom: camcc: Add support for camera clock controller for Nord

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/camcc-nord.c                      | 2941 ++++++++++++++++++++
 drivers/clk/qcom/nwgcc-nord.c                      |    3 +
 drivers/clk/qcom/videocc-glymur.c                  |   38 +
 include/dt-bindings/clock/qcom,nord-camcc.h        |  167 ++
 include/dt-bindings/clock/qcom,nord-nwgcc.h        |    3 +
 9 files changed, 3180 insertions(+)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260706-nord_videocc_camcc-858b14239006

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

