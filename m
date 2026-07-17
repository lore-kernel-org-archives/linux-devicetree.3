Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7EC3DB961
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285516; cv=pass; b=NL6KddFHh3zqrtLvSWc5jaNJI7ysfuyE6ORm3/sF3R3RLD1iQ10rTgAJsEHyqSs5rnrArEe1Ts8wBHH51BMaNPAUwvlRzBDm0clBjvC62Hd6GfPXiBKvMp+1ifOQ5HaxhuszKZGlLXAM41CKry24H377raXiOtRsgdBo3IzlUhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285516; c=relaxed/simple;
	bh=vQplzCRPmrlbx+b3iFM8q56R2Z6YLNw+7G55zXBLBms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bInuhHzunxx2NG+tHFqdTSOoNAOsYJohvR0i8qe/bS7fWB+gP9z68hWAbKvZINR3vXNZSkDEObV6WgrdYqDB6U2q/AyorG6Z9gtDOjsiLX5N6sXjm0rhMfiilAIRvpIc08wfyk04h3fosGBbCiBtIQydxq0cRlFRLHMnPZk2gwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nesowRCx; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nesowRCx"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69c5eb6dfd3so10760038a12.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784285508; cv=none;
        d=google.com; s=arc-20260327;
        b=NtqIVal4qyh1E+5kFVx+mST2zmSMqGTMYKtdjjWEAuPAa3RO4gcUaDzugG9ZRdRbAr
         +mq+ii1A7hNDeDMmAqUiLnaHf3JOhyU+i1MFaTZHXwRaLFM6L9khZ7LWV5i4+Nl/gaGB
         R9onxwrMIMHP0dr2zCKMKcANctDcXgCCNO66qylMZTFJjHnNIGcCAPdnOsLUTk+CxH6b
         xKnqhJxrfrS/VQ0wgD56/q5DL03ATtJbbPR5S40NUeyPmvw/l1sYT7NGVaC4qihQEmSY
         uaL7twiHdO4KRl761ytHMaByDRJPFTQ7d2dQdoAgKhgZVdc3l9w2lgAC/cfRgNJgyGnY
         l7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vQplzCRPmrlbx+b3iFM8q56R2Z6YLNw+7G55zXBLBms=;
        fh=+rSmsQq1sQsKtWtJ+I8dCR1wmo0V6wtB1AcjOsEkXjs=;
        b=Yhn+6v/s6/EB2Xrb9Snq61yCyDythoRfYpJknv5SK/NzWfxOoNC5hzRed7WTzAwpiS
         PY3Q3ceFOchdC20qqqDPWjqEH0WgVtX4XUBThwUWi6N7cULeXiSbyJDfviUm3mQpY9JB
         8f4UIZm+mSA9EFqcIFCyHScE+r9wi3eUaj1j5cdKhXZS/62mQ3f2ya2xjz75Jz47Slev
         Bm3A1ibIyF5ll9SaCgyyrTAyfRn8RYbu36HdI1BOPIXL8hkjg+Tfg/pI/FUXFNAy3jGI
         VqKCaLiHTI6ZG1DplbWQSO56AsRUh4y+7pJdqOSk3Q0NFUb12zJp2Q8bIv2D4GJ8bCUd
         eTxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784285508; x=1784890308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQplzCRPmrlbx+b3iFM8q56R2Z6YLNw+7G55zXBLBms=;
        b=nesowRCxAPFbOCI0ijOqY2zvhvEkM0oPnaGDleR5O6BeNPNP8w7FJA+9sKpu4l4l+2
         5Yv/ygxhvTPqp3DJyYr6bY1adgTZXPSiXcnwleCl10pwAyzipOaaXgScvqKkZj4jIB+h
         kjsHYd88+jqoq2IRWjsyUtbGfFFo47K1mGL+Iv/30D9GfYTNWDDfjKZZkS9r2jtn8fAR
         v8iCfUpTOrRtJTsK0Um2q7dWiTO+SoxJm/+G/wum/KEOQuUimmkYLqbADCypeEXiicph
         RUntlPEMqLKEWAhV6R1yk6Q0QUriKyP1c3XEFlPyNTS+qv2lAGlJ6JeZcZ4iYiAQwwAs
         7mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784285508; x=1784890308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQplzCRPmrlbx+b3iFM8q56R2Z6YLNw+7G55zXBLBms=;
        b=qaRSKlXmgthW8aX1eXrncddjwYFoiEySX1Uh8MAyfmx6mndPa7Wjm5NfAbjXi0fVbw
         09QGkj5pwRilZwV5F/TCARsp5ZCQk8ZfhPvMyc7N3TYn5GdaZHgQwVpfJD82OecBx6ng
         wZ3HJIcGs7Ai9kft/XPBtPyMhFkwMH+6VzHCy+OmCACwnlGg52I5P5OaiIlqlQmAUEd8
         JqwEEuYpqRRRJ4pZ8TNXDulp1+stJnMV1BUqIG1/nCEljaijAiyXXoBA4hT9j/7RqAGQ
         k0nZS7YYuTsYooiDyfuRflWPH3aebJ24jqrTF3S+nS/DG9ZcK1iIwEkCl6QDub3qovV7
         1/2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqdNPpAGmYPjdwoHeLENQWi5cNxoXWkuTKYymmwRv5xGT+LGC8C333a9sUzcFwYtNLpgki0SzHt1XYJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwW77PBzM9aL9cQz9rUa1ZYGcgJQ0NI4XlMdq6k1B875ZvK20/w
	viFcoFY7iwvhju9Ip+0eIbRpMZJwWZ4v5E6jpouiqL9gEn5ZirDpPNORjSklOC1wd1ypxNeIzyA
	dJW+p/U1pmo4Nl6HIEIF4itjaZ4aHzgw=
