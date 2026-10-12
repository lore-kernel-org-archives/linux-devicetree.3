Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE639377A9F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812706; cv=none; b=CV/9/lkCXloVvUs6nmfPBNqor+kIpiFh1qFvivHg2j1PL/LGVMA/Dr6wj/Caeu1fTwJCHUxwv0onRqIGSgEFEhdmal06uqFVrd2UqmcJJOuDLbGOPienhBbxitUQ9EBw7hEcqcuPz6W4qPBMhNsR+avWzH+IzY3y4TC2LOVsyh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812706; c=relaxed/simple;
	bh=oQfRZHXjCLIjEYYPgdVCqgdBHbPItDrDGI1Z+Os6XYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDB/fATSVyLn0LqphUOTk9QoG81DJ+u9NUxf4PvG5tme+BqdZLTmbkN5QUPq5k/TK5FpVA9o2/OvCUsfmTtEt9QxM8SNHOpzY59azjcNQARmAbRCM4sWceyZdUalur+NeF+rauN/xZEcNq/ONAWad1cQ4Z25Crg40M6gAeOyJ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ELF4cBl4; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELF4cBl4"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2803384a12.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812703; x=1792417503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2maByi8qUEGu8Db15iKgLtRhl323Oj4E0vQnTrhsX4=;
        b=ELF4cBl4dRPQCPxVJyxjJjqlKlz5BlryGW8fKaSi1yQHaP7KAYq9uHO1c+VencSzGO
         RIVy1BJBxgRKFrMmc/ta6RBiUvINiAqM6Odw9oNBDgjaeox+YdV3ie/PCLkxDwvqwRZ/
         WDKakBbGwoPnuXTWTPXK49Qon7nR5eD4UaAdirVi/74ug3j3AUP6ODM41yZ9vj8HOWuU
         Yf5QG/vFdffi9dpgpPnAX5Z+a+byLpIaRGfiLngu2RENMD+SevAiilAaOzdbdggOucQD
         4aRD5b2VJSxd3pP9n30hjipAZbJz74lpNyRsAn7n135Z7nKul2SMst3jRF2cA9pY32je
         HQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812703; x=1792417503;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2maByi8qUEGu8Db15iKgLtRhl323Oj4E0vQnTrhsX4=;
        b=cVNdPizJNL7zwm9cZ3FICKw1i8dxUDDnf403uXKMqHtisBX2vl6tctmCGg/gkkmRoe
         29CROyl/tVWgQOloiErOH69tLk61/uGYWLS4/qAfctNyndjpjnukme6W93tFstcd2agI
         0Xaks4VZEDZ+yP3+rbSWOXnbrqaUjkSjIYq0a7lSV9H58DNL5Oazmeq1j9nNe4NnKTL2
         6c6gvBXIaZ8vx1XGcrtEyP6KOkDefGKPUMOVs435MQgwpLqHWgIkAh6ZffVsSeoVNDIZ
         2n+h5Oc1nbYrlhGJzYOEv10SswS55kLx4jbYVrFk8RJi54uUW8nZAyXrSeHWE5Hpx2AR
         uJPg==
X-Forwarded-Encrypted: i=1; AKwUvByVcwT08e5bOKVnBfZ7bSAiUYLZfx8j/0hfCpvwP1Xz2xPiXNfsDcqxgnMIoVINxeF9r0TpFYHGg5jg@vger.kernel.org
X-Gm-Message-State: AFq9FYJNyfXMXUJ6RSn1ZhWq9r+KbBcXM2z4iG9MRUGpaAAjRNYGZJyM
	tyjXL1r2e3gmmixJpVfMDUl0b5CyIxN95m1C5rE3fk5N0GLx0kesoqj4p0vKfo16xp8=
X-Gm-Gg: AYBFou1l0EpmAc0YiB/+Pca/CwFA8/lXwsr8ZJwNMKAnnUTSUljRz35vbu1ZdnKHhs0
	aA0MdQXNRuMLE8syws3v858Q3iKV92X8prNApcoTxvL2sZuhqlc2At5ImBhrtIf+xe9xxDKQUUL
	Rbm8Ne6/F+sWpZQDZUcHSW2GN0fWmwpwcp7F2m0G463kNYTNtl1IGvFloyW74LE0ILLZHT9Ptk9
	NKzNptyDolFfghViVV7dY6sIAbpOcL/2yX1+dC1bKwhJCUjDgugUvb1S65VRzrl1GNyXhbipQTh
	8mN78OyihiBaKmI3MkV9QlCYhg2kwInmwjXH2Pc6NEy8WqQLxVPYY0VIrrQWQw7DcBfnvpw0msA
	k54uk5O0DquFtBHaN0eaiU5VY/WySgQMXCBL+1TAF6AdKkO+k/PF0bau0Gr/j++FjzKzM8cbsoI
	MJ9E20BUQEQQJ4MAT7Mg24rsk6VDIUnDcHky4yIYaMXL/IgkMC15gG7jOVmtZ6JrUR09HRO3PLV
	sgcaSuHlVK7s/lueePRzQ==
X-Received: by 2002:a05:6402:5285:b0:6b1:497d:1c64 with SMTP id 4fb4d7f45d1cf-6b17c293eccmr8596872a12.45.1791812702882;
        Mon, 12 Oct 2026 06:45:02 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm1932208a12.12.2026.10.12.06.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:45:02 -0700 (PDT)
Message-ID: <bde5fe2d-1aa3-4990-9590-9d147a5d4d54@linaro.org>
Date: Mon, 12 Oct 2026 14:45:01 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions to
 camss
To: William Bright <william.bright@imd-tec.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
 <20261012-sm8550-camss-tpg-v1-3-620ab6f151dd@imd-tec.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012-sm8550-camss-tpg-v1-3-620ab6f151dd@imd-tec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 14:03, William Bright wrote:
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright<william.bright@imd-tec.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Needs commit text.

---
bod
