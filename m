Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975053;
	b=mv/IC6LfvZHdVgm7smuJBC81lo4NRtR80gST2r5UMmQpdE3JtIwqQ1NLSxnen+GJpRCR
	 LApZ8e90H/Adu6xhB2ZcLlnWLrem4rmllEPWBzsatyFvmqsao339vKxBbmwWRFJ9Fhcpc
	 QWfudvZ6L3PN3VjGxkLDB+2oOoXjc15rSEWGYjJhvi8iICpuYEskIACbkYKhFNNngbdT1
	 r1rMivOZOyvFzvj9SEYqWgkaC6dJ31UXSisEWxDhWZEEhNsnpErREvtwk+vqeMlaEx6ea
	 X2k7jJUii9awTPOr0ZdZSC9Fdi2+rmoGtZjED6lg/aKT/yk6p4/v6PpCzuMAu+Y366w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
	b=y2ROGc9xWMDi/uO5DUlaSX2VqGxdm9dO7EjRyNWW9N8sfTK4yvkJdbH0vRl+tNWnjt8J
	 k79UW+JtLYAXVWEkr9ypvdQq0MaVzTQlwSae/jNeNDep306Xvi8C13xFha2x6USAclBhh
	 OJyCJP//FG7ACzQHruArv7Kgq4xzvBkZJxjuYMr6daua/c6NwNXHXgnseQuzTA7oJgkYj
	 ny49FeUZ50vh2udUZ7elP/uU9kmi5+1laAwhV/cvphvLXZyS9+HCHoWN53f0pQeY9AKCU
	 wk8RgeF27cjz3VPJNWuVNjO7/5jzR4oEKaSaWB+0NtspMu0anQUeRtofvQGb1Ny/VEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kQ4KO2JE;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDF8606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DDF8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kQ4KO2JE
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1798827a91.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975053; x=1793579853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
        b=kQ4KO2JEql3oihR/SCtBt1vJKCgrVRl25/fb2gLlEZFJPuafW+8/uX0PuylfUgsOeQ
         ZBiFgxQamRcLUW/InXMrst3KtjE4PFLNoUmTzwWab9UKnsDnwpjniuqfFR7LRGOSs54E
         NDBHGmnbJtXdkmD81sndY+WXvXwNHCUvdPBon1Iz5VJlwYL7PLSbJxnoLzmSJY72zX9u
         VDw+njuTy+YQhTtd3HZqwgQvEO0eQ6c4VExJt78JybsY6X3judkiVcwhlQCUBSLwGfSe
         jSauTJB8gN2PthrXekPk0v2YN0Trk3OUmhj9F0TzJyV4FcQl9D6vwG21LroJpTEuVOIT
         +0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975053; x=1793579853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
        b=VuzVVuz8NwS7hN6tMHCRkJt5ROQYx7HMpWchmEIeDfKIhyFLafcUBsZxCaIax4dOgA
         sfKbbH8u2de1K1Cp/dz2kHgZ4Bd4hxhSZrJ6QRMNE56JdwG5NA6Nlg4s7oH9Y+rQt3RA
         DFh9YuiuRMG4Y9+hQ5XTSG8TxSHvQp+ySkf7KMpqiNgd3y50ZWQITzu3+b4HjUFahhYr
         pduYc2Qe0/mW3djXHWxzcmYRsLfyhF0rrQ9O+/iLjKbt+arOOoAgpdIK0ZfsQJk+p17b
         NtsfUn7Mlrmot8a8AtcixLBpetiS/j6JPl96VjndlHvl6rpLMPL+R49LA2cMvMX4GumD
         asgA==
X-Forwarded-Encrypted: i=1; AKwUvBwfVuUiUTeg5gPIb0t5IaHyvM/7G36bWdfx62MqTwXymKpKXBmsEFs1sPo/jJmQVSs9mViHn3lePwXV@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1Iv34AIr4/RQjUnQKWlv8OgXbD4qAfr3+rY2ukAd5IfE+v12E
	G0nSM1zuIXr4E7U2HvTeDMZU5GJ/ulyBZnuzl8HM3z8mMlUjTxT1BpUh
X-Gm-Gg: AYBFou1PJhZzh4mAtOQxfXv2eqeKPIqSbu1XcUL+c5ngsGkyPTnlN5ej+zNyJx8wCSA
	fMLewaZZ51Rj0t4Wz4qZAe8/RDG6t9HOrMv9cTEQe4OpbTdGiBfIAof+MMTeEz8qJ1YQsim664z
	qeG1ZEi7EG/1dmlZZvGHOqmRRLhieHMKS+MVcnEwpXNesS4ZPwXj8u17QWzzFFyzrDSDYV0SfQQ
	k+A5PZZSb/czL5xYnoQhahwJ+Qz9H2Aba5TRS9Y8Th0UM8gJh92tFNt1edx95Oqg0TsTLiNTZpl
	PXsDHv/yaEbAEMyEArqz2bQguKKkse1H4HcJ+K59S7Jdb+WPV148WlWEDvqy5iY7nwGOmwLUe7y
	W961jO+Yq/MQs8z5CKpV+SSmzxUecm2BGSvM2FUIeFQ9HIOBS0pkxr0EU5Jyfl6mkDVeCKRgeNI
	WnB4soyHVW5DA9n8wbOjJy2zjQlcJuqmKfLKVToMhGNMTli2oWOoGJnEkh2eQoMm0VrEryn/mll
	M9TURvqKL/vZ2qeHUDux2UVBYJfY51EQihf/h/Fzk+cSMYoTNeuXAugne7kG6uExZhSlg==
X-Received: by 2002:a17:90b:17c9:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3adeafc4fddmr4768147a91.57.1792975052754;
        Sun, 25 Oct 2026 17:37:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae29c7e756sm600001a91.16.2026.10.25.17.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:37:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:37:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
Message-ID: <30747603-76ac-4032-b3ce-4e24f1a5f55e@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:07PM -0700, Abdurrahman Hussain wrote:
> From: Lars Petter Mostad <lars.petter.mostad@appear.net>
> 
> PMBus 1.3 allows for relative encoding of voltages in certain output
> voltage related commands. These commands are encoded relative to
> VOUT_COMMAND. Support this when encoding/decoding commands.
> 
> Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
> [abdurrahman: rebased; check VOUT_MODE for 0xff before testing the
>  relative bit; use signed division and clamp the user value before
>  scaling; reject a VOUT_COMMAND that decodes to 0 or less, or above
>  INT_MAX mV, at probe and from the regulator, and scale the relative
>  limits by it without overflowing s64; update the cached VOUT_COMMAND
>  only after a successful write; decode the regulator margins with the
>  register they were read from, and in relative mode bound the output
>  voltage only by MFR_VOUT_MIN/MAX, since VOUT_MARGIN_LOW/HIGH move with
>  VOUT_COMMAND]
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
