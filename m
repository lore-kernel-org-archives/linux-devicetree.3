Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACABB46D0A4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852544; cv=pass; b=aJaU/+NjZeV319G9YSiWCtOyGPWEEX8NFa9W03dpdfuWo3Mkyp/blsCS312ebvuPdsDRJQ7VRIyfgXapXlhQQdCkO3NclHnGsZXRU69u6qhHffVWaZx/W1wRASZNFLKv2DN+uROIzYbGS7vbRJ6uGTeywc4/FnK4fomAbLDx4Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852544; c=relaxed/simple;
	bh=OVz3aJdetdn61+k9d771XNPFWGPWiQFw+i+T9Ou0l8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGOhJYm3G+CZG8Gj+KkytWCtIE7uLeKsM3GRAP2W6BOZXDkjtRLTWtIbGS6fxXBmO6ijKkkhsZvPerjRYwfGeVScaNbXcdIIgdxWhcSRhpG0HEVJspLY7qzIYaHYjuuE2x58vsgihPmLf46meM8+UhUU3nyl5VmK4NUh7jbQnlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgOLty83; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgOLty83"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c169ae1cb26so171927166b.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785852541; cv=none;
        d=google.com; s=arc-20260327;
        b=Ucc5ZoxHM5egzAD3T3lU4oUU9noE/vT2KNAGy5FfTLNKVFnn91DBcvtLiZcLxSx6Xl
         MF+s6DXusr0+/q6MrMQgad/P8WbyLvhmeP+6tEGnHA6Kr6RA4HRCOC6TObel4zpCeFkb
         OugEKScm2cLjR8nz7HgXAxzYqP0j8knVfL3Eu/4nufHPhdaZVeWn5B9ZAWxL+rJb5QvR
         lHrpUD1DzXwfv05Z97w+Wgjcz3Yvo+Xc1dHKG6fEBxJO+yQerjlW7D4etCpmr3yubo1L
         bQvy8X4qlBkFEvDQFAsN2u/CiS3A5F+SpCh2zc9qgHRcTRSiVIDZHnhohDIIaFnZWsXd
         7eew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OVz3aJdetdn61+k9d771XNPFWGPWiQFw+i+T9Ou0l8c=;
        fh=vdU0zATBiVFusGss7IPSYOutWYG1c4FmbzTPx1q+ZEo=;
        b=LuUIDJgCHFmbL0tyJTlKtXIJToegr3Bb6knjqcNchy3f28M4x9BmquezHeNo5YwSny
         AwehjajM+nQjJJQqzLKIQWp0/y6zaZvJIy1xEXHuDqqBj78JCJWPn8Hlh4kYXkcodhjz
         PMJcBShb59bpyYtCs7tJbHda1q4l5N8pWdzR5jGLOVnjt9w+lXfsgV2OF7OnMsdgD/9+
         aHQIXYqFLBjLN8cCNEyxUbwYVAEZnlvJs45J8uv6wwtisGtg5UVca16QNwfq/pZPopL0
         Q1VyDaUiYas1Ok01Po+oULQXRNR0fu4OoVzApWbe382LeECShHzJ5yIXyuRnz8WG2mGA
         Fuiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785852541; x=1786457341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OVz3aJdetdn61+k9d771XNPFWGPWiQFw+i+T9Ou0l8c=;
        b=QgOLty83XmYrUl+6JD4O7tVgepvDOqXwJlg0qGEuRss/UMFrMbrFoOfFOptjS63qop
         pWq7Y3LLW2vncApdEaZJNmZAnPbf9uQi4Twdb5IT9V6j+dQIkB1pSWrTQSo7CSSJnkOl
         I/ryp6Jax70PcLrkKDnxom0DvdtPO3ndP5GHk0ZWg3zOATVre+YGXz3rswQaeW6iPFls
         /MegQPftG+iF/X3ehgA4nSUWkPRHz7q7Xb2ocazUhXrgenUi3AgESb2J66YZa98BaItk
         GOGAqX1DBDl+uzZWkS6mWrhD5mVaxmzemxyU1fq8Sm54UYFJPcWjAZz+4Dl8kE+LmEH8
         Nufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785852541; x=1786457341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVz3aJdetdn61+k9d771XNPFWGPWiQFw+i+T9Ou0l8c=;
        b=F9NfSpvdmpnCJ9Zsdgrt0e4mdFcpxTjrvynQFcB0insljIhEO+jbjkoDtOpjPwXBK4
         H2FCv/8ml7FzPWLKSVJiXJW0PX05P2gOaIeUsVy3BJ1Jk83VnJRUNzByXeA184xVGduG
         eDpxuaT2LQLT2X27GjpQLVA/P3Pd4Zm5yQ+xl+zOW30h5L1M95ei/adV0jYIeJahIUmm
         kSOr1yTngx6mJzNyd/JmUDF4TdQjbAUdaI7W5fLzd1OrcqSWI7JRZ16oYE088agNicf5
         PN7giy1YKCl6LfMhpndYHs9+6EJVBeCE8tPzoIPLBrZ35DrCCVuUrz0RYGyWvi/sjoxq
         xDPw==
