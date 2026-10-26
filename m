Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975171;
	b=5nxbVOPnp2iBPswIsRvI9h+2L9/4foF+3UPa4IiL++9C50G2JP9zO6luxxrlYgX42z8d
	 SInze0Zf5FKk0305vzx+0qnrU7sc56WTy7dSm1KDP4ztN7mcQprZ1JxhBmTlmMs800Gwi
	 rGPWUK1BpTY7O5OTccqFS980KufX/FBoRFVpke4D2CmL6LmRDjKEobAlk6KOe+ldD8xuT
	 yF/YphQX0grWwFcFcqztkb13WBlMt8xJwWs2THpXGCPXJ8c7Ok2Fna32A9kbl5rpjUQk8
	 jrFz9efWgUfDHSDwFfgCL4btCDGDh6ohMEKkyi3mLkt9XubFxcqqxAMaVJjT/98wRDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
	b=EwGT0iH+AL7NlkhQvFLBL5A1Bro0KOnP75QnFfuejM2sHJiourwQ6j7H0qN8JdfvaKmh
	 JdjsVadbzUCV/oJ7mjbrF3/9oru1E3bT3rqetmX9Ll+R+8OOY+2PCQo2m2WXOaz4zcU2r
	 7LBOiml5MY6aFIDfjzHaYzjDl8oOPyM5iZCVq/ZO6tH2C+7GHq/PNESy6OtUGqbfqfg7l
	 fJUv9XFZl7igWAG7NhqYw3OJsa3RDMPFT5m9OPe23Tsw1GigJkwBn6jBRcZXmsset9A5T
	 ulk2+j+sqVbZrSkjC5sM8r5wzipEcJZxKuFaGh9wy1YS82gvHNCAHO2+2OTO4WESFQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aev6FLvq;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D02606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31D02606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aev6FLvq
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06c60065fso1768118b3a.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975170; x=1793579970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
        b=aev6FLvqhWFM+boOuyY03GGCoU/Ug5rjw0gLbtxXmNUylCWl3wfkL0WbSaldF+nyfU
         dfvFllTQm0hL30ZePD2Ddt7E+oAVnPt7EGStphncddpuBymNNzzifiJ/WLUb8DrTIRgG
         ZXVC/L8JOm4bcf1k4qgbqW4CYmDzr+xkq++Ken+oidKtaNs5J/htPXy/l06AQ1RNQ7Hr
         xPrXeywuSwCRiP7EIwWcIIf7GN7gxO/pwvyd6dEOpAn14aIv5TlzkyZOg6AZSo4E5TwF
         3J4DdskYcOlJo7zmRe60MwRo6qiNpgTbJkU1gkhiWxDHzAd4pEqSUHY0mFMbK9fzjCrE
         hEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975170; x=1793579970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
        b=s5+tlO+elriZ1jnIoWF7ZGG7tuOcmzq+IUFrnWVY4t2XB4aftKoUWNDZyg/fb9EQCa
         HhFN1bQcdl3hFSMGp6zMq+8zuYTtlWu96y4VjWvWNTLDnkotP2szUfqvLa3xM4bc4xyI
         uabIQl+oiq+Jtlm9yAFPHKSuCJFdnUpQHzrKwLUBXcAwpxYcIUTOx/1Xjwh9G/75qICq
         rmrpo876zSj2GkdSVr4wCG0hO7vztPtr2m8jH9DW4RBNoOjDSCyLKIBmxKtAKqRUSCJK
         Gv0YYxLO75CVbJd6B2msSib8IeyEfygykk3514aQU1zesbdZR2tYHQqnL+60h+o9lAIF
         ms3w==
X-Forwarded-Encrypted: i=1; AKwUvBxfggMg+3W8t5tTNaX32XGhYRD1tym1xPy0YnGL91rfNyIldyivi23wK8dcoTxT4XlAN86gZetDfV5n@vger.kernel.org
X-Gm-Message-State: AFq9FYLiMrXaUI1iK3pSeW/tg/q2Q7VEHcan4lMwHi8YTzqgUgKhnFeb
	Gao/vemFokXTio8cevLHv+a+AJ00b7/toU+LD9V0lPgmJSYXoDdBBEOW
X-Gm-Gg: AYBFou2EgvfIxWsSQBGHn3jUlv0xZgG0JORpyUJ+NGsIUb9wApq+qGpa2QOwt32nAt4
	K9bcCaMU5BGoYT/LB7V71GuOEQ+JhIOnCd8AghrVRpAgicLazXL6TESHAwdKq/16CymluEZ3W1k
	c0PS9jUo00+fzKJeLhfHK+T4ea/VAwnvayXvj1Pl4oXnh5UIorLoFEgqvCa6ThlPicrWIFUbg17
	jhLHn6onbRfWTq5i0x/603FqRqUN83o0Wmx7tN7hp1jTw08X+3cXWQULEY++NbXazQeStZmLQWY
	/uSvfbjzZCCzEkh5uGBkf2MSvDAkqb32a4/PDdz5T7L7h7VSRO5NWnmANH1ri5Dmg+K8ZZtGY1A
	9Y0eTbAmGUONkGjXuqaJEHg2+vX2hvcJAPdkxZV4ySoIrhZtRMNxWNe6wKo0dipDejLg94TLmQ4
	lRHcVw7pK8gnm5kwLTbRb9bGrcbC+2MoN1L8l7mrnvmAxtx803QDcThx3jpn2Dy6ARWlXlFAGSn
	r0OSevaLTfddkvcxgkKK3YtOo3O8miSG2LeGkc4YCzd8ZmYwFq056VslCtC0L1oY4Pl5Q==
X-Received: by 2002:a17:90b:5647:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3adead4c290mr4014353a91.34.1792975170550;
        Sun, 25 Oct 2026 17:39:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa96sm6135134a91.7.2026.10.25.17.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:39:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:39:29 -0700
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
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525
 driver
Message-ID: <87895a38-c819-4193-96ac-69be7f548e8c@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>
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
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:08PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
> telemetry for input voltage, output voltage and temperature, plus the
> matching status registers. The FS1525 also reports output current and
> has an over-temperature warning limit. The FS1412 has neither:
> READ_IOUT and OT_WARN_LIMIT are not in its command table. Both read
> "KDT" from MFR_ID, which the driver checks before binding, and are
> told apart by IC_DEVICE_ID (0x0c for the FS1412, 0x19 for the FS1525).
> 
> VOUT_MODE is read-only and has bit 7 set on both: 0x98 on the FS1412
> (exponent -8) and 0x96 on the FS1525 (exponent -10). Their output
> voltage limits are relative to VOUT_COMMAND, so 0x0133 against a 0.6V
> command is a 120% over-voltage limit on the FS1412. The PMBus core
> converts them now that it supports relative VOUT encoding.
> 
> On the FS1412, OT_WARN_LIMIT answers although it is not in the command
> table, but the part reports OT_WARNING at room temperature, so the
> driver hides the register from the core and only the OT_FAULT_LIMIT
> based attributes are provided.
> 
> When the output is set with an external divider, the FS1412 reports
> READ_VOUT at the feedback pin, so in2_input and its limits all scale
> with the divider in user space. The FS1525 reports READ_VOUT as the
> output voltage and compares it against its warning and under-voltage
> limits as they are, relative to VOUT_COMMAND. Its over-voltage fault
> is an analog comparison at the feedback pin, which would read below
> in2_input on such boards, so the driver hides VOUT_OV_FAULT_LIMIT on
> the FS1525.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
