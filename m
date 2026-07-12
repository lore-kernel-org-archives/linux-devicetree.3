Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE21D374182
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783850108; cv=none; b=J/wvzoZ/3ZUbuaCio9RPUCkGsIdqgHs09htUZMXGLO5ucdhuWN85PNVdpAGKMpny1raHPh1NXYarpDouE9uVQQFPw0qfy9e7K/00Q/FytHdasOQw4gC6NB1nf3A8auWDjxKQ9pUWeywfwFEppkqw8OJIWwUBHkCtJQ2h8DrwXE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783850108; c=relaxed/simple;
	bh=RRw9RYm5aESqKt650V56nDYDtftjVq55dmhn9ZX0Izc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rIi8IMS8JoqVd0MwZ6TTYvkvD2b7Ib3HHs37a7Yvin3ABxsyFaYXEp3DLEuUwobJ2Rwl1+y6gFzZWT4LL63JG/njFTewSYmVFQ9QHdPLbkhb2CQY9qkeUUIHRe1gWs458Spaf5GvcJAC15jq6HNdGuxzEKeWXfyiEaIMEnNszj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cowN1ABH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cowN1ABH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0D21F000E9;
	Sun, 12 Jul 2026 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783850107;
	bh=eaqTWT98Z1JAnj5lHg8+0T9LOP7n37NYcXuxnWq+aiA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cowN1ABH2/s49euI+w6BhRNLXka5bqfIFrqa0qxrwoL5lmYasvAaFCmly8Lv9YkJB
	 L3Lg0JL7oEPONKDgk6K8UR9IzaRAToX5bZelGnTatCB53o8yhuZRncyH35aw7pUHwp
	 zechxZI9DbXMSmeaGTnCSZXWl8IlPZq5LDC36AVcyrqZlmu06HYXi5yxsxqT40id8e
	 kcvTEUQBnE5ZLiVBOJt4P2JcGONNM+eyQHDUr8lv+W3SC8gKOrwWF6hMBcfbGAcbuM
	 OdCXXIa0/iARjxUjo39WhpOgPkdJzbN0zQCuhBpRnc1+6ynaidJwfWql0fle7GWg54
	 9c0sD+oZTc0Hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/12] arm64: dts: apple: t8103: Add SMC hwmon node
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260712-smc-subdev-dt-v1-2-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
 <20260712-smc-subdev-dt-v1-2-7763006d57c7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 09:55:06 +0000
Message-Id: <20260712095507.6C0D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding an empty `smc_hwmon` node without `status =3D "disabled"`=
 causes the `macsmc_hwmon` driver to fail its probe and print a `dev_err` o=
n every boot for all t8103 devices.
--

--- Patch [2]: [PATCH 02/12] arm64: dts: apple: t8103: Add SMC hwmon node -=
--
commit 537fe4eb204476276f256c169a803f44dce48ec8
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103: Add SMC hwmon node

This commit adds the SMC hwmon subdevice node to the t8103 device tree.

> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/a=
pple/t8103.dtsi
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
[ ... ]
> @@ -918,6 +918,10 @@ smc_reboot: reboot {
>  					"boot_error_count", "panic_count";
>  			};
> =20
> +			smc_hwmon: hwmon {
> +				compatible =3D "apple,smc-hwmon";
> +			};

[Severity: Medium]
Will this empty hwmon node cause a spurious error message on boot for all
t8103 devices?

When the macsmc_hwmon driver probes this node without any child sensor nodes
defined, it evaluates the empty node, finds 0 sensors, and prints an error:

drivers/hwmon/macsmc-hwmon.c:macsmc_hwmon_probe() {
    ...
    if (!hwmon->curr.count && !hwmon->fan.count &&
        !hwmon->power.count && !hwmon->temp.count &&
        !hwmon->volt.count) {
        dev_err(hwmon->dev,
            "No valid sensors found of any supported type\n");
        return -ENODEV;
    }
    ...
}

Should this node include status =3D "disabled" by default to prevent the dr=
iver
from failing its probe and polluting the kernel log?

> +
>  			rtc {
>  				compatible =3D "apple,smc-rtc";
>  				nvmem-cells =3D <&rtc_offset>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-smc-subdev=
-dt-v1-0-7763006d57c7@gmail.com?part=3D2
