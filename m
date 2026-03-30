Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4358334C3B
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883045; cv=none; b=lJvdlN+TRop92V8sC/H6vEEpTMSc8omo0q88I0OPFAXzQO3OUNhmnQ/vqW55BLgv21l/7uK6jpWmy3eQH+6f9IzUUJRKwDkvTTZCwz3zuBtTiF8b7ivk+hsB2gznB07MnU9PMCyJsOAKUzUhs08t3KOvnctFeSRzq8c4z09ldxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883045; c=relaxed/simple;
	bh=gM4Ie7Og/iKoKDDWUD6FDDjEozPqyYaDYFwjuTmOVFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OozqAlJoB/9psJluZuZIZn7RrT9PSox0O87yQJaUzwBTb596Y41MKBFSFUqMj6+oSfpNFC9z00lUubwnjNlVtvhNcqHXm6n95R6NTU4ekARLl3dua6W2sNoaE0ZVuUjKiMRgA4W5UKoKApfId1ddaBcD3qk6v5OcH0Zy806v28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=I4nZllhI; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="I4nZllhI"
Message-ID: <8c7bb9f3-2c4f-4dde-a91c-893817070346@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774883031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUBhiMS8tYFBBVF/gWovrIjG9TCN/cpqKdIqU7eyxPE=;
	b=I4nZllhIT5Ca5kVO2IoCNBDAxpI1XRw7Xa5hB6aGnVztKvjluPHKi8i6S9u4Ykg7eaj9a9
	zBYfxHi6PuC193VrwF3Pqn/W0Fc4cob015AsgiYiiWNIjjXb7rYiXW1UhmqkDKH0PkuTyy
	R4h4pJQD5Fu3AsCwC+sctdairlatPXN2ZAZbwo7em3AzD5Apf7M3ogZa1JYsRr5sVO3AHA
	iqU5CU+O3uLnNfYAgZ+rfb5Qp4P8Rlc2lnh8PGC1SGfsYdu0JcZK7+m84OFr9FuBaq+ckg
	BtIeXz6h8jM+BCz5xCUrMW8/5MmhjdmyH5/CIskktHioO27OlLZf//q5IlkIxg==
Date: Mon, 30 Mar 2026 12:03:41 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Motorola edge 30 (dubai) DTS
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260329103055.96649-1-val@packett.cool>
 <20260329103055.96649-2-val@packett.cool>
 <5c0747dc-f0de-4b78-b0fd-8f6a6690e86c@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <5c0747dc-f0de-4b78-b0fd-8f6a6690e86c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 3/30/26 7:03 AM, Konrad Dybcio wrote:
> On 3/29/26 12:16 PM, Val Packett wrote:
>> The Motorola edge 30 is a smartphone released in 2022.
>>
>> This commit has the following features working:
>> - Display (simplefb)
>> - Touchscreen
>> - Power and volume buttons
>> - Storage (UFS 3.1)
>> - Battery (ADSP battmgr)
>> - USB (Type-C, 2.0, dual-role)
>> - Wi-Fi and Bluetooth (WCN6750 hw1.0)
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
> [...]
>
>> +/ {
>> +	model = "Motorola edge 30";
> nit: Google tells me the 'e' in 'Edge' is uppercase
They do the lowercase thing a lot in the marketing materials but not 
consistently. I guess it would make sense to ignore that and make it 
uppercase, sure.
> [...]
>
>> +		framebuffer0: framebuffer@e1000000 {
>> +			compatible = "simple-framebuffer";
>> +			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;
> Let's drop reg and use the memory-region binding (also drop unit address)
How come no one told be about memory-region for simplefb before? :D Ack
> [...]
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
> SBU would be @2
I was wondering about this, now I see it is specified in the bindings.. 
Looks like many other dts should be fixed too.
>> +		cont-splash@e1000000 {
> framebuffer@
>
> [...]
>
>> +	thermal-zones {
>> +		cam-flash-thermal {
>> +			polling-delay-passive = <0>;
> that's the default setting, you may drop all polling-delay(-passive) = <0>
ack
> [...]
>
>> +&usb_1 {
>> +	/* USB 2.0 only */
>> +	qcom,select-utmi-as-pipe-clk;
>> +	maximum-speed = "high-speed";
>> +
>> +	/* Remove USB3 phy */
>> +	phys = <&usb_1_hsphy>;
>> +	phy-names = "usb2-phy";
> Is it really not wired up in hw, or do you perhaps have a fake cable?

I didn't even try testing it myself since not even all flagships have 
USB3 routed these days (hello oneplus) and this is a cheaper 
upper-mid-range phone.

USB0_{SS_*,DP_*} are actually NC on the schematic,

and in downstream dts there is maximum-speed = "high-speed" and usb-phy 
= hsphy + nop.

~val

