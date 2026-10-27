Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134359;
	b=unKzYOtZUMSPwpKh8D2kBbhTSg82bLlnXMD3BJWi/rsMHmlqs4tkJvezlKu495x7PSEW
	 8RTp1mzBU4APHARHt3GPYyA1XK7TgfoOwMVUPQWeLO1z2dvV1wEQON1TLWMdXmKCik43I
	 /ovohEJlpY7u4NleYnKEGJncpMmV4hAMq1erkTA6dqvFGmUiR+stMVGcL5LFWQhlyUg3f
	 6B8PpM6x0NLRfSK2asUYBUyTcM4Huxq0DN6ToU0ECoTjSYUHn5yJFDSDfALGnMQMq15/X
	 M76c7hUKbu8S6iL/CU06kNT7ocgjCiBB3rYNcxm3CO+3PpFbPnfNlYmeZcVpdjnxSjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JAPuSSjBy2HiV0XHwgEt3aaV8Ughg4BjhBgy8A9BioY=;
	b=zYx+L6Al1gi9QWCGwYnjvyBJ/4OSqLD/mePYNGHWXovydj/5o49P0m5zUZzr5c7shSTM
	 Lq+Xc/rGWzbE1PLIr16Qvp4bRIJVYhB+2XQ2S60kdi223nKkhlamPJqknvTl6vnw8Av42
	 0wCo3noaEM9BqsCYCEVwrLKvZj7k/FtQ2lyx/AkVWHF1MBFM9KE6NhrDNSKOkuVJpFIkD
	 EK7gM8BYu5c3zGTQVwvJ9DPUGLpYOp+zjunxJzfPaxtzUDJrPSfSbozLNcvQRbP/T9gfI
	 q43/y9vcIPBiAKqCQirNuDkU5jZv/i5YreDgPMMHWMzINJMQcsBA6I1AiLZOORg9ejw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8+uIxak;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D1F606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 20:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D1F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8+uIxak
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae0852df46so255390a91.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134359; x=1793739159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAPuSSjBy2HiV0XHwgEt3aaV8Ughg4BjhBgy8A9BioY=;
        b=o8+uIxakmfDagDkZCK7+K6/vRP/IVouu2zhyMfMqSNNIX8uO4j7UOSdKzAnJG10Qgg
         TcZ0qI6eEWtQfCuXaxmrArt6DgXQAISp1+BzCg4MmL3coNG2Oa081uRLgqaSMIiS4GiY
         hOjBeH/qnW9dN5trvA9hGcQKE1N51RrJGgVg5nGhH1aMJTlPtf4NG9qZukH5OylYQPkh
         4nWMF2UckyXkbGyijuyO761Z7iu51tD0qaP9PyluGQbBM3+qZOpULIXkqZAs6XsUCn2p
         7MZ77ZoeliWVVsTIgmRDtzJCJrKJ+mOLIZRFOEfFmco7vZDadczAUbT/floDWB0ZAqqK
         YTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134359; x=1793739159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAPuSSjBy2HiV0XHwgEt3aaV8Ughg4BjhBgy8A9BioY=;
        b=wL63AHtV1JCUzIFoyZMdKNEVP20fFu5n2SfUyuanHfOVJPClCzgRUfF2cVGo6lXWmS
         jnoXARQdNzVRaifCunZCg6NmOZQADe3gWv5a1Uvjg+yZ0GmQ2ejMdYBvOF6omkg9FAaw
         /a8GdjoEM+1e+3/uFwNcNPKZeJCya27mjH9/7EZ3W1YSrMtUFxbZuWKlSOJ3BvhhG9mS
         m8S9PRSjvhxC+zhJjWS/qCtjuNITcOjr4T3De3JGTQI0sVb/qFPRA/SN5YsIj00fcsa8
         u06Zwy9w8frbP3gNeDTitIhaXouXGgUWF8at7p0m8dEQ7qkGuYL2tKrQwKe90dcoZX8F
         PCrw==
X-Forwarded-Encrypted: i=1; AKwUvBy46T5wNPVrHfmZfDaEB6l7XiqS6KqhoNEUGUngN4JqGBdx2QmT3hFm1tXg1/d4LyJzHWU3UawJbfkF@vger.kernel.org
X-Gm-Message-State: AFq9FYIBn6On1CetJXNcaRA5Nj4N2kzQna2io1P7xkf8VQgH2MhtHIWL
	mAcWFMsKue/XZVGG2MpKzULiZlkK87XiSthFdN/Q8rCwrkIzm7qZ3Iip
