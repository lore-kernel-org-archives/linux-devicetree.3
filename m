Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223971;
	b=2Xt9+u79T0zkSKkW8CmCNu3BhaPW+QVtx6/4ssROYHTnLH9Q8eH6jT2fG9QrSo1IznTY
	 v+3RlDE36+QD/o9TON5VUOGcf5hShxCjNHT4mDRC/cjYpP2odXQLACOLnBAA4R2p4ryTk
	 EsHT0tsg2h64i+vP/GxBhhhhlDQOGwJyJB1O9gHFgv3VLIVrFrGtmGMMFwkowelcDwe6f
	 2o4anGT/4Xb901fWgqayYs2Mk+cFHarGBmJ+HgqVOMXP6Z2jwqlJ7aM9lWd7j4AxdO6l/
	 4yKgxLwlFv9RSn2mgN0bRoAegyHc/EvpJYk7YGzFYJSReEcnnui4Ue+TjOg4fj/mJ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qDgpdHPAIE=;
	b=UKuIb2ayeVpWXiNe1tyMC1+JhCGUyNRoNZETvAENIGBKbEntxEQsgX8RYKFTBjGLRQ19
	 8ephfWu+jfS0JTztGmqMGgr7OJp1XcIf3pIOGD0C6jri23hX3cFORiV+V8DPhCm6jCECK
	 BKr+5rCcT9lem2I0sqjXtN/rnDzZCsefauSDKH8sBKUB99Y6FqW3+4BXlV+RmqFt7oF+s
	 QKCXKrscU38cRgOmOmF6tV+utUbXqVRE+FEx6jfaPV9AqCpKudqITIJw3U+GstFCGD7u1
	 xHmDMQJvM4q240s7xXcjrpxojmPE2ydx8KxUcp+QjCcIgtJLGSkjjSJczGpbGfife5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qr+CGQi5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOqqfziA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D27606A326
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D27606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qr+CGQi5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOqqfziA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPj3C2431864
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qD
	gpdHPAIE=; b=Qr+CGQi5rIYEDNqxvY0FDiFyL9jPmq29Pwmoeccb6c57Yuq+Fjf
	iRlQWk9kFq3xhCSMa6EVEOZ7ACmFabOma1s+E8RH9qM1YzhtGufS8F7/E83jX887
	Rg6IihX16MLyeLQB2Zsx3ntk9/0MjKyIbHT1eHReFlCkE9soJyB2Ouv7L2UmysV+
	QOxANO8ZCeusvd+QDjec/miL6f0co8CkzD87hVufsP6v387leB/i4RUgLfr4SC1A
	ahrM8Af2LkLrrtVcm2gx/8RUg3mbJHbgRwSnJH75CkkMN1/WHW5jGjIoX8nsfGeX
	V5e0e4QNqZJa6HqHhCd+L7SQgLJU0nlwirw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7u5b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:46:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso273904885a.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223969; x=1793828769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qDgpdHPAIE=;
        b=NOqqfziAKxWFFwOTCevh+kVlSLCnnoMBiZ/FIMDUcQ+Q24FpjcvV1Zne9Qr2VvDa8L
         jDpUZ8nTzRfTOMDHg+UyrC52fg4uuGS6vFKQNg5J8H2HHol4mYvV7lVJv0jd/RpDLKLN
         A69JXgQrtqnwRE1IhSR0Cb0W2DqlEzeoZoK4ayCWmPK/A0rq4Cj0xM0dynt7V4LiegXA
         CxpXMj7qSFXL/4t5wcUlVu+xc9dqGvgieQ8c0AVwnEkcvOyo57WksGKpEYboBM7xuHMr
         /GeytDHa87mjHE7wyFp21vGDBeMYMd4a5z4+89UkqOA0ZuySFyAgSFdz612ifufq7ViB
         t+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223969; x=1793828769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qDgpdHPAIE=;
        b=hxz7QAkAyMvaFKq3akeYXooui//KFQrJDAvSGS4EQ1a3lCgeWWnS2RgeWe6uDhI9gg
         OV7ijBTR92UUb1OhNXmrmWKN43BZkbnQHqjY9kTucNCMBcuVC8BovCXX+azAxwkL4aA7
         ru2k+b6zYPl4JcRYi1UnAky1W1JWEjRAq/QRoLnxfkx/irXI+3iFW0NoLBl5HmpKC+8l
         /dWQjF5wKvWP2det+zMZGjdjlEyJPFsCoy+lsV+kw1AIL1mCbIykCACRs1J4V3T1q/UR
         6RSuBLq81rHHn6wgDVSAb3NaY9ngOf6HItSwLptqpwec4QTdbAktJkVpkeLBGaCgDZhz
         s6LQ==
X-Forwarded-Encrypted: i=1; AKwUvByqCmuCttCY/seknhqFP45gtPuY9IL1MRPcGAYfGutxJbDcchFT9tShg9V6be2TLvyuvzLYyUWyWlUA@vger.kernel.org
X-Gm-Message-State: AFq9FYIW3HCzVTAABJkxgAVURUVybDu75toDLeMQ2oKh9ezQljwQPNtl
	wZ0kT3QlaN0PCj7LoQQt2UwMqYC8o+K0KZdAE10QTjSzeMSy1/To6rXtY9k6L+4HU8P6fVmTY4K
	M3QxZIetMLxJti8cueaxHxY30TQWWveqyhkNN2MBHXcn3be8xRBAfomSNaPnI7rae
