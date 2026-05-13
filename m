Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2873FD14F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693101; cv=none; b=iNJZb55u4sYMpsOLG+4Dm7zFBTiQXpzrKT7re34pZi4ldrDCbC2YrQyCfsgu1mAD+dqKdBab5R/7epsoFa6OlY9eS9JSHfBGAbKo1LcfpwI1fZVjy+zCO71+fulkFYt/PRdtnM7cRsioMsQlvv02QUEAPBaoqWB307cQ8pB080g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693101; c=relaxed/simple;
	bh=rsVH+Kn/9qjmPcmYrMUWd1h1YJw3zCcnym1KZfCfslg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LoSK1ky3ag8KAkkQWZf0EyMGfllCGD3ngLXzoLKJxd7iKLWcLA9q6bUR1rXOQPY3zylK2KYdh+O2fThrurEcN4XcA3iQbDDLKtXYKcsuwU0TACCax+VHe99FaD+TkhbDFA35fiGt2OeeOrOlkqxrdBVjyvYjPm3N6rkJs8J7dus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PU0sq5uN; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PU0sq5uN"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8b5232009a6so71447686d6.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778693095; x=1779297895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFCIqGgLigFKHTXskPbCr2tSj2xG+Q75yI9Jsp0dlrU=;
        b=PU0sq5uNVPUviAr4zx7q+7iQ1uQW5cqz7ylkjflz7gcntBR8vVn1dq9ZYCCQoDFj5g
         oFyZjJIuWsTqqRlT6VjX9DEGWnbN/zOB52nHBo/H+Wl5MUTLmeVCesWRevAREkZ4pEBp
         um5Ns1m/7yswsvi/8/WKA25cDWA5T2ABWuGIfjsnh0iwj8XEWMBov+/DJgMwMr4RxaSY
         oSk74ej8hmhCPyVQtzV901lmj/u6ISTOWSBb6EDTYHyVMQf7Hh3Qfp2n6TZuTavenxE+
         nuKg1zn81hAY+/dvkkKh7nqup4CxU079NTxywFugHf+B70TAWVQ5K8AWxtoLp1CcGGS6
         Kdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693095; x=1779297895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFCIqGgLigFKHTXskPbCr2tSj2xG+Q75yI9Jsp0dlrU=;
        b=G0x1Mjj0EgfuX2wOldwqxvIr2fDEH91mMSxFU2hHiUIfQwcpskn74vJ/rDIY8fJkH8
         UyZYV46oyNpn0LgGIc9l0FGsBs5EIgK48M2RDOi3dYzZTs70LXH8V3E4C9Oelnm09qZg
         FHL8wy7EvSVynTDN6Osf2BQCvb/pjD7DboFaGJT+OnCbMCSV9UjHEDNK8holUUPkP977
         WgZULu8uA0H/2sMfkekOe//T/Cn3bacY6UBGW1D63qXSfUs1KiUFJ/RwANulSb9UEEFC
         wosn696awCeskU6UNasfQP3FnpsUvPgGDvNqWfZRtaKvOeJOqV7sJkS/K30ji9EXAUzo
         dlQA==
X-Forwarded-Encrypted: i=1; AFNElJ99WADxcmVsejGM2sTuMmVE5ZnyaAwsteCDopt5ekSMZM34/nuPKrahnUvZKruAc5k9BOM2JU74oXA/@vger.kernel.org
X-Gm-Message-State: AOJu0YyHjul7P2mORtUw/XBmAZgwcaFfTv2NtCunW9lEf9bJJolQL6rl
	HiJ/2m3wfsDSOVNgVcI3vWnlDXTgLxNq+hPqX98rlAaSkWQIJj5I8tq9LkqcTg==
