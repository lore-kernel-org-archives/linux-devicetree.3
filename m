Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098260;
	b=RyAztmzuOfm/kXIIDQZguXynSiO7VBmwRLlJX7WRD2BRBR2XzeWAOQluKfojBzVbjwWy
	 4vdpDKY5ih6wmCgDL/b9wYu0SV+salTqu+rNLwUPZsJ0yZCj/quHA+KLlZX+2DatWAqJA
	 eeVspBm9zoxWBGvtr7z230u67Ah615cGgMQTY9uRX9qlSQRedvplIlGaAEvLGJFMQ8uMM
	 uhMvsnH+cdLj/YhZvaRup15Lav0MMrStqkEFhNFA2CFt2kvPLyPU323xae+VLrQ/2dcXI
	 xer4pHUlbvw+HuuGEi3l6rIWeONo8Btsrbiu4lC81iv5EtVS+oh1V29wW/7hf/VMmyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098260;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AwIRDSVIZlaoTPRqqTyp6BwANPNi3GUs2aLH5r38dzI=;
	b=ZbD1koDQYlDvk5VblpV+jlvvUJ1uZN5/JbY5YKhoqbw45DZ1qj2BGj8GVu/0K6zpIffT
	 669fVcVYH/2dXLrf/Y+30qwQf0EI/3xTNQ2+mc6NiLX4Dz6Q78KQ0nhgzCggB9DqF5Kfr
	 oktdECDqb++UdFAQjk4JqZBcqB9cnPuwdio1AErpuce9B+J+bLfzcJToD1A7/pk9RreLa
	 GdxvUBcNO9QZQKcWnfjYIQe+yhTWxHL7UpSNLHarLS1lTl1wGqk2vKI2jqqfygDn0xcbm
	 mXgMo+MU70arJdW4rSt19Jpj7/u2Wv3MJ+xIlWFp8icSN+q1ga1sTlCmRmdV4GB1aaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M1x1oHvK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KMCg6sd2;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6087606C26F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6087606C26F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M1x1oHvK;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KMCg6sd2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793098258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AwIRDSVIZlaoTPRqqTyp6BwANPNi3GUs2aLH5r38dzI=;
	b=M1x1oHvKdnIBq4GixcEKqPW5wmqA56zOuot9Vo2rL1/70Zw2XR6Wspg0SKXsmPXLQ3DKIt
	TdGEDVhJF44YAD0FFygcP/UJwLt2xhCkJHTQK6ZX5g+OridUn4hCMZGKXhz6qnkm8wu16V
	t3JvkVa3wwfCZJEGJ7FBOgL2oTgJotM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-HDuLkC-vPiWZNPho5g8WaA-1; Tue, 27 Oct 2026 06:50:57 -0400
X-MC-Unique: HDuLkC-vPiWZNPho5g8WaA-1
X-Mimecast-MFC-AGG-ID: HDuLkC-vPiWZNPho5g8WaA_1793098256
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so39340575e9.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793098256; x=1793703056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AwIRDSVIZlaoTPRqqTyp6BwANPNi3GUs2aLH5r38dzI=;
        b=KMCg6sd2uzfr06Cf8EuzBU1QcQUFyPlvIcgI/ErwXC64VTS6z9rkR6S4PUYCAru+C9
         HdLiYh8kRatzLDeyZZ2coe/SN3qvkHBdRN3bUueHXy4Do8aKeTCVHlQ54CJSjFoTSmK3
         QCLqGpDiuTGE8vc7CpK+qeW+sG8vBECGqAyWs7DG4u+RtQoBjwQANpCAmwu6NARfgd6i
         60fwOHGrnz9LOJPgazOFwGl64rZi3l12JxprNhZqRmNJ50CoN60gGmv8hXENz8OCOX1B
         cUza4xPV/rXSvNnfTIiFl6kTQmNQLDRo4Qo8FAJoHb+LMTklJyqH8tAsXrF+Co5lIazV
         sH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098256; x=1793703056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwIRDSVIZlaoTPRqqTyp6BwANPNi3GUs2aLH5r38dzI=;
        b=WUANbSz2/KBZU+ZzXH5QTbKptOMmRkZKWPwuCdfcQFsfDxZ697frQdWR5VkEnzrO7c
         SaWmv3waHt7pk9h2DcRtqn2hRxz1k6HXTyug0LBjq9PxJwSJBaW+OIeG2zEeFRGY38aX
         b+gYRwli3lRvVL/T3NePjYWiDZPSVyvh5QeON3wj2ocrY3KaqBWlaDkJ1h6ok1YD88ZY
         qQz1nYKZOD4C/a4O2W9l33TIwIGBRfV66u9wHcfcVsnyoHff1VV+tKE1llimSQXFeTYn
         sllWyQnKp4iDwkpaoY16W74RX4EDZhtEXNbt+O65cX/pEvpta/1omTpI+Rln4iBLggwI
         4tCQ==
