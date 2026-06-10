Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BBB321457
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102332; cv=pass; b=Ugjm4JTivBp7/8eguUhlE6kuJ9kKCy8NhoqGP4wzMOGlrYy7Q5KaP4cEm3bs44Ff1HNnb/qjVjeoq2uyqGj39HgXXOfnXQe1sgT2dnYBgow7Jmmv0mTmW/RZfIOeAjvwKyheAB20hbQcfDMJVi1dIcpL1/JiOLximLCeMlcVgUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102332; c=relaxed/simple;
	bh=TsD6fqLbjN+M4IH/+2UyPBVix65pbcDAr/qNumQhZuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWjIMQhB+Zv9VTXsbiyKkJ2YNobI3VJ/l3rbXA3YlU0rmWN5f0hwAN4Pn0xcpRJNEbL4+BBXTTOP6L4eGg/WlF12vHkAGjBaBnh4/6gyDpfbRROclTEmB3s0IkBf+TvYgRMwgadWCF8gkDinW89UQV3v+PZf480VnmLmDV7ZNXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ir2P8Lpp; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ir2P8Lpp"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304fb780deaso6830249eec.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102330; cv=none;
        d=google.com; s=arc-20240605;
        b=fhCUlmWw37qqNKvQBVfTzezRIgOQVbwoSKNNXnyTliqWrkxYR3IGIezrTQ/dbvhMeC
         AEpqpCgbdM95N5vZO1HKY6l1PYpogzx2hc5vI177qR7Ep/+wTaUu8ThciQxKQxV0vMfQ
         Z6bS/27bhLfN1q+NMRAVulxOagyRPWKLE/UkSLqb4fpi7MGhHd/NT34Hp8W5pQ9cqfHn
         Aa7XS4SmMBMmU3CfHHv5o1aium7s1yiPheLxIiZQW1S7CN4dEyeY0jy7E9lUAX8obkWV
         oQ5h6pw2m6WzlW0WV5SrTJU2pKhO4yJG8gyZrOikwFXPKgLXKa66Ra5IuWyMjiTPkCR9
         miEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xEmfQD66YljQgfpm6pWxKEM84AHfr3eAJ9XCpH6lBeM=;
        fh=mP2VaVVI6swJQGj+DXPyYCEpNWHrehZuhny0sZ54Z/M=;
        b=KCiua+URkyMl9oWhLjoya06NG1f3J1wUthZob07w96f3e+eRP/Vx5+dG4714jlVPcN
         5cOGuvv+XAqUqE1EylM/1Kb+dc11XkrzmEdp2g7o18+g9dQfNqkpYpuXLgTzcvtVBunT
         3IR/dY97hPWm9zKvhuYYXMQrh+fI60/0pE5AHquonVTLQus7UU9w72/gZAwvvAOolZ20
         rBP0KEc6nieKoz691566ol1eMpwuR8WmFEJsR6n1D4QzaXaWjCcSe+5KkwJ9wQq7gasO
         WowUD9sQHjsFbwxYs6qtYo4WgFbddIsyL5oBIYTZqRm5ZO8UYiUhvaIWAhLjpSltOiZp
         MJpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102330; x=1781707130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEmfQD66YljQgfpm6pWxKEM84AHfr3eAJ9XCpH6lBeM=;
        b=Ir2P8LppCaNu8VO02fs6YRWeB3T/yRaOZNBvh5K3RY9ngGcc0JwhMi6GJO1txObdo9
         ueYjNMIUYdcQQyO3oDNzqBzhK0UAIGhHOaeley5PmLvz5/EGYezU0CmnA5WdZbkd8sUs
         tW+WdEE7cwZ+cTYL+ntvXVHPZlUbV8EENMNUNfoyLEVNK2XxLflzxhcVWgT6jhBy2/ZJ
         xF8D49TGlNDIZGVKW42urV0GzjFKtOZksfQ8yZXgXq9hzHCWSuOZqNi9lPvIYBLgdU0/
         pY9qIbDWl5qpGKRKZrb5KqWSUlxnJrAPcf3j14+DnwQPkXvZbQ/7smhYQZuELJ+t/dO0
         PfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102330; x=1781707130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEmfQD66YljQgfpm6pWxKEM84AHfr3eAJ9XCpH6lBeM=;
        b=INW7NNkw0Dbdzw3CzjfxYAqBxs3g1WtdZ/CqrOi2dT31QqIYfEQbn3KhcxcK1QO0hm
         kxUDGHxIQsHz1BLdPJ/YCmkf88KsGZLs/HaI7kBMjpWZv/z5cQdPyEbijBzW1BCWjAPD
         TdOi5kaN6KBHx/umdKWZjl1kBhr4meNxdSOmHz5duxIUJk2PuXuYWTl5HVbdtvfKr0yx
         4wIZtVrPEx+9GGue5WQ9IouYJgCB/aYxwGl4jkeI5A58sqSprD+DxasEMlXbiUlnN6um
         +JtZAe1FbXeqsBrmJtm1+jNNDwZOv0hhI10L1G6TB/O5IDMYMXNCdC+g23PnFrhK/Zue
         3gcA==
