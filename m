Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8A742E8E9
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 11:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785930213; cv=none; b=u8xmesQM3FNKcjR7mC03QvC4nlGv8S4Z5v5oaDVXLXXedUQrWP7SG0cilYjcvsNXdKCP4UNAkJtgYa4xCT/l3f7aAKZtGqWT+hHNXu7vakyGxMlUIJED3Q0XUH9JC54s7lajIs4UkfJ9GoLlWExDUTyhgjpa48J5fOYbEasmCZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785930213; c=relaxed/simple;
	bh=St2u8lH/5oH4tSYBPuEiECiD5EIaJbxPxmwjLcDzVrA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iuYPJXm/c2DialquXHyXzI1Sy/ssOwyCCqjyXZIBUugc+3sNXWxbZAe9PqQV00jcrBiw0oiLTfOV8uEO1zrTkZjhxbYhyXAbYOu+DjU2qOlarInP68nx5GHKubkUfYfas5hnqScA3szBDls5U5UJV4mUp1hW+T8ntdYMJqIN5Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJJoPej6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJJoPej6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCB41F00A3A;
	Wed,  5 Aug 2026 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785930212;
	bh=Z4kL0qQMuSuhH27zEq4VGyk7IWsxczx27osiiilFVRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oJJoPej67lRfaiQRT9mSuA44T7pzJbXNd2jTsFGs7b0J1f5Ox9HkYaId8DZCEl1jC
	 Ri28y9R+6P71OEc9+lptuB6CiTD0TscDDOAUJz3o7wzMs8BPUp/iBm+GLZ+2GL5u5p
	 EnheGcKaNvQhb5YDuviRlPiT9Cb1KtCP14YbkZzW3wLarViPy3EIJuVdUTbhEGQANk
	 SiHXA4SKVHu5ke/NUHkROpZuk5+U23HsvEAI+PI2vwq6SdXtE2O5AKnpc5Qjbf2czK
	 OO4dcoNClkOsqQ9stKEXNKs4SjCmPTfpf+ql0da12Igh5/fFbGIttKlDb1SkJFJMT0
	 0LzQ4v9AH8zRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk-som: Add firmware-name to
 QUPv3 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-talos-evk-qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com>
References: <20260805-talos-evk-qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 11:43:31 +0000
Message-Id: <20260805114332.4DCB41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Removing the TrustZone dependency for QUP firmware breaks earlycon=
 and standard serial console initialization.
- [High] The commit claims to handle access control permissions within Linu=
x, but no such logic exists.
--

--- Patch [1]: [PATCH] arm64: dts: qcom: talos-evk-som: Add firmware-name t=
o QUPv3 nodes ---
commit 2c22f3348260193e8037f117d786bf9e0ca0dd64
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

arm64: dts: qcom: talos-evk-som: Add firmware-name to QUPv3 nodes

This commit adds the firmware-name property to QUPv3 nodes for the
talos-evk-som board. It shifts the responsibility of loading Serial Engine
(SE) firmware from TrustZone to Linux.

> Handle SE assignments and access control permissions directly within Linu=
x,
> removing the dependency on TrustZone.

[Severity: High]
The commit message states that access control permissions are handled
directly within Linux. Is this access control logic actually implemented?

Looking at the qcom-geni-se driver, there does not appear to be code that
configures hardware access control (such as QUP wrapper ACL registers, XPUs,
or SMMU protections) that TrustZone would normally enforce.

Does this change bypass a security boundary without providing the stated
replacement in Linux?

> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boo=
t/dts/qcom/talos-evk-som.dtsi
> --- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
[ ... ]
> @@ -411,10 +411,14 @@ usb2_en: usb2-en-state {
>  };
> =20
>  &qupv3_id_0 {
> +	firmware-name =3D "qcom/qcs615/qupv3fw.elf";
> +
>  	status =3D "okay";
>  };

[Severity: High]
Will relying on Linux to load the QUP firmware break earlycon and standard
serial console initialization?

If the hardware remains uninitialized during early boot,
qcom_geni_serial_earlycon_setup() will fail when geni_se_read_proto() cannot
detect the UART protocol and abort the earlycon setup.

Furthermore, standard console registration invokes request_firmware() via
geni_load_se_firmware(). Since this occurs before the root filesystem is
mounted, will this fail with -ENOENT and drop the console registration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-talos-evk-=
qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com?part=3D1
