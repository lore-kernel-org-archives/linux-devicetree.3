Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CFA3749F7
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 01:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991193; cv=none; b=iAouak5f1ECeoyAM7pRqEUz7NKeW9IaVZQ6/vhBJ3ZhUqCy7Xcs65GdFW1sRKgXZLUPs27lgtbpHM0+c//TJaRcAsZJYqw4JZ01+nFkSF9R45BaFp7C9sydC+gLwyfiZHwyQMTkLFzeVBqVwyH/A9QO78VjX/ZCHNMRLj2tpo8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991193; c=relaxed/simple;
	bh=GtW9TUuTBRs1IDkaA64os+rupGlUq5ivYw0yOOhg8Dk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KESJ2IvYi7XbNO7vLxiRyCyR7d39MuTJqnmjBQlAyvvuCKBzvY0zKT7DCuiUtji1IrUJL/qTZlTRoPsLdAh1o6GtmD5c9lAk3t3sLjQu4j8AI0Y8oEjPZAlSeBJYJJC/2u5HCdpW+tgxShCb5h8gCSpslagzKRz0ZxJu12NRaX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFZzRbUF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFZzRbUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0191F00898;
	Sat,  3 Oct 2026 01:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790991192;
	bh=2hcUoTSrAtMExsjjuqVEOAAJdSgDIznzunf9Un8XxO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OFZzRbUFeehtEE60JbuC2BuL8CwYaO55Vf51Lp21ijOJLsOMxB44QzrjawNp5kaLn
	 2epv7fiLYJWy1VnEx5rmRijohBSiQJk+h1z958Ke5pc9DF4DwCzcYFdB60IQoxS6hy
	 G4quzlatyiPkZRVDivZA9VQJPqL5lcdggKr2ItdQ7t3HqDyw3Pw46A9n323PjlgpqO
	 0c4B2JOeD64cGhyQyByO4RS+Q5WMMhL8K5mcJBTKQY6XM5lpitcvChjd1lf42d7dk2
	 TSAiXd3H1RBPoHL4l4Zt68W9u0m6hnt0O8tkL3Ivp9YUmRTTVmRSplQSQOrd2uTSrp
	 miTW70LgxbdYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] ARM: dts: aspeed: add Intel AVCRP BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Glazik" <dawid.glazik@linux.intel.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <9dadaaf04cae28e13057fa5d65023789f74483fb.1790344811.git.dawid.glazik@linux.intel.com>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
 <9dadaaf04cae28e13057fa5d65023789f74483fb.1790344811.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 01:33:12 +0000
Message-Id: <20261003013312.7A0191F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: 64MB memory leak due to unreferenced dynamically allocated =
video_memory
--

commit d3847f898b02cabadeb24ded4f04a71970cdd026
Author: Dawid Glazik <dawid.glazik@linux.intel.com>

ARM: dts: aspeed: add Intel AVCRP BMC
   =20
Add the initial AST2600 device tree for the Intel AVCRP BMC platform.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> new file mode 100644
> index 0000000000000..ba00916891724
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts

[ ... ]

> +	reserved-memory {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		video_engine_memory: jpegbuffer {
> +			size =3D <0x02000000>; /* 32M */
> +			alignment =3D <0x01000000>;
> +			compatible =3D "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		video_memory: video {
> +			size =3D <0x04000000>;
> +			alignment =3D <0x01000000>;
> +			compatible =3D "shared-dma-pool";
> +			no-map;
> +		};
> +	};

[Severity: Medium]
Does this code leak 64MB of system memory? The video_memory node is defined
with size =3D <0x04000000> and no-map, which dynamically allocates 64MB of =
RAM
and removes it from the linear mapping.

However, this node is never referenced by any device via a memory-region
property (unlike video_engine_memory which is correctly referenced by &vide=
o).

Since it is unreferenced and dynamically allocated without a node_fixup to
write the reg property, no driver can discover or utilize this memory, and
it is permanently removed from the system.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790344811.gi=
t.dawid.glazik@linux.intel.com?part=3D3
