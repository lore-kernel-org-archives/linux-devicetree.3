Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C42D4D2EE4
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658832; cv=none; b=uruTRTEprQNWxbYmPbd/mrxLpQI8Y9/Wmg1mQTNvHgci9fQ5OB0d1xG1jHONjpK6Yys3/OOUwBsuwCv4IdkvF5VbnfmHkvvUTGq2OXxJ6EUO5aKYPSfHS6Xy1ABpMN4SZmt8EjMZ2I686cNPuf9+9a3hHUhLF36Uk31hT5WEwN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658832; c=relaxed/simple;
	bh=IsoFDfT/+D9E1hNGxpZwHRL39q/X355qA8bg2jOLQpY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LMi/xalONC0d2HWgiASrCVY9bUJPP1mhzZ57eKwiIzJThDsh8J45VH7e/nMocl7zG1BIxdrREb4iRIjiY8e5itR8DB8WiNB7sWeCA0L0d/p1CAzNdS5e36eLJPJLHjAWZAufeXh+AOGMkz3i+9KJHXRN+DJnv1O4UrpMO1DpY2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHzPM5Mt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZc1Ef/c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHzPM5Mt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZc1Ef/c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65561x7R3111646
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 11:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IxL/V4vC/wyShVJZdvZrKk
	oxHRzxaLzz1FkDZdj7d7I=; b=BHzPM5MtMZOZHBN+Tahk4wR9eVf3UZ4JoQl/Bv
	RDAp6KlFLh0zSB1MQ8GDd42PU/Dbitj5AzFcgn2VXzm2fOnj/j8UL7EYw7tNMwb+
	OFk4DNILBZf/uZabL2+vRXP5osq+6bfOHaCnbJLPj/HkxXGYVJ1v7E2L1pxN4gti
	ehNb+5yiIWDCHVgMo8gcDD1XgX5xBysnUeZzzlpcCW4ARX8fk7KnjCqoDcxSrC6G
	CiirLqP9p+f5OkkEXyjceKYbtOqcu4h6Ppev7iGgAJeDxZxV7vlllsFgsmfS3PLC
	UY+w1tMJ76vXrgCQ92J4WH/Ne1xL1r2cx6mFA5uPAt6ttjLg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekfv738kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 11:27:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1292897a12.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 04:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658830; x=1781263630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxL/V4vC/wyShVJZdvZrKkoxHRzxaLzz1FkDZdj7d7I=;
        b=IZc1Ef/cUJui5gSYyeNVNmlcRQfOAArb98YkeeK/Xpfi2Y3vd2oig9fta/K0P1N0hH
         Eo467VcIvlrG0Kj0znS1dkKj03xy3+im3MSSNhc65b+MtoLYRPXl9xVjZlb6JWDMereG
         V8jXAPe/5ntgW8nQCxtFEQxL8JTDgmXeSJeq+IoOWAwSXOTuGPU28ADAHe3rLZ5D/fpQ
         dL2n0jhG7aKlD1y5GzlLG6ZauYOazyd6AM6PZ/U2AYYMETD/nrtyXqg65MEwEHMHfBU1
         pbyH7SWIFWI1BpokN9QkI3Hxqe/P+xjNufciXWpsg9FICle8FtYbAAupnFqa6EWJyKdo
         S3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658830; x=1781263630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxL/V4vC/wyShVJZdvZrKkoxHRzxaLzz1FkDZdj7d7I=;
        b=ELJ8FN/rx0LtTc1L3uEk2zvbhsx/WVCCEUWhVdZWjok8nadIzLKxgTLPjWkpcHyQ6g
         dNSq1UyXNwRJw4B62K8lmZ4JuJ4/gDO2vrGQ7ycdbK8AafzPOqUW8KXR+6EBK8saBedQ
         hWPOU/PobHkNDLDy3XXD8AHmJtCMtE8Z+pePlSsQTe9rQCiE3kTNOjAeJS08bS1TWDw3
         qJPR2sV+FTx8+QKivTgzlFfBA99id+aYGzFvE8bcEzla8nzE0JXS1LOgNExfMevS1cGz
         tfFtynBZCAknec3q/iRr3pa0hdprWMZESqzMf1rKcAHW4yCN0guQfeIFR+NwmVUOaqDX
         u8eA==
X-Forwarded-Encrypted: i=1; AFNElJ8VNpsCePn/R4Xf+XhzyqSbWuDGLdNVpiWYIVevJoitqcUFy9u1lwAtvl0ZU9ufByzLPcnRHoL5X4/q@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJHqwJWwviEKqM8pmwsFWUM0lp/u69o5pX8RMnr69hi4UTSqw
	VwGMrfMkSVG2YCLJgXuww1GDj86IujzG20KZNQDvbzqv01OYYWQvRrO/udNZzv8d7Z54rEovOOV
	o+mBH0UIMbS3YpVdfbvc6XnEhOM285AoGhXeyfneHx9sIEODYWNIDBhJ6nXvOZPYA
