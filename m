Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574887;
	b=z2KxMy5kcgQQRvicA4hHOhcH+QInTRaLXrrvZ4HvyHkhbxJiyH80m83ifYlWNungWEmA
	 haBsKbpqVQN7sdcrBh0Wu3zAnCKWiGFcPR9i+FBJNBSosUSBg62DVDwooLbqPHgVfc1Sk
	 ViKIloK8RPqozG/FP1HUwr+0Xs5/FEMpK3Gg0eVPI16FG+IJqccaruJDJuwu+o8OXNLTH
	 h/o4zsanlHm3RggZiLtJzR9Wxc1emwnlUaB5a94XJAwot8Jmil0PSt1fPu7eIqF9uGt6P
	 r9TFWEDLGU7K8CJWXFSSabyhu0zPrPsSokb8QAq0sHWRbvRZdrnvZrFHjjkmamvSKhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
	b=VRAQv1cNuKXiMsImjC0SSMrnQctd1ASlK7j7cKR77i7uuB8GdstyvZmtWPGh1RhrvvrI
	 QckoK9s5XO+qDuo6LTJIXJr6YgKZ8w3eFtBzQsOmDSBCwtE1+qhZ1aPZGxA75qf5ta4sD
	 TpDqanJIXYxpV9ybTC9S8eI8DN9rWbNiY5gNKYEgsEeSpDDJ7n6u8hNoDQUH8Mj+W+E2k
	 WDRY/Nd/AN1QxBPJmHI03SExOXfV1ZgAB/m+XJdkhKzp/+uHDPbFLYqxexdIEia6ZPi2P
	 TGr2HVPVi5gBWM0HmgJKSYZI0VtZG3Xxbd5Mn/ouQyvZkjebB+z8zmAbQaA2K8UD6pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nnTVdz2h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFB3606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFB3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nnTVdz2h
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b79f5115c0so2043998a12.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574886; cv=none;
        d=google.com; s=arc-20260327;
        b=Ri5A17lWcHNtY6sD1us/8cL69XSFGjCv/lEuYJtAd7sUpgcSG/bYMU7FpJREnLFffT
         87zR4XB/4RDdgIfIYUFxrTLdasRGUTAjxgbDYApWFBdtCQnQdb3OTIJjglyKbBdNJQOM
         PoytC9zWqP6pY7OW/eBLl8ttfr7aKsqHo38jsZdcMZdOtV8LhdtSHcL4bYguvwLxS0Vp
         uMO5lg477x8s6tuLfnfXK36NWN44thn8fITznpPXMYAh8LWLeTqCDtm18zfIVkR2LixO
         CJ47AS91rVGL7bQJFytldnH7022oa1cpmdoa5yrbiKb4vSqcfwcAH5bWYYUcKQQvl0zJ
         jhsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        fh=+Q96M9lcFyyDZ0hLUnD87NDgfplyDUZH96xHcLPg574=;
        b=rjCYnjaM6nV3HN8H/FQJ+WJWUUmNkI458xzVnptuoXE6sFJXqx8lSFlAL5OgAKqZct
         FcKDzCd9mwcpQKzmME2cUC3psbycFi3G0ds68dqaJvyx3FwzRx1F/yp8Jn/NPskNGfUe
         0+aa5Q8uNVI5NU+iYFWWngurD/HfmDsVXvQnyZ2g1fXm5mIfM4nztj0kdP63315fCPZu
         wqkEDtvYcx8dwuqkvuQRZJInTjK87TAuTU1BiQH/12J/vA1ScQCh/zCqvBGpEi5UGOZd
         j7oGSqe999sjhpynV9GwFe6kartCTuSUsuDqVYp+Y+TDJhQOZWTwQmRPVexhAeSPrDOt
         YJag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574886; x=1795179686; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        b=nnTVdz2hYXjLv8CZGg80c7sQRinQG91iQTBVm+IbawZjNNVF1TexNdD5dgtjfpuY1B
         2gZVzrsPBWjtuXVZVHFej2U6RlybPF3iMeX992fMFsq3OfQj8YLYXxSin3iox89TgsQs
         iJxDO/jgdGN3w1HKjcuYpw3Pyzy1fpY+Khm6lOh5uVpJx+hG7cHgMxUT6JmyjwgiSN9j
         KCBGHkFo4wt2Agmq9WQ3E/iz9I1HC6pyj5kLPUYQuEwFELjHUI9MCt4d8qVosdkq/C47
         jRkDU86/iVndnQOWWjcjvDvhYxxuSG6dSDhtKRASS0nwS/adP6bX2IGVaLI52bCddBp6
         Ae7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574886; x=1795179686;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        b=meS9atrz2U3fgljqHjlxFrhAvQ4W38ffeNRO8ZEjt6tlUNYogXZNTGXYj+O+RqaoNT
         Klp/FalUaDF8ArtVu6sOt6T9qyI/Ghh3v5TW4sCHUHZudaSzVdtFLRWP55GRZBwRJxAX
         PPv5x8gS1wHCJyghapWqPjt1zxq1a6VaTB/8RfBlj0Y+zz5nhXXK07WIlrbymnK6W/Dg
         03CuSQOQO9wTO/Of69gIajW4vGUhoGaWQYHu/vqtq1ukZWdWEiwKw8lidd8x/Ua3meXj
         4WOMpPG0rL5Xz6Q+qyiDYyGT2u3AvthwlH20Tzz/eHQaPIzV3lwMChc3qYDNHEoQWZnc
         MTnw==
