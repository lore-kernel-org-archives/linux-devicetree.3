Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689859;
	b=lYaB9GGGR+I+76bqjkWTfl4fIaGFYQXxvK7DWPQ/ctXk/1Y1G4rsOTxPQKdlWNypIypB
	 1atOsZQ3aUuPF2WuFm653n3f6aaeruAG4ENHWET549aQFPXsDTVwKe5nq7cFi8NsOqC9/
	 /ZV9jC/n8J2MVDtETQ0gIXyc+1+2E4X9mwoExDa2fPvV0OTyYu8QWlIw1gLJL+17bZnVX
	 Ph78gfJmFopwZvwHemHalxo846W5WTyAcOuMVmefZMKKMcOjHuc7BhfWzpDm29H5hGxGn
	 HZKDDtfidMjX6o64SqW2AqA1vGkWHU3k9h4SaPd4QIWqhjlYnMVYIt58O48P52I84vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
	b=NujYjvRHMYjconZ17S+9XBbdjSp50Mceu0k7CKUzU3qL/I2YLqLqZGJKLwgqla3IWD6W
	 MCWARHuaOUtajOn88DyDgfHtNLZG2OzivMHb1204FDA8UFHNPtUPL15UUjtQn7L56aidP
	 VxX2LEzsjyXcAxi8ll16sbsKU8e+88vb+emM3KlY+1yUOZOfUvLtJ0eW/hfj6ylBkB8Cw
	 6y5T6+Arc/tPSJGrlU5b3pZdYdTPq/idmiJnwCqzxK5qyfdLH7A99aVduA9w4tsliuCZl
	 6FRBAh96rivS5CkTWAaW9EICR0q9XV0TUoAsM+Utb4V89hnKdMaqHWkceD1pneVhPkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RihyPHaw;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F743606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F743606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RihyPHaw
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so50724a91.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689858; x=1793294658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
        b=RihyPHawKrhjKU9Kb90Dbdua9vA18J6fBb6tZ/LaH7qLgh095iP+fB0arDpMP2D2Cu
         cm2fC0O7dlub8LKJxBJ+iBTVF+BUxa6rUTixV3MklNcEGXFJUruQB7ue7i24UkHOz3qc
         rchvV4Rg1K4w9zfCQzzWLM04KuBv2kl/z24s3sv3f8qteEAO4wFi1SCs3/i5kfp1A2Rj
         SVoiOo+rxzDuxVqYUXXmEO1RxP6raCYgVdAHnzQbA1rX9JLhjY3ybc1JeQAc1+BjqCLC
         fPEklOqRwkPNhRR6VsjePj4KNDHaD2ioXXvBadEHCeA7D6QB3/2AMS9JOQlhHlPzPUia
         dqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689858; x=1793294658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
        b=TiG5CO/YWDN0yzD8ulcjOl8r3XtOLV1UMTSu1WEq6uB7HDJ9eZ/KX6ObbeqVaL49Up
         GN1mzGtWb7gWjc2VS6pvokGkRd2YFKqlOe66+baMNTfTAY4IO/Re9aO1rdSbCqGqxHt5
         cqEXsWlW30rEbmFsiEE0rL9ZljnkYo+oDa9sEExNvms+AQeVky7HV+fwSqNP0sZ6/JrR
         U/vJL0pbDwFV+wkgoIDFWZbmd8p9ueL12MmA93jkAktdNHDz7ClM3CVwYfpNZR0x3OWW
         gLeFqan/FvvAqD5g/P3d6ha5wvWdpV3Zco2oqJaODQH1bAnMyKSdIFr42+ynkA3t/XAc
         fYPA==
X-Forwarded-Encrypted: i=1; AKwUvBw2MYjraVnX/aAs6FQgAxlQhKFr3s89Gazzl9VN4+9J9BF9ad75nwddKI1fdxf6cSb4yA5IzBlLu9CJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJYtE7As/J0Bjop9F4Kdl+4ViCf//Bl1fCDqefMmrftvo7WU4jn
	mcRI/k9XQii7+odesbfI+rESurd6v1bw0USQqzvI10GP11s+4tGqO5d6atsvIR2pWUQ=
