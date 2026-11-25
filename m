Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596557;
	b=E+i8/0r7Qf9TgxdfjcGk5MtjsC5dnpuQqGCOyL5InHLj/tFgmxCRgclxC3JvKGhUu6fc
	 MSU3dt/imF9JaIau/drLccrlviNVpwlzi7s3Qnyhe3218jRHEMAluFuy3aWheLQW8lIqv
	 WaQQsZER+X+OVoV7MT2JmGDER+OsLZ7qhgp3wthWurgGclPE0B6bhWL33sipsr61qGDf1
	 6g6YnXlAdoXZ6EPFJFHFORR78NpR3pegwKTa3RDEEf1KKc7VG2k2gvtPDrn5GAn/v0zJM
	 IdU17en9ptYO33POSRn5wEW3teibbVs5aL9U3smkgxeJQYG6vYOF78kF4d3nKRUftGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
	b=iDWAkpAG8Ci8Z9c7dZwk9eTtcnaTIqzJFNCEwdlWdVefUDkh0ip7Mc6uEe1L/Hc4AwAx
	 4utte01Xph3Wh580L9GHrq0WHKG5OHHgazDFenvNFhfIzJ8U+88aHAXo08D9vNILkgo5V
	 6HprHjLmtiPtBI6JzSw2iNyPWZGOYeYqatgW0evlvO4R0rZaxi3t4IeN0getpOHDKWeWA
	 Dd0j4NGH6EH7yJ5z0aJonSUDg5LlYTsMcl6NqIQH4ejkNJuV0E0j1Y8lFuHEoyfmI9PD/
	 TkZn3aW/RaIHDaDNrDR7gShOgqu2PpZmQvvP0FGlyT9QUUcOC5rkx6zUmL/2aM+sx1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXqgEe8n;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D7B606A32A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D7B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXqgEe8n
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so2309213a12.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596556; x=1796201356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
        b=jXqgEe8n7GRZ6iLldGmsCNSv2Ci33Gbuvw+WbH0lu+XI6GPJBJ468XB97/fH/B5E0J
         2eqKGJ2+yZGmfKtcR8B5bm/qAeSDM9a+PQ/r5STC+i1LWnJnj3vMx2rfae9TmFwctlxO
         tMlS8tUarkhm7xp89FBaobYitMGNpWX3majq98MDENkx5ZzYkKs+IMxMqidarlEAH896
         mWabDnD+x03m5oCmiV3zr6vJ5MLe0i75risLoplL6/LP3BVVnPKoy/kx3wDs9sBoId68
         KRafSVDxnQAZoZ5DRW38xZNCiuWzLwf9Gc+y9+8tU1cCzH/HaCV9vZKvg8FF6HgEN9/D
         /jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596556; x=1796201356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
        b=wraqSuJkqTvti9WlgtvgjNV6Bc8XDS9FZ2PtK6pYXRVeaeP6wqF9v/+POrFBrR2p9e
         ceXK89IM48Brky6OuHQ/SkuEl9gB6PjkSJHUyJ94/0QcfdRkbxmjycyJf6xBKXAImQ9U
         q6IPcl6hKMLnvzBDqIJ6ZjIEggvREg9mn0Pi/TFtiIPu35DvgfaywlmNe5blqiLj/Aju
         VyHsYDaGli1zEG6f1/HHhuyOHbyTnKwVZeuRS7/BYb2MSkRvdKUb8aCgn28wgbqTPwC9
         SamNGT7H/ICshY5eohV20uDOqHqDqoTQi/+sjnN2oTfsYQLbjqTY5NzcXxUkQTOXqZcK
         w8Ag==
X-Forwarded-Encrypted: i=1; AL+hErH00yUhKIzADkVrTj3MXc+5Re7Yb9Rm7EFAOtjRq5zM+YJOw4LfI3RBtmAD0aV695bjibRT2xOQ749S@vger.kernel.org
X-Gm-Message-State: APuU4Z/ztMiPANlZPROmr7ZKxj8d/G5FYCqmZLnn+9Hb7zW07P3FHiWF
	ehK9QvItYbBdKzMGGrOhg+7c+Y/EcsC3Ylp23rPSR8xZRp7ZNswRdyGy
