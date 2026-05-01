Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9353806A4
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627253; cv=none; b=ISm9xUFAEx1kbqI/55/wtrjiRjIraPsudED1jN13Zndl+OG3vFRlKUNA9/X6DCjIrg7lUaysKcLt0OkL281GpudcU6NtXhvH0+T76z0io76byD0n2A9vRftg35FX675ztt6J0epInVKBYKbfYI7bYscyeKO1ZQotRcc+HBdyFW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627253; c=relaxed/simple;
	bh=t3nxPYsn/+uIJrb9cvX2Su+SoURhZtwc/pGiLCniQoM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=h8k+aP2yarShGWc3o+UXLn04YcvAUtd7hQOd+1p51Ayh5kjF7hevmhcGYhmq0fy353xZmirrtevDhYJTig1d1ROu1KX7me4BUJ3wD45gngf0Z0cNFBSZh4KESUkkPUYZJKq7kPhbsKh57waAllDxGIgT15J1Ah/TBMpYIUhcjro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4cducM1g; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4cducM1g"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1589794f8f.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627250; x=1778232050; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bfYkGp++VX2XGf/8Df8kQnMjnWB1zask25dl4NteK4=;
        b=4cducM1goAgbmhRjB7BIeqVv4bhmvt/VGodszsfyXX9V+Y/WIx7CWBq3zq/e2LHY6v
         oyxMrxfTKFkxp3Df6OIh7TXYpy5bkqrY9bWuoRADiTOVWKfVLpOp2nlyWdVm/NilvQt/
         JeeHmwJiATC3bAGy/cvOYDsBxvMDA520LZnu3JNVxn3a7SZeB3zWHrgJFTgno9dL5XSq
         39dVjZ/mzBqa+w9vf2fSkgec+ROGW1wPzHu8COQdnu5tVXASYxMAdDQmucxVlXla+46w
         sd9xPL+p5rgFxJJZ2GuaYJlW0o5AzoTqx6A5qHlSh2qgcx7eO4vPrZfJ+AD33bB/taul
         ZG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627250; x=1778232050;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0bfYkGp++VX2XGf/8Df8kQnMjnWB1zask25dl4NteK4=;
        b=ByI4YXjlk9QfBnjFSA4pMsL7D26pPvoBike6I0D/8ArY4U3tFlu+tSP9GfqAfuVzZg
         Qm3DVVxyjrSRLS7TiFJm7qNwGh0JoWRUPmuCEWBdnEboDOVGweIdiY03zn0AIMavp7LK
         a8l1L3F+5hO28zWe8sWVSOgY42ng+9xVsE8+9Y+V22XYyABP6/i1AwFqwuGnEyq5QdTb
         G3yo6lx+p1I4It95zskWD2C8ClWxblGRpCu0oTSnh6QjB2qcRD7zfg8U6KKW+5NhwcKp
         41UXtI9xSsrN1ALd+hM8Zq7ZEupBYlLKRcqldvPk67f0L9RgDfJ9ANPMaAYLX4p3iO7t
         exMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rNG8A4pkSNfyrvCNczoaiRuWiyeZlF1nGDK5fdUz19CPfS3SVTwopzPAgKecyfAsmXORrGb26O3Qm@vger.kernel.org
X-Gm-Message-State: AOJu0YwyVLFP0jPd6DWJsfQg7oQSjBp9XSso4s0BacZDQR4pPdCypQgO
	ZaQLhBEfD2BxBY78Emtd68U5CK/z/c6k+vq+h4Z6yiGtTyK9Fg4LkMAtaDYYOjDpBmU=
X-Gm-Gg: AeBDieuxZFCWVl4+rD8XVwqpXAa7DOoctHP6BxdQ+BPI6A2shh3OUwzDhxHtdYk97XW
	4LzXZt2y58yp3vJ+8sEMp4UcjA4xnZeX07MxjnhednZOzOX/Su11JR7CQgt5rjAySiAObNAn5qA
	j3UIGO8oT7IYolXasZ35XDRefr8RJFtG1WMK6B9WJgH+eYkzlO0mocrANdun2zNyRE2gFMv3UVY
	6C1fRqlx/KlIY34/nusX4qe9JafI99r0CETGnYms0gMohW0Ryp5QmM7AE8iPuQR7DYu6ackhTPS
	c+MnYI4hnBcla+XcH65R0BrjBJRLlcyqonrs3B58AXHWvcIvcFBSKDRRpAPr5n3zBtOCBPMN/cz
	llFbe1hmblaoKsKwLzUDlh9UuWg9PHFUSJFzS9JCEEO90he16cWhA9DyoUKrXc1hMA0smcRXtUN
	lBqggYOzJaKJI2wGN37/xw8XurKIU/LCR1h0jC4sMuneeFAM1rZod7g041d0DsoOdf/32JKQKdn
	cLoqKo6Eg==
X-Received: by 2002:a05:6000:240c:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-44a857c10e8mr3084632f8f.6.1777627250496;
        Fri, 01 May 2026 02:20:50 -0700 (PDT)
Received: from localhost (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm3583191f8f.33.2026.05.01.02.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 02:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 11:20:47 +0200
Message-Id: <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Alexander Koskovich" <AKoskovich@pm.me>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "Marcel Holtmann" <marcel@holtmann.org>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>, "Balakrishna Godavarthi"
 <quic_bgodavar@quicinc.com>, "Rocky Liao" <quic_rjliao@quicinc.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, "Jeff Johnson"
 <jjohnson@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-bluetooth@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 WiFi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
 <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
 <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
In-Reply-To: <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>

Hi Konrad,

On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>> Configure and enable the WiFi node, and add the required pinctrl to
>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>
>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>> the missing pinctrl to make the WPSS stop crashing.
>>>
>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@f=
airphone.com/
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++=
++-
>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/ar=
m64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index db72418b7195..d8ac495ca7c8 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>> =20
>>>  		clocks =3D <&rpmhcc RPMH_RF_CLK1>;
>>> =20
>>> -		pinctrl-0 =3D <&bluetooth_enable_default>;
>>> +		pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_defau=
lt>;
>>>  		pinctrl-names =3D "default";
>>> =20
>>>  		regulators {
>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>  	qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
>>>  };
>>> =20
>>> +&pmk8550_gpios {
>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>> +		pins =3D "gpio5";
>>> +		function =3D "func1";
>>> +		input-disable;
>>> +		output-enable;
>>=20
>> Hmm, if it's a sleep_clk, should it not be handled via the power
>> sequencer?
>
> If you mean that it may be needed to toggle it with specific timings,
> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
> access to some docs that I think should have the answer, hopefully should
> get it soon.

Did you manage to get anything there yet?

Regards
Luca

> Or maybe +Jeff/Baochen could answer faster?
>
> Konrad

