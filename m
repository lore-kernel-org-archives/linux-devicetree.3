Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040974DD3C0
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015551; cv=pass; b=GNHTXJ/Pa7pQmz+0DhOMp2MQ4/TeHcN0t4SUxX0FoHygIxF+Sr32Pq7qHBRrnS0MC22eUJCZFLMDHWXBTaedEO9tGYSdloLvlhLJ/3FEPsp/DM7RBQODQDkNGGabMmxXGu6wysnrTrzSaDoJ2kAFSxDvhLsUpf3mpW1Hq6mKA9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015551; c=relaxed/simple;
	bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNPXebIsdqeoZD6+uZp8HhGL//KDFjcsxGhBFceJOrjt4T/7iWn5sSduM7oOG3wu9ZUGy9xsrxP2egSMwx+y3MtiR2a/1ECyJLtgisx76JExNDHRgEQ7JMiVFCruyjElnuiftBNRiLCGTnN9EoJHA/tqHUf+p6bk2Xwz8oNZqc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe7IN9f/; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pe7IN9f/"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so5073089e87.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790015547; cv=none;
        d=google.com; s=arc-20260327;
        b=fNfB4VEdtf6F4B9Lx97pXHKxysZxHodQ8bTK8hhLOSTp4r3/Gm/HlQ/Ab8IA+ELKwX
         u0zx9xCz5h6XNFlIz9GVHOBNehwzQHqaFQ35Qmgd+6ve51k6hicXErjKVM1+WgSALtJ6
         U4Tf/bwxxpNRAg7zO3NP1BtbmryQubCO2FuZulhjFUTWUE5xFxic91GQp+t1sVa4Wfhq
         hmYpaREyeptzFMD89iRiuLXh/ARib1teXTiO/2e6/ccVbYY0SNTyaHoNpPGOkwJtmMMq
         PsER+2vD/DNYbw+qc/dSmDG6Cnrd7yQs9FfdyWaUFRBKjsKE4N0Lt+m6DfpyFwAqfUSh
         +saQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        fh=1fQTDIJ4fljo6BzEqQzhwsTjBzswsxyQJGyK+sncz4I=;
        b=fctZXBBBDFC38lZ/tF0aLO1mfYUsIOtX7CcuU6X0Ui37EqaHwGpeVVCJV07vS9ztB1
         +lmjwS/QmL32Lm7iH4Y14/E4NA9pYWGbv7kyrbDxtMuduy5PYvEYKgBvgmYEaM+7yWhN
         vpjdQhKRhFvDbEISeni6dbmbgdfUgyj2WenhkM7l8zJKaRU4LUnPw2tDoFC52WthSrle
         S9prdGf3M3pZxnRJrSzxNz4O8nm5Yug64x+D8O++KNJkjTufqikIMZb+WonU0+VW5OYP
         YyZHxVxRlQR6VGa2Sm3HqvU6Ok0n8MPYYGM2a8POkAB+bAKWHzRKVwThYV+oWDqalKr0
         xHUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015547; x=1790620347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        b=pe7IN9f/CQzF4VA0m1JpLqlJX4z/u1P4pQQOICgdkgWZCZtv1rB4SroMZ4XoMHwypn
         F98ue8R4Cr+gy8ZiPDUM9I1ZF8y3cHKp47rDKD6NSQb/ino+xYLNJPvF/fWgsGn+Hjmj
         v42iv54wgUAoSTG+YbvHj/AO0Fi7QrMa6A7V9Djv5ucvEfc93KSCxkx5dj50iu3vdN/8
         l6LU2t/s7PcwAU5Rvr8qCGalMUJXFyVfwrhYw7cw7Nw61ZmQOrP4ppnDUpVjXN/u6KMw
         wbR0/qFcD8KtXjF1JohMhEJXsmBp2EzQNsVBMWZMwZPKABaktVgU7kbLxaBF5MRx/NeV
         5r/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015547; x=1790620347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        b=Iva8E9A4DQEidZ2//QP9xHYMWQZ2XUw4798qeTDg2yu19SSt6CQxMU7togYAlu/Mk2
         ccUBPkD88xcAog3PhizPylo3HFVApfNAHsR7YXDH5QgyC4aEuZ1xZxJBAhi4ojh3S+bD
         YbE84kFAcBaa9ReCod6b4U8mjN3/Hp4RO6k7dcfFwlaOKMIXfHf2cYm81L2+O9n4ytJh
         b68q+oLJ0bjzf6hjCdhoqsX+s4Z9GP8UboEjfXwyEJmSxewkZ9ZozJgux6X7rSaT+sqf
         KcYKVC1DyhkBJ9anyNW2EI7XmJjCs8IdxgGTvqBRlLI4QkTkBT3pZMvM1XBMahfQXBe+
         iZ+w==
