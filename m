Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778368;
	b=PGN4qVHeoSLeWUUfwHETEx48JnYriZpu9yzQVic7Re04nAj+gX94fPA1UpbtJl9PleM2
	 zRuOjW891fNh2LWd5NxwVDFwxsk5OnzlqyLIv1vOjin98yJKy8GFsOjhuiHk5Tsp35FTb
	 mvZDDTPy8TRdBYfEqt0uWx52QwW163CwYiSk0FOdnj+YyZ34seqrz4Sz0V7OLSAIYLohu
	 XAZCyVPgmud8wxPQJGxDl1kub2P9Jz3d+bHg67MsG6YOBlVTQ2MBqigk//0YUfnigbNuD
	 7QyMIJQAWBpwRKLnsfa6BvzjjK6AuVCdKkgTBrd96II97Sbwgv1tH8tezGN+qyJPt8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qpKChd7cX2IKr3NLYeu19b4piYqsJmCK1pOKyiliy74=;
	b=EqN/7xXH3VZxX88oa1GZdfndjQpt+cylZQo56ZL0vSeoZdJy4I5atvl4UbYvXaLx6u1k
	 FVvsKscpWF51xvqQRMsGPp7oFvtHY7M2bK744BSjSyyuHvPN8JZeNQwuRhrC3DNlc4ENk
	 ZyHzO+z/ebEmgscF9N8hfMDdysKMqsK50XEUU2eaWVWW68WkIp8HE7WsYDEA3h+SE5EXL
	 7LJrmjmBcUgpBKL7MvB+6p7TrWyRAsWB9eASlxlcAp2CwgU8/h4FSfV087K7XE3YpJFaS
	 pTpMpr/8MNkZpXFUTD+XZD8/zsC7cZZEIp9x7TACSOWjCrELia52qIlaaAh1aQVdR3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMPVSIPU;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D100606A320
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D100606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMPVSIPU
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dee593f18so826161f8f.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778366; x=1793383166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpKChd7cX2IKr3NLYeu19b4piYqsJmCK1pOKyiliy74=;
        b=FMPVSIPUP4r2nJIpBzw+AnOH4syghw9n89Z8Gr3tcHyhYZgMPSW2wo/l9P2KmSJ6xE
         JWW0NRo8Cd/tIuttGp9/u6xE7Eg5agM3nbdUJg9/0sJnaA0r6MYoWRVrBBYtC4EG3Bny
         nhMSK4DUyGvJkJPZWKU+rkgxoGy5Wkh3FW1All8qDORLYNHrFMq+ixmvOR0XjB3fuzWg
         UGvy3wPcZdItGmCc9upmVxpWcNNdbPdThBM/QOQUbsq8JhbkUQhKlyqxhh0DbCL5IFu8
         OK3QcDAmweCwbP5xQOoi2yZwNAnRClPpbrAXkmHWqPOGmvQJVb/J9RVmF4KhqIqrCP/j
         meEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778366; x=1793383166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpKChd7cX2IKr3NLYeu19b4piYqsJmCK1pOKyiliy74=;
        b=GQYSyukSSj3yocf7rmpTtti7Qw+VL6QqH7OM5pmo1mjH9y+Tb+cNZ4Hql5VB1+OXn6
         dhbB+tVmU4t891zgSAHUj6xSRKSzCq+zb3vaFIbEXvRXFxdx3S9WgchDNXcgAgUJbMpD
         wcl0LE7VvE2QWIBfyOI4UX/O60SQsBo2T75xB7W7gXl5+aOB7zaZhs43JnNF/+dft0wx
         WiVaP78LePpT9X4XTOKSVl/R8Adr7+w0JZ+sUB1vEznBCNHeYGmvAkz+4rb9IELZeagX
         PXTHrNZ/2nq5o6YLQy9yzHptf7Fym5PbbCUGQn9kHXjouOSaZMoRXM7yrvGG0GNZyYAx
         D/qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwexLW2D6qMUuy7orPEmE/o1l5lGY3RDwLtgiT8nBCJGhumh9PV88yNVUbauIp3tpMb5xzvDK2lNGNh@vger.kernel.org
