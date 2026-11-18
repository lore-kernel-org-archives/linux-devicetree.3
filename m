Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000577;
	b=nrfkQ8YupAUsj7ya5hug7Pfai+VzIJRAOGKqsWxNhJVDn/zGnw5q2HPUeEGJqC6q/fk1
	 cFWtO9xDcGkG5qDfD2++Z5pSN+2vIcx7aVlRUPpxUp3UAsGaJX8zM7XVC/9VpFy8yYfvp
	 tRjFpx9SqFItARm4/gHtSh5jHU/eVbaCqNt2Nq5DUSxzP6YCz/4hHBvxGDt2zIE5UTqKq
	 /3TPMXIaZJMSdFTDs/7vVFiwBmr4F1SBZuWzBrPfXgdo3rb1D9qiz1IWIBHkSpB/71iYp
	 d2n/sd4tro0wf9Lyx6D+p+5LcNLxc/0C4TPZWOuRVUWliHrSl/oA29QszMYlhtmCVkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000577;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/A6opRZsaFZ9lkmOVMamZXIZfOAQ5sSBkBZO5tlVAlk=;
	b=vr14Fqq8gdiVNJD9+AJQGAOvqnhLyXyr21XTAQPxQ0z46sjW8foOjmFLSvqmVoMxRqA3
	 nS8tBxPuWuiQV40yCcyD33nM3DBJmmm3ScqQXE/wwQePXQYu3vdQr6WfZO+U4tVYZB7Z8
	 oVKf+vfQ6dYXsZ5pyaRAP5sPshUEPdrZROFGdYwHwt53BP9Ij/or7r8sC6unitsScgc20
	 w3cm13/3/4YnbbR6Ezx0yk2weK4Z0CiGQIGx95pPNyl6Xn8mUrgUZ1ZTtAKeNsJYjb3tc
	 k77YdjXCN7LHmHKS1R+iZ4AkjWRhFYi/+532CONYXhmYDF5r0XDKIXNS14aEA+hBiQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kyAL86Bt;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFA4606A31C;
	Wed, 18 Nov 2026 11:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FFA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kyAL86Bt
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C244E1596;
	Wed, 18 Nov 2026 03:16:12 -0800 (PST)
