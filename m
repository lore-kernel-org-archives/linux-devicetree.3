Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D69530B53A
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102194; cv=none; b=riEy8xrpLAhUkfoijscCHSQC2HKeo7LOhlp51sQiVYGhP+aJPP7q/7JbPGfXOhKKwcZdgyR3leFdWZkIBmaWA86/KWRzT2ZfAk3a1gPCyH27MqDuoWt/d6XY0IE4i4FWmdKSnd9ih/cXn2wFd60Iba7hny0ZLdFIklp+z7w8haQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102194; c=relaxed/simple;
	bh=tgraSq/9gwcx1TlvQJClsEB9nYR8gJqZ8hIiRgK1PwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2VzATi1MqFsQ34QLXhRWg5iRBSuV4ufqRsUQ2ji8zjy5TF9YqwjqulVrCQ2NlpmDUpVaRjVx3o2PeNWFxYkF1N3erALe7xhjCkrp5+WHOm1s/h7Jd1E3K0lzeYmmHCFOoFCYh7nxLrF3GMlvrY6j0wvqcPh5Wq0zpP4hz/Lff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ra4xy5wv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ra4xy5wv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so7495185e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783102190; x=1783706990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v0DdjgoNvkE0UKI8hOQQ2MWCAbcQBGlfDeboRpCm0gA=;
        b=ra4xy5wvOi/TPR2Z34MK32O/ruNxzV+1v6h5iMDy1P1Fn3UGUdPZM2687Pony5MH/s
         WLLI7YRHTn4SPDcZsIu7rwolyAPhKocKplLXYQIeCbqypXDo9Bgn9zyBZg+AYgdPS3c1
         aC0uv6QHm9h7b6sKySLAA0Ho1VbwhCEAwnI9dTQ4gsjtlUt+MTijdQasxwuPvJmyQaOV
         k9IObRwH0OUTZ17q3WKTOsLRgxAQMxGvzdvs/u9wU4so5i/GhP1eYPxkJggBq5exxNCC
         umrd9HSyTHQypGHWdLak08XO0Qr3hi3XOCH5195z4JS1UN6UInIl2mW0V978DqbgDTOT
         D3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783102190; x=1783706990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0DdjgoNvkE0UKI8hOQQ2MWCAbcQBGlfDeboRpCm0gA=;
        b=X/3t1fD5JTcbE9qkc7ONCJLNaETwdZ15iaDjl/y6vj0hR/V5oqj0NbPJBsZyIRpzvT
         Bg2HWWaj3/GNM2fdONC/ngStJ/zMB5zMlC810htsU7pIu1xrRa4D8mCy+wvYrUExo+UK
         XcxXohR3ulLlf3kGD+MGi9djc0H7Xw2/6EL4/BYf3ZYPQOYDpW+ZlUIQg/crBB8WJ5Dh
         DQM3pwBENY8F77Jtj35gnMwVb8ShqICPpP5Isn0u8JBxB4kX1bQndPc0U9W1Ex9I8oM6
         wiyeWV5cWTFMdpQ18DYMZpRX/6ltbN184MMOuU0ahjfagmP2cPgpdi6Y3ZpbyMbAxxZW
         BBXg==
X-Forwarded-Encrypted: i=1; AFNElJ+N3PaAYypSlP2sKlOI1ooHynAyOKiLi9cfxxkZDX0VjppfmUFlnF57dZicVYjcdSFjsfCxBKlYC4sv@vger.kernel.org
X-Gm-Message-State: AOJu0YzL6fPDV0y9z/0ZKgpGVIUfDebpgxC7KlcHCwro2sXISKCuzpTD
	3hQumMdkedXvsUg9Y5ZcNI6955X4TiXlWOWr92arT+gIRW3AAaKnOXFw
X-Gm-Gg: AfdE7cmcdIuiHzhT/hYmGAndmr4/Av1pIzQTrpoNSA1uAbtm2s8NOsFgfDzv9KWJ3Cg
	vYA4l7zK6Hxy81cpfE52aTZFgOG8OXeYYSTyl3Zrw+6sBxZsL3ec9ljp0tzW+ynI1ev/gz5hIAc
	4jCB3bS1wyz1zZmLNS0rapnaPWI3EoIjbRTxlwpERFCE0sTxvimfOFteFMS1zbEgTzbtaZcXTqk
	1hDDW59Kcix2hZGPYVHeXrgHsll5K5CZ3Usl3pxkS3B0gDPbeTvp+kPRcWPk4wUSQElMdLNiNv7
	VpJJvgIwhvrrDDr891I/ZG+eJxoZfd8oYHB4O1Lt6BfXnFp0mqtzQ9pFDXvHJv59sOnFE58vJJr
	Sfk0sWdZZkgFQolAgIcdJzpBXVd3tYui4WsEy70vXgznFDVy7e7QPwnigKw3wOnFJWHiCfWkKbq
	qdnNK78lSq9muGOGQ5p2v6A5gwcGtM/4tq/xErl8l8ELwp3r8THATK9yrRBhkpRceVJoe7zGcIj
	Qk/8hVF
X-Received: by 2002:a05:600c:314f:b0:493:b2c1:b2f9 with SMTP id 5b1f17b1804b1-493d11cf274mr4122605e9.8.1783102190297;
        Fri, 03 Jul 2026 11:09:50 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm1044214f8f.33.2026.07.03.11.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 11:09:49 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <8a418031-4bfc-4212-a7e7-0d88aa4621c7@gmail.com>
Date: Fri, 3 Jul 2026 19:09:48 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Casey Connolly <casey.connolly@linaro.org>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 7/3/26 06:03, Gaurav Kohli wrote:
> +config QCOM_QMI_TMD
> +	bool "Qualcomm remote subsystem TMD" if COMPILE_TEST
> +	depends on ARCH_QCOM
> +	select QCOM_QMI_HELPERS
> +	help
> +	  This enables Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> +	  Device (TMD) support for Qualcomm remote subsystems. It manages
> +	  TMD messaging and handles QMI communication with remote processors
> +	  to exchange mitigation state and apply thermal mitigation requests.
> +

QCOM_QMI_TMD can trigger an unmet dependency and build failure due to
selecting QCOM_QMI_HELPERS, without ensuring NET is enabled:

WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
  Depends on [n]: NET [=n]
  Selected by [y]:
  - QCOM_QMI_TMD [=y] && ARCH_QCOM [=y]

- Julian Braha
