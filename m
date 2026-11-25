Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614587;
	b=G2Se0+0Ts4Wf4ayZoXikXNABzzcKrWRJjZt9OEVp9DPkZu9yW392i49DoY72KWBZ1eke
	 lAsG4G8hfJ1wjYMSJFaKVfLzmisKoATo/qN6LDkPO2hJXwrstLa/7mT1VTOTJ7WQ4OvH5
	 Eqtc2i2ILLAZBmo8fn8aNW7CaVDjJTt3QV4IbPtcCyL+6N18FMMnGpMeJ1Oibpso+k1Id
	 MM954f8efNXV4KFi77O8O8Rkbxspx+E3q3YaN1Yz8Up7YNUJrMbeXB2FsGyaZsSIkeWMx
	 F+3hqZKkjtETOhnzooXBmTR96xFRE3na1D/Ltd1imYPzPg2wPrN5EDqThUrBeUPR+Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614587;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=BuPepjdXAchlZ0/rdmklLt9a4OqDms3VeAyOyVVTjdU=;
	b=uei5YwlB02GeEBP1erzO8QofNIVV1G/XLwTsWjFBD0mqXQ63dSVUJFQBO+j5k3c1j1j5
	 FaduS5ZyAzjjLfYDKYX5BNzcTXy3AZTewY4vdj94cVGQJubWyjxCHNFjbmKvnxxKAk2PZ
	 Ik/gKgdnSRjBWJp/oB3BIo/C+P8XELOwz5X8vGtX2JATBwHuAQvO8hA/QYww/pT2Zetfb
	 tE78VdKYigw07L8/+7qG+YLHj7sPU8L1jMPultJDGkBWwaSV3NCv5qwFBG2hmBFTmmlsh
	 BS7qXPtC4tUZYJSaAS+aBontA0ZwAb7pTS1i0KT7Ieue15yRg3nOmvaMLrqdYaXsqTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=VG4FDJAN;
	arc=none smtp.remote-ip=79.135.106.104
Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5FB606A33C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5FB606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=VG4FDJAN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795614584; x=1795873784;
	bh=BuPepjdXAchlZ0/rdmklLt9a4OqDms3VeAyOyVVTjdU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VG4FDJANG6JEbv/1Mwb2lTT0CY6hhvcXxLMEZV0//O4YGYscqkRzEVesPF03ipVGU
	 ECWyheGAc7f32lOi9FLmumMc5d5/tm/AxV4gllixFPjGC/BtEqh896ltoIzLBsTlpq
	 672pBW2z6Tz4EJ49qCWEUee4dU/V1BYGkOgWnYgfzS70Oy1dUz5z+Tqp27c+1NSvVK
	 n+iKMNmpI7kBQyXcpZsW2vc7xrzCSz7Af4e6sHwLAfptzPPQnriLnH1YNBFJsgXXs2
	 1A/fO5Pa5RUWqZ+TUndzTLEioSB//GmSIXsPU09AbUKez8lJY5iH6U5zZcCorPB5Tg
	 Hepbut9OX0Xjg==
Date: Wed, 25 Nov 2026 13:49:26 +0000
To: Alexey Charkov <alchark@flipper.net>
From: Ryan Leung <untilscour@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the CPU ID
Message-ID: <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net> <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 9e804900875c1d7029fee4789a2fc3b0fde23519
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

On Tuesday, November 24th, 2026 at 8:04 PM, Alexey Charkov <alchark@flipper=
.net> wrote:

