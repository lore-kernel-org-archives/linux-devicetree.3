Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464E938DC62
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856894; cv=pass; b=bZmpx49peZ17rRWLIbDioR6hwsWFc+j+5QDqUFWzvxjpJDGvw69o0Nj22r63LKevYJ1RwTszb8CUKBp7zwXRRhF6qBJ2bIGhhItyMqVkgPAKXNxWDASyA2oi1VOn+ouMxVnxr5Qlnx+KmAAJUZhZ8XqBNxOXoiqYNRP4mQPRnF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856894; c=relaxed/simple;
	bh=t80nhwRApDWZA93DyMsDHi8I1BEwRmnmkFQwG4H1QEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Baq7OOEEZea64p+pG2QfSYV2ZexpJ2CggzLTICtm2tv/0WmdKLQiUG0GSyoxouPvFlgfPNQYyvpFTn5MQ4BNajWoGB+lG8ArXQk+M2BZndc9Mvnc8dVfrsns0aRz9YDKe/Lk5B0IKiEyGDj/aPMC4/kbvWud9zrdzp68PX/ozEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=CX9q+Ujc; arc=pass smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="CX9q+Ujc"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804b59404aso3080755b3a.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790856890; cv=none;
        d=google.com; s=arc-20260327;
        b=LrV65qk+V6guJEKw0Ql+SqH+1GAYvQDXH3OsUY1QyP66jrvAdsqxRH6bmTEO8XwRkW
         4tqEyeBk62a2Th3uyUBfnYtR/s4Cbi9tOIk9oycKoJo6j4j4fln3DChkpPBKc4PBVFYk
         U0j71LH9+VzBVxD0f9fHwfwcnW7sUIwB4x96UQvnQZjhd68qFRhk88J/t4a+ilL2gIoc
         k9Ovqhv4Ag879ndcU6UfVL5yih93IoN5oU460057DWRpJIDAwbypTNMNFwFHHJ0ZlpPZ
         wLh3ahBAO2HYA6oohzt8RlKnaRHtyYpStCZuaPFGQCeLwVODHk8Bl+Wxp6/0UbLxhZqR
         IH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YpU0f3NtjRyuzMkIqJCo4gz/bCKyWtpvBq9HB+O7ccE=;
        fh=rbLiSzuvmtgDzgeaMORINgNoss7Qurtn5z2xJ3NWQk0=;
        b=l9zb9ocPTKEPgV5wiw+MAz39APqsQptP6tmdRVSQY+rJ5PPRZukNIVlLo130jYJQoM
         6QDIWTcD278EAcU7Zg/vqSYRxqGPxp23PegaXCfgulW5VM2O5qQn+yiodlwXbHc8J2kA
         PnaLEyOdXtB9TS2kntZxO2aXLatkyFLcZpX+CmAdoPyGqBchhsMcYazrxH4a7rOCq9W9
         CG3RzT/Xclmv2dxCe/zNOxOZRUSmwCQQpZjaPDk/1IbwYxtnaZqB69/ZQD2B491DoT2I
         jDZuRdL3Rk72Vgtz+kA/GPPXMJNn/z9VXl3bOgF4z0etjVu2EjDKDhvt5+OULPUu9qct
         ub2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790856890; x=1791461690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YpU0f3NtjRyuzMkIqJCo4gz/bCKyWtpvBq9HB+O7ccE=;
        b=CX9q+Ujc+9ijyP+hjLjhQHKOA1Ajp3s5G8hxo2Q49I1ChcSodIObiGY3k+tCZ5fhuE
         cKEaci8lNfwxR2JAtFk0QBxmt7cgJFJTegk9HhVcQeuKddj5zMxJGIDM1W7F+PhLb0eb
         QDCbD0DNBN4+IPyhdOVdwwwIklPpDB/SkU/tNYh9CMETu2vE05c6pFIgMMHKHSg79Xco
         JNS/Dw/fG0w/wM6YBf4voHLb+o1QiI/Q6kRouSgQFePjoz38ejkkf+97oFnva09nQyBz
         B0q7tjHJNzfe5ocPl79T04rA6IgNw8RdiGfnYcj+CyD7mbw1nKLyVeL1cg2A4zu7FHvR
         jYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790856890; x=1791461690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpU0f3NtjRyuzMkIqJCo4gz/bCKyWtpvBq9HB+O7ccE=;
        b=UDizfk+80GUIBxqoQG55+I9EZ13bE7PUR/1ZAGJH62fUksjyv4KVVkQRIhPtzS3S18
         jiL03xTYzb/9AkAFA0bzNOOUwvull5dODn74rYkPUyQD8VjSOnqntxDJd4TdpMnJvVzD
         fcqO+MLLOpZeRzgPgjfBx9bJQVTzj/oK/hc/8yF30LIjAbSoWG8xIbgIBdyKk8bKe80l
         GZ+yl5RQRqAMRN68jI9N1yYP2QPI+2wUcECZ/0M2/AlkTxbYixbNNTExnrL+bH4AMDQw
         pfXege9SCtx5oNb+6rMmMs3qsbYGbQ3DO8dAm42YytqUf9iNMzKrOjmAKcJusctgBoDH
         YTlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOugq5RM2ey7sGugoD8csyOA9x9tsY5H43TfI+ZoVmLoOMiO1WftMCr3LYDJL2x/bbpHTcSCbEuifk@vger.kernel.org
