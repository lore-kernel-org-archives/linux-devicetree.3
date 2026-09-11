Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045C54A3D2E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143663; cv=none; b=KRfBDOArAWtb55edHJJGaIUINF9ZfJab7RViSNy5SOmMF6DNsh+m7qehi62wDXuWGBT3sg1YouAeGl+pYCDKMiIve0Xwhdz7iyBieFqGgxQpY3nXNZgh6qvY8K4OWeESwAfKTZBPr/99cYL8yAJ1sIwRjOusGCybGOWtECEyUQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143663; c=relaxed/simple;
	bh=Fx/YTBtEiBsiwaKpigFxNiDWpt9TDDyotK/D78aJG+g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CSFueK1VLtU3G4ee6y80i8/CyIrB0bonzlI82sNMtp9bAitqNW87jkhg7Pld28cO/Jfkgzbg5ZzTrVONA47TaCvbPMUQYudr+AxtT+fJt6V/SiqvhNnHax5DtWQOQxPBAPrTJVuE7Bpi/S2Caa0SUCYhtiS20VPctfjIEoMzYTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1KSxMOi; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1KSxMOi"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c29432715d2so198027866b.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789143659; x=1789748459; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t3Ow0xpp1VPcxg35zy2Gpi2FWcle5fD0sYX/EFmyWr4=;
        b=D1KSxMOijjQCA7SiPHopfdOWWR0ltqCvRVKinHeFUWlZMFVwxAPpMKQTsgNBTwWZeu
         NJhAKAyZS01th0/8/DRLaVRYOsC43FEh5vTInFlM7Uhm9ftytIzlReehp+xqzMD5G4EW
         JTlqdrv4bdvkN5yVll/uO0eBuh4DWZ/KdYdOxkkq9mfuNBH3V4TA3oN2ZJ/lP68ypUjS
         dQKX7kaXs5QCAok6PEUCVk/a82ferJHK51qkLQ3ZI43NVNfrag/LFONvxF0p/rvrvUDX
         oqsKL3mGjNFH6gyUi7aOfohIXa/l7Ev+Z6080NM/U6B9DblH8kn32SIGMO+N6f3Dr4jJ
         wLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143659; x=1789748459;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3Ow0xpp1VPcxg35zy2Gpi2FWcle5fD0sYX/EFmyWr4=;
        b=El479FVRpW6NAhUPDjWYFnuR1Hdg+/3ys8gTtBGKY5y4qLDeEBijF1IbO4x4elFs/7
         E48P7GrHJ9i/whDh8MTo6OWyvUb5l/q1DKOvZNDRd8dU711XLCQ1xmra32Z9yyJrT8HW
         Ee+ZnIQm8MuWQDUEfObhLdp2S6EggLPBiHF517W5vLZ+SGrnr/kiQKRLRi1lAJKvaX0w
         OmvonqfmlRmBpOjTV1Fh7MEiH+FC04zw6K5iS/8/jeR3fkxwX7jv6xm6mtHFmlj8PZNG
         bSs+JwvFgxGBzojdovxFQqylv5SkQ3/1Mkc4pXyqYgm1Q+9cMYNmWAy4kdl2UTfCSTPn
         NBtA==
X-Forwarded-Encrypted: i=1; AKwUvBzJpi7jzVaIXaaXfcylcF7J/UBT+iGMoQ0Vzd5JMNdqeRP9PfEoEJTieadxpC+9fvQJUa9UueL85Avv@vger.kernel.org
X-Gm-Message-State: AFuF++kdN0aZHQbduHeCEbNnNL4Wbj7qrjD/hJ5Q8biJMua9EXvMitU6
	8W4dW0ytzu84ynZ9nO/eGNi2gjOlLJQ9q5BtVE6dqsayTJQCqOJ6NIaVo37953O7YfiFBCdhbEn
	Ap09I
