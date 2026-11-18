Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=167.104.49.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020497;
	b=g0F/reTkfJkThHM+lyo+kRiTOM7dUdvKf4DaAHUO+5S2y/v39vyBMU2ZQUAUsJi11z34
	 Q7MNaGfCuQzz7b+0Ym7mkj2IDvD22StGngCMBeEj6hGUVCVdgZj/19P+DnaDzH3ii1Tx3
	 sQlgFGai6nfcOLezK7TZxpzJASKfbtegNl+wCVBcecQQ94k1S7IunTDGnhjDMFMA9ZS9n
	 DTpEztydp6s8fJsBKTTMtJPqDziNdJG8qVf4HiQE4OD2Q9ldQjRewcmKkBv0lCqggh7BY
	 wSnG/n2netz0z0WLKi9ki4Ub/ty7+W4NufrWkw5lnslXy4woklFMtzLv7HPwVhAw92A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020497;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=3GFJvAq6nIGqoHQdnUueliZjnKVhW3Nxe+pY+OXTGGI=;
	b=Q3WFlheRDZ17Ygqw5Wk6RFvPI4nw3k5TiJ4m27B6F5BITIf/+pe+xq/IZcLzKgfvs3Rd
	 JfSHQMf04QOonnv0gnCqkdomcn7UpgrGCBlYYh82vtzYs2820Q1DyMwhzb5W5LdiV27QK
	 MNw7Jca9NUUZgbBsBFkUyIsZinN5MpdE98xYa/O3ocTZaTCukBQJ+S83TM6lOGp+mrGUB
	 wln96yLRAzinC/TsZNE1Ojc5aXn1C1C3Qwpw3NXX/XZj18DZqRcW9cZ+Gl5f3WIDz31+g
	 tYwXXLzMFd9pwoa2aaOuDaXR2g4BruXgLr56PoLZUiDXmEtBG4pI5PJ3BX1Uyw+CLAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sverdlin.org;
	spf=pass smtp.mailfrom=sverdlin.org;
	dkim=pass header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=I8bCTST9;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=BbUox9wp;
	arc=none smtp.remote-ip=167.104.49.21
