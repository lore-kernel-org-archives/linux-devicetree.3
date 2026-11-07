Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019407;
	b=hSDBrlh/lVqVq96O2RMPRXtpQeB1XpDRXPIN+j9s6S58IjRUFsXmvxIlL7ZMNqHdZlMw
	 mLMbhOfvy1T/Aq9S2sZoOMTNmNwRDBEYKnbonCg0k1NRp592yzdkOKFeRiA3pBRbE0/O3
	 79kJSed+70ZiULwY89g5IT2wmaWlaxG7L1yZWs3kmvAmXU45Sp2xCT9wYV6iPkwSb/dP5
	 yWYUeUJXXoi/kjy03AzQQkHFUoA8ZDxhBYSNraBTt6o3WH3wgnZYDLqOIWfgL9RfGD38n
	 eAmhZvm0HnZ6MFuTlUcQ5ggnlZvU8tUioJly2777ZZSqqshbuJVo3FJh3ebfbes/nKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=L3XFDNttzzNecv3QGeXd1n4niM2PaEt5ZDW6EFwUi3E=;
	b=paDrYuo2lHbqwXohCa+xGnqrmw8Ry7Q2299GyM1+tf+0Bz2xL+k36VLSdXi7i5W1K4Vz
	 y29sFq1M1PTJE9/Syh2S6FPao0ARPb/obrRce710SrevheRhpTJbeHL2mITvRhD6duFpH
	 5X/n49xTzw3O3Qt9a3IHOApOdcGj3REmHNEU4fq+s0IvqhgrJJqRB8tDWqBdnGcDz6yPP
	 5dckUuJYYP3WAPpRNJQR36gZANVEVcqfrhBqdLurXp3jlrsJjQjLK4GBNvIaezD2Xij/y
	 So36TN1tfWOHimv2KmXBuMKJL8JO3LMKkT6ObejehooG+Vh6Hkvmch8ppyreHiiPIJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BHJJTil7;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA41606A331
	for <Devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA41606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BHJJTil7
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so1359449a12.2
        for <Devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794019406; x=1794624206; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3XFDNttzzNecv3QGeXd1n4niM2PaEt5ZDW6EFwUi3E=;
        b=BHJJTil7BkphO9ZpdURTCMJFnvPMfJ9BUXh8HCw4DyHtItieJbzx2IKUsGD04hpUkD
         wOEAww5vlkQD1b41jJy3giWAXlc0f0S9pAPHk/NlFb5LfEfj3Nk0HoLHNqFFecriGWjp
         2QVdBY9LQAuyiwn9WQH8klBWGsGb2Kmtl4GJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019406; x=1794624206;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L3XFDNttzzNecv3QGeXd1n4niM2PaEt5ZDW6EFwUi3E=;
        b=WdnPMhRZrl8eqh+celQr5vcFyAeTWREowZnKLRuJ1VApNbW1jt7CPUqfcCFVI4CSUf
         4Ty+YrPL/qcg4o+Jxe+84WjrteyFZkTa0YY+3xPYWb+yHZLW7tDTiG+JMp8xHMydYfyu
         5Z0CElQ59YSDT1enn3/9JRBNZD2pPTLByJc3Pyz2JGaSKrOnAdr+Ud7KzVFGsPhZCSxe
         oMxRPqqBvFdbr84iSeAOu1lCOwqal3LnQD6e6T3YMrBxlx6n1bSnYktiDk6tzqBIuDqw
         jkSD9lzNX/V0K9wMX1etULe7IBkKoinj1h53l9/zMNqWx6dDHyC9DYCyWk3dl/WCF/Yg
         Kd1w==
X-Forwarded-Encrypted: i=1; AL+hErF2k+BN9Z8qyGO/adFeFhCm3By8slo5uaJ+3uyZWWPgec0i42xH+VEVbVuHALpj7FCYXgok2zKqYTW+@vger.kernel.org
X-Gm-Message-State: APuU4Z+y+YPWF8Up62QXAu1w0FXM/oxapttuo007+BuAXaiqlfbd5bTj
	PxqSjhOuRqp5m6lQwrVaabmmM6Irgio+TTE8J0rw284P8NjZaOKeMli7ptFPHx9LFa+PRzdvZin
	BeRBrD3p2
