Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049949;
	b=3QI4MqldfGk9tmWnEKhJLSxzLD1xDAwZeUG5oguZpscc96XYQjtPgPhZZXnImqh+il/D
	 iKHfEsQ0HxTjZWFRX5Ngd+pw/3mZhaLLaqt9bDGgROc3ztHOslHv5jnC6+gFUwxThgYiV
	 RIjM4sKpls7T0qRs67sm5Dg8hUQWubyaB86HqL1V2P6la4dlWMqH2ZEAFp4K4fQK/t4DL
	 +bAXuO6uqTGGPZ2oNByAjoDw6ckHmby6ewxMI6IEquDk8vu1rOcfWfWY2piHbdXT8SdQB
	 XP4iYwVSskDqVeYOwbYii5AKaNqxtY/CiS415dnAczeZK0bvtpRnNLjAL36NlYrnMWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kpcgrgeS4YJixEjOpFKN1PyswVGYEcCcMxkh0K6m0Ok=;
	b=vPFHqwaQ4D5BZr5J4IjeczbhdAXc9fmrepjzQHls9On+J8x1jmRQdNyGqf6mcrDTArg9
	 JRFuaFh73xrbsUircvb9uI9q/qSngsolRzbcoMRZhdHPjmRlY7xmwsHD7OSgCCmOFbtSu
	 /4tXZ22SzTN0GWkRTpzSJLcUjNC78YBIhc4cyHKoa3sCvaeINz3V7x1uS9SILjEnEcnM9
	 EHdcu2G1tFYfSOPzcZDz9g2CR1SronqsW77uNZK2gFai9Z44zKeeu3JAuo0bsGltd+nRv
	 T/6o0RDxgSLIEUaodOj+NIa+v+f75zV4V59oUfPwMTzCMR/URrWv/16JrgGv69ImXcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=toynIiF4;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDC0606A32F
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 11:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FDC0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=toynIiF4
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eb14c60a7cso1231445ad.3
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 03:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794049949; x=1794654749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpcgrgeS4YJixEjOpFKN1PyswVGYEcCcMxkh0K6m0Ok=;
        b=toynIiF4lQi2EG0ep/9UvK4SLQn83ci/V6WzBDqELM7fNOt2FIY+K2yUFZidtbGxlq
         V6cm+c1ij5DybJpfplIgNgullFXQaNsuTS1XccraiuYGSGLmzTBIP7MV/VTZrgj7Kma8
         SerWFdyxZZxDxbMH/bTfH1fN/fXXvq4drBlKns7HzEKBIy/N6+JZsjvdfhcnv0uGBsCi
         g92rpQ8aWOGnn33TNVh7NOXGxAV/HLll8fuNQAHvUp+BS9UMJ6rBVbReHRLX2SD5AOcA
         mhe11yAUDePbJ608xoT9i/m/i7NU9UUJX5Zzhv3bxtwQ04t7D5nr6GLxbLzVfwwVplKg
         e9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794049949; x=1794654749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpcgrgeS4YJixEjOpFKN1PyswVGYEcCcMxkh0K6m0Ok=;
        b=NJkgLiiDvp/XMJxNHZK5O+yWn11lBuf/ng5MSDoa/5ntUQ84nGKEEecljRv0nRbMRz
         kX6zAVcM9yqKeryzo/xJGiQqJ8Jx9B54mNj0nj6f+ep98wONu/LWlvPsVMxwH0iaJaxr
         sE73lpAQCW0KsPpNxszlfJdkonVKm9HjiUMD2sBAt/1IKBYWN9bkRJ2jzdDZW1cBI8rZ
         4CH0EOVWLTEqmzNN8o7JsWhQvjZ4l3oyNzSQoIhCnebQebRBX7O9m+gUKquEzrwheStJ
         keNp5qiTtJCGBE6WYGrnYUeTCtCjNYFcCzAK98axI2enhd7uwc4+qz10Lp1aGJoRG5jL
         9Y2Q==
