Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517719;
	b=3jDK73x93MimaDKcwfYw2XyHzM23f0b5y7eRu/Xh4g+/eodGn+uCQHu4ydaq689P61zT
	 rNMzFP5dRxTs7G1wn39ymsHjf7Hp/wjuopM578iWU5Ub0lw0Mvxf29lM33pe8yRGtMf9U
	 eTMOnrhZEHxomKDXqKZ0kb+4Y2Q0cWQgdW5u1j4DHs46DqMk94a5OGCEc+XTPWTB5MnqH
	 8S9nNMSaglcw2LKfZWnxZj3RFr2+a0EG4rP+UcTVWLvrTY1QpGPnMSe9ju1r5wGyaYX3n
	 livfjM9q2ZznCowBukiHkufXIVzUgCfCiIjuggmjBNXW5Px+2N91arQGFT5FME5ZJlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SaoDHmsRZlPH0GxcRak6hJ29lY+5PVrmCFX1SLF6qdE=;
	b=uqPKUpCE2OAt9TLTsjwGn5UbOHyMldwhhnXbY1l3WDxh+kkYB6M/DpqHC2ODPCv1eJTq
	 0FLEyGPLY7EvyhxpQIf4s9G5SG9RjnFeuY4U03IBI1HZ5Ip99Qx837LVWF9R315qRtTR1
	 KkaZu4paQLvirOz5jt8kiDthX0AHStmuCloAM4WIFYEC88PVPQIY40U+oEGA6I3r0/Ira
	 2rh2PoXNIZ0fLjfN94y11uBrrJ7eU76N1YPmbkaiY0CJSJBKv9mkeFZO/j/ihyatabeSh
	 qm0x3u1EVoQ4oSrYklwtkNl1x+BzX5hKPPRmA9VB9951UQQixRzOmiPjN51uXh4N3nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+lHwVt0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IR/AL0kg";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B57606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B57606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+lHwVt0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IR/AL0kg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8MPVe901911
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SaoDHmsRZlPH0GxcRak6hJ29lY+5PVrmCFX
	1SLF6qdE=; b=m+lHwVt0/EPdLs0KfDpvrKgv5hv+xBQAXuXJN2ZdQphMQD9AhgR
	cQjiF8ABTTfnmJ7QOM+B8EFzwrF/B99crUKa4d1x/+nk6Vu8WfxsOKetFND3kJjg
	8J1Zht0mFgnnf4iOt7O849iOKCcOb9ca8QARq1hV55Ohz92lHua1JVfI2ojOh9DF
	zjnZ9sP4W/xgqmqJGRziqpEG//WTL+OL3a+c9uMdsKi9x95Kte0TpWiXjl90BB+D
	lYHtDavYlgHA9dQsbT2IBGHf180MavBeS/rAn5fXCfRV8Scppdd2lNolfFdeyk28
	/NEX+SaOd7PUnhN6tLRRNL3INburEyOJqmw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6stvhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so5305619c88.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517718; x=1796122518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaoDHmsRZlPH0GxcRak6hJ29lY+5PVrmCFX1SLF6qdE=;
        b=IR/AL0kgqjV9g4hSw8D8xhxXho8K35IHQJ/aS0RumPBsjxZD3a/uyx7CzzCi9wUnhu
         xIf9YQzASshTcNUgT6gMD67dhHNeDzDKla9wVO+qdF/L6pCRKO4hh/EBXNebhZDLQn50
         q26slekiFr1ceeN6CF5bJZtNOam7+AOwCtXX492gFqpzBtCTNyPCf1PkgMnNZDUMjywk
         MieEZcHOVV09jy1LA1P/nxPxTHSDoBu0pDX8czg87Ybu3kkPR0MjNNfBpJhbdJP8Wtjh
         3xtM886NdRVPL83w6wA3507l6NaSTAsatIbmbBvwWwNk4KptGNAuMK2ByTPhBBYEOjD1
         freQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517718; x=1796122518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaoDHmsRZlPH0GxcRak6hJ29lY+5PVrmCFX1SLF6qdE=;
        b=GNmg+G7c65o2DAETXMj9zzQ5/EMcdX2ZRFSfdGVGqGPErDVpveJaf4Z1nU84kZwOhY
         vCK1zAjlCODfj9dd9kFSKJuJrnxscNyE97Ls4HAACTAz238kBIBPzHZARlYWAe9DcyjY
         e3k6GRdfgYuCY2y1L3vI7tbQwyj5OUAXt9e7kdM0Kd0nGu1f4Dtt/H29jS70oZcCIS7+
         0b2QmDLKgabpewl1ds+a8BHCVoSInPEriwPH6Y2h7heFYRg8Xg5PBl7QEZasPvnohjZ+
         Zv6o1K8AgdLNtD4+2/VdXIi3Ygi9M6BtPECxhVRLvJbLTD/ybcfTDQq0jhsN9Pjx7mBu
         0dwg==
