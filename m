Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618CF480339
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018978; cv=none; b=pgrWq2OB+hd9ldENyUgCPirmgo6MOJTQwmOHHqW2sbXAP2zboJVX3XzCwGjrknvcQDpq+lZ2APgpELrD6nKCngbdK4k8R+7Unbl2TnE5HkNTBMHbcT2Iy90OASQSjaSyOoOrKIrtEX5Pzt1rr92AFvjCNE21p2obhgovACwNu2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018978; c=relaxed/simple;
	bh=oBMTASf5/yZwoC+w3jFNarp/B0A2dybfqyHkkOvqM8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnFze/IXtmx3/ekiyEcXk2r0Qa+GCYE55TlO5JWpBMlbhu01YuG5iqF9/4MJNdgCeUYegxXxQ0+d4YVaQ+VRJR+9NFzRB65xwUml4hW5K01DhSI8RtRIv9jzusDkdKbKqmwwHePAnE4Q1p9DfUdCjoTDgA3aabwb3TgerfSmi98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmeBzIEm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmeBzIEm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so3019549b3a.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018977; x=1781623777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqNUdlMGs9SJSOAMJ3lmDavV/mMqU3C6oJBVPqeQ0EI=;
        b=YmeBzIEmqoQDEW6G9Nh6k5kFysNDjseU6avBkwrDBJYuuBNz1zC4Ect25XU7rM30FO
         cJquyzccYYLoLs8ipzxZj+2O9YnVy//fCjtLIpGgAEyvnk+wzcuBP0MT1e9rHZm48zOp
         j9orlUulCCsfqBGabTATEBQsHEXJf5qpmkIHaUxueI+4cXT1U1DCXUAgMUX8CUgoiBl/
         a/jvAGmJ+VpJfREee7cR24iyprwoBKKYH+PgEK19f0QRGkAMaKNkdhSBPtn/zSdaoJdg
         LvduC62uXJHYaf3+U+ncraiEeeVwetcZ941n9mPl86Dm53MvATCKHtBgn04JmVXEz5z/
         yQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018977; x=1781623777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqNUdlMGs9SJSOAMJ3lmDavV/mMqU3C6oJBVPqeQ0EI=;
        b=bT/1xZKw8XQ9gR4mRCPuFwtkDc5VsTDldj2tLd4vQmhwM5FLPkyfX5gkKGwKsq+0GA
         lGBGaZRY8aXeHYYRNSn7JXxUFUPkqpvZCu07bVb5YruUfP3sfYGjFytKQj9WuzDz5ea/
         xgKD2aTBdSyRGFZ308QjXP02qvfjOUKwQheheIEOIbnXuxsqnhp2z67saIYPp0Zgw+OU
         eZS+rgwWLVglaAAg6VSGbKncY0Lu49H8RRi3E4RWXtbjPtmFJk1fPOfff6eqV+NaWaQc
         aePoiuyOOG6zD9iR5M/J4ETdzhWJA6ryW72EJc1i22fO5wgsnOormhUUd8RJG9aXGMeu
         tF/g==
X-Forwarded-Encrypted: i=1; AFNElJ+ucoBlBkMrZ21fTKZp2ODcYs3fTxCmZ2hd93PHeRFCOpWgwD7javvBTSxp0qSonSC/UeWoJF2o/qo0@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2Q4GMNVRB40Gl4gj4CjeLrkl2eEkSkUCyD6CjqyfR4wyO6cE
	R/13PWTzHQCdDzIEV3NKc7C6VOY0otzOiqG6USzFMgor+lw43JnklQgP
X-Gm-Gg: Acq92OG61CdZ2e4cdMeLMnJsSaTkgbX8f3ZZFQNNA7mB5KmL/iCODx6pFI09w3lRG+o
	TxnOY0TAYD4AB+ohBTFiWsUNoU1g8b32uXqqYXq/rGu3yPm+Qgg/RowDRiaD4PQe1qnIQ4yVGUr
	I2JqNC+gGlDRxOKlVU3MP2U30uYQEpQZZUigUZDvfoPwJOOOTD3Hg0tEaTtlRkJQZItASff8eYc
	pYDrm27f3hcXFnBwj+uZv6515+wtVtpxSTaT9PY0weHA9C32gYw3Z4KmK0GBa1yJAi4kBE0CWTl
	H2WjQsGaUyF/wO10RvYsG9X4LcAcU2Y6DHIIASgv/92JvkxOkyIMuXsakVC6Eh8whcsnw/WFOnN
	BI53cq3tvIik4VtTOETFo4EagbNYIdIHRG/jG9isaRtz7/w4z4dWG9CCozfd6qqj+HATUQ3qO9f
	BzT6lUvIhuq16FoyefLuzcj2PzIP9mexNUK3gLFXQEc1WchziVxTtqNK6Gug==
X-Received: by 2002:a05:6a00:1405:b0:842:3841:fdb9 with SMTP id d2e1a72fcca58-842b6823968mr15870182b3a.31.1781018976770;
        Tue, 09 Jun 2026 08:29:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288002asm21603784b3a.31.2026.06.09.08.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:29:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 08:29:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <7f1a04fc-587a-4a5b-9c5d-8f73ea5b2114@roeck-us.net>
References: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
 <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>

On Sat, May 02, 2026 at 10:56:53AM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Support the LTC4283 Hot Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
