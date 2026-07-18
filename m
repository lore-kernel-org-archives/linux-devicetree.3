Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D891F72618
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784413199; cv=none; b=mBbaCU+oYJEDjmgM4H/iKrQK7e/kxl6ZHX8CQv9KWl7u7XJ/8iMwaLBQr2LvkERzwe/BsYFoKm5Afq6TtrELuuj+U2JgBVlbp2YufgGmhQ/0bi5wgBakerAjGRwNziz1ZB4vfE6uTwMsNOYH7zSTtQGwWTxnHK9+KH3vdrNZbUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784413199; c=relaxed/simple;
	bh=uBQ8XlnqOMtNKgZqtoqvdpfI4CIFQ2BHelfCbW+fGw0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KBxe1MCx6EMzeuTZNM121Kr2eL/lm8vAAOJ47RAxfsCiFeAIj/9twGx+x9RMRYpCKkYz23lPlrxSTnEAxuo2n8sQHWz7FRnz7NsV1KBWhS7TDQXI0m/MOdRIaM1g4NyrEwBRsA17mSjoryNqINl4w0NW0hrzg/3XGYJCgmC/jMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHKXe/yR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DbgUTvSX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHKXe/yR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DbgUTvSX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IJpXB81352269
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSIoHX29BzBjnIxq4ol7lBXbSbHoZ60LqztgJWDtdzA=; b=IHKXe/yRaHMq1eKf
	iUOY+J0bLWQGmFRD4VkHY1ft2Y2SMgFE7ONLhZOq0WJMCvWPcCHEuFXxqkjARsTs
	8sqP9K52dEGalJvRHOo/+q8KBcaDZezZMzY6P2A+gd6jMQEV4g2L4w5apQ/NpLrt
	1LUWoSYJlrTZXgUHebAyo85ueTRmN3G+zSOYN9Ak8zl+XJKOQB2BbTJy1e9eOMpW
	oqhd3BUN2Y7JFZ6N48T50lz29sJj1VJtmtpeVgOwJSOo0gXRD7cyg5tUKDUAXGRo
	B7VDSurJIbiAP9SDwBT6LZQj6zuruXAmO7KfPd5qUgjQcPcSPWLSTFvVXk+L+lDN
	Ulydog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7sktc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:19:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38de0739ab6so6489928a91.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 15:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784413196; x=1785017996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSIoHX29BzBjnIxq4ol7lBXbSbHoZ60LqztgJWDtdzA=;
        b=DbgUTvSXMGrUqBw4szZ64Gj33aUwlMsxfMdbcQHKHwdgsv/ugyew0nWOv0geRN9zG0
         kNth8PTc4udeH70DE7M2aNCV4URAsRZa7KIx40vEe/4y4iwuwaGy941TiEVbU3g01wjL
         vpGCssscxWYK3n7toF0NRd68+hPOJUi/ev+soBBJd51NJpS6dv31NU2UuCszL2vhn7e1
         kWBiihM0Sy5YFtwo/z5pC+dYGa46WxnSGfLz9f9yxhuJv4r6njum++CYinLfFHau5qbp
         KH3hzrlWYDidOO7RHnmee3Ux25CcbjhBGB43E1cTAYXV/8ZOM/NN1SLbMYKZmv6FQ5Lg
         g7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784413196; x=1785017996;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSIoHX29BzBjnIxq4ol7lBXbSbHoZ60LqztgJWDtdzA=;
        b=YwraPiWNUWJv1EuArqUrp7ZRHXqEuKXoHjgDJzKlEbzRTLKkz6OMEW03citJGIKg/z
         TPbYV0fmmQnoIHS7wqn5cd+1xtMOaWyqfGumxp6orGGwz+eZ/+MQYKCC4Alo2BPyUOJf
         uS4asab7eYrXXMITgc7pTc+ImHdEi3DHC7CPEPdw9QR9iwvzTPavaC6Xz9OcHYx0R2pJ
         /ral8gJDeDgqgLbNbZ9RE78ol/5Fs4qfHm2HyIuZp8nL5ZOrZ1OR38ulUxytarGLHIky
         qF2LVQeWALAhnP7m4GaDa2/fMUlxCZFVYkZUiWhsPlRugDUGEgyQtONIr/4XH0CYaPPv
         O+ZA==
X-Forwarded-Encrypted: i=1; AHgh+Rpm/hVb6ZsVD2xUoazQmr9xX3vG8kwssXqtJ4603FYFhsgUVtzBpb6ViQHgGd49azxoyRZlJaVx48uP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/IysGETf67dNPfeJpbHVbDmAkDVSyJouGByC7aKi4v1Ildptk
	I2mf8yILmdQkmv3FlB21whbD8IVksN0YTSHk1Co0FG7Lp9NR0YLiup6A+Th4W7V3O4uejTMAiFN
	IbAL2pqcxzHrX6xzy22V9HZCHJJZ+5pWPx95AI+PH+rpoRFeIgIlwBcik+LYhH9sY
X-Gm-Gg: AfdE7cmyqQ4d7cjhX+eXjks4VZxbfIj2LRPxm6pqoPlaftYozDLkQKiwHb0+eNXrZDt
	023F2Lg3l7LtK32uZUiQ+9tf8Kmd0L3B5W0pq3eBwv0E6y/pcry4oLkRHWpaQAd9M0UgvPQNwfB
	WPZFD/dTUjKe4COdxtwlwxc+idgjcOXJ2oYlZjcD7Ei8MqoEk7HFFUXucWm8ViWisMGvVy8jikF
	ysj5GaT1NW2r9t/8yurgaWUsm9YF2TIKW0vRnHAGj+PC4AWXNFQUZ4HauX+Cjf3VW7KQMQUEKYQ
	jyHtg/NzKS0Cb70+cL+bWdD9cahUxOkim49mpjWoYrvlhoNgMkCWllXKHapyOzoXZLfmeGQTZAK
	1m+GmQ1XrT6mzWbvn
