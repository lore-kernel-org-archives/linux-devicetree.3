Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483606;
	b=1WpTVp3uXmpqvL3LgqBYdDEakC2mvvfDS/nKrPXo/ImSFF+6wXNLFxoE+8MLRbCdxuyr
	 NBtskHsEuRrwAFkDmUvHse1lvzo4pJoK+jQB9dS3BSB8QKTZMAY7vBUmE4PdGmJUdYNar
	 +9K5uQXsW3FVl2SsYz5UDFkjYcZJJZTPyV28oenc6gbkvYA2wDdAa42LF4Z7wpwkOYJBT
	 /mG55d05ZP3CgkNScc4+3fkuUzqdsxLslwHaKjHbzy+DaASisS1J8Vp/AT3e/MtEQClXO
	 t48PKgmFpdyPY9r5UXFtg1m4tfZ+YB+MuOibkgPOvRpGYzJGRVkHDO9qKCyaG2huxFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
	b=D856h7znaATV8Z95RQ67qlbb4fj0pcaB2rW5pbU7RjDylsKcr/J27cwBgYRqsuqT4xyy
	 CObbtWIuuT2tW5lAosa/PwMZnLbDkSKy/37ajXvHZkCbs/DqWtYCN00hLAtI6k3DnGqGI
	 2XClck2AQeCev671LuOuaXVfMjTXJ1ZwfZZbW5PiLL0GxFg+uxm6dPGcxCeARpP1NHrVl
	 Ol95g0jCiob01pQ9N9K4XPVWv/rqJ3JEz0FRygwmugUPnKlWKuI3+ZrkS3dDm6n+jnQ1a
	 iXRTtGsiCvz3+4IKOHKkTTpQ9cJQJA06AltKS2OBNkUPuz9vOiawabCPEcUI9hL5qxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBHXdmWj;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2099606A8B0
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2099606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBHXdmWj
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so6252205eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483605; x=1795088405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
        b=cBHXdmWjd5PSdJdALXlPRiY+Gbu3JtX/fpgTkexsTEU+e6rGz30LREHkxLTk9hiVrf
         LNUvX/eB2l+J/XOY0MkxUf+5Kgex5BlnISeCqF9cAkwhdL1n2e/Bj6VV4yR2WNOW6LWh
         BnKvmL6WOxdQk3FP0TvIftOtOvhKTOt25VzFUqWQ9NLJU5FQeWsyVSwW3QZH7XGbipMp
         4ks5bZwp7ffMV8HGSBP7/DlJiCT3OldVfB/TjvqxH3AsencJyTqsiKzKIx2vmQbF9Hu+
         XpcTCwevvEw81u3T8m35CJYbZFZabzwkeMUJZKdn1e/kQNAm8pNUIWpaQXb18hGRF1p9
         CuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483605; x=1795088405;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
        b=Didsgey3AHgx/gPAjo/lLlqekOHecdCx0F9YInpFoZfJC0T+hJQi7gT1lEeeAjJ7iW
         maFOOlsNtfkXeat9wQNnqHCAy4RwWworqV4eapEYiMzlwkjBZ7/comFht64/OLeyVGhT
         bM6RnsWU4StYXVzdHkUjxC6jNhPQ/J2M6MeBMsc16SSHNmDHQFsoT4X6iDsKsjB7FsQL
         Cpc8lPAsrMqg8W+nM+LF+EhnzuUqljK+WqsXNx7HEXzs0IvjvdaPL7SBTy/9tYa0eZQ4
         yNNVwI/ASgu982BAhDe0n6DpNMtvTgcJBeHJ0pz7xbrTBrx+Uerzr3sNrMkBymRU9S3Q
         DNjg==
X-Forwarded-Encrypted: i=1; AL+hErFPUC2KPLFJUJSlOwRTu2fXwmArnbJ0KPAI7tL80IgnIhXc3RtzGmfr3nWtUG34uXjQgCjj/BXqdaUJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hkm9Jhq2BJtqlA7qbCHhZN/qAfkaswphyXeoeFDIo4PicDnx0
	Ape/Xnoe65NTKR/Dti9CC6YMrey9i3TR99hNiK6hAoiYM3XRpFuPH6nClwiY7CJeZUg=
X-Gm-Gg: AYBFou1z493li2FrZYFQ6jAqj15zuM2OdhTwNUxiJKxFFMZwPQpj1HWDidquMc/RADn
	fOq/I+HpepVvx8K4eyg5MD2ftbXxVmXKqjzjcBd1d6+AU2iVl4a+fwa4QfYGkYxE2+p28RdUmrp
	YWFivgw3XJPC6XUdLq16iJ1r7Tx9j7XH93h2j63ngebFLj2j2yepsxo5MJPNjktBhPzaw/NCwQn
	o6Hv7O3bJInC2O2Fd/di3PJ8M0CTloKO700giCzLaLMtwP7leEz9pMxOB6C2AP4NoeMZ8s4goPv
	thn0B2/5EZm5Llo1HC1p7qGK3JvyW18TDA63tXRb5MptavWUwsLLE/REYZs3v0EUSY+b4u7NkcI
	zSjBlsh9YmwLYfKWgT/PmQhif8mTffAzeHvFajROtXqqtQnwLmpRo2BASTuo16mmPhBjB01gz22
	PvD5EQGU9Jz7qXlYfz1gzEquMeLetI8F3dNG53VLKz3X9K/7OjsUIEYrlJyyYhJ8kNcMuQ5j+sI
	QJF94HJCcvzHZfx+acBvZ0PlbRbNWAGw09wUHVfoh+kHkygZa7HMey/EcL9lqmk90t8XXlDqzyb
	ltl3OuxcJJ+yxNyb917C45qIo/Ubmj/kLbQbLbh52A==
X-Received: by 2002:a05:7301:508e:b0:36a:1434:c691 with SMTP id 5a478bee46e88-37686171ea2mr4966182eec.14.1794483604509;
        Thu, 12 Nov 2026 03:40:04 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm50310345eec.23.2026.11.12.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:04 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Thu, 12 Nov 2026 20:40:04 +0900
Message-ID: <20261112114004.182-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-195550@kernel.org>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-4-26rote@gmail.com> <sashiko-outbox-195550@kernel.org>
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

On Tue, 03 Nov 2026 15:05:12 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can enabling mode-switch on the Kaanapali USB controller trigger a race
> between dwc3_qcom_mux_set() and system suspend/resume in
> drivers/usb/dwc3/dwc3-qcom.c?
[...]

Yes. This is the same race as in your review of patch 2, and the fix
is in the driver. In v3 the mux callback no longer resumes the glue.
From the start of a runtime or system suspend until the core has
resumed, it only records the state. dwc3_qcom_resume() applies it
before the core resumes. v3 also compares with the clock selected in
QSCRATCH instead of a cached value, so a selection lost with QSCRATCH
in system suspend is restored on resume.

As Krzysztof asked, the DTS patch is now sent on its own:
https://lore.kernel.org/all/20261112113921.1143-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
