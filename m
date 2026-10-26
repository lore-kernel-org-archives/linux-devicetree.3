Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992609;
	b=R5stANkEHZur5CBlV681I4nmB+sxIcUhKmubNKppsOSz5b/kzUaPKc0B6AV0WvHY3Eoi
	 pma+l/q4smyYdUiPtNjaC2UswYbotxZlxrZNz93h91AOaF17rBkWXgbggZD4LcdEVu74L
	 sbBJLfo4lqWdTbM2PnYJv8rd98II4FtKQXaAWe8HTqdo9xsFqc56mty/G2WqRUvOaPX/5
	 ffd+8kS3dA/0MBD6trzENlmvqjZWNlG1r8noonoJwigkyhXzq45Ci9NnptDDJLgRP4jo4
	 CB+DZJaTGkKciOqu+Lr1rfh03r7GypBbVMJ4HONb5u9crhKCfZlFJVqtmH/MaQhUy0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
	b=btU5DAiGrNqIaK9ZVOMXPmoH5leGYEGUKtv69qqxFzDQ/XEpcQGL05vbepnBS8RHxeJ7
	 SP2G01AnEf05Y3dXQbipUG306OYP3TK1UjzWGjlpHjng2Fr5bifW2Ylgd0y0I9posYsVS
	 TllTriJO4YdoyhzGPNRprX8wfTNayv93k8/c6MzR7ah5phDlHj9qIucgS5NWEfJTazEsf
	 v2g8T99zoOHQXFA1x+4CfhcLpE3ORSK0P+49/rwROtn8wsmrILUojsyXkIRJBGE1Q5Ugi
	 /HICpvSbsJ0o1qSTH/kzrPCfF9Ae5045QHYezf4m73W/ws2GGV8yjmN6L5fuf4GgKnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gthIh1AK;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3DC606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE3DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gthIh1AK
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35d0be18c71so4428052eec.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 22:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792992608; x=1793597408; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
        b=gthIh1AKAU0A3AJJG069Cbtlgxlem6fGpkULCLsWK1TM7qt0L32vkm4SwAPpsVLD1a
         Zk8fsxIyOoL0yXA8LNGkT+UWyitP8Hdh3MUB2nhVWvwvTVwYxyfVMdGfYMdqf3Dz+EAl
         KyCQZM94tCvzVrcKCvLOvEEblmzKBU1nMInRbR4lFBmO3lXdK2Tn3/6U/HxOOm1TMQLp
         LSoS8W4imx/fQzIYVzdXoML4S/clFhy6X66qFSWkazQ/eFXqIZgWWWFJACbmdvCpl6to
         RDu0QmQB5lIHpCjEl0QCv1WQmBbWZkSqeD2c4QBmLATFw08ZlqSHWoSpHJ7R+tvJLnIQ
         SKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992608; x=1793597408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
        b=sngMNoyVlExR/Wou4SUo+d68xkBB3hC7NEMm2ojd6hUipLUYalpkTRCcLwqEpu3+t0
         OPJ5skqJdHCMTCsa/qhVXm97bIzE+NpfSREdnG34vAhh5Veu1queYS207lXdBs1MDLG0
         prfnI5iiWnTxHITvLoLwqvRFMzS8VdeYhqVktaIAO6/2KblBq7EDRUVR+EIUX6ew46g9
         BgQzgcsem0zW3lWyegd0qtSQN1p9NH5h5yz+bPNX+NnrZG+Omqe3/xZ6NPc/5a0Jj8n5
         jWI80lkiPEp32FnMzyMROaKieHbYTyHufjRubEjk7Qk1+q6LWaKIvMftF/3liq7pXzjg
         am6Q==
X-Forwarded-Encrypted: i=1; AKwUvByzWB8Ho0SPcfRKtXPAysBqq6KGdQVy1HkRUPNSfCoOqqlUruglQlNZ/NfbW8Bcqz6kEvFwiPZuLxe4@vger.kernel.org
X-Gm-Message-State: AFq9FYKg1kSequENo7hrOLy2+qlSDwxcANfVaOaPAxXCI2CPtgEt4ZqY
	UWQBJmbImyqdJHHqYd+VO+p5QjW7ym+RdHJBvZdCU9GxKnSYu2C8IXZXv9Lqa4wmH5M=
X-Gm-Gg: AYBFou2x6ik9y78J6Gg3YaSa+tvVZDitklGHEIS7ORaR7+aGvyjKbax4m7Fw+AqlpbO
	hPbvqGuKuH8LcHMEGdCOcDscS5BdAjZ1e4NsC15ztsvQW6xk3LsrDzoTLW9Yr9jT6LGu5VNM4gI
	EA0GOmknXH5NBge/JJI9ZZxTJlDpplruHc8ccf1O3/mNqiTKGAiqgF34sfD1fSMHs4zG4R1UDLf
	GcMlJw0TSOxOr6f1OQMvKy3yDIW6vspaCQ7jOnJUoId6VZMndcN5pKv5/kXIwe4xkNO8+LPFOul
	n+CsEDiawor5ummYGdpkTWCQAX0dndTX6RytkTrU6yt8wPZAHt2QoAAsndi+e7FmWATnvcOSF+g
	M9vyRlqNEdCgVOPh1KqKiH9QJZcMjjn6/7nyhh82s6sLBywMY+V0vcafGLaVh5yln4jIcTdIN/4
	bG00F6PBr1d3sZuG9uFx89CCFeRul6Q2Lwp8rSaz4D92Nec7HsggVu+E1wEQOV/hXmtdZk58yQy
	BNOqYHUlnl15Y0RXzczl9gDCsA5X+TtEOO5WBMIngPTjx85LpY8bCQbJQ==
X-Received: by 2002:a05:7300:c8c7:b0:369:f231:b98f with SMTP id 5a478bee46e88-369f231be73mr5481082eec.4.1792992607224;
        Sun, 25 Oct 2026 22:30:07 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm7075259eec.14.2026.10.25.22.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:30:06 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:00:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>

On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Every S4 speed bin runs the same CPU frequencies but needs its own
> voltage curve, and the bin can only be read through the secure monitor.
> 
> Read the bin from the firmware, select the matching
> "opp-microvolt-speed<bin>" property for all CPUs, then register
> cpufreq-dt. Bins outside the known range fall back to bin 0, which
> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
> on the SoC compatible and needs no node of its own, and S4 is added to
> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
> the bin has been applied.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/cpufreq/Kconfig.arm          |  14 ++
>  drivers/cpufreq/Makefile             |   1 +
>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>  5 files changed, 202 insertions(+)
>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c

Is it safe to apply just this one ? I can take this via the PM tree then.

-- 
viresh