X-Gm-Gg: AfdE7ckM68P/cpNB+c5e2s1wgJndIwp3a2K3HaQJgnHHPflSUQLPjhmgXHv8PgzzVl2
	H0pDHmnjFCo7gDnBqjXUwAN+YBD/+stV8hVzI5stBu9rkK3mSe8gOpo2esQlayyeTgY9aZC1fnN
	pY7jLOxeQdq9hT5pV7GZkxAC6V/2iOD045U2EyZ7lvSZZ4DHcvnz6IUjh6feWDdFT/tNY5Z2O63
	j8OWPqAn7XIgvezVug+mS7Vf6vU9M0Jni2xbQY+s+4w44pkx0rQrcLWPq9PTl4=
X-Received: by 2002:a17:907:c70c:b0:c15:c1ad:36dd with SMTP id
 a640c23a62f3a-c16b45724eemr92901366b.6.1784285508018; Fri, 17 Jul 2026
 03:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716173325.653164-1-a.shimko.dev@gmail.com>
 <77f1cc14-cc5f-4f32-a972-f0350a60931b@bootlin.com> <05bbadc9-95b0-421e-9c5a-8223a891cb5d@lunn.ch>
In-Reply-To: <05bbadc9-95b0-421e-9c5a-8223a891cb5d@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Fri, 17 Jul 2026 13:51:36 +0300
X-Gm-Features: AUfX_mwM6QF-cVSBrgjxB3MqPlPRTL1soPgqjPUucWdn7x2xpIl-dWiq_De26nk
Message-ID: <CAOPX7455qXddUEo9fd3JpYu5H3t8eb1jvNcDq81292C67uSs8w@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] Add DAPU Telecom DAP8211R(I) Gigabit
 Ethernet PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Zhi Li <lizhi2@eswincomputing.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, Jul 16, 2026 at 9:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:

> Adding to that, there is no version history. How does v3 differ to
> v2.

My apologies, I will fix it.
--
Best regards,
Artem
