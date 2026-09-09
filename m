Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37522560ABB
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972843; cv=none; b=eLigjI3h9KaFXR+d3dV9aNUxI6NDlio7u9qaHr/AxRMwTyislnPtDDxRXPXoA53Ii5NjA0nU0qN5M7aoe6RHMGGTAsw8COozrPwOrxYxyLazw4BRPiVyIfVtYRWNGO43DnOnM0b3ZY3JYzawsyljJvZazv+DQQN0oIAydm8wGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972843; c=relaxed/simple;
	bh=eauFQLgabZtW6CryQKK8wac9Zt0p8FwVwlD3d0EZHNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCCzJMTGjN/qULzs4RocpfreG3NiT1H/lwUXyImXcbQk/E9EofzTd4saIk0BaXzPSOJX1KmcJqdgaExhS8tA73dU/4wiu5cxif3wwJQUx0OPmS9dxEeNC3unQJuhfoaDJp+DSjtnY7ehVEckPRMvM64yC4fDRIasyOwH7VRVDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VE4ujsYo; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VE4ujsYo"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso389190a12.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 09:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788972841; x=1789577641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ciwSeHWBadqQx6YZVRZm2djgvhH+b+XMn6UtqaKUvdE=;
        b=VE4ujsYohOTmfMtMrWp0KY3Z8SppqwH+pM5OONZ4J0E0LgVFf13ex1LrcYkP+1Y37/
         +BYu/7nqKJIlnK2zwcQWGnEuL1MVsawvRNT1nf2+Jk11IEXmUvKVyKWt3+xxAsGCcsyE
         m/wmk9z9Plj5DUcusRtzOhGKGIixOfiXaSgiGznyrg/bWPW4xDJJxOMvgoB8jHn4uGVC
         P6/0iSUeSZZCpQbm3WElIg4QqVGVTYZ2t0s+HYpKQsnCUpbsr88k52iLnrkzRR6UxgtF
         WTaeELDDD6WcRbGZLubK/y94vKc8sc6NVaKYhVcFsKH8XquauAPI2oOBGK/LS+nFV29Q
         +PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788972841; x=1789577641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciwSeHWBadqQx6YZVRZm2djgvhH+b+XMn6UtqaKUvdE=;
        b=YdIZ/AHXFGilRMm4dCE0OL4lEarG3gyCl9un6thke9B/smow45PDMJI6lBev8bKm06
         1XGLLRHYQTCr+45pPBFghXukMn82VQRPtfkp1agjojosOrL0axbmhzY4LtxTbtfeTs6C
         CsdlQp/SWFRzqo7MebfisZaQv/BvQFxkFUVPOrVIp51ZemfGg0qgdUnjupMUc9SQwWgO
         Zw/fWZvzhd7pNVHRKdcXLH4cg3EaS2/CAwuuP1ZPaGdHB3Kg2LjzAvWq22XDKpCSCSra
         npXNBB4fL0Ia361w4gQmgmIeyQZ4H1CVd8YzMURE0s/34rBG36OHgfBvQLbrb/DrMnnw
         bTcQ==
X-Gm-Message-State: AFuF++lrmFRm5rbSIINY1L4CeKWAyMA7h7Aupt5FC8S5GMhADyiKuj7d
	7OhYJPqXgGyu4SvO0NGLNVj+rX//jFFho3AibTnPvt/qAFS808cnLxiT
X-Gm-Gg: AYBFou0I1azP2HQUafOZOAE0dJGtPNOaT9ZqKiPj1JIKB0IF5uPi3G+EWAFM3Fm4K5+
	Bh6huBf91t53RNbeUygLsnPhxk8qztKETW1a1/KiipKIwvLJncx+2zrRCOoHu0IAJqDDna5IgcB
	95Eq2+M5LHPVX6YalS3IanU3SKKYsE2PRDXtAGQyx51i+35jxn13aJ2IiCK+FqyeR/PkYSr/Kop
	z64vRpT7Sc+MmGrLF3gqawqHe8gjCawErjtvDBBMoSrOoGWL/harECI199Y9KQf6Ddr448IZcQp
	+h4NXGn/DUOO8l5aKgKtYq+V3rOwu4DLpNLaz/zo0ajRiHwFB2d6no+ZqC8pMeNwsBw+G3i8yGm
	EFM9mDaezPCVpvRt69zoOou02uzi3RokOEKf3xamzaczj57+ebq827j/p+rO2+5rjPiD2nDvEzb
	FqYKyx8pIhojAnZllswh9LXPKXcdkyOqASlvsywMK2yWE1NpReEUr9DMomV1glBABhZtqHln1iG
	orn2/Wv50yqRDnXZa8E002rB2wZrI/4xrch9YO0M05TqB+A+rQ=
X-Received: by 2002:a05:6a20:4311:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3da39d147ebmr54252434637.9.1788972841349;
        Wed, 09 Sep 2026 09:54:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2d43:5153:5c50:643e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm45655113eec.17.2026.09.09.09.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:54:00 -0700 (PDT)
Date: Wed, 9 Sep 2026 09:53:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v2 0/3] powerpc: 512x: Convert ADS7845 touchscreen on
 PDM360NG to device tree
Message-ID: <aqGJQwB81hODuSIc@google.com>
References: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>

On Sun, Jul 19, 2026 at 10:37:15PM -0700, Dmitry Torokhov wrote:
> The reason for this series is to remove support for platform data in the
> ads7846 touchscreen driver, as pdm360ng is the last user of legacy
> platform data in the kernel for this driver.
> 
> This series converts the ADS7845 touchscreen on the PDM360NG board to use
> Device Tree bindings instead of legacy platform data callbacks:
> 
> - Move GPIO controller capabilities into mpc5121.dtsi so all MPC5121
>   boards inherit proper controller definitions, and remove redundant
>   local declarations from ac14xx.dts
> 
> - Update pdm360ng.dts to use "ti,ads7845" with pendown-gpio and
>   interrupt-parent referencing gpio_pic
> 
> - Add "ifm,pdm360ng" to mpc512x_generic.c and delete obsolete
>   pdm360ng.c.
> 
> This change has been discussed in '24 but I just got around to
> implementing this:
> 
> https://lore.kernel.org/r/ZoNHLjmSvCN12vU5@google.com/
> 
> Note that this should compile but I have not tried this on real
> hardware.

Michael, Madhavan,

Can this be merged or maybe you want me to make some changes? I'd like
to finish cleaning up ads7846...

Thanks.

-- 
Dmitry
