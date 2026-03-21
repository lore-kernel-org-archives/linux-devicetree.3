Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE6F1A6818
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774078645; cv=none; b=Yo1x7UeuIOfJZtsmRcjD+ebRH5HMmrcv+xV2wbwv7JVjSRbfgInt1TRXm13BJeYsqzsCxkHUumI7vmOAiiZR6gB/2GhBoXTUtycVxh7XNUceC1thBWwXwU1ZajncqGfN5KeJl2llL7QeqXjDHG1x6cJE73Q4GSF0eD2ROTIgygY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774078645; c=relaxed/simple;
	bh=QMM3KwrskrVMJ6T7vb3jZ/l2SDa18aenq3clLzmpVa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKA9XTxyeOZenq7bcWefG3CDU1UZYmdBgu6TycGPB8pPpqvEoyzmAKWUnz1A+9SxKr1QmGMwU6kzuUgMBubhRHR+AaETyKn78CPpnNrRA0LmZuRl3xTnzlijcEz8XEvAn34Bhu9+9FwS/33G7k3r245SwA68bC/OyRLV0S9LTB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=wga5Vray; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="wga5Vray"
Message-ID: <9ea41e6c-7643-452e-abf4-f35238807a26@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774078632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnZTzyArA1UF6o+rOeggLESVVxpBXLlSzECOhpcPCSA=;
	b=wga5VrayaH9c+LagNeLUpd9ULHLJ0w82Y+lwBxTwUFkLPtRXNOycWTqDNWHDlKgumTX0Lz
	0i0KZwn7WH+1Jmds70yzBCY8Dvyeia8Hzebt+/FPT+g+IDahlPznvVYCDNpuploLA3erFL
	b++He7sXHq4++0DoNUlS1oNjFaKwCWj2dyaOBNnRXjOf0B8MsLJMVwa54PRAhBf5YJ9fsC
	OcwUUNOOw/52HFJizsX3beBNQOjB0GCx7JLpGxvXr86g3DN5aE4FPOqaIAA6HcmzmIDfmm
	H4SUNC+ZwaQNY2cjD+q7y/CgOMGlPqqtxry15qDX7hrO02CZR0QCr/lSmXVD2w==
Date: Sat, 21 Mar 2026 04:36:58 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260305093941.305122-1-zstaseg@gmail.com>
 <20260305093941.305122-3-zstaseg@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260305093941.305122-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hello again :)

On 3/5/26 6:39 AM, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> […]
> +	touchscreen@0 {
> +		compatible = "goodix,gt9916";
> +		reg = <0>;
> +
> +		interrupts-extended = <&tlmm 81 IRQ_TYPE_LEVEL_LOW>;
> +
> +		reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&vreg_l7c_3p0>;
> +		vddio-supply = <&vreg_l2c_1p8>;
> +
> +		spi-max-frequency = <5000000>;
> +
> +		touchscreen-size-x = <10800>;
> +		touchscreen-size-y = <24000>;
> […]

I have noticed this previously and started wondering why the size was 
10x higher. Now with my own device (motorola-dubai) I actually found out 
why…

With the actual 1080x2400 size, the mm values reported by libinput are 
10x higher than what they should be, e.g. touching the bottom right 
corner with libinput debug-events:

  event3   TOUCH_MOTION              2  +1.493s  0 (0) 98.80/98.75 
(1067.00/2370.00mm)

(2.4 meter tall phone! :D) which was mooooostly "fine" except Phosh's 
on-screen keyboard was accidentally detecting super-fast down swipes as 
I was typing normally, and suddenly closing the keyboard as I was typing.


Let's do this in a more acceptable way, in the goodix-berlin driver:

https://lore.kernel.org/all/20260321073242.556253-1-val@packett.cool/

so set the properties to 1080/2400 in v5!


Thanks,
~val

