Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8298E3DCD90
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 18:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286667; cv=none; b=nYcjusEs12TQj6VEhUYD20xcSKNUDijbhcGjocouZt+tomw8uQa5pctvzB0VqMSa51EKYagNrG87gxE5ArDdKNQ1Noxxj3CviF78bJXuwI8edlMdk3NRQVdVXPmy7f0qC2A6D5KbNTU1W8WY1xzk11BMjVN3MDFKAnGOkP3C798=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286667; c=relaxed/simple;
	bh=QAlVz1big6/0SHd02D8Am44I432cOSKgP8fiVVEJtxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADo3lgNHkZIU1i3+etEwji7ymNVwm4b9REYj7uvCTVhJ0O4kf3zVXdmJsIWkJYzxcjkMQnRAkr9zHXV5Gjrg9BClNTDIk8Eime4Q8pNhdvif6B3usLEXnfYjkEu2eHp4naozqpvYbEcEJ5s+bOCVbturA8f/HyLWwYS6ymt1evw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZ3vD23Z; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZ3vD23Z"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso150075a12.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 11:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788286666; x=1788891466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FvngFuXh4SNdJdga8wwv6o+vzwXABOb9ybeVY4QhSBU=;
        b=qZ3vD23Z+3Q06lfYre1JmctN1nCg1W9fdoPlnPurAxo/umwB0KK8BcWA9V9cfs3gKS
         pbyCm4NtLRx27B+lDsuYPVI+14UR9mj+Sst88gDzPMd9tjD/UYKHa1PhVHviibGqXzSd
         LIbbMCSoWhkMX92y1BvdTiVm7i1aejFoqbygCQ27XVn8PgsyoHJwylZtMPKG1s4Xt+Nm
         CsOCQk+MXuYvdlOnyVWgWztm6yCmVWXowTIgWJce215WqKJa8tcCGpnD+KiyyAV4LsLK
         Sm8i+ghdQKoHfi0ULxysyJPZ39nQ/DcgISw1IZ/UmBP5WMXN1wDybPXFka3hswT7vInF
         U5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286666; x=1788891466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvngFuXh4SNdJdga8wwv6o+vzwXABOb9ybeVY4QhSBU=;
        b=jNKa4u8o2QWlyUckYjop6lyRZl/GheJ7/ENprZ9StnuT1XpcXJ5g3HzFuRF3GiuuyT
         hSJbLgzKD4lid9/rScKYi/A3kpH8FnkeWIq2uEEv0Hck7IA34yla3e93z4CsMb5InHoR
         DBTsFCMb3V85vJbKeyqpcVVzRxoaNwazP3/bUtaWGwB0MnkY9BHXq1JkRt+f/FXzNyah
         /lbAeJCd0/JwVpY84p3Cf2VZcAKPJ5FIh0/mM8dhBa6bnXg6rqaHSvR91EloY93cVRnR
         ZBNc0/ad9hkFEguiBLCouzF+byzliKA5diffH/dgXbfoS452QDZS+rqL00bokfLmeMCj
         qVBg==
X-Forwarded-Encrypted: i=1; AKwUvBwY1VyR8EibVHupazyT2qtKwTf0L0evmjbFn03L3rfMM8Gu4kG+C5wVupuUA/uZeBbfyaNopi85N5gg@vger.kernel.org
X-Gm-Message-State: AFuF++kzM/APHYs3fLXxojaKBji3ClcbL4BMOSWRChF27MgmJO/Ig6Kb
	kWmKw+p4gSczgOLPx+4ij/k3oPQjOvMUDRZ52F/QpSSgjwEjnYFA2frJ
X-Gm-Gg: AYBFou3PaiWT+4k5ZM5SbqpZJ8j8Z1LHrc2zCUKvnrVpLMRWPVGFGuqLpSvL/4skUME
	p9bkONGax8vLVmvAsq3KIGZUoAzDdfJzSMLp/HiEKQ9KIBEuF7ysqJ9NMTZfVd15K5PtFGm1s34
	TfPeiSdRGgQ1u9xeejGp/Or2UN3NI18ANV/3L1q4QTpgAYjCDOYyS1hTSzU6w24l5aGR04M7XFT
	R6Ffg4Q/IEDfZXv7p5Ao/yo3qOz/U/WttKi1EDEe8FhKgiyq6s3lk7N0HS1BFacZlqiY196ivOX
	KwfPUrd5UmWtIDh8s+6drv+yt9aN1oXCd5eYsFSJi9/f9HJ6EJVE8NyBtetRGGwVnL3kIJ38zsU
	7Dl97ox6shFiEAUGqRh4XNVtoQNYAd7V+q37SrmCKwEFDRQoXVbRGZ5oaUZMiaDVvngHow+ttdh
	dCFk7YQKUunKxQhzccE8bpnVBY1oHA0JghFIThajR7Uv41qvNIy4PaKomDmn+9j8lNrEzDihQ4s
	A==
X-Received: by 2002:a17:90b:54d0:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39907ab0ec5mr16512440a91.3.1788286665840;
        Tue, 01 Sep 2026 11:17:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d726sm783720a91.9.2026.09.01.11.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:17:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 11:17:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: tmp102: Fix up TMP103 bindings
Message-ID: <0a4ed80d-a5c0-4b5b-b41d-76c37adb99bd@roeck-us.net>
References: <20260901174847.97261-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901174847.97261-1-marex@nabladev.com>

On Tue, Sep 01, 2026 at 07:47:54PM +0200, Marek Vasut wrote:
> The TMP102 and TMP110 are backward compatible, therefore the valid
> compatible strings are "ti,tmp110", "ti,tmp102" and "ti,tmp102" .
> 
> The TMP103 is not backward compatible with TMP102, but it does share a
> schema now, therefore the only valid compatible string for the TMP103
> should be "ti,tmp103" .
> 
> Make exactly those three compatible strings valid and everything else
> rejected.
> 
> Fixes: d67ec24d3f07 ("dt-bindings: hwmon: tmp102: move ti,tmp103 out of trivial-devices.yaml")
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied (I'll squash it with d67ec24d3f07).

Thanks,
Guenter
