Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B25456DE8
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726915; cv=pass; b=iK6Sde1kaIKU5nIeqLYIn7PQOOftSFUkMHwVUGfXjPwi8zv/HiwKMuwBSKSO8i1vOrF7ynOGqNmifPn6JdT0DfVKCF5urALVSqU3SUdkPUUNd4vZMqI+mUk5PxDtPJNy+n+g6Lf6WLx84rypIZu935ig7eD03I/q8NETlvZcaxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726915; c=relaxed/simple;
	bh=RPdJBjQS94rIdDl5THsCbJPnrtAJLZNHcWn57qXRaUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ntyf7M+XWyPTOm9UIaHsxEq4F9MFKYj7/Pohc/wxucrIHeZlg5o4CXm+JrzqakB1bZA8YFoyueXwPz69Yf1NL8lc6mmnxq3u8FcraQzjjE25p2cNb/deEocGcObkBBQl6/a8TXECHhdRcWNawxRyUiztLEE1zokVBfc9mLk1wSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvHigOoe; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvHigOoe"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35943f55c06so626589eec.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 06:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791726913; cv=none;
        d=google.com; s=arc-20260327;
        b=pMP70tF++KkEvOUoTVlnlyZke12slYW13irGEmQ68g9P0u4Tmi/gGlJVifvu2lo401
         s40eUQlMI4WYH08xWt7WyMCrCwHYcgYXmJYzzvGIkUhs9L3aiV6X/Lxfak0elsO4uFsB
         TOdu6oCnmskOQ6G8NoUK+P/EKdyUQgKoLT8QRLhl1v5DKgW+w8OqOBSD8SzIFvEmex9k
         qVlJEDviwPh1zhu1WnRdjgg/ONstSkRGh8vfmEgmhc9JceZgDF6eibLQkZrUwVJgwmVO
         oF9gNQoKt850mgvOZieEpt69/7DVz+qy/49/R7Jl6GjR2k+jEt6qrZyY2s1V+DDwCMza
         RnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yzc0OsJfB0tmO67jDz0GOECRwoKeZWwFGcdPRYCLXGk=;
        fh=fGIgx9R9qLWFXHYN2PMD7ZWHH5S81bdDPtdn5zVsb8c=;
        b=Xiq9lmAskK7oUhAAHWesjY1I+xOMCv1J0aEPVOtrECr7u1J2Cn/b8yo0lBfMBPxlNN
         SriF9EGuBdrntRArJgSS6JitUl4AMfHdJYGNdk5JcZTyPEefbdyHLuF91Pftg7JipfL8
         o1fk1syKhAVL4stOVEGjF06P+wJismeMRi9SRHxPhaFeG3y8ztGZpdKxZiYLue5MYZVp
         /6ZY7S5hGvj0q6RftnwC+IC/JX8Qda+VNFFlL3zRqQLZWe6E3vVOm4EgCA7ixXJNveCP
         MBvhuy35OduhuZSZElrE1Ld9oqEwYfP06Gm0b9GGZpmJWF8X0A+rw5u3nLToxsfwfZzx
         NWIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791726913; x=1792331713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzc0OsJfB0tmO67jDz0GOECRwoKeZWwFGcdPRYCLXGk=;
        b=bvHigOoeZ42WfySP5kE8X3ncfWw0x5k1rA/B9Kr/zfs8/8wB7RNB9YJyggYWKRkwhf
         Gb0dGSPBCmoHx1rWGZmuzYiv5nG0UwoOGVBqqTuiLrzLHW5v6bIl8iYXT2/y/YWZWMhd
         8PgGeFruFMyU9thriQ+YoQLLHMkpjEMMOrm5oM1Din9bqblFq6XP4gIs3OY3IEWO9dvl
         wCdDt+fmKCQbDt+NWoeAdm4vrhc9GIImxI+x2pjVv8Fa+LralsPFgKybb8yhBuHW1Moj
         zU+qNb67poGcYJ91Ve00b8mK4LBCTpqRzCKSdg3SMhh/iICo5RJgAzVjVd/YbstexOfz
         kBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791726913; x=1792331713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzc0OsJfB0tmO67jDz0GOECRwoKeZWwFGcdPRYCLXGk=;
        b=f5TIbcUjhT+izb1cFZMtAjN1PRpbun94kko5Vgn0cQExvlfVXsNGHyld5YZ3+S9d31
         Mxkh3WHoiPQHEpaG7gl0de08Izr4IxaNuwDkHeRTYhVeERljXw8o9Ib1rEZL+DjQ9hIZ
         0/ciXlCHzoHHaZaB6EF2uir0Pni+SR2L3USl0DSEUudNJ3IY8V0DrD1OYt4fzQg1Ga7D
         OZdTl7Kd3RwRzsF/qYjalscBH1dagDZoPTozaNuhvrWa6jx9aGKLiG8GEjqe0+WOCokN
         OvaqkTHTmBnxk6e5+jdPyc+24/1TnA+g7Us9CZjq0iLwX0t13WfzE5IgGyLHywxfU6QH
         1lFA==
