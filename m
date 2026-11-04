Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800838;
	b=jiatl2MNvHywR2Ib51UKCMKL4YyhH/C7oxN2N2eEPtrMf1uA5FRftm3itK2pdrflzYWr
	 Vsl8R4R2veTEtsb6LKkxZkNtnAsCqpmahn/axBNVQO122e/iThJE/OZom28r+PwbGG1A8
	 U0J5YSVElbR5epnrzOb2BQaba4FncvJtqxic64nr8Wy4vm/qBhd4hrM8mbKsCPa7dR4IQ
	 /9zDLHcHA0mDpxvIoUGtKS58rbsLZLM/lHWaLEqTfmXhOGLMjxjQtN6gtdPjVzS/a9PhJ
	 PSW1t2XHd8f59I3T7d/4ZQK6+Lv06Q5hTvubp0Xetvo/VQ7wAQk2yyJ3xv9ghh+moXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
	b=3IRlbIPPLr+CpgmueDASGSMZqG/UMljaxIqLYanbSipvneOqT+jit+zhvUvErylzdIcv
	 zY1w5L7+sw3MWe4w+fzE9RpEFYqHwxBAucjUx1baXDP56Woq5YT9gu10kN/mKPwyQ60k8
	 xcRsQp0SL82aJVJwwWCXDGtXh044EMunCXks3L1ljpYBMh2oj1PfgsbRpk8AmmEox+FAO
	 pxV7Ken42J+psb8Pc1pZtSJ9iV/u3xKy2nqK7NU9aV5asf++UiC/Xi+JqzlhpGMyqged1
	 Fxw06zepMo5lZcqyD/sOYUq9uDm7mXbdJ+TcMl8SIK7dDb6I3eb9mLKQTMvC7jwEEIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVAYG9Bm;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CDC606A33B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90CDC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVAYG9Bm
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so721207c88.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800838; x=1794405638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=lVAYG9Bmc2hoKTJuJzSrH6J+IhryAyiDTSMdo0aYG9mfqjPS/ga8+3YK2Ad//sbXE2
         HHofzfmuuJ/nJx0kE/6IytFncp6WqXb39RvQM+YnlJNPVlx4UDFXx8nAXhQykpg/r9dU
         TTw9D3mrL7B/AtTF/tGzwS4DWBrit2U6UIDoeAg8Au1ygMhfLw7GRk8WtuLYUaZkwSTF
         aYRfMnD7tWD2+C7sh5TWr6OTrCzca5srbXzkmLr+/5fdNnNFJYIheqB8xKYVa8MXmxFB
         4bAPEVWyyZRmC6vgyn2/OYmqQ8nZ9BmRTU8WOS8FvaydjpnVOWQKGf91yFtKwUSqhNCh
         RSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800838; x=1794405638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=011kkO3y2OtpfKAsKa60Xgbz9g2n2mxUIaYdeCKKPR1rF5/jIKIFEljheEagcIl9/E
         7TiS0Gk4waq551W4qCUqs4tTtmPc5DUS6xQxlN2xsGVJndJkBG12EULP8RV2TQpYP1KQ
         9IYO4ONEH6ndFOVNqXowJOkdp8JJEVX78OToN+H3LL8K7mjiJ125v63ZTUzI3RLBfinu
         tV+9Be+LxaW7f7EPxiX8ATYCItbFMQQnIXp0NhDYog1cUEhxsu9aTjXsdmhXwk3LJXhW
         6wJD5v3f/JcKZe1TZ3oj1ITB/ZwXsjknI8yAisC9++ps+9xgfVDgq8eObZm4zMBsVTFo
         jeRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCfgzP6H1jj6CNhREmwvmTgYK8j53su/W1ciKAjsLgTIxLFo69SBOHUM91QxeladGVUTokYV3xWr3n@vger.kernel.org
X-Gm-Message-State: APuU4Z+qZ7P24/f5Ee2Kwm1owbsB1+/xoznU2OPven/EI8BQefqRIux1
	w8k4np9ChAuAwy84m3eHVURlgkSk5HL5z+huZcsdEpZiaV16b0fEcmKs
X-Gm-Gg: AYBFou0rr2gfyBcGSo/wBDWJ+OSZTLV9yP7KHPuggRPmuNMieVxcojadfndUlG15tpC
	uRlxPwFHaGwFDzgLnhngUOArZixlEL9q49YXZuHLNH0uTm97jPk66JdWePHagyAKv8asY8wTHAu
	vZrSLTlZM5kEAB76b+swffh6hfr2pe2PqbtSqaaKYBvBUhQZFxybUH12ps2cW9JcqXxwRwn/1R2
	xys8jA/7spGQzQgUbgt98I6FCH5ns5/2hffN5Hv5gddVAL/uEgFaRYbP3o7Hgl2KvBt3mKe+u4w
	AsLuDVmd2m+0KqFDVeK5Zf7nAoiKhGU67zzyQzWyQ339QXbsZhgVyOAzaxgJsqBqq7I/tkCBL/H
	h9LaJ8a2qRURZVjVWgSdCXL1XT4qUBUMMo4WbfZ6qMzDCU/hTCv822Z3WSGZy6RiERDgnoqkGeT
	NDU18H1+PJXN7qYaAfhllERbUNcAE/HmfxCFkkQ27FxyKyfjZQD01+Gd0NWVMjjOyptaYuIWzeX
	rDqMBC+Vz4Ml/aLSHcBPHr7NNpBTzeI609zWZMMyOITjVE0264o4BjFL5HD0u92tVEQbzHdD6gx
	hyescXb7hwK0niFtKB1iA99FTyG9m0PnkW43EJLHTXdPCJLBuX3UmoHvzNtrhBW2cXCjWANNali
	5qUE=
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr25563977c88.30.1793800837135;
        Wed, 04 Nov 2026 06:00:37 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm8553620c88.13.2026.11.04.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:00:36 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC v3 00/17] riscv: add initial Zhihe A210 support using SCMI clocks and resets
Date: Wed,  4 Nov 2026 22:00:30 +0800
Message-ID: <20261104140031.1172491-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9b99c531-1977-4bc1-8105-bd9c3e129951@kernel.org>
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
Content-Transfer-Encoding: 8bit

Hi, Krzysztof

On Wed, 4 Nov 2026 09:24:15 +0100 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/11/2026 20:45, Han Gao wrote:
> > This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> > and V2 boards.
> > 
> > The A210 has four C908V and four C920V2 cores, plus an E902 management
> > core. The E902 firmware handles clocks, resets, power, the PMIC and
> > CPU DVFS, so Linux uses SCMI for clocks and resets. The only new SCMI
> > piece is the mailbox to the E902. [2] explains why I picked SCMI over
> > RPMI.
> > 
> Considering how vulab@iscas.ac.cn is ignoring reviews/comments and spams
> with a lot of unthreaded emails, completely disregarding any tries of
> contact over last 1.5 months, shall we ignore all contributions from
> @iscas.ac.cn?
> 
> Maybe this will be the only way to actually be heard?

Apologies, I am unable to communicate directly with the team at vulab,
but I have passed the relevant information on to them;
I trust they will handle the matter appropriately.

Thanks,
Han

> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)
