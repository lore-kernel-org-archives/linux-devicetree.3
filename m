Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521348;
	b=APwWkQZUxU+Xirj07j9ztMKTOFexFKhG+e/6KsgWfXfnvKMW9aNrFa23k5W60k83eyac
	 yJT+a4uEKASSqrwNFlPBv+NltTEX5LJROXSAMnPEv98JydAz2xmgzSMTVYPxdV/6qgKgT
	 /WbhJIK2v8CUAMxdpigEKROObJ9NZx3/meva+RWfpBQPIvGgpMTVnuDwGwCNOeAnPYucs
	 PY6/ZXRHlMDznmyBFoMFrtA8aBYmi65KB+Sb71s5YxpnllLXrQOU1Bd4QmO316aCkQA2+
	 xtNXPaMY2ywy2Yh3W+OlLT8hr2ImQ0aGN9Fr7ad2jz7kh/IaJ7iZQ3gGSKXqzSgSE3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vnwt3Hg75Jqhq/RX3EnfxRob7Sm62Nv/9HL8t2YUaCw=;
	b=age+cwgLUz1y2mWLcurH6A/8NeNldzAncTjYUKdGLARBbEyVW9JboMjXnbKewlkMqEqA
	 G9f79DbHm4oR5zxg6ZKR54qnMEhJE4DiaiAU/BiaIP7Rrk9fTXscpeHZzLML2zKUWRVB2
	 DSJUpa4Jusywzz+1y+XIQ2A8pOYrqoVmRKdqI12AsU8VyWmIQi7fa2/s8KrIABSzEzOZZ
	 qs9wM5TRa0GrUIwphgj6D6MddTXIknS0nea5/f3aNLldYs3d7mcSKpgBKNmCkucV0cQSW
	 xrF5O/qpY6BQiCjo9jHzCKRtkRaSx5GPPpA/ZE1oHeBo7P4s2Qe7vUxaF42S4ygEDuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=f4Rq2wm7;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4066606A32D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4066606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=f4Rq2wm7
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2821641f8f.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 03:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795521346; x=1796126146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnwt3Hg75Jqhq/RX3EnfxRob7Sm62Nv/9HL8t2YUaCw=;
        b=f4Rq2wm7uaY4zAUXmqNT1XTFX78jWfrfq+IdPndw5IG+L+GBs4zOF5AzWDlhpInAxb
         kYnJot0xov6lABblQoQvxhHyBVPlGLtgU0/wt0anzGZPH9Nna9tLv36ALJ4HJk74FrRx
         j2pzG9WcXoJjnWtQhbhwt7d53J7WmvkthRw7wWr7WGs9zp0FjloM9f0Y97H2cMYqYYSG
         sjVx8GFIBCktfHhm/iS2gOjgL1ghVl0A57Cl3w2EHonQ9EahVleOe/Dlz9NdMYtkAvU3
         4W1F0ziI4PUfp7U8BZxKZWDZ4LLMyJ/AKODz3kjunuwhOjwYaVObyyAS09bUHGyB1PWN
         ILkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521346; x=1796126146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnwt3Hg75Jqhq/RX3EnfxRob7Sm62Nv/9HL8t2YUaCw=;
        b=E/umvyXwIXM9Q9T+lr+Xc0gujA7Bs2y77KdVTdrm4lD5DzSKmgbDxIsTeR/3izVYEW
         aB7L4PDWYVSFPWU92CtAobm6M7tXuxuYxAE0FO0Vqgh8yjC2r7RpqeDZ1jnHhw/EBDgj
         kYdydr/caxNUkp5jcx1524OVV//bG0WchZk3oiKyvF2MSvEsKXiRVM9QZlm/DA/B80R2
         AQZduUeh0SvHTNpyCeQJyE/rC6yeorFkdCszrjUoAn9/bv9sUAxc+d01BjBtjKL4Nuvv
         jo8gi28tiJqBH7uWQu3Gmu/JsHT9W4jEtfNAzO0/y7jJpu/cIgVYy1MDb8CdTurg56bJ
         0HuQ==
