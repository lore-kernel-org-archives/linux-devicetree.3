Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C933B7B8E
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679180; cv=pass; b=GfDsV+iTiMZPC3WMXmF8V3acDzIcxwmSsEVUih//k/5TIm2LkhCewl++gTuxLls7TxBWu0tmCcaEFtqbVuoJlgGbKhRQBs55WEE4SsCxaO1LaiBOaaxmky1nVihKnVl6y6fnmMLqwz2FzwQzYNcUJPjc1P2bMob63sm7BSRQDEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679180; c=relaxed/simple;
	bh=iSXxjbCL/hr1cvEgQ8IVLmSXjDTfgblayEtrSw9Vrz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRbuHq08wBXnLAHqYn9fqzzMlLhyroib8TjMfdxKlqS34j0v4rjlB8ABa2TKehmDO0M/UAwVhBUacr4vVy+U9n4QkJG+PKmTsfzkKKYbhfDsupGfvVDkMXq7AuIQO53uyckai+KMbWm7zBL9+LFUrnSPscGZYP46SCrNgqLWJd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1lsO8jX; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1lsO8jX"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bd47b9f0fso294939eec.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 23:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781679177; cv=none;
        d=google.com; s=arc-20240605;
        b=CynW7tyxXOYOSgfWJb05IAH0DA3Xq/33qqixyBKQxts3Jw9aKvxcChhGiXfFAkqsYe
         Cxa2zj/v0eMCR+O3pZgPUanfma3oRUMrEFDAIrCTlfQZPXL92lFilKtzvm/sg+ZUCOAw
         piK9GYuFn74SOXQr+AzSzAcZjABczy7bCZyNJHn+YgdOIWPUZ+Vp53P8xfHvfIkbN6Nu
         Fj+k4C7uaL+d7xtJwiwvmDRjz2Myq3wuKtCtw5SxwnlT1Qw4qsYcQdu9THUk5JpPPhnF
         bygaIFMi/0pLA2bLII4SZ67w8wCtZ7Pf6JNOk868CMzeGbzzzIhVilOKDFZ4XSmO5YjV
         +Lxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iSXxjbCL/hr1cvEgQ8IVLmSXjDTfgblayEtrSw9Vrz8=;
        fh=jRlN2FcXcOffIDbHhsfMXOkRK0tJbmv+ne0xvqdQfMQ=;
        b=b3VVCkz0wJaSfIT9hvL0ztQqm1pcRqeihFWNKIAgVPoi0snAkPSshM88BXPgpZQjhE
         b24Y1aXJi2mZUgI+t3+gaTaRF3DrSxIDX9/pA5CHcCgvVok47nZSutDk0IYTbwQhKjGU
         xW0LOL50DmOd/vcZ/xlGTKJ2OJEvD1HKjuMSLRdVL01/7Ifv6AMHl1/0cOU2Jn4PJ8K7
         XDZvfY3dih9eB9sKqyf6tb8VLpq5AGoceWno4aGBzr2JHLWGwvvFDwH1KIS+q7bIHmQy
         strggCYkGUdytQCPOTv+IHBFOSZ1H0Xld0afuEoYHRRNQyNFtVtQ5O4v8T0QFU/Abmd9
         Pc2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781679177; x=1782283977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSXxjbCL/hr1cvEgQ8IVLmSXjDTfgblayEtrSw9Vrz8=;
        b=q1lsO8jXaPPFDDe43JbTYqNEDtukcXajOd3h37VcpgWT9tFkw3Fm5k/PcvRBMe1mGI
         MxvgN6FYKuMCz91tznK5qOGW9nxe4/yunhvolIbAKLp3Rcr76iYK2ay1rw7+WMz4Ekyk
         eVHFo/c2quOp9qyzbfDTjj2zjlWQfBN3fhv4YLsgXbFssPoMjJekJUpMpXJTxcsSL8rS
         HVh4Xv1LriPJEXNhuVD9iTo1bcQJPsrHOOwMAEqlMFflPqzdu0EBNZNyvFMouwv6MCvA
         12204gEl4yYmz3uZN9vWD37diXkodxoGNKs/JlHIfEVMGYXMt6xR/ZqZPNREBq8YkBWG
         ji7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781679177; x=1782283977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSXxjbCL/hr1cvEgQ8IVLmSXjDTfgblayEtrSw9Vrz8=;
        b=PlMuXDC+qjNfxLhjX1W7m7Bctw8tAxH76PWZUDqDJ2XMnC37YtVz3E4rwmHTYc0RRf
         2Kc1M1cnmVsLoNIZ+dGvDT3soSQ9ne4GCftCeo9H8BN2vkCW27u0JQk94cr5cbZY/tGh
         BJwXvn6+cANqxsD9JajGuUuUPnvoc8I06Tay/drqmlWjsVQ2h5CHXaxgsmp+bNUPJTD8
         u0ipjr+fXWx0xir6LSesCY8nh/nmrvOaGpaaDUSlnBt1f9BvonqXq0Zkp/WsYoBMxYQz
         yP/G5XTwBTE0HrQ+BhqylRc5d/uz3GtK2jUxyf/uc3F7Qb0wSFWMC8TkFgqzERef5FIs
         9Oog==
