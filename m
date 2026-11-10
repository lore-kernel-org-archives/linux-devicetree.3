Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325566;
	b=gDtBOYKR0zkHIvYOBQrp70KFTCjThIUvZ7WihJC1L7B0UDzsb/Fa+fWc0eLW4zLUslpP
	 Mk8WJmH79LVyUsCTcG+nmg1U5glY+Yfn0JtHHrTgw/7Ip5CaU9M5/3fLgL6IYbC6aWvWU
	 y+ef57wHKka+fD6SNZp4V/cJBtFmTZSpIyxfojD6k654CIVew9L3hxmjdVbO3dDYcyBsi
	 0RKqkDvtHMUrJNkmrRphHQB+H/yXXQXikVdmXVbByouIyjSoEO5VZ0Hw31NldEPFro54d
	 DqVDy1nYafWwDcdnUs5dN92E3JyKwrXvRNpg5r/UozNc62uKB27bF2NnWYdTX+rtSEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
	b=NgYLewoYZcdXvgoesEMdYVhKkQRd07qQPI6bkr1mYllvZTA3blXvDbpQ1WC8LsRYeBe/
	 o1B7jxbh9vwQS0g65FQQdEWJqUP13rCyBsNIuMxGxgWYzvmGwD8qz8hL3EMiAANN/7WsD
	 rMUdxWEZivXOifx/1Xaechei60EWh4fvjAsT732jQFCpykE9aAlzAzXdvnTSP9lph0L8w
	 kdIriw9uFZ5Vr0liVFGZH+5BTSCGAWWp694hBAy9X3DRbP4629xq+bHJmCBrBE7YBq7Lm
	 cgdL9o60vilDV9BjHg9MDQvWuRJHCLNx8DMztrbZbwQGpvJ20MxRJONnia2l8/8Fd4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="TxW0Z/LW";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0971606AB74
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 15:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0971606AB74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TxW0Z/LW
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1013179a12.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794325565; x=1794930365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
        b=TxW0Z/LWuMJ4ao/uG9mGPMndIv5WC3u70B6uIi8rUgqnmcROMdn9Sl0bVRAXmI59M4
         /AycfUqZ0pFWfuRkTZyWmAmLqaPNQXOX5W9WGgBiOlmkKsTPL6Sx1k0opbLsIDTni2XS
         CRCzdKwHbXTTEcJCNQ5liJoYpkajPt4r8MVPmNjLlZYQOPAEQggPHOCuZQDTNChULRor
         ahABAHl81KNf9V3L/ToxTodxcpB8GsRxYtHCwuYwsc7ex1IYkms0uwl7+Lwe9BoYdtc9
         NtM3Jj9BI3qZC1OcYx1l9fBWEsd7CSF0dm4d6iGz7gQehCPciPKJyH5cn18rcMALAOQT
         k2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325565; x=1794930365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
        b=uZSZZ6kxMYsY886VbdWOvifk2Gk2XVbSfSb3OYDBzrvrPBOdj7EAG69IM1akvhpMWL
         g41WoJrjCSI0Y7xMVYy3xqq1601uRiBv7dixikmoiTeJhlZBHlTw20PPMNq2/liIF3JM
         N06zhfcmkwEz35LskK+NPug/L1lNRJg4pjrsfkCUKdcj0m2HwRP0l1yUFcuGho/K48dT
         qY1kIcYKXwSZq9wipfa6ZGOnNvez+qEJTH9/OM6pz7xQtRqlzBeBDYCv2qQS7rhstaO+
         mP5S3uAqHjOLYQs0qaQZCinJLjz4cYrjISyp4OQowiE4Jx5v+cPV9QyLsdu3zhEbz+7b
         9sXg==
X-Forwarded-Encrypted: i=1; AL+hErFEljDgDnYhU0CHBdXJN5U5Q7dwqXHg+wzkhTzjbj7qZw2lJkI+guHpXENA/0uskcrqcG50pdE+TtZh@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zu4xnCR3ITd6z2sqSQTtInc/ZYfWHL4hGYE7LVa+1VWi5kH+w
	TGSwElTQQntthVwoU0Mvg7vyhQL2qQBri4ApkdTuBAJLZod9LHcHpraCsywzeacSCOs=
