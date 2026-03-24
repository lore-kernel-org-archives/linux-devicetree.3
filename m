Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA9A5477E
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368629; cv=none; b=Yyplsbx7iZmeUFJFqofIQUNvx9qXxfhIhexAcOPu5wdunyELAxcS8xKmgSEQ5FFnXBZODlaK72O24y2OqcOsUrGb/cLWFGOJPMc5iJ/WHrJBICuuxpB2Wn+xeEuKPkDh7ksiYcD4NQ0WVvf2dPfLdULXl6YnYs0PaLyBPLr6SdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368629; c=relaxed/simple;
	bh=LiKq7+XEkERz+7oUFGh3hi6ZUUrEQoeRp+Pf+HHSaT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ7P84dRjOSxLDuruQyE3Zm7czECf+vJjTjUu6KnsEEvndGECa4ZZNJ/ir8yxGxag1i+NIAkkui9N2pdhWkUH+zdzAuCZCsOW1hnOkQ6y5tuT0TGQn7o1umTmA9MiwMrSJiuutmA+hGoXGiq27wEARMsAZQeJ46D2ZUSX8Jbuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Msc2lM9t; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Msc2lM9t"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 011A21A00
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:10:22 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D07F3F915
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774368627; bh=LiKq7+XEkERz+7oUFGh3hi6ZUUrEQoeRp+Pf+HHSaT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Msc2lM9t2qIII85/b1X5Smrd2axWA59y7FefHxEhpY27OChJBp2sz/EbSzHMj7D9H
	 WDwNUEHGNvfMiVSxQbDscSaIN/EdkHBPYJwEYRW8C7yG/xB9iJ3SCUOW3odLhB67Z1
	 PSeEIDOdsRZFKCAsxekmuVBtRI5p9MN7GVQyzKd0=
Date: Tue, 24 Mar 2026 16:10:10 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, heiko@sntech.de, marex@nabladev.com,
	dev@kael-k.io, prabhakar.mahadev-lad.rj@bp.renesas.com,
	andre.przywara@arm.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v2 0/3] Arm China Linlon-D6 display controller support
Message-ID: <acK3YnKOyPbAroFu@e142607>
References: <20260313033119.33686-1-cunyuan.liu@cixtech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313033119.33686-1-cunyuan.liu@cixtech.com>

On Fri, Mar 13, 2026 at 11:31:16AM +0800, Cunyuan Liu wrote:
> Adds Komeda DRM support for Arm China Linlon-D6. The IP is register-compatible
> with Mali-D71, so we reuse the D71 code path.
> 
>   [1/3] dt-bindings: vendor-prefixes: add Arm Technology (China) "armchina"
>   [2/3] dt-bindings: add armchina,linlon-d6 compatible (fallback to arm,mali-d71)
>   [3/3] drm/komeda: add Linlon-D6 product ID and of_device_id, use D71 funcs
> 
> Changes in v2:
> - PATCH [2/3]: rework compatible schema using enum as suggested by Krzysztof.
> 
> v1: https://lore.kernel.org/dri-devel/20260311055506.12023-1-cunyuan.liu@cixtech.com/
> 
> Tested on Radxa Orion O6 with Linlon-D6, basic display bring-up works as expected.
> 
> Thanks,
> Cunyuan
> 
> Cunyuan Liu (3):
>   dt-bindings: vendor-prefixes: Add Arm Technology (China) Co., Ltd.
>   dt-bindings: display: arm,komeda: add Arm China Linlon D6 compatible
>   drm/komeda: Add support for Arm China Linlon-D6
> 
>  Documentation/devicetree/bindings/display/arm,komeda.yaml | 4 +++-
>  Documentation/devicetree/bindings/vendor-prefixes.yaml    | 2 ++
>  drivers/gpu/drm/arm/display/include/malidp_product.h      | 1 +
>  drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c          | 1 +
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c           | 1 +
>  5 files changed, 8 insertions(+), 1 deletion(-)
> 
> -- 
> 2.53.0
> 

Pushed the whole series to drm-misc-next.

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
