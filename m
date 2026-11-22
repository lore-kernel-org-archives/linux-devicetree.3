Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368148;
	b=Qe8HgHuUbtGoQtNbY3uw7XTkaUBLwLUcoWTxczhWnTUKpqjbHeABbeULjwctZO2iylUd
	 V6Am2c+eQjOPi4bEQ2TgUaiMIOktSZFXXG5umRgILM36JECmPRNnc7Qr26E9XpLdwBU3e
	 O7UkWnY9MqP4K+O6efJRIlBxJa90p6ZKKVJje5/Sad7mRFlW8jyOmwLNTcoWx/8d5K9hy
	 aahDNpJ9qa+pcpK4An6ldNjTKomLo2ay/1bTqe+8pT+hfSGmhiISlGo78+39JmHNzf/JK
	 SvBZE/2ldIO6qrWLNvK45rdeQTT5PHDHUHTH7qqLM9a0klZviN7u9NfrQEmkYh2Oz0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
	b=DZpn5M+IhHhXOWAJTRnWrPm3jKil2KZK6pr5936aePHIuBN21hAqqcGqFpZT6hQWrJ74
	 C5sIo7EplAX/b45E9xUHYDu1WADv7vaEP2yBu1JDg3sV+C8eUmq4H/juKSbU5doaw7viY
	 irek+9jcnPz24NgsfqrF0PTxUgkdRQiQmgKPwpzwvx5ahRZSThEaM0ybfYjsVAZEPMLyW
	 A0+u2sxdjhfJaJCVaPqTxmcFzzm5fUb0eMqIyNgXHgkmVGx+MhLlRrOtoFRiQ6myGG3RO
	 QqDHLThvB4lH1zKIucUi1xE5f6+IfIvEGIXzHSRPqNYC+o1HRcpG+oieva1D5A0kekQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBAzZYcv;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E6B606A33C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E6B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBAzZYcv
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so1209585a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368147; x=1795972947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=XBAzZYcvI0UAjxnxRcreZ2xa57tWzsBIk+xJyJfakPnjZQLRqB7gnVTc6Qn5CdjUbO
         xXTqI9r+rGRXSGvF5d9u/Gnt8cBL/N5/xf6tBndcQ9TnX3hHeuD9tSzX8sNkkbj7vhA2
         NeZPxacRSsaOBC0O3QO9DSW6vT50WIL7fgQmtZa0YNtC+iyBs2ZZbCtUEdbBWGXZZsl3
         XzMwvQ4v9H33vCd27VDcugFyzLDIPGo4nIjz28dfG3CtbzZTvpHODKvnyuNs3l4NIsgV
         rmrwLL0KqwTgCr+ubLcXoPp9NBBDnxFxRbDWkoQYlII4OMLRVrvsRiSieYn+T9Gsvdjr
         irPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368147; x=1795972947;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=pgK7s3BhbeX3IX0Xu/3q6OIQHo+lKqHDqCoAIoLHztsLomMTA21uK7jez/1DYkdkIm
         0pSc+F5y26N8lQWSx+2gqw/wnSIacgfY3gWRZaSXaJdn0m5JTyf1fwrzfnWM8QBjh1ks
         nYNh38IWd5cIBIm0yhosxGG/YXid0A4wUeEAl/sXo3EZDgYI9tskgZNLm3QmuF8zuWJl
         mCUcb8pcD7/ZEjYPDvbTNg+hVNSMNPBqZlhIMWhwBuOXbCH78b8RNNjaV3iohybUohzj
         wn8tXHvU+kxkzmqFzO1uPXkH6s2NWz6uXY86ntc9BdnAKYI3ChzOdrOTlbRXaRbFvJ/m
         X0TA==
X-Forwarded-Encrypted: i=1; AL+hErGrieqJLKeb9rbc9IsUoRxn9OBYUtEP+eMH0fSpQVSdYsmeOHVKodSuBM90uSA+gnpId1G2autt60J3@vger.kernel.org
X-Gm-Message-State: APuU4Z9ePETNt0rqU5+SK+UCbP8okVtoErx0k8y3h/SeeV/Dpn78OYdZ
	vh2NTLHAtYejgN15XypMT5JuPY5k1TzXn9w3dmJRqLgT73CggLsudx4Q
X-Gm-Gg: AZFdTZeUqVWERt7FOgONSi9JkEHsa2Jo7ObwuivTySQM/SjsmwXsq+vRg370cazzQDr
	CIYvbjW3sIdjXqFM+MuO4vfJD6dT8kWBRs9y9qV3Tg3d10CjM+JJ5tj4WeaOeLohJyzDvpxsO94
	gaDOHidc7MFUwbqLmRZbFoEzW3efNqDIMg56uOLxKNd3B5kDJywyhzGlQoMpsKgQJZ/FviG26iG
	BTR8C2Vz/pltf2zEVOyoVUv0VWISqidjlvdMiVYBtzXR2oX60TymMvJ/3sDr0okhz9hwaY8bpdM
	h9UYZZYiP8UWrcqXggQ5xAsDfrNwDmtCCgBzTNNE9xaY1u66MlKYQKoZMJaNbjId29nxcUjZl+n
	1SHc9nXZuQgPWevotULtQM6ukgbWiyplYwvvmFbxGgl0+0RkklBBYENEvZ1bq4jD02ZXxYc0XFh
	Bx4Ag5pr6bq/w6nvBpjw2sPp7Aw9u4EPO16fNo+xbA6up6GeBgHd/KSIs73gRJ49GOgnaUERpbO
	bSHnqb89vDs0IBcZ3gzIGF+gZAmjn+ag/TATH/v5Ii5DNf1DUqMs61x6eY/OcQZtcfP0n2NhcdB
	UWk6iaYs6JpwvUNnAv0d6mqRpu+6CCdiIZ9PKr6Ywx5SFgJLD6BG63ryWn/ajnNfEC9JV8qpPri
	jAGk=
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr8081661a91.27.1795368147033;
        Sun, 22 Nov 2026 09:22:27 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm13471136a91.4.2026.11.22.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:22:26 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Mon, 23 Nov 2026 01:22:15 +0800
Message-ID: <20261122172221.3552455-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
References: 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 15 Nov 2026 08:31:11 +0100 Jernej Škrabec <jernej.skrabec@gmail.com> wrote:

> Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni čas je Han Gao via B4 Relay napisal(a):
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Add the main CCU driver for the V861, based on the A523 one. The CPU
> > PLL, the CPU subsystem clocks and the E907 clocks are left to the
> > firmware.
> > 
> > Unlike on the A523, the second divider of the 27 MHz output is a power
> > of two. pll-audio-4x does not pass rate changes up, as its parent also
> > feeds the UART clock mux.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> 
> Do you have any user manual for it? Or at least BSP code? It's hard to
> review patches without any of those references.

https://github.com/RevySR/linux/commit/bb06380bc2e5a02049cd01e0b10cb3c3c694b750

BSP code

> 
> Best regards,
> Jernej
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

Sent using hkml (https://github.com/sjp38/hackermail)
