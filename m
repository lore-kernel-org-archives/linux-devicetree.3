Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD9A5372F6
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917530; cv=pass; b=Y+povnX823HWF/tRGxbDeqjxZ3USpu/OsYm7jYlfIWTzyjGvkrTqAMPdeeIMGqngKlkUMwforbe6blm5lVJWzkiQJ/abo4KzQy1ryoYPLr6+efhbTrAEird8iNg7hLO4gGtLX7eeMbWb0TZVMoZ5Z3ezqKLRD1VZaPR2IQDvvS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917530; c=relaxed/simple;
	bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEdbu86lIdjz7rd6vZEN1KAQjaPlRNH479uU5Mzmg3CeDjXEwpuERJtdG3lzUCeqwu6k0pWlql/1gJIrGWo6omiblUCv7ZwC3sYlB9cqfFj6pYIq5xpfYMYMWsTdNZmXMdBSh8H64YP0Ze59380nfBcpMU59KtTIGJcPP/MEwSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PykzCV8x; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PykzCV8x"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1611477eec.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917528; cv=none;
        d=google.com; s=arc-20260327;
        b=JFPwxwvSEObc9zLVy/vFIiuPCTXI1YJqy6oXxI/QHWvm2Igd2/io5pC0/YzHN+1w9S
         nXv5ZUALyykm37R7hLjrgo2BVe68NW5ZTkOjRe4Pafxr64HFXcwj6P3NRmFNSvKARu5r
         YMMbslUutxSdjs5/Ua65+UUYgZnObe2hWNPcnFTNUouTkRzUZGehAcPCGyuIHkqKNNUq
         7vwdZHi9+1uWRw6sk+SqUjipfdrRG0ahPb/EEsJ48VY7G10mnTOISr+BcTw524JEbQp0
         U/M0oyp+yJk4vrKhnF8mXeg/acZxglf6EQTgqvzEhXQZFuTritPkMPY3s32Nn+vpOnZG
         lpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
        fh=EE16FUIN64gMyc9riE6SyCzenDGd2/bf+RbvbIWJQ28=;
        b=Grr8QO27WRxjfPoCZfo7c6QGr+Ecz44TqcECRjN1oRCQcwye25E1XXASgiIXuPe1h2
         sz09VEeih1j1frPWLLO4UH3kgFRrnpYKiYeHT1m33cR8MMCOu33+L2l6ZR8v1CxODgd4
         aevjFtZ4aImoNEomM9F48SMibd6s8qkXcrpVE25sjk2eFpCoCsxW5WFR7WHoaJ1m9oOA
         2FzAv1NStlu+s3KO6Jv03M+xZxV4awTP30xvgTu6AUVrgUmypWa60DxDvSGw5PyiqtK/
         Tav21HNzkgJSUiwrBKYr83+NJfcHCQiLQyHJOXkJnWKpAZOqnG6y+Pat4t5UNKj0zn6u
         gfhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917528; x=1792522328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
        b=PykzCV8xwXJqSXdgVUotqocQd/VuQdr26NM5/m7EPp1bIC5NZSM4Pq8x03fGAnniTL
         FHg+mSdlQ7C6wzK0+yLLcHF93JJ1oT9mfy2E1GHDoxUePwyiUXJ0hjswwWyYcoUWjmmi
         X9+UEeJwMbtLwTw4Q2sCJxxmZkBre1dB82Zf1kCBE9I8o/HvVW367tpnSj1sGarOvyb3
         jZt76q+yxQwSYf7USqjXNrr6iQieQtsqdRM3NVZ1xRDc7Zk8CKNtdlHyOJSJe1SY9ZCL
         CFQ0aZTT0I7pHiNhfNuHPATrx9w8+3kc4YAqfsBly4ED1YSmBQv/AFj/CwNl8rdd5Sfm
         GuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917528; x=1792522328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
        b=U9Y+OH8G77MAzL1Tk4d2D0Uu3Nf0Yspwr5rkr4B5hk/KSfQA8m9LKyhxvk2gt10s8/
         rgSldGM9roGYb+HJFxU4XplUvDEUnU6zK/ydQRep9gUJLA2hm8JCvqo1vRB10HTYjHeI
         Xyyl+xrPsxdu7x9yBmgWGhOOv15i4EUu6DLPY9WNowon3BKuf5rKdRI8/jNWMVVj8hDK
         y1KhkEeFQfYxquurFOv2sazcpYksTuEIRsEq+TT5fW34ITa2cdz4JvmuE+PT1T/dvOEZ
         2n7enOTS0fncwQwmQ/zpe0XNDSprHvNOJyO/TerdzHvuYYEHoQmtRkoosnNuRqL5tra9
         /0Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzDULnR9JifxtTGNo1IEKleUuQrda3yRLpJVGJ3BUcYLSWbo1umU9X7rkbw8DvLWTAp/lMTp3k8kmi9@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4Lrs7FlS3jASR2ZqXAgv7SEDoaHbZ1YgyspTv9MtdxlKtKmcU
	KA8wtGO2flX5YoTwMa7PxpuIPSHdDjmbsfYjufbtftXVUKnhSWRA+BKC4uyvNmCd39rHvcnS9Ul
	CX8Z5j+9NtR+G3gnSNdJki0ZJ69RSAWU=
X-Gm-Gg: AYBFou3PRy+K1Qx22wt4oJGyKCtgGG+U+uFCOy90DybBY6LL/eOYXw4m0qdmb2tcogx
	8/+9IFamjqzvEhV0/AVWYRzriCMz57Mi7fRC9JYhG+i8r2Ou4uJ7yE3dTX91DPsuJdYrf8lTBJY
	M46oZ0+MAJJ+NgGi+FEft+SZg9/5cYI/I3ouLvI3qMHOcrF5eVejgkg8li2OORcuZhM1CUB0NTN
	EGdHJlq+yGX7VxvhUsg+I//IEHL5Gcm/KTLNfC3fdozyrw5Lg83/dmILDr1L+wC3Jt5EhoS6RVL
	1Q+gkg9I4HBvkskHdDhALseDQCJVXlOmTC9EI76qgT0LyAdBjn4jystK5wXM+Pwl4xQFk9KJgjp
	r84EoWe83tknv
X-Received: by 2002:a05:7301:1826:b0:359:866d:5bea with SMTP id
 5a478bee46e88-359866d78a0mr11573580eec.21.1791917527892; Tue, 13 Oct 2026
 11:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013184755.530392-1-clamor95@gmail.com> <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
In-Reply-To: <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 21:51:56 +0300
X-Gm-Features: AclHuK_7ZOUl5RxszrSY4QIAZk7C80MO8yjqs5R5Q896yo4MQyJphMKMAjW3tWE
Message-ID: <CAPVz0n2ZY1L=kwSkjLeTYNvDA2Gf0Oenetj8hK13g6+qf_xnaA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:4=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:47:51PM +0300, Svyatoslav Ryhel wrote:
> > The Fortemedia FM34NE is digital sound processing chip used for
> > active noise suppression mainly on ASUS Transformers.
> >
> > Resending since previous attempt seems to be malformed.
>
> Please send a new version if you have rebased, tooling gets very
> confused about which v1 it's talking about.

I have not rebased, it seems that format-patch malformed first
iteration. Both patchsets are made from the same commits with same
hash.
