Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612721;
	b=qaSWToM8piGrHeD7oFt6KM4rnTZeE61OG9awoYB54NArt/Gjue82B6z3uMYFD61NGNnA
	 9rOESQhu0pUDfCiJlYl+0MtNHjk7uizxeYKDpPyGBw98oPBrkP+nK/IDi0/6JL5xkDwaL
	 D+JgUXTX7WFYtyCG8cnxP3cHGjBWIz/FtkrtHiU3cKkm6iz3AFsKTs886B18Z6dAymUMI
	 u3RL/sSvcjxW3JOzbiyV8Nk4gtSi/qVHA/5D5AU8cxAulgUFgfzrgsA0u4R7PwLVQngPh
	 TAXiW8KjCvIq9ifNQWkjeTd4MnnuMYoP4nzszcr3WY9at9IYBnSUm3sQ89j7RT2HZXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612721;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
	b=2c1LPZ7yHaW+QIxBZp/LBC4Bt57yMkM24FYtMaQ42eSoWHqF5BQGj9yYDDg0lR+ublQi
	 YOQQax9vqJY9L2cnTUTiAB+s32/VPMCAsXiaLj26Bw6DCh+YuW7u8k6HHyBc8nsdeFkCv
	 jz0OAHjm5ZeaYAELcIzaZbpFC9yY2H6SW/QxlCsUeOcAdzd97k1Athy7Lh5+NDqHIPT2b
	 m7mVEmuuLgBXm/Tn2ck3ubFuttS1sb3B5FIpB7QRejmmGDoL6zgtMii1rqQAswta4K4g+
	 3lXDwqVaZf/EomS580TdcUnByVggSJEwknqTcrj0OJRdeh6W02VJaGrzxx521tJ6Eew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFMdSavS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VXNmEP8b;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA56606A33D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA56606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFMdSavS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VXNmEP8b
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mOqU555534
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4
	vVjC8WUg=; b=iFMdSavSoklC8ZWJzQs3vecWrTqmuWKu3WWcfvYnOuo9Ehf2OcR
	gSyIZ7aNh9JrBsYngVKO6Cr2ZFU5uoUW64X1TpHqbbVbOU4IBHckTNIrCBjj9xAq
	QoK3K4Q6jUyNHuWvDT1/3A4XhHy+LeSeya3MlsTzxpu9dWT32UNHZ/B2yEVQ1Gdy
	iOhOpmYdki1tf1tQJbcKdXJEqSlSsk33AZtNu0gjjkxPCyByT+dVA9ahbyCvGitS
	U/zwzC8C6CqtGhK04GVXYuDTv/evPkqQdZLNGFOwPFzAde0KKgcX+MxASapRpnA1
	u7+6fjbsBELWfBw0xojIfeE4pVBT2sSzKEQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnry8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:38 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece5510b79so3885015e0c.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612718; x=1796217518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
        b=VXNmEP8blzrzfo6umboC9Ba3exBUozyaYdEV7YIujohJ+5MEEBYM4MnVZ3HANDkqFm
         tr4YtCqW1VJNd37W6oIG2zZhanwG4KCHKbL1PWrlJHr5lWpfK47k2QqvkinVKMIh5x8e
         Up/lJnl+CI9iJuK3IkT/UMf5QDZZA59dLCT5NMoz0vTtseIPBiAhaqVyynOIrQ+e2P3j
         2q7hbzwOG7mIX84S+ZLfRTjORkv/Eh1z4zPoZwN3LgDj7CAUYRe2nMIBKMkySA7+Q0ex
         OfVyB59f04H9Q2o5E/6kC5IsEyFS0O0gu3IFITw7jk9qfHPI2y0b8H4jvpjNuQMZ1Gca
         CnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612718; x=1796217518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
        b=2T1rENB+AnGFNRuJ3Tluad6P9Cu64krOb2w4kC5Bikfw5l1Fx4+7oOpt8WEByHrese
         g8p3gPx86dPIjvsriALQF6X2Jy/+Oh0e99/d5X4r7rrRj5enEiicg6X94SSPvaF9m9KV
         Eh0DwrpKBdXwt6Wv23jL5lUmUUrOBgboQbhYpTvpPDcllsEYJ0W7u+QSVqUNuc0dsjWn
         UzKXAesIuXcbLECw0R+Io89cZ9idAliQZ+DrTYc91LbrummIsykO8PjsnosNc6T14q/I
         /Rnwksex/iMqtaw0Mp4UdIC5iq+un4seiF6hXIBqh+F6U7M7m32fVtFjL3puOkI2mTG3
         ARfg==
X-Forwarded-Encrypted: i=1; AL+hErHkAtiw8KFeQOnOKus0p+e8FEs3CZr9V2zL69FUU904bkupJ/jMtZ3ziTY/IVSw3nSPe5Y0601RQygU@vger.kernel.org
X-Gm-Message-State: APuU4Z/YmGM5PQYGznv9YNTXFq6bnx2qY2WWOR6N02khV0kSa1oyXzFf
	FKBpxJc36nflFUJHc1Ev27TzpxmFpyqGEJFZHw+CioE1Y1G6xlYQbyYH7s0pZYymnz0+FSNh/3g
	3FXn/V0u/CDKcn16cLTXnGx1SE241Hx95cCmzU1EroQx6Y6dsgQiRtfL9f8dsefCy