X-Received: by 2002:a17:90b:58ee:b0:37f:9ce0:af32 with SMTP id 98e67ed59e1d1-38e4b595a3dmr8487155a91.29.1784413196367;
        Sat, 18 Jul 2026 15:19:56 -0700 (PDT)
X-Received: by 2002:a17:90b:58ee:b0:37f:9ce0:af32 with SMTP id 98e67ed59e1d1-38e4b595a3dmr8487134a91.29.1784413195919;
        Sat, 18 Jul 2026 15:19:55 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de785dsm5062346a91.4.2026.07.18.15.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 15:19:54 -0700 (PDT)
Date: Sat, 18 Jul 2026 23:19:49 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Md Shofiqul Islam <shofiqtest@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andriy.shevchenko@intel.com,
        u.kleine-koenig@baylibre.com, joshua.crofts1@gmail.com,
        nuno.sa@analog.com, Michael.Hennerich@analog.com,
        dlechner@baylibre.com, linux@analog.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: iio: health: add adi,max86150
Message-ID: <20260718231938.54f41543@jic23-huawei>
In-Reply-To: <20260717201138.1078019-2-shofiqtest@gmail.com>
References: <20260717201138.1078019-1-shofiqtest@gmail.com>
	<20260717201138.1078019-2-shofiqtest@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDIzNCBTYWx0ZWRfXwblmkE1GWoCi
 o0LEuXznIA3RQs9nXE+r2TvbotbXHrR0NF39GM/OknVr1tffHi7RB1jz8I3kAEzaA41ucoCtW9d
 qOx/bDK/tnpYwtaaEcNx7omzQD00IeRkz0Zp1V9rrMdd+LzocwuDGwtwyDLQa1D3jmse55oG8sw
 X1yx6r6jhmAMef6Ej4cvyWsUGTggh0k6DUaaYHZ+7PBhKYkPUpCS9U4QDnTdL4SzI94vihxdxyi
 xdNMUVg/qSlLzjGlAgy1r/JTUHM29oMaUoIzg+7HS+ioAyF5n2lrIIblXHB+Joza3XqX1olsXGJ
 iWbDCiao4+rlFvNpF4EQEYRHc6m84SvCV7VqcOqnEmr+y+t2JnUSiZo5shVDTlYZX3PzQ1MOP01
 RjCoK2063y5CPV/jK1/Jj3NMxsirlOCr9BGvhLk5Irat5CGagMb1LFn93eG1FyoE4gUUPuxt+s3
 nz2ZibP2R253YN9/3pg==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5bfc0d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=pGLkceISAAAA:8 a=KgpIswxficZqQvW3BnAA:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: D_mjG0Wefl1B6S02m5tz7cA88fM8gb10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDIzNCBTYWx0ZWRfXyP9PQnAX8awb
 JcDhgavtouXarAZ1ApULdj8AB4AU2qHkSdr/JohLcp+R/kBlzDeAPGoGcSmBJ9/ksMW/MK/TXJV
 j/Ruobg/98eKxKl5ltY/KHkl42CCB+E=
X-Proofpoint-GUID: D_mjG0Wefl1B6S02m5tz7cA88fM8gb10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180234

On Fri, 17 Jul 2026 23:11:36 +0300
Md Shofiqul Islam <shofiqtest@gmail.com> wrote:

> Add the Device Tree binding schema for the Analog Devices MAX86150
> integrated biosensor, which combines two photoplethysmography (PPG)
> channels (Red LED and IR LED) and one electrocardiogram (ECG) channel
> in a single I2C device. Samples are buffered in a 32-entry hardware
> FIFO with a configurable almost-full interrupt.
> 
> The device requires four independent supply rails per the datasheet
> power tree: digital core (vdd), analog core (avdd), ECG reference
> (vref), and LED anode (leds).
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
A few small things inline from a fresh look.

Thanks,

Jonathan

> ---
>  .../bindings/iio/health/adi,max86150.yaml     | 78 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
> new file mode 100644
> index 0000000000000..da2ff9b0ada2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/health/adi,max86150.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX86150 ECG and PPG Biosensor
> +
> +maintainers:
> +  - Md Shofiqul Islam <shofiqtest@gmail.com>
> +
> +description: |
> +  The MAX86150 is an integrated biosensor SoC that combines:
> +    - Two PPG (photoplethysmography) channels: Red LED and IR LED,
> +      for heart rate and blood-oxygen saturation (SpO2) measurement.
> +    - One ECG (electrocardiogram) channel for biopotential recording.
> +
> +  The device communicates over I2C at up to 400 kHz and raises an
> +  active-low interrupt when the 32-entry hardware FIFO reaches its
> +  configurable almost-full threshold.

For this the 32-entry fifo bit is good but maybe move ti to the interrupt
description. The rest of this paragraph is a repeat of detail below where
it is more useful. Hence I would drop it.

> +
> +  Datasheet:
> +    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX86150.pdf
> +
> +properties:
> +  compatible:
> +    const: adi,max86150
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: |

Formatting not needed so drop the |

> +      Active-low interrupt line.  Asserted when the FIFO almost-full
> +      threshold is reached or when a new PPG sample is ready.
