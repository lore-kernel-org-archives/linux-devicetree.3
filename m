Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8548335E1A0
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477232; cv=none; b=TBwfJrcL/9RztCV1kVnmZdIZpJLWVYCRc+fieYMsOwkEazQlo3pJOBsC4Rxa++Ab5EV2eyN7FJLAXPr76rOiZK20zWghewH88AfdXppdRbkfRBRE3zatCqP8JFXMmXgowkVxPc+2+RxjORSWw/tfCIfWLZtGN+IEqP0mqj86X4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477232; c=relaxed/simple;
	bh=e38rX0l4uVxIOcbqc8igZXZ/CMjDHKSXoW7V/dIp8dA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VBQN3Ngi7SK4eirja9dC4HM92oRTIgxQqwzgXS+ZJJN8qUBuiDpOOBzXfwv8Z4sqXMx/X1SbP2ag3z2cFVM3E3y6sG1LgxKIqa58/DU8akrn4YlK8YHwqHAnimNkwpjltB02mwsF0bxZmY1aQJkDnbbKqjZJJgV5UOqPQNEdDQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wvg3mPtU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkBiXV8y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wvg3mPtU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkBiXV8y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5hNKJ3583283
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sG2maHNBlRhpFNm0jTg2CG
	r6GPIhTgnZNBndxYr+Duk=; b=Wvg3mPtUahQQ6qwritD94y7ddMmjjVyZe1Shi2
	jHUIcAIzEqujNwhe9YgnNRd5UrmCo6lw/8Id6aKF4VdhbQ3kiJZNAq0A2OAiZHjS
	413eg3u1WTevrT+mph+OslSjun5odq4z1WhilCb4uZw9Ui+Tbi8OiZZf7uYkwBFT
	FFYNaeNwgeOgiiTtbGxU5Y0oJ+1pIw8ayXIPOn6cTMqNYUxg5/Sp3bzIueoOJL2/
	HxerYZHbCpCvWISJuutAt+ic5jkmwniqhQ6nTEpXE6Cy0cz2QMBO7ttCQr9POfr7
	smvBHyAvfbWY/4LOlYMnVsKHRnMsvXP7cXnjwF+ydXtHFVfg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frntcg0yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:53:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so895243a12.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477230; x=1786082030; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sG2maHNBlRhpFNm0jTg2CGr6GPIhTgnZNBndxYr+Duk=;
        b=SkBiXV8yPRnT4J2a1sJ03yC6NYfgyIzxq1CMdwnEryEZDvQBK8rfddQ6n7l8ukbLX8
         XIumLEKl1BIokdXS+eB4p97ejS1ob7PwUodGJ83GKY8FsDKrk+KjK5C2jf96EvPBi4CN
         06L7z1UIXSd24C2IHOPBSVMZUq2mAyDTa9NwZvaszuDGzmECEJJe3SjlUwpD/HVUuQau
         XT7/QGkljwK556fodXtIM5q8UTFicg6a5lmg5Wv8YfgTwG5TUzg4gxdrwQQ0icpN3Jqe
         xo9CDawdmLA6vdnjTyoyhposs1KxOFQRrf4fVKoLlvkuoS7sS0taVDDVQRynlU6A4Lr8
         9q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477230; x=1786082030;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sG2maHNBlRhpFNm0jTg2CGr6GPIhTgnZNBndxYr+Duk=;
        b=RwXCnabYkNtLjPxpKAA0Zer+vqVrgrQVKY13xy0W7giebAfjWlFJuXYbslaC5vnSMH
         n4xBwANj5WwOeVj+8EPxowJdWijvHbMtRCQN+i5Hy2kTU5L2N8+3ZY6ZKtiKwhQsRFMV
         UCWI5x03Mq/l08sM1/L4iI425O5vt2yqo0VbsQrEv5K39kFTsCEQBfknuUM62jwzJ7fL
         8MF0HOttE1BxZIx0ihPoiM2qzeEOVndSL8zXOncedmw1aIKx/pNtnaqZ2+Q+oxOECuVv
         jThm6IygvTu9fjKqqB+nEBJT7xHmTDSsU6alKzocNQZEsLiF1t0LM4QC229JfBlUX6af
         QM7A==
X-Forwarded-Encrypted: i=1; AHgh+Rqhhx2CQBrW4H3HJSi/4ERRk3KmYg71d/eHicZazWldlUD3CbKzk2kKxDsoSr2iGxmt2sPaimOVq07w@vger.kernel.org
X-Gm-Message-State: AOJu0YyAFdHFu++ZJ5FsS41mYLUCMO0ajtI8SS4KQLS+pzGmUif/Amjx
	musZ+kgOasYnPCAN5dF0f71fxBH+riGcq/NfKVRz2fqe9auPdItWZRQmWDkjLhv2Bxmbo2lpqCF
	6CHVTrwdIqQk4rUBFTEsj4BEPumaW3V5E0ZDSN7a/Q3HSp717/Xv0dpBq9t1kHvIr
X-Gm-Gg: AR+sD10hJoPl4W+ZQU0p90960SHsfCuj5AOdTt12gE1h4fbbt/j8GOstKe8kmarGSqg
	ABJlRG0/VP7r2ujbWxQesKMOTcZ4afrv7Kv0HMpDVqG4NJ2/G9tIV4XFEVDwcJSwGGrOGy4iBKY
	Ovr8GmhUyBjURPfzxzgzYflvK8nsK5jQT8ZOWWtjyJBDby9Fxfnt6cv6Rd/pfO9f7ttvaaukESL
	azHAm02sI1QZaQQdwr4r3JXaWUSO2e6ptiQuGPzG1zfKFHLwpl2kYiRD1o+ZTpo1tbu3njtDpnV
	+ELPkm1q2PVGz0djAD+to2pu+rTKkvKvoR2PkOp7AgJ3cVjJTmgpioFQ3gM9h8ZFTe84tBp3CFq
	bREO1EdK2ED4de9RDbj6nC8yIC/I0q64IxvYzkUmkaJ5GJKzGIw==
