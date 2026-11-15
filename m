Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794780859;
	b=kQGd10w0n5Dv/UsI0xephbcbl30bgMFakZ/6eZF8+0gppLshAv19UQlmA648k51I4vIX
	 ob3UvSNmC4rGhn+dPvt9ootZWE50qf17Eo3Qfa+d4Mn17cywd1hsPro9fgz+Ix6k3K3ho
	 b1/ZGPTsQgTtzeFhqzgkIHD3pQmLojYbVO1eHsmRkpESHvKYEp1FZ+si08+GbA2Sl2z2w
	 TCmVtdKwkkDprGoIPaIE0aEjbpDZF+QkzchXx6kk0IQ4oHIl4GkTHjeTL2Kar2ZlXir5T
	 DvwnnJmrjAFWFSh26jcw0eUsxySqWtxirwvHpDtttht26FEV3Nck4xw6E8am9iDKuUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
	b=HbAeKtvOUbhmqPChI8+HaQmsCyPrgduXJakYzi3gmHUXuJ8l1QKOWlHWwzw0+ZFsStlE
	 TcourWwlYZyG6K8VebSsqKMMULqRJQYiH2ndRHhT65oWCUTmckPSk0gyjRW6X/lvrE3IG
	 9YpIm4UwOdo/HIO9LSMtMkHVh7hOMkleOuZyv/09oVPQS6ol0eTA93yLiJeDj/9FmLU1e
	 Z5saL9ZKE0+iCkIA0F4FL85gacV3ewQgcyaO8hCzNljBCkTC5bVCqtLZ0PiUCtV7YXC2e
	 2N6SHam5X8TWI95wcjYy2TFb3e9/wZHvE1Y+nOyRY+973XTajiRuUjl8WduBoPBheFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=vsbtJ9cl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA81606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA81606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=vsbtJ9cl
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67db8985419so287828d50.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 14:14:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780857; cv=none;
        d=google.com; s=arc-20260327;
        b=ab/Hi+qBhf7jqQqsTzto/FfSYsROSUbCsWbQ0KYbZUsrrjgbZ/KTDfuzbiSEE0pIXx
         nQk0qz4KpXNl3Ku36QmcmiQ/NAXUZsDUkgD7HzW9F0JKqhp62zkYPOIXqF/3ZTdzkw8d
         6SuHGNTw5bzXDzV793kgN79bhnE1byWFJXurrL8ge2H6uC7M3w0p5/smiCBDrpad7P9G
         3t28glT118rJR6ISKpLyvKJV/ySiavXWwlqrdmaKkbUXa2ecsm/RY2eKBn7phyjI5S3q
         h+qCe6CkzLIS6ncRiPJjs7zpsgP4UkBT/0l4PcU3pM5qGFNi3qpEVeNWXidTECE8WkaJ
         eVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        fh=Vl9gJ1vMDAy56Q8VJV4QbTvzToiAWifz5s3UYrLt8DM=;
        b=Kp3Fbtgxa5GrShf98bmZO5pq5vVbYQv0Nud8rV+2pjbURnsfaT7MHH+Doz/4lS4gPX
         yp68ejryfNeD1eQbFsQ78Q9kM+9x7EYXjWJ8UomJSUQLDBnyAwAbPPX+ks9mwlTYjXQD
         6+oPQUMCEdyhgVQp8MOOc9JxFHCPd4Jaku5mhVKFUFd5hyO7VK8/eVbd1QmATlHUSMGt
         bCFhBT8kXb2+uQaG5oXHHICwAGJBukIsbMduqlfDfzBBhrF6owP4DvkVXPHqVEHuEWRk
         mrV9uW0EUkBhfcIZvaSzLldCEBIxm8vX+3kSfHyD0PPMoBrUUFlwDEU/w0vNZGsBETto
         LFKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794780857; x=1795385657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        b=vsbtJ9clm8nCYaPATTnPA3JLfKioT9Md4IUGq4/CVtMGeDoUnnPaeuEG/NV8i6/mLZ
         DKSBJm8dsAVm9R/leRKzUT7O9bJuh9idzY22HZ/pOYHy2i1muBTO4iCjEm/Jvx2A6faB
         jcxy2OXG4oiUgjnqVdwexSm7ffqu2N86/AnBaAL5rDwIBdj3cScB6bcmUbaP+8ZmvsJY
         Av1T5mCRRwOQD+nwKYfpG0ZeK/GQ+EPAUmhi47sogyxVxMHkXqhiADPp2dqrxEib3bkv
         PNF/WsDvOfA7DehaQYRAlOIWb9XViqp5JDVlwbr8ae/MvmuaXKFaqqfKVUPXDU/sjFec
         JttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780857; x=1795385657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        b=OOSYFVcuQBaKOYxAtGCi6JJvgUunP0DxWv2SblExn63OmMMFVnQEDg9y6+QyIA1xDB
         5Wl5npU3aFUWEI0TDnSPj/ans9n5K+No7bzlnZRE2ThvSDX1W+H4lqF+nFmqJ5OaxNwP
         KWJ0ph6yu6g7mi+M7QxAPPTW9k+2crAGqyuugx3l2XmBVe5Ws6+FcVXhXShRLF5R87jP
         6k1nEnNLX6PP01XmQtIOsVydsYamSR32Bgs2uWYwLW/FrFHuEYp53k5inIb05x9A/OcX
         pihtpOEzadHxdcmJnnhwpXLOO+DKE4ztceEwgdQ1k11vJrqDz3Qa9dsrAn87O3zldDFy
         JprQ==
