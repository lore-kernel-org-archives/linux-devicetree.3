Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4228E38F25C
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540266; cv=none; b=dS45BSrTyMEXb70WAWShX/InWi9Ul6TtIglsieZwkiaRAwSP+DhEhDnle7QJUU5jZ1gr0dv6Fu5GEXKfeekex3SXS5ZiIclxLOIoKIHM7Qtum303LSqEq0d5aUmLS0+ikpogJS3SpnBWlKA5M8Ynf9SOcPzyPcOMxsnKQDLJnXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540266; c=relaxed/simple;
	bh=zuOhkEhl9/3hyPjwkXOeT9Ut7Y3NkxiWsPCsZKsgbNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+A0Xf8IgHE5sqkH/uUpOGcGy6Vtkpog2E3Gw6pmRiMXixLVrKKfJ46STdwqzKTnDaynAInhIhNw5vI49paAxVENZHy/V6/EbkDUrANOStEFE54BebfW5n5y+2+BGqk5UYCjFYpf1mjQ7ld02udZUZ07iz3wzLUat599xDcgm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lkplYKnu; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lkplYKnu"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90cd43bd740so13603646d6.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540263; x=1789145063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=lkplYKnuLx52STNBRE9/OmlWQ/WfYs+lwfMhZ000DoGGVaVdCgDiuDXUS/1p6Ruc9b
         2KGIuOHOp9dmFNj5tCeJ3yrQuTGCqe/vUECH0bhV9EDuZt82XUxU51E8QjSNL9E+My+J
         atNG2VhcgWGy3HUdVYpyePtJbA/G3T4Q93TvB8aC09O3Vj7NODxXvte1l+BOU4sUvEve
         grRdxqU9xVVfeQ3EcGGQQEx3qX2U9ywwIAHn81+UP46ynR1JPXIwrDnekXGEt4+MDcIR
         YI6GlKskDu9ShKEpLxWQKK8uJgn9kB32lvhylpkFZkAFM54XF5nUQSnO58yPxGO9Uxah
         iyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540263; x=1789145063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=of6GMIfUZkl1uQwP0a0+KTPjk7PqGd/+1e3LQeQSfvylgiF+FTo3y+UUpsbcvfBDdX
         cwtxTIuQobOwttuMyX3/V/U9QS2ZyeppQo8MOf3TOiZdrWZXWHReAJNTYzFPZ2UKlGwD
         SHyeOipk3aaY87iDMYtoyNWb1dgODUgHdF8zCPLYaADaF5HXhBzkzuE7NzyS0HgRTqEu
         PfLo+lWd3voIeRlPh9H9MBvQx4vM8GnWFzGiQJ3SzBMzB16j2fX+DySewcDq1w+jVndL
         hKOAyv0h4RmbDxONff8YMGfrXrSaM7vol8P2GhgSFZLLzky+ekILoM6juSd/cSY0NqWw
         G1uw==
X-Forwarded-Encrypted: i=1; AKwUvBwqBcVAEP0ImaaY6ZL9EQvLyLOZUM6HrlPqIXbwKH6xkaIQ+GWsZHT2NkXVSPdTwfu+m9mWciTcsTCT@vger.kernel.org
X-Gm-Message-State: AFuF++kLQdgPba3zFoNAnpq64V26JeRcxytHydTr9xPnpkatojeZnR22
	K2yRLBChGfm36a8V6xhBepKCKclO7Wl+NqInYfouhUhvTbKDKm3ajCRyAawRB3SWBA==
X-Gm-Gg: AYBFou0Ok7lAG86kwsKdnU/7opAi1LXmDRacNUcR83nR9YVw17EEimGcb/9F1WP/faZ
	SYRMcRO0zs1nRHojHZptH1vseDQyjzpnPjX1GJvqu4z3adjCr4g26UhFfFXtRODGH0ZYIjfGNOt
	BJ2q0c5kaXNOCeU92d212gAk+Tos0MS0xt8ENuwYhr7scO/OsNmL9l/89ZMLBGhproA0FjjIcph
	+yLWuPcwH+9U8izgMUeDjm2WDvJ+AuttdGP8gzRnzeUS8Zsm8GyW4iVydJ3WVSqtu8P9eTxx474
	wuaW8RFtM9hFLNXmt53eqz4MJvWIVmdgFQ1FX0/9DqW//bWlRvKVnFDm/kJL+npkt7iw7kjemfV
	8Xlp/ZaQEQGIOShee5iLsVCWosJWNALayKdU7MIhBC3f+Nf9ZJ2ww82EWU6rhVtEVvYsiKEGumi
	wFSYQx2CEwpAGR7u8axgx2yiaJXZ8Saf2QD8h0FLTmRaLguQ88AgaBl5UyrB9AEw==
X-Received: by 2002:a05:6214:3003:b0:910:3d6e:ed46 with SMTP id 6a1803df08f44-9103f0db656mr78478096d6.31.1788540263010;
        Fri, 04 Sep 2026 09:44:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040646d64sm24672736d6.14.2026.09.04.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:44:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:44:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 08/16] usb: hub: Pass |struct usb_port*| to
 usb_port_is_power_on()
Message-ID: <c3740c4f-6ae8-4c6e-8f80-105f1607ef55@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-9-wenst@chromium.org>

On Fri, Sep 04, 2026 at 04:41:47PM +0800, Chen-Yu Tsai wrote:
> usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
> it to tell if the hub/port is SuperSpeed or not.
> 
> In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> state tracking field in |struct usb_port|. Either structure can be used
> to identify whether a port/hub is SuperSpeed or not, as the field in
> |struct usb_port| is inherited from the hub:
> 
>     port->is_superspeed = hub_is_superspeed(hub)
> 
> Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> |struct usb_port*| so a subsequent change can use it.

Minor complaint (not referring to anything you're doing here): 
port->is_superspeed really should have a better name, more like

	port->is_superspeed_capable

or

	port->is_usb3.

As it stands, the name is ambiguous.  It might refer to the speed of 
devices that the port could connect to, or it might refer to the speed 
of the device the port is currently connected to.

Alan Stern