X-Gm-Gg: Acq92OFgg6WOUTSlSJnJuwU+cG0uJMA6dNc7fmFBkVmlbzHpJujetSUwoqji7XaNA1E
	pcijH2oV3nxm5e3AqcnTCSDpltEsnvz1w7F/VBX1Cck9eYoMPVJE9IhI++6Tb5y5Zc3LA8314CA
	zNppNq2qihzJSJbrN5vDeTOl7aE4659Qh2gn+iPF9cSMA3AvZ9gxBYvgw5M7ve3a7DLBW6BlcOo
	wxHWANb3KoUnIsrHeSTCEmKTzBXD8t2fgaRLKIv1/BYvuDIv6oAhcLfbg0EwnIZMMZULpDGL6Ph
	FW5b79Jw/M0RqhTlcH9XqFQSwIDeXgxxmlZOShJw9L57508iQACifqXYaGbcj/ihevyWXInSGiN
	J7cfOrMh4k+PlOVB1z6YQi2Xt/k9reKRhj1eDtu+zzceR93Z5G0s/RocfV9a6UOM=
X-Received: by 2002:a05:6a00:9093:b0:842:66af:5bf2 with SMTP id d2e1a72fcca58-842b0fb53a2mr3043910b3a.38.1780658829605;
        Fri, 05 Jun 2026 04:27:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:9093:b0:842:66af:5bf2 with SMTP id d2e1a72fcca58-842b0fb53a2mr3043850b3a.38.1780658828703;
        Fri, 05 Jun 2026 04:27:08 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:08 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add Audio Core clock controller support on
 Qualcomm Shikra SoC
Date: Fri, 05 Jun 2026 16:56:29 +0530
Message-Id: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGWyImoC/13MzarCMBCG4VspWZ9AmswkTW9FXORnosFTq0kVQ
 bx3Q1UENwPfwPvcWaWSqbKxu7NC11zzfGyj/+tY2LvjjniObTMppBZaIK/7fCiOu0vMc5gLhcA
 HpERJGAUGWAtPhVK+rehm+9qFzpdmL6/nlx67FQZpP/CugeU0tRv+D5VLYYFiSkl5MV5X/jfGv
 v/EceHRYLQGEDTod+BdJR7macrL2IWegpfKJqcANUrrlJSICm0KZvDakrdxAMO2j8cTAv28Qh4
 BAAA=
X-Change-ID: 20260605-shikra-audiocorecc-85efef073474
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: xEomy8TJbwb9HdUPhSAoGYV8SXncC1aI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfXz5cwwYEFyQt4
 p+6JsHYZa5Fe1xBKDtmuzSBQDeBEhCnaV1iG/vUF3ng66/p8QVgCvHrBBdMSE8PZP+eZf49rfjM
 1NcKzcNgKBLiJR2+CZbgBJLBhBXpHQwtx4J1AXik7b6CAFnfbt75Df6TenL3m3KEH/F2IhXlP+l
 R4y4tDe9YTfyvc8+y9ljFuZM3hOiAeMe9oqp2f4RI1MCf7QSAOskT565Ll0d6U32d/3dGxLChQ+
 KNxeVfC1kQ3jhAN8wO2TWKuH4WiDdr04II+0RmxhSiVZE6/QaKwRzkwp10pNaZvZ3+RZQ38eYTj
 plJ4tWR1pJE6aq/gac/wTvzaExwNQLnhnscChcr9AZk0LAjOQGbk5qpUFfqBKmHk1eC/9fCJLWa
 omKklnRqK0YTumSvb8NpIIb7yqWLVaos0SNEvpYqhO/F1DBAYKlq0tHh9ZaeGb3GpcvencWX8dt
 Cne8fOv61ojR1cvlX4g==
X-Authority-Analysis: v=2.4 cv=JNULdcKb c=1 sm=1 tr=0 ts=6a22b28e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9tZPC6dkgApbXn6Rl1oA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: xEomy8TJbwb9HdUPhSAoGYV8SXncC1aI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050111

This series adds support for the Audio Core Clock Controller (AUDIOCORECC)
on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
across variants based on Audio subsystem enablement as follows:

CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem
IQS: no clocks/resets needed; no soundwire codecs

To handle these requirements, variant-specific compatibles are introduced.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (4):
      clk: qcom: common: Register reset controller only when resets are present
      dt-bindings: clock: qcom: Add Qualcomm Shikra Audio Core Clock Controller
      clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
      arm64: dts: qcom: shikra: Add support for AudioCoreCC node

 .../bindings/clock/qcom,shikra-audiocorecc.yaml    |  62 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   4 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   5 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  13 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c              | 813 +++++++++++++++++++++
 drivers/clk/qcom/common.c                          |  24 +-
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    |  49 ++
 9 files changed, 970 insertions(+), 11 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260605-shikra-audiocorecc-85efef073474
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v4
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

