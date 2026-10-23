Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747010;
	b=q7bvhy/IhyYHVZXB4NPYk/8rvdQIXD1uo0r6wzrkyJD3bDt0HXZKne4T0wgWbRgpobPX
	 MYcOkFw+Jvuw5mNyz8WrYI/CJD4IKsy9Q0HYav5ljfXHSCpY1c8clsBwYrcQdRJqwre+z
	 eTpTjuVipeTV4iqctW6G+IXu4vZVVOlrdiViLvkQ/iTJxOa737nllhgyzZkWUW3LbLp3M
	 WU206rrfUYdgPMwF1qQE3rbV07Y3P3CLFZx/axR1VfQWStYkUT0jIym535vOjjIpPsYP8
	 D0/VX936iv4UZZWia8pNJrKDTQ0taW5e/lH88WqD29I8xvWZOIdShRrel9SPzLncOFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7QbAvKZlHDd3AEbAYJ/zukbrl6OsuWTPpYdirZ5iLSM=;
	b=MVP0gDwC76pcqjxVFVgYnf79CSz7IPoXnSqlAuCvp08Ln+Vr0JRVB1J5Q3gvNcdSjwAG
	 ShTfLL6Dm5pgn/TxwLJq5cV6MkxuSD9DR9GBG8QWbYmCgLIksiE6hD7v2bpJVWsvmf/+N
	 nPEtiUg56K6ny5jKXAqFDUUyOOoVqHB5tDTeVmZIab/I0yPC/RxnefiCCEIWVrvV/Dmsj
	 3lxd8r0chGb0ObKSq3LvtNUFGTt491DD8uK/ekxuRLZBPR3yS8wsGCMvhwc2aRUl2Ce/v
	 KS8dvIVTXrGjfMVECZOZUHCR/3z0m7mOe75PanQ/o5ys5KQ3vtu4nt0AhSijnwSg89g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mW+avd+h;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F5606A32C
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D84F5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mW+avd+h
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a210470b49so5196195e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792747008; x=1793351808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QbAvKZlHDd3AEbAYJ/zukbrl6OsuWTPpYdirZ5iLSM=;
        b=mW+avd+hjO8+1Rstd5HMROdiarYwWClCmO+5Kd4xM5ZoI3CKxiuXaywpfuOj6Os9S8
         groA2rZBSGzxCF4MYRQGf80pez30iNfMrhBRjFZTb08jpPeOqxcJfBnVLD4+KPmHrbwS
         kOm2rvFEl23NAbCROpt/y3G8MTyHGaXeV8yskvIvmEwxVp2O3TVbH5Ft/zecFQQc4SJT
         khNsF0eriWubmgTIwxXYAv58AR5f7oWNaonNlCrTIrfLZMMqz6SHEtnFIv4GKV6w+PVz
         AD7rxCI7/kxEigsMZvlFq0Fxn4dRFZR6+79WXXMCe5HU4rY/L9SWZBQ1T7nZTjAG5J85
         hz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747008; x=1793351808;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QbAvKZlHDd3AEbAYJ/zukbrl6OsuWTPpYdirZ5iLSM=;
        b=c/PB5lkNcOV3iBQmapdhjg2sJNHcP4Js1lG9kOiQkvLHz0aQ7HaUMeC5D83pbJOWv6
         IOXLVQWrkSNVJfjo66WDD33RJaVi/cVNrviRRO3cYIA5sdbTWugJOyJzEca5EuFg8e7e
         OqXmBRsJ1MnbTl8kL8TqEm3fRhOQJm+/udbTUN4hMRsVns5S7id2OKqFtj5aOGYcxaFi
         xS3b2HTBOdcbQR8XVo0sBwp50fbmBYT7ny04HJovfifXzSkv45D1U9LDVxuTh8rsmM4k
         wUWyRwxxLR0xqUXRHc09llHfFlFoC+NSRpM1aC0J5Y9+hFTPRn+PXsDusytcAkKPXz3H
         0piA==
