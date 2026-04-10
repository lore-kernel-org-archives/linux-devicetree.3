Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D2C3DA7D2
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834849; cv=none; b=k//M99CeCVDHYfLCmTqOO2LczzXMgN6F4/+D+LABK6QZVnPc4IM20ByGpqfMw8aK9rETnWXC/ebK1VBN1syN7oAzF5S53489QK+MknNKG0daBhMbusdU/sGbYDtgoUy/N4ilxDM2BK/sWqyRTmzDBFO9uN+mgF9ZzJ7ZNq05pKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834849; c=relaxed/simple;
	bh=R25NwmejgxLkQZH+OSxc/lixx5ewkLl24aPZCY8ljWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmoSHQONN7aQsi5gQ467lr8oGd3fAdfjL5ronBX46+1ASzy7y8WEHxAsEtXMVpJvIsA6bBDOWJ4QojJaAQicbZAMKUpSyWLnSTOmc+hQnCKuDqhy9x97UjXIL+FDtrcFFUXG2xDVlsk8Vv5yLPXTdU6rgrnVLI3GtEB+IwsLf3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rd3wXb0Y; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rd3wXb0Y"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b4520f6b32so2308585eec.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775834847; x=1776439647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N14PpywjFOnv1dVEJAzVel0cz9Tbu/mb7HwPxW2R7Hc=;
        b=rd3wXb0YzI+sP34Ww3Yfm1TaAF7Cvk1OLgf+aC9MxpJs0nkNhXT11Fx5WW9houq+Uf
         DXa7Fde6466WnRGyLgFkWZ0nYaQ6zutmbI4bW3KHA9tg+zkCIz4g8PO0YO0OVGDqk967
         L1akQV58GpEVSz5nEP/ia1DUy2wnuL1bhPI9YsnMSDTCMp2igxaJx1dVWVxxigEN2Atk
         Kcesimws2UGYwm1GLKBRu1694sZ3osDyS4EMd0OaP0j8Iu5r8K9yrkq+0lUNVfbok6dh
         rNntB/qQRDKzdZCY9Et0DPRqn8kGkuexL/QpmCm9hZC3hgZLxev5W4XRdR0Pb/h03cbs
         nt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775834847; x=1776439647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N14PpywjFOnv1dVEJAzVel0cz9Tbu/mb7HwPxW2R7Hc=;
        b=oKFxI95QRfdS290ma9nb0E72OYxujuBgbd+m4F5e/XgH8p/pa2S7Fv0OZw8emUttGy
         8EiGKsurMeQe83WFYCLUq5o60sCSf4yKZ83kdVJpoPMFjXzHQG+HY8BLXOfboKiUwq/x
         D3X7M9EUtuMsdxplDRJvY4Kcc808G9+MRQuWq5nPSwooBotvrd3oGVBCW8wrBUXaFSdM
         etZPS2t9jWsBUKgCvSGOOWQO2SAWbT2HD0HmjYZYCqZsnD5Hb+nB+tSUj0WVfi8X/qhd
         bMS/yNAXWOkpY4Wmi3oQbT9zzYU24cFgMKRBYt1C8wRWxizAqG1Lua6bdS7BgwtqDIBX
         lNSg==
X-Forwarded-Encrypted: i=1; AJvYcCUECUHxm6xi8WWY7Qp75P9VNV1z3a0TZA/5EzTtRZ7RctFYG9uoWpT6sr14+Y7W9V+zQpjqDwtC5k/p@vger.kernel.org
X-Gm-Message-State: AOJu0YzyAsGkldlVSZvnDFNDng16tpLKjcKzcAPtwenxnbZTC/SQtgJS
	y3PXQO0+x7oBOiwicesXb7zhF76vNj+NxefqqdhYL2hYe/Q27gVABYx2
X-Gm-Gg: AeBDietBtKdGCiIyAsXUJtCw1ccrlQ1tNiQp1RwAgoxX5PgPkO84PY8X+1Ksh1kkynb
	sYvKJu6D+TiIqz5ehAp1IifUcz/HntiPzA6awaN9v2pycTQdEu7XyRnx8Lnp5gDfQE6u7B0EBW8
	uZ0AyN6XD1/onUfLyIAdQumKTOf86z4lxf8KpU0biUAmelCLn/Jwf/GaVfET0ItLxfCVwMErXP2
	SeOjagwoBqmy7e9uuip8nj8xuTx7NqxxdlK+aFGhbAavgWGVhnoS969c/UaYZ8o5hFbtjGHqaKV
	IvyWQD6gGWohAy4b+dIiIzzNS9pw59yWdXVPAB8mDFj+lQB4TeVvxvTRKEFN8/vmlWsgDtvxR3e
	Guo0CeyE9A9AXW3VikzIn+TdLV9HxtIUfNaXDP48h/Io2s5omkppqdRj/7ytUugXp9KAJf2iNBd
	U84SM19JbUSo95R0BINeMMTsS9aSWOZov+yZIF
X-Received: by 2002:a05:7301:1f10:b0:2c0:ba91:48b6 with SMTP id 5a478bee46e88-2d5898ad1a3mr2307814eec.26.1775834846815;
        Fri, 10 Apr 2026 08:27:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d5e43sm4520331eec.21.2026.04.10.08.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:27:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 08:27:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: pmbus: Add support for Sony APS-379
Message-ID: <bf27e817-9e55-45bb-aef9-a34025137faa@roeck-us.net>
References: <20260410012414.2818829-1-chris.packham@alliedtelesis.co.nz>
 <20260410012414.2818829-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410012414.2818829-3-chris.packham@alliedtelesis.co.nz>

On Fri, Apr 10, 2026 at 01:24:12PM +1200, Chris Packham wrote:
> Add pmbus support for Sony APS-379 power supplies. There are a few PMBUS
> commands that return data that is undocumented/invalid so these need to
> be rejected with -ENXIO. The READ_VOUT command returns data in linear11
> format instead of linear16 so we need to workaround this.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied.

Thanks,
Guenter
