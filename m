Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF5A3793BE
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987257; cv=none; b=Mk/FLwwjV9mtX9RjO9wJ3FJHA3Nsn2IqfsSu1eijCRKHBMtHzwH2dcbyjFN/ImAQel865tZEFMw0SwLYwEMXQ2yTLGOfih0bmpj+FqKmUvjzeOtHNDC7RXJtyQhX5r0nz17Tt32oni6rRCtBEF505/kSZQlMocZhLGOOT427Us8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987257; c=relaxed/simple;
	bh=jS6vuumUGsy5DRLQvCZuWVIjD9dQD9f0kBeu9DzftvI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XeLMeBIyUfGCdTwx4FFCoyBuic1sB8tbRKVUHUwwUE54H3oog45ELN3yD8Dnwkg8qmSTPKIDRBLnLN+yHaIH1c3I7u+ujfhK8gFbesBfChSpvJkv2XBzqKJxfzabschDcSiwRd2rhBFeAa3b5rzvOYbw+ck+3uBxqSlcPI7WOgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IY0RL+0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dsvyjlk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IY0RL+0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dsvyjlk+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596G99R1736448
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 06:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oMEUFLD08DrEmn371mkAKLKBf7jIb4Wko31
	92m3taNU=; b=IY0RL+0sHKiESf/npKrdTTzqch9nkX8CBNj1eKDLIjkOzBQqrEu
	ozc+wAKpMwSGFIRtbPLo8zj8OTTNU2zhZCSchDGDsEI9actbihmOb3MYTdVnHw5y
	OcB4dff24J1oGBJqmqcF3IBb954tfHvg80aX9mjVpsQZCknxTdDbq8tDrF/c8zAs
	vdS/iL9qzJ3Kz92MwsV2p3uMECIGO4Ukly6UAvMzV0KDtaBhEh9BKq3x8oYhIbbw
	RJWLPW0YHq9nmQn7FAIZ0Of666/tGk3kX3Sdm0fM4dWYzBo/WhHW8abwfvLITNPd
	85JAZAn+HembjU/DglGuhZ8tBQLXK0YBNWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds83gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:40:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bbdcf36f0so4554538a91.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 23:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780987254; x=1781592054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oMEUFLD08DrEmn371mkAKLKBf7jIb4Wko3192m3taNU=;
        b=Dsvyjlk+nQmxeDfv5i9s52ek9GcNZ70uSYSrPli1BJRoEr8WRfKvzGb9lxZ18RlWzG
         vWpif5WJvQeFibNiy9tE8bcCXTP0/LP5b/2fYzzJ/kyXDY/jxsR8J7q2IvTD04NZeaLO
         1RinnUb/eMj67gjEKqMAO+E44ZYOdRL4jaeRUlumXQtiZOWTs+NEg35JFez4EjbWPtG5
         GKSfiw6MHKPCPGOy4rhnBQt4XncJY7zgKCBAGMfnJLGjvs2Ugt6ji8rNtqxVFPINacJI
         XlHN3hKNDn59Nq3bhIZ0BAQ0WiLn622wl9kCKHodqc5MK9a7IAYgJ0p/pMNIIiGWKcEu
         jZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780987254; x=1781592054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMEUFLD08DrEmn371mkAKLKBf7jIb4Wko3192m3taNU=;
        b=jZHsukESnyWJVYlZHLQi+KhRtnangiWkVGr3YLVDNbyz249/2oCXYZ4KV8/6QdhbcE
         p6zeLOfTO0yU+MqodCdApjps6wYE1n4T+eXPNn987n9XdOGGrAzcE3mCwZ/Li3wTWTFG
         wAD62jQQRPP3ZeCkACpQq7vOqo4pCEMAa+M+wjmNGlVjY+DZ5Z7a+RhpENNILBfvIQvk
         YyAhQsnSfUSaD3YSiwb3euRiATSoETt7KZlplPMDZ83EAFbxw8GIb/e0bTqBfcir8Glt
         sLreiD4X58HmXZuiW4RSiGouYvrXWJWwJ5YNXRsXSINxmgrP0qafJA0VZRkcfaYf0t8f
         t3Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9iXqLQAdcXOIqc6HG/kxnmf4bTT3oieGGmRDkW3MwsflF+A2y/XJ6yIKs8j7HbjtyQ5iQ1vulbw5j1@vger.kernel.org
X-Gm-Message-State: AOJu0YwbyI48EnMKlffLKXXdEgIBTYU4qO2RtyaXvPlI06F2FuGAMkDx
	Ddya+vp/E5+OVZ4ZlldU7d7D/OXaQ4IJURDJmyFd+orGFZGb/MY4G5Gdr3Vrkrx4YiHwd77xbOA
	F8SbyYdzlIRgm4CRgiTEjNAI1D3VtMi/dsPPtu3L1EQJ6ef2Xr8jfjdx7zJfnzvRe
