Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794572672;
	b=40kAspXZFi33z3P6bJi27wFmwPmeov1zLbvhqsOjI3Ah1a5Gx7BbXpqy2NCwj88KT5hD
	 nxZxxR1esgS+pvmoztu7QuI1xIEXvrVvNxnwsjYhg+CqFUBLxGCjXegd2rQk68UAN6/Z4
	 HjVgnSJiKAc/fh+0eqyycfxQh7yHBGZ/WzTUhYRG26jGd5O6NFblOt/P5H5FFhCed/ebh
	 IRcke2kYBBaaZCebWzSFwr5ORXl2YzSzQjR+fg7Pt0XsJ1O2xEC3a89Lm3Xxgk6n8v+q/
	 CN6jUKxQI7zRucN4UYn4IjpiPtsysloi1QoN5oV90mU9DOz0d10nWZqauQXBa95+g/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
	b=2oJirGt7zZPBxT0AM2Go51pfK/i4BLapuPbZKYZsfj7LFmx5WJ2HdPi6th5T1T3bkbSM
	 iRmGNZw6vsBvg/h9Jtn6XOmsEbGwQyyCxyv3Y1kQt1GrrKS06Kse7hbU2HtedSBwMmLhD
	 i04v/8VbG0JAsApgdqQd/4GqesUN6FhiZtX8amgIa8CzJe90/N4LVDbdABMtKGntO+aH4
	 2spgGgsbngcNn9B/FLA3FaKX8IB+PNUij5L5k8QJdTNZWXv4wQvvvHJZ1nb3LIRNX23UX
	 2oDfWyLWoHK82bzZ8kCH1zbccvsRyhZroCgQuUPMXUPTZTfTn6gprZ8z1e8X2+AxTrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ElxbnzGO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4EA60A383D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4EA60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ElxbnzGO
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so329318c88.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572671; cv=none;
        d=google.com; s=arc-20260327;
        b=MLBKO8Ba8YRmy8JJQFT47MWb6c6VwdAji5vnQ41vn+fCJelE8N5GmmwnXSNfr1AQIK
         +lzCY+akMyATyFUaoTyw4hnXgarWms/SPIGPI66LlTKBx1UYmf2Z9u8mU+5gNgKFq9BN
         OuqbyEiCetMVPtGObkdhX1bCoqBfeWpiTRRBswO5urIEEIcE6vzButyxP7/rNsVEUT7p
         ghfrtOObWHMTCvsug2favAwW5MaoYtIoNiN3Q6h6U23OAiQtVUUVC5eB1+is34xsnpr4
         tSO4tbsFw7OZRJkRlDMrw2Cv1aQvQrLcEz8KAxcfVxr8J16TNn/MCEPKkibKevuUM91b
         1aeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        fh=U50Y4ZMwInY8USiLMU+DgRxNc7WdtkmSg9enn8O6Q38=;
        b=pi2wqE7YLUhQDkueaOI34KPbEXogqdrUu1zDRnpK7pSM1ejG1ZoeNMluAXXCB+8zuD
         HEIEFrLRg5Ge2S49rrWPK+8vBIre8g20MD+fyFBh766qtsTZATk2Ul7popmHev2fQSoT
         lgaJQOCfb+ILErpnM9JIu/MJEbte23sU7PDzot7UpjD22GF1OSodSbWElW+KgRtECBal
         xabYqdsMsttwsZIwdToY8hGxEoBddflR6+nvGMYl62PSdkBEYJ8RaYxn7/74t4lI6yQo
         QTGccWrhyZDWs5mYAKvrxplUBDBZSFhdbUSZLS4fSm4Fi42EdLKT8mZX7ptvEedqa091
         VJOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1794572671; x=1795177471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        b=ElxbnzGOtU2NKf/45LZpX7xm8kXYQeP2jtOeAvXd3OMW40BOKvbtDNsnysfUxalwMF
         waPnHr/TALZINvPWVswP3Ji//vhwoWyVwCWIKMCC/If/I5KXsONr0CJZLB2FmyVMrj+N
         Hw/nhZRHaf0OZLOtkPyRKepw0DCN66HCm/qVrZI2FStIHGeYhyullHi5/Ix0rJezkRpj
         6ebi328c3+wkdpvYSf08rAP6s4ldkRdH7jYJYJe0rJEhD0toAfhtqZhJ9EEzM+QtOW5o
         2IKe60eQWf2TkVfdRdmKu7ZZYghHQ+hrdOtkhyVoBfLEPiCyJTR2tnUfoJQF3c4GaQ0s
         9Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572671; x=1795177471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        b=d6kQWPRv0hMIQk2wmnbsmaiGPJrt0kKRaibMwD/NMxhXoDBlsnKb66dbxoehNbU2ye
         JOIcZ4o5RLPEt5DF+GGiYkfRWyXQGzBT6pIVC7QGxlF1JohhuTSB5niEVJqvOFxmNXGJ
         A/MPlsCz2BCIOA4jjEjfhxRx+eHfcThKmtdolnPTV0qCIlLVGkQcazrVypfC/N6BLqxv
         FL+Hj91wF5EWhpIBjE4+ju317Cn0MOR9NgDhmqN504s7LW+ip8T0a4KoZmjycTXFc9HU
         dNw+24ZOnY4NEUn4m0yG1KgBt/ehSB3m2l6LkiXax9hEynF399ONb9f2BPSgn13UrnYc
         aygg==
