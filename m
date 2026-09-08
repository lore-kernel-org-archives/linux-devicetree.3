Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4801554098
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874084; cv=none; b=tC68S6E64qbfDka3k4RC1WbF01fAoj37aI3mBXhRCIlpECiSr8ZX5fJD9g82IXtkgHz0qqr2tK9HG37VHWuZb9a8OswYO14QugKF1aPFyPneYvzmCfxJHaSgFGScADD/JjX6yBocJ7LHUbGRYFCh0P2MYMBZ99mXkpG78pp/A9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874084; c=relaxed/simple;
	bh=6PJK0pz+BL/5McTQS33m8+vXFQ4Vu2G0kEXngy27QKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgoa0aRVfapWuWWNHx9ql+Xn5Arwm3xtnUG7BO3KA14TIP+k0FwRZClzUc3a3xB679JqS7xpI6bESJanBu8GZA7u/laVGq+5CIPtCWT9EzyU8fvaYg6CxwDm9AzdyzXdGunSjpyMCNmAx5rLmqXmNl44ZB3YF4B73p8fUd/UJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=J6zWuX+n; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="J6zWuX+n"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-936c02e58dfso390708985a.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788874070; x=1789478870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOM8fjA8q735tt73QwsrSjUT4b2Ez8CVrzSTIP5W5BI=;
        b=J6zWuX+nZr62uuHTYRx9n015BtOCaW+26YgPe62PWnzxiDIXRPD/IznMqRxv9uyFz4
         OwA3KlVrnGiFTNSRBlD45vOobLJQ2zlrMTI5sGVLl7F/7xqkJnG/HulMKrRJM9pNNv64
         R9iXYxrBUckNKYv2/jBLQXJonL4VsAy9kcFjW/5wPQE4FLABhHisQyvt4sWCmqWGfoyO
         6f75Bq0OoloPCGq4B6KNjIN56mHhE2acdXnVvX+F/TJEUuj5ZZ4gyBB1Vsr9YEEdcvLr
         YCUCWMRmxZdu3a3Gl0GarbteOjUdfjsHhTLy/IQ3THE68XK1Wmq8Ki9KTsqJOzJim8gL
         W7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874070; x=1789478870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOM8fjA8q735tt73QwsrSjUT4b2Ez8CVrzSTIP5W5BI=;
        b=NAP/UWcXa3mhzn+EeddbYsgzBk5qDQ4o+nxRtElaM+DAt2QrwpczNT8cfAswJZX6JR
         yPkuE2RJ4Cv7hUD6TaNblvWIJuN36AK0UWibfRXNLMA+9IoO31cof+XXC+3cseRpQDVj
         Q7R9QjXfPUgJGEPlgSi8Jxb6IM+vEzbiGX3XQ6dzFE7jUBUHVFB7poDEWPdQLCIrFuJr
         bD7vFNO2kKfERYPEDGIOqrPcGaW2MpQSq16jnh/8EveW3TqrUest/Lr64WBdF0CXgYQy
         uVgLtVcj45JhNDZfQ0tZPzbewBu8M4LkhqWcJILorhlaKBG55m52FGB6jao0lVfl2Cgp
         PDHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4IMN/Wiusl9R/BpDcjYC8tmKllj5jA09txtaIbAGzyqMmPxihdRLZftVho3WsEg3CWmm0Yv2otOF1@vger.kernel.org
X-Gm-Message-State: AFuF++kvJCn1NnBH887mZ0vgoI8zus0FrCvBo2g0DdlNE8KIe0DDGQ77
	QEvcFRMmxU6R0ZSCKTpAoIqU1KV8y6mrUKF9nZZ3Tolk7/GfGxJtsOFlaktYTZ2NuDU=
X-Gm-Gg: AYBFou12VuOile/HO9bVwemaZv54qhnG5jml7Mkph54Sc4frLKDf6CPqXXpHM0l/F6l
	5jdVyRqcCXnOJv+ljW+VcrQsnEaRym9cLcUdT2mYEK421x65Wzv6SQVQjtOrnscCIJDOJs4R14P
	ikzpskrcoYXG9C6OPEWuESoGxWFEUrqP8ojaHfKDyxJLtBDGaViSmYDOBY8wcYghIUlKLW3RE6f
	4xNsSlLUx9biI19Hh744jU/W/zlpwKg8l7YEJG0OthZv0sN35mNbAajPvfkv0aF9UPG2DHQ6TAS
	S0yZJ8ogtV4lfO2M3fA5XVbc4HIv+Z1s4ZF67eMISo3PU2wCtJwWx0TbTv4x1cqwskKi5+4G/XH
	dhWf8EmEU1rBKUFFvzHhJYMJWlJwwqKS02S9HPu+CkH9vbhvMuLzRKd/A/Y3ddQ0fpgDUHy1mKt
	0qCntOlKvl+iZtlBsALO+HHHqCFGa6z4bcIzyg1g5k4pY1F5RipDNXriadptN5DA==
