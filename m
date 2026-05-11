Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA2540628F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514096; cv=none; b=oFO2L0MJizvMg20xi7HfmKkONvp3VfDVu3Q2FrDe8EN7mP6oQ5eDJORd4vTCVda94wF5Z4xxgkSbT2oEE4pyyXiXkcJ5opD9+Q9F5a7Yj/qmFRItpp7Za/XjpnkbtJMQ63triyBPAkLkqO872R2imyljJxOjaQlJsj2PhTVeLaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514096; c=relaxed/simple;
	bh=QYUz8b5kzsmvQFipBJ/YClQFCzx8AI1CLI1nrVUTxv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzQbQlm7EbNNIXj4ujRYcTg1QD9ErR9XLJRNdo9qiZkHcOguN+lYQ8mUPtxlAibXsUY33stk70Jgv0nUAh/nFHsV9OQW4wOfOYm+lOGOIZAxgDO930FLhWI4Q6EOAEfxhIQTI2hwYnYCpBm/D2ZHCOgZXmaWNYx5HGHYkv6JrYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Heko3cGu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Heko3cGu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48896199cbaso41064655e9.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778514093; x=1779118893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QYUz8b5kzsmvQFipBJ/YClQFCzx8AI1CLI1nrVUTxv0=;
        b=Heko3cGu0Pyebt5bmYaWD5pTPrs+ZlplJer06F5Q3e9Ipc3Hi+pgI51EIhUU1T0ncf
         c4gO5Em2u4wlHWzDpeHA3DKtgyvG/TC2z3IoMk96Ekl6HoiCL7TdKph+bb5n4SXJ6g0P
         /opjNxoxU4YepoTNEddD9i5yfspCTDqhwkCPHZpy6MP6pQHszoGnw+I0gAqxHglOk1td
         UX/nAq9/M1jppHUduHWyQFPlGUWPQZt2oBTccyRjSok+olkdvR+SLawsm+GtGJ7SjoMO
         4yUg9H0xC3yWKaHycUvgIdVK4SRQpAQg89Z1D43EhU1IglbucyJojJXkmJkcQcz9YkR4
         gd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514093; x=1779118893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYUz8b5kzsmvQFipBJ/YClQFCzx8AI1CLI1nrVUTxv0=;
        b=dgEC1NisxdONrsI3+HVPLSCtrnqWe2nmlAwAFBK2c9m4PDCPwmpJyjq54y2I44gJjk
         rE/dzbQaawnbWrN1gYACa46g06/j834s67heCDQF3o3ztfWqYJBGH6igIJD2Psa0Gryy
         2XF5Axg3gTXHJTU/ywu+ZB96C7/L0+Z5HdM0jefJwyw5bRmb+RyKTT0RVliTYaS2wWIb
         MJYgCV0uvwxbeH5Nmkq2W4Jm3FnM0yN/g1R90JKK8IeAHyfyKQRAzRee2SxD38TQBAcw
         1s3vUy6FZx2Cn0y2w2jBsBKzfrhojyfAi1JK9kUk+JDhEGugmtofYF9jwBbY0TnZ6ouM
         vy+g==
X-Forwarded-Encrypted: i=1; AFNElJ+OBLiwQRr0lH6UsX305S/ixMK2giJv+vYBN4BqznOQTqFSAgm2/QVlBhmZ8n4lifqtcihz+xx4Nogm@vger.kernel.org
X-Gm-Message-State: AOJu0YzUKAWnopY+FWZsecnpjmE9zM3o8bASCszVY3Ox5anMJIqU4ux2
	QEu890cVA7WledWieyXxNpH7LFtcvDeyZ8mQ9wraStVmWfUKWtQfDrjdsIHzziyT7UU=
X-Gm-Gg: Acq92OGXuLWXrfLm77tTxhvWHd+1EWrelvPOEwZWE1A63RMGgzQ/+xCDKUNWPqI5BZ8
	e/xFjCwdr+Txa/UGnuNpkJkVXoF02q0ln7qogNoqczYN1Xer8jZZ9GlX+KEN/py0c1Phpv72kNx
	TzK50dKenzwFbuwehXJGrffclQLFmDjsV3bbikNX5utxtB+HmHK+W5CkZomKmh1Wj9MPS5vvzpG
	uAyPVx08ef+BJuvw6hjoDHArx7c9PRm75iSDNfVG8LylI0f++PuiHjlOZmeK5c+pS/uI3D8uzsK
	ssVCVOlEGljPsUBoaKpgv6Qwp5qpVIMgbGOmsjQiZtf1f9XBaAiKldvwFxziXtllX9aBhfEzbh/
	Pn4gXeNjXsnZ3Axzow84uqyt+sMOOQivmfL/ncGCo12CswdZgniDdzOqiN8NhORLo4IArpISj0t
	ScCCtox8Hu+nZSb+phS2VnaShqeoFBTTNqOVwq/9qfDoZ2G5Vb8rWWBmheDDtFro9LnxESS6Ngy
	yM9EaXr49LSXH2PYkx/S6wtdyW34SPlsy8dg8wilrhPIDy1oMB9tFXwylGzwD/NFHTeBa62q0xl
	UwVlve1v
X-Received: by 2002:a05:600c:1f89:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-48e8741ff8cmr37216095e9.12.1778514092586;
        Mon, 11 May 2026 08:41:32 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8e3247sm64622295e9.8.2026.05.11.08.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:41:31 -0700 (PDT)
Date: Mon, 11 May 2026 16:41:28 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <agH4qC74A540koDl@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
 <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
 <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>

Hi Xilin

On Thu, May 07, 2026 at 09:57:26PM +0800, Xilin Wu wrote:
> Do you think if a shutdown callback like this is required? It looks like the
> driver sometimes does a MDIO MMIO read when the PCIe link is down, causing
> the board to reset due to SoC side PCIe NoC timeout.
>
> After this change, the board can always shutdown gracefully.

I've preferred controlled reboots to power cycles throughout development
and I hadn't spotted any major problems with graceful shutdown (which
isn't to say there have never crashes but generally I expect `reboot`
to provoke a reboot successfully).

Just to be sure configured my board with irq=POLL (to match your setup)
and still can't reproduce.

We mostly run Debian/systemd so there might be something happening in
userspace to sequence things nicely. However I have ruled out
NetworkManager.service and networking.service (stopped this services
does *not* tear down the network link).

Can you share a bit more about how to reproduce the problem (including
reliability of reproduction)?


Daniel.
