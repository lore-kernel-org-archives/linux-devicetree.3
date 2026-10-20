Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500203;
	b=wJ+lH47LMmUS9W72g5H2m7ftpvDubVk/xY1kU95/MXIfbenkNCumpNIS/U0c6JxUVLYF
	 vxKYkuu6Ho4gE0ZaH66pU81G6sMftIOnvY6OM4IFXCNlOE1PFdVuvhAWRz+8SrVzsSheR
	 cgHI5STO05uZgoZkE+WjCc8M/Vnqp6Sbd9azm/zSCa7VEUkAhkoc2+hOWIrosIYBO+3+5
	 p1Dy8zLqyw1pDveXsV3QiB7G9HRHrEULzxrkumhm435picMxzjNeuFVG8opkVwvmq2U3l
	 il+q71+tK6w41EBE9eiLB6hdwdwKlPmmgLMdP6oHfAX7H5D4COV1gFN9H0pKHFeC3Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ADOCDelITMEX4p4h4TfmU1ayoJRVyWEUw/EIxGZkeis=;
	b=gS+kcVt8DZrrWY1nc/+Lauv0dD/CD4p2gxXXUBuTBwOUXfFnlI3HgkWGj4djdsht+UU/
	 cAbQA4/c71lVNvnkuQeqWX5JluKn7g+firNTZbErJIK5+4mxpxt3ydZ/4I/GLXUN5Qf1V
	 PdrHU3iimUjQost+bSSb9xsR7uysGxVcLi5S+yOunhSIGCKsBb8dslXY76vNQdWdFSoJn
	 Gi7JC1tyCylTms/nWSrdPXK7uBiHbEJEiv057gFi4kjC6xEy1XEwOsVud24wnamvOmDTJ
	 ErQAp13JRhMgS7OOKQNOYcTECTAiPDEe4vakBOXAE9zQiQCl624Vvj4AROvZyw+cXkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iBE7MP4L;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5B360A2604
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5B360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iBE7MP4L
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36681e85e87so589135eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500202; x=1793105002; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADOCDelITMEX4p4h4TfmU1ayoJRVyWEUw/EIxGZkeis=;
        b=iBE7MP4LiiXqwWMF8SJq2RfYIZ2T7MJv8zOoaiOFkLAV1WuVTpqMVKlupysFYR9agD
         JoIUmQsM2Wd+Jr1zPqhHEqXgvd8LIP0lBJOxxr0v3fo3flQ7529Ib/Xi4OR89hlo8lqf
         Dxd3GUFj1P5Ej+lsMC82WQKoc+HsZxvIpghogS7SsPkwm06fuPr5T8/Gm/N7/u4H8qCu
         qahCwD73SDmXZB+GPZ2IKk2ROTHCQL0k+Pyw+T3Mwnb3VB1aVYDmNAH1yAE2PBU7au5L
         ywiezeq5X35K+GTEhYn4Q+rUR8qPttM0Gogem86PxNmwgMQksM51g2JBijd5II/rMhB0
         edxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500202; x=1793105002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ADOCDelITMEX4p4h4TfmU1ayoJRVyWEUw/EIxGZkeis=;
        b=sKSrsR3r9AC/SEa8qrNp6ksXBYVALHuG5YDG010oCnyCfw546oLIAZFbyJwwtfZg1I
         rXEPehmzh+fkWiKN3BGjaMcZjihb8GeMFe3WmDFfJQIeY/09jxaLTXhJNi+iawjQGHaB
         NRT5emHCnKlaAHGkQjZucTr7kgcZkrAsUD+vqbVtiXrSC/9zbbsS7FQthYPDvtVd6PsA
         Gl5ISJx/LZWb+YSeWT6kwxLSWAcCyui9bZbLNEKczQVC+fMk78roP82qT3vNZby8N0Uw
         kype4CqtTfJDtv+VCJQHmmtevDkN3pRD1qbTsDUD50gmh1X790zdv1x0TRxc5n/MoCvX
         vnGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL3uZwXiLKufTQGkppplcUtsQQx8UDpcz/Lv/kdtxXwpmnufp5O9lm6UJT43Uq4qEIpUaS0QtPc7Lj@vger.kernel.org
X-Gm-Message-State: AFq9FYLnoT+lefX3fc2s+S2QbEz1HhOpqMlZGctAKpq3uEJgy0sJy5JX
	B2dwViJA1DuPvsjB5lvFu7jMpo2xUDz4jLtgKEGyo0LVOSTZpcj3U3jV