X-Gm-Gg: Acq92OG6Khg9SAPPv+UQ//pUOpy6Pijh4Swv6ed4XQlDIhcbtzp48Zp7mnY5GxqhMxv
	xkDT9xb3rcR+6LdElyxUbctYO85NKAK1fPcOB0HrAifsIilVYnr0PN66r0DPMJJkD6SWquaXgSs
	XYKzAh5/oauFJzTSdVTkTnyeyRj8ANdVt12p1jhRF3CQQuPyHJh4sFmvQR0ro2IOS+HFM42TV9s
	IV1aOwsgCV38W/FEyN+cQXfrnLiad8E+Z8eYvyFflx9lprMH5XeitHuOVhB6PP0vPzxtGYfsb+w
	IClTDtRb22bXuNyk4Tc4s8ymp/iAukIye0SvMSJ/0G9WP1E72qgVts3GhLKQK2GIjVeomsiDng0
	j3TcZ+XOcCGgIbpUY7JdeeYWTLsimm8bmnbnufMv0LC5kp/SB+5eTnN8G+miD1k6vo8awgYTRQh
	IKb//6dhg84uBdQmYCmIHLnd8GfQ==
X-Received: by 2002:a05:6214:33c3:b0:8bc:81:c1db with SMTP id 6a1803df08f44-8c7e01a08dcmr57850306d6.43.1778693095211;
        Wed, 13 May 2026 10:24:55 -0700 (PDT)
Received: from localhost ([142.181.178.53])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908562955sm1884916d6.10.2026.05.13.10.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:24:54 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	Yifei Zhan <yifei@zhan.science>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: pixel 3a xl support with tianma panel
Date: Wed, 13 May 2026 13:25:47 -0400
Message-ID: <20260513172549.1345-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This expands Pixel 3a support to the Pixel 3a XL, starting with one of
the panel variants. The Pixel 3a XL has two variants with panels from
Samsung or from Tianma/Novatek.

This series depends on the IMX355 front camera devicetree patches
(https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com).

The most recent test on a Pixel 3a XL is in v3. v4 is still
compile-tested (with relevant schema) and tested on a Pixel 3a.

Changes since v3 (https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com):
- disclose AI involvement in review (Konrad's review tags retained) (1-2/2)

	Some changes appeared in v3 (under "Changes since v2") which
	were suggested by the "Claude Code Review Bot", an experimental
	AI reviewer deployed by a DRM maintainer:

	- preserve same touchscreen physical width in sargo (1/2)
	- move entry in Makefile to correct place (2/2)
	- correct top-of-file comment about which panel is supported (2/2)
	- explain license identifier change from GPL-2.0 to GPL-2.0-only (1/2)

	The AI involvement already occurred between v2 and v3. The full
	AI-generated output is accessible at:

	https://lore.gitlab.freedesktop.org/drm-ai-reviews/20260217000854.131242-1-mailingradian@gmail.com/T/#u

- rebase onto new front camera patches
- drop applied patches (previously 1-3/5)
- add review tags (1/2)

Changes since v2 (https://lore.kernel.org/r/20260217000854.131242-1-mailingradian@gmail.com):
- add support for regulator (Dmitry's review retained) (3/5)
- use common set page function (Dmitry's review retained) (3/5)
- squash new labels into common dtsi patch (review tags dropped) (4/5)
- specify framebuffer in terms of memory region (4/5)
- only specify height in XL/non-XL specific devicetrees (4/5, 5/5)
- remove status in display devices (4/5, 5/5)
- preserve same touchscreen physical width in sargo (4/5)
- move entry in Makefile to correct place (5/5)
- omit copyright year in new file (4/5)
- correct top-of-file comment about which panel is supported (5/5)
- explain license identifier change from GPL-2.0 to GPL-2.0-only (4/5)
- add review tags (1/5, 3/5, 5/5)

Changes since v1 (https://lore.kernel.org/r/20260210023300.15785-1-mailingradian@gmail.com):
- use multi functions in disable callback (3/6)
- add and reformat comments about XL differences (5/6)
- mention the sdc panel (6/6)
- explain google,bonito compatible (1/6)
- remove TODO item in code (3/6)
- add review and testing tags (2/6, 3/6, 5/6)

Richard Acayan (2):
  arm64: dts: qcom: sdm670-google: add common device tree include
  arm64: dts: qcom: add support for pixel 3a xl with the tianma panel

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/sdm670-google-bonito-tianma.dts  |  32 +
 ...le-sargo.dts => sdm670-google-common.dtsi} |  22 +-
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 714 +-----------------
 4 files changed, 53 insertions(+), 716 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
 copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)

-- 
2.54.0