X-Forwarded-Encrypted: i=1; AL+hErHdCiTh5yFHPFZ4E/o5hca4o8wCjKEuX9MkNM4EczLWuXg2+sGh+E5Lj/LiOa3f5HLiV6wlDRgxhO9H@vger.kernel.org
X-Gm-Message-State: APuU4Z8qkC5QqSb+ADERy/+I061ovr6UNXxnd91TgxS+iE4+EpNTw7l1
	3uqpG0DTBouyGW8PLJiadfaMQ6NaipD1nebD/3kbTgp1EvXkPdNuQ7IdXn+PZb+INlheC3jFWDj
	2xH89r5bhzHdRTrx8XuevduLb90fg8gH2hutcQyauiA==
X-Gm-Gg: AYBFou35mfmVPdftz5x/2J1Ach+3WoLI5fOxJ3IT5rvYXheXSsr9DXQKm/1Kbq+ZYm0
	WEd/PkRRSDhtfHrqRkrgKFzDpTgwklzOjZ8r0FY7bQsWjHZbXfxR+BtleES/7wbpFuJu7iP6LzH
	9jpT1gFPlxt1SK04JLx18Bi39mgvmYVSmqa20IuFm9DMBqRP8uGCX492/9L0SPWoneJGA8YYToV
	+md1cTfEfPKHm3h/NeJw6zvRhgE7Kr1GSz7z+86L7dzVaQ6tWz8NmySIDqm1UmZw4OKe66EUm1A
	OZkCi+SSgNAZYZme6WUAj7FL25Yzg8+yIZCHQV9qyfcnI+YdwU+ULQmKFdVAhDvOwPQV7gOT8qk
	XxCPqBpbEnVKLjLeqboFjYJH1vHiXpSUN9XjdXpM6BFXXpPc0M9onEp2k2CyzLkGiwjW1KHYbyh
	ZTjvcIByQ3He2tCcEM
X-Received: by 2002:a05:7022:f4c:b0:1b2:6cba:7f48 with SMTP id
 a92af1059eb24-1b50315622fmr2098905c88.31.1794572671002; Fri, 13 Nov 2026
 04:24:31 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
 <20261109120902.125242-3-cunyuan.liu@cixtech.com> <avLsAlL048MtIX4x@e142607> <avRm82TLBe6I6LAD@cix>
In-Reply-To: <avRm82TLBe6I6LAD@cix>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 13 Nov 2026 12:24:18 +0000
X-Gm-Features: AclHuK-6TzVh3nCVDRnwGMEM8YGOPOqHwZQu1e6cxT9cH1x835RSR9V7MLMVi7Y
Message-ID: <CAPj87rOi0+T7E7Kge4z-8L9FuCSTt6dCqT+9+YtF3wDkd4vRVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panthor: Add initial support for CIX Sky1
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, boris.brezillon@collabora.com, 
	steven.price@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gary.yang@cixtech.com, fugang.duan@cixtech.com, 
	daniel.almeida@collabora.com, aliceryhl@google.com, p.zabel@pengutronix.de, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
	robin.wang@cixtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Cunyuan,

On Wed, 11 Nov 2026 at 13:16, Cunyuan Liu <cunyuan.liu@cixtech.com> wrote:
> On 2026-11-10 10:03:46 +0000, Liviu Dudau wrote:
> > > +static const struct panthor_sysc_config sysc_config_cix_sky1 = {
> > > +     /* Sky1 needs these SYSC_ALLOC policies for correct display of GPU output. */
> > > +     .alloc = {
> > > +             0x00230000, 0x00000023, 0x00000000, 0x00000000,
> > > +             0x00523222, 0x00523200, 0x00000022, 0x00000032,
> > > +     },
> > > +};
> >
> > These should not be in the driver but in the device tree bindings. If you extract
> > the system cache code into a separate patch we can have a proper discussion there.
>
> I will move the eight SYSC_ALLOC values into a DT property, such as
> arm,sysc-alloc, and submit the system-cache support as a separate patch.

Whilst doing this, please break the properties out. At the moment,
it's written as 32-bit groups of 4 source+RW pairs. I would much
prefer to have groups of [<sourceR, sourceW>, <sourceR, sourceW>, ...]
than just the raw register values to be dumped into SYSC_ALLOC*.

FWIW, I agree with everything else Liviu said. I don't have a strong
opinion on skipping out devfreq if OPPs are not present vs. exposing a
single fixed OPP from the clock provider, but the former does seem
better for me.

Cheers,
Daniel
