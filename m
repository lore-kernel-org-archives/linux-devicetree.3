Received: from mta0.migadu.com (out-128.mta0.migadu.com [91.218.175.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87A12DAFDE
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 01:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789174855; cv=none; b=rjOPfvva+HGAds/t8g9TCwpWQjuS4rNmn8UJiO5AEszDdPOiAEthJnBdmFXy10vbtuBReRQ6fFUqo8YEFSGL8u9nVzAysKXKElwcsUYOPpOLBqxUGju0BbkogxTmHFcz3bWwU27L5SRydgqj9kA1H15vvZ5vHjYmzb5831VM4cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789174855; c=relaxed/simple;
	bh=jk8Y1OKbEqWlj0AgT45RSv9xPVBl7UcHySE9J9nq9+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMNzC+c0fHngH/8F4ISlvL7ASzAiw9ic1RE/SR9qPpRX7nZ2Lm0EW46alnrzGONuW1IAz4ucXWpJWyq5fQiXE+cuqQgC0NQWLYC9nkGTp+TFkQcSQ3hM+dlhwVYsEiQXIiYiusM+C/GxWWYk+jYuTpiXs6+OpBmEZ/IfKS3h/io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=vQIrkiXw; arc=none smtp.client-ip=91.218.175.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="vQIrkiXw"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jk8Y1OKbEqWlj0AgT45RSv9xPVBl7UcHySE9J9nq9+0=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789174851; v=1; x=1789779651;
 b=vQIrkiXwTuETeOzw1yGg84ykJ2Agku2YnJB0pynCtMt1iPLT0GacjyzIgJU/efSLl97WPd+N
 dYpweb6BeMVvcbJyFcp9BjMt2dy9cVy5Jmpartl8kZszfNb6KJI+vf4T2o4z7QN1ShacLg+g38V
 eywdr+hxhtqQsus/9wFpwxdAING8kHpmnwZPjN7mqkMrq9+a2XMxuzBOe+SB/jgWJNK1eqrl7rx
 koFfx2dBei+Z0V72K98fvXml6pHGOb74ibWzyx+25KtayO8zrY1GU+h4nSZTydlC9pajtR80TcO
 hhF9iNPGdxzAwzi3UFI8X782quMh90ucNKWuh4c9rB80w==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 77080e2825881367;
	Sat, 12 Sep 2026 01:00:41 +0000
X-Mizu-Trace-ID: 77080e2825881367
X-Migadu-Flow: FLOW_OUT
Message-ID: <0049ee8a-d9b2-4692-9494-5a8f054accaa@packett.cool>
Date: Fri, 11 Sep 2026 22:00:33 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Dell Inspiron 7441 AUO0BA4 panel backlight: PWM
 configuration
To: Avalon Vargas Centeno <avalon.vargas.centeno@est.una.ac.cr>,
 linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
 bryan.odonoghue@linaro.org
References: <CAGXpr54Bn9Wf24asY2RcXgBNLy1A16=U1mtFx7mKeNK4CCOCYQ@mail.gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <CAGXpr54Bn9Wf24asY2RcXgBNLy1A16=U1mtFx7mKeNK4CCOCYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/11/26 7:11 PM, Avalon Vargas Centeno wrote:
> Hello,
>
> On my Dell Inspiron 14 Plus 7441 (BIOS 2.16.0, aarch64 Linux 7.2.4,
> NixOS), the AUO B140QAX01.H / AUO0BA4 panel originally exposed an unusable
> dp_aux_backlight with max_brightness 0. GNOME could not adjust brightness.
>
> Panel DPCD bytes at 0x700-0x72f:
>
>    05 9b 91 00 00 00 00 00 00 00 00 00 00 00 00 00
>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    00 00 02 00 0a 04 0a 00 1b 00 0d 2f 03 ff ff 03
>
> The capability bits indicate PWM brightness setting rather than AUX
> brightness setting. Inspection of the local panel-edp and DP helper code
> suggests that this capability combination can leave the AUX backlight
> maximum at zero. This is a code-path inference, not a separately verified
> generic DRM driver bug.
> [..]

Weird. I know someone who has a B140QAX01.H in a 7445 (that's how I've 
added it to edp_panels) and they did not have that problem, aux 
backlight worked fine…

panel-edp does not seem to care about DPCD indicating PWM; if the 
brightness property is present in the device tree it *will* be used, and 
AUX is used as a fallback if the external DT-provided brightness was 
absent. If we really need to support this (without adding more 
devicetrees), I guess we could add some opt-in prefer-aux-brightness 
thing..

~val

