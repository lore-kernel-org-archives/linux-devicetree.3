Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985409;
	b=bNrpWyY87a8qnfpCm/xHubjQoXnOlqkb2cOWaPLJbtlMiG6fY7TFJvKFR6y2JkKEPTFv
	 PgzH3qEzdbqgUphn5im8C2GCx1161QeOcPysoTk42EHeZrosjkICgEFLAzxLixkadaWfp
	 ECQ1jKnt4ONRPpRCYr5T4uXYuL1x3Qn++RMTGx1Vzl7OaycVThcArfJT4LaQv8maduPOO
	 uOjbtWO8iuPY8C/MqZFrq50QqaCgqge/VEJrjVEjJOURg0Jw2XoJOgGZTQncg3QDQYmtf
	 iJ17E5b0hbzIjzUSihuvXLlgaGLIaZmLVAWbaEUnwkJ3BaRdMpG3MDHH/jRDHDs1rIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Km9Y9Uuj8+EaAkrKODrPzVusw9xboYcIN4R/c990Y94=;
	b=YH2jZPJw6W2Zm2T+hA9MdvMF0AClGfPxCIFCMO/HI2ESJXqyKyVIEpsurCE2fsmEPY0I
	 pMXaWLyd4sl7ulJGf/XOAaloqQeMkAKXCq2N1ZAqMshI5dQO0bn8lPtsKmVP7bUwB4xSF
	 enTwLQpQqJyoANoHsX61IXGMGz3BqulUUh7IoUDAsg9cujg5Mm7wek2obxeNeQtOFzagR
	 J5R9VVtbzKO5TtnDGNsF9l7BPAChGcImdKS3AByG2M1za6tYYtgZtmIFGJQ3XQ6h5gGdn
	 pCP3vTFFBQAB28ozNXT0d3dKj//QfVqX/Yw8dB0inm6BpqlVL/CSNbeOq0js7CzZ/hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XFGPA2LA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZN0e4Ehz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22CF606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D22CF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XFGPA2LA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZN0e4Ehz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UpuW2383027
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Km9Y9Uuj8+EaAkrKODrPzV
	usw9xboYcIN4R/c990Y94=; b=XFGPA2LAPRZr5dYsH81MiUMH3q6LZSCbgbEyY+
	5mYv2Z7YD9sZpeALY3TAEvNlrU77ZhX70uHPN67artl47KTWI71u2yC9hhiwW2kF
	mVzTU/Jf6sc5e+ze/KSdTR0vaTIPmOcHVHaX+28VWuxPK/foobj9+HwzydI+9W2u
	umPVBWO3If5l5mXOYcMXSgHrFHB9sJOuCIA3JfB1SZNdMOaDKlquJ6G6tKXwEsEi
	zMH7nf1nCWUrf4SY2thOWV2bSqtpPpXI0zQrJjOsB1X+nloGBmm9z9ql6t/9CGHr
	5gJyL23TfFIuPqLxM8ZInSVFZr3sXHo3LEn68AIFXFO6j1PA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasqvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea71803effso6444905ad.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985407; x=1795590207; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Km9Y9Uuj8+EaAkrKODrPzVusw9xboYcIN4R/c990Y94=;
        b=ZN0e4EhzSKdgUIFg2ubSQAPjauRsRHBMHIOoxgXDmes9ZPQUQSW6tIjBYXsJMbzyPW
         DtJcfT+aWsBq+SpZr1c7NL2fBjqL/Qil0I5ryFBPQYxUEv+NM1a9sRiwRolH6hUFGLHW
         OluXQowFnhrIRHzpOsKw0mhBgJ29iPiItd4dFEQOUZo0OHGXBRok8QtsZqbHXlmAr+qI
         J1eP9IF3qmf8vx0KG3Qc6yaR9S+ccWGNVSEn2+DncMT1BV9NOZ4txaQ9JhUY/ODz3Sqq
         JKNZVhPkeDH0iJARfOvIfd5cDujqJrmpar9FNe04GpjtaExKXyf6PvK4snGxH8KA5Sm6
         jJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985407; x=1795590207;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Km9Y9Uuj8+EaAkrKODrPzVusw9xboYcIN4R/c990Y94=;
        b=VAVKgyUv+BuIQ7GIpQVomqTOE34Pq8ltXLbtLbIENoy4w7rB0OtOQx2fFnt94NgXKo
         5nZ1ru1axHcWJGaAkfHIRszMLGhRYP4MVBIraqyEBOuoycnphxBY9nNpqa+AhvLl1Co5
         BQ3NrFf+Q5dMMfe7A30+PpCVxW/qBDhz6rt0ygkz5yU6UCVzoIN1nxu56+3vb7eRhDj/
         Z/kspxqEoUrdqf1WjjaR2COA+RaW+gAb9DGooxmWfNUFKrzif3Qy/LDAm7RVKQLQIPC4
         4P7p//kCzkUc3WpdXGf0scesBwAB05AUEB09hXjrI6Ww3Vls4zfNnWA4szHynDljXPsQ
         8t4Q==