X-Forwarded-Encrypted: i=1; AHgh+Rrmb2NRKukCa/WPcs0QLbdKRSI7+7v/d3ku7Vo/xJyX21h0Hm+4Wo/pTwu/Fm8T367MTMPt5jMMdXWZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj6otBTqPVRkPKskaeKdfMoJTriq+8hVfvPaG2/kEfiWYovC5Z
	Y0vvb1kLISd7d2ov7W0d6dgtTywHhICxcT2PTD2EuaHyNrMwvQOdSzsxqpDfNrPkkQYnjKmyCDr
	6zkp9Z5P9//icG9+hFgA8qXVJLIAbM8A=
X-Gm-Gg: AR+sD11ezxwid8DgjfjSBrL5MAcMfsURMBi45kXY+bcEx4oiE/VW4diI3LmLJSiNHc3
	x0bcBh7u0QaWsioeI+lz47Ku+LQeHGkQND6pirfaO6ktGbHJD8aKXicV75tJqAzGVkmzPLGHYfE
	UmKv1cXl39BP44v/YAhzsaWO++bw75UUpum2D3k4kPyFEi0DWijhgRUVzssV/ywmBXPJVo5vahq
	JrUceAhgkzY8d1DbQqeDBYaEG1B8xFDyCQoWduYCpAvzzs7rjiqHPfJzXF0dmIPMNBN5wcyhA6n
	d6fJZXXCqMJMfUsW1wq2BOA64fVJ0Ps1N/c4krv22/KYeA==
X-Received: by 2002:a17:907:160f:b0:c1a:25cc:e585 with SMTP id
 a640c23a62f3a-c20245623e7mr494139966b.5.1785852540857; Tue, 04 Aug 2026
 07:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803101734.270821-1-a.shimko.dev@gmail.com>
 <94fb1a6e-71d6-42ae-b221-cc03a820d2e0@lunn.ch> <CAOPX746ZFCE1XwXJ1H0gEaBvdvq-4GAiPTKkT-3XvZi0n_f73A@mail.gmail.com>
 <2ccd6223-dd40-406b-8869-021881755f72@lunn.ch>
In-Reply-To: <2ccd6223-dd40-406b-8869-021881755f72@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 4 Aug 2026 17:08:49 +0300
X-Gm-Features: AUfX_mxDY7sXytTFSAWz_x_NZFD_dH7t1f1ZrDXWbqz-dV13YleIrcOEvAZi7nY
Message-ID: <CAOPX745w-Hfq1k+H0qLWQjsjY-5bb_9N9sw5LBJ0QM-n4j+D+g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/3] Add DAPU Telecom DAP8211R(I) Gigabit
 Ethernet PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Aug 4, 2026 at 4:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> That is a very odd setup, half the 2ns delay the RGMII standard asks
> for? Do you have an explanation for this?
I think this is a poor example, as the delay is due to clock inversion
due to a mismatch in the PCB parameters.
Perhaps I should use a more standard delay as an example as <1950>.

> Have you verified the writing of the delays in the PHY register don't
> have a 1 bit shift error?

I verified them by reading back the RGMII_CON register (0xA003) after
configuration,
and the values are being applied correctly with no bit-shift error.
Just my failed in example value =3D)

Thank you for your time and review.

--
Best regards,
Artem
