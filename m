Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841381;
	b=FykMmELZCuRkmaSTPtwH3BMZ2m85R6HYsJofidgBxH4Koyi2weeLrbyNuAhkaghi6g8K
	 ZKu+rSmrS957ZJ4su60CI1weaehNi3ShC+toV/43Sr+aZzhkTnOh+MZ/39v+U4XCzJxtz
	 ynUIGXO8v6PYmPP/UdRxZASxCZWUGzK6XwsvYQVy6UNgoCLSlcluY6MhpSkK5Qpt2NsCV
	 9HPhxZQsvPM0RndnYM1DheW+DypCGJXYdP6w6+DFklelA3QPIlf+rjgKa45T2glYLHshk
	 yikY82xtT4zi1GVG+WmOevFwBNscO3CyoQMdNj3RRkmVfYKa9p6M1R/8RdJ4RVeN8rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
	b=NIS28TjwA0ZO4qukTwXQjOydcjT8ChlJythcXzv6njqtszwVjrFm5fTTGhxnN+lgJzKf
	 iOyGIPsG/hiemLVhn3dH+McJg0gKV4SL+2VX7+u5uJWxxbi+uNf85QPz25UeRo5Fdpcq7
	 VulHsOt6b2qRX3Bx4WiOs6hY1Py83QdoQwGLaT6RyyCBkbfSrn2mkFaPbewfdnO/cllWo
	 wz25zgQG04aLedK8YILjtWcWuoa7f3aoHsDWcoRgPTESk/3id2AZlIV7qJkdE0cpKoEeX
	 OT+LTolhJ3Ys0tx04jUs8tiNWNKN0wy/dRGIZLhKrviBjg7/kN4fCU9SzoAVZ0gsytw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drB0Ljxt;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BBD606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BBD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drB0Ljxt
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c468bd799ecso522998966b.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841379; x=1795446179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
        b=drB0Ljxt7dHrG40ww1KORhWiVcEzVArQ56NMtqkUI7231QZ7f6L/AN55e1stCFjlqL
         fA7HwhA2wMsSJzPWtahQGy5Giesqt+1W3MFERRW1XpPQ1l1m4cpx5+T0OpsvtioucCl9
         16UjIvxuSj04KjPAEcWHe0ViZMCBUMoR6BEvy8+HmAl9K9Pl91itnxo3chV1Nmbzqqng
         mFFh+OmgaBqQboe50IfEx7UqDpVaTmTnpxKX9c6gRotqe93K84SNfrHxkoxy8jqpG3LM
         JiI87T0Jzbo1dwh8Gy/IsUe9iMZuef0yWRc3Lcsi9LbI9P6TrPn8w6YaaMTx1TBKR5nV
         fjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841379; x=1795446179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
        b=bGPTZYZjQV/2kpfnNaXBzuAzymbU/RPsdtc/lra/pqwbYLEJJWapoLLcmfWkUN1wPw
         9lUJT3imWoOZlL/I2eBB+NJxfdnMpM9Ee/SgcIzgFUsuYotkd6viddTcrLS/XCCYV6sW
         LM5wxHQPDwvW31T8/YD/LRGzyu7+vxuW8P/cj211+z9IotHig8VC7VHr/pBddEfuCvaq
         DN9hF8UXhmm6GNs6eI2vv54U61x2g8Aq4JfOWM6XkQneTcYoQTa01ljLvP2l9L6pMLHU
         UlCmFPg/SbEaItUF7/r8Z4b4TqBvypGKmTxVjXubbDIhGOgt4gr6GkVmMsw5v8Y2sVF5
         E8oQ==
X-Forwarded-Encrypted: i=1; AL+hErEsGEiLK4rdenPhAcmoa1rNX0CNGSHHk/THjcpjH4+bTlIyJg7ihtyLyWS1RI+pPc5nQUqetvJ39FnN@vger.kernel.org
X-Gm-Message-State: APuU4Z/gbFCA+ihaRAJN57bglI2AmE6BZenZL0aLj9GhbN2XszsgHLEJ
	RTQu8cmxu22uyGIYzCVuAfkv0UE2WuMZEjEeOQG8isNc6GCP4eNDl7ed
X-Gm-Gg: AYBFou0Bobqz4ofKWIEti1lko2y8YEYU6BQL5MMiMtKEqoq5edSAgR+CP/BWfLp4ema
	qvnCTseFsUfBaXQeqXDkRkAuokgjH2v371X9gvepZLUj8ni8uFaUdFPX4Yb0XG1SlNzGXFFd8oH
	TJQaSPfJTCQitHLc22vVO+ZrpMyi6F0fRUi+ktGw6gOKnGMVdHyqF6ngr7z+/UUw2dpG/Uy64bb
	ue+lvuIZu0+me6JxkPAibXGVPUc9kezkxTkVPk+mEuTigmfQzInywoK7AHPllci22WzHBnUM4Qr
	9uEmdrbYY17qVVBqD4trarj2Cuo2XkgDI5tUEZ3VNQJmP/k/jVhf+iIPtgNx0Z2mcLvfUT7qqF0
	g0CYdwBQ/HaJ/Gj0rRo29DRQWMRYQGiwab9se/x+Lx1aodosqLYCwZErkJfKr4dGkJk9yGQLhDh
	KGosPXYMovbfFss2U/zDOAmm6IzhozWX46rAAZEagnJ4a2RfAS5TTz7rR7zRE0+3zZ5DkI2Dseh
	PI9y5R76Ou1oeQEQbT7AN35xVzNnzgRLry6tm0aFL8m85nMkCtwpY1mdZwliYzwNxTKTBnVc/qQ
	geYZEYIjNwLndhY3UJNCIdZx0lrR8Zz4fwmGACBrX58c9358tSKNzcgfJJZ2Ndwb/jSKd7Da/Jy
	vq+zILxhkgJX+FcBJH3HI3w8JK1J33r4=
X-Received: by 2002:a17:907:3e12:b0:c4d:4ce5:7733 with SMTP id a640c23a62f3a-c509642fb9emr826689366b.30.1794841379065;
        Mon, 16 Nov 2026 07:02:59 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:02:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] clk: tegra114: Add CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:36 +0200
Message-ID: <20261116150239.264139-1-clamor95@gmail.com>
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

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

This change is similar to Tegra30 pad clocks and is required for CSI block.

---
Changes in v2:

- dropped CLK_SET_RATE_PARENT form tegra114 pad clocks
- added commit to drop CLK_SET_RATE_PARENT from tegra30 pad clocks
---

Svyatoslav Ryhel (3):
  dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
  clk: tegra114: Add CSI pad clock gates
  clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates

 drivers/clk/tegra/clk-tegra114.c         | 11 +++++++++++
 drivers/clk/tegra/clk-tegra30.c          |  4 ++--
 include/dt-bindings/clock/tegra114-car.h |  3 ++-
 3 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.53.0