X-Forwarded-Encrypted: i=1; AL+hErF4rshCoSTvi1fOl04YD/+aAAyCMCJBm+3wW8SZCOgDB27dY29tnAgt1PF3afVJDu4utdjmvSnUZO7D@vger.kernel.org
X-Gm-Message-State: APuU4Z9F7+P43mNjKdY1B+nPTiSo/qIUYoovUN8p9EYSbbkT4EqNP7kN
	sNEns1xDQq6PdsAtz3TdE3K1KXE/XBo9Ws9NN0mEIIiFOYWW/rBWkOOjvEO/RZbtDfYWiqxtcHb
	B31GR8HLKhcC0fFCT0kG8sX/uXhjHB/tMPtup2FVKx5Q1qcPk7gJCEDnp1tKoSml3
X-Gm-Gg: AZFdTZeLRIlbWxj5RBiFnmHFf1XwURis1LSqij3nys2itGxcQkqBA0dEx5GurGITahl
	nbgDo4q9+qf7prOMFKpYthW1ZKzKQvzeeJfHHT9DXC1edPaEHdF14G9doVp8s/H6sDH7y5n79sw
	B+57/OUFnzecu9YARY6ZOEoms9Cr/FdJac5zBcTLDt5AxibpBcja5s7jkqibM562kdvMG6LxSwG
	vRg1bz8JDrlrvHlp8iFkRAnu59HuTDTeqLC6p7LIGzBZljR8LwQwXKue9NES2SYLtweU1v3es7f
	9vsywJq5x5W1fZR++mW0KPLQHCesXrjAxSHIR5EStdECKInHDgC9SiSbaOhBwX6nKKnOhqezY83
	YGncW23e+6FpTA0ePswf7P0I2AMf6GOOdArToNgtZFsyafF+5J+l6ppuQpQVGDn15B2vELy2XR/
	gqExeg/KiO3snuvf/KNcGdVqjMpsw2CgSorIOT
X-Received: by 2002:a17:903:234c:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2eff72f5250mr16757185ad.12.1794985407347;
        Tue, 17 Nov 2026 23:03:27 -0800 (PST)
X-Received: by 2002:a17:903:234c:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2eff72f5250mr16756965ad.12.1794985406903;
        Tue, 17 Nov 2026 23:03:26 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:26 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/4] Fix the TraceNoC probe issue on QCOM platform
