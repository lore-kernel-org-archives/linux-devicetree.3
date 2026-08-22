Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBCF356757
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 12:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787401994; cv=none; b=JGYkw3qm7qGi1zxYuNWhLUN7AjLtU5WHvzpOFYjqrT11ZeUUI7fmMynuo29+WGwyPR1k5V+MZh6w9VDs1BNZ9/npea6PQFyuHUoUNB6Fz/FhsUTnXRYH4U8oByhMYCHmuLZwD8r8uBGyb7NKcxW5/tq75UVQxQDRoBjCOkIxQgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787401994; c=relaxed/simple;
	bh=Uw+TK3EgJNgltpy0OWy0qdquWNHbs0IQEHSfH/QkdGs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUeigO9GJeVonQLXupFlCBEybKF/q82TYIOVNYJeTy8ayJTl9iH6CA+DhG5ccMrXj5fVPQ9mcPmizqP3Msv7xo/yUumOchCmkQCk1uIytUZSleywFzNGcHt30OTX5bVRAnJMU8LCoeM//naAcLlUzifL4QseYzHRVe4/CeFVrU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o22LtE55; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o22LtE55"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca80d708489so1250848a12.1
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787401993; x=1788006793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfHQG1lWh9ZlhxyhVuyS3JBvk/o8rp8H++Qugcq4y9w=;
        b=o22LtE55UdTn0st+ag0i7o8XQWFeteMvYUYQluba1G6qb0atVq2h9+SLPA/vv/Ab5Y
         6RskHT6Yqe8DPkkKgk2N9A+5TPpxQep0a3IE0kOv2oyW8G2tTCdyeQYkb1XfudEf2Phr
         QDrKYD0mMxPEH9UaPHB39v7HDdAMNOBc8byNjn7z46V1msPC5GrhlB4iasL43lFlqu46
         4RkVKbIZo5aHwoGw/Ak82KzdUxhHZt+47qs06StyVauU8NqIYRcx0JPL92tPdM25etif
         swK9vfS1qKenh4xiLUALsn1FteekN1605aQhMJ0EYlOR7p213sn84W1IG1icIOq7moSo
         UICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401993; x=1788006793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfHQG1lWh9ZlhxyhVuyS3JBvk/o8rp8H++Qugcq4y9w=;
        b=bzliBcAg/zFcG/m4JxFfZlsitgEtnW/aA7VOPW6QdeDAnvlf9DkWuN0GagRpFkPXsj
         GK0WygkeY5Dy+qq/eIMREOTmy9cSSGZ7vmz+PxgWDvf/rzfXthC7HHxL0DIcJnWQ+LzP
         IF9pcSdpUfRNyLrtepSzLtD7hGDxeWAsSk4ySZkKrZRF12bPoeT0vbcnnN5XsL209EJB
         tsZLHiaVF49UCu7Xj7QNQS0C8yvo2pB9AZ/pUhP/PGThW6HEp08NEWVL3mTQlsWuxhK0
         tf+G5/VN5AWnwAKtKsNyn9eUM9OIr2APIa90//Lwwvy3daB0Tv2XhYSk7vN3x8NMcfVk
         AIIA==
X-Forwarded-Encrypted: i=1; AHgh+RrM30nVofzyz1Gl7OJJmKz7oLNATN20j4RaR2LVDu0rxc4SLVXutlJTdJBnQ3NkrEewfflvALm8sN0m@vger.kernel.org
X-Gm-Message-State: AFuF++kGfmCMpSZOCIAMtfIFczLYg+C61MrfLoy3uz94kJ9zWqnoNzXZ
	oBrm07f4kFWCPcWxHL40qe1tQptUi5pWZXM08XfhgJvFQdkeZE/WBqlq
