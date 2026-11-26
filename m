Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672723;
	b=KZBd5JR5P4iethNnyBYmsH4sPhAIZpjePax5VvCywNlPQro41uJ8eagKo6ylCE8vEV2H
	 HKStMneUgRlacx4gOEiwH7kJsSuTpVHmc4t8mUHVdl+RlZAq2dZ9TfNnn4kywkDzDRebO
	 IarVsrJgcJZCE5d0Xxk/2Vj7uVt7q0tv5MuOR/YWmD+HdreIFsHyxXxFlBsw4iFEHXI7H
	 UVWIEOQC3xXlwnMfnzCWPX7Fr/j2Pmj0POjHUeIHKwvHrrC4Ymb7qHwDGcIJRasakr9OI
	 jIKwkJeuHYwSjIYkozwDHuCzBK1iSaTuUSfyjQ5AItD5L8t+tqaZlBx05WugdjsmYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
	b=sSd8wrCgB/8WXg7lBRyUu/oPYP3jB9CGeMQac8Gas44hh6B6K+qpl2k+pO5ASby+LKlB
	 VjYg6Y/IeliLnpWYjMofuQm/RbOABdV58DfkiKTZfXPJfhE6dugI4HHalmnwGZJ09LF5H
	 BMnsakeMAFKIHKcfHsu02gdEnhGNyqeYBq2DkzJVxlLay+XCdvnjP0JyKGMWV9DrzFFij
	 4RI6oj0Fz7Zc4sg4zAKyJVNi4M9FuHMFvndMPfq13I8CU0gMaUbWnhMGPIi4F5SSYY2PA
	 yuIt2zmFISxBLiDUhuk6lA2VelohDmNcF012QdDzT4Z/ZGYa7HFtHrPQ0voWIGeLbzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fgwd7q4x;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ABA606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1ABA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fgwd7q4x
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c154a41f8aso501735e87.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672721; x=1796277521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
        b=fgwd7q4x2oo3KRStS1qxJPIf7HEppN3pEKniLX3DvaQ0dz0mnDLUa2B/J80XkRGLOi
         uSj/dv4qEmD1ay9SwXIH7KcaJQuiL7PMmX7c5wHN6RuL6Iy17q8zb/Rj+q95xJ7Z6TcF
         1BADaB3ltf+Lb76igC3VlFAjUcm8+/WK2J8qvBZE+bakF4FOrIofJyCkCxciMA0qDFZ/
         mt1MEueLyRgt341f+wZm0DcDAVFuLDV44Fycw7rkElZgzXIvE6XeK/gJPEY3IS5cYIQN
         gtNxHQEJvjcIdA4k2GIpzChqsayFFFu9FnSGq1EgXCABDVOyZxlbRyV20ZoBYkdGY6zy
         w9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672721; x=1796277521;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
        b=PLQgOVZ0IJ1DG05+o0MwOcQ1RZ51DrXKe7lAriJU0uer9KJDD1429T9QyN+8Ryj1A1
         rOvTYMgvg+q8OsXES1xnE2xS5ijHSjrHYVVcFgrCOvkoE6VAqxltSk3Z8sa7VEunuWcM
         Prm4r4UnoE4j0haxrlAooODchBBh9DX+5PjfO9k/xQ8sIdQGpSJD5rjz5iFWe0sohGUd
         P+trx0A8EcOvedOiTmGK8k3fb87dKxqLGtJj5Zd4q4p5kVkVR4PgfS7foGnOspygoxyp
         244/2QLJZt6RNvhKzXstt5iaekL8f89VK3jqbaBwsjn9+s5MAYGq7fDyxZjr27yDF1m0
         y/MA==
X-Forwarded-Encrypted: i=1; AL+hErELku9dzw/vEVDuQ4HS1Q+clH9X3jpfnEq5losXa4pCXHIEY1N7rEXc4BIlLw3/vubHn+W3DxOtmmkV@vger.kernel.org
X-Gm-Message-State: APuU4Z/ma2l2/2kN/VyCLtkorf0NckPZkIYBbRdt58DxHbL8pGqIa9xy
	EjsVYZy3vBt/sJ4YYREpSnUTRtQuuIKxr4rcIjzGchwgg09QftYamGDTFXQWW2ZImsg=
X-Gm-Gg: AZFdTZcE7uJyYa7/IKYBiRmsG83jYi3mBADvZrF45YMngEhlAagMJzdBj4kt2iMJUF4
	d18fckL+J+OzbLzw6mJDXIgi6f3sa0NXkdqnjnaC6UD1taqmq0jcb1XSx8Cavt2p9MUqZyq1NbT
	NXZecBHGzzvZ3KbtdB/kqi1+6lhWZPmVKgaNGNGRdEuLyGBQHb9VBmBsN/xBeu8rCDFQj54asmw
	8isdzwdePB49qfoRQbesJicA8fMDSih1mVyDrKw1oDNyGgrWZuILDcxAv2KaYMvoukPSdt8FcOd
	oWXMGObaJzE70dn3Du8ErpIx8Sp8vHoj6AavJB1wyEbB+YHStqpPyVVEdtlU2cIPxkT53+mgqm2
	A7eyYNpIH+yw/rNXE1zbf4GtR6Ml0PToJZ1T/HaUKR2cauyvg0leq2SAMKizqbhj+QIqqKGxve9
	la54v62KKO2C4hh7YSASP7tFMruS3uO5dsAHFAwRDb0M/vAHDhgSObDs7dopE2QIpTbyI33HiGc
	PnbL4UzmLUFUz89AE4rrTdCfteqlqVKXxztiSib5DeYOCqkcN029TEeWnaQESTuZ3faBd6siJVG
	mFMft3VE6EggknJx0krxRS0OJVEvfu4qXRqG1geeM5ETeDEIywwQVWNWi/eZx4Pf6iHTL3bLjiR
	SN5W6soc=
X-Received: by 2002:a05:6512:85c5:20b0:5c3:2506:4c1 with SMTP id 2adb3069b0e04-5c32506083fmr1030505e87.4.1795672721080;
        Wed, 25 Nov 2026 21:58:41 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd043420sm4925147e87.57.2026.11.25.21.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:58:40 -0800 (PST)
Message-ID: <69b8d22e-f688-4458-ae2c-0e75f7b23234@linaro.org>
Date: Thu, 26 Nov 2026 07:58:40 +0200
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
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
 <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 13:35, Nihal Kumar Gupta wrote:
> Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
> The binding documented CSIPHY4 as port@3 because the initial driver data
> reused the X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.
> 
> Fix the current v7.4-rc ABI to use linear graph ports 0-2 by replacing
> port@3 with port@2 for the third CSI2 PHY connection. The matching
> Glymur driver data maps port@2 to hardware PHY id 4.
> 
> Fixes: 1e0c8f82d710 ("dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
> --- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> @@ -109,7 +109,7 @@ properties:
>         CSI input ports.
>   
>       patternProperties:
> -      "^port@[0-3]$":
> +      "^port@[0-2]$":
>           $ref: /schemas/graph.yaml#/$defs/port-base
>           unevaluatedProperties: false
>   
> @@ -288,8 +288,8 @@ examples:
>                       };
>                   };
>   
> -                port@3 {
> -                    reg = <3>;
> +                port@2 {
> +                    reg = <2>;
>                       camss_csiphy4_ep: endpoint {
>                           data-lanes = <1 2 3 4>;
>                           remote-endpoint = <&csiphy4_out>;
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
