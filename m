Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835610;
	b=ceJMe5M+Pilhl3fMueHK8fS9fpGSSeJhxMTyLi0sO7ZiWMdkXE+fTOskk/yhA9g15OE8
	 RM8ptlEUTSxKTLl6opLU1tEKQeY7O7ajrIERy6B+lan0jFUB0mlb9pm8DbfGT2FCqAcTS
	 49ELmVk2Gr+nPgt/2i3m+2oi0YiAfMctWHLtCQMIy4/tGJQHa+tnQ1SLQmFRUjsaI/uDb
	 OZ0Mry2F29gya+LvpFjGiLr/NYyopouxWb58dgOR14cG2SSxFsLmb1yST0yzkN69x8bbk
	 dyXb6iXfHBgzSAhKw4XSlIcaAaFyt4NNWt82DcSY0FuTnvZ/JS8BeMiYOYso6gLSHug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835610;
	h=DMARC-Filter:DKIM-Signature:X-Forward-Email-ID:
	 X-Forward-Email-Sender:X-Forward-Email-Version:
	 X-Forward-Email-Website:X-Complaints-To:X-Report-Abuse:
	 X-Report-Abuse-To:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=Qopof/KzEChronzbaNdRS8yRUwb7T04Bp6EAIGWAg3s=;
	b=ZCgGc58G0tOF8o8DsNo4t81kRx9aIKI8JQAMNb4qztuxyXyJfjexFvj+QA7t8hF6oJWX
	 qRLyZjFi4/JLTRVt78kx8OnafE7gw5yLBKWysgeLA82KnLZCrA/T5A/h+XJ7S/sIce08L
	 CM2cDZ9pMqymjkVWCdfs79/u08pyL07seDdFQAgYx1UzLgoMQeWYdvCIDetIS5jD4vCl2
	 qYaHojJoXfnNlqGERdqGSlojIZEKs1XI31r4+HMJvFxQoPb3dyZrjGOScuntdrKb+81t5
	 7juuIpbSH107qjGLgT6UwxdLJ35NoaKDzgdcD+TAayYgMd0LiiDS2B0Hc1S3YKAwpLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ubuntu.com;
	spf=pass smtp.mailfrom=fe-bounces.ubuntu.com;
	dkim=pass header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=KJc2bQ3C;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A4B606A33A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A4B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=KJc2bQ3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1794835603;
 bh=Qopof/KzEChronzbaNdRS8yRUwb7T04Bp6EAIGWAg3s=;
 b=KJc2bQ3CXrlbjNgV+d7q5odn1pt6I4/i2GPsj74FgWjAtF5ni3hlf9yRn+ix/HwXEiCpgTz+2
 rLuy+P4/ZCP9ySyVFLGaunErAG7L31abAO+Eh8oFihk5hYMWOmtzZvrx9NRpYC6LM2KVkmCkBE4
 9xZHZyfkk7FnNaPMpmmxubnU7GZIbxtoUgkhBpbuBj/tRlpEilWp0rBTBpecP0ofXN/XYqt4s+9
 E95CgM6yJRIbzSiG4gDr+yoU02ECvQjQK4FjkXPvAkDogTIVH5knseiDFdaZ/noVkL/zTcQSnwb
 TIO7H8FSY88gbPzUuTVz0YmfuiMPuOaFRLOOn33abifg==
X-Forward-Email-ID: 6afb048fb9d3ade89ee12d0f
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.26
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 16 Nov 2026 08:26:37 -0500
Message-Id: <DMWO4APJSZPS.16AA1EABR1AEJ@ubuntu.com>
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Sven Peter"
 <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal Gompa"
 <neal@gompa.dev>, "Marc Zyngier" <maz@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, "Yuvan Shen" <yuvanshen09@gmail.com>, "Nick Chan"
 <towinchenmi@gmail.com>
Subject: Re: [PATCH 00/13] drivers/perf: apple_m1: Add M3/M4/A18 Pro Support
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Myria Sarvay" <myrialsarvay@gmail.com>, "Joshua Peisach"
 <jpeisach@ubuntu.com>
X-Mailer: aerc 0.21.0
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
 <DMQ0CENBZQGW.L35BD1BXYE9Z@ubuntu.com>
 <CAFTKyQziVo3COsPZSSZOaFs7R6HhXEWNHYfgTkjyACc7bkoBDw@mail.gmail.com>
In-Reply-To: <CAFTKyQziVo3COsPZSSZOaFs7R6HhXEWNHYfgTkjyACc7bkoBDw@mail.gmail.com>

On Fri Nov 13, 2026 at 2:25 AM EST, Myria Sarvay wrote:
> On Sun, Nov 08, 2026 at 12:32:46PM -0500, Joshua Peisach wrote:
>> On Tue Nov 3, 2026 at 5:14 AM EST, Myria Sarvay via B4 Relay wrote:
>> > This series adds support for the CPU PMU in the new M3, M4 and A18 SoC=
s
>> > presed in apple devices. These PMUs have new encodings for events, alo=
ng
>> > with larger codes for these events. All of these events are as Apple
>> > describes them in the various kpep files found under /usr/share/kpep o=
n
>> > macOS 27. More events may exist, but we have no idea of their affinity=
,
>> > or what they actually count, so we don't include them here.
>> >
>> > These patches have been tested on my own M2 (t8133-j413) and M3
>> > (t6031-j514c) devices, as well as by Yuvan on their M4 (t8132-j713)
>> > device.
>> >
>> > If possible, the device tree changes should probably go through
>> > apple-soc, as this is where the recently picked up M4 Pro/Max dts are.
>> >
>> > Tested-by: Yuvan Shen <yuvanshen09@gmail.com> # on t8132-j713
>> > Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
>> > ---
>> > Myria Sarvay (12):
>> >       dt-bindings: arm: pmu: Add Apple M3/M4/A18 Pro SoC CPU PMU
> compatibles
>> >       drivers/perf: apple_m1: Remove unused variables
>> >       drivers/perf: apple_m1: Support per-implementation event size
>> >       drivers/perf: apple_m1: Use macros for per-implementation init
> functions
>> >       drivers/perf: apple_m1: Add Apple M3 Series Support
>> >       drivers/perf: apple_m1: Add Apple M4 Series Support
>> >       drivers/perf: apple_m1: Add Apple A18 Support
>> >       arm64: dts: apple: t603x: Add PMU Device Nodes
>> >       arm64: dts: apple: t8122: Add PMU Device Nodes
>> >       arm64: dts: apple: t604x: Add PMU Device Nodes
>> >       arm64: dts: apple: t8132: Add PMU Device Nodes
>> >       arm64: dts: apple: t8140: Add PMU Device Nodes
>> >
>> Maybe the folder should be renamed to 'apple_arm' or something like
>> that?
>>
> What do you mean by this? What folder are you referring too? If you mean
> the device tree's, they're already under the arm64 folder, so apple_arm
> seems redundant. If you mean the CPU PMU name, I get that, but I'm not
> sure how to change that, given it's already hard coded with the config
> option `APPLE_M1_CPU_PMU`. I feel like changing its name at this point
> would cause backwards compatibility issues around kernel
> configs/blacklists if people use them.

Sorry, brain fart. I meant the file apple_m1, to consider splitting
it up into multiple files. It's no big deal though :)

-Josh
