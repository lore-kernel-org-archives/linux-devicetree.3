Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718381;
	b=uv5LWvwXzGtifq4YQzdlTBYa3jN26QR4kJdxoppyuSCygUWzZqgbyKF31W8ekbGABW06
	 fK1/NyGFwSruvBu2NPETz9G6yWChk5NJtp2ork8V7uMydEEeE0wYq4KRy2blhJxPv2E7F
	 /g9yI5ckGNzX0yNYl2SFjhLBsfapYEvp/Qw4bMxCujbJv6QLt6PRHTx0KwKoSSXVEtMoI
	 bfoAT0IGZBJWGSgoknI4u3Hzq74QeMbnCb+nJl1O9ZHSySFh8hJWosIP1RuAT4mEaareG
	 RGKdxhhE7+zfRy6BXn1XE+UyeMvp+8ORF7wavVXMir52RDFurkqntIzyT+TyiECz1Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718381;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=visGn26ek4yRauBb5JMq2ST3W+wbUey3vx4XdEFeVdo=;
	b=cTNpEIL4UhP7eVxlGLJpHk8s5Q+0djNaZJk/bMlglsLGa3hmzUoGZ+tL1gbqzu6bibIw
	 CpmcW4hvYvmPliMs9DAOW3wXNfG9BxKNmaO5H2HDZho0knHhPhVlWyxEgeO+sFUgP6C7L
	 MOvB/+20Zd5X0e6GaAGNcTHh4z9ron2Q9N7gq+qV8A6jzB8Pm8ebC59sC2CnfK8QJhZoW
	 YSBpRXxuJDSuvf2Hge/fQY+jod9cg5A3coOsiYhALTIKStD+RiK48GwQRicnw/ilxdUUC
	 tah6D1uoPWCu+dSVgCP0VCwsiOtErdVyA5igyfYF0e9/RTH3m7tHnu2797dRDNe5huA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3Jwr9l7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D66606F625
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3Jwr9l7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B375F1F00A1A;
	Tue,  3 Nov 2026 15:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718381;
	bh=visGn26ek4yRauBb5JMq2ST3W+wbUey3vx4XdEFeVdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R3Jwr9l7P5KfEUSwCoRENsKxOW2F8RKJNJRKPjvVwH2/X9NS4T5l+7VyS8vPZmYSU
	 +tlSL5BUz4Tka7T0oVf6IK+ur6ZZUHSLVDPPDHS/4DbnkSFUrTv9UXXCab7ixUamxQ
	 OXGlBYxXOe6/m34ql5oFl31q5YdrXEtrjbWL4xTnmPdC6qFDKdWFGK1rIC8WOaUd4B
	 /xQr3z2aiJ1LY4xEa7jt4mgnmt5NfsX/i7+7P6hkr+8W85WF8fsJ3BvbDxwlQAC1wb
	 Rb/pLxfh5joSyQ+0inp5Inrb7JgVLvDSS64s61HbZIPP49mx535KkIdnJgFJdTkjLL
	 9ixCySx6Xiwjg==
Message-ID: <sashiko-outbox-195553@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/10] iio: backend: add
 devm_iio_backend_get_optional()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-ad9910-backend-support-v3-2-0e9224ddf7b7@analog.com>
References: <20261103-ad9910-backend-support-v3-0-0e9224ddf7b7@analog.com>
 <20261103-ad9910-backend-support-v3-2-0e9224ddf7b7@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:06:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: backend: wrong fwnode used in __devm_iio_backend_fwnode_get=
()
--

commit ed5c232ab5f93ed7cb07750eadfee12a6f8577f8
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: backend: add devm_iio_backend_get_optional()

This commit introduces devm_iio_backend_get_optional() to return NULL when
an IIO backend is not described in firmware. It also updates
__devm_iio_backend_fwnode_get() and __devm_iio_backend_fwnode_get_by_index()
so that missing io-backends or io-backend-names entries consistently return
-ENOENT without logging an error.

> diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industriali=
o-backend.c
> index fbf5c39d76551..d12d163f45cad 100644
> --- a/drivers/iio/industrialio-backend.c
> +++ b/drivers/iio/industrialio-backend.c

[ ... ]

> @@ -1034,7 +1037,17 @@ static struct iio_backend *__devm_iio_backend_fwno=
de_get(struct device *dev, con
>  	int ret;
> =20
>  	if (name) {
> +		if (!device_property_present(dev, "io-backend-names"))
> +			return ERR_PTR(-ENOENT);
> +
>  		ret =3D device_property_match_string(dev, "io-backend-names", name);

[Severity: Medium]
Should this check fwnode_property_present(fwnode, "io-backend-names")
(and fwnode_property_match_string(fwnode, "io-backend-names", name))
instead of querying dev?

__devm_iio_backend_fwnode_get() is also called by
devm_iio_backend_fwnode_get(), where a caller passes an explicit consumer
fwnode distinct from dev_fwnode(dev) (such as a child channel node):

devm_iio_backend_fwnode_get(dev, name, fwnode)
  __devm_iio_backend_fwnode_get(dev, name, fwnode)
    __devm_iio_backend_fwnode_get_by_index(dev, fwnode, index)
      fwnode_find_reference(fwnode, "io-backends", index)

When name is non-NULL and fwnode !=3D dev_fwnode(dev), checking
device_property_present(dev, "io-backend-names") looks for the property on
dev rather than on fwnode, causing the lookup to fail with -ENOENT when
io-backend-names lives on the child fwnode or resolving the index from the
wrong node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-ad9910-bac=
kend-support-v3-0-0e9224ddf7b7@analog.com?part=3D2
