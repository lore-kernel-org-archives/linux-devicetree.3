Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695590;
	b=lB/zc8eGeWYU8bxFloEu/XlzPaN8q3+IPR3hFkWOvQxryLVi5Cq7SdT7ltbT/65gnEn6
	 j/hWcJb0E75DhwVeoXV2PxTUdBWkvngnpGyBFhLRYV557K8MlwHwaC8DuzPVAYnavgebV
	 gQa/3VLkmifXUX7wyQ6wXBu+navnyDKdHArGtoMVZpRdz9AlaxtIXraZP29+yGaBUZ0PJ
	 PYJkmSBTrm8x9ImB7rd/IAIrYaABIfUvrwzU2AkmOMWTIFUhO09CSfhmAV+L0GYnTCTN5
	 ThlbEWQH9hQnDYYgcpN2s1KbOKPZNx22jOliZXTfjqiqv5D3BTuTnPMqSb4jtx4SbXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
	b=caBNFlr4Z4qyy/yvFp+30JqivkJQgLkNuVhMafWVFt+aXClwCfV3BehKXnRIxJpyNAdQ
	 BEJvEs41edRwaDMaDq8ftv4DK/HiDTdAb1ATLBD8RFT4aWUXMXMXJJFXik0SrvAnGKKH/
	 fDbEgHZnf8oEgYTuwb+EcF3DoAPlT06K07sHPf5ZidM8XbOhv2yl5xGDL9CfXV27/kf/o
	 FZXhYCxuwxUlXrSwjg9Ssn0YqmTlOw+cYkrxsAilqBXswc1F1gYUev7xqiBnqHSOIagdQ
	 AU5gEjCUBlvt6dF9Ia/7YC44Mu9iRyUNevPewQ3EyAi7gz16HR9X/ybyYtl2gDpQIqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmBxGrzJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15008606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15008606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmBxGrzJ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38190551625so13508139eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:19:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695589; cv=none;
        d=google.com; s=arc-20260327;
        b=CrOF9x+rin/sEzWQfTxe22lYWRxR6KsSRXISlmEjvW4Z45YifiF5eDnOFTU+JWsp+v
         VTVxCKkMloe+Lla6emicGoGscsHEJCfHUin9wRmoUGT1BEWMSMBrrZdiEEJ9b5KdTWXi
         xzxswBbFN0PmDmuRPzhL2ez6V2uSoe3lHuEx00GWttjMgjJXnkgkFyTbAGpvw3phTU9h
         eLjANn2DAx/syZ60tgK8q6ro0GUaw+5fryNkCT8U3hKYcKOFCVeuTQPXN3hZavU01N4X
         IupsKQlZUyorjoMaOA1p3/Eej8me7KQiwURrm1ulA04SzPf+mZyo8IFjHiQLXbnYpB9V
         kvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        fh=GSt6q2gyJQsbjyRTKUNZAD8ZAJZ0EGmXsmDdlywe/qI=;
        b=nyQ0/wJqipwNVJ4ksnUcBtUow1LidkIzSXe8xfBDto59mGFaQElTxeiapUnjX+kRmN
         ref8CewmP+xwm26l+2emgG7pnD29TK2ZQ+E1lw2pJtZ8k2HTceEX8s0gYOLy1CJAkpyr
         Yd0GfVOzwiVPiqalkT/jvrHSLZ52HqdAgOeP2RNqxs9M+/mPH0Uf8f/7U3ZFedSKubQD
         PEToLw8IrO8eUnkz+2fkvzMKoTp4LLUI/a/XqVBVPjckxyE0vu7qZ9jurOD5kTo9BJkC
         4GQ5xgTZ7/x42w5sKgU2pw5ka/8Ypkkofi6B4ZtKAow5YWLoxGHQFWf+MDuaHl0FMBAg
         Yb0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695589; x=1796300389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        b=ZmBxGrzJhTff5aHOs/gdEmaqTtmzb3cNqrz90ByOV0nsd9sPJVTvPw4ib2z7Xz2U2T
         zeoXuExG6ztFaCDOlqkdQEmEeMK7kF3NEU5rPx8H1zECXtvx2SX7/ffeOQKvQZ7oQRaa
         vZDDRbGBOrawAgXtQ7876XS1JciYFJIeqr79tg0yZUFupgk3irXaVcRXDKYdhGbqI2uU
         K4DSTfkrhdalXsS5yJt5ndgebJqzCOYHImC4VFLvkqLiothLQPNJi2B+BL+2Pkd8Hsy0
         7npPQ979+vZbmCzyUXKxnAcXwyqxDJw2KLLTk5aknnzK+/+CkAjtOXm/iCa6EWAG/HOu
         m8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695589; x=1796300389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        b=mJmn7WFbKg/mTUm8rkZfocy4Huh4tY2voV5GawqSRyCehUgI0dBejFBzFJO+w/Ga7f
         LktnJI4v28/zx+M9ZtSTy23fbLVvsGfx6YifnBf2NDwkuWmNsoJYdspKELKw+CTeFiMz
         iocdEgGwTyNCDv5pniyVb+ixilblHnvWiKHgBcEWRcCChmUnPdFQy6FYBuDczOP2fZB0
         XmY/A1daAxGHQMIHSx5mEBX5YGunO2ZRXASSJxU349ueKQNhrVH/Qfxu77aPysFHHWp8
         5m38E6axhuL1V5TspoZlI+9LMUInvijgn0NCoPNtukC+YLFGK4ZLt54bb1AbP4s+izmX
         MLzw==