X-Forwarded-Encrypted: i=1; AL+hErG3mYJC4fdcOGQE2X3YJHE6sWaAex81VaQEtEBJHTYvADkJZsV8sSwJEmxqEpaUN9exgCmBDk7sx0SO@vger.kernel.org
X-Gm-Message-State: APuU4Z/L6sFSF/VFG0EIRFN4OKXa3HCEf7D4nnvfSL6HZJoVxk+SG6w8
	e+CLss9ODASI9DPtZq09zkGkelmFlbIiEMD1TIYdpgHx91CivkRX5QXleZZQHyOiBS1Ngwe5EUk
	gGZjA9Kf7nGsKd1pYf997ii6u7PeeyiwOVubZ
X-Gm-Gg: AZFdTZeMhO32f5W0FySQd2j01E/kFFe/IWJTN7WVoo1VaxYaLnOPI86wfKT4CuH0Nug
	VCCmrN5S2NsOBAgvHKygNZOBT+CAWIg23IpHOGjXt/BC/LUhQNGZQp+0cNHrsfv2vdJh/ulAqUn
	qiyJ8fmnc5pglOLexb/AClK7mLIqYV2k2KHdDTIYhZGQ12EhFZkpnSTba+zHhrIa2f4T495N/eI
	ZAZFJWObxIREhzy02hmLzzaLA8OOnFEgQW9rUESs4paWBnY6QZpPiXkqVDfMyB9XuO/UQ61nkug
	ag7N6904hv9lHuS0c4R8nA0C8TPtcozSIYV0c5+qNT7er+2cz704HPg1kSZSjsOmPaPiULhsU9O
	KQZZAn35qbadw16LTzZEN86A27GalvYiywpGwEE/+dmBDu5wC/C3VzmCytR3xpg6hStz7dg==
X-Received: by 2002:a05:690e:4383:b0:679:f97f:fdf6 with SMTP id
 956f58d0204a3-67d896a8f2bmr3982114d50.66.1794780857112; Sun, 15 Nov 2026
 14:14:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-2-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-2-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:14:06 +0100
X-Gm-Features: AclHuK8Jibqkumh92MwUwV6k9LdMNZ5aOXfzAlbMwGyKMualpiO_cItbFylPmew
Message-ID: <CAFBinCB_Eam76VJWSWSyLRsnzXOTWohrE1NdqyJ8GhPFjWzfHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pwm: meson: Add optional bus clock for S4 PWM
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:56=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> On some SoCs (e.g. T7), the PWM controller has a system clock that must
> be enabled to access its registers, in addition to the per-channel
> input clocks.
>
> Get and enable it with devm_clk_get_optional_enabled() using the
> "bus" name. The clock is optional, so existing SoCs and device trees
> that do not provide it keep working unchanged.
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