X-Received: by 2002:a05:6a20:258a:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c91b11865emr535679637.24.1785477230141;
        Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:258a:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c91b11865emr535650637.24.1785477229662;
        Thu, 30 Jul 2026 22:53:49 -0700 (PDT)
Received: from hu-doz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm1643675eec.7.2026.07.30.22.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:53:49 -0700 (PDT)
From: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add GPUCC and GXCLK support for Hawi
Date: Thu, 30 Jul 2026 22:53:47 -0700
Message-Id: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGs4bGoC/03MQQ6CMBCF4auQWVtSCpTqynsYFs04wCRCsRXUk
 N7dSly4meSf5H0bBPJMAU7ZBp5WDuymFOqQAQ526knwNTUoqbRsZC36eUEUg32yMFjWVJRG6w4
 hDWZPHb927NKmHjg8nH/v9lp8vz9G6X9mLYQUSlXUGFNhd7RnF0J+X+wN3Tjm6UAbY/wArkcKH
 asAAAA=
X-Change-ID: 20260705-gpucc-hawi-8c35e13866fc
To: mturquette@baylibre.com, robh@kernel.org, andersson@kernel.org,
        conor+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, taniya.das@oss.qualcomm.com,
        bmasney@redhat.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785477228; l=1652;
 i=dongfang.zhao@oss.qualcomm.com; s=20260706; h=from:subject:message-id;
 bh=e38rX0l4uVxIOcbqc8igZXZ/CMjDHKSXoW7V/dIp8dA=;
 b=KUggpb9+KqNXldhI2q8TbnrZZke4Vct/nVbk7naRyJUW50oMX67yPg3WFDIfiz5rxqg6ozIqI
 wDbmCXmSBjDABIQIR1nj3lRClJImbocrsOj+sQEtQvWIJghiBx4Ornc
X-Developer-Key: i=dongfang.zhao@oss.qualcomm.com; a=ed25519;
 pk=oRbMthG8BHvTvcxks87U5rUBoZiRXWKs6KZR6lV5C64=
X-Proofpoint-GUID: OpNoqMDehMWjnUqwobz0JFYmWWew6v_A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX5pRbyYCq4+dM
 jveGb7GHuoBSOBj/b0fIZWSd4mqHx4aoqwlOz815p6VFOY/lwd69WZ9kXFD6ZlWml9+GXi3TwUi
 ZBnnoEKa7PAbMjtZRJHTmecPhA7SO6o=
X-Proofpoint-ORIG-GUID: OpNoqMDehMWjnUqwobz0JFYmWWew6v_A
X-Authority-Analysis: v=2.4 cv=BcnoFLt2 c=1 sm=1 tr=0 ts=6a6c386e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LjwRoHMMlgVm7myvQdUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX6btUEkGNnYtC
 PL6t595bEz8aqQBvd+rP+YTPpCzBjSdlzvO6In/w0+EYZRDI4Rc55msNy6AWETXOv97Q6+Bw9dx
 Qbw+Q7M8df72VWFPMH7/AdE4rqfn4Jx11Yrg5d+CG/zwyamF99UICBhgQLGhUE8JWIlqCMgL/D2
 UPDNV1rLaPZnMAH1rRTc6boSyuFlB09v+jMgnvc5G2EqrYFoWpqwMiZTNMYGiyI6E07Em5nCAxC
 dJNWpl3KrKu8fuvPmy9wZb/UPFw4HKcsm28yM6KH+jNJi880Sj0IYT1OI0NnEfKYDWShjmA2cb7
 nLw5uEfyHDRchZ53ZhbyqULA90Y0oAn9KWJGue8zNw1+3+9jwebBpJywiNRKLHhv8gfUcLXbrD6
 UOTq7EZnnZ94dNxi82+T1cJw6ZyQ9IcJvF6fSHYJPlUl3lrRKx6kCBHGzgl0yY1B3gjT0321wTd
 zTT8jT9lwEI+npWQZZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310038

Add GPU clock controller (GPUCC) and GX clock controller (GXCLKCTL)
support for the Qualcomm Hawi SoC.

The GPUCC provides clocks, resets and power domains for the GPU
subsystem. The GXCLKCTL manages only the GX GDSC; remaining resources
are handled by firmware. Hawi's GX clock controller reuses the existing
gxclkctl-kaanapali driver via a fallback compatible
("qcom,hawi-gxclkctl", "qcom,kaanapali-gxclkctl"), so no driver change
is needed unless Hawi-specific behaviour is required later.

Changes in v2:
- dt-bindings: qcom,hawi-gpucc: reorder power-domains and required-opps
  to MX, CX, GMXC to match existing GPUCC bindings (suggested by
  Krzysztof Kozlowski)
- dt-bindings: qcom,hawi-gpucc: shorten required-opps item descriptions
  (suggested by Krzysztof Kozlowski)
- clk: qcom: gpucc-hawi: collect Reviewed-by from Taniya Das
- Rebased onto linux-next (20260730)

---
Dongfang Zhao (2):
      dt-bindings: clock: qcom: Add Hawi GPU clock controllers
      clk: qcom: Add support for Hawi GPUCC

 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml |  78 ++++
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |  22 +-
 drivers/clk/qcom/Kconfig                           |  12 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-hawi.c                      | 461 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-gpucc.h        |  47 +++
 6 files changed, 613 insertions(+), 8 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260705-gpucc-hawi-8c35e13866fc

Best regards,
-- 
Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>

