Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953673B47DD
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279209; cv=pass; b=P21N3NEN7AnAZUUA81OuJYe734K5ZEKAk8X5lHqXQ0AIVShExyMO3IE/YGZ1P60WmYVhA6HL/UF4lbj7CmX+cX3IUIVg+2YH1UflY9HuQ4A0KcCC64Cmf6uQCJdG2JlzH/+wzWZhms4OMQVtQ/rMmLzRiKCSWshCW4jHd0vLI4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279209; c=relaxed/simple;
	bh=WTGNsJXJENGSXqHyqYqrSL+FmpM4f+NO/Gh4/YenkBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcCLWrAx+vHefhrf0mV/p3ezbZVdm+NMbAu5+vqKbftWNalCxNjmgCOZDLXzRju9PLmbFvigLJe2sKLUYZaRufCjRpzOs+Vfam7zDpfdEwuK34yxapV/Eteo7M0fvqQDfvC0VzSE6BAmahUfkyTQspFivllxdUynTGxUhVuC15w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MrBwZVRp; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MrBwZVRp"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38be66a9fc0so29122321fa.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774279206; cv=none;
        d=google.com; s=arc-20240605;
        b=I16cxJS8sISKoQ1qpHspTdV856vYD7Lr16/E3I8HwexRJtLkdd07MznGrKqOmHSWrr
         2OwbMP58woMewbiuriEAf4vvwg3XU+2CHsPwgfRaPywYpZDqm02NYQfhwB0j1H0NnA5B
         vTd+6GM1Agqm1TD28JYTF4VO7EegwD4gwMp3CLL7gbDGTzG4JSg2yhq/LsM5/7afsZuc
         NC7P6o+B1XRYCWGoHoCSJLWHgco6v8RxC7I8bPFM87ykYcWurPrjyE9X0YRVLsTJeBK8
         vyNqxxzygzpBR8sTr2GHu3vktbzTzqort6cxEd93Kf+eUcPOSmfcr2aL2mzl2H3LEwCp
         GkJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CFEoClYNIUTw25SNi2mfbHdMYgsaJ4yJesVezbduu2c=;
        fh=O42ZGMx8YT0YtVbWCnI917JxF6TCeLpbQqELEtaxrgk=;
        b=JDOFvCZB8o9hZbEiEJVL9MhMf74COP45gc2Cjl0osbAq0JlF4JsxcVG27zQoDZ2Z3z
         rCsUcqnBIsq5wCAoszaF5N+DiN8Ju6XuVOEdplY6NRwNqZYA+6IT6VzamS+j7DlBupC9
         WbGkYh6e2P7yYPVHcPGThrGU6I2dNXvx5dZggQBsc4FBeJvGCN3ozCho1KpAIKuJgPBd
         rTfkmAlo9qEKdQCUsOzW49oMnb+OkWZnXtc0H82WqMZoyNBgaHt2XWGGcOtXL/J3Uv0k
         L6nXhW8j/waKGp2hpQVGWIv0uoILjIHwDTFcBSOSbiIPbyluUQin9uRQxNZ1RH632kKL
         t4BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774279206; x=1774884006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CFEoClYNIUTw25SNi2mfbHdMYgsaJ4yJesVezbduu2c=;
        b=MrBwZVRpM993zSzLfLmViuNx5BiLjjHznWg0sfKNlhIKGW6Gm7B+kyp9Fx4OrPXWth
         joY8Y6KHNCIJgkdmTohQxY5wKgFTPT+CyslZmVlK88+7WrgSTyHoYLJgdlfo1l8GAplp
         UOwpnC6g03Li6xyEGZBWKcwgHxu1d6yKgbY/Ki7OuAh8sMhFz2i4qt8Ahb6T/uT7MNmu
         NKUNf1OraeRqi9bPvVoXhpB64cQzPmJJu7z8iSZ8/o49G92ZLstI52UHUuaQPrlh+nB3
         +blbQr510/JNiMmTie3m3nwvc+idzeQ8l3xoxB0OWC0RbhtY8MJWbWrXWvOfwX9+lP/9
         T0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279206; x=1774884006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFEoClYNIUTw25SNi2mfbHdMYgsaJ4yJesVezbduu2c=;
        b=JHVwczSkrJCa3GKkcE6lvsHw7sQ7WTVzPnfyJlgAAm1oNXEQJ7jbkzlrmFt6L5Qx9h
         liCo46C32CfPWaXKlesiqhIJTV2zH1HpC65D+74t2UMWiBhtT0rL9edRlYauZLLOl+7t
         ESFxOM6mCexmSckCa9jcvZgXQ6SlTwLYTLx3wJlsSf45ZWgIaOD55QGQJTYxT/zf4wO0
         U67bbJW3ea5joZbSisWB3EdFkw/0iFXnRQ3AHrKDmGpYeLreaoavSaiRXHwBS9CJhHAt
         Lh2Id8j2sOFJhq5Rram+6eYUmHv79+QX/+RDkuZvIuW6I/tW8cLrLMzYJGAnjiWr72F0
         vcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoMvm/Wd4reRYQ7bgWuOcfE3h1bpVUpB5qVIyR+es4ArpXFclJ/2SqjtBHUuHigxOyOxD/AgSYqJca@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrKI1oW1VJShuQEkNMdqF799lbda/6R+FcSJkTTAcBjzdNzCN
	26WfagsCXm/3IIq/SK+b+jRxJ/HV5ZD5/aVt7M3d8Wr8G5RX2JuDQZIuBjOG9z/ZOcXfYWtNeOj
	DIb+nZtzI1mz4C1FxvAOjhQTFtAHSRilrMmgGIfzk5A==
