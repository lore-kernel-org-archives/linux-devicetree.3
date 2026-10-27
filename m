Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118325;
	b=DHT2ltnxu+eD1yAmKsEXzXbZ5ew3yEiMjyyht2q+/e4HsU0RcpdUXmmI4c33+YQCvK2y
	 qAewQSzXcsjC4SjbMWJuwOqlPASwMRXH1vB9EvjB8kOdPvaQTTmsa0H3wkR8YldZ6aX/T
	 oJzAoKUn4OIQKNB8cjuQkEXxWnS3ADOL1zFBg7CJq2HQ5m5sURlDfW6zfmCGpNSFmRDd5
	 KmAA4xXUpjSEz5WXMItSkghSZYcSkEe3jJpJZi+RfB1GkTPb4OWvOtHn0l+5ggE6IkSJI
	 uzZd/tmOhJWAvrLfbH6Wjl/1hKji3afAl44dfOuWjZtekS7Pe6IbjJUZ0rEEqEgn8KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=/kfeTwXgqCxPdS8Y/UTZ2+F+St1gnOqgFCGoK1yJzcU=;
	b=YyD/ye8C1wx3auEZHaqQ1ALAzvbDe3RjxktPIFsDQ2X62zROj3CHCI4913/nNEMD9mRR
	 T/lSjLoK0GmZ8eapUOa0yf/oOUmk4gXiiUOThiMkJGAsuAHKWp0Kybjb5Esr5uActEARn
	 rGuxN6rkJdknGI3t9zSAqruudeTNMnT1ooSinH5MxyarhlJt3ABA5yVnbGCB7cjWeRuRF
	 VG01/LoCfTciuB3zRSM3818yKxqeU6jRRxJIkyArTYdTXQMoT/Eyr0xOeH2qMd9nDTkEc
	 U6uImdRCrbMDyyUNa8haRRQFA7tyI+6yGWvE5zmhWLrmQy0B5Wdtnw8LFLr46+NDj/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IwAu8N4J;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E7606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 16:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 318E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IwAu8N4J
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso185455e9.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793118323; x=1793723123; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/kfeTwXgqCxPdS8Y/UTZ2+F+St1gnOqgFCGoK1yJzcU=;
        b=IwAu8N4JddNQd27xVH+MgObMXFu+x6visCB8Q3rvbBvd+jTxrIuaDydaWyA/a1+/3P
         VxxO98CMuvUBBmHXoYSUpPDR34n5dUFayARvwxZHVRNPHG5Orf16BOphQF+uorFdH9or
         9uracTP7gHgQJ8cSZyGqZpkLCBvcWOxHV6OPtg7jLcr4G4hvoKSbNHlPjYHbrFSCPn8G
         vpgOOLOGTd77c0PeNru6VyuH1Tpfd2srsJy57EjnEViF36/vWQW6k6c0D6bwTNO56zp8
         1SkOW3DA6ICz5T8kPSScHnuVF9ZWwa2OahYWU0+B5if4itSkkEamX+dd+fF4AVZvtlvP
         xSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118323; x=1793723123;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kfeTwXgqCxPdS8Y/UTZ2+F+St1gnOqgFCGoK1yJzcU=;
        b=mYMwWPDgzcIL4nMWiXrOR2TigtQk97qbSN/SgR8LOHl9D/SjXS60B5cB1YgQ5gMFSq
         CYultJtONTnZqaUyvYmN5YnV1HLwKYJtMwtF/ylCpaWUnO4y/FFAZCjLf6S5FkQtbDcV
         1PYzitua/sImFIlRn+qHJbYk/L6yddO5VBn8ngtUwu/FtInHMzs3gZxre5VWwNzBF9oh
         gJArVaPr4XAx2VcAK9QczL4Ac6CcgRUC+0nAnncYeqjQg1FYGAqyw/5D/JapVXesomKz
         tML9MSPxRKYkNGzMNBKgpvxAUHwS/sgVyIvvfyIwbamKyIHzC+nC0iQ5gctep6Gyuy1I
         YchQ==