Received: from [10.57.70.68] (unknown [10.57.70.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 348CE3F673;
	Wed, 18 Nov 2026 03:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795000575; bh=iLP9S0NH412Zwx3LNhRGYAraeXk9erJEWXtRoZDB+zY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kyAL86BtbOL7jbko8CCUePFTTBJW9kcTp2GiDquOTc9D8w5h0PhNepAmmppleRly2
	 tuwuC52XqxlsFBb7oYQJylNLRzsIERUEsTzhI+1P+5lX85FvG3EdiGeRzebZchJnm6
	 b9fyt2gQKP+DXROZOOJmU4q7mYdNDnYo2kBwrVgg=
Message-ID: <3348a751-87df-4f22-80e0-8467c6b263f9@arm.com>
Date: Wed, 18 Nov 2026 11:16:10 +0000
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
Subject: Re: [PATCH v23 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
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
 <20261118-enable-byte-cntr-for-ctcu-v23-2-67fd9db6bc0e@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-2-67fd9db6bc0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2026 08:02, Jie Gan wrote:
> Introduce functions for creating and inserting or removing the
> etr_buf_node to/from the etr_buf_list.
> 
> The byte-cntr functionality requires two etr_buf to receive trace data.
> The active etr_buf collects the trace data from source device, while the
> byte-cntr reading function accesses the deactivated etr_buf after is
> has been filled and synced, transferring data to the userspace.
> 
> Reviewed-by: Mike Leach <mike.leach@arm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
>   drivers/hwtracing/coresight/coresight-tmc-etr.c  | 205 ++++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h      |  18 ++
>   3 files changed, 222 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index bc5a133ada3e..bc7dd676da47 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		idr_init(&drvdata->idr);
>   		mutex_init(&drvdata->idr_mutex);
>   		dev_list = "tmc_etr";
> +		INIT_LIST_HEAD(&drvdata->etr_buf_list);
>   		break;
>   	case TMC_CONFIG_TYPE_ETF:
>   		desc.groups = coresight_etf_groups;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 361a433e6f0c..e9213f456834 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1268,7 +1268,9 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>   	}
>   
> -	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
> +	/* The sysfs_buf is owned by the etr_buf_list, don't replace it */
> +	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF ||
> +	    !list_empty(&drvdata->etr_buf_list)) {
>   		ret = -EBUSY;
>   		goto out;
>   	}
> @@ -1918,6 +1920,204 @@ const struct coresight_ops tmc_etr_cs_ops = {
>   	.panic_ops	= &tmc_etr_sync_ops,
>   };
>   
> +/* Remove the nodes of the list, the buffer @keep is never freed. */
> +static void __tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata,
> +				     struct etr_buf *keep)
> +{
> +	struct etr_buf_node *nd, *next;
> +	unsigned long flags;
> +
> +	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
> +		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +		if (keep && nd->sysfs_buf == keep) {
> +			/*
> +			 * The buffer is owned by drvdata->sysfs_buf and may hold
> +			 * the captured trace data, whatever the mode of the sink
> +			 * is now. Only drop the list's reference to it.
> +			 */
> +			nd->sysfs_buf = NULL;
> +		} else if (nd->sysfs_buf == drvdata->sysfs_buf) {
> +			if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
> +				/*
> +				 * The sink is still enabled in sysfs mode. Keep
> +				 * the live buffer owned by drvdata->sysfs_buf
> +				 * and only drop the list's reference to it.
> +				 */
> +				nd->sysfs_buf = NULL;
> +			else
> +				/* Free the buffer below through nd->sysfs_buf */
> +				drvdata->sysfs_buf = NULL;
> +		}
> +		list_del(&nd->link);
> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
> +		/* Free the buffer (NULL is ignored) and the node out of the lock */
> +		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
> +		kfree(nd);
> +	}
> +}
> +
> +/**
> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
> + * @drvdata:	driver data of the TMC device.
> + *
> + * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
> + * If a node holds the live sysfs_buf and the sink is enabled in sysfs mode, the
> + * node is removed but the buffer is not freed; ownership stays with
> + * drvdata->sysfs_buf.
> + *
> + * Locking: must not be called with @drvdata->spinlock held. The spinlock is
> + * taken internally to serialise the @drvdata->sysfs_buf accesses and the
> + * removal of the nodes against the ETR sink enable/disable paths and the
> + * generic sysfs read. There must be only one owner of the list at a time.
> + * Must be called from process context: buffers are freed with the lock
> + * released.
> + */
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
> +{
> +	__tmc_clean_etr_buf_list(drvdata, NULL);
> +}
> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
> +
> +/**
> + * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
> + * @drvdata:	driver data of the TMC device.
> + * @num_nodes:	number of nodes want to create with the list.
> + *
> + * Locking: must not be called with @drvdata->spinlock held. The spinlock is
> + * taken internally to serialise the @drvdata->sysfs_buf accesses and every
> + * update of @drvdata->etr_buf_list against the ETR sink enable/disable paths
> + * and the generic sysfs read. There must be only one owner of the list at a
> + * time. Must be called from process context: buffers and nodes are allocated
> + * with the lock released.
> + *
> + * Return: 0 upon success, else the error number: -EBUSY if a generic sysfs
> + * read is in progress, -EINVAL if the sink is not enabled in sysfs mode or
> + * a buffer is of the reserved buffer mode, or the error of the allocation.
> + * The live sysfs_buf is never freed on failure.
> + */
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
> +{
> +	struct etr_buf_node *new_node;
> +	struct etr_buf *sysfs_buf, *live_buf = NULL;
> +	unsigned long flags;
> +	size_t size = drvdata->size;
> +	int i = 0, ret = 0;
> +
> +	/* We don't need a list if there is only one node */
> +	if (num_nodes < 2)
> +		return -EINVAL;
> +
> +	/*
> +	 * All the etr_buf of the reserved mode are mapped to the same reserved
> +	 * region, so they can't be used as separate buffers of the list.
> +	 */
> +	if (drvdata->etr_mode == ETR_MODE_RESRV)
> +		return -EINVAL;
> +
> +	/*
> +	 * We expect that sysfs_buf in drvdata has already been allocated.
> +	 * Wrap the live sysfs_buf into the first node so the captured trace
> +	 * data is preserved. Take the sysfs_buf and add the node under the
> +	 * lock, so that the ETR sink enable path sees a non-empty list and
> +	 * doesn't replace the buffer.
> +	 */
> +	new_node = kzalloc_obj(*new_node, GFP_KERNEL);
> +	if (!new_node)
> +		return -ENOMEM;

Since we know we need num_node entries at max, could we not allocate 
them in oneshot (kcalloc()) and free the unused ones at the end ?

> +
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +	/* The sysfs_buf is in use by a sysfs read session */
> +	if (drvdata->reading) {

> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +		kfree(new_node);
> +		return -EBUSY;

This pattern is repeating quite a lot, do you think this can be a single
exit from the function for such cases, something like goto err_unlock;

> +	}
> +
> +	/*
> +	 * The sink enable path reuses or frees the sysfs_buf of a sink which
> +	 * isn't enabled, so only wrap it while the sink is enabled in sysfs mode.
> +	 */
> +	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS) {
> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +		kfree(new_node);
> +		return -EINVAL;

2

> +	}
> +
> +	if (drvdata->sysfs_buf) {
> +		/* The mode may have been changed since the sink was enabled */
> +		if (drvdata->sysfs_buf->mode == ETR_MODE_RESRV) {
> +			raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +			kfree(new_node);
> +			return -EINVAL;

3

> +		}
> +
> +		live_buf = drvdata->sysfs_buf;
> +		/* Keep the buffers of the list in the size of the live one */
> +		size = live_buf->size;
> +		new_node->sysfs_buf = live_buf;
> +		new_node->is_free = false;
> +		list_add(&new_node->link, &drvdata->etr_buf_list);
> +		new_node = NULL;
> +		i++;
> +	}
> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +	/* Free the node if there is no live sysfs_buf to wrap */
> +	kfree(new_node);
> +
> +	while (i < num_nodes) {
> +		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
> +		if (!new_node) {
> +			ret = -ENOMEM;
> +			break;
> +		}
> +
> +		/* Allocate the buffer with the lock released */
> +		sysfs_buf = tmc_alloc_etr_buf(drvdata, size, 0, cpu_to_node(0), NULL);
> +		if (IS_ERR(sysfs_buf)) {
> +			kfree(new_node);
> +			ret = PTR_ERR(sysfs_buf);
> +			break;
> +		}
> +
> +		/* The buffer mode may have been changed to the reserved mode */
> +		if (sysfs_buf->mode == ETR_MODE_RESRV) {
> +			tmc_etr_free_sysfs_buf(sysfs_buf);
> +			kfree(new_node);
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		new_node->sysfs_buf = sysfs_buf;
> +		/*
> +		 * The drvdata->sysfs_buf write and the list update need the
> +		 * spinlock, to serialise against the ETR sink enable/disable
> +		 * paths.
> +		 */
> +		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +		/* We don't have an available sysfs_buf in drvdata, set one up */
> +		if (!drvdata->sysfs_buf) {
> +			drvdata->sysfs_buf = sysfs_buf;
> +			new_node->is_free = false;

Is this supposed to be done in enable ?

> +		} else {
> +			new_node->is_free = true;
> +		}
> +		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);

Instead of adding every node as we go, could we maintain a local list 
and add that to the the etr_buf_list at the end of all the allocations
and when we are sure that things are still sane to do ?
Set all new_node->free = true and when we get to add the local list
set the sys_buf with the first entry and mark it false.

> +		i++;
> +	}
> +
> +	/*
> +	 * Clean the list if there is an error, but keep the live sysfs_buf even
> +	 * if the sink was disabled meanwhile, as it holds the captured trace data.
> +	 */
> +	if (ret)
> +		__tmc_clean_etr_buf_list(drvdata, live_buf);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
> +
>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
> @@ -1928,7 +2128,8 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>   		return -EINVAL;
>   
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> -	if (drvdata->reading) {
> +	/* The sysfs_buf is owned by the etr_buf_list */
> +	if (drvdata->reading || !list_empty(&drvdata->etr_buf_list)) {
>   		ret = -EBUSY;
>   		goto out;
>   	}
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 319a354ede9f..7c604b9f92e5 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -208,6 +208,20 @@ struct tmc_resrv_buf {
>   	s64		len;
>   };
>   
> +/**
> + * struct etr_buf_node - node of the etr_buf_list
> + * @sysfs_buf:	Allocated sysfs_buf.
> + * @is_free:	Indicates whether the buffer is free to choose.

super minor nit: Does this mean the buffer is available for tracing ?
Simply "free" is good enough. Or choose inverted logic "live" or "busy"

Suzuki

> + * @pos:	Offset to the start of the buffer.
> + * @link:	list_head of the node.
> + */
> +struct etr_buf_node {
> +	struct etr_buf		*sysfs_buf;
> +	bool			is_free;
> +	loff_t			pos;
> +	struct list_head	link;
> +};
> +
>   /**
>    * struct tmc_drvdata - specifics associated to an TMC component
>    * @atclk:	optional clock for the core parts of the TMC.
> @@ -245,6 +259,7 @@ struct tmc_resrv_buf {
>    *		(after crash) by default.
>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>    *		 Used by ETR/ETF.
> + * @etr_buf_list: List that is used to manage allocated etr_buf.
>    */
>   struct tmc_drvdata {
>   	struct clk		*atclk;
> @@ -275,6 +290,7 @@ struct tmc_drvdata {
>   	struct etr_buf		*perf_buf;
>   	struct tmc_resrv_buf	resrv_buf;
>   	struct tmc_resrv_buf	crash_mdata;
> +	struct list_head        etr_buf_list;
>   };
>   
>   struct etr_buf_operations {
> @@ -447,5 +463,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>   				   enum cs_mode mode,
>   				   struct coresight_path *path);
>   extern const struct attribute_group coresight_etr_group;
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
>   
>   #endif
> 

