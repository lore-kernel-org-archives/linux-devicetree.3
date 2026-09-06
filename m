Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6C6175A8A
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 00:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788655828; cv=none; b=YxEvyfY/IfVIq0Oyfb3ZAjgudmwculHkJ6Fauu646Vz2KE5A3h6hmLSplJzZkFPmJDosq9D13vRvVdv7HcLEYq82+t7fcaI4nVpWOYMlVroHvtmMzIZiUwLGMIhqndxfMScBelSAuoTUiCmhKenrhe8od1FY8F2FRWVGaO+vOBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788655828; c=relaxed/simple;
	bh=jGY7uZyiyDXQZq3EZZ11FVZe8FmiPWKefXm+0wDcXiE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UiKGWFqg8VG77sO0+/LJZ7VKXPuYXyN/iCj3oUqKbeAY0uHnZVNCcBXy0FhhbFfRL2jnZvEeBpKv3adkTS6qZDnO5bpO91/TiyVZvIgDzsLInSi/NvsLH+hY2fnMM1vddb33hXwIiWAdnUsAMVnEJAZ2SuEddk00+R9nsr+sAjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsE5GP0Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsE5GP0Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB99B1F00A3A;
	Sun,  6 Sep 2026 00:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788655827;
	bh=bmGsVxnWwwguz3Zj+alqj6MlZkbTrzywerBUvx/r5Xc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HsE5GP0YbMhaZmpTtYKy/vtVwbbQBSnn9Y+n1/zMLR2qZ39bIN1yWMrpeEAw3NubZ
	 jR11ZChmljx9f7YKoUv5sj2lAUU0rB0OdBNxg2ATfqpaDeGtgPClIEQlME1EFnjVtO
	 BUtwx6/JqQbM368gXJf5nmsnj6LkfMl7qcpHc51gXLQWuwXvtdM7da88KxHscAROmU
	 G1zHybb9NdOfXgie4jl4pIfZcg4XdxkFodaXi+WGKDoqqJEr5aBfWoaZeUHLTviSrl
	 GW3noznYhXw2muKTU/7/STh4q8+sHR27iNoMv3Nn72R8Dgux/Gdz1QJE7pUAwRNzsW
	 3jEoMvndTGBPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/4] arm64: dts: qcom: sdm845-google: Add modemsmem
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260906-modemsmem-v1-3-a3634b553841@ixit.cz>
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
 <20260906-modemsmem-v1-3-a3634b553841@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 00:50:26 +0000
Message-Id: <20260906005026.BB99B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unhandled -EEXIST error causes module reload / probe failure if th=
e SMEM item is already allocated.
- [High] Out-of-bounds read of SMEM memory due to missing item size verific=
ation.
- [High] Uninitialized SMEM memory leak to modem firmware.
--

commit 61111124cf2e78b88f10eebd1940456309ceceee
Author: David Heidelberg <david@ixit.cz>
arm64: dts: qcom: sdm845-google: Add modemsmem

This commit adds the modemsmem client to the device tree for the Pixel 3
and 3 XL devices. This enables the modem to boot properly.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm845-google-common.dtsi
> index 9e952f9862f24..7e8f1a34a79f8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
[ ... ]
> @@ -50,6 +50,11 @@ framebuffer0: framebuffer-0 {
>  		};
>  	};
> =20
> +	modemsmem {
> +		compatible =3D "google,modemsmem";
> +		qcom,smem-id =3D <134>;
> +	};
> +
>  	reserved-memory {
>  		cont_splash_mem: splash@9d400000 {
>  			reg =3D <0 0x9d400000 0 0x02400000>;

While reviewing this enablement patch, I noticed a few issues in the
modemsmem driver introduced earlier in this series:

drivers/soc/qcom/modemsmem.c:modemsmem_probe() {
    ...
	ret =3D qcom_smem_alloc(QCOM_SMEM_HOST_ANY, smem_id, sizeof(*info));
	if (ret)
		return dev_err_probe(dev, ret, "Could not allocate modem smem\n");
    ...
}

[Severity: High]
This problem wasn't introduced by this patch, but by an earlier patch in th=
is
series. What happens if the SMEM item is already allocated by the bootloader
or due to a driver module reload? Does this cause modemsmem_probe() to fail
permanently because qcom_smem_alloc() returns -EEXIST? Other drivers seem to
handle this correctly by checking if (ret < 0 && ret !=3D -EEXIST).

drivers/soc/qcom/modemsmem.c:write_socinfo() {
    ...
	socinfo =3D qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
    ...
}

[Severity: High]
This problem wasn't introduced by this patch, but by an earlier patch in th=
is
series. Does passing NULL for the size argument discard the validation
information needed for safe parsing? If a bootloader creates the
SMEM_HW_SW_BUILD_ID item with an allocated size smaller than
offsetofend(struct socinfo, hw_plat_subtype), could this cause an
out-of-bounds read that leaks data from adjacent SMEM items to the modem
firmware?

drivers/soc/qcom/modemsmem.c:write_socinfo() {
    ...
	target->version =3D cpu_to_le32(MODEM_SMEM_VERSION);
	target->major_id =3D cpu_to_le32(PLAT_VER_TO_MAJOR_ID(plat_ver));
	target->minor_id =3D cpu_to_le32(PLAT_VER_TO_MINOR_ID(plat_ver));
	target->platform =3D socinfo->hw_plat;
	target->subtype =3D socinfo->hw_plat_subtype;
    ...
}

[Severity: High]
This problem wasn't introduced by this patch, but by an earlier patch in th=
is
series. Since qcom_smem_alloc() does not zero out memory, are the remaining
fields of struct modem_smem_info (such as modem_flag, efs_magic, and
ftm_magic) left containing uninitialized SMEM memory? Could this expose
uninitialized junk data to the modem firmware and trigger unintended hardwa=
re
states or data leaks? Should this memory be zeroed explicitly, for instance
via memset(info, 0, sizeof(*info)), before passing it to hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-modemsmem-=
v1-0-a3634b553841@ixit.cz?part=3D3
