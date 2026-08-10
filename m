Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232BA430309
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 17:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382589; cv=none; b=SlmzZfJdVH0Iz61sKJrLKsrhmwWVA2B8An7tPgPfDLUzSHJg11yiK8ZzrTS+uTmGBvovNX+M5hQlNQQpqDHNK1vm+ZBLRPZfLcP+S8+Vu+rD1NnEOnVCFZn8ubRLtU/ZsBQQ6tYqiJpV91CZPz4olLHFBvb7a/O9EidTyF0dcok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382589; c=relaxed/simple;
	bh=7JJFZM5gaiNG8foKIaR3aWW27HrxrqA/Bk/MUvmEgGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ojLNdR6KKM0iypDM4ELlEDMMm052O4dM2NqmxDOQPr2ZQiXyc+mlxzUKCjZntIU67RpZ4dNujabwq3hZQNWW3lfgB6SFqbLJX1NR83dEQVQIOHH/ejx19F1yo/r9ki/ftoG9d21WWSUnAyfLv4I8FBkNP355a8n0AeIQG5B7gNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjztdEI2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjztdEI2"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f71156e1aso861842f8f.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786382586; x=1786987386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENzVokBmSnuN9bqw0Tbgo5j7dr6hE7iZRXU8UDONpzw=;
        b=SjztdEI2so6ztFVfvBM+TWQypaiFJIXcp0Wed2j9J/1KOThoxh1VXee5F8X4dFLdOF
         SEBmcubOI6aUZEbpAnlw8ydJh2YyMOox8OZXPBwjYPWs35rahInrEPLrWDn6e3QYtsjM
         hjEqdwu8TcnNJmj58AW87YfsEjSZB9zaD8neDY/5rfrdTpg/K9AZdBYpqS817dcn/X6/
         4GBUEWOGyCcfl6aUFLG06mUkQFOuSF2yoj4e8/vkVVKT2Q8unV4dB6mVvj768VMwAlDm
         euDmW0nbZwL/dd6A1J7oMS1DeoYE//oZbq2BKnWjaFwqf+1vp1ViV5dbRdUqG+K1DNrY
         On7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382586; x=1786987386;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENzVokBmSnuN9bqw0Tbgo5j7dr6hE7iZRXU8UDONpzw=;
        b=pbp2Q/E2IcyKGGNpR9/DB001K193M5Ccg75AmkXE5yiDD2ex4Img7vHb/Ja6cHo1Ml
         dTahca7rmXGPYeGcGy5aLmmtgWNENPESoSj6bkhFxAVtVqgHlAcV5V4jVttpe7nDpTpL
         b77Utk+waZ6aBrE1PzB8mFjefqz8+9tFz57xG+Ymd09aMi+XcDd3Zo1Qzjcvpsy1fTz3
         lyznUjQdorr4YxAcvean9wiNCNLha8iG5q2iKMTkMsXietnGvHvIPiUrG+TD+Vna6gtm
         51egVS86H7/PbjgvwrH5GGnkXyrJ6LufyVXPoL02vYm6P3X2vNq/wZEXI2wNe3zBJUdW
         ef/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqy7pZuRz7r/pVyKarCCYaQonBK6IEr/Im9DcqCHOUqljdZNrnoQQwRH5DzZPCz6vErqqYDtJXnRIcx@vger.kernel.org
X-Gm-Message-State: AOJu0YwWzgh0VumtmsJUHclFvj6/cg6q+etI15fjll3VvYIJIthWwmF2
	pIjK93ApWALsCBUu0X0l6gMGwfwdeP3BMJ+3x/p4Swc3OET8/uPEvrFQ
X-Gm-Gg: AR+sD10lJZ67wjcVoKVgKs+dBDE/R5bgz7tqfhr4cSQ3L8Ej6Tw7KwS8EITscBrYJ4G
	4fN8bWFBHBfMF0Tn06gZnUUoSGXyQnVH552ALAgUlyKGqPLV5R2w/8eX4NyXxgMZzUNuQCAkqpm
	b69ODkQgpCVzbG0tBc+co+Zj+j8S6iKmYc154/ldh9TduXZhKa8BHdpEITsYCmzYaGmpU2hweMG
	hr/jCEBG1icz0YzdfuL1+pkUyvehLA8p7xWENY0DRqXx7aDwPruJJ1298f7E/fgp7cbvW/qRtmp
	qUxzoVqmBJiB0SdaS3buIPnjpxkeTOSZozWULOl7NblwdFsP/KbuNsc+mhrf6W2IjgVDaQDcSbX
	k4SMQGrDitc6hKXYnDNRn6g0p5wemETcscOo2BT+y5+VTOqNGCl6JDxg7UEed4PD9qGlJq7WfQO
	fyBnRbPoCj9WkN755jaToam1GBEunGru+q7+RQ2ZYnNWMaBu6FJ/xZ4Ol/puWtXGem0wqKJl+ap
	SWy2P/krqw752mQKVNc2/LJYqU92MkQow==
