Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696169;
	b=QgBd1FfULgAIG9PQVwQANgDlCU2s5OhRTvyIuub9L2kUGfuDwoeMnB3rdtwI9zKKR7r3
	 QliaXxuvFcIJdLAISusQI+9qRY5KmRw2p7XQiXe0xGF8BImPDpN9Kwte/FT7PZDEQt1FK
	 sC8TWLzb7QWzD+6i5okx6UNbaQYMbadDzpaXK7k/jbo9RQFb6Vo4iBagqAPP1HQaukPet
	 jg3CtpFMKxRHJirmg+1GaCtbeB22WD4BnfvhM0Y8GJKrHa3noOMbYAWSR/nWCiUf3EZDU
	 rVzzj2Lrl0S673K8p1b1AUh6KgW71oWotwXhgOJv2dwD4oAqPlZ31E2Bswcpyyo6I9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=;
	b=zvDpa6h4fUWIaWRgwegUbePvdK/Z2/oIGkKPZooZYdRImkxF+vU8SyoEowNVvz22EfSZ
	 3Vqr6Id1hDh1Ndy+S3ac2FElf8coWVfvrCGJsZjdIJ8rTw4BQu1w7f/KDWJ77V+r64REG
	 LSodZ61JLBRhA89PDFCmpUEgnme2eWLVfgYHo6+XRNnf0mfAK6Ln6oerpTtiwbFPpprYu
	 seCZ4sRMKiaNPHVsZSVUhAOpVSCvQyPcsnVuqaJge//P9P1t9lAGDZWLvAFw+tOy/s5J7
	 ukBH46LJFs9KjNKHa7xQ23zPFQ6NMYXLFC1lNVtXWTvTKLseBtH5QL2jmz4ktBv+fAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f6U6NXOj;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19550606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19550606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f6U6NXOj
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3423159f8f.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696167; x=1794300967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=;
        b=f6U6NXOj6LpNXK2e4ZHQ7g+8deViShs8eUP1unXvI51aX1NR6sM+uV+0pCqmHDCSJ3
         3mrT04WkCBGPylph3oGhRe/iBc3jI2SSIJLCVp7c85ELserS9+0wQIr7GcEC3cYbs3+8
         jMSwBKRwOIeB5yVNpnR0Rq4s8efkk/tDbPbGjtI5R5/Zx1GAb4yxOvejsKDQWlvewUwl
         qlVu7x1CRStJKSX4IZTbjxlvgtxCNuRcncCngzweSRVWHRarqZIoUpvlq8QfSYSWTjyO
         DNSICeiSUVUlp8lDoEf/siV2mtbcEuly1Od109rCZe6gyOMVXAidKmR8NUiUnam01AhT
         Xy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696167; x=1794300967;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=;
        b=t1LK/81e3F4I5Lqli4N2HOlMCCqBsp4XdsH71YzhyhZg81P2r21xHRg0MTEGFS1tjV
         uPBGuKrl5dzoTy+oNI/2iyUaHzVMQ8uwvoMGOw9b2iCDkFbEyWPIFxAQLZJTrchArubd
         1AWqzCSnN642YOJ2O0ikMfXWQUbbJk/AfwCMjGLyfsC6rS4LhToF2ZRB3vfDTZSVd8w0
         17yfkTnouTGXkg9XjQTs0IaMBCQTZ9ftEUH41lkSVzcseBnpAdnXZHDaqrxNJ7cx98Tw
         d4DiWddJfsvqdbBdWy8sA/OAJkOlDNUEqTYUyfrAA7q0sgrJqh3mn8q/2FDJjNOd+Xdj
         jOug==
X-Forwarded-Encrypted: i=1; AKwUvBySvQLuGPhNeBwuAjWwWLPf/XQhfOkc9i7MsjHqE58E9DXQm7Gbq442J0mwurHrE+VxMIdT61UkuiId@vger.kernel.org
X-Gm-Message-State: APuU4Z90HU0NLMBHztrjG12t8ZQPfG0/btYOGuSYZwmtVBa5HCViNG94
	JWzwpE7NpJ5DXBBbt3NWiRPLU2d7ahd39dzkhwduOvFx+qHg2b4DetWPQqjJRtT8PoY=
X-Gm-Gg: AYBFou1u7+qgdBYEftMpLnvJ5/orYGk+JIK/VNsfybpwe31FnDIGZT2EywYGuwzVAg3
	ePraWsqb1bziLos+GzJBX1hEl9YUFdSXrfpKjbLnR7/Qf37e9ivrZaI0zB4xCu+J8rrK2mptipB
	Gjn8JW+1mQV6BN5LhQvMT2i/+9wUQA8y46hxKN+NYiTSepy0eWzT7gj2C+rmAfBGhDrKSOFKsWU
	E5Kggdo/EoBs7F86K+z0Ybe3Ipm7U8D2trvT2rJt5/HHqjUsunwswk9qDUKNFiuA1xTBC9NHW6N
	x8mXEIXEaR3HuhlV62UJdy1Df3MSYUhYAK8AAR0j9Qht18mruo2PGnzbn0gJQw140VWzLhQllbx
	OQrFMjvJkR0za5hTaru0MjmK5yYjRprIC3TtjeLqnAUZeePfL7VxB+/7x98eSWzDc6Do0gfacx4
	aMLc1fBs2mLVsn1yomGu8F1GKF6q92ixytWwyqHEF/gsvFzkd3Z3ZbstfdMN4QtjsPs3zUEtIqL
	opSXOf07BMQweotO0mjgsNOi5f37do+2bM+bK9X1FZuxoG/bFBfokBIvu5lN8qNfucZ+TBZY4il
	MddMDsZ5zN2SYh9/Lc5EpWk5I4ZLO8ozS8hSlpezJV1V6xv02xjt3uUaJnzaFl+ew4e0rzT3NnT
	s0GITpZOV
X-Received: by 2002:a05:6000:2504:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-48e6e500979mr30641989f8f.24.1793696167199;
        Tue, 03 Nov 2026 00:56:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e88876946sm4998576f8f.5.2026.11.03.00.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:56:06 -0800 (PST)
Message-ID: <c1c38ee8-5a7c-4b08-89c1-e1e27a2043d1@linaro.org>
Date: Tue, 3 Nov 2026 09:56:06 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] phy: amlogic: meson-g12a-usb2: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, vkoul@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/25/26 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The S4 USB2 PHY is the A1 design with different analog trims and an
> extra disconnect threshold; without its PMA update bit the host sees no
> root ports. Add a compatible and the S4 settings from the vendor driver.
> 
> Tested: both host ports enumerate keyboards, mice, hubs and storage.
> 
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a large
> part of the hands-on work: it read the vendor kernel and the firmware
> interfaces, probed registers on the board, drafted the code and the
> changelogs, and ran the builds, checkpatch, dt_binding_check and the
> tests on the hardware. I directed the work, reviewed every change and
> the final patches, and take responsibility for them. There is no single
> prompt to quote; the sessions were of the form "find out why X fails on
> this board, fix it, test it on the box".
> 
> Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
> vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.
> 
> Christian Stefan Kövér-Draxl (2):
>    dt-bindings: phy: amlogic,g12a-usb2-phy: add S4 compatible
>    phy: amlogic: meson-g12a-usb2: add S4 support
> 
>   .../bindings/phy/amlogic,g12a-usb2-phy.yaml   |  1 +
>   drivers/phy/amlogic/phy-meson-g12a-usb2.c     | 65 ++++++++++++++-----
>   2 files changed, 49 insertions(+), 17 deletions(-)
> 
> 
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