X-Gm-Gg: AZFdTZeYI4qKirw6cCb5bqulsOw7LI6xkxFT/RhIlBCcoalLseQjcTPqsC+xnAPYnzq
	EfIjsbZx4r/AvqZCrXUWJJceORQTfZhg6kl8dMhn4uWeCFQTr1QfT1zRVQ8W9aRCvcgzxC5MOgj
	AtlM9QMrHskbmL5k/kaPnXw91hrzeqsm15nQFEfXqQ9cq/eC0JD41AcNVta7O1YDGYNGerPAI6E
	WD/vtFm2Qp4MkjWz/rzw65zZoykYVvpwgyza4I92tkhLviaiLEp9tt64rODWtbgXqS+E6tWDmCj
	ZpY7Cvy8zUTXCWqyDvdB6KbqEtcMBzTfQpJjFVNjOQcJsTOcuw8Shq2q0szJOc0dQQYJ+jLuuK1
	dnaYWJ+hpZ8HrG/3PmzAStxR4f4rZCLktIT6rl5QjomVTFqL76x/YeH2yViL15IPkPbB8eM/tIv
	pfCETLCn5bDPd57ejkGImC0XRQ+FBt2LcF9xsuUThn1+T5Xaa9UkZVZ1TQeqt0MfByWUV2Gk656
	SBDF5wl/U2VSkrFB7GkKxuG8/34/fdOVKbmcW3MEYZv/pDOyyBkY9MJ7KPmBRclK9wCKqhzOxdD
	NOshZcGEpFTdEKFjIdx1WSWpnw==
X-Received: by 2002:a17:90b:4d10:b0:3b3:ce10:7659 with SMTP id 98e67ed59e1d1-3b41c7ac261mr16316108a91.5.1795596556346;
        Wed, 25 Nov 2026 00:49:16 -0800 (PST)
Received: from duge-G3-3500 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm28307740a91.3.2026.11.25.00.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:49:15 -0800 (PST)
Date: Wed, 25 Nov 2026 16:49:07 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add K3 eFuse and
 temperature trim cells
Message-ID: <sifzfexbsbd2byrpynbv42habxgbrxgndaxqhsjgppyipfuivp@qvawoamxksfu>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-4-duge1256@gmail.com>
 <awYIF2ynf95-g5-W@aurel32.net>
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
In-Reply-To: <awYIF2ynf95-g5-W@aurel32.net>

On Tue, Nov 24, 2026 at 10:56:39PM +0100, Aurelien Jarno wrote:
> Hi Jiayu,
> 
> On 2026-11-23 01:38, Jiayu Du wrote:
> > Add the K3 eFuse controller and NVMEM cells for the temperature
> > calibration data in bank 0 and bank 7.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index e89d2cc5ca8c..af1a758788ff 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
> >  
> >  		/* sec_i2c3: 0xf0614000, not available from Linux */
> >  
> > +		efuse: efuse@f0702800 {
> > +			compatible = "spacemit,k3-efuse";
> > +			reg = <0x0 0xf0702800 0x0 0x400>;
> > +			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
> > +			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
> > +
> > +			nvmem-layout {
> > +				compatible = "fixed-layout";
> > +				#address-cells = <1>;
> > +				#size-cells = <1>;
> > +
> > +				soc_rtemp_trim1: temperature-trim@1c {
> > +					reg = <0x1c 0x1>;
> > +					bits = <0 8>;
> > +				};
> > +
> > +				soc_rtemp_trim: temperature-trim@ea {
> > +					reg = <0xea 0x2>;
> > +					bits = <4 8>;
> > +				};
> > +			};
> > +		};
> > +
> >  		mimsic: interrupt-controller@f1000000 {
> >  			compatible = "spacemit,k3-imsics", "riscv,imsics";
> >  			reg = <0x0 0xf1000000 0x0 0x10000>;
> 
> This looks all good to me. The offset and bits matches what is in the 
> vendor driver (after mapping each bank to the correct address).
> 
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> 

Hi Aurelien,

Thanks for reviewing and testing. I'll include your tags in v4.

> Small nitpick, no need to fix it, but the vendor device tree also define 
> offsets for soc_die_id, soc_ver_id, soc_pack_id, soc_chip_id and 
> soc_svt_dro data. It might be useful to export (some of) them.

The downstream socinfo driver uses these cells. If I work on
upstream socinfo support, I'll add the relevant cells then.

Best regards,
Jiayu Du

