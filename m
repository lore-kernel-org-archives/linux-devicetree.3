Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0843CC9E9
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080297; cv=none; b=lyocAr9Bv3rPiHtXmJLyuZVLiyrEX8V+2GuWtX98QgRK3cw56fvUtNGaMBziVsbT1XrSgbSg3lAgqahA856fLVqNINnMJcE1mSFD0pgizca6/FStziSJiWoVNY31TNy272fUP+tfgddpQc4666horE5pRSFmBnjS9B2k+gFcwdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080297; c=relaxed/simple;
	bh=56Siyovl6VI/xXaoNR4iTACjQL+X7tU79OlaOV6Kjeg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbZ4hEtnjsOtHXdvru1uXokMmvbo/4r9OYf4CPZbQuIiXSDRaE8NDFDttgZMNTjs7SBEIaeP6PwwskIGqdtc1VgoxLK3UkmTHjDJ4TlDH5q0m+tGp1gVGcp9T+0/l7JplrU8Cuc2puF9TQfxcC/ReSZVjSCNG7ATJPpNohFpyeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R43BrsCk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R43BrsCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F1A1F000E9
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783080296;
	bh=lYt6V9Jnqt8R/CJJl+keIMNvwfnVSgPAem6i+B/iGB0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=R43BrsCkCyKD/cc1XKL6zqzw3XTY2TUpQl7n0q5JuLJdVZNi18xkae1IcOWb2pmP2
	 illl8oyL+0cRX0a1cWPr+392XOPXDshG8txXXgvS94Pp4A+9wQYLOQOlDuarGUYpNa
	 JJfDmLgE6juRr8ofDcXTnOfq2Z9ENufPlYGG+yOG/Imcaimd0ivaN3esJXMdFhYPFQ
	 Bexmo1mq6eIpDnf3bjJSY/SnYCDQOQxQEIeP3Qte3g+4Mh/Byg7UCDdPPnWPgQA3wM
	 A4JVLQ0D5sW6yI4X5kTy2RCb8QmLJC/zsYvs7mMibj9jUM++lMCCkhqezmnfaIVnt/
	 F5x0ONb5FeqHA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b349ae174so4307501fa.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:04:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpVjNGVtldaFIesq8hEREhc8o5Tt3Bbrcj6Cs8FHJYXBrwp1e97DCxThOwc+R+dx668/Tv8A1cwGqDE@vger.kernel.org
X-Gm-Message-State: AOJu0YwaxBABeTtaGwncx6+FFsFHjoDX2H+b+5Fbg6tlNBbiE0MEfBfb
	+rrIce0hoLwiL0tgDKqV8ndg1mrUeON5bDy7othWh4n+ujO0od/1dQ7ezj5SIJ4HCUfWYwBDHRK
	0M7gSzixMKUpPVz6T4w+Rnhdfra9AJkOBDG+ZIE38+g==
X-Received: by 2002:a2e:beaa:0:b0:39b:32b3:b31f with SMTP id
 38308e7fff4ca-39b36dbe62amr23176871fa.5.1783080295099; Fri, 03 Jul 2026
 05:04:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:04:53 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:04:53 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703110317.1283411-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-3-wenst@chromium.org>
Date: Fri, 3 Jul 2026 07:04:53 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mc7TzwLS1Kbyd9OwXPJcHk-39kxgfagxxCCbKYK8QG0Vg@mail.gmail.com>
X-Gm-Features: AVVi8CfmsSUQO2IQlOpABcTwLAPK-fQZLHJJwpMHDg07kXLzC1jeLanLhSp6ZO4
Message-ID: <CAMRc=Mc7TzwLS1Kbyd9OwXPJcHk-39kxgfagxxCCbKYK8QG0Vg@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] device property: Add fwnode_graph_get_next_port_endpoint()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Jul 2026 13:03:03 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> Due to design constraints of the power sequencing API, the consumer
> must first be sure that the other side is actually a provider, or it
> will continually get -EPROBE_DEFER when requesting the power
> sequencing descriptor.
>
> In the upcoming USB power sequencing integration, the USB hub driver
> first needs to check whether a graph connection exists, and whether
> the other side of the connection is a supported connector type. The
> USB port is tied to a "port" firmware node, and this new helper will
> be used to get the endpoint under the known "port" firmware node.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Dropped unused |ep| variable
> - Rewrote as do {} while()
> - Dropped WARN() use
> ---
>  drivers/base/property.c  | 25 +++++++++++++++++++++++++
>  include/linux/property.h |  2 ++
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 3e3e19ef66a9..7e7ad3635806 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
>  }
>  EXPORT_SYMBOL(fwnode_irq_get_byname);
>
> +/**
> + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node in port
> + * @port: Pointer to the target port firmware node
> + * @prev: Previous endpoint node or %NULL to get the first
> + *
> + * The caller is responsible for calling fwnode_handle_put() on the returned
> + * fwnode pointer. Note that this function also puts a reference to @prev
> + * unconditionally.
> + *
> + * Return: an endpoint firmware node pointer or %NULL if no more endpoints

I think the correct keyword is Returns: followed by a newline.

> + * are available.
> + */
> +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
> +							  struct fwnode_handle *prev)
> +{
> +	do {
> +		prev = fwnode_get_next_child_node(port, prev);
> +		if (fwnode_name_eq(prev, "endpoint"))
> +			break;
> +	} while (prev);
> +
> +	return prev;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
> +
>  /**
>   * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
>   * @fwnode: Pointer to the parent firmware node
> diff --git a/include/linux/property.h b/include/linux/property.h
> index e04901c0bd8f..931e703393cb 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -506,6 +506,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
>  void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
>
>  struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
> +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
> +	const struct fwnode_handle *port, struct fwnode_handle *prev);
>  struct fwnode_handle *fwnode_graph_get_next_endpoint(
>  	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
>  struct fwnode_handle *
> --
> 2.55.0.rc0.799.gd6f94ed593-goog
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
