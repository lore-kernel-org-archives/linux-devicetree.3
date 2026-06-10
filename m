Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2F63B8130
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082645; cv=none; b=EdmB234731zAqvdrQvu2M9jurCkEIIPV9sxPzGutbRvhtMnSCmKMbcsQFIfWTDpclg/WImq4lMCDNJt61r6Jbc5XVlJmMtWfxWT49ZD7X4JcgJ0Wv2JkglZmCbT+kYc+q9mcCPKHr7TpMO4RXb7DoGU1LmOdfq8UvrDIEJEZF/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082645; c=relaxed/simple;
	bh=1u/gyIAUL1eHXRk5cCApALdPFJbXqUR8YqK8IXcgoeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pm/2Pi+eDEqnCzSSxNzvoT+0aDZ5RXlePfTecJ8qOmIlMSlqEDgQ1KFJXCEwvzfgUaZD2qsSr8dJiqTXWDQZAVSa7wfdWrPw+q05egVMirdCpQoS8aoUZ3whEmZuA56AT+3dh2UKzX0MrctGXEkicoHMqXArTEZHUmbwfxnc7Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGj7JP9k; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGj7JP9k"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b7866869so71858115e9.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781082642; x=1781687442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVCneA61j9/Mv1FcSX1dBIQFass/grRjgoNTeP0soOo=;
        b=XGj7JP9k/L0bePfwvsIXassJ26bIQZ0C8DM8q8RFio9zJaXCQj9q0dFhLMWo4+PMlu
         rst6anKufe7OLTGG3hvija5XQtbKrIkGSidGpkSPLvxbD0G/koAwaGZUyOoeYIYbvCV0
         ILIguntqjiJQZECWwVt/9pNt3g8fcb6r48g3afYj/5+DQ/M5Zg5bwvzxL2iJU+91dQEG
         /XDPjc6icmzIXQuN0yeOWJP5cAIK+WMQSpPPCfykHXReyay4VcwONghYUXqJkrxIPVAo
         JagpIFNjGFeeOYcHSObDh9igJOOX34lNrfAeeYo45EgNl6Iuq57yc6YXZNIKzc+RAsVp
         fNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082642; x=1781687442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVCneA61j9/Mv1FcSX1dBIQFass/grRjgoNTeP0soOo=;
        b=ek6/Oma8bS+uH1OfeU0jp52AWoEiv2hCKuuy7Aez9nYxpkKQ6o0VKFC03tC1LfYDLw
         Ml9p05KnV5preokkUpIHYQPb2AOgFmgbcDpepNDCl+EfDuhYceFt3cx1MBlxar58e65z
         KowsPp1cxh9XVLwHwptF4FsVq6WUYTHtGGxKzb3tiguKk/Jp35i5N2enJJUAaW+Y8BM3
         gskqUYMmuC6JTEnfIAdYnyV4mbdF7psA47IXE9l1b/GAafmOqY6P5aubUfivogJyqHK0
         fpUcb+WHHMNqCbBhdXuWvwRcTUObFlCASMqTvDb6lNTH5WfiE8B8bwIJcBwIhOfEfLoD
         /zzw==
X-Forwarded-Encrypted: i=1; AFNElJ+tR/pT3KNPR6sPEwoWkNo5HiBS9zNkCyWNWpEWevlelN3Dth7Dg5yd/3wbt6x3HTQ+Ru2cDsMyXl+u@vger.kernel.org
X-Gm-Message-State: AOJu0YxfOYsZ+NKlEGM87DccwpoDgIQ+dcsCBxjHfSiCo4y8BDutgII+
	yCpHQyHkt9Bb/ghdR3mLBFawCVbbrHErB+6RSIvgKeuPx7Vik1d2Q6su
X-Gm-Gg: Acq92OGHAYlkt5fPqWP65lLqVbcIFfQJvy9edaVWMuMBM+2J0MJK+SGueyxbYj6dWgH
	qSi4geLJ6OlmOXwuXqgZr0gSvA/edZR5gvEaEiV1QQhIfMHVtw/ubTGBQwix+EspFy+45c5Ga4t
	eCf62z0HL/JP0jajjJp/1S4N4+ijsbzR91fG7omnpgNzUsahF36rs0od0FXRcQMyaRXRSa6ePmT
	zNrugp5Vbul+RY/H7pgLy4rgPCbCx5rr6YRUWLtwGdRza7c8J6GCBaxYdMbOr9qWMfYvCNSYECC
	i8vNS5T/ZMu4Edp/hHkeBw5EALvXqjEsKtRVoNNecbz7VnCU71KtQ/C01KglXrm5iYFuAM42ZX4
	3ocHz07ax4xblrKDvw7IPWBBaN+scoQitvA1/kiaUeI6+DxIoSTF+RZwB5W3FcIHNc8mV3+kpXj
	YKXSWXH7+g09AK5903Ey26VJ6bgItIjaPCjNqgjReb+iNyhoZwhoxjQU1vGx55IFBFN08=
X-Received: by 2002:a05:600c:8518:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490c4993bdbmr423122135e9.24.1781082641859;
        Wed, 10 Jun 2026 02:10:41 -0700 (PDT)
Received: from [10.25.222.173] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm579850645e9.1.2026.06.10.02.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:10:41 -0700 (PDT)
Message-ID: <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
Date: Wed, 10 Jun 2026 02:10:37 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/2026 12:37 AM, Krzysztof Kozlowski wrote:
> On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The names of the carveout regions are derived using the names of the
>> reserved memory devicetree nodes, which are referenced using the
>> "memory-region" property. This adds a restriction on the names of said
>> devicetree nodes, often bearing specific names such as: "vdevbuffer",
>> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
>> specification's recommendation, which states that the devicetree node
>> names should be generic.
> 
> No, it does not. Names like rsc-table feels exactly like DT spec is
> asking - for a name matching purpose. Are you sure you read the spec?

Quoting from the spec:

"The name of a node should be somewhat generic, reflecting the function of the
device and not its precise programming model"

and looking at the examples provided in "2.2.2 Generic Names Recommendation",
wouldn't "memory" be a more appropriate choice for the DT node name instead of
"rsc-table" since it's more generic, while still matching the purpose
of the device? Or perhaps I'm interpreting this the wrong way?

> 
>>
>> Fix this by documenting an additional, optional property:
>> "memory-region-names". This way, the carveout names can use the values
>> passed via "memory-region-names", while keeping the devicetree node
>> names of the reserved memory regions generic.
> 
> I don't see how anything here is fixed. memory-region-names has nothing
> to do with node names.

The idea here is that the names of the carveout regions can now be passed
via the "memory-region-names" property. Previously, we were using the DT
node names for that.

Thus, we can now use the more generic "memory" name for the DT nodes since we
no longer use them for the carveout names.

> 
> Best regards,
> Krzysztof

