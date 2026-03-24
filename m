Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3793DB63A
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359059; cv=none; b=JLIdTgq166I9fpa+WbV20wPN5/3TGiavHZoyTISAY4VWkeABltn4PJPwEAKC3e5dhBnlfdhA3axf8WC6JC8DvdgLNyyWIriqR8uB8bJwdUD3ON8PyRUlJ8VO2w/U4gQpzPv63BbpCsoiDclQQ7yNPHrbvLCuScFE55hhPdRVhSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359059; c=relaxed/simple;
	bh=ps5VTXqoSaxRQSODgfzno6Phc/AIFnVXZFcO74FSICw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSr+ytO6arckL9HpJ8nmlelWUXWOA/fkf8Oj1nxs+ofSm7Ybz182keXcptkcNemmHzzszbDaImNAfTb8fk86xbm76JUAgUkgMUtKKReKrlNWfocn/rX2ti4wH3ExZ71uneSee+kq8XWZ2nR0XrxQI1u3ITpnhz0mKjv9MRJCr8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnNiEtMO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnNiEtMO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2adbfab4501so17087605ad.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359056; x=1774963856; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iKCvDxPU4e1QcvYZGXsXfBq0hdgl0iM7/+HP8gM9eA=;
        b=XnNiEtMOjB+XXbYpMjEzvlkAWgUiwfKdb+xJYjNKC4xkqEQ1sbXbITgZvywAU3f/08
         sKa6LJ/gpI/qkYMD9SlqRdgVRK7/1uhaN+r3cEnNcAKAgVsD+xO/hso/DTZ0iaTCwGiO
         h17CLa6vlgVnkGcYKwBavpTG0tfqkRsmOqb1fBVJR/QaA2Cf8deEsVEfYCzyEIMxdxWL
         i/r5UuFYWZdoW2Dtc0U6sgKtHOIwcRWkOEuvxhocBY/2Dn17fDSbT0taeEUd20aqdRNU
         43zYqhvs8hXGwpXTsiLV1vaIdf3nN+sI0tR/qY/9wi5mcM0ZvOyixxKf874he7VKO9q8
         fPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359056; x=1774963856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9iKCvDxPU4e1QcvYZGXsXfBq0hdgl0iM7/+HP8gM9eA=;
        b=kY3YHsMa1CyZC14USsUQZz2JCt/3Ycl/RXoguKPAdupQItwYfUaoAp9QAzJuLJ9zNL
         cdHQjHVLN88oTSkf1scpmmvoNWH0T11z0ky29mWZeqbVPh/sY3gnTeW+P83IM1FuTBsn
         gBXHCMkWNA0hv6dXiteGIIEfB1N2g2zZVYw5fXQoUde0SY4O60f6TJVieQOHlt1vkDyn
         p372TSgY1TWUwHEXF3jHBtWZV79pwuzeVRxn4REbYMk0genSlgIRtlD9BSUiND9B+fDa
         3DD8hxm2IbRDl92StYXuyONbAet7TrfPV9dI6j54A7UTbIsIS4sTlJ5PldwhS4tWZDo/
         yrlA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7CX9Ee+7v98tXYEKuiENhtf0xoa5l/w1sQ62e98qOaZNb+GQ+EU3yyw69S0WhtESSt0vG18nXCnF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbfk/mJP8q711onz4oeKK74GFQOsLjoMPW8n6ZG8vXj2FzJveW
	a2rj5LGmoClG/PcD469mh0dvsRtX8zwqJNhRjI1GVhPGhu3pANYyAxLi
X-Gm-Gg: ATEYQzwYDcRIb3Ip3RL/s7FV7kJdjYn+bQDsJbojTjo4etZpnHJLntr4OkUy24pkq5O
	owuCuJ95ITwp6wJusaoP5xLL4Mio7hf9s3ZyUkVe+jCxGSzH6BwqBQKtTDM12NcggPb4wlZcJ7U
	BuIfqWMvA/RIbwB7YMO3FiN4NVYJfKX90+YBBPvZv3W5jKoGMMNuruCXEKoIluR0Gqy/RXU5keo
	2wNbD5J6gKzYu3KkilKgLo3NgHklk27ARaLc3OtfYHIMJknAbZq9ChpQYtvyRhE28usR5XkNVxs
	0kqqrFeiMzi9aw5jEdmgOwel0kNXi48QHlOZhZmYqGgd6FdgwnETa30qMv9YrnyQYLz4z3hBsll
	MEAjKykgDn3VCyqBW4ZWkUQjQT01grqV/5BOY44E4fiAGI6UKYRbQh8MDx5d5ds3vMJn+W0N2DX
	9Osx53E0QS8iZmvrLZ150S6Yw7oW3+XHYdT9DogEvnYdc7aDdSPXtKZQF4bsc=