X-Gm-Gg: AYBFou1NX0mTuMO6MLHEeaDZFVY8VPIcmv+3wO/22XQ0ZaebSx03yJpb72nKWIasvF8
	nqei8GKc7dwPMqGKqgLpCAeMMqit11gt48MqyMB/4eFi0DZ820tXJEnw6Di7/tWmVzRFRhp7C5e
	+/DZAOhbkwIuY4qKajrPTORwrfhtqwSr2EjA1xCAuIIe4jxIZI35EsJmgZtun35CqFUPWvB97zF
	bTJkBTamncf7dSgY5wWv5YqKtEz2wTYSHl+xaQW3GCla2msWICeemHf+cvF8chSPz5LkoxUVbsb
	euoBZKffvlLy86x1QZjTVFt9wFiSMtEJ4/tjLmDn+bQIU5LJ+PJv5SUO+0+5hsfgKEtAu4JSgbX
	K3IrB/mISlpErOHlHoERjPNpEZjbMM5VplxYU0ujqzpZYysO4/P4Fa7ptLR6VjxsGLI9XQ+bgZ2
	3/9jLn4vbVunmA3eem4CoDhjKc/zjJPNiBS7F0uEyEqnnbeOFJ81bGnCAbsqWNdxbUoaf2GNcIJ
	u8H9uLNm2Svsb4dPGhvaD2hXcTcTPM82Mjc5P/iMhVcBTVmQOBhAGnweaThrMv8a+FbBVqN8vCj
	NTr8
X-Received: by 2002:a05:7300:de49:b0:35a:7020:c08a with SMTP id 5a478bee46e88-361a186094cmr14849051eec.19.1792500202072;
        Tue, 20 Oct 2026 05:43:22 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm40204577eec.18.2026.10.20.05.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:43:21 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Tue, 20 Oct 2026 09:43:07 -0300
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 07/10] iio: frequency: ad9910: support drctl control
Message-ID: <v5meo6y3jn6vcmv7kqtbqqv3bq36xb6pk2kysdwpwkfvixtqzl@rojpaxrte4sw>
References: <20261015-ad9910-backend-support-v1-0-3c21648c8e26@analog.com>
 <20261015-ad9910-backend-support-v1-7-3c21648c8e26@analog.com>
 <atdcOsaDbtaQJd-9@monoceros>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atdcOsaDbtaQJd-9@monoceros>

On 20/10/26 14:23, Uwe Kleine-König wrote:
> On Thu, Oct 15, 2026 at 01:49:47PM -0300, Rodrigo Alencar via B4 Relay wrote:
> > +static int ad9910_drctl_sync(struct ad9910_state *st)
> > +{
> > +	struct pwm_state state;
> > +	bool ndh, ndl;
> > +	int ret;
> > +
> > +	if (!st->drctl_pwm)
> > +		return 0;
> > +
> > +	ndh = FIELD_GET(AD9910_CFR2_DRG_NO_DWELL_HIGH_MSK,
> > +			st->reg[AD9910_REG_CFR2].val32);
> > +	ndl = FIELD_GET(AD9910_CFR2_DRG_NO_DWELL_LOW_MSK,
> > +			st->reg[AD9910_REG_CFR2].val32);
> > +
> > +	pwm_init_state(st->drctl_pwm, &state);
> > +
> > +	if (!ndh && ndl) {
> > +		state.duty_cycle = st->ramp_down_time_ns / 2;
> > +		state.period = st->ramp_down_time_ns;
> > +		state.polarity = PWM_POLARITY_INVERSED;
> > +	} else if (ndh && !ndl) {
> > +		state.duty_cycle = st->ramp_up_time_ns / 2;
> > +		state.period = st->ramp_up_time_ns;
> > +		state.polarity = PWM_POLARITY_NORMAL;
> > +	} else if (!ndh && !ndl) {
> > +		state.duty_cycle = st->ramp_up_time_ns;
> > +		state.period = st->ramp_up_time_ns + st->ramp_down_time_ns;
> > +		state.polarity = PWM_POLARITY_NORMAL;
> > +	} else {
> > +		state.duty_cycle = 0;
> > +		state.period = st->ramp_up_time_ns + st->ramp_down_time_ns;
> > +		state.polarity = PWM_POLARITY_NORMAL;
> > +	}
> > +
> > +	if (!state.period) {
> > +		pwm_disable(st->drctl_pwm);
> > +		return 0;
> > +	}
> > +
> > +	state.enabled = true;
> > +	ret = pwm_apply_might_sleep(st->drctl_pwm, &state);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = pwm_get_state_hw(st->drctl_pwm, &state);
> > +	if (ret)
> > +		return ret;
> 
> Does enabling the PWM have any side effects? Are you doing that only to
> be able to call pwm_get_state_hw() and thus find out what the resulting
> output looks like? In that case, pwm_round_waveform_might_sleep() might
> be your friend.

Thanks for pointing this out, will look into that.

> 
> > +
> > +	if (!ndh && ndl) {
> > +		st->ramp_down_time_ns = state.period;
> > +	} else if (ndh && !ndl) {
> > +		st->ramp_up_time_ns = state.period;
> > +	} else if (!ndh && !ndl) {
> > +		st->ramp_up_time_ns = state.duty_cycle;
> > +		st->ramp_down_time_ns = state.period - st->ramp_up_time_ns;
> > +	}
> 
> So the configuration depends on the previous state of the
> AD9910_REG_CFR2 register? That's a recipe for surprises?!

Expect not surprises. It depends on the current state of the
no-dwell modes, which defines bidirectional, ramp-up or
ramp-down behavior.

That is documented in a later patch. ad9910_drctl_sync() is
called when dwell_en or integration_time attributes are changed.

-- 
Kind regards,

Rodrigo Alencar