X-Forwarded-Encrypted: i=1; AL+hErEtQQZnBAybzTkJ/H9hi/X3ESagXmvfW1wVDkZSHztX0mnMZsGL6gbuR6mv5EtesFjdewktIYPWw+Gp@vger.kernel.org
X-Gm-Message-State: APuU4Z/0GWPFhYOIHziQA6WfgrYIg59p9aVaDhuY3hToL391QMekcz06
	Lpn9i5ztFnO+teaCqviMlRnSK3iO2+lPmjgL4in68r8I+4nQZTx1SAKcamLhlEeafh5APQOU4Dn
	PBMV6tISLNt+gdQ7Aa985sFtXWNFJi8I=
X-Gm-Gg: AZFdTZeUC4RvTAzP5Wdb0yKjWAJTM+Kcrhx5i4y/p1R6PV3dWI6YDMnpK4F2Rpx7hUB
	YMP+2ccWQi92S2ARIfCtHtA0ay6VFsY2p5iCtDX2sq4TXiozAHU6jgNHCiSxPHi/jOVYXNyzmhg
	iNPHabtV4d4o+piFd44c1Go+xncoGJXFRi4dO/kk1ItBBIayZHzceDcvlL8O5zERDQ7pfNGk+/i
	vL4MCJcpwhtGld2oYBZ9OwYjctrS0cUYz5/9zQSxR8AG+BW4yFJu36nPXDHcEVDqyMr+fXJ8PR7
	uAtASzGNllnrpXM8oNFTTm/TY4agZFtk8NnqHO0zCp3ongxqvIktaSnu6U4Ym+r7ahNVu50ydUQ
	wPxbYjmDp9ve8K+LbSL+Pv7omZOHzSB3nuTE4gD2vrx55zP5fDttw+ghaDRv5qejCel7+IrzNWt
	8ptq22hT6AD3uCh+M3DY4dyVOtjUt8JA==
X-Received: by 2002:a05:693c:895b:10b0:385:cf42:9b98 with SMTP id
 5a478bee46e88-385cf429dcfmr20910606eec.34.1795695589053; Thu, 26 Nov 2026
 04:19:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115085826.89641-1-clamor95@gmail.com> <20261115085826.89641-5-clamor95@gmail.com>
 <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:19:37 +0200
X-Gm-Features: Aa3M54o45-8oLpV7u0fds3mVX__iIW7iqATGNdrlwb2jFlsQvtadJWGIKMAZpQU
Message-ID: <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
>
> > The AAT2870 supports a dedicated main power supply input alongside pare=
nt
> > power supply for its internal regulators.
> >
> > Add support for retrieving and managing these supply regulators
> > (vin-supply and in-ldo-supply) using the regulator framework to ensure
> > proper power supply dependencies and power-up sequencing.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/aat2870-core.c            | 5 +++++
> >  drivers/regulator/aat2870-regulator.c | 1 +
>
> Is this a build dep?
>

More a logical link, I can break it but it still will be part of this patch=
 set.

> Would something that was working before, break?
>

Other way, it was broken (aat2870 may have a dedicated supply) and now
it is fixed.
