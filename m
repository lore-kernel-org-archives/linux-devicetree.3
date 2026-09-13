Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2D42F260C
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311304; cv=pass; b=VBg+eFcW+swPQnMD/SJ3UrKD6xKAKwwf57Z1Uxr+gn5suMFlmHdWNVlwRx1UJkw58EfBBOQdVvGWH84trislSJvbipbPyk/47dqPZqngKyye9sSr33DzYLpubkfHJMIpUXOXrj2azSV03CC4AQm5VPxdfiEmEoveFDiS0x+oDI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311304; c=relaxed/simple;
	bh=Y1BhGJHbMK4MjP/cN4ZM+JrQmO+vvsB3JIjaBa6CnxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXbbx65TaJiRgTelhvwGrcewDddAUutE1kJJYaZtVeIOAonyrxHg15smTqVoVhhz/JA69AQcSTYoMsvmSqg1hRNZ23jeAy/UUqneZiOL2HN7b/HUN9poVniPfR2ZV6maZClAExSKWS3TPS7Yc5iOYexEm3GrSXMwlPh+oXrqczM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpMkWsR8; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpMkWsR8"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46a63c34533so1468383fac.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 07:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789311301; cv=none;
        d=google.com; s=arc-20260327;
        b=awPmkM6JU5o23AQZ803IeUQC/xlWFUN6XtP7DqHYleaRbug3qgTWnRWisj7YVFPIIt
         OnGKKCfKUx7jhH3XrQj4MHxCenREfHoqQZluqzmSaltfBvIkbRirWk8F1KdNqkJgbtoW
         WWYg8WSRIoyQl0eIlrvf5/rPEgvT/jHozQzlQjZkW37DBAZF2VxZ9U/rDCZDxRz/fJgt
         mR1M/V0uZYY7WecWP2Wf1L22nj/b39LWnc8yBJqtBB2pr5DyKBQuwiOmVXbyc2zekqd7
         9YzJxIdSWWRvDMM+7z48bMr0OTKm5YLjFJ1Bf94y8eQblPmJXGgV629IeT1LbeBpn7kC
         g2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zdUN+QWwa8fyRs0dHBEhiU+fM2pLoHcOi5IEgZOWjak=;
        fh=h0cXP4Ewc6LQnl3op2CXqjjJ2RIdRTClnjjxEkp0xTg=;
        b=mrS42l8qzGQYCBWiPkqxTuKBncaz+OgJIyF2JHuhSQdmodr6qhJ9Wc2T5/8C0/8ZeU
         ED1pV8Xtf0c53qGcgNdFcLMfb9iKA2f0zEz6ARR2snXtXmLe3PM5t4PubRkVmqblO3Ch
         W4LWqPi5G3BAhCKSl0Ba/F5ew8EiyZK+aHnEsbkJNiGSu5ddECpivwQ5dlZzC6Z/ELVu
         QVkGBYV5jffksGRDXLYric9WiBkYiWnpOBP2EADzSGjswI5gBmLPxneOxOoeUPZpibZS
         sqOYFJE52FZ9xUsMm4cKlIHR402tYhG/dJR9Zk3rYIoJCKpulWO3VavVFj7MvXPo5pkA
         BbQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311301; x=1789916101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zdUN+QWwa8fyRs0dHBEhiU+fM2pLoHcOi5IEgZOWjak=;
        b=KpMkWsR8x0+DcLM9Jg80po8fuvhJ+0Zbpjv416bXkgzwmctMwcnpGh8bCPX2vTrpNv
         IbCqabAm1fMR859nzkRMTvaCLawFCGNx6exYQePo2/Tl6Jrw3SrYcyxNjcYEhFLqYpby
         TbuPrxNxdj0XbGsXhtPnN0HHRgzxBFtDsflGgoc6cavHowWrZTJMczZ5NCZcZSm4zlDH
         wvqmxeluet/YKJ7dn2DlR9usafRFmAz3URNjTd8iJPczXT31M4x5lMrDlud8kNDapkXc
         7EvbKmdM16rtr58cgl9IjDopdPHW/D4G07yOVAf5q6Si/SJeLgw4TPhI2hx7N1/bZx5t
         XSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311301; x=1789916101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdUN+QWwa8fyRs0dHBEhiU+fM2pLoHcOi5IEgZOWjak=;
        b=MRX+gIqHlPzuYdKjfIpNVslXeyh6PP5gCe+r7pusVSf+VrAgYv4aiQcu0+xb/KX2Xx
         8EwSV0nNpFXYldeAEusQ6znGdZBADfa+If6bFpGilxdd3VxpOwkuC85QEIDgaElGjIzk
         ktQ8G6EhnD9O6VKvcQN3Lq8NgbizyRla3c5P7MN5mG9D4OSlpCAo2dcbHtNPm5dmdt4E
         1BJ6K02OE2huj5W7fcGxMyP66s1kTxtfRJokbCeT0QLGs1PI109mipMazi0cuBTd0guD
         f1Hn9XSOfRJRcTUrTfMNZYNF+d3uD/aLGEhNRc+9CFxve4Uv56akt6dqAqX4c1Ymgc5o
         +dPA==
