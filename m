Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E2030216D
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792243748; cv=none; b=j7KFOVI2TrfaN71uBQqw3ImBlAcjK6m5otG8X4f3/FAkcchXWMV1CjjmeMr53GCqUdavavhrgvResCSa6mTTaRJLaBZaPaHl/z9PJcrmZEplAw8gtZrxFe9ktMcvTCkvAebwZ8wiRXNuXHEaMGEqAsNqVRjdCbv+8hVNUFmsOu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792243748; c=relaxed/simple;
	bh=MlOIkzfTSdzbzhKZope6zdJW1Tz0EBjzJbGpxaanTYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJxl90QL6QGB2moR74f44ROEYKnwEnUgfhaUN7fbmbgciszNYdpumR6Gs1YVF90y4ccIaIO4RPoHqaQkmJhP1VLPtuH+yvitmSwCrMLhLcI5D7ey0m0aRnp33OQAu9SMaXcDMThqfJiCr1sntjEAZiFeatRiI771JFA2EeNqEtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clZW414U; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clZW414U"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso340966f8f.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 06:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792243745; x=1792848545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5K6Tgc0KOXuZjCEEfd87yj6b3Ngd/fmCUzUiRYVE9w=;
        b=clZW414UUl7h40jP67q//PxrHJBSoLXux1wD0nM2w5ZS59YrsjPau85lNpMapQDCTZ
         B8WudYBkhKEmr6S1fvjeX3sgdnMI+q2e+cvqYNz6C646KM3RwJ/jqUAjjko+O6KDd+Id
         DMb34B1wrwvS8KatX5jTrApC+wNLRfbJrJhu6ZBza9SwyW23q2+iSqgRD3lua5MyyTWj
         4fgfaj2iIiDm2+c5Ljn4C/JceDLTx6zfy85hi0FSasXf8AHuxSKEXoBqKMHgu4OfUs4B
         gvq7GYejX5MpUycIKpgvfnjuf99lr++8oRjyu0jTErWxOupaVXxBqy23dfeVcUvrnE21
         c2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792243745; x=1792848545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5K6Tgc0KOXuZjCEEfd87yj6b3Ngd/fmCUzUiRYVE9w=;
        b=ErrNbEHXauNCwlWhI9c1aagEivOiNZqFUiaxxIEcam+aXX+/m6tjC696VX8io0Jxbe
         fDe5detITVryE4uymZTJlkhTI9/LHDf2JVhK8ic0SCMuCpIKjFkKvTz/TFDbhGJsgNIZ
         2xuALi9WoRrikBtn+3BJTJ+2PoopJKOkQnlufIzJjK0tldul9Ijd65R0qgYjid+AIOB1
         5VbhTuqDdzLP9NKhcKY3mXGEr/UsN/4jd7Q5BFkCdsC5V0fmuGyY2R4mkVAAKZjN+pBO
         u+i8JG/hBsAIsLDmKjQ/QKV++VxuKj4Bqi5WtbIPZl6VGjO72HjxOLM5xworpH8qEDYo
         A4hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIg/BB8J9eME0i0RpJyG8M6lyNVW6G11oHQnVO4+dpFQk9kzydv29+mEcL/N+b2s6B1+lq3kSkG8U2@vger.kernel.org
X-Gm-Message-State: AFq9FYJyifezqEyI42q7M5T/sxrBEjldx3uFXZHD+kyeHQ91Uutun4tO
	s5d0UaahgvLCe/+9EZJvCwHTBrV0wGBGRyLzzZSZodM/u3MhewW0W6HW
X-Gm-Gg: AYBFou1GDG+CNGvRxeLFrtd5QiN3WLE6kaL4E51iqGbum0N3S8Nlde4d1HUOfwqOL15
	eARnqzfdIDjyF9eWLEFHHmjVEGm9rIy8YETGZ52J422gZPyWNx5BsdwfB3jnwMvkYMycxl0amTw
	GVJZn7gTJBAMYOyu2dHvBqjZJQR5j9ijZNHZsCpQ2/puOxO6g8IW8Kp2V0bECOXMl32wpBnU8ed
	z3vlesFeHIdq0OmAc/P27I7ry5GALEP7vHZ/4QBzb34ZtyfZF79AnYdzcbKYtUc4D2wYYC06ZlM
	6kgiXukEW99F+xXXWUKLFGDV514uDcBmt+WtL8dlcoMub+G0fdEBptxvGx/38pELS7aNDbe7fjk
	+dxpzJXBP15HqcAWtYQOtBJuBXKTNv/DnTd6Hkz2NeFImuNyXvWzwfFEs29Oih9c3RKeFUNklI1
	uDpEQGoDX5rWLA/iLway3ufU6IT2HS3P+ms/n3FXs6oFfjGpxBJtNLxr8htKxXEk3ZDbLAvJAT+
	e0=
X-Received: by 2002:adf:e199:0:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-48e07bb98d9mr5122636f8f.25.1792243744983;
        Sat, 17 Oct 2026 06:29:04 -0700 (PDT)
Received: from [192.168.0.114] ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f9c41sm11998520f8f.38.2026.10.17.06.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 06:29:04 -0700 (PDT)
Message-ID: <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
Date: Sat, 17 Oct 2026 16:29:03 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 13:56, Konrad Dybcio wrote:
> On 10/13/26 3:58 PM, Erikas Bitovtas wrote:
>> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
>> in 2021. Add initial device tree for SM7125 Samsung platform with
>> +&soc {
>> +	i2c_17: i2c-17 {
> 
> This is not a MMIO device, so it doesn't belong under /soc
> 
Will move it to / in v5.
> Have you tried using the bus through the normal QUP driver path?
> 
No, I haven't. GPI DMA support for this platform is not yet upstream.
>> +		compatible = "i2c-gpio";
>> +		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>> +		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> 
> style nit: (foo | bar) instead of (foor|bar), please
> 
Will fix that in v5.
>> +&usb_1 {
>> +	qcom,select-utmi-as-pipe-clk;
> 
> Is there no superspeed / DP altmode?
>
I could not find anything that confirms super-speed or DP altmode on
these devices. Besides, ufshcd-qcom fails with "link startup failed 1"
after setting super-speed and removing "qcom,select-utmi-as-pipe-clk".
> Konrad

