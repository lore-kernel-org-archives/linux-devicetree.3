Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADDB340413
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022180; cv=none; b=MFBmjpn67I3SrhDfCXtYQy996HPlkJxEP9eGOl8/kcGQFbYwkhg184HuD47b0yJ7r+ocWa/g7paWMp0DezaE+qY56PbN30rgUPhCAq93QI6pi/wbOaT2pZHJi4EAseYHbww7IFpulCyEoYjpIk/vvpscwsh+xauP6mcmBAXSrg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022180; c=relaxed/simple;
	bh=U3gede9JtGGD2FQ6a1L00yb4hwp21BcFfokptR3zW7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jdPU9qKom8b7UlwsgCMDu/YSy8N37ITWjzvUvKPoat58jxeTTUV1vRMa5bctsJiwTd/z0opHUn52ywNolxrXYIXZDY+diRY52Uf13kckwSJTEcG6mKkTJkfLTPVhsDH8jFajct1c2QMoL+yr79n018KSvCGKKNyEShlP3GOTYe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqZAsn5V; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqZAsn5V"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51775f2473aso43221181cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022177; x=1781626977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fBe9vAakig1BPSXTzZIVSMqUxMEqjGjFooZM5iLX84=;
        b=iqZAsn5V8djwuPuWU5Aty1TvBBgs6tOD+ELBtkVWcmLuJRxdoKrjOe8rz4Xry5xeWl
         ry5nd+yPeFtby/g/c4Wug8AqHut9yeJgEYeDEzI1M+hED6KYkeYNSSkoZBzs4BP495zn
         XmYLOgIJKZjeUoIvVAXAO/GioNw0fu8co8VaUSSHnAAovl4OwOR44+2ldAGYOUWTTQZf
         /dA2w2wga+knCgJfYK6jmd7PLOzZ37+Jo69gWwr7o0ib3ByN+Qf6dELZevZJ5Fl4P6Q/
         7yU7AqvNsLuU5M20VX388YGbXYJUAf/8ho0zZcNuZM1uxEW4EIXPuPTVh8vMJSxIkLn3
         bdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022177; x=1781626977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fBe9vAakig1BPSXTzZIVSMqUxMEqjGjFooZM5iLX84=;
        b=Y1rhidGihGHooc6JVi7wJMGKslRjXaVZxwAnUia1XXWnk2qxg3JVy5phm6fAnj4dW5
         cjR5vTRGTx0Pn/L/Y0pL3ZMuBDIjg+dUUypSV8por8TZWOUJiMhiPsrxs+IYE0Ty2i/D
         z0Yweq7fTrHDstUwxf9ZjHRNWAA3Ww3GBvUXZrrz3JwDH6bIDnvia6im+sBIMEFDSg9m
         GnMQiXzNJDyZHVNsWNSegxA8ZoODKUwd5OXxUj0ubzqyZFiS96d2RCX0jvFlGuQS1CVf
         FFc3L4PgrVEEWxJvMoZU8ijArwXBR9Wv7Gd1MrYQkfLH+ViAFZgCyGhAXCTBJX81aKQ0
         3hqg==
X-Forwarded-Encrypted: i=1; AFNElJ9iCWtc5f5Vl4e2Nm2nI0m5pPcmslPnk6pMvdKzDqw09NIBRPu8G+PVa+Si3o41cE/8ukNVNU4WkIR2@vger.kernel.org
X-Gm-Message-State: AOJu0YzOhxABQqw4Ye3vd5hf0hHn3x8w5c9OCwvbgxt7RT2DsbL4c3z6
	VwqpkiPvnzydnyJAOy2fZAD2rnNWBvq3I7xqGb1gSe/1IxaDMV/NxCMl
