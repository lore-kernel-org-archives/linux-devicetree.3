Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA440DFBD
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649445; cv=none; b=T4RM3jD7iTBJscDe70iA3qdT0yh/oPnHakhAW8angPrlYJUayiH4dTlQ+88XbQGdFnrm9GPlSkdHXMHy0cgcLwpbAcp0Zqhrikuc9Mb2lm0pggKklDdS4cvecSdg3fnDGltxRjuRSiwcAomFra5FvfTzrNkrKbepdVGf49/S1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649445; c=relaxed/simple;
	bh=zeXjslT8//fV8OtPFz2zHel5UpFaJNBynQ6tRRznBbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQ/1/DiPmoC21MVNgAXSYL8QMi2FzVr74/oJ1Dz3mv6j6qOb0c4VHVI9lauBpDU1xYVgyVZvZegCx95WyTfVtDEhGyX7n/pJkmUVafHw1VF+4MxfS/qvpn/3ruAe57DnzL2YBdNMR+JI40Ej+dmaDObj0PJLtYVyMEbTik5bT2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMFIGLkM; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMFIGLkM"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a016799d2cso21348136d6.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649442; x=1778254242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ni3dKGcG7zejOacMGL96Vo7FoEUpzVIFEMhHf6gxlI=;
        b=BMFIGLkMdjh9vNV84bxFMYD7d9bQnrBnmlolzrO73mK1rA9LTSmRKSYIKeKgzxMaaw
         Hlxn5n2aJaxupx+DnyqD1JlRn3i2TgSG0XEKNYIWSE+utWaDJLIAE89+QVos63At+jWq
         QSBU34ew3H1jOrP3Qp1F+RmpQ0kARwXiGjfsZtDCinC9iQvKf3V3YmmkpO6N0qt+/y0T
         obL660gmqm6cpO0LpLCURlILMAvTy9moSia7/rmD0nCYK6k4xIDamRiiet7NZ6eVa7zU
         4fFhTYAlQ7OEki7IZMaPXanxf4trM7Rd5PbP0BLBk455jFuDwu7n2MV+7PnSdXTbsYpL
         /olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649442; x=1778254242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ni3dKGcG7zejOacMGL96Vo7FoEUpzVIFEMhHf6gxlI=;
        b=cyg4LHFhFC9HjBAlkmNCKGzqTsjnptzW3jrfCyxGE7BFe2wLuZDjFn+xIdqR+kA155
         zc7JFrMa1u6tbVfwbupXMz6UR3HsRr/StZCroO9U8qaV21pUPka56zM9srmT9bHI6Cy/
         9vf2wUiBZdUmvyhBo5K1PGreIfFwoUXf/N3qohnZkL3I+aOA6vQ/gabCNSFKEeKYgN5E
         fPf9duTlH25kC8Vcg88HjsnPvU0mpsUPw6q7YZj2pyqLmsOhYlZHQd2B3HXZWBIAT5H7
         v358m3BCWwLkV1JY5Bxs9a3x/swL4H67nM3PoMyVQRAt0KViPPxgtAG1ItCA/3WpnPHj
         Y4BQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NOeMfpf5FIyloRnhmeWXy9o3qPE92xNfnMOGOB6UA/t0dpsAAlTqxJbm+yTnLmSQIRa6wUhNsFaQC@vger.kernel.org
X-Gm-Message-State: AOJu0YzuKxON/Gm/bQyxc5guRZ99NxpfBY4QizVW5ac5DA4nzF2X0ZaT
	R64M/okdl7U7e1qk8yxrs7nRrUFc5F2i13tC80BZfhYTsk1DYSim0p1q
X-Gm-Gg: AeBDietLGLiWEvYumWaa0bJAy3PNilmPSDXe7r+TeETtlI8dHyHR8rWSLriPkOCeTMb
	iSlOZUVRDXP9lAAKdNlrOxyNptlY332Lsp7FjH76fcFQSb9FLKLQdRgS3lcVZgrhBMN8/PKp13O
	9l8MLYGRhUsZwC8unXddKyVcZJqL6sYXcWhg8uwhOFFxg1mJ2aeYtAKvj1pt6xfNY78Yjdz66Z+
	Q6jQJiRvpuW/apIFvcBtoZU5BjIZ3tIsrYPIitXGcaKfGZA/GKQzyTK7RfjEL/XJtj9tFPDOqNo
	aDH/gdTmLz+2Hjy3ehNXmMLVxyqiW5wiujYzw0D15pUAFBEtlKnwzWR80OowJgZAwjbWfS0/a9d
	IeAgEWX/FsimqOttlGc71wLMkDxAbH1IWDDodiugGc4RILxdYORGq28fCKMiEe337U9nIaVecrM
	E1P9nVEaVE2GSyOA/xU2WQOpVR5ufTnac1MuT9D+P/DjVI73MKHv7BpCNF8yH9zPxEb+ROr5CDV
	GA21GlK9kFinsTIAc1wFyLDt+LpC6l7hfwY
X-Received: by 2002:a05:6214:242e:b0:89c:ac72:2f6e with SMTP id 6a1803df08f44-8b3feef9e73mr118399146d6.43.1777649435886;
        Fri, 01 May 2026 08:30:35 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b538b1d833sm29683646d6.10.2026.05.01.08.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:30:35 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 00/15] SDM660 sound card and internal MI2S support
Date: Fri,  1 May 2026 11:31:13 -0400
Message-ID: <20260501153128.8152-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the SDM660 (formerly "SDM660 internal") sound
card and support for WCD codecs over internal MI2S.

Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
digital and analog codec. The connection to the digital codec is through
special "internal" MI2S ports. The digital and analog codecs are used on
the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
and also on the Google Pixel 3a for the headset.

This series does not include devicetree patches.

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
  ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add internal mi2s support
  ASoC: qdsp6: common: support headphone jacks connected to internal
    mi2s
  ASoC: qcom: sm8250: add support for INT0_MI2S_RX and INT3_MI2S_TX
  ASoC: qcom: sm8250: add SDM660 compatible
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

Vladimir Lypak (1):
  ASoC: msm8916-wcd-analog: add pm8953 codec

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |  11 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   4 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |  14 ++
 sound/soc/codecs/msm8916-wcd-analog.c         | 144 ++++++++++++-
 sound/soc/qcom/common.c                       |   1 +
 sound/soc/qcom/common.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  46 ++++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 +++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 200 ++++++++++++++++++
 sound/soc/qcom/qdsp6/q6routing.c              |  78 ++++++-
 sound/soc/qcom/sm8250.c                       |  17 ++
 13 files changed, 570 insertions(+), 12 deletions(-)

-- 
2.54.0

