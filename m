Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001614;
	b=qH7C8jTYD+wo8E17JyQ2m/xkH1uIxYqyd+7n92gLlF8dOL98WxndpCOSxsQPDpAJl65A
	 31GBVuz7c8U0yZo9BzO1IUnZWxUlzPiOkDtqd6CZ2U3PhsatTNxSTDXjGVgMLGq3wsONf
	 VHTfgCpkjXgvXeYhNlDWxr7Zb/J0oanTNnaQMQwFdSUcRLRXdLDlCWn0n0vXLWjFDJo1j
	 UJGrNYtCzP+myQBBW1zZ/AwCbcqP4hjhh6R2CWUqN6+HdGOO1w1mTPoofyYX7kgyjcXRo
	 XLcMEcWjGV+lCuz9y57x9Rirl5R7iL9H/pJwS11QAvTGFXPx59tDnZe96o+LnTCJ2/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001614;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=FkG1M7L3zIjGXumIoOOlMZR+O73PQTM6nqG0PHku6sU=;
	b=Yzz0y6avUpmpFvJo+WeOeLxi9bVOzHuEjJI9bX3PjoRy7PkaDwo9/g7q/NStj4m8zd60
	 //1OikksBxrSgorNZUQN3j+aC5e3oFCtY609LZWGg7TFb1Ks9/2vSeZnR+xMBbXLsm4CO
	 /zbcDbQibhlUCrsRBj3OEwRhxying8DJBnUue/10ta0IsJOCmJ8Rv/fZKI2n8Im9mcwdm
	 aYs2HVbuCpyciXnmDszdUiuiTTwYnzSIDIyR3o7gopFPTr0eewn3lcTotfmxu0ajSfU6y
	 pDNxK+mm1sC9Parmku7rKZ8KD1G8TEXl75fxE9k6cLbrWi7OIGl6ndeujKSzd8iOsDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eyo362ur;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59731606A31C;
	Wed, 18 Nov 2026 11:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59731606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eyo362ur
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 693131596;
	Wed, 18 Nov 2026 03:33:30 -0800 (PST)
Received: from [10.57.70.68] (unknown [10.57.70.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F90C3F673;
	Wed, 18 Nov 2026 03:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795001613; bh=csl8kCTvz4XLKbFvRoYYYYrgaV2LpO+qLRWnlyKVl84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eyo362urxliBQcBcqOcEl9e1QlQWWWQHXvpyHTu/vd/bS3HdZH8Bd4wi6QQ4+0ddq
	 vYaGDIBsof+HNIzGdS0nbDVtuXoFA+k5vXjogbBUsVR1xSuvVlaEQfHOOCEl/Xe0HU
	 E9Hg+ss0vh+eH7NXWRpy7lSLWwc7qY8stVcYjyZY=
Message-ID: <878eabf1-0742-45ad-892a-4c6a7b615d1f@arm.com>
Date: Wed, 18 Nov 2026 11:33:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
 <20261118-enable-byte-cntr-for-ctcu-v23-3-67fd9db6bc0e@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-3-67fd9db6bc0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2026 08:02, Jie Gan wrote:
> Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
> etr_buf_list without disabling the sink. It returns the node of the
> switched out etr_buf, so its synced data can be read while the ETR keeps
> tracing into the new one.
> 
> Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
> done in one critical section. Otherwise tmc_disable_etr_sink() can run
> in between and leave drvdata->etr_buf out of sync with the hardware.
> Provide the sequence as a TMC helper, so callers don't need to know
> about the locking of the ETR state.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
>   2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index e9213f456834..5032f5598e15 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>   
>   }
>   
> +static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
> +{
> +	u32 sts;
> +
> +	CS_UNLOCK(drvdata->base);
> +	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
> +	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
> +	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
> +	writel_relaxed(sts, drvdata->base + TMC_STS);

see below




> +	CS_LOCK(drvdata->base);
> +}
> +
> +/**
> + * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
> + * @drvdata:	drvdata of the TMC device.
> + *
> + * Stop the ETR, hand over the current buffer for reading, switch to a free
> + * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
> + * so it can't race with the sink disable path.
> + *
> + * Return: the node of the switched out buffer, or NULL if the sink isn't in
> + * sysfs mode or there is no free buffer. The ETR is left untouched in both
> + * cases.
> + */
> +struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
> +{
> +	struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
> +		goto out;
> +
> +	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
> +		if (nd->sysfs_buf == drvdata->sysfs_buf)
> +			curr_node = nd;
> +		else if (!picked_node && nd->is_free && !nd->reading)
> +			picked_node = nd;
> +	}
> +
> +	if (!curr_node || !picked_node) {
> +		curr_node = NULL;
> +		goto out;
> +	}
> +
> +	__tmc_etr_disable_hw(drvdata);
> +
> +	/* The switched out buffer is free again once it has been read */
> +	curr_node->is_free = true;
> +	curr_node->pos = 0;
> +	curr_node->reading = true;
> +	picked_node->is_free = false;
> +	drvdata->sysfs_buf = picked_node->sysfs_buf;
> +	drvdata->etr_buf = picked_node->sysfs_buf;
> +
> +	tmc_etr_reset_sysfs_buf(drvdata);

Why are we doing this, when the following __tmc_etr_enable_hw() already 
does the right thing ?

Suzuki


> +	if (__tmc_etr_enable_hw(drvdata))
> +		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
> +out:
> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
> +	return curr_node;
> +}
> +EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
> +
>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>   {
>   	__tmc_etr_disable_hw(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 7c604b9f92e5..30b15c38b080 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -212,12 +212,15 @@ struct tmc_resrv_buf {
>    * struct etr_buf_node - node of the etr_buf_list
>    * @sysfs_buf:	Allocated sysfs_buf.
>    * @is_free:	Indicates whether the buffer is free to choose.
> + * @reading:	Indicates the buffer attached to the node is being read by
> + *		the user.
>    * @pos:	Offset to the start of the buffer.
>    * @link:	list_head of the node.
>    */
>   struct etr_buf_node {
>   	struct etr_buf		*sysfs_buf;
>   	bool			is_free;
> +	bool			reading;
>   	loff_t			pos;
>   	struct list_head	link;
>   };
> @@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>   extern const struct attribute_group coresight_etr_group;
>   void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>   int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
> +struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
>   
>   #endif
> 

