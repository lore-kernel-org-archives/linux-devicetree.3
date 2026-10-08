Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F63C437858
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457626; cv=none; b=o+tJOrFJkyd7buk/cfuYp8OrGlTnzYHAZZ5nTx2nH1qacnB5yBUYyNUYLP7tU4qDOz/PUD43d7Zcx49/jD4k/6FPxPKRKrE8e9cK5TIOw4H2QenSdoOqkXys9hkb+P/ZA0yHWLL0vNTdExEwsBW6IGJio7Po/lpfyISCcKoyTrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457626; c=relaxed/simple;
	bh=xdBLu/dF/VtB6FCd3OmfYa8cw0rUhB0yCCK3sagvg2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VMl2cgoapJjNLAnkpzVAX47g8Ooe95mXyu/c9Md6/yirQun7QLJ1gsm3Su4ce6lHVlmALf308rjOuS4MtE0AXwhM31wHzSUSOvJtX/F1aMjz4nao+vQaB7pl1sBh7iu68GcZbQ4y1ZKbi8fVrOp0+ZS7C8hG0YDxuYkU+Mmb6qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEnZ3Pw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvUGS3L7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEnZ3Pw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvUGS3L7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbMEV3129069
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 11:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1jmbak74wwhsWVJ1bGvwed
	tZgks+QQKxqXz4zo5Qy9k=; b=BEnZ3Pw7HwpJ6GFhHU9PMmtDriJp+lrT0LBh2a
	K3qBKxELoYstvWIFxSFsO0kHiblZsLr2IdMon7OI2uJhuXb2zAv6bC614UyFbssW
	AQ71RZIeOEGE6N7ItOrSsOWf4pRA1r9pvCJYsZKGlFFTZmiTaFhoQoUX5Gx8+6CI
	JHh6+MA1cDZ08DcxUQks1F6BJeuZTnlzCqWJneAfdrzHiqxSV0VZV2hV65bsGrS+
	0Lh3O8nIuVmPU4rLJt34OLTpvN9xYJfuAQWX7RywaHlj2lBjFY5BsWe0cVtUoysQ
	gCwvDESFvLJFuOLuZeucbTteKB68uXdDtl66tOshhy8DznmA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe42m6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 11:07:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88f2b158139so3608310b3a.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 04:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457622; x=1792062422; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1jmbak74wwhsWVJ1bGvwedtZgks+QQKxqXz4zo5Qy9k=;
        b=jvUGS3L7AEtHsSnjttaCs4TleQDqoPTx/BlUXv0OO2RYmxzCc6PruVnB9QIgR9L/cH
         nhr0jSkTdNsVZXEjEmQY0CZxfVfBd2t20gvkkwzpEeeEDBaOwDhsuJlkkpsJ4H8kLThl
         jfyrjZYicSgMR3MrICFhloIIKwKFQSpSKCLpJDy56+JwkyYjUEH57ch07hKhlAR7fG9P
         0VZg+IUD1NpgMn07j2oKeU1eGKzWmo6FanGXgq6PXdsIGDrJHbzSIrTQBk/vQCSdQeeT
         E6NLPTgj7xNWgyqwL5zDpiSI80+pkzvEN08fSCFpbPujyjY/LCJITdazmsUWVPAi/OPD
         /Hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457622; x=1792062422;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jmbak74wwhsWVJ1bGvwedtZgks+QQKxqXz4zo5Qy9k=;
        b=DeUOfU53Wh37P5e5D2NbE6sK9TgjewWMxhrySX0jkLcTb3RLH1DZ8OYcx5pbbCbs/2
         zGnA4dG3fkuANXd/nBJDV03XGX/IWT+hUKCZR6hPK2+XTgx8q5lOwMUhveWmWNTN8YEF
         G+EpnIMBW0j5tKOFgORiukCOzqlotHhmJXuKWE7sLDBN0OPQ9mvgogOy5dSiUnnNHVsW
         Ffze0T+JC+njR54cW/CwWU5e/luJBIjOznGpSh9WF7Y7cTidUjo7vjcb8AkfMkgBQf0u
         uVCMuPHuQXo/uX5TQFzVgtgMSuFT9tuCKhZPhGLV0T6lkqXkQn2d701zKBR678BChTnB
         up1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGl9TTk/S7NEWKIDJVb3749bC8savwLCrEQlEoBziHkcgibw9syiyzl9cpAevyCkcmUBBgrCN4rNkR@vger.kernel.org
X-Gm-Message-State: AFq9FYIT5TLU3vAd+rUvO0Vk3knYl4cw+Z1ade56kvSf6HxHKMl5yxHS
	lWFTbNDzSfF8XBrNzZZkFYV67LNgBGVqojxKMyQMR1ASZpVTLU7pGXuiLx+pz8xYqCsIfXfNFDk
	mLnijxKWHSbd1UxITGYrSIkZtiEbUOl2+kOPKMd/7Uc/I9wgpN18uAKF3Fzp4rZeCCgSCVfPa
X-Gm-Gg: AYBFou2ZfBg9C0Z01OHM0nklpMtN9/ok0+az6mnwaNFSvT00DFFCmtAPTvRht97CjtQ
	3cVDc4WeHfDbgXpbvqdWXQL89Dyrst6AyPvmRIfyTAydLs7WFyytrhLW2HDO8YFJBGWWwaN9qr/
	48cGTuCa5OGjf0Bw4bvdGEdo8MG5UVlNgkR2ZKQ9Di+buUpV5jyF7aVW+HiBsQ/vwOiLWwv4RHV
	WWB4+bEI0V2v2C7mHBRrmcYmEOHtwLMDDMc+4MA4ZjcRTDXuA65WgutYRIaQVMcrEJMWnO7fxNr
	/Dmti0z+FqzHLiMO0kIbtfux/vPO6+lO/hkRUU8MEiawMa65+ZqMqIgn2DZH9PS2lwpZ5LPmZ/q
	qrJNzWIodCrndELlTBrXfLN5NC6c5KuN2yDkR
