Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574856;
	b=z80YwbhQs/DR1fWmcF1BocBXp1vONXCOHxKqeUnk2ivjnXaQGMS+VmJ5sPoxOmfVA+Qs
	 M441vNSGs2QxQGHddjxD/sv+URBx7lNUuzj0SAvEJFOlzwX2n+a25XW/DBL7eHzsPXzRq
	 9Wp+Vc7r8bqm5n9TYHLogPRSjUWLpQVlwnUBe2/gwnzgTqwOqCbxMEwdRbhQop6E82XbU
	 MonfRv3rG3Q+NOWAkoOmU/B+/bLQFZE8UBm061n/MM6yeyPIryQS/cEuRqZeP4Vs8wHri
	 CloR3yR7uyraivYuFRGW8Qqp6I97BCtzFEKCoWOQPBQRWDFvUMmpQDe1OZLxdLaGCdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
	b=5R0RjiY6wt1FfHV9tGSytLDQpirZvDaz9I5Ty1Ub8Y0l1wnYCTW76qGB+NoDzQHkEKQ+
	 c+w0tpte3c7oAL5fBj8Ck3/TsoGbmAZEPKSQSUBSbchm4CorU3MD81t+isxis820Ko/Il
	 DmxOu5XngONLkhKgSgnblNIJqHTGeRCj+5A+6lp8oLZLtIfjtAMuCKTXhteM7gwZA6Snb
	 WlZwlN3pONUhyxI84bh7Lkvxlgn5aPauydPABIWHHpZDR3KGqrwnW42lTGh6//tFEt3FJ
	 rvHZFaLdDtHraD2Dr3tjF/K3hh8QBHx02gLnMPatRptiPNM5Yvt2Yb57Palv/R20ldw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jnm00dpe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F17606A335
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F17606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jnm00dpe
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso1312159a12.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574854; cv=none;
        d=google.com; s=arc-20260327;
        b=S0KRyrBj72qdaoORHdCr/3MF8ickzzTXPoFIJbg2RlwOZsNzfimUpWMZczhcJqM3YC
         wXdbtPPYD65bFTk4LvroD2ePDPDayacYpxH+uJs+X2b7955iNWU0aYpmK3lBP6jSpVTN
         iXTWHC+DrLqbPEaYTFgZ8zJxCOWQoQ04IZgcEoohk3+Vd2GsZ6EECCGUCSFL3h2qXhgA
         V9wyGEnKOh6IZtTtK+LkiXy4kvwnIbk+ks+TSdtt9rVu2BLmdpgnaYn4xlhFpoJjt7+p
         zvHmkn1L4LuLnHuMeQS3DnRRICA6uVozAaqFVB9Ru+Ha6zQ+WueATK/U6F+DZby2irUC
         HB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        fh=I1VbWHWaXbA9TjSm0Kyz7zXn82UDydF0txTWyL0GOPo=;
        b=oiZ5jPJjtLCrA5qQ4AkVqhZTD6qvQ8E3XTlz2Pi71jDybOZhl1q8tuONkE4JUOtREs
         zRPQLKCOSHoJeMLiI32wXjecbcGiS06PADitKZAbjiiz5xlMNtx06jWfavyiKhnc20jw
         Z7bR39HSWO/JQIsVvW/sRsb/F/Ni8chdKOu3FWXn/gIfKC5Cyp7fouRxisp9lgxdPPMt
         sJ396wQr1y9V+E2UWzQkoCLGp+u28wemL3qGzDx6pwPdZRj+BUJ/IKrOMM04lox3sQeu
         9wNFsvB1k0L/Ws9a8iV1o6UwP+j0UTw2v3cJpSdSzZqlCzQXHUFRgDlvGwwsS1T0yOR6
         ziMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574854; x=1795179654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        b=jnm00dpexQcSPfGZxQphnKBSd17bh5Upe1ySHaJZjd3SRylcfmGBl4dkJu33zlmYFS
         IK8hqMGUDl1UCPZ8ZrJ7+cPX+7adIw6uvi7+1wSF1E4uPoOASKQqKtMVltRdHOGxuoLJ
         HJBALf2AkIm/5Oc/99i93CWinzFErZvMrVFB0BPMBtf/hNO6A+9FDjSO6bCdzdapFF/1
         NbOfWZ0Vyez1mjQJ1sEMXA3/cp4OI8aKne4ycJkA00biNQ8w1FHmhwmQ6FK4ZHWkNKPh
         k1yv9/YvgPomizwtcLEFLtNVP650OM0e1LeUivUAFjAeZyDo+gcaD4K6as03xcz+n65y
         Yedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574854; x=1795179654;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        b=RhhVoNkjrPzZmOPbPY6DtPjw/EogfS4RscDNPO/fG2Wwc4ycLuJBp1hD6EvoR64q27
         yyo+PBQ8WFq87LAnCQIBvafCherY/vDb69K5E0tUc0vwkqeDuGPtwvZfkgUrMaE6QMAM
         d0eoO4zvkFAUSwSDTtKc4FjYlI/5r+S9cthcaEEAo8xWOwWER2F86HIgOklcRaxe2Qyp
         lTz0lS89WJMS8T4HbE+4q+FiPtTgOkkF8x4DJHuV8aiLP+zOsoE0WwjPoXDYmbZIofdj
         btL9JcYKUwQfMf3hnvHSqHi+u0xcyG9KBMycDKHFaL4ej5SDUDL6TnXcZJcwKL2RmQzh
         m8rg==