X-Forwarded-Encrypted: i=1; AFNElJ+2nd5C90EJyhWnT2R9KPnreudxplPiIuVCE2L7p2qS0FeUdtTd8odEEmYBzETm577aihOIa6Xt882c@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWBDoq7vAkymFtkEelWZpy7PGHoISttrWCl8r9NTzqLIWXVUR
	YNeEQey76IQug0aUbKcSpujpNtcGwbWFUkv5bKu9IqtylqnaXAit1V+NBOS52LH158wpheErYwV
	XXQIu5KPTlUZvhgBpI6gpu060mdBEXq4=
X-Gm-Gg: Acq92OEaV76+TC1kWyXcIefVtajxxhZAVpLZUMbN5TSuNms41EcWLLEFNo5raR8UFku
	FOBCJf5lqrrcM/duAbLG+jkMx44fcHnBIc5EnQ8xUFlk6nfQQR7yVkb/NsEGftAzzYhTc2RTVMF
	rPGXDpqCb0RuZCVP1oYZWz4yM0khd1qcSLxNLQJn6XzBbXEQaGLvspIZySR9stg3uNNXxJqrSi9
	xVzcpw0uND9CUOpFl0mFM4N+ce+eyxbxP4VWpV9icoB6WdrTUQWZvdbnJNoW1vtoji9IFKfxJyV
	T4ztoxXYqjxvrChQXE8=
X-Received: by 2002:a05:7300:cc0c:b0:304:e6f8:7cc9 with SMTP id
 5a478bee46e88-3077b1cc840mr15721596eec.20.1781102330361; Wed, 10 Jun 2026
 07:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-8-clamor95@gmail.com>
 <aihl9yIqN3adKWLr@ashevche-desk.local>
In-Reply-To: <aihl9yIqN3adKWLr@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:38:38 +0300
X-Gm-Features: AVVi8Cf09c5dRYmH0R9kJGLjsyEz3GTJujrRgluMHRMUhIaWopJLSUHlJiMgJFA
Message-ID: <CAPVz0n2+27QVeWNgPm3PH6V2Ceuym6sbMtUrh7hSHe9PcRmfMA@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] mfd: lm3533: Switch sysfs_create_group() to device_add_group()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:14=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:31AM +0300, Svyatoslav Ryhel wrote:
> > Switch from sysfs_create_group() to device_add_group() including device
> > managed where appropriate.
>
> This should use .dev_groups member of struct device_driver.
>

Specify pls, device_add_group literally uses dev_groups, I don't
understand what is wrong.

> ...
>
> > +     ret =3D devm_device_add_group(&bd->dev, &lm3533_bl_attribute_grou=
p);
>
> This will make Greg KH very grumpy. (For the record, original code as wel=
l
> but it already is in upstream. So, thanks for trying to address this, jus=
t
> needs a bit more of work.)
>

In the prev iteration YOU asked to me to adjust this. I have adjusted
and now you say that this is not appropriate. I will just drop this
commit altogether.

> > +     if (ret < 0)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "failed to create sysfs attributes\n=
");
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