X-Gm-Message-State: AFq9FYKziaEjQZHDNjHz9otRFzAOTXRb4/pQJpUGl35ZhiAkNDh9wdKX
	Fi0nu+12sxN3m1LTVQNlMmHj/YRS9w4uFPStLuJV+gNcNjsTbQqya+4f
X-Gm-Gg: AYBFou0LD1IliwqXkJui8hB82hT6H4+URhqRp1rINm/f+YjY7CNDdsomIz5bBUNk9LS
	PZNgxQqnvxshkPSI+gkgfzQtZJGtVu5Y+E2ouXeWWN5/cLhmUmEkUzcLMfomfRmYZSbOmPJg+pV
	x7cFl9PSXHUE0iYgBXsanU2S4XRvBRYhwIimmXiFtMAmB/cXrDaBR09HWh1sr/eqKkcSwbT351X
	RgBX+5CN5qBSRIavNg9IVKbFM1jknwX/vQoqbSHavI88VxEMlD+NTM1Plohm1Wwoszuv6AtPpUa
	/ypuYg5mDk7dpUCFQG0kRChNGnNfLF+l3SnOnP3zu6TBiDOEVTOapsmc3AAYBA14cToAVYq7o1m
	xun1HO8ERLZQCKzwWZkc6GW/0qEa7AjteSgB9bhYS6s08ybMXqsogB+kLz5W5snXZmTI/oQ06Ns
	pBCGjvKe3UdbHZxNvFGoRFglwHuruI0t5Ds2w0TIpajSQFLw8M5mSxsdA0Q9fWRiO6jR5p0hG2O
	TJvIc/crPnst138ek2I+gdkJkc+6AYC8KAaolQiSkIoDh0iUJL6m58FPG2bRRM8qT61UyS7FCBq
	MVyc8iQYN+OOqAOomCO5XKnGuTykg9hA9ZfjLi5jB14kkEePi5Wwf1d/yImZf3rEHflET6HD1aV
	GBOLV7Xys9Ryunx2hM8BrCqNyDCk2g/2yyUj2KCB6Hvet
X-Received: by 2002:a05:6000:46c8:b0:488:8384:c382 with SMTP id ffacd0b85a97d-48e385a2ca8mr3518753f8f.49.1792778365736;
        Fri, 23 Oct 2026 10:59:25 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/8] Add ADC driver support for RZ/V2H(P) and RZ/V2N SoCs
Date: Fri, 23 Oct 2026 18:59:11 +0100
Message-ID: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series aims to add ADC support for the RZ/V2H(P) and RZ/V2N
SoCs. The ADC IP on these SoCs is similar to the one found on the RZ/T2H
SoC but varies slightly in terms of available channels and configuration
options.

v2->v3:
- Added Ack from Conor for the DT binding patch
- Avoided splitting up the ndelay calculation into multiple lines
  in patch#2
- rzt2h_adc_pm_runtime_suspend() now checks the return value of
  reset_control_assert() and returns if non-zero. This is to
  avoid churn in future patch.
- In rzt2h_adc_write_scale() used multiplication() operation
  for comparison by dropping the div_u64_rem in patch #8

v1->v2:
- Dropped using DIV_ROUND_UP_ULL to DIV_ROUND_UP
- Included time64.h
- Returned -ENODATA in case device_get_match_data() returns NULL
- Renamed RZT2H_ADC_VREF_MV to RZT2H_ADC_VREF_mV
- Updated Kconfig description
- Included array_size.h
- Dropped unnecessary extra line in rzt2h_adc_write_scale

v2: https://lore.kernel.org/all/20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/all/20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (8):
  dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N
    support
  iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
  iio: adc: rzt2h: Add chip-specific configuration
  iio: adc: rzt2h: Add optional reset support
  iio: adc: rzt2h: Prepare for SoCs without sample state registers
  iio: adc: rzt2h: Prepare for SoCs with different ADC info
  iio: adc: rzt2h: Use scan type for ADC scale
  iio: adc: rzt2h: Add support for RZ/V2H(P) SoC

 .../iio/adc/renesas,r9a09g077-adc.yaml        |  38 +-
 drivers/iio/adc/Kconfig                       |  10 +-
 drivers/iio/adc/rzt2h_adc.c                   | 327 ++++++++++++++++--
 3 files changed, 346 insertions(+), 29 deletions(-)

-- 
2.55.0

