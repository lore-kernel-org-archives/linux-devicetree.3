Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537618;
	b=KqOgCKnPM5qOtVgHNdeWH6ASOjkvoMwK5FIEdsPxkwk0rr8NG4uVT3b3+HjOyfZwVeNB
	 oG8y05at0YbgVxQ6GlXVKvtJAZh2cGIcbiHMIMdvJpuG69DVu3Y1YnhDcdYKNQez0+iAQ
	 HwTGKwe6a/BqR9r7YQT2aLRc8b/uroVZKni0MgE2X7VPkeeFwFnVg/L01TXA9e46DKupS
	 rs4g+E6e+VlODAPvgn82+0SZSZBaEcjER+rn4Ogx0t63OpMQPsz/Ab+cEaJ1YbdmX0uYF
	 umNFcCX6EHS3C249JJbzY4XC5KAIRTnxaggjVSDCLXxIOI93ShYee5xooS5B00Fxrww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=CPwtUJVd7keNZw6evxXk+bPw16MkL52vmivrbbfL9hc=;
	b=nnBkTWDylUv0iCt3WssDEECbvNz9YgFyIZpY31uMibkUYZqlaOc3l3TQeTfj7yflw05J
	 TTgmTzBeYUwwTxYQnNVH6n1XZfNv5SsewhtcCRCRFuyNX2OSHgR1Myw5YD32M74rq+N88
	 cKK9xOdifN4PPHGcpKEJecUntMtoqEIJgOJLwMQYVno0MkA3pjtfE8aFY/Xe1K8cWXGvc
	 x05n2uU4F4dWy2S2k4l36nU2JCZR0cbk1w2x3C33a5nmUGhQc1tBwHKvpZ4fpbd7lZQvM
	 7i/qrKVKBkHXrHCRRUN6/ZroOQggYPwtLGujD3JY79v03fA5oV7Mh+MIhX6qLXmmWhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0ityr8n;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60815606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60815606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0ityr8n
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1019029eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537617; x=1795142417; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPwtUJVd7keNZw6evxXk+bPw16MkL52vmivrbbfL9hc=;
        b=y0ityr8nb+mOQyp4/fPEF9+zrJG6mgmdmpJv+Y93RzqZgid2J4tuXTgbIDQdJRgjiJ
         iETDR9u8/s60tJn6y6BcQlC3fAO5D1xyLBbqiXRNIYv6pEdc6PiYfSLXcgUJeRB0JLmk
         s789SYVpcm7+tqlu2p8MiJe0GmTEhIF6xEowEBYim5RlIEIIhlxXhwUW6MvYKp8XxJfO
         zZ9TrsY+3I4ltn5yxgxHQddQvAUtBPOLbVR0N0N3RoiLRa56cnSiXTTJUnR4DBe6H7vM
         YggFCmdVHMUZ5/NRTBbRwKBO6fQjp4+LNS6Ke3jkuC6E3TAX9ceVcdCF4KDiOgXgDkON
         P25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537617; x=1795142417;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CPwtUJVd7keNZw6evxXk+bPw16MkL52vmivrbbfL9hc=;
        b=Hg+sFctxW4Gn2lSJeCDxFvMYZ2KvMPsTiy2rOPZMijgVwwDWjQ6xgCRY9UsEdkuxL9
         QrMKnkGF0PS7KlsAtm0/6nXTSZHupYSiDkonPfJjkZ7gDFFQT/Tw3wi/mrg5oBzv5QxE
         ckU8rhZym6H0aOSOzx3BbmbkrM4X30VMmB4yhFZMEPq3QuZnok4aA6gjf12dZ6bN0aDw
         /gIQ+2bumgI7hrs8yFE3LXMli16ANC0BprZ2F5ri6TXltIO/FGZ53AnNMOuf5ZR3OvjS
         1kNqGn6kWJtF0oRXJmTWQxg57c6xphtwGWcQcpieujR3xtimQyVhG/oBU2WNprSg+3Sj
         IPug==
