Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23B324E4C6
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784426859; cv=none; b=mNBlJo5IZ6QRFybP5drfKX6DwZRl7Phe1QR0mV+PXCpAyo7/F0VXoczY+m/YsOc/g8/+MEaPFYVrG6yGH/ycrFdpwa+zs8E+l8WYkWQ859nidMXdpmuZ6PKIeDfFnyF8p0NvleywCBVxpqvIcONUXIat8IcY5f8iI1215vKmQRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784426859; c=relaxed/simple;
	bh=0U5P265APA9y42OE48PXJRVs+DVukO5q8VN35MNnDus=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UZmNjegjqpTaOAEGfDH1lPGbIaBslrk/u5i6fIBYoH2Gdj6ahVOcgJHWYfQ58ZtLnE3lLxIRjDnMo95MNGpn751ChppgPXevsrrZx2IeW7XN96ZFhSm6CXRQDiRtYk43Z3zoIgxLfkWWIRRsVH20Q7Y9U5zz2HFcLh2wEvtc+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inbb7BZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThyXdgcD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inbb7BZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThyXdgcD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66J22Zs52177430
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bij0tRK5KgUgPL1VneMcyKdlpgkQ1t1V4gnjIpr3G9s=; b=inbb7BZ94Y8yja+z
	5N4QJkhLH4yo/P2TXNa0Hz8VPLBE/0RaFG8qa4X/0rB9RUlglayZJmrQEstzsswY
	/b305XSVWcwVwKwwHzaMPz+9Djf27r7i95ToKjFSRphNqYrWOfQWYxUredWUn9Q+
	Gt+K3rwXIBrt1/pYo98Nhw2kopSrIikHPCAqBTfEW0j85rYj+UzDg81oUksOv1c9
	FtXL0J2cJsXtkF4Gncm1gny+Y6wKWnGIaQvlWYMsBcwN1mpCbIiuWUyrtBohYBEq
	NF0YblUiPGlvR89hSLYhTQa0XaHk1oJs5N91KMUqvqOA7OpGd/iwQ/Q878pZ8ld3
	m7fr9Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chhxjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:07:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848544a8496so6702918b3a.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 19:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784426855; x=1785031655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bij0tRK5KgUgPL1VneMcyKdlpgkQ1t1V4gnjIpr3G9s=;
        b=ThyXdgcDqB5S5LcgqytgmPMsc5fT1+4zBcwmpBnsar0Mv/gMGTI5+cigdF2E+qmbdi
         jiNqf6aIKCj9j1V8VJGvmpiBaOOH34LUep0R0lR8b4HRU+JTF2YPd0P8WY5ALGQ64/yx
         LKDqbsG9IYSvxcN6G0VeDgEdvwQY3BA/HPd4rTYRvce6PeCcIcfrJCP/JyC2n9n8EhBr
         pFBEzJihgTF4DASP52kxvIvR4DciuR3tiwsekM1XdOH/qZ4qeMjXuzH6FIRsYKTGkgKa
         cj8z3JzvDwUY31moEnRA7vXAuOT7NIMuO0g7UAjNmHwLuBNm6DOj1K5Lv6OxGFjlW4lm
         S5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784426855; x=1785031655;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bij0tRK5KgUgPL1VneMcyKdlpgkQ1t1V4gnjIpr3G9s=;
        b=lcHl94UeoWWAEm1I7aTeGKtU1psY7KXzsCSKB5iBkLzsZ/1ZfkPjmBwE7bauCeNUrp
         Sjo9yhtNZ1f6oElnTvs9Fmi1BllTWKO30dAC17CJzhBsqco6aytfNSppmddCXlKth0yD
         jSfyCdERwKSLDdZC1Vl4m41o5d8WjAwPOLWjQDDp1Spzty4N8QCcHi3ZefGbnbInXmxL
         3Mv7x5Bx2iOAMzs0/Rk7n146EjJzRt3haQBNvAbGaGrO4r2InAUyw4DeohpQRNGYhth5
         /HwosA1YB6cXxKw1DQ53+SsUrByrfBA/5yofJ/X0dNA3PwqmYMk5BfpoGIkmq18Ez/EE
         F/FA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2e8GY+lbyn1nG3k+ipJn38X7w0wCktBS6Bm2X8/lbczdGWhzJFQvojoRioq05Ia8RxMAsYJ+riC49@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZiAYupu1gPTTmbX6ZlXH9lA4TlvMWHsRKEzQeUzm0e6m8KNh
	ZavKQ0RBUaU1x4vKQCkfj8GkHnTN8SfA51hZzcn7AhWAjo7BWv/0DyZTFvE3E0jAJnk0z4LsGYS
	3unFPYvS5J9ZkqcPxI/1lTndUqPFvFa1SKqpNnbeWha+G9oVcxCthjh0WGa3Yjs2d
X-Gm-Gg: AfdE7cmlpAwPRlK7mcwNeB3/FYgcLqJr4BzwvsErAziyTclv5Ao9gUJQtKEQm5bOW7e
	noKwWKOJ2qqZBs5VRQzz2T+80VOu5LOFhD1y6jLT+jqT4CpzZZrMvJ4IVDV1ubSzDi2Kl1AqDuU
	RLqt8xZqnFoHlq8ZPbY2F1LEhB6gHvIsrq/TxkwTRX+Tw6RXb/VpQThx5j9T9CLOWBzsuuJ4yiS
	bjQI6kCNF2WyP8UQUelM8Vk3AJ9NXIS604DasTEHMFy7hDly83vF1y4JxGdUTuaAxt9f20SFDCX
	RLikDjokOGj/iRe9nHVrl4lHshaW3MtF1UG6xS9lxaMnwn24cwGeJBHlogvnGGeIP2UqZOTgN2N
	TcFEDdldd0vyS8BEr
