Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0016388879
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015068; cv=none; b=secKMQt1wcQ1ONAaw34MzJ/CY6YQedAdCxWuVw/nqQt07xHGnQbjPZDybhxoGj6GLo05E9PjCVs92Xcjq34ma5AWWIAWHoteSb7VX3jPY37eahltafUV5AayHEJECUs2Qk++TUfPJ2Ukovug/30XbGNgpn87zJ3eLNBfFpM9egQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015068; c=relaxed/simple;
	bh=wtwQ6JzEMapAlW6zEvQWmul06EKyW5l8OOrIKIXFqHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7bP4w8wtz0W7xvwvacTQFQllqvggrkbVXr8GUOWBiJtWB78v1s1FGg4Gc61ZnItv6ghsN5shh66Tt+ZDziBfH4A7VgECVE2JOPIHoIhmeht3+pS5wvuKzC61beyFY4gW1z0kUZst+/MHwfGq3zIPEi2qfReNHWmc6EU+xQl3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso3851705e9.2
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 01:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791015065; x=1791619865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UOj4UBtpSDtB1u/mynjbblWtbQNRWQi1yFF6YRu1C8=;
        b=W7d6oievdIoG2/hoOPzdWuVdIOLOtqw2Po0338ZCiuRhcG/eIAdKRgffbwqJDeh9IU
         X9W3jmbPF6Td5j3evRPiTD6ShHn9hW2tUZ83bW7R27rx7792KW3QXojeRnlr6HKmWEXm
         PdDOlSKwyKz7aqd2vDiluKRKtkSbn5lKoYrlJNdUx+KbdU18kFnAGazgv6pbZH+OPnEG
         1p4ugBrWx9pf+61N9YXaCcXU/MYT1eFkATBKCKHkeVLHyzX6O/8PSSxq2nusua3qkU1T
         Fc7K6uraOpMC1DhMmIyI+jfpGahpUJLZeJ9J3PNKmrv/mVjQX/NZGCScnF1fkFOIiCms
         32IA==
X-Forwarded-Encrypted: i=1; AKwUvBznHJMuuwcyJdETXbblqlqUtFB8XyyaHVkS9PLVr6mXRxgEnc6md2ad4ap+32lcEkQjVJ9cLQFDtCFr@vger.kernel.org
X-Gm-Message-State: AFuF++mcs0sWgKduzV30q5jQMxaX2XHigqPCct6eShF/jS86N8b9DDvj
	0FYDgXWOgE0Er51sDPZNaTitfTmKaukmswoT5Hhr/AQ81HFgqMyutD5P
X-Gm-Gg: AYBFou11573cl7SukylRGi0fQGgpppKxsj+Ko7vOrnIBzCcHpRrXvexjs+y9rZvD8R8
	J0rBjYBFSLoSqb1c0W54SollIN1SBLuci+P2IwduU3918FFv8cH4cbUTRxic7VdtaPhQbDTL1uW
	GRqx/zZhqDsiu/3XF41ed/45B1v/hmuM19s4zSbwE6RWY4QCw7K5Z9s8Vx6XmxSSALtVWj9yvGG
	SmqwemZAnCR3oalCATemBLqSOyxk1RaeokbtVQQnqp/l4pxWsgkrxZAZHTb9k4weVnp+JF4v735
	xuPZsuRZJfs/p84aAOox4ZED96/R7q5U83lKuLQb5cKUMknadD/VPRL3X0mn5Agol9TAKz41qXS
	FaGGBRZAydV4QyRXzdXthrsLdI8aMtPWHWDhjHwt+p23aEr7GncXiLbCFrEqEg9KfN00CCIUA9z
	UoqdKyQpiATSkFynpmmGmEUOERODIybB6xoLyl+NKY2dOf4+oz47HocarVPsvSTI9eW4tR9p+RE
	i+JRVYWGIixBeK6Q/oJ9EYD1Yv2
X-Received: by 2002:a05:600c:a011:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a02756716amr80264645e9.10.1791015064857;
        Sat, 03 Oct 2026 01:11:04 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e7esm10140636f8f.0.2026.10.03.01.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 01:11:04 -0700 (PDT)
Message-ID: <b3ed6eb7-2d32-436f-a984-45366389d0da@linux.com>
Date: Sat, 3 Oct 2026 09:11:03 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document
 the T7 pipeline clock
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-2-tanure@linux.com>
 <20260916203701.GA1463751-robh@kernel.org>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20260916203701.GA1463751-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/09/2026 21:37, Rob Herring wrote:
> On Sat, Sep 05, 2026 at 04:32:31PM +0100, Lucas Tanure wrote:
>> The SD/eMMC controllers of the T7 SoC are physically far from the
>> NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
>> in the middle of the bus path to help timing closure. This stage is fed
>> by its own gate clock and, when that clock is disabled, a controller
>> that starts a DMA transfer can never complete it.
>>
>> Allow a fourth clock entry, named "pipeline", and require it for the
>> amlogic,t7-mmc compatible. The other controllers of this family keep
>> the existing three clocks.
> 
> Did the SD controller not work without this clock? If it did, then this
> is an ABI break which is evident by the current warning in linux-next.
> 
> Rob
Yes, the SD controller doesn't work with this clock, so I don't think is 
a ABI break, as the current code doesn't work and the board crashes a lot.
And a few patches got merged from my work, so I will resubmit a new 
series for this.

Thanks
Lucas
