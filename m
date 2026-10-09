Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC23C0607
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539268; cv=none; b=XMsu9yXpBpBNQFZiUg7UjHVLRwIx8oZFB56lj916r9QAbh8XhJQXNQ0etevHktnDzF7ENIFoXyW9frtVZjVtOn4j83UN8ZrGbJfTjfUQZaSv6X6HNStVWzXDDnCpmDrqXH6Ri0aG2sb1ynfFJeFCyG11iiiF9KX6ctlSLUyJhgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539268; c=relaxed/simple;
	bh=B4rpVl4mptJjkcyRtvFrb+ksh0rsTg1kk1VMkeNJfyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r9QABuvfBc16ubktELEN7txCVVY4MwephruV62shwdrWDPx0smkc9JRJ0NEoNJBWdExYq9lpQhdyCRmHUj8WFYZ3LiZ5yEfRUwYEPKXl56DTP8HEQisYEH6OmQPfwelRfxan9WCWG2VSB2b8BYGV5XuVEPKx6eVKIjc8yeDwsSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6+nEOuq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6+nEOuq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6d28aa26cso30386035ad.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539265; x=1792144065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrPTdcZ/njH2i3/j2LZUGAT14iJIsacuNVj54+laGas=;
        b=k6+nEOuqK4IAjrktw65AHdhSink7++M5Nr8mckpwX6roTe1dztn07+ax0krKldOFL0
         mCRaCZmMPqBms3gApgkoP1VORum0AVBhyZp1k8yxcxhn/un8X//bB7CnxcCgTV3wc2Go
         rZnx2EHEAf3KjY/tqlmDa0k4xFPI91A/xdB5JIcMgMcmDVZCGoWk1ZmuOvAgHxvyAnOk
         tpTKbUXMzLfOcVNGP9utuwbY7JeuE1/U2T4hvWVZnFh+OuanX0u7CHKSIwL0duGvgPN5
         BiGLfOMOFvI6se2lERN9/9KiUuT5EgjLYfXFlp3HFgvCK8fvS2zNq7U9cGAwWUr/g326
         T8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539265; x=1792144065;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrPTdcZ/njH2i3/j2LZUGAT14iJIsacuNVj54+laGas=;
        b=AnRbEJb6RDGeXikq0gqGakWdgfBdaxhUEdgRk7brGko7Uy1/TU1puNKHna2rMxAfvZ
         xsTO6kLqW3KCCdb9Y7Mxs2Osk/owaOQGetsL7gIPV98Bw4XqO/3dXWjTzACoFH2E7Zfo
         GkSYoA3cJlm0x27Fo1nNRHOzbaUG9A//+NvqOZJyO0OYJDsEUDWO1QWJWYAxn9O/76Tg
         YDPSHFF9Vfm3ITqU88tn79y1iqJrViVJ9N6/Fd2vOw1JSlppI8XaAsTFeFBLe86tRt6Q
         kI+QCJNbicQFgpIqRlDfLojDB0T+gGUrQfA3gh6eIgkOV0rDPcLPaXHQw6vraQ2lzcJV
         p9yQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4SeiK2Uj6aLFwucT6Q6K1lrBmOtUzwo0o/Ed6JgyBGvwpT9Wk3qYejAikeFYdXBE5NVQmjqAD4iuA@vger.kernel.org
X-Gm-Message-State: AFq9FYKg16hmLQtVx0pBsa3C0K7OczI9PpGknauIKEHmKR3ucVIgynyN
	tuDGbTq0g6m2dajzhDbdy4oluWKLczX3yEzKlytPxtk5zkEtSRcmDdhM
X-Gm-Gg: AYBFou3Rxmf2sFTrQ0Bt1hdTxhV0K7jxdK446rozmTPA+Y47rzXYpVBnK3L8TaqJPOd
	GTRGsJ8PUNgzfZ74i1tUU17mFtFwtvJ+rClbmv9PBn8LcqM2sFqbEo16uEVUonnP8T2ROMd3WQs
	yQ1RngzldidegQhaUzI2WNNXoOlQht86McW8grgTvQ5ShpAU0MSqxWawfAeWA1QpirDfHvuA/JN
	IRFAJ7709PIechfjd8fhsyRwWBfQDrW/Jw5m0wakmYXVv28QTeShIqLFhu8TpqyYLv+qVu4OKAh
	cK1n876myDFHzrTF7dBw6pUA1CjX2EoKQOezpkdXL6XfxKeSrpwKCYw1EN6poE0rKInBao10sQQ
	ygIFxlSwnfsGPX16fAaf+GK+eOcTcUOepi3EXO4xpgyt57wrXYoAXv4fkK35Gb3TcdlTX3SSo0q
	KuIijXocwnZfpMuZ6k6B8laeTMoffMvCPvJ2vktjuZzwYhFNk5jRHsWCv7FF5dwbWeRsHI
X-Received: by 2002:a17:90b:224c:b0:3aa:faf6:a951 with SMTP id 98e67ed59e1d1-3ab3a9a93b8mr1318325a91.37.1791539265069;
        Fri, 09 Oct 2026 02:47:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b981b9sm2638018a91.5.2026.10.09.02.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Hangfan Li <lihangfan@iscas.ac.cn>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/4] spi: sophgo: Fix SPI NOR errors and clock limits
Date: Fri,  9 Oct 2026 17:47:08 +0800
Message-ID: <179153921379.259252.17749060045138037060.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
References: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 02:22:49 +0800, Han Gao wrote:
> The SG204x SPI NOR driver ignores transfer errors and clock limits.
> Fix both, enable SPI NOR on SRD3-10, and use 12.5 MHz on SRD3-10 and
> SG2042 to match EDK2 and the vendor kernel, respectively.
> 
> Tested on SRD3-12 at 12.5 MHz: both flashes identify correctly, SFDP
> reads succeed, and two full 64 MiB reads per flash match.
> 
> [...]

Applied to for-next, thanks!

[3/4] riscv: dts: sophgo: Enable SPI NOR on SRD3-10
      https://github.com/sophgo/linux/commit/0fe449e8ff7b383a8375e85ebca40133a02f3348
[4/4] riscv: dts: sophgo: Limit SG2042 SPI NOR to 12.5 MHz
      https://github.com/sophgo/linux/commit/a3a8c25c59f8024eb70a460767ff0d7bcb213338

Thanks,
Inochi

