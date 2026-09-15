Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D913239792A
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483512; cv=none; b=CsluYvVS8P3qOjKUfWq0ydt8YqMIKTN6nVfGpn+FakgHB7TjVo25tCrvV9OajeHI28CXsX4K3win4Q0y/8/D6yHOinHBn87RspnfuadHaxf343EjKhnEycqethXvzh7zGfH9kbaPr1GdtKLDeicIiITXHiNqxJYW30KxLLFNuNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483512; c=relaxed/simple;
	bh=a2VG0yhNmKZmPGUs9SLVk8lTGA3ncVXeZ8s0CEZQO/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gWyohUIoUPOgf4FAMgXQQBVFycZyUFWXxoWOX7JpRqp7oGINnuUL73gwR0zN6m1W8FLeK8diHUMdaL0SnTAS1vqpN9tW4n3vsBllhs+7mag3Xfcdiomb0Zgh8YUaGIG9y54oedoYBT+b3X9FCi4b0cDDx3JLk5BIZmnUQbNIsSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS8080Xz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS8080Xz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223A61F000FF;
	Tue, 15 Sep 2026 14:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789483510;
	bh=NoJQX12deuvftohtf8KBqdUUBQHErDGBMVP5s5VyVRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fS8080XziS1Mp+E1ZRtUNaBix/DM5ZP9hJ33KkmtEZzT5ktwWMgck3dn/8f3ZbAAy
	 iSHXuG3f/VzSwqJSgWYWm9DWN/fkGuJCDLv9cTRR1b544bpNctBOlG5H8rx5vkKm84
	 orTYTrqfX74Vv2hUyfKrORWOaSWKQ6R36jrg6/0elnKB8iKhcZAQYX+C8Oeaa5Qox9
	 K9stYKi1YowDzJTMQoek36OyusNC6OSzdGMk5uBy/y1bLd8oPl2/Fh/FNPOtsRjRaL
	 l6g4jJ0E4XRbiTTLw1Cif2VS2NSxI2M3TltWuWmhQ88qrWLswKmNTzM7qsHdgWiKzZ
	 IEPiW8tOva0EA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: add Xiaomi Mi 8 (dipper)
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260915-dipper-v2-2-cbade54919ee@ixit.cz>
References: <20260915-dipper-v2-0-cbade54919ee@ixit.cz>
 <20260915-dipper-v2-2-cbade54919ee@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 14:45:09 +0000
Message-Id: <20260915144510.223A61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: missing TrustZone reserved memory redefinition
--

commit 02ae202c9e4a6dda959a1b0bd255a44620dacac8
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: add Xiaomi Mi 8 (dipper)

Initial submission for one member of the prime Xiaomi Mi 8 family.
Mi 8 Pro (equuleus) and Mi 8 Explorer (ursa) are nearly identical.
Known differences are battery capacity and fingerprint sensor placement.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-dipper-common.dtsi b/=
arch/arm64/boot/dts/qcom/sdm845-xiaomi-dipper-common.dtsi
> new file mode 100644
> index 0000000000000..eb4243e7f2c07
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-dipper-common.dtsi
> @@ -0,0 +1,607 @@
[ ... ]
> +/delete-node/ &slpi_mem;
> +/delete-node/ &spss_mem;
> +/delete-node/ &tz_mem;
> +/delete-node/ &venus_mem;
> +/delete-node/ &wlan_msa_mem;
[ ... ]
> +	reserved-memory {
> +		/*
> +		 * It seems like reserving the old rmtfs_mem region is
> +		 * also needed to prevent random crashes
> +		 */
> +		old-rmtfs@88f00000 {
> +			reg =3D <0 0x88f00000 0 0x200000>;
> +			no-map;
> +		};
> +

[Severity: High]
Does this code accidentally leave TrustZone memory unreserved?

By explicitly deleting the default tz_mem node with /delete-node/ &tz_mem; =
at
the top of the file but failing to redefine it here in the reserved-memory
block with device-specific sizes, Linux will map the TrustZone memory space
as general-purpose System RAM.

When the buddy allocator hands out pages from this unreserved TrustZone
memory range, the system will experience random hard crashes (Synchronous
Aborts or Secure Watchdog Bites/XPU violations) when the kernel allocates
and accesses it.

The workaround of reserving old-rmtfs at 0x88f00000 to mask random crashes
appears to be a direct symptom of this missing reservation, since that memo=
ry
region falls within the unreserved TrustZone space.

> +		adsp_mem: adsp@8c500000 {
> +			reg =3D <0 0x8c500000 0 0x1e00000>;
> +			no-map;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-dipper-v2-=
0-cbade54919ee@ixit.cz?part=3D2
