Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1DA2EA47C
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779914621; cv=none; b=fyQO8LOQ5CO9mcbXizzyBFeGbEpOlL/VNxsdYTah0FwPxI+z+JHeX8MARHBgFWHhbGA/opKSAOuieoF/NW7kHIlAQoJTyLxkyhFZc81dUuUgSzchSK+nWhI1MKZxy145H+FFaS30C2h8AdturmL5wz4UgmjAYuHEYNrfFQGCDG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779914621; c=relaxed/simple;
	bh=AkzX2MlqKTaRtxCpwMIv0eAGJ5QPIVZAFJN0tzOXrjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WByq9IDiDd+VsHe3kDxswMsWrMk7LpIaMiDPq8rMwZAxKPbOzrm1apAZwT/kFnwdN89ynjw99nc7YbFWFPJAILDw8yvlGzkFfrkyt0zIUj8Uk/iTVeaySHHDXA94L6me6amQFOtelVTQyEfTG8eekk2ne6Wp1awKfNSacO3tE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F86nRPIO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F86nRPIO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so126275445ad.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779914620; x=1780519420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXTPczjLvJobFRbkK7xxt7iJVHks66505vqIfh89VkA=;
        b=F86nRPIOL+UmKq/0fSBPrIWnBhdDDjUeLuo6B9etacPsr7AUj4XuEJZyidJxi3Rsa+
         p9KStBE+v9G3pxocxGsq5mjnUPAJSCMUMSNBE8zfVZYmT5Pvxo0jQ52feZAiuZd/iOQW
         DKPTwcrU3+/n/KP33L13QY9SBagjiOfK2IyWTcZtE0kLsAoOM/+6OInNcW8FESYtuuup
         YDE2nohfslPNpI4dKTG01OFCQxCWGDd3XWcs1DOOnTbtr6jmcXbRpNbputF8dlWysNAw
         +CnZdn//WCEJFHoo3lX1cElT/bkVuKPB8RrQl7JzbknOyPALTrlsBrunyQf0wfzM5P6I
         azCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779914620; x=1780519420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXTPczjLvJobFRbkK7xxt7iJVHks66505vqIfh89VkA=;
        b=ZLfDnzXVXXZwUWCJ4r+t+PPYLVe7cF31JOWBka3qZ0TK/T1Fwl6ky7y5SEnJxyWGl5
         fN1W5NWQWtuoYatEzThCUsJ1BMD9ts3XF5yQRAQCDo6bBGJh8/owE1yHHiVtUuR5Uytb
         /7Yw65BwsVHbPTbttNNp+mqkwjcR74BvBicZ4tJiK9TUoB8f6+jUPq6J7k3mpMuvbGil
         ZXo4KXLAw+Ui80HYOQ1NY37LFFsKHNLJu5bGJlvErXOQ/8R6EtocZofbmXEZd5R7o6zT
         iV53I5TsVXAyfa764vcMmomtotvWRYP2BM8cHy5VCQL+02YU/o9Ddx2YKjmcxzt2VNJQ
         St2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+aOTSpYaYOR+J0IXe5U/bpkn0XTjTEZrJANr83GKcLDD6bZKaubXsPHuosPrwlGpZ8Aj86PknWahhQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3rV0cqPIp3jl90TUQqzfLNcYYozHzpAkxNaPMf/KmqhWbe5nb
	CrDkAVWnw/646nJYFTjqO88eb009Rui2HbkLIZRpvJx/4SAfVXzfosPOxDgeBuLs
X-Gm-Gg: Acq92OHqstoC5XZJw0VDuvIUgLAYRZgXcwfduDeCqBw0dQlss7KIIreTf2Zq7o3VBLx
	YDGXtVDHD5tAmGeJQn2dQA+zXUEKlmgS1UwbWuEDn1UOKdprWzEPnkfv3Hy3VuTHFfduKMjKovq
	2WiQ/11b2SelWximrzvFPcLv+KQqa8twZAh/4sNhtIZDLAbuiQbtWo0kjg3tZfuhmmFMWXQmqpg
	MYJ84NduMmekMc38xcSkiuZpIO1/NadVF0XXDSL/Hyu0qoTuWGFmkGpsG5Zy4NBQi2+LpXf0Da0
	IUxoTZqQHeDnJRgbXxFPDEX0MZ5rPSpP+WF/bx1tdShFbWygs6hW+jd3/bcIqHvHH6GWECMGkYo
	GweiP9BMwWdNxsYI2JG7HtKiMYHWpU/U/x/q6DOycY0rEOfJyfMuHR46dtZDx945o+fnWOQPSuE
	MIF/+l4QB6rR8hsgwKR1i/Lhgdcsw17zC7v410pGHc4PRF5yw=
