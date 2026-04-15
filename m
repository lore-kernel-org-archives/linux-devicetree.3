Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22260201278
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 21:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776287108; cv=none; b=g5OBOs9Xmtckq4Pfo7Cu2dbtDbe1H/R+B+GYOm3UU22HLeJVas2GkYWdh2UkQy1u9z2yv1lTE26JP7xYU9QxOL11o0ULgtegooiOpJChZMKR2qX64Sy8mL7yV+sr6EUB3Sgi0nsUZAK5UmzRp5JVRnzoAQoRIrkobkD1ixD6DcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776287108; c=relaxed/simple;
	bh=xYle8OALelDvpnEKaAewXH1F9igqeAq6EIsjrDcymEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnbEaQziVzhLTU5xFDAwsT1Wtxx4Gge4G1SOPb5hdOcxiWRWQt690sTs7hKE+iKlDm+yQ65vro8LtUi712JUl6s5wvpEk0Omo+3s8LASkYYpjKeTmTtGTh8dLJGVNcOV13gr6CgGTqlQOiUIkzwznlrk7k8hlWq0kHueCJdOEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUiTObtd; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUiTObtd"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8a48deebe95so58873186d6.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 14:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776287104; x=1776891904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3h/QztRQ32hYvS/TluXhLyLjB2ztnFIYcWLAXwf6aE=;
        b=VUiTObtdbtuIVphLWg5yjP1AaYunCAFuScu/bBC/tt+OQc7zls7fKiV9D2LFerACIl
         MbjXFMzykJvffMHA+XOvp0HPgm4z2a87rjwjO5p6EXdDdMQGcwX3Y6ttRBED8TA38MCB
         DhYhTHBFrUfuRF+a0no1vPupv0Bq7/Z8MhmNeElMeuWia2MnsiumpDBg0Wv4/en7buP7
         Id2vNTwy8eG4oI5Sfntoa+Ze62D2RKDbF+wpg8nh4OoL9StzkDuNrdsOTcA6cZo0WWgv
         mh+b3Xb1jXmF51PLV1lthzqyviLvgv6CmpYy0MeDcIB51uvHr7Los/MR2eTDvwq3faHf
         fs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776287104; x=1776891904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3h/QztRQ32hYvS/TluXhLyLjB2ztnFIYcWLAXwf6aE=;
        b=nMqqbIaIfD0MJ9FXf75SRfST7PoxMFVcf6rX/LUa7L4G/jAmEIgVguuj6OhUP4WvTX
         +QQP6bDlySWjF7nE3kFS1AeQOelodXGAauekae5doU+fOt1wCAu+dW9ZD88GaliGi4Ef
         DxSf6/djDQHj4fMg7yXnHEqVHFJK91aGzkdo+LSDdnYDqC691wYHsWoWadKqQQJ41G9U
         gtqaMWMUqkjZH16NbHwBy7no6dz/0cLoGJi9ZBdxmEBsiV8ZaMeF7JIzLngCQefEliVj
         FFYeuU0osfDUNPoQPr3ED8L0Q7wDH6vMvIJ3qtYpPQ6xhmuFP4A6ZvPARx9KCjTvmPmt
         +HwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qQxd9Eq2pqvPsEkcPfeXpg7xG9+rIhEaCsR9hqSEw7bAQIgbumuGMRn1YxLH8hzS/3Du9nWhQuovm@vger.kernel.org
X-Gm-Message-State: AOJu0YxmW9AcJtSscTdZHTqXda5UX2Ea1WldeN2z4eELeZ0PwCzfOL4N
	rNDDDd4qRknlF0Mrc7PaRhPLenTi8dZ8tLrrQulyFJChUmQjkVjrIcQt
X-Gm-Gg: AeBDieveuUPE5Q4XaxRdiG8zRewY2TulKdO3RXbWNLRjgQyyXAFf/QigAQvfNtZxTU/
	c8UZbsOleu0sinv8pwC5nXJsGYfYxxxCijdRQbBLkK3qpY0wqU4wtNd0e5eS+01ypnGENCC0zyN
	jOCD8hJK03WfSluvV04n+UospPQCWTjePhV5c4yb9K8x/m0emyx11Y2CszudORt80z5W0SG0hcf
	5Li/x0yuMgWGwOGwI25cvUycgRQaWrUPBOeLiSnKZuXf95h9E13T8tOMBD2Fkz20/+4/mYDVcmy
	53R4Z/vY62KRxfAjYxeM+QJNBaJLHdlPYrRicP2XtxxVQJ6+eGr44ysi4rmP1PG2fN7EAbphmys
	IECtikfdsX7C6Oz6Ict4GN5Ldzl+Q/5ss+g7hQGPc9yHyENX1Ve+P7sE7Bpc0G8xzLYA07m7E27
	OwmT93TFaJL/afxToc5z197RgP6A==
X-Received: by 2002:a05:6214:810c:b0:8a5:fcce:1da5 with SMTP id 6a1803df08f44-8ac861567e3mr324194876d6.10.1776287103955;
        Wed, 15 Apr 2026 14:05:03 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6cb9eb87sm19935686d6.32.2026.04.15.14.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 14:05:03 -0700 (PDT)
Date: Wed, 15 Apr 2026 17:05:44 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm660: add thermal monitor
Message-ID: <ad_9qM6JjizihQwY@rdacayan>
References: <20260210021819.12673-1-mailingradian@gmail.com>
 <20260210021819.12673-4-mailingradian@gmail.com>
 <e72ede03-94cb-45c3-95e7-63dff0ca3888@oss.qualcomm.com>
 <aaXKyIJQA9SFqt41@rdacayan>
 <4311c618-f084-44c5-86e2-7f97661d887b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4311c618-f084-44c5-86e2-7f97661d887b@oss.qualcomm.com>

On Wed, Apr 15, 2026 at 11:15:57AM +0200, Konrad Dybcio wrote:
> On 3/3/26 3:25 AM, Richard Acayan wrote:
> > On Tue, Feb 10, 2026 at 10:59:20AM +0100, Konrad Dybcio wrote:
> >> On 2/10/26 3:18 AM, Richard Acayan wrote:
> >>> The thermal monitor is used to monitor arbitrary ADC-based thermal
> >>> sensors. It is suitable for use in thermal zones. Add support for it in
> >>> PM660.
> >>>
> >>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/pm660.dtsi | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
> >>> index 156b2ddff0dc..7cedf6980b34 100644
> >>> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> >>> @@ -197,6 +197,16 @@ channel@85 {
> >>>  			};
> >>>  		};
> >>>  
> >>> +		pm660_adc_tm: adc-tm@3400 {
> >>> +			compatible = "qcom,spmi-adc-tm-hc";
> >>> +			reg = <0x3400>;
> >>> +			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
> >>> +			#thermal-sensor-cells = <1>;
> >>> +			#address-cells = <1>;
> >>> +			#size-cells = <0>;
> >>> +			status = "disabled";
> >>
> >> Can we enable it by default?
> > 
> > This is for the ADC thermal monitor, and not the ADC itself. I don't see
> > the need to allocate channels just so this can be enabled by default,
> > since the thermal monitor's purpose is mostly to send interrupts when
> > the ADC values go above or below a certain threshold.
> 
> Sorry, this fell through the cracks
> 
> I see your argument, but at the same time, there are channels that are
> always present (e.g. VPH_PWR) and any way to reduce the boilerplate is
> welcome

If you saw my first sentence in the reply, why are we talking about
VPH_PWR? I don't understand if you're asking for the thermal monitor to
handle a voltage sensor here.
