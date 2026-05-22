Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A76038BF61
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 21:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485638; cv=none; b=u2K8hAsKiR+f0v7YOflCrQcW3oJuVvet5QtsAGf1lliGvmICnkon3oewOo60tV1WIR8Hkc4kOmqY1TNE1XKxgHC5kK7him8t94gGqp1R1PMQVL7GEqEOsQag7/81LtTCWTb9idG5APm23wjIKoKC8AuJd7GOF0Go0bQ5qhmDE8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485638; c=relaxed/simple;
	bh=xN16+V+XaUhGIrCQOmLTnW5xy8s6zmBTnZvA1J4feFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dk2nnXc0qi4v/ZNRjq7uUODFZUDUpvrVBCrHUaW31DmtvBvPUXqh0SPO29A77cGhWVxHjH8DaeeuwIEP56zhEYbxFLgxNHb3k+qigai7cB8nTahsGvGEYXV0uxC6WsBQrU80DIFU7rcA1zLfEaxebG3fYkgOeo4G9OKZY27AcmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C0QTSxGY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0QTSxGY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903974854dso20858965e9.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779485630; x=1780090430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEDekoRqr3IuhM4WvgAwDyzO0pzOp2MJJnI/rw2z0EQ=;
        b=C0QTSxGY5CUlX3LctAasbwVEffFZ5Ot0SCP0XgjG56Z0uzDI6cRMA14ujPUH7fvI/j
         hOJWNcduXrbrhr9kxmlzfdJX9P8OiI8/2JCUJ7fsjiQcbBg+QJMXosboJTgBIO5aLg4f
         3dcIduT1wqhTx/+vv4lnvrzXpv/MKT86gq6aNcwUBLuwuW3jFaTzsWd+p7bWotZm/D72
         gYOCPVIxZQvjXCzitXeDVeoIphYMDEdoHQFf/gJqQWkI1B0/7qbiiTfXgpqUD4ADKFUD
         gNISviX880yBUqG2hPFbAWzP3zIPF/1+t0nhHtj2sPo8EDBDH62cr7yvLcdPX+b22W0L
         4X3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779485630; x=1780090430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEDekoRqr3IuhM4WvgAwDyzO0pzOp2MJJnI/rw2z0EQ=;
        b=q2jeCNcEoS32gjCO0aREnDD1G+FTe9WrMEqWl2xYOwBCulHTqq/dc2cjhI9GDcoKcs
         aou3hhfZRP017QeEeWZg5EEO38dY+iOMSbRsWTk+ahBmETvaAmYZh6cuw3VpVexIXZRI
         3zEGbnaCpXOvoVOHKYDf0ci7L6HXCuYni5EzG3KVOQyFGn+KAObruzdOT5nCNni4mQTf
         07cynrdMuSJV/o/SOk5D9HUiKuQpw7suwz+AplBDEiPfV1E74dYttuSeiqx8UsfNpMfX
         EblvITF4qCXUBgKPwWuvI+CJ3F5PwjToBb3OvYfzPHfYau8LF1ICJnUAaiaPZApXj7Gv
         DDMg==
X-Forwarded-Encrypted: i=1; AFNElJ/zcVmg0+MH2ySZ66VU5CSdHN4J+zV/WCp/BwdrEpEliOM4NJmVtmJenxLUFqyiTu6pleHlnunMSvs7@vger.kernel.org
X-Gm-Message-State: AOJu0YzjOLSmw1dnsLAcz0oxp9lTQfPK7wtcXZoVIRvpIcAmIfHetmOa
	GexrObCyyRvbd7lH7YaKaSecaGB1yHAnSMUbtLtVlpDFYJsMWIE17sOWeGTQCJ2iXGo=
X-Gm-Gg: Acq92OHujJ5RPdZ8Kj5qcrV/9tbwd37DSlcNvAhYKE1DaNoXSxF6RJsRW3gpi48Prbr
	/ts16HmLi2IekVFXSnQaeKsDn6zCxoGj0Pi3lxmL4BynXAWoVY8SDjUXF5WtS/PLttPGN5paTS6
	iZm2/WpHEKnw3mEGYP3SWZOiZarPCiKTxrivfCdaIjYppJMZJe7W98MFoQZEmuBiSOod5aA398k
	PfVPUsM+RBin1qrlSpwPwcwEKdrQePJDXgzKzTIAEhUmkuPDegpE8FQ48SnqNQWL4SWx7JtpFKX
	UigK28EXJ6mTMNwRzXQB9BknZAXUOPlqVaVCxQ8tnC2e2w1k5daAQouGw/02U1YagyeQyS3w39Y
	rT1p6UnRvgCLdheUSeLVgaFsvfJ9QHXzY3fYQpJtmqgoVXM8+CS0xLgeMZTukUq0twhgpIjf95y
	LL9Fd+tvhXtW0S7dzzv9TsYHCg9cFFWn08oEMCm8Wff3UR1AnB3svBhQcS
X-Received: by 2002:a05:600c:4ecc:b0:490:389:7644 with SMTP id 5b1f17b1804b1-490426d4d7fmr76531935e9.17.1779485630196;
        Fri, 22 May 2026 14:33:50 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.110.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490469f61b0sm19105135e9.5.2026.05.22.14.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 14:33:49 -0700 (PDT)
Message-ID: <a03fa27c-57ad-48e3-9223-b4d30978ded5@linaro.org>
Date: Fri, 22 May 2026 22:33:45 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to
 256 MiB
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, val@packett.cool, laurentiu.tudor1@dell.com,
 alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
 <ac559877-f4f2-48d7-b00c-4cf24fc64489@linaro.org>
 <581cc180-b993-4b86-81ae-17822a35a1fb@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <581cc180-b993-4b86-81ae-17822a35a1fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/05/2026 18:16, Michael Scott wrote:
>> └─[$] <git:(0.7.0-multipass-v0*)>
> 
> Good point about the libcamera version. I debugged this on Ubuntu 26.04 
> (v0.7.0+patches). I tried testing v0.7.1, but it caused a crash due to 
> API changes with other parts of the subsystem.  I checked the diff of 
> upstream between v0.7.0 and v0.7.1 for the dma allocator code and I 
> didn't see any changes, but I wasn't looking at the software ISP changes.
> 
> This highlights that "I'm doing this wrong". I'll move to a cleaner 
> rolling distro where staying current is a lot easier.
> 
> The GPUISP support looks great!
> 
> Dropping this patch as I'm not understanding the full allocator story. 
> Sorry for the noise.

The whole make CMA bigger thing is an error I was pushing myself.

CMA is required for some systems like say Hantro on i.MX where - the 
encoder doesn't know how to deal with non PHYS contig memory so when you 
are passing framebuffers around from once hw block to another, you need 
to make them physically contiguous.

Not a problem for us on Qcom hw though. Like Rob said, I'm actually not 
sure why we need a CMA block on Qcom hardware at all.

GPU or WiFi I think but not for Camera anymore anyway.

---
bod
