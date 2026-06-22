Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7E92C326D;
	Mon, 22 Jun 2026 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782151713; cv=none; b=TLXKmacAxGMgfrc1A5Rl7kAe0SyebfRnDztjc7J0td+zM7jwP1oddPThZRI75T/yIZB4jD/q3CmxMVf5shtigfM2fbC2Wf4N4pKzrbr2KmUAOWc8KaXwASfXEWqb7T+QOLMqooIZ3v1MIIDUAc0KWzb27OGV2zwqSubm3XAn8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782151713; c=relaxed/simple;
	bh=vKQuxTTDXr4fBshLDM8MOsda3fpAmCbrfRlW5QsP4vU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JL57mbD11jMkdoyGv8aGSpS6fvSrKqrUDTwULeXo9Fc5NCv7tfHx3tM1uCU6Jh7GDzPq7eDPk/oh2+Jrm4wRNwRfX6ZVMnlKD5340QHalg3DBNZhjITvmWQOje+aHRH1RLAai1UJqcNZBTCsT6KpVWQg538wYZZMVE2RWNOieQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=f/ADz9UY; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="f/ADz9UY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782151704; bh=Bj3FnbmsaU1YbPv0N4gfZNYVP3Xk8d42HiKQ/iCcIPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f/ADz9UYOiALoHCqpcWTvF3FYhUw3ZGomIiw60v40irse6oJruFaOY0XY48R1ZrJK
	 snb924xgZwm5a6RbtqcLdZwCDy2XdGUECghTumBdSZB1Shy03bjP5B8F343jr6aUOT
	 iqUjqtc8u1+1CdLYQQRSIefZa0KoX77KleW8VsT4=