X-Gm-Gg: AYBFou2QIC9k7/GtR51eveDYKSf1e3m1cWLNRliPdQLDPo7GWWUhHWNZ9sqxNFFnCOa
	mZpwEpTnTRS02alDU5qKg995cJtVoHDu0+5zVNZQsumPeXQVany1fcoFX5tN9TdY4kTGk80yI9o
	6y+zv5grHUTWrgSlNNzV+4kaeX3rwgbSJdKViFCg6XnVUTnH86H86hm61shN5QrDrNbZ5+1MgEO
	ds5mClsNkiZ9oyNWYofusYomFyy6Hdp5HfhNNWfiI2R49+P/dY6HX7Ew8PFVFkjwqyPXcI05+bH
	z6hlXFUYH536ZOO+5mvVpzin2IdnsDahsVvBaYbS749JPGEwgbMb9NpVN6EeIJ6NDGVS2bdRU8F
	GO9f0iPdTRMdhKo9/Gf7l34laqfymG+rNUSvYr7nxVaiqXq3ssqBL/nEwdXgUPqw7Lf+Gj41lle
	1nXY3R7tA0h9+RgTKedZ8CxoumDch90i4CW5I5I3yehHSD0gnwJBcM6mse4XcylIMeT5QfHwZZH
	I50XelQl4QUyE+53iAJq88gdqQDrjoPkhddltdap8ovkiZTVXzDEkzDTIfw
X-Received: by 2002:a17:907:5c9:b0:c26:1691:b36d with SMTP id a640c23a62f3a-c2966a6e21fmr221558666b.38.1789143659129;
        Fri, 11 Sep 2026 09:20:59 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e248sm109763966b.2.2026.09.11.09.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:20:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 17:20:57 +0100
Message-Id: <DLCMHTJ9SYL0.3HW3W6N3PFYWM@linaro.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Peter Griffin" <peter.griffin@linaro.org>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
 <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
 <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>
In-Reply-To: <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>

On Fri Sep 11, 2026 at 1:42 AM BST, Sam Protsenko wrote:
> On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@lina=
ro.org> wrote:
>>
>> Document "samsung,exynos850-acpm-sram" which represents an SRAM region u=
sed
>> for ACPM communication on Samsung-based SoCs.
>>
>> The SRAM is consumed as a whole, is not split up using child nodes and
>> properties related to this are not required.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Document=
ation/devicetree/bindings/sram/sram.yaml
>> index b83fc6831947..b9c4d4f3199b 100644
>> --- a/Documentation/devicetree/bindings/sram/sram.yaml
>> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
>> @@ -43,6 +43,7 @@ properties:
>>          - qcom,rpm-msg-ram
>>          - qcom,shikra-imem
>>          - rockchip,rk3288-pmu-sram
>> +        - samsung,exynos850-acpm-sram
>
> Is there a reason we can't just use "mmio-sram" for Exynos850 ACPM
> needs? I can see it's used in the gs101 device tree like this. If
> there is a reason for this, I think it might be a good idea to
> document it in the commit message (probably in both patches).

But isn't it already in this commit message?
"The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required."

Also: https://lore.kernel.org/all/5797be19-8886-45a2-bfce-eb7d5f0df6c2@lina=
ro.org/

Do you want it to be re-phrased smth like this:
"OSPM ACPM should parse the SRAM and discover essential data (e.g. queue
offsets) for establishing ACPM communication. At this point it is not
expected for any software entities apart ACPM to use SRAM so the SRAM is
consumed as a whole, is not split up using child nodes and properties
related to this are not required."

or

"The OSPM/ACPM IPC should parse the SRAM at runtime to find configuration
data (e.g., queue offsets). Because this SRAM region is dedicated
exclusively to ACPM IPC communication and is not shared with other
software entities, it is represented as a monolithic SRAM block without
requiring sub-node partitioning."

?

I hope if there will be other software entities then we will be able to
fix it later.

>Also,
> should "mmio-sram" be added as a backup option (after comma) in your
> [PATCH 2/2]?

Sure, I can add "mmio-sram".
The compatible =3D "rockchip,rk3288-pmu-sram", "mmio-sram"
and compatible =3D "qcom,rpm-msg-ram", "mmio-sram" are used in such way.

Best regards,
Alexey
