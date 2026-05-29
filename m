Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100DD2D46B3
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059158; cv=pass; b=szT7szXFSH2R6gxrAuFFHvS63jnjuDKVfEx+exReW0txFC2b8Urrj/dg8zg6Qym9BVPa3he67D2zHCwT5k+Sp94ixUEn6S2WvB0JYCpBfou6zRP3qnVVYQPayFLXL+Q/u7fcVy3yJlY26QH4GJ/UChBL8pwjMHAUicF2KhNBvrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059158; c=relaxed/simple;
	bh=YTKSyjfM1aCnF/fsctlBeRA3k3Js+B+P61PpTYUydDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcY/Si6e+ok5nn5H7g73ixFoCY+OG2DEjgbKx5Y2KivORJXnLsg8H7VEQFvoF57cY6fJT458S4q6QTLwzJX1D8Dte1appZQILGHvP/jbWYcYePV0EVEcFuW/DAl6hfIUsEPhxXuSNYUlsjbq7kyZkm0uYTC5fokePN8x3OKdoWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nP5RzSDt; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP5RzSDt"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304ddfcf72cso1645931eec.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780059152; cv=none;
        d=google.com; s=arc-20240605;
        b=ixm5BmbYcIF05pxQo3gVkFVOVfe+OYdpTJb501nG0f4pfRIXw0thkiYyfWdDPChbsu
         JlZ1b80jZ+r/qWYDp5prZ2xbFNs8QHoqYrExhO2JM1BpCeQPeSOr+GorGA88uRLR1Kt/
         XQ2bb8nObK5VUxIeLzjNIw/26Xn5NVunpi9E8g/MJjGd5j+14m5r18IrI1HgWbnu6qco
         WegsHj0BHItz0q3DT0YO6wGT95vx1izULjarUctT4e3l7Rr1AN9p7Bc2SWgl5vJIxN/b
         UBeGGB2/ZHC3Usk24prd4PA/ifh9LNdZJIqNo0RpnP1nagVCcjWnVlC9OzEYwtnC6jsN
         Ed+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6N0Dxr90tSGN8D06PZxqcdaObrRzD2iypgyadxATbBQ=;
        fh=j/K2FBQEGi4Ute4JVIRRxYsjkw60Iibc18zQI9yyPC0=;
        b=dzSPh8D5vNANP0uegCZLArMJLFtugGpMDn86Iy9n+ht3vkBRgnRlNMlmPMeFGKjMDH
         Oa2bsDa8TJeuUHlj4q2kXC77anZegTmnmuukkkyMUoPbRjHqX6zIOq/dpE+zvU6ZJwEE
         C6t3n/3r7SCNH5WeoX4DmrxBptM/mAJLQGZ6iE+J9L8PlqN5bHjcYeMrJcq/AXXfjcXV
         ugaE62ARM0tfIQx3TpH6bRdmKOwXDM1LxZtSD3A2LYr3j9BxeOstB5ayz9/tGk957f2B
         7SsIfg9EileDJTPyURD2co621VaydZULJUq9lHFrwk0vWasLghICupdDyB2e8+YG6gHx
         hw/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780059152; x=1780663952; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6N0Dxr90tSGN8D06PZxqcdaObrRzD2iypgyadxATbBQ=;
        b=nP5RzSDt1lEEnviNJqjBSaThTs0bmG8qYg60QaXoOjXQh/ezk5OmmFNoWEy2mBToha
         gLBGgewKC6hIW5l7B3NbPJEq0N3Lu2G2S1ZNryO+cPwpySQ/i/GEboLKhH/fejnnOTpT
         SlovXwonuW/7NSD+/zoF1rlWb7DahOa5eFjcFaYCU6qYFLY1vXinATCWqMpBtnMFX9EI
         kzHPi1qYhmSn4JGI37sicoGtGUPhaWunaTUOOyfFv8HMfz9PAQwTKjsNDxmWNXB/PUYY
         rfiQ8buLEo7pnK+/mIOHFjIY04HlLCtqh4XQCWyLj1VgozUoSYOiIB76vUG9oV1/ece4
         uPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059152; x=1780663952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N0Dxr90tSGN8D06PZxqcdaObrRzD2iypgyadxATbBQ=;
        b=msA6CZ1rKmUAejaoIaMgT9C5QxGWAy0EXS4prlTvGkdBZOIVreHh2q85suFP+jIL6V
         X3BqZIo+30dFyW7k4oINUegquBk0FwECWKGkqGBweb/ZU7rzbhcvfKLOQ4yLu9mQV96c
         aJwGYjMpBKqs7cQpKvCicM3bGhCMdxNGlowNrjWZHGysfCXTNc+yiGMTcmkCt5gKM8z4
         XdQsR/dW3dsRs9VpEg3cSTQ4mAuiS7Y3BpBOI7+3WJqp74/JgZNiHAZX4UFyTr8GqpYt
         xim9OHDlHm6KVI0ybWTfnYh28jU+8U1SIhWg3KJh7Wt4GT+AR3B7vV0+ID6bRC00QnO9
         H9NA==
