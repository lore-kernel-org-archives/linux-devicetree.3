Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648682;
	b=bLHj4ocSFb7DiE6xzsqmFEBoO/61SwLlDCdTcBHWcZE6NCcwVd8qnIHfVLqCOChVd5pN
	 3fr47GmchEtO/w4VCXWc/60JCwCRyjwLfwY5E2WnhLg0noqHbaRvT83ZzF9ARI55MTND/
	 hIB/Gi2/RasewcCgJRR07NRwyhx/d0PRjcHkZmjS14iwoyhONeu73AkgsMxZ+IT7F4ES4
	 rBT+WdRCm+KeFocI2dnjx1d0M/VvqF4X5JbBuK5IVxpn+dfdWSJ7zOdHAVNH/eY6qJjKm
	 YLixx4rfPq4RG2BzBJTkxSErPgrQnyASO2yeH5rsFjYSAhOpktUUvX5Jiy1NgeO9cpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=Weu5Zca/hPX7MdlI7TVErZ4xT18FxVN+YlEWkEZPcA8=;
	b=Pkb5trlAXBYRF5Pb1QuwXj/bISDZZkNwN4Hz+wLj8MsW5wg8zjrKjMf/1whrDfV5c0wd
	 RhMQkeOe3jPhQ03r1zOkro/8/xBaAUsBq6T1f5/eOYTllSI6KJ+SEzSNVWqysSXX5kWUg
	 n6Wags3fRq6/63OG7I8ZPcpJf592A6pSCOA3o20/7ntaVNVia3/NPcIDfRcmGM0T/52o9
	 FZLm7xeKFUTmDxjljvZgKIzLoVJfaSKkNI7A6WBwGAUqkbKBrymxIGDk43KICxUphKf2n
	 SjSl7R8eTtsRW/nLmRelcQmWuYcwJ4Z6SkFAxG0SVBfiO4g0RAN9MoUaBzJVT8Y+9Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v2zabGsB;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C440606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C440606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v2zabGsB
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2748246f8f.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793648680; x=1794253480; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Weu5Zca/hPX7MdlI7TVErZ4xT18FxVN+YlEWkEZPcA8=;
        b=v2zabGsBMccgcYnOKyyoJfrpcS6FC2kf1CeYjOep7ud5b84amOVeXc4O9Bn7QHljxM
         kleSVMzmTjk8J7500JVzYCCNljyqjHHUgpYpYmKtuYqxR+860A49+oGL6efFuH9uJKH1
         o9WuQnPigNB98hrxPxhmFhmrpcNTrCxsVh1HPM0+aBBM7CmTzECx01VZlas2N3sB+xpw
         zevN2gyXBQ+fCAZi91gsLVJTORdB0l3CzBB2NdQQ+kiJy6PW+JWVNwpb7SMh0QACuPNL
         7Wc16yRYdIpVtUDoiOkiPrknjvJYA8VEUTpxyooGhTNXENUS3pjVefS32oOjaz8C0bfv
         g86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648680; x=1794253480;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Weu5Zca/hPX7MdlI7TVErZ4xT18FxVN+YlEWkEZPcA8=;
        b=1HzhSheb6hyDTecTjPEieUqireev52mhmWiHdgJiLH9n+5hx2FlQiBhAhk5pXligF9
         A5yeI9y/RB097pXWgvYfqi30Tf2pYEM+aXY+M7Ca7vLXeLC5h9wzPtI0sM+ij4LmTpd1
         ag3bWY/YPROXbD6txXUB2skohNLbHMgt23/u4W/EXYvUEGrMYq53DfaS1xX+qPf8H2R1
         JAogbAwyCAq9EsgjJ16s72h9ze84QWycjsbqpLJPQQg7eF5aeBdTRK6WLPJKYOaMUc63
         7Ovne9L+t1aWN4u/vn12c4SAUYscxe8F5UcwAOlw1nggskyk7GyQstCAHIktCQch3fwR
         GTpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNVCcOJmqcXhPowxO3py34qSi7lL3zuUrsVaxO/4kcY1+9A7sOHfQwrGOH7PmwL9lBzYgB1vavu0mo@vger.kernel.org
X-Gm-Message-State: APuU4Z+qjCKyWGIo6f7x7LSLOhYPrqpVbaXwCuayRyQKJqd649oq2A6D
	cgvES1dZI6X23RyEzCKPIHgs8zH4EsM+bw1WjVCIqawtNPlcVmd+/2+USk/5oaygq44=
