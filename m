Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B849638229A
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305538; cv=none; b=c1Pz92LKtfu+HSXhEGLiNN7JXIvNUV2TVCJ0GkQSlXfoooeCNw+xxxqQt/z/8NsXteVO62TZhuTRGVTRGMAGHQc983k264QRF6ttYVd0eCT13x4t+omB19wD0JVkLcDVaH8wqsSK1BX/hYK9VBQ9dafiOxYAKn9Chao9QNSzSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305538; c=relaxed/simple;
	bh=0RYP5tGXmteGVu75C4xhg48k7O25iKbnsjP+1cbqIGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y5T5J3QUVNsNBRR1JZC6Pr4gsVWzUjkw9FiCX3sXcb6xFyImK93Bjp1Ub1SLaQffWbI1/xChe+PciOQENZX9S2A6TBzzWpfkFPgv1J8cznP2FMwkrFrULAUhzo3GnlfhHtrBJGg01Q70cWNdRPtCKrpMw1vf26YuEXuzUQx362k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDldZZ6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLSxm7VY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDldZZ6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLSxm7VY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWCu3817386
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LcFcJr+xRZrGG5By5yidwVkvdyuwtRgBg6F
	5dB8HRLU=; b=TDldZZ6yArWvr2mcVTrU8rKyk7vuBNvRG1txSVMTKQHQJXEmjNz
	xOX1wwx1qxLrRriCWQC0XkqCwGNsKHyg/+uD9fTbno3ksgoL3ArzmLOQea2s0Gci
	g6G1bLNeuX7HqQzyiHTFQDftNpVQtmir4ixbCdFlHpUHnujfbS9XcMOszFTW1/PL
	yg2HeBYyKJnVStyFpoMXhciuiPy6C/Psut0ekjva1Xyc+rHf4qTHKhKDbrevLIY6
	wk9ZPpjkKfSzTmsWzKFBznbwIv91eyyfRm0mYV6nlVbB4orwHeQ5apevPfrReW6W
	oW99j0VAQ9P9mpCC0M1Be+ddK/+O54Kk8gg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w234q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:38:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090bc4823cso167353471cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305535; x=1774910335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcFcJr+xRZrGG5By5yidwVkvdyuwtRgBg6F5dB8HRLU=;
        b=aLSxm7VYG7cqU0fXJFdmVFyE14dUtmj1OloKtC7innIq4Ry9I+b9FL1CKZhH+mK0TK
         ENBuicBZYocY68as8Q1HjneOKDYXeE2I6/tzqXiXjZ8DCjGblJaJdVsRXxIyHlmmU0em
         6gP2sPT5F1aWJrxUxXLkXu8BB3L6KyO6MRwYJ7zpAT6Yb6mLMRI+xope07sHugdMng6r
         bvyU9M2014jL1EQiCBlLIO5G7ly+xTYdclCMsc4byeAW/Pcb8XIDR0GEkBZE8f3uFeZw
         UP0ggN68edK3IeLrvQ9u8OaJNKWTwFas4crUvMsDlojEVyNyUpV4qsqQpbUYObxYHinh
         ew2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305535; x=1774910335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcFcJr+xRZrGG5By5yidwVkvdyuwtRgBg6F5dB8HRLU=;
        b=ps5cqD/Z2liCKG8gz8CO8S+rbURnTQccMLDKft/72EA5u5x5SfU9mRSnw6tu8sYUqQ
         SrG4NvuoKnRSZ821m6uvaTVOk+iLxP5LKsGm6rvVC/5s+4wVO/RbUAsbFcgTbElBxfAX
         c+avJ/eyeHxNQx5keA9yeapU3ePQLsU2+WU6+MJfM5N+omASIWjEPmoNHLqnWlEoUthS
         F3oEkJgU68FJDvFvPpm/fwnpUQQK03TT6JRXXu4ay442dF7ZeWgW9P9nbDIMGr+e8DIW
         kG1Ay4s628aqYc9Ax8wCkDnA+1NfVBdUDBK7zhyS0/I7v5z2PDDoAU+eyQ5Swqaqro9m
         PohA==
X-Forwarded-Encrypted: i=1; AJvYcCVALFyEGZfB5/U6W27TlI605YTjBHSqJlnwtkJgTCaihzLpyXuww3VgGnbuyfisy9NkeHkKhASzhfAY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzq+FS0J9s46JWiWqr5jgXby0Pseaz0PnzKT0fkz3ojv41UmSx
	LXiS42MHtVt7gdmNrZFk5GitT4baK4TstlxQcZp9cgKs7KlI5VUVVcJvIey6Vh8rvEKtav5iGD9
	U7WEDj1sycywgf/+PgQw2dNGqC7qr+8RPF9TF7YZqa7EUChnqsNstuRGaHRN13Zwv
X-Gm-Gg: ATEYQzywTVdkTbjz3QuYXfeleZQhulsCumH1vQ16k82ukF+AwNckCg0dHok5yVrglvd
	ALFyH8bD04zRJRfiVbAaF2UavnLAWOHwfimyWIEHT1XRYd3Vv/dVrL8SPfkG4jhnK8fB0C3ucPy
	F2/J9RZZWg18SpBcMaUuhz+5YgwkG2PvvgwG8DFR3p9wkq8CZ9Sjg+DRE4a3NtDaCG70o634eia
	iHU4j2EkMyCRYO0TDhcXpodFRbOlyaajPZdFjlcXS1CMvKw7gxlKFlgyv8TGQbtDJU9PMUNxgdR
	mh7qhDWjyWBuNllFE8xHHylIqKvdGwGnYItrAkuwT9Ey3H+uzupYReiVpon3YNbbG/26ottSVUJ
	rxNEsrw2hB9Z5TadjpkHANHW3gBq2MOnlgp8OGx5zDLqTyo+VJxtW9s0=
