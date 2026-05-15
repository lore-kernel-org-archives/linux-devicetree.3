Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821A3B47F6
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855951; cv=none; b=FVAI9rChiSED2FMiyY09D+/zk6DEQZ3eofs+6H/a73MBfBpgUesS0qlKo7bVVydQkESx37KaG95cRzyJFuzD0JmGYt/PTOZCy7/nP4/Zh7YKthAsOoLpGeL8SSgkInxvELmXMhN2tzTeij0o78rx2uWQ92K2JSmYWesKXKlb25k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855951; c=relaxed/simple;
	bh=5ei7fh/Y69tCRQ3kK/dbGYFuojcIwy3an7mcbITipcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZL1BFqRkidBh7Quue3McenI8PSZKPYOq1zV5io2+Z7zr5hvuobIDv30Drluo1kEJ+O0TPNpMtx54Xo/s+Z69Coor8VZ0h+HEW8VSjtjtQ2ClZ5p2n/Q+MKlFpq3lfErMGTuulDJOC1LcmiLN+BjXC3bAO0Sp8rrBF3jCGD91qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=r5fzMnjx; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="r5fzMnjx"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95cc3522c40so5871304241.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778855949; x=1779460749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQxJjtW9NoHteCK0AjadT0ZiWp4xMo5S2G7yHBWhKm0=;
        b=r5fzMnjxo0qn47DQheu+8z2BqVawUayNL19uz+3HNCVkcfleHmePGSySdncjPWRlFL
         pyzYzWAhxGtYttSooQV6s0iEnztVj8Znl0pLey9ORkA+ry7diHDpSXXziTw4HzbpN+mL
         5igrMArIrATYGLp9FMEWMoWAwbQRiX7FBxA88r1H74RNRo0QkogWc0Pfy3h0uzfgy2Ow
         UOJpkHXJo1G9zABJeA/iUcFWpnGwA+3ztUcjxcxYS2KuQDWaMpKQrKJt6fpQyNp5Y1lw
         oMcuYZtMhxuN9N0/NLYbsqbptZruq8Iv+HICmnHUG1iWpANS/ZrpA6TwTCe6khEjfn+S
         hMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855949; x=1779460749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQxJjtW9NoHteCK0AjadT0ZiWp4xMo5S2G7yHBWhKm0=;
        b=UFG23D54xPeRP9jXmVeB1PCg7xLFwJknK6Mq/Rod8KCmY1xQHTyij8hqdSs9+IAX3E
         nJcgFC8mh+rwBd0czu2a3kRhc0BX+ctJ0CiD30XN7WN2iq0DUmoGeenTCFfS9aQ/3W0q
         VMrxPY0USs4qKmFYNJOLAh8xEgdrN7UEBPBHlh9+6c0Kmiy8M/ZxDoNB1wVcU2TQCvbA
         mCeuS2wxoQhmk/oVVKpNYXJhSqiFbyx7lp8p9apsBVRsicIHslYzUE7oWMAEJynYqp0O
         0tNhD7hW9bkJmJFMmeyVSoviTzCGXu157m/4aUSNNdmnCIFx4Rb2XYAHUIsamVLtEZS4
         keIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0EH/6bJxJyefLMNuwSyUBSc8E2mjfwkvvxBX0FRMqZXPNdEPxKWtWGQn0SgjI3VBW1RvNrh3hJLZg@vger.kernel.org
X-Gm-Message-State: AOJu0YzIu3wNLZ6x+FIjKCwlwE/pMfuVZbz0iKLLKIO9V7m7E/S+tNfb
	5e+hEzS4kH5H9rx09JzzhgAg5sF/odIEKArcQN3MmNmEBEE8+1z5HCS5ztok7LdxzA==