X-Received: by 2002:a5d:5985:0:b0:47f:b452:49f1 with SMTP id ffacd0b85a97d-48130e7e7dbmr32190829f8f.2.1786382586047;
        Mon, 10 Aug 2026 10:23:06 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021fb89bsm34651555f8f.30.2026.08.10.10.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:23:05 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: wens@kernel.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Mon, 10 Aug 2026 19:22:54 +0200
Message-ID: <20260810172254.468732-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAGb2v64bTO-uG=QrtVDfHF=qnGtF5LMitagD1zfNEYSAqOzvXQ@mail.gmail.com>
References: <20260721223956.13665-1-andre.przywara@arm.com> <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com> <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com> <20260803153519.262827-1-juanmanuellopezcarrillo@gmail.com> <CAGb2v64Ty3HkBbb5A=ZL6QUAVD6bugG0hcYykCmh-KUsVwzwRw@mail.gmail.com> <CAGb2v64bTO-uG=QrtVDfHF=qnGtF5LMitagD1zfNEYSAqOzvXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Chen-Yu,

Sorry for the slow reply, and thanks for taking the time to measure this.

> On my Orange Pi 4A, running iperf3 [...] 4A as client: ~180 Mbps
> 4A as client but with reverse transfer (-R): ~520 Mbps
> Something is definitely off. I don't know what though.

I cannot reproduce that here. Since you asked with iperf3, here are iperf3
numbers from my Orange Pi 4A, and one measurement that I think is more
useful than the throughput itself.

Bench: direct Cat 5e cable between the board and my PC, no switch in
between, link negotiated at 1000/full. iperf3 3.18 and Debian 13 on both,
board at 10.42.0.52, PC at 10.42.0.1. Kernel is my own 6.18.40 tree.

  board -> PC   (iperf3 -c 10.42.0.1 -t 10)        943 / 941 Mbits/s
  PC -> board   (iperf3 -c 10.42.0.1 -t 10 -R)     930 / 928 Mbits/s

Retr 0 in both directions, and rx_errors, rx_dropped, tx_errors,
tx_dropped and rx_crc_errors all still 0 afterwards.

The number I would look at is the cost: sustaining 943 Mbits/s takes
about 3% of the eight cores here, which is roughly a quarter of one A55,
with ~8500 eth0 interrupts per second. The little cluster was pinned at
1416 MHz for that run.

So on this board the link is not expensive to saturate, and that is the
part worth comparing with yours. If one core on your 4A is at 100% si/sy
during the run, we are looking at a CPU-side limit; if no core is busy,
the CPU is not the story at all and it is somewhere in the MAC, the PHY
link or the path. That single observation would split the problem in two,
and it costs you one `top` next to the iperf3 run.

There is one difference between our setups that I can name precisely. On
plain v7.2-rc7 there is nothing for cpufreq to attach to on this SoC:

  - drivers/clk/sunxi-ng only builds the main, MCU and R CCUs for the
    A523, so there is no CPU clock controller;
  - the cpu@N nodes in sun55i-a523.dtsi are bare "arm,cortex-a55" plus
    psci, with no operating-points-v2, no clocks and no cpu-map;
  - sun50i-cpufreq-nvmem matches h6, a100, h616, h618 and h700, not the
    A523.

My tree carries all three out of tree, so the cores scale here and on
plain mainline they stay wherever the bootloader left them: mainline
U-Boot 2026.07 hands mine off at 768 MHz.

I want to argue against my own suggestion, though, because the numbers
above do not fully support it. If saturating the link costs a quarter of
one A55 at 1416 MHz, the same work at 768 MHz should cost roughly 44% of
one core, which still leaves headroom. Falling to 180 Mbits/s would need
about five times the per-byte cost, and the clock ratio only accounts for
1.8x of that. So the missing cpufreq support may well be a contributing
factor, but on its own it does not explain your number.

What I can do, if it is useful to you: rerun exactly the above on the
same board and cable on top of v7.2-rc7, twice. Once with just your
withstand fix, which is the smallest thing that gives me a working link
there, and once with that plus only the CPU clock controller and the OPP
tables. Same base, same config, one variable. I would report throughput
per direction, scaling_cur_freq during the run and per-core softirq,
which should at least tell us how much of the gap the clock can account
for.

To match your setup as closely as I can: which kernel and defconfig are
you running on the 4A, what MTU, which governor, and is the 5 Plus the
iperf3 server in both directions?

Cheers,
Juan