> Rockchip bootloaders derive stable Ethernet MAC addresses from the CPU
> ID in the OTP memory and patch them into the device tree they pass on.
> Kernels started any other way, e.g. straight from the SPL in Falcon
> mode, end up with random addresses which change on every boot, even
> though the CPU ID is just as readable from Linux.
>=20
> Implement the derivation for cells marked as "rockchip,cpuid", handing
> the result to consumers which ask for the cell as "mac-address", such as
> of_get_mac_address(). Leave the CPU ID unchanged for any other reader,
> so that the same cell keeps serving the ID itself.
>=20
> Follow U-Boot's rockchip_setup_macaddr() exactly, so that both yield the
> same addresses: hash the CPU ID's lowercase hex string with SHA-256,
> take the first six octets as a unicast, locally administered address,
> and XOR the cell argument into the last octet, which is how U-Boot gets
> eth1addr from ethaddr.
>=20
> Put the address in the first six octets and keep the cell at the size
> of the CPU ID, as NVMEM cells have a fixed size and MAC address
> consumers accept a longer cell.
>=20
> Hooking the derivation into the OTP provider rather than a separate
> layout means it works with any fixed layout of the OTP cells, and needs
> no per-SoC knowledge, as the cell already gives the CPU ID's location.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  drivers/nvmem/Kconfig        |  4 +++-
>  drivers/nvmem/rockchip-otp.c | 48 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 51 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index d2f5bb236663..5776d4e4b391 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -448,9 +448,11 @@ config NVMEM_ROCKCHIP_OTP
>  =09tristate "Rockchip OTP controller support"
>  =09depends on ARCH_ROCKCHIP || COMPILE_TEST
>  =09depends on HAS_IOMEM
> +=09select CRYPTO_LIB_SHA256
>  =09help
>  =09  This is a simple driver to dump specified values of Rockchip SoC
> -=09  from OTP, such as cpu-leakage.
> +=09  from OTP, such as cpu-leakage. It also derives stable Ethernet MAC
> +=09  addresses from the CPU ID, as Rockchip bootloaders do.
>=20
>  =09  This driver can also be built as a module. If so, the module
>  =09  will be called nvmem_rockchip_otp.
> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
> index 7eb834516ab4..eb91e7a34051 100644
> --- a/drivers/nvmem/rockchip-otp.c
> +++ b/drivers/nvmem/rockchip-otp.c
> @@ -6,9 +6,12 @@
>   * Author: Finley Xiao <finley.xiao@rock-chips.com>
>   */
>=20
> +#include <crypto/sha2.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/etherdevice.h>
> +#include <linux/hex.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> @@ -67,6 +70,8 @@
>  #define RK3588_AUTO_EN=09=09=09BIT(0)
>  #define RK3588_RD_DONE=09=09=09BIT(1)
>=20
> +#define ROCKCHIP_CPUID_LEN=09=0916
> +
>  struct rockchip_data {
>  =09int size;
>  =09int read_offset;
> @@ -319,6 +324,48 @@ static int rockchip_otp_read(void *context, unsigned=
 int offset,
>  =09return ret;
>  }
>=20
> +/*
> + * Derive a MAC address from the CPU ID the same way Rockchip bootloader=
s do
> + * (see rockchip_setup_macaddr() in U-Boot's arch/arm/mach-rockchip/boar=
d.c),
> + * for consumers asking for one. Everyone else gets the CPU ID unchanged=
.
> + *
> + * The address takes the first six octets of the cell, which keeps the s=
ize of
> + * the CPU ID. Consumers only look at those, so the rest is left as it i=
s.
> + *
> + * The cell argument is XORed into the last octet rather than added to t=
he
> + * address, matching how U-Boot derives eth1addr from ethaddr.
> + */
> +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int index,
> +=09=09=09=09 unsigned int offset, void *buf, size_t bytes)
> +{
> +=09char cpuid[ROCKCHIP_CPUID_LEN * 2];
> +=09u8 digest[SHA256_DIGEST_SIZE];
> +=09u8 *mac =3D buf;
> +
> +=09if (!id || strcmp(id, "mac-address"))
> +=09=09return 0;
> +
> +=09if (bytes !=3D ROCKCHIP_CPUID_LEN || index < 0 || index > U8_MAX)
> +=09=09return -EINVAL;
> +
> +=09bin2hex(cpuid, buf, ROCKCHIP_CPUID_LEN);
> +=09sha256(cpuid, sizeof(cpuid), digest);
> +
> +=09memcpy(mac, digest, ETH_ALEN);
> +=09mac[0] &=3D 0xfe;=09=09/* clear the multicast bit */
> +=09mac[0] |=3D 0x02;=09=09/* set the locally administered bit */
> +=09mac[5] ^=3D index;
> +
> +=09return 0;
> +}
> +
> +static void rockchip_otp_fixup_dt_cell_info(struct nvmem_device *nvmem,
> +=09=09=09=09=09    struct nvmem_cell_info *cell)
> +{
> +=09if (of_device_is_compatible(cell->np, "rockchip,cpuid"))
> +=09=09cell->read_post_process =3D rockchip_otp_cpuid_pp;
> +}
> +
>  static struct nvmem_config otp_config =3D {
>  =09.name =3D "rockchip-otp",
>  =09.owner =3D THIS_MODULE,
> @@ -328,6 +375,7 @@ static struct nvmem_config otp_config =3D {
>  =09.stride =3D 1,
>  =09.word_size =3D sizeof(u8),
>  =09.reg_read =3D rockchip_otp_read,
> +=09.fixup_dt_cell_info =3D rockchip_otp_fixup_dt_cell_info,
>  };
>=20
>  static const char * const px30_otp_clocks[] =3D {
>=20
> --
> 2.56.0
>=20
>=20

Perhaps "rockchip,cpuid" could include a mention of "mac" somewhere?

Tested-by: Ryan Leung <untilscour@protonmail.com> # RK3528 NanoPi R28S

I tested on FriendlyELEC NanoPi R28S (RK3528) with index of 100 and the MAC=
 address was exactly as expected.

Looking forward to using this.

Best regards,
Ryan
