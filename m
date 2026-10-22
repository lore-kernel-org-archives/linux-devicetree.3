Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687233;
	b=texyxOzwAdE6znKE3uS/mN8yZ88T/BsfdO+jy60uH64/VN/O3rm4vISPrsWwWeyZjZ0G
	 crxD8R+v+5dsdAZb28nm40L1YMUC2VZGHR0GZn2bYyE8jY6ADjd9eYK8jJ/WWX6sudAVX
	 7UGQkb5Mlh7/Uor7XypDvhLiRSau7rPNGS3f1lgfphRS/r6DxwB9KP2GCvPPUSbCTnjzk
	 Oyo22pYgAbZRGtoctuNo30WkvT4LerpOwMCJ3J64Bf2kfaL0H7BPF1CzIbc1MTAqEnp5s
	 1SwxprJVTMxJt/kG288QOT+LLIVKhvBAFdofbfprbbh/I3ooeeoUNOBAEJxb0IukUIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KIXR/3+QUTDcEupkbOOsq++gF5QeeU/bfAuAJ1TSZ9Y=;
	b=0itPlQQuu/hBbWgxAZV0e21zEYmI0pXTMbM48qNO8LpJRbUmb+KCwJH21OTbdHen2Wnw
	 JHDrQo1o90ncmxPN3t5gRcTwnZHPnn75ozCNdNrjuetMY+SS6xfc8aHd33tkY7V/zyb5O
	 UVCeS4W2FzV/3MoJq5hQYL6dlHU0qXUx40tnUrlCeuyPuF0pQhPALuH7qALFP4jkw/hFp
	 ccg5Y556U1ptK+9I84wZtxjQd2RIBT4jnRxSpRNb5gd91k6GkajnesL9uu08sX1TS1rT6
	 MJMne9PR6XO6y9Ux7ttOfj1KOksJ1M0ZyB/3Rv77QPsZwpmFUDfMqFGgYcgyu8opUyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=co4J3w2L;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD240606A323
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 16:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD240606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=co4J3w2L
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c247f6687dcso308447066b.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792687231; x=1793292031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KIXR/3+QUTDcEupkbOOsq++gF5QeeU/bfAuAJ1TSZ9Y=;
        b=co4J3w2LnEQjPBO02dw0JjZcnnyYx2lsJb1kXpa8quprDH/sgDk9a0hWRKKLguhmwf
         qiS8ShaJT/C+ue2RMQDn7Syj/BHpz8cfjBiCtS1x28KynbZZWM3TOPy1nzJmffnC9Eou
         73c0lKjLyOpzwLMg+3ro4Ko+vpv/A99qTwkPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687231; x=1793292031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIXR/3+QUTDcEupkbOOsq++gF5QeeU/bfAuAJ1TSZ9Y=;
        b=CYlwHLjR9WqeXeeIzm1xIeyu4IQ36DruEOFn119BAmOtGGt5m1wUHoZ5/stPgVoSl6
         m+VOvW7bCEDR7zENUBDLOapwoXJyKSHpZTSc+joV7hZB96t+79+uJQaDNwlaW3xgkru0
         tEPNk5WltNHJOI8BzvXjAKdT6u9dmr2Nn/b6YFGebANO6b6ufnxNUduVMwKpDDOg2nnP
         r9mzAdzOKp7lufJcSOsqwcnkdpI/FM3/8cvJGw4Mz5UkVlEXm7ZKuwKBu+wTGo/etmvQ
         XkRA31JN4WvF50qkUvGynQxdtTrp3exBymHYeH/F3XQ57tfXBgxOPQvhG7EIs7e7Ce2x
         1gUg==
X-Forwarded-Encrypted: i=1; AKwUvBzBCrxeAeGCRz7YORWeu4CyZ6sZY7JoRNRz12hvgzyGQw/x+X/ujKuX9NGL2NU7Q5rLQVqF5aTlhvBr@vger.kernel.org
X-Gm-Message-State: AFq9FYKKj/CGaDY9U702OI4DQ7YfS2mUkFib2OvTAkJH0Ygr94bqHj6H
	mroR+8Ks4KA8IapXLUvcD+I7RtWLkglzwftUJTPUjATPImzArkdgkD+6G4j7xJgpTYo=
