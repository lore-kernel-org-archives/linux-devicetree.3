Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86123A16BF
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858900; cv=none; b=TS/UuVij0qdE0ONLul9YzUz63rqNj/pQvn4fajLsnkimzunZ9NZroVVnUg95cLI9wlutS4CEeqL2wIQ05ab4RP0J93VLoamy0Tsfvi5YQAPe8TmNK3ZxxLtLiBm7m7QSTFz/sU+FvxC7y40NLDV+btocAbLngVTdVRVdoPHSxrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858900; c=relaxed/simple;
	bh=Idm/a5pMF13JpilqpTpVqs3n9rCPGPulv39LpLdv+t0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8orRlCqMkZC3h5VvwFmpYvHinhnXkmhq2AsSYyfsbwucWwRY5Ef2QaOW12SSzFS3UC+OI6NK0JO1xVgtW5+4gyge0OxMdPu7LX2XYm3YcAiUdkPIM4xzh08vzx68qonndPaUexesnhw32IPBmXh3mw8lxWXoQ8vHXPA5h4MLMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbNoj7RI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4HCocTF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbNoj7RI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4HCocTF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4csdj4086214
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZtZCql7HubKX15Dpgrgxu8xamsLFJt3rlkj
	J8ur6d8M=; b=EbNoj7RIqxEuVb5xfm8wuYAGeEU5yShGVewC025mm61KtoqqZjz
	3P91gaJCgc48VrAsayFHUZDiukzP6NKVk8NmzXXGQncpAfQ2+IvjY1G9GaZueUtL
	YxFQT9pnTaJmUcqCYJgVLynWZZDGe75VTi1cNNDP30x3MtP0c7c6NyoYOxr4L2uo
	WwVMJl5OUXSwQIxa38Pb9VcKbHTJyIJg1nLo/lLNWKSCrPkhiZOp9r8lFE9oWJsf
	fRhTYJVA0NDHny3413diGRUgr89nGVvSJLzmLMvSegewCZyXYWDOSJv4I0ySoZYY
	9lxVPil07sNqHNfCzzwtCUa1blB5Kz/Rm8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d677155w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so122501071cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858896; x=1775463696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtZCql7HubKX15Dpgrgxu8xamsLFJt3rlkjJ8ur6d8M=;
        b=f4HCocTFvlfjof8gTPWm57Y9EdHhQEJyQFfPkzdwO/T5MUb7ufbuXFERiZQ2NdB9jg
         n1yFLoaBjQRqVvG+lWK+JwkQbOL/Z7yWimRiW6O4fSwCa+qthGCMKmJWzUIMXglPLciv
         ji1kb/Rid22cMR8kcp6ICTNnSZVN0b9hgb8ITPURMQk4zByRmXzlqJJSV2/VayNSw+NZ
         QR40lSTWi0uV7EQq7I2EnbwEdRQSuHSczeDc7QxSqwOkrq0pLyOa4f51mTCBf8oyZwWi
         KvsThNmRwE8LQfIMsOjLZKmkxVKCc7fp273gZHIbGpvnUvcwWsd0ISXGV3YyokPzaBuV
         jdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858896; x=1775463696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtZCql7HubKX15Dpgrgxu8xamsLFJt3rlkjJ8ur6d8M=;
        b=Jg0bx4cS/zZ4IsA/o98fJsg/FXpPjuEgFF7qNFqC08qD7CEVgIFtrBPYtLqDKEV9Gq
         r7wgYcZMealW7IHKvl1kpFMAmj2MBCXYiaI0hyAP1dTizv9xOPNwfOhlFBF1tIf6m0SL
         HYYgTHj2iszeT3JRintc7UUVoj1rpRuB9Jkf7uL6jUyVM93sLudxbstF978Kcht9C3IM
         hzF+TmyMtaKaaEiCpqm5JUCJNktkJXSjdW3k2hntQBjuLYQZgCfmx/u5IfyRqOod3o5X
         jvW8UAh6mAKZaZCbpSR6klVJnSHchoIBG8YRjTzBxFI51+awvLXraRsvFmLffkwhPwe3
         9U3g==
