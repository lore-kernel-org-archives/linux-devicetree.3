Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459780;
	b=rFu+gJ6PAqBXa6TeFJGQwodn0H1e9RVA+6ZPzSlekKtFA6Ai7qnouZx4nJ8DK/H4285K
	 +HQs0qsAf0mGyonoW9a/S1xRqRA26l04QJgsEk8Ebcj4/sEDquBEo8ko87+J5gPddcAM2
	 aBLnw4PTP3L/zOwSDy+ONpGK3pv353nSF5xZ+ffmMMoLNwpaMwDgDRDxTLGMHDxfxKfsk
	 jFNIn+uHIbLORpXoP0N6DjSxhB3du60LhOolMZrize1RePZ3KIEz6u8rIEfnI1tAgRFBl
	 BXgeAh4Ael0RaQT2QiZHCF9uZr6hvFY5jhLFUhPr80UST/XJ4a0YxfkMA/rxAsFBaHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QT3eFXHVHoqDLuSaSFM8eK63zSLUEeeoFpkJDMWYrL0=;
	b=uDeuvBKyDb8GfLl/mmNpcUxsV1djoDOzhqPkePlz4gvE+h/lzA+YHkufNgAIsYBY0ZKh
	 VTs4mgfCyTAFoqzwaTQhonL6wbhRWZPxXiQXa5qv0/OVLmsrmsnPgBQegHGPbNYuziOQp
	 dpdptkNM3o8y/sLNSOICBmQ3FIIfVMEyQJYLAa+3m4pfE3VrnpCPkiMBdi320ZP06KPzR
	 HnTaRe6UC7MJsX7XOC+wjCGtQZhr9zprp8G8DbKT5oCt/Mt1io8U2XPXwcB/OfYDj9IGg
	 vL4cR2ioA5Q8DylNlhFs4zKJlYEJhY6gFT8IzhtGYk1cjDgiq3PINPFxX29dEOPQ8eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XxUN2kZ6;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7A606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XxUN2kZ6
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1328447c88.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459780; x=1793064580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QT3eFXHVHoqDLuSaSFM8eK63zSLUEeeoFpkJDMWYrL0=;
        b=XxUN2kZ6oEaNF06NIkbaryynlksV1cMlxhrkyWtOISac7KzbtvUgeFnp+pcITmQZo6
         7AFTE+xDCMWFB+Ka8hPWmtY2+ouBmJJsz7SFOycY9AVFqqjPFDTIu4Wqbu596LB/c8y2
         hw7uTy+fEPpI5avdn9oR0gwb+8dMYujIZ2owbXkrQh4NeT9ExNYRiCndy27rStV9CZ4n
         AJX8EJqDvZ6gUrRhlZce8XO2+M8PdnA+eHtnJu6gzYkAyBMSxE/HaqxBu8UmYooBsWMX
         Pwt+VbKoawGN1yuYtTfxtD4d3xHe2zuw3X+FRB4cRQvrZ6Iur5RSVRHzbUNmSWPRiGMP
         K4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459780; x=1793064580;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QT3eFXHVHoqDLuSaSFM8eK63zSLUEeeoFpkJDMWYrL0=;
        b=ihkIP2Y3qWbSPPsKHgTRym6soJtNj9JklwwhBjzUIyXmRyRIPnc2MRBAdit4xbH7nh
         eiboFgTn/dSGOW99HRW2idqeAfCD5HfjDPTbEkFZOOB4um3Dg2Y8KqTP2NoZwyz5gj5p
         temo1GWKmRuoGg8CxD95PN0z+8l4oR3kBdvRPckd6bvMbQG73mGFt2qYDg0au/J5dZjd
         X/i+2CdsOH4wq9Cm/9dVIO2TlNDdJZ4i0qa5c/oMkJw6DWCzydJ1UaovA8UMgdcn8quL
         bHRAJAP++zwjeOBbx5StjVIFGuqRjvxIqHDBRF3kGAwHEfbfyrDsWhdU6LFoLx2M9iFc
         t/9g==
X-Forwarded-Encrypted: i=1; AKwUvBzmIjtPPGyp6L8mAFBiTWeiws3WCoUXH/wmqgHC/LNBI1+HuRAeyJHKNWpP3QwrKKXrfVg9I6CIQivu@vger.kernel.org
X-Gm-Message-State: AFq9FYJl5WEgyLhhEGbF4R8zmTdmczdcinvlsHncjmMYVSVrkjWDN33k
	CDQxM3BpSSMLSZ9tRqvpUrtirPBVWz3QEKDobCxyATmLlSA2Fo1P+tyosXNfhg==
X-Gm-Gg: AYBFou2k0y3j9liZFnEGcMQD/YpNb0AUNxW25YFFO/8OKZTc3mPt/3xn0f9P3KEu4sA
	nHqzHDOVpkN6eaPRcaFERcScP8YB9nuCuhgGJOW8jlH2WldUVqbGfjjsGipUAJVLp00gwAF/dLY
	xreN4mVwQl0Q0Vr2XYn+Nk+eJp1y5bXF77+cvcuj/Qk0mOEm987h2qySHZLZ635jE/a1gIJC+sv
	PRytBBWcR/xHyDsoKc3G/Xu5AdRK5ovWCvJZOLysf3Sw7Qgh1TY0OmaiA0tFs3uRNJYHm6dvgag
	4K5ckQ4OyOvd42ibMnf70O7cYg+k2ECxSvSRlmvGcpcW4HAC8CCKHGimL5NU8TeZzMCAPjda7xF
	0QbETbHs0tb+RtmOi2CGvpQ+rD0hbtkMgLPWaGXtBmes0pY4BcMWr/+OE9EdYgmOjTG23Mr87qt
	CZFtqipZSbAcGnN+M9ZNV+pK4uJ+ibJdtuOz0OoZnAYK4EtdpVA7RuUjxKR6NmsDA6iTfqQNIjk
	k0gEaV5BPSV
X-Received: by 2002:a05:701b:42c3:10b0:168:6ad8:e89d with SMTP id a92af1059eb24-18511eb6876mr14641867c88.11.1792459779536;
        Mon, 19 Oct 2026 18:29:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm49277908c88.11.2026.10.19.18.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:29:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:29:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: qcom-wdt: Document SM8750
 watchdog
Message-ID: <10d6863a-67ac-42c4-86b6-aa3b0871b502@roeck-us.net>
References: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
 <20260930-sm8750-watchdog-v2-1-b16fcda275d2@oss.qualcomm.com>
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
In-Reply-To: <20260930-sm8750-watchdog-v2-1-b16fcda275d2@oss.qualcomm.com>

On Wed, Sep 30, 2026 at 06:32:05PM +0530, Komal Bajaj wrote:
> Add the SM8750 compatible string to Qualcomm watchdog binding.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Applied.

Thanks,
Guenter
