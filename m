Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574D233CE9A
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 20:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309987; cv=none; b=KS2wOTF8nPLwDpLEiaSgd59gaLT0eKWJw68xF5FpS+tIwGZ2w6/OYS9rRo/jtK9VKJpFQsaq78rAxBnRZ+oZICE8LjwRkadLUGuJAdqGalxn6QmiEH7xzWSvsGlNA5sE7DrHBjjDUJsbDOB4ez37cVXoH93FcJUVQf7uLSzFmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309987; c=relaxed/simple;
	bh=TD6IYcq7yF+WdzFQ1aQwZWT5pPiFbfGpLs+zMWeBY2w=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U8q0PK1fg4IU2T+0puFUPia6HtN5fd4DD8ji0qhavJNHrS+5Ejnm4TVFRksPAOOM8xjLGA5MIRu66sJCJjoxhgqDFmuT3CujgBGQbg1Dr4U3mzzzJcEItV3KbqwtWC2eY44do7w65q2f/WKS1a8VEVMGXufWZ3iLx2iFAYu018M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=temperror (0-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=UnUPtGi/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="UnUPtGi/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 61A6D1A364E;
	Wed, 20 May 2026 20:46:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B26260019;
	Wed, 20 May 2026 20:46:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47967107EA5AE;
	Wed, 20 May 2026 22:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1779309981;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zGsSIqVq1ifCQ3rw/2r0Ry2eIkPRdWO9epBcJ1BYbFU=;
	b=UnUPtGi/wplH2xPXVwCTFbU+qLHRfpwz13xUkIEC4Bmapzaz4OLWZ2t6TbuNMXqiD/MpnM
	tMoaObuq4xPhxAPPdovjmFNT6deXqqz+oRPVgy+fJkHXZRfr4B8w3GaOwX7wEQ8Kl2Uwsu
	wZHwxBp7kZ16ajYLEGYs1nUw91K01PirpogL7bg9telBmiVZs27KKBKPtzBkPhqCv+MA++
	+GxcROYlbiYatK3NllvRgfboqpfyIjTce0xdoLcpdxhael5qayxqcYnelguyUzjmUsKuY6
	48y68QR0lTZoFAx0ycwSFgqTMQL6bFzorNtEswEfNnPDeD1dqTsfEM3S+NNWKQ==
Message-ID: <5354f909-438b-4994-808c-6d055c58c901@rootcommit.com>
Date: Wed, 20 May 2026 22:46:14 +0200
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
 sophgo@lists.linux.dev, Wang Jiayue <akaieurus@gmail.com>,
 Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v5 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S
 board support
To: Gui-Dong Han <hanguidong02@gmail.com>, Joshua Milas <josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
 <20260403111516.379795-6-josh.milas@gmail.com>
 <CALbr=LYJKJREwh8KMqsgcXwd+jx0W7gFFFuBk-izNdgzkQU6Pg@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <CALbr=LYJKJREwh8KMqsgcXwd+jx0W7gFFFuBk-izNdgzkQU6Pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Joshua, Gui-Dong

(my apologies for my previous-email with HTML content... bad default 
Thunderbird settings!

On 4/21/26 6:13 PM, Gui-Dong Han wrote:
> On Fri, Apr 3, 2026 at 7:16 PM Joshua Milas <josh.milas@gmail.com> wrote:
>> This adds initial riscv support for the Milk-V Duo S board
>> [1] making it possible to boot Linux to the command line.
>>
>> Link: https://milkv.io/duo-s [1]
>>
>> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> Great work, thanks Joshua! I really like this board.
>
> I encountered the same issue Michael Opdenacker saw in v4, but
> enabling the MDIO-related configs resolved it.
>
> I'll keep using and testing this series and provide further feedback
> if anything comes up. Next, I plan to test the arm64 side and will
> also try developing an efuse driver.
>
> Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
> Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

What about submitting a new iteration of your patchset? I guess the last 
one was too close to the merge window to make it, but if you submit a 
new version not too late and review it quickly enough, we could make it 
this time.

Don't hesitate to let us know if you need help (happy to post the new 
iteration if you don't have time).

Thanks in advance
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com

