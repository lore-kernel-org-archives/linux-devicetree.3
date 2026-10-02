Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1432833F5B6
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954623; cv=none; b=gtVJp9HHqjeH5pUvkKP1qOtc1iYDnzv3+OW5vdDHSUHMJRKGGpNGHpW/Hb1Hmr9JslCOh0xSelBWKqDZW7H+SEltyMKsu5bWqFSzqyldEWEGbugiv0NoBjrQN+doH+UPvhZq4hO5Y8CMPkXeOK1eByurceOfvyqQHRLSdkPZSls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954623; c=relaxed/simple;
	bh=XtkYZYhVKl065Dt/k2DRdL7kw9MBNl5/6dckn+afPxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RutFiGdbvYTDYzxkvi54RcfrDStoCTdBcZCbR9AWyyoZmGQpMdGnmjlO1xTfufPN9EKzTJ5c/8MBIB6A0ElX/+qrvZZVvbvmi5YDKqq5cnBWN6FDJWNmtgxGMlH2viXrMh5iEO5BR+jgov69Qt/C2Z4DN+REcnr7PWuy5RibAa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a691xB4d; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kJ/zmQXL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a691xB4d";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kJ/zmQXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790954621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iVjH0D2jt0kRvnH6DkUbM3A4qPDRx66aQ27YIk5b7Y4=;
	b=a691xB4ddkHHoeeItF1tespNc5rc3EoKp+JvgoQDlJluXtrr1kAX/6VLYRfbS6s8DemVGX
	9mJxdZl3EAGdT47psa0Fj4YkvfeqJzNCRuphegRPAx5PzaXFcuZdGDNJRmbDBQ0w9aLAj/
	FdoJwSaI1c9X7EdUNdUDaFnv8rb48ag=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-TPi69YHTPy-9Jg_7fIYWeQ-1; Fri, 02 Oct 2026 11:23:39 -0400
X-MC-Unique: TPi69YHTPy-9Jg_7fIYWeQ-1
X-Mimecast-MFC-AGG-ID: TPi69YHTPy-9Jg_7fIYWeQ_1790954619
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so332207685a.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790954619; x=1791559419; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iVjH0D2jt0kRvnH6DkUbM3A4qPDRx66aQ27YIk5b7Y4=;
        b=kJ/zmQXL2LArzSSr7wKs8rtTIXCDxzzDfSUy59mvdqBFJheFUL0jZuT22ZriJk58NJ
         rf8eIKLzp1mDeqxx4UtbxCShT9B9/ktJYWPmzFR8f+DLoqNOWBDJB0VnuP9ZMUd1T90z
         1r7q0t7qv9aXcAZYDxymqDF1ExpsP4gOb1ko8cwXvzBM/ms+CaHDbnCXQQIvH1nB+fHv
         Rz8BXOzi6oIbiSL+Gx7ZPPVmyrrNzXZbpuwbpUvEPS+QQlEZovyU5KBYpx5xSInQk6w9
         SbUiFqnArWOpZdclWlEo9guJPVdq/z9rE/D95DvEmL9syXQWvOc0p9Q4LQyPMCJld7+G
         5WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954619; x=1791559419;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVjH0D2jt0kRvnH6DkUbM3A4qPDRx66aQ27YIk5b7Y4=;
        b=Y2MjY7p3oINt0LdMUUMpFy5HX+1hYzTnJEPFylEyWcr6cj2G3Cz+08sqjP8if5ExYR
         B06Q4p/gWjmKMqTYNFgYULQ66VFT1NNBIfBPoLZ9dm7yRo7iR6NAg8wEPhdO846ztsAb
         ytDbGha0mAChwvDtoQmMxpwNxGvQXLZYtVYk1NLFLpAtwOxSNPvcVocSPTrPeLpAYIGM
         K4GlmQo4cCqmECgdLRaQP5Zw+1jDsrgb1lO5/+8+ON8f6nk9kvUbmhXhX0NM7+0xCt0q
         Xq/shjYwzZzLJj/0kBmTuMzrnfi0r+kUr9yh3adb2rRRqQV/tNxDk+QwkxEMHBYa7ROA
         v3ag==
X-Forwarded-Encrypted: i=1; AKwUvBwSYmki4+oeEvaWfL5wjSvOyDOu70sM3YC67K9drj8z4qppgq+WagXRyvegzIU2d/271DgYXkauQVo8@vger.kernel.org
X-Gm-Message-State: AFuF++m+3ohlBXUVgQCoB6COQi5Yp+49/oKdPZkfVA7Oqx9HwgYPjsAD
	hwEJBQmYHIU4F2ko1MgOwlXTyqN6NoclhJYWi3BMLDd3/Kp9SFlIOWXoZlJAYa/L31dx5C4p5/z
	eiuLVKcSlqxCbiCiEMRbyJmtCbVldd5LA9iGS2osbne17N9lvB8vZ6Kee+AW+QTM=
