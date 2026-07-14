Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD853D9DBC
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040791; cv=none; b=jPJvRHmoIQAkZ6xNu5zoJSKXwsvUprkNEHKZEEtn8GaDJ09kFLdaodYUIaemoJZ0dPRRi8a7mQ2MuDQ3Tuk1B2E4/uhwpfyrCU2CuglXic790ucJNQL6aSisxoKvTMPmKC+i0/gUi5rrfizHyP5maD0D8eXOFCQCRM9OAoeEiK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040791; c=relaxed/simple;
	bh=fA4lu/F75lzuQu9paxnWqSj3utpl4LgQhR7/CC9eq08=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NsoJ7TpTUy1g9Me0OeD89og7wkgsH7bJIAoHk3pY37BmlJdrsM8tAOypnB+AWbXNg9J0VJxIZmPU42ryOZL4UwMwBlUN3L0XyiyRjv5bzYTp6lOHeCYSVa7n053LYBfLI8/it+nrujSyvVeeAxO103LjDErO8dWnIGoe5W1gZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boIwjftE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lm32J3HY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boIwjftE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lm32J3HY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEcpQC677373
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QjHQFO9WLKRWMxFM5jj455
	KOXXdgE1y6q9KtfZTSlpg=; b=boIwjftExZkE99nOitwIr9twh8WlcW3ePy7Ghx
	C5ClQg3yWkshhmORYmY24L9I2xR1jOorEWEInGONY+Snze+VZzwGRfaXKt6J8dN6
	dPPBuRfvj2meq/J03q/ZZ3o8xHgbQlBE1Hzd5OKZSXvBhxEjB9Rg9C75fY8oP5ud
	X3ptk2gIucQm684kVUixOZCOQeW+xLe4+ZPcr/MfyWxZlizzlNIIcNDSUCKj02nt
	TqWnyVCA8uGxMastGk1U8SC0CDI6QnmByHOne6iY8QwRdPkNy7fosBS5Wjsrfp1V
	Fubj7efnqRfCwaIjuUVj+nCMLa0b3Dq3MVLH/AEh0QH1RRhw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde0ahad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:53:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so5147876a12.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784040783; x=1784645583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QjHQFO9WLKRWMxFM5jj455KOXXdgE1y6q9KtfZTSlpg=;
        b=Lm32J3HYtxwgDlm8Jom1MJ40eBDcS4lk8KZZ5czyVYnPacCBaC3Z4EpEp9dNt/YfY6
         ItPgTpqVVaLfGSQ+KgqCrVX/Ugp71HWX4XmBibtiLQn0Y0XnNEFFw1iZpyxkmFNclQiH
         h+1txnTRRdp7E29sfphr2AXzQylUYAg4ArAvMzhUJBnz/WNQJemA/HDBEuOJ4m+yUjiz
         fiDNxra0mqdEsFebEPGwyBA9Ou/NrY9b54P3EcT13rvB/gIZ4k3oTT8UybRXkB7enBkw
         pGNZdUXp6Vk5WLoVBWAHv1gcDnMxfKaFMI3kKts6H1N43MJosJHHoGA2emJRPA0wbcMC
         RurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040783; x=1784645583;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QjHQFO9WLKRWMxFM5jj455KOXXdgE1y6q9KtfZTSlpg=;
        b=ien1aPTIlIGBAJ3MWHVP9zSTGc/ThW4mrkdyDaX9SJWU5T8DAI3iIYPo2JPgLJCujp
         YAw77yPKDJzmqS1h4Knk3yVH3zakfLrx2eam5ubvcM22mVaCFn9ntcTsXJbtfJr9IxRF
         y7ZNMFaFJfyLBQk58c88BOKlsBKjEW8xI7bIddc4LVl17t8vmwvDJu/hP80JZC/i5938
         Jn/hiUUkARHW2djvy/X+KjbQ8TmYsReXO0VQac9sBXr8rDUiacegnLW9jaJUsOJkwdMS
         wKlRotK43rCRwoPZBjZOtjFeIUTdY3UTFQroaIY9m5Au9Q+8/2QkBENdWmv3/PPZAh/M
         RRIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqImtdRXtfaMWwusQDt7eqxwrTJcm/rHR0KnoAQPdO0AtoxUy7FX0s4viWan/NUzb7yPOl5LPqsIJ5+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Lsh5oHY6Soho/yW2m6YZO6GmmjJjHm6CdpcfMUh/P0klP6z4
	4OvUPAy0Ld3hlwQ1HhAW+fS4haOXmdVBHx7zl302GRu8zII+YctsDfq+9Xy1JVWHlh90SwpGbtJ
	t8vGTdIA/g6zkYjYo9OdhYo6Emo2lEqRjFDPA8f4FPIA3enoXWSPuxnm3ctYH1C0cCBHxMBxm