X-Forwarded-Encrypted: i=1; AKwUvBzoML9V5m4E3aSQK5orETnHPhHkCDHMUoYH6sAcMsT+8SJBqXRPyZh4fyk8wNPHaXDMWB8lQeJYuktE@vger.kernel.org
X-Gm-Message-State: AFq9FYL/98uJ+xWi+2FM3cdHYpAJOsnKkKJr97A7+pSsep170Wh2i6AR
	2sJfjXL+GA0tV1oAf7Gjnx9slXZ1xgpbMy3DSV16OePGPraouIThsXogt9ZFyI9IU20FBOUffDy
	2ly33O/FjprpWT8RVk/iYV9ZCv8LXZ8w=
X-Gm-Gg: AYBFou2Jbnd635gl4z5R7M3CLke4UA1uqoHHM/39aDgSQBF+bnfS4fRJLy6JqMKtQyG
	8rSL0IopLK7/2Bjefe90qI1Dilw4+HJgz3dcb8xrLUACmKjhx7Xt5r/NVXK8diOouHkf8ff3RsO
	Vl9P3vxawPCz62Ep4ELLGpN2jg0Zq6oESY/GuNo1XHgdMKARbsKPoJAkDT/rj6Q5leVkEcq/NIm
	BpDC5UfsaP2jXLIcJLDt42WBBxuhDp6NY0GrG3Qf0mBjMxCfYcIg4Z4IeW1lT3gaHTRrnmMi9rr
	NgysRllSZVSLQpuyDqDtQgrkdsnawF2acBwkicB3g1q7YMrYaUruFrsNqdRnePCdwmCrMHSMaKD
	fptkQ3hZnZjvO
X-Received: by 2002:a05:7300:ea85:b0:359:fb64:11d7 with SMTP id
 5a478bee46e88-359fb64144dmr1830270eec.11.1791726913446; Sun, 11 Oct 2026
 06:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
In-Reply-To: <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 11 Oct 2026 16:55:01 +0300
X-Gm-Features: AclHuK8-aWVSqr-fIGX2d6PvgsPFFBa82zkZg_sbnfasoFphZhxLtr43s7c_jd8
Message-ID: <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:2=
8 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Fla=
sh
> > inhibition.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.ya=
ml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > index a65d92522c9cf..596b5e284f44a 100644
> > --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > @@ -31,6 +31,10 @@ properties:
> >       maxItems: 1
> >       description: FL_EN pin
> >
> > +  flinh-gpios:
> > +    maxItems: 1
> > +    description: FLINH pin
> > +
>
> You don't seem to make use of it in your patch.
>

I don't have to use it in my patch. This change completes and improves
hardware description of the AAT1290/1270.

> --
> Best regards,
> Jacek Anaszewski
>
