Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176191;
	b=dlrI1AYzW1YlfkCmN8EAP1wpKLyWEcZv7FTgCYc3xatequrlmgad9RuNzpoiEhW+iGJ0
	 5J8Z8Ka+gyzEFlSzmXGj7obCYGTQeQPn6OG0te4072OMQ+jBl5MRttcDDjP+JWJUETlNu
	 kcPC8sBg4SuF7q78fv/KGV8tZI/0gyNNvTXjxOykcdQXMyfcomrDLjVkyiiUvDMupaEg8
	 ER8zeTsTK2gdo1KKNt2+Xx9wu6DRQJsOl7Pa1ATmH/Fm9eCSQWhNI/w/CCUf87UCZzppw
	 y1yT2VBxzHmYDstPfqjN0Twu6LCoVaTJ+7/XJuopgBLXhg/D2zeAwnlNQredfdXGfUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176191;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=tSsll3kKf/A5nOKxO5JS6a9ssNuy0Uui3cKpvaZxhZ0=;
	b=NiVCNGg5WQyRg1h60vP08u0PhpRASWH33tIBvGEpjGenSGbelKMOovPkbl+RTcRKUADT
	 9JJZp2JAIza+pMblunQaEhz5gpZ91UUfeyD85AtuJ36qnggjrj9oBdHlJxK4LL8NSiyax
	 1gHfHg0w3IUYtRH+/j0f5T8oD+9rD3rumMnYjB23WTov20Ujaxx+uc2uc6lz+PVjCATPZ
	 1T7CtyNtNUr/0OJTdkOxweVrTeTczkuX4RMoi9sqvrJ/LNxWB0RPB7nC1mNkSA0iHc8YK
	 DSDzUGimgAEh3lMH8KWo2qQF7kRixcYagljXImvrCVzyAPsF4Rt2r6EbglrGllZJ+7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJ5Q5aLb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C694B606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJ5Q5aLb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702411F031EE
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176190;
	bh=tSsll3kKf/A5nOKxO5JS6a9ssNuy0Uui3cKpvaZxhZ0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eJ5Q5aLbqDPJ5gof5fltzVkIsyvjcisnT6uC7Ii6JTZqbS+D5XYGScuRWpa1tX2SF
	 MVQZq27HUDKZzmlR5s4xpRjwQ/IS/jZDPXPityyrXnpDNVJhMVii6hBsp5K83mmYUe
	 nMSJnU8mMA6Od/5vfvCI54TKcHyd/cLIN3y/U7+Y45y8qVycueSy+oqPYbpQwOXPDj
	 kpQlh9ZUujRsVeCNaZfzS4TyDzpMPG4yoOa8BrV8BvXwHI5crpnGofzIP5SBfNCevQ
	 r8UivzfCpUNJW8xmuZzi80gdrABlR7w9ZJdaIJAT+pa9QULQ2FjU+xSL7Y5Zu+yyqW
	 Y8ZymlLzf8PTg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso820387e87.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 01:29:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByYdXl4038X0+oV0H4+R3XnFITf1l3vA46UuC5BcT5uEwgsn62zQ3l9XoD51NG2wPSfqgzXSae2cJOk@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1jXD3E65GCbc6LhMQQgKfOO6vWM1rb1ZBwDm3ArwmNKymI86i
	htTpsqCwE8Wl/RTBiO6NnMp35fYgZZdNB0BVAFWS77sN8fYBUYQDNCvqL98gCWAayRzEk+xU9QK
	G94COvUUnoLlcETwLF5wVeumkKYMPXu36HXMW82LW/g==
X-Received: by 2002:a05:6512:39d4:b0:5be:4904:d2c4 with SMTP id
 2adb3069b0e04-5bfcad7e51bmr690736e87.15.1793176189147; Wed, 28 Oct 2026
 01:29:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 03:29:47 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 03:29:47 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <5114bca8-91bf-4db0-ae12-442d21ebad84@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-3-a34d778ce9ac@oss.qualcomm.com> <5114bca8-91bf-4db0-ae12-442d21ebad84@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 03:29:47 -0500
X-Gmail-Original-Message-ID: <CAMRc=McWSHn03C9DZ8ZohebfDA9z8L=xJ05KDOYEm6n3eHPArA@mail.gmail.com>
X-Gm-Features: AclHuK9WkISxEdVMPKocpMJX1vIBeHnYYBYBtz3ekKYCE5vss8u7OwiUvounMh4
Message-ID: <CAMRc=McWSHn03C9DZ8ZohebfDA9z8L=xJ05KDOYEm6n3eHPArA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans-sa8255p: add ethernet nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 14:32:16 +0200, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> said:
> On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
>> Add the ethernet nodes along with their serdes PHY nodes for the gearvm
>> variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
>> EMACs.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  28 +++
>>  arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 213 +++++++++++++++++++++++
>>  2 files changed, 241 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
>> index 4c155cbc79754af632848cd55b738e3ef0511cb5..c64cfd279af458e24fb48083ae549c96cfc07485 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
>> @@ -58,6 +58,14 @@ &cpufreq_hw {
>>  	clock-names = "xo", "alternate";
>>  };
>>

...

>> +
>>  &firmware {
>>  	scm {
>>  		memory-region = <&tz_ffi_mem>;
>> @@ -3226,6 +3234,26 @@ cma: linux,cma {
>>  	};
>>  };
>>
>> +&soc {
>> +	serdes0: phy@8901000 {
>> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
>
> Hmm.. I was hoping Shawn's DT reshuffling would land first
>

This series depends on Shawn's, I too hope it lands first. :)

> Are the PHYs hardwired? If so, you can move the phys= reference
> here

Yes, they are and will do in v2.

Bart
