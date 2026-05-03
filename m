Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C95823D7DF
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 02:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777773999; cv=none; b=L3p/N8/ib4qnzxByrQejFFJ3Pr/JvVKuVg12M8IUA8a1SeLMWCoy/RJiZunPzwLxztRwlci9AtBtac0tf4JHr9CFYglYQTHRhUAz/jPb5L/XyhpvToGVITqXZrse7khfnTMO3E3XdKB3FL8yZSLWOjlLNgqPhlPvMv9cdZG1utM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777773999; c=relaxed/simple;
	bh=qSG0sZNcjOSchIbQqXWGt3+PH22qMGXJjEvLkAzwfr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojpU99stiw5Icjd4FKQ8BCNZt/gEFvgL1H7OctKr3F6JlTQuOVK2JtVCeRx1zlZmmzKO2wfUgbXsbP7BMJxUMHp9pbpj6jLC0VPhFQy5vvJ7g4n7oZ0qZRTE1HftGQwXtXb2Z0ss4mCCXtFbmtX4DiUGubf18ETqiJzwC2QmwqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=btbRK1G5; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="btbRK1G5"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8acb856a674so41141586d6.0
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 19:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777773997; x=1778378797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnVCaxNshzzHjwMMq5W7gN5QUApxgL+R58MdQlfO6d0=;
        b=btbRK1G5RFZ+SyUUfNLzRaZPSzJ9/mretRVTMuZqtyEjAHFRiP+elmVpqzKdwFaqZS
         K1JQ7VMuUx2eE/ACxjiOd+YQB4fYAaK9PnDYGMlwiGUrDK6iKy16aM7glSDXlcsYCWOZ
         pdbtAygj+OTRinuD4hOOpFFclJKItdPC3RSTp00eokz7QCw22sM+tDNGcxoBaZLAOhtK
         eqj3Xts+60lWyE4slvV5QZpOBupe5XgNG+mc8HgCjbk6Yr2dQSKb2kIxW1cJXnOmA5Ju
         KhhQFLAWheKe2R6mmsZjG0MV4EgsW40uo6+MK7clHHb50WVAqb6OEut8vo3Se8+IXAUi
         540w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777773997; x=1778378797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnVCaxNshzzHjwMMq5W7gN5QUApxgL+R58MdQlfO6d0=;
        b=YGSLkbnilDd2t4IsIIHGlh58sQrqpgkoukDBm6d3Ng7/cnnMX/7bgebNDJmU3W2B0+
         3ZRTwsuFe7AGe0q2hjr5mE8pP44+lf8896nUlprWMmYUmrdJkH60D4Rc9svk/r658OIe
         CIH52lss2t4+FdBQnehVB0GcFUiTrmkIw1GppoYg5moafG+j238KHPBisjIe7GLgFnEA
         eBfz3NvEYd7/DM1u5JH5zoUbmDV+hCNAmazfdWMdck01HSH8rESKICK+K4wLG6gclVaQ
         4Rt12lKWmBMq1LfwfxHBci3E9PBd3OlQsnvjy9GZul/l9jkwRcsbOJP5Q4S8vclu4D5y
         nkNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wUR39f98jnBHJ3wE3p72NFFL7QLmggzDPCiPTpWywMWwGd5tkHZReMcyEopPvk/TfDZpHFe5K+ldE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/i8Nw5xvukQ11PXVskrFyk8Ul3VAMIGgSToWaM/5FdIqb6sgd
	Q/T16gJiXKB5qUxgafi9GMhMumkPPg5UZ/lImXodbFkzpFwqQKedUaKVuFJoTsMw2Xo=
X-Gm-Gg: AeBDiesWjwECVtkHa4X6kOH3zVeZsf7ocHt/smBvK4IUE5Gt0udQ+jhwfVT6lYPdTTL
	2Jh1Jeau/ESS3mSf7IbkeTuioPnNUEXge1jYIuqaxe3i1VzhmKVV6rLlRTswm054yyD73ylFVXQ
	+Ji18Jg5US0evsNYJJAi4sl68qkgEzxIstL+8Odtb43eOPW/x6mIj4vLoYcmMPSVrcYmc6/O07t
	JV7Wxg22xM9pcYX7/XeVnlwMfsGtONJd0sknL7R2NNFeQ/1oTKkQxqEBKrLaUpE3k3yRvmou/fY
	fThdwzYtO62NEsgmzGhdMeZlETZoYMQBBT/S7amQ8ISaACh1+ohtl4cicKqlK4SbaN6t+cNpMfu
	zzYBV51sB5LqXlNsns8M4QGHz5+3VQFbBXWwFUkpCNMhVttZP1WRQGou97DiQ+e2BF0QrlzsFoa
	h5kqi6LLVxLzqVD7C7hePKSMSDEncWpQI1MLmC0mlm1r9Wp1/7Us6cA+Fff4CKkbR0soVDZnnUd
	g==
X-Received: by 2002:a05:6214:610d:b0:89c:8a3c:e34f with SMTP id 6a1803df08f44-8b667b79753mr56665696d6.12.1777773997147;
        Sat, 02 May 2026 19:06:37 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d831ac7sm72634806d6.49.2026.05.02.19.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 19:06:36 -0700 (PDT)
Message-ID: <649428a4-9505-4a1a-bbbe-bd90be9b8155@riscstar.com>
Date: Sat, 2 May 2026 21:06:33 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 11/12] misc: tc956x_pci: add TC956x/QPS615
 support
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-12-elder@riscstar.com>
 <20260502094559.15c3f479@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502094559.15c3f479@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 11:45 AM, Jakub Kicinski wrote:
> On Fri,  1 May 2026 10:54:19 -0500 Alex Elder wrote:
>> The Toshiba TC956x is an Ethernet AVB/TSN bridge,  and is
>> essentially a small and highly-specialized SoC.  It implements
>> a number of internal functions, including a GPIO controller,
>> control registers managing internal reset and clock control
>> signals, a PCIe switch and internal endpoint, and mapping
>> hardware that translates between PCIe and internal addressing.
> 
> drivers/misc/tc956x_pci.c:541:17: error: call to undeclared function 'u32_get_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    541 |         chip->rev_id = u32_get_bits(val, NCID_REV_ID_MASK);
>        |                        ^

Yeah I think I noticed an error like that shows up with 32-bit builds?
In any case we didn't see it during development, and we'll make sure
<linux/bitfield.h> gets included.

Thanks.

					-Alex
