Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB8847A86F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531464; cv=none; b=aZFuUfGILJ/9jmxG2yroYcKh71VuAk4ydGAyBReso/aVfc/d2h7SaxNe0ROmk89Ua0i8HBdKbSj9ju9HoH0B1gC/Mmt7s+hJ2hn7Llebc6+WogT+ljIt509Y4Px7vlfFWlcVG8W81V7C4v4ZSilfbCj7FLuVXSMnf0RJ/cMgvlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531464; c=relaxed/simple;
	bh=ziGFpD7LUqmPJNWWXcK8dAUtkI36pQhKh0sWvS6KNYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMS5qDv9rRoRAp/aRQ0ei1G2Y7gUyI2sLY1xKq5CYOsei1NSzN74zx42F2zNbqtaTrh5f2JSQnua/rYBQYTv7nQS9tJf/xn4Umua9zlWYhrud9Iiatr+bZ7G4V7+pQcYRRA8nRXfzvOZx6G8/VboH/47MUm89EjYOIA29HPBT7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=NENLS6a2; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="NENLS6a2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531458;
	bh=8w94qaIyqvoZXJSMhlUqDunjyb69j/+6YnXQ3qEKAAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=NENLS6a2Mdny/v+ymspEOUgA90ui/qMfkq2blQijdK79arvM5WmML98piEp9bFEhv
	 j2q5vKarvDAglRufbTk1UtRqBLOOxOcrUTM82tqU9Qr4kvDxeTGJdMPmdxwjSh4Ftj
	 GxY6EhinugwDpQzpGrs5flu0guRQKu1E3IZip180=
X-QQ-mid: esmtpgz15t1791531454t309d85ef
X-QQ-Originating-IP: 9dFMJrss78zrC/tVy1Ltv1Qmy7e70zHXK1/kjK97Xt0=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:37:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4560660349085074679
EX-QQ-RecipientCnt: 22
Message-ID: <7686F065FEA15D6A+f2c02b39-f7e8-4456-b41e-7fe14df4ab92@linux.spacemit.com>
Date: Fri, 9 Oct 2026 15:37:30 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Add SpacemiT K1 USB2.0 controllers support
To: Krzysztof Kozlowski <krzk@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>, Ze Huang <huang.ze@linux.dev>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
 <20260928230310-GKB2079@kernel.org>
 <b6a552a8-7710-4472-aeaa-96d50856f896@kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <b6a552a8-7710-4472-aeaa-96d50856f896@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NVcDBaRRI+2ZpnIGQajSoJipPrdfJA6XJ671fOgSvVIgU9au6+gP1sOA
	GzAP4pKpznJou1zCmbgRhstJojQnEf6nC8h4WjdkyFEPtFOna1Nli2YFWBDoCaIuAMs4foF
	3A8rI0x6FcxF5xhZEkd6+yEOwdBGMFAmwttU+aBTsl4XA5+/GGGPvAba1Jz9D3wfpaIzq7U
	0oyDtnjW+ZGh2KHoV38chstq7biLfO+ldLE52Nv5q53xLtHTZU58kjZkSmkBhxvW7d6nuvy
	yUfW87C6j7pwpQVgKQ2y+RswAE+UJ35N5Gnnnk6olw8vTX3bu+PGnQ7ap6fgZs0p6XNvZfQ
	hLBrRh3SC23fkXJuINg4CJ3op8LHBwyLEVa75AAQCzMCkLRjQjPOtW8c0mKv7Op8Z2EK5Mk
	B4Jx5CZmCqE5rk5JPhh2aBts5xRNefLh7qNONRJ9Gj4hwBd0CRjZBtK+vfpSdlVxSVBlhIk
	/5dYz2IqWdCqicBXSlQa3SrqB36x1ZET1zuiIw76+3KOzQhzjKTBjitandXDwx2QvYBTfIX
	hGkj9P0KoNf/YhctntulW/kJykW6kM4L2yIQGCSzgazkXWGDc4b4Bx2WkwDrySh2gEvX66T
	5mgR5Ya8sfEbxn6KpRYKFSkpx+fJIxKvfWZtaWrad+3X3Cfzs9YGBO8iPz8cAQkekOlys1K
	QF112SMZWfBkGeVpsu0Lt4D5BJhT26QUWff1S8fFbm5Z2HIPAfQ5nf7KzDUd6iiK9312cFU
	nqHcOLyl/G+Vt0mRKqcAShufz9kGINp6/A73WGy0AMM8ILsA3feBbhQtA7YujF+HsSX1stn
	0m1TiZN3AJQDwJke6UE3yAy/92/7D/dKu5x55LuWoK09OFQK1Nd0LGVXuEd0y3mtqnlbVCA
	zq+I9CUygaQbh0+yKD7yZyBaUHEi0uu0EfKbM4dDRu5LgSjsCcq/BWyzFKXMKOLIQkuGowg
	ITjfSW8XgNEfBawUIKqrHk+iYBBDmePIlx3YSXTl84BP+ja7zeflJUPhXJbN7p1mHhvYGJE
	0JJ4lYekkNDvk1tgnDkqZafFunSpA9FirbrJOZBjXfNDQeu0R/cz5QO5bkHzumIkdK8P3u4
	u1NimhG84Lxm3+Q/F//z6fAm/nrOOJkfPlYl+NuiAZp1mAlugrcxc+2DnC3VuG2M2SCvDoM
	ydvKv8hOZay3GCzy5dYkC2bEcH6Ws+FAzAd0R+Osw/w3U/thVH4VMQLTyg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0



On 10/6/2026 11:10 PM, Krzysztof Kozlowski wrote:
> On 29/09/2026 01:03, Yixun Lan wrote:
>> Hi Greg,
>>
>> On 19:40 Sun 27 Sep     , Junzhong Pan wrote:
>>> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
>>> support, but the hardware has no internal OTG registers, the other is
>>> Host only. These controllers are compatible with Chipidea USB2 driver
>>> with some flags set and reset control support.
>>>
>>> This series is based on 7.3-rc1 and has been tested on Banana Pi F3
>>> development board.
>>>
>>> A self-powered USB device/hub is needed to test the host function of the
>>> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
>>> cellular module e.g.) is needed to test the host only controller.
>>>
>>> ---
>>> Changes in v3:
>>> - collect tags
>>> - merge the two dt-binding commits
>>> - use local variables when acquiring devm managed clock/reset
>>> - drop manual clk_disable_unprepare() from the remove path
>>> - enable related drivers as modules in defconfig
>>> - Link to v2: https://lore.kernel.org/r/20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com
>>>
>>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>>>
>>
>>> ---
>>> Junzhong Pan (8):
>>>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>>>       usb: chipidea: usb2: use devm_clk_get_optional_enabled()
>>>       usb: chipidea: usb2: add optional reset support
>>>       usb: chipidea: usb2: add SpacemiT K1 support
>>>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>>>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>>>       riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
>>>       riscv: defconfig: enable ChipIdea USB controller support
>>>
>> Any chance to queue these patches (1-4) for v7.4 cycle? Hope it not too late,
>> and then I will handle the rest part, thanks
> 
> Can you drop the fake test tags while at it?
> 

I have dropped those and sent v4.
Thanks!

Link to v4: https://lore.kernel.org/linux-usb/20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com/

> Best regards,
> Krzysztof
> 
> 

