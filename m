Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191E7376BD0
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451639; cv=none; b=H2RwKlQ7tBn3sErpgDcnEOEAguM8LYudlwonzRCAd7qIu5ZHwDBGMf/8gsgCMf/67OwypYGGaba9zXZ6unG80ZO3H93fMCgUs3DdcSySNMa/NWoqPmovKVErk427Nzng996bUhPd99U4kEdiay2BSUWjTgs6zB1BiHXRvVtbtgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451639; c=relaxed/simple;
	bh=8igC6V5gCG3ORklcZkPqAGB8ALlBsuox//yt23Usl/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6p3ivLuIghbGX7TkbUhrM9jIyV7/kSmrbmLtTfqGJq9snMSLRHfMwnzqBcBqkRKfapIIWzVtXR4pjwAM+RVNKz5mBI11p32vTl49h+y3Wjutk/EMYH4gxfoW7mVmsk/phNPW9JEgt0o/pg2aLqMqnqpk9kVCMvrjmNdJ3Qpth8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xrXiQlFa; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xrXiQlFa"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so3228718f8f.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779451636; x=1780056436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRpKrzH+DoH1DNrXivPjGcJUPcnVpmZeapPmijxinYU=;
        b=xrXiQlFaPJ/aLpbWyCLckZcJYzAZ0DHMvhSeQMnPl04u9uo62gl/6y6jHbMcehvrTc
         VkEOcuMSU78CUwhaLf61XV1kAtBWm6v4o3yr8lCGpKNMI45gxKYxMyGulXAmZ5dxNKx2
         ggFJ6Y05/bAw1WOzUiWD0RxZVXN5WU7ttsseAO0QdO6C5t8CzZF83Zyyp9qF4XaxbaKd
         wHt02U/XPME2J54LjCnMufIhmXRPML1LUjQXYHSbZ19t3u0ES8hjMYfkvtAgt1y95B2p
         xUCQdL4p9yBDCCVwQXHijbDz95vlaD6DCqEwrnxLEZcKZsn2YwttybTdbg7YkT4rPPyo
         /uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451636; x=1780056436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRpKrzH+DoH1DNrXivPjGcJUPcnVpmZeapPmijxinYU=;
        b=VEVkISM7fP7ZVbOc1kAIs2hWHcTJhb+S4fIoNUsnuqj8dbqgtr+XUwNIKNdnYQs4Uq
         vQ6c1tgbAI9IG6+IcGi7HnSE375cwtNAcFvud9uPByWQ9EWhrYZic4DLwmzkbBob7AuN
         yQ1wIgwIhXYKJpyqih1hayDXJMHUiflevd97HpGa3PXedndPq0w+Q+p+S2qdGTM30PvH
         +PEUTUnPE/WWZaHTf88A9BQGCVsfdkk5JBFfrcIxe6kA7wBhD7b6DBs8N+3Lgt7H5QK/
         6zzXFWqEex5sb25oAuBbecZrvrn5ym5bCb7O7Gp5K+os+clREQMW7NQbzML3vSPgkCyc
         TD3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+pFjm0ZYsKV84TtRE4S7SwsaFloUtOBDtAR/ynyZAbMIxQy/z/BFI80iNKU9WQx3yfnvDwCJuocurf@vger.kernel.org
X-Gm-Message-State: AOJu0YyzBR74YJVI/+1qIDtDBxml2xjTgvX9dKw9uGFnWofd19j2IMIy
	F81petPkb/aoSNWLzTPtqhLiEdJuOUBfWhR4TzlLHtrzZzNjB1JaiCoUtHfbChEYu4A=
X-Gm-Gg: Acq92OF/B5cdwPAIgxooZdTVbSZfrcmCfACgMO+gYtdstWFQeJ0tnPBKGtU8ms6yovH
	mRnAzsYeSJpq4bQjPQcpeqvTR9waswQealJd0ead1563MHIUTPYQSBvD81fHkc9baTtWGnO4xst
	6jrkm4xXokb0LYRxjvGsR3jbY8K8Z8h7cI6Pb1V063m2Rb3C9Md5adWXcH+lEhqGyE8XYhjRMZu
	K2MQx+JQ8Gsut+IaN/0no2/xXKQDqDMlS8O59E/ZVQFIQgyP/ERCBK3/NWhpr27mFrvY9UwTq21
	WdgE/KRR+y2Q5bJsp6e5H7FVuGkYLSeQvBhwVFfDvxCLiLYthZZnXFjM3ilzdCPwXiy3TFA5KUH
	JUn2goesHRcTXyKL22dcmkmCgLJXqvhYvTvDdNtHiaavbttJXpw8M9rMZRM/CZxAVc4C5dTcrAP
	JqRvKX0e889byxAtL5rj+WNFck9O73
X-Received: by 2002:adf:e009:0:10b0:43d:c95b:c46f with SMTP id ffacd0b85a97d-45eb38bfdebmr3493505f8f.38.1779451636530;
        Fri, 22 May 2026 05:07:16 -0700 (PDT)
Received: from linaro.org ([77.64.147.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm3678635f8f.5.2026.05.22.05.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:07:15 -0700 (PDT)
Date: Fri, 22 May 2026 14:07:06 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	shengchao.guo@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <ahBG6jKYdSAboWjs@linaro.org>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>

On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the ready
> state is detected, it will be marked as "attached", otherwise it could
> be the early boot feature is not supported by other entities. In this
> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> can load the firmware and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Unfortunately, removing the ping-pong functionality that was present in
previous patch versions makes the whole mechanism a lot more fragile.
I'm not entirely sure if this has changed in SMP2P v2 or more recent
firmware versions, but in my experience the SMP2P "ready" bit does not
tell you if the remoteproc is actually running. The problem is that the
"ready" bit is asserted by the remoteproc when the firmware is ready,
but it is not cleared when you shutdown or forcibly stop the remoteproc.

If this is still the case, you can easily reproduce that with the
following test:

 1. Start the system as usual and let it attach the remoteproc
 2. Manually stop the remoteproc in sysfs (echo stop > state)
 3. modprobe -r qcom_q6v5_pas
 4. modprobe qcom_q6v5_pas
 5. If the "ready" bit is still set, the driver will try attaching the
    remoteproc, but it's actually not running. No recovery will happen.

In this situation, it is very difficult to detect the correct remoteproc
state without relying on an additional query mechanism like the
ping-pong feature.

You can make it a bit more reliable if you also check the status of the
"stop-ack" bit. This would tell you if the remoteproc was cleanly
stopped with the SMP2P "stop" mechanism. However, that will typically
still not fix the case above since nowadays remoteprocs are typically
stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
case. I believe this might set the separate "shutdown-ack" bit though
that is described for some SoCs, I never finished testing that.

And even if you check both "stop-ack" and "shutdown-ack", that doesn't
tell you if the remoteproc was forcibly killed using
qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
solution would be querying the PAS API to tell us if the remoteproc is
actively running, but the last time I checked I was unfortunately not
able to find a documented call that would tell us that.

Thanks,
Stephan
