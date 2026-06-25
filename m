Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009123C2BA4;
	Thu, 25 Jun 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782382081; cv=none; b=KQnyaAJ1UGzxe2eBf1K7hkPy3NlG8Ahd8HRWa9ZoH14Y7GBzm0PYEDVjqlAEhRRacMypmGjreQXKVTVwB0FGZZNwwPsyBCEwyTuNYlP6M8gDGvGxN9fdT07n1y6D/iavhpKt0x7bVh5uRYCHfuro0k8ZibBLP3YAxkzzZ/Qfa2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782382081; c=relaxed/simple;
	bh=/x5vPcVbEDVbWpYceq7G6YXF7LV0p0ay9Am6DsuMiC0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgpuJ/1Bgl/U/ZQCUXndCLnu9t45I1Pl0gwbneCGohosIOQYqq73Dyo5b5YYIUtfxSfYWobEcBKRloJSotwhfLaUNCvos+D9srQCLcH3ftcZHlESlvW33oXHBMLYsHXWxbSFaY7zFoaSGlRG2gcEtm7QBzh+WmLmPTqL8sCXXPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QxKVpGoq; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QxKVpGoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782382069; bh=gKmR1ktISnS+36u8TJ0Y/fYeX66Qs8qM6rnS5f30X7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QxKVpGoqeU+uDjkHrNq9XAZnaYD3FA5GeUWV7WIWIoO2mPHnSD0XRQtcPqKZfyO8s
	 LRNNeoXt82Py3WH9kVFbrOMB7XQENJStgHJc6C/2XCj6FAKN7aQ5l6EQNKkX0BIV6t
	 59LLQDIpVqFu+mXweK5wfThk1F100/3VwAn5uNWQ=
