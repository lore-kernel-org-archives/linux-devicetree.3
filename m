Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547743ACF1F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530183; cv=none; b=GOanLawtccp+vnneAPhUDeBz9/hhciaXyJdSzxz9lbJcmeP2jJVRObkOuTQwWcALbSUyER+lrB6hUavbEJsh+6VKRUUI2WkgeOCrEtupITPA04MyyxYRJfA2UQnfnu5LFo8a31ryre2uHCSjGComvVEbZx0yow5WMj8BVGVAJ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530183; c=relaxed/simple;
	bh=fPAvCvMkvS82SGNBTuLFU7mtu1DS+RQRnEno1GUhy7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoyls84I8acCYYkncZV7iISLnWrxDsBSYpl9euTr181Bf8I3SyLFzuQGQWNmAZdVi6gY4a24BKBBii5EF1fxFYn3PgWccY8wVTBtXxCHAy+RZlom4I6ePZ054Sl5D3RohrBdKO8xGSJrWuBCT0ET+m8vj+j86Gl3WorKRuoUrEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=FtzlXQZi; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="FtzlXQZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791530173;
	bh=5Sbve23T2nM2tzDYXLYF+bZA1hmEj/GkRMM29V+yUkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=FtzlXQZi/w2OEBCsGjpr9cAp5ZFt6b+BgiVKKLLEcpTW3fjiXXfREPSh2Xwbi/WiC
	 CadEdZEesT0BYMi9cJtKxFILLZfa4tauo8q/KLC24dEOl6FU+BWTvauZceWcKrdnUK
	 qlIA+Ke43O1j5jaPKSTe+EMP4/+NOCwkbNW/z6k8=
X-QQ-mid: esmtpgz13t1791530168t2d291361
X-QQ-Originating-IP: khSeAFlHEEgU33IJubM1BqqYTdCyduUbyBl99wc8zk4=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:16:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10654036301431491844
Message-ID: <FDA9F931EC8B8D5F+e3ce2a41-637e-45a6-b46e-6bfdeab5076e@linux.spacemit.com>
Date: Fri, 9 Oct 2026 15:16:05 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
 Ze Huang <huang.ze@linux.dev>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
 <20260927-b4-spacemit-k1-usb2-v3-1-ce7095896039@linux.spacemit.com>
 <bcd2df4f-9ff6-4d30-8735-573d661bf367@kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <bcd2df4f-9ff6-4d30-8735-573d661bf367@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MPAlP4yRn0xgAWIYGM92J8UK4U4zUV1zNnaFXS8m5wJ3ehp6wTvBCBGf
	O5RTe3cRqhZrzugRqWaZsKh44+hIOp7gqWS+efNW3FOe5Z4yvtGckWbjcNp/A8JAKfLrzFb
	+t+nLxPxA4HZvgtHlmS2j3M4EuRLL1XCD1EJW/X9Ty84uE/E9rIOXbb4NelsDTtXXUNG4F3
	fs4seTzjiHvDQHJ7Q0qLh6ha3pMBbuUrDWuCGlhO6EmKUzfgRbxiw/tRzN6tgZK3sW3bDoC
	p/oaQY1PPxOsTHDPQhmqrBg3emPGdkv5kV2HUeDj3fGTV/lYNMYOmXzkq8J2AcOOYXo+h4U
	wSXAUH/xA0HHpVH5G01DNvmf5q4vo8YH1Don3aHARSzmri7WVolMrg7e+RFLoiRG/VVhcPs
	uCgYz8qfwNkYsLOO1iuvXy9Zee770YX683IXTntTCjD1mpy787ioHEeAwxxbA+CS40yGTmu
	S0PhrKl7CJWgfjhnBUBWp8ksa/bvBVsw6ETNsb73Kax39Hn315nY/Tyu3ZKw+BEClzuZ+YH
	Xs213HCUtK/AQtWlctaUNKVHRR7JCYp1T7Zk55Otdmwyd9hk41zYhBPeaImDjvW/CWqfE7d
	g+o+KxVcJdNE83CSJXyTMt1BjDjja+3x4kxWgu59c+3CGKYKHFKLb7IRxvxqVpwmWkJ4528
	FMhZkyIFg9huu4xkmtgiQmyGBz0Z3wc5W0vxYl7yNKdO1N6PWtjO+GYZFbWA1xXackqXwDL
	zFZmGLvRc+kMHvYlTqTk/GU7xb3hZNhKDy5hLrl0j3moBmDcbSdJzrPnQY9L92lW2XgZmzp
	BU4J/gbI6k9W5hE/GulseC7U8Q7ZNDSnWYXYFC8jcgwrFNdP8w3XDpBTvbBAarCll3Oto47
	YrWLRj1SS6QSlthFkQRmVSppKpQnQYgbHl3i2GeDlquSUH/H7pSBvW4XLCTNnRKaPBuVK0v
	8eLZQmmG94x+6d4utVQ87OFAJnFV4+QUDitvNqcqErdfMcRFTdwYlgWe0rw3E5fDuPrBnF7
	v0peeyKYixP3EvABbnFbzpGeEwRoyPvdbI7c55q9qctqnw6eNn
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0



On 10/6/2026 11:09 PM, Krzysztof Kozlowski wrote:
> On 27/09/2026 13:40, Junzhong Pan wrote:
>> The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
>> has no internal OTG registers, this requires flags which disable
>> related features set in platform data. Add a compatible string to match
>> the platform data.
>>
>> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
>> work, add constraints for it.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Tested-by: Ze Huang <huang.ze@linux.dev>
> 
> This is a fake test, you cannot test bindings how we understand Linux
> kernel testing. Please drop such blanket-fake test tags from all patches
> where this is not relevant.
> 

Okay, I used b4 before and I thought it should be collected in whole series.

I will drop irrelevant ones, only keep those in patches truely tested by Ze's
setup and send v4.

Thanks!
> 
> Best regards,
> Krzysztof
> 
> 