X-Gm-Gg: AYBFou0E2KgLFJj4+1lzE8wMCtRw2Ivd6XV6LfHMHcypJ63D4HVq9hXgWYbTJazEOL4
	1dpH0roNvBgccPq1ejQBoWNEqVFTsCcSfcQ+5NauP8KMbQjBrfiNSa83epZl2by2aiiZdHXVm9P
	WKkcudwsquIelvzFksJnUz34QqNpdQ/iQXJdGnrmumeW3RKnxXIejd4Lt4a1rkBdvZhNY0LthLe
	Til7sfUtjE7tNQsreN4Z0k6QDdW6rn19yyjYuXChmI+Me7m+8XsMQmgJjuX4vXhU1VLxLOZVAah
	gdn7FM5P59MK1JEZauvDdhoW2qZAHGF75ZzsMcrmy3q5tAd4AQePQMwE0U8gt+GQMzEGvNkZS5P
	dtRm46UTR5/96ws5ZvtXjRdFRZaDKALsoSPXWUuuw+jvUhTMVfeHzrVupx8L46cBVIQJQanzaN4
	m+qxN9bFZ3K84wSmfsCCWp2WTCWto0sgFWYmfy6RSWBmJM55yG390nvez2QvlB5PLWo3bwGRxks
	NOkiNJi3O3CGWGD2N86OvuybLSzGmMu6mUGiwlxcGkLv56qXm9S4LGxToyhVp39XMDKz3Im48i8
	JK07vvXgChuo5CIkvJyH0UuhV9rNCLZf
X-Received: by 2002:a17:90b:1c0a:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3ae5812dd39mr123478a91.29.1793134358980;
        Tue, 27 Oct 2026 13:52:38 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57bc67bbsm372192a91.3.2026.10.27.13.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:52:38 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add Xiaomi Poco M3 (citrus)
Date: Wed, 28 Oct 2026 03:51:44 +0700
Message-ID: <20261027205146.16384-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds initial support for the Xiaomi Poco M3 (codename
citrus), a smartphone based on the Qualcomm Snapdragon 662 (SM6115).

Currently working:
- UFS and microSD
- USB host (OTG), limited to high-speed (SuperSpeed is untested)
- WiFi
- Bluetooth
- Remoteprocs (ADSP, CDSP and modem)

The memory map for the ADSP, CDSP, IPA and GPU regions differs from
the SM6115 defaults and follows the layout of the stock firmware.

Not included yet: the display panel, touchscreen and the GPU display
pipeline, which depend on drivers that are not upstream. Until then
the display is only available through simple-framebuffer. Audio is
not included either.

Firmware and userspace: WiFi, Bluetooth and the remoteprocs need
device-specific firmware which is not part of this series. WiFi
additionally needs qrtr, tqftpserv and rmtfs running in userspace,
and the Bluetooth controller needs its BD address set from userspace.

Tested on a Poco M3 booted from microSD with a v7.2-based kernel.
The series is based on qcom/for-next, builds without new warnings
with W=1 and passes CHECK_DTBS=y for
qcom/sm6115-xiaomi-citrus.dtb. The existing dsi@5e94000 warning
comes from sm6115.dtsi.

Changes in v2:
- Unrolled the wcn3950-pmu regulator scopes, used lowercase hex and
  kept a blank line before 'status' (Konrad)
- gpio-reserved-ranges: dropped <0 4>, the device boots fine without
  it. Kept <14 4> (SE5 SPI), without it the device bootloops. Added
  a comment (Konrad)
- Kept citrus separate from lemon: reserved-memory, PM6125 regulators
  and the wifi/bluetooth bits differ, and I can't test lemon (Konrad)
- Patch 1/2: no changes

Link to v1:
https://lore.kernel.org/all/20261027075116.41673-1-killdeath104@gmail.com/

Amir Hanip (2):
  dt-bindings: arm: qcom: Document Xiaomi Poco M3
  arm64: dts: qcom: Add Xiaomi Poco M3

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 538 ++++++++++++++++++
 3 files changed, 540 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts

-- 
2.47.3
