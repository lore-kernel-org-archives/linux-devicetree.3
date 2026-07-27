Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F641DEE2
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167955; cv=none; b=QdS7o4Wsjjd8ynNEI5N1srvo9aax/ajW/EdK33fqXI3aU0gxhsX8HZ29fxzg+IA7NTf+9darzjJ+BSfSir5QOXMUUGCioGEOQSZqYwgpaPHVblvPEQZkfCam0JIo1V6ZNXl8+hqnFI39bHsauvjMGgtA+7BLj/f283Su3nImVfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167955; c=relaxed/simple;
	bh=rJeNBOwIj2fpTTbrgZp0kaifEW7FTkpHCojoUf8sGCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHvJX+h/cNizUvWVqGngWeJUbH5IRLpY9ufNBtV652Y80i5ZjBMd7qk8LKHURKb23VBCV1Gud+KC4SLxhpp+JB7u0s761AZLW7JMWc4CkqMFGS4av11Ip2U1EcQi2KMa91GBROqURx2YnOEDwxYZQBNVXoyUDRyIoBWrM2WxPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=aJCgjoJJ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="aJCgjoJJ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c08df8513so18931771cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1785167952; x=1785772752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRYJYVd0WrMo0au+p8lu+GWgBRTTEDJMXDl3Udh1WWA=;
        b=aJCgjoJJ7+y45q/xn56ADc1ZiqsoXNxguZNZn0dcAdYjWUtvXdthLTs42i69K2mlxh
         xSW9bvzwjlYOFxoCCUEJK7Y4+0od7Blq3Zs/xNDzXRf2cwW9XHNjBEE4Au6QuCDhXm1L
         586TY5BNhCYOjtMZrk8Frz6dRdP1CZ2ZxRBYIuNdoBgI2VMDMVYgWwYSnGtjGVf/WuYT
         P6BgKCQebEvz3zX/rw7rLOqtKMHlp7AHL5NAyiZyZitW7KuOJyPVQ7eDPDDVg+VwZaAa
         K3hCzyIEzXvkwYk2L1A99rNmAcuWyliwT0/5M9PPdKuJPp+ijcNT84DrW1P6FPrGxjfX
         Q1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167952; x=1785772752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRYJYVd0WrMo0au+p8lu+GWgBRTTEDJMXDl3Udh1WWA=;
        b=q0wrh6q1iasJKgs454uXlp82nNL0FvLSoePfcLoN81fhjIYhOlnqJchAUv3Jf0V+Xg
         Oic+OW959KgpW1nLNWkTKEcbBKC+OoHkTsSTWxU8aFAlDbXFW7L3SpJv246WM8B+Zaf3
         rN/rOuj7EVwpTcaYk61rUO+ia7/95GkvB0rogrWGxPlnZu2eopzLRa69om8lqjJSvv9Z
         0glBKjsFLShhfeQWKpCtU7gk7MtQNb5qecem0NbVO26l2TYvAl2y7djVHzV1jI1ckWll
         70+piSrQdyGAXXDm3VUpi5T7ShU9CiJ6n8W4cdvM1GKJKi0zbaipPitc0zbDfYYcD9jx
         /7Rw==
X-Forwarded-Encrypted: i=1; AHgh+RofRaYIINnyXQkVvM49JTK1vW96qtbYvq3V/7z/pLmc0ymPburB2+0qg+HxllJ2kjNZss3MqkLgn5mS@vger.kernel.org
X-Gm-Message-State: AOJu0YwDvEM9rL2PDCPMwzoy0QHkMG0d9aTu5xejy1LHypbLtvY3Q735
	WhvAqGTL/ULZsU2md7mDeJhbLZZ/8SU+gp3I5DOqowK4kDvsfSNgNtLUrImhO6K4ez0=
