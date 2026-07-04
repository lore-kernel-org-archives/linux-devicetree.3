Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EB027732
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783173689; cv=none; b=RJMSgLAsKmoIazUOffegjnCm6rPkNDm+Ej+3MsbpZLTxry9xChon/fiIdRwcr3mkUTVQDUiwxChGKv0UrRBOWa6Xf0/12ijsm1dcPP5HGw0iLw9j8gbVfjJ8/+rIpgUeqn1Xid0m9tjj1Z7BbrnPKhUP5nLmgHvtf2RlRwai7HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783173689; c=relaxed/simple;
	bh=X/aUfjm1ytiWBQKSsoJFWVGuSu64ruDLhkhKQT26bFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2ZZmXiP0S7YJQ3BwWQ5TZv2IOtXPVrXtVNV3TZQHpNLYncmJJVO58v4ItdKEmNlKwp7M3YuLLBWbLlDtunGkWf7U8BoyIBWeC9/Dra0pD1C6sctmvICbRyEhJjJImCxXMQoH4q7zKCVSefw/tVEcOYXKPY8FBWJ1pn9T2w+te8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AEYFsOgT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kz6zZ5gj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AEYFsOgT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kz6zZ5gj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783173687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG/qppTW5QiC+uZfEkeQXRtZMh5udm6vGfwyGZ5WcNg=;
	b=AEYFsOgTa3bvYG87JLHaEoNhZXAUqIGHhEYv50n1T97lWqNQt8fQCDNgDBwSK9RvINbEfM
	KTPCdmy6DDbcS/j3EX4Mz01hnhCYzmeaS/lCY6vi19OzquafcyOmAkrfAXjDh4d+pwUCQh
	i8XKTr7RYo7fNhqTjRwBw7zx7UJWQEg=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-DPGNHrKoOc6ORPmjGLz_Gw-1; Sat, 04 Jul 2026 10:01:23 -0400
X-MC-Unique: DPGNHrKoOc6ORPmjGLz_Gw-1
X-Mimecast-MFC-AGG-ID: DPGNHrKoOc6ORPmjGLz_Gw_1783173683
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-664dbd02ff1so3964807d50.2
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783173683; x=1783778483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RG/qppTW5QiC+uZfEkeQXRtZMh5udm6vGfwyGZ5WcNg=;
        b=kz6zZ5gjPJ+WV34/RED2OiGUmslZVv8IzXmoTcUKNrcByFnhFSwmrJTTaEe/i2PGwO
         te8T6T1PKzCoc/xhcEMdzRq9IyzI6iDl4j5DLaay5MnTR1AhKWDKhrRszDou041qZKoo
         YMwi0mkZ/Gckasy9MTAn3TVUk8KhV6M27zVj7/eebEyTHuj4P5yz1zXanNd1xJsURi6R
         dAD0k/lq0EB6b/eECfARvaZLhlB69HQX/to1WfhfXoEGFuupeM5GoFzdiB31unDCw5MR
         znwXAWZ+t9yzPC6LDquujOtYHsPEvk7uxP3gpdsPI2wGrcHiMvKsWTgH/07wvxCsB0K4
         e2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783173683; x=1783778483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RG/qppTW5QiC+uZfEkeQXRtZMh5udm6vGfwyGZ5WcNg=;
        b=lgEv7hEhm/DEhkryeqwr1xH5Pc+QhqRDInX6nYAKOc3An7xKKos1CuvU50oBN3lVIs
         pD0XpNcQOLnFms4VJqTGyuDxHsrjn7z2+fJl9qhxO9r/AskB43w9qGEH1g17pBjJZi/l
         sKeeDh/EMMMfmLWKfwWXfQpUGckqMCl+MQVpbludNVsLPttBq4h+F2rHOyWewMvg9Wbx
         HExZZ/K9HAjbxSEIFOeTqW1Gv83RtquZAx5MmcOceFPr+scqCHfgaupu9ZEgV1pDTEdB
         uxcu9HeAg4triJ03SrYjOefIgr4723v6dJBnQYcr9gCPMlkPl4TZy+RAQNcbXGCASdIN
         cfeA==
