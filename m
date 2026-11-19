Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115548;
	b=Llvv+mIj9b/Gv+2bR0uPu+oJ6Hcc8iBeW9E/K8OmzwD4gFRh7/LwKz2WhbDOVeFhKTcf
	 XxyM+pA4Jr9SkfuOsieaVg5J5OHDog9LkUu4wwfv9sqeC4ParAjuTjOwl20i2GtseZWza
	 hc6sOjN4Kp0QOV0RZ/Ov6B5tviSisCZmq+WcXabcVsWDBgm+AjucQt4R6kr0GVBnOBzjj
	 h+mWTSjTblE6FxsPiP43KuwdSthsk+V58xxQvb6D3HrTFQmk5ekmsfK69teWFbQAe/wnf
	 0RPmeZ4JngUi4LdaUFliMJA/5om40tF10eBSBMr61rQTlushKrQC/F51Rho0iMlN7qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cPRlIWoU3nedg5UMks9BflBLw1pyZb+IzsqBpWtRPsw=;
	b=teCH0fC+Qqr4HjIDedCCLmdXtFpkj3zoFAicUzhfJsSENEIU8bUUkpbWgnzrzrHG561B
	 Kqq235RFQh9ymex0NKvcpYQY6y0AV5MR4RysYespcBw5s5i+2wZt3BEgeqS1fJdAyxqBE
	 culA9zr+DKCmzleYaztGFAxSjP24AUQ8gZceAkzGPthMC+Jpz0PqNHd0K0zmHtiTw/kuw
	 0A0HdG8Z3ZPmO3nN3xYUe+n6flFNOR4/5N2yfr8DYSIiqc96R+W04uXVm5m7PbXOClCaW
	 Z3AfBwFmX/Q2h34ziOggdJxA6FOj4Y6FTaa6LO2Viz2ctkimLl5fA1BpuPz9Smvla9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lXIUtlOx;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263A2606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 263A2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lXIUtlOx
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4b0348a4c79so129429fac.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795115547; x=1795720347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPRlIWoU3nedg5UMks9BflBLw1pyZb+IzsqBpWtRPsw=;
        b=lXIUtlOxNq2TkLnLAun0ua+pW2mfwPSBEN9OVeCfZXhlA5QXOftv09k+7+IG3v15EP
         m3eDMbbcaoGSZfuflOwQIYvyDBo06jO/PbzEoRGcfgGj/r5cy1C2neP8sEmnOtKIqtKX
         jy7r3t0KU/r+qnzYCj1xWqdBftURSZmQ2pR8cex0AOjGYPFWnxT0iNE9Da/mECkN3Pdz
         b1KtQF1A9fKuxk/+k/1ABXxoi4+y+hhvQ3b/y4zC6EPFQF+Ht0x0c3CQkX7y9etZmNx4
         QfAceFMYRODiMM7Exq2l+sq3WoalYD5QD5mwT6fJS4sjq9zWgDCQbnBERngmbInEmtco
         +YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115547; x=1795720347;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPRlIWoU3nedg5UMks9BflBLw1pyZb+IzsqBpWtRPsw=;
        b=P2rdkAmxCHmS/hMPcDW8m53cunj/vzacIMEn8JA39gFjIcFPl4gYWQhcqymAxcn7Ky
         zTaoFOOrpfkiI0wwc3vvFbRMCJbRv8dV1Kqmcd0WP8Twfyr0nv7HSyqfABjClQudiJai
         wPSJGIG90kp6OSpAdia7h5CRLe7AU09a/ihA3DJImSdublAsn7e7bmtkOdru3qYTJ88p
         lYovs3ZjR1MHcZoabNOQ7y+2xB3EWhiLF9QooOcmcpx21B308luELaIfUZIs8Ay738bh
         Ur64NH6DJzRMZ6gxnunbhYHPDCknDMrJFVPfDCcagtg7bpPAgjYWjFDw4Od4YFTMhsqB
         LLBg==
X-Forwarded-Encrypted: i=1; AL+hErGHtVvoQQdD5a+Y6ubtl2R72WOlBDxyuLD7SzXEUq9kswK1YjMVtMUkiNpYwO01q7KYD+1/GiiZxAqH@vger.kernel.org
X-Gm-Message-State: APuU4Z8rWpE3wj4dDozQI1qAKEZE5kQsfilTTLb9PgQG2eXDxIB0X4yK
	eeBVTRcDXpIhBggvhFD0aQ5uwGWOo/Wy7H1MxqzSfu4YTa2uyr89YrXq
