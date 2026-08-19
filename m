Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F4C30568F
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154711; cv=pass; b=ODgr6U4Rtz0IlC4TzyOz9PbImHerohv7naXItmFYCfgVWtAHvLSm0D0HtiDzHV280Xe1IB2WQo1F0025S9g2w1psOJMH9SfmZ06QpeKTJWuXysSx9pwlxYbmkyh4TUO2J1czJalmzfd+I48Es7Vpy/Ib4vsAjQe4vB7mTK93yIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154711; c=relaxed/simple;
	bh=M1gPc2bvaiQxb6vPvYuvFaGv1R/+I7N9bwofWz8Ps/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ET7I0/InIs2yuG0onYETJTzmcogOnXfBoJ5KSe3DdWnbSQZvllYNA7NmH1TRAdKx6gnokZfqBkZxE1tIN06v0aS2xmJXwGVULbmc47fjYu9Nbz/j7fVPRRO5IeHoIvaBnClGJCnQAHvB8xz5/cNrFdh1TsYXpz/zn4Og2/Dsu3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v2cxfMV9; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v2cxfMV9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so1956809a12.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787154709; cv=none;
        d=google.com; s=arc-20260327;
        b=NAUeD2S5Dt9sEegjCtU11Rf6Lm70hi45dDSQntwGIVdsb937KOh4nb85gLt+4beQ1+
         drqaDdojfHd2bDS+1epiGUWUEXoFxA7fMP0jOhWAu8QPk4eOXWIN9ob3zWIj+ezIuAIi
         tHz8kBCMJ8o7LxVditOK8xVrUpVo3pV1BmGc6K4QY2N1bkt0gM12fyMSOyCc6LZhuFb3
         Pj42YGGhSDFITjKPdAQSJ775EfU+uI+EUx8RcO6fMJTaKWOQEts/8sVL39tGjvO8Bu16
         0nYNMVszcMUhmDRAjfHOYZMxG+NHZNj/ezaJ+7WJIj8PvL/vtOzSSeGM2wOaNRnIlWf3
         BIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FabclObMJFzoWdO6v3shf/pjOMMfD4e/jw+3OS9LCWk=;
        fh=nGREHjCqiU0XGtOrfCx4dT0etQPnx1rYhKg0euL9SjM=;
        b=CTtXhY2v4XoL6avl7XbmzU8jJMUKDAR7PUeVSZCFetENUp4JW//kjVukDDvfa3eo2c
         8t2BVc+lUe36E1W1EY9fSB91vkUjo+qTNwauu56BnHWT3PWQIHaYeNiU5Wnog1eGTBzU
         OagSLFVcK6PXD2YbOgtLbkmCeMSgvTraNJxayvMkIvHXEx0b1F13ZTNWCWaK7PaogJ4Q
         ipl5btAeQBlDKphrk3hbHG3+HB1lUOIdUExW8f2VtR6F1wy4Sh+sFnZUoXCsgGEiNJvS
         Ql9zAXFH613mvpVk1csDNnW0H6Lcd3r8gxBdRyfZEfBd9JBSGLM67pTVMki6doykuJOk
         Z9Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787154709; x=1787759509; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FabclObMJFzoWdO6v3shf/pjOMMfD4e/jw+3OS9LCWk=;
        b=v2cxfMV9dmR1TC/N50BGwg8O9M5MzbLaiZRem0gN+mjlwJZ2SVxhiU7A3U4EL34rVz
         yeNmqPIWWvFWoS0T6a+AWKYm1jzDvL/V+8uMdApVARpRSdQYb0mlEpFseiyqlGE/8Ws9
         SNlyZaet6XtwN01wxteLI/wNx3gFr6wX//bma5aW+COommN0JrM0b5Hlx8VhwQTaCWEX
         VPowmLzL7PhdEwgj0HoFz8xuqX7ybN3bFdIkhfRkAijvTH0ZOZBrJ2lC3N7Q8Jmuv6aa
         NPJOUbCwE05+4GxibHxoxyCsC9JOdTeeiFYwwCSxGA+e5MYl3LYkm/sHVffBHQmV7c42
         iZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154709; x=1787759509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FabclObMJFzoWdO6v3shf/pjOMMfD4e/jw+3OS9LCWk=;
        b=IaX5OTjhNuD2gCiXIBFOExZxDQvDzBSB649iKIO6ToyOkrnKYK5aZMVqqpQYD/i9hn
         3BEZ14+elVjVFHV7ZBi1tIuusRmcCE//xxaOvQHqEcZP8e8+XftXcSnsoF+cPuP9v3KR
         Z7ckyfvTQKv7avUAIHYyiekg1ZdJkj/UOabiw2ZYbHFPoBLbI3DQiEVsQe2TbaqbGcaO
         xp/2tiU5g51ihVadDFgSk1CVGlwWsXpNs/rRl1nKkzB/a3sZp4ZzUcFzLMQvPXmahucp
         5qvx46tgN0FfPBYh+0xwTLAIkxUfABzSg/DZszgyE34nWkq/ysPH7MeB2f5AayfaRbrR
         pR5g==
