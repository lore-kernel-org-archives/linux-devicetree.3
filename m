Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2E7372EDE
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920388; cv=none; b=VtMbqqnMBXortfVWMbv92Z1etvUnnARjcFjG2hhoQmmCyuFMaatp3xDJ4KHTi7Ip5wtjN/s/9k/ja1oUzK7zm56Mtyb3F7f+9CZ1W/gNX4wPp8PU7ICV/7vAQVmLD4Y9u6Riompa7hu/6wOVLHedfca0XiZBVUZAVa326d/OSe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920388; c=relaxed/simple;
	bh=BuoTf4wVL4g8Z3xsGez2Y7XIEEPar/p8NPUweSV+iH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0C2WzaSUHi/1zsy4taKEFCueCubI9mw2BB1VMYqOgGNHIToLdgbPcCYygw16pjxGhbRHm+/6j576bUL9B02Wle0Orw46i/Q8BEBPSeSigmkE9KNgUCRWJ0xDvAiW6i6jGiD4fmpl5fXI/ija3Gi6E+SGVrlzk0UCEX8oNV3G3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQNDoStj; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQNDoStj"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-660e9ea26b9so3939170d50.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780920386; x=1781525186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BuoTf4wVL4g8Z3xsGez2Y7XIEEPar/p8NPUweSV+iH0=;
        b=bQNDoStjsXqyRFqqStEuZc81Z8ah9h2CQepAj1uRpapGX5E5yjHFaMitIXVaj0hFEU
         mA203kfKIZOfJE+J2wMwrSBjIcx/EL1OtXg7CeBCFjBe9BvgRGFFlPxxlpqpqlz7ECTj
         S7Fog+QEam6aoQVUYB6j7rcZVg7F1rj3ovZURlaAcK1ADXjPFTu9vMuGjlRir5pDVyEE
         y658NambI6lKrZicpWHTeS1a1lDHnmIARvXTkHjQpNH4LN89c8JzXDcpBPH0YyMxdjWp
         ncnisyslBP3cXhqnzKxV0blgJV9niWyYpfjf/pmUkVbb6RyD4XF2LhiEZxr0aId8plY/
         wlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920386; x=1781525186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuoTf4wVL4g8Z3xsGez2Y7XIEEPar/p8NPUweSV+iH0=;
        b=OFDqCJ5cw2epm4GhOlz+TqRJ/GIbxjpOiKtqTvCRT5SlP42jpbvqvY+mMTP0qADS7G
         iOAw6l3HV6rQ1sVL0MXCqHTdI7cWkZBV/VSQKm/S2dgkEqtkINphzB+1vqLT9RdI+yKW
         Gff0muKuR+fUGlN7mnW37R7dkcuuRcCKpHGKjyAQfbq3ja77q16mZSj0IQXsp3kw6mnW
         SxmMbH5HzEcBK458130k0diOVAICXXxHUEvuDGOjVVLgQ+hADdMRrUUWzIiKLrxN8HyV
         1V93GCfLXGKzkoQB0OQr11NhHvtf3/9jgCn6h0rLhdg83xgQHBbH6Wwgvkn3qfETnhNd
         o4dA==
X-Forwarded-Encrypted: i=1; AFNElJ8nvo+HVB8msqvR8RZ1C4Xuh0IbhOH4ayh2FIV1w1Q8Kblqwb++UD8zeHZm/F/srIoZBfjNmcxAKXXd@vger.kernel.org
X-Gm-Message-State: AOJu0YzNttouqG6qdsaPhwpPoffKOR1Ox/8/ozQD9P5AxmDYm+YJIMui
	RW3fXQU1kQlPYXgDiLY6GyZzIZE+5CD8fw+6FruHDKBSMI0Wp7LROIq7
X-Gm-Gg: Acq92OE69DP4A2HnjENbCfRTBZw2CUDYGs3et2w9O+7Gqd1F4Scr4fARha048qUKmIB
	W4JgT5WhGUXWOVZyYLFooIv+5oIhHymLoW+Q2hCafTATbwTBcmkIC3IF4D84+a18IwjRAGeA2Ee
	/OjhE9XIpafDk1iw5pzgzET8r+23FKfoRtyuxJzD/q6S89qgvI6vPaxzyE6ZKPWnBwM6EJWZGa8
	HIAfu7SeIflfiIeErWhDVG0taiSUvZyUYI/89moWYmP+SeoUl6FHschix5sPVYN6YoF+Q+51flT
	kjUHm7TCva8MZUwN5qR5JabfNs+2nAcu1BAb37+oYaTLyoXY81dP5K9eKvQQwEboCiF/5p/c+Q4
	AJYS5RUnwX8MrAZm8WrmJ9KfjgIAR0Klg/TLW3PEbQEYAvyyuYy5stBbfdqKONwRjfrBqRGiCx/
	7FY76TfoDDNjDZ1V8XeAvkCXJt1EZAMU9M+oxRC7XBoz7l/fonFXHy/Sy3GkyK7qevZu4=
X-Received: by 2002:a05:690e:d58:b0:660:5d71:7b46 with SMTP id 956f58d0204a3-66106dcf6d4mr11872452d50.12.1780920386042;
        Mon, 08 Jun 2026 05:06:26 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b9d5sm177590886d6.44.2026.06.08.05.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:06:25 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:06:17 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
Message-ID: <aiawOUHBcKtMVEZk@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
 <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>

Hi Shuwei,

Thanks for testing! I am seeing the same wifi issue on my end and have been
looking into it so it may not be a config issue.

I was able to get the chip enumerated by adding some properties to the sdhci1
node and adding some quirks to the kernel source on reset. I was also not able
to get the chip powered without manually toggling PORTA pin 15 in code. Then I
tried using the aic8800 1.0.9 dkms module however it needs some changes because
it is not updated for Linux 7.1. I did find some Milk-V Duo S AIC8800 drivers
and will give it a shot soon.

Thanks again,
- Joshua Milas
