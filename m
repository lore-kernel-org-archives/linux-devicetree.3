Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474301;
	b=xgNfjWbqowv+YXz/wPFsPKxNUIl+ZkhTItRTitnWktfiLKAnhS9cTw+k59b4mrBhIosO
	 6e+D5ezzZaF2If8mMNsakP7oP5EscMfPnPQ/xs/lq1SBSH5DGUhpkWakQJvKu2lQuKAZO
	 4NwqIC1GUabgZU3tNT8JnRD3V7Yl7Pmw3aBttPer1EztYrt25qVWc1bxYjBsA/96/QPKq
	 JdcrRKsrGyPHOaSKauVFuIUulmSWGv7qKA69hoh+vbQWFD2NLg8MKttzS1h3CiEBNMqVz
	 8207xp3uQ6ShaNmt/4rQD19zStoeZeqMOcZkQBK+sSvXX7ocxu2W5VuQAB1INQPu7Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=ahaMej8DG5x+niwqDwGDjqEkplFHIH2ZYDylFYU9oY0=;
	b=bMvrY2ltfUNDi1hWWuEi+2r6AbI9JsI8/4EsPkXj42q0x4T3DuiYxDVr6WfuMGW3vlc9
	 T/aO8yGS9lRjw0brvHg/dPGLG+qM46yf00s6d64U3YalDMa3p1zLrTD8Ccsdtb9gS/uYx
	 jLxGcpDfh0FpXYNDlZQS3W4qKtNkOQK/wbvxR++/sREE1rb1R4+oX0UT9i0Un/FByGLaz
	 Kf9KDtwh8msJUs/PrEeiQPmPah9o5ZJWW0LQ72l2tXzFcEKRBDbsLJP4jGJ5s9W4qfulk
	 A77j4j6RFoXC8pNbRf9mLCaNQ7HZAQjYLzqnDmns4pZRh72gOkM83XmFCJefFnlFwTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRbfmsEb;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEF5606A322
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEF5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRbfmsEb
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so35357991fa.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474299; x=1796079099; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahaMej8DG5x+niwqDwGDjqEkplFHIH2ZYDylFYU9oY0=;
        b=YRbfmsEb/hQOGAmXBF7R643OZKuSR1qRrsgm7LHHfGRqxf8k8EwaQUaNDaegKDxgeM
         ZV4ML0hnBAjir8ppobqGrNENghuxdG8FjKejkD1JluhPwmDT7R3RXaKFkCA0e8UTYWTI
         3WVz8N7nUWxpT2By0hCJRR1sqLwKyVwcVWIgkPPZQOlsxP3/jjJYyzwJkdqlSUdxntAN
         92TJEQcfjbpud8ss9bN7pb9K6Ht01WVHRuu+++I8niqFgIqrma2h+vwPQyjBe+gpsBcO
         S4UolxbVHleBsrryCLTiSxVwBcDYdUtVAG6WotTc0lvQUVnfQ9NSB2NmOoM5Qf/eM2Cu
         GJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474299; x=1796079099;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahaMej8DG5x+niwqDwGDjqEkplFHIH2ZYDylFYU9oY0=;
        b=zP3OmHa6QUHcYjgu3uAK/35ujEDl5wE8EIHMzuWJ1nFuiFlrFeDpbFMT7IrlV2Ti3L
         zcpn63w4b9DzneEiluuSXAa0HS1xcM+Kr7sFib9CQ+pbl6zJA1wsgjnt9zIYWy+B7G7A
         erauqYLJJX2lZjjjvZF2w8V+nUYAX0AN8QLlJrDXvj6vL4r0bYxgIF8I/cO4m17y2Jq5
         Ibt2WMNBnikT8NHkoF907HQv9p3/yfVNlld4lkJtFA7DPXayo/7+uC+vL7A5bx1Zrq/V
         NVZPOjkC07JYxX781R7r6/0ZOyFCkPN+s7lKswb4cZ15eiveIxxtJe5FlQtF33vwLBM4
         xviA==
X-Forwarded-Encrypted: i=1; AL+hErHgGyTvOCfGkaDVWULieMZUBwzxUrKVtOhQmjy87KlqOa9GKAr0+BUpyJ3SDa1zclr3GCrP9cy75RrW@vger.kernel.org
X-Gm-Message-State: APuU4Z9oCkBMcwm6Uxb2UeCv6b53LapeBIjx3KwOkCZIYlmM0laV7Qge
	TYW5gYc8Uy2BpiFRdnas+qxTBJzTX0FDXS5tr68p8hHX3+DV1Z86XiSs
