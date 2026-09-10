Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5566A3F107A
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033647; cv=none; b=kyYK4pFuGAh5LadJ+1AKlRqzxEf+SmFtrSAJHJd4T+prjdru9PMfK3ZuIvw9+ZjmDvf60eThgpsJIAMOARTdTHxN8C5DZvg/c3v8lu3MzEvcoEmhNXn5u++W26K8BJ6Aa3O22lGK94iCXjpQ80HMbpcv6ZJgLE97uMMtqBZE4vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033647; c=relaxed/simple;
	bh=ivDNcWUQj3GpT8TOs6vZnVozhXqivLXnPJ4KpDq0gL4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y4y2st6qIVNZmloksqHdysxexHKs1831JLbfXxnHjY0+X2POQN/WbdxukCp9t4gkynuDHPT7JNUpcvk1fY9WsVbi5UmPhRGM7sCQm9lPjFn3r5cVZ/192tsfFczr2+KEV6qkgE15SA+2Ob0W787vvEfIOVHUJC+bJ/6pOWxth1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdZUq5NX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EK7Pj8ym; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdZUq5NX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EK7Pj8ym"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q6HC4136853
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JwTb6aJu2sX1HP2RLSab7t
	IahqPqWFuWrN/etTrV6Nc=; b=EdZUq5NXsVYEAQOYW1pvJCiIQyYOw7W3Ub7xLu
	fcWAQltW4VwjjxYmsxiNRKpIx5LIsLxXdKrbt6AFUEll3P55EaKxiGnRnNY/Cf1T
	06pVGpBol5LvDJ7GqM/AEduVe9PjoIk7Y3LyCXbyKdXmdrB806uas6tJRQbfzfuy
	4ig5r33OnqUkMF5RnVE9KYKz/4mJFJuZFWWGl6WAzIhkQTjnK2O6L7y1H9uuPLQg
	2+yLFxBdadb7rWorJ3FpP4QRc+He2fg9dzgIMMKOL2suPJspllc8SMAUhz1XllD5
	nvfIuijPSClAD2aHBR4EgKz8UYy5cJfZrDsLoOFyn/ApxhKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydu65r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:47:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so14223902a91.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033640; x=1789638440; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JwTb6aJu2sX1HP2RLSab7tIahqPqWFuWrN/etTrV6Nc=;
        b=EK7Pj8ymATkVHPumIfffimlShhFWHW3DI/kVTJaSBUbadqDPbV2b+XSNkMYFS6YO33
         D29piqFSIjBXUpZloxYDSuZrTQQiQu479v4TrOuotZdaoy8kwnp9tAEp6THTXIBhLmNf
         i6yYoNiGsUlu1TNs4kwX9eYvxfLcUv3+CCsbYC7uITDtdOK4wlIlv9gg6bIn36fQfnYW
         5fqkpEElQAD8eHJEsWk1oCKMyWGvmkxvKWeQ7GfzA/7QYFPoWcrXEPgtB99/m/q42Cl4
         P1FQ/V/ZDNb1CkbBxrdxhy19LbVYoJdLWrl5rTjwqNbRaRJEL03HwcLv0Egnwe0miHUY
         q12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033640; x=1789638440;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JwTb6aJu2sX1HP2RLSab7tIahqPqWFuWrN/etTrV6Nc=;
        b=D4xvYi7CRJP9gyl6055TamLaMfKR73gnSvakRoqDlYAjcc03lbofmlIf76r0jJEiTU
         Y+gHiJpa/LWWTPaG9Dt24OvEnbXswp+HI+ZJ/fahhfuODkx5e61oAMHlF1xLkkg+eOXW
         qZgJvQr804nOW3WukkyI6nPXyGeSZgUoYQ78ZOwC+YYwHNlRmZ9gOd0o3i0Duz9g5Zld
         5l7O6a+8VTyFcJfMPL9XlWKgFuBT1Jcv0Y2TMrKnaQV63VCrGsCkSoKH6fm48wj9KmL7
         NKOb/u0h1OcLqxzQq/XIdY3Z/Jis5Vvotnn0NW1h8LreUD6w1VHB1nwco1C5QKNCGlo1
         touw==
X-Forwarded-Encrypted: i=1; AKwUvBzNlgcU6SIDMBTyXimA/Rb0ESp7voadORXT3LnBpc4IS6MFVL5bFK4wuWfwzxWyg3npiN9xEWXVS+J2@vger.kernel.org
X-Gm-Message-State: AFuF++ljtWvDisj2XKu34TkjagOnEFTuXzaV1kLUeTuDcKVNPO0QwuMy
	MIBZ+lP31vD2LdQcuPNUyVyqPKlNW8YPEx+v5d5oijhfZ3ErzeeyxUuVXJsxo5IUcBncJYtshEU
	eB0EHVqcWPrObQ53g2vXMz5fWE5wrciZ5aiX+Mk6UJUqMhq8hMtAiYss0qZR+VieR
