Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876747;
	b=xjnvEWvPHvLWj1cUDGibk/lnMWfOiUneBvP8fEBYrUabKhJT8rE1oODEYnwIoSZrb0Zd
	 unMYMxqdJEi5mLAz20VeE3ChL0VuVIAtr5aQVrWL8mosNne7f7q23LpIK/sm5pS40Iyes
	 GfGhIX6dkW2JGRnaqJVMfbHtBr0yX2+PHYLc4cMH956lT7kb3D1yDWgiicBCU5A5m1xmR
	 rUieeTQm0XfRQ2VePUFvn7JA9OoJPBLDSw/7BWX+DGUJjd7nVUHvuWQYVr1jTM32mMLvj
	 5/DW9pB5vgJLwIlEQblgrZLZO9/Do6pNyCVAmj27CeDuXsTUixhH0JoLs/E9p2UjyiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JN0h7SeXPERjAEMznolQ48k3OWsfixBRlrh/PkvU79k=;
	b=yZUT2n77ERv60XbQDuLCHmWNIm+35a2mG2REDu2gEJCV+xhRWHi3GnDNAcM0N8+KvJbO
	 b3BwG+6xa0KaHxQk8dHF33pe3Gb978NYhZfwJRDzdWynZZ/mND9KUyPESKbxNOeDpVuMA
	 DwjdWKVjxJF63PW00FbQ4PJTYeP/zHM/DzzrozDlgtn0U8N1JUFG1loqCGIM1FjH5xaRz
	 5F3X0yS0V6xvp2KTT4LzeS5apKsd/Bir2T01xVB4Bme72bBKxZrUpw+6eqw1WY9jK++iu
	 iWLwopjkBsbXB8TmxqWgXYpDMf/2qE3bU8NWNyujahdcBE4LCKSs6SsNquyoNDuR2hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kws39dw7;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2631B606A32C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2631B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kws39dw7
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso755902a91.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 03:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876746; x=1794481546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JN0h7SeXPERjAEMznolQ48k3OWsfixBRlrh/PkvU79k=;
        b=Kws39dw7eQ3kZp132JgUegkj1UJMNcWAmDavCayW7p+4EzXtSjiMjpOu14eGanq0CA
         FR2oKytqK+Aye8O50js3m9AxPehTyjqRRKgWnuHrQdz8LFTrRiY/kHXDlq8EoJ8+mQ7Z
         kxWNltVLsO4JK8VTxMsjnwVZadW5ycNasCHvd9uM6IWwvEOwhI+hTAFyk6CtQU43/vaW
         U0DQp9Ab9voItrQzj4OqdCzXBBHjr0tkIPhOO3pxXnngVr8CfUiNL96tyCmEipjnRNff
         /UdJyJODefVYVMQv6YAY1rRwh4Zy7O5Ook2uh+ekNZaAI6x2uIiqJsZD0nF0Qyyi+MkQ
         N3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876746; x=1794481546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JN0h7SeXPERjAEMznolQ48k3OWsfixBRlrh/PkvU79k=;
        b=u7tPpMr6duxPMsPUy9WETx6vPG58PTgUSIK0wZA14zWukXCQl6VpxlIbsZnuDDuHx/
         YNWTHUpldQZ6w1OzerbBn9+MnXmux91Z8rTBQjUScJQnwrAg6oPv5XUXg2dWcI//Tty1
         PJ+PfZ04wC7kMYL/Vvq+G/d8vA4WJ350Of4dGoi6H1AQT3lovrWg4U+c0KwZhj3iaQdp
         OXvD6j/sP+jAwz3DXHHo6+bhQszzU9WD7d35kqO50mGwfGkKpR3/QtRPt8nfoS8zICPf
         Kkl6OzaiUadXNcZkiA2FLrtKFkMtNvExbX5Q6CC5tRX/PHCSDdtCiaFXmoPxrZ55P8Cd
         CtGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPu4bFw0a81u9eq8sj4ReNo2CWtoKEaAFFCvhLDv1Uj3YIXMxvCZbVr4UeV5AnNSWNK3kQSGa0YqAV@vger.kernel.org
X-Gm-Message-State: APuU4Z+mOIhfV1DKnJVER22FSKcUgCTVqDrSFcJPt1Yk678O4TB6SJHk
	xDmpNTX53aWgRwBOENLngEmfeXFpTxHGlD6/EdkPzk/kcmkHJMPdt9+R
X-Gm-Gg: AYBFou19yyQN9GL9eFdsBvMD5Sih3xDVRIGnl+cVL6U/gsua3I9RDav7jtTGbME8ZnX
	heqFxjXcOsrU0aJUnKlO41FVOO+PtD765c3WkqY3v2i8aCLUv/AbP9AD9XrMQ+1X8WNdyh5wx+U
	1cThRcC4rdrnHaCH7Mbv2719Z7HQMAMTQFHsInz/KQ+gcjmpXWrx0KxVKppuOl0H3mEKflEwqSZ
	UZ6R+Eviqh7oTApb4+q0BV0L1VA3LGLwE/E5MBXRPBDPgCP2Mvd73S0mr0lXoPvpO+LUe5gt6AM
	qTu/Fp7mPiK5tEWaXQpU/fm/2X2Bzfb7D4z/sCy1ToJlcJG6GaFSV1K3wgLCS6qCaODBiVpH1nm
	6kJNMbHPHiybsw4uAOhWhriClHnETLBZx4A/0vPLuZ4Qr6JlkjmxkquvSNXJzxID5mUIljzE2QE
	TJEUBTzClbLfJ2JjR5RqEJbl9EWJuPHbfz6UJicGoPao5bEMGox7DFGUZ3wdP9GUmfXLhLqTxaq
	AodPQNj3/AsuzEMNMyU3JOTHLiqsYFtuhAkrW2Pq+zTcMdiE68RvoqjKi/ZzpQbPVTrFHg53n/v
	VxDGMA1KJQLi317TDwrcKSmqH6iUljJeEnrQhAaTQWUGR4xPwGsmktPBy3rvrf2wWBM6zyJlKOV
	7gT8=
X-Received: by 2002:a17:90b:4a84:b0:3b0:97bc:62d with SMTP id 98e67ed59e1d1-3b097bc076emr4500305a91.32.1793876746390;
        Thu, 05 Nov 2026 03:05:46 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31aa128sm3474817a91.11.2026.11.05.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:05:45 -0800 (PST)
Message-ID: <67823831-cb47-42e4-8af0-1331a3f73ef5@gmail.com>
Date: Thu, 5 Nov 2026 19:05:42 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
 <20261104091136.151269-3-cwweng.linux@gmail.com>
 <ausb-YqIJM0mI65Y@ashevche-desk.local>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <ausb-YqIJM0mI65Y@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


 > Repeats what __clk_is_enabled() provides.

I would prefer to keep the local flag here. It tracks this driver's
clk_prepare_enable()/clk_disable_unprepare() balance, while
__clk_is_enabled() reports the clock core/hardware state. For a shared
clock, it may still return true after this driver has disabled its own
clock reference.

The flag is also used to avoid EADC MMIO accesses after this driver has
disabled the clock during suspend.

Thanks,
Chi-Wen


