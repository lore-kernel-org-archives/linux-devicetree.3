Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90623C10BA
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 03:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790825228; cv=none; b=EXZ3ugOs6EKtlm65s/YSOYjMEswcpUZ2An1QQIdLFko/tyeZ6tGOYwFZZ3pVgnx3aAv1ykr0cdZVN1eSjAdlZ9rosbt9mouup+jomxguW691vxT8Sr/Sz1GnsvVa6FocD14N2/l1BnkJ7UFliD9eVfRepu3wr9S1yD89gbgVIzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790825228; c=relaxed/simple;
	bh=XAY1dTOwRRbIO6ceOMbhJ+KO+bFWSEcRZxVi+y6APPk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gc8ox2yCqhfNlUe0u/ToMkhBBalieyi7S8a3XdC/nwmUTkjAeY6A6x/3vLEAyFDxyjRfcmEIjs4uky4u12LGNkaxl30L6v1n6Hanab7JqDd/Yuj06l+75iSU5KaMw8ktfVO6Pp9IaQAkKVuoHYHFx3zv1Vjb7ySH9RufgpCC4wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt7/9bIp; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt7/9bIp"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so31065615e9.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 20:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790825193; x=1791429993; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAY1dTOwRRbIO6ceOMbhJ+KO+bFWSEcRZxVi+y6APPk=;
        b=Vt7/9bIp+E0SZTfy4mgg0XSjYauA2f1f5EO8QS6+UqZK3MNAJbqZZgJOqE18V1gfPH
         ec0iKwUVFHkO9zRp7O3IO29/cfNgD6cP7n7uwC/WhnF/V323RWWTTHmfL/yli3K5zp2t
         AgeF9jrsTXgyaExadk+EXmV8sAkqPczfKH0/YXulc5vczfVnO/PENxMpxwG6ZmiLFwqP
         kTEYZaJNIlEgjK8YXxB0HGSR/1lxwTyvVPchVesZysILd/AoWOh+KoBwq0bMdfhxleAs
         dcukfn2gtosf9FTFSMuWlixeegnkXlcoTuPTfrgvIqDLkkLOVEeYGCLebOGfijI9cvRY
         Khhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790825193; x=1791429993;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAY1dTOwRRbIO6ceOMbhJ+KO+bFWSEcRZxVi+y6APPk=;
        b=qqLxUd22MwZELV4yOAhEuQXBh0sa26LT+i/OYd+DOiCzL5OOsF8BaLVL07iBfNxxsF
         j8MdqZDD177rUCt5Ha9BMtqQeUgfc5Sm2wJxSB5bwsqCJAA5spy6q+oJTi08UNI9Viiq
         avfAycfiN+wFEpYgDuLsoLMfl7z3Ip6FG+lrBgMn1ygrXmLdn0omrpn6Z/AVYthA9cw6
         GysgQUWsQWiyWvRimesUoCIRZd+IePGsvAqNkSs0ucCU8yCHa2lZi2ph8RsXJqkKGlSr
         DdzT8L8hRHiGXH/yOONpI+TfSi/wPH1SbKaQE7zAwQo/Qj1bcFRGPsw4LmGmFT9JwYM1
         fG7w==
X-Forwarded-Encrypted: i=1; AKwUvBxhzu5wi77cCD5RM9TuOneuE8A0wgio5OEhHccPiHyvu/bq/mCiBBCYuRu3nYFSCkbHJRG5s8C/bD7Y@vger.kernel.org
X-Gm-Message-State: AFuF++mFREgZX0M/zF5RsaV8KLI0IoA2RTYwf+xfFjUlkrYwHmMeLTNY
	MpjfpG4oVviZd+BLbqmXvhLLsUzFytj/7UNzNhWhBZBAqDne2lW7VQZXXBBA++eTmiS5RIov
X-Gm-Gg: AYBFou08RWvHFgh4y6wNITkwpaHPatK2UpCwx9UcCWBL4/WbSgcxSROKVTJDSR0x6ff
	QmG9WfQyOQF07sZdml6YppyUWMb2Xl8E/BOi3HhXTZ+JYW1gV2GCFlQmxab8jv+cm5CTVepfZ93
	dQQ+I0Zh8GBtyjwHt7/ImNpifqLkw2C451u0rz8Q48YISLzDOmw4Rgg/tLuDyhVH9iVLENTAORk
	N3ugs4Ptr+6SfXfvgFq6apQbpCo1VV82lBqd0zRwF6Pxabk5zNyyxjzV11cpcSl/FdCGcejlLY4
	QwsiMOgXY6qjiOrfhp+3T4azw453W7njsTJ+uuR2nf/1z9d5FT9Fk1cbr66uD4/ESBpxAgQOXVB
	75/K5t038P080AhMuNRGpVoYk02txiC/BUzk0MZJw2F+59/bQuAui/pqd/jpwvn8gz/OOsLGGRQ
	RZwU2uao9RgjntezDTezxsUY9dC5m9vdUnNnmnd1c+dHPGzAFXUl1nuB4Np4Eo8jS91nTO4xhHN
	rcKgzd/+AICLcl1yd5Rz/XhLeRVy8YiEg==
X-Received: by 2002:a05:600c:6815:b0:49f:f963:7093 with SMTP id 5b1f17b1804b1-4a01b00d679mr55372455e9.23.1790825193330;
        Wed, 30 Sep 2026 20:26:33 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9851efsm36483535e9.8.2026.09.30.20.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:26:32 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Jason Li <jason.li@cortina-access.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject:
 RE: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com> <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
Date: Thu, 01 Oct 2026 06:26:15 +0300
Message-ID: <179082517588.138645.14615134489246049313@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Thu, Oct 01, 2026 at 03:17:28AM +0000, Jason Li wrote:
> Yes, they are actually same HW logic. But the brand name of CSxxxx is
> owned by Marvell instead of Cortina-Access now.
> Will there any legal issue if unify them as one driver?

Thanks for confirming that it is the same logic.

I am not a lawyer, but I do not see a problem here. The part numbers
only show up as compatible strings, Kconfig help text and comments
that say which hardware the code runs on, and the kernel does that
for chips of companies that were bought or split up all the time. The
driver itself is GPL code; your additions would be under the GPL as
well, with your own copyright line. Nothing in it uses a trademark to
name the product.

The plan for v2 is a neutral name: drivers/tty/serial/cortina-uart.c,
SERIAL_CORTINA, port type "CORTINA", and a binding with one
compatible per SoC ("cortina,cs7542-uart" for mine, a
"cortina-access,..." one for yours). If Cortina Access would rather
have the CA parts described differently in the help text or the
binding title, tell me what wording you prefer and I will use it.

Thanks,
Fil

