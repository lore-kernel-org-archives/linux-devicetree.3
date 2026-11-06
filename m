Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962430;
	b=fmCIzV1WP65fMnzmTQrgRXQQ4QtMEIxY5ICuJK5hBBodeyiYdyu2uVfGzjChxMtGgHph
	 s/u7manmpOrbUTWDZDRqH79r8XAqu+SV8s7JesT3Zg+5vrJwo9HdY9OIsca1MwlM+laIr
	 vNMmQ5yoxzEVFKfGme7f+qG/55Lh30JEBVcuaERbhWJ05VabG+Uit5NdTCelas8jX1pfT
	 LMiHvdE6ALS3kijV43Ufxqb1pjDHiITMrTMgc8ubdRo5tnHlWIOrqD72zc/XMXt7rdAWF
	 Hs8nESdd79QrORlMPM+CEpiB/dTWSy1Mnqhy4gzHVIjHTZ8MMayT2cmcqBQnx79/0WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962430;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pVDfsMz8cMqWLcgS/M6OYiWrU0X+DS+oHS8BFIpnilE=;
	b=RdczGM7s3dj/u+sLSM73eSYF53qKjmyrDYAjggVnv+1A65vwLEs8n87G8n6Ug9IVuIwB
	 q90/0ZgPLRjKAtcG2Xm5Oi6oqwlVdh5ErI62XUmnJ+3vKQAZR0SPAxMlC/IbeG1pcyPWf
	 0yoJW7CG03iiOLH++x66kHcpWaH5YuaQYva58CnZ8/pxfbjweTnuAksxnql6F14yJswrK
	 xBNxcyCo2zkh8A/EpEFFIxYs38sDAmhlLWty9fg+MfFGUc54+a1wWAu58IQcSQf1s/RdJ
	 3z66zfHvc9gnTodOuju96tWzSxqtDHnD1E66ovG+fNlqYuzzj52AcKn9jDfTnR7hxgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMwW649P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8862606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMwW649P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2391A1F0089F;
	Fri,  6 Nov 2026 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962429;
	bh=pVDfsMz8cMqWLcgS/M6OYiWrU0X+DS+oHS8BFIpnilE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PMwW649PK50m55ay+OWngXKkAAbK2PbSO+12MZmKUhDoIKGca00ckLpWeN/umCTXW
	 OVHUz7a6ErJpoCBXiVtheJ0mBL2ESJgtndbH4KyUMAzZ0WsyZ5pfG4POXIiG6/3pxu
	 Uv470Y1E6anohDDu5XIPnJm4O80FSoY7z3NTpTePU/mYhD99a922pqaHC6UTig6EiB
	 FDoZakiMHWmkngbs6Hynk0QAz4h5x3LAY/zu+w6FWKutrsogf/4DhUAwpyyIW9RRqc
	 Q+fKvvfvdS1bQnP7RqxLwrBcIwBsaHJPe/OkWcQimdpudbNwd+jYmuZG2sUPAKRtWj
	 TshGeya9XvjHg==
Message-ID: <sashiko-outbox-201241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] arm64: dts: amlogic: meson-s4: add the CPU
 thermal sensor and zone
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106104659.54656-7-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-7-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:53:48 +0000
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
- [High] arm64: dts: amlogic: meson-s4: unmatched amlogic,s4-thermal
  compatible
--

commit a99d2d51a763291902046985186e9763a3fd5d38
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

arm64: dts: amlogic: meson-s4: add the CPU thermal sensor and zone

This commit adds the CPU temperature sensor node and the corresponding CPU
thermal zone with trip points and GPU cooling map to meson-s4.dtsi.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> index 69105c8abf122..1e8b845b80c31 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
[ ... ]
> @@ -748,6 +749,17 @@ gpio_intc: interrupt-controller@4080 {
>  					<10 11 12 13 14 15 16 17 18 19 20 21>;
>  			};
> =20
> +			cpu_temp: temperature-sensor@20000 {
> +				compatible =3D "amlogic,s4-thermal";
> +				reg =3D <0x0 0x20000 0x0 0x50>;
> +				interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clkc_periphs CLKID_TS_PLL>,
> +					 <&clkc_periphs CLKID_TS>;
> +				clock-names =3D "bus", "core";
> +				#thermal-sensor-cells =3D <0>;
> +				amlogic,secure-monitor =3D <&sm 1>;
> +			};

[Severity: High]
Does cpu_temp fail to bind to a driver and fail dtbs_check because
"amlogic,s4-thermal" is not matched or documented?

of_amlogic_thermal_match[] in drivers/thermal/amlogic_thermal.c only lists
"amlogic,g12a-ddr-thermal", "amlogic,g12a-cpu-thermal",
"amlogic,a1-cpu-thermal", and "amlogic,t7-thermal".  Without a matching
entry or a fallback compatible such as "amlogic,t7-thermal" (which
Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml also
requires when two clocks and clock-names are present), amlogic_thermal_prob=
e()
never runs and the cpu-thermal zone remains inactive.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106104659.5465=
6-1-christian.koever-draxl@student.uibk.ac.at?part=3D6