Received: from 8qyomHQF3vPjMe ([210.21.239.182])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 1EF3BA36; Thu, 25 Jun 2026 18:07:47 +0800
X-QQ-mid: xmsmtpt1782382067t739exsp5
Message-ID: <tencent_FDB3230286DF272D5C2BD1292C7DA434D108@qq.com>
X-QQ-XMAILINFO: MLINc68tus9/RN3Od0qsMGn0DRCFxLqt4u1ebLWztbj+a1P+N/ONJNlkYeFOy4
	 +wgTuuipPlGFBmmMsiqFweXLC8j2hSWa+DpRuEQmx863xjR/UNUxxQNlErMbJ5K7V/yNSQerQ0vc
	 lRGnnbryDr54e09MqzGH4iI8ckL2BWnzHZqODdwgIL45nrJugTZUoeiHyreFIzOuS+KlKRylb7Gm
	 6eSHOYyWLf+tEL43cXWHpp3VonsOjqq1Xsm+Q85pFxK+dycm4E2qpblxa0hcK91eoO8oUkV94ze+
	 zM5XHlMKvRvSYmBla5temHgKY65iyf+4jgSTGFXKuTnj43Ex7YTMHM5DxKlZLMid6Oj0Jpkqv8cs
	 jbj7NMDBCyd6EkhABlpJb/NgZYtpC/XeM31dn+ZwNokSRDYCd4vlvfQqiuSsD4cSOpP3Rk/ZwU7M
	 Wv3Yvnf5TcjDCzI3iqx0oB30wtxPK34Z00+oD4chNIjR9AaLypKNlq6T4BwwR0LDm3xWSchnfbyw
	 WFYUFb/G0gCOIY+yNHuObuJH1vavqaF5BWgU64XMPNxLvsjNtE7rCRw9IPKfCF2tBmVhibg3pikN
	 p+OnqrM9nz1hCZmSjc4nyClzmO6vbtumpn+uiZIDVFf4xYE+oJmy7gtfusZObWpDtoWAl++3vkIJ
	 GfxoGR6EkW6sSR8ZHG9Be5jAOs2vZeUFAl/oZ1chKkMQ8tOeFrQRaNtH0X06fcKgDmuDfRW0/rFP
	 d0PzlJyjFiCyzv7qVwwoRLMKwLQNdJBxZQFh/FFspYR9nwMM2aSpy6jZEKy63tch8xUmGTcKC2H/
	 PnVcUJpY7n4cPl4HgcaN9hdqkHjFxTe+8BcS3posdnTmcn26lnGURc6tApNcvxV4AYHSw56YcjAl
	 +zuLNydN/M3LRg0AHNLTyFHC87z+qWLTzoy4/KAMSpoE5NtJX0XE+oPrNoin1QveZCC5QofZmK7A
	 lQRqUPGbO7LdPloSO9Lh6xHLMACM1hzUaLRMATrR3W/Wbss8Ldc8SEmgKWYdGdL58PhXJO7OTe7y
	 4En7GGLeUlqPnNZ0mSNPqeYrkmEjBd0Zak/AnYgNyaZWMnZCNjgMCZZn2q/RVwIPLtitygx5uIHH
	 8fDjh9QS9sY9BKC8MNO/WBTCH9lA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xxsemail@qq.com
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008 PMIC
Date: Thu, 25 Jun 2026 18:07:44 +0800
X-OQ-MSGID: <20260625100747.9014-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <891015c8-68df-4654-b1e7-94d73e74267c@oss.qualcomm.com>
References: <891015c8-68df-4654-b1e7-94d73e74267c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2026-06-24 at 13:00 +0200, Konrad Dybcio wrote:
> On 6/22/26 8:07 PM, Xin Xu wrote:
> > On Mon, 2026-06-22 at 13:40 +0200, Konrad Dybcio wrote:
> > > On 6/19/26 6:07 PM, Xin Xu wrote:
> > > > Add the pm8008 PMIC node on i2c15 with seven LDOs,
> > > > using GPIO84 as interrupt and GPIO76 as reset.
> > > > 
> > > > Signed-off-by: Xin Xu <xxsemail@qq.com>
> > > > ---
> 
> [...]
> 
> > > > +	pm8008_default: pm8008-default-state {
> > > > +		int-pins {
> > > > +			pins = "gpio84";
> > > > +			function = "gpio";
> > > > +			bias-disable;
> > > > +			drive-strength = <2>;
> > > > +			input-enable;
> > > > +		};
> > > > +
> > > > +		reset-pins {
> > > > +			pins = "gpio76";
> > > > +			function = "gpio";
> > > > +			bias-pull-up;
> > > > +			drive-strength = <2>;
> > > > +			output-high;
> > > 
> > > Drop output-high, the driver will take care of setting the output
> > > state
> > > 
> > > Konrad
> > 
> > Thank you for your review!
> > 
> > I will fix the coding style issues (blank line before status,
> > interrupts-extended, property order, and dropping output-high)
> > in the next version.
> > 
> > I have verified all LDO voltages against the downstream device
> > tree:
> > https://github.com/MiCode/kernel_devicetree/tree/elish-r-oss/
> > The definitions can be found around lines 209–244 in
> > qcom/elish-sm8250-camera-board.dtsi
> 
> Thanks. It's best if you grab the DTB from a running device (which
> has all the overlays applied etc.), which you can grab from
> /sys/firmware/fdt
> 
> You can then pass that to DTC directly
> 
> Konrad

For additional verification, I have extracted the device tree from
/sys/firmware/fdt on a running device. The voltage values match the
ones in my patch exactly. Below is the relevant pm8008 regulator
portion:

qcom,pm8008-regulator {
	compatible = "qcom,pm8008-regulator";
	pm8008_en-supply = <0x708>;
	qcom,enable-ocp-broadcast;
	vdd_l1_l2-supply = <0xad>;
	vdd_l3_l4-supply = <0x2cf>;
	phandle = <0x7e6>;

	qcom,pm8008-l1@4000 {
		reg = <0x4000>;
		regulator-name = "pm8008_l1";
		regulator-min-microvolt = <0x124f80>; /* 1200000 */
		regulator-max-microvolt = <0x124f80>; /* 1200000 */
		qcom,min-dropout-voltage = <0x186a0>; /* 100000 */
		qcom,hpm-min-load = <0x00>;
		phandle = <0x71c>;
	};

	qcom,pm8008-l2@4100 {
		reg = <0x4100>;
		regulator-name = "pm8008_l2";
		regulator-min-microvolt = <0x124f80>; /* 1200000 */
		regulator-max-microvolt = <0x124f80>; /* 1200000 */
		qcom,min-dropout-voltage = <0x186a0>; /* 100000 */
		qcom,hpm-min-load = <0x00>;
		phandle = <0x713>;
	};

	qcom,pm8008-l3@4200 {
		reg = <0x4200>;
		regulator-name = "pm8008_l3";
		regulator-min-microvolt = <0x2ab980>; /* 2800000 */
		regulator-max-microvolt = <0x2ab980>; /* 2800000 */
		qcom,min-dropout-voltage = <0x30d40>; /* 200000 */
		qcom,hpm-min-load = <0x00>;
		phandle = <0x714>;
	};

	qcom,pm8008-l4@4300 {
		reg = <0x4300>;
		regulator-name = "pm8008_l4";
		regulator-min-microvolt = <0x2ab980>; /* 2800000 */
		regulator-max-microvolt = <0x2ab980>; /* 2800000 */
		qcom,min-dropout-voltage = <0x30d40>; /* 200000 */
		qcom,hpm-min-load = <0x00>;
		phandle = <0x70e>;
	};

	qcom,pm8008-l5@4400 {
		reg = <0x4400>;
		regulator-name = "pm8008_l5";
		regulator-min-microvolt = <0x2ab980>; /* 2800000 */
		regulator-max-microvolt = <0x2ab980>; /* 2800000 */
		qcom,min-dropout-voltage = <0x493e0>; /* 300000 */
		qcom,hpm-min-load = <0x00>;
		phandle = <0x71b>;
	};

	qcom,pm8008-l6@4400 {
		reg = <0x4500>;
		regulator-name = "pm8008_l6";
		regulator-min-microvolt = <0x1b7740>; /* 1800000 */
		regulator-max-microvolt = <0x1b7740>; /* 1800000 */
		qcom,min-dropout-voltage = <0x493e0>; /* 300000 */
		qcom,hpm-min-load = <0x00>;
		phandle = <0x7e7>;
	};

	qcom,pm8008-l7@4400 {
		reg = <0x4600>;
		regulator-name = "pm8008_l7";
		regulator-min-microvolt = <0x2ab980>; /* 2800000 */
		regulator-max-microvolt = <0x2c4020>; /* 2900000 */
		qcom,min-dropout-voltage = <0x493e0>; /* 300000 */
		qcom,hpm-min-load = <0x00>;
		phandle = <0x712>;
	};
};

