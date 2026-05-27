Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAA738A71E
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913854; cv=none; b=DlZwcyVfHef6TPsCUV+68dGsJkWDr+BCYYzfEE2mVxU6+ddYJsT21bGLdN/OcWA9EfSL/PotnVReVN7D0MswxrOZgH2SGFL07pq3hb5/SCxrNddWjer1SMAj6Dae/dlID+7eHe0CwY6ZRM2HlPGxMM5vkkIzy0RjiyU0SY6QfAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913854; c=relaxed/simple;
	bh=eSe2XyInBmI4O1S8fwP9rw23eOLnqGfEA/kmRMLHjXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jpmybkC2zB7G7wcEAw4geL6MyKfeIycL4D+nQ61zJLHYrCmv9NIwib5sX9+WR/UF0hFqyIK5QtElLJXunj4zvN0d3t0r2BeInl0bhpV27YYpgtUUDqYqtH1DITgNY5/WXxEY9ZBFlcGvkRT2Po/lDbgfEyG5s+7F7MUOXj4jWVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAV7dp1T; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAV7dp1T"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3699cdeec05so5349864a91.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779913853; x=1780518653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2OhCxIlJi2QiiC8j/rvp1ZcuO4vzfhN+zs+219JbuA=;
        b=EAV7dp1TvfLSpU01DRMn5RLVYXd/qL32AbDbK7yYtfSum+2xYbVeeWUIA6BabcwDa6
         UCPD5JIOhCqe2UD+3Fa+Gr2O9dI+XQ+0vCl4GdD2Q1FEeZhS2ayGQTFHuSTorcknWbkW
         bIrsY57l8qscIRhT3gIzXX9gyESHj1L4HZwmNDLlGkXEXt28t9mrHB8jvvG0ezHnj1EK
         BNZVDru5Z0xu33GC11Z5Xd+6ppybiinbN7AuRJ/2CO+GjzxTIj6fh+TQtamTL1pyOjGN
         rA84EuIFiaSiF9C57cOEbv/CFD3qKPJbNXfqg+WCzcvfF/A1kpJ2n06cDa3LYGG9Q0tL
         p0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913853; x=1780518653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2OhCxIlJi2QiiC8j/rvp1ZcuO4vzfhN+zs+219JbuA=;
        b=SydSl57hhp18AFmgUQTtCRWlsQ1sC/4S05UamkZwiY2PLwNjesECd3/Ahmt2wCINwr
         8ppDWT8ZC5EbtDJefCgck4C7a17WqvLAGtCj98jRLDB9bnWfkLO+1lYrpEY9qDhPwLs9
         iSWl3j5GHAVu/tr3U1IcwqP0i9TjXh/EvnpaSOwVER04nhf7xqR+FF8fNsw9E56c2q32
         B0p4YCdPc+fK8HVi8cyU8Tx8IyUK0UbVhiU2f8Q+kLxk2PAqOp/Vgb6VUFTLdq/yNkgb
         YwCmVJ4CHprcNCFY/6sZKJmGI3IgKhzE67SHt+E/FRqykQSDUXERldw/jlMGII96ngV0
         OPuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Q6YLGplJNCxdrxdCrXUn5sKDv3Z0eTXOZKU68jniYKKJTfpPe8peSzPISTQ2zNNkYA4m3/HZwTZw5@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmZJNyAcx/KzWSAbJY1vb3RS1GOuTW40coY9r3OIK8mpC0i79
	WaBk9SrLqUm0HFAvaC+fyH6b69EMP44lHDXlAWQQiAMW1rtQZOl4KCzV