X-Gm-Gg: AYBFou1zzeIPqzJW52gnd1ncy/faEtLnf+iMtRn5v8nZ6Y40YrV1F841PSVqpju+zEC
	ZO3s/1SuH6Ij4gHDqWt1tOXRQlpMLrZdvsu+wjlO4XrJnN67n3T6U/V3v/4X50yZCg4JbLpCqy3
	gbftcfvTB2rwinJBfpcU5X0gmdwLUkUGwdFYCmcc5LQVlavmb0SoCWHvMaDAd+bEJtPNv6MEqpT
	08/Bc6YHxKaqM6QIXtFr2izTF4tFXsThiGurADp6N4XIKabptmgpdY4ypYmzMKc3RCa76WfhP6K
	Y7Oaujsb4G7hLNTO0J9ZTXK4t3AfBAtFX821ZL0SGqV1wovURCYQxRWw4YXqUXm5bj7T8q3XDFM
	9KaTRJZwu7PjuFxthBVM3qIoU5vHmFaMDWEj2U8z8CMGx7LCdIHuJRsJnFyAndHx/qcPaGRdibC
	ktCpWbfRt9JuwJaoyxS8ffNUifJn+pe07rM9/Eq9qKPfr1o/r8N6RTjt81G83EENlfzb3tuWuxV
	gSIi82S/krLO4+V9q7EWaZovyo3UxXO1FwqsMnEdlU+q7SmmtJjUbaU1C90
X-Received: by 2002:a17:906:9f90:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c4679536f80mr679402366b.13.1792687230949;
        Thu, 22 Oct 2026 09:40:30 -0700 (PDT)
Received: from carbon.k.g ([95.43.162.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfb941sm5456866b.82.2026.10.22.09.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:40:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 19:40:28 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Message-ID: <20261022164028.GC3711@carbon.k.g>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
 <20261022140244.3476844-2-petko.manolov@konsulko.com>
 <sashiko-outbox-181612@kernel.org>
 <aton_teIric7IKX8@SMW015318>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aton_teIric7IKX8@SMW015318>

On 26-10-22 10:13:02, Frank Li wrote:
> On Thu, Oct 22, 2026 at 02:10:36PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] dt-bindings: arm: fsl: undocumented draeger vendor prefix in fsl.yaml
> > --
> >
> > commit 3465979b7c116a128c865587fd61bc41cff5927b
> > Author: Petko Manolov <petko.manolov@konsulko.com>
> >
> > dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
> >
> > This commit adds the draeger,imx6q-m48 and draeger,imx6dl-m48 board
> > compatible strings to Documentation/devicetree/bindings/arm/fsl.yaml.
> >
> > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > index 656f2596e1d53..8f3a04228780a 100644
> > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > @@ -260,6 +260,7 @@ properties:
> > >                - boundary,imx6q-nitrogen6x
> > >                - compulab,cm-fx6           # CompuLab CM-FX6
> > >                - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
> > > +              - draeger,imx6q-m48         # Draeger imx6q variant of M48
> > >                - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
> > >                - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
> > >                - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
> > > @@ -458,6 +459,7 @@ properties:
> > >                - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
> > >                - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
> > >                - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
> > > +              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
> > >                - eckelmann,imx6dl-ci4x10
> > >                - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
> > >                - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
> >
> > [Severity: Low]
> > Both hunks in properties:compatible of
> > Documentation/devicetree/bindings/arm/fsl.yaml introduce compatible strings
> > with the draeger vendor prefix (draeger,imx6q-m48 and draeger,imx6dl-m48),
> > and the follow-up commit 6e00402d882f ("arm: dts: nxp: imx: Add devicetree
> > files for M48") uses them as well.
> >
> > However, patternProperties in
> > Documentation/devicetree/bindings/vendor-prefixes.yaml does not appear to
> > have a matching "^draeger,.*" entry:
> 
> Please add a draeger entry in vendor-prefixes.yaml.

It is already in linux-next.


cheers,
Petko
