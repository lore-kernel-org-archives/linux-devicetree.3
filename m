Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977317;
	b=lW9uZv12JX4VzHiAawaUuH2EFOSOOS13HPEaE3g+wNnlfAQsY6uMpmmlqXJHVZ4CY+3y
	 1UmGlBrjyaC39hhIGjuc2/XlQE4Lcy1EiFvTAS2tHLJsoELl5qOEJceaeBQGmk/Bhp3Pn
	 UbBTKeb36YihakTTVYJn7Ng0ZgoCVzjN3IaCexEabkyN2uFuqak9fZImxZqjRu3Xd1wrG
	 bXhR87qZr9PSQKO+5CkK5bIvwinPbaIhFclDcufVxg5zBXWsxkWCfDlogzonr5QGUiogG
	 FgW7MonV1/pMEkB1XljeOEzTUP7hMaLgyICsZu1m8xuaqkTRJzEoM1VQT+FQaSLeY5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
	b=iO+2+5zAzJFZsTyzfZp44TNp1vuVMSyu5fohi4kTix6UdSSPUTfNgnfeNh8eoRx5pDsY
	 XssLuLjmY5O+OfEDcf0K64BnscxA4JkM1ER40DVak9igTuY4U7eMcGS12n1HsOr77teoh
	 XOcXcflTUU2HyKAgSarkQ/AeGB1C9EWtOez1RGWiyh4M//37/UcDyNYVZMOH+ry/liyjL
	 1rBzFSJaOCclrt13uLrFJ7+iLOpuEv7UXh1GYPnKdPk2SwSCnMT60hloPgvRKBoWoZR47
	 lEhatL9EsowzjemfHMMTnGKclMCuXMqr0jnswIZoknVicII2doNZ1EVpczjVdSHaQnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpPNuUns;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UH4mubwL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9B606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF9B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpPNuUns;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UH4mubwL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExxMQ3722899
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 15:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YlRX2h9r/M7y5/J/Ewe1L+
	KbEKnvM7owZqTGSJa2SZs=; b=IpPNuUnsui2joIDxMx5HdCY8husIcj08vS9KY6
	ZUibYTbFfnKieTvHPHnTB7xwzC4mTuqLb+f+0Wekxqb0wCw/3r/RtUTlp6pcdxcK
	YRd+ReLYF8CywfaUnPAPe3kmLq3exlrCHcNESxBi8iUiWEYlJON+p0kLclKYF1yC
	heeq1p6JtLqNEPFyCR8MtS/2sHEwQMkMFQWfJGJnLEGaTpWj0CE6G8wQeTwB7F4X
	9mEUMZMcam2j6K7c69+HzuiwIF5u9GclPuAmQGXjh+TwcvIPsZ+OU650J/+3sEzH
	hF5s/DPr8+rR74xspjWIIbEmeI23CEkObHqqJF7WjLFi23aQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k7m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 15:01:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdae10aebfdso442011a12.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977315; x=1794582115; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
        b=UH4mubwLRNi+uA5+H3EJpU7sNt/MJXsY/PFrgk3BCGI271d3WKB9inw/qyxH8Nw4F6
         56pUKxYvZCM6neE4gsG2RyJTv+Jfb7efv6it/ddFK4I0ebn3pmL3Nmk5zF+QxJfW/LkV
         sE5d/w5FGMIMZmQgob6VGjoo0ekwhgCgamJxG9E/NDAtNKceCdRmPorR9xeeYDc9Dsp7
         rkoCS6ZqbUNKwWqZCOwrcKNnWx0jETy2ur34avWUW30J1geN+BjWtvvWM1roNJrnKpFL
         IU9e/OF6fx+v0/ThbwPA0d/d7RrotIRZ4E+jC6rKm/DTMo4mNxnOL75O/LtYXLqYblv8
         VxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977315; x=1794582115;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
        b=xtZY06+5dDuKAq2xppb4JRsLKtx7njnLdDrMBTZP0NHB8wRBcxV5BrNygRAFN0Ahie
         +YdYIAtLvYvQ/7rQ2m54W8neLvcz2qoaDDzkDtp0evvsl/ojqfsoBoLHcy62Z2CR78bW
         9WB9NsxlFfK/+XEPXFh99D6Qs7maLpB+aunE3dIWT5ZPoAaKJgyiGImfaH1l6tadaTS7
         eNY4G5tXhzhSy5w2XtaOhJxOFTJt2dX4tjHigi8DIYeUjbTWfsBtFgVqtGheCjaY/Zeb
         c3jzuw0hUIrVLJ7iuXymNmuYbVuQ69CSVGof0bjhRHxvtujr739PnwFNycWA7geUwczw
         0+fA==