X-Gm-Gg: Acq92OEFODtmoN4RMGVTbATurkl8ybuexmvfK97Fuk6peFsYnHllqeLG8Jh2XgFx/Dn
	GmRyn0HUxOB3922jCTJIboyFC/FFl1s8KlPyAOLf6ltd2255ihDdsyeZ7YVCrMd0mLHYpOMfA8Z
	OqMVUvJcATniJi3nanP7wubOeqgkJQrSmCe4nszdiNEcZek/NAS6AMU3yTlrxsl+O2DdK9KYy0J
	7u++aGkmXpzunw44StWxFH/MVx8Ve/qX+33Julrl1kHPT5YzqgzPtC/qvp0Rkk3MqwMg+32OqeW
	xiIjQJirzakQJIz9egBlhAvNrXOQ6s228J5pF8o62qB48vIBnHCHfsl0aI/6xEm25l0TWh1cXA0
	4M56hb/CoHjE3hiQtk9xv1nGjdBlT4k2baIcabWcU5hOJqtwZ2ehkv1IUvv2cJUAKrJLO5K3Jwu
	vXskTn14SD7Cy8BawNGpfQvyBPn/pEaDF8BY/woqdo2gyWh7I=
X-Received: by 2002:a17:90b:134f:b0:366:3ac:f725 with SMTP id 98e67ed59e1d1-36a6788d912mr24792193a91.25.1779913852550;
        Wed, 27 May 2026 13:30:52 -0700 (PDT)
Received: from [172.18.227.108] ([219.88.198.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm16549405a91.16.2026.05.27.13.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 13:30:52 -0700 (PDT)
Message-ID: <4b911ed0-64b1-48aa-a00f-e2ade66afa1c@gmail.com>
Date: Thu, 28 May 2026 08:30:42 +1200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] soc: qcom: rpmh-rsc: Skip TCS init when RSC is
 managed by firmware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-2-graham.oconnor@gmail.com>
 <934e6039-4639-49bd-8cf9-a1674f86b8c8@oss.qualcomm.com>
Content-Language: en-GB, en-US
From: Gekko <graham.oconnor@gmail.com>
In-Reply-To: <934e6039-4639-49bd-8cf9-a1674f86b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad,

This one is confusing.

I started the bring-up on this board on gentoo-sources 6.18.18 but the 
board would not boot. After an almost subliminal flash of tux the board 
would lock every time.I found the solution from PostmarketOS who 
obviously faced the same issue which formed the genesis of this patch. 
With this patch applied the board booted fine so I've applied it ever since.

However, as a result of your response here I tried booting my current 
kernel (gentoo-sources 7.0.10) without the patch and to my surprise it 
booted just fine. This leaves a few options, including:
1) the kernel source has changed
2) this is a firmware issue and a firmware update fixed it
3) It's a timing issue.

To eliminate 2 I would have to test 6.18.18 with the current firmware, 
then regress the firmware and test again. The do the same with 7.0.10. I 
can't honestly recall whether the firmware upgrade was before or after 
this issue first appeared.

If it's a timing issue it's a bit more concerning. If the kernel is 
taking slightly longer to initialise before calling 
rpmh_probe_tcs_config() then it may just be missing the solver 
activation, everything appears to work and nobody is any the wiser. If 
the existing solver code doesn't deal with early firmware TCS 
initialisation then it could, under some circumstances, lead to the 
security reset that I was seeing. This patch specifically tests for that 
case.

Based on the AI review feedback I've also modified the patch to not 
simply return early but to just skip the sensitive parts of the code to 
allow any other setup to complete normally.

My current objective evidence is that the board boots without this patch 
and it's quite possible this patch is unnecessary if the above is incorrect.

Graham


On 26/05/2026 00:40, Konrad Dybcio wrote:
> On 5/22/26 8:06 AM, Graham O'Connor wrote:
>> On QCS6490-based platforms booting via UEFI, the RSC hardware solver
>> is already active when the kernel takes over from the firmware. Calling
>> rpmh_probe_tcs_config() in this state reinitializes the controller
>> while the firmware is actively managing it, causing a security
>> violation and system reset.
> 
> I don't think this has been an issue so far on other platforms..
> 
> Do you have some more details?
> 
> Konrad

