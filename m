Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463996;
	b=v3GHI+/V2IiDo0vH/dcmGmD+A5dR0feW/fxNuvaRbRPBWhMRP1+CPy6bzZWP+fVOXC/d
	 MSLSSipT33elfYgIZqcgc22BSBku4CRednFlDBFROo56Jze303m40LoTILHOCtjgxAvAR
	 39m39TMrkR49HZ4Kk62QhZsavmvGjsbanlJP3sm1wwMo/FOV12mCimIQgvZI2MK39xZG2
	 0yLSJ9RqSJ0F6j9cv5FxfzZ7QefFJb7dk/cvgeSsyKM+5w1smupoyf2axmvSV6SpMNJDw
	 sxDw6nGg8bKv4FadHpEJ2m1jN/RjSuycY3keJOsdToyqoSdEbR4VDTwvsHfwNP76mAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
	b=O/nVbTVVe6vB5ahRkG+5gdOepDn3/aHM3A5EPlfU/z40D8Z9rPf6glmR05PelKqKEoRU
	 nivzARwzToQ0lrVJcJtffj0oM6gPb2d7xaVxBkQZcZdUx/ow1aB6Qbgc/m1zwDiXKJ8ZM
	 /YIlqTlDSWSRB8/zEp6hOysYBZKQXd7LC5milFeD9ZWEWQYalkXLNik40kERWiXbjPpLP
	 GYiQpFo/a6H4rCc1CMIE6PAeuLnyTniLDZno2Kbe7G438UCa48aMMOqkiAU9SQuRsLfPY
	 Cm8FvuUBrYofIttsnS1Y6kgUp6mES03NnnTs8alxag0nYUDKHmLKgneDiFnZ0aF9uKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFHeGqxX;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB5606A330
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ABB5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFHeGqxX
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so504924766b.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463994; x=1796068794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
        b=CFHeGqxXFkgbioxsx902NP4Q3FgTr+AgI6YI92t5flfnFbdo6XafKRV+quirlSXi+5
         yD8hVEGvro2b9ofUpHjLTq4sUhcrzTX9tc/OJyK4TPFKYFKr3UlsCMXqGo7lZJiFKKqZ
         vnqzwnkm/BCMhXu0WB96hjm+88ErR3E1PfbziBDjdTS+rCi/diFkrqxSBPJsN+znXLDY
         yqJ9vcDfcMNo6UWkiOWDoXDimVIL2I2Lt6bpHvip3j1h/KGqhMvu9/ci7Lz6WBUhSN8p
         s/MkpBa8/okjzYdWa7jwpUytJxLME15MOUjyBVGpvQQHUiA9nyf6X4v88+9QxVg3yYBN
         jnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463994; x=1796068794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
        b=spXZTxRYleArQBGsandS6rtZELwJY6ptpk0IIsuhHsZqxxJmAr/mVWQv4hvUK2w6PH
         KRG6TXBXeYG1wPam1HzVTYSnV+EGCZkbVa12HUavh3qPK6mstWz1DATKxTq2t9NS6mGk
         QwYXQIDBufozFm1KObibH/RSiv+vyRCUkA7Qkgqm/gQQpnpgr383fYGUOhD+H1Vj+hh+
         51WoOhlw+1XQQJGCwrbOjkU5xMnRKUca6xbcY3TkBjSR857Bk1jf+XJVSGg1oF5KKooA
         bYXi7mMqYhzCLQjsoGWCFLRbtGyV19rZ8RJ1MTlustLl22Ptv5WfGegflgMOFyUXDbu1
         NXZA==
X-Forwarded-Encrypted: i=1; AL+hErF3OkwRhUzyumyXIYVGZ5/aCcBEzVDIY6wAHozxoERNN+nzWmWwvCOErp8ev+eWfwqIj2KjxpohnYR6@vger.kernel.org
X-Gm-Message-State: APuU4Z/xFAElNLoBfrDcK6tj7+zpvFkab87R4MdBxnH+kbMXLC1f1Er6
	Pamg5nAZI4SeSwYFFlqMEkcBC2HWNw2y2tEIGCttmqL5w5tY26LANmzM