X-Gm-Gg: AYBFou1/a3xW/Uu4+nuOgN121sGjw+b+h2+ZHDRHjtXzJt8dGrMGDVRbz80IbUg2Goy
	nDpgDhQSL1lMtupcM7VV3YGtZxvSwNomz6yeqFb6eAqr8B9aSBEOtcNeUqaANDWXrsdwJ8l13dX
	N78+0EvDyMbYQC/dK5ccI/amte/0AukuMjU4e03qma5htEMwxnPk7SCQnhlQR1Pbw4YHbi7phtm
	LvHvusIaHV2AwaJgvLFlQHXPL9zrklGkuZnejoLCeaMk6z2jIJE631gMW7TFwXy1/Q6LW9hJph6
	dhTgV8xmUT8w3e/Ry5uKKFzgll8p+0bUCxvOu3iluitlXdMmY+mzh+IV7NqN4jxhZMeEQxscTD0
	dopdabxKpLLENMpfkBKoaZlyO+8X9oRZK0oZBUXDhAMIAAL2zMkJ9fAS0M59kLunS90gecKFMXH
	ODp6RkDf0YcqFbc9OixJRjvrFRX51fmNlJG4C1SABkja0vdCRjQtpJ2kM0mBLKJHXVqSgX+RIrs
	Tis86d8FuMhvFBlfWDyYUGYzyeYkzvB05dfnx6q6hMWF+U8nDENw4gdSxg=
X-Received: by 2002:a17:90b:580c:b0:3ac:8ee5:e00f with SMTP id 98e67ed59e1d1-3ad86cc1a23mr4599427a91.57.1792689858509;
        Thu, 22 Oct 2026 10:24:18 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5f8sm5060365a91.9.2026.10.22.10.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:24:18 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:24:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v7 3/3] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Message-ID: <atpGv_FiRlgPh4-4@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
 <20261020-memory-region-name-v7-3-1413d5928340@nxp.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-memory-region-name-v7-3-1413d5928340@nxp.com>

On Tue, Oct 20, 2026 at 12:50:23PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Move related memory region to overlay files.
> 
> Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
> to be used with the mx95evkrpmsg system manager configuration for
> remoteproc and audio over rpmsg-usecases.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  3 +
>  .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------

I will need an R-b from Sascha to merge the above files, otherwise they will
have to be resent separately.

Thanks,
Mathieu

>  3 files changed, 84 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index a80cccf34eb56..f3b19f3b1488e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -960,6 +960,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-mqs.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
> @@ -984,6 +985,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
>  
> +imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
> +
>  imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> new file mode 100644
> index 0000000000000..c3deb277edabf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + *
> + * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
> + * configuration for remoteproc and audio over rpmsg.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		memory-region = <&vdev0buffer>,
> +				<&vdev0vring0>, <&vdev0vring1>,
> +				<&vdev1vring0>, <&vdev1vring1>,
> +				<&rsc_table>;
> +		memory-region-names = "vdev0buffer",
> +				      "vdev0vring0", "vdev0vring1",
> +				      "vdev1vring0", "vdev1vring1",
> +				      "rsc-table";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		vdev0vring0: memory@88000000 {
> +			reg = <0 0x88000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: memory@88008000 {
> +			reg = <0 0x88008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: memory@88010000 {
> +			reg = <0 0x88010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: memory@88018000 {
> +			reg = <0 0x88018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: memory@88020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x88020000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		rsc_table: memory@88220000 {
> +			reg = <0 0x88220000 0 0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	sound-micfil {
> +		status = "disabled";
> +	};
> +};
> +
> +&edma1 {
> +	/* reserved for M7 */
> +	dma-channel-mask = <0x40>;
> +};
> +
> +&edma2 {
> +	/* reserved for M7 and V2X */
> +	dma-channel-mask = <0xf>;
> +};
> +
> +&micfil {
> +	/* reserved for M7 */
> +	status = "reserved";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> index f82e149323d34..3ab679e5a4740 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -189,37 +189,6 @@ linux_cma: linux,cma {
>  			linux,cma-default;
>  		};
>  
> -		vdev0vring0: vdev0vring0@88000000 {
> -			reg = <0 0x88000000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0vring1: vdev0vring1@88008000 {
> -			reg = <0 0x88008000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring0: vdev1vring0@88010000 {
> -			reg = <0 0x88010000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring1: vdev1vring1@88018000 {
> -			reg = <0 0x88018000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0buffer: vdev0buffer@88020000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0 0x88020000 0 0x100000>;
> -			no-map;
> -		};
> -
> -		rsc_table: rsc-table@88220000 {
> -			reg = <0 0x88220000 0 0x1000>;
> -			no-map;
> -		};
> -
>  		vpu_boot: memory@a0000000 {
>  			reg = <0 0xa0000000 0 0x100000>;
>  			no-map;
> 
> -- 
> 2.43.0
> 
