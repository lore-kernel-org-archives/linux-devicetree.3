Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600CB4E80D0
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558520; cv=none; b=sSyRooGjuJrbOd4w5KTWbPouSBDQ78qpdaPvvgYMcd2zK5oPhGbpqD2Jnh0rUjG0bYkroctv7cFVmHTn6Fj5K8LxegQTzMHcB/Ed+M9p3rJtTOfQaYeyTx8I8dUNOI0nDlYFcDxQMzBI5le400SirSTsGk24zmg7tegmhgoQ890=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558520; c=relaxed/simple;
	bh=JxFaW/WYqlOtA984BXiqHodpwCvgbe1pUjpcetQOGtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XekV4lrt8E3tjkfGPl6q7GL0nXBNPE65WFU0pqsXRBxWexG7Ec8HJubSTNvDdglwVnbXci6rRqE7FNETyWcHL77hdVANHUSPMBDcTScHpRkcBmVjmSNCGqn8jbx7hSe2W1kp2SoZiyhrl/dsjiTMffP0shCNimUUK1BPQtV893I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8w6Whk1; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8w6Whk1"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa650c8so143608866b.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789558506; x=1790163306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+ON5LylyLSRvB3Oy5FN+PptZ1PxOVJXbkytbHhMasY=;
        b=g8w6Whk1NXiS+r03W7LHSadISSNNdCcuyP+2QyoIr6Ja+0qXoeDqTvTM8ciHye3ZcZ
         H7f+LLrv6RoFQ7BQm+hpm1022MYEZn0bJ/3qv6TtC7kBJ45qkX/oaqk92qArVXB97mqh
         K6hESofwUV3tTZTaX8oNmMqbRsnMSYIyXKagV0doq1ESzmAaPn6S+dUvLbldT1njDdkY
         3JEY3ZLqwGaZz0gGoAVCb926rv1c8Tq9Dd8yBPiH4bthCmdFA9knY8YsR/kbaGbHRQ/c
         oocBsfBr6mDjTBmCL5CFgRdBI5KSgQDpZGs97/8yhSavJ+xX0r6Mx8uwdwU+/xeCZl0G
         9MOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558506; x=1790163306;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+ON5LylyLSRvB3Oy5FN+PptZ1PxOVJXbkytbHhMasY=;
        b=arqcr9ynZnFJqiGKeQoCuefXrAFar/VsHXl3+zs+L7EaT1rUNAw+4sozj/KKIGI18f
         jXhuAk6fGAlUayWwVpeyoFalRDzt6O7FACD+5UtrYy0vmvYo4ZPASuBBrz0ws25WifdG
         qaZZwqnKaKIfoWqeFfQP0jBtQaEevPIrdU/VkvmxPb6vNyNLDiesIhvH8He7q6dxze5p
         EVPnorJnDvYgFrbt9WlDu9wE47auShR0bARHKpFlDEP2T1HTp4gMcUL8IKx0nWNxeoIo
         Qn16JfkMZ6RsvOvUPrYJTeV+FQSJ6I4l4vQ+qXtE159RO8WutvtzF1yuvtgMLsFTdOmb
         H5UQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjYDorvuj+HzeI26aZKeA6W3eMPvwXof6p2NJOIZkIMI1w0Gp+20c+86MzCUJ6i/7ksXWhYdZ/bM+3@vger.kernel.org
X-Gm-Message-State: AFuF++nYTy7l9zbF/7pnx7tlIKHAGnLfhQsj9ab+5aMBi03SG2HOVyer
	aqXCQznxBiClnYaZ6N1At9/fdPl8VE96o/GJeVm5fVcOwA72tC+wqQC2LLYECDGVuts=
