Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036D836F8EF
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141927; cv=none; b=Uj4RHZYiSHPoYSc/piXdtckPjCWgI3GJBMhw+7g4AOKZEEQSwBP5+P9KDjKmIUU1gmrL0ZX3AkTPIcFf4ChDvIYc5QiJ4pFC628WENwbr+ey4raVYMgYHSlkgHpcK6XDT3wBJBroXCcJZU3Lt32RkJXXBTTnoI15NRnbtjvwJA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141927; c=relaxed/simple;
	bh=tfiikxbpEsntnXsRIbfP6OcnD1+V3RgumXOEyNV27kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvFdsc2y9eX2/6qR/qExhamh9w9jHfaNX6IjaNwDRM0+OvnD5JxCFfJ+1OB3jgb25vMkSyZw0+JAlpNrjeJRVBI1dXY/fW5FVZs87gekjakhmeIG22dNcvp6bUlaQax4Ae0ffKSXshW57WBlMNBovgiOYV2unbbaEeNvFTa77sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sM9HrWP+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sM9HrWP+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so734376f8f.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785141923; x=1785746723; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=879jIPCYb5W8l5rBfBUn/ihr+BRPaeGUdfS2I+YUk4A=;
        b=sM9HrWP+6ajrL7I427ab8zXefxYAABMbWJ+RxTKeRjQYYV5WJW9ZiOpAyBDOzNEkxa
         DZBv1HVi4O4PgXKoVYyNkKfW/Tn+UJMoYWuxNX9CIdT1nl9micvoFu0wSvdnRcMBuuul
         NdJtdftCq0MdkfZKngXx1PPBNPfcJ2nXoLD9xR2Qd359uh9kRkJu7U5CDygshvNsCHSB
         tYfkWYKz8cKGSbkF7xL8yrN0ooP2Gpj4OjPDbvaWSHkRsczKxmn3zSR/2QUpjg/BDW8K
         7nb4G0uHgAifWp81Z8CsyNIMc35RKfK0MOQzxO7uU/Bur9Th+dhgNkGk5r/XXJsrOJgZ
         5q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141923; x=1785746723;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=879jIPCYb5W8l5rBfBUn/ihr+BRPaeGUdfS2I+YUk4A=;
        b=abm2v07SMpHVZGQJU4upqOHF0ZvWxoHeV222xX26uv4jhTV6fQ3g5PTqasMycwgr5B
         /b7wVHKzlvcTf1EB6A7JtzNKXsC6dJhzJkGkNDG+O6XPb5vO8agW1H8LozNZRIOsSY1C
         2v5mJE1L6723/0VsHYnE52w5SQNMAXWu/qDbsCjucWNYwsJ1xEbxJKN5ZWDqpNX1XY7u
         lcDaypx6VcagG4lxe0pl7yHItAuEQNzskzD0Qr0+kFq0HXH3y5sOm0cr4+HtcQg3IVOp
         8zlkqQBkbJMq8vnlTzgpNohag2Zu32lpPS/qeXLEck343Vox41VqzUPHRMrU2VWqg14J
         zxmQ==
X-Gm-Message-State: AOJu0YwJ6MBRRSIAeV9yBN/orxr3Ev1S+bvMHPnWG5KyoAzrvTaxwN9D
	1bAiC5hAgllOzGOCKKOQ8/tenrdQWSjhMBupuMX4/BAiUI1uscLid4ML
X-Gm-Gg: AR+sD13nw1iZsLm3gK/0Sf0fqkSoJpgywD+veBEVB6phLCIj89njR7ankt+qQEJY+7D
	OZdVcdlp+ss4AJT2NGYV5oeK/OSmBH6qMzJznMoIFEonsTzB1QtCS/FasXZ5Wt8uTXC7qFon8Vq
	0MZ7/8mNg4GR63CTpsX0MOyvGWEV4IGnYotqIsFpspEyq2G/SzMAk5rNzVwKb6zHct4FfIAFIgM
	WHNjhdzXmMouQ8DGYVQ67L2ijP+btigamDJVG8ikc5pUQf0TWMRWSn50W+64cpnp1UeqzCPbIau
	vOipnGyo80XyqAqO4BEXL+quw25073pzndD9YTMwqoK+ru+2fITII1/BTFZ2C4kAbiOjTZBGohB
	e5ZuJ5gAe55WId9h6z+NrmSptq9qJ9hmAv616Ks4PnqFsCN9MlEbMAyUNr3H3yY/VxnMWEpAMpR
	nEm7o97Ta9jmT71WLqChJCXt409dtfPJhso5O5Lw3Cm0/uo1oa2iupkiL89Gvl7uAVDc8cG06u7
	l8tRA==