X-Forwarded-Encrypted: i=1; AKwUvBy1KNhc+iXQg+vz8ZA4eSg1sKlUM/aEckRZkEMKe65e+4se5nXMcIQXxeAwywrC7HEPpx6j6D1PcEMu@vger.kernel.org
X-Gm-Message-State: AFq9FYKjENqYwGGBFyVhYSnTzOVBlVUQhvTPFhz+2+5Zyyn3JgDYP2Rv
	tiAN/IoqJ5cQBvjUy16ME507a/oz0L9WJ0WI16ehv+MW/vbw4CNR3vse
X-Gm-Gg: AYBFou3fmAy7oiLYGoUc/xVaUc/FJHAtQ478bjS0dEpljCfn1Wwnd32QRrI1yBHNEgQ
	CkZG+t9hfFgHaOmTM5lqdy0VWCPIZ0BBs92zwmlyD2suqff1f2ZAiAYpYPs0cAZsPQ3VFGjAKtb
	ri/QqWONiI2HJN4cEaI7aJTap/6ojNEgd1zWaLlzyUZTVWHkcmgIe30JWesfdD88ZAu4ZhZF+X3
	s+7EtlFBccrIe/9syNb305rDNzcOuixYln1MTy5QhPXcTLRgge4hdwOqMeX2ozdcq6TJHf+zcLh
	GaGRy7UecYkza1TOGF87AQfqwF4ipjqDzuYP38Kp4AU8oFITCMV+oPp/W3QkvFGOAR653cARSlx
	gUNruj+cdm5T/AByeE0N0HtTRVjpoDTfgZCsiXApoPlJt8ZBPQiYwF8mKSo0/Dm4gkguoVnssf+
	Etj1nHh1hX3ul7r7DI/6OY0xWmfm/pkUrQ9eq80n0PJk1LTSoVCqGZ5Ihm9ciWxcpbSeD9eBcmw
	qIkoAdKq17qQVP28o7xgqN/7m+Shfn8O9A4SDcZ6gXAOCyCPmF7+oa8yiZUvksra/llNajsU/Fz
	VYN6sNHj0SRLJDlEej+aM36icT8leajq0PYNjdOokHSHOmNeK87/SGEC7gHBxsvBZ+S4Ez+51fR
	HKHTwtap6hrzl+dIhT65oc8xgDBXwCMkqT8U36AqB8RXunJDNu4tetjBLF2lYlsKIfZRrWivHj1
	C3vFDSqn0G1dQa5x5OVrRJSjDqwBX4UYwheKhlruqHtNpoHmkCOxDWCH7tT7Q+kg==
X-Received: by 2002:a05:600c:c11c:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4a2167acde3mr10151235e9.30.1792747008186;
        Fri, 23 Oct 2026 02:16:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211ba3ab5sm55235845e9.7.2026.10.23.02.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:16:48 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:16:43 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jesper X Nilsson <jesper.x.nilsson@axis.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Stefan Windfeldt-Prytz"
 <stefan.windfeldt-prytz@axis.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@axis.com>
Subject: Re: [PATCH 2/3] iio: light: opt4001: refactor driver to prepare to
 support more devices
Message-ID: <20261023111643.00007823@gmail.com>
In-Reply-To: <20261023111032.0000019b@gmail.com>
References: <20261023-opt4041-v1-0-45227f82d05c@axis.com>
	<20261023-opt4041-v1-2-45227f82d05c@axis.com>
	<20261023111032.0000019b@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Oct 2026 11:10:32 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Fri, 23 Oct 2026 09:48:14 +0200
> Jesper X Nilsson <jesper.x.nilsson@axis.com> wrote:
> 
> > Prepare opt4001 driver to be able to support OPT4041. Extend struct
> > opt4001_chip_info with fields channels and device_id because OPT4041 has
> > two channels and another device id.
> > 
> > Datasheet: https://www.ti.com/lit/gpn/opt4041
> > Assisted-by: LLM  
> 
> This tag has been deprecated.
> 
> > Signed-off-by: Jesper X Nilsson <jesper.x.nilsson@axis.com>  
> 
> ...
> 
> > @@ -388,19 +411,19 @@ static int opt4001_probe(struct i2c_client *client)
> >  		return dev_err_probe(&client->dev, ret,
> >  				     "failed to reinit regmap cache\n");
> >  
> > +	chip->chip_info = i2c_get_match_data(client);  
> 
> + null check and return -ENODATA on failure.
> 

Just noticed that Andy was faster :)

-- 
Kind regards,
Joshua Crofts
