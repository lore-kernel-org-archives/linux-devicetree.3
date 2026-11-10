Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354378;
	b=IlWTPW1I3P6mdO2aUta8pVk8TWreD5Qm9l6GkE7gKgnZ86lwc806AyseMSTHt71Wu+pj
	 iXw6yrRr43AKFwCv1VYK+3U73Ldlkbw9PHwEaYeo94IdfAuK0Sda2YAiZ0GYIvl4vEof6
	 nXstVGy3Nw+h5jBcug1utGflLoF4DMEgWe8yVOiOJbHYIO7I67Xnxrt8QKJnQ7esDpUb6
	 SQy4Rf4BDGY+fOd66wJmgzMkCfNs7ORNksXIQGuKmfIs7aKC7WXYt5yUXHkmtr3CFMmgd
	 kPRWfeHpLerDU1wkomujHwZBipYvf0jciI1E33tJYSMoNZ1Y7wiDKzw4vGttZvFEICA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354378;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WCdKUUEAMgyuIUvweS/CVZqWS7quwtCy3Zzak2dFXXY=;
	b=sGXw4mKFJnv7T/LN2Kg3csm25/Kgb8QjfENerSw7td0F7J+pOiV9Q/KIwwtC7dsLHd9R
	 8mcYNLjIu084GNv5fW49jTcb9tOUr7Ecn4qujVBobHBHZ7sdgHv9xlxtmXPL1km9tl5US
	 hewne+uBypYDjBo1K+ACHRuhI4n7tJcyWVmp6U1nZKHbs0qsIAEl4AYKe9RZwfq/OgcQb
	 4WzRh4GCDQZztuQFdmqSLD3lGeKuWLdDaFjH3HEzZP/f747GYS3FCMFBpQQStb+9/l9TV
	 vLGXF0t/Wloia5eL2KY7Zwt+OymjzJ7wrR1h/cq/HRpCUFG8x8TfD7hxvYkiaF0nBgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEE4606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BEE4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b2d14968c9so29612447b3.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 15:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354376; x=1794959176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCdKUUEAMgyuIUvweS/CVZqWS7quwtCy3Zzak2dFXXY=;
        b=FBgnuUTbC/7p+LfW1PWJWA/kq7/5ZQ7Ruw4lRP1mkOXOUJ8kY8FQkDarpXNr6NgCmv
         Y9UKXzn+XLx8YpB4sRLWw9YAU/D9QZsO+jRp5W6o1dNCBz58F6Jx1CFU0+nFELgWuQ22
         OCP4stZu4cex2rzTsx9ZUy5h5npFEB/0cR5vBX59UAAoSs+iDiu+q4tjIK1bx9vHmiKW
         31wxXQcTGHVw4CsRr5QMzU8p/wGtnHKwHm5naK+6n/DAPh+dQ8PdNMfIdPW5NUN9B7pQ
         oib0NHsRKOWPYx2LZ13GOnzUzr1kip3jMw0haF2cm7iOhXmVZzCK8p6gPfQZig7SuzdR
         6cIw==
X-Forwarded-Encrypted: i=1; AL+hErHEKGmudJeUI18xSI82OpHbewi4B9r892vgIgdQDDlZxOhtZr6PpMPwX+6kOv4F1TVnNEb/ZRQ4qY6k@vger.kernel.org
X-Gm-Message-State: APuU4Z8N8fDlSc5zoSlVDwlJWwY4oLNSamRIay+kxnF3+6NwaZXyzt/t
	dGMHKs+zNzkDvYVewLLkEanHq0aDVeA+6ftnR81Y+0Uytrcz5ltZFSr8
X-Gm-Gg: AYBFou3japitLc8+rif02qOZbA48l+WYym5mDyDc+ClAYyHLyH/KER2LdB62ZWmVTWm
	qBh4CJ1XXWAV6NHtf85Mz6cVgsADgnV8touZbTpfegcK6unuBPG6g/cOg1pQrYywc+d4cei2nQk
	23vADax7saEjksTkq8RU+ONkaxoiwX5uKxXQTuCHli3K1+e9DzQ0CjzCLb2F9atOUDLyU/exAS5
	rbjnIbcm/J4uK4Mx2V6GFKte7A62GfqUPGjppS8d0tG7tTmfrk58TE6Bhi+ny6noHBgjl3Tva9O
	meIa5CQFyIe4yrP8sikMGJ9+C5qTTn5iFukC7fTA15D/xIV34x2YpASHPpwXL4A7fqHSA7gv8ep
	a/LgiMCJpPTbsJ5bThfKhfD02aItzu9oBzPD5gJ6f6z8e5Mk1l0zAmwQ+C5XpAuJQ98Xg9+0kQz
	+TxOv+dqSargwkIj3rcnT1VDNU5KESyJMO6inhftiwKD2pJMzz1EqrCcRhvYgU5xTUEKptFFmbG
	WGAJM+y4WNCLVJSvMjJpdIXcMkr9gwxjA0jhPNZCxEGREQn41396IcdU6h63SkGPX0AJTSSjJps
	+FCbhQ9p80F+vQMi47ic1zdy8QFDpxVIXRGkBMwgdDdLQAeZzY5YynJ1ibi6ZLqfx0bij+oO
X-Received: by 2002:a05:690c:e3ea:b0:8b3:15c2:24a6 with SMTP id 00721157ae682-8b3a7ff3419mr7031107b3.17.1794354376630;
        Tue, 10 Nov 2026 15:46:16 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933c59cfsm31871827b3.17.2026.11.10.15.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:46:16 -0800 (PST)
Message-ID: <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:46:06 +0000
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
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

> That's an intermix of names, and you will get a review comment from
> Krzysztof about it, I stand aside.
>
> Here too.

Krzysztof did comment. I kept the vfe0/csid0/vfe1/csid1 order from
sc8280xp-camss.yaml in reg-names and interrupt-names, and asked him if
he prefers another grouping.

> Drop 'gcc_axi_sf'.

Downstream sm8150-camera.dtsi feeds GCC_CAMERA_SF_AXI_CLK to CPAS and
x1e80100-camss.yaml has gcc_axi_sf, so it is used. Can you explain why it
should go?

> Drop 'cam_' prefix and 'cam_sf_0_mnoc' also.

Prefix dropped. I kept sf_0_mnoc because SM8150 has a CAMNOC SF path.
Should I remove it too?

> Or C-PHY, right?..
> In fact you shall drop bus-type from here, because the link between
> CAMSS and PHY's output is not a CSI-2 bus, it makes it inapplicable.

Agreed, bus-type is gone from the CAMSS ports. It only exists on the PHY
sensor input now.

Best regards,
Andrew