X-Received: by 2002:a05:6a00:800c:b0:878:3705:2515 with SMTP id d2e1a72fcca58-891b52d0c58mr4803533b3a.53.1791457622082;
        Thu, 08 Oct 2026 04:07:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:800c:b0:878:3705:2515 with SMTP id d2e1a72fcca58-891b52d0c58mr4803508b3a.53.1791457621602;
        Thu, 08 Oct 2026 04:07:01 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:01 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/5] ASoC: qcom: Add Nord audio support
Date: Thu, 08 Oct 2026 16:36:40 +0530
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEB5x2oC/32NwQ6CMBAFf4X07JK2CBVO/ofhAG2RGqG4C42G8
 O8WvHt5ySQvMysji84Sq5KVoQ2OnB8jyFPCdN+MdwvORGaSy0JwfoHRo4GGvAaDLlgEWqbJ4wx
 BguiKXOdKZUorFg0T2s69D/ut/jEt7cPqeVfuj97R7PFz5IPYf0eJl1z9KQngUJbKZK3kujtnV
 0+Uvpbmqf0wpHFYvW3bF/CPxYTcAAAA
X-Change-ID: 20261008-nord-asoc-driver-support-v2-1f65c57737c7
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=2632;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=xdBLu/dF/VtB6FCd3OmfYa8cw0rUhB0yCCK3sagvg2I=;
 b=yRpjsV89I9rCeNu3PzG1nUxO06xxUIME4kFPJD+i6qt6XQxQ6tAVfceGWO6a1VDjdgUHegN1v
 ZDD4D9VB7hIAjiRFD0u1gWZhD5iKSpKdG9SAMyViWeoUN2RVbh+dAnJ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: g03ojAPonOUXKQU7cKqnzzuFVwJcilcW
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac77957 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=3s0VHmhASnHXix99wlEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX7DJXbrkVGJWw
 bRg/KIWA/HWHnVSRiSV2gesIFZuYlVx+0ffkWIWo28pohdXNXJHLskbJ/BdwQ+vCFkNDs76pFHE
 1PUW9TBsiXICw30I6NA/ANmmdojLmtI=
X-Proofpoint-ORIG-GUID: g03ojAPonOUXKQU7cKqnzzuFVwJcilcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX+ezEj3ydWjR7
 HTi+4Hvo5q7kfWOecTRHT/b/A9ZrroayMIS/B13TDZP9HOnGETMCceGGWaZ4g8zp4u+It15nGQG
 xj3t0pWOAW8acbuF9+nyADjFGEBl7BjBEfEHj4ztQrYxtyJKktLilANPnYq4EBVh2KhVlUX3MAs
 3px+C5uBmx02jAq9/nMIWm/tpq6zKq/Q3b7k3+eSkfCkIgrrqycuU9VWL+WA0PkaPwVYtDRtQRo
 hTDlft1bgXCgso5LV4VMZj3//9tiJhIsmvnogbsAekjN+Lea1D2RX1TvYoaWVjY+Sww3WSevkaj
 Q9wVqiU977NLx9lju389Y0I5x6TQkJpPJEoscm6uYfvCHL3tVJhk0/ZOp/a4OF6zDVqAc8zbPLF
 /xQQGhQSqS1ETJkoaiWLKcuB7q7RXeMd1426UdepVdclZD3XZSOTbfjsHtStb9aLABXQXmINtv+
 KHHSRtGrYJwLBYOl0Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

This series adds audio support for the Qualcomm Nord Ride and
RRD boards and includes the required machine driver, device tree
binding updates, and codec improvements needed for the board's
external audio codec configuration.

Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
Compared to other SC8280XP based platforms, Nord Ride requires
board-specific DAI format and codec clock configuration to support
the external PCM1681 DAC and ADAU1979 ADC.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v2:
- Dropped patch 1 from v1, as the ADAU1979 codec change has already been applied.
- Moved the compatible string from the board-specific file to the SoC file, as suggested by Shawn.
- Added runtime PM support to the PCM1681 codec to manage the SCK clock sequence.
- Added TDM support to the PCM1681 codec.
- Added the required POR delay to the PCM1681 codec, as suggested by Mark Brown.
- Replaced LPASS DAI IDs with QAIF DAI IDs.
- Link to v1: https://patch.msgid.link/20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com

To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Srinivas Kandagatla <srini@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: ti,pcm1681: Document the optional SCK clock
      ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support
      ASoC: codec: pcm1681: Add TDM support
      ASoC: dt-bindings: qcom,sm8250: Add Nord sound card
      ASoC: qcom: sc8280xp: Add Nord sound card support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../devicetree/bindings/sound/ti,pcm1681.yaml      |   7 +
 sound/soc/codecs/pcm1681.c                         | 145 +++++++++++++++++++--
 sound/soc/qcom/sc8280xp.c                          |  51 ++++++++
 4 files changed, 196 insertions(+), 8 deletions(-)
---
base-commit: 1a2dfbb6c043580c3a44dc7f0b91497a4cc668a3
change-id: 20261008-nord-asoc-driver-support-v2-1f65c57737c7

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