X-Forwarded-Encrypted: i=1; AKwUvByrSZKQjL0+c+E/TK/KwUTgSl2sqijDOQsUGqUlYQmKDc70vqWIkBhq4dOUHoXjDYTuPVa+rcIeCE7/@vger.kernel.org
X-Gm-Message-State: AFq9FYKaw3bF/TmgpoehTNUfH1n+FMie92wgX0JvynqTaqMJY9TYczJp
	46sYUzO69L1tn/OkTSHg6TGZN0p4tb3cKT8M6FaoKmlOiOgzc40lqjaWmSbZPFiNVsk=
X-Gm-Gg: AYBFou1sCtk0IIAqUCKG/SmK0yLwwAYqRmIWJ82jdh2hKtd5uOBlH4i6G0M4WM9/j/q
	a5lmeOcv4fdlDe6aj8kq+YIsmBJIQoQbu6AYDmkwHoOaKptCR9mNnQw062gB2bD6+NlCSSqFRbL
	8QwkyXXJUk6JySQR4F+CjUFf18m39jWnaNXpJcWtICB08/Ir3716AqK1y9b8iWOZiC4jT2SbK3r
	YzGYVckjAkBZ2p8twCH5M2ji0ErqqU6BegRKsXOYdBYf9u+uF4zPQmnXp4sYshI4Cc2JocZutUj
	yRA3RNaOaBbLBHMNjPdJJQBvYXWIoIlsT1+8WdBMbX/pwLtU2WVmuyOJZP7AIZlkrDLd8oNQ/UD
	anPXJxJ+LKjkZav9hedjbKi+aEEQR4WEkZMq6zqGJuz+H643MgdCw+Td+fNohCx7D9blSgeMB3D
	XqzfPSS2fWoTFvKVCJsGnovCZsYwPQBX4I8Dov/7cstJfvuFfPNTI6a9wAYHPWcn85ddOSWkEJx
	Ncq9yQWPIXKHlSMCju+TCj8Yjo0tnjh8F7jOQ3hesqYjG+w4+UPhxpl/qgKUaeSgdSp0gyyksMa
	du0+8e66corw4M9TcgCxg2kwFc9c+PEEoYPaDaE6i0lXbsFhGFTqSQ2dST4zIBK82MN5
X-Received: by 2002:a05:600c:1909:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a35ac95fa0mr188333205e9.16.1793118322543;
        Tue, 27 Oct 2026 09:25:22 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a931232e6esm80005e9.13.2026.10.27.09.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:25:21 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 17:25:21 +0100
Message-Id: <DMFRE8PRV4MD.3DSSCQVOLZTIP@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1:
 Add PWM backlight
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: =?utf-8?q?S=C3=A9rgio_Ferreira?= <ferreira@se-rg.io>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linux Arm Msm"
 <linux-arm-msm@vger.kernel.org>, "Devicetree" <devicetree@vger.kernel.org>,
 "Linux Kernel" <linux-kernel@vger.kernel.org>, "Georg Gottleuber"
 <ggo@tuxedocomputers.com>, "Ettore Chimenti" <ek5.chimenti@gmail.com>,
 "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>, "Srinivas Kandagatla"
 <srini@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io> <DMEXOUF2X7O6.3W5B9URS8YOEF@linaro.org> <P4tSXlD--F-9@se-rg.io>
In-Reply-To: <P4tSXlD--F-9@se-rg.io>

Hi S=C3=A9rgio,

On Mon Oct 26, 2026 at 7:26 PM CET, S=C3=A9rgio Ferreira wrote:
> Hi Ettore,
>
> thanks for testing.
>
> No, i can not reproduce the value inversion. A brightness of 1 equals ver=
y dark while 4095 is maximum brightness. 0 is turning the screen off as exp=
ected.
>
> Here is my edid:
>
> ```
> edid-decode /sys/class/drm/card1-eDP-1/edid
> edid-decode (hex):
> ```
[...]

I have the same EDID so the panel is the same. I guess my unit has a
different circuit revision.=20

>
> I can confirm the PWM period value mapping is a bit off for the top-end v=
alues, though I haven't noticed that in day-to-day use.

I agree, not a big deal indeed, I see other laptops (e.g.
x1p42100-lenovo-thinkbook-16.dts) using the same range.

Tested-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Thanks,
Ettore
