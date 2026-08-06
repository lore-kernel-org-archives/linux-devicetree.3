Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067A029B795
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 01:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979354; cv=pass; b=oFso4Ner2NnIpgi9eX1X6H1OVMbDr2/Vi5GftqcT5Y+P5slLdP2wF+eaTc2FgQSg83IkUpokx2ejdaUjm5m1wmPNnr2k20zGSvt4HO+SddH4jZ9hQ+DhOWVS50kE+BD/A5k3/cB4jDdK0ZcZ9Zn9vN3li8aqwxb4mr+0JgWwEio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979354; c=relaxed/simple;
	bh=DjWYmhBKtJJzERRUUW+D5EYkAOs1qhXbIqwsFtxKPfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZio/n7wbtdL+nq7/Y2Jw5GaoA0uXhOQjorrTWv4MGYaGK7tPKmWc7eeXapWZVkKvFe+2xRWpLip2KkbC9OMJcf+WsuQXGxt/uUFyFHCDc2vU+5LIfceqq5UK8zXxls8PnO3WR0GsmWnyjRUxBhcre55mXjrYMSv1Pavf9j5dwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbIevsHH; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbIevsHH"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-96935063700so993428241.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 18:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785979352; cv=none;
        d=google.com; s=arc-20260327;
        b=qQPqmGwSxNmixUWtyZX88Wu1bU+1DFVhqeEHm3bndS3JAA1t/ZYTqKf13s2qGB7hle
         vrSxlhNgY/DtxMISISsStZx2/IuOB7d8ukKUIhp/47uO2e38T66i9jLe0iSJqyStA2MW
         vKekWj1lBdBHEJgsEHTuyGJFk8wK6bwzhgdJVqH5vAcXo5uK0McoljhdRpbA/nROAvZU
         aKF7o0u990a8dtll5daFJJHZqRd4oUCMJ7WdwceRfc971iB1acWRi9f/ZqBTxoZiETSI
         ayIsw/ulaIVYSeQcBSSKWsqxQtuTO5ZiAZTtCIstN7/zLUGzxc4rYNctg38PX62JzBRC
         iYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QA49Za2VkvJvbOtqLvEZSGcnBBWne/MDjPHtSxdMZFc=;
        fh=ox7W8kf41KF6tVUE1k21zFH+gzWVCwqwlE6CedjhbZQ=;
        b=YCyd85Q9Ofk2CLZe1BgV+Kf5oxJ4OVrXveoFNBPI9aen10VIcsBHXrvoHQac2Cp/zh
         9Hv0JDx0lRiyLZs0WsRUDuZZ/4RU6c1P1qd1KjxWobqs+o/mVhRn9A80V5EVovA3xkni
         sSmhy7KAGEezhQNGw0zXM9LPl7jAL25GKTfC13gkgPBvaSOTEqJKqnhJkYyShMjNEz0G
         K+PuitO+Atgl69VWa777uVhYy7B68ELnd0M4RMmqBeEsyuuJM+LRaQyaJPMKlQobdm/Q
         8EDfn9W/VEmouMmya6G/8e/GII4NkWbJ5YM8TCgPMGcYlqXWArUkCS1+j6gg1ffzynpX
         oITQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979352; x=1786584152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QA49Za2VkvJvbOtqLvEZSGcnBBWne/MDjPHtSxdMZFc=;
        b=HbIevsHH6AZxpDBga3BRH2zDLjBIMC/louaP8FVcIwRwktC/jadbpaJCHyOvFK8atT
         0p+2LtLf3eEHTjbGiad9uzyeaE5F+03zJq5pykrTI1L7Fwc7nMTyY1537LA43JeuJETE
         VR0g5wgsyUoqaT72mOHNi211QwP8IMU8i5g0lnF/+F7Qv+HiseVo7ulErFdbNugXg/h/
         5kMy09TPIDBFPyP8GR526PX3urh5/CjN9rdM5baxrdhr0QzCfEE0Y38aP9i+L9iz9tjg
         ztQj/UxKOEckBFnBJR34UZSUu4SqCoqtAoV5TlN7C1rqovZz/tIrloZ+qBW4ZdHTJzdH
         XpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979352; x=1786584152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QA49Za2VkvJvbOtqLvEZSGcnBBWne/MDjPHtSxdMZFc=;
        b=oPZUsRwzgRzD9ITK5NpUmHJlkFn3tho8qQM0XJsryIB4pLDkCZb3/dl06vQX09NG97
         v9nMtvVadruDiFGtbx0CAQ6pD3/46OdllgOG4nVVCWSS1+UX/I6EiEX/rzHaBKLf9CaR
         fGhYMt6dMx2rl2ZED8g2fu59FGitZWvquQm9eM45nmiZnwYOG9aY0QkmN4IDV0pehqDi
         aCXH8KtsAxvr2FbTOCBhKJ2hkotp6khSJnfIEvICEBsNDE1uxX6xIF6g3phO3GdpWMcT
         wAL52Rrf0XM7Ubosxzx/Bt1WV+9RRgF+6aMPsP091xKJdJCqVq2guUa662J8Q3km/jOd
         MplA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3MnSEV+738oDxGjsDjdITyTMJIu4zspEp8DakNwFwxi3zRZ+5NRKIzo5nOP7ACstkFc2bQREkAAVP@vger.kernel.org
