Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460878;
	b=Qqkm8H4BBdVraGqFC6G1IO31UPZTN7K1aiK3NwGThS/TPmsBEko1I79JbGARIyn+LiwW
	 S3Yyc+lLnmSuQ2AZpWDoXnAFlpJzCcxLlKHbod9cPHSXgTZzFs5VhTEtFA7SkMW/fS/pI
	 J33DrvZkad7G8v4y4ECfDDvmVnepLEun0uB2bGUzY8YYnXbJKnAO+UkDChul4HDZqzbWP
	 GzmkNqed89qqWStXXz1yXEoXoMEqjBbQcPFdiWCLV+k7Mj4UrMPOXDKYE6mtyOdud1fqa
	 ImDi1/5hZrnAwCNZqh7ys+MMQhYK0EJQZzSv1lxE/SrOvq4ds2hMUWd/zPqdga6nvPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=;
	b=tDdwvsoFDOsJ/BHMYXZc20N6DUoeaTdmGjk7EIaS1tsS1B9/oXJtIJHYy6gaXmxVlWP7
	 CnUTmh1aZepk0cnVpw+gdsbmoiEvjZ7DNsMr/BDI2hS/mn6YuuSZAk14/XyeMVFXw7aos
	 FCJlZfVSuZ//2FOao3eX8kV+cRg26akLOdJKWTKNDTmM0Me3DAQbPH7OI6bRUqCuxtqFd
	 GLIvzTShtBTTJm20nT99u7nwXj+Ng8UpiHoDxn+udVG9myCIr9WpL0xhgnitsf7h/2SuP
	 qClYFUcRtrzRqe1PDCmy+Xhd3jUkSWzb7dvCbpqY/C9ZrLOf8aG9dzGtFP2RMvsY2Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cTBtazj1;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578B9606A321
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cTBtazj1
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so6210090eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460877; x=1793065677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=;
        b=cTBtazj10dBdAIyArju2za5IXQxY+7ntjIgt/Hor5H90LKUi4pfWoyaCNHYX6Zhov3
         yh+8xoTVshkmGQRDLnNV30hn8iEF4WjYgqni+qs1zC2Emx4cylur9UA5xgWCeV+rxMdQ
         bKHRAl26Ro6pFvb0Dilz+VqfJALgeQKDRuqJf+5G3mhSIkMdyI+i+PmPUM2KRwB6hDWB
         4ASXJlOFH1bI4DOzuDDwClMrxPol9TX8W24KbFoIqCXhXmy95+P/2x1TdgEET6Ablrnr
         LUUWW4TuGRXRUTYvf1Y8BCpxQVtCThK+BylSPin8/C32+7cAVRJCJTJCMNY9p/YVjVTR
         v0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460877; x=1793065677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=;
        b=nNAtltgf6mBuVV8BaRJfjJgumH2kQlD9hnn1Py0b/nFCoWue6qfEAFutZ2GfTKGpUI
         fJbvUMCsX9Duq3mXrky5ioF99Iu4cnH8/TfTr24c5L25Dy+jeY5mb90vyaGPOBM9/cIo
         dP4ydZ0T3J4j6E6Hl4+eUKdjq+6y4BjzAX0kCzD9ysQgrISmAZoAz/2HW252fUFXQGXu
         oU+RywUbpPkolBW7fy9zeaMW7VAf93mHSOIoMbcNGZ+HP7FqHQgxzO6bBMgNsh6frlfg
         pscVdn3ERZeIJEcTX8nd2YxDGej1bq8/JAoIA7TrLAsWBUx/jKlmGvWeOJR5rUGMcS8W
         zm0g==
X-Forwarded-Encrypted: i=1; AKwUvBy7exa7MlTuCMuWSsFtK6D9F+myvUks/jI/SnTtKTIEvuwlfqEOHBRxpp1FKHi8J7LdOWcUJpE02jmE@vger.kernel.org
X-Gm-Message-State: AFq9FYKUYICzKqWt5AmwLek1n/ELSQsvH26GO/0fYGp9vVa17Ir6T7nM
	C9yGUL2Q6n0JOzb3JrUmNxFRBvnYsolXVyuDS+eYF9ktGgnTDiiMGLcK
X-Gm-Gg: AYBFou2/mecDZoT7FZxlLTlQdXi1L80qtrV+dCcwWPompQyYB+fHtHLVpvKWrWKYonp
	q0FC4cqlZtaomP8KwZywA4be5T7GMqXXG0oxviTqKNQfLzOFY8VQ+qVJ7ib4SlaNgy0v0BBcwcO
	THfyq7AEk9iSQPS7uAjJZzCRI/Dt3fSrPZTSc41KpmiTg97OOz56j4UsUHuss+yfz1jP+OVz/8y
	oIG5jJ+FBHQmKwPNV3DfVejvmzd9W9VnOvulG2DfF5oQm+zUIqqrLjJXwewAie7BGZgT2oqZlJ3
	3svEBjQvRXHUjUQFOJyCP6tr81FhhmOZc4J2tY/+71IfMnxjY3PZgXlNIhoYk8SsG16PNQDbKE/
	+s5RrKW+9TLv6/jitDXOjZJbRU0TveQUixOE72cKc2gcKOwKTWXmS1meUkcD6sc008XoPXf/arg
	QnzRe7bwSC1ijWMC1jrIxrIgHRDaVRpN1YOxVAb7DmKoHNhwE5aC6+z4gIFzahpVfhtcTn3nKeg
	P16CZjaMv76CN0xVa4qPFU=
X-Received: by 2002:a05:693c:83dc:10b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-362fa872acemr10206165eec.0.1792460877332;
        Mon, 19 Oct 2026 18:47:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm37173189eec.5.2026.10.19.18.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:47:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:47:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU
 reset indices
Message-ID: <6ffb487c-dd6c-4a6b-860b-f4e02d381cbb@roeck-us.net>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>

On Sat, Sep 26, 2026 at 07:13:59PM +0800, Chuanhong Guo wrote:
> Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
> register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
> Use their register bit positions as reset IDs.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
