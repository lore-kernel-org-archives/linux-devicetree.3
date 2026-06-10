Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFF026FD9B
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781130486; cv=pass; b=rf6ix6uoQEQpMqqIb+Q+9sLmmc/4alW3hMkc4wtSRM3Hs/f7nq/Ez56gLn/3nZU0DaDzPBG3IxZzqVSWNW2CdA9Ld9XUD3t4+mONfY6xza028bRPVqknRUk1lpJJJD6caGS1ew/TUlfNhYhOUmBBqiCo+TBQFGY3DY93vR9+HsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781130486; c=relaxed/simple;
	bh=WZ9MJIxuKOMQy7uNUnOgdCvwRv+6KTa+DgUhgZlwW64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4jb26mCEzih0E3vhQmz00SaeNQW2Su01nSVzUJNtaEM9jXypQYMrRkwcTRSoRLlE7cdAgLhJdY/MI0sq0KKnB9SqU0VPGln14uX4mK6eJVUZLSOuUrzMUslTXpxh3mI44vxwieApgZ/VqzjxhPdj9a2FVDbImc1r+/lX2pLK1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgGOzyHA; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgGOzyHA"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-660e9fe3c3aso3855709d50.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781130484; cv=none;
        d=google.com; s=arc-20240605;
        b=cD2eDqcfmZW9iBz+ksHhieWFA+YoD14y1splVDNWk0NbMXxKTjpwmcCZArJjrtYyNk
         dx2bYIbXmsUmiRVWLssjdLcNsZxewNdSR4o/0XQvIVPWLwmF6ouUMU+eDPQlVQmWhxUn
         hDyJu6/UowSXUcyKcaBJJdBUzq427gYYrhwuFETVWea0guynuvv5+0PNni3jnCLJyrqu
         avwm1ROH6WKqQgtso33y/K8kdQU40Woof3MfU13y4dHtiHCIgZymwrbGmR4Ob9EIpB+x
         jJMCdOpEJy3Zjfxhg0HapmuMFUKchpBIq5nJnN63T/oUFThxM+yukZ8ELWROddyV0yW/
         fATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRFLMu1HLCEJ5AMI6v8dDlejU3ZX4WM4suHtV8z+4lk=;
        fh=WkOe/32ba21bqAWlJOBLBKmbLCuKxDJgUgt6DIvcLrI=;
        b=ea7MEp6Fi27TSnboAYZfKIzDpClweS6Ze0gCRBcI3VH8JX4RuVoI6actMyO1pRFaFY
         eu93tgVPCSWnrXcFHmVikhkK+CI6JIRpS7bQHf0Bd41w3T9Fs92TlzTIrD/LrfGph5ZQ
         +BIwXNMn1QKQpiK12rlEoNMadq0xlVbPvzQJFFrsqLe8/cKggpDPZRgIsxk6WQTDkAWT
         JxI+tZQ0IsOKDhfVVEVZDfda9ur4DB/NOCCNUFHTNZBRuZQyinj0N52q5IdN/dIxLje+
         1TnnWRVBgUWeNBxRTs/EU0y2iFQhrX8eTSOmQ1IrOs1dKjw3H0Kb6uxtJYUmkjw8Tz9F
         OFNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781130484; x=1781735284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRFLMu1HLCEJ5AMI6v8dDlejU3ZX4WM4suHtV8z+4lk=;
        b=MgGOzyHARRXb1L58Klm2HpjFpfvLw2yLZe+zxu5AY7SaQ24JVHgd2AZxR3QnNqUNHc
         rp919R41YDrVHN2bhZxtued025owNpEoXXbVZYvi07juhNjrSaqFuR29jkXzxm8ycECJ
         cve05VV655k7SfN4XCCbutEcpRtDM0j/DjUXS4lYSd5sNRhhC3ccR5+LdpLpVvAR48oO
         8Kd7DG65phgYB+IvZo8KL33K1c9axc7W8cFQIkqivFye6jzmiaBuOkxB1reROAER0kw8
         Z/qhAhbPURvbbGM/fStz8/SWobUeXoY82RjpZet1XwtJVk7QTWAM5mYFPJi3UTsP1shC
         0GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781130484; x=1781735284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRFLMu1HLCEJ5AMI6v8dDlejU3ZX4WM4suHtV8z+4lk=;
        b=Ho7I3mGC4nHRVa6Rl0G+ovyCl2sXva3XDQG7dfvsyDNOkHGndj6hoiuP+3jr9U1Uj6
         Ld3ORr1+rDNIxwjzoX5WIMC9A9PiU2MlrrmoRdLJDXLSJA3IZwBwil1fqJVTtNp9m21o
         ydxjakwNtWgoxLz1tp7SfRrpozVY5kqIRRtaH6lqU+N+r0DpLiJg7xSDu/3aZX3Gp06r
         5xOMiu7KZ3cKYfFbnp3z1eTRAZRg9tE3YCK1N+jS5F9cYXDzdhaUweUOj+VAN6bhg3b4
         CDyFBDrnlI8LuFSLNv3C0i9Zu0Q0Wfc8DPcGUIvtQlQbhEaouyArrdVjipnX4E+pcHns
         esZw==
