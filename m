Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619897;
	b=thSBTh0eCUUWMKbu8ix2qZFjX3MMhtpYRXGJmfSNRSUl1rOSFsfmQefcbrMH17mIHvdZ
	 CMphXGejvi2vNUsae+TTPB8WLes2ZIZsM1FLU7chY7tQ3LSu6j4u3uPn4jF3g8LkBhx8x
	 1I9XkixIzqewwgO3BwJEMj/4iveU6abpjwB0WFgezzwOj7+o1CMZV7WTD+jzyllusv0g9
	 gwDcIEu3E1qzVgsD0xG+6xo+Ehp78NEP+eKg8XFAAiqTC1lSXfhFyYsUuKdMBj/CcKm1e
	 Mbe8Ntn0O27kdKY5L5tpHHLKANDCYs8TwmqxbOs/FnagOIswduLTQItNoS6i6n/3YJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=vjlrFc8ai6S+8VJ+lvNd8+aoLJdpX9LDqDVung6V/EU=;
	b=NpqYOXIZZZmboMpExTE0RORvlZuZj59FpkGOgPnoBnWMM64W4ly4PGGplN8653hHaw6y
	 L2AH+E0aAFIzVTRTMFiq7VzedYYOO43NCOhVWhGqjj6x0Ozs1qnX4xR8f1W+tQI2rTJU3
	 dLRsqXeQuHNexfzfUk3g1+W90nTX/nPhayaTdigc6Wimgc/WtT/AnoXgNnYPgh31OTZKp
	 qq7Cf30EAFoKCGrJxeP8lcKi/i/XD8edp23UawkXtALfaQi8+k6GqRRsSZ0FQnIOaOOyZ
	 w4/UEQFD5ZdTXFozKaFd7KrB/PCoaAMx1XKd2HAUT2vABWwiE0M4TpE9D1jCtyK0vUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=Bv6yuU59;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B424C606A327
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 21:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B424C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=Bv6yuU59
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so1674825eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792619896; x=1793224696; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vjlrFc8ai6S+8VJ+lvNd8+aoLJdpX9LDqDVung6V/EU=;
        b=Bv6yuU59nd+Ut2wBNrms7x2KVr3ltVHDHJ9wPLhZWuAdYIXDzPPijQUJt41to4og+R
         jhPbJQy8Bt3WMPnwCH71termvOtenXWFlVGmgYa3HgDXbvpBHQVbvetndgcqIP2boZdV
         PsMkKFLYyn+sw2JrxhPKt6lLodquLrVRsXaQZV8G/YhIlJ8YD40I7vtJ2Hz9LZTz0X5T
         vQkDNz4X9LkJUGHY3wKYLOqAxfBAbS0WP+USYsoVK//cGczx5os1MliU4u0uz+XQjk+O
         U+aYNNgj0TJvz4y/VLuEjefu+wGRUxZrZz0aaWGlQeiU3kcqXXEB5h2ZcCO/JKVLOBxr
         ss3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792619896; x=1793224696;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjlrFc8ai6S+8VJ+lvNd8+aoLJdpX9LDqDVung6V/EU=;
        b=vshqoAzS8TcmbaApXGWJpALDkiP+cGR+wuCn3pKqBSMptNDVj/g7qSB68HvedTpsiM
         DgHAHLC5IOIUvQ3r85f9bXr9QHVO1uZAWm+lVG4RSyKGxBaDYj0RPwsJxgebnyWizl5Y
         rkl5KhkvvgCRQVrTKRJ+/OcNKw+FllXcRQxO+4+jVtE8fNRK14Ywv6LO7TUTW5RHs6gb
         8u2CkHJoiHVrD1zeN7xA/WZ0iYRcuX4FqHJLGtH5MwbXF5BJzZ5LTUZo+xOCXS4bEkOm
         uRdGg4mFEM2NZ/14ShTGWlLB7VYashc6X9aGLY5iKyhNTXa3FuQhf4e8LMTS/FoTQJvI
         7Tag==
X-Gm-Message-State: AFq9FYIcw+EI030uxkX4h8GPLTfuVM5MuqKQzyCcT2+opwytNKDc1PTU
	svTT6ct+AL6FQAwvXIOjz6lNHrB1QnmJX8Muyr/ZkExfrENomWMaOLTH4dbEqf02FZU=
X-Gm-Gg: AYBFou1i4h5ATmtoAKvXwJt4mEvm9D5Mor7S1uUZiVKQB8hsBhS5wMbtH5j0zR1XJIz
	uSA+6hgohb5lBi+E5JZy/UTou7KdJ0UuxuDU4ryi71cXA/tvEnXWPwCuH7PfELe+IudVYGgomS6
	lQX+Ez42MopwgtrLiimdeAbnFqlN44dFjwY1CtUTSkNQHIuq9LUa54l0X/uTTX6rAc78A15Kn1V
	x3NRd7kZeItz3sY3usnb8F5mrtnzs8RO9l+UNN1ZhnGApBdg12XltPIKXfov0xbJyDoFRhOpJz5
	z0oOdr5RX0EZFkhZu4TcvnGctAzwfFc8nLdlGLqBPEpAX/eQ13Kl8OYzx+5bqG2KBkWX3FOtSoR
	lLX6iVZcqviM0Dd9vmYdrEUS/Q0upWnafXo2qaQ2R3JezOd910is907mHs97oB5uwH+ZO5P7jgK
	qxVOCkKikUfNkvdTCUyD+rbvRDMceIe3f/NwpKntzbi3KH0nocmkWB1sMSPDWE0AjsF5XBLDgCk
	NE9zcbfrBJMr2fhlZX2IJmWSVqLathpcDzyhs2tZzI16zAw2dvZsa/j
X-Received: by 2002:a05:701b:4283:10b0:15f:28e1:7c7d with SMTP id a92af1059eb24-190a86ade90mr4009050c88.42.1792619895746;
        Wed, 21 Oct 2026 14:58:15 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm8941979c88.14.2026.10.21.14.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:58:15 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 14:58:14 -0700
Message-Id: <DMAUPUPEBZ7W.DB96YQGOYZAI@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <guenter@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Guenter Roeck" <linux@roeck-us.net>,
 <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.22.0
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
 <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
 <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
 <599f18f1-7ef5-475f-9ea2-9a2059299751@roeck-us.net>
In-Reply-To: <599f18f1-7ef5-475f-9ea2-9a2059299751@roeck-us.net>

On Wed Oct 21, 2026 at 2:41 PM PDT, Guenter Roeck wrote:
> On 10/21/26 13:04, Abdurrahman Hussain wrote:
>> On Tue Oct 20, 2026 at 11:58 AM PDT, Abdurrahman Hussain wrote:
>>> On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
>>>> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>>>>> Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
>>>>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set=
_voltage()
>>>>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling i=
n regulator ops
>>>>> --
>>>> Good that I did not just apply this patch. Do you have time to look in=
to
>>>> those issues and fix them ?
>>>>
>>> Looking into it,
>>>
>>> Thanks,
>>> Abdurrahman
>> Addressed all sashiko comments in v4.
>>
> Yes, series looks good. I'll have to wait for the commit window to close =
before applying it.
>
> Thanks,
>
> Guenter

Thank You!
Abdurrahman


