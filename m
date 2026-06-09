Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E5348AE04
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031371; cv=none; b=Ft1hZ2mfe9+Lv7u3iVMofwsazK9MOp4BV3ZQR2y1OuJu/3mQXpgS4DoY0ZS8Vu7fQKcATgPXdmg9DgFAEVAqIWLhxqiIQfHaOEc6Xm4U5nRRb4WfW7n59/l5HQsuesiQyS4LaN8Ix0wJgayiZrVYI599DWR8CPEOvZ5rKYLziu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031371; c=relaxed/simple;
	bh=qv6NSO78UBvOvcAVkfVRgLKn0cSCdV/ghe8m+ViedI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geKScREAZoCs1zIlAuw9wDYpXEe5KYfG6t3+EuSb7/e7JBWoWghxR56sXwCXCcp/nrFPKpY5uQL+xCi3zbmfENVQCu6pPeuPw4F1rjw7PQdPB5ipPkGiiMG1QGirHCZ4nupsU9NKAiPT0E9Yt3boRC2hbZUyiCrCWrWju1ghaUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LprvL37F; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LprvL37F"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf20f6be6bso46772585ad.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781031368; x=1781636168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G32fw+YDIkyZWRzyQasWU1L7Th532AaegrDAEvejK28=;
        b=LprvL37F5cyQsW0v81KBieOjrnbS8NbroJLNov1d2U31oYSFgUhGFE7n2/qIEmB8nH
         1jNIJLIXO9J0mZ3D46KdZkA17J0r4JwqMKYFtBxvW9HzyMQsIhvJbrWw3Vpj3a8VNrXB
         qU0uMR0o9r2o5rg//WJqXEA7j/6N6p2elUGrTM/zaH8rwwBsIXJKrIeiEazOHVkVbyqk
         Az2UoUorLA9OKMcMlzWRuR34b6ktOZRlTNoE4uvergJDm+3cEs73iwBC23lcXrnQN5NS
         lF2LxhS6zcrOLRFjWO4rg423l6QpUUdcT8FBsOwnfFVVN0eErSXeMwtZX4A+oHSaVlvd
         PUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031368; x=1781636168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G32fw+YDIkyZWRzyQasWU1L7Th532AaegrDAEvejK28=;
        b=K/vEIAqTDB91B9J8iJv5CdH8m5XHHvp4vm/IZEFt0GpmmANzBFwFSoCfjqN/GQOLL6
         7yUq4f+D7+/PoJJAkFn8mPT8A3jzMOo6H4z+s+uh7w0/SMywgWJzyNzqz1/eAp8KZ/aE
         wmc6g77tqi3FTaC4W6DYJwE7LTFih9QKlyICikL2xMQM4XT/dIK9Nc63JrXSCPJayTMv
         eqHxAZiWBeDEJCRu3CEJRRzOWIc/rZs+ur2qx31TwaDj/ybeY+C85qk3XpMoNtsLJbvM
         BjbLWlkaf0QvH6CBumEoONMJcAM82Mjn8M04XGRb66CzE/wdrv9nFQjvgLxslmGiKGdX
         JRhg==
X-Forwarded-Encrypted: i=1; AFNElJ9NQSTJcN7Da604pB5EnCC/L2uds6otrP9rrGcLFExA2jD483gCKY5qvQuNn4ymNUaSjMq1GeuY/31g@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTGfFycgI4X93SyR1DkjsmasGTcE8LAnRL/8Am8Em/JyEXk23
	08QCBvUrB8QlIXVCkc1RlkxkCipl8pK1YXHGMaC5pdV24ewFKvMlLnjT
X-Gm-Gg: Acq92OEdOoaqiT6jiPACA26Wk2GuDlYzueJUKY8YRBMclGRpwWINDBx7Dkur5w5Eg97
	Xu80h6MZL9LV2Jqaup7ZCBZdA6b38oifJtvFYJxKlVPaFrqdDuxKUvomH+jSA2vJpUbaWHsAX03
	qvEXq6aV+HE0g3jumdG+XYAfMCXY2HBfdJsLdZHIimhVewMnz7ySgSfmZonkHIXtRSrlyDa6lM9
	dTVMO+qQVbut2tv1F2C3mPpF+2Yq19P51t8fEbqYkVtkPWq+sjWNpb1uvCwbE/4+0xdOOVAbnjl
	ND4Vis04oyPGlliGRrwOiJr2N03b7YZlPelsXBOlduDpWhC7UzaprqDIvwHJsAup3RgrEkwHToI
	DPWkPMwqmr74TDjuHVYFPvxAnetIzwxZvealre964wSHGnFuvPwYH0UDzUY5OrkJIN9pjmPxICx
	O8IVBUBQ==
X-Received: by 2002:a17:902:ced1:b0:2c0:fa4e:91f6 with SMTP id d9443c01a7336-2c1e7d41eabmr240045285ad.13.1781031368012;
        Tue, 09 Jun 2026 11:56:08 -0700 (PDT)
Received: from localhost ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c245dd3b5dsm95637445ad.81.2026.06.09.11.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:56:07 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:55:59 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: Add SpacemiT K1 PDMA request
 numbers
