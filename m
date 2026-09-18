Received: from mail-ej2-f24.google.com (mail-ej2-f24.google.com [74.125.228.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFBB3A7F7A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741666; cv=none; b=PXtCC0kIxeAAya3Br8QuHzdU1n82wx1bycv+vNYaROqCUrCAI9AzWGcRQRTNAZTSSX3MxCV4PyKEqPwPp5ojHlFBqnKQBtag4qtYaKWS44hUHENZ3LlQzrJH61onPcNefeAJTMlvgjDEcy1sCRfSZS5NU88dTCHDAV9aW3H91L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741666; c=relaxed/simple;
	bh=sgunm2sNjagt46bq1ZIC/qX8k5vKqpE4P8hC394mvU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t3ToGO2uCz2a3VMqekdHTBOJKFhy3YXAHn9NHJwJmQhkJiUetlJoIXU2LKemrez0fvBv7DsYKSlpU/i4pXoqSwtNaPZlhi5gt7Zwnf9N4+8d95JGuMQKjklxqm4Dh87cLWPv+c8q/nQFiwoaDr0Gi1z06UOA3aOOHffCfcWjZs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0c/haM4; arc=none smtp.client-ip=74.125.228.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0c/haM4"
Received: by mail-ej2-f24.google.com with SMTP id a640c23a62f3a-c29d33431c8so108025766b.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789741663; x=1790346463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnD2Ei89mkiOFb1zZQQ79Aq7EmWfIQzBftxY+5mS48k=;
        b=Q0c/haM434hFxRb9HrsA8HMhQ0aOYGv8PgHBrbqBJeyp/+aT5rApMn3T0JqghomwUW
         q8y2OWHAWCdnBzrh1nqiidF/S8Hp98uwPim6fYZfFsVX690bH/yv3113Q00lT7nb3fNG
         CRscyAc6emTw4eOnjRlzLsRVxc512gqkfkRZb8oypb7n9gFZJfIxA1B4OsUlwzlLOvFA
         zJ12gqU0/I1Hr+dE+lUijjXGRIQ5yD3533ZduBBF9fOnaawbEWC3xH6nXnGF9l9rT3ua
         qcY/rZJw9ABTJUHRati5Vdte22n0RM8V8fdXj/jf2ptSov9y9/iL+XoITfh6OSdpv4Ta
         W04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741663; x=1790346463;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnD2Ei89mkiOFb1zZQQ79Aq7EmWfIQzBftxY+5mS48k=;
        b=mEzCwHFZQrv3BNMXVSeL38AtjZHGJG5pajGPnZ5j5P51X48Y4Uw5RBgQfi1byosg+g
         SwAMdQRHXmHoYnzsn/3xFb6NgrT1ExQ5wzkJFX0Psrn0PWNd8IN/pVHwMoHZew9WmbX2
         +hWcJFBKL2LXAhNjGuHK9XlhF+t064LUG1/r+/rc58Dw3a7oxJqiKNF3ONiNp/gAx+Nj
         IL+6LLJxDqgJVc6cLepkEzAuuiud1+mYAcqsX3075G9fj/UFA8btIiL+uEpDMqJJcc/n
         pjAuSpkUL3OX0rf3NQNKaVYusIYliaBv00wRSUglRHlp0k8vbTV6UijhLiqG2iTkBrtL
         MqYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2lGYMziwJ9XabSOmpgJmV6mvo6wXUoLK0xIrJlrqLP2TJAOv3gTZZ5g/xxUSkErYRbtaygA0P5Bsi@vger.kernel.org
X-Gm-Message-State: AFuF++lZ+VUk77afvio1pFb8eWYGxodVbCl1DmqTbEmKzMu+cBm4XJiw
	z//QhnqMB3C+AN/8VDOc80WwHSj7NBHFp7OITBHnuLQCU8maDZFt7Krbt3Wyq69htYY=
X-Gm-Gg: AYBFou19hVGEhTQYHSNTp5R3m7oN7khngENUTyGFcPqhnYJ0tiux0A6AHASanRiKoTZ
	cfd41tTP3h0+JTH6mq/3W3OehiSQUDACXe1M8wZTnF0uk9gApLlW/2XOb9caDsl30ToC0qjriNc
	Kk/HCJkvkiasfXenXWUNgpxynSHHimPlnIRiI7Z4M/ivHvs5johVgXNvOOTkm606nMKoFEd0/Tm
	r3J+q8VGhXUsg2c9mHpbA7uj6eu8W4/1sD2ZuEB1xA2XRBPBlx68wlri12lWX7cQI422G4W0z7k
	zL7TFdhaCw+pVWtw08VkdH1tdE4kD09MPcgjMFOZa2GZ5+Fkv3cbklmOq5tGXb6hjqtRf791Bn1
	968EWZwY2+32GPlJnz7UxcEV3SzySa6OQYp5nBTiW8N7bMbvM3yGQidElYBSZxxTR7Uv0WMXI/x
	HNqTaGlGtkelltoKnsxn85UbLPAlp7N6ZP77omEQ48kw46rocuw5AacQF21j9YA/LBvFPVm1/yp
	llHAQwkpQ==
X-Received: by 2002:a17:906:478d:b0:c29:5a76:72be with SMTP id a640c23a62f3a-c2a157c41a8mr252060066b.24.1789741662748;
        Fri, 18 Sep 2026 07:27:42 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb8ba5bsm61582566b.45.2026.09.18.07.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:27:42 -0700 (PDT)
Message-ID: <fd6bf432-0ce8-4793-821f-f08321b13a5b@linaro.org>
Date: Fri, 18 Sep 2026 15:27:40 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 2/6] phy: core: Add phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>
 <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/09/2026 15:10, Neil Armstrong wrote:
>>   EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>> +/**
>> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by 
>> device_node
>> + * @np: node containing the phy
>> + *
>> + * Returns: the phy associated with the device node or ERR_PTR.
>> + */
>> +struct phy *phy_get_by_of_node(struct device_node *np)
>> +{
>> +    struct of_phandle_args args = { .np = np, .args_count = 0 };
>> +    struct phy *phy;
>> +
>> +    mutex_lock(&phy_provider_mutex);
> 
> I don't really understand the usage of lockdep_assert_held(), but why
> does _of_phy_get() uses lockdep_assert_held() and here you use mutex_lock()
> like before patch 1 ?
> 
> Neil

assert_lockdep_held() is just an assertion that the lock is held, Loic 
suggested adding it BTW. It ensures that when another function calls 
this function it holds phy_provider_mutex.

i.e.

phy_get_by_of_node()
{
	mutex_lock(&phy_provider_mutex);
	_of_phy_get();
	mutex_unlock(&phy_provider_mutex);
}
EXPORT_SYMBOL(phy_get_by_of_node);

_of_phy_get()
{
	lockdep_assert_held(&phy_provider_mutex);
	/* happy days */
}

phy_broken_locking()
{
	_of_phy_get();
}
EXPORT_SYMBOL(phy_broken_locking);

_of_phy_get()
{
	lockdep_assert_held(&phy_provider_mutex);
	/* wails plaintively into the void */
}

---
bod
