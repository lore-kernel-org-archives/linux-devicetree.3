Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792871077;
	b=ywOGzqgANeFn5850jtO22Xr+tkGqPc3Qn4/PNqKt9dfwxxGIxd2YWrnakhn3LGfSxS6i
	 jhRk9LrmxH6urIBb02bnh8dKSSQdFlMNV73QWh4LRzxTYWKhnZmUnivaYpcCBoRvMzpNG
	 U+JIuS1SxPMyw26acRZ12tMbVT5sMxTo6+gOYaSdvd41SkQQRviPmnCfkeMOxKkfhamEL
	 uOo84UfnHaoiOKriD1DH19jtw3cOLEztCcW+xEnOxb3ZZ88kUHLkjWK14h1xfvOZgBJBf
	 sz4xQ4iC6GHIXaKPJEJQMCQmVmq0UOWxdMsGi8XdlVekTwmvzxzaKYCe0DYLjCHw/PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792871077;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=mh4dVDe9piAOp7KaDFYQNRZ05jy6LwP9crYy0+FRaUo=;
	b=4+8G2QiRCUl6ZD18kP5EjT3Dl5++pen9Zg3TepqEWXtbjB3jA0kVI7VN3CAkGBDTiLCl
	 HRa0rTg+AebUrEVcORFXcoUIU+bpVgTaIn4AbFyHt6cg0azdRq3BYc4/7w78bJlN+7YzU
	 6OSBe5hT48whkZ/QuVxx/TZqJk9x5bz29hSc5D19BctYpAyxLlOWRZ5DHhS15norw7gAA
	 OpDVzbj3D3hrz0UJSrRMzT9Ph1qWXmNz+TieS95WuwP1CY40wUPF3AjR27Jm9WB7eZy2X
	 JsAz1Vhyn1Q7c+1n9P6YX++gEwqDQ9t5HcMrOMkH3rwwVrEudIFnNfRgdAUB0h35j7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m42Rz/iE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCF1606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 19:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m42Rz/iE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CF01F01825
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792871077;
	bh=mh4dVDe9piAOp7KaDFYQNRZ05jy6LwP9crYy0+FRaUo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m42Rz/iEUsog1pWTb7GnHmqNTKFBf+Wm7YXxkyivgn+m+VPCvhbo9JDUiqNCSXokK
	 GBfne6GgL7xWVLhrDa1sJkVIVZj5XYCyTDf2KLpEoh9SrB34eyWdG3vVGM02WISBJs
	 BiLs43MlMyo89M63kdQM0nScVyb1OcklvGimoeYJAVx2907CCyAXqNwsQuTYC3cMTS
	 6vIVMvugZkpa7rVBusdp2bkfcqvvYl/SxStTcU1WSoaI+OkseZrQYCjyNmjx6kyx8b
	 syekTIFaMm6hKtw/l/AJOeL4ZHZJ+r4zsvU/T9I773BbBI2fkIsjDntSPTimm0Oa7J
	 Mx+dn5CgX1PKw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1466560e87.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 12:44:37 -0700 (PDT)
X-Gm-Message-State: AFq9FYLGrfbkQPaWgHdZspYgJrvtpkdzTompIYeCX0XbTCIyr88a1L52
	PXOQevEUzf1rRiznW4ssaZUtFMhTtEbxaR+Tqb+nGl3I3C8iiUcagDV50joNxIfQOHhGHOkMj6o
	WCRYy03NIUCF2JTjBnF96uO9aeCVpk1s=
X-Received: by 2002:a05:6512:690:b0:5bc:c9e3:d5bc with SMTP id
 2adb3069b0e04-5bfb71d4723mr857819e87.29.1792871075927; Sat, 24 Oct 2026
 12:44:35 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-3-7c871f1755db@kernel.org> <sashiko-outbox-180435@kernel.org>
In-Reply-To: <sashiko-outbox-180435@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 24 Oct 2026 21:44:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLn-K5XOzNwPQpZk5=Oi=CvrpXxPLOs_5Om=nKX2TBw8dg@mail.gmail.com>
X-Gm-Features: AclHuK_D-MhMzwKebW1P8AbeD6JK4vbtraKHhtaYg2C22aczG200WdeX_DEjAK4
Message-ID: <CAD++jLn-K5XOzNwPQpZk5=Oi=CvrpXxPLOs_5Om=nKX2TBw8dg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Wed, Oct 21, 2026 at 5:29=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Could removing no-map from secondary-boot@0 while leaving no-map on the
> immediately adjacent pmc3-firmware@8000 node cause a boot regression in
> adjust_lowmem_bounds(), prepare_page_table(), and map_lowmem()?

Well the device boots and works fine so you are wrong.

Yours,
Linus Walleij
