Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850005;
	b=NIjGUZ2ko50yIsDtDY/zzlUuTe/M7pUZWhHh4rvt1iaeX2hHC21Gbs8K4IJ2LpMghA2K
	 zoe+ADWF82AOO9m8Ecr3K6x1nPBHtuFsRM5BXEwpEKplIBlSBOkneJVY2GoiLqDnwWBLA
	 KYkymgFu6CK6JuKqJ+d8+SnR4oCTJFxx3tZpL3dxGXBKIFB7bSaECT8htX1/fWGSxFW1y
	 +EAlPMGH57IkZdhBTFB0FdSvxgIZ/BGFBUh9Eq40QA0zZKyG2N74QUfogVaNXAYbK1bLl
	 aCt28clBF+PD0KBsoLERuRIeu4edb75QMAQVC1UhC7hYwNriLfCkdKRfi6bndQDoMvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5LUE2uGbYietmUvUa8zlMC5H0i4xuvRsDA3cqPloBd4=;
	b=rJ5TYE7/pLBe48/w2H1Fr8vx5Wwrgnp6cL6eDIHPATkEmYbV7XwtgC4ayRSuFKuBlVDt
	 2FMyHJwlnfANVgyLhM/z5snwvYy1o77K6KwJB5F0HCKz4AkJCuQ3uoSWVy2y3ccr5c1tm
	 LZJWfUUFLa28YYillV0k3NYJzlBVj1h+vmUkddvxNmD/DpapbFCdO0p3LfdADXCJT23qC
	 aVn0+VgRbtH35D/PLFBe3VDBmvAW2UPsJoGOaHTJEH2S5fzQQj8tTNFo2PVoRogPznl0i
	 5z0+b3o0AWvigl5XBpdpmMRY1ih1yEY5Tqa+piJjN6U2RrXg/h8Oc3Sm4Pr9qqNvEgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfy9GBV6;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37478606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 03:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37478606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfy9GBV6
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso976588a91.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 19:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793850004; x=1794454804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LUE2uGbYietmUvUa8zlMC5H0i4xuvRsDA3cqPloBd4=;
        b=nfy9GBV63yiJ2Z+IKluc2xaqj299WNN6uE3JJsLL6mh6GKCY2XjSBdABb6pMaeH8yP
         NSUmoUKJaRlNc6OVrXXXD4EDOemIj7/cvRFjBIwYFr4FtxlJc5+Lt1+SoY24XuTooEsK
         CRE+K7TYq1aljhw8+BtXhGFL+mjGQniEFuEL+3TbyEKTFFgrkpIrsJ7S31yMAarSCF8P
         lEF3LCW3rhjMkRB6AYUC4J7xYDNOIG4wL3NHu0+6sloFEdFu2eTqqBVNRedFvyz55CZw
         sErBKEplmFpy4fh5MyD53AuwdulAgML5Xlva/SiaY9eXzZtDi4Pjvr/rGaV1PBSqtbnL
         aZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850004; x=1794454804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LUE2uGbYietmUvUa8zlMC5H0i4xuvRsDA3cqPloBd4=;
        b=h8aWA+7lBjIsGMu5pG7qwX7enWYQHAPPKOYHCZAIV+oMPvZPpEoMR5Yd8GkArnpOYG
         Dw5s0f5Y8h31GKjaIVN3OP4iO547JDevMMDy7Ri+ufC7Y1VBwGdckJE3F7hG/BxwdRiu
         SnVBJ3Bclyc0BoBaAMdBLBvkIABTaFZBU4TBUWR2gbt66t6RJiKo6jpNmDhiHac/yBxR
         r5P2MNohPu3pylTvCOhfCzoHczXvFH01cjyI4LqEaHwhJUtvZWzGe8AWoLq+/7rBhO5e
         8R1wRodY+6zb/D3P7gGMitb0pa7EJpg2nypG3RQYDcOGaFUCrfQBVBmnTY5BIEdUjlqW
         kxkw==