X-Forwarded-Encrypted: i=1; AJvYcCWJeF6gHZRu3jhokjUEsUTvlKPE8wgdwUNvULZ37L3fdwHN6Bx3NKT0kc4HyX/DlUiChSAhT4lidam6@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ8tNokleV1IHMpq1ZXKnI/blw+48bGJjCrY0n4FJRDuhRR+Ry
	tbU0QOfk/fIAugSy7aE9qe7pI1jAQFz0kMYz5zrf0au3s4sclkK01KCQNHHnt25y50KAQ84zfE2
	8mShRG0o8db9UM655qJojbogB7hIqVyUtzkLWD1VB0gWK9PB8SQmFRngKe6tL6dig
X-Gm-Gg: ATEYQzyedUhvVGSLp/NaKApm2uvY9kSST7gz19bylQOXVz6qPXleIA23e+esJuThf9c
	djY6VM5uu7Hjfkt4n64N2Hmcul3Ra2Pt5KaeklKAVOhcrd40VzfPdoIEXH1kojRmIk6lXUmrhAA
	gy/Z2x6nqlHdiPNIvAnkUzbEB35y04v4ZWZdE5IdkLpTAqjC+D73XuXui4Qqz6V6sAqmbiOJ/Uv
	J/rlkNFGrPgnWPXFBEoQr32cT7NjCvsJBrRIj+EA8VcowsR11Kgbc2NFJgKzJrguoh2Z1iYKGZA
	GiYWL37uHEJ875TYny2V7Wx9aPpMQ6fxcgi3RdpmBMV3u4cP7sCt/Jyy9tZE/ksBNxJ7JaqTaDn
	v5ncI6ExQEvLB2lE+H5hx/wRX2AWZcolkA18cinKJjsz9/nVJcEW51O8=
X-Received: by 2002:a05:622a:2d6:b0:509:473e:2a12 with SMTP id d75a77b69052e-50ba394caf4mr166133231cf.48.1774858896061;
        Mon, 30 Mar 2026 01:21:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2d6:b0:509:473e:2a12 with SMTP id d75a77b69052e-50ba394caf4mr166132911cf.48.1774858895484;
        Mon, 30 Mar 2026 01:21:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:34 -0700 (PDT)
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
Subject: [PATCH v8 00/13] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Mon, 30 Mar 2026 08:20:52 +0000
Message-ID: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yd0lP_wCsFQvYp5N3vhK7-cpLdW5TfIb
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca3291 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=x8kTagw7d3iPfLn8lj8A:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: yd0lP_wCsFQvYp5N3vhK7-cpLdW5TfIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX8hr6ls0tr2Ys
 T1LFqE4chBBb81taS15bcbM3tlomqzZ04lTJ5jpEXBnf2yXU8UWoerIrJKJIBph4D+xbBfqeo4S
 seaz/vQdmBgRtDWxOrcqvA7RejggY834hYZPmVqZ5jOqaPV6RKC+wQBN8dDgH+eWQdyDw5nPjzF
 ZsfXMUWIbVwWlO7tHcGzcqUqx+Qq5Zx0V2cmdwTcgAOVvkTetxaT6Go2mpLr8EQx2wzuOE9wIQ0
 NWqZ5yOWnl45B82E1N5OHBG0D8O9fMGbd6ewX91ZP7ARrUYFetE3du6g8DCsZiLOTPV0ifg/RPl
 a1YcY1N/WKNoJ7F70Pgd8/+mBZSSIzStfX1cmmywG1+0ONtgLSF9odZxkiZ9SCIoSglVVx45y+7
 ouJy5JAq0BP618co5unTUlYO3qzfrzYxvOvovwgRMvn2IEqvqQ/HLGhojO0ONB+4i7RqlHntu+K
 kZfaOcxgsBTApmQk6hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300065

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

Changes since v7:
	- improve error handling
	- remove unused variable.
	- add comments about bi-directional dais
	- in q6apm use of_platform_depopulate instead of devm variant to
	  make sure that devices are removed before component is
unregistered 

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
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 113 +++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  48 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 182 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  20 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 ++++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 16 files changed, 390 insertions(+), 168 deletions(-)

-- 
2.47.3

