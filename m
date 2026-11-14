Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662622;
	b=OLmCndc4ZoTo1HNsuhnMSy8Eu52NaahctlDADRLXudOKoJDD9CUjGm6IFazMB7vprKW6
	 dJLJ0a0QwJ3gTYGsvngN6O44ZOdAKQlOPr8yxVCv6PRDOCKM6XjrXBeKz/xTZMI+t3LJT
	 qDpka/hiweJlCJKHBeMKOELGd5GZxxXtjYJ0fGcYHFuiLynhnWgdqQYdkCO4Ug9DSz+dr
	 O2lp/N0irWzOzZ3wHX92jfYUrj5KcIhzMU933zCBh+K1qhmsvNLb9FWhF3J5wzPBaZa2u
	 PtqOHE+8It/LtM/EFJ1oWXdjqquwaylXXJyoGoSQqGfEOEy5xJTSPYvSKljB/BVaG1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
	b=ZhAfUzRYANilHzDgwXzSr0YSrLglhaUUxXiYlLP25eRk4rdyY03fWtQX33i9ALDlG40H
	 57VBCsRWMqk5xDl9TBllIyoPcPh62q/ccX7eHd+ZQTwO5q+n9MyTZwSAqsTNAKtrPoXig
	 iOrcAUKj5cGI7ZcZMIuSSU80K8Ybw1WjofhNfXCVZ053jaCqgU7JbbOgAR6AWEr1ARp2S
	 Mc3GwEpCjT0TwXgdyAKjZy1nAAcElEoJvljYmvYUaB9wzZcb7J+3kkXr5u/ZWXoVCLLpl
	 Sx0v6++dBjK7J2fZEvZZIDhV1mAnLUTA63kn+Y3sJr1sYAr8qTu0henmqQ9XIPmdk9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y78keFUu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9ED606A334
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C9ED606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y78keFUu
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d58c50743so303920066b.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662620; cv=none;
        d=google.com; s=arc-20260327;
        b=ssbBqn6/CbRYnCbxxBDx7vu9724bHVsHbcIG9/KIBJIrTmbhyHA1SVx8OV2sFx8y1v
         66snw/aSnStlCcZYMck1In1Rl3cNHeD75jg0OWVhGO0Pi17qDn3JMgV8WuWgai8Ug1Us
         EUmaqsNFDL6n/MeG/wJjXPWRvBmNQSC7UhDpgwrnCEvKjn7Q9T8ygSDjJn0N9ertrwJS
         Tg4UmdPLQKlaHbbQiYunEKzNhgZ91W55uokYYFcxkMVyKu+HqdZMCUj7UsGryMrvSRcl
         8E4P2tsrVhkkD78fUWaPGTSk7shvY/4VEPSxVUxQU9YM8aPIS7R5jjRL+O9j6NApCrBM
         tk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        fh=P51Vw5RxbhYHefB+DWn4BMNCwnW0EEizd989KBFuLbo=;
        b=STkXL4Lwx2uysabQfe0Z2H6QCxL/VxIYg2ZaIlL78pFdytcLireSjs5zYbXKsnLXKg
         sRY0m2kYuoZBkNGore+1YL22u1xhHd1zCgVtjTb9vb+1HM3eW0v90/b1qpf2a6N5PdeM
         IqMIbpzFhNoOodsGmxFQEcKJNeVwhJQQ/e6z+g/jWJvp14GYM5YBwy0zArtoBcldaKe1
         pMTrEab81M7xDaBn6qAd/5HInUiGFcuegRAi9jdf1GXdqXZ4wTtJXMoux8Lf0xBDCRig
         LFEbbytNOIczaESaj8NjHIEYXj4kA1RqxYPEeW5ALfGz6Tx0zZ1agipxNYii8aUD7+ZQ
         V5Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662620; x=1795267420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        b=Y78keFUubWHygKWEUEc6UgYOqe5S9M63jeE5/qIveIYQC81xCdJBju3d1NuDQCLQ9n
         JX98VPtOMlVf/EENKgM1dP58zZik9ySvZySD14sxBOExMOY1du8PLgko3TeffbAHnJQR
         +xI96m855VJsq7cu01UqgtUq3m9cLzNoE4eF4P50nTrsx44uY7mMJj6/WDJKtAE3JQSf
         EuffLEZRjfDTCcYjxHAbAZ2IiYGvD4VFouBRbWNj7i5xZPaW5HUQZ8J839jjP/qBPEu9
         gJ8rvo6Yfj9N47jrdNOca91CK18qybgh1ZIK1O2nP6wCnj7Wf96/D7VwD+KaAQNdMqHo
         UQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662620; x=1795267420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        b=18oUweXLcQqJXH3mFnnjoSnsSPvKXV8XrDmlRJfoxuVMX1dLvMMvSwLI0FHzDdFFL3
         KRySvkV33IXFvk0r2jIb+3/wEgluBr2sLJ+l5LyM4n5Xa+W241CJyAUrX+3Xj4kyHoFl
         nYgmoF6Hvh7SSViHnTvicJIvSdlsqvaUW5Mfup++v4wqJ1Sp2n5wmxOtbV2x1imni7GH
         LaXFsV8gFuHrTpNCcuHyLxK2VOj7Q+jYF8UQiIvLhwlCw4Kvbkc9me1qMQvtRAI/w3Rq
         +y5kYrq9uJaJVcJQ4mhTzu8Tfc0FNyw+nm3KLQemsW20zxMh5Wes9YUQqfKu+fyFsv4j
         nQuw==
