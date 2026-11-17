Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936688;
	b=zZC0A59dn4B2pt/3DGxq3IgkfFNHRUWpvoFK2IPK66xzEw0KS4jWik1UCyDVehyA/fXq
	 m7xjd0g/F4lqeCFi8gIUZb7unDGhU7ENocKKXD6C6T/nN9MJw5JDhlk1C8nDyN1i5HFdh
	 gKa/tF8AeyBHDWNx4VWfDBklDObTgsTBM7HHDs5/nwRfReXkMfiJ5+Qck9Ouh6uf3XYqT
	 +W1lzK8ZS0wDPRZx+IsMC9b6hODwsqaZR3QATcv9GRaUeuAvniNt0zP0rnw5SA6qc80cJ
	 P/PvRSt7PvN4m3zvP0kxpT5bSW6w5EXtUllLYMKr+OR4lDTPxp9ykE7AsQkJzbtASGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
	b=zzg62QhHQHB5i2nXMm/lhRkrkyMX16Uxmsc+XC97UZkx/haeN3ZphXKoxdsy/GFndBR6
	 VcruW7U8kIJOxq9swpp44mab9glYsGs05eeEFKIiLw8rjZHaN563RlAITI6SNqjbWYxzp
	 Gbc4r1BoYrjdzUdMyKspXKSTi/T70fTyQyIj8Km2b0LqQDNjdeS9lkSBaxa7GXaISkoCV
	 JeUV5VQh+GhObQUx+P6ACSEnuq6N4Gw+3Wbv0hwSAZmItG7lL4LoU7GAzU6X11m2srIB9
	 UG/1uXUV9PSkYxfdZM7JFUJgLwC2bW/4MMXk6Z/gk7sQCEmxv1Q8+BJGh1nPlNxOnXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e5Zp8ZAy;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53F3606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53F3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e5Zp8ZAy
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso82877a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794936687; x=1795541487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
        b=e5Zp8ZAytFfxgwA1egXYSHtX5reKgsfJ9Yi8rapzShoui1aILV3DByS1TjDMzLv4QD
         lT7xAdJd6OhO49AB3wpGJtkRzAPmLynrM3S4a8HP4r9BLCLH57FaKmub6533kkM2+vmC
         pip7BlKK6g+frBZnTZqQQa+C+9epFUILmgZNm/jyrumxPDWTO/qYUOa/u/AJX3haQPA9
         paLLOHVRuff7J5v5d34M8QcyelhR9WuHvUr4blvROXbt1pavYmgWo9VVxHVJ5qJGpDiC
         7I7qMLYH0yPJtZD80GBIJ18hbthI/+QCFL7Lf9cJWiVFnhWPUCb7Udaan5GrzXrInloi
         Y24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936687; x=1795541487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
        b=vMtkKb4aQBn6/TFoAViB3ADR5l8/efGRytCEEV/e/Jsujg8LQ0UIvbABUUeoYfrbbj
         tZBURPNC66Dp88dFeU6Dn23gxc1Ff5QLMnSdH1v0BUE72z69r7mZ8oe6pzPneLHFyTuI
         uOHfifoIVfvi6Dyq5j6hsiV4ibCDZ0Rvt5GTFi5n8Ojy9f4Sfe+Hs30rE+sUs08kVNtW
         yDAeziZ48AL2Y4IYC831Pea+Rqamb+ENoD4fCaL348iy1l1jCfVSPJODi2bw9wK3KQNB
         bIoKSSmESfFDZRdHFXjM6UN5yUPCoYzTa0hA/RTYE1cHwhxJn32VPRcZ4fTlejkANsTb
         DOyw==
X-Forwarded-Encrypted: i=1; AL+hErFuo2qNEiSkDnKU+JXZNh1YuZiRpU8kKktvi0eg9wMtJKceRM4hSVmyT9oO+4iN0sI8Ez/5BifKidMj@vger.kernel.org
X-Gm-Message-State: APuU4Z9oZJWHXPbSIAaFk/mdLy95rlmeCuWh+9FVwZ/3qvQGGk7Q/rOh
	yyi8PKsip+52gH72AX0P5lihXc+TxHWlN3blhjl2bL68lgjZraJSEoPL6VigIF4EhjQ=