X-Forwarded-Encrypted: i=1; AL+hErHoksvuI8lYeNi+UQHl5s5Nb16hJe7ofWXS+VWAOCbkEqvNryjJG6/TLEzp0f3AqXZKnuA67H7u1sga@vger.kernel.org
X-Gm-Message-State: APuU4Z96jaK+39WEWScXCIcExsD92DFbCIGdA3WNgNWv1am3hjDslUIv
	TE1uLVntXh9lPLwA6gvFvL3nxVCDObJeZkBaw6Vu5Gw7OjEjA9LoKBnKLuRQpCDf5/FFYV7JD9d
	5AD/51nY=
X-Gm-Gg: AZFdTZcZNlXTzPr9n/bb0iXmuSVCc0lfxioTsyNaWQLLH/YEpuC/JWGeV60xuV4JR5M
	QRUTbqOCLQLBesGwq4GlNGCIHTx6mWbSGsgWvxl7JxOofEeZflIttbK+alPtG1sMlypmpf4y/vy
	GVkcbjQkFNB7hdestkKIHoNVptN0ofM8ClPzOOYOfJJYSJfxxJ/X1/+zU+tUPYQUGcNZmjA3A7Q
	xRxF3Aj4rQZAWLumKkjqtCQXZtVVirobSqYHxM1p66+PkUshQ7cn7v5aHP82SVqttzrQSffxVmN
	CjorA7kj8i+QKedttLtj+KfkfgazBnRYnuqdmuOCB5s1pthTTbE2QwEvs9uMRSK8aGNbtxvLnEq
	xYIucv++sxOgBqvIyN/hcMK/r/x684xr4dfCq5Stbm6vbcUIDDaRmTXa7g7hNzriB3EJ+DQvqBI
	wfhXPyLf6wyYZPjasl2s6nVBsQtsEQieuRQHr6pOb19Uq8E1+GAtE4IlbuuqbzdlVPbLQ9wwEFo
	emwKCKuJQo7LiG7AKO1c1tCTEAhPa451cEYYXcx1sPTObr8KF1lMtxdOd/79ANkKgzgaVS2rAN5
	G0+vptTcv1eyd2uQeKJFTsznsnlQJmOY8omqe56mmhvFGqre0E+OZjOyBm9GOMLgwqXILlFyTLH
	SdtecrsIX/wyByLlfjER/qdk=
X-Received: by 2002:a05:6000:428a:b0:4a9:dcdb:2e11 with SMTP id ffacd0b85a97d-4abb8406ea4mr29382891f8f.41.1795521346404;
        Tue, 24 Nov 2026 03:55:46 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm26566053f8f.40.2026.11.24.03.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:55:45 -0800 (PST)
Message-ID: <bc4234bb-8901-4d0f-bbf9-66f9715c11a9@baylibre.com>
Date: Tue, 24 Nov 2026 11:55:43 +0000
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
Subject: Re: [PATCH v18 8/8] arm64: dts: rockchip: enable the NPU on
 rk3576-rock-4d
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <0bcd73278a4c7a0cb2e1b8bdb9aba306355384cb.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <0bcd73278a4c7a0cb2e1b8bdb9aba306355384cb.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 00:01, Jiaxing Hu wrote:
> The rail is switched with the domain by commit
> b1bff9ced657 ("pmdomain: rockchip: manage the RK3576 NPU domain supply")
> in the pmdomain tree; without it nothing holds the rail and it is turned
> off as unused.

You can omit this part of the commit message. The dependency is stated
in the cover letter, and domain-supply is standard enough that it
doesn't need specific documentation.
> npu-supply is set because the binding requires it; no driver uses it.

So why does the binding even exist? Is it because it will be needed for
implementing voltage scaling in future?

