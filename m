Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567470;
	b=0dCuUy8x+EaTBjFhr8EXykuxInpkvvCvdXh6W0RIluez8NXCP2U3HJoPWEe1lTcO2krN
	 3W7B2fwVGLJxTPdCOOyIfMmEDzC3cufEsrwqTpFgcSLgq/f6hPiAoM9AjXuv7OyjdZH4P
	 9hPydbRbVtwg+dfxmwB7FhIvwFVrto8BNR0zj6oQ4yPChlasxddSRpIe2JpUHwJBb7+tS
	 FVf1TWOJGn8fG2KH1xu89JvnfmTj2cqILBgUaRz9HxlOI4saZvD9tu3NiwSDj+g+PHPlO
	 ro6+SROmQvPGDD0F01ZNOaiUMEdsSwoK5VLFbQqebhakTtFWZ5PwjM5YU1zoolWwkyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
	b=UkE4LoAM7tKfLiX6hyitE1/VzrZWxZ4anl+9L+9ARckzsGjCp8RMWvADKT3YbRahNpsE
	 LNJwQF7emdAhsAwkkm8anSMDH1FnN/nvIrdAReqwYHGubXu+QiBu21prAl/pkdIKL7cLs
	 v5N5Sh8IOtjmxTIH7ax8EIv19PUkjd++j/yP7RASiTsDtUcyAWO3tUyxQjxhhILEza2WB
	 zZuo7zJC1OGLDr5S1YDC6JsS1/3jQ2fKLC/rkNxN4mbLEaEDNWzmzhnNDsUHU8CwgMjj3
	 aZvzRKr6B1j994DTBMTas0FFKn7QROZbyLNxK2za22EKbWW54eeJg3UdoLuU07JTG6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AeF7+1yG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A78606A89E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A78606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AeF7+1yG
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so1455407a12.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567468; cv=none;
        d=google.com; s=arc-20260327;
        b=P/e4JYVLgw57NdsM6+WvNAMViJZy5UW05TP6XQCz3c40VTK6uC0mSBayfnLMDBiq0M
         1+Q++E5z20gkyR1XHwnwaD/IOai5gKQ4fNmqpOQFkMPTZEZ1GcIdnkd2Yg5seHOSGkoC
         WrPKkimVfVjVUsBtUya5Fwh140V9KpmgVFXZUHuU1D+JRUV1GijBAy0j1wlgxt/E9g4R
         MyXg/FxkvEZakRceKrtNTee6dX7ICJ4tcosHohP4BOWmklRKjD7U9Rf84NbZ4odJiUGQ
         2lHAoZmToJa2CqSsQBRm9odL8+u1Lc6z6kJe6Qz/aFaTGwLlI3NEUAvJHmcRe5yMjWqD
         bQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        fh=6QmVJ95hIHl2YtID2xQsyEdQhN2S4vEVVMc+LuzZb68=;
        b=gekqmUaoTeuhFNk6+i8KkgwkQy6wxpBOqhPHNODP5FbR0d+rcgonecSPM1AFdZzMPo
         x7h0uBxCmjo4GKBbOh5eZV1pou46m81eIn/MtDr/VXladCaZP3glOmv3DyxLkU4fr6ij
         BKwDLkLtXbWYV8OxeFoRKoMGvBUul9TJmlUcL381gE4MuU9+lvzihW0BNYyh1KqPtr4V
         AoHUtin7FG02zJ+9wavsXcpWNogtOAM1APRuHtBkLl4x8DCGopxZarQH65Rtm+FJZHUq
         LlDcwj8VlqLReTBVjAI8eCSJg8G4JABBAQQwFRk8NlqZ2AWlS5caMuzi4ofixmXa62td
         /Jhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567468; x=1795172268; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        b=AeF7+1yGPsZ3QmfWQDKuaH4XlBf4fgKulM1JWAT7w6hasBaoiDc0GGcbM20gyy7oNO
         j21U+7iUbis+Xdebn4EYFBsDglN772fKbxdeaNCqRrdckQJ+dnZpTw0UbxbUXvnZpwLZ
         TPrEWOrDkwKj2jh+YC1sLLS3RqspzA0MaL83n4vmbczTHKfypWXugHYAAlWxLriOhkHQ
         e2Us+G7V8bFuYV08OM4oEXyilnNAwYBkC5TnpOtVOQMrLx6n1DKbY94g5Itgp5Io33rO
         OAXb5K5AuaxWrM9wvYxoqazJJK7V9ATH6tH2LjM3Anjr5F+ht0QWFpjenlkz5qwjM/Kq
         URkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567468; x=1795172268;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        b=obTWLqVeV96x4qSuddj+ys0+drexlwt8O/4MpWpupEOYRXqDyvfDNO8t3bxq61D7mb
         41jvzSgC76IHM6UFXeBdkquNZakKkGBOfjk1ikpnTOYEFGk/z/lau8OrKLs+fvTLh0mz
         Vmt/6Qu7cGED3Qp2gWQoEfjCfMNSnEV8GtoN8q8MlQpe/0M9+yj7PsR5TWWm0TuCD7f5
         pRDMIqoPRI63dW4XE42ery1vHis3DuT2Gna2KyHABIoVNALg+k+wDX39Z+Wd4c07Cm/v
         CmfO/s5Nun0O5zXH5QfRT7nkME7MOR3MEAP1hPZwzxF2rEp9oqPrjpS4i8f81OEr6EdW
         H+lg==