X-Gm-Gg: AZFdTZce5dzCqBLlUyoI6iC9KZ2pk4u+Mrwiy4CRCq+dtvFc7PPEaEQ02y6SqVuOzwC
	tK8GF+TlkOvNebZwuSgElUkdVpL7WmghKzSjkNjFuSPj3yQlaB/kR/dG6kRfCYN7FlHUg6EUHp8
	SXGLqiGwtpUvEQ/6eFlo0WWcRwHpNPGyarzoc02XADAmfk7BKCRkTGHkQAU9Cdnqo5aOaA1VNwC
	736EdhjAxvjlyknt5TZePSrGSD/+JLAY6fdsPh4HIY9kTnjXYa0pOUgC6PEIiEvb7b86/8uhim3
	yMZKmja15Q9imu9fR2OfMQSVw8tDT8ASntwznfwOQ0spJSZJ39zQnXzmDH4Gwf5uHlAhspxqghG
	haUiwEyK7nPUNUkAmDlo0wehSYNPj2TTiqTNef7yWd1QIgNlRFr6uQov5i1PDmzr40upBsb28Wd
	JFqYPl2Qun8rSU/wjGxQXYoUexXEpIyP3wyr8uYMFAfJ+P/9C/TpY+sFPiE0xAQEV+AO5uX4K9W
	JU/vH+VhZwhFKKHsg3qoIEemaapWUPTzIHn7bs2w8Q/I77Hqhm7MTb+eOSJCHbNeFxTJYse3dIy
	ztEZR/oDHwR4Q0IcJ5USB7aUaKHkS+T6J+WJP42ZRWMbQfyuCuu0ow==
X-Received: by 2002:a17:90b:3892:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b3d07becb8mr123850a91.29.1794936686801;
        Tue, 17 Nov 2026 09:31:26 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:61f7:13ac:b599:b52c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abeaf532sm4936578a91.14.2026.11.17.09.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:26 -0800 (PST)
Date: Tue, 17 Nov 2026 11:31:23 -0600
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
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
Message-ID: <avyPa5rSx9rhf9yO@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:45AM +0100, Francesco Valla wrote:
> Expand the section on virtio support over remoteproc with details on
> memory allocation setup and constraints.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  Documentation/staging/remoteproc.rst | 99 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index c117b060e76c..4b42ed582fb4 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -354,7 +354,104 @@ it supports. A firmware may support any number of virtio devices, and
>  of any type (a single remote processor can also easily support several
>  rpmsg virtio devices this way, if desired).
>  
> +Memory carveouts
> +----------------
> +
> +For a virtio device at position ``X`` among the RSC_VDEV resources declared by
> +the resource table, the remoteproc framework will search for memory carveouts
> +for:
> +
> +* all the vrings the specific virtio device requires (as ``vdevXvringY``);
> +* the memory area to allocate communication buffers from (as ``vdevXbuffer``).
> +
> +The carveouts can be provided by the remote processor itself as RSC_CARVEOUT
> +resources inside the resource table and/or supplied by the remoteproc driver
> +and will be indexed by their name.

The remoteproce driver doesn't supply carvouts, it gets them from the device
tree.

> +If a carveout with the same name is provided through both means, the one
> +supplied by the remote processor should be marked as dynamically allocable,
> +i.e., with the device address set to ``FW_RSC_ADDR_ANY`` (-1).
> +

Right, as per my comment in the previous patch, carveouts at the virtio level
should be distinct from those declared at the remote processor level.  Hopefully
this will keep the remoteproc core simple and make it easy to differentiate
between code paths that handle legacy and authentic rproc-virtio devices.

