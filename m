Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B1409114
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143726; cv=none; b=fwjwTW+9mrzE6jtTfTD4TB81fTyfWLXOwhpjp9gxCKmZ/3/5rJ5MFG2rrq1kvzsfuCwcRvqJ49W5ViwwLPigiO+pFSloYMub35vi6725Feu6c0R6ELKgXpx8tXddQ1el2Jf/PNV6yx/b1pnCEJag1YN8+fi+W2NAdM2bhTpzkgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143726; c=relaxed/simple;
	bh=GxfLvy1lNLqnB7cOHn1e+wG0w1lu+LJsHvlm3Jjb4j0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Awplz5IGkUK0KnX0V/1Trc1rnRiEj+6/rP+jZ4XWz2EDnhS5utUkiBHQk3byoP1uiv3bav9OUYFTxvmGJEo/qa4Mzmif9JxmMNQrC/tbidS88LxxzdbjGX89l7KUs1uzUl0tiS5b/M2MZosRpdfDQ+6uP71MnQFb7KpCRIw6EV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwQ0qhGa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwQ0qhGa"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so12287895e9.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789143722; x=1789748522; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2u8iyN3q0EUKLYr5pleadR3LYPKgReYhURZxG75dAWM=;
        b=ZwQ0qhGaV6/PT65RDyP2g6qHmcWxAiCLfwzjGYgsaASBEHR8L8x5HdunFDG5OZbNpB
         78yGcMELWwm7PB6xD8CsIzzDKlaUZUYTXeT3VLBsaab0am0mlb+PR65D7IuaVSgETA2u
         jOKpYVLsfO+ZD0hHUpj8AD+FpElOyIVAoZJKmeLqN8qTuIYDvMeAdbcuD9yC1ILYMbyB
         G5dMJwLhJ26rumxuZwI+wh9Y8kiyFk4Pmc8R5mTbI1c4bMHGfCDYXC1Ni8uxObLxE48S
         vGX+cyHIrZEwSs0QXKqy6s+IxOst3rkYnR4DQlcFWrLZnM5+xa6sHjkMTcPW/QSncVN6
         Ociw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143722; x=1789748522;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2u8iyN3q0EUKLYr5pleadR3LYPKgReYhURZxG75dAWM=;
        b=p+hL44fTa/M4UkmPwsaBIPGzGXojgEb/PBZNM/XYJOV2CqxwL3OAaLFToMry8FJQqt
         Au7aW7i7FwFoXYP3NgMHRt6P8k5DGSgaNqxaApVEegseFpm7QVXVz0guCocRPATK7TKz
         zdUpIkxTZFH9vaVb5ZJ8icp41GPnC6nHj7W0uV9by2pOpnW2rkfRqgO6NmgusWLPAoJU
         33/Sk8alNnnY3+xrYxZcYX6ctjE/qfX207Tw4llV4BPpz+fjeSt4c5rmls1Az8i8Zh7t
         7x5SMGLLEYqisuBqutXAk8dHqOPOO1hDeBDOzuS9UA33khMcIqn2PzgftnvNQu8bm0je
         JmNw==
X-Forwarded-Encrypted: i=1; AKwUvBxlh9pKyXoF/TAiFccAssFXIkFsttiVdWCP4F5Nb5NcDNMqD9oSm7tT5b6S5NauhpcoaigsWZvnaVC1@vger.kernel.org
X-Gm-Message-State: AFuF++mWar+lxxs5ZXqlpvlNTKjM0yNLYzlSYAzAHUHYk27ILPpxWDCz
	Lc7GcRQSUUMAdSJremCblHKWPf0BBwHXLd9yt3L8Ke6haAs5hfXtsUi921X1/Hy9qBc=
X-Gm-Gg: AYBFou2mQcYOVFi/OAsnL2nLMkYjzJVl68Ge9sdJgYuPEtpI6UR44S/p87Q2lSsc9R5
	OcAmV55wmhIgA0gBLYYH2l/3wDI7dl29yebBZpnx2TeHppi3fy5H5OKaT0/tsaDa8Y+v3Y2SOsy
	WE6YwScp74SJNz2kYmSjVQDDNBHdV6F3098xItssllnyrCnj+y+9OY+1+Etykj5RGRXNzzB9AGR
	psiUxVHsUSpH5MZ9IMPzpc+PlQhGuu1yXaKCSZAfrnkleijb0QvfvoCVaN+wzJcsm+LP/l/WUE3
	zYongOrw65Q8pbNCVhsOFc1jT66nvaiDYOsPshQOGk6DJ5JJoMLhMRdY4HoTTpNRp8hgDgB5E0I
	kWSo6UcIyRlT8O/pAX11IJMvYbBh3OH7Xj4fl4h/4BYU2ryPYAb65yfeFOJNTYyhVn+WZR6j/rg
	STouwWVTBkGgR29XvrrmQpPbnhYIBEW3Ww5q9vhsP3+HS3etDUGjS5OTCpAqcn/cRuIvvTJcalN
	ggpTwwM+bwtv0Sgti+MyBNoPqEgfrX7b+R3sl4cN35cg9NFXYhMJCaSx5Vb9laoK6pcLK6G
X-Received: by 2002:a05:600d:6414:10b0:49c:fc6c:be16 with SMTP id 5b1f17b1804b1-49e619c64cfmr43100325e9.28.1789143722456;
        Fri, 11 Sep 2026 09:22:02 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm75330195e9.2.2026.09.11.09.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 17:22:01 +0100
Message-Id: <DLCMIMOI4D23.1YB1F2148RZE4@linaro.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Peter Griffin" <peter.griffin@linaro.org>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
 <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
 <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>
In-Reply-To: <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>

On Fri Sep 11, 2026 at 1:28 AM BST, Sam Protsenko wrote:
> On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@lina=
ro.org> wrote:
>>
>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>> information and configuration data. Add the SRAM node.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 3881f573ec08..0b614caa411c 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -163,6 +163,11 @@ soc: soc@0 {
>>                 #size-cells =3D <1>;
>>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>>
>> +               apm_sram: sram@2039000 {
>> +                       compatible =3D "samsung,exynos850-acpm-sram";
>> +                       reg =3D <0x2039000 0x40000>;
>
> Why it's 0x40000? I checked the TRM, and it says iRAM APM area is from
> 0x02039000 to 0x02069000, which is 0x30000 (192 KiB). The downstream
> kernel (v4.14) also say the APM SRAM size is 0x30000.

Good catch. That's my bad.

Thanks,
Alexey

