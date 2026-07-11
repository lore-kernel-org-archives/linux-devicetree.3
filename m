Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4252066DE
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774675; cv=none; b=X7wjXi2vqbfz7svyAcu6pm/WYgBoj8sP9WLuOr+83oSUvVSf1Y2XE1VdRQwUAgvi6/tIXoifoMxUoJdcgT3Y/UOvmbwHJjb1HUdaQAGsmtV1pTA9I0tlpj9nZXY8iRJtN6Wp0j/wGSBiMDaJc83EYp8l+PKNuA23j329m0X/pmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774675; c=relaxed/simple;
	bh=E08ZjSLYCMK9SJ4nIZGC9Z/KoKMraZ4vLGrrTMsAUo4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Zzr4hVpSn/+vgqkL78SvKiz4U+W4f7J+MULjnv4wObhaeAnWTamCM46ZtHhELhkNXnxuYuWat9672EavsXcXVyuwK92uBoUnUTPYpWFN6ZYHuNlxvpep6yaGci57TriC5fs2fEYuVBbHWsflgdvjmk0b1VvRb5vBDfTKiia3WLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/JwW7Wq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UD+5xwnS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/JwW7Wq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UD+5xwnS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAmb0I3609652
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MTb+0vYch66DSjN7lGTl7W
	9yD3pHWoZKtdOyO/YagqM=; b=n/JwW7Wq3RL7TEzym2VrIaCB7uUpC/C+YlNO+S
	OjBEULHjPbtObrWUaQ8BMWrIRN9xFkf3DBXyhMPMh+TiASoznY03KyGxt903QzYN
	u4TowW4FhI2mMnsPRPoy3fW+vqaWR75zdAcNPagvxZEF0yg7wA75MF8Urzz0hxF6
	OnqHKA+0rgAxsKcJ1zNB1jmOO/bZOY5Jdy4a35rjmrzq3/9HMQA1uwt018cgoxp2
	RTeGniZpfA5VdPHVOzwgmOF0y3+bM39k+/ehGWBWZEgxd+pe3k9coz465ce44KMs
	Bt4LLqB2IymHTMOn4160NMjKqFURYUEW6xtdwA/AJe6nxlvg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamrtx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:57:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c889d1eebafso1504678a12.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783774672; x=1784379472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTb+0vYch66DSjN7lGTl7W9yD3pHWoZKtdOyO/YagqM=;
        b=UD+5xwnS9dPdPesDXX1JIpqbO9b66mONL9UXXT3G3Pmdu+S0tZzK+/CSTjcioYT2vc
         cCmm7ur0b9dAnTe2jw203Ic+hGtPTvBerVk7KVK+o1lGuXI7pVDeOOaCNIVVeCdQRxz2
         OAK4zdEJBroTFUSCNZlK2jKjmFh3E6KGj05xyr0AjSIp4qI1ZSU47r88Gym43CWYHK7K
         2MH9638LzNanZ1Fn6EZJ+vCKMXhO/XDjAd8dO1vtjSGEo9uU9xuP+fFXGdaWa+dk8WvU
         fotg6rLFTyyfzeqLEdxvKM+piFOZIHQypmbY13At9lKJfe6FJNo4SDbEpG15u8uYEOp1
         8g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774672; x=1784379472;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MTb+0vYch66DSjN7lGTl7W9yD3pHWoZKtdOyO/YagqM=;
        b=rB1Q00HPNr4ZgzMbB9g0FMgc4+qbNT0NcYaG96C/zQGf/I/GEhMaz1NwtBVx8CtgHj
         pXv8PlT8WTZNblgzLezRzc2I8WtxJtyUv7NRpG4JuC6tBSvT6UtpHdSNbdwx93k9HcBN
         ZWWqotZPd04L+zOZsqeMZv+E0VbJWsfS1GfqcpzAgRo4s7tPjX35Vk07y/HGpRyXC+Wr
         L/j75fLUzVZbi03LVR7W27uSbSOltiLNtlOY+0xG1/svc+6UsM5MzYckE0Yjm6hGVQ9t
         QiwuteZgIB1j481BbKmR/hIwUG4xUNzzKhPQlZabsz2/ukXsLntWpWucl6l+D+7jHtAA
         N1wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rroid4YxdnFVMwqXA2D9OH92PgOMzkdo5fR529yiQu/Uu74zsAMzfDnt64LuRD3HEO4ApqL7Xsgiw1r@vger.kernel.org
