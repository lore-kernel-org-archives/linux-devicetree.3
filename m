Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C664C9DE5
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405453; cv=none; b=WxYUB9byY2XYZwjreUy5l2OxqZr5n04WisOWz8mwWFI5B8R+yS6PhP/lYn78mb8IOFfKz2H8BUmlEMXgrza8HlVeXwSO0xJ821HvdWYHtL6LT0qocbA5NE7tjTTwh9Nijf1o3mHstACt6AprCIuq/LZQv9cMtMU/N89dkCqTkp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405453; c=relaxed/simple;
	bh=hwq6n3lMri6f0tS9cV1XHP1OuBW9AhFJjSclegmlXgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srjJJncJEfVNCiVcEeKO1SAfuleQtnQzZCNjuFSGGaqBfck1XbqyWeMhj7UVxTo6rHhd4c0V4H/qbkkYLxt9+Fucar9rUwlNePK3+an972l1OyRtUgCWzPFzAseqpf8/u9zfeHWIEWvnfz33H8E0A4nJCKc2X39VnHjEwvP6qNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uR5KCq9G; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uR5KCq9G"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so19201605e9.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792405450; x=1793010250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQPRCU8mulrVTcYx+mtCokl0uJBA6jXozBw1EvQlJfk=;
        b=uR5KCq9G1RH2lqdq1UlEEcHMbz43vLpROotfjGGvjHIDuEgPeKnq9RwDQkivZgKNDC
         Sq8X4Dn0cwH/Fzh6/IyF7NW1gFENktFgycejmzj9AtTaJvnIjTq99B4cAaQS8FOClx2j
         5+X7V0t6CZUfaKMZhkVIc1heItesw9YQrMEOJIBjF3OvJKDBnQliRsZIYFyGKZhK/JPz
         YYBgX8rwsRXcwPek+NvYVQ7CL6mddfqKlEC+EBwZM//qlagqzpHlBqs8cMyd5JTzhgR2
         5vFHodufphnwbuzChUTSKU6jrJ3dBAwiRKZr/oogHRYoVcQpY1pPNfJ+3t5rhvJW2UTg
         Skjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405450; x=1793010250;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQPRCU8mulrVTcYx+mtCokl0uJBA6jXozBw1EvQlJfk=;
        b=sE6YC8P82xvmjNMfQWojebCQTm7DR9ofogzQbBRQ32J5CbBm9IIKvgqef+VUrGJzpl
         AJAcQgnDuDOahuWJ3HdObM+ZVWtCoKVMcYU3pir2IsmFiWdpv8G9CiwrfQR8rUiCANEG
         o8p5Bk6Xz7dAWc2tBv0/anurnNDBmYehs6K9veoAfTn79lmz+ieV9bAyxk99MkgUYhp0
         RNhpNM0b2w4OIlEjF2cDGCG+zpAKe95BhLygBe+H5+V9U3ISG9/1Gsw3WYqR8ZN5aycE
         Wc9KmD2ecsyL3PHpwse+dx5Oj5qey5lNoUxYtp8Z6xz4UyZDFNDVtLnk1DKI4MRrfQoM
         MZVA==
X-Forwarded-Encrypted: i=1; AKwUvBxSmpEo750L6b1QWDxcPXlIApM8OmITaezrlQ/qJ8cAVGhsrJlrqLc4abXSbVR6qLCpe1/TPKEqRFgf@vger.kernel.org
X-Gm-Message-State: AFq9FYL3EYg5RUHKBxP6xwZHGxu9B6rutcLEdOY4Ut2rY1kK57dE2T1e
	lfFc+J+dC8TunG/Lexe6xrvYHGlImJvYEixax5gFDaokIk2gYLalmXGyj/jfVFrEoKU=
X-Gm-Gg: AYBFou1x6DXYrJ2MDtUKuoq8KszOVQDHEEYN9eN6QKnEsPQKAlBDWm1YDbW2DUqVLzs
	3HkLlmxDzxGfWp/06Opqi9MTFToPOt0Ai8UQjB4aGab3hhUjIaV6+qtLTp/zbNXRDIwMtmZY4/Y
	neOHZSseBsUlN8xx8qlc4Prw3yLCCnlJp0yJnq4PoyxNFVRIv0WH2Hzg+Vm38zaMQEWwId951jT
	e1KbYLYtR7kE1UnUnrVLhZlyVe4yKWLpheB45nb9dqJ2GfmyrwmKdHKpacqBYlnYpaWDgUXWzlS
	FHSO6w/QEtck8+W0fis/W+UaX16HvZraVuFToRYnzLDoXrVLnfPmlL6SGj0OkMfg+szShGbCytR
	HYK/WO/7/KKtEBbNB8J6Bp2rNyJ1B+SJrYX/aHkt+D/JT29pKRBfd1o5Uef1N//eolmUYoBl6Qh
	rO6SnbAhGEmT3oo/g8+56PVRj4sBLkl2o5YO4Mm0EcSDJeExAZuEfplyuQG4oSOkKdEHiUxse8u
	VyWZ0HK3K15ZDQsv1ZS2Q==
X-Received: by 2002:a05:600c:4e50:b0:4a1:76c9:5408 with SMTP id 5b1f17b1804b1-4a1d7600190mr157794965e9.11.1792405449821;
        Mon, 19 Oct 2026 03:24:09 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.252.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm187781085e9.0.2026.10.19.03.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:24:09 -0700 (PDT)
Message-ID: <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org>
Date: Mon, 19 Oct 2026 11:24:07 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
 akapatra@quicinc.com, linux-media@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
 konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
 alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/10/2026 00:00, Bryan O'Donoghue wrote:
>> +    unsigned int        lanes;
> 
> This statement and how you go about using the data aren't consistent.

Re-reading this.

unsigned int trios; would be fine too => data_lanes and lane_polarities 
is a multiple of trios - always three - does it imply that the first 
three entries in data-lanes == the first trio ?

Presumably.

That would work too.

data-lanes = <4 5 6 1 2 3>;

=>

trios = 2

=>

data_lanes[4, 5, 6, 1, 2, 3];

trio[0]:lanes == [4, 5, 6];
trio[1]:lanes == [1, 2, 3];

Probably "trios" instead of "lanes" makes more sense here and the driver 
just always validates that count(data_lanes) % 3 is always false.

---
bod