X-Gm-Gg: AZFdTZe8Ix3IaHgjx3KTMgMXNnTCRQ7j/lI9jpzfLGNlvcRlzoHkNk8K7xm69zqib/W
	DADP9lQwQL38nHuYhm3Oj42Fz77OXsX2Qv9v4ZVSdgjc6mJAtB8RLDf1uCFVEBGSOzAM72Czc5g
	8Ze5itEkOLGHKkvbKF3/rToI0fRqme214ZNEFJ2JnG+z4xoEuwMmAVRgO+evNLzSg83G8gXl/PI
	W+f7eoFs+Pbqhr//AfriFJbDc7Y74MfrmUjjuuY5MiFqgQobkFAqzK5Q000VCmX2kTR+XYDyUj5
	8mHMy9S3nHbG+eRUbHHO2I+BLg3itlYAHKz7IAopX921elpmrVB5ukYzoNb0BISaaSK8Fyegy2R
	LnR1PWAO9/rhgz1nVSi/ItyUIGqXYctZhFLts3Lga0b4vohlXyQ91dUvcwDkUw8cB5cLHRVrwt6
	uID4kL4NbW6MJDRTRGW+7VmjT+bl1eRYhN7a1of6hSVf8P2UhPKdhfEJehhI/hmF/vaBr7ZPQCj
	wpJvkXuJDwIj2EOrRpksbRIH2BBjd6BUPqWwLWe8P94RiIt3wbsqL0qDr+rO+iRLOhuKq4+ACPX
	KxqPHmoqP/auZKC3/ghJgOTWiYcn
X-Received: by 2002:a17:906:e28a:b0:c31:e958:408c with SMTP id a640c23a62f3a-c513aab021fmr708355066b.38.1795463993838;
        Mon, 23 Nov 2026 11:59:53 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm438660266b.8.2026.11.23.11.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:59:53 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Date: Mon, 23 Nov 2026 19:59:34 +0000
Message-ID: <20261123195935.1046144-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com> <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com> <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 05:16:55PM +0100, Bartosz Golaszewski wrote:
> Can you verify the pdc map against the interrupt map? It looks incomplete to
> me, there should be more wake GPIOs. Unless you have a reason to not
> include all of them?

I do not have the interrupt map. The PDC map is from the pinctrl-anorak
driver in Samsung's kernel source. There are 93 GPIOs with a wakeup
enable bit, but its PDC map contains only 76.

I did a test: set an interrupt handler on every unused PDC pin on
my headset and then I toggled each GPIO to see which pin fires.

1. Out of existing 76 entries 42 PDC pins got triggered. 26 are used
   by devices on the headset and 8 do not change their level,
   so these 34 are not tested.

2. 17 missing GPIOs: only 14 give a result:

     GPIO 42 -> PDC 105, 48 -> 87, 63 -> 122, 80 -> 42, 97 -> 96,
     105 -> 55, 143 -> 72, 151 -> 118, 168 -> 94, 205 -> 130,
     218 -> 124, 219 -> 68, 221 -> 133, 223 -> 134

   I am not sure about 151 and 168, their lines are not quiet on the
   headset. GPIOs 114, 125 and 162 do not change their level.

I think it is not a good idea to add these pins without documentation.
If someone can confirm these pins are correct then I will add them in
the next version.

> There's no egpio function. I assume you copied it from sm8550 but I
> think you should do something similar to commit a326b0523fc1 ("pinctrl:
> qcom: sa8775p: Enable egpio function") here.

I'll add this in v3. EGPIO_PRESENT is set on GPIOs 185 to 223.

Best regards,
Stanislav
