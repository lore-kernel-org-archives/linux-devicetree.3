Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0143E437463
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429975; cv=none; b=cIJ3CEgAkGaTw5X0mHiCFBGztTL2z9uDvOvClV9jBel2NMbd2YhB3bb+mUyIBVNX8WsZqURsLt88qk6wfS+aQP9VBqEcM3IXSnXSBlvKnDwK3+LgMW9ZkPYGMfNMTgj5fK4mIirhYPLf+12R5rCMZMHYtQefz5ZXPdDSkhpGmmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429975; c=relaxed/simple;
	bh=4PCF/pTuaQyrbWnAxj22N/OYcuTbKlF5oGBXIAB9HlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qry6uLKzrnlEqTCqZFAnugD/QF4uSDs7ue43NYV/5k8XoXfU2KQRpYKosZiv9lFtNNnxzhD2618K9l6qjWubDZPFRBmOyfr/BPDZPxPrdBgID6UVIDQ3oa0ycS8Ayg9biDwEYLVFqy/MRJ+zGpuKQLy7e2E+SiIy0Ybv9nClMdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ihBQu6b0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihBQu6b0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so12204375e9.1
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790429972; x=1791034772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Z7fw3g78kgiNXX0wSmQAAF31Sb6byeELkTa2HVDBpw=;
        b=ihBQu6b09GQpB3/He72I1I2v3E07wXqqmjmsqIP37DuzjzuVmmABwkkLhduGoWmsYH
         3Jf4ADssSWbaTfm8tWx3K6Ur/bS4GQ0Ca0zZ5x7GZYOoCHkqdrXVEoFNrD1+uX4s0W1M
         mv6BO6eHrVTqzPmtmVPpJBthPJR5aO5koB6ecyAjWTHmAFbAPJCt56+PlR/G280162Az
         UMKIQ7QNn3EuhBnprpcuedFgJ4uV1NuxjBlg0tQ2IcK9s+WH8I6B/CUk6X/vYffr+mAH
         eL7/Y2ipqi6v9Nw1GsUIqNeYtvopTcs9DxRRPpMyTAGiZWj+QCqIzSN02eHd2srToM+q
         9n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790429972; x=1791034772;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Z7fw3g78kgiNXX0wSmQAAF31Sb6byeELkTa2HVDBpw=;
        b=rmf5Ism1zEc7Yd+wykYtmFS48+xBQEYbhRLVdrcNuZBvKzmIWgsCJhbUhvNpZ5M2DK
         05z9nGVqj5PA1ZNS5QE5NhKuV15cg9EmZr2cJmIrdwFN6l0jBXU7YAMYcX7Wt8I/MIPz
         rrMBTzwO7G7kvcpEjLeaqnFJIV8ok7lcIPzFDAs61TzlI9DejE4/qSKqPaHqYT5MeYAT
         D615DvBSFSpMRyi53FFrM6Yh8tY5GFJfXSPslJ8bf8m5Jt7AmZfhvgzYZrmWO+u0ytbS
         VvNPOPLy5MPhbtrJcW9mkazlVQ6d0HtWZszv7hV9fD1lzW6p/PWxuHsm8vcZd41pQAKf
         xwXw==
X-Forwarded-Encrypted: i=1; AKwUvBwylRWH330sQXJc1IExC8r4Y2Q4VssyjWvyoktX2EXhrehhkVxwI5T7WgImp1/nAgKeWkUkhFHobLhs@vger.kernel.org
X-Gm-Message-State: AFuF++nimDEzodMYpx/rV8tCx3Pou5ATFa5+djxUsvz0VbnKgIQTjhGz
	s9iW0738Zu12vgDakVuCpfLWt7UkAv03M6x/0aVKCsGHVgDOXSxydB+W6eaTWpZuNHU=
X-Gm-Gg: AYBFou2L8ORlua+Fc1A3HFL6b4HgbBZaunOX7o6saDSlGDrNVOFOA3qsPFSIy/WieOu
	L+tyH3nbRoD9pfyanT8hSaRRlFtisarR02nQRWHCEhLF073Azv5dlJrfSWI/TZmLzWHJCOi1fSo
	P+5oFREwdKaV40zXMRhdHn7eHv7aTPZu2AEELhqO+2a+3+qoyXVZPeWbv0LLtyExZh7bbCHD9JF
	nqoeLxhzKXbS2JBkk8nuaYQP7xTwHjlk2kBfLfBeOP1kvdIIITk0BcF9kGHRrrEVl6Q40xd+VH4
	kV2CxZafbeAdgXIDB9ngvkLtiVLPxhjYFj3eaY1cUe56WjS3LqkizamhlPzDsL/mo9znHvDs4nk
	ZCHSBDwhJ4R3h7NRJpLploe3vuX9+dJqEY8BQX8cWjqsyer7OdzGucwDBsqCiUul5X3/6X1oLau
	BUyF7enZcFzXkgKkE/DXcSY1RXMgmuGtFD7o6TDc1Sp+Ssb8Fof7hE0gght+IsVm6VXWGYTs2wE
	Nffje/ZuJ0=
X-Received: by 2002:a05:600c:a10d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-49fe8bf91bbmr113280505e9.4.1790429972111;
        Sat, 26 Sep 2026 06:39:32 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a76fsm14706746f8f.7.2026.09.26.06.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:39:31 -0700 (PDT)
Message-ID: <0946da1a-e8e5-4ccf-a422-abcbc24cdab3@linaro.org>
Date: Sat, 26 Sep 2026 14:39:24 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/12] usb: typec: qcom: Make PMIC port probe
 selectable
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg<david@ixit.cz>
> 
> This is a preparation for extending the support with 1st generation
> Type-C.
> 
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg<david@ixit.cz>
The code looks fine but, I think the commit log could do with a bit more 
flesh on the bones. "We want our own probe function because"

Then:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
