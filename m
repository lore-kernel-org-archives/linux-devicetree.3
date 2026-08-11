Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0929B43B6D2
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440729; cv=none; b=Ec+lUCB1oZqI9MrlT+qOtKaBwHzGMViNC942acUTvrXTSkt1ruyGXkGaYp9p8CnlAozv6ZCDSbqa9SqanKt1/APKkcE2RuLJq7kvoDFjkuiQs3/ff8fiTRtO1A6Sebv2eCIqewNzWNBu/RwAMSnkrpog3E3FTLYcAUOz0W5hJog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440729; c=relaxed/simple;
	bh=HCo5rSbEvOu2viOHidCQ8HRW4Qctda5+Ow5PlKO9n4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5sx3xEN8qDK31OW3oncLpDW5IwvTjSbE2ZkRZ0PS2wR7B/emDp+cKdrAmxMtAi70tb/4pit/vtyHInHh/VcAzpdTm1hxc6uoxDTc7EGn2BNyH6oILHJpXqNSWNdBqISMHbtBhvJ9HscCJcDEwzmIsam0rxmzmWo/3ZLgi1O1Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=HHY8AVKh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HHY8AVKh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caced6038eso9404745ad.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786440727; x=1787045527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ap29SzIYC2SRhT7+1cYIYqMqPmmcLkWivyt8GCYG80w=;
        b=HHY8AVKhv2PnMrg/d0HomC91JhO2S5sry0b29N0/x7gvzgPRAyvne/eiYAnrWRs15J
         Izn72VKWjoXCuFsXskZwZxKw+j0irbwfCO5gldJZScaEOTA2D5GoLDyaD/cTGyPGGN3o
         dSKVf2EpQXvDusQZZwXR/AwZj50KRcW3LefmDZMuSuiofAsjkkT4sCQMEm+l/A5yMiBt
         IBPtRndpikWyuryPi5FyfdRD8KQXMDcB6DUPn4ZIl/ZAgCOiC0DaykiuR1jYOvArLaZx
         F9cxYc25/12Da7RMJwBXB2yINU+0osEVjjla/VLI8uEAqyXTAg4u7/mZ0AUidwC5NPCz
         RSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440727; x=1787045527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ap29SzIYC2SRhT7+1cYIYqMqPmmcLkWivyt8GCYG80w=;
        b=XHCqdE64OEzKCNJ8RVF4gXBGWbp15cuwjaur9rcpV+5WIZKhKKrQtOjGTEPfqMphlP
         xNwEkOY5gd4RA+m9bwnhL7tbZsmu8kw43i9X0Wy2RXt2C+Sjhe72FNWLeHL++3CEMJ5L
         tlLH9c7BQjdwXihpsUM6snmj1DXPGaS6WLb0PdfjlfTTQtTzrsqW+ct+gA5gkE9tHgp5
         P/nCiCLUQVWdN64zNrd4+GNQ30nJ7S8AgcoLa5PE37mgZe6XRWHA+2r7/0SZQMXpR7XG
         ApS/UDEoJTMbl6eDJ1g++yRgU0BjRYx5S/kzk8apEYuLaKEZLYjq4Niv02GtvBuWekDt
         rl7A==
X-Gm-Message-State: AOJu0YxSpQTdIHP1+g9SZ8pmTpZaOtqxq9UIREuOllmMl0T2O7cyhM2A
	MYNGCfK8uydv4dlgic5VHrXZYXyPmkFPtjtPz3FJufxLxbq1qCtJ3AAS+aq4oTB3VaI=
X-Gm-Gg: AR+sD13Utl8qK7zGPvhXDxkuBMZlsfAiNX7+jZJaRfMdRD10q2YQuNwze67xDUSaqEY
	Gpj7wNSqQmQWd4anLSbwe7+g7dPFbnw+XWA+1/9RZCGU4ZT0kdWhb2ol9h4oTl3l4WG3UC6URn6
	0XDlQl3iiUG43gA0pH9MShVIiLhtU5yaoEyLH4YcmrGU+qpK84tjWEBNMugSp2WYP8yW5FdMroc
	htE3CMqhCBRQeD7JqGFW7UkSkezL1PBVFMT0VZ7wvCT3fs5/ywLJbBh++Raw5mzNz3jtXLH7ulf
	rHPnR9YiNEqgVrqGWHc35Rn733l32mGcIZ+9moWTPGzuBW8yONc0nPkJGMq8iPHi7ARXk8HXKgX
	Xs/DycmjuuRQMkAJSY+hxhkT7esPIwDH5hEK2rOlltdA9FoTFwBkCK1/TSHQfrQoxytnBzA6Wbt
	F2RCxx/2XyWpV6LBiSefwFt55E7eZUHQ8pQomjpFIoR3nt5ny0D5tACCyQywk=
X-Received: by 2002:a17:903:2410:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d3187acb9emr19605805ad.6.1786440727293;
        Tue, 11 Aug 2026 02:32:07 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f29afdsm4693525ad.19.2026.08.11.02.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:32:06 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:31:56 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, dfustini@oss.tenstorrent.com, michal.simek@amd.com,
	junhui.liu@pigmoral.tech, darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org, zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com, pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com, jim.shu@sifive.com, zong.li@sifive.com,
	greentime.hu@sifive.com, robin.randhawa@sifive.com,
	scott@riscstar.com, dave.patel@riscstar.com,
	raymond.mao@riscstar.com, anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Message-ID: <anrsDDkkOKmnkzAa@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-3-peter.lin@sifive.com>
 <20260730-glossy-pompous-quokka-c05c60@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-glossy-pompous-quokka-c05c60@quoll>

Hi Krzysztof,

On Thu, Jul 30, 2026 at 09:30:24AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 30, 2026 at 12:39:07AM +0800, Yu-Chien Peter Lin wrote:
> > +  riscv,pmlwidlist:
> > +    $ref: /schemas/types.yaml#/definitions/uint64
> > +    description:
> > +      Optional bitmask of WIDs available for S-mode and U-mode use on this hart; each
> > +      set bit N indicates WID N is available. Firmware may read this to select platform
> > +      authorized WIDs for lower-privilege modes.
> >    # RISC-V has multiple properties for cache op block sizes as the sizes
> >    # differ between individual CBO extensions
> >    cache-op-block-size: false
> > diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > new file mode 100644
> > index 000000000000..cc8b3747591e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

The only issue I got is:

WARNING: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Clause)
#114: FILE: Documentation/devicetree/bindings/riscv/worlds.yaml:1:
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)

Hope I am not missing other warnings or errors.

Thanks,
Peter Lin
