Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273173C4542
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388810; cv=none; b=DMaxusoP3qZU12JQmQwPIcZU4lSV0Q/THI6XqeEVZtVi2UHmQcqOqGFsxRIeUhX2eNminkL73yBumT2dgkpkNUlRPlrUl/5PvD3Rn8Y1NrlGqfr6x5XGM0sDXvZqXb1nVTqHsWw+IR/ash1qq0Qrh96GMU019tnW2wKx/XPmwP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388810; c=relaxed/simple;
	bh=GFo7eyr+k93doRn4+DluxLJbNFu/w/tMJvyS/O89sYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VNC/LwvO2h/nR1SGZ4FHBgy+X/NkZ2mTMIzJFz80oR09YP3CdTT4mehWv00HYrHdkMvuwMAENB9kF2uXwWPaQPzat+LKeEEjpg9Op58FDGf6LFKR9Xz0VKFzrcoJcX2TzkIhva7Av5E55cIrIvf2z3xkw9RzMLD/wJtyS3kjMqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAoBadVH; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAoBadVH"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8423f420455so888600b3a.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 01:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388807; x=1780993607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOUthwrtbXM+y6Tz2Zof/YPxQsVutrNjHKZLo6oqW54=;
        b=qAoBadVHqc0l4nMADc8wLR4cqj64OHpLeQCC4/KmlFxenETMwXL6qPVFNiEh6eRUEt
         7Wo7MjwBdYLTOSlXUnTB0DF4/hUdzPL25pFqWTPleiRwOM72o1D7k3OgN/aTqbl/Hc6w
         lZJjUhHzoUglGc66oHgaeS2FlRNFDoOryZraZ9V8zbjiC1IcQj1awBiVSxaxV8KVRg7s
         4K8JJd+KePMcSGKvQmbSpUpG8XmOfg5GOw+reriPffqjeC59bgpWVO+XcsJV7VcHbncV
         ZtYwPjKCY9hPLVBBQXlY4OceJuE+FxDKbBygX6mb7i55fFiEVZNLqdzDSNrN4J0JynSn
         iYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388807; x=1780993607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gOUthwrtbXM+y6Tz2Zof/YPxQsVutrNjHKZLo6oqW54=;
        b=pv+GtRuM9B/+8Biyr+c0Miz6bMAQtRe/A1Bq6zxQtPWnche2ArjFYkNseMKBDnYgE5
         Ib96jukjT2a8QJCOneDJJYZYOdeJXn+DIWqx4VjxXTc2yYRDQEd+rfkqBdXmyODwsyJI
         8RAZ8cfyt2V/XHnMz9K2N8cewdMMiGmQObxF9B5MQFhmRfmU13A2rTWjvGC9kmig9wuZ
         sP+9TB7MtF442X8+yJmucR2lHh8vM5zkt/7ROzyhNVAezjdIA5OM9Me5e2myfbrtjK0J
         z9wv2uXElyN0Gk0kqReJRPiFbYeU7iQMUo77EOqr9exdBBXNiQKggydDn9v+0ilslSLG
         12Tw==
X-Forwarded-Encrypted: i=1; AFNElJ+hTZexjUzmQjKhMlADlLvMShwz/9tjzZ2czTd4xKh2SFgRmuPG2gcBcZayPpPtRVdx8I85KANey69+@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJQTSYebJ/gAszi5QMZbOzM87zTsF1FOnFH+mQF4nh92ZOwPC
	KSSnGLkTAz1q0fZc/Uw/piXx82i1LVFG1KBss5wbt56NTv+CCOcUnijf
X-Gm-Gg: Acq92OH0Z9o6TLy6L9H58R/R24crPn30LthSgszZx4hhTrOL9kwW6qBry+mIN/EI6h1
	1prPLZ73MSe50BKG8ikcz6rLfjfS6fB6bbb5uCaLj7kiw9PbtMTpSBuWSX8cvDsjYLdXlOKX88V
	P8zM7EtzYnNt85POFL7rDji5viiPQggNgIE5qgXEqDC+E96kfH+f4ZipAKAOIxuQH3zxzYK5EHI
	twVpj45e9zZyr5Jm3YtLs0LaC3ETlsE10+FXporfuU3/6c22P/2aLi1dF4jtXCesGiOlQKn/DSs
	Rq0xAw+KbDYXXRViV61+531Bkr1kZRCtVuCwMqEgvwwu62tO4n8uJGTBGz/Xuz/vo2a/KLe/tbw
	VwF75+hsyfSVfycdEq/cD84dZygpuKuPYuNwLNAiWJ9h7Kg9fyQ2U1EEHWrKpHNkd2x6fLotpO/
	/3xfJCeU4RC+3Jsvx2OhjsMfloC59+isId+w==
X-Received: by 2002:a05:6a00:9457:b0:842:2f28:4e53 with SMTP id d2e1a72fcca58-8422f28a4ffmr11145495b3a.47.1780388807111;
        Tue, 02 Jun 2026 01:26:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842498819e3sm7025142b3a.34.2026.06.02.01.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:26:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Date: Tue,  2 Jun 2026 16:26:23 +0800
Message-ID: <178038877400.2114604.9271390665852626517.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 30 May 2026 13:33:42 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking,
> and read I2C slave devices over i2c4.
> 
> [...]

Applied to for-next, thanks!

[1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
      https://github.com/sophgo/linux/commit/efe66eed43ef507a5b3784d988842d2e621806e1
[3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
      https://github.com/sophgo/linux/commit/972e8823d93866bc39cf6270bd5ec26d055b9d6f

Thanks,
Inochi

