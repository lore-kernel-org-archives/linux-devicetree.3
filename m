Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A83647141D
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797146; cv=none; b=Z/o8e/gOrE619XNkrh11Ndvs5fhZY5ELP3mic8gtg2GJ9FvkKYw+LOYM5FlrLZ9bAkdeJ9VZQbxlkQTUS4/SIbgRC2+Iv83pq+3Qz27/vEb//mAw5beprOJvpPZXTytz5SJEByT1NeFfPkvXXMGclq4oqcc9ygbzSZPXJKL7INw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797146; c=relaxed/simple;
	bh=8X3SScqloDoU9doUNCMRe6VMSKwlpIOqyN97cEzWq3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hrwOV8kLIKum8ynvpNRfIcavdK1LWQZQobXf4sJQJuGKgdjCbQForvaKCJIEhHQash4bbNffQ/oFwyKdJKAF1+Gl2Ml6dlgWpb1mKcLMBENR0MaISpoyca0mqvaG8N/cSA6/M62Z6lK6WpGxvWVIyuyn6hfdNGYWboHS6JkUz0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yubNWoOo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yubNWoOo"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a01933b584so14397125e9.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791797141; x=1792401941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk5ih1jl7s/qnH8PsiY7GfNUNgydrjBFZI1dErLjrRU=;
        b=yubNWoOo8Eh/x4T8H06CR/F+rD1eweFIIJQLahDIcgG27OqAh9EOmOg6rcyWwBT9H7
         iMqaBBNxNPozFfAWOKoPoIidldzkB5Y190nm8bmJoKaiS/eGNOGDWvJcHvaq2oVcyndc
         ewBLpGOW/y8vx28KC2FReYPRW9qrFPeUp1OB1czSm4R6ce/vFt+ZtMSX95Y2wfUfweeY
         GyPqtMpO2WGLZC1vsSRbynKu4XJrZoXVHSzIIKKgKuJqUI0XgIX1ZTeGQCgQdXROXqfz
         Y7ea9bYxTTYDrr4C9rgsctL4pmu8CUTOboVtKbyxvPCzA2BY2kTWZ5bcuyt8A0rS1Wzh
         vNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797141; x=1792401941;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk5ih1jl7s/qnH8PsiY7GfNUNgydrjBFZI1dErLjrRU=;
        b=fTdjIcPrGOdgDviCux/Qn1pUvNkjHx/Wh4TzgxPnHJnOh8L49cFPconyKUBE0cJB7Q
         4nsz5T62eZxLCyC8iSy+1IvXBivdmcmNzpGTkXxVir9w1DwkhVC4UmUXr6rz1YjQVEmx
         IUcCsVnroH6wuP6ilLVkliYnrU6J6hxUKdk/5zYQYT9nJYqf1Jsw2vMRSlHqKJeIDsF9
         mXzdZO9/xzb5R9h9jiW0zGi3l/VahUSearKyuQcB+pwoEBu6ZeTC9ccEMtQiLxyHmFvi
         Moak83u2Uk28La7QqnIjHlkYwkPYHxmsEdTeaRzciotQzVbnATaHEOGXcrc1zAtjRUK+
         Ftaw==
X-Forwarded-Encrypted: i=1; AKwUvBx16sJtA9XCoXfdsmIRgqAXQx3YeW/6Tm5mZIAhcAvK9cMqRHyzw8d/RuFWZOfXkYoPs8GDI8/XlVZh@vger.kernel.org
X-Gm-Message-State: AFq9FYKOLnP5jqU27fwpCNmRj1qOEPNUuPMvKiXjgd9NUwGELX+SVTIh
	jmO6uGax6/uRKF3INATCMcVwntVGsbeSpxf26gi8SSfU5nVVCpCKVkRWsmr2Pvgoe58=
X-Gm-Gg: AYBFou0T8boVJ0Wogn5fZy11wRKBIEfX3DdZiCOKbarMsQ5ESbhhByZiODDD9qRmANl
	kY9VsCcMGgO4Y3L94C6EOY8uAH5oKoo3ianvn80L2MDsyCl5/I4xpUthBS/rLUMW8l4GMQIuHrS
	3+3QvrP9nbvzaelq1PqFMPK59bDr7JzEYdplqK36MnVwYXILPZ3LmagBs0OyKJzDHvyCvAifXQV
	XKqjSGuP45ZO+yo47aBgDDTAPzmgrWSGB4awj1DU1y6QL/IEfFyHb+ySc+NqDkFxdWJ0UGTF84m
	H5qVcrCdKScKz1EubJwivjdoT5ztgsvAh8HL6550lV2w/KdiLGeq52zJowsmgjD4d/HeBmJOGjk
	jK8HhZEBLO0rqUubtsijtr5auM1KJdBny453F5OnI+qe0SWOst1z1v/aR77PQPGxhb4dj4aoWfz
	dFpPmLTKA2cdkLRo1QW48Fb/k2DiiJw0F0YoYLKE/RaLwj3m0MUmrK6oodBnAP4Vw1EHHma1tWc
	G9s5C7e1NxjJl4k1Dv/1iajyWu7bS1knuyUt8VxQdTQVpfPn1s=
X-Received: by 2002:a05:600c:674a:b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-4a18e4afe9cmr153244585e9.23.1791797140983;
        Mon, 12 Oct 2026 02:25:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:417e:f4c4:5b8:8c48? ([2a01:e0a:106d:1080:417e:f4c4:5b8:8c48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm345518685e9.4.2026.10.12.02.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:25:40 -0700 (PDT)
Message-ID: <255fe08c-8d58-441d-988c-9145f0995c6f@linaro.org>
Date: Mon, 12 Oct 2026 11:25:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 filipp.dunsky@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
 <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
 <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/26 22:49, Martin Blumenstingl wrote:
> Thank you for your patch!
> 
> On Sun, Oct 11, 2026 at 8:31 PM Fil Dunsky via B4 Relay
> <devnull+filipp.dunsky.gmail.com@kernel.org> wrote:
> [...]
>> +&eth_mac {
>> +       reg = <0x34 0x6>;
>> +};
> Question to Neil: should the eth_mac node be moved from meson-gx.dtsi
> to meson-gxbb-odroidc2.dts?
> Odroid-C2 would be the only board using it and u-boot seems to derive
> MAC from SoC chip ID/serial number instead of reading it from eFuse
> (so I'm not sure about the status of MAC address in eFuse on most
> boards).

Odroid C2 has a custom efuse mapping so it can't be used on other boards.

Neil