X-Received: by 2002:a17:903:f86:b0:2bd:2de3:5198 with SMTP id d9443c01a7336-2beb033f48cmr279229085ad.3.1779914619757;
        Wed, 27 May 2026 13:43:39 -0700 (PDT)
Received: from [172.18.227.108] ([219.88.198.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ccbsm165239385ad.48.2026.05.27.13.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 13:43:39 -0700 (PDT)
Message-ID: <30edf212-f656-4c09-a066-d765debf3fcb@gmail.com>
Date: Thu, 28 May 2026 08:43:31 +1200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: qcom: Enable additional hardware on Radxa
 Dragon Q6A
To: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, neil.armstrong@linaro.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522101323.31911-1-graham.oconnor@gmail.com>
 <15015D7EB84640D6+cc21a9f7-ae1b-4a22-bb38-34d6fafe1bcb@radxa.com>
Content-Language: en-GB, en-US
From: Gekko <graham.oconnor@gmail.com>
In-Reply-To: <15015D7EB84640D6+cc21a9f7-ae1b-4a22-bb38-34d6fafe1bcb@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Xilin,

Thank you for the response.

I appreciate the offer to take over your patch set to move things 
forward. However, I feel I must respectfully decline. This is mainly due 
to my lack of experience with both upstream kernel development on this 
hardware and the patch management process itself. It would be 
irresponsible of me to take on something that I'm not knowledgeable 
enough to ensure successful completion.

I'm happy to work with you to help in any other way that I can such as 
testing patches, but I think you should maintain ownership of the 
patch-set and submission process, at least for now.

One of the reasons I withdrew my own patch-set is that from what I can 
see your series covers everything I was trying to achieve, and does it 
correctly :-)

The only one that isn't covered is the patch for early TCS 
initialisation that I'm discussing with Konrad which may be unnecessary 
anyway.

Graham

On 24/05/2026 13:58, Xilin Wu wrote:
> On 5/22/2026 6:13 PM, Graham O'Connor wrote:
>> Thank you to Konrad, Neil, and others for the very prompt and helpful 
>> reviews.
>>
>> Based on the feedback received, I think it best to withdraw this 
>> series to
>> address the issues raised, most notobly:
>>
>> 1. The DP_TRAIN_LEVEL_MAX change (patch 3) is too broad - it affects all
>>     devices using the Qualcomm MSM DP driver rather than being 
>> specific to
>>     the RA620 bridge. A proper fix should be implemented at the bridge
>>     level. This is going to take more investigation.
>>
>> 2. The display DT nodes (patch 5) should use the radxa,ra620 compatible
>>     string per the existing Radxa upstream series from Xilin Wu, and the
>>     lane ordering needs correcting.
>>
>> 3. The rpmh-rsc early return (patch 1) needs further review regarding
>>     the implications of returning before full driver initialization.
>>
>> 4. DTS patch label dependency issue (sorry)
>>
>> I'll integrate with the Radxa upstream effort, re-evaluate the other 
>> areas
>> and resubmit corrected patches addressing these concerns at a later date.
>>
>> Thanks for the feedback.
>>
>> Cheers
>>
>> Graham
> 
> Hi Graham,
> 
> Thanks for working on the additional hardware bring-up for Q6A upstream 
> support. I'm really glad to see someone pushing this forward.
> 
> I actually posted a patch series [1] last month, and it is generally in 
> good shape. Unfortunately, I got busy with other work and haven't had a 
> chance to send v2 yet.
> 
> If it helps, please feel free to take over that series and fold your 
> additional patches into it. I think that would be a good way to move 
> things forward.
> 
> Also, I believe patches 10-12 in my series are no longer needed and can 
> be dropped.
> 
> Thank you again for the work you have done.
> 
> [1] https://patchwork.kernel.org/project/linux-arm-msm/list/? 
> series=1078242&state=%2A&archive=both
> 