X-Gm-Gg: AYBFou3fmmnqK+YXWlgKsz6kMuxygpIn80Tqxt4YgTRsnK2qEe//W3r7aSe5s0UXQlY
	zZH7QWvq2cXOuESHhQSee3BSKXP7r7/8O9c0t1hB/3ooclwd4IPHgl/pKJcnb/cOO0Ssxd5sc5f
	dKvOrcvBwV+F4prCUzqXgs6iO5p9+rkTKdLUhbM4w183WvCi6L8WIddlVAuUocgYHR5TWUuRpal
	dNOg8AVfSIj683iRm0SmLiHYimYuo72lAhQEgF5TZwdiMMxo0NA7kEJ5Ede4T95QI95NJ1q5yi4
	dLUIWAncwz8r6dnhngiR3+YIhU6g+O5xatf2LmiF4fj4ld2Lbj9RAxE6Laup45wBSiWTsvNLN8u
	/uzTYp257iQtBl/vNudRjCpwwowJCaCG/n0MA3YinMwse86hqg0ZYUFmBx64RKA==
X-Received: by 2002:a05:620a:469f:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-94408930328mr566037085a.4.1793223968739;
        Wed, 28 Oct 2026 14:46:08 -0700 (PDT)
X-Received: by 2002:a05:620a:469f:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-94408930328mr566034185a.4.1793223968293;
        Wed, 28 Oct 2026 14:46:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fead817sm18642395e9.12.2026.10.28.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:46:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: monaco-arduino-monza: Prepare JHAT 40-pin connector for HAT overlays
Date: Wed, 28 Oct 2026 21:45:49 +0000
Message-ID: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae26d21 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=3ufCqafKAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-RhnwN_n8znzIZ15-MQA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=aIhU7PV4tMzn2raNFj2v:22
X-Proofpoint-GUID: jk_UnhC0nanZZFznDb5uGUDa4l8MVTk4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfXxMwKiHxIJ2yE
 IVqxybuFr8oVifNby+5PSwckZ1teNVbqCiCT0t6txZZbeQBIySbC8gOmFgPh8rcv9JikWDHryiP
 FSZDlSKtMTZV+zb9VTZt2wFgyGL89+s=
X-Proofpoint-ORIG-GUID: jk_UnhC0nanZZFznDb5uGUDa4l8MVTk4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX2aD1HUNxusuA
 syRUBqhTWoCUVG21UtOszK1j1dt6sy5aMTAdzDNHFHVfO6FvMY1GGlZ8cz3teznupn76ajR+zLv
 QHlZ0g+IUnQjnuF6Yxe1scR9sUqVG9zPgn7owBFz0Pc0S5NL5kwGItgC+yTF/3YXcSPP5nMA40o
 oBP2wvzoDCDgXwQQCDPO8dXYk0lxfx4okoruNwCF0NmzVxeCtYmE9YR4rQTXdjcEkxzEp4hqoiQ
 xr13fbGxJNvTjPAI6zQ8Gf1ya+h1U9NM8wCT7+jJvQaallf2GxDthijGlkhtj/Jp8C8wyk1uJ+8
 fcaHm3aS/xLN7HsRiNeoTMpPwbbnwW6TF3IB7d0GIT4PthkStKFwfwcJvVBEyKx60YPt+5I+O5s
 X//v5NI9orMcU+0GrCiH2rxR3bpcBMIBbgK4YM9im+w7bX8N0DgZ3W8VcYXZACJZ3nOArmlBBST
 D9mCHpfK+tPL3ebIJ9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280086

The Arduino VENTUNO Q board exposes a 40-pin JHAT connector that is
pin-compatible with the Raspberry Pi HAT specification. These two
patches lay the DT groundwork so that HAT accessories can be wired
up via overlays:

 - enable I2C0 and SPI3 on the JHAT connector and add the i2c0/spi0
   aliases, covering accessories such as the Pimoroni Automation HAT
   [1] which uses I2C for its on-board ADS1015 ADC and SN3218 LED
   driver;
 - add a label to the sound node so audio HAT overlays can extend it.

[1] https://shop.pimoroni.com/products/automation-hat?variant=30712316554

Changes in v2:
 - dropped patch 3 (Waveshare WM8960 Audio HAT overlay); needs more
   work
 - picked up Reviewed-by tags from Loic Poulain, Dmitry Baryshkov and
   Konrad Dybcio on patch 1
 - picked up Reviewed-by tag from Dmitry Baryshkov on patch 2
 - rebased on b-next-20261028
 - link to v1:
   https://lore.kernel.org/all/20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (2):
  arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for
    40-pin JHAT connector
  arm64: dts: qcom: monaco-arduino-monza: Add label to sound node

 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)


base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
-- 
2.53.0

