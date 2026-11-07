Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022424;
	b=mXcCDO000HlA5IskwHvUgLSDMO56EJztjW50eAlfwy9xqazHVZcIS40APeK3r7PtujA7
	 YwGX1qEblxy7hv4CLYk5XSXgp4q9hV0qcqDlkAdw0oMq6SGnQ9obPYZuj9p6RXC9+kuy1
	 up/eWC5zXQpsEXFU/O0M1zvoHS5okthRoh3+/Vh0gquN4nU2CrmFnFgazt4hhffqRcHyz
	 cKANca3AYsJsCgNu5MLWFtP0XMuZ5zaUmONLZPQuXdMiYFreDULYNGdesUXQRYOJscJ9q
	 90YDag6WNWclNXUlWNzZ3nSxPC38q8HOzmNdWqiYcsoeY3pAeCSGt58QOBueM2y07Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022424;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jpPaZgsbPsVNhGFeGiooWUiBnb+be2W/kYoOJLpsaYg=;
	b=GhSLqf+FWSxPhEI7iifgHX5u/0JVwF3Ir+BvmXD+9nI+oZhOVxxyrG8mkKETZPmFEkzM
	 CXqj0hbnPjK6k4vu4FhHBQWxwbYB8yBxL4j+fhKtuOqq+PoXGLkSe3J7U5Nvc98jygsov
	 yIJdAlMXO3WoOPaLz+C48buoDrVRQEcNVShTlkXWT7wOUoKg/ItKgQJTKiGRpC6h/AEjy
	 gYewKFXSuJjFHiODRNPSOTIlZFFEEipNyuPtnjIP++YLFNYY6LkJVT/y0JWKfsVUxTmlA
	 eeebXL+YwoiOIYXhcA4/l0sTghN5obb3nbseA5UcHVmMsGwXOUqb174AeMQvDkygUOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giIqJTue;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF3D606A326
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 03:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giIqJTue
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768F61F0089F;
	Sat,  7 Nov 2026 03:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794022423;
	bh=jpPaZgsbPsVNhGFeGiooWUiBnb+be2W/kYoOJLpsaYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=giIqJTueor8C0iYRgJfEJmK/ZkxogSKsnX0B921hjbZ6Kkfh0B/aihs9DX+vSpmdg
	 DuEBZCq1+0W2qlayUnDGYUgHmMF9rkabzbschrLOh4owlTq0C4y0Ya3WmFVKrq5GKA
	 jJqij/67LChZtkBr/nv87oyfV7KGOVPK0u5U1sNTAfNK5XvTEu0yK0uhP1jklKUqxU
	 IDaurhPvbo8Fq+h2UDLoRYX8KMHkWaxefhUdBWiKs4cSvmucQMQO8x9jPD9bTyUJDL
	 JN8gf/Gxjjg4BIyn7k3bTS4rbH3NlmKIBLhopPMW+7JyuuH87YPlnKpS4UAi55RQAU
	 ZIkQQiVX4Otiw==
Message-ID: <sashiko-outbox-202531@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: mark the ADSP fastrpc node as
 non-secure domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 03:33:43 +0000
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
- [Low] arm64: dts: qcom: sm8750: missing Fixes trailer for commit
  be9d54c35312
--

commit 3e2d2cedc67ebfc939a205a1181e0f73888ada0d
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

> arm64: dts: qcom: sm8750: mark the ADSP fastrpc node as non-secure domain
>
> On SM8750 the ADSP fastrpc instance used by the sensor core (and by the
> other non-secure ADSP users) is the one the firmware exposes as
> non-secure; the CDSP fastrpc node already carries
> "qcom,non-secure-domain", the ADSP one does not.  With the fastrpc driver
> keying the secure/non-secure split off that property, the ADSP only
> instantiates /dev/fastrpc-adsp-secure and userspace never gets
> /dev/fastrpc-adsp, so libssc/hexagonrpcd cannot attach to the sensor PD
> (qrtr service 400) and iio-sensor-proxy reports no sensors at all.
>
> Observed on the Lenovo Legion Tab Y700 Gen4 (TB322FC), which is SM8750
> based: without this property /dev/fastrpc-adsp never appears and
> iio-sensor-proxy exposes neither accelerometer, ambient light nor
> proximity; with it, qrtr shows the "Snapdragon Sensor Core service"
> (id 400) and all three sensor types report as available.  The change is
> one property on one node, matching what the CDSP node already does.
>
> Tested with `make CHECK_DTBS=3Dy qcom/sm8750-mtp.dtb` (no new warnings; t=
he
> single avoid_unnecessary_addr_size warning on dsi@ae96000 is present
> before and after).
>
> *** AI-assistance disclosure ***
> This patch and its commit message were prepared with the help of an LLM
> coding assistant.  The author reviewed the change line by line, ran the
> checks quoted above on his own hardware and takes full responsibility
> for the content.
>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

[Severity: Low]
Since this fixes the ADSP fastrpc node added in be9d54c35312 ("arm64: dts:
qcom: sm8750: add ADSP fastrpc-compute-cb nodes"), should this include:

  Fixes: be9d54c35312 ("arm64: dts: qcom: sm8750: add ADSP fastrpc-compute-=
cb nodes")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107032646.3236=
3-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
