Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485384;
	b=qKrFL9nSnY3EaID86PdAxtkyGK+F1So06THFJL8kKpYl+CZhaDP4eoeKcfLzhyVUDNuA
	 KQWjCop/CPPtghZODlaA622dhWt7IXYWRQVdA4JdD5HB0Ut0gq+2PeB+54v+9QuAbNYKD
	 2X9wIECHNJhMA2tVfyKJ7pGPE/Mlwys6OALg+Haf2HOqbK5Hay1xsMOBPipDxT99hMNi8
	 X4CcrOv0AsxCOOdBPXFg/HyChtUCgm2g9xLtso6OZ9z9DKivdCZUv7H2hXiCPn8QCDg2z
	 8L6l4FTJx8yOF/O8oJbetXojEw6UvXpgizNv52hZoVLmeZJDNONdSN5OZ9MgLmfVmBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q7yKCR40q8eUq26k3oT3KK8/EmLxrrYzaMJfF2nkc00=;
	b=WCJRrYks1uN27VYh6sKYw4BpDq+CGPILyFRVi8u7T0/f3r81CFnFfm77r+2EymMc9sV7
	 xmSNEQBvNff0r8ndni299lt7TYAuE4mg07zK+mvyrBMhyduteMAIhqLkH0h5OTrSOo/3p
	 jRNc6n8OEWi1VJyck+cwGU/WMRXK2NLrIiKerxaMU9SQN7cK/Rh9wVP/bVg3Y+NBMFmfB
	 G+nJqcL+j9BbKEFFzcjdp+hYWE9n3ON8bZy7HQMsdJQJ/UBYFBdRwDjM6jo1B2fOFs832
	 bBwssFyx2vjb0+UDR2PklP9+XdbJ9yqXK0s/rzWPLH9vM7sDDePCWaACZfOMSrtc8Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4DfO8nm;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D36606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D36606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4DfO8nm
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9213922de73so72167526d6.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485383; x=1796090183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7yKCR40q8eUq26k3oT3KK8/EmLxrrYzaMJfF2nkc00=;
        b=z4DfO8nmNbrEgFqhLcRF8JcVLCkC/ktyGqWEafsu/BnXYKGWDpkQKyjV6z/HDjK1Kq
         abYz7L0vbof+4kPv/6Qx1Y/TBUKzBvE4tImHN8gB7d9oeEioRLqsL3cyRz8NEGw9IMjf
         RU9ebb7eB7QjWkzxjz2vsQrykKsN380f4aP2M3MWdCLrbfqdUQRZkwQ07G7V9SwlRwLq
         nPzQGI1GzGLj6TJUXX763xDdMuZGfiFkJxLujZZArNEEMpxtMg2+wWr3/IqJv7q7DS3N
         OJ1rzC/wEMX0qDKS3cNd+rKKpKTcPkXvM8d8NOfEe+QUY3s/27FEwB36Whcw2FfqJ9qH
         +aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485383; x=1796090183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7yKCR40q8eUq26k3oT3KK8/EmLxrrYzaMJfF2nkc00=;
        b=vkr3sQwIoQJ99B27U5h3vgTox+ktCXkbVaYOCUChIBVfvLkHPfRsNfTwr6sro3UXJ4
         /RFqx0cQWXDe2jSTlxvxxMIrjtbJHwPF5W1ASBLvh7KchWiaPi1uSYGM3/Ra+fhRSodc
         lPf9QaP5bsPT7cXqZY/OBh32txy6f+fQFcTjO+bJpyUiMaLPWxA4c5arOW197dwirzxZ
         Ewg1ACKqhw9EfKmMD/csT96DrZcJT+A2caafal9n2BRYpflKeGjzx2k98PBnGBgA2SWs
         CddUe18YMQ6WlsuoZufObCRRJb84uFb9iUATHkII2wULVsx4wa8smdaEY/nR5aZP36Oy
         NjHA==
X-Forwarded-Encrypted: i=1; AL+hErFvsaHABLR33X3qbbnbVbhEDaxcnSJlULph0FXrqc/RmQOInCdVDf6mhF1A9cPy3yomEYcE/IICpFB1@vger.kernel.org
X-Gm-Message-State: APuU4Z9traVpHp5cyZha1Eo8cd9OS4bpM12XfVhiBls6dxliH+xUcCJU
	XP9RcZZjVqlA9izgWi/gEyen9GeklhaLsRyJKXrUbp9gu9q1zc9mR6Vk
X-Gm-Gg: AZFdTZcLhLbto68zSNNZxXN7Fz7WZhI8B6UlKJ6ZuNE96wTW/pugWy05BvpS5jnxJ3B
	pqaYNCRJvZd8OPrSuPNVL9e1aiwMfE0OeczsRFhlM6T+GnbJyD5zxrPn9exp3B0eptJlE7Lh5FV
	UgFx9za6F8mU4RACc+NcNuvaxe4Ep1bmOFd94+YcSSyRSpDQlxCsmq3YiGQXw2AJLfFPchC4SWp
	sh9gyrhidxDq9TlidcAZMESG4rr9JwLHwtzZDm66PwYVG+D5jqqSGsBFYIun1O5CZqP0BpuJ/tM
	UPVxV31ojPMkAQrEgwJdhyAOEX0hg+R+/j0/dETIB4UGeHxG3TaZM60NQLxijHTob5Z4ym8eU+8
	PgL/nbWZ846wLV0uJ0pqc/NgLj+sb0Q3bk2nfStCP21vve69Qzgl7KXxZePa6YvoNCtf8WZvHOz
	lUwnjGt1fU1e3bd8Q5HqHpsijTENfYX8YyolCjZnRrHmIw5JpiNNqweet7E7O9msF89rFqZD+cJ
	tcoYJGrVa9IgzyKOa+m3oq/uI+1JkJeduKJVtAUwH8Mo2O5hbBLoONVEdMoKdYC5Is8kzPB7vTg
	Ey0Mp90f7rwMnN6Cj38mV7vX78iW
X-Received: by 2002:a05:620a:450e:b0:947:b201:fadb with SMTP id af79cd13be357-949ba9b7434mr2479954885a.29.1795485383133;
        Mon, 23 Nov 2026 17:56:23 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm941507985a.14.2026.11.23.17.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:56:22 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/5] ADSP for SDM670 and sound on Google Pixel 3a
Date: Mon, 23 Nov 2026 20:56:06 -0500
Message-ID: <20261124015611.187024-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Changes since v3 (https://lore.kernel.org/r/20261107022453.159341-1-mailingradian@gmail.com):
- remove sound-name-prefix (3-5/5)
- add newline before status (3/5)
- add review tags (3/5)
- drop applied patches (previously 1-4/9)

Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
- stop using fallback compatible and add lcx power domain (3-5/9)
- move lpass codec bclk from sdm670-google-common.dtsi to sdm670.dtsi
  (5/9, 9/9)
- reformat q6dsp dts (5/9)
- set flags for codec interrupts (7/9)
- move "qcom,..." properties to board dtsi (7/9, 9/9)
- add review tags (6/9)

Changes since v1 (https://lore.kernel.org/r/20260922015801.32373-1-mailingradian@gmail.com):
- squashed sound card and device-specific codec config (11/11)
- converted to fallback compatible (4/11)
- added compatible for WCD digital codec (5/11, 10/11)
- removed sleepstate comment (7/11)
- sorted subnodes of dai link (11/11)
- add review tags (1-3/11)

Richard Acayan (5):
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: add sound card

 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  37 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 139 ++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 198 ++++++++++++++++++
 3 files changed, 374 insertions(+)

-- 
2.56.1