Date: Wed, 18 Nov 2026 15:01:42 +0800
Message-Id: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFdN/WoC/x2MQQqAIBAAvyJ7bkGFIvpKdLBtq72orBFB+Pek4
 8DMvFBYhQtM5gXlW4qk2MB1BugM8WCUrTF46wfn3Ii7PHhpII6JMGtaGdd9tL6nsHkK0MKs3Kx
 /Oi+1fqstO3lkAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=2407;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ahtxJbI1lr8TLACqhW66ROVzs0e3zMIjCAu2G0FwFK0=;
 b=I3Wy2QAv79Dng3Jjkb0sRINNRgP+EBp+1h3676HV6iQkoQw/camvvIh6TSKfe51GCWHR94gvO
 xFgUvuv/FUfCOwuVAlThdssVsA6vV8K1vLq1fO6AlrJDds4IXSZEEh0
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd4dc0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sihJ5F6HciqRnlEYqfEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: NJpl6GXkyRsjt4MbTTPEEUZxINSn6RTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX+Q26fo1hzXq7
 KC0P29yRJnvjiewnBbLvZAZph0okO1fM0aqNMF4h1GEWSti/KX06YqiWH3ljsoPV3FEOauJ56jH
 sSoLHTFFMIO7WX3uQjKgIqsL/WpA0uwHEBHOi1j357yMjnzto6AsF6gubH8uAeIJyxd6txTbJBd
 tZHd3CD/2EdzTfiv4cBkpDETcqAoGOdZ1uVT5paCO7nrbBZ1VfX3rX1AYTbZuEWowiar9S2fJd0
 kaekJXzdYD79tAhwOePgflmsOjT4s+3LtJ43xqaZybe0atrnwiMBHgcH49szuCmQWzu7qv53chN
 j2AobTOnJqpr9NXUXpVq80O34QgsbxlAKaE/6gR3HjxQsCdijcPNxOH5u2mwbRUd8f7FAyTlFZM
 jTKVjRgMvm6MgNmseB88sOWZTQdkw/9tTgVUSUNwaWakI6I1TwKd0+jOYi715HUQsgM/aukAIGm
 YKCtPO8WEfNsan6/ZqA==
X-Proofpoint-ORIG-GUID: NJpl6GXkyRsjt4MbTTPEEUZxINSn6RTS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX0tYHpv59zM/h
 tVbBho7SZsv15UAs4EpMTYcPmHxNRKoIFj1Oq/cHJfhvpeKuHEdEWmVEBAV2fvAIOSy+8JSN4UK
 lCdP13cmPL2i+IyO/89eMnNNaPvKadw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

The traceNoC (Trace Network-On-Chip) node on kaanapali, sm8750 and glymur
is described with the "qcom,coresight-tnoc", "arm,primecell" compatible,
so the device is created on the AMBA bus. To bind an AMBA device, the bus
reads the peripheral and component ID registers (PID/CID) at the top of
the device's register block and matches them against the primecell ID.
On these platforms the Component ID returned by the hardware is
0x00000000 instead of a valid AMBA Component ID, so the AMBA probe fails
and the traceNoC is left stuck in deferred probe indefinitely, leaving
its trace path unavailable.

This series fixes the issue in the simplest way: keep the existing
"arm,primecell" compatible and add the "arm,primecell-periphid" property
to the traceNoC nodes. The AMBA bus then uses the peripheral ID given in
the device tree instead of reading it from the device, which lets the
traceNoC probe on this hardware. No binding or driver change is needed.

History of this issue:

This is an alternative to the series that fixes the same problem by
moving the traceNoC onto the platform bus instead of AMBA.

Latest revision of that series:
https://lore.kernel.org/all/20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com/

That approach requires a binding change and a driver change in addition
to the DT changes. This series instead keeps the hardware described as an
AMBA device and works around the invalid Component ID with the existing
"arm,primecell-periphid" property, so only the device tree is touched.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (4):
      dt-bindings: arm: coresight-tnoc: Allow arm,primecell-periphid
      arm64: dts: qcom: kaanapali: add periphid for traceNoC
      arm64: dts: qcom: sm8750: add periphid for traceNoC
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi                           | 8 +++++---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi                        | 2 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi                           | 2 ++
 4 files changed, 13 insertions(+), 4 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-fix-tracenoc-probe-bf8025cad2ca

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

