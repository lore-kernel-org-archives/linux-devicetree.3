Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E68927EFF7
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603784; cv=pass; b=F4iuDBPGPw+owasUNDN76ySWZtDeYSSIGME43apXKWgbMfQ13gOe2dh1XIr+BaeYx1mbt9Lldu84inAy4ym+pnvrwny3eo76XD3XrbpXvkYwWAOaXZC0+WMzgMp32IZ1ZOoBh7zb9i021FKbCOJ/4U4qMExxENZ1OwS9TyyRULk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603784; c=relaxed/simple;
	bh=p+tyeRHdcrJH/grqiasUdaqVBUFH1iUrR+0FMBQ5STw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ph/VWh+zZViLYHTSBzuiFiT+QLW/1mdQewip7pvyG1x0WvB8iTptYT2a4DGJCZXkKCya81LOT9ViEgZv8vy9PlKPK2hnsNxaWgtXdccw4uB9hZG1reePw+7iCRYE1FNlD7tOlTf+rKZXI6vUaBSAitxicMIKUau5HzGm2BLTzSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yoxF8EoS; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yoxF8EoS"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bdbd631a6aso675110e0c.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783603781; cv=none;
        d=google.com; s=arc-20260327;
        b=EORRyReEbRIHe7ALxFyvxRB/wcBSlGwE3npFadFTH3yscbTas4XXBuWJiRg0BsfvPE
         4SvA5SpvYWgXNxrChBlD03/Dujgswq2tSxnatdg+fw5l50DZqq+x4XtwSRv8uVs1pu6V
         Mh5MlqzOHRduahU+Bp0gjKwEk5cFo/wHYnObQrerl8Lvt15hlXI9UMdFZYmva+F9bxe9
         tL+EN9vBjy1uAJEY9sggyNV46JAQVVrWY8cPiXDYifgOn3e5oWFu+jlMFqCQkbhIz0wL
         obg3ZxsRx1K7W1a3ct3YZIzrzxkLlGofFGjcZmzCt4YWZcJI+JCLiDuAU2z7Y1EV/rPM
         ZCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oNX1ervj/KF2oRQpeTTfCUe0ApEWaxy2q7nI/otl7sY=;
        fh=m0vVrJ3ZeDzWR49sEdVbE3A8MfmjFZwI2SmnghNgmxU=;
        b=DswtkFB1KnuAgZRdY9nvFnNWgHVjs2YsEpxtDNFv2o6hrV+jVC11k0U/SZz2FHJurk
         O9trjQFtZsn/PiWUVOGxhvN1FJM51mxfjcWP4Pd0+I99/UaNB/si8bjZ8TtxpIjOARb2
         P+vOJL6sG+cmrLKTNYa5y7mkJzn4Ixr6wgd2o5zoqDdf/XjhdtmwKRxUxFUEDlZQ7/gB
         j5pWT1b/Byts5kICu4hgj2nX81eLwFzsrVJaoILPc/avSHMzX9YIjMUGbOHXe/TIJam6
         SYC6LLWnuJHpd95BzLwhti5w8Nlg/QZ9/mGmKnTIDwO46Slfcblz2iyDrOrLA8pr5W7C
         KcBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783603781; x=1784208581; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNX1ervj/KF2oRQpeTTfCUe0ApEWaxy2q7nI/otl7sY=;
        b=yoxF8EoSbV8scfOWmYgH2Eu/Q3LHmI7R4pm48qBBvdkN73cBwIyoRydVTgE39kCFGn
         lsy9xG37KQAIW/9p7o99rvbQA83bV/+yoiXCOHtJQb+ROVxOCl+rLtjNKfihwHGLCYac
         hHv6+ATXcJDT1/mioXOrfOeTQLZfjPXrG6sLuHVXLnCY6/p+Lo/vTvSu0MdNxQ082Fjt
         ZEqITPvd/O7hjZemzKSRAqkEEi/D8X2k4jMS08LWXWtJlXQ6crR0iReM/4kEMam7ScjH
         EHYC4xoDN+SskrBa4Gfj8Vts7A5WevtDlHrwmTWalL/8XD8TwAGp3hPU5AvLRpe5ZgfR
         f26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603781; x=1784208581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oNX1ervj/KF2oRQpeTTfCUe0ApEWaxy2q7nI/otl7sY=;
        b=Ne43jG7lUG184jdWd5JfeEuF8+N7XfJ1nMJ4rgRfUlySYv5xpSisZSYw0OyR/h14u8
         yzmxmi4bjH2AN7W1btGiMhuF4TkimJ3ral9mIp7nx26Fd0YyiB3r0kgxrbKm5uskZ3g0
         PIElOXhcX0XfDTpJW52WbqtgRpq6BJScs00Tv0OPwEtsT13Y5aouNh0F0yOnTwkMPsF4
         3R+v9vElQ8ZVq7pzMgNXSXB2oT0Kx9B0Z7ZqfjErYORtVkeevtd4Khnkvl0NRJHdJ2LI
         mFdmMdpQeWwUk9OsK/Lvnw9WpZ/zUHaClXI5l6CiBD9HTXLUNgMYFjon+ejKaAT6lGKX
         hMHg==
