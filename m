Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202105;
	b=eR/2tPA1YGfLCGazKcL7v2J66jOf2ktXdNUqut4HAwOdrrxVDDlzPb+lwZXRDQktOTWq
	 CAsG8WjuTTYCfrYarA3CPLZkUedBSIL3cM6IZx9zU9MnKOmpZkhe5AVCOgv+lVj2YjlgI
	 5wTxmbBr7c2V26z1r6ag+9VGRXFMdJjhWRcmkA0dujHjN7/QTu3qZUe6xtOOFz6PLlhJ3
	 oV4j0DRgOyIy6mC5d6lwHLNIfCcKgQX+lfat4h2ARgppTQXwLQ/ARdWHBOj0DC9pjI3J6
	 8BV66pQ0niIAA8HZ+34swn3Pewol6gSmTPtgRpddw4DB409NdjA1bqmxLbQexrYG08w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score:x-atlnz-ls;
	bh=ZqsMXWIgoteFobR4UEPgr5FlORpalz6vlz2HAMuLbs8=;
	b=pRx/nIHA97kSig3wh9r8y7HQb6neWr592fP9fSZWhV7V38dp/PQYwdFFoD5oaqCguvvJ
	 53F96WKuQrCE5lNcYoW2a9mdO5LjojUpvPt73ug+zDG+69w2XSEf4VnMNJ/EQ+t+NAfOw
	 op5S+wr4cFvgm6UZHqCH1w2BlyKmBqDa8UyePp0u5sjcViVt3XyDPXitCZhXSx4wVvew5
	 sA/vp9U845HY2/17HNG9j5qaE/Gq/XEivbwacLhgKyTSlZRzJF/cngiuGS8/pUAC1WF3U
	 Z0hTjVRSElVMYck8TGOcORB7hWC4Y35I5KMdD74ME69+i/58bHSG2mYi0hiBjWvTKvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	dkim=pass header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=ruFZPASr;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BAD606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BAD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=ruFZPASr
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CDA032C0404;
	Mon,  9 Nov 2026 18:28:15 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1794202095;
	bh=ZqsMXWIgoteFobR4UEPgr5FlORpalz6vlz2HAMuLbs8=;
	h=From:To:Cc:Subject:Date:From;
	b=ruFZPASrZJy9DNQraAkn6J4qy0QT7pczWhbWW0BhM9+jmaAuTkOGVdALK5enCFQOq
	 KUGcHryFaE5Db7kH92G7bVRBaLAxfV+4tyUaGmZ64ERot0F/d1zwbHLfyoXefQsFSk
	 y333/mKiyMES7OvSSKu8YbOROx3bLyIwzDuCES6Qeb55kwPscZ5pstVYiKYtzmUsMd
	 xTTCWoXjTnMCCDerVXek9cEPj+CvWmWs3WqY/yYLk09LzWXgte1Mu//fGSxApn5UAP
	 HpIht4dUSzd0LjsFMcfSdSWUQ5RVbiMIllvb+s4txouowjsi4sfKHALvvy8TgaKWvA
	 yDKvb5oq09oUQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6af159ef0000>; Mon, 09 Nov 2026 18:28:15 +1300
Received: from joshuas-dl.ws.atlnz.lc (joshuas-dl.ws.atlnz.lc [10.33.25.13])
	by pat.atlnz.lc (Postfix) with ESMTP id 60F2013ED56;
	Mon,  9 Nov 2026 18:28:15 +1300 (NZDT)
Received: by joshuas-dl.ws.atlnz.lc (Postfix, from userid 1634)
	id 5D1955B0036; Mon,  9 Nov 2026 18:28:15 +1300 (NZDT)
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-kernel@vger.kernel.org,
	Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Subject: [PATCH v2 0/2] gpio: realtek-otto: Add RTL9311B support
Date: Mon,  9 Nov 2026 18:28:06 +1300
Message-ID: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=S4h6w5sP c=1 sm=1 tr=0 ts=6af159ef a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=zJRp6_cAMcgA:10 a=VwQbUJbxAAAA:8 a=UhqImUyooLHdldx6TLQA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The Realtek RTL9311B is a network switch with integrated ARMv8 CPU. Its
GPIO controller is the same as the RTL9310's. This series adds a
compatible for it, with the RTL9310 compatible as a fallback, and lets
the driver be built for ARCH_REALTEK.

The RTL9311B node lists "realtek,rtl9311b-gpio", "realtek,rtl9310-gpio",
"realtek,otto-gpio". The driver binds through "realtek,rtl9310-gpio",
which keeps the interrupt controller; "realtek,otto-gpio" alone would
bind with interrupts disabled.

Tested on an RTL9311B board with an Infineon SLM9670 TPM on a spi-gpio
bus using GPIO3-6: the TPM probes with tpm_tis_spi and responds to PCR
reads and TPM2_GetRandom. With the v2 compatible list, the controller
binds through the RTL9310 entry and registers its interrupt controller.

These patches were prepared with the help of Claude Code
(claude-opus-5-5), which drafted the code changes and changelogs. I
reviewed them and tested them on hardware.

Changes in v2:
- Use "realtek,rtl9310-gpio" as a fallback for the RTL9311B, and drop
  the driver's "realtek,rtl9311b-gpio" match entry, as the RTL9311B is
  fully compatible with the RTL9310 (Krzysztof)
- The driver patch now only changes Kconfig, so retitle it
  "gpio: realtek-otto: Allow building for the RTL9311B"

v1: https://lore.kernel.org/r/20261103215316.1544492-1-joshua.scott@allie=
dtelesis.co.nz

Joshua Scott (2):
  dt-bindings: gpio: realtek-otto: Add RTL9311B
  gpio: realtek-otto: Allow building for the RTL9311B

 .../bindings/gpio/realtek,otto-gpio.yaml      | 22 ++++++++++++-------
 drivers/gpio/Kconfig                          |  5 +++--
 2 files changed, 17 insertions(+), 10 deletions(-)


base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
--=20
2.53.0