X-Gm-Gg: AYBFou0pMHkghaEye16+wqTM6EoRxnV+rU2JTrJUMyfSapoJnun+fzBf5UHMRaJGiTA
	h9hT0v1DiPh7VO0QG7JJ+OG5W2SG7bGsGu03KxI9F/qxJ8ZIWDoERRHpstyYH3zlGREegejYHlv
	Ax7Dpp70Oq9CEhuIJTRoQ1yHMwjigtFPFtYy7sAjOgfmY0U7t5wta/WTN/2loIwLUpvAazs8u5e
	D8KcpN45GOKkpivr50iAJI0oNW6wltFz8+Aq+IujFaoldQuWJ6WHkVEt1nKfXhEig1gYz273+4a
	oZ3tqcnF+Vug2jvAsPL7vNWo4haz8RvHk8hOdjimT7X6vl2atOZiRQ+pB41y+ERUwGpOtpRnprJ
	obeQNSgcZmH+WEGF0l+mUxyojmXY7e1PUgF2x9xcPVZoUN71jFonHF0mj5Uh9Km+QRSDeMSpZPF
	n8MUCJSoORNPwzZx3h50BoZpOsCYF3ydYAzfYBWVhKHkmtI8/oOeHm4Yu6tRGn8rQZIY0EnVqVB
	DTf4Kz66Zny4efOUcwBzwv57qELSpo8KcWS5LD7KHl8qTHmkCGRlc4PjIlklgluTDjk0A7tkp8G
	+vJjq5sdrCKlANGaSZa2afgFWjzeLUneI4jqz/5Zngqq3Q==
X-Received: by 2002:a05:6808:c3d2:b0:4e9:3412:14ac with SMTP id 5614622812f47-57a0af3421bmr1094077b6e.33.1795115546794;
        Thu, 19 Nov 2026 11:12:26 -0800 (PST)
Received: from neuromancer.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a347636b9sm223450b6e.7.2026.11.19.11.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:12:26 -0800 (PST)
Date: Thu, 19 Nov 2026 13:12:24 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, heiko@sntech.de,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	sre@kernel.org, t.schramm@manjaro.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: cw2015: add cw2215, cw2217, and
 cw2218
Message-ID: <av9KGG70s_UAkKJO@neuromancer.localdomain>
References: <20261027131751.1724448-1-macroalpha82@gmail.com>
 <20261027131751.1724448-2-macroalpha82@gmail.com>
 <83695285-207e-4d0f-ada0-2273953e2eb9@kernel.org>
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
In-Reply-To: <83695285-207e-4d0f-ada0-2273953e2eb9@kernel.org>

On Tue, Oct 27, 2026 at 04:57:12PM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2026 14:17, Chris Morgan wrote:
> >  
> > -allOf:
> > -  - $ref: power-supply.yaml#
> > -
> >  properties:
> >    compatible:
> > -    const: cellwise,cw2015
> > +    enum:
> > +      - cellwise,cw2015
> > +      - cellwise,cw2215
> > +      - cellwise,cw2217
> > +      - cellwise,cw2218
> >  
> >    reg:
> >      maxItems: 1
> > @@ -31,8 +32,6 @@ properties:
> >        it is to mail two batteries to a test facility of CellWise and receive
> >        back a test report with the binary blob.
> >      $ref: /schemas/types.yaml#/definitions/uint8-array
> > -    minItems: 64
> > -    maxItems: 64
> 
> This needs min/maxItems constraints.

I'm removing the constraints here and pushing it down below where there is
logic based on the compatible string. For the new cellwise,cw2217 the
constraint is 80, while the constraint remains 64 for other implementations.

> 
> >  
> >    cellwise,monitor-interval-ms:
> >      description:
> > @@ -41,7 +40,14 @@ properties:
> >  
> >    power-supplies:
> >      minItems: 1
> > -    maxItems: 8 # Should be enough
> > +    maxItems: 8  # Should be enough
> 
> Why changing? yamllint complained?
> 

Yes, it did. Should I not fix it and ignore yamllint (since I'm not
actually modifying this line)?

> > +
> > +  shunt-resistor-micro-ohms:
> > +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

Understood, thank you.

> 
> > +      The value, in micro-ohms, of the shunt resistor used for sampling
> > +      the battery current.
> > +    minimum: 1000000
> > +    maximum: 50000000
> >  
> >    monitored-battery: true
> >  
> > @@ -49,6 +55,28 @@ required:
> >    - compatible
> >    - reg
> >  
> > +allOf:
> > +  - $ref: power-supply.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - cellwise,cw2015
> > +    then:
> > +      properties:
> > +        shunt-resistor-micro-ohms: false
> > +
> > +        cellwise,battery-profile:
> > +          minItems: 64
> > +          maxItems: 64
> > +
> > +    else:
> > +      properties:
> > +        cellwise,battery-profile:
> > +          minItems: 80
> > +          maxItems: 80
> 
> default for shunt-resistor-micro-ohms? or is it required for new devices?

I'll add a default, since there is a default value in the driver.

> 
> 
> Best regards,
> Krzysztof
> 

Thank you,
Chris

> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