X-Gm-Gg: AYBFou3/44nxfUKuBIYwWogKJ1ZSgZihAaUo4mhUJParTOK4rbhTxessxFVo1IWPMyl
	r4uHLxBbt0MFkXX2aYCYd29poFHKnWY7gNzmJ7i/WBPAhVCAp+eztTWxuVkfOquuyFfb/lPM0ug
	FRnn0geohCPaFwmBwMS7BOrxYMQbZksaex9EjGA0gtKXEvqK1N52Qgq5+n5FKCc5vr6N7HhwIQv
	c8IWeMZwaYsdqoT4/iJQ+Ld3+L4wPhDuInI7MeqkPTZIU5PKPGN52mCJS2lsPAwX2axKs5gcPP6
	Mx9FXhyDmny6Fv1yqoER+lhU1fRjwTn1X7tKNBX4xiLbltUZWaXiUy0diWJMJn7Zu27QrYxU+Qp
	xcnC+3jhNOXmeuLCV7QLAy8JVWuyohXp6YvF5U1RkkXlAAZHb9gftfySeqYzT49VAegXnTGAOJr
	doP4moGNoJPN8BnxLtmCi4egRYwq8ZqQRYR2SuJmUHFsDQu9feU4gWfpn4fhyzCTT/DVwqMMv+N
	2aJQlk9SksaeGVFKV6qM5XCnnQAEOfKsiI7iIuIK0Z6E1v1O8eZXBwjkW6et4F8d++GGRJZr26W
	668dpw8WQNMpOTZV03iC738Ej4T5S/cmYK7Di3f8XDZAcDLt4eh+vW69tFOtq2vAvRU=
X-Received: by 2002:a05:6402:27cb:b0:6ac:87bc:8b16 with SMTP id 4fb4d7f45d1cf-6b597835d4cmr3037688a12.44.1794019405921;
        Fri, 06 Nov 2026 18:43:25 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ae569dsm1283524a12.16.2026.11.06.18.43.24
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:43:25 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49134c8509fso1040352f8f.1
        for <Devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHCJkW2al4msh28JbrsDh4BAjXF1P5zO/QdvYU/7Z+whe3owS6OcpKHNYgxulB2+ntP1pKmpdKbVq/0@vger.kernel.org
X-Received: by 2002:a05:6000:1866:b0:48e:7b12:aca5 with SMTP id
 ffacd0b85a97d-492c3cd30demr8053898f8f.46.1794019403842; Fri, 06 Nov 2026
 18:43:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <auhYb6FV2dPrbVxB@gractus.seuss>
 <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com> <aurMrnE3vD5eCEAV@gractus.seuss>
In-Reply-To: <aurMrnE3vD5eCEAV@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 18:43:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UXCnBoU7V--1Sj0dzODCKgYNoBBLHH7N+aGYWzbUdpkQ@mail.gmail.com>
X-Gm-Features: AclHuK_3CEM0gWgFJJsOTWsUfr9-4lxY43ohtI8iBZ2YI6Uk7KHCVe6SB4RhC7I
Message-ID: <CAD=FV=UXCnBoU7V--1Sj0dzODCKgYNoBBLHH7N+aGYWzbUdpkQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, Nov 4, 2026 at 4:44 AM David Gibson <david@gibson.dropbear.id.au> wrote:
>
> > +class Property(bytes):
> > +    """Holds a device tree property name and value.
> ...
> > +    """
> > +    def __new__(cls, name, value=b''):
> > +        if not isinstance(value, (bytes, bytearray)):
> > +            raise TypeError(f"Expected bytes or bytearray, got {type(value).__name__}")
> > +        obj = super().__new__(cls, value)
> > +        obj.name = name
> > +        return obj
>
> Thanks!  I do wonder if we're doing this if we should update __eq_ and
> __hash__ methods to take into account the property name.

I don't think we can include `self.name` in `Property.__eq__` and
`Property.__hash__` without breaking `Property` comparisons against
plain `bytes`:

1. `fdt.getprop(node, name)` returns a `Property`, and existing callers
   (including 10 assertions in `tests/pylibfdt_tests.py`, such as
   `self.assertEqual(prop, b'test_tree1\0')`) compare `Property`
   directly with `bytes`. If `Property.__eq__` required `other` to be a
   `Property` with the same `.name`, `prop == b'...'` would evaluate to
   `False`.

2. If `Property.__eq__` only compared `self.name == other.name` when
   `isinstance(other, Property)` and still allowed `prop == b'...'` for
   plain `bytes`, then:
   - `==` would no longer be transitive (`Property('a', b'x') == b'x'`
     and `Property('b', b'x') == b'x'`, yet
     `Property('a', b'x') != Property('b', b'x')`).
   - Python's data model requires `a == b` to imply `hash(a) == hash(b)`,
     so `hash(Property('a', b'x'))` must equal `hash(b'x')` if
     `Property('a', b'x') == b'x'` is `True`.

In `DeviceTree`, properties are stored in `node.props` keyed by
`prop.name`, so `node1.props == node2.props` already compares both the
property names and the byte values.

What do you think?


-Doug