X-Gm-Gg: ATEYQzxYiXnE89WVnRR5081CnSeYjoOtVWQ++3zCX/Oa89rAUFQk8AV8IvH8zx/i3aj
	rW4TqXtQ+YX7TTwe0OC/+Nj6+pGUuAs0sZRz5DiJMgJW+WMBGO8VgNvv+TpfLmBB+kAAncV6770
	Im7Lfb89kAlbf+r98xcDmMcyjH+D8NZxnevbrIz6g5DPSA1Zzqizjs5pFvxd3jkYig/0GOXJoBE
	0JWh7RrtEolfYDWUs0X7h9NX7d4mJFGm+sAJ8fMBLFYcD4PE4LuK68AxeCTw77ZOUstbCCAi1nv
	gIKkz20W
X-Received: by 2002:a05:6512:318f:b0:5a2:844b:d47e with SMTP id
 2adb3069b0e04-5a285aef82amr3653607e87.1.1774279205615; Mon, 23 Mar 2026
 08:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319140705.123502-1-jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20260319140705.123502-1-jiayu.riscv@isrc.iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Mar 2026 16:19:29 +0100
X-Gm-Features: AQROBzCxqxYpN265mvRUOBDK4WaVcKkSk3vYCZgRowThX_rFJS728bgruXKnriM
Message-ID: <CAPDyKFpBRjfS3QuUhLxwBAJfwg1dyraPpR6+L2RDOKj554Ytgw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add SDHCI support for Canaan K230 SoC
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: krzk@kernel.org, adrian.hunter@intel.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	gaohan@iscas.ac.cn, me@ziyao.cc
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Mar 2026 at 15:07, Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn> wrote:
>
> This series is based on the k230 usbphy series[1].
>
> This patch series adds SDHCI support for the Canaan K230 SoC,
> which uses Synopsys DWCMSHC SDHCI controllers, include MMC0 and MMC1.
> The hardware designs of these two controllers are different.
> The MMC0 supports eMMC, while MMC1 only supports SDIO. Detailed
> information can be found in the vendor's manual[2].
>
> From the vendor's K230 manual:
>  - MMC0 supports eMMC5.0 and SDIO3.0, usually for eMMC chips.
>  - MMC1 only does SDIO3.0 in 4/1-bit mode up to SDR104, and the manual
>    clearly says it can't handle eMMC because of pin count and limits.
>
> Therefore, there are two separate compatibles and the driver treats them
> differently.
>
> Link: https://lore.kernel.org/all/20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> Link: https://github.com/kendryte/k230_docs/blob/main/en/00_hardware/K230_Hardware_Design_Guide.md#mmc-circuit [2]
>
> Changes in v5:
> - Drop the unnecessary line wrapping.
> - Drop k230_priv->k230_pdata.
> - Make a macro to uses container_of for pointer type conversion.
> - Add the tested-by tag.
> - Link to v4: https://lore.kernel.org/all/20260315054426.18383-1-jiayu.riscv@isrc.iscas.ac.cn/
>

Patch 1 and patch2 applied for next, thanks!

[...]

Kind regards
Uffe