X-Forwarded-Encrypted: i=1; AFNElJ9JEXNsw7DCxk9arEK7OPkTn2w6lJnz0JIynI08xi75UM2Zi9uMQZN4O9D/ZRZGvWjib/GEYrC1JdcM@vger.kernel.org
X-Gm-Message-State: AOJu0YwHCDadqZ/0Tm4Wb1orjlTLRsRVmYtKpCbFO42IYhXHp41PY9d8
	8t8eSaXS6MDO8IoBFzwrqlR0Og6cWqXnK2QNhawU0JTR4clgZfvjaelfj1UTbMlvNxyGGHGO7Om
	yZZok52ina8in7wBRGVNgNH1kHJs1/Ao=
X-Gm-Gg: Acq92OEVqlFc9seO25xEdyVwLv2gieLb7FzAiTZhMd6Y0lUIoawxP72N7KAt04OA74h
	87wYOiYzE4kkp96hha5Z70EBBFmVHb6yTlXF5spXJfUZk720yWH7a6U31Hsq4VYX9q2MKLqzFVu
	MuCCHi83Nt2dYwyrBlpC/utYBBLTYRrXRQYJktU8abY1xGkjZ+g2W8p73LuZVf2JeCLo8Xe3faN
	bPglOMTwr+K/9YTtz3ya+1w74/apdNEW5KYl1EScMzjHSNdYB2AgdXN9WuS5NTwo2dEGsgycs3N
	nTrLf284mPYbqhLJnm3LADrsdbhdmnlJlbx1ztuUMhYswMngCGoDoMmK7a/5i1ejVArdhBV9UUn
	+N5qIxQ==
X-Received: by 2002:a05:7300:6c28:b0:304:cefc:5fe3 with SMTP id
 5a478bee46e88-304eb0d7e2fmr1270278eec.18.1780059151866; Fri, 29 May 2026
 05:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524085312.15369-1-kimjinseob88@gmail.com>
 <20260524085312.15369-3-kimjinseob88@gmail.com> <20260528142803.15e3ff83@jic23-huawei>
 <CALMSew+3RVXxLJYtr3HkV7UeAf6Mqx6PpA2CehChoVaMFddpJw@mail.gmail.com>
In-Reply-To: <CALMSew+3RVXxLJYtr3HkV7UeAf6Mqx6PpA2CehChoVaMFddpJw@mail.gmail.com>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Fri, 29 May 2026 21:52:20 +0900
X-Gm-Features: AVHnY4IH03ffAVGcDvOGGjSAXSpJWUGRln-tfw0E4es2Op9aZsxsbd9lCLC0GvM
Message-ID: <CALMSew+gVfGS5RJN2ccYiF0Rs+Eia_QM1xJ9NU4=aXubhTFTaQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/7] Documentation: iio: add Open Sensor Fusion
 protocol v0 reference
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sorry, resending in plain text.

> Can we have some background information. Where does this OSF thing come from?
> Is it a general standard or something you are personally developing?
> Some links would definitely help.

Addressed in RFC v3.

I added a Background section and public project links. I also clarified that
OSF0 is not a general standard, but the current wire format used by the Open
Sensor Fusion project and by this RFC driver.

The public links are now included in the documentation and cover letter:

https://www.opensensorfusion.org/
https://github.com/opensensorfusion
https://github.com/opensensorfusion/opensensorfusion-hardware
https://github.com/opensensorfusion/opensensorfusion-linux

> s32 given this is kernel code and i'm not sure what else this is referring to.

Addressed in RFC v3. I changed the kernel-facing wording to use s32.

> Not sure that is meaninful given expectation that there will be channels.
> I'd describe it as a payload header, or express this as 16 + 4 * channel_count

Addressed in RFC v3. The SENSOR_SAMPLE payload is now described as a 16-byte
payload header followed by 4 * channel_count bytes of s32 channel data.

> Is this spec defined, or just what the driver supports?
> I think this doc needs to distinguish between those two cases
> more clearly.

Addressed in RFC v3 I separated the OSF0 wire format description from the
subset currently supported by this RFC driver.


> Is there likely to be a non trivial delay?  If so we should figure out how to use
> that timestamp to get something more useful.

Addressed in RFC v3. I clarified that timestamp_us is a device-side timestamp
and that the current RFC driver does not claim production-grade host/device
timestamp correlation.

> What is AHRS?  I'd spell it out.

Addressed in RFC v3 as Attitude and Heading Reference System (AHRS).

Thanks

Jinseob