X-Received: by 2002:a05:620a:4101:b0:939:9f51:29a0 with SMTP id af79cd13be357-9399f513198mr1866256085a.50.1788874065152;
        Tue, 08 Sep 2026 06:27:45 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b8fbc1dbsm249492285a.11.2026.09.08.06.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:27:44 -0700 (PDT)
Message-ID: <a6e8a2f2-7477-46fe-920b-5216d0f76dfa@riscstar.com>
Date: Tue, 8 Sep 2026 08:27:43 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] PCI/pwrctrl: tc9563: Add GPIO auxiliary device
 support
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
 <20260904-pci-tc9563-aux-v3-3-5b1449d62ba2@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-3-5b1449d62ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 12:15 PM, Lorenzo Bianconi wrote:
> The TC9563 embeds a GPIO controller used for per-port reset signals.
> Create an auxiliary device for it so the gpio-tc9563 driver can
> register the GPIO chip and enable DT-based GPIO lookups. Pass the
> tc9563 regmap to the auxiliary device as its platform data.
> 
> The pwrctrl driver does not wait for the GPIO chip to be probed. The
> per-port reset GPIO lookup, returning -EPROBE_DEFER until the chip is
> registered, is added in the next patch.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/pci/pwrctrl/Kconfig              |  1 +
>   drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 69 ++++++++++++++++++++++++++++++++
>   2 files changed, 70 insertions(+)
> 
> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> index 1952ab4f29b6..38aab596aa04 100644
> --- a/drivers/pci/pwrctrl/Kconfig
> +++ b/drivers/pci/pwrctrl/Kconfig
> @@ -29,6 +29,7 @@ config PCI_PWRCTRL_TC9563
>   	select PCI_PWRCTRL
>   	default m if ARCH_QCOM
>   	depends on I2C
> +	depends on GPIO_TC9563
>   	select REGMAP_I2C
>   	help
>   	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> index 59ad219c26c0..2230765950b8 100644
> --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/array_size.h>
> +#include <linux/auxiliary_bus.h>
>   #include <linux/bitfield.h>
>   #include <linux/bits.h>
>   #include <linux/delay.h>
> @@ -18,6 +19,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/regulator/consumer.h>
> +#include <linux/soc/qcom/tc9563.h>
>   #include <linux/string.h>
>   #include <linux/types.h>
>   
> @@ -393,6 +395,69 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
>   	return 0;
>   }
>   
> +static void tc9563_pwrctrl_adev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	of_node_put(adev->dev.of_node);
> +	kfree(adev);
> +}
> +
> +static void tc9563_pwrctrl_adev_remove(void *data)
> +{
> +	struct auxiliary_device *adev = data;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static int tc9563_pwrctrl_adev_add(struct device *dev, const char *name,
> +				   u32 id, struct device_node *of_node,
> +				   void *priv_data)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev = kzalloc_obj(*adev);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->id = id;
> +	adev->name = name;
> +	adev->dev.parent = dev;
> +	adev->dev.platform_data = priv_data;
> +	adev->dev.release = tc9563_pwrctrl_adev_release;
> +	adev->dev.of_node = of_node_get(of_node);
> +	dev_set_of_node_reused(&adev->dev);
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret) {
> +		of_node_put(adev->dev.of_node);
> +		kfree(adev);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, tc9563_pwrctrl_adev_remove, adev);
> +}
> +
> +static int tc9563_pwrctrl_add_gpio_adev(struct tc9563_pwrctrl *tc9563)
> +{
> +	struct device *dev = tc9563->pwrctrl.dev;
> +
> +	if (!of_property_read_bool(dev->of_node, "gpio-controller") ||
> +	    !of_property_present(dev->of_node, "#gpio-cells"))
> +		return 0;
> +
> +	return tc9563_pwrctrl_adev_add(dev, TC9563_GPIO_DEV_NAME, 0,
> +				       dev->of_node, tc9563->regmap);
> +}
> +
>   static int tc9563_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
>   {
>   	struct tc9563_pwrctrl *tc9563 = container_of(pwrctrl,
> @@ -596,6 +661,10 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
>   	tc9563->pwrctrl.power_on = tc9563_pwrctrl_power_on;
>   	tc9563->pwrctrl.power_off = tc9563_pwrctrl_power_off;
>   
> +	ret = tc9563_pwrctrl_add_gpio_adev(tc9563);
> +	if (ret)
> +		goto remove_i2c;
> +
>   	ret = devm_pci_pwrctrl_device_set_ready(dev, &tc9563->pwrctrl);
>   	if (ret)
>   		goto power_off;
> 

