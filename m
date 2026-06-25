Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A341E3D410C;
	Thu, 25 Jun 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383888; cv=none; b=t5lLurOVL/pwuyK0fDsuPwaOVRXe4uK7rp8hG90jin6WwFMc6XwuhXgaj+feYTZbcgCSmbPQgprmqMgqdLDk0+mXw4eB3sCb1dhlA+vSzGxWELwXk4DUq51mgsE9c1Ec9nT05aKRZ/zLL+MDfjb7/okUY2+9XlzkvBrkl7OXsiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383888; c=relaxed/simple;
	bh=a2QTkzuHoDXfRxw0FlImHYz/XP+w8jcCW3mar5BLa5o=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYwQbN9ZGm36//wQ2x4ZZudKZKUZu9flLFAb1DpLf58LQTYgmEa+tdgj+vCEiYY28qRHkNf7nQyArdiTjXRpCW8vEAAcdpZiSLIAs9fF10ifHsHOaPIFeakKSSmm417LNXEbMo+GFdsSjgNB/jw0Yax0Gut11YLEwlJOiJTKIcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=RdyU51P9; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="RdyU51P9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782383882; bh=AYK2nRgbZ0vvoP4YgW8c11ulmUIukr6GCr8ayhnm35s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RdyU51P9Vg5GZesed/HwefDdMrrQb2KKcUM908DS87Cjrct8UA00HLBhcjVlz/0eN
	 yOAP5MEigogw2ex2PO/dp93KukaD1beM6cy0dtH63TjZA+PJVV/IeIPj+pwuwjkMvl
	 HqdN8pcI6iZ2UXLcOElqYyRkIX9CbptMMScHCGdQ=
Received: from 8qyomHQF3vPjMe ([163.125.234.242])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 97B2B88D; Thu, 25 Jun 2026 18:37:59 +0800
X-QQ-mid: xmsmtpt1782383879tsqw8xsee
Message-ID: <tencent_ADA397470A0C934EDAB952A25F5892483509@qq.com>
X-QQ-XMAILINFO: N3YWsCmXnIXT/Px2lqrWfg8edIbjYEnGj7hrzG4RVk3cwFInG3tAAcvETZIna3
	 J/3zISCxJs90JJ4bBfH6HtEGDCIHXFtAh5ZKO23jwbNzqNY5GsgCbfYH1BVZs1krHDJuGZI5cjtq
	 ydI7tyf1+qS5aR2HeG7UCXnzg8hamsB+8bbMPh9oL61f3lJdlLxpFmhl8dHb/ERux0gHXeWVxbzC
	 JqKndiO/2lxvqKW6+rnbVNsdxiFrrgaP+02wwcMnKFhzIkTzbJ3QcFd0LXNAO2nW4/PsfcvZAAva
	 HEYgEE/2GtyyjQ01gUzsqpGfGoiCxTIwT0ptz/Ke5O9oIjYXJfW9J63drY0uaoI7uyiYcHKXNNqU
	 GDtiIkeJgeoKiNz0FwLSFW4yMmDiBLMDCFNYsttkYDICTu1QkUVuloUYtRAahYrO5VRj4rv3IiSl
	 u6CEORAaLIoMwMKCJkjHBTb6mWyjKI/bj2kJuz3JTV1ctkcWJguIWtHK1E6xGRaAlAH8FA70LNN2
	 RB9BKT1Tl8UDQO91hjnF2ud4M6TCTXW6fOS8oweDFNKzI8aqPKFaYrilgFbt8AuxNeYrx9svtSZJ
	 BAEAHKlD17cAjTuo2gy7yDiTVcGj9+86kg9Jr5JMIIgzc06anb3qqq3VKOO3Te3PP4cENZQzGHzc
	 aWlclHih6KiuHMKtwt52mEFzs2buRLAA4z1yDT20FhM7NKCS0P+3ubOV21rOMYT5bc8wM15dlZqY
	 k3iEESff4wOi8oUL8py21ORFYqpJSlupNUuSbXwEq9ULy4GqlanUOFk2oAtJX+ANqY90cyPcN3Oi
	 hjBRyIrX44DGn8Tpl7ygFM2p0hq1ZjfPHWq6ZLDcoxNlFOWIgerGU+uiml5IsbqFCUn6qNTS+/0o
	 c6vIOD+rq86i6fqTM0j9F/RDJZo70E51OQ0V1z2NVXN8OcN1RbPHAYzANfSQ16McI/V6FzsmXt6b
	 +0WwMayx4F2Fux0V1MpEK8KvC4Seobl6Ez+rzUk1Iv7En6h32ThDRf1nJ06nfCPow6ZH7tdjWA+w
	 7p2ZdD8vPx+VzDs3MxhYPbyMwEXdBPJEapXatkR1g6icZPgz8VgPPbEPG4O31NcXWo2DhLV8hIzO
	 9d5I1e8huRB5uBN0TYpJuMg6P4IS2bk4d+guc2
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xxsemail@qq.com
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008 PMIC
Date: Thu, 25 Jun 2026 18:37:52 +0800
X-OQ-MSGID: <20260625103759.12666-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <07fd4bcb-f55f-4856-9b93-7f4569a27b7f@oss.qualcomm.com>
References: <07fd4bcb-f55f-4856-9b93-7f4569a27b7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2026-06-24 at 13:57 +0200, Konrad Dybcio wrote:
> On 6/22/26 8:46 PM, Xin Xu wrote:
> > Add the pm8008 PMIC node on i2c15 with seven LDOs,
> > using GPIO84 as interrupt and GPIO76 as reset.
> > 
> > Signed-off-by: Xin Xu <xxsemail@qq.com>
> > ---
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
> 
> nit: bias properties after drive-strength (I now noticed that 8250
> dtsi
> has it ""wrong"", we'll mass-touch it up once we have a tool for
> that..
> sorry for the trouble)
> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

On Wed, 2026-06-24 at 14:00 +0200, Konrad Dybcio wrote:
> On 6/22/26 8:46 PM, Xin Xu wrote:
> > Add the pm8008 PMIC node on i2c15 with seven LDOs,
> > using GPIO84 as interrupt and GPIO76 as reset.
> > 
> > Signed-off-by: Xin Xu <xxsemail@qq.com>
> > ---
> 
> [...]
> 
> 
> > +	pm8008_default: pm8008-default-state {
> > +		int-pins {
> > +			pins = "gpio84";
> > +			function = "gpio";
> > +			bias-disable;
> > +			drive-strength = <2>;
> > +			input-enable;
> > +		};
> 
> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pinctrl@f100000
> (qcom,sm8250-pinctrl): pm8008-default-state: 'oneOf' conditional
> failed, one must be fixed:
>         'function' is a required property
>         'pins' is a required property
>         Unevaluated properties are not allowed ('int-pins', 'reset-
> pins' were unexpected)
>         False schema does not allow True
>         from schema $id:
> http://devicetree.org/schemas/pinctrl/qcom,sm8250-pinctrl.yaml
> 
> Please drop input-enable, it's not a thing on TLMM pins
> 
> Konrad

Thank you for the review and the Reviewed-by tag!

I will fix these coding style issues (splitting the pinctrl nodes,
dropping input-enable, and reordering the bias properties) in the next
version.

Best regards,
Xin Xu

