Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D47A363C46
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570779; cv=none; b=HHZ1YegO/jAVsn+soP3UquSeUrOmpVbtD3g5d+mb5bJhjNNcuvGLoPgyHXHftUU372Dw6LqVQDRmdxbKDzkc7EmXiLRRp6R3xA6DaA4XxF9G3dOHmp1LGwqomyrtr0HPVYNV9R5nL5nQNFI4TRD6lPz6BaR6I+06bKw35u08ao0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570779; c=relaxed/simple;
	bh=4Jl2TkRe7Npn73HaXfPcA4VVvCfEz91QC5XBElprxe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRNBJv/9r8dv7ohfG6pDYj1O8bOkLPh2ko2N37GjqFSjIBglQhCJC4fvcZzF4gz6BwW8iUWuJQX2Yq1CUeyEpj9O1elgEV9lWDXI37+/6vrSS4y8pCHy+z6Ma3iOdp5eu1cfWoJZWmvjLuo4AarC1PtOQQL3qcZoEUN3sUiKP/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgTrxaY6; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgTrxaY6"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so722844a91.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570776; x=1790175576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3xRnvj52pHagz8sqiex+4Km8FuQRJvZZV/xhDBA7TFQ=;
        b=mgTrxaY6AZiWnAmxzZcwig+v8VuOj+GoOmPuCoYjuUhhq5IIL+2Z66c0z8BGUyNlpS
         GC0E03q1m8DB/5qMetvoQ7lBrq82C9MkIPbwq6tLTioTeM0gs2wCRe8D1abga00n8eBQ
         znI5azqw95s170A3Lu6JWplgLcGwNxrw7TYFGUhAyOPjUqAZyO78aFCeUuJAJOEv55Bt
         K7daPg6vZj6QLju39pd63nVDsSdqvfvrfYnF7nleEQAjVGcebVQYb9YSfeBZ7k68hurj
         /8rIDxaLgHq4o5iMCc9wq8Fs0If1RRvtUwp/ZViZYfo7zAcb7dRpvVjL+u6g5hZjqu78
         RfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570776; x=1790175576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xRnvj52pHagz8sqiex+4Km8FuQRJvZZV/xhDBA7TFQ=;
        b=l4znSFViVCvZpU9RtqjP5bca93jOneMILLzx26pOqf3tGy3pQwU++TnD5vePvxhg5P
         vMv9a10MTWIGRkk040ITDbfkCoMhvIvg7NV7r48rTgsuARyevbDZq6q7BvgTVaATrs5K
         Dlsigf1siU3CjTlxv9AL7zh1Z04kiWtTHH9D90owgKfLJyqKpzTaunXM/52uDIWLfE9S
         VgI9dumuqy6KYc9JewQY74Vbo2j0zqg+1MHripD4ATj4vCnHd5HaLPE9MWwRoLpE5bBo
         Iz6onNLu1blvVEM1Po+OTpYucb3dEu9vvIO10C2ThsyWuV7xqLrOOop+vr/CSBg68u6A
         TkHw==
X-Forwarded-Encrypted: i=1; AKwUvByyO3rBk+EcQsOYB4GUfBfK6AfieDLDFmngHbGXN5E4Xjygjt72F5rNJqmrQRbCnXX0itSyAmpqwa1u@vger.kernel.org
X-Gm-Message-State: AFuF++nL/ZWG8/HNguR9zjJWKYGIAVV1US7jmq2Ts7Auw0r7KKAzu7ty
	Ntc0Pj2g6zw5RGsHPAwHJYOq9PZSpVg8fpnqjQZKNL8jMwFq2fwQBO9K
X-Gm-Gg: AYBFou1n0OIHVTvz47tdx8GD3SzuV4Zqa3GePPAh2raGtIJTgJKjF2M6nncFVRtUfW4
	CpSH8r9aFWaTbfCax/0HO9HEMWKnUGJ+7tTtSSIhg2g6W0I0eOJY2qYTuMrqVsL1CCt2oQ4Cu29
	e6H4Gbp9aQymggrXbg/ZFM4kZ5PlVbW1DfalB4Y25Prim9LQj0UJ1oBuSF0XKJx2ueLVUtSS2uz
	AL7Kmlokh68TNbIsl3JYTnlX6mZ0ak7MFnocmFhDR0qBcEEmDuwfDrEon/0UueBjBsodKLwLLlD
	aXVqbBrh2m9wn9PrbjshJrxBNchZ19SalQxP5Na7b2T7y8HlE/w6DHZGjMYcepX5mY4D4g4Db/M
	NrM62pKZm3uDmWpn4+3ehcNJc5O6a24XC2BDUfAtmwBsK94RKslXtljjevy6zx6uQx0aaN1f+QM
	2afm4PYO7XGZ3eKiKZ47QOJO+dZqSX9CC2LyructkWJ7a20iHAzZAAEALFX0s3vN9Jz0EZjkwgB
	vioVYcawHv8
X-Received: by 2002:a17:90b:582b:b0:39d:c3bb:98e7 with SMTP id 98e67ed59e1d1-39e1e2eb37cmr7040268a91.6.1789570775729;
        Wed, 16 Sep 2026 07:59:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbdfd89sm5159630a91.9.2026.09.16.07.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:59:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:59:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Senthil Muniyappan <smuniyappan@juniper.net>,
	Vaibhav Agarwal <avaibhav@juniper.net>
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/tps53679) Add support for TPS536C7
Message-ID: <7c73bd97-a3c5-4485-8f16-57b128aab7c2@roeck-us.net>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-4-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915164823.160977-4-sanman.pradhan@hpe.com>

On Tue, Sep 15, 2026 at 04:48:46PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS536C7 is a dual-channel D-CAP+ step-down controller whose channels are
> distributed across a configurable number of phases (N+M, up to 12 total).
> Whether channel B (PMBus page 1) exists depends on the phase configuration
> register, so the page count is derived at probe time.
> 
> Factor the TPS53676 phase-map parsing into a shared helper and reuse it
> for TPS536C7. Only aggregate per-channel telemetry is exposed: leave
> info->phases[] unset so the PMBus core never programs the PHASE selector
> on every read (and because TPS536C7 can place up to 12 phases on channel
> A, exceeding PMBUS_PHASES). Report VOUT in linear format like TPS53676.
> 
> Since the core never programs PHASE, set it to 0xff on each populated
> page so READ_IOUT reports the aggregate channel current, and verify it
> (PHASE can be write-protected). Fail identification if aggregate
> selection cannot be established, since otherwise a single phase current
> could be reported as the channel total.
> 
> A configuration with no channel-A phase is rejected with -EOPNOTSUPP:
> the PMBus core models pages as the contiguous range 0..pages-1 and
> cannot represent a channel-A-absent topology.
> 
> On the tested TPS536C7 (device ID 54 49 53 6c 70 00, CAPABILITY 0xd0),
> block reads of IC_DEVICE_ID and USER_DATA_03 return -EBADMSG with PEC
> enabled, while retrying those two reads without PEC returns the expected
> 6- and 24-byte payloads. Standard byte/word telemetry keeps using PEC,
> so only those two identification reads fall back to no-PEC.
> 
> Co-developed-by: Senthil Muniyappan <smuniyappan@juniper.net>
> Co-developed-by: Vaibhav Agarwal <avaibhav@juniper.net>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
