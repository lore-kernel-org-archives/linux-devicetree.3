Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FF8357D1A
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012575; cv=none; b=HL8B0igY3ETqIrq00pcILvxsQULzLEYqYxUNDQa9EHjmDzwDX4Wei0ALr6ztE2RzmRz0EtZmTWvBb8i8R1kCS25VqgJdLdnTlN927zYpTJn9RRWVgpeYu2p8e/aD55VXrKMMiNkyx63uKZFT1TQrSKmcyYlu66ZqtzFBha2a3uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012575; c=relaxed/simple;
	bh=F5vNZAymUdgzsQpw5kF6/hbqKevS0z8VrSXy0ZQ5xxM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FO6/vSbDH0wGPhMvTfgeeuUvATMUYoJR9kLNLRmJThsRcJS5fCf3urC5+9r55+Kzh3MuIRrbEtXXmi8Rnl5MNi6H18x63mHFcGJPK2LqqW1XmqlMbqm8oyIz0YLTmF0XWYgBF+JTTagWACTGiQaB4nan4ke7DczAr+aOu6G9uVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIvOeCuE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIvOeCuE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d7e23defbso587098f8f.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779012572; x=1779617372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VNJLSUKdFxTUDMe2tzuMJwTcJLUa59qTrANJUI4DYPc=;
        b=cIvOeCuEeBtYpTQBF1+OJQxkUFRoKofOGUKfsHS7raDsdy55q1UpH1l133LHEgGse1
         0Zpnh3PUJWieuJtzbo14CrENn0+Ezg6zfGhRBbkXq9IK4OctuOAxhb7UcgHUgfho17fT
         bfrjmcZs5qashKAQb03PfL4/iwZTFV6Uu7ykwfQhu0rm+YwGEND+ikKVmV1rsyynxgMa
         ZDFiDO23uPN1W5/ddZJaLXLDuLp15b8qkOnLiizeOhTroqDg0O3EjYNj/5S7LaJDz8Vt
         rbxeMWiCocV3H9pqepjXnPAHjLmCcWG74liAx1yfhFHi1cN2O/apmnd6ahNN1lLKvtfa
         xqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779012572; x=1779617372;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNJLSUKdFxTUDMe2tzuMJwTcJLUa59qTrANJUI4DYPc=;
        b=lSrDmt91nJTX8GYph1R2KNLyyOoc8ePfoZEKEnMkf9rIvr/WG+7h1JxBbzq9D+XTUG
         ND3hwPIkLhgMuqMGNli6f/VD0wXf3jqUgAjnTj8EbPw4oMBPk7BpY6oYH2hRB4SV3iML
         8xkrBsI+nVA3BMtI2Ksamk90W2O2Aa58jDYvYp1Ao8Zr3dBr6/KliU5uZlZjTkEsTzQS
         IqaEc8swGH4C3IqQUbtYfQtBkumpSd6cYMFnJPU0mCR5MTq9R2d++suR1bMwTI03Nvkn
         pdkI/ycUC7cXh/PhrS+mOWKv0zrb3TYPn8hqoKkWO3wv6kshYB5WemgCizqHcyL+HHbZ
         Ockw==
X-Forwarded-Encrypted: i=1; AFNElJ8w3DUoU3Y+DhHeEkFnj4Zk09xZl0nk6FP8T0NlZnW/hEq0mUajaPHezcHrcXwc/Ua0w35GpQHH9bp9@vger.kernel.org
X-Gm-Message-State: AOJu0YyhAoz8uLpBFuUShYTXcMIIvFTGLH7o6ahIIVUX4RpueWWCHvNS
	lMUriYhVu/hvMziPwliid4VMGNqIjvkqqHRyX+6b8MpnvCnQgno4ZkY=
X-Gm-Gg: Acq92OEB1KpfY4X0j6yim35J6HL0Coz3BNuGzPp2MseSWY6Qe+3Ew9bzlKOx9L+LURB
	ATc18TCV0EfqfAuyLnu0NmCEdJ2CTUXBC0UziyrqCzp8/SGOE0EmsqGFCjEd7uYob0lvyub2qaL
	5lQdxjD5pfgszYjTc/JA663r5Ji5Qv9zFD5WSqCLCFLNeu2f2Fv3o+YmTMC7aI/cqcW9AES9MSA
	LUEprIuAtQzHtXRCQ2H8/OxSrFcRdGJUuk63R0IhnS2cdHtkiX+cN0pociKirBhZTgcnC5gCskY
	YP673tBlW3fZvcfpgKlcCgkZiu/aK2HzyrCjReU4ihzHPeCrN1ly0kMxCOC78Qtzx512eDao6Vy
	bbvF4NewJPW4/dQwYE4FgGROiHUXB1nYnKm/yEBqXYfx83F6Jpqvr4UjPpdJiXGWU7D08enSamr
	Wmk26Zi/elQCYviQai7ajR7iEhjshXGpiQdCGPd8S+a9XRrr8hZqqwRyAbdZjY2U6iQ9t+RJIe7
	UirulxaE5+CEV0hWGSLmCrd8lS9Cge/X1a1dPJon2O0TTyMzYJbyOadQjtc593hLkjwcqfypYxs
	2TYV
X-Received: by 2002:a05:6000:22c5:b0:43d:6f0f:32fe with SMTP id ffacd0b85a97d-45e5c6049acmr15219684f8f.31.1779012572096;
        Sun, 17 May 2026 03:09:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm30260076f8f.18.2026.05.17.03.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 03:09:31 -0700 (PDT)
Message-ID: <78d5673f-beb9-40ae-84f1-2cf5224394db@gmail.com>
Date: Sun, 17 May 2026 12:09:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt: arm64: qcom: sc8280xp-blackrock: amend usb0-sbu-mux
 enable gpio
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
 <25464c46-4576-4411-a7a0-4ad950605ad5@gmail.com>
Content-Language: en-US
In-Reply-To: <25464c46-4576-4411-a7a0-4ad950605ad5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/17/26 12:03, Jérôme de Bretagne wrote:
> On 6/9/25 22:53, Jens Glathe wrote:
>> The usb0 port didn't switch to dp altmode, investigation into DSDT
>> UCS0 device resulted into GPIO 100.
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Tested:by: Jérome de Bretagne <jerome.debretagne@gmail.com>

Sorry for the typo, I meant:

Tested-by: Jérome de Bretagne <jerome.debretagne@gmail.com>

> 
> The same issue was impacting the other sc8280xp-based model from
> Microsoft, which is sharing an almost identical board:
> 
> The top USB-C port (usb0) didn't switch to DP alt mode, as reusing the
> same GPIO 101 as on the SC8280XP CRD or Lenovo ThinkPad X13s was not
> working on the Surface Pro 9 5G (arcata) either.
> 
> Switching to GPIO 100 fixed the issue on arcata as well, to finally.
> enable external screen when using the left-side top USB-C port. I
> will send the fix for the Surface Pro 9 5G as part of a series
> fixing various issues and limitations in its initial device tree.
> 
> Thank you,
> Jérôme
> 