X-Gm-Gg: Acq92OG3Ix2O1yOW40oA6jzQdmZcs64ZdxG5tjGbVfgMm4fbK8agnr5GF0yX5f0PNmw
	jMkIe5oOoeUynCo7q/F0MP2lAb1CRSHczPlvF5zn4Bi6xr/nVlHHLz5GgzhHEArN2V7c+zTzkUd
	gk4oCd/qM2ijFR+vWdd3mKyNBoIJg69w/aVrzCwxUMG0PCEsoUC6AcHRFoXlxy11/kMLdievYu0
	v/nesrGqyP2C3h6AZP7tYSlOtgFEyF0Z4/qGFIIEFcpKm7QwNrLptgXEXfhPiD7lzQxasqA8lu+
	Fih2D5I6MOTQl5xxzV2QzkZqMdXOULF+nTzA+WsB344WTcxT8opAg6YgkvZGpPVF2PayaC5hVIz
	EZUXDo970WuosH6T3u0LVCcAO1mUyXb0ch/FcPpURpb6o7GfV+ooqVDzi+EF3zlAEPx6y/3/Ap4
	brqNKIg1riRsUTkTZx+3mhK0moVwEPt0Vw/tyHbNnD61Y=
X-Received: by 2002:a05:6102:e14:b0:633:1fbe:79c8 with SMTP id ada2fe7eead31-63a3f597eb4mr2246407137.23.1778855948736;
        Fri, 15 May 2026 07:39:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90b3d0bdbsm51850896d6.24.2026.05.15.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:39:08 -0700 (PDT)
Date: Fri, 15 May 2026 10:39:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH RFC 05/12] usb: hub: Power on connected M.2 E-key
 connectors
Message-ID: <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
References: <20260515090149.3169406-1-wenst@chromium.org>
 <20260515090149.3169406-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515090149.3169406-6-wenst@chromium.org>

On Fri, May 15, 2026 at 05:01:41PM +0800, Chen-Yu Tsai wrote:
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 90ea597d42ae..4165f71e212b 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -31,7 +31,9 @@
>  #include <linux/minmax.h>
>  #include <linux/mutex.h>
>  #include <linux/random.h>
> +#include <linux/of_graph.h>
>  #include <linux/pm_qos.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/kobject.h>
>  
>  #include <linux/bitfield.h>
> @@ -888,13 +890,25 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
>  {
>  	int ret;
>  
> +	if (set)
> +		ret = pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> +	else
> +		ret = pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> +	if (ret)
> +		return ret;
> +
>  	if (set)
>  		ret = set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  	else
>  		ret = usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  
> -	if (ret)
> +	if (ret) {
> +		if (set)
> +			pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> +		else
> +			pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
>  		return ret;
> +	}
>  
>  	if (set)
>  		set_bit(port1, hub->power_bits);
> @@ -1867,6 +1881,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	struct usb_host_interface *desc;
>  	struct usb_device *hdev;
>  	struct usb_hub *hub;
> +	int ret;
>  
>  	desc = intf->cur_altsetting;
>  	hdev = interface_to_usbdev(intf);

This change is totally useless.  Didn't you get a warning from the 
compiler when you built it?

> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index 9ebc5ef54a32..6039e5f5dcd7 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -85,6 +85,7 @@ struct usb_hub {
>   * @port_owner: port's owner
>   * @peer: related usb2 and usb3 ports (share the same connector)
>   * @connector: USB Type-C connector
> + * @pwrseq: power sequencing descriptor for the port
>   * @req: default pm qos request for hubs without port power control
>   * @connect_type: port's connect type
>   * @state: device state of the usb device attached to the port
> @@ -104,6 +105,7 @@ struct usb_port {
>  	struct usb_dev_state *port_owner;
>  	struct usb_port *peer;
>  	struct typec_connector *connector;
> +	struct pwrseq_desc *pwrseq;
>  	struct dev_pm_qos_request *req;
>  	enum usb_port_connect_type connect_type;
>  	enum usb_device_state state;

The fact that hub.h uses struct pwrseq_desc indicates that it ought to 
#include <linux/pwrseq/consumer.h>, instead of making the .c files do 
so themselves.  Then you wouldn't have to add the #include lines to 
hub.c and port.c.

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384c..2d09037fee93 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,11 +7,14 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>  
> +#include <linux/cleanup.h>

Why is this needed?

>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
>  #include <linux/sysfs.h>
> +#include <linux/of_graph.h>
>  #include <linux/pm_qos.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/component.h>
>  #include <linux/usb/of.h>
>  

Alan Stern