X-Forwarded-Encrypted: i=1; AL+hErHojdPECo9rzGgD9Oo+pCPmYNMSv4aGSU61r1oWucy4Md2TvsnV5VJaMHyvBz+Bmml8rkgtVSyivwIc@vger.kernel.org
X-Gm-Message-State: APuU4Z85meunAah4Vv+nxoXCSdRb4US7DjAxNuzD9gyoqWwQMQCk0sJ1
	AJ+wLkVIHILMJVe1KVcOWeMUnsDj6cLILpLkDZGImPC1qSKPvFaZQidPwXtS+lBQnAoHXEBVlPC
	vyXMZVg/CXa0jh1PNtVJulKJIdXVbZQm8bMH4KscL6NhDauXkvJWUKaojVPcnhWZFOflJRSWb
X-Gm-Gg: AZFdTZeAicPBweQkD877nfDmEW34iyg8ZdOTrLVLV5w5vDZq3VRJ60xICMRA+0sooUI
	mYWe4K1ydWQOFx3dCwWWmwAtouLNfe9aYlY4LTFRv4Rjbor7vHarXhza52NfF1pZawltVN7uIux
	vpJXnB3NgDPvM77e7ImnIeBN44q8zFfIa6ZW88Tlh3wl3rglhQXCeZa9PrtS7r5ON5zyTyRxFeH
	tZ6C1DH36a8nVjeBcWV97JncjgzBULblH059B38OORmluf+ZdphzdP90O+6DCdMpmFuwBAynb5f
	xfOkZsKPRqj0MheCyLxPb35V0U3DVnwqQsPf4mrD0/P5DeX0xcOA1UiJbd/jPQygn/r8HoijyWm
	VUBELZRLOV4B63/o3FdN5sv0NLlJ/S8tAkjrdS6okZ4KmveFmEfh7KSamG+e3wCC6FBB9CPLQYf
	55JNosHTIBM108ilzk9J9vHGDh37ojK2YYYmuIbRo/SQXVHuBDryZXDFAS
X-Received: by 2002:a05:701b:2088:10b0:190:f24b:9491 with SMTP id a92af1059eb24-1b556877bbemr15734141c88.12.1795517717634;
        Tue, 24 Nov 2026 02:55:17 -0800 (PST)
X-Received: by 2002:a05:701b:2088:10b0:190:f24b:9491 with SMTP id a92af1059eb24-1b556877bbemr15734114c88.12.1795517717201;
        Tue, 24 Nov 2026 02:55:17 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm22616418c88.4.2026.11.24.02.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:16 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: Add Qualcomm Seca SoC and Seca Ride board
Date: Tue, 24 Nov 2026 16:25:08 +0530
Message-ID: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NcB4Oqh5m7Lrn3rXrIajb7ngf1aj-vU7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXw4mN97lovHxE
 3KF1S9UL0EXOT1SZqMcmqAF50DfuGCAccPwxnjWRtfzCzg1Uzfhkn52sGU9c6KfakJrl9Ck5EIF
 bvtM0c6elkV4qmS+3I3/Z998cBeuVIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX3QWwPfvevIOk
 p363Ir6p6+BtgkjVAI8lQZ9L36yLVFBdBS1xxYoF6QWVtd1SEYw3eIjIwyTCVl01Xnr4SpO/GPw
 BrKsgmHzXxI8eYJKqaP6XqsSMrJoz+Opj+QL2DO695xf5J3vV1XNy72dKaxk3KFK6LGSd9LIfGe
 tbCsQ4Dw704uLNLiaz15KyaSn5AJMGisDYbFDRmjlMpf19vvee+M2rLKGK/F59FK+0DPAo3wqP9
 XpHqAiiwPbbLI1BRKVYExBxoJSoZAa/3EbbMfwe4x6WzYR1m8dVE6n4xz6JeBiDg8VYSrplTWIO
 jmqGHbRR8KW3kCiC+BLSvsSQG+o7F8zEK6mzinZV9T8ckPNtUh7gk5PUBAOfp+a7/fCHHR4IX+c
 dstqHk/1MS+TMqN2BAbmK8HxKZ74bcXkcqZ4uspZlLA+/2n8bDt0jonV0OhqDw9ePingV5I37fr
 M//kTWJGyjk6FslW4Pg==