X-Received: by 2002:a05:622a:424b:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-50b374653afmr196623331cf.25.1774305534857;
        Mon, 23 Mar 2026 15:38:54 -0700 (PDT)
X-Received: by 2002:a05:622a:424b:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-50b374653afmr196623121cf.25.1774305534413;
        Mon, 23 Mar 2026 15:38:54 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:38:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 00/13] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Mon, 23 Mar 2026 22:38:32 +0000
Message-ID: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1c0ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=x8kTagw7d3iPfLn8lj8A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: fds7yMiclNxNKwoWi__S43WQ7gexjhhZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX0zvuk3+tJCF+
 sqdTDhweZ7sEcPn8OlykU+DiI6BpgBxsj4ps9ZvT2kY99FrGN+3K03zPOebGhXx+mEwUdy+Pd0m
 SBqb4g3DAT3/bALoLNJLFHeStRZ2gTH5HSSNOHtYV+7YgooC8JZOUdktbnIGuCMBBg4R2PWz8gY
 sruBwxt9sm+d//yAtLXXhxXftvOKLuLOP1DA+nZZXy31ifMa4bfB/tJWZiwJ/O15GvaA3TAzKor
 RUgDBjuJjYXwjSzJNRxNB88dWXyNgo4gP8pnkMiadcf0QzARAVPmP+Azw7QuoSZd5IrDwQ5ZSSV
 3BV926tX74PFzrVr+iRcepPtJVJYthJlFd5T5xDbucm1K0TWwXKipj87D42OaXs/pnWE5RXqZp4
 Mj74KaPowH8hREVsdvP9jdwHyNO0wQhN/nnyS74PEoopQZsu+76FdDnGMQDEQLx7vVGl/2GnxKT
 uQD8ndyfRtpj7V2yHpw==
X-Proofpoint-GUID: fds7yMiclNxNKwoWi__S43WQ7gexjhhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

This patchset contains few fixes for the bugs hit during testing with
Monza EVK platform
- around array out of bounds access on dai ids which keep extending but
  the drivers seems to have hardcoded some numbers, fix this and clean
the mess up
- fix few issues discovered while trying to shut down dsp.
- flooding rpmsg with write requests due to not resetting queue pointer,
  fix this resetting the pointer in trigger stop.
- possible multiple graph opens which can result in open failures.

Apart from this few new enhancements to the dsp side
- add new LPI MI2S and senary dai entries
- handle pipewire and Displayport issues by moving graph start to
  trigger level, which should fix outstanding pipewire and DP issues on
Qualcomm SoCs.
- remove some unnessary loops in hot path
- support early memory map on DSP.

Tested this on top of linux-next on VENTUNO-Q platform.

Thanks,
Srini

Changes since v6:
	- improve error handing and add a missing assignment.

Changes since v5:
	- moved to using pcm_new/_free as rebased with linux-next
	- fixed typo in q6apm_dai_pcm_free
	- added changes from Val to q6afe_port_get_from_id
Changes since v4:
	- sob order changed for co-dev patch.
	- update range check in common.c

Changes since v3:
	- squashed 2 dt-bindings patches as suggested at review
	- updated yaml to reflect the new port supported

Changes since v2:
	- removed non-dt header update in bindings patch.
	- removed some leftover debug statements
	- updated function to void where it did not make sense to
	  return anything.

Changes since v1:
	- removed LPASS MAX PORT define from bindings
	- added few fixes found while testing dsp shutdown usecase on
	  Monaco.
	- replaced tab with space
	- added port range check in place at runtime to catch array out
	  of bounds in future.

Mohammad Rafi Shaik (1):
  ASoC: qcom: q6dsp: Add Senary MI2S audio interface support

Srinivas Kandagatla (12):
  ASoC: qcom: q6apm: move component registration to unmanaged version
  ASoC: qcom: q6apm: remove child devices when apm is removed
  ASoC: qcom: qdsp6: topology: check widget type before accessing data
  ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
  ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
  ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
  ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
  ASoC: qcom: common: validate cpu dai id during parsing
  ASoC: qcom: qdapm-lpass-dai: correct the error message
  ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
  ASoC: qcom: qdsp6: remove search for module iid in hot path
  ASoC: qcom: q6apm: Add support for early buffer mapping on DSP

 .../sound/qcom,q6dsp-lpass-ports.yaml         |   5 +-
 .../sound/qcom,q6dsp-lpass-ports.h            |  12 ++
 sound/soc/qcom/common.c                       |   6 +
 sound/soc/qcom/common.h                       |   3 +
 sound/soc/qcom/lpass.h                        |   3 +-
 sound/soc/qcom/qdsp6/audioreach.c             |  60 ------
 sound/soc/qcom/qdsp6/audioreach.h             |   5 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |   6 +
 sound/soc/qcom/qdsp6/q6afe.c                  |   8 +
 sound/soc/qcom/qdsp6/q6afe.h                  |   3 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 116 +++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  48 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 184 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  20 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 ++++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 16 files changed, 395 insertions(+), 168 deletions(-)

-- 
2.47.3

