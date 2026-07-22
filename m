Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC0B47D94F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714500; cv=none; b=lKpTqWZzMXyc5J/9svdu27hmYOzzfwPotdE1hkz+ZY78EGfYI5C1pXxgFpMR1xkotrodCqow9A8Pt/MW46bPsreHwML+lUImIwgh4BJjjnCy3yguRIw7IO5UsvB9F9OHRdKveft9pJ2mneg0U+YqgZdx8I5MHGCGzspEwVtuox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714500; c=relaxed/simple;
	bh=o0+tRGXRE9c/ofvDyjxsf0aS5Jk19HS0ChCpoqh6TR4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlU173y58lMwAst7/611qQG4mpyip0bSJgHh72ZyQjib/gQs7K7J/C1SmxftVi6KB97IRePUUNWtCuvW+up7Gy7a1TSA5x9xl46b0fW+qqLyWNws/zkRTjgEe7NDwPJl9PQYY1aqY9wRyZbADQbv9/RIL+BauaCJZNtcjsNu+Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmvu7cye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmvu7cye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150B31F01559
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784714495;
	bh=7egaasjyS8ZJi5/A+1wWirXvHFkWLfG+x6Fwihwtfek=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fmvu7cyex6PSZOKU92j1PBbDR9fWWe15jgJUpmG2UHufwrvwv+d/U+oGd4XWvgW/C
	 pbYo6eEbBoCaEAi0TC4VtOfc8Z1vzIHsHGbgJJtV+jUAi1ul3P65JlpNBWzwi4nLGs
	 WgreYoE0pE2QtPyJB/d12TMtcCgm+WqlGY+JvbcAkJC4KUNGFOHkUBKveMCVPkkTPH
	 lD5jLZcegvZT3ZPlM/SC6IYJWKBohzS57msKpnNRuT2/ou+V7jp0vUrqZPKzU0Hrh4
	 Hh5tFYIb7LG9teIbSvAsT/oLu4+C4YnkqrSGHoaMUJXZ/CoVfqbFyv8nj7uWxfN45I
	 5SOlhYBrSIQHg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so2730247e87.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrQDeIA8rDRgvfz9B/OXjzEEfhNMwFBpVUPTBFUBdTX5mqRrtE1zYuDVC9XCe58LM5RB9m02VfWup9w@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qB8FFWHH1o8oMA9xPMc6jZE7crH+tZTE/2G9o4dIQFqu5B1+
	wA4f9aY9h+eewWG2JotMb6dSmpGzvsWEyg3kJFLHrD1Zutzz5SPKXup+4WeKwVFHoZOkZ2A5vtI
	MgBSURjtKmQ6whqRgBO60U6K97AIz2HI2AL16xIi3kA==
X-Received: by 2002:a05:6512:4384:b0:5ae:cee7:52bf with SMTP id
 2adb3069b0e04-5b28f8615d2mr3888545e87.9.1784714493736; Wed, 22 Jul 2026
 03:01:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 03:01:32 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 03:01:32 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <c7f5d4cf-07ee-4716-bb8d-83bcd0b2f8d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
 <CAMRc=McxoC6711rmXmPb9t21bBsTeBMJ3ieZ1XhyTqMLaMS-4Q@mail.gmail.com> <c7f5d4cf-07ee-4716-bb8d-83bcd0b2f8d0@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 03:01:32 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdo=vEOUD0=U0dWu3ry7_ZqLaFz4Mwk_qv2viYQYNAq=g@mail.gmail.com>
X-Gm-Features: AUfX_mz_52H5aVX8o5s_GYgqmkBXwWl26GDtvaXPn6ge5d65lgGY7if6PzG_jAY
Message-ID: <CAMRc=Mdo=vEOUD0=U0dWu3ry7_ZqLaFz4Mwk_qv2viYQYNAq=g@mail.gmail.com>
Subject: Re: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD cells
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, mfd@lists.linux.dev, 
	Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Sebastian Reichel <sre@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jul 2026 14:48:46 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
>>
>>> +		struct device_node *named_np;
>>> +
>>> +		fwnode = device_get_named_child_node(parent, cell->named_fwnode);
>>> +		if (!fwnode) {
>>> +			ret = -ENODEV;
>>> +			goto fail_alias;
>>> +		}
>>> +
>>> +		named_np = to_of_node(fwnode);
>>> +		if (named_np) {
>>> +			ret = mfd_claim_of_node_to_dev(pdev, named_np);
>>> +			fwnode_handle_put(fwnode);
>>> +			if (ret == -EAGAIN)
>>> +				ret = -EBUSY;
>>> +			if (ret)
>>> +				goto fail_alias;
>>> +		} else {
>>> +			ret = mfd_claim_named_fwnode(pdev, fwnode);
>>> +			if (ret) {
>>> +				fwnode_handle_put(fwnode);
>>> +				if (ret == -EAGAIN)
>>> +					ret = -EBUSY;
>>> +				goto fail_alias;
>>> +			}
>>> +			device_set_node(&pdev->dev, fwnode);
>>> +			fwnode_handle_put(fwnode);
>>> +		}
>>
>> What is the reason to have this split into OF and fwnode functions? I don't
>> really see why you would need to do it twice, isn't fwnode sufficient for the
>> OF node case too?
>
> We do a duplicate check here before adding the named_fwnode and split it
> for two reasons:
> 1. of_node list pre-exists. We add a new list of fwnode. of_node based
> duplicate check go wrong, if its checked with the fwnode list.
> 2. of_node need to go to its respective list as fwnode list, release
> path, is different for us.
>

I see. This could use a unification to fwnodes as well but that's out of scope
for this series.

Bart