X-Gm-Gg: AYBFou1qX7Okh8R8OjQu1CRbtnrYcnkPIBEiuE0a/m2Afc8C8MPuGnyAyXy6nMoPyj6
	FFBaK5ToL5YQq3gA3zNTxBHS/+T2/l1oDIfiXWJwvPPUBx6hKcUR4JmzsdQ7JVAP2a16caoJRxD
	rLcfS9T2azVE/psdvdFI7bDvJEbBfHwoDcor4oea4dfRaAUxZyQytaHndSnDXjK+2wQFHVhQILg
	qa0KolPVyIPKnLM/ANH49E4XhGcCVZWYbhK/WYzI9/lLwbJh7kHVgoukgTAzx3+SnWA16SLuZ0W
	UofUQZmMumXXaQbFJW2O3LPa5k/aigVFH0PY6iFyorPDL2Y9s6BC7rEBII/0y5lnm23JJYTfqQm
	xewRch6Zt36areRN/9kTH7zfxYAmY1+9R8Wnn7986rt5DJSf1LO0YdO8z03Ypbazsb5Mv+eA8OP
	yGGQiLzTBx57t2OKFVqtsj2WXVPnkv16E3ek1pknBbx401OspFkUJqgl7r5Nt+aspzltlDln8ib
	gULQXWIh4Ni56Azv/TH5tuxT9+qiJ8q8N59ZTD/aJQ1lllYh9jTYQ+3c2QDRieOiRDQYR25G1/7
	jWALZ5CV/F84YeV1aWgasFgz3lIUb3mFXQ4cWnrufT/2qZPJFs/HQGxSdT9hhnyq4QECC/Zbytn
	oKzN+C4VBAes4NOiHsmiRLrX2g6h50wNaSmSVNtWx8Q==
X-Received: by 2002:a05:6000:2611:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-48e6e50c8ecmr23807080f8f.32.1793648679554;
        Mon, 02 Nov 2026 11:44:39 -0800 (PST)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm23147608f8f.32.2026.11.02.11.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 11:44:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 20:44:38 +0100
Message-Id: <DMKZE3GQVDLB.18QYA9ULAH75I@linaro.org>
Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Christopher Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Russell
 King" <linux@armlinux.org.uk>, "Rouven Czerwinski"
 <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 5/9] ARM: dts: omap: dm816x: Correct speed for
 sysclk5
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
 <20261028-patch-ektor5-dm8168-dts-v2-5-4544429251e2@linaro.org>
 <20261101222942.1a78c6fb@kemnade.info>
In-Reply-To: <20261101222942.1a78c6fb@kemnade.info>

Hi Andreas,

On Sun Nov 1, 2026 at 10:29 PM CET, Andreas Kemnade wrote:
> On Wed, 28 Oct 2026 17:06:06 +0100
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
>
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>=20
>> The default code for setting up the clocks results in sysclk5 running at
>> 1.6GHz whereas it is expected to run at half that ie 813MHz. Force the
>> divider to be /2 to achieve the 813MHz speed.
>>=20
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>  arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boo=
t/dts/ti/omap/dm816x-clocks.dtsi
>> index 76ebc6c3c3e5..cb990773b098 100644
>> --- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
>> @@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
>>  		#clock-cells =3D <0>;
>>  		compatible =3D "ti,divider-clock";
>>  		clocks =3D <&sysclk4_ck>;
>> -		ti,max-div =3D <1>;
>> +		ti,dividers =3D <2>;
>
> so this changes register value  0 is intepreted as divider 1
> to divider 2. Sounds strange. It just changes the interpretation of the
> register values, not the setting. Maybe checkout the register value from
> user space with tools like devmem. The original interpretation was right.
> So this change does not make any sense. I think sysclk5 still runs at
> 1.6Ghz, but it is displayed as 813Mhz.
>
> I would expect some assigned-clocks / assigned-clock-rates pair somewhere
> in this patch instead.
>

We tested on EVM with devmem and this patch correctly sets bit 0 to 1
(which is /2 in the manual).

However, should ti,max-div in this case be <2> (and all the other clocks
that supports two dividers)?=20

I tested to set `ti,max-div =3D <2>;` and it seems to correctly set the /2
divider as well, but without specifying any assigned-clock{s,-rates}, so
I'm missing the rationale of how the divider is selected.

I'll drop this patch from the series for now, I think it needs more
investigation to figure out why it behaves like this.

Thanks,
Ettore