Received: from sendmail-50.purelymail.com (sendmail-50.purelymail.com [167.104.49.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F7A606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F7A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=I8bCTST9;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=BbUox9wp
DKIM-Signature: a=rsa-sha256; b=I8bCTST92F3zmyAYodaEjsSLXsM5S9DByOnz4Gcsgh3Mth9Or7p9q9h5a73lbc0P/CSv8FENk6Ghix8Ho1Zj07NlsXpAOHEKizvWamr6eFj93n8SSvlnfAUJhYqzMUSBXvq8aPLl1wWayDrm15QI6tlcqv2Quc692ivy3MpTixI9xBIsKyk8AqU5/kKYTZ+diiQdOphV41Cmk/d0BonYfQEYYKPogeMcD01Zwi2bvd9iYZHupZ5qZoUJYTOEewZygu6n7zmbkqZlbAPCZYhXQOlU3jV0RPPlCI4BmevIW381XxH0D2dx3DOpysMB6N9KffYOwovvK6iZZUe/7WtBzQ==; s=purelymail1; d=sverdlin.org; v=1; bh=3GFJvAq6nIGqoHQdnUueliZjnKVhW3Nxe+pY+OXTGGI=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=BbUox9wpp4bm6ak0OZWnsFHsYcTYBHOImytaHxkA863ZfZFKXa7cjN3TCpW7ubl65E3u+PkHsraVdGOyfgSiOf3x5Z1VoeEc+aoZ8zd8Zd/ub2Gj+xtJHRHXFu3u9f6eY4Md5wBYsy2z/4g44qHjBAEf63LqzsXmXxvaFkQet1bfWjOb994yZWVRHI1oNCSZgTNxk4pYm3BrNl78B+MhQe+0/btTe6AX9/vWIdQV7y+kbMbImJ2TiHQmMbxtC0EcHEnvLHJMCtW2drdNiti5vB46xcKOmXTclWR5Ju7loj0qmKZhj4ty8mIG6AVkyUH91OydufNPF0XO6hGe901gNA==; s=purelymail1; d=purelymail.com; v=1; bh=3GFJvAq6nIGqoHQdnUueliZjnKVhW3Nxe+pY+OXTGGI=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -527604635;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 18 Nov 2026 16:47:54 +0000 (UTC)
Message-ID: <18a78cddfc3c28c011bb5d0c566c2f307773b235.camel@sverdlin.org>
Subject: Re: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
From: Alexander Sverdlin <alex@sverdlin.org>
To: Enzo Adriano <enzo.adriano.code@gmail.com>, andre.przywara@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome
 Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius
 Pedrosa	 <vinicius.eduardo.pedrosa@gmail.com>, Jun Yan
 <jerrysteve1101@gmail.com>,  Lukas Schmid <lukas.schmid@netcube.li>
Date: Wed, 18 Nov 2026 17:47:49 +0100
In-Reply-To: <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
	 <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Enzo,

On Mon, 2026-11-09 at 23:45 -0500, Enzo Adriano wrote:
> Provide the SoC description needed for the Cubie A7S console, PMIC and
> microSD support. Describe the CPUs, PSCI, architectural timers, GIC,
> RTC, main and always-on clock/reset and pin controllers. Include the
> main and R-domain UART/I2C instances and MMC0-2 with their pin groups.
>=20
> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
> and noncoherent attributes follow Andre Przywara's public A733
> reference and the A523 precedent. The CPUX interconnect diagram in
> section 5.1.2 supports noncoherency as an integration inference. The
> ITS stays disabled pending its clock/reset and MSI integration.
>=20
> The enabled console, R-I2C0/PMIC and MMC0 paths were exercised on a
> Cubie A7S with vendor firmware in the November 4 RAM boot of DT v2.
> EL2 interrupt delivery and ITS/MSI were not tested.

Shall parts of this go below "---" as history/changelog?

> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b3529=
86b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> =C2=A0.../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 601 +++++++++++++++=
+++
> =C2=A01 file changed, 601 insertions(+)
> =C2=A0create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/=
boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 000000000000..d0b9f432e3ab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,601 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +#include <dt-bindings/clock/sun6i-rtc.h>
> +#include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
> +#include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
> +#include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>
> +
> +/ {
> +=09#address-cells =3D <2>;
> +=09#size-cells =3D <2>;
> +=09interrupt-parent =3D <&gic>;
> +
> +=09cpus {
> +=09=09#address-cells =3D <1>;
> +=09=09#size-cells =3D <0>;
> +
> +=09=09cpu0: cpu@0 {
> +=09=09=09compatible =3D "arm,cortex-a55";
> +=09=09=09device_type =3D "cpu";
> +=09=09=09reg =3D <0x0>;
> +=09=09=09enable-method =3D "psci";
> +=09=09};
> +
> +=09=09cpu1: cpu@100 {
> +=09=09=09compatible =3D "arm,cortex-a55";
> +=09=09=09device_type =3D "cpu";
> +=09=09=09reg =3D <0x100>;
> +=09=09=09enable-method =3D "psci";
> +=09=09};
> +
> +=09=09cpu2: cpu@200 {
> +=09=09=09compatible =3D "arm,cortex-a55";
> +=09=09=09device_type =3D "cpu";
> +=09=09=09reg =3D <0x200>;
> +=09=09=09enable-method =3D "psci";
> +=09=09};
> +
> +=09=09cpu3: cpu@300 {
> +=09=09=09compatible =3D "arm,cortex-a55";
> +=09=09=09device_type =3D "cpu";
> +=09=09=09reg =3D <0x300>;
> +=09=09=09enable-method =3D "psci";
> +=09=09};
> +
> +=09=09cpu4: cpu@400 {
> +=09=09=09compatible =3D "arm,cortex-a55";
> +=09=09=09device_type =3D "cpu";
> +=09=09=09reg =3D <0x400>;
> +=09=09=09enable-method =3D "psci";
> +=09=09};
> +
> +=09=09cpu5: cpu@500 {
> +=09=09=09compatible =3D "arm,cortex-a55";
> +=09=09=09device_type =3D "cpu";
> +=09=09=09reg =3D <0x500>;
> +=09=09=09enable-method =3D "psci";
> +=09=09};
> +
> +=09=09cpu6: cpu@600 {
> +=09=09=09compatible =3D "arm,cortex-a76";
> +=09=09=09device_type =3D "cpu";
> +=09=09=09reg =3D <0x600>;
> +=09=09=09enable-method =3D "psci";
> +=09=09};
> +
> +=09=09cpu7: cpu@700 {
> +=09=09=09compatible =3D "arm,cortex-a76";
> +=09=09=09device_type =3D "cpu";
> +=09=09=09reg =3D <0x700>;
> +=09=09=09enable-method =3D "psci";
> +=09=09};

Do we need capacity-dmips-mhz, cpu-map and two PMUs here, similar
to rk3588-base.dtsi? This in turn would mean ppi-partitions with
#interrupt-cells =3D <4> in GIC?

> +=09};
>=20
