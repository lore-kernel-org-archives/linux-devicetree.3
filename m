Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171768;
	b=k0+y+YRYWKv8fDDwrCSTVplQrg5uSdPpHid8WvhWPqyLecAd0q+AWjhloZwQWdkafmhQ
	 1ha3RwQjicOGBPj3Qgh1Oa8YTxVzHjVR82P9u5bfS7RH+XLEs73uyREmEDSq5GdpK1ZM9
	 G+IYpQ621f0Sla/UJSO2TPbdZfN59gRqpd6bQT296tMt5QjPZ5HUVZNrmdkUAs2mgPrUu
	 Aww+hXT7QkVtzyy2czEX2ngGRO95R+T4tNE0GiiRG8LGUQ3qtllCteXJJpBlN1AymN2eY
	 uzaC0cimaYHiuf5dQv/bp4ARTzHvuGQCZXQ6QQ9u4XNoTaCpVYRlcAHm+xIj/QMg82w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hZruxycw3HvIlDBCBri6p6ZxzTaJWuc5gr86QEFctfY=;
	b=x3a7Gbh9hOX1RxMpuBUH9PlM2Gv72jPA+nz9yq+d6sXPVqxpfaXWy30Tkt9XOTv3xBBF
	 ZELH0Dbd8nWYutZB7hCYKPda+oEWL/s14Wy86pLryDoVkFSpBu/LHzNspa976fzqN0C2T
	 tkNRkn6PUcqots+dtHSgmlNMfrTjJ0g+JUrfHLWUvHOYa2e4N1qkzdaZxKkPZjKRTWI5Q
	 MlXIDwfigfV6yrP5fKdLXcvUXuOf99N5DalYKGgVlPFLeQ2epK1svxIHh0D+V/D9sFRqq
	 DMibytTSSLWqw2TZe39CTcXIOBOp+WkjgNeKIjHRxp4dPYyVq7RgvS4jNEI2a0/V4SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zxH8VwOa;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29364606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29364606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zxH8VwOa
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so624682b3a.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171767; x=1795776567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZruxycw3HvIlDBCBri6p6ZxzTaJWuc5gr86QEFctfY=;
        b=zxH8VwOaOFIJyGhmjiGa4laUF7rcA1Q9LwE8l2XJKy0orGkMrJA2teGvaVl0Unp8MA
         KXWlmTlNj2ARrk/6v7p5wk12uOw1OGBxcxx2tflqmpNvG9uqMU0lWJ0HIiMZrI1bqecm
         eF5btfdGpU79TCT6vY2xc8Tu91M+yHF62swIp1/K1lws8vnmM8kbQ1c5K05CnzUdqF3G
         GRqPI61n33FUQOVMBzqswv90/C2IMOgrJlA0IgNhjL0E3gKzFPLi8KtaKhbtGoPYWLQO
         0XGAtNyWX3LdvnI9/8++ZXWx8/PWfXaOqggGzCb13jCxJkiNqamLN/MvJ9tKnHNZKiJ3
         D0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171767; x=1795776567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZruxycw3HvIlDBCBri6p6ZxzTaJWuc5gr86QEFctfY=;
        b=uH2h8MUv/XD/BIgUpSaKCBlyp3fEZl/3HNOuG6xH697nx8xk60+FBa5cXFSnQ0evkG
         4JHuFt50ihZWGiD0AJipqxfz4rjTW3f+TcfVQHQsk4Fnk8fhVL67FESt6FlafjJDi/54
         SHOioTYZ3OHyYwf3QY0ol7o8+8suYbkeldJxCwbZk42WyN1ioBaBP+50iPVGdWSjDYfa
         Swu7IeuSGF3wWrfHs3rpAJekJio12PgttJJpkz/c9B9neW6Jnf9MxQMXUs6u/ESJTnb6
         UkLiZsGW7TrmmBvskqCk1uR4csx0b2tvKq/7LbbZbWxZSCrfv7ldD1Z6eFJo78fY77f1
         Ty0Q==
X-Forwarded-Encrypted: i=1; AL+hErGcuxuL4vtRYShRoNlPZ+rbo+mNizu2wqeYdr5voxed/qMhLF2iRN/KmHI5fR7JMBNUHCt6z+ziuLDE@vger.kernel.org
X-Gm-Message-State: APuU4Z/ODycaroElPHQYlWE4R365KWAvTHgV3wmocadHwcR7spyYgp2A
	esKTkdE0sazXkcA1IfouTjKZ0eny2W0Ieh86V1epgzCT7BP7O2BXzraN
X-Gm-Gg: AZFdTZdrxKF7+mOH5GBjYzY8/0C7+wNT7sRFIuXwT4hcO6AW3XS7oZn/bgh8nw85ZSx
	d7OZJVqQAetNxbP2nHfX4PLwlPi1+WscKq7DxxbKgYrqyMcMFZLdngtLP0vb5KcjPsFw05TugPo
	keAnO6gGG9kT05dQXNEauBMSjsfm0/JhvyNG1FaH7mzIygdmd2ebNdHBIZeuoPMO9UJrJK9Bx4b
	YP+3qpaaFhUOsOJMox9ZhaSzIPPVFxpeamo0a36Jq1bg0lmGxeUhEZB3JtJQWzGZnHTTU0FQSBQ
	qXbXBI8Rkn/Znw0VZUNWg18TEtBTirX2PJu3UFaFuWsoBabpp/aOjrICdttlJzjdqRSzXt50sXo
	OE9IoqhL/1FD0z8J+NjQUZio8ARifP8jC4+F9xmKdjKKTRwSsmWqIFtrHiDQuLzyU8v0xnZFWqD
	fyHzlxdTkPc29ledMzKPSnYE++NNvWy45Tu2hAWHvy5v0wt+CciN/KNKRRYNDMXel2pmO21ue7Q
	cJN2+V4Ukdh9JSTA4XPetez/snSxUlK+Ao5j0CqJsaX4vc0oYH68pNUeN+UKz+Y+3+liT91bzwB
	/Eh/1jgrDj9ES3Mqro1SQ38ABkwwI4+akFqx82+jSQiS6Kih
X-Received: by 2002:a05:6a00:1ac9:b0:899:74d0:8a58 with SMTP id d2e1a72fcca58-8c87d11f274mr2712547b3a.55.1795171767464;
        Fri, 20 Nov 2026 02:49:27 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45e32sm1292915b3a.24.2026.11.20.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:49:27 -0800 (PST)
Message-ID: <7f51f7fa-7e81-404a-9b0b-44efbc38cdd6@gmail.com>
Date: Fri, 20 Nov 2026 18:49:21 +0800
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
Subject: Re: [PATCH 7/7] arm64: dts: imx95-19x19-frdm-pro: Add DMIC codec to
 replace dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-8-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-8-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 2 channels to match the DMIC hardware layout on the board.
> 
> Fixes: 815fe2e0e65b ("arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu
