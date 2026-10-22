Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691327;
	b=w/nOpKNbR1h8ndg7BEp6cdzIIo5v0B8Z3sppfeBq4Tqd3eUVHXR15ee1NVSFN/B7bWnw
	 OBqpYSJ/uuNZIuCFfeIH4hLde2M6WF3SgV99oulSp2MMVkhwNQ8b8cOlUEsuU0PkpCrrr
	 9dp27ztjhRHyZEL/0tXTTXbN/sL4waF0CkzR/l2QENZr8ymjbdNEMyhYOyYfygNZ6007H
	 uzW3hTN/ZS90s1SkNYdnSUW3YxVUPWyhoxlufvdKUAjGuL543Ki0PimQzjJ/GZTrvFfj7
	 wc5drgjmpdyZ1GAkBlAOka1QBhxRkgUYELzxmAri/8gBl0rw8RVhMj3DGse0M1PrhxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691327;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EPri+pnxfg/GkSkcUBWyDRaSPhtWuHho0ObTvb26NIc=;
	b=ryu5NtNvnLrm1MU3VG4Hphg2He0j13T43RwKXBqmjOKKBWu6cCQnucGxTt5rGgQ5ovs7
	 tKm93KkWcGh2PbFX/mvATU4qJt4FZtgjXfyw7x6TGAzooM17fLpyovNtXqlqXRJGDrJbx
	 R9T5BvIvrTDZaVlGUU9WOgCwAII+Y7LTZbi2NyYFryx6aUEBqm+zx41quQHFln+X4s5GH
	 MA4Fq3iQwyIqOS1ZFl5e/cwCdmqlGnKNP3ue6/NlmbQM4v2izxeH5gIu5CSOpMZs70rCP
	 /dQxm5LB06W5lNXv7CeBZhVvdZN1vYb23Zv0dLk4dzCDlINrELXOlt1FrwVfEaxr/Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA83606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA83606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso868729f8f.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691325; x=1793296125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPri+pnxfg/GkSkcUBWyDRaSPhtWuHho0ObTvb26NIc=;
        b=e7w46YRay1cHUUfL/wW+oC1Mt/TRIa0NsHgS2+Z/oM1Y9iuQ5GB7m93DW//WRFD3Im
         uWQiV9fJvhalfmXFPi5qvfm7Pq37kEQ2cConrjoxDboFNqNqz3oApXTb6bB4tC85z8D4
         OlawpgtKWH0w5LF3Jsq7uA7spwldCK6Jn9gkt9l0s6i29Y/ZNVPaf4cU62ssB0wq9i9r
         wsqEyhF92ptrXfPvXlC5iGeJNGa9U//SzILrCZARze55TpF3oLGjKQ3zeQPnT1TlTB9v
         8Razn3y9iugReElv0NeXQOhCDbjm0eSVVSI7YH8k0KF9LLU44obPkMpwAkMvq9ODGiZl
         w5XQ==
X-Forwarded-Encrypted: i=1; AKwUvByMeg5PwuPcdT0jNqtteFUOYToMgiEtOhsCRH0wjScoi70v0ZWyg6jxK+WNv4TQ59JeM3QDjskdLoYo@vger.kernel.org
X-Gm-Message-State: AFq9FYJT63VVeunvzrfBKa+ff8lSQRrYNK/tEtsJ9Nn/9gb+gw/hZb0M
	rI25NmWW6tpLxQPFRXpFPCSRnfhI1VDsVHlxGfRjHDnc+MJegElMvEjP
X-Gm-Gg: AYBFou2yT1DjifG+8/kxciI4C+UavLJpBBhaHZHEP0c/vpmvx7BTRvz7TX1IEj36bNW
	6/+sfAH1OKS/dDxN6CMY3PDZcw+0Rf0kDrcP3ygSbLQWV1Og6jLa51Z5I2CmRcQ8S+OcAW8oH6i
	OTXmzG9K3FwroLj6Gtm08Lxsq0T22PlN63IUQcAIGgUyl6GJSEbJLMti05pQY4exh7/xxEC9KyP
	NTL+5o/Sebe9xYSkf5QyUj/myEZJyZR8coCYU9JXE3NqaBJ/qxscMhZKNNZ9OuOgTFfy8Ox46+9
	uhPKHLlwZIBikUTmCGp3ohEjIN6Gfeu6SLmU8hh8YZT1Pz92O36n9V2//8agtI+EJTjtUZHUaBu
	FJ3LgtQdgD4MBK1EN2VLLZdblFMgYTUIZONKoS45cNU/gfLBn5qjY+rBpJSAE4kGT1yD3I50MTG
	BcWGAN4i7sQ2Vhat5zpLoF1u1mSXZVI+eklE/q6iO0FwdhOvGKwQUT2khNNCtDjnyHfYlGfRy7G
	1FkttDM2molyGSuBg1M8ab5EczxJYUL274v9h+TpAWn09AFatLrG1Ee/wY8zWw8Yx2G2wfAEap6
	/EDbX7UZDA==
X-Received: by 2002:a05:600c:3e0c:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a204b042e5mr54395825e9.8.1792691325102;
        Thu, 22 Oct 2026 10:48:45 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210327422sm14119865e9.14.2026.10.22.10.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:48:43 -0700 (PDT)
Message-ID: <9b5fe9c2-aca1-4460-81fa-826e05e88c1a@linux.com>
Date: Thu, 22 Oct 2026 18:48:43 +0100
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
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-9-tanure@linux.com>
 <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/2026 23:37, Martin Blumenstingl wrote:
> Hi Andrew, Hi Lucas,
> 
> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
> [...]
>> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
>> +#   rgmii       -                     -                     PCB trace   PCB trace
>> +#   rgmii-id    -                     -                     PHY         PHY
>> +#   rgmii-id    present               -                     MAC         PHY
>> +#   rgmii-id    -                     present               PHY         MAC
>> +#   rgmii-id    present               present               MAC         MAC
>> +#   rgmii-txid  -                     -                     PHY         PCB trace
>> +#   rgmii-txid  present               -                     MAC         PCB trace
>> +#   rgmii-rxid  -                     -                     PCB trace   PHY
>> +#   rgmii-rxid  -                     present               PCB trace   MAC
> We have some boards where the PCB traces result in part (1200ps) of
> the delay needed for RGMII (2000ps).
> The remainder (800ps) has to be added by either PHY or MAC: the
> (RTL8211F) PHY can only generate 0 or 2000ps delay so the MAC has to
> take over.
> For the three boards I have in mind, please see $ git grep
> rx-internal-delay-ps arch/arm64/boot/dts/amlogic/
> 
>> +# A property for a clock the PCB already delays is not in this table.
> Can you please explain this sentence (I'm not a native English speaker)?
> How I interpret the sentence: The PCB may add delays but those are
> implicit and not part of the {rx,tx}-internal-delay-ps properties. If
> the delays added by the PCB don't cover the full 2ns requirement then
> either MAC or PHY need to add the remainder, see fine-tuning below.
> 
>> +# It is either the fine tuning described next, or a mistake the MAC
>> +# should report as a fatal error.
> How can I differentiate between "fine tuning" and "mistake"?
> 
> 
> Best regards,
> Martin
The patch is wrong. It assumes a present property moves the 2ns from
the PHY to the MAC, and Andrew's reply on patch 4 says it does not.
I am dropping it in v4.

thanks
Lucas

