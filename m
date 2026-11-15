Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744306;
	b=tYKypVef2orH1a1wvhz+zrL9I1wcH65U3bOkzCU5gxzwuuKwrQG2uJoaU4/kNpp32zM5
	 FflEiR/lB1ZHkTz6JikzWSOapT/Fl3TDtsjNVtTqH/5H8ZhlsAQwnTGvez/WuPFcUqAnK
	 P+GAECn3L2BtP+i9dO/WSUy8BMljtXwhs6G28W2ZuNNYdwwCTF3T3XPf05fIniaCJZ+gD
	 hRx3YkqNUiRTHDkyo00M6JsKME01oPUS33/hjQdK/IdnWxXJokdUwO3xlmaK0h2jKs+Fn
	 onjC/yQ46hKOS+lwbnDfDF8aIEndvg7Hsyyi2TrfD+pnJwfbNt/uiJbhCX1tOuuHiPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
	b=AaVOVEWxFrRxuu8FfPscXa5DcGhdWDJH2Fi2NSLq7P2XVfRAGIur18ilypMna5au5ZyY
	 8HHuWIlAlo1pS6pqYk/yfKpVLwfmRq/ywGg4Izp5bG5e7PIg5uA51qqVDJVNB5uKfhYrc
	 zlWyp63uzTGwTZHEoQt2DlxZ9Hkds/jHOA4Wo+dXIgkk7qqcKI8Qitiv3ibpLTdP6B/O9
	 ebN5nK4izaymcr3uYTyz3ZxXTmIow0BNSxHKhoEkfs6tvqgZtPsfPX2M/kryGbiwWyJFD
	 HtX9fYt9fEunGZM8CxD13EFBmkKpsUBTFmOVGWRiH5UZEPWQrVtFHNRXjGB36lOYMFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BWNNjBki;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9B3606A327
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 12:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9B3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BWNNjBki
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso27583335e9.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 04:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744304; x=1795349104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
        b=BWNNjBkib8an+oyBZyJADhDa56gBBq04KQvE0jWVFpSJfKxpF4gKrAJaqtGgQ9A7Sk
         ojS6OtMdXCNiENKdce+QVKFflf9mEeRXGuwOfIUJ6ge95F2lMlClOFtMNlc4TMSPM0J8
         OV2FXRdUFoZjdPN3arL5fxZOttuMPOroAyZZOBC7Ur5ZUcnxq1huRbmcstdqw1kgjnAr
         p0ABZijR6NLOhZ2WnekX3RIVDKxp+9ngiyZWFPwfZXDz4vy9t+jSaKtI1nNue4l72DDh
         cQtlj1JRMaanxpySB0K8/6m66GzX8SQjTDawrPFHoWZ3u1MpjINNtwJRoQM1ToXyNUfW
         1a4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744304; x=1795349104;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
        b=nLZ/IwkKlCIyyGFxfPGM7yxzSBa60n+VTICH1PLBEvEuI4BHp4wRU8sZ6a2R5lBFAm
         9ma/UbJ8vF7MXZzNyeY/R6TgdU0/KT/2El+DHa1gWX2ySsqEeZj2Sb2+RWM5Ngi/nb84
         7nJHnAFHMIpkP3tgtQ1kGPSnBfS/Ke6rmt7Tshy8wVt8hoklnsW4io429rUAEmHhHobU
         WAFL35Rwg5Qvm6TKVw/3pnjKYjEbzANGuTBRkfjtgNWOQOazXM8b0yFDvMFuZ1xZjgEW
         Yi5f3aFH7R+6XtVOh4fWh48xoVZYLIqh9yMZg7ql39MwSwdtnnmcCSPPu1K2SC+lbHMJ
         E0Rg==
X-Forwarded-Encrypted: i=1; AL+hErGvIkNaT9tw6/fTz54v2Zt33pO2/HvRG/7XRXfoG9sNq6tk9RCSDHvlR1+C6flZA7QhlnathxeipnPF@vger.kernel.org
X-Gm-Message-State: APuU4Z/TCDFV0CZol3LrYvepyiwP7pHKW39oANs7KuVsbavj8AQVZZLO
	JWkqG1fDky7usj/kuR0jHnR8u1gLrYh2ouClt9KKtnx4oMfJ9aUTBwl6ZqlHuhhUcHo=
X-Gm-Gg: AYBFou3MqeoZS2RRa7W3yjjUVDdwdPZIn7FLjq4WEpsW+LmlCBhm79rwWEpdCVEgdFi
	yxy7kcLKFGzY5fzhpfqqWUEtwgu+qlR+hyal74Mouku8mSFfkLG5GY4LEhPjThQj4xjvp3TJVa8
	lU5ht9QhJdwCBd5dvtA2z4SUkujAFItuDKI2ixzvneQX16XTWWagrg5KY3imOyenBUa4VNWt011
	N4OA5ixeIyETJkZzF8V4GOkfNdm9wEZpheZuvT5yS65yV9tUaS6v3bh2lkyRUv/QqVyEri4W7WY
	4G8pUrvy/zHxehrm23hLylfmWo1OwxAFd9RV6nZfMUJSjr8Fv4HOHEXfXGfmMydRcu2mFVnNqmi
	/th0UW6ELQZ6hAV0E7GnETDoD9gHEZMbNu65LhQv/z7tPRy2KQQUE6+FcCiF6BuyVAZvSNexkDb
	zB9D3nK4IvVqsIilura2R9YbnX79bGSVNSxmPbRJMHWkiSq7EXlhLZPfzES3E3KehdpnXyyp/LH
	XL3SqliHT5WuT3Uc1Pw+C2whMiaFhlZl8SSBbVQvavFIGQ5RrM/foeZ3iqNV1IG0AEasd9hzV7d
	Vw+kGw/6zCBw7JsElgJJoi6Cow184MvjgH3fw0dir5k=
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb5de1f262mr108419295e9.26.1794744304054;
        Sun, 15 Nov 2026 04:05:04 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e33ae5bsm267265565e9.3.2026.11.15.04.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:05:03 -0800 (PST)
Message-ID: <a4a3df2a-eb90-427f-8881-f857100779db@linaro.org>
Date: Sun, 15 Nov 2026 12:05:02 +0000
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
> binding can instantiate the CSIPHY nodes as separate phy devices.

C-PHY, D-PHY and combo mode ?

It would be nice to get an accurate description.

> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>

---
bod
