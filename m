Received: from crab.ash.relay.mailchannels.net (crab.ash.relay.mailchannels.net [23.83.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C003DE426;
	Thu,  2 Apr 2026 13:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137674; cv=pass; b=KdS6xwVXhRDGo+ZE6a7CxJv6ACibD3nGByCc9kYh6vEA1jqE+TMdmGuqlGc/qddTzzIp/tnfViMfeX/s7JIztNlAEXZrYc72xX2v82vyGj6P8T+j5Ro7F1hgctBRqWZ1B6PnAUmOG6sOUVmy0sQF1p3MYBo9o1cqtEsojD76JOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137674; c=relaxed/simple;
	bh=HfwniG+5L1/vUjR5I0gIufXUAD5MbX7U/tpLrvyTtRM=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=R265tELrczQevhlSzH9Mw0vvUzwRBUzFWUAqjbTQJ65BV4vS3Vju8S49NXrNPcKY752LW6B+IvQTcjdOzrIIXGAl4LvjCtiEGf3estKhazJ/NeKtdto1z5wzI85vgnBq3A+rh5T6qI1mYhYRALfjE1u+0NHIavhCoVC6DlepAKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=BDLYGgVG; arc=pass smtp.client-ip=23.83.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="BDLYGgVG"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C07A26085F;
	Thu, 02 Apr 2026 13:47:43 +0000 (UTC)
Received: from de-fra-smtpout5.hostinger.io (100-96-137-18.trex-nlb.outbound.svc.cluster.local [100.96.137.18])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id DD54F62A59;
	Thu, 02 Apr 2026 13:47:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775137663;
	b=RovvCdvvfwukwBsN2nz76nWfs6SmR/Z+UeNDDffTsYwKPzNes695MWpeeO+OhZ0q1G7sb8
	u5FqD1wqkkkctMNfxzUHm8q29wCY4OKqudTG+8CL3kQhYv94f4ikpdtziLJm1PPjyq8PPt
	+cu9kZECycB+p2DTQ3iYosZzM7bW5psUSAiEaNpStcnphxuxd9haf3dyhwgwiOVjUix7y9
	8Grgf70D3ZAkMf2iWvQ9JL1xkpdWMqUcsKawJ8N0lq5foPJXLx05HJUENLIfkiTYki0GQW
	hJWzxeKnz6zKTq8Ly6ihbENGCjr925A9Om1lfrdXx5iXq1rognRpMBaW80Z7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775137663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=9pTUI2TlgXqneSbYx9X2pxr7AltZHVfuaXSJcVjhgWM=;
	b=0iPTSUMCGXkbzRUaDOEuQX82Tj2v6lazT2LcQcMfbc0nrPuv8MmdUVxRvYFaPCGZRPWL9j
	wBdLdSeR6ZfyWS6ojaDDrujCE43RAs7Juk3/BuLVjRJpkSTJz5XacU1BhSAYEiIx4hkKyS
	8iZuEDNe0qA4aWjiQFqxlwrTmGy5zlxISrdYEcE0dyEIWxO29dKKVBHSE0WHYeIBHz6o8F
	f/o60qA6tVGneex7mTgt8uwkvizRk70QSwLp/OAJSEJtzKnROtlvE5ZZbZ6zlqS1Bknim1
	QmTFu4dEbbDHJcVd6bNiMuz2tKQXq0/XYYyAEdJjPuNXblqswlHFi7oQQ60x1Q==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-l75gk;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Bottle-Arch: 007c82427455a440_1775137663607_482617670
X-MC-Loop-Signature: 1775137663607:2644984533
X-MC-Ingress-Time: 1775137663606
Received: from de-fra-smtpout5.hostinger.io (de-fra-smtpout5.hostinger.io
 [148.222.55.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.137.18 (trex/7.1.5);
	Thu, 02 Apr 2026 13:47:43 +0000
Received: from [IPV6:2001:861:4450:d360:ab76:cd75:446d:1407] (unknown [IPv6:2001:861:4450:d360:ab76:cd75:446d:1407])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fmjpX5GFFz3ws5;
	Thu,  2 Apr 2026 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1775137653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pTUI2TlgXqneSbYx9X2pxr7AltZHVfuaXSJcVjhgWM=;
	b=BDLYGgVGhTLd5NMndzYGPkVBxtygTd8gDGIJPbLebOKM8s6HO/AF0msMgmX0oGXZAnigJn
	vU0jUpPwwDlbQEBGUoPL/6R/C9B41kgxXZgWeCVirTQ+gZ4+iiqQOjLKTB+ln1+EXIEz/p
	4CoSlPX6fmytlimCx2jPyJZMBPMlWgS6fTsbjP/UoHeIQxDvZWF6Kp+xDgZ17lUSDz9ZEu
	BdtHKth9XAoEmJQc3XjA7AEduecy8zOQ18UZzXVT6g2aEatkil3PRNsPMysXEjMZBHULUr
	lzt3JLTWpCwTXxMDdNa0hYFgVBWNWTPSDuWonOLHUHZL0rKTQL8fi2zVL8rApw==
Message-ID: <86b01b44-d030-4201-89da-0c8fc5282c92@rootcommit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, tglx@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
 samuel.holland@sifive.com, unicorn_wang@outlook.com, inochiama@gmail.com,
 daniel.lezcano@linaro.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com,
 rabenda.cn@gmail.com, dlan@kernel.org, chao.wei@sophgo.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, hanguidong02@gmail.com
Subject: Re: [PATCH v4 0/5] Add initial Milk-V Duo S board support
To: Joshua Milas <josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
 <88400fa8-4545-49eb-af04-d82b94a89757@rootcommit.com>
 <ac5hFgLav_4oB2QA@sleek>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <ac5hFgLav_4oB2QA@sleek>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu,  2 Apr 2026 13:47:32 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=69ce7375 a=KpaUJEZuatzsP5AJPIWeNw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=1lZpniw-9rJIJ0ibxY4A:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfJq1AezKYbApVrxu8q0Bcl/ZNMw3JRY+9gtDuIHvl8NarBO/dfeqRT5hYBoQliFHeGDSMvOvSriyAxUyvA9300YUYvwfTfMtaLbJjNz+g7cfrur9pYeJ dvMBxSRkbmxcH2sV5ci9FbnOmiHjERxHIHB+zxRMDDb8ek/Cx3KiZsd8WIxwLE82Tbp5Kkyxpqu+QKDLM3dejXthAcVetHoJ9ggkwCEi0XqXKt2tyJIeygLk jdFInTOrBL+03V2Q7pOTXnfAwjJfuVEgVVOcNe9u7mPVuswFY2y2EuqlUX0lsS1pYpWp5JJuZODxJdWmAeRPiBktVYsKPy/ZRAIdmswjuetVqDdGlCZbv0Du Up1y+XScVxZbsMvmDg3U20gQW4Z4dED5gR6hmu2JWKpRxqZ1z83IuV6G+xs2TBaNjwamtUJ9pZ71k4GSneDI+HGIeqXsAH+NvCxlp21q+YpJQprW6rtTOeqs 0UXZEQLao9fvTvCbgLlHnuqlObXhgglFm9CkM0QS/OSkADW3KXqmwOCwwRMnUE/Dc3imzFQZBWmBD3ffWpyl+ntjFMSErplhHXuoXHxT6rH3sEyFC82HSnP6 jV41waFxekpYpxTZErCnJAtkL9lQ5liKxnO/959K/JbaI4ttkRmHa11e5dbSqeDdr8ryypqcdVBB7VBuxWT1BqAl2UQ1Vo2y+v5BXbhJQV1ckYy4QZIbFGfR BM/SPKUJ4QxTwJr2p/PuQO49vK9SXYwwqxYzi0Ow1BAiDEjmprMFUdxTvNGQwUuYQpIrh0/iEAKFKQcN4EjnSd6bF2p8Gk35MqZMFt/Rjubb1vSt6eKAWHma lBm7LRdtxjyyvTI2GCkXu1SlmMDZYyTz9nTz32mBJ6gD2I3zHMOBz+M6Y2rN0DuR1H3DFSFW//dhGvzFXq3HybwLBNCKXjdjv0UfgcpWm+U8SJf4otvRTz9U qTC+xYDDQtp84zT
 CJB6CFZ9ozu6idNdjXmWOAWD8A5xvibhQ/50SH4UafPIznQ0hVlbeu3g+AABd+Wdw75fb2EGMumavaKd9fmJZT0eFKe2JcWPXO9XVbxFF X8Kwyt7sJcAcr7Ufbg3Gli9qOUKSDyJNgVJDNxTZB1OOkVfBVK2PzqdV
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Joshua

On 4/2/26 2:29 PM, Joshua Milas wrote:
> Hi Michael,
>
> Thanks for testing this. I am not seeing that issue on my arm64 or riscv side.
> I am able to add an IP and do anything I can think of on the arm64 side.
>
> [   96.618687] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> [   96.633977] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
> [   96.676436] dwmac1000: Master AXI performs any burst length
> [   96.702852] stmmaceth 4070000.ethernet eth0: No Safety Features support found
> [   96.748740] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
> [   96.772880] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
> [ 1359.377528] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off
>
> I can do the same on the riscv side but get a unhandled signal for TLS traffic
> which I believe is unrelated as it doesn't happen on adding an IP.
>
> I'll send over my configs to see if that helps.

I confirmed I managed to test the eth0 network interface on the riscv 
side using the configuration you shared. It would take me more time to 
test on arm64 :D|
You can send a update with your checkpatch fixes.

Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Thanks for everything!
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com