X-Forwarded-Encrypted: i=1; AL+hErGH1z+YwGdn7zjOWNO/q11g3MVo+L+1i/N9MLeQG0Fig2Eb8mXt/FwCgh/b6vztNOtHcQAK56WYkoI7@vger.kernel.org
X-Gm-Message-State: APuU4Z/aLxX7tHa2iIZvk8sOrKUBplhbpRGNl4/z17z44J9gTGxeEmGI
	o1Kz2Hfclv4JbfPlbiRYx35ORBnlSO1zU08QjfyVERQuODNIOKoy4rnyJ+8dg1gLs6NpZ4IcRGL
	iUt4sV3mryr1HTAGViZ4R7mbK31zFJ03U4ZLuLcK6Pl04jlvde1Ah3/gQRaUHeQaL
X-Gm-Gg: AYBFou1hU7uOiUgd3k7QhuZ6w42TfVBrkOismPhyHMV8XxvkshTUux3kTZQXdgKjtHc
	/GASvxgdWpvLuxVhZLxb6GPsCUQ0id6K5RP2IoZA7Ck9l5CoDkg06lZoaej2KDRYuc5g9AaWwaZ
	Mr7QgTOgvgw49jyXYGQsgXcpKgXJ2b6OeLQka/ZCpxL5kzlbalN6i8lK2BB7kT01d3tQ/NwbHug
	M6KVWFfKCnHfsfWZKR68CNVu6lSwx/BPPgISy4PoWxPJwrK6pBayIOkjH547di/lMVo9E+A0ALq
	T1DJG+0srHrVVwTkISSg16N7+dIsDDm27mgQWViJ1jCvmjGddoZcOdNk/KvJZMmeEsRW41cUJ0v
	QjdE06YA+twdYvvwe2J+1JEWHEVbkVQyizsVdKPDBoxtn/ZIjHfKOpEWd7BTYAG2GSWjb16GDSA
	CaL7NkIsrF
X-Received: by 2002:a17:90a:da86:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b0db60977cmr1689165a91.3.1793977315346;
        Fri, 06 Nov 2026 07:01:55 -0800 (PST)
X-Received: by 2002:a17:90a:da86:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b0db60977cmr1689128a91.3.1793977314752;
        Fri, 06 Nov 2026 07:01:54 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:01:54 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: [PATCH 0/6] spi: qcom-geni: Add QSPI support over GPI DMA
Date: Fri, 06 Nov 2026 20:31:18 +0530
Message-Id: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAL/r7WoC/22NQQ6CMBREr0K6tqT9FgRX3sMQUvEjNZZCPxAN4
 e4WiDs3k7xkZt7MCL1BYudoZh4nQ8a1AeQhYlWj2wdycw/MQEAqBUjeU2fKsaPBo7blvuZZIkD
 lqI5QJyxMO4+1eW+312JnGm9PrIb1a200hgbnP5t3kmvvp4D/iklywbNanUBoBXmaXhxR3I/6V
 Tlr4xCsWJblC89vg5fRAAAA
