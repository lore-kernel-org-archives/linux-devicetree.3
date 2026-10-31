Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445744;
	b=hzxXJcesVeeMlNwLKsl1iWT6fbmGv+p5hTTcNaMD8dakSRd7j80HrZ09ak3cIj0EsiHJ
	 z3CoNzG6Za0isxPfK5egNMg03ZIdK1Txr2Qlc9Mcd0QeSfovM1gi66KVfzuG8jpTy51EX
	 wbrv9/3oCEmzeWHXWwOsyCuIkrUB4o7HxdLes5OdvOLzDraYI+ksksQ8JIOQD1wihIVRb
	 Q4Z4Sw7QU4oPxc5w2rtq5LCoIF3tUb/RqRMWSAnt6Fj617U950L1NxvbxkseJ+tYeA2Ny
	 nZRMiJy9x/OdtL8GlYYs6PIK2+8gPK9mKgxhpZzGpPMPGN/oSfS4OMOmtO+V8RPwd9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e4IDuCl499mXr6HzO6D3TIak1ntyG49jssHPbfhdMlA=;
	b=KV6TO6/tYvy/eINI/HDlizSGqbsZVqHjr4geO0Olo8zUMNcW6zCOuzmGSCiPBE4BuN07
	 zwepR/Cb4PtNgsNyUMRAzRRkNi1AGUZxXNDtXUYCVNkRmsRBHuG30Fge2fRVzZZ6vJI72
	 N/o1LfdxZHwji2gTuRV1gTldvEkgAg+9x782DmA8RzRAEJQBZB3K7g/wTqoWn6NyPrj+n
	 WnkI/4hxCp8LK3OdgnyhKDvEIGY508cKSlUA3tHNNLLlmH6Bh6TXAjECR9tLOJCNuJbcH
	 0L6fpXjE3rPwQx4Xu22a0UO9qD/JQGsTXZxM3PS5Oce+YVh/+BAFvOr+azW9xrFfeLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uIFEbeX9;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6DB606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uIFEbeX9
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab30d04674so2242431fa.2
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445742; x=1794050542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4IDuCl499mXr6HzO6D3TIak1ntyG49jssHPbfhdMlA=;
        b=uIFEbeX9KYrdDJbFM6EJhXmfhbfOk867XjudZFcF/TcyOPe0Qn7h/XCsLfXT+svrik
         V+dty+BAvcNKWDygTdJ3ruXIq9FfDAC2v+ZHefLofDvTyjE2Ow+RUYNQlzAcLEvTV9oJ
         QCTTso3sK2UOGHrPPhxP3JEcpiBiO0IpDkJAzD0d+8JsJ4hkcKhO7WPmMZ9nbH+bGvTw
         Z7ONptNZpKgcP00Bhl4Iul2v+3POyO67xGYptvO7qTWtB6WJPt5fBXhWUhSfBb0ty+BZ
         8+Jp995w22U6HQEs/AA6uxvGx96hNq6W4VIQu4y3UPKi/1XcU73KR8QoEcmKezhc7Mhi
         bxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445742; x=1794050542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4IDuCl499mXr6HzO6D3TIak1ntyG49jssHPbfhdMlA=;
        b=QavSo4nluefNsqmgcgBFdOzp7k7RhfofHAIlV36Zib5umwx+Kaup8eRH/f8TZDk33m
         uuQduVorLfXbl6UfD15gXMXHbk5W11GgiCK7tLllAuXeP1FL0nPosb8+tdYzPHbr/2Ta
         gekFIcKgMlh19bm+G73d/shr8W1X8eXWL0x+RzhxrUjFqBrqVb0MQ7Xn1vwXqtSTQLl+
         OYOQ8sUIuZpC29My88o2/Z49uf87C3x6Wzr1aPjPGE4Ho1DYcI5Cf/v2CIGLZo09X+wa
         eaJDIXvZe24F2K55pMBsUIk+xEWE7qCeTMTw7Mxd9kWAyL6krT/+qWF7MSNLPQReGQxb
         /Z/w==