X-Gm-Gg: AfdE7clH3QII5z4buk0xjFrCzbDYwOFyvNj4/rACDOh21O37i/f9v9PlZrxW9Zi5FT/
	ZRabggEKp10jhSKAM4JeJu7SLV2bLKpFMc+LnbAsUyV7dqGMDeSfshr9j+64V4vm7+Nltj//Nll
	wFXj49Tz1xMyuRkaULQXbA22qTwVQwjo7BnZ3N6dHJSlNLmn91rd+VAypijRVW3yv9ASPv2WE4U
	FksMZPuQmhG0p7PyCRW9Fbq3Z4D/1MOJzWPea9GS2eQShGD2EiKtlSaRv0YassHrNgck4jpmH2P
	YdjRPalEFOA8dlTuxxgejFXYe3VtcYSTLw9Bn9/rWrx4YCgRhi8fybV8rBcNpMVnU8G1o8h46+z
	Lb1x8KZgBiJeNCTONNvyI9tGHunrpHq45v3YKuy/0hGXtVSM=
X-Received: by 2002:a05:6a21:7a43:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c110a7b347mr15865045637.76.1784040783222;
        Tue, 14 Jul 2026 07:53:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a43:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c110a7b347mr15865006637.76.1784040782708;
        Tue, 14 Jul 2026 07:53:02 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313cb804197sm31941773eec.13.2026.07.14.07.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:53:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Tue, 14 Jul 2026 20:22:47 +0530
Message-Id: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX/v+dSAAJFI/s
 8Ic7X0wj7IpyYZx6y72N9KV9Q9srHtGcrS3JUaGCuyOfuF94U10oby7SNiYMp8EZlNtyqLRbQcD
 dwgVIwOGI9PA1d18F35rlFtS5K9+HjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX06OT2CwD7f9L
 1kPPJ2v2/4m5D3NBt8n3Bv3KFvhbYX4EC+2xE0OJu1R240OKQhcwywU+BKHcy4STLPSdd8UNb5q
 GwbfmKuHGarmM43r1bC81AJcw+Sjr2g1RgWV6L33EZ7AbaR1WynJfqpT4YPmeJc91WDXyL6VOUA
 DGvJ8j7fqD2BUXU79nRVrtE+T0IDziGdSPPWuZ4nXvOyMziJgeS2Ky3dlO2cOzBVMUXlRZ2BXB3
 5KIna3N4b56ZszYKZhZOTPLuCpDQNgDQMYgnSIhb27HeHC+0Xclkjo/3z71URjL33ooaCpl0wpV
 WqE0+6bwRV76u4H30hCIx9+LH0POvL13rBQGeHVhTdGiDX28zwipygOhY2V59fS0+PabpEnqfF/
 uPcfR4dvYiYACopyNb/uptTMk0ufKyj+5ACoWMkuGBVChRm1cI+HbGECWqjcbfmyzunwHj5FdQl
 CU9nWZ3/p+PTV7WU9qA==
X-Proofpoint-ORIG-GUID: gFatJ9_sR5asesRlbVl5_lAN8v2hdMc7
X-Proofpoint-GUID: gFatJ9_sR5asesRlbVl5_lAN8v2hdMc7
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a564d50 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140155

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

On platforms such as Monaco and Lemans, third-party codecs are
hardware-wired to the SoC and do not always have an in-tree codec
driver to manage their clocks. For these designs, clock line
enablement must be driven from the platform side, and this
series provides the necessary support for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility
for voting I2S MCLK and bit-clock has moved from the DSP to the
kernel. This series introduces the required device tree binding
support to represent and vote for these clocks from the kernel.

Enhances the sc8280xp machine driver to set the boards spacific
configurations.

---
Changes in v5:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v4: https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v4:
- Addressed review comments from Mark Brown.
- Resolved all sashiko comments.
- Link to v3: https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v3:
- Addressed all review comments from Mark Brown.
- Fixed OF node reference handling, clock configuration, and sample-rate
  handling issues as suggested by Mark Brown.
- Added proper error checking for DAI configuration APIs as suggested by Mark Brown.
- Added SENARY DAI support alongside MI2S DAIs as suggested by Val Packett.
- Link to v2: https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v2:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  89 +++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 194 +++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 251 ++++++++++++++++--
 4 files changed, 516 insertions(+), 22 deletions(-)


base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
-- 
2.34.1

