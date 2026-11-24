Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497884;
	b=mpM7nQ1dsMPBf6F6NFbx2fmCxg9pQrSBeiCzn9M7aYf/Zm5YWiQ2uZKp9iOjxg7nJ9Ay
	 7o029PnMsp+6+QDkkRGyE7RTTk4bLDqZiYdLN+OfJgJOZoGnwVxD6N1zA7+YK9HWLh/Z9
	 h/f8bMkdg7ERD0hxjZh1tc3zP/afljksMessfbauwTOBKy8rKxcEKKKVEJMJkFGBda4PN
	 TArDsBJWOaOBCYLe9s+QyUp9CWGQb41ieaErldrEoWCJGxnDOIo8e3uS5VVImRfQTqvzp
	 /P3UmbOJ/tlXIUwu2tHvHnpccyzK8pvt0lfLt8nDD3A8lHU5uGOCagh85p0T7L8yx2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497884;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QzR4znUpHkFQ2LRl3l50Okic0JbJkrnumL2Tbt7Auzc=;
	b=V6AQ5F3XQLczSYe5pQEpIHYL8da01HPCxf38gu0xAcOoxePVXunH8PFRw7u+Tk8yoeV4
	 PGVmrUA3Sc2D2pUtxCqLT1per0oPVa3+lieJqaXf1D4QKTITTbg5OK4QfBASciHEsYmD1
	 kE748M0bLfnqMxaww+URyyAquuC35YQPoPtl4mpv2j6SXvbMkfItfNuWEQJAB7ZRSU9fw
	 msH5DfT2zH0ajdvU4F9iry6brV7LCufNmI4JtDIeor73UlZYgqHNuS0CCR3uHEs3EfCEo
	 UcGEraEXetxvAc10v368bil1QgYtiYJ4Dn5AvBl/7m+CustyUv5ex4z50tkj2bPdLXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE04606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE04606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67da69e7c31so4271216d50.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795497883; x=1796102683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzR4znUpHkFQ2LRl3l50Okic0JbJkrnumL2Tbt7Auzc=;
        b=qsi/46smnbM3Y6kwpodrX/DvkxVArPFgId1TOsbDV9ql0H0QAa8ShzDaFgtWiOFTdr
         ddSFTd/t9KH4CrPZt3kaaFtmix2MpjXeD7VZufamBw+k6vp3hq2hLj/4GwEKWqi7faVb
         mKXPA1CCdi25BtHyT3q7xnxLirTpk06eupO0s5H/DCJYSPDGg1Po3c+RTB1ahFPFwOcr
         zr5LgfrVRmEw9aMjYQywlJq9V+tVGDzU8ouygcmblBeiE/km8kApbRIhBXltWrqFMfmQ
         AG5c+LtyVwHZs0aU688s2e4HhfOqe9ZFF6mbkjfIEF3kEAfbvrnBPTcZZv+vTzhiQ5Ic
         NFdQ==
X-Forwarded-Encrypted: i=1; AL+hErGPvUqBjDAMItJlBBACow9lLhzIovNhHrsIf7SVnTKxzJ+NqNmFsCjC38PdCSwpejs0QTji0lAB8qjS@vger.kernel.org
X-Gm-Message-State: APuU4Z/1SXk/8nuLPXlZvWxnV0Q47nftzYGJIsiZ5/ULiWbqLx6RFlED
	7BDhA4c9RbqOkVCbSIX0vgZMTDK7TfsfXb2oonM+yrYxleGXQJLLkX1W
X-Gm-Gg: AZFdTZeT3zrMzItQ14/9KRABE66H5HC42j8luCz4PcXH4R6NLM0Vj5Hj2r9qJPAQrif
	1qDAikRc57NZW7yXVXLy8kUeWx7HevssfuUlLAhXgbkIqBOWp9neQSkfoZ6sPUxFvNfxd5y9spU
	8u/icKAtVdksUXQqhUBr0Ys/hvWv4vBGKoRevNIW3cHhetchKGsDYcuDmYF29UL9odtNjpbe9+N
	p7p+x7eU7r6VEY0UhLEuSswTT8fxGTxhID0qOmPDq4IT7yuAPWi0Tfhj3B2ctNOzgN700/bxeHw
	XpdHBIBu3FTusP246oPO6lBi6mAx2QFc8qkFQotbIfDThpTCFvoydEsgIoht6UE9tcEki5aRwwk
	vKZo92UURCHGGSLe3AQYNOTosj92ay1+jHql9baHOXwf6CmlbEt7Izul9eC7ulSP1AFJkmcwQeW
	dvu2eE9OJct534wPVPw52P72me/5w/K2LLITEkDai8LXo/L10kGaQvijoC5MTkpgyO/AAG+o7mY
	CP1Fbbg0d72wOCHfjwOy3Mfq+o3kB+vzAyNvku7+ldqcw2h5KBABQP/tQTeVbLL0Xr2u/y8QNWY
	tsUmejGC9kSc6GdTRrXXqUcDeK5mNLPnioQMBLjQZ8KLJo8mCqPTI9zfBkxqPPNpxa6xhPBSeSs
	0l5OSSGBHNu/Lhv8qe7eSpG37qPwOcZmC7ID9EVfaKkd+ufgP0iL+
X-Received: by 2002:a05:690e:4893:10b0:677:d1d9:127d with SMTP id 956f58d0204a3-67df45025ffmr3481264d50.100.1795497883474;
        Mon, 23 Nov 2026 21:24:43 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df335b3aesm6545977d50.12.2026.11.23.21.24.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:24:42 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: sashiko-reviews@lists.linux.dev
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] clk: siflower: Add SF19A2890 clock manager driver
Date: Tue, 24 Nov 2026 00:24:41 -0500
Message-ID: <20261124052441.50277-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <sashiko-outbox-230534@kernel.org>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev> <20261123-sf19a2890-sysm-v5-3-4ba44a0db17d@telaak.dev> <sashiko-outbox-230534@kernel.org>
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

> devm_clk_hw_register() runs clk_core_reparent_orphans_nolock() before
> returning.  Because data->hws[i] is still ERR_PTR(-EPROBE_DEFER) during
> that call, any already-registered orphan clock parented by the last clock
> (CLK_MUXDIV_NPU_PE) cannot resolve its parent via the OF provider and
> remains orphaned.

No clock in this driver has a late clock as its parent: the muxes take
the PLLs by clk_hw and the oscillators through "clocks". An orphan in
another driver that looks a late clock up through the provider is
picked up by the next clock registration, as with any driver that
registers its clocks before adding its provider. Nothing on the SoC
runs from the NPU clock. On the GL-SFT1200, clk_orphan_summary and
devices_deferred are empty with v5.

> In addition, of_clk_add_hw_provider() in sf19a2890_clk_early_init() calls
> of_clk_set_defaults(node, true) while the 17 late clocks are still
> ERR_PTR(-EPROBE_DEFER).  If the clock controller DT node specifies
> assigned-clocks for any late clock, of_clk_add_hw_provider() fails with
> -EPROBE_DEFER and tears down all early clocks including the CPU clock;

Right: assigned-clocks in the controller's own node can only name the
four early clocks, as with clk-eyeq, which publishes its late clocks the
same way. No device tree sets them there; a consumer's assigned-clocks
are in its own node and applied when it probes.