X-Forwarded-Encrypted: i=1; AKwUvByipHbGhY7uKJkfeKoJjufm6QVw726xAJ+qXerusVgzIVsNJ+uLtPX68CPQQeMcex1qEm7UyvMUM1em@vger.kernel.org
X-Gm-Message-State: AFq9FYKN4Nfs1r3j1OH9ASdlTN4upuXevXslxqCL/OHVe5oGGmxdbhuA
	WeEybFVXvT+drfsjucONSC3blB+kqcvosvJ4+F8eKsMEssAZZ8D74CvR8gqWKi9AYJTaAj1BtVw
	NJt0HAfE=
X-Gm-Gg: AYBFou09ePlX9SVf8/XX8WXFcvOnpjB3rBYyM/LhWGzM8m2K+IWFYLxMMIQp3uLxs7t
	FeYpI+XZCy9JKbQuk+Uee2zUbfw+qujREO4WkutHmXOLYQtxdMU9xBUdmaTDBYYuC0hA2RCR+lS
	4Py5TbdOMXuypadSu1Qqog8rvd4riMnbqSgXaHaksiExsvpmu5wOLsIBI10vasNvO5XK7Hs30qa
	fxLFC5BMr+JXNsCgdoF8D270N3/4cjv/lPx1Skpl7dI2gh2VIquTzAA4FZTcPJuaAx3oeI3PRNF
	mWRgq8m3TMkNaNAoFjptm30sJ368D+IL5rGlyLfsIwm7ZBCUAm+iaxNq8yNSnpbLXdrCtIsaLdL
	gqsM6P33T6cvewRk7Bjik9UkQF0z0zr13eYYnBgQ0LaiXgg5FamLRQLM6rbPwMKiTrC2BDAjBlR
	CLZNQw9NZOA2kHz3EEtiC7+IaR49VYH+NXraHlfEgDuPsivNY1FcJQ14Xp2zRYnJNSWCjb6IIMs
	YIM7dU4gMQdBb80FlJHlmIdUpyBdawnkzr3fpQoTd068MfcLy+rNh4rUqBJTbY0dw9RXjSNVSNz
	2V01GkIrIoHj0aja5YKe/nNEaGnLRkEPK7HmllbxHDcO1N6mlAEtjulprFm3TzcAL0CjGZz+4gU
	+HXa+A51E8IKVuHw=
X-Received: by 2002:a05:6512:4607:b0:5bf:ce1f:cd22 with SMTP id 2adb3069b0e04-5bfd94cc517mr1665400e87.0.1793445741887;
        Sat, 31 Oct 2026 04:22:21 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:21 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] media: qcom: camss: Add SM8650 TPG support
Date: Sat, 31 Oct 2026 13:21:57 +0200
Message-ID: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
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

Qualcomm SM8650 CAMSS contains 3 test pattern generator (TPG) blocks,
describe their register spaces and the non-real time CAMNOC AXI clock,
which is needed to be enabled to get TPG output written to VFE.

Interface to Qualcomm SM8650 CAMSS TPG v2.2.0 is similar to the ones
found on later platforms, hence the functional change to support TPG
is extracted from a change done by Hangxiang Ma for Kaanapali:

* https://patch.msgid.link/20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com

Hangxiang Ma (1):
  media: qcom: camss: tpg: Add support for v2.4.0 TPG

Vladimir Zapolskiy (5):
  dt-bindings: media: qcom,sm8650-camss: Add test pattern generators
  media: qcom: camss: Skip TPG if its registers are not described
  media: qcom: camss: tpg: Support TPG hardware version 2.2.0
  media: qcom: camss: Add SM8650 TPG support
  arm64: dts: qcom: sm8650: Add CAMSS test pattern generators

 .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 16 +++--
 .../platform/qcom/camss/camss-tpg-gen1.c      | 24 ++++++--
 drivers/media/platform/qcom/camss/camss.c     | 60 ++++++++++++++++++-
 4 files changed, 106 insertions(+), 18 deletions(-)

-- 
2.53.0

