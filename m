Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC864DBD6B
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032312; cv=none; b=bS10amBI4zmXibfK523HZ9IEl1rzM4ejTZ1IUoT4mX9PAPt2q9n5M44xgBhOMr9kIJT+Jn1XmEx7aav7/tc0xP9fb632KP7lliDxA3sSjxEhfcetwVNRJn8rhAn61YKjEgB8BQfMmAs9u19Nh/Ycut0fApzoKKrUGqZUFAg+0uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032312; c=relaxed/simple;
	bh=8pP/WbQblliIxZvVcFS1QTim+zYvja0nBC+6opHMjMw=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HtLebpuFfoURORMigVR5s82XhU6JXueryCYrWF9X7H65Qpeu+ErYP/G5feTtOTHotGQQibbgxpI8g8+agtVx2Vh1egs50bJ752Ykx/M8xfWtVhCiMICu6KyO2Dql5zJxGOCBWOGxets00Blt9JLE6p8MuqMACe8+0jJ+eDRpDIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWFUm/aW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWFUm/aW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1286F1F00898;
	Tue,  9 Jun 2026 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781032311;
	bh=tBwaUingjAOz65tPVRQIltx+CPhs6LQfudELSBccTfw=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=ZWFUm/aWiytvBBUx5qrusWFpDnZfHcfmp32VKh/hQsbNPPp7YplJmqc5uZyGhsuEZ
	 5Mf4TLmLXLxWmEUWZNwLBrWudfk8i8VFfwbet3oBkc3oM1tj2BWV+gNwnj27f76WqT
	 Hayp96WrW2NALbb/onno9b49er0QsGoEkRuBj5Ry2TeNydF2eqk95B7wHYueHGXoLM
	 pBGmDgUsLxhpZKZdps+pRdXCum2FZr5EL75sLHpxSCUAMNm90HOiWjw0i7vN/OfmTG
	 IB5kKtvQnG0tKwbre9QMB+r7jB1VnCN5TpAcx18DpXajoFIAfwINBzLkqgzTBqEmgp
	 W4O7jOD9+5cGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/11] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
Reply-To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 19:11:50 +0000
Message-Id: <20260609191151.1286F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unaligned `no-map` memory region breaks semantics on 64KB-page ARM=
64 kernels, exposing firmware memory to speculative accesses and corruption.
--

commit 7feed923de4c5fff1956c33a3b2895b2571326ee
Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size

This commit updates the wkup R5F memory region to match the MCU SDK linker
footprint.

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/exam=
ples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-a=
rm-clang/linker.cmd

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boo=
t/dts/ti/k3-am62p-verdin.dtsi
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
> =20
>  		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>  			compatible =3D "shared-dma-pool";
> -			reg =3D <0x00 0x9c900000 0x00 0x01e00000>;
> +			reg =3D <0x00 0x9c900000 0x00 0x01d08000>;

[Severity: High]
The new size 0x01d08000 applied to 0x9c900000 creates an end address of
0x9e608000. Does this unaligned end address cause mapping issues on
64kb-page arm64 kernels?

When the memory mapping logic processes adjacent valid memory starting at
0x9e608000, won't __create_pgd_mapping_locked() round the start address
down to the page boundary at 0x9e600000?

It seems this would inadvertently map the last 32kb of the no-map firmware
region (0x9e600000 to 0x9e608000) into the linear map as normal cacheable
memory. Could this mismatched memory attribute and speculative cache evicti=
on
corrupt remote processor data?

I also noticed that later patches in the series move and split this region,
but they appear to retain the unaligned 0x9e608000 end address in
wkup_r5fss0_core0_dm_region. Will the alignment issue persist through the
end of the series?

>  			no-map;
>  		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-topic-am62=
a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com?part=3D4