X-Gm-Gg: Acq92OEpDuF8kp3yJh+Py1HSpVNYvUjgaKaPobLhLCl6nmrL04TuEAJuacNcw3IkPUX
	ucG5r6XsPgruUQZOB4A1XjP1fSk1n90jJ5ygTUyVK+hd+33gqcOngIBx5b1x9iIzryCKrYf9Iua
	AITBWagiC+ktVHOkyXf9i/45IhezoQyL/DeTq8+RdFP2+Z76SGwkmWLT96RZlSD1mFCpBzVvCid
	zJT6Xn2f2SpAFeCBaV+FtzPHzNkBlCRqssV+0u398ZxbFP6EoKNJPGLugSAnrtY/n6Q/r4Ezl8g
	KWln5Q0FPEFI20fB9nc0PDNkrHAhfI1zWu1cInGIIW2VL17yFkLlW1+VCdCIQhUC/MyDLp/ivAg
	+2dMIQezkDwhOqh2wIg0Gq1yWWqGLXTrvfEdNIYFmEpACassIBJ4nuVUfXvU44qqiarbGr6+l9X
	TlkVCQoqWVOgBnwbLwg1GsDKCgPwh81ZTYiv7nuw==
X-Received: by 2002:ac8:5504:0:b0:517:9b2f:a68c with SMTP id d75a77b69052e-5179b2fa8d0mr218453701cf.30.1781022177321;
        Tue, 09 Jun 2026 09:22:57 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c08234sm191310381cf.6.2026.06.09.09.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:22:56 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 00/15] SDM660 sound card and internal MI2S support
Date: Tue,  9 Jun 2026 12:22:40 -0400
Message-ID: <20260609162255.31074-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the SDM660 (formerly "SDM660 internal") sound card
and support for WCD codecs over internal MI2S (represented in APIs as
LPI MI2S).

Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
digital and analog codec. The connection to the digital codec is through
special "internal" MI2S ports. The digital and analog codecs are used on
the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
and also on the Google Pixel 3a for the headset.

This series does not include devicetree patches.

Changes since v4 (https://lore.kernel.org/r/20260501153128.8152-1-mailingradian@gmail.com):
- name internal MI2S ports as LPI for public API (2/15, 6/15, 7/15, 8/15, 9/15, 10/15, 11/15, 12/15)
- fix capture stream macro (11/15)
- fix is_rx in q6afe port map (7/15)
- use NULL pointer in place of "NULL" string (8/15)
- change fallback compatible for WCD analog codec to pm8953 (4/15)
- add ack tags (1/15, 3/15)

Changes since v3 (https://lore.kernel.org/r/20260331193939.40636-1-mailingradian@gmail.com):
- rebase onto v7.1-rc1

Changes since v2 (https://lore.kernel.org/r/20260304195815.52347-1-mailingradian@gmail.com):
- add missing sign-off (1/15)
- use definition of last dt-bindings dai cell for LPASS_MAX_PORT (6/15)
- move sdm660 support to existing sm8250 driver (11-12/15)
- import WCD codec patches for MSM8953 (3/15, 13-14/15)
	Changes from original (https://lore.kernel.org/r/20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com):
	- add back empty line in WCD dt-bindings patch (3/15)
	- add Dmitry's review tags (13-14/15)
	- rebase onto q6dsp fixes
- rebase onto q6dsp fixes

Changes since v1 (https://lore.kernel.org/r/20260211020302.2674-1-mailingradian@gmail.com):
- rename sound card to drop "internal" (1/11, 10/11)
- use common headphone jack code (9/11, 10/11)
- remove no-op code in sound card driver (10/11)
- remove inaccurate comment about clock consumer/producer (10/11)
- add review tags (3/11, 4/11)

Adam Skladowski (2):
  ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
  ASoC: msm8916-wcd-analog: add pm8950 codec

Nickolay Goppen (1):
  ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660

Richard Acayan (11):
  ASoC: dt-bindings: qcom: q6dsp: add support for lpi mi2s ports 5-6
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add lpi mi2s support
  ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
  ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3
  ASoC: qcom: sm8250: add SDM660 compatible
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

Vladimir Lypak (1):
  ASoC: msm8916-wcd-analog: add pm8953 codec

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |  11 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   4 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |   4 +
 sound/soc/codecs/msm8916-wcd-analog.c         | 144 +++++++++++++++++-
 sound/soc/qcom/common.c                       |   1 +
 sound/soc/qcom/common.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  48 ++++++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 +++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |   5 +
 sound/soc/qcom/qdsp6/q6routing.c              |  78 +++++++++-
 sound/soc/qcom/sm8250.c                       |  17 +++
 13 files changed, 367 insertions(+), 12 deletions(-)

-- 
2.54.0