X-Gm-Gg: AZFdTZcolNQnuwLa3ZK+9LE0z9oPshraWLNbcOAJ6J/oiKu0bxD2wqGJ3jLJOwSWUCv
	E4gcRPg7Ea1HTZqVSXce6iNrQS+1x3/R5ZQnsmSBxc+Raqlq1OroG5vlAgsY2XJfCCt8w7IkIi1
	cfO0G0fjAcShwsD+L6AzLmwSFFyxe/qz/gqd/rohv9PAjIs08Ij5p0lN7HvxgqfmqaW2uM8QYt3
	Cm4W3nQDxY7fkRL0pmsPC+p3A+qQf16NYwMWbPz/cDo7wOvhNcA7ikOeFDoxquBSgYoywniGZz5
	aW9AWxZLeVJIlFdvfXSfMVtMW6g0hYjAzohcLvDuPp4K/rDh+7lS4JNpECnRzNpOi77rnTjO1Ki
	rYHuLRNSPrF4kvMiEz7vvowbglG7OvNfEFaw1x0q+vDLX3N+ZAySo3YzmCHys7EyD+n7vZiPy99
	+5JvuhCzJ2B3Zzd1+ZqGLg0iV4lkmAmXMgNx7Mxt5qTG1aBEKMu6Ie7u5g9S2sV9yU5OZ32xXRS
	Ew5DhwjloT4LaLlguZMJqe3qsVdEhqLuciXip6VmZRC4nGI76udYTcLs3hFud2cvJHt8eWZEFno
	ax0+QL8X1CygHlb6QH3KC/BjwzXBHoymVLgw5cur0n8E3oYKNwh5tyg=
X-Received: by 2002:a05:651c:a149:b0:3ac:e4fe:49c with SMTP id 38308e7fff4ca-3ae7fa65ademr37338301fa.21.1795474298759;
        Mon, 23 Nov 2026 14:51:38 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm36143811fa.20.2026.11.23.14.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:51:38 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rtc: Add Cortina Systems CS7542 RTC driver
Date: Tue, 24 Nov 2026 01:51:35 +0300
Message-ID: <179547429575.493865.18130205107556064582@gmail.com>
In-Reply-To: <20261123220804bcab0f99@mail.local>
References: <20261123-b4-cs7542-rtc-v2-0-31ab43f2cc8e@gmail.com>
 <20261123-b4-cs7542-rtc-v2-2-31ab43f2cc8e@gmail.com>
 <202611232056209fabb078@mail.local>
 <179547125963.75567.6386430167092445665@gmail.com>
 <20261123220804bcab0f99@mail.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

You are right: I used the core's calendar-validation boundary for the
minimum, but range_min should describe the physical hardware calendar
and its offset handling.

I checked the lower range on Almond+ with a separate Linux 7.4-rc4 RAM
fixture calling the driver's set_time/read_time callbacks under ops_lock.
The normal RTC core rejects pre-1970 dates, so the bypass was confined to
that test module. These six cases passed:

- 0000-01-01, 00:00:00 to 00:00:01, with raw BCDYEAR=3D0
- 0000-02-28 to February 29
- 0099-12-31 to 0100-01-01
- 0100-02-28 to March 1
- 0400-02-28 to February 29
- 1969-12-31 to 1970-01-01

The direct callbacks succeeded for the low years while the unchanged
core validator returned EINVAL; the 1970 transition became core-valid.
The module recorded 219 checks with no failures and restored current UTC.
The RAM supervisor independently restored UTC before watchdog return,
and fresh host UTC was verified again in installed OpenWrt. No firmware
was flashed.

V4 uses RTC_TIMESTAMP_BEGIN_0000 through RTC_TIMESTAMP_END_9999. Its
Kconfig help explicitly describes the hardware's four-digit calendar;
ordinary core calendar validation is unchanged. The source tests cover
all 10000 BCD-year round trips, and the ARM built-in/module builds passed.
The hardware evidence consists of the boundary cases above plus the
previous upper-century/9999 tests, not a hardware sweep of every year.

V4 is posted here:
https://lore.kernel.org/all/20261124-b4-cs7542-rtc-v4-0-bceefd844074@gmail.co=
m/

Thanks,
Fil