X-Forwarded-Encrypted: i=1; AKwUvBwcdnX6zZ6g1JXSyxNKOdsGmuVosnSuzF8aSojXdSFEWGgGIQIFTZ5yXbOUZHbwU6eiNwSxpNl9dSQj@vger.kernel.org
X-Gm-Message-State: APuU4Z/UrD/KbEdwJ9FWmASZovWrwCHtCNFezdGQ3mmYpoG7Jdv1yS2N
	wBRxNcteKInx7XEUDxlmMB/2OvQRsxt+iOFmGvLCZKQTuVp2JfHCco2p
X-Gm-Gg: AYBFou3kPukoqHbkluJSz4RJLvZFmnPW4k6tyo3V6JH+plvFk/2ETt70zdnMPrvimRJ
	8hEY52cX4doOuz/s4bBKmBVi1rHkZxnwip361yH6CbENROMjqyG4xkVrNQHvWaxm4i4FjArlIit
	+4w7ZnImI2kTE/ea9rzpaJnceRLfTVonH11mLDEI1kgBTAqMmiXkUvZ9YXCmaqpudLKytOoD0A5
	2aHWVsDks04dgV2LpOvzrtbW6zrcgePwwbhKbgZ5tAq1mNTYPixLVrN42sfI3QMkealrgFLRTej
	krMbo9j8aPcTKJ21Dgvfh0Niezzj5gRZEXPiqn0XsBq35IKA7mwL4hlwyEbxMMlFbuk8M9zgKHG
	nI6fAFlheERY2TdOZI8sFLaFJL+VFsFINBlMRGernjP3p1iXAecSWCzCO2fpzGfXiiA/QS0XfTG
	6VWl4WZtPZN1Hh15ebCAJzWR1gB+DfVun8KZ1i0Io1L82Uhi3fyGw0KjLcrig1xdJnnPE8qiC38
	mtdlTK/Uyolvzn7kIL2ivkHZsT6GuUue455pIKnahT3QCIhDyK3r+A0i2AePAzHklR1X1busz1n
	aOTU/C76qg/EAQwz9VSNACqYf0ivkWIgM2zx7VazHQMfMbMeMxMIPp3u9INevqg6V5KO/pdDGq0
	uPq0=
X-Received: by 2002:a17:90b:1a88:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae89746c9cmr16276951a91.31.1793850004529;
        Wed, 04 Nov 2026 19:40:04 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3265a52sm1382575a91.10.2026.11.04.19.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 19:40:03 -0800 (PST)
Message-ID: <fcbd337e-71e4-4b34-b1db-800390a61ffb@gmail.com>
Date: Thu, 5 Nov 2026 11:39:51 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
 <sashiko-outbox-194466@kernel.org> <auuHy9_GAzYZL9V5@SMW015318>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <auuHy9_GAzYZL9V5@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frank,

Thanks for the feedback. I will address these issues in the next revision.

Best regards,
Shan-Chun

On 11/5/2026 3:30 AM, Frank Li wrote:
> On Tue, Nov 03, 2026 at 02:43:08AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
>> - [Critical] dmaengine: ma35d1: premature register setup in ma35d1_desc_alloc() and prep
>> - [Critical] dmaengine: ma35d1: active DMA after timeout and double completion in IRQ
>> - [High] dmaengine: ma35d1: missing PDMA_TBINTDIS in ma35d1_prep_dma_memcpy()
>> - [High] dmaengine: ma35d1: unvalidated SG segment lengths in ma35d1_prep_slave_sg()
>> - [High] dmaengine: ma35d1: broken residue and status reporting in ma35d1_tx_status()
>> - [High] dmaengine: ma35d1: unlocked PDMA_TOUTEN RMW in ma35d1_pdma_interrupt()
>> - [High] dmaengine: ma35d1: state bugs in ma35d1_of_xlate() and free_chan_resources()
>> - [High] dmaengine: ma35d1-pdma: fix signed dma-channels pointer and zero bounds check
>> - [High] dmaengine: ma35d1-pdma: unsafe teardown order in ma35d1_pdma_remove()
>> - [Medium] dmaengine: ma35d1-pdma: disable channel timeout in ma35d1_terminate_all()
>> - [Medium] dmaengine: ma35d1-pdma: unreleased ch->desc and stale ch->cfg in ma35d1_free_chan_resources()
>> --
> 
> Please fix these issues.
> 
> Frank