X-Forwarded-Encrypted: i=1; AFNElJ+QEfRNtvTh0iFnyXv5DPm8+caR74KsS6BUZ2PwIsuGzOXsIxmWsUcmKMLH7JJau6/MMOHtrYimXbAw@vger.kernel.org
X-Gm-Message-State: AOJu0YzIwoiQvZkd5Nucra6UwEVFPTsrx4qK9yJe8+/GUtz/tuEdh/kD
	L7/fV3S7ubZj9F1igf3ojOdevOSDmr4XFJJTP0TDqzFNaJSO1YhtMUdWGj9vXuZmWAAZ5hX96UZ
	sSLZYhjrhzkFVImkwLQ6SjwM1zqwzgvk=
X-Gm-Gg: AfdE7cki7PulmEpT7WTv+O0k6mxOsIGC2Fya+oZ6dc6wr+cfcSqbNb6loh3VIk7aUtG
	3K4+Zc/n3080qwXIqoG2fQG9jc8MyWSnTsGliSmnMkteXDAD0qAIkHXvWKBuAHF13RurngG0wkc
	1mjBxiaKw+MhsGK5yicTG3S84nk9CHMGRMFd2D0OBH/16v1Kz/jWqPKIoHFi/VbAaHfNRxU9qna
	WaZlh8iT53+xz+kUrzvSevL7gy8L0x4lqYh2l3ZKKXdEOZ8fDUEEiDJbZckUEvOvxBnYe8QE84t
	Bk/kwRwK
X-Received: by 2002:a05:7300:6402:b0:303:f26f:df30 with SMTP id
 5a478bee46e88-30bca09f522mr1548857eec.23.1781679177199; Tue, 16 Jun 2026
 23:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512102445.55372-1-clamor95@gmail.com> <20260512102445.55372-3-clamor95@gmail.com>
 <CAPVz0n3Dw6Vtqqn8if=MYkBbYittXqsBKbDvrs1ntbD5Zn6iig@mail.gmail.com>
 <CAPVz0n3iCSeT3xJ2XkwZ6PYofwSLkc0gfm+iYo4xbKBkAtihcQ@mail.gmail.com>
 <ajDEsU8oZWT7KB9d@google.com> <CAPVz0n26H2t=pi_C+t8jP_cWXGSa5pk=1cpTZtkBh3=RQsUk2g@mail.gmail.com>
 <ajGk5YxRTFycFc1G@google.com>
In-Reply-To: <ajGk5YxRTFycFc1G@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 17 Jun 2026 09:52:45 +0300
X-Gm-Features: AVVi8CdAHA6KnMvlndzjVeY1RjOWdn3VkGJdH7TEmihVzr_x7xsKAS4t5iH-0hc
Message-ID: <CAPVz0n3RJF7j9hfqZe3Sd3NQXigizHgBxDrR6h8jcRK1R6RNAw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] Input: isa1200 - new driver for Imagis ISA1200
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 16 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 23:3=
0 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Jun 16, 2026 at 09:45:25AM +0300, Svyatoslav Ryhel wrote:
> >
> > I have tested your code on my P895 and it works perfectly fine. Should
> > I resend with these changes or you can integrate them while picking
> > patchset?
>
> I think there was an update requested by Rob for the bindings?
>

Acknowledged, I will resend with both changes.

> >
> > Thank you for your suggestions and efforts!
>
> Thank you for your patience.
>
> --
> Dmitry
