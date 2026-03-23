Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0C23BC68E
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279199; cv=pass; b=eeirySnwDaiSWnXxBHI9F/C6UYp90m6ZWOWuExZw9/R1Bmkwf8F9/iR8Ce9a6/MbKg5D5J+qN8qRLKg42xNTHowfCHrMHXdOjlaUFN8OUDJ6eJik1J3Kz+d5dhkOWLPC5h/a9kDmiHbjDabkCrAeZHjiI70XAiye2WERypFvsFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279199; c=relaxed/simple;
	bh=3bLBwlvoKV9D8FRW2lSY998rKGPTuAzsW91tz//soKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9AdaHS+EzrEKGSoa1rZ7DBJqY5jZ7EsxZU3ZIjKLqUihMNQNXdF5IulKt1K4vQeGMSy9oP/GRuCgDXadvAqLrRp+KGYNFjjDwGzyTE0Do0Gh0fW5l1INb/jvUvtMYxadAemKJib22kDFVPLRjwAzBEDbC/QU3EDg1VjKEno6E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pnLGxyyG; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pnLGxyyG"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so3370320e87.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774279195; cv=none;
        d=google.com; s=arc-20240605;
        b=IazQkwcvotyDjFhBrIWDx+cON1Wy/tEg5sZO8FLMKaqpsUFKkSnzeGVyzzFjnqYi8S
         zS+RBpb0rxR4L6/2Vl9hr81NDCwEl6FSaMCgAyoyopyzZQk1Om8jRszU6+FpCyGaP5Ji
         fWQTWL9Z36+OrffYGwCHXs2wIeOxfHwnCBIaPO6ZfGEme2kOjTX6OWTQVpiJqdOY37Hb
         +rBpgvokKP/ZIixT58RvAmSDj/Di/DOdxMnARKduobxvXRmGp50ryxz4A01p5riIuw2/
         GF3lBC/GK5p8BqYExI9M4wh+88O04ZDtMWfG/HDvP1uNb4EZlm6RzAtbVGeeUVl5VZez
         3jhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e9m6IagqbiMUTJX23Qe4eCI6DILlg9PmVieqm1cjUqY=;
        fh=ru0mDgWsbxAxYMeCKPZ+bNTKx+Dx0pP5Bb9lNWIlCuw=;
        b=ZCyabrVRye2VDOslFPA4aOW/AJmCMHVGTjTAGg9Gi0h+F6LzB2Ur24REirWy482phx
         Hjq/2dp/kRbbIUBZRkoAm3TBH2B0C/rX+p33up/2xQS33VWb6NZWnLDmnDXdfPjHrYDT
         wVTsrCNdZv4GJKzxUI0eiqXGJmd9UIcHdRVmdxbf1UcVfNhpElYxUe0vLZo49k4451M8
         SVS5L/kZmXipDdtegs180QtViZkU+5x8x/eg8diZMIHcObtoik5CeD2gbi6s0HWy2LnB
         WTeUzyBAuTnmWNjbnDJgdADvzWH1XkQZsXyC7DnnUlgst57SgY9gedZu+kJhHYWJ04Nv
         61Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774279195; x=1774883995; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9m6IagqbiMUTJX23Qe4eCI6DILlg9PmVieqm1cjUqY=;
        b=pnLGxyyG9Io3AllDIScxlNB1SCwtiwFzwclnAaJrSmvd5bBU2QNxpQJ3noaoXVAVbL
         ajzCEBnNOHOV7/K/n4yEEzr1CahODRrJ4ADQvL57Aaf01dbdj+LrHUawtTSNfP9t742v
         TVjBfUWdlLeqWR6ywwV5q8OZiX4H5sExzEM+5JhqFz+7ifLsGuW2ZpM1i5S7SS3AQhzf
         4WM183V6gW3sk/xhm/Eq/aueCtnPPfgEQoSYAKl2D8a0wntHIHad0voDc07ltyjNyl/M
         X2PsaPhwi69rtrri00gO521fv5SbWXJZIdW4vq8xpfAjBV3DzKNwusVcBeSvqMunoR/u
         3Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279195; x=1774883995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9m6IagqbiMUTJX23Qe4eCI6DILlg9PmVieqm1cjUqY=;
        b=HGgmKUITkhwXwrvTojOq6dZE+dmav2YmvK+2JebnlDt+SCvnvRJY3iBiNJR++sFc9h
         ZqlLa9dSe26deE4tSCFTMkxNgSKikABC2PtoAWjwK9cy9sezU6sCZ9aKPK6cUBrQk9C+
         XSRqAAvGzVbmsRSb6tvaFbVVaS98K5lbqBeQ+Nxdut6+Wzd18GKvgSkWrTICUQdlmtGp
         lMWds0296IhoJquwEbvDbDHJZZI3rdbiwZs+i7QyIqwNFawdTbcSH1A589JnHgxk8vvG
         ZstB/MQeZHOis9k2UHFfk8ugmZyTueyaDIQ4wwJx0Kwl9a3v5n/Asdk43843q8RqCNzq
         GyuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeOAwkADDHIpizXLdRAF/AkczuQA1aLd22y23/8jhXOB7kZN8TNtSYp1kochT1DzrNpj6j5LRj+TPb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0SEemEpCT6y8e8WKFVsaUjWZD+GWQJRPMfjVny62hgBJaktBU
	q2uGNp3oEFtZ9G9DEbBkL5zh2RN6pDK7o4pET/tdmh1sd3MQd554EOw8E9AQ0CIagAHjSwQiS1i
	Sfr2qKVoX7SBZ6Ij9hu2D/rfwuYknLB3vfBcKkVYmqQ==