X-Proofpoint-ORIG-GUID: NcB4Oqh5m7Lrn3rXrIajb7ngf1aj-vU7
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b056d16 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0wVTXZc6S0-_D5ZzavYA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240042

Add initial device tree support for the Qualcomm Seca automotive SoC
and the Seca Ride board:

 - dt-bindings entry for the Seca Ride board
 - Base SoC device tree (seca.dtsi)
 - SecaAU GearVM layer (seca-gearvm.dtsi), where a VM manages platform
   resources as SCMI server, and the Seca Ride board (seca-ride.dts)

Firmware managed (GearVM) device compatibles use the "secaau" prefix,
while blocks described in seca.dtsi keep the "seca" prefix.

Dependencies (posted separately, each to its subsystem):
 - pinctrl: qcom: Add Seca TLMM support
   https://lore.kernel.org/r/cover.1795517583.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: mailbox: Add Seca IPCC compatible
   https://lore.kernel.org/r/1a2010d7c4f4ae5d4629d2709157d7d47c20b3ea.1795517600.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: mailbox: Add Seca CPUCP mailbox compatible
   https://lore.kernel.org/r/5bfd311f596ea5945b7c2251199d2d0ccff41133.1795517617.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: thermal: Add Seca TSENS compatible
   https://lore.kernel.org/r/2d8b5fdcdff1f5d0df738d84773b0ed54159eee0.1795517630.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: firmware: Add Seca SCM compatible
   https://lore.kernel.org/r/80dec38b30da490c8c7a2d0e9c03c9acaae0b8ad.1795517637.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: iommu: Add Seca SMMU compatible
   https://lore.kernel.org/r/27f6e560a71f770078ef26137207905870c6ce58.1795517644.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: interrupt-controller: Add Seca PDC compatible
   https://lore.kernel.org/r/69d22406d920bb2ca437604092b22648fc14384e.1795517650.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: qcom: geni-se-qup: Add compatible for Seca SoC
   https://lore.kernel.org/r/6e09e1ce0d9250af78da72e464b7f99f942e1d7d.1795517657.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: crypto: qcom,prng: Document Seca TRNG
   https://lore.kernel.org/r/b13bc8fa6aac6e9164ce9ad0ab202d0df491331f.1795517666.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: serial: Add compatible for Qualcomm Seca SoC
   https://lore.kernel.org/r/9ec98ffd6cec85ad77738128329ec77777a1f69d.1795517676.git.yadu.mg@oss.qualcomm.com
 - scsi: ufs: dt-bindings: Add compatible for Seca UFS Host Controller
   https://lore.kernel.org/r/61136dcb5cde2c0cfe1b8f3a488e9edcf36043cf.1795517687.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: i2c: Add compatible for Seca SoC
   https://lore.kernel.org/r/0439e03884c02c9edbec89132b526aaf8f54ae23.1795517696.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: spi: Add compatible for Qualcomm Seca SoC
   https://lore.kernel.org/r/358f1284a656582ef0ea0e2b7bc07224372f9fdf.1795517702.git.yadu.mg@oss.qualcomm.com

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.

Yadu M G (3):
  dt-bindings: arm: qcom: Add Seca Ride board
  arm64: dts: qcom: Introduce Seca SoC
  arm64: dts: qcom: seca: Enable Seca Ride board support

 .../devicetree/bindings/arm/qcom.yaml         |    5 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/seca-gearvm.dtsi     | 2862 ++++++++++++++
 arch/arm64/boot/dts/qcom/seca-ride.dts        |   81 +
 arch/arm64/boot/dts/qcom/seca.dtsi            | 3339 +++++++++++++++++
 5 files changed, 6288 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/seca-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/seca-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/seca.dtsi


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

