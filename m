Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570F633B6F1
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782145786; cv=none; b=pU6QY1k4UxJi5NXXRYCh0SliD5+DLC9AsuH3VkmCYwdQu5IYBn2yCUVKSzl+XlEl4W3nT28gGixsdbg4E47xe2/T2jeKbMq606YNLo1V1gr6cuiF7D/p4lJDk54U5/G/YXl0nYyDYDJ9skjnkAo8DXpiBcBP104UBu/a4SR/R0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782145786; c=relaxed/simple;
	bh=mvGpKlrwFHncD5jl964V4rj3HmMHhcnqhB2Wf1vJ2q8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=VDJ+yilospL0xjCsUfN6XP+9A8rEXpE/2NcDyYABSmXozPuKNm62hcRLk6mm23jkQbeHlOaH0AC7s1kJTVrnrMSHzb8BL29gkVx77ZDU6Mle5mvg2O0q70s8jYVv4VkzB/A9d+JfVuRW4AnWV/PUs7x4oE4xPnCwRf4cXiipwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSfIdpPZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSfIdpPZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4924f8db066so9904105e9.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782145784; x=1782750584; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT4x9AYClT9t28+ozEWKPRC7uYmzULjZEqq+oeNUuIc=;
        b=VSfIdpPZUJAkSGCIwK4lc66oUqaaZ/ASg4NFZcmPx61DCf32+U7NWWFoFMngZxdqwm
         gzx7185jIe5oWVl8MUt67eyfEnixBWqBDulfiVs16VTs6zbOsC4XWX+B/9hwnZyr8bbd
         kZ6FJOKn8IJQtZbgpdNaJDaZvAOiJ9GSYjQpAXQnmOqeGeUcS+DZ7nb2sBp/m2sEg+Hm
         NqyzlQ1OMb/GljNANQXmfYJlmMqhmWFfht/k6anc7+KH9Age9wf4LQdEQpSwhCyo4kC4
         KmlexAkrxCrD5KjVo5H/4VcmRoXsK1YIeAjfc2aVYfMs6EohRyb78dj5xGcPtiPWNool
         4DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782145784; x=1782750584;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GT4x9AYClT9t28+ozEWKPRC7uYmzULjZEqq+oeNUuIc=;
        b=YCh+BQx/dcJb+qzfXXbL7jfJYz3Eo2AyaFx1jUKL36dI20LzafVM+hdk37TTQ9uUqg
         D2cJUX7EnheAQgnJ/wSCZ30fLcoTFF5GrMuGMAZqCFv4q+3NESyylW1Zg8LOXwB20ddE
         7U7h1xuePfsZEsNkMKrUrNOG962R74SOmar12aBQtvU9Ny/xs1KeKI5pJv5stgIYxLFw
         qwghAx3IQO40tAjYtEewIcmgcojQR6eeHfFszwJW1Tq/NLAMG45VqV9MxvouIKAGHkhb
         3SX5ZtWUt0xxAlBwD6jShJrgxLkc7f1tJgg4rgQL3FnA9eYRISHdAD/bdFTrlUYZu2AD
         4WCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kI/sbhFlFas9SrJF+f6MLrq/wSf84Y6JdM/si8mZFo6Dm1fN4lY6dCoeg0OE2W2Rblqd9bBrPD3ko@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ltca7DJDUkLW24VAHLzRZVj4tvsmteL+KAM4Xh/M3xsr+E+1
	IduJVRK0AFHPNqMy9+6nRkiiCv6REtRuhOPMC+wkMoMTVEW14zEoJZ4x
X-Gm-Gg: AfdE7clQjD48/FUKpHOQeyBAv78YKYQk29C0lZSul8JG0R2PAmQgA6u8NN8q9432g6V
	kKjEZ1INvU4aSKJauU6k0uxsB7sVaJQ9vJWxE3HFzlhRfY6vXMjnu+uFmRpiE+bW48VJaP5pWDO
	RNVHmSl/9gUYG5g8Eav7t9GYVHTO6EO50c/saBL1RF2I8niKn8rCtRvlVAaRkahvWgg9gfB2p1+
	r0ftTLjPGLbxrNCWLhIZ5yX28ByQLlYTT1s+jO8l2lKBltIcEwV5T3q7IMCvifZXDiHote6+HCH
	GS6M4pizBUBM2iqb97Fkso2eDE4typXwzGSXAgO1UDVL/eQakHySzRYwnQ7YYxW2eohW2arf/4r
	iuax3y61s7U0pEuCmCMruqi9YmoaRFH8ONbw7ZEsgjrDy5UH1AEru3DCngGzE3UI/U9R04uX5vY
	fXZ8Nu39f/9IA5DXxHgYOpyJOV8Q==
X-Received: by 2002:a05:600c:4fc4:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-49242582235mr223592595e9.29.1782145783378;
        Mon, 22 Jun 2026 09:29:43 -0700 (PDT)
Received: from localhost ([2001:4bb8:19f:d19a:c1d2:e9fd:1b2b:136b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5ddbsm28998960f8f.12.2026.06.22.09.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 09:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 18:29:39 +0200
Message-Id: <DJFPYCV2FXW7.1BFG9DURPZRCC@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>, "Guenter Roeck"
 <linux@roeck-us.net>, "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260622122200.14245-1-flaviu.nistor@gmail.com>
In-Reply-To: <20260622122200.14245-1-flaviu.nistor@gmail.com>

On Mon Jun 22, 2026 at 2:21 PM CEST, Flaviu Nistor wrote:
> Add support for an optional label property similar to other hwmon devices=
.
> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
> distinct names to each instance.
>
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> index 17351fdbefce..f00b5a4b14dd 100644
> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> @@ -33,6 +33,10 @@ properties:
>    reg:
>      maxItems: 1
>
> +  label:
> +    description:
> +      A descriptive name for this channel, like "ambient" or "psu".
> +
>    interrupts:
>      items:
>        - description: measurement ready indicator
> @@ -72,6 +76,7 @@ examples:
>                           <5 IRQ_TYPE_EDGE_RISING>,
>                           <6 IRQ_TYPE_EDGE_RISING>;
>              interrupt-names =3D "ready", "low", "high";
> +            label =3D "somelabel";
>              vdd-supply =3D <&reg_vdd>;
>          };
>      };

Hello Falviu, thank you for your patch.

Should we not add a reference to hwmon-common.yaml (with
unevelautedProperties instead of additionalProperties), as label is
defined there? I believe that Krzysztof Kozlowski did something similar
for the shunt-resistor-micro-ohms property. Could we follow suit here?

I am also not a big fan of a name like "somelabel", and a more
meaningful name from a "real" example would look better. I know that
some examples have already used "somelabel" as an example, but others
have used more meaningful names too.

Best regards,
Javier Carrasco
