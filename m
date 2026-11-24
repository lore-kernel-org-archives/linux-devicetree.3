Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480836;
	b=O+yXqC1sRTougAdwypOY82BVmKEe7Pld3QoaZ3KmIt+pvieNmMdfTf73Mp432C0kZBNd
	 03oCaT1C+zv48Hiv63w/Ovhq9N8NKghR6yp8onp2wEUobZbIq8dv0prjae5hGP58yWWX4
	 E5BpxpX0JD6X7FkSEzTj7XZnpqsgoTmFioJoGTqK1uYdUDyllgS+ycfcxRt3pADccbxXD
	 yVbfD5gpSOeLN/l4yWVIwRqbWjytTODsc8gu9uFKTPK743qxUKt32erScmtzs8ovksXoG
	 qIlngy0Tt129BqR3Fv06bb3kIfkweK7UBs910lQbVgYoVfsJbpF5McfOCNKK4qJu7hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480836;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=M5+Pix7NT42S5693NiMI5LhATqtGNDkZlY1COv4dpG0=;
	b=vtIE+FvKd3u1QLwp8dSnl3SL0U/H6ZHE75hScfb1v7KDViI9sM657p8k1EfyGrDzcYZ3
	 9bMZvnIZvEtvNVRJaXDHeAdFrV/3GcsDH9HdjCGi6zyQ8FtR9p/A7Hiw2+kCMtQzuuHzX
	 Ak5avO0vwHqyDlS5zltDDWlz2B2nxiVkb+hzol/78V0zSUAJjwmThc2Rt2KHpwmJ+QtvP
	 AzrJMl1xZrMIxY4WS0wMDF0cVafdFOXfvHScYdk0laFYP5wrBN9hbP4m74bqdfL8xPZf5
	 JJnbCYVR+qfSRRrMqNSiFl7Bx73CcNzdRvrTlo+gGzvKnjAtunBnNCiy6N2plzf4QoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Kf5kH/Y2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31341606A321;
	Tue, 24 Nov 2026 00:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kf5kH/Y2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08BD1F000ED;
	Tue, 24 Nov 2026 00:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480835;
	bh=M5+Pix7NT42S5693NiMI5LhATqtGNDkZlY1COv4dpG0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Kf5kH/Y2qb2Jb+nnPIXjTsR7tzdYAW+YfNUzzzn/DBfmzi513nvsVpUaXEK7+VW8N
	 5v82CpVMvjbO4FjIunbGlsaxEJZm7Zn9jVlyWjcUUxDUyQ6nbi1O07vQBYxJhrFU2B
	 2Zqi6rDfbO9Y1sGY9mSZ89V4o/vEAqCWZrJ5IBU+R//CSQ5wKE/7gNZh9riLXKT8Bg
	 fOXn+Kh6P2lsTMMzlQ0wp/yg8QsIlkLDWkwFiaWYgHr6UxrYJjIvTEKOCDJO1aEBsf
	 Mvs9EzvcCiBj598z3FXU161okZkhbe+y1k80wTyBGtwg8lP6eEVBDfyq/Oujsa9dzf
	 qWh5/ztnuDf7g==
Subject: Re: [PATCH net-next v16 01/13] dpll: omit pin phase attributes the
 driver has no value for
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:34 +0000
Message-ID: <179548083428.3135.1533890996902964782@kernel.org>
In-Reply-To: <20261119225752.41846-2-arouhi@sitime.com>
References: <20261119225752.41846-2-arouhi@sitime.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch makes the core leave DPLL_A_PIN_PHASE_OFFSET out of a
  pin's parent-device nest, and DPLL_A_PIN_PHASE_ADJUST out of a pin…

--

dpll: omit pin phase attributes the driver has no value for

With this patch, the phase_offset_get and phase_adjust_get callbacks can
return -ENODATA. The core then leaves DPLL_A_PIN_PHASE_OFFSET or
DPLL_A_PIN_PHASE_ADJUST out of the message instead of failing the whole
pin dump. When the old value is not available, dpll_pin_phase_adj_set()
skips the comparison against it and passes the request on to the driver.

> diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
> index e5380d95f238b..acf71a93f2300 100644
> --- a/drivers/dpll/dpll_netlink.c
> +++ b/drivers/dpll/dpll_netlink.c
> @@ -388,8 +388,11 @@ dpll_msg_add_pin_phase_adjust(struct sk_buff *msg, struct dpll_pin *pin,
>  	ret = ops->phase_adjust_get(pin, dpll_pin_on_dpll_priv(dpll, pin),
>  				    dpll, dpll_priv(dpll),
>  				    &phase_adjust, extack);
> -	if (ret)
> +	if (ret) {
> +		if (ret == -ENODATA)
> +			return 0;
>  		return ret;
> +	}
>  	if (nla_put_s32(msg, DPLL_A_PIN_PHASE_ADJUST, phase_adjust))
>  		return -EMSGSIZE;
>  
> @@ -411,8 +414,11 @@ dpll_msg_add_phase_offset(struct sk_buff *msg, struct dpll_pin *pin,
>  	ret = ops->phase_offset_get(pin, dpll_pin_on_dpll_priv(dpll, pin),
>  				    dpll, dpll_priv(dpll), &phase_offset,
>  				    extack);
> -	if (ret)
> +	if (ret) {
> +		if (ret == -ENODATA)
> +			return 0;
>  		return ret;
> +	}
>  	if (nla_put_64bit(msg, DPLL_A_PIN_PHASE_OFFSET, sizeof(phase_offset),
>  			  &phase_offset, DPLL_A_PIN_PAD))
>  		return -EMSGSIZE;

[Severity: Low]
Should Documentation/driver-api/dpll.rst be updated along with these two
-ENODATA paths? Right now it still promises that both attributes are
always present.

The "Phase offset measurement and adjustment" section says:

  If pin-dpll phase offset measurement is supported, it shall be
  provided with DPLL_A_PIN_PHASE_OFFSET attribute for each parent dpll
  device.

and:

  Configured phase adjust value is provided with
  DPLL_A_PIN_PHASE_ADJUST attribute of a pin

The "Phase offset monitor" section says:

  Once enabled the phase offset measurements for the input shall be
  returned in the DPLL_A_PIN_PHASE_OFFSET attribute.

After this change, dpll_cmd_pin_get_one() can still send
DPLL_A_PIN_PHASE_ADJUST_MIN/MAX/GRAN from pin->prop without
DPLL_A_PIN_PHASE_ADJUST. It can also send a DPLL_A_PIN_PARENT_DEVICE nest
without DPLL_A_PIN_PHASE_OFFSET, even though ops->phase_offset_get is
implemented.

The new driver-facing rule, that -ENODATA from these callbacks means "no
value, omit the attribute", also isn't written down anywhere. The
phase_offset_get and phase_adjust_get members of struct dpll_pin_ops in
include/linux/dpll.h have no comment describing it. The netlink spec in
Documentation/netlink/specs/dpll.yaml doesn't say these attributes may be
absent.

None of the later patches in the series, up to and including "dpll:
sit9531x: model the inter-PLL sync line as a pair of pins", touches
dpll.rst, include/linux/dpll.h or dpll.yaml. The sit9531x driver added
later in the series returns -ENODATA from phase_offset_get, and from
phase_adjust_get when the delay is above S32_MAX. Once the series lands,
the documented guarantee no longer holds for an in-tree driver.

Could the documentation and the callback descriptions be updated to cover
the -ENODATA case?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