X-Forwarded-Encrypted: i=1; AL+hErEY2FgQJUg4p7npvo2nFoqqEhztUI2i7ZIIdsCx60WUjZJCPDgOIz7PdInefxmvxrlYywiNec3Vw/IW@vger.kernel.org
X-Gm-Message-State: APuU4Z9/Ba93PA2/k20hndr9UkPvy6JYC07y8UHDrJRDVDxJW6HXX0fQ
	z41V4JC2c0a1oBn8wZA4STIIy39QriNWYgB9NHCd/uFmczQuF/PJ7Pz+h3TzZkCh
X-Gm-Gg: AYBFou0PlYX/YfBRSZP18oAC8fE+RsLgIr8G9R5dn+hakZNF4dA/o2onyIujM+v6FJG
	nAbdV3j/tr95fRDGWct32ZOGzssrF5Ekn7CG+5UUbnM+U/bbM4kZqfLZ8LfoE1r/vd2HdKF1v8G
	T7iCAkCGrn1gqDEucitRY3wQiFWYnItQczftl/HJtvGaQeaBs3mt7GdFEiBoteafLHLSuMVDYq9
	0N8XuaWluge4uuxWT0R7FkvRlwIeYccUHzieWVKwuGfbiHRCPJsaIoespbYa+yuSeNd9FyPqnNE
	bpZtQx98PHhqWZX19SXiO8npDQSDvbsyjHmRcYaJBleIPG5Z1989vy+VXF8e4uJuNrwOjA7Pag7
	+777z0PKZP8FTNacEQJxHJ82U/Cy6hdT8gc5Xdq4be+srrB3Jev1pMBVkHB6g4jGuD1D0XVIJyB
	KVReXKeRtjAkvVShSD0u4g9Jaio7FzvFpA7bjItCGyFsyQPfIRUXWemMGO6uRpwVzaA5IF1PFm3
	Yu5CmpHdbNVpwKQDT7sIYCDOA5SK5BdAe5vS3LBJ5YeiuLMn4PHyw7Qt6iyTeBG66W0ACvI4AkY
	kpcZ7AnaJ8AMfwBj+j0zCNpT
X-Received: by 2002:a17:903:1a24:b0:2e9:5714:607a with SMTP id d9443c01a7336-2ed416ae161mr87708345ad.2.1794049948724;
        Sat, 07 Nov 2026 03:12:28 -0800 (PST)
Received: from marchy ([2001:e68:544d:4b2a:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d89f59sm12431085ad.68.2026.11.07.03.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:12:28 -0800 (PST)
Date: Sat, 7 Nov 2026 19:12:25 +0800
From: Adam Azuddin <azuddinadam@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, jesszhan0024@gmail.com,
	airlied@gmail.com, simona@ffwll.ch, andersson@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: Add RAiO RA8875
 display controller
Message-ID: <au8HmdyRnuFmSmKh@marchy>
References: <20261030083737.47188-1-azuddinadam@gmail.com>
 <20261030083737.47188-2-azuddinadam@gmail.com>
 <20261103-zippy-quantum-bat-98b5ed@quoll>
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
In-Reply-To: <20261103-zippy-quantum-bat-98b5ed@quoll>

On Tue, Nov 03, 2026 at 11:49:07AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Oct 30, 2026 at 04:37:35PM +0800, Adam Azuddin wrote:
> > The RA8875 is an SPI-connected TFT display controller by RAiO
> > Technology Inc. It supports display resolutions of up to 800x480.
> > 
> > Assisted-by: LLM
> 
> You can drop this.
> 

Will drop.

> > +  interrupts:
> > +    description:
> > +      INT# pin, active low. Signals RA8875 interrupt events such as touch
> > +      panel, key scan, DMA, BTE and font access completion. Optional, since
> > +      the host can poll the interrupt status register instead.
> 
> Last sentence is not correct. What driver can do is here less relevant.
> Question is whether hardware datasheet allows interrupt being not
> connected.
> 

Understood. I will drop the sentence referencing driver polling.

Thanks for the review.

Regards,
Adam