X-Gm-Gg: AZFdTZcvPMJhtDAInw+lJ3SHtUs9C1L3Ev4BhrP+CBqxtoCWp66HIstu87E4XfNnuwU
	be35naZDaWnUopU4emNj8WG9rvtcXPMdh4/hvp/n6iGeY+t/r+yullDLT0H3j4VmauLdzrM28oe
	ERbqfx+aBacdeQdwoSPBk8CFqgT2DgZvZ4OOBfLsDz57AWEOMX1pvoQnkjqFzPhwEF4MX0y3iN+
	ONzZ/npbjz6SJtacuP55ervDRrqCDvapcnTQ7kvsyKKKmUkxfnnZbg5ivDYgrM1VOvtcT0oG8c4
	wbY8m76VCv5c0ioUfyUcU4LwdVcyORwI+N69qcJ7MEoxxFJu9dnwytsOJn8HD9GlGvsN7q2AS0m
	vbjmk3vEmBDkO2uHxG/yQvQS0gbHU2Ss0fjV5ozELfOhlaHA1RKrxsztBTbl/0WPG
X-Received: by 2002:a05:6122:4fa0:b0:5ee:48a1:7a4b with SMTP id 71dfb90a1353d-5ee8afe028cmr9899652e0c.23.1795612708831;
        Wed, 25 Nov 2026 05:18:28 -0800 (PST)
X-Received: by 2002:a05:6122:4fa0:b0:5ee:48a1:7a4b with SMTP id 71dfb90a1353d-5ee8afe028cmr9898738e0c.23.1795612696151;
        Wed, 25 Nov 2026 05:18:16 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:14 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/4] clk: qcom: Add LPASS clock controllers for Glymur
Date: Wed, 25 Nov 2026 13:17:53 +0000
Message-ID: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX7dxBRr8xNSXV
 7voL7H7hpewG9A+a4V0nH4jWu5kcLeBL/NzS3L0CrfW3Wti0CKcs3PqK8PGiac5DxITusKncV3A
 hcPB3BQlmbNzn3+7pnZ26votpW4G0zSUTOZlBMYpmb3mOAebsCPNv5E+fZg9KGl6azLBsjQlaP5
 xbDyyefrrvz7QD2M7EpwuboVRiJSicxZJluxldI+7EMP4+sr6jyPDe3enwggqdoFwEv6U635qv9
 cCwVxUWN/NINLpVTQ0XUt5PIFcmk+8sy0veJhQa+aJn77Q468JNur5ZPXtniEp3F1RkzcpW/8bZ
 o0d/3UCkaJlf1R405NnWoNsrD2C5hBU90l03+C65vMcG7NbM7GxAMCwG7bTuUddaZDH4XFMIVhs
 o6iBMvHx6DO8fo2QAhUNKIz2LZ8CWBMrftTi/mMpNWOtsIa22M5yQcN9hKKjOoGrXNYzuBaLkW2
 X0IbyJWUNuW7aKvob5A==
X-Proofpoint-ORIG-GUID: ydc2836HHIhkld9hyNIyHU36f_O0M6uX
X-Proofpoint-GUID: ydc2836HHIhkld9hyNIyHU36f_O0M6uX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX3BBbUAXyZMOK
 MI7M36DNE+B/mlZeDalUt7o58b6NqJtt990H+J0YWoP1qAtS3Yj5nsoOStNQ8iLMosmi/ji9QQq
 0/xUaq/FE0r6hYUlnspYZF2LcLt5plo=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06e02e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tj6v_WFbzlxhzRuvkX0A:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

This series adds the two LPASS clock controllers found on Glymur:
LPASS AUDIOCC (SoundWire RX and WSA1..4 resets) and LPASSCC (the TX
SoundWire reset). Q6DSP owns most LPASS clocks via Q6PRM, so only
resets are exposed here -- enough for the LPASS audio macros and the
SoundWire compute-mode controller to leave reset.

The programming model is a near-exact match for the existing SC8280XP
controllers, so patches 1 and 2 extend qcom,sc8280xp-lpasscc.yaml with
the two Glymur compatibles instead of creating a new YAML file (per
Krzysztof's v1 review).

Changes in v4:
- 1/4, 2/4: add "qcom:" to the subject (Rob).
- 1/4: pick up Reviewed-by from Rob.
- 2/4: pick up Acked-by from Rob.

Changes in v3:
- 1/4, 2/4: extend the existing qcom,sc8280xp-lpasscc.yaml with the
            Glymur compatibles rather than adding a new YAML file;
            drop qcom,glymur-lpasscc.yaml; update title / description
            / See-also (Krzysztof, v1).
- 3/4: bump max_register to 0x3020 to cover the WSA3 / WSA4 reset
       offsets at 0x300c / 0x301c (Konrad, sashiko-bot).
- 3/4, 4/4: pick up Reviewed-by from Taniya and Konrad.

Changes in v2:
- 3/4: drop <linux/mod_devicetable.h> and <linux/of.h>, switch probe
       to device_get_match_data(), lower-case reset offsets (Taniya).
- 3/4, 4/4: pick up Reviewed-by from Abel.

v3: https://lore.kernel.org/all/20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com
v2: https://lore.kernel.org/all/20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com
v1: https://lore.kernel.org/all/20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (4):
  dt-bindings: clock: qcom: Add LPASS AUDIOCC reset controller for
    Glymur
  dt-bindings: clock: qcom: Add LPASSCC reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml |  7 +-
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 89 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h


base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
-- 
2.53.0

