Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D10C30BBB8
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157247; cv=none; b=oE3piI7kDEwzh+HgW16Bscfgd6K/Ie/sTglXmI/6HwPkvb6LlxqRcc6GvRx53kG8e10PYVb5B2+yfvmhx15CIpoUDIrTnskCbGXK3E/F2ard0MRQ26y5vcXAt0ood3+yc6Pc8F/N9uiMBg6NkcwYzunzKesM1XcUnBIV1Lbe8OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157247; c=relaxed/simple;
	bh=rIrkXb80Gn7kwO+sP2E0LkaZFepFX2GRT4jsp3bqoxo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=eEhWszyMRpuGlquKOwCsSgUaKNQbEKGtdYwfGzdxnupso9c4YdLmdp/mD6TOnrQMlid9ukfP2LvnJr52UjjXDtBegkMsRer8u0HvPIijomTvIe2Nwjr90LEb804uhVr8mSHoT2HNtKw+xvHWkq84g80QHt86QQ8g178WuybAegU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SAZxmZhk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SAZxmZhk"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9c745e18a0so729303466b.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776157244; x=1776762044; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBYUs6vtopkXApMTy5KoL+CYxoYocSKqj1Le8Qpg1Dk=;
        b=SAZxmZhkleEpARgRyXAQzikRx1uApATyEcT1W9F6IqrDpLYdO3ejmzAWCufR1Dh3UL
         l/EU9bKvfvaUHnvdus3RsDrxhnmF3vj+l/md1o9GYCHIa3YUFA7nM3t1ffs4MJdXUGYx
         inNYMR8DPD8I3iLk045CMx+XdY5DcRbWYnx9HgwPixl6zlPUMFyT/AKSFRARpSBmzHI7
         HPsg8GDvBQOkkSU+wgkJKVLmyxTum29fo18wo/k71om1qDwl5EIQfBy0fD5WKkLgGr3n
         zvEr3tLwXgEdFpsPSeJDxHIICZG9TicBehetUPemRYXqI3FslqopMZh8xf+gemeVwVg3
         wCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157244; x=1776762044;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBYUs6vtopkXApMTy5KoL+CYxoYocSKqj1Le8Qpg1Dk=;
        b=jmMWv+274tN5HyYLfqxe2c3825n8KNHB5eZhPAQp17LdMeECmHXrHCMK3fz45oNhFx
         K9WbEO3WPVutoE6KBKqqeL1vSGCtWtTAxiHZJ+Q2sHbZj5p33rM+G+tnEauMhp8+V2pG
         eNvKgB0L0oA8+/2HKvGG3CLziaSrLjg86UYwGioP4Kz32AE7h8Px7D46dzjPnBt04vez
         2zFP7Jgo9V7Nt2+kX3vSAPU3TigO8tlTRXp42L1fbEZbcACNZXzdIhtIqOb8G0Xccmwp
         slYi2brCdYTmK+1KmIhdyEKgDQzqb6dMNAoEqESCMElDcrMu/p/WVUQF9hDfW/sfWbxh
         Kitg==
X-Forwarded-Encrypted: i=1; AFNElJ+xKvB9A0sZGIrAR0lJnYzAa59MGMvSSOKByfYux/hDi0Yy4qJBkBWVdbYHvSCDF8Q5ZyaoV7Rh/kNP@vger.kernel.org
X-Gm-Message-State: AOJu0YwhOoyR/bP8l2onlwX0uFGivm8iAYlC9Zn+FqegjrldTyBBkTnA
	0ZbMLzEn60Fky3QJxNmZQkh8NfyxUTB/Hv4Tx7e7FvwTxIW3n/yyy92suzrplq22woQ=
X-Gm-Gg: AeBDieustlrtzg00Llw7vhzoJj+Y56UVyYPF6BRAM6vOnNwT4//7sXKAVPk6koegU7r
	p4dAsMUU9/4+oiLtVS8qJdroN8l5Kq71R+yy76YOhIgHm+ei5V/mm0BVSp3VTaeoGjdXDtboNqR
	mDxHgtQTrHJilC+aGqAZvHdjdL1PARGw1fqm0jsaa6WHds9ldEopAxv4oIFlNUnGvkFszJtyRzs
	urAmgPXnfUYYAo393rFwL8JreSgErc2pUcP3vmhoaDARdWIp22kRSR3/J1PV7XNdS/Xyf3XZozU
	arJ1avU4+9VV/No8gQOpXO10axzf87r7NUPhK5DS5LqBGtpenKcwRtCcmijbcPKYL6pK8Odc4A+
	GfRgZJtlPd4+ha9cGcdKlIpFfcHSrteGppeH0Q5+RC+cNtOkhAYroM1TiCur0ydOYFAY66xqWKv
	YwXTANRQLglg0Glf21JXMV2u6MWW0VawjhKr+wrVY7meXbVAMQMvzwd0e79EfcEzPsz5JaG1WLe
	Gk/z/HTSsG8Zt4XF0ZwU/L0HUz8
X-Received: by 2002:a17:906:6a15:b0:b9b:e7b3:a25a with SMTP id a640c23a62f3a-b9d76d2f86fmr806127766b.12.1776157242962;
        Tue, 14 Apr 2026 02:00:42 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e43sm396148266b.13.2026.04.14.02.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 10:00:41 +0100
Message-Id: <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
In-Reply-To: <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>

On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
> On 13/04/2026 16:52, Alexey Klimov wrote:
>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>> information and configuration data. Add the SRAM node.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index cb55015c8dce..cf4a6168846c 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>  			};
>>  		};
>>  	};
>> +
>> +	apm_sram: sram@2039000 {
>> +		compatible =3D "mmio-sram";
>> +		reg =3D <0x0 0x2039000 0x40000>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <1>;
>> +		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>
> You miss here children.

Thank you! I guess I should convert it to smth like this:

apm_sram: sram@2039000 {
		compatible =3D "mmio-sram";
		reg =3D <0x0 0x2039000 0x40000>;
		ranges =3D <0x0 0x0 0x2039000 0x40000>;
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		acpm_sram_region: sram-section@0 {
			reg =3D <0x0 0x40000>;
		};
	};

And then later reference shmem =3D &acpm_sram_region from acpm node.

> Also, 'ranges' should be after 'reg'.

Thanks, will fix this.

FWIW this commit is a copy of commit 48e7821b26904
https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linaro.o=
rg

Best regards,
Alexey

