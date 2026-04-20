Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A60386551;
	Mon, 20 Apr 2026 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676627; cv=none; b=UD57a4RZ7l8LOZXHbFo2H/3hHTgtjWED1w7ZPirzoAUD0a+Zz7rzS4kH+bfMJvTH8l49WhqvfkQf3N+c1KgAXT9Ofqwaa8+85FzL8/uH1xXJipnMXboA4JaGsbTP6IV1Ugwwcz0Iys1YyPW84Jb/N3QveBCCapIvlDq/UqZmF8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676627; c=relaxed/simple;
	bh=dl5DcX6axaQB08bVzkfm0qYlVYMXHjs5k1QLohyagTg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hcwLpOgtFlyQlF9JQIlrNUveVJunx+wdriNrf3JNxlrex8cv4P7gfOMrUBcqyUzW40DGhfhMdgb4b6yP6XQsfwwJSLpZ17N9eS0gdMk12QC8ziGmsyysOfQqVySI/4ragsZ2kmlLd45+aBnfY1ikWNPoNJsohQdJMlnBILAdRTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=TE8Fjf2K; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="TE8Fjf2K"
Message-ID: <bb5ebce0-a59a-420c-a860-3cdb6b027372@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776676617;
	bh=dl5DcX6axaQB08bVzkfm0qYlVYMXHjs5k1QLohyagTg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TE8Fjf2KOVteTx9eiWJnuAJfefHqh30xeZHbwNfBd50KHHgITZ3wfIzcGFIlBB34B
	 KjKIiwxjFIPuGPWRHxggr5RrF1GbszM69AIijwMJ/j5TIzW+PMZlnvsHwy2Z4LI5kU
	 lqH9tkKhRdCzf2znN0ctIx6VB6ql9/MhiJCkCZJU=
Date: Mon, 20 Apr 2026 11:16:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: Jian Hu <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
 <ae61c52d-814c-40fa-b02a-833377d840a8@aliel.fr>
 <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
Content-Language: en-US
In-Reply-To: <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jian,

On 4/20/26 5:25 AM, Jian Hu wrote:
> Hi Ronald,
> 
> 
> Thanks for your review.
> 
> On 4/17/2026 5:48 PM, Ronald Claveau wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hello Jian,
>>
>> On 4/15/26 10:33 AM, Jian Hu via B4 Relay wrote:
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the clock measure device to the T7 SoC family.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/
>>> arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> index 7fe72c94ed62..cec2ea74850d 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> @@ -701,6 +701,11 @@ pwm_ao_cd: pwm@60000 {
>>>                                status = "disabled";
>>>                        };
>>>
>>> +                     clock-measurer@48000 {
>>> +                             compatible = "amlogic,t7-clk-measure";
>>> +                             reg = <0x0 0x48000 0x0 0x1c>;
>>> +                     };
>>> +
>> Can you please order by reg, it should be between pwm_ao_gh and pwm_ab.
>> Thank you.
> 
> 
> According to the "Order of Nodes" chapter in Documentation/devicetree/
> bindings/dts-coding-style.rst,
> 
> nodes of the same type should be grouped together, and this takes higher
> priority.
> 
> So I have placed the clock-measure node after all PWM nodes to avoid
> splitting the PWM group.
> 

Thanks for your answer.

The documentation says nodes "shall be ordered by unit address" as the
primary rule.
The grouping by type is described as an alternative ("Alternatively"),
applicable to some subarchitectures, not as a rule that takes higher
priority.

So to me, I understand it as, unless your subarchitecture has an
established convention of grouping PWM nodes together, ordering by reg
remains the correct default here. And, in my opinion, sticking to a
single sorting method improves readability.


-- 
Best regards,
Ronald