X-Forwarded-Encrypted: i=1; AL+hErFyzuNkcuflEQeoup3BorXzrgYJtZUZ9KgxmKMz5eB2dRdPZTUNNNy24XHaBVFM+t3p8HBxzDpYg4wC@vger.kernel.org
X-Gm-Message-State: APuU4Z/mVXX5PUZpU9E2nnOF7SmB67J4eGynJ5AibtvJ2rbF+JqHkwvi
	YcRDrSUaRu2Xeuy/dKnWlkWYj6sNt4Mexy1lO9pXwCFKVANXD6TkvW2U2DF4gspYy5VCWmR28rP
	+130X1XBPCwa4qAK+osRaJMZYXQ7Eg6D93TBphddeng==
X-Gm-Gg: AYBFou0z4LbZguqfZiFJhbwhJxOoP57Y6pLRywRdoUPxxOR291x4/KS2a0j8Q8RNGlM
	E2Rb+KpSoNqqQRvO6Sr7/dr7PK3zCFDwG0N2oOvRFuqtYA2ZOfqmOo7SVSXUQUmvIxf6IEXQRHz
	a5Esi1XyuwCQlC10Inovz3iHGdg1ieEMvb+w8lCkEHMRu44zPptYhezy++ax+wGI+QubInV+jxz
	HoMUwbKCFno5i5xfmWSoJFLRbuQDCFsHqBO4Yr1vwqpp4rQlRj/vuO7m8Escx6iJl6EuPked/i5
	wB5EoDbgIT5oMq8AKEFFM21EX/srVQQielZsaMWB1PEb3TrRsOr8gRIVoFSfutIvJ8/uFjjJSpe
	viCE/WD0hHeGodqeLwdItf80I2e+pc6DN7vJfBdRSmKEheRmqz9YvonewuhSpFfBJWC2Pow==
X-Received: by 2002:a05:6402:4413:b0:6b5:9150:edf3 with SMTP id
 4fb4d7f45d1cf-6b7c0d144a7mr2186142a12.43.1794574880970; Fri, 13 Nov 2026
 05:01:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104906epcas5p462308ef9eec80f8b7a5f81b64e72b24d@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-14-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-14-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:01:09 +0000
X-Gm-Features: AclHuK-DofCQ80IZzIK-whDWDx-7N4O3mu6ydJD4FcVZrdGUzptZd5Yy1pZ4bbc
Message-ID: <CADrjBPqormg=jcKYZh5q61MiwZaRB-ZqtV+R2CFNP7o6Jd-SKQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/14 RESEND] arm64: dts: exynos8855: add cmu_hsi clock
 DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_hsi block, while at it add
> sysreg_hsi node which contians bits for DRCG and MEMCLK
> which are used by clock driver
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index b461de6a7548..3dd7a4c4c609 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
>                         interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_hsi: clock-controller@17000000 {
> +                       compatible = "samsung,exynos8855-cmu-hsi";
> +                       reg = <0x17000000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_HSI_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "ufs_embd";
> +                       samsung,sysreg = <&sysreg_hsi>;
> +               };
> +
> +               sysreg_hsi: syscon@17020000 {
> +                       compatible = "samsung,exynos8855-hsi-sysreg",
> +                                     "syscon";
> +                       reg = <0x17020000 0x10000>;
> +                       clocks = <&cmu_hsi CLK_GOUT_SYSREG_HSI>;
> +               };
> +
>                 pinctrl_hsi_ufs: pinctrl@17040000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x17040000 0x1000>;
> --
> 2.34.1
>
