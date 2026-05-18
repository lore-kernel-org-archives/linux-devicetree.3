Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0B539B4AD
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142173; cv=none; b=fDkV6LmzHeBAVzy1DSqAVk5mIHskO0hBdBBSShhsoRsxuFXDe9c44IgXi5yJxE9llu2SWlcmT+DBJDCe/FHUKLrLExS+Qv6Y8ajMIREFiry+5XsjWWQ37SSKswcmnl9KLraRXFDxv7GvSE6o1mlTfQ26ZQpPkUviIFPJObiOPs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142173; c=relaxed/simple;
	bh=m+DvEjh5e50QoZEQpu7fp79r2/ZAEXh0/plL42oC1Sc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JNwgD9Hbll2j17lDKU6dsIbpPT8vVG4sXEAMZfUYiTxiTQNJ1TJeD3HAlFvoJdJ19V6r/1YWyemJTJm1w8i1fF5u3pvGNaNI9euLvqB8Ob2Hy20FIHejqgFqXZ78qyrBSE+EkKEYFtl49jDvy5YRPP5+jURTa0enSUFtajeNsxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eK3sTkB0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eK3sTkB0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso24025245e9.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779142170; x=1779746970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m+DvEjh5e50QoZEQpu7fp79r2/ZAEXh0/plL42oC1Sc=;
        b=eK3sTkB0sKSAzuCtT4Z7dWAH5fCV3TYyKfBmnnUCiZtCfy4nNpGEJX3Z3rwBhIhF4n
         /Mzv9ZOmwfAWqiHbBGXRd3RGonI51Vht+OFix6aRPU47gZZgfxYEyRO6ZoWc9osT/OPy
         noLDcT74HnlSm4Cyr+CcwNZJBm+KCLhJl8uVQGkVSs7rwN7O66GTV2oOVBT/FivLqRca
         rty/be4/21VTvr9BpvhoNWud4JwJyRVD0dovjpEcvveIxIMuFwZW3oiu+JNec3crO31P
         e2nCNAxzS6eL2e/Fy1MT835XM9hd36eBNtdZ/hiRLC961nGlYYQCYnZ1ewxtWoarYUQ2
         xijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142170; x=1779746970;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m+DvEjh5e50QoZEQpu7fp79r2/ZAEXh0/plL42oC1Sc=;
        b=Xy3u21NFAVB1FY+UUC+LyyeJINPmCDbE5Wuk+EHXhElsF0JvOzj1CvqYrxyOF0rn8+
         +9ZebUfa3laXHp6SmGXdjzmo3ns1CRvtMB1senvk/o/XolGVCfOle9v6Rag8xcVLR2rC
         dusrUwq09alA1iX8r3nJs3ximvMAad+BnBejuktlV0a28Emjb0Q7gTqukIZmAAkSSs71
         +ddqI/hDNH3LlYkirEG/qAYFJU5BKBJ1G6P4ztXOVTK87txCXyKYCi+BGzbISLAEtb0v
         ynEJ/8oCMKRW7mLJtewNdlqSuIZKtiO2UPL2RuVbKmSXtnlTJkUMJOr/ST4AjoYwPOaK
         Imyg==
X-Forwarded-Encrypted: i=1; AFNElJ9hv2nhR+jtSrNG5grX2PEmuHTwVEdzlKEjY/gEk2Xh1Ig8SZJ8gTrmfY4T3n/BOGnCCKvMQFcanY0P@vger.kernel.org
X-Gm-Message-State: AOJu0YysSwLOKeKAXvlc8N16wSGno/OosRsDXZ3f/yv2A2lqkO/56gU4
	G/KCbcYGLdVxMU1HO4mfd7GeoGy/9Kjr32GH8xChn+3jf26SwhcvLAObdhhGb+gEWCY=
X-Gm-Gg: Acq92OEw92tqU2abXojwQOKOV6CZYBZde4FFs70U8ikaSdoAxrZ4XN3kgSlDm+o5VnI
	H430OUgADwJdUTGZYk0/CtB1qHM38gfw+7gK/osl3/8FQgpsBwDWcS5tl+bLBxehlZYvRPRJwN5
	vatZnqMGj1E3t7+maAb/TCQ+43kE+G/Py12Imb9tpHA8V0CTdkJEI3yln0VNSBI7Lt7MXAAt1hN
	LAdM1CFNbIYQCJZzTT9GuRF0n6mckEIZokmP9Zc0OCQ+jeqYc/HTgvQTzwQggcQep1qMmf3sa4s
	I+uI95VzwkOmAsRh2AA9Lh9L5UqsXqWbEg/YpdH6EyuzFA++twdnsGeY2i5vaG8NsAeUKZmrNNU
	YN7+sP4LNNjLekUDSv9hQyL3Mf+WBr9EIr4upF/1JEWj2uypUnVRX6lDWwon/aEvWstVmryMK1i
	X3RpGXszqUKCUCTS1l7psZBPq/4cAHDm5MR1CZRj4Iu1g=
X-Received: by 2002:a05:600c:4e02:b0:48a:906a:9050 with SMTP id 5b1f17b1804b1-48fe5fdb076mr267945245e9.10.1779142170621;
        Mon, 18 May 2026 15:09:30 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00bbe4sm91333105e9.12.2026.05.18.15.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 15:09:29 -0700 (PDT)
Message-ID: <c1b0347e-0f90-422a-93d1-eb1122de2292@linaro.org>
Date: Mon, 18 May 2026 23:09:27 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usb: typec: add Qualcomm PMI8998 role-switch driver
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <cover.1779127507.git.taygoth@gmail.com>
 <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
 <zm7buc6djok2743bs6ghvlr3bpc4lld4qpgs3ggwjsy45f4l75@kua4xtj6b3wd>
 <d15b138d-8c6b-430b-bfc3-f410b05e4835@linaro.org>
Content-Language: en-US
In-Reply-To: <d15b138d-8c6b-430b-bfc3-f410b05e4835@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/05/2026 23:07, Bryan O'Donoghue wrote:
> along side the pmi8998 logic.

*pm8150b

---
bod