X-Forwarded-Encrypted: i=1; AL+hErHvv2ZKF/QN57p9nSm4NYWHQb/cuejLLP9bGp7zvqDMbMiJGoBccJtRWqRFfaoTr8uGloUWGvhX/RpB@vger.kernel.org
X-Gm-Message-State: APuU4Z9cTjsNq7u9vUiSWolsOjoBIfd1U35vojXK0ISVvqt0qSMxAD6J
	OzlFWQKL39HQ//vT7IdjYHASj524KjBTmQnCGRSOQUqPZCoGJY93GXcrEhy4XX3PHH/54OWva1J
	1XMSDvDvgDMU/LIrtkFCHfniFW9FbzZk6zyJggAJamw==
X-Gm-Gg: AYBFou1QfhgNL6Z9yCQ+hrISriYNnmly9mE05g9U+BxUafCqpMIWK60SJ6egZ4GpIg8
	LYzKGp6jyXvf64lPtCsn1NR965yLkm8z9OYTl3lGJv22gF9MA43n1EJAzdZJA8kzHPdRT2jTfmw
	YgR435a/3Itsn7Cwi1jI/E2fGGpY4MvyhJp20beuodVEpsOMupOf4TxhxELrDiJfpdvaWeUmMwE
	SvPNM5ihGmITQgXkZyMdVcoxgRB2WSNVUU3ODXAHmky4j2tmJ1nUlpXET5IHWtx0qHzt6yy/ovH
	3/OPH55Cht+eogvbKnwJElGnTsqNme+kPZTRHUOAgz1F6mmpwZrJEresdug9kIV8j1dcIEREZXk
	k5ejlEcIa/xn3N+uI/me2bTlh1tDu4GsNDFHwV0GUH94ToWurSNjBoX2BmAlP6t4mdIi198rpDf
	vkXAHqMIfFmd4yaUk=
X-Received: by 2002:aa7:d1d0:0:b0:6b6:face:56ff with SMTP id
 4fb4d7f45d1cf-6b7c0c1cecdmr1756365a12.33.1794574853723; Fri, 13 Nov 2026
 05:00:53 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-13-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-13-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:00:42 +0000
X-Gm-Features: AclHuK-Gujxl0bdCqN1FIJbWWs5SjHt2ToZTIgj-Ln1Yz-sYA3apmJelY48JkxE
Message-ID: <CADrjBPoSV8uOqX2tkVyEdiZi7NEOJAb8JsxkvMqUn9+wF5Jc8w@mail.gmail.com>
Subject: Re: [PATCH v3 12/14 RESEND] arm64: dts: exynos8855: add cmu_peris
 clock DT nodes
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
> Add required dt node for cmu_peris block. Also add sysreg_peris node.
> sysreg_peris contains DRCG SFRs bits which are used in clock driver.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 2e5dc79d66bc..b461de6a7548 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -146,6 +146,27 @@ soc: soc@0 {
>                 #size-cells = <1>;
>                 ranges = <0x0 0x0 0x0 0x20000000>;
>
> +               sysreg_peris: syscon@10020000 {
> +                       compatible = "samsung,exynos8855-peris-sysreg",
> +                                     "syscon";
> +                       reg = <0x10020000 0x10000>;
> +                       clocks = <&cmu_peris CLK_GOUT_SYSREG_PERIS>;
> +               };
> +
> +               cmu_peris: clock-controller@10030000 {
> +                       compatible = "samsung,exynos8855-cmu-peris";
> +                       reg = <0x10030000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_PERIS_GIC>,
> +                                <&cmu_top CLKCMU_DOUT_PERIS_NOC>;
> +                       clock-names = "oscclk",
> +                                     "gic",
> +                                     "bus";
> +                       samsung,sysreg = <&sysreg_peris>;
> +               };
> +
>                 gic: interrupt-controller@10200000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;
> --
> 2.34.1
>
