Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACBE40312F
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786480309; cv=none; b=T3g099GusoQFI1hWfV/3iFnEQkC1xl12AOA1rX1AuMPaEA7/OOPeLSmx/0EvBRgZQ1PGt4n/j8rLWxW7Mh40QCbs7XfJZwBw70MEOXmc24mlUKwdc6sa30svgC8AE9yFfcrFDnHBLNEML8b4BokLJAYlQNgwXiDMGO9gX+Xnj4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786480309; c=relaxed/simple;
	bh=55glILS0uJhCxGhmHzJrvqNOxv05p9rwglsO0kFx/1Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=GtrRwMk/OjTLG7VIVI7981xz6dU9iITXq7IL9EC1EFhvrEgdMg8mm+L6hNfWHgJ/xbNU5qqAfkLZiAFtJyerQ5SvOnxiLQGynXCmXc0Cuk8+pgz51BzVaHN/54GRnzRkpkppAZNKK+u7ITGKvkff6A54NETUAsp2U/+U5+6CjW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZN5Dhoya; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZN5Dhoya"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-76b3036d2d4so112193137.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786480304; x=1787085104; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jQXapsYvV1u8RmWHInXHPTUbHPYP2eL1w8VqePS2AeA=;
        b=ZN5Dhoya7R5+j0M2589isoVNKDiVkZXm7oii77nD5Br7EgcgxbpaOgZVkGFaQBeSvO
         FfLixuiiirv5uStRXU/NaWRjAp0OPvtaUpxlJZCLRf4yEpbK2ZmnBOaM4mwdF9ukYKxi
         vdrCIIQX4M7J9nmC+AXzHNh6zZrAnHMOqFzkvq0rOzWZ++6ObE6i90j+00XNbH/GZfeh
         z9N+gIcd4vTnvEBVNEImX12gJeoHNDC9G8lHUIaI4rI2IYyup7pO8KCU5Lf9JN1AYhDZ
         otQnU04y02vBCStn41Cjm9wMv3Aj/Q5a6STFQdCp2aIExoCRfyvyudSB56Y4U6h7JV3j
         Qq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786480304; x=1787085104;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQXapsYvV1u8RmWHInXHPTUbHPYP2eL1w8VqePS2AeA=;
        b=r+Qk4Mgv+uDqHccaFgx66c4Cq/bJqf8Erdij4KqVXTWZSPOehlGChyJO2hmB3UW7wc
         dZBKsHrwmFr1SktFYHgEVP4sFV0DT+sqUFIbYwHb+Zw7LTkYLh92nz70cRezSU8Aaj9o
         GjNYNYeCp83s4GAOFeXgrftXZlCYK45rbqWwOG5tOobRS5id1aaTybZTdZJKtY9cMaA+
         HvsLwRnwfKbV39mMm0mbCZW9CXsUW0wKkqQcZOCc7ge+VSheRnODUXIMua+uqhHeJOxi
         Uf6QBi1QtSDQ1UT3beA/70tlNT4z/+/sMd69ARht0gll7F+LelSeZ123ashjWkv+1Dd2
         4AHQ==
X-Forwarded-Encrypted: i=1; AHgh+RroLpjtyM6osO9PEOZ7PDvQs07ckTG3/BPN8PnxU7Ogmp1dqsR3iErZ9BRZqgaZhFcGOKKMK8PSqshK@vger.kernel.org
X-Gm-Message-State: AOJu0YyojfhIZ6iWPW+EjHpn59lETQvpNT8VnTwbs3nMEP+DBEyQy37h
	9U/kF2hN6rEL0OtsrBUV0ghE0p3f0O5lLJ1uA7GxVUU3+rMi0KF1cmsx
X-Gm-Gg: AR+sD13k+An1Rgt7HYJfYCrODf8YXxz/mcNjNv+I9muB4MZcjqb0iRVgqSroJ+ZYI2+
	rZg7HkPMmquQBq9g0GRfARREkxmTI/jSwQ7o3AVeq8RrtUr7CFlQSulGR3bNQKIDqKV2amzAUXq
	ghNpxsSait8ZleWnNRsEqZ+ulJP/OYmn31RxcKlbhENQcwNGkvNm6n9zX/ch6IpXTqqyOjn1RQs
	/fLYBSste1NS54ENRFL0NDT+cD+OxcAnh5K+YBTY3L9B+eg2NLOF1eHio0MMcwF2hN9uCbrYFfU
	75twX3W1oq99f06RHjiEh0KVym0FSg9G5+8uT2kCUWr2SCwQ8HTBcjr3NGemfg4uYs+DTfSl4Xm
	k1A4tIWFFv+jfo9SXyYHsN+AH8S5Zs1GTDl3d49ztKYGoIbXoT5m78ZLjXXrxzR2xs/Oxbc1itj
	8o0ZMHy6Pu6yXHKeLkXJDyGZhwCXtcZzu6l1bh7B2loH3zfVD5rSDd
X-Received: by 2002:a05:6102:1496:b0:763:ce80:337e with SMTP id ada2fe7eead31-76b54d84d6dmr1994826137.1.1786480303709;
        Tue, 11 Aug 2026 13:31:43 -0700 (PDT)
Received: from localhost ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b632912dasm1128489137.5.2026.08.11.13.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 13:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 15:31:40 -0500
Message-Id: <DKMEEWB5S99C.1AV3WDDKLSB87@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Kurt Borja"
 <kuurtb@gmail.com>
Cc: "David Lechner" <dlechner@baylibre.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-2-f89925d72792@gmail.com>
 <ad95afb4-e667-4290-8878-fdd7067f20fe@baylibre.com>
 <DKK9QWYHOBOT.2VD8XMZTE65H4@gmail.com>
 <anoc6axjV0uSXDzB@ashevche-desk.local>
In-Reply-To: <anoc6axjV0uSXDzB@ashevche-desk.local>

On Mon Aug 10, 2026 at 1:48 PM -05, Andy Shevchenko wrote:
> On Sun, Aug 09, 2026 at 03:26:57AM -0500, Kurt Borja wrote:
>> On Sat Aug 8, 2026 at 1:39 PM -05, David Lechner wrote:
>> > On 8/7/26 10:58 PM, Kurt Borja wrote:
>
> [...]
>
>> >> +		ret =3D fwnode_property_read_u32(node, "reg", &reg);
>> >> +		if (ret)
>> >> +			return dev_err_probe(dev, ret, "%s: failed to read channel reg\n"=
,
>> >> +					     fwnode_get_name(node));
>
> Use %pfwP instead of %s (same for all other cases).

Thanks! I'll use it.

I have a vague memory you may have already told me this. Apologies if I
forgot.

--=20
Thanks,
 ~ Kurt