X-Change-ID: 20261021-qspi_upstream_series-850249e432f5
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=2393;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=sT9UgwhMsmzsH1VR9CYbGXTbSBlB1pzQsIePFqgsQYI=;
 b=C7A6XrHKQ4XQj59UI1RyunXvtophOtPfyUZ40INZlB0wVQ1WwavhDZi/XQdHdag/KPYoESnrp
 /DA2fyYU2OiCiJkgXkeSKhD9clZFrHFuhY4Ck116NuLNZOju5EM/9dr
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-ORIG-GUID: myZU2_vSrDwQPJygaYlemvvN_5bpO1FM
X-Proofpoint-GUID: myZU2_vSrDwQPJygaYlemvvN_5bpO1FM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX62gD5swC5D2U
 gFYhgMnsVJhMRKlIp+9JpSakJtVrDokJXt1SLv6DlQgNtSKqhWc4VOS+LbYHuKP8gkb305K0sq3
 jcoIibTGADMOybLqxKyEerdvG5Kcwhw=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aedebe4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z6aUeMXpdRP9Q2--PI4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfXyypUy5/IE+c2
 vO8XNeLK+Li+52AGyGz7H+Smq10iI89gly/HGwISLWSMR61GAHpOTEFW0ly82XFNGU5cVM1ZFto
 0nOT2mWQRK35qM2aveoSHQp1MyjEJ0KAWVlk6IFVDGS8YcldLwPEH499yES8lWUrI4xj4hMsJ3a
 0SfpfD8euqVAVjBxNo5/LhUkIhN0tufnETR5idCmXqPartPPdmnyJDnYg93luoO4yT+vO1TOnpw
 Ip9tgzEtXyKERbm0xDBPxTWwrIJ0q0nvV7cIgiUs3KJ9LVA0VUDx0vUb2jpHOW+S2CvbsorhRdo
 PsV7SEtVdClnxHnQax8mLvlX7eE8Sns5hySGocRKtlW7hJZ42HTzsP/wG9yYZEAEuD6q0ZEU2Ag
 64dJeuVY756D4HctOSw4HVvhF4AXa3IjzzF7fXKaLYavk6desioFB07H40FRK1iImBQ3WJ5GV9A
 OxtNcOu5LC194iKNUdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

This series adds QSPI support to the Qualcomm GENI SPI driver using
GPI DMA. It supports single, dual and quad SDR transfers in controller
mode.

GENI QSPI reads require a command/address TX phase, an optional dummy
phase and an RX data phase to execute as one hardware command. Add
driver-managed message sequencing to combine these SPI transfers
into a single SPI_TX_RX command.

The series is organized as follows:

1. Add transfer_one_message() support, including completion handling,
   GPIO chip-select sequencing, delays and DMA buffer synchronization.

2. Define QCOM_GPI_QSPI for identifying QSPI channels in GPI DMA
   specifiers.

3. Document the qcom,geni-qspi compatible.

4. Define GENI_SE_QSPI and update the firmware loader to accept the
   QSPI protocol.

5. Add QSPI CONFIG0 and GO TRE formatting to the GPI driver, including
   dummy cycles, transfer mode and the TX-then-RX command.

6. Add QSPI support to the SPI driver, combining read phases and
   accounting for them in message length, DMA synchronization and
   timeout calculations.

SPI and QSPI transfers have been tested using native GENI chip-select.
GPIO chip-select handling has not been tested on hardware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
Jyothi Kumar Seerapu (6):
      spi: spi-geni-qcom: Add transfer_one_message() support
      dt-bindings: dma: qcom-gpi: Add QSPI protocol identifier
      dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI support
      soc: qcom: geni-se: Define the QSPI firmware protocol
      dmaengine: qcom: gpi: Add QSPI protocol support
      spi: spi-geni-qcom: Add QSPI support over GPI DMA

 .../bindings/spi/qcom,spi-geni-qcom.yaml           |   8 +-
 drivers/dma/qcom/gpi.c                             |  22 +-
 drivers/soc/qcom/qcom-geni-se.c                    |   7 +-
 drivers/spi/spi-geni-qcom.c                        | 455 ++++++++++++++++++---
 include/dt-bindings/dma/qcom-gpi.h                 |   1 +
 include/linux/dma/qcom-gpi-dma.h                   |   6 +
 include/linux/soc/qcom/geni-se.h                   |   1 +
 7 files changed, 446 insertions(+), 54 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20261021-qspi_upstream_series-850249e432f5

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

