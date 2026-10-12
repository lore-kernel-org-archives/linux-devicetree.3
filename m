Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F8B437463
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789940; cv=pass; b=tXycVNyUXB04vwkYl5c+vIY6GdI2f+FqYg4v4Dp142Jog6FB5iq6txZPnY5RfpEQu/wjX3AFDzVYRZvcvCkbdJ8mFC5Osf7uGg2GDsKT9D7UxXMvU7qN85c0WUbupMWRe0wCpqrdQRsVSqO/fj7+2yR1/ksQ87rWuyP8JHSJjfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789940; c=relaxed/simple;
	bh=bdf5ltVaII23b5cF27Fg81xlP8Z8tnf+GfwZrnYaosg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5TPkFJziYGJ1i6t1fp/LoaWLRiGD67nGpugs3por9wWkuyyOJOImGqoobXGA+tvagd7rB2pBRaCfilwwggkdfZKE5xEJtwqZJCBAZ0jJDGceoHYlihPh0qaBW9BCnHNZwpULNiqfUUz/DmC8KcFQW48LQsondEyiCveUXMBsGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJrPfd79; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJrPfd79"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3115c4451c8so1686687eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791789937; cv=none;
        d=google.com; s=arc-20260327;
        b=EsenknZq5voy1z4XoC9YtTtFEYHwzt+MyznIhojHv/XPIn1xGApgAlM+Tp1CcgBrll
         deuQdoRjIj2qufkMFWHNpSXvmmPXXvzx3ToJlktIwJhdeziClPoKPjvw2vQwcvwO+KD+
         BQJAxPVYlMuRymncaB0EkMr8/SlqMtD5TA4w8+9SV/fC73MIFo7pyNJWJyoHhTrkzWo4
         pK15Fw7sp0X6IrJUgJbLt8Gi6uBqGGLuMHbgNAxilLl2Q3dKshPpRv9lBkLDiZXBR+LA
         1clnOoizLZWu+NEMoCDUIO4QhzLdkpgtLcJ6xvEw5t/iWcgBZ1LE7+CnUUTwe9QD7kzc
         ts1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zYhdStcwqvgKHiecdfXgk5mDD0YpzyVU/qE0vTW0sUE=;
        fh=VdYhC49Nke3yQXRkyR6Sd2c3AbED5JEOe5Mah4/Xct0=;
        b=R6HwUD/+EveQ2BjiqvHH3MaMUQf77URd1YUwfnDA5J4Dmdn2iBtABLVdWDCpei7wkD
         3QHNvTdQtTLfyOt2D3jPv2CSpmmJPy/zVu+dO192jlRjwO9Swyo1kjQcr50uvQ86PLg5
         PzSLDePq+WcYCMATCM3475RFsoumajL2i5OlL2T8ib8/qxOHQ561+GyZJjfyjgffHbPo
         bdkwY2aEnNjdFM9pLZajzKyDUvta0uY6VEOjhMQ3nzptQUpLyJ/gNvbhd/TnthzU6V6O
         w4+q99iJtVp72sSsVsDDkuibIHnLmhrqz4zyuovLdT/TsJY66DrW/acfLrJi1Lxzr+6A
         Xpdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789937; x=1792394737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYhdStcwqvgKHiecdfXgk5mDD0YpzyVU/qE0vTW0sUE=;
        b=HJrPfd79YiVZCU995r/rMn4cN6KQ/WHxEzu94leeDkodSEFd8Hgu4Zc+DL9FIENtv8
         telOCTzKdo9zjyYzjK9XSSaB+RgCkhYgNUwy3jM7RIOn2bJydCEkM0unBChBvTgrsoLj
         5NYpjki9scQXnk4CFHp+QySvcjMlmTGJiBgLqQjocCXx8XYeoo4sBKvV81Qkni0cT9GF
         XBlRtRWJU6tQMEN7AnB6zXItkh3cO7g/e1oJcMiUqZd8u+ln9dx1OG0pEHjqnrXruO1Q
         Qc+FfXHq1iW3DaXriQcFzNLmXLzmSc8kcAChPbDPkYZYJ9GY+VgsruSfC3OjZDSN89lI
         Zjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789937; x=1792394737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYhdStcwqvgKHiecdfXgk5mDD0YpzyVU/qE0vTW0sUE=;
        b=GOSR3mHfAMeEheKUWEdbpUGBf1TY0LX3g0bf5CPsNWJsk3iK5hpoJsbaTu22BTJzL9
         73UkwFJnRUnr5ji8S7suxm22HMzL4vGOwS2o/FqSYKdBXIQlboAyDTw0hGqyPWN3BoZe
         Zcc5vgjPAvpIAexp/L+hrJ+lpsUNzVpcYw3tprZbbvh3QE/doWMgpqJ48U2Qq7XMFSMX
         LmchqIuYEawmuXdHe+kBNamE8hX/jPBL+31pHM2HnktR68AJ6ZiE48V587qkUeSSJ73n
         n39x6AaVLKQWlHUtCDm/4cl+MHwp0t9k5Fry0/y8hS1iucaafKRW1NspKBTmRONg09nO
         00Rg==
X-Forwarded-Encrypted: i=1; AKwUvBxglj1vWqUZi/DpPE0JPcrzlF/ZcTrj8RPAhQoi/JigMRvO8krYtBLJ/dJjP83o/5zxotiiz/c3NnB9@vger.kernel.org
X-Gm-Message-State: AFq9FYLbB8Ahij7g1J1y1M00vPYB1RKUzM/HruRq/Mh6Chx8dcQjeAjR
	jIHlF+NL2sT0Eo2D6JVGJ4KdS+VgOgo1ikYLzU//v2EX/WRoOwH2quy9l8/ZCexrG9ipl3yX8sL
	iujqta1N9NKDUp7W21jz/NgI1b71Slls=
X-Gm-Gg: AYBFou0ASqZt80EwPFHFQWabGXADvalkM5DS8t69Rr4/aUqH0izkYtEHXKLPCtxjrZx
	z4TbRlFBjkssVSdOvoRBXpJLC+E4WiwAuk+1a3rDnmMxJWK8rWgbHByhSEYZDApS70b953/WsrT
	R412+1NjqNkB3lNv3NYIcCpGzQEVpK3Tq7D0TSl/7gHiI6V2H9LuHkIOB21Y116/Bge+A9LndAf
	xfYx5MTBv5RVSMcO9DS64UpqM3z5bGyXZDiYhF8XwmImxmluWjoDZzmSH8w+Px9cTPSt4UXQ7bS
	c9LODhBLWWiu8QFCDwiZqrbOF42pBHPvDJ3ENF6AOmkhENZ2lfF0oPpO0KlgR40wWRO2gIaDC+g
	Rds+1hPsdde+0pbQam2iQspc=
X-Received: by 2002:a05:693c:87cd:20b0:353:5d7a:cabe with SMTP id
 5a478bee46e88-3536c53930dmr14060639eec.13.1791789937444; Mon, 12 Oct 2026
 00:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com> <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
 <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
In-Reply-To: <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 12 Oct 2026 10:25:25 +0300
X-Gm-Features: AclHuK-1jO_BaUkdoWPA5vu4sBjFNbD6AjUBsHVIwaLC2Wj8tW6qxhiDAHWP-Uc
Message-ID: <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:3=
5 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> >>
> >> Hi Svyatoslav,
> >>
> >> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> >>> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory F=
lash
> >>> inhibition.
> >>>
> >>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >>> ---
> >>>    Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 +=
+++
> >>>    1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.=
yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> >>> index a65d92522c9cf..596b5e284f44a 100644
> >>> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> >>> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> >>> @@ -31,6 +31,10 @@ properties:
> >>>        maxItems: 1
> >>>        description: FL_EN pin
> >>>
> >>> +  flinh-gpios:
> >>> +    maxItems: 1
> >>> +    description: FLINH pin
> >>> +
> >>
> >> You don't seem to make use of it in your patch.
> >>
> >
> > I don't have to use it in my patch. This change completes and improves
> > hardware description of the AAT1290/1270.
>
> Still, If we don't have the use case I'd avoid adding it to not confuse
> people looking for its use in the driver.
>

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Do=
cumentation/devicetree/bindings/writing-bindings.rst?h=3Dnext-20261009#n17

- DO attempt to make bindings complete even if a driver doesn't
support some features. For example, if a device has an interrupt, then
include the 'interrupts' property even if the driver is only polled
mode.

- DON'T refer to Linux or "device driver" in bindings. Bindings should
be based on what the hardware has, not what an OS and driver currently
support.

> --
> Best regards,
> Jacek Anaszewski