X-Forwarded-Encrypted: i=1; AHgh+Roo5TD2YNw/eBzR5Vv8hZz67I59pcW8IsrHx3jpMsAEAvDRaD7pvVwvAQYf8rTi3UeAYPCVPUZxfKJf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2JjY1/BD9bV2SMmU9FMVom6mWpm3StzQfdnTooPWeUp+cuFyb
	YhL99kPcZgXG8mxjpuXt3fTB6QDdtS/kpJ4jTcTaj2Zm3n+3zf9iiOFtYdKwImB9vrw20oNZZOP
	aFuuZCdgXQL/hIILqN7k9HNpgC3fnlzxWe8kCp7IF79FM8nxLfEJ4UoF3DDGTl7A=
X-Gm-Gg: AfdE7clLkBerLxQAJhmcxRSm96CF9AKmA3sImXFRazrTyIpFB/1AZReQZpIHx8MroRt
	khk7T0n2x5/TZnNkSRWqlId1YsekOEb7aKKir1Lhc4n9YwWigFw+/ucSjHbfVSqpucwpjzyr2qj
	yqIrF/GJQYHyMBDvz505hk+5IZbNAF6IJUgHgvhxlKM1ruv/mkWrp7cPny+GpZWXczputoWRs9M
	WoOgaUbCKG1jUr2Ur6sL1qdSqAqpAcy5FqRFCzJe0tTPCpQ/SHLZHXEmWMikhHKg54+4/doqmpu
	f5ebyjw5va+EO/Dj4pVm7WpWkRsJSDSNLjygxJG4AVzKFpnuZp0wF5nt1VjSsjI=
X-Received: by 2002:a05:690e:454d:20b0:666:3330:3d8f with SMTP id 956f58d0204a3-66652e9dc1emr2462309d50.51.1783173682780;
        Sat, 04 Jul 2026 07:01:22 -0700 (PDT)
X-Received: by 2002:a05:690e:454d:20b0:666:3330:3d8f with SMTP id 956f58d0204a3-66652e9dc1emr2462196d50.51.1783173681958;
        Sat, 04 Jul 2026 07:01:21 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-666408b2d99sm2171811d50.20.2026.07.04.07.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 07:01:21 -0700 (PDT)
Date: Sat, 4 Jul 2026 10:01:19 -0400
From: Jennifer Berringer <jberring@redhat.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3: Add UFS support
Message-ID: <akkSL1nQ5UieqHNs@rhdev>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-3-1a64a3ab128f@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-08-k3-ufs-support-v1-3-1a64a3ab128f@kernel.org>

On Thu, Jul 02, 2026 at 02:31:37AM +0000, Yixun Lan wrote:
> Add UFS Host Controller support for SpacemiT K3 SoC, and enable
> it both on both Pico-ITX and CoM260-IFX boards.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts |  4 ++++
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts   |  4 ++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi           | 13 +++++++++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> index 238bb03d0e9e..b37e1c7b03e3 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> @@ -19,3 +19,7 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  };
> +
> +&ufshc {
> +	status = "okay";
> +};

I believe k3-com260.dtsi would be a more fitting file for this change.
UFS is soldered on the underside of the compute module and not part of
the carrier board.

Because it is next to the microSD card slot, a picture showing both can
be seen in section 5.12 (TF-Card Interface) of the PDF version of the K3
CoM260 User Guide. That picture is notably not visible in the HTML
version.

https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/eco/k3_com260/com260_user_guide.md

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b89c1521e664..f1560a5a9031 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -221,3 +221,7 @@ hub@1 {
>  &usb2_phy {
>  	status = "okay";
>  };
> +
> +&ufshc {
> +	status = "okay";
> +};

Nit: if sorted by label, ufshc would be before usb2_host.

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 19fc9b49668e..6c0b0598d5c8 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1186,5 +1186,18 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,num-sources = <512>;
>  			status = "reserved";
>  		};
> +
> +		ufshc: ufshc@c0e00000 {
> +			compatible = "spacemit,k3-ufshc";
> +			reg = <0x0 0xc0e00000 0x0 0x40000>;
> +			clocks = <&syscon_apmu CLK_APMU_UFS_ACLK>,
> +				 <&syscon_apmu CLK_APMU_UFS_REFCLK>;
> +			clock-names = "aclk", "ref_clk";
> +			resets = <&syscon_apmu RESET_APMU_UFS_ACLK>;
> +			interrupts = <135 IRQ_TYPE_LEVEL_HIGH>;
> +			freq-table-hz = <491520000 491520000 19200000 19200000>;
> +			lanes-per-direction = <2>;
> +			status = "disabled";
> +		};
>  	};
>  };
> 
> -- 
> 2.54.0
> 

Best regards,
Jennifer

