Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6217E1C8604
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774583998; cv=none; b=GlgZYSTh88EWnf0mIsRaEmgNXClWT1tzQdSDt5RJOfMNJSBoxJNv5Iel9fVqBGkh7O3IdD2iYGqxUovkVIBlyFVeamxzaubZlqVVnPVFrlH0+yUQhRkt7pJEAb+FG29sTWSTeBO2GosMrjjNemncXFuaWpMF7hEzBuRLxUuMt+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774583998; c=relaxed/simple;
	bh=M8yHXRrctmAptnPlUik3AXAXll3yIV1xDj26jXEAp9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t0AAD9JP+rQ7WgLfcL5VSP1ATvnVkzi7mAwgJNexn5FQGY6NW6XARDUYDA51PVryvgAOvp1tHXBpgDcMfA3HzmZEtl541SJRKqosbFgaH7o6ew9cKWHYpd5FJPZKOOX2DOUwWZg5Sa3qMrmvIi3j7+G22KQRwjhe0pclt4++UMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=K7oalgpK; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="K7oalgpK"
Message-ID: <a6cdd237-3b11-40a8-865d-cfe97f97f01b@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774583985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dakhjmCQp6GVkDLoDUU4hYoePqqMLtz3QnhrzCmmiRI=;
	b=K7oalgpKKghvuokGaQvZG5Rg8KjZLI8pdUE1bOullKLN2FfVpUl+GCPLvJewx/WuwRlAhi
	wIZYzD4GaKnRChKSlNYQLgVFCUIIJ1aoWGRcbYLB5v2vUyAMFYdwa77aGI0lHQ5pYACRGJ
	iDFdepE/D75H45eFCLJxBOcwVgMmQ7CzZwSZKscNmRBz73BKtMQEwecimomlgG/ussJW0D
	LnoybeyIa8aTosgxrxqe7UwPwfM+Kz7I2oTtgN7WsGRVxMuxKbur7BqaA0SeJWNrL8d1DD
	fPuiS/dzf6BQ4pwLVGUXWDvzwiNV7A0KIFte8HKHDFkl4eJBJwUpiPyGDI1LUA==
Date: Fri, 27 Mar 2026 00:59:37 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
 <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
 <41476442-648a-46f9-a9e8-f5f4f7cf7bb5@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <41476442-648a-46f9-a9e8-f5f4f7cf7bb5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 3/26/26 7:47 AM, Konrad Dybcio wrote:
> On 3/25/26 11:34 PM, Bjorn Andersson wrote:
>> The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
>> ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
>> display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
>> headphone jack, WiFi, and Bluetooth.
>>
>> Introduce a DeviceTree describing this device.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>> ---
> [...]
>
>> +&pcie3 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie3_default>;
>> +
>> +	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> In lieu of the recent changes, these 2 properties need to be moved
> to the root port node under the RCs, for all of them
>
> Konrad

…and without forgetting (as I have for dell-thena until noticing in v4) 
that under the port nodes, it's now called "reset" instead of "perst"! :)

~val

