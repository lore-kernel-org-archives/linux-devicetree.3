Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531548;
	b=2SqifzCQNern8Wl8fUP7oE7vG2HtNA8yzmDPOpK2dU7lEhVBOnXdS6u+RUbwYwXfeG9J
	 e/+tApmFFOOmwHPoOrl5n3WKLt5vN9zdzZBRutXFvyeS18lM8rPqtKpeTYSzRckXhKKa9
	 jB5HKdVN63Bru+OizmF8QIRV3nh8YMHuOsfEYdzaMJ5I4C+1ZAGyfE7qQVtj97lzFhwmY
	 dxG7L41qM8FCf4VuPIBNUib9fS7c4nDOxruzAD2Q6TbDoz65yuII9zvQ8SxJgTQfVmqcj
	 yOHUvTJIucnJFFoklJps2BPG5H1SLWumK8w6HyDABQktQW4Smiz1VnQZULrhUXe7DBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
	b=uy3vC8C6ma+3yf+FgdjQ0F8ZRfarvpx696uhe5NPJtEyofl5qF4dwVWstnuk6bn8BHT9
	 PRQ36tULP0+Znu8+Gq/QyV7IIl6uVdAjC4z7xbA5qWpaNX4yEP9s/J7RClw9rponEHfm1
	 zcFdKsUgXT0Z/h+NjCtXaFPIaCn+SUXsrXPz9UTMKI7e+gtWodPwW45BV6iPTnHUDw9G5
	 gMCmyHmJSGZ/MX2QhpfVHgNjPvSQAzghi+Tvb0zYBa7cDwoqjVJKzMGOv2CLaxCF/069J
	 zNUuu6IpmP9saUwOZLwADjE+gaFGUJcKx/bbLrl32PxeMM7mAm/MTGh/8MldKZ3BoPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4A2606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E4A2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1931ff67a29so52964c88.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794531546; x=1795136346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=aXwA6C2X78/aErlxdCDVlDcBhkVNyzQp81N3HP+FcVhJ/FM8Ts6K3OTLEdrDTNlTZC
         PZlGbsKqFdepUhhUwf0PTM4/12NFZOmop3SMoBLlrEo2OKDYLM2AQ+eqSG4n7pA3N1pj
         r5tFkM5LxFCtgMVGCSfAjr7e5Ubz2hvSMv3cYF2jhO92/gHpAxYLlGhuvE8Oam0NBvBW
         3d/2C//L92CiXCNnqw6r0R+4t9XZfGZjwz1VoaqfrCxDktj2prFI3iKcjRF+UXFn16ap
         6K7zLI1kvvv7cxwwJV6+lExKlmTZf4DnCTPEVPaKT1VACLFTNEai51iOa/kMF+qrecyi
         rbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531546; x=1795136346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=eS7AeLiV/ytSuT878N2dHwQflUpaH5fWHQYopxpDGaZr0qA6DnMXIcsbaRBgPnT3z2
         9+e/qdYvGbZWpeCeNCGqp/ZeFKl9FoQe4riUqapKHG+TnX12VIiPDcqOVsDdleAAv+Ar
         oBw+szl0plbluLBmUu6C0l+gaBKz0JLHh3clLzI5xaQWbBK8ZR7jmqApfw3f1gpJsP3a
         EBjIn12xsNXoImYDhdPNf2bfh1y7v20JZPKSYC7IiE2W3YsklzUBtis2KSCCOocm9KwJ
         qHmBVxFW3t8+hX2+MyVNqqpAgjBxl8lARO9Tu4e2aslO448yidlvn3oppmCBGzguSW+z
         HYAw==
X-Forwarded-Encrypted: i=1; AL+hErG1ZpITPQY3NYRkcF3H/S5ObEXsl3ECCB/Mr0USnyBbRimeoVvAkE4ZhgyP2xQEaR0XTdS2RFQTG7NM@vger.kernel.org
X-Gm-Message-State: APuU4Z+coHDDbaGQt0OkQtWLg7Es56EeNp2HiqbZ9XyZ2aZ29UzW4OBM
	Jd3L3c+C5iv2ypGM3Ju4CVC0Bm6wwuUIO8J66xVwJwuAof60OCOCSJ/U
X-Gm-Gg: AYBFou1aFi7MY+vsMRnKnRGNWDGVmH+iMw+MkP9dF2fcdhmbJk/1WNt8hvm73CLA4qT
	hjtFF7f9l5wyAjsF18vdxXaS05PRsORUrXJvOryj+9iLTecWKRYwrWT3fZM2hXpiMYI+RwQwYgy
	svp+qGmut6qifS8CUgXYIFUJyn5ii8MmqlTVM4RNwg9PmTDi4k4LUqrXfU5OOO+Q4RmW8mgF8NY
	aXNF9MPls5L4jsIB+RbNwteupACHSzewXRIj2PSQTUN9oEEZ/ybeHPYt1KzXseV0qX2cNa8vgQX
	F76McIs5ZrDepUIb3u09lQ2wpBZN8UVyHW8ZjW5yshUNod0nlEFF16zG4rvAjlQ7p/1BvTZKwu9
	pr7z2D4iyUJ/SFS150nGBKO5NXhln85GVG4DtopA45hp1QJKXWZedKENV7MZ7isk/vkfRZiQGxY
	nNuCHw4mh408T0YNkZTJiqhIUzEX68BdqFF1gMrOvVIduSyAfhr12zYbhinjR1PljMnKOS6BJqO
	CAgfnk4v4SU/zkjPrcI+MEx6GJJr2APaBxXFtG/GzMa9rrVKiEfZUANifFY3leGNDBi/BF1Ojl0
	nlpAmiZwqYnFEhfQWAcm8MqCDy+CZ8htb8AD/h9MJR+C5wTKTXXORzHTVgpycYAM+XoGrG8=
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr1197809c88.19.1794531546379;
        Thu, 12 Nov 2026 16:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm2760431c88.8.2026.11.12.16.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:59:05 -0800 (PST)
Date: Thu, 12 Nov 2026 16:59:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: muzafferkadir@mainlining.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 10/11] dt-bindings: input: touchscreen: goodix: Add
 binding for GT970
Message-ID: <avZgzxJtnMceNQnJ@google.com>
References: <20261105-msm8952-initial-support-v8-0-311ae8e8f14b@mainlining.org>
 <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>

On Thu, Nov 05, 2026 at 01:54:14PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> GT970 works with GT911 driver, document it to be
> used with GT911 compatible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied, thank you.

-- 
Dmitry
