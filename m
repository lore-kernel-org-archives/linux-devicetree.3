Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9535C49C4AE
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050225; cv=none; b=okBPAbBpyLp0j0G2MElIQO3f/u3ZcrLDsOnN/x3X6YqHjv0bH5QSxe5tvn0FAY4ng7uRDV2InBlgtJxSRlmMy9L9AJaxhYiORdP3yrHlBs8honyjvdYzrLGFnNWmPt8wiJc5OuKUpapS6IL1gY7kdw7jQr64WiW5fqQQlUxLZcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050225; c=relaxed/simple;
	bh=LOhl3Aekc4RKo7oAx+FKR3eE5zK1tDJ8SzPFFk/DLWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ru00ZUE/khAs/fT0HODkeFEFoWQmhJpc3+if3JGW1LVZnfi8uUweTo2YyuJM86Gsp4NnL+pGsadDMfhx7YAKDSQFTr3kO/ZtP+CTiy48a/Ewj5hA5DSjCtZQyffyasKeopf4OlnK2FFs4aw+3jdiF5uLT3J2uKx5op70XA29zvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgNmc5KV; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgNmc5KV"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5338f65913dso7121041cf.2
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 10:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050222; x=1791655022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsXt4MoLEnClFiQiLZ/irOmeq+7VrIzcy4lTR5NyCaA=;
        b=CgNmc5KVxHcqI5p+cT7DPLeAQOJlNlq67j5LX+48L/9JLzAmKq7PJHMFkPo3q/DCE+
         vUZkVeG1LiSVHplH2VaIFQDa4+FYJcSOKKwWrGos/cuUsaTQfPyR6t41CFv57vTpGuRt
         tSr+bEyvLvHAKkYOP1g3FYuHjI784WIBTEo1glLi0crP5x7hR66VOUetZrnp1f6Vb3vS
         Ol3cj0OmjzVfKQf5fRa0HGfGSgHxgV/aKOwzDeOEGw2xsu6ApyfdDVvilE93xyS7O+78
         4XNfAMNTyFyRxpa5Mjq1BGxgPhRRqv2liJc9x8YzO1X7WbvXfdjqayWwwDVdPtL83Bx2
         XIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050222; x=1791655022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsXt4MoLEnClFiQiLZ/irOmeq+7VrIzcy4lTR5NyCaA=;
        b=TOTP8d6xHOZXB2cG2rxYucEJqFwdZ+RE+hy00TzwwO7UZkKeKWLL7Hzpvb+xkJ9y84
         uSSqg9bJ1DhTSDobj98k46ZVBCrh5eQTaVx+0kJBIAAPF49Ds1AF7/pT4CE1IivfyCql
         5K1OyClPaI1r3Cv3C2DxY5HhSUYw8nCCT8hpNx43HYYIFl3jusp0N79tw3a/2TdMgcnY
         NDLOOPqFt/2UKgGhJ86zav5bt7i/UXIOwsEfYR+RvDEYh3S2t5hT94V3qrT6TWI+nK5f
         DEDagIHpevJRoDx2XbbAVdthBPlWqMLKyl2X2YUB/FJsFIxsaPBTisnFv2jnrIOmkZXl
         HMlQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/AxBk+J/mlHVaPXeG2vtnSQ6Dt5ANWoH8zYoKmFKTulNWfa9FXFsE15Ln206q3g0eJkMp5RqttiHe@vger.kernel.org
X-Gm-Message-State: AFuF++mtuA8YA9FLSnatbCKhuubFeUmIVsLTCflLtMjMpW4MdwZjIm+3
	gqPlXwhbID+QXYQzJvfj1D9eN1YleHlcVstdh3d8b/FGbQjpkwZYa31mq7z9Bw==
X-Gm-Gg: AYBFou0ZnVZRN5HMA4OceaX6aoDiQx5HO13aqmgNMW5phvLsfsv6Egg8YL1x7t/3K+V
	1sM459PSOGdjSsUF7sa1AibM3qvHfy6Vnob2tJiKRktjsF4Nt1uUHQd2jpPyZ5VwLAPCIS8QMZw
	ilgvFIuyxPEO/sAcfEJez8V7jaOyKYyZc4X/DT9W2K4N71/VQWovBmIsrL/qMyS2Hrd3bn7MIOm
	Xqoty/GElkDG++/8hMZ4rAwYo+1RQTolCMXxT1brsu9DYxvk1/dBrlR5pvGMsnwPCS0ze8CK4Xl
	DBwNdBIh98VvhxHqFc0rOAUoazA0i4yfhdeE6VPngsZ+jmr1IUEsP1cQY37EKZFPFv+wS/EodI1
	uUPW1LtgoD2wG8f0+D8j7BnOh0UYEZYLCb3xh3ikjId2+Z7ciKtilZOrFNlgUM8Vuu7DQVQsICo
	PX2AbhIQjvvcY0U1VnNJ557ENbKOsDzBGGLfJzQ8iqRrYekzcYR9+G94waRKSZtb12GiguXZJ6e
	S0=
X-Received: by 2002:a05:622a:260f:b0:530:ea8c:1b6b with SMTP id d75a77b69052e-53511b4fed6mr52480151cf.3.1791050222471;
        Sat, 03 Oct 2026 10:57:02 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398bf8196sm57217881cf.22.2026.10.03.10.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:00 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 00/11] ADSP for SDM670 and sound on Google Pixel 3a
Date: Sat,  3 Oct 2026 13:56:48 -0400
Message-ID: <20261003175659.23536-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Changes since v1 (https://lore.kernel.org/r/20260922015801.32373-1-mailingradian@gmail.com):
- squashed sound card and device-specific codec config (11/11)
- converted to fallback compatible (4/11)
- added compatible for WCD digital codec (5/11, 10/11)
- removed sleepstate comment (7/11)
- sorted subnodes of dai link (11/11)
- add review tags (1-3/11)

Richard Acayan (11):
  dt-bindings: soc: qcom,smp2p: add sleepstate support
  dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
  dt-bindings: soc: qcom: aoss: Add compatible for SDM670
  dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM670 compatible
  remoteproc: qcom: pas: Add SDM670 ADSP support
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: add sound card

 .../mailbox/qcom,apcs-kpss-global.yaml        |   1 +
 .../bindings/remoteproc/qcom,adsp.yaml        |  33 ++--
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 .../bindings/soc/qcom/qcom,smp2p.yaml         |   2 +-
 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   1 +
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  40 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 150 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 183 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            |   1 +
 9 files changed, 398 insertions(+), 14 deletions(-)

-- 
2.56.0