X-Gm-Gg: AYBFou0hcETlZzb+Kk9OJxpbrGZjkilHC62kIKn58jAv5w3zukTmV9jXYTcz+BMtXXG
	tYWAuJwZuWVlQk/pMvRBcSGr42KNpxVcsQ0v+W4fZe2iDxkJzidXHEi7kr7YgR+SaG4VSMq1uzt
	4KVH9ZIE3K0MnLWLxY9tYY29EqB9DG6D+7aRioHFKCzJrYjkpX6foivH/+6gS8Lao1gx5l2q1j8
	EcbUnODaV+yzZAtCfYS3viajdLw7vEAtacT/Ye1zDYNj74MDR+NbiBKuAaaWABJjqkAw40ZWgB8
	zfiExVOEnk3LD7rX9O5JDPdyXSMMjfX6QLTkvIf0OqXqkBxB4srQWato2BY5pH1Rs07Tq4nv/HX
	xXn/tr6SMJSeEwnWlox+7CuzpeR0I8h/CKzk=
X-Received: by 2002:a05:620a:480a:b0:93a:d67:9ab0 with SMTP id af79cd13be357-93ce7a85665mr565820485a.4.1790954619234;
        Fri, 02 Oct 2026 08:23:39 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:d67:9ab0 with SMTP id af79cd13be357-93ce7a85665mr565813085a.4.1790954618588;
        Fri, 02 Oct 2026 08:23:38 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2ec917sm242866585a.46.2026.10.02.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:23:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:23:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <ar_MdxhafYCvqci_@redhat.com>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
 <20261002-dr1v90-cru-dt-fix-v1-2-c3e0b5d4c30d@pigmoral.tech>
 <20261002-manpower-croon-26d578f57143@wendy>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-manpower-croon-26d578f57143@wendy>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Conor,

On Fri, Oct 02, 2026 at 08:09:08AM +0100, Conor Dooley wrote:
> On Fri, Oct 02, 2026 at 02:07:01PM +0800, Junhui Liu wrote:
> > The external CAN and watchdog clock inputs are not routed on the MLKPAI
> > FS01, the only board currently supported. Drop the two fixed-clock
> > placeholders from the common dtsi, as fixed clocks require a valid
> > clock-frequency property.
> > 
> > Both clock muxes select their internal parent clocks after reset, so
> > the CRU operates correctly without the external inputs. Keep only the
> > required oscillator input to the CRU.
> > 
> > A board using these external clocks should define them in its own
> > board-level dts and override the clocks and clock-names properties of
> > the CRU node.
> > 
> > Reported-by: Yixun Lan <dlan@kernel.org>
> > Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1V90")
> 
> Uh, why is this in linux next?
> 
> Brian, please don't apply dts patches to the clock (or any other) driver
> tree in the future.

OK, sorry. I just checked clk-next and this is the only dts that I
applied. I'll rebase clk-next and drop this so that the tree only
contains the drivers.

Brian

> 
> Patch itself makes total sense,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> and because it's easier
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> > ---
> >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 16 ++--------------
> >  1 file changed, 2 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> > index 574c6608aef0..fe85d01563ad 100644
> > --- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> > +++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> > @@ -44,23 +44,11 @@ cpu0_intc: interrupt-controller {
> >  	};
> >  
> >  	clocks {
> > -		can_ext: clock-ext-can {
> > -			compatible = "fixed-clock";
> > -			clock-output-names = "can_ext";
> > -			#clock-cells = <0>;
> > -		};
> > -
> >  		osc: clock-osc {
> >  			compatible = "fixed-clock";
> >  			clock-output-names = "osc";
> >  			#clock-cells = <0>;
> >  		};
> > -
> > -		wdt_ext: clock-ext-wdt {
> > -			compatible = "fixed-clock";
> > -			clock-output-names = "wdt_ext";
> > -			#clock-cells = <0>;
> > -		};
> >  	};
> >  
> >  	soc {
> > @@ -128,8 +116,8 @@ uart1: serial@f8401000 {
> >  		cru: clock-controller@f8801000 {
> >  			compatible = "anlogic,dr1v90-cru";
> >  			reg = <0x0 0xf8801000 0 0x400>;
> > -			clocks = <&osc>, <&can_ext>, <&wdt_ext>;
> > -			clock-names = "osc", "can_ext", "wdt_ext";
> > +			clocks = <&osc>;
> > +			clock-names = "osc";
> >  			#clock-cells = <1>;
> >  			#reset-cells = <1>;
> >  		};
> > 
> > -- 
> > 2.55.0
> > 


