Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955CA1A6820
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790652387; cv=none; b=FxInGc4s03bHAH+0YEo6xQWzmnA13BU0ItZ/BTv3+XgOkZ9QScXm75JHp+awfEgJXV6NxGeQWFAYZ7xi6+Rk8YocEvKAbb4vx/HLVhU0baBzGEzjVnZcSZh1d7CP1TykTLDMYuZU68QUhIk/6OzuDKHVvGUsnDqhHlL/ljb4zQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790652387; c=relaxed/simple;
	bh=TwxAS1RwuyrctrqOa+yxX0/egCV/OxwzSDKiziv4R6g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XLZomsb8RK/BgjmTokDeh3fXE0LT4AQsCGh8cGgdLgJDtyDH4d5lfPq3Mc4lsLf7WmAAfEiLfpkUmpeH6moCdOlURqdzGhD1LmUdkKEqizYZIsDWt7L4fhACeJDvZuRgExmmmIz5RTAXCQO6yJXscp3++Mky8g9pOYyJgPymkn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cF8cKZ7H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cF8cKZ7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CDB1F000FF;
	Tue, 29 Sep 2026 03:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790652386;
	bh=HLdXiIDNAONo2DrTxYRJbnbh3ToxHsvJRlfWAcWtojs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cF8cKZ7H2VUuUZ2oUZutWAJwY4fTqLnElp+rwlVgFWuPQIkaXA1BW/riUL9wggA+n
	 rquMmUw5PQZsJJgi3ez8dJqpqCc/W8VwLi4z+jO8QiHNn4cli8Zbmrvdn/V5Z32Qzr
	 EFAfSIyHM6q7YTyyWvGqV5WHIiFzSN0ocxRsxfu/o/ZqbpgJInAqs/aO+0sS6Hiifx
	 GcGY2dVZwxERk3i1igEinEiY1wReScuH6JYok/nr10UJlcpQEiqvGRErjw+bmMvnJ7
	 GL6FDfj4vgRJDnh15iLUQnWcLhteZx6VIg+lfGkRbVZUagIEKfN9SBFOyYPi1SUUXM
	 /sWeZmN0V+/HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 07/10] firmware: riscv: rpmi-tee: discover TEE
 services
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-7-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
 <20260928-riscv-rpmi-tee-abi-v1-7-04908b81d885@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 03:26:25 +0000
Message-Id: <20260929032625.B5CDB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] rpmi_tee: mixed goto-based error handling with scope-based cleanup
--

commit 6089779ce1ff0f765c5a7729a4fc32fd807d547b
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

firmware: riscv: rpmi-tee: discover TEE services

This commit adds the RPMI TEE service-group message layer to discover
endpoints and services. It introduces requests to probe features and system
info, and registers one RPMI TEE device for each discovered service.

> diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/=
riscv_rpmi_tee/driver.c
> --- a/drivers/firmware/riscv_rpmi_tee/driver.c
> +++ b/drivers/firmware/riscv_rpmi_tee/driver.c

[ ... ]

> +static int
> +rpmi_tee_register_devices(struct rpmi_tee_transport *priv,
> +			  const struct rpmi_tee_sysinfo_service_info *services,
> +			  size_t service_count)
> +{
> +	size_t i;
> +	int ret;
> +
> +	for (i =3D 0; i < service_count; i++) {
> +		const struct rpmi_tee_sysinfo_service_info *service =3D &services[i];
> +
> +		/* Discard duplicate devices in the same endpoint. */
> +		if (rpmi_tee_find_device(priv, &service->uuid,
> +					 service->endpoint_id))
> +			continue;
> +
> +		struct rpmi_tee_child *child __free(kfree) =3D
> +			kzalloc_obj(*child, GFP_KERNEL);
> +		if (!child) {
> +			ret =3D -ENOMEM;
> +			goto err_unregister;

[Severity: Low]
Does this code mix goto-based error handling with scope-based cleanup?

The kernel cleanup guidelines state that the usage of goto and cleanup
helpers like __free() should not be mixed in the same function to prevent
complex ownership semantics. Should rpmi_tee_register_devices() be updated
to either use only goto labels or exclusively scope-based cleanup for its
error paths?

> +		}
> +		child->rdev =3D rpmi_tee_device_register(&service->uuid,
> +						       service->endpoint_id,
> +						       &rpmi_tee_ops,
> +						       priv->dev);
> +		if (IS_ERR(child->rdev)) {
> +			ret =3D PTR_ERR(child->rdev);
> +			goto err_unregister;
> +		}
> +
> +		list_add_tail(&no_free_ptr(child)->node, &priv->devices);
> +	}
> +
> +	return 0;
> +
> +err_unregister:
> +	rpmi_tee_unregister_devices(priv);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-riscv-rpmi=
-tee-abi-v1-0-04908b81d885@oss.qualcomm.com?part=3D7
