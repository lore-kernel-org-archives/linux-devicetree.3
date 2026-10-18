Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4045492196
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332537; cv=none; b=boedZmbUDKWTzwIDkjK0C3lWLiNVf1zDYdn2b+0OOk0VgjSsH80zDbWU6Tu3C+TRIMhBBHnsT81nj8T2nZwVx7XCobIE9l/SGN3+D/h0RsXmPJDNy9qqnpBJrvr80/wRL8MjrJ4Vlqg31or37BMYfuz1xn7gVHxguI/xXcuoDNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332537; c=relaxed/simple;
	bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2/J1RJZxAgzkHLh4Us8QSgeSjUial3/BZEeIvo5omR8wdu2i6kwsMCssMA5PHMrdDMHfFgIleAmL6XHz8XUB8kpGZRFsbtvTHRjKyPidy0uvFeEiqRedEz30BZB5PiY5oArqmbqNeeHIlXvqgWq8wZVsQ3hQsUlKrEgn+aKlVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUtp4gLW; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUtp4gLW"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1141075a91.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 07:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792332536; x=1792937336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=DUtp4gLWlzFhUiKtAvK42BJqxOgFCfANT/5Bxwzec+VBQ+8A9MqNd9kP3UR4Js5YMj
         YlbrxStDSWUfyIJkP5y4FdTOYFWHOgcHpY2n106+jxx3nniknvvihjUOGotJgpQk1tcc
         4VHQeGKwqXAVjwZpCtPjpg7r1iy2z6oi6TAesZNIP1I8QtWxbjIjlzS+dwh585UoiBde
         WJ1tHMQ83LoYEQyUwfAO08lY9RiC8iyk8Fmtl3EaBjpnrMfi84GxCNaQ8sBpIxK2q/i6
         aVE31K+9Np+hXPcmJd+gKO/r+hFyC3fn/Dui0iaaDHdD2rxpPc3bBrSY75l2u3Api2z/
         zw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792332536; x=1792937336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=Wvigb77NmddNHTJU5DewJ6IjjzkowgjCxy8XboPpM4sPlM37KHGiLHuRzTX2d32FuG
         7UnOGcHFq9XrsSkXqZIWlxCKpvpv9/wh35TRAYx7Yt/+MvPH3gDsnE5PtpkBPknCcOJC
         ErGtRJQr8k5qfbyywJUsg4+mCtiJVXDq8elxHV7a2lzIGLBpUKtOI+8iaic32EF71MqG
         UxxbIqP4mv6uiphctFxsYUQr+tv+t6nk6b1TqL/KXqz1sbB91lE5BU9uXqoLLT39XCKn
         geZob2y4XqP4qpK/HsDAREoZDhTyczEoUxczwQUKNoNJs2BC62NjXchP7gZOE2lSuFta
         1ycw==
X-Forwarded-Encrypted: i=1; AKwUvBzi5vheSFFnw9/+ogIhCLNzCfjPj/8pgunRPFGzoLrKKiCSiHcH+F3QZCF/mazcgp+xAALnk8bDC1ju@vger.kernel.org
X-Gm-Message-State: AFq9FYI22oZHYxiR4LIuPexCh47potLECmtwWWEDtSN6JXo3NyUeZgML
	crNao7h13hM4D3CAvTkIoPiZJyNxQIxahCCsKzoaIlXhUzgfpvfPB1yc
X-Gm-Gg: AYBFou1vx9vxJkHrtSkmXXFHhnX9MU3RkNF4iJc3Kundluq0rf5lungPz3OLy8jqLxC
	d5ebjrE9+WwTlarVjmBUu0x/ZP/xkNjbTsp/O6h5JmPC8YhB9l68y4eLXcgZO/mZ8X4Ym2i6NYR
	n4T45RseMp0m46F5uLehBjdqv9sVORh1NeBCHKQJwgPX3S4a/WGt5PVPMPIATSoH7siiC1dFU1B
	Rp0SfU3pBTqiuCnPQPYd4jezgKYo0McNvWCXxmNyLkgZWbaUfGdw0SHOX27bGfOQNFJ/Kx2AdsW
	rsdJT1Lr+7tBFFCAJpdZJcwpQ1Q49CAkw0v+P6p6NrlCyIsZIr8pU/BQVgUQoUbHZ/qtwGNBZui
	vl7U7a4v7J+S0z6SyVjTMDZfV8vOvUD0Ub/UZ//TbguE2fkUN/B9j0c2f4vA6bIBLZutAkxEvBI
	ytuDHFagPGedYrDd7sioBzC2+KuNc87nDb4egoZ995wvTvU5K6PwrrWawPATonCxlIgl5JijOX8
	eIN7sh5H1YzN/S8cCsRY4tQ+ErFwGsIpFAxm6GWKBAJVMlqUTJuZlPo3PTYB398y0WlJiK9sl74
	Ch8HhW8jQIyr6fT4zrW2n2uPKCoyt+SmvKRGkuHs426EZCEmAPqSuQ==
X-Received: by 2002:a17:90b:4a4b:b0:3ab:188b:c5be with SMTP id 98e67ed59e1d1-3acef15462cmr4793176a91.45.1792332536192;
        Sun, 18 Oct 2026 07:08:56 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm16970791a91.15.2026.10.18.07.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:08:55 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sun, 18 Oct 2026 22:08:42 +0800
Message-ID: <20261018140850.1630481-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
References: <20261017180141.3477743-2-alan.tseng.cs@gmail.com> <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi E,

E Shattow wrote:
> Drop this last paragraph/sentence or place after scissors line, not for
> the commit message itself.

Thanks, I will drop it in v3.

> Presumably the BootROM does configure all of the above?

Mostly. The boot straps select SD, eMMC, SPI NOR or NAND, and the
BootROM loads the SPL from there, so the SPL needs the same
controllers and the clock and reset controllers behind them. The
BootROM also prints to the console UART.

i2c8 is different. The BootROM does not touch the PMIC, but the SPL
has to set the PMIC regulators over i2c8 before it can bring up DRAM.
I will give that as the reason in v3 instead of the U-Boot sentence.

The BootROM can also load the SPL over USB fastboot. I left USB out
of this series and can add it in a follow-up.

Thanks for the review.

Hung-Chun