X-Forwarded-Encrypted: i=1; AHgh+RpjSaQLO8EbQm9CKZlMaFM4nco18ZVGlK+tI5ZpDHKHhi3GSmhHcseJK7oOik0w3ueLmFuRdf7mTU93@vger.kernel.org
X-Gm-Message-State: AOJu0YwZpXwSMVdW+VLLpp1SX65Q8y+9deDvn4y9ZjrTiSc3M08uUHCV
	aeBGvixsDrY/be6zBXPMMQyE0lWucV9ExD/M2AQGCCcukfMb1p7sp3xzjCtv8qhYNaKWDkkIQl8
	NE9cFCrduslkl3IRY9NfzMTBRDtTV0zAPwrMbOfDzSw==
X-Gm-Gg: AfdE7cnyLvNEGqGMS6+YOB9E2E7H6d3ZidUC8zZzuF2kA8ot4WKMQrTezTLG/XS6bRI
	9tXFGgazOp5dcDG1gUR5VsadkalXQFqaTYfKnNXT43B8vO1k4iFFIprN+hETfTlSzUIRzeSgHgg
	0mJu4V5T6bn/I8WI2Gz2dlG8cackFLkR8li1faU/Uxq2VhXoQdquqE67akyN2eDx53PICYyXBPf
	9e8lkNUhbf9Ca5G9JguKbxbJ/JLwfcbNKIlV/V1/9T1feYyMpE6Ehqh//VsmP+aMzy50D6WkMUi
	4wnU4STrdnYzambqI2b3Zg/dX2EIDDs=
X-Received: by 2002:a05:6122:134f:b0:5bf:889f:e7da with SMTP id
 71dfb90a1353d-5bf8b2c347fmr1647495e0c.2.1783603781466; Thu, 09 Jul 2026
 06:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165418epcas5p1186eea5f8dc54d16a88b8298f6cfcf61@epcas5p1.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-5-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-5-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:29:26 +0100
X-Gm-Features: AUfX_mxliiRsSAvZCzqebmWMkvyd5ICueczJtcvNgbCxgBSP3Az_wOh3qvEDkwA
Message-ID: <CADrjBPoqcUs7YQtQMMRuagQMQGfLA7OE9M+Fe24DFJQusx0bGQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: pinctrl: samsung: Add
 exynos8855-wakeup-eint compatible
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add a dedicated compatible for the exynos8855-wakeup-eint node, which
> is compatible with Exynos7 implementation.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> index 2b88f25e80a6..802911e23aff 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> @@ -41,6 +41,7 @@ properties:
>                - samsung,exynos7870-wakeup-eint
>                - samsung,exynos7885-wakeup-eint
>                - samsung,exynos850-wakeup-eint
> +              - samsung,exynos8855-wakeup-eint
>                - samsung,exynos8890-wakeup-eint
>                - samsung,exynos8895-wakeup-eint
>            - const: samsung,exynos7-wakeup-eint
> --
> 2.34.1
>
