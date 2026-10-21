Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618388;
	b=s97tFNRdpHPpEWCCnCHO2NSYb5pGSWoE8MQdbMUBEEd4xqj1f1jEP65TqxyTbwDGeidR
	 oo97msGTQdwEfG6AR+ysp3P5wZP9/Frd3q1f4avLlWWO/dxSBqTSF/HcW4w7aE1ikHMGJ
	 TzTLeUNeY9yhKK98r5CyHaNGVkou+xkUuFLsPA50Ov8DcZIBsLVaEomOPAagjuk/Cr/xL
	 m7sBqzLgvA7V0c6aoR5rVIy1hNcXnoGb5OM6AyAVT/qPMtRbXrkz06ZIEeiJTxfR1uF4A
	 dJKZ3t+mCopx9CWIFkBuCDZw5AD4GCXNWIZG3aZcV5zBX1pdH/xW2SOTvTXZlNj2dtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=UCwQNMxH+F/zPUwqh6Mzh/IhhNr8THI51anSCThLEEg=;
	b=R5470b7lKZ0j0K6WNb/Del+nIHVWIjE6Q3cK9PQx03DoZWLF/qoSffEusBRAu+UUs+cy
	 b+o1dJx4Ps/as21JwahKSP5MBpNYA5JNl0EH/rPQ7Y2pX5RNck/ds+g4pf8rlQ+sqJzdl
	 DtP3euyyJsWYr0kdetQuN7+hywifPY7+AG+I6w1g1wSmzz36xLgglQT2BZswlykzOLdhr
	 CVj7lnaaQlYmYETZo8d6l4NrDstpK/A/NhhDbqY01+ma/FBlP9M71FqbmS/Ll7SsE7stn
	 FS9/XJ3EFQX3v8p4Ck6OokWn0awL1lqrMxa8JjcSOapOXseI2hGjOscHl3mutcDZBTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SsntEoPx;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8B8606A320
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 21:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E8B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SsntEoPx
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14fd9dafb0dso515597c88.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792618386; x=1793223186; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UCwQNMxH+F/zPUwqh6Mzh/IhhNr8THI51anSCThLEEg=;
        b=SsntEoPxNYjf59X7OOg/LdIMa8dn6XV3gAPoqbAmwMfpoB75Xd/teNGbBc7/pZzBeq
         Un+x6HCULBezBckOVhQ7iqYX86Q0Csw2zo0KnodTe93mReqvdNe4iWwzlVt2SXZuHDl0
         e8wtjwjh+lzY98rroows9JxtQ1Pc1hh+myBfYo+iUxFTyGKzPSqiTtlwSmDBV2cQAUNo
         5WDgIrs58BennY9eVCaVYc6jMujI5u7pUKdTSIoSwinvN/VxnT6NgWoV/Te/DUxMDEot
         QnXVQVe/MOn9UJDgmNSDaJBAtEPZUK5xfk3ig10ZSme41lcOb5Nyng1gx0pG0G/AEBGs
         p48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618386; x=1793223186;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCwQNMxH+F/zPUwqh6Mzh/IhhNr8THI51anSCThLEEg=;
        b=FgEcWIyRVyx4QaG1B5cxC/Jbw3USBGuBB3prizkpuGJbKfG5uhccYGS9yq7v8PiUB7
         Xf22J5Xcebq2+XRueEvjK9pWpvKkgegC/RLCELakR2lay7uyFYufLuq9bvBsWRiZgw3e
         N5/OMElcYwFKTdht4YSnXnbVPC3ZQADM4jZ6hyuw5nXSeeoZUi5Nf+a9viKV96STd+Qm
         4sHSIbmqQcqnQNxvRt9Tl7Vz0SWRm4DPHcC0PRRivwCTsH52hD1z0Da/ynXetIEIa220
         UVBmnp6SXg2/qLnthFbSj22FjYZkjRfn4jeeifOFF05vZzfoYka4gCxNX9mWlOMPEIj4
         5Mag==