X-Received: by 2002:a05:6000:98d:b0:47f:837a:aa1b with SMTP id ffacd0b85a97d-47f9fe9300dmr9065641f8f.36.1785141922991;
        Mon, 27 Jul 2026 01:45:22 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm44117738f8f.29.2026.07.27.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:45:22 -0700 (PDT)
Date: Mon, 27 Jul 2026 10:45:21 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, 
	imx@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add
 Cortex-M4F remoteproc
Message-ID: <fyoefmlhxpaqh3k5nv4zvna5usjvmdrd7e3hhtygvbkvmegxds@kgmwwh7ifcoc>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
 <20260724-v1-verdin-imx8mm-dtbos-v2-6-9d7988bd76f6@toradex.com>
 <20260724164132.7527D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724164132.7527D1F000E9@smtp.kernel.org>

On Fri, Jul 24, 2026 at 04:41:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unconditional enablement of the Cortex-M4 co-processor and its memory reservations in a base SoM device tree file.
> --
> 
> --- Patch [6]: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc ---
> commit 5627e466b821e2ae1d5d44438ab0c467605d30f9
> Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
> 
> This patch describes the Cortex-M4F remote processor available on the
> Verdin iMX8M Mini SoM.
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > index 5fc177f589cb2..ac450fc6cbfb3 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > @@ -52,6 +52,18 @@ hdmi_connector: hdmi-connector {
> >  		status = "disabled";
> >  	};
> >  
> > +	imx8mm-cm4 {
> > +		compatible = "fsl,imx8mm-cm4";
> > +		clocks = <&clk IMX8MM_CLK_M4_DIV>;
> 
> [Severity: Medium]
> Should this node default to disabled?
> 
> Because it is added unconditionally to the base SoM dtsi, it defaults
> to "okay". This causes the imx_rproc driver to bind and call
> devm_clk_get_enabled() during probe, which keeps the IMX8MM_CLK_M4_DIV
> clock permanently running even if the M4 firmware is never booted.
> 

This is true and intentional from our side. The SoM DTSI now describes
the hardware including the M4 for the common use cases, instead of
requiring users to enable it specifically in an overlay. The drawback
mentioned here is a small tradeoff we considered.

> > +		mbox-names = "tx", "rx", "rxdb";
> > +		mboxes = <&mu 0 1
> > +			  &mu 1 1
> > +			  &mu 3 1>;
> > +		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> > +				<&rsc_table>;
> > +		syscon = <&src>;
> > +	};
> > +
> 
> [ ... ]
> 
> > @@ -164,6 +176,27 @@ reserved-memory {
> >  
> >  		/* Use the kernel configuration settings instead */
> >  		/delete-node/ linux,cma;
> > +
> > +		vdev0vring0: vdev0vring0@55000000 {
> > +			reg = <0 0x55000000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev0vring1: vdev0vring1@55008000 {
> > +			reg = <0 0x55008000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		rsc_table: rsc-table@550ff000 {
> > +			reg = <0 0x550ff000 0 0x1000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev0buffer: vdev0buffer@55400000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0 0x55400000 0 0x100000>;
> > +			no-map;
> > +		};
> 
> [Severity: Medium]
> Are we sure we want to unconditionally reserve these memory regions for
> all boards using this base SoM?
> 
> Because of the no-map properties, this removes roughly 1.1MB of RAM
> from the kernel's linear mapping permanently across all Verdin i.MX8MM
> boards, even when the M4 coprocessor is not used.
> 

Yes. We lose only a small amount of RAM, in a region that is fine for
all our Verdin iMX8MM SoMs. The DTSI is now set up to use the M4
copressor by default, in line with our other SoMs.

> >  	};
> >  };
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com?part=6
