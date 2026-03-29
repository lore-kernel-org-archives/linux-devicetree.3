Received: from eastern.birch.relay.mailchannels.net (eastern.birch.relay.mailchannels.net [23.83.209.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0532E7BD3;
	Sun, 29 Mar 2026 22:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774823591; cv=pass; b=tUIOp/q5tiApX/zWQYXDpzwS8271qZ4b7RWwMADy2IN33C6l+8LkG0D+3CRb0fncC7x1AjLCKLv8Prhxx9tcCs76Ph7xutGTYWVRAL1BwvJ767VQJMP5zwsfMiP3qAp1RI2ywdcNlHw6G+nFa3XI9lYH9E+iHccfHeCvDdegBog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774823591; c=relaxed/simple;
	bh=MDG4cFtsxlmAjgKEt5ALjJ5lerZgdpeHxsV/4CxwXaE=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=DzxQlvD8ny/FWTMiJH1NONJ+16RUEUXz6Ts5W9VGF7lfdXvkIFNNaz61NqHqqpAIo12pstWhjpmFVk4NqthnF38prKVsXarPHZHGLvEJwTt6ZBUR2XyfeKQgA2uF2erURiFAWZnjJ5bexEFV0/VXCir8cIeJaBPHxtRs/b9cq/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=MIvHivuf; arc=pass smtp.client-ip=23.83.209.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="MIvHivuf"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F31EA782031;
	Sun, 29 Mar 2026 21:14:12 +0000 (UTC)
Received: from fr-int-smtpout28.hostinger.io (100-115-142-207.trex-nlb.outbound.svc.cluster.local [100.115.142.207])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 42666781D73;
	Sun, 29 Mar 2026 21:14:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774818852;
	b=qnCrhcIGC8Lw81es3X+Wo+kvDxv2wQfsdScN7joLVtPMURpTVd4w+JTuYfy0cUo/OsIJq4
	I1Uvat/CgzppGnpkKbDkmbSBefardULMLWzIO5oa5MVYksCnLZrYOXh08CEiGJkgmEHfN7
	uPXKmIXuiwbcPFyR6Z8juDQicr5PO0SWD/gKbFBb/doqDTwbu9DqD1QFQXGIcrSugm+0qD
	F2OnM2mf36va2SU7qOFKGKH77Py7VHOV0T9ESHFkZIWgXW84/tL/IXYIlzEmjIYs8EMqf7
	O9r/uTbURlwJWEqF+IieFc1xv5imApyv/4njfuz9QlOOTWbGHzv1DwdY76NGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774818852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=GPwev3K04le/fHrBvu2yHCNEOwAhRmNyY8V1pFhjEoo=;
	b=ygZByoOuzD5iRzC4DFC0PxG0HF52mMxfISsaPS+AQIHF61Nq38tw8hSrlYFiiRwi/Bbs4J
	ZXYYrRGn6ako9BO+E+4Af8ZXB5GeDUfkmgw7LO6ApHFkLj/44m82B/trYROXX2ul9Gx06k
	fh1KT5nQwUk4H9Po65DGoHOwHJlDJJR8u56XM/R+V38J2WV38Qloi1pgZVA07e+MzJFQB5
	Vi/QEtzxU7AFx2Der9uOeWhCIg8nhKKUsjSrJ6nphAmJBhYutTPssKFGUtZ+ayLoS8hGAz
	w8qPvr4QYVD4ZanfrrQ/bFTeJCT458gVbT8aPSDZlMlPXtllB1Dn+FXel4EQcQ==
ARC-Authentication-Results: i=1;
	rspamd-7f98bb5847-x7clm;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Tangy-Name: 5fc9a91b1ddbd4a3_1774818852818_3566261675
X-MC-Loop-Signature: 1774818852818:96200595
X-MC-Ingress-Time: 1774818852817
Received: from fr-int-smtpout28.hostinger.io (fr-int-smtpout28.hostinger.io
 [148.222.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.115.142.207 (trex/7.1.5);
	Sun, 29 Mar 2026 21:14:12 +0000
Received: from [IPV6:2001:861:4450:d360:ead3:9cb3:74f3:aa3d] (unknown [IPv6:2001:861:4450:d360:ead3:9cb3:74f3:aa3d])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fkRvc2bSzz31wB;
	Sun, 29 Mar 2026 21:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1774818846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPwev3K04le/fHrBvu2yHCNEOwAhRmNyY8V1pFhjEoo=;
	b=MIvHivufLuO/Idc+f58AgoELDrebw2pLnpMxVkjtlioz1P1MEpgFvWZc8OrvD6hWHo17fC
	CvedMmz9sedDWDtknApc9OVGHytX+/jGzd+vVTlTeykX4q8+T/qNUuMo7VyPavnUxU+m7B
	cWw0jiKZHIzlMrcJOlCnfHX+hsDsprFtTpzZIZ6rnSMw7lnRYizpFV/cuAczwixCGOZWEn
	2h3FkuAnyTIbvxiAvdgq68x6WVkVaLbWUujACT2CI2cbz9rbO1HSHfpI0Jjazc9tVypGFD
	zdk2SmOEAb5ldERy3HwYS4Tn2ldWo0qj75Lcy6frAhsEcVh0x47y02f081u2Ew==
Message-ID: <88400fa8-4545-49eb-af04-d82b94a89757@rootcommit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, hanguidong02@gmail.com
Subject: Re: [PATCH v4 0/5] Add initial Milk-V Duo S board support
To: Joshua Milas <josh.milas@gmail.com>, tglx@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
 samuel.holland@sifive.com, unicorn_wang@outlook.com, inochiama@gmail.com,
 daniel.lezcano@linaro.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com,
 rabenda.cn@gmail.com, dlan@kernel.org, chao.wei@sophgo.com,
 anup@brainfault.org
References: <20260328173450.219664-1-josh.milas@gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Sun, 29 Mar 2026 21:14:04 +0000 (UTC)
X-CM-Envelope: MS4xfL+Wo5DZjOaBh49EOaUutWGaQu0lfXl+Z/8jRHf+IPP3+63ghIrH7OqQdC2VYsijHziR+tcK+Fi1VVOgC0vCsbzGP0mMgWaUBlCjsRkEgdRDbugXMH97 e0NaTIN+ek9iOxYqUpxFz6fvHUE5pzFz0XSLc5BD+8uUWPLJZv8+0N+rlVwIKbU/HCoJpV07VrDOh4xnmjuMGxpgTjx26GUHQ92gYmzhJwO7/i1y3wcKXcen 1p8kAkbK42lU+pWFwE9vUZX88P3QW4EcgIjAUY4BuGyVzJTkS7zIMJ/2WtOtqhol31soyggtrpuJ3ksvhbzLpBKveuL0tHUXwD9B1541L3MMZrYX7ikQkTVm 7Vfmxd8nM11a0BidocThOXEIBR5XjrNOJ45TaGFWur42KoQyjo+MNXK82azp2se9UC5sqwoLp/Y84syPMXjcO2CTQlSVyUDlthsf3E3L8q0OGC6T3pFX9KKp iOokDHJ49XRKdryBioFP0n+VL1Co9JwLCcoyVw+LsniIKxXq3Yw+vARHuIuiPNimxQSLUCKdFLoQxXfyY6GkLRVn1KXUxpzTwUV1MAlm8V18YoXNBRAr0K1L WjuloXGE/xaXCgqwMvyvD9CfbhU40VRaZL1oVMtx0NgJ3X9xFJ0GSPzSVuucfxZ0Lnc/R71BHxN+GqyZ0YJAyixE1fICBJw7oa8ul8cdHkoFd2idI8ZgNjtq CmvHW4chMrzUeJED+K6ku1YJ3tdhbkEBW6SGR/XgHyPOrgYenIIks035wTVRBXtEPB1DqL98Pwa/qIH9A6k5qqocym9aKWPXDHCZOclRYMyGAsv7M6ij7t0m wlrG3jdarmBFxQmPfkv8+y6ZBz3nYxVVV2yBR/8NMC7XNKuHJIyDVc7J4oFCEtKvddop5KMHVEsUsvuUlyYJIP8BcXVLHMs2OHvMgkwGA9vji5X+9c0jQooj p6GfC+d5BUYuqkf
 TAaMtDpTmvuw+rFA2yLFOWCVVzr9XiVBkYuAGk8ye988dsSCbcnxk5D+E4lBn98mmYyqDJyBPOXo2TxS06AgJX/yL1hCwDKBU0h6am5lK qyNnSVw3TOtpDE/V/suLaPkP2brrmu8qs9ATKNB5+IGAsgJZ/KVT3Ztb
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=69c9961e a=FriOl7xEJMI/2lIB2BrE0g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=8WpGhjpvk0lN6TuUIIYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Joshua

On 3/28/26 6:34 PM, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking,
> and read I2C slave devices over i2c4.

I could test successfully on RISC-V, booting from MMC on a command line 
shell, and testing i2c4. However, I have an issue with Ethernet. When I 
add "ip=172.24.0.2" (for example) to the kernel command line, I'm 
getting this:

[    2.586984] stmmaceth 4070000.ethernet eth0: Register 
MEM_TYPE_PAGE_POOL RxQ-0
[    2.596428] stmmaceth 4070000.ethernet eth0: cannot attach to PHY 
(error: -ENODEV)
[    2.627351] IP-Config: Failed to open eth0
[    2.631859] IP-Config: No network devices available

However, "eth0" appears in the list of networking devices.
Does this work on your side?
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com