X-Forwarded-Encrypted: i=1; AKwUvByw2lexHFnhyIr4i04NZ23vzbVLPXmQ0TKJWI6ZBQSXeyZkTXnV3LG3wgkfcm+QNAFUM2AG/6DREPVq@vger.kernel.org
X-Gm-Message-State: AFq9FYJJThwjgzBuL2/v0yZkPAzTqTwZWCV3i66MRLvwz+S5EpnjcHvm
	rD3+tQGHy0dpjgmyRoLDVSXb+fEeuVvfgiq2sAlV+/giSVabtjHniL/CJNSPEH+fU/285jArj18
	klWi6tBIXBEaOtMqcLyQOgjVg1YdUqrIYtOUzNLB9ljZEXj0dFRtmleaHMem0TYE=
X-Gm-Gg: AYBFou3rsXn2XDni2qkBlFFWThHciZxD1WDJJXhxYJUR0c9KQ0zprXBA3Jvko3mgJ61
	i9Z8bPhKHqsk59VCcx569r62kIHzr7w0urvUTvCv1sPJp+eQWap+yL9nQYHask592rVp9RJBdP+
	aTj+e16E7m8TJijMCnkPmRsIjiA7aMwMWvq+/YNTabB3MLihGXOYK7DiRh2DYujgE+2alK8jCU4
	UBCIYFCpQ3NNad4e+2bUBBfqyVAhI01o4csosToBIlbRN/kG8C32jrhUM7IDUsk51u9dQn1yUJB
	vxUwHCYzvPFSZfRo46iZ8kZtRhYpQWcv6SsXU6v1JfL4kynjV6S8dKAz2EdJoaR7Lx4=
X-Received: by 2002:a05:600c:4e0e:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a35ac9d227mr178192105e9.8.1793098255886;
        Tue, 27 Oct 2026 03:50:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0e:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a35ac9d227mr178191625e9.8.1793098255318;
        Tue, 27 Oct 2026 03:50:55 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm171269355e9.3.2026.10.27.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 06:50:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Francesco Valla <francesco@valla.it>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haixu Cui <quic_haixcui@quicinc.com>,
	Jason Wang <jasowangio@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 0/2] Add devicetree bindings for spi-virtio
Message-ID: <20261027065001-mutt-send-email-mst@kernel.org>
References: <20261027-spi-virtio-bindings-v2-0-67927b24b9d4@valla.it>
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
In-Reply-To: <20261027-spi-virtio-bindings-v2-0-67927b24b9d4@valla.it>

On Tue, Oct 27, 2026 at 08:26:32AM +0100, Francesco Valla wrote:
> When a virtio transport exposes a non-discoverable bus, the devicetree
> can be used to declare its child devices (if any) and/or other
> properties. To allow for that, the virtio framework searches for a node
> with a suitable compatible in virtio_device_of_init() when registering
> a device [1]; such compatible takes the form "virtio,deviceXX", where
> XX is the hexadecimal representation of the virtio device ID as defined
> by the virtio specification.
> 
> This patchset thus does not introduce a new functionality, but allows
> proper validation of nodes tied to spi-virtio devices, aligning SPI to
> what is already being done for e.g. I2C and GPIO virtio devices.
> It was sent initially as part of a different patchset [2], but since it
> complements a functionality that is de-facto already there and is useful
> beyond that specific use case it was sent separately (also following the
> maintainer's feedback there to separate it from remoteproc-specific
> changes).
> 
> This was tested both with virtio-mmio using qemu-system-aarch64 and with
> remoteproc-virtio with a Zephyr backend (with relevant remoteproc-virtio
> parts still not not upstreamed - see [2]).
> 
> I added myself as reviewer for the spi-virtio driver to be CC'd on any
> patch involving the new bindings.
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> [1] https://elixir.bootlin.com/linux/v7.2.8/source/drivers/virtio/virtio.c#L488
> [2] https://lore.kernel.org/linux-remoteproc/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it/
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---

I hope this can be merged through the devicetree maintainers,
I have no idea.
MAINTAINERS changes needs an ack from existing maintainers, of
course.

> Changes in v2:
> - Expanded the commit message to better explain the functionality and
>   the chosen compatible.
> - Redundant pieces dropped from bindings.
> - Link to v1: https://patch.msgid.link/20260929-spi-virtio-bindings-v1-0-6a0eef3213b3@valla.it
> 
> To: Haixu Cui <quic_haixcui@quicinc.com>
> To: Francesco Valla <francesco@valla.it>
> To: Mark Brown <broonie@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: virtualization@lists.linux.dev
> Cc: linux-spi@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Francesco Valla (2):
>       dt-bindings: spi: add spi-virtio
>       MAINTAINERS: add Francesco as spi-virtio reviewer
> 
>  .../devicetree/bindings/spi/spi-virtio.yaml        | 46 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  2 files changed, 48 insertions(+)
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20260927-spi-virtio-bindings-f4e350b2709a
> 
> Best regards,
> --  
> Francesco Valla <francesco@valla.it>