Message-ID: <qxcpvj3eseclgonwuwx2szn2tj4uxci27mvpqwotj6uaiyj65p@7sx5tyzbfs2g>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
 <20260607-b4-k1-pdma-req-macros-v1-1-5b2a3955007c@gmail.com>
 <20260608-dazzling-hacksaw-dbe84766ec76@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260608-dazzling-hacksaw-dbe84766ec76@spud>

Hi, Conor

On 2026-06-08 18:33, Conor Dooley wrote:
>On Sun, Jun 07, 2026 at 01:41:30PM -0400, Guodong Xu wrote:
>> Add a dt-bindings header that gives symbolic names to the SpacemiT K1
>> PDMA request lines of the non-secure peripherals. Device trees can use
>> these K1_PDMA_* macros instead of magic numbers.
>>
>> Point the spacemit,k1-pdma binding's #dma-cells description at the new
>> header.
>>
>> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>> ---
>>  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
>>  include/dt-bindings/dma/spacemit,k1-pdma.h         | 56 ++++++++++++++++++++++
>>  2 files changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> index ec06235baf5ca..0d4ac9849e27b 100644
>> --- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> +++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> @@ -35,7 +35,9 @@ properties:
>>    '#dma-cells':
>>      const: 1
>>      description:
>> -      The DMA request number for the peripheral device.
>> +      The single cell is the DMA request number for the peripheral device.
>> +      See <dt-bindings/dma/spacemit,k1-pdma.h> for the list of valid request
>> +      numbers.
>>
>>  required:
>>    - compatible
>> diff --git a/include/dt-bindings/dma/spacemit,k1-pdma.h b/include/dt-bindings/dma/spacemit,k1-pdma.h
>
>Why does this need to be in a binding when there is no use of this in
>the driver? May as well be a header, particularly if these are numbers

Thanks for the review. You are correct that these are not referenced in the
driver. My change to k1-pdma.yaml should be dropped.

>with a set meaning that are lifted from the TRM, rather than made up
>numbers to make a driver work. The former seems likely, given you're
>indexing from 3 not 0.

Yes, it is defined in the K1 manual [1], see 9.4.3 DMA Connectivity &
Assignments

Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]

I will fix that in v2.

BR,
Guodong

>
>> new file mode 100644
>> index 0000000000000..491976516550a
>> --- /dev/null
>> +++ b/include/dt-bindings/dma/spacemit,k1-pdma.h
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * This header provides DMA request number for non-secure peripherals of
>> + * SpacemiT K1 PDMA.
>> + *
>> + * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_
>> +#define _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_
>> +
>> +#define K1_PDMA_UART0_TX	3
>> +#define K1_PDMA_UART0_RX	4
>> +#define K1_PDMA_UART2_TX	5
>> +#define K1_PDMA_UART2_RX	6
>> +#define K1_PDMA_UART3_TX	7
>> +#define K1_PDMA_UART3_RX	8
>> +#define K1_PDMA_UART4_TX	9
>> +#define K1_PDMA_UART4_RX	10
>> +#define K1_PDMA_I2C0_TX		11
>> +#define K1_PDMA_I2C0_RX		12
>> +#define K1_PDMA_I2C1_TX		13
>> +#define K1_PDMA_I2C1_RX		14
>> +#define K1_PDMA_I2C2_TX		15
>> +#define K1_PDMA_I2C2_RX		16
>> +#define K1_PDMA_I2C4_TX		17
>> +#define K1_PDMA_I2C4_RX		18
>> +#define K1_PDMA_SPI3_TX		19
>> +#define K1_PDMA_SPI3_RX		20
>> +#define K1_PDMA_I2S0_TX		21
>> +#define K1_PDMA_I2S0_RX		22
>> +#define K1_PDMA_I2S1_TX		23
>> +#define K1_PDMA_I2S1_RX		24
>> +#define K1_PDMA_UART5_TX	25
>> +#define K1_PDMA_UART5_RX	26
>> +#define K1_PDMA_UART6_TX	27
>> +#define K1_PDMA_UART6_RX	28
>> +#define K1_PDMA_UART7_TX	29
>> +#define K1_PDMA_UART7_RX	30
>> +#define K1_PDMA_UART8_TX	31
>> +#define K1_PDMA_UART8_RX	32
>> +#define K1_PDMA_UART9_TX	33
>> +#define K1_PDMA_UART9_RX	34
>> +#define K1_PDMA_I2C5_TX		35
>> +#define K1_PDMA_I2C5_RX		36
>> +#define K1_PDMA_I2C6_TX		37
>> +#define K1_PDMA_I2C6_RX		38
>> +#define K1_PDMA_I2C7_TX		39
>> +#define K1_PDMA_I2C7_RX		40
>> +#define K1_PDMA_I2C8_TX		41
>> +#define K1_PDMA_I2C8_RX		42
>> +#define K1_PDMA_CAN0_RX		43
>> +#define K1_PDMA_QSPI_RX		44
>> +#define K1_PDMA_QSPI_TX		45
>> +
>> +#endif /* _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_ */
>>
>> --
>> 2.43.0
>>