X-Gm-Gg: AYBFou38SbGPGQUwqxkR4yNTzF0rq38qFJcrVKXFkRWe/6ATP68Fvy7tK6fqw6yBYgK
	2b3H5B1CWHVszV2p8Aa2N6ouib8rgcy3u/u7bhbfL0PZzB/baXgUPheuirp0WkBQnsgr/gV3wjV
	TiKLHEZ2CpY/eBKORAgB1BsDiQri624xwK1/KS2PP4e/p/T5NzFqqlbWO84oM7xSXQJER+ezU0P
	WlWINB0kJxfbcm4ZyokYYMMH0sIMzdi99WEOpIfjaFe9TOJtJnHSaXq+2T6UxrXPwDMDtlk6/nq
	wXK6uuVJxtw5f9emQ1w6nZkaW8G4FOaktgSjGbfm1hLR+4f//gg28p7w5nIz6aG4JkUaCRjscvZ
	ttac3PZ7ZYlexqSmUlft+jnh9h7ZKxEwTuZDo
X-Received: by 2002:a17:90b:440e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-39b261e1011mr56961688a91.13.1789033640509;
        Thu, 10 Sep 2026 02:47:20 -0700 (PDT)
X-Received: by 2002:a17:90b:440e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-39b261e1011mr56961621a91.13.1789033640020;
        Thu, 10 Sep 2026 02:47:20 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:19 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/6] ASoC: qcom: Add shikra LPASS RX/VA macro support
Date: Thu, 10 Sep 2026 15:16:51 +0530
Message-Id: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIt8omoC/yWNTQ6CMBCFr2K6tg2MoYIr72EIKbTYEUuxA0RDu
 LsFNi/vS97PwsgENMRup4UFMyOh7yPA+cQaq/qn4agjM0hAJkWacKV1RRa7oCqahsGHkdetyUD
 qHGQBLBaHYFr87qOP8mCa6pdpxm1pS1ik0Yff/jqnW+44kEmeXqO7CChkBgXwlDtvlXNKi6BaF
 GQVdndPJD6TejfeORGFleu6/gHSv0JRzAAAAA==
X-Change-ID: 20260910-add_shikra_support-bfe526d82692
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=2446;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ivDNcWUQj3GpT8TOs6vZnVozhXqivLXnPJ4KpDq0gL4=;
 b=wPM/kBg1ZQuV5a2m9RMvVAFSuNDSpnR31qwJt5Gqgb4umUWOl4R0kken2xJJ2CSgUdaVh37+n
 4GywW29KbKADTjrqTXwq8Sz2yoS0Z7wImWJ9wcEvogAfeWPVMXQI7VJ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa27ca9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=fDprqlrTxk3r_JbkCJQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: si6pa10iIRh03qKjliC9EmwFP-CbIFao
X-Proofpoint-ORIG-GUID: si6pa10iIRh03qKjliC9EmwFP-CbIFao
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfXyGnvnsnd43pC
 fMoflR72QK4vLXYWEB8MMgh5q6nq81d51o7k7jfab0VsD0CeKtNlsUrMtcTnyC6GW8bEIJK1OyJ
 cJytKcRIjt8RNg2doXDqm0aCEnFvYkg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX5ZSdJEXNftyW
 xJnj2e5fOupLZpDn1kToc8oMQjUtpYuVG/kVNogAg71PjpdNDAewO2VbEsTrPArZ/WAuZ1UOcl7
 PyRmKVY2TuU2v2K9B1jSJGvqB3Vl6nTwZ8F8wJzlYnH4i7OTpxlcVzWaepZerwDgHa+XFCTR7Nx
 DWQbyfMT921B6tEgqIgJQTKVGg+BpE/Y/73cCVHfMe+5pidaJ4xPlYpuCEKkY3snUX1/iLJJPkz
 ybHM3httfjCIMXNq8o7x0Dwf3Hkxi1om6g3XPGKV7XRx1tCq2vsflDTfT71vbDobIQDxoZWKZ0f
 NkBjwSh8+IYRdJT0KSGeLSsKjgbuKg+rrklYD8y8JOJcBqrlpJAxJZFxGcD+SQJnhJJ/RHkdmq7
 zfdRb4e6rf+OLfexMlPIreY0SCQspjRZHoTjeX4F30ZNkficTDF3gqAktVF40nmKWgOoImJAWti
 jgGW2YVsI+/izZ12j3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100111

This series adds support for the Qualcomm Shikra audio platform and
extends VA macro functionality to support SoundWire microphone inputs.

The first part of the series introduces new DT bindings and driver
updates required for LPASS codec version 4.1 used on Shikra, including
RX and VA macro support, version detection enhancements, and associated
register programming changes.

The final patch adds support for routing VA decimators from SoundWire
microphone (SMIC) inputs in addition to existing DMIC sources, allowing
audio capture through SoundWire-connected microphones.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v2:
- Updated FS CONTROL and ADPT only for version 4.1, as suggested by Krzysztof.
- Addressed Konrad's review comments from v1 by replacing magic numbers and
  lower hex reg values where appropriate.
- Link to v1: https://patch.msgid.link/20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (6):
      ASoC: dt-bindings: qcom: Add Shikra RX and VA macro compatibles
      ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
      ASoC: qcom: lpass-macro-common: Add LPASS codec version 4.1
      ASoC: qcom: lpass-rx-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add SoundWire microphone mux support

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |   1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |   1 +
 sound/soc/codecs/lpass-macro-common.h              |   5 +
 sound/soc/codecs/lpass-rx-macro.c                  |  17 +
 sound/soc/codecs/lpass-va-macro.c                  | 352 +++++++++++++++++++--
 5 files changed, 358 insertions(+), 18 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-add_shikra_support-bfe526d82692

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