X-Received: by 2002:a05:6a00:228e:b0:848:47db:a0ac with SMTP id d2e1a72fcca58-84c292ab554mr8722155b3a.27.1784426855543;
        Sat, 18 Jul 2026 19:07:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:228e:b0:848:47db:a0ac with SMTP id d2e1a72fcca58-84c292ab554mr8722131b3a.27.1784426855066;
        Sat, 18 Jul 2026 19:07:35 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c30fb62fesm2946475b3a.29.2026.07.18.19.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 19:07:34 -0700 (PDT)
Date: Sun, 19 Jul 2026 03:07:29 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich
 <Michael.Hennerich@analog.com>,
        "David Lechner" <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
 <p.zabel@pengutronix.de>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marius
 Cristea <marius.cristea@microchip.com>,
        "Marcus Folkesson"
 <marcus.folkesson@gmail.com>,
        Kent Gustavsson <kent@minoris.se>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Janani Sunil
 <jan.sun97@gmail.com>,
        <linux-spi@vger.kernel.org>, Kent Gustavsson
 <nedo80@gmail.com>
Subject: Re: [PATCH v6 2/5] dt-bindings: iio: adc: microchip,mcp3564: Add
 spi-device-addr
Message-ID: <20260719030717.3ec27870@jic23-huawei>
In-Reply-To: <20260715-ad5529r-driver-v6-2-cfdf8b9f5ee3@analog.com>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
	<20260715-ad5529r-driver-v6-2-cfdf8b9f5ee3@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAxNyBTYWx0ZWRfX5GDIRrvYXvWc
 qXNGwxK9tPEvrnhZwWBWFa53+BYLxyKiHvSSOj0carfzUCsMj7MPwlFm1fYbaVtdDDqEhcbqDln
 oArEvBTHJHuP/6KnrUGvTFWjHQ7+Ff8=
X-Proofpoint-GUID: t57FftQHFAauY6Eomy9k1c_IA1O3RVLQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAxNyBTYWx0ZWRfX8OjZuBZtu+FK
 yjA2llyU4wanSAFztMZLw5Ih2N2h7xIodc1JBTC14fnRVlcyiOoIccWuAF6kJMyqITUEB/Hr/4/
 /y9JQOA6nQcMcpNrn6a1IaI9KEWg71Bk7MkZU/9thmdAR4LksymQ6k9IOBByqswR5PU2l6CbH8+
 TGuKHr+tXkSjqByoPpp5Z7X6aK+oCZvtWoWS9ceZl2Q2clZukkxv50b3tPRs5RKHjc8gEygCPbv
 dxmSmz30QvUQ3ORoOOxv1odll/E8X4F95Gmc5y4xMLUP5Q+A02lwiOsOadqsj3yw2sj8J1AI6v1
 p58NITs8sk13v15fY+5GcwdciXq/V5YxaX4S1oeca9tthhEuaum/nd8SL5sjQnDlrxjvBj6UNrf
 pGK9DYR9J5kDSp7u/lCNn0GjKuWum22US/ypmlB1NiJqcAlA4nUv61fZwVa3A0ctpsQnrkavFRK
 QGozAU248Wylzs++IGw==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5c3168 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gAnH3GRIAAAA:8 a=WutwVF5OcC7bkNhAIqMA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: t57FftQHFAauY6Eomy9k1c_IA1O3RVLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190017

On Wed, 15 Jul 2026 13:41:05 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Add the generic spi-device-addr property to the binding and deprecate
> the existing vendor specific microchip,hw-device-address property.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

Maybe I'm reading the situation wrong but I was expecting to see
driver patches as well. Or is the now deprecated binding element
not actually used?

One other thing below.

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> index 675319276197..02bb198e9fa7 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> @@ -80,6 +80,7 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      minimum: 0
>      maximum: 3
> +    deprecated: true
>      description:
>        The address is set on a per-device basis by fuses in the factory,
>        configured on request. If not requested, the fuses are set for 0x1.
> @@ -91,6 +92,11 @@ properties:
>        clocking of the device address (BITS[7:6] - top two bits of COMMAND BYTE
>        which is first one on the wire).
>  
> +  spi-device-addr:
> +    maxItems: 1
> +    items:
> +      enum: [0, 1, 2, 3]
No default here, yet not required, so how do we know what the value is
if this property isn't there?
> +
>    "#io-channel-cells":
>      const: 1
>  
> @@ -123,7 +129,6 @@ dependencies:
>  required:
>    - compatible
>    - reg
> -  - microchip,hw-device-address
>    - spi-max-frequency
>  
>  allOf:
> @@ -159,7 +164,7 @@ examples:
>              spi-cpha;
>              spi-cpol;
>              spi-max-frequency = <10000000>;
> -            microchip,hw-device-address = <1>;
> +            spi-device-addr = <1>;
>  
>              #address-cells = <1>;
>              #size-cells = <0>;
> 