X-Gm-Gg: AR+sD12AdmmEl+JhICAPDMCYzj4ouevf1orP8Py7SuMFfJx7cf2ALN/yg6yKrTrLNnQ
	AdpEIjFPJuOHdVyRWetC9ZTBFnNP5CQfHyAyaCKAQuYvQTNfXa+M903ptQfOKtpdzs4n3PO++bf
	hZlO773Z2t5ZsXDiZVmCnD5zm79T+3k87wjJUZ61AvXUMWT99nvIxp6RIN8q3lWXN3pdrWTLVFo
	yqeI/TXvv2g5vh7OTESFtV3YE/wflcF1FQ90tHJ4mMC/XU23cOS2DCtiozWwMwObEzU56Q1mn3d
	0uPbFK2uSoFdcfL+I/ykbWaHTgCd4zPenrE9QQHmGsGC0D8VzW1+HYb3d6XJ3WgWwZ3J21Ncetg
	EFcr+MuXClZBbSkvduIKVBHIUG+9XVdvSJJXu0Kek3MET7bVn9cnGkYC1ipTpzw+RJ8CRed5tc3
	5lQdMEtHoZk+3CHemkN5QbND0Dh8bte1M8rhr/KH9RImD0c3stJfZSlUkvku0=
X-Received: by 2002:a17:90b:268b:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-395c4528324mr11764124a91.0.1787401992755;
        Sat, 22 Aug 2026 05:33:12 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af6e88sm2619008a91.9.2026.08.22.05.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 05:33:12 -0700 (PDT)
Date: Sat, 22 Aug 2026 20:33:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Message-ID: <aomWjQGk_p84pPD2@inochi.infowork>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
 <20260819162115.2252812-2-aurelien@aurel32.net>
 <aokGbT7XTCbxUQzl@inochi.infowork>
 <aolt6CaL9b6p8A8V@aurel32.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aolt6CaL9b6p8A8V@aurel32.net>

On Sat, Aug 22, 2026 at 11:37:44AM +0200, Aurelien Jarno wrote:
> On 2026-08-22 10:17, Inochi Amaoto wrote:
> > On Wed, Aug 19, 2026 at 06:15:42PM +0200, Aurelien Jarno wrote:
> > > On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
> > > either be used for PCIe or USB3, depending on its configuration
> > > (spacemit,apmu). This configuration is defined at the board level, and
> > > assigning a phy line to a USB3 controller while it is configured as PCIe
> > > results in an "Invalid PHY mode" error.
> > > 
> > > Move the USB3 phy at the board level, the as it is done for the
> > > submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
> > > there is one phy per USB controller.
> > > 
> > > [1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/
> > > 
> > > Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
> > > Cc: Inochi Amaoto <inochiama@gmail.com>
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
> > >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
> > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > index b084a35aa00e..171bd2f40aa6 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > @@ -328,5 +328,8 @@ &usb3d_u2phy {
> > >  };
> > >  
> > >  &usb3d {
> > > +	phys = <&usb3d_u2phy>,
> > > +	       <&combophy 4 PHY_TYPE_USB3>;
> > > +	phy-names = "usb2-phy", "usb3-phy";
> > >  	status = "okay";
> > >  };
> > > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > index c3f2dce0969c..3e24054d2084 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > @@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
> > >  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
> > >  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
> > >  			reset-names = "ahb", "vcc", "phy";
> > 
> > > -			phys = <&usb3d_u2phy>,
> > > -			       <&combophy 4 PHY_TYPE_USB3>;
> > > -			phy-names = "usb2-phy", "usb3-phy";
> > > +			phys = <&usb3d_u2phy>;
> > > +			phy-names = "usb2-phy";
> > 
> > I suggest removing this completely as we can not determine the
> > phy we used. I think it is suitable for setting this in board
> > file only
> 
> Yes, moving all the phy definition to the board level is an option. I 
> decided to keep the USB2 phy at the SoC level, because contrary to the 
> USB3 phys, there is a one to one mapping between the controller and the 
> phy. Do you think it is a wrong assumption?
> 

By default, I prefer to make the forgotten thing as an error in
validation for any flexible field. If you leave the default value,
the forgotten field will lead to a downgrade hardware (or maybe
broken hardware). So I prefer to remove this rather than give a
default value.

Regards,
Inochi