X-Forwarded-Encrypted: i=1; AL+hErFnwxgJFRJgQrpUdQMPCac84iXbprzJvINtiQtJJMRe5VNlolSQ8m46Q4AH2MXMvWQb5Q9DafFTsG/+@vger.kernel.org
X-Gm-Message-State: APuU4Z83Gt35pIebulnJdQT/D5lJEkkvmdffD9RSfbn2Q2XFUbClwLxt
	MnNGtkFlpqOxnQBEVsl+2mmF3+A1azGuEJH7SHvY4yZsL0GMWIA+26X/tm57uzz7eUO20OCg5Fy
	sk1PCjc+0Z8AUHnmiECxpg+sl874GHGADXeNcwRxvjg==
X-Gm-Gg: AYBFou38pcUzo3MrR7doBoP0whG4UJoFT6kyyce+QZipOqKVjpblKFmNOC4EjsctsFv
	ZFqHvqgzGse+Mw5KzznsItExKJsGx5T7mGczUar0ENbuN42LYDUFMZBkWJGFCUHIolfhMSFnnsM
	xLvgEWOIKcnw4x3qWiusRUp2YPnVqVbSSNiu+S9hg5ahZ5NMpEIrCbOB/pEILmkZVjwg8PqfF+Z
	uh9rXMTTszqFI2MY9Y/INxUU2eLA0GbDQTpqWpBwA6pZBGH75AIVNVMniVSudmmqv8A4/U2a2QX
	uacK6hRQSl5oGO++vMq/GORPmhQELs6TJ36waLs6M/QCCKtpxfmA8kNk4uhWZLcoE7fqL6WemTp
	lux078nuit+p6Qod+WHJYN0flVw7D0UWW0tAr4NNesemPyL7X/amYWNQ4Fiex+rQohwQZJsoNCu
	8/9DxpzkiC/wqe2jg=
X-Received: by 2002:a05:6402:1ecf:b0:6b7:bffa:6f24 with SMTP id
 4fb4d7f45d1cf-6b7c05c0611mr1899644a12.0.1794567468098; Fri, 13 Nov 2026
 02:57:48 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104832epcas5p4e1e9a3dedeb0c9c60cb80c23eb5d930d@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-2-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-2-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 10:57:36 +0000
X-Gm-Features: AclHuK8LZ5o_QWvk6RKRY0YNYG96oQjtDx2eCj61VNIttrc76E2ZwU1wIUFE6TM
Message-ID: <CADrjBPrwZ+dH3==Z46PwEVtYR4xWdzS2T0ZFHHWR4+g=a87cTg@mail.gmail.com>
Subject: Re: [PATCH v3 01/14 RESEND] dt-bindings: soc: samsung: Exynos8855
 SYSREG compatibles
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> Add exynos8855 sysreg compatibles in bindings
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index fcdb9ffd2644..845e0caba15a 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -31,6 +31,10 @@ properties:
>                - samsung,exynos5-sysreg
>                - samsung,exynos7870-cam0-sysreg
>                - samsung,exynos7870-disp-sysreg
> +              - samsung,exynos8855-hsi-sysreg
> +              - samsung,exynos8855-peric-sysreg
> +              - samsung,exynos8855-peris-sysreg
> +              - samsung,exynos8855-usb-sysreg
>                - samsung,exynos8895-fsys0-sysreg
>                - samsung,exynos8895-fsys1-sysreg
>                - samsung,exynos8895-peric0-sysreg
> @@ -103,6 +107,10 @@ allOf:
>                - samsung,exynos850-cmgp-sysreg
>                - samsung,exynos850-peri-sysreg
>                - samsung,exynos850-sysreg
> +              - samsung,exynos8855-hsi-sysreg
> +              - samsung,exynos8855-peric-sysreg
> +              - samsung,exynos8855-peris-sysreg
> +              - samsung,exynos8855-usb-sysreg
>                - samsung,exynos8895-fsys0-sysreg
>                - samsung,exynos8895-fsys1-sysreg
>                - samsung,exynos8895-peric0-sysreg
> --
> 2.34.1
>
