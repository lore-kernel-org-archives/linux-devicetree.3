Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E28A451071
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618408; cv=none; b=TfMyJn6dSJnHjcYSl4/4Ji7Ogaf1Ad/R987B9x7+tty6VideJ2wOl0T/3iaLo9/EOMMCcDFIBErftGy3zJEaofAEa82Fw6eBr3zinPhxDnQS8lqhV+wg26X7wJ0Kk5Hb6fDZlpndnu+iVDxfqSr3fm8oulIhRiI9owCjFpeYDC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618408; c=relaxed/simple;
	bh=+xQTI3Vq8sC9x2ATvB7YIuXwWhZNhSgMb5gkauWI9KY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Mce1ad5kN+eO93S0paV8sdylWKo6elGS8pwbF0cY32sHr8bNL1PUrQPMtbRJUvkNd8EQ4M5+k+rd/NVsp0pKgsEdZZk89jkUA5dmmnu59z0HU80kLdY/HDIzgJIH1gF5iBOL3cJzzKh/0uq023BxydanWSgB4xXycPvJRyxP8Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xNy36p+M; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xNy36p+M"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15d111ca99so65914166b.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 03:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786618390; x=1787223190; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+xQTI3Vq8sC9x2ATvB7YIuXwWhZNhSgMb5gkauWI9KY=;
        b=xNy36p+MlrjIJzQ40f9dBfcVY+oUmxOWoApXwHNT22jF4A0GGMLQ52d42JVPwut33C
         fyufVnjjzISn6iRuERTD0k5F2mLlFzWvrfO/1qzyKVMEA9nG/Gt2Jp0S82CdU25+awE9
         i0bEzwFRl72D23oaDxjvFQB27hYG/FOoQ/rY/VRRCBdduKS2sO3a8b9Zgh9YSsVH4Oys
         XdorA3+qWvmtartqryORMcTTuwNu3WsCDU+CrUefar/U5FMupiAREfcuf5MKXBpu8By6
         VCMO5mDgW1qq8PYy8QdAd78swJVvZckhtI6a7KwCrhej9+0fqx5+hGEbJhzQY0ndHreN
         LkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618390; x=1787223190;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xQTI3Vq8sC9x2ATvB7YIuXwWhZNhSgMb5gkauWI9KY=;
        b=A996rDBqcHhYjwioIi6MeulYnUos8XNuWFKU1RU881DfHbUhwapddSz1/xok85FmjV
         adwK5mrWy3BzrBtmuf55/OZ2ym5KLdVsVZXGPU6PQ7nhwDsYNF7S5J7S98q7MT7HsT00
         lJMzkY7PuL4s/f1EOQdndVOyJvhr3w/GVbPpk0+t3uuqleXU3hRGMEDQ+2zDwmhkcXdP
         HGOhH5secet4+NO9vGiC7/TKRiWk7CqD7C18PzSehvwrb0JnNJcViX5ksMQoAimrCG3w
         tnFBNbObMVj7Ggx164zhSVlEG7EYwoSxGRXeiw71Kwu1p4mxu/o0QyaeXDr+m/jC+Yi0
         Ywkw==
X-Forwarded-Encrypted: i=1; AHgh+Rpzm0f3UrkIawGAxtmw6vTXh27o72BJVAoEvLf/CNrGfc4VfcHtYw++ntw59N4rVwPKTR4rD06QdsDU@vger.kernel.org
X-Gm-Message-State: AOJu0YzsiqlBxRFLmEEittb7AVcs+2va9UV6u830Lhck6bFWIuWLCGHX
	6BHtAJAOia/qYhdbXJX22N7H0a0DSUBMoaiLCdT7DSOmnvKV8pLucXZjbOtLmvktLws=
X-Gm-Gg: AR+sD10B4a0feR121zIMlxQERdn1sPIYq/K90V9jL2EgYizeE3xMf/PppBDeCYe4RwG
	jA3/XihLNMVBls8LORlpnMs9olRAyWFxHy9FXt4fb6/C5E0vwQUqoCyWHM5712UB1PtnPzjs0H7
	RdKUts+citlwGGaGLozkIhDWm5bBtUEDnP6jZ3OSbUt9iSM9RHF/3RRuN6F7PWBn7PFGS2y2Maj
	IYmv4KcXvuNHRtJ0GKVJvixmg4Wcrj2YMgBxIKQNAWYcK39OYmiQbBTY0BjKRMXPAJ7W5EZqRlC
	eXpTdd2lqtUl/BTO7AYS7jGR5cmc/LKT1aIf26H31u4IjTU/+6Dm0mg05Q6s7YI5Y+im2JpTTsA
	Lse/jVn2GhdxDR/MRhZo90Tw6+6DQsP05CAc6h19SFICSwQ/h210wEAUBtvFgiWGrrizhVli21h
	XN7IY/BGRXiCAY0tAGQOiD1aWkVanPJ0qK7/qHp4/1oy/8w6/X4Bp2TzP4zOYw7MibL8Mlu7q76
	DxbPspMHHy8F86P++n3apEZKw9RSqdJuvzNDHvZqvJkdHVLp+l+8Q==
X-Received: by 2002:a17:907:6d0d:b0:c20:fc74:5dc0 with SMTP id a640c23a62f3a-c2109161ec7mr212458366b.32.1786618390352;
        Thu, 13 Aug 2026 03:53:10 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:c11:afa0:9e5d:4eee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c211aa04446sm620566b.26.2026.08.13.03.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 03:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 11:53:08 +0100
Message-Id: <DKNRD14Y6EKO.XP8CIMGJ4RYK@linaro.org>
To: "Jassi Brar" <jassisinghbrar@gmail.com>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Subject: Re: [PATCH v4 0/2] Exynos850 AP-to-APM mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>

Hi Jassi,

On Thu Jul 9, 2026 at 3:45 PM BST, Alexey Klimov wrote:
> This patch series introduces support for the AP-to-APM mailbox on the=20
> Exynos850 SoC. This mailbox is required for communicating with the APM=20
> co-processor using ACPM.

Gentle ping. Is there anything else should be updated here or is it good
to go?

Thanks,
Alexey