X-Gm-Message-State: AFuF++nPQLo05HdsYkM4GGu4wi5stRXMfpPJEBjqgEawLY8ueAgn4074
	MCuGA5hUuiKqh5s18MM4uaEKTPeLIgH4NUSUTwM5PWMNl/uu7d8ARQhMf99oUSQJif17VTxCt+O
	8VA3+YMiKTcwyqfsC5ibqhbS1BlJTeS24voHzq2Qpiw==
X-Gm-Gg: AYBFou2MpYflCJpV9L73OiB0McreTI2GPHniHwml3s0DFw1nKRzs1POGVi2QVczmfmH
	glcNhNPThldrX3XZxIUrhcjZajx2qq016pS9JbpwLSzxACmdeARxMbhUpE6SE+OJdcZYJo0+1OT
	M9RhM2iZXjcyuKXr9Je2ja/Ol8WY0T7Dn7JWFVj9AIUtXXP91N1mbCOf2ka/MLzN6uh8VEYc2nk
	niQNRONKhthuW4P0OANGM1iFR6yNFmGhQj4zY1OrfWKz9+3HAK9tAQ88PaW/GTfUTI/cYCQvw3q
	cl5a/tDycT2Q1vaBtdqBHM/C8tpCCcbSsj/lWLdtZ2zUKx/F/yTP4qeJg+elkBZ6I5/w5Gn2eeW
	L17/MRPnYnANkpENvsUY5NyMliVOs1/exkEY=
X-Received: by 2002:a05:6a00:99b:b0:880:78ca:8408 with SMTP id
 d2e1a72fcca58-887498020a8mr4062364b3a.7.1790856890524; Thu, 01 Oct 2026
 05:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930122305.293686-1-robert.marko@sartura.hr>
 <20260930122305.293686-4-robert.marko@sartura.hr> <20261001-splendid-athletic-coot-1bbbb6@quoll>
In-Reply-To: <20261001-splendid-athletic-coot-1bbbb6@quoll>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 1 Oct 2026 14:14:39 +0200
X-Gm-Features: AclHuK_WE9ut5IG7WpoJ3i8LiSUCQkUGd-Zayy7qamfoOiiMgfWXeX1Yay2v7OY
Message-ID: <CA+HBbNEOiAw+_zzQco13nNzUPdGUgo+kjcRzLFEA4LmnzF8_=A@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: net: maxlinear: add MxL86211C lane
 mapping support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, hkallweit1@gmail.com, lxu@maxlinear.com, 
	michael@walle.cc, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 7:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Sep 30, 2026 at 02:22:16PM +0200, Robert Marko wrote:
> > Describe the optional lane-to-ASP mapping for the MxL86211C PHY.
> >
> > The mapping accounts for board-level swaps between its physical TPI
> > lanes and analog signal processing lanes.
> >
> > MxL86211C supports per lane mapping.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/net/maxlinear,gpy2xx.yaml        | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yam=
l b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> > index 0645e885f1747..b98cb3c3e6d49 100644
> > --- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> > +++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> > @@ -22,6 +22,21 @@ allOf:
> >
> >      then:
> >        properties:
> > +        maxlinear,lane-asp-map:
> > +          description: |
> > +            Mapping of the physical TPI lanes A through D to the PHY's
> > +            analog signal processing lanes (ASPs). The array index ide=
ntifies
>
> Are there other lanes as well? Not ASP? What sort? data-lanes does not
> fit here?

Hi,
I tried to keep it similar to the datasheet, but looking back, a more
appropriate
name would be ASP instances instead of lanes.

I am not sure if data-lanes describe what it is fully but I am open to idea=
s.

Regards,
Robert

>
> > +            physical lane A, B, C, or D, while its value identifies AS=
P A, B,
> > +            C, or D, encoded as 0 through 3. Each ASP must be mapped e=
xactly
> > +            once. Omit the property to retain the hardware reset mappi=
ng.
> > +          $ref: /schemas/types.yaml#/definitions/uint32-array
>
> Best regards,
> Krzysztof
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
