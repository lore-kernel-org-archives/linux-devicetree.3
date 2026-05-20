Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08273BCD25
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315989; cv=none; b=Jspo36/wlVCVFNFK7Ew4Pmhz0W89hKZNRfa2fT9GaB9vC+H/maZKJcTgMkIqYAmTYZtV44sIGe6DfTApQu3OduD0jDb5/H86icot/GEsiIECkXWi1OtqCXbT46IrToKMDOootHiVX7TyTKSbIrLcuNJoJAvndMJLkvi3PzWaf7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315989; c=relaxed/simple;
	bh=j+vvG9tL9x9Qm2N4qCmquu0PIMkZ01SDZnad8HjsKkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JaL9mSrFBcE+kzUTaiFYdko3JnwHQa16vBTEnUdmkSDCvCMFonvL5cGJ3gGmdVnaRdkIIsjBOC3c7XfPFuDpmMcJFFxwr5n9eFjb4AAXEv/yfMMkhW3BoA2Rr87e8YgyXsjIRjWNBC4M+XyMgeY9cy+xaXDOYBh+48sHGA5cZuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpjhyQv3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpjhyQv3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so3994006f8f.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779315986; x=1779920786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YG82xVAXQwQE8PumNL8zBtus2ibRKhYEPkSULunC6/w=;
        b=KpjhyQv3vClXosjoGWZmpqAYKelW8CDboFucNDCLebSdcjqL+k9S7q3hyuuAHh0lHN
         0+abZeVZgZqyyDO1m9oGSre1k8S2KYj6P1XFfAYKK8B9wqlGclNWWmQnoT+mo85HEupM
         PXPyFLR7xbEanO/YuzOLirj/kCZueVgK5D0nNdhqpw+sk+xHqEwEx2km7A3v2olWadur
         vk2Tsz9T1qtEu+BZJnieURhwWipITU8pmrgo0e24uCALwfVkHTLf1YadtyaOkb47MjxW
         2zPL8AszT0RJwlBXEauCkr+lm2Q1P8vi/IGDeqZRYE9n7H/TcK5kwuzzNKWCirO6oL1m
         AIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779315986; x=1779920786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YG82xVAXQwQE8PumNL8zBtus2ibRKhYEPkSULunC6/w=;
        b=CQQk9DZA6TQTZtsuXO8twsUjvvCLMI9x+tPRFLElMOkaGHVKo4LyoOPskXXbf930Ub
         4xwptbZefbQz3EMMBm/7pNaZPEErAAcUTxoOjD53sGc1TvMVlhyG/TxTwOufnWqilqyz
         ap35+5jPGAdt22bwMc/fSLMJVO2IMwjKdS8/DQAXPUM1/AiGhBfngN/Oz9MZvcAK7usE
         8T2OqSvVwBAcqbQ16v2f8XAo69htfVKlOwctUVuO6Lg5hqMd0eubcnimq3KMmaAdIEwi
         gdJqS1LoD3YaWwIuSL3eFDV690EhFEBRPCZnG7MupxGDt5i+fga2DRiQ4TWD5Dc63RYe
         R6Sw==
X-Forwarded-Encrypted: i=1; AFNElJ9u+RJIeGp9dJOThbkMVdvO05cNmQ3MiafNPtxm9i42oqAJECrUWm7dJKUfgyaPFSmWztsx+A0czxpj@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKXzmHbyCfGy7E6uCO7j5Oz36xxtKDWajuvtLARS4kXTfw8dL
	vAJabacanJ3DYZJWAkBVCD8XldIx5R8tbLygJM8qqzhYzXxgKRP8XV4=
X-Gm-Gg: Acq92OFxAciKLQ1Ze5olTcQy0K7cXBytHPhOB0Kg61vrRLuNjIg0Git9ZvmmerJ13cl
	YgIHix6ZpIQCuYQTuNuufcN7uW6PAJgyygXs1lzppVXE5I1jKppWLQwZYSmpBjuHG+/2gCrSn00
	tUPabTBVLJtAeSmYKBnNzZ1Qj72k6c7fUQ/BTQmxnBj+QqLIJKdK6vk63unsr5Mai+uYcO6htlw
	/GKAk7SeCt9DWPLLREo1ER3rceraD9df/v4iP0j239DlNWfQYRWVHcLSCWoRY63QSheXUIoNYQj
	0+L+J4rIN8Qwsd/LqMAHIybWqeDx4XPIDWETq+NDqkXhzFqFyyUbHQ+U40wAfjZGNWZ0rwyNQP5
	M2muLfukZedqLqovGV76iBM2u5bnoGPBso8YsO+tvi5QM3I9mt5linDj/oJCjHbJlKEGfTj3D+0
	BL6gJyYz8y5gamNYAMw5a6mW7ViAiwl4R+9aN3UioBxFqvDUskg+tnqdY1y+8NqOMeNBadbqjps
	gjpXZT50JLF0Vx4BULzVUwwP63NRQ4iQJbI5SIeu+K7aMdozuH/D5EOfuZkArVPm7voaQ==
