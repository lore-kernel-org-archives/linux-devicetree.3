Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AFA3AE715;
	Mon, 15 Jun 2026 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513948; cv=none; b=WGxubDfdIdFhUq2E1rS4yqdWKLAzhmsS2/EqMR0zxRQhLsSjpZIBppdF8L5XKOEbgEArpBbIQTwumpBEt8D0njzRj696NRCorT09zBiUXxvAn37xKLdRptsE7pLtcZrU28HQjqg+dGtlTo/f4H1jPa+YmZ0aqmaLesUc0FxyMLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513948; c=relaxed/simple;
	bh=Gg+qeXUVH4jXXmcmzuqpmXW5fcYzgj5eCW9UEEIAM9w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IhhjwZ+H/De8BzzeXtxZAc5n1KuYtkNRUmDfgQCtLNkRzIDTZR+a+865DAfjh0Z5so8eDfu7bGcPN0xvttcE196WrggJAZWbnv0MG9oeEJGSvKFFWfrt+f58mK2AqcFvPu7fZ+zVxVG0f1n8GHJ1yytyzvyQU0GuYxVZkih3t5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.167])
	by APP-03 (Coremail) with SMTP id rQCowAAHJt3Rvi9qBhPLFA--.30398S2;
	Mon, 15 Jun 2026 16:58:57 +0800 (CST)
Message-ID: <104f78a9ed6d6cf54d8a510b90bc3549469ccfab.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 6/6] drm/verisilicon: extend Kconfig to support
 ARCH_MA35 platforms
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 15 Jun 2026 16:58:57 +0800
In-Reply-To: <20260615065003.76661-7-a0987203069@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
	 <20260615065003.76661-7-a0987203069@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowAAHJt3Rvi9qBhPLFA--.30398S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Xr4UCF18JF1kZrW7XFyUAwb_yoW8Jr4kpF
	4ftFW7ZFWrJFsIy347ZFWI9FyUAa97JayrWan7J3y5ur1qkryUArZrJa45ZFyDAwsrZr1I
	9a1vkay2qF1xZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU7fHUDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-06-15=E4=B8=80=E7=9A=84 14:50 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
> The DCUltraLite hardware ops and HWDB entry added in the preceding
> commits
> enable the driver to work on Nuvoton MA35D1 hardware.=C2=A0 Allow the
> driver
> to be built when ARCH_MA35 is selected; this dependency is meaningful
> only
> now that all supporting code is in place.

The explaination of patch sequence is not needed, but anyway,

`Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>`

Thanks,
Icenowy

>=20
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/verisilicon/Kconfig | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/verisilicon/Kconfig
> b/drivers/gpu/drm/verisilicon/Kconfig
> index 7cce86ec8603..295d246eb4b4 100644
> --- a/drivers/gpu/drm/verisilicon/Kconfig
> +++ b/drivers/gpu/drm/verisilicon/Kconfig
> @@ -2,7 +2,7 @@
> =C2=A0config DRM_VERISILICON_DC
> =C2=A0	tristate "DRM Support for Verisilicon DC-series display
> controllers"
> =C2=A0	depends on DRM && COMMON_CLK
> -	depends on RISCV || COMPILE_TEST
> +	depends on RISCV || ARCH_MA35 || COMPILE_TEST
> =C2=A0	select DRM_BRIDGE_CONNECTOR
> =C2=A0	select DRM_CLIENT_SELECTION
> =C2=A0	select DRM_DISPLAY_HELPER

