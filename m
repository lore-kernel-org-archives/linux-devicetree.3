Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465433FFAC9
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296711; cv=none; b=Crg5hlSc3vhGySkSydS/nCVo1/WZNw2ElyVryMPrRirPY/BxGvxbH45wsE2CX9LYbQWrQfR4xwXX7pe3tIXFTmtcBBugPOqlyEVKdIqfHADy4bfwwTMZK3Y8kEG6ERifH3XbLDlUuWnhl5mk6ivwV/QEXz8kwpKFh0JRCcOph5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296711; c=relaxed/simple;
	bh=44teChrBfz4WzM8dRrr8D0pP+Pxvot3D/5T9HTkD6Jo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkDfaHlVoFXr1jBzjvOpMl0UiIwSmQRy4IXQ/f7X9RG1LFpo/7I28v0JAfBUxsYKLjkjkGLpQiE2skat++7XIlE0YQDOs7VrvXGPuFHASa5eGAuXYW57989r9i+bThmT8qTH3hSclEXQ9bA5YCWcoNpMlC63q0IaFjlb8r2xDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCuXfAkB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCuXfAkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC741F00ADB
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296709;
	bh=9E+BMzfZUVu65yt/BRBpUoOTZX7tfdy7JNdw1kjEZcg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QCuXfAkBMq+R1I4qKbsD+nR3FK21xgzwmHYVpShSzjhNEBh0axfjK14FxE/h/ZI5i
	 QohBXR2nPYHHoAuK7PIWgMMl1HNpwoWhlmAYtSYiUwvWHQT7JKrmE3rWM5XYcQk800
	 WgmD+ZEHeFCBmmNy81za9s+rySMQykH396nwKCNsw3lTnI5WhenPiTiHGt79pAVSbA
	 IXZRQPsAqeOHbFp29MtCqTHiWyFEYy8U5ZDkRbD6fu/GMzM/BfV405CXHVEa8MbJR2
	 nbB2OV2mo/CkwH9BsXzki2YeGUfcWZEPBKfGc6bV50jT3yjtgLkBhYICVrnQZ2Kk1J
	 XGPWknmCT1+Uw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aea0fff535so5089745e87.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:58:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoxxbwFUsi2Dn1GRMPFrlijNejUo7BftRcvmVVKf7iSZ6sPiAXHSou2Hj1QL+NV0wOSUBuVG3zcb1qV@vger.kernel.org
X-Gm-Message-State: AOJu0YwdW5GFDlCzAF8RnA49UMmq+4RWjnpOlf2yQEXak7+KKQiaQyf4
	BM58+2CM0VoZwpEu1xhdjM+kmIbD7AaOWKkGFHT2MYIYEw3Lcso2JKBGQhmP80oQBsi14U84vYA
	NVUDqq53o209kUAZQmIT9ueQAcRfIVRHNMW3YJDJLgg==
X-Received: by 2002:a05:6512:65:b0:5b0:cce:d9e9 with SMTP id
 2adb3069b0e04-5b28f874d01mr476963e87.19.1784296708587; Fri, 17 Jul 2026
 06:58:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 06:58:27 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 06:58:27 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <b522c9b4-4944-4fb2-94f9-bd2553690901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-7-shengchao.guo@oss.qualcomm.com> <b522c9b4-4944-4fb2-94f9-bd2553690901@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 06:58:27 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me-t1EWa+ACmaUdtzRTCVEH97ONtbnF2vGZBX_u8k9OwA@mail.gmail.com>
X-Gm-Features: AUfX_mzSA_kwBtc7KtkCfI0ZwiKvjN0AgLB3g6Bf9PkLji-sDT7coShxTHPluvA
Message-ID: <CAMRc=Me-t1EWa+ACmaUdtzRTCVEH97ONtbnF2vGZBX_u8k9OwA@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: Add device tree for Nord RRD board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 19:17:14 +0200, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> said:
> On 7/16/26 4:26 PM, Shawn Guo wrote:
>> Add initial device tree for the Qualcomm Dragonwing IQ10 RRD (Robotics
>> Reference Design) board, which is built on Nord Embedded variant. Enable
>> the debug UART, UFS storage, PMICs, I2C and SPI.
>>
>> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> ---
>
> [...]
>
>> +	/* PMIC A - Kobra_MM (PMM8650AU) - SID 0x0, Bus E0 */
>
> This comment is very useful
>
>> +	regulators-0 {
>> +		compatible = "qcom,pmm8654au-rpmh-regulators";
>> +		qcom,pmic-id = "A_E0";
>> +
>> +		/* LDO Regulators */
>
> This is much less so
>
> [...]
>
>> +		vreg_l7a_1p2: ldo7 {
>> +			regulator-name = "vreg_l7a_1p2";
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-always-on;
>> +			regulator-boot-on;
>> +			regulator-allow-set-load;
>
> You made a lot of the regulators always-/boot-on - are you sure about
> each one of them?
>

I double checked and for vreg_l3e_1p8 and vreg_l2i_1p2 we can drop the flags.
The first one feeds the efuse, the second UFS. The rest is fine.

Bart
