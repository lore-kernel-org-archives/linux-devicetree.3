Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695965;
	b=daUTB4A52QDX4p5OwEll3jJwVvZYeYbcV4BcLoi8rqa8q0IdMj3itHGc4LAKbzuZRzUn
	 AnUrViHpYbJkVMxZWaZM8eMK2X0MFt0bDU18EYz+WTxtXdLY0G2VbxgfuzXoEYTeMOTBd
	 40wEq9zKJJ6e+0vLIJyFSEtchR97UxesdJzWdcx9PLwZ0XdoHgrPRV4OhGrQIA1BCi8Yi
	 q/fw2k41ujQx8Cq1DrBeydvFRkgnOKAMykEJcU4H1FR4c/pHYrriGc1lkYExkbO5J99yo
	 bqEIuJFkSK24/nmpxUzMtRsB32nSczAZQpekGMqetP0P7MYmexWW9/6ASG/aYWWdY9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RHBl9u4PW6S73EDeR1NNdDwKss/rh1D+3K5dZAbhGGY=;
	b=cedvDrDZrzInhhQzW4q0pKxJnK/E7/kKC7hpIw74aqxp4wDV0WJZEkE1CW/32JW7Kl9C
	 FqIMH2pA4J6sB0fql5I/WztJfspl5iczgjrG7L5nvdpWPXql4D0b1zGm9HmnWvPRvdPYP
	 QAI2DIoWBpB4+HTVwIWG+HWg1fNQutlcAU5Dl6sisdWLTUbm3YmZ4mguDlz36f0MaaYIe
	 zAWqP6Zvqlh160GQPS1N3xTq0V3SFTlGOSfdEA1MZxb6w0z60NWSl1vT4EHJlnx/6dinF
	 viBjp2fZ8ca7czkfTCtUGeJJLaHCnImPEb6znGn+EEkB18nfoGqxElxKWGt5sN8DKFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kkpeey0y;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3357606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3357606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kkpeey0y
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so43189475e9.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793695963; x=1794300763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHBl9u4PW6S73EDeR1NNdDwKss/rh1D+3K5dZAbhGGY=;
        b=Kkpeey0ycZBJPK+awNbsenphUdiA1HBnSjtXYjGhfY5uRNOtzFiSXHpBO2CsUDlSn1
         BR17Mtf+4UFo8KlNtiDO6kKqbyOVAcyQn2/e407Rg36fz0qJLB2/KvcdXqMWUH8Sm1wi
         NB74W2BH5B8hXPl5ZEg1u+piume7YhDXGoE1DwDJuCbBy+/axt89rbeinnTeXAaO8KVi
         ah/0gtiNMCR7nZCC5P6mf6BvDpvNEp8lkBDzP8Ow1+aiEopPhBfM9iR/pBXPMhE7rxOL
         Aimpz5/LbY8ztjW/DNCC09gMg4LamBkDuwZlAAsVceoeS53QCXbwFeOFkOb9ZJ7eNvV/
         xb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695963; x=1794300763;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RHBl9u4PW6S73EDeR1NNdDwKss/rh1D+3K5dZAbhGGY=;
        b=FSchPl0Tmd2EXod2w5BKS0iDxt42DKwp9bg3E7/08hHAIQ1+qttFDah6Q/M8BFHEyj
         ZevBn7bTxlg3hR0+SXE60rlY/mniHz7CGL6+OeBb2nxdg7RCUCSO0O+MJVjYzZdPyL4L
         5Rr8aYZVjr74M4/ZawIpPZXwJJqzkIXb3EWvc5xLDrARljsi4Eoz6KwyAhnkvkV9lPLm
         hviz8LfeHIrar8/maCxSKCWhQ/TNNYt0H1g85KrbdzUFb1VzW9pkyI03zsLn34OXDmI8
         +m9uApMxP75TbrYekx+K0MA8RepvBeuAvv5kyUEiXhWJZVqsOuADFWgg89SDaoautiRJ
         woGw==
X-Forwarded-Encrypted: i=1; AKwUvByJZNpZZRpsekCOt41ewILxVoMtk1reIq2iF2lJSNZpXNq8ubm3MWdQ0umQJolPbliCkhl6FRZAnfDJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/IV9bkA9oHrQ3itH3khrfhlclFJRX2xrwY0R4vsZIQvZOlXMYO
	7Gf8Oc3Sii+YBBDhNUN6YEJR78MGi0oTg9r7f4VH1ShUoqOHhOjctx8DZqRandw//gA=
X-Gm-Gg: AYBFou2pgyxPkCZkHZRn2B+Isot1MGLUpz8nfbac8kq6d6bwvYYLTUAc8hw8etvdhWy
	KOksnqiZ0/6pv8IGJ2ZagI9ljVRkXEjKGUjg/ssDh0pDooM9m3fvBt5bR7u1QNvH9jVqBklhCph
	AytcEHjfcyPCD4Pd7DQ+0FPQ2Aj33QLxaFyMhYMqs9iem5gID1p+QkFGtMufKCSsrVTYC+yM0ps
	KlRYUmtAGtA8zzQrt3ZaQG3l+ttggHB858h6xaYGMojqcMkJW4cx9glyioxbKSyhDvlgc6psog1
	hR5yuPLmlYkFnv6gNf12Uf64bFgfJmhDywBfhn/JWtwBvxVf4avelapagAakjGpSvQNMH/NKmfC
	kU8faWyqXruh2yeqACbEXVezWnWcCPFQgOCY+Tljkl7+ZCl3XHiXHngvQtwabHt7A4Qc/d9IwPK
	LyHKDczLmSefn4cwnDoVsnIqZ6fCE7P1BHNxt2JYmxPs9r/rT0V5x/oqGpRb8TzlOOa8izkpsY8
	pVZ4SwZkf+bmSWrKWr6ja6M5rSOR6gYGeIvHRHjOZVtz71QhHSAYdJTM2WYeIdxG/L2BlmUwmIx
	2pBglQm5UKQ7uAMnQ8KZk68GqV+koouvsAgR/Vamas1nbFsu+VgqEk1JRDygSiuDQALtYtsuZ2W
	Ok5FPN7I=
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr271366495e9.9.1793695963059;
        Tue, 03 Nov 2026 00:52:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a8c6a9e0sm43117295e9.6.2026.11.03.00.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:52:42 -0800 (PST)
Message-ID: <3736bdc3-0f1e-49a9-9559-5a3b7383848b@linaro.org>
Date: Tue, 3 Nov 2026 09:52:41 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
To: Igor Velkov <iav@iav.lv>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
 <20261102-ping-fan-1@iav.lv>
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
In-Reply-To: <20261102-ping-fan-1@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 19:20, Igor Velkov wrote:
> Hi Neil,
> 
> Gentle ping: this has your Reviewed-by from Oct 7, but I don't see
> it in for-next. Could you pick it up for v7.5?

Yes

Neil
