Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348985;
	b=ArO+p03WwHBwOt2uzx9p3zr6F+PezX94Upl13E9MPP17ETnXLB9v6KZDzl0eZuqc+n2v
	 iuTtbTXa+ctxeQFk+j1FXIH5zPGpjZ83wR7vsSPAaI9VYa0gJFwvsNttpgmaSOHCKeBOz
	 EO+E/zXkN2rTNmO+geK0Bz/w3qsPP1dv7iQwjRNbRcBK8jTljFjZxEqqTdbajBSMvJuUl
	 qYOny14R0K1WUlg4kGaR7fS92pAdW2PajEVuj8qwWpw+8UAhbVrbB18ymCx3ZHdUYE/IU
	 rM/f2Tq2bvzrRUmcwfVn+Qo1NGAQA1cU2RZW+wDRm2MWovE8IEVuRbjLyfZ4rP/xLrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dxKNiMftVupVb5om+wXy5zkYQQ2Gh2XoL0QWLFEag50=;
	b=FvtnPdcsiEeoBt1FtrZvmM6mIPpkThV3D1RanXtaI8qUuJJ4YwCgCPjMYv88x/ZL3Sr+
	 uAIUPPJEQbW7ltaoqLpkaWO2/ncQN2AX39oZSDethchyiiRCu6NlH4h9Hgtjfrb3bAy5s
	 YETEg4rveuWN9j4laVP3smVURyFQYHhIrzwcnyBSr2+ER2ZJCJy209B+8YwB+lfkeJznk
	 NUNt6XErY7L2MeScGi5KsnHHXe8VYx5RvflSmdl3oM/NxIrO0Qt9C2nhwmQo1Vlrjwc5S
	 sR19t+5WwjgzW+86oeaiqVDke09vb9+O13ndMddpGPcusTI5G/0brmioQgZD6LzDpwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC30606A330
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC30606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso16303705e9.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 04:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1795348973; x=1795953773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxKNiMftVupVb5om+wXy5zkYQQ2Gh2XoL0QWLFEag50=;
        b=h37WmvXlzeqJOg2skDXkuZ2+T7AUQHNgThGjgdFemHp3spzjs6KBY6eYQMLhocih+J
         vdEYZeECN+/WBbybSUhmDji0q0kGhSN7f+RdRRtaFsNi9yWY1lNGJn7xuB1cn5i/8ScM
         tk8BgynI/J3dvysUVS2moeOvYoAiSkA16sgDP4kNic15y1ifZ2XzRwI2fFI708nj/zbj
         k4sb0gC4CgEJ8mxFEo/8xTtmnkXiveyBTOdD35D2PGlgGGZgfKF8JiO/OTZt4Ix5WVAr
         GHqZITv4Qhv0YjEyHEL3stdQh8wMyhT/oJLoqFHi0za1Jcw0cgXO3wOQ8RQ8wuH5oSAQ
         kDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348973; x=1795953773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxKNiMftVupVb5om+wXy5zkYQQ2Gh2XoL0QWLFEag50=;
        b=TdRjPu0ntabGTd6LYWyAzTSmGJ17936R5/wx7PqYdexOGP/fLyXjyHY20hknxKov2S
         OppkriIt6bmdCkUU6JHEZHCXYj5A16MR7U/tIYoEVm3z3pTlvjVIjkmCrSisdT+MVQXu
         COuF0RBN4ktcp5fKCQhWsORU40AU8ofrGWrQDeWFLeAUPTGk6VTCJsk6zBH3tFB8CfaT
         cAzZkT+WKNM8e0C8R0lO2QbDowoWjGA7ev0Yibwc9JkpZ/TxyMCpvM9CGyp1N+7XW0M0
         PazEmJWSykLhlOKChukZ/XPHXQ/XqufYIC9msMEFTMMsy8B6r102dIJkS/kbfnrWSxEB
         /64g==
