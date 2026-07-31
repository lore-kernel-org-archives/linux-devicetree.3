Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E6A3D9DBD
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486717; cv=none; b=c20DHw4j5to91Npp0hduQUzHIw6GiDR6GJ7Z8QlgNgg91B5dHwY+2KgOeijojtWxiu+vEMGIdskG4ZdslkT45G95PsO58QTtnieMDslFuBzbhiCUU9LN4l7pHtGm0f+cNjEXTp2L9g95nEZgWeWr/gPI+M9CNF7MMfMlerTJnzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486717; c=relaxed/simple;
	bh=kAqAcIz5QtKYzawMTXXlnqgqg4JMmqIv5C9dlJgw0nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Np2cPZW9f4ZmmpX9mc0Hs2q0wY6d9mzkxxEBkGXGv6o7JSRpxKZ78Qghva8pO63WmpCpwBsKUW/S/7VWNCfOJX9FBtnGiILs6B9VUL722SCx34D21hRTxtkvY0MhXQAC/rcu6J8b4QAMkAa7SGjuxGuF6PIFGQZHtX6VBD0MSVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7Z3pUqz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7Z3pUqz"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a09ba1ab24so395891a12.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785486714; x=1786091514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5opxjM3WP1uKoiXfgIFGWWJoVd8/eK2NiqjT4aZc3Co=;
        b=U7Z3pUqzLKBuNj3UHhmmUfdoDH0Etmk7KCj78uk25IN9QllJiSr16WdBkKqPoWIcvr
         pqFMA6DcE9VUsUEImLUIt+ArWzCs2u9wIiEwgiph42Ks/LCSLJr1m5zEOoDiDk4O+3Sc
         h0e1aK6VzRrhK1ywsGNSvcpGywaqNypeeSGUJYNiRhq8Y3DflN8BBkj4ueHcViKJNL+v
         gZLtAsV0Hw2o/VZDuEVV6sSlA5s9RNNx3x1s7jrO8oxMiltYjSZXnUUNRcNpaVuEyFU3
         esPSDjM036pGD3CMMIcLiNviQwcZb9i1blFf0xf6Vru/kGv45WUjD4eWKqgjgiFKBE5P
         hJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486714; x=1786091514;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5opxjM3WP1uKoiXfgIFGWWJoVd8/eK2NiqjT4aZc3Co=;
        b=PCv/BTc2zdk4A8U7Dx3QLeGjKuzSeeiHOF7EEFBN/4WL2XcydJ9WKvlvymd8pOI6jo
         V2gxHgGX5uX9suGMezzn/9OjVCoxy2QxjmfKjlF7LsEwjUejTlBUCmuwUc3bOfDhuQfb
         wG2cZCgE+R+a/A2UO8Pm2MtTYSdoAezoVCGfEgvYCAsegILUGe/yGbixtWKh2RHmd9LJ
         d1Yeu9eTNHV5gN1BfoQxSK9wCjgsdR4yEdiimNYk/s2zEFVHs9aUUt7WfL192AOCm32d
         tJYup4nOn6/DS0gF7MEGDqxJhKKxmqcsZSn/zXpk/mnHx7iClAHAm0YWvlU6ne0FlnjT
         qqUg==
X-Forwarded-Encrypted: i=1; AHgh+RpnSekwIb7DmfrHnq1JsT7azei9FBvQHbsfsyJzEURZaXZDEI3X6VYBXWj6VGAyCJRJgAeKkoJijLaU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7qnlq0+0F+KbAlmqWNQOa5JWiwUg7JbKir7gFAkU+FWp237Ji
	5SapfXGKDzGj9X9ZwrjF42EtB3zdzSQwgm7CKRvvqwF5SCOprXjDJjXIN154bGxZx64=
X-Gm-Gg: AR+sD116oGTJMfYxFqPpBPgU844HXqg1sNxcmnyN9X3n1xeqmGPX5ASdDVEr2PwFftz
	5SlKSbswiSUpeE2uJgebFKiPrgy1XHw9MfMTWudChRS2eohjWowkANCnFUmTRvgsf5cLep5DCyx
	yxMszIMglCNUFDC1pP3uX2Z+dkrqytmSbTFeJBenhpg10yulyndom3FZ343pUwi79QrYbz/S3+5
	TAokhInfN3Hu5ncu238Mlt56pNO5fLr1ZQkBilOqZmw7hrF0Z4W412A34ais1+WPE/5ofrEt1Oh
	9Ek2VyFrYk8iTrW1qrs5Wrs1GtDIGNoBh5OAwX2dcxKcOmsc8szxY44k/R3FPmDSHpbSjW6Q3QT
	rp/NBg3jju/fn4Zx0X49O+/TtcN4GS1+d6ilDdoAbl1ldDXGuL3P8tawcSTNdNvAm7YHu/er6b4
	C0BW5Q9YO0jyws+ZiA2zIZlKX1Wk0oV63kvD82PucUnPI1gRu4kqvx+DXudCWWakbmIYtgE/LpP
	A==
X-Received: by 2002:a05:6402:146a:b0:698:81ab:c506 with SMTP id 4fb4d7f45d1cf-6a098cfe5f8mr558492a12.39.1785486713758;
        Fri, 31 Jul 2026 01:31:53 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.219.203])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5b0c0csm581589a12.7.2026.07.31.01.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:31:52 -0700 (PDT)
Message-ID: <a83a736d-f53a-4dc0-9886-ed1aeb33e82c@linaro.org>
Date: Fri, 31 Jul 2026 09:31:50 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/19] Revert "media: iris: Add Gen2 firmware
 autodetect and fallback"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
 <nciBbGKNOK55HVq4C9HNepE0A8FCWZZ2muPnZ1bx53-GzZ_vgwa_mnh4V8fpOmYYK8QgwQsm7PbYDnjeo6WGGQ==@protonmail.internalid>
 <20260731-iris-ar50lt-v9-1-d71a782001c0@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260731-iris-ar50lt-v9-1-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/07/2026 00:48, Dmitry Baryshkov wrote:
> The commit 412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and
> fallback") added support for detecting the firmware HFI interface based
> on the firmware contents, but it has issues with the MDT split files and
> with synchronisation / locking. Revert the commit, it will be replaced
> by the better version.
> 
> Fixes: 412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and fallback")
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