X-Gm-Gg: AYBFou1mSVO+MK6huuqe43wraWYICGaUBqqa0/MKclicOvk4e5RaGVEfrtMCek3sa5A
	XEPuOn8fReucL+WAWCyLhJCchadianXICR8YvQndxaDlkDQNaHxKjsSJVvBA8bM7l/QALZfdtSP
	iANgW9Sr7Tnxfib5ze480wI0P6dO+RxjM5wXQqLa3u1R7uMiDXWOMjVRZ4sbjycZgvh+wgIyrG6
	G5PACmXR0EsMRcfdW+q4HW6uFFVhf5etx+FreNr/qxzYQyEiHJFLh8U/rpV2nBcakxkeTIx6DIF
	0M9FZsOY6s0axRHt70P+Affid1tnr2dVyPfSeNp33tFRdoxUOuSKyZ1Vd3zKsCbhwl57NsjbQmr
	OGV1MdyBV1s7ltvG0nxL8dy0jtw/SeOqpkzzyZiB1MG3HmqRqtHQeK3QS5QOIURPjz1woJJSEF9
	7pUwCID45zbDrVj8h/Nh9yCG7Ta6X4FRNZpmbyS7ZZNbGOOoXFSn8Fq9w57w8av5HuPwVjnkRJK
	jtCK0vsBdyQno9XnV7rjVE=
X-Received: by 2002:a17:907:d0b:b0:c25:c54d:d1a2 with SMTP id a640c23a62f3a-c29e5236f43mr142950366b.18.1789558506076;
        Wed, 16 Sep 2026 04:35:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0850ccsm117462366b.8.2026.09.16.04.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:35:05 -0700 (PDT)
Message-ID: <92a4b3dd-4661-4a4e-90fd-83249acf0dbe@linaro.org>
Date: Wed, 16 Sep 2026 12:35:04 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 2/5] phy: core: Add phy_get_by_of_node()
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 media-ci@linuxtv.org, robh@kernel.org, linux-clk@vger.kernel.org,
 olteanv@gmail.com
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-2-e2197a3e2551@linaro.org>
 <20260906143127.2B5691F00A3A@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260906143127.2B5691F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2026 15:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] phy_get_by_of_node() misses the legacy usb-nop-xceiv workaround, causing infinite -EPROBE_DEFER loops.
> --
> 
> commit a021b561c8a9bfb36addca720d49ea935b34a131
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> phy: core: Add phy_get_by_of_node()
> 
> This commit introduces phy_get_by_of_node() to allow looking up a phy
> directly by its device node. It refactors the existing lookup logic in
> _of_phy_get() into a new shared helper function called
> _of_phy_get_with_args().
> 
>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>> index 89addd732bff3..490a7cde6d40a 100644
>> --- a/drivers/phy/phy-core.c
>> +++ b/drivers/phy/phy-core.c
> [ ... ]
>> @@ -1001,6 +1015,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>>   }
>>   EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>>   
>> +/**
>> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
>> + * @np: node containing the phy
>> + *
>> + * Returns the phy associated with the device node or ERR_PTR.
>> + */
>> +struct phy *phy_get_by_of_node(struct device_node *np)
>> +{
>> +	struct of_phandle_args args = { .np = np, .args_count = 0 };
>> +	struct phy *phy;
>> +
>> +	if (!np)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	mutex_lock(&phy_provider_mutex);
>> +
>> +	phy = _of_phy_get_with_args(&args);
> 
> [Severity: Medium]
> Does this new API miss the legacy compatibility check for usb-nop-xceiv?
> 
> In _of_phy_get(), there is a workaround that returns -ENODEV if the
> device is compatible with "usb-nop-xceiv". Because this workaround was
> left in _of_phy_get() rather than being relocated into the shared
> _of_phy_get_with_args() helper, phy_get_by_of_node() bypasses it
> completely.
> 
> Could this cause drivers looking up a "usb-nop-xceiv" node via this new
> API to receive -EPROBE_DEFER instead of -ENODEV, leading to infinite
> probe deferrals and breaking fallback to the usb-phy subsystem?

I don't agree with this.

The compat string workaround should live where it is used, not be pushed 
down into generic layers where it is not.

No media-graph lookup needs this hack.
> 
>> +
>> +	if (IS_ERR(phy))
>> +		goto out_unlock;
>> +
>> +	if (!try_module_get(phy->ops->owner)) {
>> +		phy = ERR_PTR(-EPROBE_DEFER);
>> +		goto out_unlock;
>> +	}
>> +
>> +	get_device(&phy->dev);
>> +
>> +out_unlock:
>> +	mutex_unlock(&phy_provider_mutex);
>> +
>> +	return phy;
>> +}
>> +EXPORT_SYMBOL_GPL(phy_get_by_of_node);
> 