X-Gm-Message-State: AOJu0YyGjhqXDbGZ7/qRRgOlslZ0ctnPu6/PXxdpCaCxQbQvetBYbYs7
	1A4HKSkvYW3ogLynASgaPR1ockh2Ww9SS4+OfWIYAgK16ZNR7popKnjSr0aPCta694DyyHGCYjS
	JoeXbxfILeZwRFAcc8AHQdVFq+7pbvYg=
X-Gm-Gg: AR+sD12ct7d3KXNnyt5MC/AfMqvXTfwTDC6vw53hY+0BO51vsNjosa4U3YKqdgVJd+O
	6bbeb/oPLMhdGt0Mgf111INhIBH4BRxvMS9WRVfcxk6PjFTsX0JdlPlnU1P3V1jT16jXM0mGXt+
	sRpx3JY5WA1rBrjKRyeBYpWUACu0qKCc2uVpmMlURR7YsQqm5y9kzfNq3dpT5FeRX80VI/oDYen
	QiZQkIrae1ftTQkhuW6QgrlEiv0zWZXtzkYF46ONw5u0vY7PYov7k1CCxnmO/UdCpEOt/hgvgaD
	1WBzxgBXgieunir7emlhCfEpo0AR79sxPvYP3EI6QmpVCKs=
X-Received: by 2002:a05:6102:4246:b0:738:d6c:7108 with SMTP id
 ada2fe7eead31-760e76e22fbmr3291431137.1.1785979351864; Wed, 05 Aug 2026
 18:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-8-5d67e0efa6c5@gmail.com> <20260805132941.8B8F51F000E9@smtp.kernel.org>
In-Reply-To: <20260805132941.8B8F51F000E9@smtp.kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 6 Aug 2026 09:22:19 +0800
X-Gm-Features: AUfX_myyiOvu3Ho0sO-RbG5JBiR5SgpMhvTveCX1rERMgnQv5T_zmcQpQkRNFho
Message-ID: <CAPBH0A9+K9XpjoA4r0M=CZi0NQNj8SuKOKRTwvjj-WmSLUhPXQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] ARM: dts: aspeed: anacapa: Enable MCTP and FRU
 for NIC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=885=E6=97=A5=E9=80=
=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing Frontend NIC (FE NIC) MCTP and FRU initialization for =
the Right Bridge Board (`i2c10mux0ch0`).
> --
>
> --- Patch [8]: [PATCH v4 08/12] ARM: dts: aspeed: anacapa: Enable MCTP an=
d FRU for NIC ---
> commit dd43e6fac4e737bcb1c934de5c94c3846795897a
> Author: Andy Chung <Andy.Chung@amd.com>
>
> ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC
>
> Add the mctp-controller property to enable frontend NIC management
> via PLDM over MCTP. Also add EEPROM device for NIC FRU and reorder
> the I2C virtual bus index according to the system silkscreen index.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.=
dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
> > index ff393ad7cdb79..703284721224f 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
> [ ... ]
> > @@ -55,6 +74,106 @@ eeprom@51 {
> >       };
> >  };
> >
> > +// R Bridge Board
> > +&i2c10 {
> > +     multi-master;
> > +     mctp@10 {
> > +             compatible =3D "mctp-i2c-controller";
> > +             reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> > +     };
> > +
> > +     i2c-mux@71 {
> > +             /delete-property/ i2c-mux-idle-disconnect;
> > +
>
> [Severity: Medium]
> Is the Frontend NIC (FE NIC) configuration missing here for the Right Bri=
dge
> Board?
No, there is no FE NIC for Right Bridge Board.

>
> The &i2c10 override configures channels 1-4 for the Backend NICs but omit=
s
> channel 0 (i2c10mux0ch0). The Left Bridge Board (&i2c11) includes a Front=
end
> NIC on channel 0, and an alias for i2c10mux0ch0 was added in this patch.
>
> Does i2c10mux0ch0 need to be populated with mctp-controller and the FRU
> EEPROM here?
No.

>
> > +             i2c10mux0ch1: i2c@1 {
> > +                     mctp-controller;
> > +                     // BE NIC FRU
> > +                     eeprom@50 {
> > +                             compatible =3D "atmel,24c32";
> > +                             reg =3D <0x50>;
> > +                     };
> > +             };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-anacapa-=
devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com?part=3D8
