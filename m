Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2954A3F27
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483684; cv=pass; b=fyj6zIbNBhBXK1zUxgFGmxXZJsH20/gQngURVow9U0uUhnXHCc3s7EvTuzB8vZm6okxdCAKZnCNfKL0HDVWGIAy/xyarjDA55QjHV/hOnN/UklW6NPycO6VOCrjZshwgj1bZud2MhvluTHKIi+bXSG+RS5IYTsfPHcyrHPr531g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483684; c=relaxed/simple;
	bh=JB4dzeW0yCT23fi0FjS+30+ACBaQQqxXbdSdVPolKf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBlGVO9NLdMUN6+cihJjoQkQCJjOSgZ4RNad8/MTcxRvPaM/FID7HCJAYftk2BB0oYal56nVCw0isBxvA7RtHojtbwDynQ/j+wiByYsEENShVaH8su3kddQnG/5a4krzewPoZz2N6lpHqWAaxjx45Nunnzt6NhC0NqwMwKzRaRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZKXz3cT; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZKXz3cT"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso5839854a12.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483681; cv=none;
        d=google.com; s=arc-20260327;
        b=WY5xlHBGQd7J9e6aq4DaAJNNOFQeeBxLhTj1q/QRLK6FvucSXIJhuBYCOmwZVUuvAg
         KRSFLY6DcwxhuswR6R0yyzDPRlcLqM0n/5Pl5CmBeqjcqELoeXp5ybtX8gy2PcaqkfHi
         zcC/YdFl5xVOHRhfSS4mK3m4vh+4kq524U8r7GdK7RrN2kjqLLvo9SXFVBaPr8T/+z+v
         UDjcX/3KU5hYwmwfg+57N2nTHoFjFQOnoe+RMZ89DYjDLOXD0p2sZ6qX2Qj9Mv1t4Nl5
         khoo7OdMuwqJBw7Eqij1tb9Jzi2b/fQasjKPuc1fJrQI5Efxi4y83zXObNds8zFdQUuB
         dFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        fh=ihOo4K4MBc4ZuGMth92fnG8H7lWi/+E/XnUmGucVG24=;
        b=slpwL820HPjX9pIOC2PFTksmdolnfoZpn+3fL5d8Pfqfs8ECWa1jItLW/HN7XOAXIc
         EoP+EzcVQZVHA0gMQMPmcCKfeaF1CDNAhFoEkKhM06rcWIcHQrxLCWG+3uvu0lqPZuqS
         1O9UptJW+D62SSMwPwLGJIjaipH2ReO0Xqld2bA4TaKDtUWommcFcll7PPWNULItOUBU
         IGpDsDwPy96e3xKUeom5PqhWIRpFtUSaTubnnLWDgSCZ6UsxAGdybIhPmT9FrGZ5YVLJ
         IHonCM19zVk2PWXJb1+v9K5+Ba9yYIMuhmm+OI2SuKmOYw3uQpQZC6HlyFWNPjQ2tMOe
         cpHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483681; x=1790088481; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        b=NZKXz3cTotnfq00AS34AmyHOBfyDkhsvaDZXsw6X96vIV68mn5K0vhHL5CQYc4/LDW
         YviLpKo0WS5QZiEc0LS/6oC7AR98DYTor5endBqbkObnRvwl0x0NIIzCmWXgMrBf4kBu
         Y/59uPVwYi6o7jl1C2EQUBpbXij/A0YxnukfY6iFPM8BVFFCgL80tfxCmYjZWYe/vb6w
         jOGII2D93BB0EneiKrx5l5jf02NIbjugqvCDlMV8u7V3iKBLmfntYYauJWtAhY9QvBtM
         oPAIA2xOTiRnLR0F7nOrDx6fzqV/yLFPjGW63iVoz8VfQ7hF1jVa8Pswogr/7JPj9b9k
         2ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483681; x=1790088481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        b=FH6Ck4mp402ktJ8au8J9MbS0VqJCRypx0UF45btTcVtKSxfNS1SgbFb+waphH98+qd
         FgxJxtgEJxvuEjdkMEfGHA2kAvfgYw1vWFu0DMhOdYtABZCw8xuWqZFX/AibND7wkCJR
         XfqQZloDu2BuzYWaO3eiVp5tP+7P5ez2bQ3X8wfeSFNcnzncgFTGKHtN03cydPoIZQ8p
         xsS+w0NmMgPnCVjXdt1PaTHpgopoY2HWHJPDF1tcck9t3J8BQ9w+rb+djBE625ywPSVJ
         Jb5JmdTCg/IHTDGo7r6Rfn5K7u2/AXn8phwIScIriUEYtrQBPpETydDyg9sozWxPvryu
         3oig==
X-Forwarded-Encrypted: i=1; AKwUvBzcpYqenSQKqXIE1PfYOsh6d0wDdqECRnUfiP3bd/j+8/1WghVsNfRrlUzDB0Ad1hqWXJz070kk4ZFA@vger.kernel.org
X-Gm-Message-State: AFuF++nHPbSBzoVES/D68yDjXpZfvJVU8aE26J/jLbA5zxZY3L9PnA5n
	UBrm45d1BREvJUv41fzx2vLady4MygjdKcYAQHrGBCi9iNc2jKz/ETKOb2JZdRVMrSRXOUv5PZy
	0VxEq7xF+2qI0Xmx4hg8tj564091Jm1IgXuPLWq88ig==
X-Gm-Gg: AYBFou0M1j4aGzYj2k4Adb+I9Xnvm/4cZE1jF4zZm/X7DKv3pojlDUQF5uxiWOeWuQF
	78PUZuOKoECW3Xk7+yhxpf6bizsUpdQeFsRvNJBGlrB29y8s7bdumm5WZSHPHemgyLJemQ8ZsM8
	9G461yQyF31f7FZ07MqEzR7tVkW/Dr8kXEq8ZueUi07jOKPabYUtTN+YzNBNAREXCjEuKJRuS8Z
	pgjnVXHKPCO7dWLBtIgeNQJcaVtIGUESlwXdb3G2s7jZpLBS9o6lVIztaRAwh1X7H0IyoyjlFMJ
	62Sazy3k8iQ4Byrd51IYdKSOhVLOg1EZCXVGTBIJpNjksDM5sV2nLsFhDwJWF31+SihGTFanaP5
	FFnhU6XKyj9qM0q7n+WiNIbg1
X-Received: by 2002:a05:6402:4404:b0:6a9:98b1:6c36 with SMTP id
 4fb4d7f45d1cf-6a9f63e0d39mr5145656a12.31.1789483680985; Tue, 15 Sep 2026
 07:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:47:49 +0100
X-Gm-Features: AcwNN1WgvUO9gVcyHHtQQpCHP6veTmxEFNeRoziGdiQtPJVZo1SV7WyKK3oIExw
Message-ID: <CADrjBPr8EROpwaXsuqNBgyiJV5b041poTKzFRfrx-rCvH1CyRQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 17:58, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 911643008b9f..2128749d7647 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -176,6 +176,11 @@ soc: soc@0 {
>                 #size-cells = <1>;
>                 ranges = <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible = "samsung,exynos850-acpm-sram";
> +                       reg = <0x2039000 0x30000>;
> +               };
> +
>                 chipid@10000000 {
>                         compatible = "samsung,exynos850-chipid";
>                         reg = <0x10000000 0x100>;
>
> --
> 2.51.0
>