X-Forwarded-Encrypted: i=1; AKwUvByUqCC1teA+cZEaITi6+9KQ2cSKuPvHdNlOn2hdvBe0SCT1G1dO6VeArnqKybNArtsJxF0r5D6C9DJh@vger.kernel.org
X-Gm-Message-State: AFuF++lb6yOoq7sAUfwuHN7zWzGGfNkqcIsY6ElszibBFh2pKEYYq62t
	FkeOJlU8pRTf9IqFbOlEfDsUPzCg59DsGkgZQglcUuyvaPB5vX2x0QPDc7bG5L68Pcb+kjtkNpf
	3E/mdgE6ELhHlTLuE/o395qeUmuamQtS+4dmh
X-Gm-Gg: AYBFou0nWtSBys7FRdYq/SKS0lmWLGp8Op+scsMcyPfGBCgsQ1XUpwEOpPiJksdoDzw
	Lrtw/pL9DGMHrp5W3MyRAnrhCRDLLZmLs79r5Uqs9ml8UvUyDeJ/eA82vwtDIyBblqHkyRcl45y
	G30PPmwsAb543ncFFt5GLno44zdd31SXCIDnufkmzCwFm2rxxVbwwfeSlnUMwgtSxgMM3ymmIOQ
	YQHEuISqEpOibc/5CZyXHANERdusuuQf4Sj5NSw381WnoS0qeODFZEHe7ZjIA742yiCZEsmrxPd
	ungViGF5LYn+/iU2b/bDQzBlMa3kKp1+GC6Vfs+BAqsp1CSZfBBh6QKSXwnY5LQxO6BbEoP52K8
	j+POAq6O38a4Yjw==
X-Received: by 2002:a05:6820:2213:b0:6b2:69bf:c8d7 with SMTP id
 006d021491bc7-6c24c3c74ddmr3477590eaf.10.1789311301456; Sun, 13 Sep 2026
 07:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-2-amit.barzilai22@gmail.com> <20260823112814.896AE1F000E9@smtp.kernel.org>
 <8733vhmk4p.fsf@ocarina.mail-host-address-is-not-set>
In-Reply-To: <8733vhmk4p.fsf@ocarina.mail-host-address-is-not-set>
From: Amit Barzilai <amit.barzilai22@gmail.com>
Date: Sun, 13 Sep 2026 17:54:49 +0300
X-Gm-Features: AcwNN1XXW1xsHHvqDyl6Kgqlf_EPuqEBtUOLVnrobbG5_xucG5tBFGj0BV3mYoM
Message-ID: <CAOEgbEqd6pGUL6o2CbyePUWm=NBy1GJJaOm+_7rg3CsEGqEfYw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLED controller
To: Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 2:16=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> sashiko-bot@kernel.org writes:
>
> >> +allOf:
> >> +  - $ref: solomon,ssd-common.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - solomon,ssd1351
> >
> > [Severity: Low]
> > Should this properties block also declare default values for solomon,wi=
dth
> > and solomon,height?
> >
> > Other bindings that include solomon,ssd-common.yaml, such as
> > solomon,ssd133x.yaml, establish default geometry values for their speci=
fic
> > compatible strings in this block. Without these default values, device =
trees
> > that omit the width and height properties will lack a schema-defined de=
fault
> > geometry.
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823111959.=
17029-1-amit.barzilai22@gmail.com?part=3D1
> >
>
> I think Sashiko is correct here. Let's include the default values in the
> DT binding schema to be consistent to what is done in the other bindings.

I included them in v1, Krzysztof mentioned that they should be removed
since they are deducible from the compatible:
https://lore.kernel.org/dri-devel/20260611-psychedelic-funky-foxhound-a8e39=
d@quoll/

I personally agree with Krzysztof, but I won't die on this hill.
Let me know which way you'd like this to go.

--=20
Thanks,
Amit
