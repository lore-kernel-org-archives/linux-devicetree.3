Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B821917F0
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 15:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779637049; cv=none; b=VB1HADaPIT4OZgvCLwhG6ovrY2U/7bgkB0Bx4d3JncUOKGsupMwbsfzGkH0mfzraAv1w+VKWQagHKiT7kGugb1sHrRU8k5kBQN8kL3Bye2RpMiyjJGETwJaLwBasl99ZBpu0ZlqM3PKxIZULiYdiJZuwqCsOnBehyQpAfbjTjPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779637049; c=relaxed/simple;
	bh=yM51uPAWbCZkgTKU43lQPRqsYdSsABpsKVsRDiRWNaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYUD4ql+IzdhlGT7JGhQn8ogBlcj+Bwe+/0BKmVJ5Kgyyzq4Q0o79SOXo8y1qvzw0NBm3GnUITIm6SPeTFaL8ta1U3c5b3CswtcGmXMgDsGOhaHlkeCiKuVSbuNhxHV7ww65iD8LQFWJChFmVwb21anLfmo19FLSFm3/wlzflRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bKCfVHCq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bKCfVHCq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48fde648a71so58197715e9.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779637046; x=1780241846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9w10kDWoHcF1zCIEhfuXbWfL8gd+AUbKivXCljEU78=;
        b=bKCfVHCqzGQy7RknhigTI/YA1JYhCmzE7erdPFNWSrwBPSWcU3zDVJXmKiCTPvLmPu
         WP/FV0IdFzJZ/KAWY7LY4qj+yLrTDd/7Mm7i6/3c/bbcwD/oxcAjrmhHTQWlM70qUSeD
         5cc7aULKxHdItMEZSwSfL2+pHUQCZXVXSnL79C+Y43Rm15twoL62k3rDNtRjEr3tjTOK
         39NZbqdYK/dz4SQOZTCmy/UcJNZ4sq/Kq+9MtrxiVPYxe2vrMoLgaKLQF3sMPUZEWcT0
         xPH7PaCGp2WTyVhYuRw2f0G01dU5pXlzrrR7OtKPLGRfDIKUEcBT8/QsBP9Y92OqZ14z
         dOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779637046; x=1780241846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9w10kDWoHcF1zCIEhfuXbWfL8gd+AUbKivXCljEU78=;
        b=PV2UoDPlV/JTXP/0YgjVO1NojpIIHtvWa/3p7gTDX617mvAJmWj8Mt4pKX9lvNKxl1
         RKyaoCpmf60N92fkHxprnBNk2YEareJhcc9ktXD4+6h150ZU2B9TEgCd25TG3Y9LgRMH
         cjxmg0V0jgACbmXB4bdb9RC+9p4NkZUTTZfTWRdGR6VbdEKZ7vFEeYL2Dou5IqdxUP9D
         LoF1VlDodY6UJUw8wjrFvW/mJWYGRaLj9TaaOhYZ0m4dZrtaOLYZkEhDDRdf4T+Qie1R
         ygNAwTt4QI1jQ/A4nNLX4vkHN8LCYyc9Rdebwnxw+V882H2pp7o/pe2jYGJeTqgR05C0
         Z4xw==
X-Forwarded-Encrypted: i=1; AFNElJ+vAKXN/TlSTfgnk/J4Bari3gyiFagQr6PNNyHoY8y5UOBDmwbnDiyvyn5yld/Q0Fory6fFHSyPNIIC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ljIhM67YkPC0M+t9ZskDFBfr1ZQA9o/ibTInJmwmiC6R+/s9
	kGWg5HS/s7Tn3+Xk9GIJGuGh0i0AX3yi3b3YoZmU3RAxi1MPWXFfPqgfm2LscaQL6o0=
X-Gm-Gg: Acq92OFEBTr77dpDpI+Q7748ROEx2PUidgUTYdOZxasPP0apRTYYDbyxodJw5r4DGEF
	2Nc08QHI59neunCFI1XHXsfEzCwb8uw6ra+LcpwNTlrGA/7IF9ZidQ/MlJlA1hAXN3er90bJfx6
	0KTJ05mmSFQ1Fi3Lo4rlDtYIk8+JThqLayVMMGIT8WSELjUDorhwAikHgvVeWr8fAm6JmY91cIk
	5yLX//YIed0gF0r41TgZ/ByB5aQgPW0hzdW5KLol1U0TANLRoOsNPAEUTBDMvKAP9G8Oof/BUzQ
	zaXenZTd55gkRfzfOktB/t0X7g9TqBAuL2rXX4uc+x/H41+3Zz/iBcgM5NQy28xHM7jT22Z7kv8
	ECUOcqUxc+v1scbbt8doyrU3CRLSERay7S3lsaxSGqYQH1NYIMvEM4r2PoyjVmkT4vi7nKPnThW
	Woisaug2FAfeINvDqfZlgR6KBnPuDd8n8OBuTRenJCai5BD4lGqlSpI8PQl5D/EL0dn+RgEMV2a
	8aaNOOq
X-Received: by 2002:a05:600c:4506:b0:490:3838:1548 with SMTP id 5b1f17b1804b1-49038381676mr217241985e9.13.1779637046483;
        Sun, 24 May 2026 08:37:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb1d:8ee:8600:662f:d52b:3b78:6113? ([2a01:cb1d:8ee:8600:662f:d52b:3b78:6113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d493dfsm20504579f8f.23.2026.05.24.08.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 08:37:25 -0700 (PDT)
Message-ID: <6c8a3b03-457a-40e6-bd2e-d0e5f2766ae8@linaro.org>
Date: Sun, 24 May 2026 16:37:25 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org,
 conor+dt@kernel.org
References: <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <20260523030420.045501F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260523030420.045501F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2026 04:04, sashiko-bot@kernel.org wrote:
>> +  vdda-0p9-supply:
>> +    description: Phandle to a 0.9V regulator supply to a PHY.
> [Severity: Low]
> Does this property name mismatch the actual hardware supply voltage for the
> x1e80100 platform?

Yes and I'm realising I forgot to make some small changes Krzysztof left 
@v3.

----
bod