X-Gm-Gg: Acq92OF9UwK0TdibRQMJB6tBL65pYeuRRM3mqklXdaWnpD6UCZ4Yo82Ip6uZc0FqTDC
	5SiIRSsnRTjSlAYq5rzk50maxonMroS8P9ZrgVKIQMIjJrnx3IUABCl+JtZqifImRoYt0NNh0Yr
	7mWs3lliPBXgnqveE5pdcF3O7P2ITfRct2p7u2FnWNGSuAqFW5Au8y5E94vIvXAPG9Qhls9IuGv
	+T9r/4V8bXJUEH4yNqOe9Bsmxt79UnWMVrOZtyOx8a77MSrVk8qrySKb9E7Mvar75JstG5gpl3a
	SIBNpoXHa8Bb9hrCWMq5wLz3yLNaixVPnPOXd7XfIoafgC+hmtL1xnZH8fX5TBGv1FdfuedIO8Z
	6KhQW3UUlYIlXHTRnzt3UhVOtfF1Aos5/6YuAruAGFpb/VnNmmNzEdazEK1a3
X-Received: by 2002:a17:90b:4fc6:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-3713113c245mr14020211a91.6.1780987253845;
        Mon, 08 Jun 2026 23:40:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc6:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-3713113c245mr14020181a91.6.1780987253397;
        Mon, 08 Jun 2026 23:40:53 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f9bsm17898953a91.7.2026.06.08.23.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:40:53 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/3] ASoC: qcom: add q6apm VMID support and qdsp6 GPR destination-domain routing
Date: Tue,  9 Jun 2026 12:10:35 +0530
Message-Id: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kAZrA6OkzX8ZEKfACWG-ILnrhqg1t3SN
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27b576 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=g18NhSc54fSbZ7kgshMA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: kAZrA6OkzX8ZEKfACWG-ILnrhqg1t3SN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MCBTYWx0ZWRfX0/yUHC2LBytA
 HdLknfkgVbixbD1cKm9fWTjm9UiUhrjWxcxAPv30tijnrw6ObdjqfBIX4IJGzklD0ZuWogz0EIW
 FuO+cqCswXYYQFX0LfDv+a05VVppZ4mL/E0gs4ygOWYZjHRa3Q4AI4sTce0sncXK+Y55Ka9x3M8
 f5IIRoGldvGh5qC4eXSLr1/7yU2ASAZUPUsSgOYNHHQ3uu+ih6K4AecQZZyPXEG5hH0aklhwRkq
 6QyV4eMBlTQe1LyHkHuiCuyIbhhzxWktngXzx4BAHEDeKA2iLDg+6nf19Ce2KoKcwtF9K/qlJaj
 +UuTXYx/TNJlrkdlJW5mQueYxRfoUSScPCE71y8X3tLezdqKAdFjAQUh6t0NPY1BqknSFPLUklh
 M2/4B8GJmtJVNt13gYc0vX+ALa0gWre86Xe0Z1KfaD+el/nSH+8+H/eOQuWR2bV2gPdCW+w2YHQ
 j2qpatfrf2Mebg4NDsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090060

This series adds two related pieces for Qualcomm audio paths that are not
always ADSP-targeted.

1. Add optional qcom,vmid support in q6apm-dai so fixed PCM DMA buffers can
   be shared with secure/non-HLOS VMIDs via SCM assignment when required.
2. Generalize qdsp6 AudioReach/APM/PRM packet destination-domain routing so
   packet allocation follows the active GPR device domain instead of assuming
   ADSP, while preserving ADSP fallback for legacy/default paths.

This is needed for platforms such as Shikra where audio may execute on mDSP
and buffer ownership must be explicitly shared across VMIDs.

Ajay Kumar Nandam (3):
  dt-bindings: sound: qcom,q6apm-dai: add optional qcom,vmid
  ASoC: qcom: q6apm-dai: add VMID-based SCM assignment
  ASoC: qcom: qdsp6: generalize GPR service domain

 .../bindings/sound/qcom,q6apm-dai.yaml        |  10 +
 sound/soc/qcom/Kconfig                        |   1 +
 sound/soc/qcom/qdsp6/audioreach.c             | 112 ++++++++---
 sound/soc/qcom/qdsp6/audioreach.h             |  23 ++-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 178 +++++++++++++++++-
 sound/soc/qcom/qdsp6/q6apm.c                  |  48 +++--
 sound/soc/qcom/qdsp6/q6prm.c                  |  19 +-
 7 files changed, 318 insertions(+), 73 deletions(-)

-- 
2.34.1