X-Forwarded-Encrypted: i=1; AHgh+Rqy//zao3flUqNhF4dG9Mdlzdb50v4UBZaX+b8cb9z78SeoBKEkQdyVVHS9NNb71OvoAF3IWfaaYwpD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8V9BrJAScAAuoj37+NRxWfr3Z0QWWJhe0F7sMj/0jKY6rHE+F
	5SJkgVMhZVIjucm3WqBVXuybzT8FVx57/sxencBA/bxVci65Ize+Pa3SI9tQCfs7U7glDDSqbxK
	Cuv97H2MJ73XiC8VN8CvlJ/mQ6dRw+Liip2MHiqqEaQ==
X-Gm-Gg: AR+sD10BrsVH8Y//FnOZVtX1vsW5EPCESRN4XaKgdrWN3c2tO1XRLt8kFrz3eH3pYUm
	1YfL6j1/fmKo7Ff2/NPMH5VOSpfe4hZiv0u3cd5IFEVxTIkfUCpNYUBJJdVUnYBi4ZOcq2gnKVi
	NwnpwsrEZf7iH/IE54z9ErKaZqPzGxiwzWT9YYv9Vc9yASxC86d07khS0B9BNS6vuSWQ2z10F73
	vCU2lJqYoKX9AHfyPcLXBER11LzIGbMzpSQFjXhYP8BEpIDnbMd+xngMZA94C4KfaDk+FyI6wwj
	kojsLfrNGka0QGYFhWlEH5+luJ/IZilhiAOF7E/Jo9khFR2k8Iph38qn7fvE8YzaHZDpuYhOiRE
	HgGs=
X-Received: by 2002:a05:6402:2422:b0:6a3:867f:edd0 with SMTP id
 4fb4d7f45d1cf-6a4032a68a1mr4118517a12.5.1787154708670; Wed, 19 Aug 2026
 08:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818083506.79567-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260818083506.79567-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 19 Aug 2026 09:51:36 -0600
X-Gm-Features: AcwNN1XRTsmCPwB72DvdE_IQEeyvcZekdfwlWqyBEHToVcymOI-eY1KBrpFJDYU
Message-ID: <CANLsYkzzzooMBri9_BbSavFE3h_mhMzrjCU6+Y22fFC6SrsPcg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: ti,am3352-wkup-m3: Drop
 redundant reset-names dependency
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
	Bhargav Joshi <j.bhargav.u@gmail.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Aug 2026 at 02:35, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Core schema already defines dependency of reset-names on resets, thus
> code here is duplicated.  The only meaningful new dependency is reversed
> one - resets depending on presence of reset-names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml        | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
> index 9e8a03acdec4..997be06ceeb1 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
> @@ -62,7 +62,6 @@ required:
>
>  dependencies:
>    resets: [reset-names]
> -  reset-names: [resets]
>

I'll pick this up when rc1 comes out.

Thanks,
Mathieu

>  additionalProperties: false
>
> --
> 2.53.0
>