X-Received: by 2002:a17:903:380b:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2b082724a85mr165419795ad.16.1774359055635;
        Tue, 24 Mar 2026 06:30:55 -0700 (PDT)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a7ffafdsm9821747a12.7.2026.03.24.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:30:54 -0700 (PDT)
Date: Tue, 24 Mar 2026 19:00:49 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, rafael@kernel.org, 
	daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, vireshk@kernel.org, conor+dt@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, simona.toaca@nxp.com, d-gole@ti.com, 
	m-chawdhry@ti.com
Subject: Re: [PATCH 2/2] ARM: dts: st: spear: fix dtbs warning on spear
 thermal sensor
Message-ID: <acKEJrB6vc9wfd1k@toolbx>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
 <20260323133814.14152-3-krishnagopi487@gmail.com>
 <20260324-smoky-radical-hyrax-1274a9@quoll>
 <cd3400ce-295e-450f-b650-6715142ccbde@nxp.com>
 <5a9f84fe-5827-48e7-8e4e-699cf8ae4776@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a9f84fe-5827-48e7-8e4e-699cf8ae4776@kernel.org>

On Tue, Mar 24, 2026 at 11:01:05AM +0100, Krzysztof Kozlowski wrote:

> On 24/03/2026 11:00, Daniel Baluta wrote:
> > On 3/24/26 11:26, Krzysztof Kozlowski wrote:
> >> On Mon, Mar 23, 2026 at 07:08:09PM +0530, Gopi Krishna Menon wrote:
> >>> Running DTBS checks on st/spear1340-evb.dtb results in the following
> >>> warning:
> >>>
> >>> thermal@e07008c4 (st,thermal-spear1340): Unevaluated properties are not allowed ('thermal_flags' was unexpected)
> >>>   from schema $id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml
> >> How is it possible if there is no such file?
> >>
> >> Did you just add new warning in patch #1 and then claim in patch #2 that
> >> you fix it?
> >>
> >> You completely miss the point why this change is needed: how could the
> >> DTS work before? It could not. And that should be your justification for
> >> the patch, with explanation why it could not work.
> > 
> > Correct me if I'm wrong but I think there was a hidden bug here 
> > 
> > drivers/thermal/spear_thermal.c:spear_thermal_probe:
> > 
> >       if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
> > »       »       dev_err(&pdev->dev, "Failed: DT Pdata not passed\n");                                                                                                                         
> > »       »       return -EINVAL;
> > »       }
> > 
> > So, the driver was checking for the correct property as pointed by 
> 
> Yes
> 
> > 
> > bindings/thermal/spear-thermal.txt but the dts was using the wrong
> 
> No, DTS had two properties - correct one and incorrect.
> 

Yup, spear13xx is included by spear1310.dtsi and spear1340.dtsi both of
which have st,thermal-flags correctly defined. When working on this
patch, after converting the binding, I ran dtbs check and upon seeing
dtbs warning immediately fixed it thinking it was complaining because
st,thermal-flags (thermal_flags) was written incorrectly. (Which is not
incorrect as st,thermal-flags was there in the final node but there was one
additional property named thermal_flags as well which is not allowed as
UnevaluatedProperty is set to false). 

Also I dont think we have to override the st,thermal-flags property in
spear1310.dtsi as the flags value is same in spear13xx.dtsi and
spear1310.dtsi (0x7000).

> > 
> > property name: arch/arm/boot/dts/st/spear13xx.dtsi » » » thermal@e07008c4 { » » » » compatible = "st,thermal-spear1340"; » » » » reg = <0xe07008c4 0x4>; » » » » thermal_flags = <0x7000>; » » » }; And because this check is wrong:
> > 
> >       if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
> > 
> > people really didn't notice it.
> > 
> > The check should be:
> > 
> >       if (!np || of_property_read_u32(np, "st,thermal-flags", &val)) {
> > »       »       dev_err(&pdev->dev, "Failed: DT Pdata not passed\n");                                                                                                                         
> > »       »       return -EINVAL;
> > »       }
> > 
> > So, this actual patch has uncovered a bug! 
> 
> Yes. Driver also has bug, so probably was never working. The point is
> whatever commit is doing, the dtbs_check warning is not the
> justification, because it was introduced by this patchset.
> 

Please correct me if I am wrong Krzysztof but should i send a seperate patch
fixing the thermal_flags property (Not connected to these converted
bindings)?.

Also, is it necessary to set additionalProperties to true? I am not able to
figure out if that is needed.

> Best regards,
> Krzysztof

Thanks,
Gopi Krishna Menon