X-Gm-Message-State: AFuF++mV+b1o2C8jn8S4M/lDcYlhiPJ7mTUlXR0q9r1xbw0mfGxHV66S
	GO6NeOl1aGFMEHqK1T7ILl9ebVN4ANYPJLibZLkSaUrOFQk6Ji/KNqUXLra4cgt1dGBl9hrf+5P
	F3b/aATW51HLDUebQkOFBR/Ppwih2TYc=
X-Gm-Gg: AYBFou0G5oOdTfXLOQKb8C8O9aZhw1KrpcuouUg71/CLOvlJfesukBhOujKJEayLDGJ
	reqGKimfaM6CR9PrANJy7tIW4Ho9tAH/vOz/M5EpL6dk6Eiry8LN/VE8LhbhqGboJtNWG6RRpkB
	dyxRd5y26TO9Ogd8nqB1y36aQFktCzgHhzhvpKIXabtF5ayBBNtWWsqax0vfD6JKmQnfj9WIAGc
	zHKj7JI/6FU0n8GxgAe/Sk+UddCSXKc3i33uFWIg7Cdrro1N3rNrgn+xUkic6T/u3Qa7SB4GTT2
	7As4e1X0uiFyMymzYFpB8MWZ3Agk+/rIMRGZWIzimWg169qYQwJvx/18YorqWNHH7imzdTVPnLJ
	lBM5UrH7XpQ==
X-Received: by 2002:a05:6512:159c:b0:5b2:9f7a:29aa with SMTP id
 2adb3069b0e04-5b8c179de22mr3976341e87.0.1790015546739; Mon, 21 Sep 2026
 11:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920211356.186967-1-rosenp@gmail.com> <20260920211356.186967-2-rosenp@gmail.com>
In-Reply-To: <20260920211356.186967-2-rosenp@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 21 Sep 2026 20:32:14 +0200
X-Gm-Features: AcwNN1VdL-Fqcu_uP6CBPAY_SNwPGWfl7hrsVO4b8Qj22YVrcCYQZRsojkFfRw4
Message-ID: <CACna6ryP-ZySxcK_b+BH-5ckDJxAOXE3tVtLYWP6SYA_Re3HOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: bcma: control VBUS via a regulator instead of a GPIO
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

niedz., 20 wrz 2026 o 23:14 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a):
> bcma-hcd drives the USB power line by grabbing the undocumented
> "vcc-gpio" from the controller node and poking it through gpiolib.
> Besides relying on a non-standard binding, this cannot work on boards
> such as the NETGEAR R7000 and R8000 where one chipcommon GPIO powers
> both the USB2 and USB3 cores: the two controllers each request that
> GPIO exclusively, so the second one fails with -EBUSY and its port
> stays dead.
>
> Use the standard regulator interface instead. Each core obtains its
> (shared) VBUS supply through devm_regulator_get_optional() and the
> regulator core reference-counts the enable/disable requests, allowing
> both controllers to drive one GPIO without conflicts.

You should add support for VBUS without dropping "vcc-gpio" for now.
Deprecate it. Give it some time and then submit a patch to drop it.

This patch as it stands also breaks bisectability (because it drops
"vcc-gpio" before switching to VBUS.

--=20
Rafa=C5=82
