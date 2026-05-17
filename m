Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ADB200110
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012214; cv=none; b=FMo7aBu/5l+cT6atTd6phzIhFKYZ+5UC1QFm7+p+C6UJsZ3dnc+miWWkXmeGi0pZW4O5wStyuWDQfG9i+rYQp/JCWQyebFkQv5vFFEbKfcpX7RnorRbckqTMEdrIuRWfaRFv7LHlL/d4SaBz4dTu1P8OLpii3h7n8nbyOPFKxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012214; c=relaxed/simple;
	bh=wRYzGWjG8dBvrWtvJU/3v9tpJifFQCAuIqQW+hGZzJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+U2OH6YkAnOc/HWOSspupCqL1lefTAud8fntNKabG8lBSIBcnnKO18IPRd2Do/L9H/jjuiTtAFmKhGLLffvGdjulVjxnwTAncon/gQIwdwxCKQ6SYR+Q5MwS3p+lTmykyfms2uHPt1FcVQeGW3+0kuqrCkWv2+T4uEkepTNOak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hnrt663T; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hnrt663T"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48d102471a4so8841235e9.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779012211; x=1779617011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApHfTFbhl3QFfnWcwbX+8pHiF4xUgjHFERxKjqe61ao=;
        b=Hnrt663Tpo4iIs+i2bGUz+6N+zLM5Axg+cPCpbkQzpefe1cgS4CihZZzd3/q7DYndI
         +pCTdNvEBwggDt8Be2G/yBz3Na/fxMsdX5LRZ6U5NT069j7YXdo5uV5605QWc4Sc8ajd
         d+aJvnX7ul/89Tw7Qk8ql0AGBcYYcL+tsnC+B54l0U+1JEOLkDRYtHhpk5c4dLwJGtTG
         2fi00BbPw605vCN5kHJO55dJJQjGzsZuTroHXXvLK7aFCMGCLFzUAL/vNMDfHap9NpM5
         rvY0G4OQSJVzbJIQ2p1gmnqPzCZtHQ2dQcITojmEkWDhXtlxb6cVe7+HzqwmxVlMUrSh
         5OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779012211; x=1779617011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApHfTFbhl3QFfnWcwbX+8pHiF4xUgjHFERxKjqe61ao=;
        b=K1XtUY/v2nauyElGb5KHx8388zG1tKN6lwldol5ol9lcerz2rqOj8nCRaaIIdUItgH
         7GdnIY0z8T/tSrRQvmd5S0nRb0irJ4Sy2sXCgQVg9fBCnQr2X7w9Er1Y6g9Oj49y2WiY
         1xpK8S9AohO+tCeiJ6jZ1ihKFkXnDBjcbuEYKT8MehW3Iiz/NDKbM5rXEUaV9nyWtpKz
         aTEyBA5QsUlwAsWGiMiRGj8WjM5B0Sj9YPouiL5CP0VtlfslgxgryiOYqvFERHB+/VJz
         EuH5Ipib0nNgfQFLmD3IahrzqU9Q9SF1iqLJV83aTUrKgUfzuzx/uucFCb6EOrzQtFz/
         gEHg==
X-Forwarded-Encrypted: i=1; AFNElJ84eq345dHJgydCD6u+3Dcq3yJUC5gNq4Kr62oyIynHTPtJKC+af74d3StoP8fypNccEPuzhBR7Xe3X@vger.kernel.org
X-Gm-Message-State: AOJu0YyLlG+YEyl8IHFQzu3EcetZBETKbaE2u6Ze05MtEY/yakZcwoNF
	uGiP9f0UQJfxvZoL/AdgEc9f+b7roFcvw4EaOzF6LzrCj8Tu9A6Kh3A=
X-Gm-Gg: Acq92OHdPdhrjZuTMYkAgUWeTP3fR3uZoBgnUHvH46dTuKuE6wRTdT8C/uADub93iF6
	sozKICU/HzMjH7nqHsZpHae5289ma6srH3yZcJRZJZ87QOsHcUyS6+5wUrVW8GtKJwR5ZzyyY2c
	+kQOs7ULt0eHeALMNHxjmXxa1CV/iccmalBy0QRlXXTevl2JbHv9j9cd8oly5NI2tmb9mRC6Oii
	a27csZ6M636lksn4tHJjkQJetfeZxN5TDDcppDG9yq3kJD36zDTeRcRWzsWJTrv3TRwD2lLBT6U
	rTvspPlNE5dUFBy9LPbdrI5AEKogOrbYxNhUKKjolJdx1VHy5LbxQInlG/xcXhBIj/baQvS4YSz
	pA3dCj1JLfoRBn9eAFomXMuksLQBQ08y8QoU5cKgDAFYHVWPUX2Xxao2d6vRNhWUsZlCZ+xWh/I
	UU82CbAC4NNZ4JDy6lb8ehNOv/MbWG8vUxZLy+ufdQEiyHVicYL9Z7mrSRRynn/f3YWnhDKAAks
	v7bN446bnvnWDhIuyWC6EoqCe/gAD/WM4j44wxSlenglWMpbeF6jY0qKaXFYYPs/84V8A==
X-Received: by 2002:a05:600c:a11c:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48fe5fd483amr118437485e9.3.1779012210838;
        Sun, 17 May 2026 03:03:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab773sm193374575e9.3.2026.05.17.03.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 03:03:30 -0700 (PDT)
Message-ID: <25464c46-4576-4411-a7a0-4ad950605ad5@gmail.com>
Date: Sun, 17 May 2026 12:03:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt: arm64: qcom: sc8280xp-blackrock: amend usb0-sbu-mux
 enable gpio
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/9/25 22:53, Jens Glathe wrote:
> The usb0 port didn't switch to dp altmode, investigation into DSDT
> UCS0 device resulted into GPIO 100.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Tested:by: Jérome de Bretagne <jerome.debretagne@gmail.com>

The same issue was impacting the other sc8280xp-based model from
Microsoft, which is sharing an almost identical board:

The top USB-C port (usb0) didn't switch to DP alt mode, as reusing the
same GPIO 101 as on the SC8280XP CRD or Lenovo ThinkPad X13s was not
working on the Surface Pro 9 5G (arcata) either.

Switching to GPIO 100 fixed the issue on arcata as well, to finally.
enable external screen when using the left-side top USB-C port. I
will send the fix for the Surface Pro 9 5G as part of a series
fixing various issues and limitations in its initial device tree.

Thank you,
Jérôme