X-Gm-Message-State: AOJu0YwwjPmNzquVIUakWyXDInHg60LMdnSkPlVXqcoF1rJNRhmMSMvC
	o9VzwBqVkZ2SdGG3mJo8PXKb5uhgbNxq4utyHp8vib/gnWlLsfsDQe0S9z3Cib5xPRI7U2x4dpr
	deGAlV6cWQNMWl/nnKBjUfZkEcx0T8E7kLLtwXk0TPfNgo1J7twGEAfO8hag06MBO
X-Gm-Gg: AfdE7cn54OAJwNG9UGaPlecNHf9atGRj4uk9Rtb/cqH0OY7klU1xr98SCiwwPz9vauU
	j0i0qgK5mc6DIcT+seOnF88iltF0YfzYNrEuVKQqVmmtV5xSZzPNld+aHwZEwMHmHa2Bh9aEvBM
	0OuzJLbC4AK/NVeqtZBea0uNOOCV+EDbN9hEgMIeNPuXw1gcktZbwo7/E4cc1HAUCF2ItnPzHOh
	oLEnyCrA0+n+l3BzvZ87mHamIbHIjoVacYYm7C8zSpk0wOal2e4X9bFaInKzWxjSulgj+SMF2Z+
	kwo320Wxo3Pp5GRqo0kxegS2Ohbez+mj1LO00/GJzJgO1rrU3ccnN6UY73Vv7IUzZSINJTtNocQ
	tlApTlIMqqf8QJ55u70tF48SJng888XYqfxANhJFOrxVGFiI=
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c110a50703mr3506837637.74.1783774672330;
        Sat, 11 Jul 2026 05:57:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c110a50703mr3506814637.74.1783774671893;
        Sat, 11 Jul 2026 05:57:51 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm11185634eec.23.2026.07.11.05.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:57:51 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Sat, 11 Jul 2026 18:27:37 +0530
Message-Id: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX35BKMmPDssyD
 p5IVEbgU5Oq7XEVsxgwgDI/1D0zYvpRgiZSeyQFsOSJgtxcR/oIU70p7RHLkpfQSwoMeBaCnXAf
 Be3nSfg/sqIrt84mJtIIff+S0sS6OPU=
X-Proofpoint-GUID: 7sOLzzO134OgiNl4fAE8AtpTSzpeqa-O
X-Proofpoint-ORIG-GUID: 7sOLzzO134OgiNl4fAE8AtpTSzpeqa-O
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a523dd1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX4VNwTS2+K0e1
 yBnrjJKFW+HIgKuJeKcFum8tE6RISrpz0Nrs4o1K3OhTxoIc+Mav4io/3+f+JwGBLNX/++lwBhm
 VCpdCZ72BNH+Bbw4EKIsXAW5dMlhHg++cVJJd4GBu12tpp58S/N+RfrXylKEcfJKsR6JX9js62I
 sw2FFUqjVDbdipf9VezyhXD9w94gzb6KHOZYnQ9NH7c6DiTrgQqJ8YC1F5sQ5hiv3BhvGrYM27i
 EdB4O6YA6eo8C1I8gAaRY8zK8N6Amf40cKaNroY3OGcg/+Hqcz3t84sqSWNnpid+PSetp004NN/
 JhB3spGgahxt1o87yQixAktMfQ985LjPQB25CLqofJhl2lgLJq6phDQysmGNNg10TqH5IlO69Qs
 rDYnCPdF5+SpUGauLSm6ONyluW0G3uZTsz1pzD/x6hkN6LkRP7dzhjOYMoyGGRn2T1BIRaQQGvi
 rD2ijrEEBa4NbLxGBPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110127

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

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  58 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 193 +++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 252 ++++++++++++++++--
 4 files changed, 484 insertions(+), 23 deletions(-)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
-- 
2.34.1

