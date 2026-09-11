Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421E447206E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118514; cv=none; b=qN0qwuI3OB1rqP6e6iAyqwBM+oN/BFWNFxfGyKd/BaoZ/I++YsqP/6cWDxzohTblri035GDqcc+Lqn47+PX1YHKpVp5CCgQLxbw9TNJOC3OwsKr0WPls5CgAMYhHghnSfINXrC45Q5/TksU1jjahTP9iE/WLIIpFpGiie+K3bcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118514; c=relaxed/simple;
	bh=nx6brTotxarlxTZrGM+Fj6R79ny/7KUfFRF6bSnhWUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akYd1CBe1D/w1TgxlQ7D/t7pd+G4FA2mvDFdlqgMoyfv0UaCvNWp+XMP6mLu40slOm97k4WmVxXX5BbD1HhcPI4flkVZtaeaBTyxKJruZ/45tPt3yIpR5ZIQmodo68CE2UVjf6yhrHzlzn19O7dtBhPzJ3qO6IxGHRLfMStx3RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=uCnD4yBP; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="uCnD4yBP"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso1135435a12.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789118511; x=1789723311; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjVFnBxEO1MLoXcvfbS05AZY/4o4gvi/RgLwD+0L4C4=;
        b=uCnD4yBPENwlDoFVvZs5DfJMwodtdtejoKR3G+LAtziHYvqPJOSkHtEsZcs0qW72wU
         2lFKUtFuraaNNsXxqn+8Rutp7Ogc8N6knq9S8WMlFSWWWkW0cixfJxMVCswbfR2H8bfg
         jCmgHIW+4PjUWW35I61xEoT1pV81DjNca/r2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118511; x=1789723311;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GjVFnBxEO1MLoXcvfbS05AZY/4o4gvi/RgLwD+0L4C4=;
        b=kd94W4CdFtpwmbGCeNDWK/oUMYvtPgb3Mehp1M9Fgvh5oxA53CW2MvmCLIPkCd9+QZ
         UwLd0gXq3CjVVfYqmoUFM9f30sJXbqKmMvxqcSSeH3JYcfsy3s4j7BYYEdOKGgoQo79B
         QmS+0a1+H1yNZJsfLMF7y9dtM1QnUZA4wCVMePiGioLuv+4dI4dchttW15VmqbjjSI5/
         qilguBxewqh6ADZ7Qq59P4eAA1niglAmgq/QTUGWtodPU50AgJPSBaMwLtQKlPMkq9tc
         doKv7MVsulNF/XYfBJuNmKjZHkR3Y8A+djCmL+nMOB21eu8qz9E5E01W34ltTsCT1xS2
         R3dg==
X-Forwarded-Encrypted: i=1; AKwUvByMASyk3cAEf7xQpoyQPXrB3Ie7BI8+pfE92w63ubpBQHSEZlYDJG70n6q8QrlIPv/qrehg7d9YVrVA@vger.kernel.org
X-Gm-Message-State: AFuF++nnrufFjkEBLOPSIzfleOD5/9cruQkbSrjEONm07Mean5PjgOf5
	x65o9CeDGao4JVu7XWu0YlSq+pO8VGU6K+nIc4wxsQnjJ1qwg7p+ltxwrM85PUH3kJym9OJUdWC
	TXZ/d94U=
X-Gm-Gg: AYBFou28ZFgiUWmkEB2knWIi8wf+0EpuDwOmzTglop+WCoFEw7Km+zfzycclSjU6PdA
	ekBBa+EomJPfhsUjUc12v0gQhMgqobFAWIpnSHbOxIdFXqGYHucevnJ6ww/YD1P4Qvfi119JChC
	/95KrzQ/i7xuCP2eeG6QSaxwTHxElTiTqLsKwHHnEk/ATAHN36VfzLiZ2vkn2Y6koxCHxj5jMQO
	9aEYqzol7C5ha3Jj+xB+MOCYxCLiCG4YyE0quO9GceOq2yhAWYcHbqaJppkivult+s3utP/WGf9
	6k6IdSnbChDOhXJGOjF8rK0jzP2b/Y9dMsFD7SLHIGeBHQaJCpfruWT3VatIsCn+2YpqroVXJ84
	guKeTqBCSL64AlKxytFuZwZJZL3VQSTMcV5cun1FxXu92q8OTzVYxffkRyDG/UlbyZDyXf1Dfue
	1OccI9KChfnQYIa7nzFYws5xwzqDekuU/dBlGJQTDTnqH0NP9nyRJngtdwYY/VuhaaQc0t1oRvl
	wI+Hyj7MBoXkW3p
X-Received: by 2002:a05:6402:21cd:b0:6a5:d8f0:dc12 with SMTP id 4fb4d7f45d1cf-6a9b56254e0mr1186463a12.14.1789118510967;
        Fri, 11 Sep 2026 02:21:50 -0700 (PDT)
Received: from carbon.k.g ([85.187.61.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5912644sm576837a12.11.2026.09.11.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:21:50 -0700 (PDT)
Date: Fri, 11 Sep 2026 12:21:49 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 0/3] ARM: dts: draeger: Add socfpga devicetree for
 Draeger's M48 board.
Message-ID: <20260911092149.GD722@carbon.k.g>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <c78630cb-999e-4825-833f-3e184ed98573@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c78630cb-999e-4825-833f-3e184ed98573@kernel.org>

On 26-09-09 08:27:22, Dinh Nguyen wrote:
> Hi Petko,
> 
> On 9/9/26 06:15, Petko Manolov wrote:
> > Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
> > SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
> > carrier and they are cross-monitoring each other.
> > 
> > This is the SoCFPGA devicetree part.
> > 
> > Changes in v3:
> > 
> >    - add Draeger AG in devicetree/bindings/vendor-prefixes.yaml
> >    - separate binding changes from the actual devicetree patch
> >    - remove "earlyprintk" from the boot arguments
> > 
> > Petko Manolov (3):
> >    Add Draeger AG as a vendor
> >    Add Draeger's M48 board to the SoCFPGA family.
> >    Add socfpga devicetree for Draeger's M48 board.
> > 
> >   .../devicetree/bindings/arm/altera.yaml       |   1 +
> >   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >   arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
> >   .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 129 ++++++++++++++++++
> >   4 files changed, 133 insertions(+)
> >   create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> > 
> 
> Please look up what a commit header and message should look like for these
> patches. For example:
> 
> patch 1/3 should look something like this:
> 
> dt-bindings: vendor-prefixes: add Draeger AG
> 
> Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>

That was really dump omission on my part, sorry.  Will be fixed.

> You should look what the formatting of the commit header and message look like
> for the subsystem you're submitting patches to.
> 
> All of your patches are missing the appropriate formatting.

Could you please specify.  I've run all of them through checkpatch.pl.  Maybe
i'm missing something else?


		Petko
