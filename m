Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201405;
	b=0lXHjN5GiXb/kfBhroKQ7LKd+fv7hmv8QzXYCxxxj/gyAGLt9w9ZqBhZ6riq2JYZMjLZ
	 sJFs8ctcv1UqopJ1T2dw5QKSCM/o4/CS2ki9SvzZ9j1DLvFjvTwmsTcB9IXcZ9qFHRwwU
	 kLTGdhx7LRz1LS9rYWLrRUAMkTSfBl3/BqFoHcCC9FniULarCp+LshjD686W2VQdNAjHz
	 CIqaTRFYXeJblLlI0rAfqpc9O0tNaw4Pu9mmeboUUgRBfIiQ0ad3Aw2/KDvVG5FdAmwb1
	 OcaWSx5S5zW4MC3yGp3SgXgVJcdPRB82wXEqE+GO7dJrDkFZmg1/L+fb5AjMKZkaewA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=v2xPMZsBlMMHkm+gRncrQAOKCD6wJbIFyj55a8+d/IY=;
	b=RYZ1DepShMZj0AloSt8HxFc3q2b8+NpscyMfBxLA8QkyFdn/xWclWUCOBDGXlmmekmeR
	 mxNWDJU/AobLNDs+b8rDDxPVj7ZksoFhWWOglPHNdTCSd1Kv0Hw8uIg+etZq9w7Dg5mL3
	 GzkwtbE1ytb3WaB5oRPKkBY9vyT84tqgOWqFyHvqAenMOgyb6fyi+XwSrkHfYOgDgR9wu
	 B803YV60cU676U9dYziq+c84BmotJ0vkz1jCygn4cl0UaPjO4W5qwyihBBx/BOKEfbkls
	 EsjLB3D5wPG/JbFdM8TbnujrFMdk1DCpIv/UXMbM2PHCPsRjH3yUAlsq+GyDK4ats9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vJ7yndT+;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B506606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B506606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vJ7yndT+
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20edd106so871052f8f.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201403; x=1793806203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v2xPMZsBlMMHkm+gRncrQAOKCD6wJbIFyj55a8+d/IY=;
        b=vJ7yndT+O7b25l/wGMPE99amMHah5x7U7PfAMfKkHXLbqya0rXClPEzDTNGmkaVBop
         ZD6lI3L2tZL9Os0N0IJWyND6zjGg/IaB+aT8r6vy9Y9TQB/LYjafLoArFo2ufYVPlRrc
         iHCvsJutcMM10JNrT4ndOL4GGey+/+fJVBxh4tC6vHfuWYL5x/Oq5MckLGZ9e0Gsy6JH
         bw0Im5uXyiIIyYG81/Cpojqtdve9BCmukfm70cvyC/H6KxM39Nzp4sFcPMGXSSjf+jRY
         YKh/9E4go4nwwAJCP5viniAsfNFlVKCllc3y8jXwDRi58uc2koDt0lAXKTj7zQg+sql5
         x78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201403; x=1793806203;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v2xPMZsBlMMHkm+gRncrQAOKCD6wJbIFyj55a8+d/IY=;
        b=DUMLnByZ9ebPI8AM+tYzi9oWf/XRmgZykZLPLUpnGT37brjVFh/syHfoslNNxViWn+
         2ssurhb3egcrvOq/L5u2oWNsG2QgCZSev/KziYtbtcZu1Gl3XA2R+WYxiqIJhDqPy2H8
         3nI5sXNSOL1XI5Y+zzeMJhGRHR0WohLzqN1nO7wUhH8gyxIcuCP9Mne5kMRnAxV6cfAU
         kIJ1bpiV6g3DZD/XYWWbz+5SOnX8gH5bOfne2VUG/0YFvia8wjDt4f6DBRsSlrcq2f8e
         AUlJ9suEBBnU+gPTaeSYQLYivvnP1ChEZNnhFjn2w9oF5fs2ljjJbPoGd/GvUqdDVwvW
         iapA==
X-Forwarded-Encrypted: i=1; AKwUvBwTYzieHjCt/nSfSMOm8ue1r5Dzw3WkTNJPAwyJdNAcIq0EUy+Teh6TULN2X0VCrn6CrvGoPMBblSAd@vger.kernel.org
X-Gm-Message-State: AFq9FYKC1F6YdTGN+X6vg4H6Oda/2RQyhU1MyDxMNHP99bB50JTDWHSt
	/TcJmhQjq+6T5lOvXBJMdkxkXm7f12frre8Vovd9OlU3eVhhGVQWCd2qQe0Oms+MjN4=
X-Gm-Gg: AYBFou0rNBLo9cF8G4fHBQYTZ/kCdbETlp1XK18OfE0VIfht+QKHPU0Fq2bvq25jAPe
	lx7Z67+b4XVPd5oI3fY0hm0FwC7PeYlcGf8v44GryZLsKcRuBlfaQ19Y7xxSWXfGmJpvrvIFBGN
	z0zU5bGHhTc0eo6rCW1kIPiRGDnSIGkwgVEEEHRg/fwpcXXyORAJLL1373UutKm9JldCAum48FQ
	eWg425DhYud2GK+txeyCmSpxfKoOiRrWHUbrkFsTSDPW8kiE9tygNqLedaWfcOzS5cocRk6z/sh
	exBHxgwZskC47p1uWlbaqEqTUhVRvOd3meNbOwhkANNyI6CKlmrA69ScCd/n9CcnDkIIV6ZYRpR
	Gi42L4iaatLnIZJPLxzMpT4CW6nukzaVuGjQ/3nROAP75Ib5jSZAENoVKi6/kA3cpiIQAO5f2cX
	DErKg0Fcv32apQ2rZYcSi8HFopnjUWohKkI2mfiyVFthr/x5svYtu4n2VDC0TxMUQuJBBh4fhgS
	lgBLCP7yMICqsk+gtojCXua8xvQoG66gTdbnR+xoKQ6NjtYAmk7v5gLpfSzq5R/edg09a41oPWt
	i/YkbMg/5g4h9wfnnAkVShQkOdKU60h/uaP5EtjhZA==
X-Received: by 2002:a05:6000:41c9:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-48e5d5a45cbmr6725057f8f.36.1793201403193;
        Wed, 28 Oct 2026 08:30:03 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm29519048f8f.16.2026.10.28.08.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:30:02 -0700 (PDT)
Message-ID: <577e81ea-56d9-4d94-b5e6-364f728c1493@linaro.org>
Date: Wed, 28 Oct 2026 15:29:56 +0000
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
Subject: Re: [PATCH v23 04/15] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
>  From CSID 680 on, CAMIF was moved into the CSID and the CSID became
> responsible for issuing RUP commands. Starting with CSID 980, RUP and
> AUP are issued separately, and each command must have its corresponding
> SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.
> 
> CSID 980 and newer require a specific stream-on sequence. After the RX
> is configured and before the RDI path is enabled, the CSID must first
> issue an AUP and then a RUP. A RUP issued before that point would leave
> the VFE without a BUF_DONE event. Therefore, once addr_update is set,
> the VFE must skip the initial RUP during stream-on.
> 
> Add addr_update hooks and camss_addr_update, and make camss_reg_update
> handle a missing callback safely. The VFE keeps issuing its initial RUP
> during stream-on and behavior is unchanged if nullify addr_update. The
> skip takes effect once a generation that sets addr_update is enabled.
> 
> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>

I think we should probably serialise reg_update() and addr_update() with 
the completion in the ISR but, I also think that can be done in a later 
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
