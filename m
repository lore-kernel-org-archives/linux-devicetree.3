Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A115540B6
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874109; cv=none; b=a0K+9XRUMT2wohdzYQhaFymnefgEryq1OHKZO+EtFZ/LaeRr/rsT+VtkUQAfotCMZo3sljCTEOnKI3V5hYy+5cDarrnhbsUocpZpW+c2aoSY4OPGpusTT95y2dtuGTgDV1QyyxHxxsaYdeDowGZ6kG4/T8YTwa1s/CJxFRrPfIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874109; c=relaxed/simple;
	bh=hgC/ODhmvpQIXajTqQbdCbpcyTOqi2fqT0bk/7HtYG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZMlhFC9oGjxpRYEmiMq4DJeX287nyelwTwC4UIwB2kAJp8oGHpvn26MuZ2er44Y+oc9LIRxlPTI6RutdEo5+AK65pE4KGTab2I6Etkuu+ST7Aq0uk4WDimfwsqhK0eb7Ay1NyFeR2fLyxxDeB4SSg/I2tpkpDx7ZoSqAEPeqII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ExptVi7+; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ExptVi7+"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c2a449c57so56067421cf.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788874083; x=1789478883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCrdWA50X2yOwE1UwjNDpc7YkWkuiPRBy93RdSxUyhs=;
        b=ExptVi7+Tl2o9F+ImTcxRHrqPL9bUlJK2tRi4NYwx5uvxm8UO3uyyyGdcDkRVC+v0U
         YthWd4VDi0I9MkKw1MmD+BQIX7WukLbEg0X0u3wpJfkLTLvEzNnMB608dmOEloWfr4Nq
         PhAIw2P9rPFRA/1MgrazJV052rMtumYNXZ+jdyBbMyz+n5wemJ+fegMHMI8VQVu1lX1X
         9AqfvYaW6BM5mhLqqirhrTJwFm9gYUoS+BGCZQMof0i3KL4ZcHbXr4s6yYVMRcU95UG1
         A8TEKv377469/vISybvx4U8TeHr+nIEygcSJ/sndt0X1/gsub5r3/RHqzhBLltaSI61l
         N1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874083; x=1789478883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCrdWA50X2yOwE1UwjNDpc7YkWkuiPRBy93RdSxUyhs=;
        b=Pv0pXY/sMMkvW+VXPuOYXfr6CeDmeCXJ0cOsm5u9YCIKicbpOwH6AF3i4ZGk7eALos
         uT15QqRMUQ5rY38aaetZ49SblS2LznsgPRLYsG99xlKiUUjLJZCCec+oboUjTIlMZlNS
         xbwnoysFfmHtTbx8DpXN+fXHCXtUYDmQ+GaYpo9PUvozQPt0Odp36SKPUezm9Jzil1OV
         /IwrGG3/I5sWL8oB2Fcri7f0TOdS3zMsBNu5N9R33qTTlFUVAa1R5J/i4R+AHCq5NeiJ
         FtewrNcJ2lFy6ptRa9qICQtOCO3rbvrFPicKwywJTSSk0XWp5AFlg8G820sJialFaxPz
         rKvw==
X-Forwarded-Encrypted: i=1; AKwUvBxWzJ1/7/FvzOwypkqkP3+Yg4GzkNno8XAv7+UFs+ZGlp6jC/B2JVcaAYE1u91bKwur869O2ChJnnop@vger.kernel.org
X-Gm-Message-State: AFuF++mJq1jbXVC4QDMkDIWfpmRu+k+bp0oFOYSPZs6WgIrrQWwMHslF
	Ty50Uh9mdQLVrvwapzpcwjSCWDwYcN5dmrqNIHFgCn42REoN/xAhq2VfLP4lMG4vWok=
X-Gm-Gg: AYBFou15UMHY1JBye5XSLSaUAE4DgTWWkq2UNtAhj3c6Yi1IhKrXf5EN/YYPD/Tb/Vy
	ql2oQkdAd3nuWIroT1cPWlFWYKFDj6tbxD1cyivNFFHu8Qm99wk6m2f4y9ENwg5vg3/9cQ4OvJ/
	QGM+8KDAsoVnEuI+5arZdGRRXP2wNtQjuZDAM9CXz/7aMoPKEUvQx4vHD0F9xtwSJZacOvwfSac
	u0eqpW3qP+R8j/KBnix3XqOQNYaN8pwNodDzH0dS0PYUsqBaqj6gF9m5VLsjE6BKAB7oZhsPdEd
	6Y5wRvQr/iCyHAyM9gHjSBh051KTNm9ZH6EzILbWZYbj0LZ+ETA9EC4xhoh+BAUp7B17iA5jNWC
	Rwfs2s1UzXY3cMKGTUlsLM87PQmTqcli3AvkZBPQyXTNe2HUyJsU0e9TbkQHoa0fZAbIKpdEGd9
	gE50F0a9ekBxc5dbzetSNJZdOLCC4LQtSFiNsoTbyYeWkfeZknzLEaRZqc+Szh
X-Received: by 2002:a05:620a:7115:b0:939:6df7:5e0f with SMTP id af79cd13be357-93980506519mr3377731985a.51.1788874070415;
        Tue, 08 Sep 2026 06:27:50 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b8fbc1dbsm249492285a.11.2026.09.08.06.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:27:50 -0700 (PDT)
Message-ID: <aeb341e6-0019-47e4-9522-7780cce9dbce@riscstar.com>
Date: Tue, 8 Sep 2026 08:27:48 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563
 embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: Daniel Thompson <daniel@riscstar.com>,
 Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
 <20260904-pci-tc9563-aux-v3-5-5b1449d62ba2@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-5-5b1449d62ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/4/26 12:15 PM, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines. The controller is registered as an auxiliary device by the TC9563
> power controller and accessed through the same i2c device.
> 
> Describe the switch node itself as the embedded GPIO controller and us
> it to drive the PERST# reset lines of the two external downstream port
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Looks good.  Thanks a lot for doing this Lorenzo.

Reviewed-by: Alex Elder <elder@riscstar.com>> ---
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index a13315bf0fb0..4da7342ca90d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -867,7 +867,7 @@ &pcie1_phy {
>   &pcie1_port0 {
>   	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>   
> -	pcie@0,0 {
> +	tc9563: pcie@0,0 {
>   		compatible = "pci1179,0623";
>   		reg = <0x10000 0x0 0x0 0x0 0x0>;
>   		#address-cells = <3>;
> @@ -891,6 +891,9 @@ pcie@0,0 {
>   		pinctrl-0 = <&tc9563_resx_n>;
>   		pinctrl-names = "default";
>   
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
>   		pcie1_switch0_dsp1: pcie@1,0 {
>   			reg = <0x20800 0x0 0x0 0x0 0x0>;
>   			#address-cells = <3>;
> @@ -899,6 +902,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
>   			device_type = "pci";
>   			ranges;
>   			bus-range = <0x3 0xff>;
> +			reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
>   		};
>   
>   		pcie@2,0 {
> @@ -909,6 +913,7 @@ pcie@2,0 {
>   			device_type = "pci";
>   			ranges;
>   			bus-range = <0x4 0xff>;
> +			reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
>   
>   			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
>   			usb-controller@0,0 {
> 

