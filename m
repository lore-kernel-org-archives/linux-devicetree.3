Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A9E47CC86
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489825; cv=none; b=Wmw5HSZKTyc2HP/8Xcv5XgmHTe2p4YxuGzAvc4J/13VXXYv6a4r1D2dD1oUo+Nzc3ev1XR53H363pcKqNjMgvNEMfsozQ3Enuo1vnHeyGXRzi/Z7y7Av6fE8IGGlG+nvrRMt384Ph3ObH4RBCDrx1mlSdy0qKuVgre5eFupyN8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489825; c=relaxed/simple;
	bh=u/943ESl3Qb8WcpZzq4y655CzqzRBOo9awoactxwkTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+Z8lZ7+R5SHijDnQbN2U07a2lhVrMfIwcGj5SiuXkoy5LiNdjBSP0Yzc1WET9IIVDceiCsWLIC0O5DPAMPvcSoYJVYCWOAZMEYAUeLsmsBccS4/fg7kfAWN4f7MPGhEgFjJGo+61H5AweUrBdw8g0ro8HNNQ+mE/S5R+SEOJQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aOAZPz2+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aOAZPz2+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5192849f8f.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780489822; x=1781094622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ty/mxLD4L9LpaeVN+O8zS/3tkJV3r5YXuKG/N6BCA60=;
        b=aOAZPz2+SBP17ZbHpudAwFbZkbE+6sFtQdTHk1Gu9YJu359/+yJZpPXQ1zYY0JsDfF
         R6V7yaOSPsZDOuF/cOo2CTp58VmgW6oFmL4d8wAB8F/Z2rU2cNXO0vh5M+feuB9BdzJ/
         NfXIBfg8xVHBJz+C1OsfKGMsSAgIVscoZy4Qp3oz6RyYsoEp/gBpH7Pl/nDjwGILwpDt
         gLO8s1/wzh3pZBSo8SyhkCRtQQSWf268/HMbht5R7Uq8hD+VL+2BfaOLN3B18ALiGqMu
         gOw5eXJcAN9qlEQUlS1R7zYNVHEa2zI+mAt4OUTNi6VatDW1Y0EWlRoz1QzPH1HdCtf7
         /lzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489822; x=1781094622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty/mxLD4L9LpaeVN+O8zS/3tkJV3r5YXuKG/N6BCA60=;
        b=abbXQTtkppyBJPmzJvJOhJHEbpz6nQsJIxCUf1H28sIr7+ZQzapTKDjAJQp0Nh+oqk
         HgPXGj56D3J/HKep3QEPbyz8HKBBE32vT0XPqYjTVSTMbWhHrMb/tac/ZF0YwHdMDGLF
         M6F5LPzpOsKFhgCRoc8ykRLH8VEPZ4TiH7kfP8ucaJEqSV1Em4g2Ub1oapkPukDImxzy
         qWXhySERT/4mHk+ap0/NwpgvIercstl1E/lh6ojbinxGb86eBLyRdSbZ8BSyMMN6pBT+
         Ci0rodFriXDOaoqabV02qWlC2D3jJDPqOuwRj2MhP3KiKaQAQD+SA4xyMB63TMwLd7Gm
         n8LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pRiLjuqNaC4kfNVvjzjN/rj4XNIktZNCKITHmdNiHDqJeJfVbiIgGZK8aofk/vnFLMxNswundvG39@vger.kernel.org
X-Gm-Message-State: AOJu0YxmEmwzSWR/dZX9+b7wjtFjeiLgofuaou7VpG7hdwFj4GMKcJFg
	ID3q8tdxB5RXMzjqiaEJ1ykBdlo9vEMYOF9BxZ1GFfUjm+2/qp+g8Km4yPB3jHWCH1M=
X-Gm-Gg: Acq92OGsgV4s6SbMtBSyTqUMWavTDs7RnTBrRiW9UQi7ot/e8jxJvs4y6pBxuRdhH5c
	xmsatoLFVcmkUJ0GOpbm0rUJztcYYfzdAQ6U5tAsTm2RIokmVzLTzU+HicFK1TjDcLnqvg2UCf3
	43SZ3B2MJ6tXS/7dkkTHlN3qi0eTIErfq6zumYSQMJtXq2xa7mrTWwm4eXg3NidpMdWoIFA/K7X
	Sshcs9n4RE6Tb47mizGGyC9Jc6HggNJmCa6cqEz/X57OWxf2NK3Xeph5S2mvM6s2MtRsy0ZSjMP
	UZ+hZnw2xDS0nAtm9TZu3DaQM4/5UWxm28VNWq6EPZA2j/1wHg0yL89fODiQop1LSXewysmZveH
	FG74XAruJeYtyp1n5tCR+4l8NcoJAmdzRCEl0Kvv4hjNw8yJvbNfFvQLad28rWMUXCQ3zHjWPu6
	QMvKvohx1TJJt14GoAWJkVM1Ldbzhwh/FTKTjQd/wexg==
X-Received: by 2002:a05:6000:46da:b0:45e:f381:cd7b with SMTP id ffacd0b85a97d-46021782644mr3373955f8f.8.1780489822108;
        Wed, 03 Jun 2026 05:30:22 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc294sm11268422f8f.7.2026.06.03.05.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:30:21 -0700 (PDT)
Message-ID: <6fb8c47b-696c-4dfd-b571-abb613bea493@linaro.org>
Date: Wed, 3 Jun 2026 15:30:18 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] thermal: samsung: Add Exynos ACPM TMU driver GS101
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
 <20260602-acpm-tmu-v7-2-8047dd54b0e9@linaro.org>
 <DIYTOGU8I2DV.1GKZ59F7AJWTE@linaro.org>
 <c76c8f9b-bdd1-4006-aa28-735254f0409a@linaro.org>
 <DIZCLBAOV4ZM.9SJGGMZONFB7@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIZCLBAOV4ZM.9SJGGMZONFB7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/26 1:38 PM, Alexey Klimov wrote:
> On Wed Jun 3, 2026 at 10:26 AM BST, Tudor Ambarus wrote:
>>
>>
>> On 6/2/26 10:49 PM, Alexey Klimov wrote:
>>> On Tue Jun 2, 2026 at 6:00 PM BST, Tudor Ambarus wrote:
>>>> Add driver for the Thermal Management Unit (TMU) managed via the Alive
>>>> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
>>>> Google GS101 (and Exynos850, autov920, etc.).

I'll drop the `(and Exynos850, autov920, etc.)` too.

>>>> The TMU on utilizes a hybrid management model shared between the
> 
> You might also want to correct this "The TMU on utilizes..". On
> gs101-based I guess?
> 

Okay. I'll submit v8 shortly where I address the rewording, the Kconfig
dependency on ACPM  and the other sashiko reports. Maybe this still has
a chance to get in (we're at -rc6).

Cheers,
ta
