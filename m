Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A5471D0C
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 16:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540026; cv=none; b=XFt3+5nk+DuESdxx6zF3r5M0HkCKFkJH4U0Z4aTIRgZ98BntOo1OV5WNR7HS21VdLpZlUetUqWoY3CUVEBjKK6Z/jxIXua9TpdNstzAs0eJdid965AIoPvGaiaSsuX+BXJ+MBe/L30vgp0g3sOMVRDaP9L6JWKikZo6ZOALkjdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540026; c=relaxed/simple;
	bh=jqtuzC0nR43l61D6gvcZaII5xgpzEmMh90Esg3ewQrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zxm7KQqEXUpHCrY2jz5QUgpEipcsgzHSbbYGM8DBbw+cC/8puzXRyJz8ZxTcwr4LA6qSPfx7w1K21Q4QgXuxvzFFUBJ3/6PX7qpYwjAcTXBcO0EaGnEcQ/pbtLPwlbGeTwqdCbipi0Lf6GfRxd2DiaActC/ZWItOf8P2EZJisP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Xw0ztEIJ; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Xw0ztEIJ"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90f9f8553e0so14613126d6.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540023; x=1789144823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=;
        b=Xw0ztEIJbMLMQ7ifS+CaUe0m0mhF0bBQNhWTpMXSxN6URC88+zF1+iRdm0TVGoMu7O
         8Ht2I6GMrv5h04YkIRoGVM1djgDQTgFEH2iUrqmTNkReM6X50Z6wyIfu//uyCp0hwfsn
         zo909hiDroAZE3Q+zq6drAgFgd7m1ydjsuuJGsKT7RtmqNQAL+LfGBspPW6zGkYI7L+A
         NKkktzRtsUH15JQmt9ldxAlAe6/1dOcrgrDjCMU14DUOtsZjFG/nQ9HhDkyqZa2OmgQH
         fxQUXikFGLGuvyBLcCzWykasG2otX6DcJbjEc6MsAOYsAqd4PEX6Bd2P5FkFpSyaDbR+
         pB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540023; x=1789144823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=;
        b=Bivk5dozjwVm0+uDug8WCL+JJim+gOCld+YubG12gxD3PU/2S4fvZagdz4s+VTUY7E
         Iw8HltapzYOY09pg7sXyNdiQUB2gwjvCgZdqtN5102hj/HbBONoPhGkpRx1GFgWFHZCk
         t7uW8Ajk8H5zOWlek6R0cRy3SRbjDnW//AJdNsDhwGTDchvMbpUxOx/IY1c2W+NNszQx
         3/R5WLF+yTymp48RMZxRiRQWdgRmeDN5cEv/QAxV9li3isy9Vov25Dm6AjtONQyruH1p
         VayqADfDT8drRB6LpqlgfDrB+E0C1gPhYrEjQWhPwti/89NLcep6J2YLY4KH+PeiWtL4
         hkig==
X-Forwarded-Encrypted: i=1; AKwUvBzvdn8M+I023QLACN9A0vU1szQm8ldcUbtaZbJA72KWEjzWy0tEV5zJlNZTA0zERihHLnA9JPSr1iqv@vger.kernel.org
X-Gm-Message-State: AFuF++l/v633fCWPmLDfFP04LxfezA+6q8+0rHpWUhtap2F5XnVy9m+W
	JLFGE/s+Wv2VufD7IlYwriWhM/lNKchi1j9s/0M7D0T6IFqbg3wu/mrmbiKM+b7EGw==
X-Gm-Gg: AYBFou3w8wKx4FzVLwb0vUISZRPwjwlWMwBvT13xBFLIyrQlkmZVH3qSOxCBGaE6v6Q
	F/Aa8rTLLBaw9HWvSq9Jbh4QDlzCdleRuI2n0amloj0pz//US+g3232Okqb7uKBOnl0hU8oIyIB
	S+ha8yaeCLXqvTI/69QjKnjOWAEzOhYNphYLKTolb6hHz7WhwPH5eb2ymW4LpVAh+VHI4vk6v5z
	i3IR049RY8iSrI93jBeWDAOsMp8bNJtwy8taZ9xOWVrGbjMS99NhENOFRte49lUh1MDPOqb+8jK
	MlGrgfGw4BJicLFnN06dYHbwarDOu+GNT/fuvPAGLTJ4DB7G8a7jnRtmZh0VQroOA17Fa2UD2jc
	7v4syWLXfPmDZiJ6pV/KBm6+8GCHJzqKEUOUy0pedgnnk1riZgJ7NX7ob3gUGpySPILhY83n1N4
	yEwVc+xZEHskxyf5dbgYQurxejIOJUOzaLP66dbIjXfx0lVHkLLEKrZQWCH+WTYg==
X-Received: by 2002:a05:620a:8017:b0:939:6ec8:6928 with SMTP id af79cd13be357-9398037ac44mr706361285a.16.1788540023360;
        Fri, 04 Sep 2026 09:40:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm246420885a.14.2026.09.04.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:40:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:40:20 -0400
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
Subject: Re: [PATCH v8 07/16] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <6bc3c29d-aa38-4e59-a4f5-2c480ef9c748@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-8-wenst@chromium.org>

On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.
> 
> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.
> 
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.
> 
> Also drop 'extern' from the header declaration of usb_port_is_power_on().
> This is not needed in modern C.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

> diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
> new file mode 100644
> index 000000000000..00f7500af336
> --- /dev/null
> +++ b/drivers/usb/core/port.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * usb hub driver head file
> + *
> + * Copyright (C) 1999 Linus Torvalds
> + * Copyright (C) 1999 Johannes Erdfelt
> + * Copyright (C) 1999 Gregory P. Smith
> + * Copyright (C) 2001 Brad Hards (bhards@bigpond.net.au)
> + * Copyright (C) 2012 Intel Corp (tianyu.lan@intel.com)

These copyright notices are entirely inappropriate for this file.  As 
far as I know, none of these people wrote any of the code you moved 
here.

Alan Stern
