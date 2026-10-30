Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333328;
	b=1QWujQQSoi+BiO7ScdQB1CZ+aw2azHzWiRWuvuLiwBhbxLiGgZnyN9Xc7e6oyrTgM+2I
	 9yCdPxByD6LIms/98u23MvQiBiVY0TImK3TbhpOeRblcemLMDtjFFXE0yhvkKRIyzPCSs
	 LfP75TzwcPhrXT5jji9ya/Oyp2spK6jpvphMXOPRmfQra5xGyXV1Hv9ShXZgm3Wvwanfg
	 5ZbT8ILBkBn4+ILcLzBwX9H6IBkNLPRkZeOZgKggNtbkVs/wxcaVA3bzphX7Lv1n4XXAu
	 uNh/c+mq4iFQ2DewYuAWroWwGgTRQhb5LNP6l6IZBzBHOp0kVsdZfQIqQCCAGVt4L9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2oyZPxVsUGR3lEqjPv6CqcgMqDvTEtbVpGv2X19Zzdk=;
	b=jnr5f4hMvOTreFBTv7wjrjeVyeHUMKRrkPW4uVNzQk/DaC13prk+NjMMK3J6fv7EsB9z
	 xwGI+1d5Jd+7ImKDrSUHX48QcNeNt5FwirPKQaWC8zY+rWrtQSyl4X6JN4xEvrGeUgTYx
	 KPKNo4rhAkTyGYE4G+HWiFnsVkmzIuqR4RjYoznFKWQX4ALTwUtTY09K8SmVqEvm1JmZn
	 +HHFQU231FUNBR5U6UIdjZT/s0XDfxTOv2fAPWQy++GB+mMfo4MW3bZSEH8PpLvyswMBF
	 4V0Wz+r1uzUfDOrweSxaJDY4rTolhV8vDiRJt+3p4gDjwN0wNozuiUunTr/jEIREgEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=guW+sKpx;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5052E606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5052E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=guW+sKpx
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35b2c599f43so721359eec.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793333326; x=1793938126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2oyZPxVsUGR3lEqjPv6CqcgMqDvTEtbVpGv2X19Zzdk=;
        b=guW+sKpxxfru+jvDWjH7g+qClU0xEqlqQcz5Pf3hUGUYWFWaVdN2oIl46Robhpbyvk
         /xnqjDS8NMAmztXaC7ZgmOHSYfgsJY0iGP/KLp7bVEfqPOrT+sXL+aTzANB5jmgzLlm3
         VqHHDIMBiO3whPYPQFc1PI8Gw+l7cmFKFew23G6tgwi6UIgjrPI44CCZvN+SljLZsLcy
         RYGMxM61G1/CN6XNkehX8GzNpcJpaacyiFc74bUWlYmj1+Jv7Em/9b3Kvg5TSp7KLo3f
         A/DE4ft81r6pLaWULoiLhA6+Ig2TUsvA5T2q1YVhuNm+3gA2aBOZMM96ZjHlbo36HpqW
         D2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333326; x=1793938126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oyZPxVsUGR3lEqjPv6CqcgMqDvTEtbVpGv2X19Zzdk=;
        b=HEiryFE2W8oyJfkNDztUw4q6GMmk5q04QiWJEc7ltGaKYm0/2UTu83zN+3TsQ/wyBf
         Guj6rZ9wXkeRwGir8rpQJUdge3yryGEzruOgldW4AclvdB7t1SVtweeIpX3N1FUZUmE/
         CA9TPrMezVuel4zfQ/Gq7J+uQhcU3V5T2kyqgGlVabZ/1Jfxj5cy2uniLLc7YmM0R9Rm
         on4E/5gWpbxb18J7+3lLS+uFeihRIkeKFV7pSCj4m81z7dDarvq3UDo5QaQthTeeC5Jo
         AkpUQWqhVghb/rD/GlqPter1TGSkNnZ/NOrhU1THEcid6CYp5Gv57HxTW+8C10ad7Ljn
         ZFhw==
X-Forwarded-Encrypted: i=1; AKwUvBz1dKgywpaO607xzQtoMHBKPaSsL7wMzN9dEpCiEpc6zUC41aJk4wCfoQC/c+VrHsorB5pqcMfWXlhF@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ+L1u48eUVipl24U56EsHTOkMuTYH3hPl7WLG9fGGRsaK1e54
	4t0ls+Z4jYpKFUcHgeqWLybJP5xeJROh1ljuj3a8c1OR5jI1r7MDdWPKJUkLYIatQZk=
X-Gm-Gg: AYBFou1CtDLTdhSh0iz5A50OdFL2UbZPR6qfp4QufTm6EjBGQjtfGKK/bn5NPfFenla
	0OsQibQ7Tm9rB8S6UiqQWl8UEcE5MVr8G2nNkO0VntAPf10hHCMWk5+uTWRwqAeff6QVw24/kl3
	tp0wCy6ojK+hbrmeYotAl6Ot/KkTCsiVnKlOrrkAM50yEBMAYgUtEatKKEi+rjAysZhNsXg2Vqy
	/+8Ff5nF4kaV9Hb5p/1SBtunQExRION+klRbjvOLG3JGaTEvas4A7cZjt+JKAyDe/+zgeQPIAbW
	7zkxFmQwqy/laIfSsgdF3QtCKEf/UfLya/6TQdi+ziCV2Hv+6UjNdnLy5o2ktp/CVa71keln7Ce
	KHL0wR8FKPuJQ6caveNYsIdL7wjsoJBkR6Fu2ABWCCKHcYBeUvMPFdFlWsIzhu6D39NhRNNQ6NH
	unA/2lOT1VGp2b+c3IFkWXmCaGsVP3WVholyaQHWpl+vulkZA/bUIyF+hzsXwq/wgDrnVWu7Zzf
	wWkwQ0ZvdoQ13p5vfuAY/umqhEx9lScbHKK/eblSef1HWotkngS2sCAfn1gd8vz7Yp8Gzmowcjt
	vIL1rOm6zhBhEQARDq9+iKjk12j+bGwUP4vgQuhHuQy8v0oio4Y8
X-Received: by 2002:a05:7300:a9f:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-36a4235f45emr1732875eec.13.1793333326139;
        Thu, 29 Oct 2026 21:08:46 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm3272988eec.8.2026.10.29.21.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:08:45 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:38:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haixu Cui <quic_haixcui@quicinc.com>,
	Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Add devicetree bindings and maintainer for
 spi-virtio
Message-ID: <auQYSv2ad5WJSHdI@vireshk-B250M-D3H>
References: <20261029-spi-virtio-bindings-v3-0-ef30217abefd@valla.it>
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
In-Reply-To: <20261029-spi-virtio-bindings-v3-0-ef30217abefd@valla.it>

On 29-10-26, 17:27, Francesco Valla wrote:
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
> parts still not upstreamed - see [2]).
> 
> On top of that, I added myself as maintainer for the spi-virtio driver,
> since the former maintainer's e-mail bounces back and its owner (Haixu
> Cui) did not update it after changing employment.
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
> Changes in v3:
> - Add Francesco as Maintainer of the spi-virtio driver (instead of
>   Reviewer) as replacement for the former maintainer (Haixu Cui).
> - Link to v2: https://patch.msgid.link/20261027-spi-virtio-bindings-v2-0-67927b24b9d4@valla.it

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