X-Gm-Gg: AR+sD12i90EDchruXw+g7+sCK1x49SE3pPtvC7rgwzomr9q1p3UE5fYHYR3mmavO1/l
	AW5gIAJM85FzjjWf/nZ5vLgyYM4u5Bkfy0hUzyJ7NFRw4N3SCsavhaG1E3N07N06VZDlXCSjgn5
	hwB0tYNxxPOxKbNlw1Ribu6J6j6tzciS/wkjyqH5JYGfhKpTJl8p5UtF4FaTu6mkNePPy3foFgH
	CwtwfNgi/lnQCHICJ44fpYjhMCPGNtiqLonlyekRQaB2rJ7ePefCVAvP2SaNmSRDb+0OIq09FcT
	A1NuEeo3UA+RwyGvY+hNoifmf/TPoUerUuDAfXXD2ppe+AcBt55Uf+bgvQP82VL7UMT1kASz6uk
	+kWeOY15XjQQzpBx1XyDuxAP5SIa+jAAuUs1nVsNUctwJtTN+hPf7Fby/hQ+5P02U/oc46y5cxV
	3gTeLndlPgIJm6OKa3ZWmu3V1p+uTpCpTzclAVKdRBztYcodAGE+BcLvLaa6X2yWV9tHwutnU=
X-Received: by 2002:a05:622a:551a:b0:528:3a24:f396 with SMTP id d75a77b69052e-529a8739eacmr90115781cf.73.1785167952432;
        Mon, 27 Jul 2026 08:59:12 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a262fa9dsm56944561cf.0.2026.07.27.08.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:59:12 -0700 (PDT)
Message-ID: <f9937e7b-746c-486b-b94f-fb3b34a2b0d0@riscstar.com>
Date: Mon, 27 Jul 2026 10:59:11 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] PCI/pwrctrl: tc9563: Skip Tx amplitude and DFE tuning
 for DSP3
To: manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260725-tc9563-fix-v1-0-ec4286e31331@oss.qualcomm.com>
 <20260725-tc9563-fix-v1-4-ec4286e31331@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260725-tc9563-fix-v1-4-ec4286e31331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/26 3:59 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> DSP3 doesn't support tuning Tx amplitude and DFE settings. So just skip
> the setting if DT has passed the tuning properties. There is no need to
> error out the whole driver because of it.
> 
> Fixes: 4c9c7be47310 ("PCI: pwrctrl: Add power control driver for TC9563")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

So to keep things simple, tc9563_pwrctrl_parse_device_dt() is called
for all downstream ports but you ignore the setting (with a warning)
for those that do not apply to DSP3.

What about tc9563_pwrctrl_set_nfts()?

Other than that (question) this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> index ca19bf60d290..28e9ec3e172a 100644
> --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> @@ -308,6 +308,7 @@ static int tc9563_pwrctrl_set_l0s_l1_entry_delay(struct tc9563_pwrctrl *tc9563,
>   static int tc9563_pwrctrl_set_tx_amplitude(struct tc9563_pwrctrl *tc9563,
>   					   enum tc9563_pwrctrl_ports port)
>   {
> +	struct device *dev = tc9563->pwrctrl.dev;
>   	u32 amp = tc9563->cfg[port].tx_amp;
>   	int port_access;
>   
> @@ -327,6 +328,9 @@ static int tc9563_pwrctrl_set_tx_amplitude(struct tc9563_pwrctrl *tc9563,
>   	case TC9563_DSP2:
>   		port_access = 0x8;
>   		break;
> +	case TC9563_DSP3:
> +		dev_dbg(dev, "Tx amplitude tuning not supported for DSP3\n");
> +		return 0;
>   	default:
>   		return -EINVAL;
>   	}
> @@ -345,6 +349,7 @@ static int tc9563_pwrctrl_disable_dfe(struct tc9563_pwrctrl *tc9563,
>   				      enum tc9563_pwrctrl_ports port)
>   {
>   	struct tc9563_pwrctrl_cfg *cfg = &tc9563->cfg[port];
> +	struct device *dev = tc9563->pwrctrl.dev;
>   	int port_access, lane_access = 0x3;
>   	u32 phy_rate = 0x21;
>   
> @@ -363,6 +368,9 @@ static int tc9563_pwrctrl_disable_dfe(struct tc9563_pwrctrl *tc9563,
>   		port_access = 0x8;
>   		lane_access = 0x1;
>   		break;
> +	case TC9563_DSP3:
> +		dev_dbg(dev, "DFE tuning not supported for DSP3\n");
> +		return 0;
>   	default:
>   		return -EINVAL;
>   	}
> 

