Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523136F8EA
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 18:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954931; cv=none; b=sHQV8d6k2gOIQzj6wRP5sGHsA9qnknnejyxMD7l7D4ejCzTp+1yH9CpAGEF22qKsq3IS7BxOJKhl4Laamt81s0UNdr8/iUPdDKWtOYzdVKbjpNZm8J7VU/Xv0+B5WYv/3IvIGcOv50ceU0kIEohIgNMnkn1skWGxI96gaVAVhkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954931; c=relaxed/simple;
	bh=kGOYNbAuKxdQW/MnHl95ERC+sWY3074gpzJrIlh0QGw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=rF5kXmFdsh7R0Dd59Wr6j7slKwx+6N1O4yp1MgKeBowoO5XB/9uVoP96MdEvTpiJZTzSqBntCyRfn9hpmwggANmrczss1mjdPorqaApUzNsZkVR+pEZaaIByb3+cuxtSsuln9exEdVZUFpandPRDSBNLBS/9Nx10n9cVBG9MtGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=GmPwhfs7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="GmPwhfs7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8486ac3f347so190291b3a.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 11:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785954930; x=1786559730; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kGOYNbAuKxdQW/MnHl95ERC+sWY3074gpzJrIlh0QGw=;
        b=GmPwhfs7PBXtoRreJeOpehV85cCDmC5eGEsXQm7lW4D7+P2ExygAphp4Z1nWCHmyZh
         01eoU8c5hTkHBlv3mUhPFFP9WOonyAHL2YTcUjiHh+d3pOpft2ojP943AVxbGp33NBoh
         GGBVmtAR8TDnUqBb21Nu0lu8CAcE0q4+7whTVUEEWI04QHz+XmbopsFrxsATfIYoOZmh
         rPbW0hpD4fYH4ny97NTLVd+8VeGgYb/mK7ALXHXcZnugeIIqEKSawAfhyh3QWJuQmxmU
         3CZ+twXZ+NtGOmsaZZvwEAnmNeb13+Ix1EJNrFxr3wzTcaaO9MqyLYOdYKzAVFw4xzjg
         RvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954930; x=1786559730;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kGOYNbAuKxdQW/MnHl95ERC+sWY3074gpzJrIlh0QGw=;
        b=Bz/Qu+ssH1ToLPNyxS7VOI5rHN9dSFBot4SBfRFoO3U3oVSO/VS5zqxsAtO10JClNX
         yrDAeaR7Qvah86KEXwmONxXNL0oyqALjIkbWwSNupwnS9iWgBkRLblNMq/j003vpZPGW
         curDmh+6l1Ivg38JrEiVfNZMXH8y1BtwVja+tQbHVu4MWDpNWDMd7CLODA+/WUlT5ef1
         A8ftw/IOVTeeuq0akhDWkRQThG2eDE5DTyJjypVRYDZmLb4rhlu5/+OBdPW7WiQR4cp4
         fsais6RxOYA8iXHFv0XmXbazC0ZeAMAYCmYAsGm0wYPdLTfHL0N279mLh5zKB85m0sYW
         OHgg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5rw+5gd+LaSRh6Soy5+jjFzgIakWIxwt/8MyI+pis3JRef2nN1kA6SZB5uq7lnjAFHH0G5eoKbSis@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/U4kfjCNmAkiT3B9YJjKko7s2yz69PxBAx9lBupxNFjc+CG24
	sS7eUEscKvHjkcSpwZrUO4Dm1Wqz8EokwQJKY2bEAqpQwNI09VrauLXFl8cQvYaniwzA2+cq2J4
	wEppJdwc=
X-Gm-Gg: AR+sD11EmoB5BLfpyADtk58hfh+2/khtxanE+B3LsCVeYQvnRaVztnZIhL29EeScAUZ
	v32D+amqkspcCOvLqNROXqC9bnwTKmEXCLaChEKjKhdoJkoHDQ50tSDXg8YyRL7ZdfBLEKYpyK5
	ixcfO+grUpNnwikea6ap8jr+qSsIr5DmRYsW31adz0hCsOtqDOs0DogTKqQR7dSHcmka0oJYw56
	FCfemxD6CX0SgkvGDkFb6FKafnK6Xc9/n0lUGiSWcSecQiD0UMssoJ1+eAUhyH4PgFAx3tO9d7g
	rDoKWmMz2LJcDkfIMb9MZZNjdLX6zYKgiZ/twf4J89DhSjL8UWhfdvHXVyV9GTos0u1KvSYY8LC
	yz4cg6Jxj6M3m29fnNhLuFM0ae/XpZkK6OlpDYXESJsy0JSWVogu2U+xpokkXKpZQf/NWa1r0d7
	C5BIb8IFs321NmCFZEHDVMsPmpqvyA+zpMkFsn3HTEqs09Wrub5Q8o41mrSigD
X-Received: by 2002:a05:6a00:3d10:b0:84c:2d22:7307 with SMTP id d2e1a72fcca58-84f41d26594mr1296006b3a.13.1785954929647;
        Wed, 05 Aug 2026 11:35:29 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e530a5asm1271198b3a.58.2026.08.05.11.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 11:35:28 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Aug 2026 11:35:27 -0700
Message-Id: <DKH86MZNJKT6.2SREZEG2LAISL@nexthop.ai>
Cc: <robh@kernel.org>, <saravanak@kernel.org>, <frowand.list@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/9] of: update /aliases lookup on reconfig
 notifications
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdVw4M0Cvc=LJZfRBA0R38YA1zwJ6aOWngL-FDBnPPO0-A@mail.gmail.com>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai> <20260722-nh-of-alias-overlay-v5-2-2abe2bb9cdbc@nexthop.ai> <CAMuHMdVw4M0Cvc=LJZfRBA0R38YA1zwJ6aOWngL-FDBnPPO0-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed Aug 5, 2026 at 1:34 AM PDT, Geert Uytterhoeven wrote:
> > The rework also fixes an out-of-bounds read in the old stem parser,
> > which tested isdigit(*(end - 1)) before checking end > start and so
> > read one byte before the property name when the name was empty or all
> > digits. Such names are skipped now instead of getting an empty stem.
>
> I think this part should be a separate patch.

Done =E2=80=94 it's a standalone first patch in v6, with a Fixes tag and
stable Cc, so it can go in (and be backported) independently of the
rest.

Thanks for taking a look after all these years.

Thanks,
Abdurrahman