X-Forwarded-Encrypted: i=1; AKwUvBwZLGFEkcQwNDLhoP6hjRVqgu5ln9FJ4quUD+e3G9aH7Pr+XXiAinFN8mFEn6Fzt839A7JklI1msLGh@vger.kernel.org
X-Gm-Message-State: AFq9FYIXcigBqFOGuzAJqgDZ4M8nHV/jWXwtwjdgFZjcTgJKZBPSz6x8
	0UREsoPC4jYF4dwGu+W4cr+xUsybhhGLmhx7kNp3URvdJHDADZySO2nT
X-Gm-Gg: AYBFou2f85lRl3aZTN41ObqgR30zWhq2foL0o0V3bAEyBHO8ECMZk1t5KzhF7qlWHmO
	eNHwc8yjCU3Eq/wXtleueC50+crkESDkAbRFo/LzJg4k0LliqNQOQY/ts5+CPJyKXwxd9eAYVlu
	FwF4QHpo0mDVXLDiATLmikXBSJfBCxzDu9afQiqPobQNBLxz2kI3bN13bKhq4QTwpOouO2dFQaX
	SCWziIlY89KpqNl2MnUEYcq2ps5aIkAJTlndscatXcQ0q/cAjShC+jSNn4f3p5vnRH1cRl9u744
	So6a+ZPIBkH+4HHCYfr4Z35Mn8H+WEuh3E8WUYWtou4TblBS+c3Ko6HOC+S3q2nsgGDEKJy+XIf
	M4rmP7/yBimH88VGBBzSZd6Rah5rPL3WLrxC2VAYnWOL6FXVATSBLYR+n4O+5Sfl0Y25rKjOyjN
	srMKl9S7aqDrBRHEtFJP0FGqVjAc3SkjLI/TqbIhNcFHvibKTDlWzHbfaQEwd63Zv1cRodyIeIP
	vNROGIrCfCNckQq6FJrooRLFXnI/ITyojfcJgjk7FIfVOeDxHVyZeIu5UzrX8zcp0rKwRu1X2p6
	ElVarlbi3Lsv8Q==
X-Received: by 2002:a05:7022:1709:b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-190a051ddf3mr3686389c88.3.1792618386343;
        Wed, 21 Oct 2026 14:33:06 -0700 (PDT)
Received: from localhost (host-190-210-193-254.iplanisp.com.ar. [190.210.193.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903b3d0530sm9368959c88.11.2026.10.21.14.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:33:05 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 18:33:01 -0300
Message-Id: <DMAU6JSPOTMP.2LNR04HDVF43T@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 00/10] iio: adc: Add TI ADS126X ADC family support
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
 <20261018023129.3abeb679@jic23-hlaptop>
 <20261021195611.14cd0a2a@jic23-hlaptop>
In-Reply-To: <20261021195611.14cd0a2a@jic23-hlaptop>

On Wed Oct 21, 2026 at 3:56 PM -03, Jonathan Cameron wrote:
> On Sun, 18 Oct 2026 02:31:29 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>
>> On Sat, 10 Oct 2026 03:52:39 -0300
>> Kurt Borja <kuurtb@gmail.com> wrote:
>>=20
>> > Hi all,
>> >=20
>> > I apologize for the long delays between versions. This month has been
>> > very busy at university plus some personal stuff. I expect to have mor=
e
>> > time now, so development should be faster. Thanks for your patience!
>> >=20
>> > Signed-off-by: Kurt Borja <kuurtb@gmail.com> =20
>>=20
>> I took another look through and it looks good.  However, give
>> the sheer scale of the driver I'll leave it a little longer before
>> applying in case anyone else plans to give it another look.
>> As normal, if anyone has it on their list but is snowed under
>> just reply to the thread and I'll let it sit longer.
>>=20
> Long enough I think.  Though given I'll be rebasing on rc1 any feedback
> people want to give is fine after this.

Thanks a lot, Jonathan, David and everyone that contributed :) I'll
submit the follow up series starting next month.

>
> Applied to the testing branch of iio.git.
>
> Thanks,
>
> Jonathan

--=20
Thanks,
 ~ Kurt
