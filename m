Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089376;
	b=4r6GuevYWP2wARjhF7LJJQJaZQ4IV6r+XJDgRrEc+AqQhGIy7NabcDIsziatb/55ZFDq
	 mf3iIXybmp8SCIMMEm+OisiDiDYFEQe7mp+QCsfm7Xe9jhHdnUW4/1MtEn/eXhYMrN0Kx
	 GunxLXoPpfpL7Q4ds2jaWrCNgqjGJ6zrRLdvvm5dVH0hP5KjGjoj5ICg+d5AXTM/pNBey
	 jaWalqsbnDtv5u7d7eW6k97UZcAEG59EiGyzIt2GV9yeewWX5X5ZBnSp8lFR+Ew9aGvBO
	 EdrfymlDMNsMi4mEGaLuYT1K6lPhosSyYSAbYkHN2MXGRUCtm3agZVDxh66T92cJiXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
	b=UCN/riu8YLHhsQkJtCMDNFao/IZgqLbYXTpZ67U7f1iQ1ZIBe7WLj9teKIj3erlQeJvH
	 S1YK5OvH4laFUC63kK/1bKpFtDtr2x+GBl5t6SGrLfaKAF2r0iiU08jboedwzyI7+a+lk
	 AboOC6NIOQIEsMraQY/qcAfnBuqTIOpZFMAeRdLgzprBj4qDflUkg33YQaoyd/Z+Bzyh9
	 fU8MJ1FbbW81AGs9dLNM6HL1xfF1scPrjsUWkOPgPfcK5WNvjMz4CNa48j9qdF8YjlX51
	 lI/XamqcRzgwmMzwZ2ZbjKaS1Yc7ki9FImsqdXi6aS10dzj4PF0ReoI/wL7Ja781CYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+6GSTEr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2D6606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E2D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+6GSTEr
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so1827901fa.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 03:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089374; cv=none;
        d=google.com; s=arc-20260327;
        b=IoEaaa3WgZzy8DngyXAhVB8WxCpTaz5q2Qb1Hl+SlPdfEWfRPxudO2P8jheaoyk74D
         hYIXZa93EyQpZp5U7iIDn+Iv9Wvd5HJ8/SnsN7L9+ISBI45F8aaI0g1psMi2+90E6Y3Z
         GBHP00D/0u8XPa/ZrH2CZzwHf5eYcNTEjddQ/pci7DoB6heYXffLSoEjvNTkAkjgJpQl
         Jquep9xqBBvGU3L/1fKGswnm22BCETol21xxwHT4Os6uaDuyLreEpsAvKUDN2U+fntGQ
         LBymCps/5VkPYZfWdS5J2NOzfewerS0dKDCqqXwVpRZNZ6Ug0FuNzAHcCQSDqD81Vi7G
         qK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        fh=AkbIjXnk2QgkL4V2Fkc6/vRmEyu4NBL/SMCzC0SG6x0=;
        b=d/TtG1QgcgCD2CkBH1GfcYk4Dn06mvZYV6iTIc+/nFYSirLu9RnHW6xu1N9UoifNat
         oWk3uuuBzZ09i5oiwJVW1s9hAvq87/a+7XPIDvDgs+wOL0BzHzFVgqCO/hNT1BLM7F3P
         7vbevSJRg/tbz8R4FheuVDIBqymlJqKzf5BthnfECXVsXjszxCXfJZyAMFWOBe6lyDld
         tmlFzia3GhJCW8bVHNbfAw/6QcPiKMfpwOJnTzcEq7n+BYOGaaV6pGegZjuw7fCKECaP
         /JQkC7sVlS0jsq+iySVpsLJjHzmHLyU1PQINWdAy8UJ9sQ97g4a75hSbwMIEHuM6kSLK
         XcpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089374; x=1795694174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        b=g+6GSTEr+iJNFmOLmfk7uLS37/b86Gu7Z5ix7ooEzeRSuoviZQITI3D0TtSiWFjooc
         3TC3gbtkPWsqbKm0dKyR8j5CblzmHyBXImHc1Y42ptIjNiM40XZr1v0ZEf2yIUzBo8P5
         rLgIYhjSpmkce3RtxFezrBEYrRaYGTFeVXBNugML+pEOaXMK5qnUFZICqMq67TCgZrbH
         uOmUue1J0ll4sCPyxDMxgrGnfsbsY6M48mlGNUtu2lgw7vfRWpJsIQB7yrR5O/A+Mb1K
         G0aS5Q6u/+v9trWYqyPWVLnHkSvqTOGNJVqDpD9LU0vO4WASRQwhVgwZi1DSYpZZl6qn
         4Erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089374; x=1795694174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        b=IV3OO02f4icMlx2fA6NzwtnwNlWnq9a0XdWu1xkEPTTzo+TrnYCPAWzyewYRl4OYGp
         27oE2+DsuNlM/NickqbOg2kJr9nuy7mtu319fSRTD+0kmiAW/EVVKvn/atkKxkABp8+r
         4ZRxEHoXMna5Zd5SdUVe+zYEcozBh4APkXwF2d1C9xvlw9YjozZI+CFgsg1jhIgNB3If
         eoACF4RLn10I8pyDBc1Ht2Kqm1o03gwOCpi2aSND9Q9rOHAMPSaoRtpcwzOyaIZbVo8E
         zVY3TpP1D7GFoNXkS5/v8C556JR+mkc9+y2ZkcU3Wy03WUDZRf47NXzHX36OtQO3CWtL
         +NVw==