Received: from 8qyomHQF3vPjMe ([163.125.200.111])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 21393A5F; Tue, 23 Jun 2026 02:08:19 +0800
X-QQ-mid: xmsmtpt1782151699thbzb44ph
Message-ID: <tencent_A1865527015C7AD1B52C56A46AD106234508@qq.com>
X-QQ-XMAILINFO: M+6QKz8nsrJQ5tzjx6479M1cqoQArySkm8k+p0FiCGIJKPyJaQ3EpRIc+sdjot
	 8KyembQJudHE4AZHmDehW5GdaSplxszXCbIlOQwL23njcsde1yk6DygrmNpJ4ap3EWMsJBliSh8i
	 xycwPXSxUzY9loadZ+pVoP8lvN8Yb1x4Y9h9DXg1DxsfRdknLC1sN3abcOY4VT3XxEu9exYprty7
	 sTahnHP78vzSsDqLQeH0WlrjdqdV8rUaRp0VlFTKLfYA8TL8qKifIIvehyUi+hSL/9Nz//lvQz2/
	 1HUMJLLBOeuG7jD3l2HavH77BxQNtG5SFg5L+yH4Coyw4A420CLq/6jL4XzWI8XDstdOUUcpcDgr
	 FrjxrxEJZbWSKIhrdapDNXSsIT9ZeHeZNWlkxrJdpMFfALXa9JizjFSDwETgkhoHeqGwMOKdcKm0
	 EJx8QL0dQ8/kzymK4AC9gIUcMxq4uIFKz0iIXOln53LZvD4nshOfAfBwbhjn1z09WB6szzrHU1dO
	 LXPW//gSYFwH3ZqsOYWapNwRXHFlgL+X1b25KWeeOImTKESFnWAVNRw4cYd9r4MzXgMd64Xz8m/R
	 xNnZd4wXkhbJEI5vaAh+SAZgluyIJd8KnwzwLq27+R9J39FGBkxg0I4CqvcZSk4Ws34ROaEk3oT0
	 TrNZMqM0gawcMAsJVfe/6oDgTTE6ayKpvWhYIgNkVpa9BMpMDtcErTB82aD9TgLmRlj6O0jXdP17
	 1xCJ2s0T1xiQZIDnLARnAzbtw+8DljKAMHUaYpsG7VM8P6nadmGGrsAs9oodHLa5pgewjU463y/a
	 gPOqeonjSQv4Qxo0XDk365k+wBncjHeY0cU1It3Pc7Sxj1mb+Fals1TS7cxtIiE5px4RRWTFNKgt
	 SdFGWrReND9P8b0X4irBCoKc15B3GqbzAW/ie4aOxhaC9NFT2pC38DaCUfvdk9XzJPPAOnMkKfGo
	 z63Zy6XCT4eEYN2SkKEucckGCg3EW0el4+jjNyQFNZCqmvu9XIskujfnGASKr4zGq5aLxKUWO5iC
	 nQag1WJtnd5o3+bKErdXXneXSKxyBL6JkzGIoMJxKHqqIBlKdYePSnYKTJpaaO7LYtdrhvanjZVp
	 wDqpUe3v4/AT43FcM=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xxsemail@qq.com
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008 PMIC
Date: Tue, 23 Jun 2026 02:07:41 +0800
X-OQ-MSGID: <20260622180819.36760-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <f18194c2-01eb-43c0-8e40-5575deac9e84@oss.qualcomm.com>
References: <f18194c2-01eb-43c0-8e40-5575deac9e84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 2026-06-22 at 13:40 +0200, Konrad Dybcio wrote:
> On 6/19/26 6:07 PM, Xin Xu wrote:
> > Add the pm8008 PMIC node on i2c15 with seven LDOs,
> > using GPIO84 as interrupt and GPIO76 as reset.
> > 
> > Signed-off-by: Xin Xu <xxsemail@qq.com>
> > ---
> >  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 94
> > +++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-
> > common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-
> > common.dtsi
> > index 51b57c697a75..2687a2a8dda4 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> > @@ -599,6 +599,82 @@ fuel-gauge@55 {
> >  	};
> >  };
> >  
> > +&i2c15 {
> > +	clock-frequency = <400000>;
> > +	status = "okay";
> 
> nit: please add an \n before status
> 
> > +
> > +	pm8008: pmic@8 {
> > +		compatible = "qcom,pm8008";
> > +		reg = <0x8>;
> > +
> > +		interrupt-parent = <&tlmm>;
> > +		interrupts = <84 IRQ_TYPE_EDGE_RISING>;
> 
> interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_RISING>;
> 
> 
> > +		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
> > +
> > +		vdd-l1-l2-supply = <&vreg_s8c_1p35>;
> > +		vdd-l3-l4-supply = <&vreg_bob>;
> > +		vdd-l5-supply = <&vreg_bob>;
> > +		vdd-l6-supply = <&vreg_bob>;
> > +		vdd-l7-supply = <&vreg_bob>;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pm8008_default>;
> 
> property-n
> property-names
> 
> in this order, please
> 
> [...]
> 
> > +		regulators {
> > +			vreg_l1p: ldo1 {
> > +				regulator-name = "vreg_l1p";
> > +				regulator-min-microvolt =
> > <1152000>;
> > +				regulator-max-microvolt =
> > <1152000>;
> 
> Make sure you verified all of the voltage ranges vs downstream,
> as incorrect values may lead to hw damage
> 
> [...]
> 
> > +	pm8008_default: pm8008-default-state {
> > +		int-pins {
> > +			pins = "gpio84";
> > +			function = "gpio";
> > +			bias-disable;
> > +			drive-strength = <2>;
> > +			input-enable;
> > +		};
> > +
> > +		reset-pins {
> > +			pins = "gpio76";
> > +			function = "gpio";
> > +			bias-pull-up;
> > +			drive-strength = <2>;
> > +			output-high;
> 
> Drop output-high, the driver will take care of setting the output
> state
> 
> Konrad

Thank you for your review!

I will fix the coding style issues (blank line before status,
interrupts-extended, property order, and dropping output-high)
in the next version.

I have verified all LDO voltages against the downstream device tree:
https://github.com/MiCode/kernel_devicetree/tree/elish-r-oss/
The definitions can be found around lines 209–244 in
qcom/elish-sm8250-camera-board.dtsi

The voltage constraints for ldo1 and ldo2 were incorrect in my
previous patch; this will be corrected in v2.

Best regards,
Xin Xu