X-Gm-Gg: AYBFou1/fxEBQzX8WINlEAxOsrSvpw3WdoZALF7N8KiBEa2XMg6k7+ufmjG803LzcN+
	lvqS4VJwLOCTcFsfIV0gevM7Pm7qT20BF2/d4dZlsujpoJAK9wZMllMAh3KjLEgOH9GTvGeZWAV
	vKOoUbLSee5WtLJ1cl36wcgkxeHJzmBpUqJYaXPfOZ364cGj2PDEYYLKT5DDGPlVZXArW3iNxME
	mqmkgQUCTdvpk66TAsEOqPjdqQI6Scv3KQWniq+a5PcLy/n2jyjYZJO3tPjEWv6AmiAEmECKjL5
	wYNuTSm7Y81lY3HwJY3azLsYt1Ww/tCljN1+34cC+dG6ibq06vIsmguMO5ETKuqSNDL8xQLY6DM
	ai9s6h7pQfnt1iQGa8VAspeuOly5FDakVRMHTCKikDf/YjnOrr6AsKQdc2CR2cQMCsPdn9XVXPb
	S4gRQhqMXWhbweLJ5Edtc/l2dG5kLgM2h6MMpcdOcycROcUrHNlIcIZI1F2rUPBG043xIz7GytG
	AG5ccPogjT1pSy7XSXFUHP8LHqzwB4APJsVoY6xkG+sn/BAV9pdwwizHTOwDZRPS6k2Zssyafds
	6AF/U1WiXBimGSro3oM8fdgKyKsqBFrDpH6wA0erItT/ROBD1Yg9iA==
X-Received: by 2002:a17:90b:57cf:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b166ce8e72mr3333472a91.51.1794325564896;
        Tue, 10 Nov 2026 07:46:04 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a917:5683:7f92:9eda])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db2fcfesm325724a91.4.2026.11.10.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:46:04 -0800 (PST)
Date: Tue, 10 Nov 2026 09:46:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 04/11] remoteproc: report VIRTIO_F_VERSION_1 for
 non-rproc-specific vdevs
Message-ID: <avM8OYHxB4nAKCnb@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>

Hi,

I started reviewing this set, making it to this patch.  I will continue tomorrow
but due to the KVM forum later this week, I may not finish before next week.
That said, I applied the first 2 patches so no need to include them in the next
revision.

Thanks,
Mathieu

On Mon, Nov 02, 2026 at 12:26:41AM +0100, Francesco Valla wrote:
> There is currently no way to report the VIRTIO_F_VERSION_1 using the
> resource table alone, as the per-vdev feature array is limited to 32
> bits.
> 
> Considering that the VIRTIO 1.0 specification is now ~10 years old,
> always report the VIRTIO_F_VERSION_1 feature for virtio devices that
> are not specific for remoteproc usage. These latter, which as of today
> are rpmsg and rproc-serial, are excluded to avoid impacting the existing
> usecases, since VIRTIO_F_VERSION_1 changes the semantics of the
> communication (e.g., the configuration space is assumed to be
> little-endian rather than follow the device's endianness).
> 
> While at it, replace BUG_ON() with WARN_ON() and return an appropriate
> error in case of features that would overflow the 32 bits limit.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index c56d3330adfe..f1b362158a9c 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> +#include <linux/rsc_table.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> @@ -27,6 +28,11 @@
>  
>  #include "remoteproc_internal.h"
>  
> +static bool rproc_virtio_rsc_vdev_rproc_specific(struct fw_rsc_vdev *rsc)
> +{
> +	return (rsc->id == VIRTIO_ID_RPMSG || rsc->id == VIRTIO_ID_RPROC_SERIAL);
> +}
> +
>  static int copy_dma_range_map(struct device *to, struct device *from)
>  {
>  	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> @@ -268,8 +274,17 @@ static void rproc_virtio_synchronize_cbs(struct virtio_device *vdev)
>  static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  {
>  	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
> +	u64 features = (u64)rsc->dfeatures;
>  
> -	return rsc->dfeatures;
> +	/*
> +	 * All non-remoteproc-specific virtio devices are assumed to be
> +	 * compliant with virtio specifications 1.x; there is no other method
> +	 * to transmit this capability from the remote processor to the host.
> +	 */
> +	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> +		features |= (1ULL << VIRTIO_F_VERSION_1);
> +
> +	return features;
>  }
>  
>  static void rproc_transport_features(struct virtio_device *vdev)
> @@ -285,6 +300,7 @@ static void rproc_transport_features(struct virtio_device *vdev)
>  static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  {
>  	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
> +	u64 features;
>  
>  	/* Give virtio_ring a chance to accept features */
>  	vring_transport_features(vdev);
> @@ -292,8 +308,14 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	/* Give virtio_rproc a chance to accept features. */
>  	rproc_transport_features(vdev);
>  
> -	/* Make sure we don't have any features > 32 bits! */
> -	BUG_ON((u32)vdev->features != vdev->features);
> +	/* Make sure we don't have any features > 32 bits except the expected ones. */
> +	features = vdev->features;
> +
> +	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> +		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> +
> +	if (WARN_ON((u32)vdev->features != features))
> +		return -EINVAL;
>  
>  	/*
>  	 * Remember the finalized features of our vdev, and provide it
> 
> -- 
> 2.56.0
> 