X-Forwarded-Encrypted: i=1; AL+hErGQ4XKbJr+P38ILVLQO56LJlaoGLe0iaQ47WmoyEuYal3l/LuqdLKcEVFBVxyCzqfwHjSEVrBRPdudc@vger.kernel.org
X-Gm-Message-State: APuU4Z9yAhoYfDLWEq2l6lVxaWslGuVtXPlHNuvlx8r2JPS/kcfzHqHx
	gPTk4AwpmgVbWHjz9rsEEyYQPizidJCQgFBhZw8sDKykNUh4E772SzWIkJPJTBwMwQiRtvpV2Kt
	XLd4c8b53mUTDbK7eHYOcu3ldlQ6EFcc=
X-Gm-Gg: AYBFou0lkysn2kGixFfGqlui+AU8diKJ7DYBBiIOhB45/gWqbt4IPjJU6Ul/RJjp3j5
	eGqy8xOYYKeJCGOblVGEogmX7XLQrYW476e6lJbUT57AJ2kerIHyXCzmQAS6n/n6bKRhG9MqnU8
	O57vPdt9bBU831jcpM9IBeE14Lmj6hqH8p8Qti5HYMUYmxp/96+xsYFz6+39RrgEzR8KdZqHRgS
	x7OJbsFUVWuGqwATbsHpaneqWF/DzXV9sveOYl7NQ9hDDBptLcJbc3whQ1FCwvtb7rwFRYBFgal
	SYoTvL6fRNA+evKLkL5lSXXDCotvUFUqcDhcSEA7vGpWBZ+TPmHAsp/EkcD8gHZcZROcZgbac29
	kKk5xDZ8X3yKAGvlh9JxalUpRkUI1VNs+JbOFtasOTaIcAe1Kd7kB/jpJu0jepp6QDoFwUMp0pW
	Gl9UtBXZdvLklvCwUF4A==
X-Received: by 2002:a05:6512:ba9:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1a9bbdf96mr2564765e87.2.1795089373747; Thu, 19 Nov 2026
 03:56:13 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110070627.217946-1-inochiama@gmail.com> <20261113072305.220610-1-chenyou910331@gmail.com>
 <av2M-6w1u5mOyqDM@inochi.infowork>
In-Reply-To: <av2M-6w1u5mOyqDM@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:56:01 +0800
X-Gm-Features: Aa3M54riNxFLUFg84fAOhmY6bjWZvKgiNBwAs9BSg1G7sMgZ9DPXd0hZVBFcQ9M
Message-ID: <CAKspUh+LLonm90ywMGrRUcsLDE+Axw64qjs0OtDB_ySUsrPPQw@mail.gmail.com>
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chen.wang@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hminas@synopsys.com, 
	gregkh@linuxfoundation.org, looong.bin@gmail.com, 
	dinguyen@opensource.altera.com, paulz@synopsys.com, balbi@ti.com, 
	dlan@gentoo.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 07:36:04PM +0800, Inochi Amaoto wrote:
> If there are no other bug in this patch. There should be no new
> version. The device probe problem is not a very big one. And I have
> no idea about these thing. Since my time is tight, you are free to
> send the fix for the device mode.

Thanks, I will work on it.

> It depends, if you accept setting this to host, I can add them
> at once. (Note: once set, no change will be accepted).

I would prefer peripheral as the default. The vendor kernel uses
device mode by default, and the bare Duo 256M is usually connected to
a PC over USB-C (RNDIS); host mode needs the IO board or an OTG
adapter.
If the "host" mode is used, it means that anyone wanting to use the
product would have to purchase an additional I/O board=E2=80=94that doesn't
seem like a very good option, does it?

Since the peripheral default only works once the boot role is fixed,
I will send the fix together with the Duo 256M DTS change (dr_mode =3D
"otg", usb-role-switch, role-switch-default-mode =3D "peripheral") as
one series on top of yours. Is that fine with you?

Regards,
Chen-Yu