X-Forwarded-Encrypted: i=1; AL+hErHourhuId3Nj86s06N/DFmu85a9YEt8jhMc4Qr/HODcwP7vb8xukANGlzKeOV3BKd4B+HaaV1DCzJa3@vger.kernel.org
X-Gm-Message-State: APuU4Z8WhD7iZWYirTg0ZjupEiMTcEUAb0nZe0Hc3x8KzaZIsWVls16D
	VYbBDYCOYrsSvUt21g9Pp4tA6Gf8v1QcTwE8zkgJZfjHPm6JBs3k6rTk
X-Gm-Gg: AYBFou2gHBAnY9/c4CWah3lLPB1Qd0JM+ECBsG02N7ZUyvg8nzoi+jK8A5k1MNL6PO+
	/yi+Oe3soTMlmLpErBA9Lb6DSxEGNh9Gnx/TAc/rNQUEstV//A0wYyHhUD0155AYPkpKtCXJG0i
	u5l892ZanP2xJNglfqeuj1gXsVQCO1s0DxK1OFFbijmbnMelRaWFsJYGwuuNSWc/8ulZQHZ9xHg
	x2xK0LSZMDjkZx07+z1j/PxmJ2aAhLWwrIHm8JKEIrRCta278X/WNadBjr2vpgwwVRmqtKeUz/p
	5eDHbVLx20gZx5hlDHVMhU4tzcJ5IE8sKrlyFFd89E90nBjQyc6p9NnHenGd+UtHny5ba3ACfIK
	lmzv4Q67Pb+m/MUY+regaQIvy1x+8HDRsYHtNy+IXyaUOLnKUOC7wFvF+36Axpofxazzpxof7s4
	u3j+Hr7zCGrX7UuZOniNYJcBbrw7V2qJ0SFEYCxl4FAVVSREj/pZcJGV59/cUmC8hEM0QALZB83
	74KrA3idbpOjQsUxTck1pH6loPvRUrhoWd8sgbTxbYd2ovAfvsKLiRP3WZ9uIHtOoTjYtXXawfs
	q0rH67pb/H9A7YGDMVJ73VvTY1tAoVgqbUFvdjyj9W4QJw33BJ6x6Lar2pQYnu2zpeO/Yw==
X-Received: by 2002:a05:693c:835c:20b0:375:e4de:96d3 with SMTP id 5a478bee46e88-3796721dfb7mr971406eec.31.1794537617110;
        Thu, 12 Nov 2026 18:40:17 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm3949197eec.20.2026.11.12.18.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:40:16 -0800 (PST)
Date: Thu, 12 Nov 2026 18:40:15 -0800
Message-ID: <1222b26cfe220b4a9a77ccb8ce82fd35@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aelin Reidel <aelin@mainlining.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/3] dt-bindings: input: document Goodix GTX8 Touchscreen ICs
In-Reply-To: <20260228-gtx8-v2-1-3a408c365f6c@mainlining.org>
References: <20260228-gtx8-v2-0-3a408c365f6c@mainlining.org> <20260228-gtx8-v2-1-3a408c365f6c@mainlining.org>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Aelin,

On Sat, Feb 28, 2026 at 02:56:10AM +0100, Aelin Reidel wrote:
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6307495c2746313cfc32cdbb701455d1596be435
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml
> @@ -0,0 +1,71 @@
...
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - goodix,gt9886
> +      - goodix,gt9896
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply regulator on AVDD pin
> +
> +  vddio-supply:
> +    description: power supply regulator on VDDIO pin
> +
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-swapped-x-y: true
> +
> +additionalProperties: false

Could this use unevaluatedProperties: false instead of listing a subset
of touchscreen-* properties and setting additionalProperties: false?
That way other standard touchscreen.yaml properties supported by
touchscreen_parse_properties() (such as touchscreen-x-mm,
touchscreen-y-mm, touchscreen-fuzz-x, touchscreen-fuzz-y) can be used as
well.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - avdd-supply
> +  - touchscreen-size-x
> +  - touchscreen-size-y

Why is avdd-supply required while vddio-supply is optional (given that
the IC requires both rails and the driver calls devm_regulator_get() for
both)? Also, are touchscreen-size-x and touchscreen-size-y truly
required if the controller firmware already knows the panel resolution?

Thanks.

-- 
Dmitry