X-Received: by 2002:a5d:584c:0:b0:452:c246:ab69 with SMTP id ffacd0b85a97d-45ea38c687bmr331364f8f.13.1779315985965;
        Wed, 20 May 2026 15:26:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe1a41sm61784681f8f.31.2026.05.20.15.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 15:26:25 -0700 (PDT)
Message-ID: <f5f70aa2-a1b8-40e0-838f-6709e6e08a5a@gmail.com>
Date: Thu, 21 May 2026 00:26:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/20/26 18:40, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add backlight nodes and enable backlight so that it can be controlled
> with the corresponding buttons found on Surface Pro Type Cover keyboards.
> 
> The nodes are almost identical to the ones from the ThinkPad X13s with
> a different enable GPIO for the vreg_edp_bl node.
> 
> The difference was found by looking at the output of /sys/kernel/debug/gpio
> on the ThinkPad X13s to see the properties of its enable gpio9:
> 
>    gpiochip1: GPIOs 742-751, parent: platform/c440000.spmi:pmic@1:gpio@8800, c440000.spmi:pmic@1:gpio@8800:
>     ...
>     gpio9 : out  high normal  vin-1 pull-down 10uA              push-pull  medium  atest-1 dtest-0
>     ...
> 
> The same gpio9 on the Surface Pro 9 5G has different properties:
> 
>    gpiochip0: 10 GPIOs, parent: platform/c440000.spmi:pmic@1:gpio@8800, c440000.spmi:pmic@1:gpio@8800:
>     ...
>     gpio9 : in   high normal  vin-1 pull-up 30uA                push-pull  low     atest-1 dtest-0
>     ...
> 
> Looking for a match on the Surface Pro 9 5G pointed to this only one:
> 
>    gpiochip2: 10 GPIOs, parent: platform/c440000.spmi:pmic@3:gpio@8800, c440000.spmi:pmic@3:gpio@8800:
>     ...
>     gpio6 : out  high normal  vin-1 pull-down 10uA              push-pull  medium  atest-1 dtest-0
>     ...
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>   .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 49 ++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> index f2b4470d4407fb5b6a3dbac8bc972c010c31bd06..14287092fb07ea15e527fd318f7ea2155448b26c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> @@ -46,6 +46,16 @@ wcd938x: audio-codec {
>   		#sound-dai-cells = <1>;
>   	};
>   
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmc8280c_lpg 3 1000000>;
> +		enable-gpios = <&pmc8280_1_gpios 8 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&vreg_edp_bl>;
> +
> +		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> +		pinctrl-names = "default";
> +	};
> +


Investigating the feedback I got from an AI bot review [1], I plan to 
update this patch in v2. Let me know what you think.

I was skeptical at first but upon review I've tried the following patch:


diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts 
b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f938e68c69ea..82e0a01276a8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -198,7 +198,7 @@ vreg_edp_bl: regulator-edp-bl {
                 regulator-min-microvolt = <3600000>;
                 regulator-max-microvolt = <3600000>;

-               gpio = <&pmc8280c_gpios 6 GPIO_ACTIVE_HIGH>;
+               gpio = <&pmc8280_2_gpios 6 GPIO_ACTIVE_HIGH>;
                 enable-active-high;

                 pinctrl-0 = <&edp_bl_reg_en>;
@@ -1050,6 +1050,11 @@ vol_up_n: vol-up-n-state {
  };

  &pmc8280_2_gpios {
+       edp_bl_reg_en: edp-bl-reg-en-state {
+               pins = "gpio6";
+               function = "normal";
+       };
+
         wwan_sw_en: wwan-sw-en-state {
                 pins = "gpio1";
                 function = "normal";
@@ -1061,11 +1066,6 @@ edp_bl_pwm: edp-bl-pwm-state {
                 pins = "gpio8";
                 function = "func1";
         };
-
-       edp_bl_reg_en: edp-bl-reg-en-state {
-               pins = "gpio6";
-               function = "normal";
-       };
  };

  &pmr735a_gpios {



and ... backlight still works! It can also be enabled/disabled with:
    /sys/class/backlight/backlight/bl_power
as expected.

I have no clue why both gpio6 on pmc8280_2 and gpio6 on pmc8280c can 
enable and disable the backlight. Is it a common scenario?

Anyway, if I follow my own investigation fully based on the X13s 
reference and the properties of its backlight enable GPIO, I should 
switch to pmc8280_2 to use the better match.

I will update this patch in v2.

Jérôme


[1] https://lore.kernel.org/all/20260520165709.E485C1F00893@smtp.kernel.org/