X-Forwarded-Encrypted: i=1; AFNElJ/yaqZeT2asjTw28swoG/Hc+jdGA8bPbal2BdcbJcEwod+AzETeA0u5ruErEtfH2nV4ZeFEZ7jj2KUl@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxDXZ6hpE/KhQPNzRqiWCS9OIcE1qRo+yQ+PkLy/GvKzDyn+Y
	UDr4xEqlDhpH448+7nsuI1yFjyIP1+cLqc6CN76Tq7yj5audXJ0l3A2vH9Zhy7UkAyWQXa+txbC
	womQCBDj00Jr95fvJNZ07cD77X1QQiyE=
X-Gm-Gg: Acq92OFCh2l15gJEb5uCCcvmkKVIdwZNjTjvKZxBAOe6EnYNVvxsMuqlVyH3Rdjf9lx
	jPoBuwtKkMnK/WyhjvBovpYPcgo9ETbFEH/P4oimefDlhZIOOpdxPO8lzOFev4WzAk7Q8omKIWf
	g/Dz4Xqp6K5M6FZ88IuMgyfAKyGkntH4bLqawiVQRMLksLTbi3j9jPcBYvd+bdd82CKlqsxVcmi
	effTnFu5gVrbE4I7cQkJu5J+QxPzwxvnWG0jjJIFKW6EywVvyb4R0ZhHsxsxw7DRoXk3PFDiUo1
	jYC205Pwch8dvwM=
X-Received: by 2002:a05:690e:1686:b0:660:a41d:d180 with SMTP id
 956f58d0204a3-6614f5f6fe3mr9370676d50.21.1781130483950; Wed, 10 Jun 2026
 15:28:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609161701.52513-2-m32285159@gmail.com> <20260609161701.52513-3-m32285159@gmail.com>
 <20260610-silver-elk-of-eternity-2beed0@quoll>
In-Reply-To: <20260610-silver-elk-of-eternity-2beed0@quoll>
From: Maxwell Doose <m32285159@gmail.com>
Date: Wed, 10 Jun 2026 17:27:53 -0500
X-Gm-Features: AVVi8CelZmi1gbmk50cmRndMjrxvlM8y_gHhzYrS-VpYfxNea0m0VM7sDeWLV_s
Message-ID: <CAKqfh0GNcOAtW2wEBPhKi2GwdVAJNGcgjdJVidQYvOF7oJ2HVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: sensirion,sps30: Add myself as maintainer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Tomasz Duzsynski <tduszyns@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 4:10=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jun 09, 2026 at 11:17:00AM -0500, Maxwell Doose wrote:
> > Tomasz's entry is no longer valid, as he is not active anymore. Add
> > myself as maintainer for the SPS30 to replace his entry.
> >
> > Link: https://lore.kernel.org/linux-iio/20260609140712.2e5d1640@jic23-h=
uawei/
> > Cc: Tomasz Duzsynski <tduszyns@gmail.com>
> > Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> > ---
> >  .../devicetree/bindings/iio/chemical/sensirion,sps30.yaml       | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> How many separate patches are you going to send?
>

Sorry. I guess the reason these are separate patches is because these
are basically across two different subsystems (iio and dt-bindings). I
ought to quit doing this.