> +If a ``vdevXvringY`` carveout is not provided, the remoteproc framework will
> +try to allocate it using dma_alloc_coherent(), which will resort to allocate it
> +either from the first ``restricted-dma-pool`` region associated to the virtio
> +device's parent (i.e., the remote processor device), if present, or the global
> +DMA pool.
> +
> +.. WARNING::
> +
> +    This fallback mechanism can result in a vring being allocated using a
> +    ``vdevXbuffer`` area meant for another vdev, so a particular care shall be
> +    adopted when defining the carveouts. In particular, ``restricted-dma-pool``
> +    memory regions should be specified inside the virtio device's devicetree
> +    nodes and not attached to the parent remote processor.
> +
> +If a ``vdevXbuffer`` carveout is not provided, the remoteproc framework will
> +use the memory region declared by the virtio device's own devicetree node (see
> +Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml), if any.
> +Otherwise, it will try to replace it with the first memory region (of any type)
> +associated to the virtio device's parent (i.e., the remote processor device);
> +if no such memory region is present, it will be replaced with the global DMA
> +pool.
> +
> +If both a ``vdevXbuffer`` carveout and a memory region inside the virtio
> +device's devicetree node are present, the carveout takes precedence and the
> +memory region is ignored.
> +
> +Declaring the memory region inside the virtio device's devicetree node is the
> +preferred method for ``restricted-dma-pool`` regions, since listing them among
> +the memory regions of the remote processor device would make the first of them
> +the (forced) bounce buffer for the remote processor device itself as well.
> +
> +Buffer allocation
> +-----------------
> +
> +There are different kinds of buffer allocation scenarios:
> +
> +* if the remote processor can access the whole DMA memory area of the host, no
> +  special arrangement needs to be performed, since either the drivers (in case
> +  of rpmsg and rproc-serial devices) or the DMA APIs (in case of any other
> +  virtio device type) will take care of any necessary translation;
> +* if the remote processor has limited access to the host memory space, for
> +  example because of a different addressing scheme or for memory isolation
> +  constraints, the memory reserved for buffer allocation shall be selected
> +  depending on the virtio device type:
> +
> +  - for rpmsg and rproc-serial devices, a simple contiguous memory region
> +    (e.g.: one declared in devicetree as ``shared-dma-pool``) is sufficient and
> +    should be preferred, since it allows zero-copy message transmission between
> +    the host and the remote processor;
> +  - for any other virtio device type, a swiotlb-enabled memory region (e.g.:
> +    one declared in devicetree as ``restricted-dma-pool``) is required, because
> +    such devices need bounce buffering to work correctly.
> +
> +For virtio devices other than rpmsg and rproc-serial, the remoteproc framework
> +offers the ``VIRTIO_F_ACCESS_PLATFORM`` feature, so the buffer addresses written
> +in the vring descriptors are the DMA addresses returned by the DMA APIs for the
> +virtio device. The virtio device inherits the DMA mask and the DMA range map
> +(i.e., the translation described by the ``dma-ranges`` devicetree property) of
> +the remote processor device, and is never attached to an IOMMU: these DMA
> +addresses are therefore host physical addresses, translated only through the
> +DMA range map. The remote processor must be able to access the buffers at
> +these addresses.
> +
> +.. WARNING::
> +
> +    For remote processors that access memory through an IOMMU managed by the
> +    remoteproc framework (i.e., with ``has_iommu`` set), the IOMMU domain only
> +    contains the mappings created for the RSC_CARVEOUT and RSC_DEVMEM entries
> +    of the resource table, at the device addresses they specify; no mapping is
> +    created for the buffers of the virtio devices. Such remote processors are
> +    supported only if all the memory that can hold virtio buffers (e.g., the
> +    ``restricted-dma-pool`` region associated to the virtio device) is mapped
> +    with its device address equal to its physical address, for example through
> +    an RSC_DEVMEM entry. The same constraint applies to any fixed address
> +    translation applied by the remote processor that is not described by the
> +    DMA range map of the remote processor device.
> +
> +Allocation of virtio devices
> +----------------------------
> +
>  Of course, RSC_VDEV resource entries are only good enough for static
>  allocation of virtio devices. Dynamic allocations will also be made possible
>  using the rpmsg bus (similar to how we already do dynamic allocations of
> -rpmsg channels; read more about it in rpmsg.txt).
> +rpmsg channels; read more about it in Documentation/staging/rpmsg.rst).
> 
> -- 
> 2.56.0
> 
