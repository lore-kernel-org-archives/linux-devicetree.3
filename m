Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5063A9636
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786214380; cv=none; b=R7NQV/2L7VxRUistn+soNAAJLEGiYLN/owkeAyYl/a18MS2HV8/WV9ghS26tOGp3BU9vkWZfu0B0XlI0LSf14ocImFDJhloWejBmOputlsR2z0mCAZx7ta4jxx9syowJ/LgyhBYAXBJDVsISvTaTntpX7l+FpgmlYUIPLNCzvKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786214380; c=relaxed/simple;
	bh=jSQ0A9K+xnOHZyNT2OndwMSs4ft9/c23YE8mq+yqz8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJCD23Y2D4RmIS0bsmlST+BsalZY6g2OZ31nLkrwwr/55wHFjy6RHO2SjEItolz0LyHUlueghiSaLEsJDWYVAx49WlEJAtY7TbULnpNRRsL48mcpHW5h5OhXvvdqXsGCmlShvLGAoCsfs+8n+s+yVXb6/wAGVAuoLEZHZcquvf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PRBHkhq+; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PRBHkhq+"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-451fd21113cso563695fac.1
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 11:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786214377; x=1786819177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzZj/lVPkDVMefq5EaYotjMjnYdA6H3Ey0cDfrm8V/M=;
        b=PRBHkhq+fjME1DJ06HOImXmppsFHIXBkesennVnK+GzQMYGaXxs2mjh/UCcXEWdBIL
         Z1BaWXi9Vyjrf+S5tygjkvN8v9A5Y5xku1LWl3cnvwaBmzq/lmVYzWgHlm/Y5Ob/PJnC
         Q9PlZgROQxHhFwCXNsVOFSWt5bVcimhFmjfIOnxUiAw9IwxB3tfKvu6gOFMeAdSbqRNm
         5uYPAhB1NQNISu/GW6vHkiDIon6QqBITmYpgyphGvBcabsvF+CZME1Uc0/Ka1ekFDYpM
         QGkoJ2d6HlYMi4ekaspS+fSpokT47C6+UM+PjaGvNx3q2IseI3bnT3g47ZZP61gSgGxE
         J7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786214377; x=1786819177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzZj/lVPkDVMefq5EaYotjMjnYdA6H3Ey0cDfrm8V/M=;
        b=ewnuLWplq+MckYPndhWOeJ6A9KfELMc3IQWDBd3Y+MmnRW6QkY1XCJi7z31MbcpP4Z
         6xWVaJkCXRidwQ1OVvVkKnVw8A4qaRt70Iy7iQLtaAnUlTwtn+HMeLYp6b7+q8N++3Vo
         Af1MjkPMjq/IqhPPKPQCtKMdonSM42jdQ1xUm+iADym8c/+QSo0nwAfbKwvXYzcYjhM4
         ECvWI4NLWAXTvDt3NdJEdvvKnNS3LeN7kIMVy8r6klmHrQ4jIy2xWPL3h/UxlCMhSOgr
         yjqmsljtMAvKy/6dfZQ26WtMjIlZTvpvaEI14I2s07WtwAHDFSK90j5XkoEAlViiVeHE
         OAew==
X-Forwarded-Encrypted: i=1; AHgh+RqPO6S+Yv0i8e/e8CVtWw0V9Qhq71P47Uj6n9S4tHCs4OpKo1uZHJkh4UE+50InrHpBCDJ2OWMWFTH0@vger.kernel.org
X-Gm-Message-State: AOJu0YzID9VyfJLp0jolxbTaEPamUu70rTJiqyMiQ1Vb3930XJEnSsVt
	etw+hoqYLOlWOfk982Fedd04G7gRSi5+PsxDJT/WQIP8oqq/aHhpphts1YY3Xeg1+0M=
X-Gm-Gg: AR+sD11XLoSnqqxnJT2PnnfamnNgZz7YlbVwxo9s56B3qpnsOwFKLW5QNN7uMPuOvsJ
	NTo/nG4rVTXUqFe7osFOketi5i6n9N+kCQnVwKaX/e7i+vjYjV4yeA0r9myXib5GeBE5kk3Lyrt
	FDFi3PrTcx1KmkEK9AO82HOTwyrAi/vBnakicbzrULdAR/VLzzjdbM2YIJPsl+sEzmIZXxCMDqc
	u3WLvOFU9cEB8sxG3EGF/pCpNt1w13CawTJxnIGfB8P7FHo+fu4QywEllbzJ77Zr3yAWgn0r/gE
	zR7wmkmZjkHIEIrl5lW7MdFG2XbNNxhIeOKFfrLhgctSMA5vjPMKOiP82OaIC0kQ8bpIJfZLbN3
	BClecVzpBy9G32g06GfyDsQkLH1+MPF67whf1AtEHWtaunW1iu+9slsgIReC7iojOR0M4ihycu2
	s9FIg4v1nGKRt/M3NBJYb1lpzzsJywC9VPyq+6OB38QiXY4cdnIr7FEA0hMdKVqarWbfSt+m1O/
	xhfYj07YQWHynlBUyNC2+X1f3M7wENzGCLiYRI=
X-Received: by 2002:a05:6871:4cc:b0:456:cd41:1492 with SMTP id 586e51a60fabf-45a15d4ae7bmr1682961fac.1.1786214377643;
        Sat, 08 Aug 2026 11:39:37 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:99c2:f16e:201c:3bb5? ([2600:8803:e7e4:500:99c2:f16e:201c:3bb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1d793c9sm4702369fac.9.2026.08.08.11.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 11:39:37 -0700 (PDT)
Message-ID: <924736ec-f503-40e4-bb50-450d425eaea8@baylibre.com>
Date: Sat, 8 Aug 2026 13:39:35 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] iio: adc: ti-ads1262: support input chopping
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-5-f89925d72792@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260807-ads126x-v3-5-f89925d72792@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/26 10:58 PM, Kurt Borja wrote:
> Enable per-channel input chopping via the "input-chopping" property.
> As the device withholds the first conversion in chop mode, single reads
> are taken in CONTINUOUS run mode with a brief start/stop pulse, as
> recommended by the datasheet (Section 9.4.1.2).
> 
Reviewed-by: David Lechner <dlechner@baylibre.com>

