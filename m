Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43AD421896
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687344; cv=none; b=h0V7dtPyZjsAqb/jy9uqCWK3Uj0Cd1ddlG3I8WI/7f6xxsbRrJ3Mu140MREJ4CdzWAxBl1onpSoXRFbq1XYHAt7Bva96CSYAxtgZtf8mdUAeToJepQqqCoqBviil9uxx4vvPDtpzYwN1QHPtyJWoNeNi6HmmQCV4FQFSHAQLSHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687344; c=relaxed/simple;
	bh=DWmNJ5lwsL10oKYuxQDPlcDGajEHoML1G3ab68pBqgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UK+AAwqjgejRG/O+ZlCihNPAEKeK/PzwVGc++OdkqKuyGDkvFC3ai/TQaluce87YE+obao20dTIdk4X3t++FFvTeNzUWe4tff/fpAbBxidYNAZukapwi+Eg/tS4LvHhHUAnbZ9h3x7qY4fG88oPePq8yc+z2u8ZwAC1AbPiJu4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=leUELaFJ; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="leUELaFJ"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so5713056d6.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783687342; x=1784292142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJBwqL8OFuvpdmiP4qvFBor8YyEfp6aV/aiB/sY0dm4=;
        b=leUELaFJsmYR/5cwOTvjTdqjN1E7PxME7EZSem7Z3OlLTDdGVgwLg3PpDAIIp3eEHA
         eZ7YRp6SRFXHf4ucsGXYzxP9NeIzLJqVg95cfbjHOuPdseDQj8hmSDKYFzgwOIYdnCGp
         QFJXEg05+NcLTnNM/Xz0cQo70DITUBBm/TLhGuAL2x+EC8N5bbif6egQP7I3xjNRqnMh
         SCeNrCiXPcVghmp6sUXtyClzlssNkxeIrJDxDKm8+89YJEfhmZ1eoo04TydPZ49Bwc8g
         +Kbd77uB/aK3ry7t/93JAXTw07o6kvIMnnAYe6mjz5WF6KUkcxzILwsA76HpH9mzP+N6
         +4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687342; x=1784292142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJBwqL8OFuvpdmiP4qvFBor8YyEfp6aV/aiB/sY0dm4=;
        b=qc42+f7LJkC9vDMpR9sAtChJxEhKWxiY9PR8RCRtw6E9e7rOUBlPCl/N+lB5mj0FWC
         cfy2bF+e82PrQ1DQuUIXj0wM5mSXwcfJPzVr9SajgiCGodKp/yefCq4b6UIukddyxaAT
         fezLEKY1zFp2Aq5XYvUhaJzoWLas9HxXdeXmZFQKr1BbWRnGfyIA9xEGn8cJnga1/kq9
         Yvrg2PdQe+YlpnBM86qRWkE/zq+6xvkfx1wIhHSuUjC18CLtd/O+dhMoXgE3k1MAEKjn
         NUlr9yQM0IiXY70e7HC82LuGgxvIc57zyQ3r2jnTEU53CR8s/CsfAytcDUl/q6Ky8hih
         6KkQ==
X-Forwarded-Encrypted: i=1; AHgh+RovqVFgfGQu6VJxQBaBbfCslpUd6BcOBE44JyStK1CpPMXc18EORKJRpF3V6L2XExGdbvPnTNyPth4N@vger.kernel.org
X-Gm-Message-State: AOJu0YwiygIMt6xO7BdPeSjDJSsD29muYj0yYbjlGpPEonhhI1yWj3Wi
	T8Vpavfj05toU35hR6afCrTT8IN9V+n18s8fRp29lWaw0EabrJ63VUJB0zxiQ/20+JY=
X-Gm-Gg: AfdE7ckJZ22YcIQaHjG1tHXoPtVRKueyMBeEqf/z2DkhwEmjmTeIqZAnqeshhsrN+4b
	5ZNiZ3J82PP5ahR8F0AWrVZDaRV9nG4vwu0plgohAqhhqHg5rZZRz92M3wYulZ8wRHZE/bt5hMl
	ALhyyHRi/mCfCVptiVAJLc0t1LE2RqgqAsfKVzogG46818eN70YXa+Pvxnyixl52H5nhRqJGrSX
	g2Z2RBvepu6IRIUkcPDYWQpMu6Fh7JyKy4OKfqYYJyxApW8/K2YE5KHvcjXRpAmmBSETA6VY+6z
	8astDhz2FmGN2FpqCquNGHqVqNH+DlBLsPkzU366vPp7/es8q+6h1Iw7bn89iEsOE+A21s3q/oL
	ob+l1/4YNXKuzlqAvTSVWpDDjU7QY/Q/PupwBmp7pWiKetIPERycZ7V4HirxCiqnO4qRM8mv5Tw
	ic25k9Yve4eG6O
X-Received: by 2002:a05:6214:5704:b0:8e9:f5de:d5b5 with SMTP id 6a1803df08f44-8fec3a038a2mr127470696d6.44.1783687341764;
        Fri, 10 Jul 2026 05:42:21 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d22bsm40069556d6.32.2026.07.10.05.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:42:21 -0700 (PDT)
Message-ID: <3cece33f-375f-4cb2-b07d-e75f065fe5ea@riscstar.com>
Date: Fri, 10 Jul 2026 07:42:18 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
To: Inochi Amaoto <inochiama@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local> <alBNXgMAwXPKwiJ2@inochi.infowork>
 <alCoTEDUY8AO9OzD@ashevche-desk.local> <alDNlfb0_T9g-ATO@inochi.infowork>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <alDNlfb0_T9g-ATO@inochi.infowork>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 5:55 AM, Inochi Amaoto wrote:
>>>>> +	k1->phy_count = i;
>>>>> +	if (k1->phy_count == 0)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	return 0;
>>>> This doesn't seem correct to me, I would expect phy_count to be assigned only
>>>> when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
>>>> different 0 in this case.)
>>> I guess you think 0 is a valid number? I can not understand what you thing
>>> Assign this to 0 if there is no phy is fine to me, which shows there is 0
>>> vaild phy found.
>> Isn't it already 0? Semantically code is wrong in a flow (not in the result).
>>
> In fact it is already 0 here. But I am not understand why you thing is wrong.
> Could you explain it in detail? (Maybe you think it is not good to return
> -EINVAL?)

What Andy is saying is that assigning the value of phy_count
before checking that it is valid is not the expected order of
things.

The point is about best practice, not about the end result.

Best practice would be "don't touch anything if the return
value will indicate an error."

And therefore, better coding practice would be to check for
a bad value, and only after that has been done should you
assign the k1->phy_count value.

					-Alex
