Received: from mail-qv2-f9.google.com (mail-qv2-f9.google.com [74.125.230.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DE4D6C4E
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574974; cv=none; b=TtbfKrKtVfdFYuCe6uDb5Dn826WoV3QCmw5n2SdZYexvPKZ/sdsVxswCCg0X52J9ly68PN8xq7LmqpGKQMn2fax0geEbTDgOxODWr8hM3Jo0juiv+hRKRmxAS8FYMVt5tjuGt2ltO3+WlYo0NAIRHWFA7j3oUyJVc40Rl1h5XWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574974; c=relaxed/simple;
	bh=IOvCS9B6HTUPKUbqR2Bvag9xuozFR6okYx5eHaJqL6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhhvTLw6odp9AfQvvxF0OBelwrVv/ueEoO5mkVdQVV5xMfPYlqPDphuIE8igHKiVpPtoyQV7OAQAzgpzxQhZvBJneKRPreSAybtr2Y+bwVIDY2l55mwkEHKB5hZ7TVBGpPOZO3htytvvgaDBipQYiVuJY8SUnV26PMvV/MeZzXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ru8atLRO; arc=none smtp.client-ip=74.125.230.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru8atLRO"
Received: by mail-qv2-f9.google.com with SMTP id 6a1803df08f44-91059be805eso1383536d6.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791574965; x=1792179765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDkiqvSrkNQFvOOPqzjFj/I8n5Yim+RqXLVpjkE+gSI=;
        b=Ru8atLROOWKYAJzShui+h1wTpUndAv8g46zujdJj8m0vSdYflBhuwHPjpAIw2ZLAy+
         8sv0ztVf2Wwx9WaP1cFDNgFMSqTxP8MCCawjuLw/JR9D9sdINobqw2DhPv/0UBr4jCEP
         c9HKgfp+QIf+cfAZaIu8joEsaPXifEkOPpVNQh522nMggOA6Mvrt2thyeP+5ss1iaoB5
         AjCvawikU1ECWE/RNw++wEm7L1oQF9E37t2QdMnCGZUTF/VE1LMmX4mJQD1AX674gEaL
         2qXTOLvr8DpZnmWlj9esgqd409jm3CxPEWTabkK7GXwtdUBqM6n008uSkiwwer7ETDFM
         mTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791574965; x=1792179765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDkiqvSrkNQFvOOPqzjFj/I8n5Yim+RqXLVpjkE+gSI=;
        b=VNQsAacmy/jDQKHwrPXfjXOb+6hIKEjwlAwYO+UhQRhUnJUrDLb/1nOeeFoI7Gd2nR
         QzliUYvxPkiHQGI3Jval6YP/u8nZgtMXg8ALstUHPGatltimD/lQuTOpIWJJ13ygTG5i
         2ST+TVaKwsFU9EUjklOG6nMk5RTkT957gbLvD5M8Mlsf8octvXVQS7LIYMDoSU1Vm4w8
         /5YYv7zktG+2M3SvS82myCsZnwZMX6NTIcg+GgpgVgouyi2pGlytsEPxxs1qUOG3VF1z
         lY4jxNClJ+6fvslleV50SE8icgDsjXSqrgMm43Yvii1ujFdrvFVvjbS4Cmf8b+AYHEss
         HodA==
X-Forwarded-Encrypted: i=1; AKwUvBzgxDTDsfNm436+K8GinGnn76t65GLnP548702arZt2q91HbWNltkNe8G3HFsTjvbXAmNDf504vMbNQ@vger.kernel.org
X-Gm-Message-State: AFq9FYKmUOnDtGdpdW9h7HFlZAkZxWnZi8fhGEThika4WqAf69hnvSmi
	QAYRo7jWSbwGOodYGOSnD3VEZgvGVLAmyD720AAXcMzNSl+wYYF8879b
X-Gm-Gg: AYBFou1I97IGxzRErxVrYNNF828bl3tv9L/re8JXpEk8Vhq+laqc0IVuFwY1pC3VIrW
	qUCmoTGxQ6ebcaFxIkxiU6iLddcHPYgjCNHyiixKsmTigGen3/i6FjSg4TyVcTh8HFfzkbuS8ka
	ZJdscNu+/md9AiHHAZheUcJJnzn+y5fCl42ddAWdHufCj72DRPtnlhadsp2bORCY4rD5okodleM
	v0aPAziWbSCZ1++qC2KJ7UZFl8NtLiDrtv1Lr/Urmq1Tg/rvlLKa2ZmDNGSWVoXAb2pePHDT/7p
	XqzhPcDXxV5Z2AhyiZXq5KCnXaCpBgK6OW1PzFr9BPCnEA94nSbkuyVJeEwZBUgXnvM8lv1DBlz
	TL17ECdi5MeyB7OIOy7tsH8H5RUekZY8bJgVTIczW5C+ImOqtamoy8cv212CM7czma6u3uP9GcP
	2X3HW4ksgGZxVYX3oUYIx7fnDsfJqHOdshUX2PotgXy/ZrKDKMT4bCYCtneh3Bd+f1PptSYKUnw
	V7mtID0YHhZ5AqiuYl5AGsa75gmVGEJwbjbJ07/Jg7+kxi7Af692847j37rYpNx
X-Received: by 2002:a05:620a:6e86:10b0:93e:c12c:4412 with SMTP id af79cd13be357-93ec12c49fdmr261201685a.78.1791574965179;
        Fri, 09 Oct 2026 12:42:45 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0c4sm262383285a.18.2026.10.09.12.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 12:42:44 -0700 (PDT)
Message-ID: <d5dc6491-ace6-414e-8c1b-577f9b253bd2@gmail.com>
Date: Fri, 9 Oct 2026 14:42:43 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] cpufreq: mediatek: Enter system sleep at the suspend
 OPP
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
 <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-1-9100f79b4080@gmail.com>
 <sashiko-outbox-165965@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-165965@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 1:43 PM, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Is it safe to call dev_pm_opp_get_suspend_opp_freq() here?
>
> In drivers/opp/core.c, dev_pm_opp_get_suspend_opp_freq() locklessly
> dereferences opp_table->suspend_opp:
>
> 	if (opp_table->suspend_opp && opp_table->suspend_opp->available)
> 		freq = dev_pm_opp_get_freq(opp_table->suspend_opp);
>
> However, in drivers/opp/of.c, _opp_add_static_v2() modifies
> opp_table->suspend_opp dynamically without holding opp_table->lock, creating a
> data race:
>
> 				opp_table->suspend_opp->suspend = false;
> 				new_opp->suspend = true;
> 				opp_table->suspend_opp = new_opp;
>
> Furthermore, when an OPP is removed, _opp_kref_release() in drivers/opp/core.c
> frees the dev_pm_opp object without checking or clearing
> opp_table->suspend_opp:
>
> 	_of_clear_opp(opp_table, opp);
> 	opp_debug_remove_one(opp);
> 	kfree(opp);
>
> This leaves a permanent dangling pointer if opp_table->suspend_opp pointed to
> the dying OPP. Any subsequent call to dev_pm_opp_get_suspend_opp_freq()
> will locklessly dereference the now-dangling pointer, potentially causing a
> use-after-free.
The suspend OPP is read once, from ->init, into policy->suspend_freq. 
mediatek-cpufreq adds the whole OPP table in probe before 
cpufreq_register_driver(), and never adds, removes, or disables 
individual OPPs, and has no .remove, so the table can't change or go 
away while ->init can run. cpufreq-dt makes the same call.

I also realized that I forgot my sign-off on the commits. I will send 
out a v2 that has the sign-off. My apologies.

Best regards,
Ryan Brue
