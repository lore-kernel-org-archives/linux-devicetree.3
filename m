Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AE6EEA8
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700522; cv=none; b=MlSE+k3GTqaIQB/lmSbRU0gbPJJ+0CA1eiQtHGAiA/VFxDkl6cRYtR5We1uEOwhC8pgn2sKa0KEXd0zXuvklmb+E68kOyTh+9qJ7DM7pUaNgvPvw7a55RDVJ+0EnCKwu9eRqh05Q57BXrot9kKVpZ779w5RaIOE/Pea1GKea+9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700522; c=relaxed/simple;
	bh=Wcnnt81igeR23gl0HETOgBYsKQ7MkE0Y/7XdPKxYN7E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dD/Ablp8dsCo/OdpPQ31HVrTL9EC1tmtYbTvvYs8R2vMsLkUFVHPMgmqbOeiEmuoFkLLtWp88qG1mXzO6drQs6Q+ZXswajq5BjWjNgc1ujlb417hbiXk0Pk/b34SjVfZV5GpIMlUTPTFT150Sz5YWc7rvSOGVoilS11auwvqDnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iskren.info; spf=pass smtp.mailfrom=iskren.info; dkim=pass (2048-bit key) header.d=iskren.info header.i=@iskren.info header.b=Br5n1L8z; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=WSgxuR5x; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iskren.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iskren.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iskren.info header.i=@iskren.info header.b="Br5n1L8z";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="WSgxuR5x"
DKIM-Signature: a=rsa-sha256; b=Br5n1L8zTSyIEtVdzzSEju2xCdw1ifNZMaIe4245T3cRenB64taFUdfTOilSqq0iaTtnoQoTc2b23crdRSqv0yRzeiZQqCxr2L9/2VwgPesTUd005nLp+uTuL25TLI3/VYxerFe8eg7ypzFqIrLX0/DQdeJ/tW2FlXUN3+Zo5DNQdkBbzw4YaRGuLBxv4rxmj4SWIdnXPYZBsoKKWjkOFOwpgPMM7+rTiVSL6AiyYFvW73+h9m3wjEj+Z6x0TsQizua9q17FsOcpujq2/P2oQ1cg7qtkV8yUxFNUy+eVlnCvEhuGpGaLk8v40f2Nn/AyApHv2cUyjZ3IRYAsuc7caw==; s=purelymail3; d=iskren.info; v=1; bh=Wcnnt81igeR23gl0HETOgBYsKQ7MkE0Y/7XdPKxYN7E=; h=Received:Date:From:Subject:To;
DKIM-Signature: a=rsa-sha256; b=WSgxuR5xr6ynPCp9bQSBEpXmt7q45KXrjjifhUrL3md54PanE8UGZxOVgva7jkE6WhQSCWVVEA2lT5BLkQwnM2z0SF478fGZMBONp/It4gdy1BPJGqdjOEp0kmYaaHmss2NlbzaK9dlkndBC3nMgGiaI+EUpUJdzGX33Y1C+YEOB1CGIDUIuYsQbJ8plKSQbde0DBUAafL68M34aiN5oEiIqtQV5YayNfgiFS6MxFx0pSozkHI5TaXsp2lYEv1NayUX4Xz9vWyTmLGoZNma+kkYIo2eit0QbTBxbwl2u7fvPLSTiZk3V/3S4bGWs5ffgt8KuX0eXN36rSt13gfDPug==; s=purelymail3; d=purelymail.com; v=1; bh=Wcnnt81igeR23gl0HETOgBYsKQ7MkE0Y/7XdPKxYN7E=; h=Feedback-ID:Received:Date:From:Subject:To;
Feedback-ID: 10275:2339:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 967961925;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 17 Jun 2026 12:48:05 +0000 (UTC)
Message-ID: <6fb6f805-aea1-47e7-bb7c-bc5ecb2201ae@iskren.info>
Date: Wed, 17 Jun 2026 15:48:01 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Iskren Chernev <me@iskren.info>
Subject: Re: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
 <5b474af3-f651-4a64-a5b9-c18136e589eb@iskren.info>
 <a51b6333-cd5a-4a38-b748-b6623c6a1078@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a51b6333-cd5a-4a38-b748-b6623c6a1078@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/15/26 1:44 PM, Konrad Dybcio wrote:
> On 6/14/26 2:29 PM, Iskren Chernev wrote:
>>
>>
>> On 6/10/26 3:04 PM, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> I don't know where the existing one came from, but it's apparently
>>> wrong, according to both docs and a downstream DT [1]. Fix it up.
>>
>> They came from DTB extracted from a running billie2 (OnePlus Nord N100):
>> [1] https://mainlining.dev/wp-content/uploads/2021/02/03_dtbdump_Qualcomm_Technologies_Inc._Bengal_SoC.dts
>>
>> The phone was bough early after launch, so it could have been wrong/updated later.
>
> Good to see you're still around!
>
> Looks like vendor tuning. I see that even the initial commit for
> 6115 had the init sequence I posted. And the OnePlus sources have
> what seems like a project-specific local copy of the DTSI:
>
> https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250/blob/oneplus/SM4250_Q_10.0/arch/arm64/boot/dts/vendor/qcom/bengal-usb.dtsi#L145
> https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250/blob/oneplus/SM4250_Q_10.0/arch/arm64/boot/dts/vendor/20882/bengal-usb.dtsi#L148
>
> To support that, we should add a new property to override the TUNEx
> registers - like e.g. qcom,hstx-trim-value that's already consumed

My 2 cents - I never understood why init sequences are taboo in mainline
and widely used in downstream. I guess if it doesn't change (but across
what and who decides) it should be in code, but if it's "tuning"
- whatever that means, possibly depends on other components around, it
should be "configurable" via DT.

> Would you like to look into that, or should I take this?

You can take it, the other option is to mark a TODO, and if somebody
feels strongly about the binary value in a usb tune register s/he can
take up the task.

I just wanted to point out that the number didn't come from a random
number generator (or AI).

> Konrad

Iskren