X-Forwarded-Encrypted: i=1; AL+hErGxdhw9aul/eFi+da7jYDJBk8FzYENXMRfXU3UjP6dBkUaMS0tnap2ikA5EsPSeLhR9vM//I5V11jxo@vger.kernel.org
X-Gm-Message-State: APuU4Z/jcr14GbFEAJnWZQcd/dFKLGMCinR34Bxz5In4oPar+3owffX1
	g/uUw1YEab2UWybRSqtX1chxillDmwyIbDuffcyTCloroDx2+kWTD1fYJW4DQmFDp9Y=
X-Gm-Gg: AZFdTZdw21RlpLjNb8g0aoIGzsQmqgZyCD1h9LDdAGtFJS+uLpxtzMqKs3hnq829W/0
	tBhDMgcAf2LQktroICOpZddkOUbTa51WHW+UJY71yTGSxJkCiVovN9sIDuVwtZppJJbJMzszEXx
	ZvhZ2EQLg2FcFrHHKkiTKzdrDK+6iAxv7e/CIn+m4M2KTuLRHVfW8Sa9tR1WVYYfnZ8X00u8CMT
	DO3w0Qso8jWUHtWa14ib3XDjwjkuF/80wFZmUC3z9KByMs+wXH89yXISNcpX9Bhj+eQndR0JfU2
	+Vq1gCUmmypFzWbkxNPH+5bp8NiQOz+GNYM/xCCKpNZEUuZPFrjaica/oP/77RvvOu/HAQGSTwC
	1IsPPBA0pynq9SEx101fDs8e3dNmfgVSTfz9qQ9vvfpzLv7AZ14roFrRStJ5ieNthOOJ0vCg7Nu
	37rp1Px9Yp2TBTBwwc9jXsfVBrg74Y5KBF+iWpvOpipb4cz0NE2RQdKB9E/50r9G+Y7MyeqLVk/
	uR+TxVi6R/je6ELNIFZoM/mpAmhyqrwOrLf6E1jx4k2+8pGR3qIRB6djkp/DPjsNP+Yr2KIlp2h
	rdCz9VOZTJRyLvu5LQgjxASVrJhYUVpq8syFS2JrOXJDg5J8hOE2RM1+TVo7i9keelfEVFZspZw
	Kn0sg+IY=
X-Received: by 2002:a05:600c:1c28:b0:4bb:867b:f0f0 with SMTP id 5b1f17b1804b1-4bb88810708mr212949495e9.15.1795348973238;
        Sun, 22 Nov 2026 04:02:53 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:a5ac:a6f0:7687:6596])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm209160435e9.4.2026.11.22.04.02.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 04:02:52 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: jz4740-i2s: Add support for the X1600
Date: Sun, 22 Nov 2026 13:02:51 +0100
Message-ID: <20261122120251.2083-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179495557744.2707353.8222109296948133350.b4-review@b4>
References: <20261024214438.33342-1-olivier@mgcrea.io> <179495557744.2707353.8222109296948133350.b4-review@b4>
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

Hi Mark,

On Tue, Nov 17, 2026 at 10:46:17PM +0000, Mark Brown wrote:
> > +	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
>
> In the v2 thread Nikolaus said that there are separate TX and RX
> dividers, is that the case?

Yes, I2SDIV has TDIV in bits 8:0 and RDIV in bits 24:16 (X1600
programming manual, 9.7.2.6). RDIV is only used in independent clock
mode though (AICFR.DMODE set, the "6line-mode" with its own RX_BCLK and
RX_LRCLK).

The driver writes AICFR in probe without that bit, so the AIC stays in
share clock mode, where capture runs from the transmit clocks and so
from TDIV. That is why both fields point at 8:0, as in the X1000 entry.

I could not test capture, the R1 has no capture path.

Would you like a comment in x1600_i2s_soc_info saying so, or is it fine
as is?

Thanks,
Olivier