X-Gm-Gg: ATEYQzyeC42EnKX3mVAwafPJx1mVXB52VyNm9Mf3G3YSagtdyTO8XbOasi/xUHpHXrA
	2CxCvWa58e9CbmoGdTn1HtYhyyl3AFNr4Mf5sLm9XBG0lCt0+RtqNvh1OFWPbBYyA8i5tQE5oBg
	YJEbUlti7c4LoljJydpJjOchMNC/kK7rDXpsUsBvQe30nNJNfXyHDXd6W3cJSbcrr3NUYn9YM7Z
	B09b6Velu/BSYTciFVisFdDLLsmbh24w57tS8pTMt3bcNI6466yvmcHMm90dgp5JM2CzJuoKrEB
	vzdL2Kc/
X-Received: by 2002:a05:6512:1288:b0:5a1:4017:18d1 with SMTP id
 2adb3069b0e04-5a285b54ea6mr4675867e87.37.1774279195001; Mon, 23 Mar 2026
 08:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313130835.708066-1-festevam@gmail.com>
In-Reply-To: <20260313130835.708066-1-festevam@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Mar 2026 16:19:18 +0100
X-Gm-Features: AQROBzCNP8s-Y9NKf75E5i7SXfCEWFK3Iny8BNioMSMMiWmWo13eeXGEDAPT9OU
Message-ID: <CAPDyKFpGo6aHh3qjT-cTT3SbLF8F1Y6voKEmj3aT-KqK3yHYQA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: rockchip-dw-mshc: Fix the RV1103B compatible
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	shawn.lin@rock-chips.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Mar 2026 at 14:08, Fabio Estevam <festevam@gmail.com> wrote:
>
> From: Fabio Estevam <festevam@nabladev.com>
>
> RV1103B uses the same DesignWare MSHC controller IP version as RK3576.
>
> They have no "ciu-drive" nor "ciu-sample" clocks and use the phase
> tuning inside the controller.
>
> Fix it accordingly.
>
> Fixes: 517b1e3c9455 ("dt-bindings: mmc: rockchip-dw-mshc: Add RV1103B compatible")
> Suggested-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>

Applied for next, thanks!

Kind regards
Uffe



> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index a75209bd2710..4965bb518c54 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -43,11 +43,14 @@ properties:
>                - rockchip,rk3562-dw-mshc
>                - rockchip,rk3568-dw-mshc
>                - rockchip,rk3588-dw-mshc
> -              - rockchip,rv1103b-dw-mshc
>                - rockchip,rv1108-dw-mshc
>                - rockchip,rv1126-dw-mshc
>            - const: rockchip,rk3288-dw-mshc
>        # for Rockchip RK3576 with phase tuning inside the controller
> +      - items:
> +          - enum:
> +              - rockchip,rv1103b-dw-mshc
> +          - const: rockchip,rk3576-dw-mshc
>        - const: rockchip,rk3576-dw-mshc
>
>    reg:
> --
> 2.43.0
>