X-Forwarded-Encrypted: i=1; AL+hErHH0riAQgXZfE8WH79ew9aaBqoxshu4+1hAj/zkSrm6m/aiO0uaj2ofPjCbaGKKrmeMATaBN5EjiWBl@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wj56pyOsvAOVYdQ1+HvriKlsgEQYPxqLEF0vaA5rcb5IP/x2K
	llkn55aoj2h7eQynqm1IgVslQ8IyboHSO6hYTELOVSqas86CpiZ4Vrh2R8mFdHYWNwGPv+3KOAI
	2adGdUQqXBbRtpZK/KRHDgmOfHZ3jl8g=
X-Gm-Gg: AYBFou1iAuD5ED5C1vQUmscLFcs/PYbqFAtCNRvx7mHdYDWpWVMjixYZKgqlODwEzWb
	xjTJyuyLA3+pZzJjAwqc8qvikeJ7osFK4LQTQUemzDlmOqgX9EA2/TCBfMkuF8XwEKD0KKqLKt3
	9xBYgO4F4Lqs1REfWdGvz04Z2V7CT4l8elYqu4OgR5uoSCqzn0ibJYy/B38fsr94P1d7uYO3d6k
	rsQqxVsESaaK6leYjXfy9/05VQzNMqGbJmLYBaU391D4zqFlHZ9XIMC1qaVsAWqdT98Aus3dGb3
	0bx+5kNgH3N/fu2ZzJ/c8fuXKGAufL7bL1Mm4zDpq7nQlD/fmJNz0TWlKvQ76L76NQrlHWIkUN/
	3BpCYxcQIw2kih15PUH8obLWyGJrZw2Q7k/JiKA==
X-Received: by 2002:a17:907:8e08:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c50961d1e39mr552099666b.7.1794662620446; Sat, 14 Nov 2026
 05:23:40 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-3-a.shimko.dev@gmail.com> <583c58dd-3587-4c2f-af5b-9b4a10fd916c@lunn.ch>
In-Reply-To: <583c58dd-3587-4c2f-af5b-9b4a10fd916c@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:23:29 +0300
X-Gm-Features: AclHuK9xmSYcy3iosLF70NipwjdWhG3wzCm_VjkuxjxD_XFGqVVFRCg6Padg4g0
Message-ID: <CAOPX746ENd5eSAAdhAy6fFdesZ=REU-T+CgcKtwpNJHY0Z9m=w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: phy: dap8211r: add extended register
 write helper
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Nov 13, 2026 at 11:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > + * The caller must hold the MDIO bus lock.
> > + *
> > + * Return: 0 on success, or negative error code
> > + */
> > +static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 =
data)
> > +{
> > +     int ret;
> > +
> > +     phy_lock_mdio_bus(phydev);
>
> How does this not deadlock, if the caller is already holding the MDIO
> bus lock, as commented on above?

The comment is wrong, my bad, all three helpers (read_ext, write_ext,
modify_ext) take the MDIO bus lock internally.
There is the same mistake in the comments of read_ext() and
modify_ext(), so I will fix all three in v2.

Thank you.

Best regards,
artem
