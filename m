Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167122;
	b=MSRfoFT1Cfd59LpRppAtvunTNOzFWOqAHaxt0nvlIEijqJOxbZ5c8Bqu+84n4veLdMXc
	 piR+FHgK2r0E3Jclt2EvTGEJxVh98biG5k25p0iDdQGHP50/SwoapUQWItWzY6A92p2Hf
	 h2V/mLn1D7umV4CllNwgJpR97oL2K7kylhDNtAYTQ2s9KFRViKqHMdgXVDORLAZc4B+6Y
	 sBs0NIjE3Uh4ZPAFZeZ5pYha88N76IKVJnfcht8nr4+docN5uA8OsleA5bu8psDAVYpzf
	 jccoIuw2fwYflvf+KMDxAteBoEnlipqMet2u7+jzdZuUVOhYaoST0BofOk9pMkh2AcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167122;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FhkZGapdsTrthSHbqAP4z2TFf5otai8js7PBr71hQww=;
	b=hKzWpm8K3IkmXhlrK4wO2JOWwzJ1r3L44HNKC0BqBWic9lnVUyIMkfH+JmkeDK7R6K2W
	 oNU1hRxWzGZTDwEOeR42BOcibQUHpl9FMXEC2KuN8hbukwQU+8V6aZuqYX4gF0Q/yNPpX
	 YuRKSC99/facyFV+O6cA4RuTX96gOce138wmi+TIspk7dHMwzaWOVvho737Vir7HT+1WV
	 prkGEvLIlMvQ2Fi+osO91GEtl0w5Uy9xpx+U5C++sHij0HoxGgkmYhwxgJ9Ek+RGezZWz
	 iWxpb0emS/lzOK8aBJk385pr/mMXt8P+2Q1UttDq9mfjlGZo6vlaP0OWFfVUHkjGRxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2hfN+S8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76259606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2hfN+S8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D617D1F000C4;
	Fri, 20 Nov 2026 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167122;
	bh=FhkZGapdsTrthSHbqAP4z2TFf5otai8js7PBr71hQww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K2hfN+S8UqUnneE5Dr0xSJ4S0ml6Umb1kD9RPQwqC+NJd5hfgfhvy9+V/fHZ1v9uV
	 0UhZ7A3ewBUv1PEGg+mlVGAHOXCs2DhQA+YaT+pJRUjS9anZSlNwpeAnxKCTNhSVRp
	 COE7c+31n93XWBuYkCu8ofVD8Ro7pF75sBZ4bLGjHgX3w5VWzkBVV7R0FmSEfguGrm
	 nGWW3DtfNIzMV3W0sybcIceLJGVLNm9t2SYUztyiPrAxWBvdFGmqVlk7dMKy8Jk5Tq
	 PoT4EzNhszl2wtFrKB9u1cjtvX1HVLis1A0C3UK+kMyYiHwEJNwFIO5XfSIKX+d33X
	 f4nHJlWNYwHOw==
Message-ID: <sashiko-outbox-224851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] bus: Add Altera AXI Timeout Bridge driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-feature-timeout-ip-v3-2-affcc644af5e@bruker.com>
References: <20261120-feature-timeout-ip-v3-0-affcc644af5e@bruker.com>
 <20261120-feature-timeout-ip-v3-2-affcc644af5e@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:32:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] bus: altera-timeout-bridge: NULL deref in
  altera_timeout_bridge_probe()
--

commit 2329d1b64f843a3b75217e8d1da80bb7857bd24f
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

bus: Add Altera AXI Timeout Bridge driver

This commit adds a bus driver for the Altera AXI Timeout Bridge that
populates child peripherals behind the bridge, handles timeout interrupts,
and exposes timeout count and address attributes via sysfs.

> diff --git a/drivers/bus/altera-timeout-bridge.c b/drivers/bus/altera-tim=
eout-bridge.c
> new file mode 100644
> index 0000000000000..dd84096ec694d
> --- /dev/null
> +++ b/drivers/bus/altera-timeout-bridge.c
> @@ -0,0 +1,184 @@

[ ... ]

> +static int altera_timeout_bridge_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D devm_device_add_group(dev, &altera_timeout_bridge_sysfs_group);
> +	if (ret)
> +		return ret;
> +
> +	driver_data->irq_node =3D sysfs_get_dirent(dev->kobj.sd, "last_timeout_=
address");
> +	if (!driver_data->irq_node)
> +		return -ENOENT;

[Severity: Medium]
Can sysfs_get_dirent() trigger a NULL pointer dereference or cause probe to
fail when CONFIG_SYSFS is disabled?

ALTERA_TIMEOUT_BRIDGE does not depend on SYSFS.  When CONFIG_SYSFS=3Dn,
devm_device_add_group() is a no-op and dev->kobj.sd remains NULL.  If
CONFIG_KERNFS=3Dy (for example, via CONFIG_CGROUPS), sysfs_get_dirent() pas=
ses
parent =3D NULL into kernfs_find_and_get_ns() -> kernfs_root(), which
dereferences kn->__parent without a NULL check.  If CONFIG_KERNFS=3Dn,
sysfs_get_dirent() returns NULL and altera_timeout_bridge_probe() fails with
-ENOENT before requesting the IRQ or populating child devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-feature-ti=
meout-ip-v3-0-affcc644af5e@bruker.com?part=3D2
