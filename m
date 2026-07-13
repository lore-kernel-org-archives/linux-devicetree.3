Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917BC3DE44D
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934378; cv=none; b=VbOKHHWD7dFLfKoMIxmirsURojbqvTj8A9EQvbX2qieoejtekiPGhI1rwR1kga/4dG+TvJ9/b3+2NgG9nOzp8y3A5VhezOuDRei6JU+VwRw+B87/8ewLWt+FPlFm7pzvyIxrmd/DBwYs1tD2dLXVuY62OeaAzWW/qeLhv9AF1aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934378; c=relaxed/simple;
	bh=KOQaKR/u1MmVmLeAhSlpZ0wm4OphLaNXFFVIAjD+sVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSZB1KIB9EgGdFy+sFfZpz/d9Zitz0xco3/4YbQ/rr7IBV1qtZgFR6LCfiXQQ2wrhv02ZrZgY3ryv8iKUV/ZKb15fKblrdPXEWuBEqL8AqES0ShxwUE8Koczr+ZbCv1droao2a3lstY5sWsNZfca0aeSv+A73H2hiD4bY2DBz0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATlEl51J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPJXngOv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATlEl51J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPJXngOv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nk0p668651
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uw8kTPaH7dffEJnhUq7CagwGtV0VCo42/f4H9lygTvo=; b=ATlEl51JBbo3kkCz
	0muw7PE+rNAfuSUyU4WCQHnvyDuLvvXojhQFA/bPDswHwshn1+/4knhk1Lslbqvz
	48jf4q/THqDu8qIodVzklDx00/DI/TQMsguX/PPd5PgX5pa0i6t6Fy9Z95OHK016
	Ns8bXEu/VPTQbksJaAEOFKhz4LKYb6U2hFR5g4W5XJeN9UcuYZmYk1RSMbUAFZVY
	BsT5T8//ASTeHL8XR7qVTeEzu7e0wF0WFDuFYkkelxWi/soroQqkZL7ShLZh/k3W
	QpUFsuVcSTF9eUHtbiTODjMn8r/Danp+18/GmWFlmey+I87fsh/OV9QhtCFAa7+g
	f2M2ow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1uab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:19:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce14a21faso51008675ad.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934369; x=1784539169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uw8kTPaH7dffEJnhUq7CagwGtV0VCo42/f4H9lygTvo=;
        b=jPJXngOv8vxvS+iZRMUaPbgY5AuXGjsxseSRnSW2IWGcGWG9bZNP5Q+KNhazOBxfBL
         ez5sPwwrn5zk8AdSfYQnJC7kknDIXxjgBHaVet8Gj6L8epQs/Hq4U5ec2BXReBWlnvYX
         QY7CsuqmWLiySMpYeLcrHmBxqK58zjieF89Ir+mqHePfbxN7XV+leUXqIbrAetMl8Sgx
         /HoRd0VvTHYC0iBYIipGpCvrYs/sNHQcxPE99XyvTHvK2e2h4IRh9PRz+2h4Oxl7TEP0
         vlni9UjpXl2GnK2X7ir1+vBhCK+7sYaYPJbMK5jK6SaArrg7TNKsRiMvYuORObPNC6JP
         y0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934369; x=1784539169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uw8kTPaH7dffEJnhUq7CagwGtV0VCo42/f4H9lygTvo=;
        b=XAg9i0Oi1ugfZX1sbB1HbpHbUcAfROfGUenFoiaJKFkeaNZictw+jg6TkxqlK1IHIM
         l3S8FaCtjyta9CzSB2MVuF7rGZqksGhzvILfjIgFnNBPaRkKrkxMHpKuvxiMhGVlhosb
         MCOHzBpYsHWS4auyYIVmbcxQzOokY7fXQGItgqQR16cKG6wUgMPWaVaH1kCYD9G+o3r/
         MBidq6dL4ea+CvQldEXRHQ46TwRI2dQPi0PacJCJMoUmj+x98T2HjTixgsFkgMkNl5Gj
         c8RqzrQgMj7uGcLdY+adi70HMEGOgofw+ImihJ8A63ewME4XXNsPxFyFoKHoytBZDWZ9
         gFZA==
X-Forwarded-Encrypted: i=1; AHgh+Rqztc4Uumnhw65qgmDvCJMPJ1yVnzAlQt+xFzhaTbvZ5+s48wy64FT9ZWevt1S9wHa2Ao73MyHf4qxN@vger.kernel.org
X-Gm-Message-State: AOJu0YxACEwReB/Ylr2mmcEX16h8WkHtx4WbeKqTwE5XhnZcQcSeOnRM
	/tElwdxo1Q7XxtToGNP1Daugq2bBKkQCdICCUISRlEGXm0GVVT0BF1YWVxQhrog5ttxUIvaVuOZ
	3Nty0xHFSJrBpjT8HxEqnJlYSIv5yi5TCJhd9O7pPKdMdXFOqdT8YGp3h7xOyhnZb
X-Gm-Gg: AfdE7cnnvVR+8o8jH/hFzdzIpaq1TAKRoKf5mrmGEel2xX6fAldTTXlo6YQfksV8VR4
	S577KkghlRxiFERZKBgOe2SBK8v1kffvkHQ4HJTkwSRCJH1D6ccg56DqeQX5bzLs8yk5jnXYzYV
	d8uOTJiBUN47eRPnOxExGlR754w4JekgU4EIhPSV3WOODITFcYsY+c7hoUmme9SMUTE634aHKFl
	8ho6ONHr2H0eTb92KZYdARMuNNHWu+WPXd52z1Sik7v8uUc8aVYOM18/k8GwVbSWB/Bf/D3hdZD
	AphjaQOXT9ucsXSEbvUKtGTc1tERN3arXmiGEol9c+DvG73r1JiM1tXLkdZlVLaaG/0N4ujUurn
	adAo4F10vm7vEum4hFdTs4Jte0KicshaLWZR38wMkzpJKPVLkyNYm6ynRPW4KcQq06ofM4HTmLz
	hb
X-Received: by 2002:a17:903:110f:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2ce82970406mr116320405ad.24.1783934368574;
        Mon, 13 Jul 2026 02:19:28 -0700 (PDT)
X-Received: by 2002:a17:903:110f:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2ce82970406mr116320215ad.24.1783934367962;
        Mon, 13 Jul 2026 02:19:27 -0700 (PDT)
Received: from [10.133.33.216] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ce7b3755a3sm53788955ad.80.2026.07.13.02.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:19:27 -0700 (PDT)
Message-ID: <1af2c6e8-c278-46a0-8f66-3df76ebcf248@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:19:21 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/7] coresight: ctcu: Enable byte-cntr function for
 TMC ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VKTrduusajDXWIJJiCyEblMtngg5AKL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NyBTYWx0ZWRfXyY97gda623TX
 CghE9fwSPL7DY808bwuk3ZKeGsfUTWNZamDaPU8nhhAavIP12J18rzdqRUvBIdYvds7SkTwKrBU
 APR8pe/ddbYJ45JLCfIuyHXPTPvzHivfPzUE4wg3vpo0POrVxhyPl/tOc7eRpxbrl/TYxHW30zK
 NaYHi7/Y5jSBvjf9h6sCntB5xqSUTYrPlIGAQ+/CITrydztvMD3HcptYiyo2Nu8OO+40Ckejc8P
 dvp8zLIKIxcRjs6pl03BhkAWr9xRPhjiyVXDU4drFhufv8USDjjoJ2aw77UQ4EdIY76VUk8jz/H
 es/3J12WRgkwZZxAJE6Rj6fq1rE7CqFecAk5dN/1Kg1i6rMz5GrxwSA0ulI+hndUF0kM8E7oNgC
 G6UMCmqqk7J5QIstWsraeUN0Dlxx66vk/DarQhzSeFN9gyc1E2lyK0GExT75wzFCwRkqmA6pwnc
 4rZIBt1Skpai44ddhaw==
X-Proofpoint-GUID: VKTrduusajDXWIJJiCyEblMtngg5AKL4
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54ada1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=fIDE6rAyyWgLbRZLtlIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NyBTYWx0ZWRfX9Aoez1S4Gzd6
 ZbboFV2bCbp38HkPvFyto/D5PMyzD2dmzjlVHf3nClu0fSR/pSZZ1YZsePYpbRttsn0BPfgTqIC
 Dvb7iWPHf/nQMQZhLIDZntEE23hBprk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130097



On 6/25/2026 6:45 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 

Gentle ping.

Appreciate in advance for reviewing this patch series.


> Based on this concept, the irq_cnt can be used to determine whether
> the etr_buf is full. The ETR device will be disabled when the active
> etr_buf is nearly full or a timeout occurs. The nearly full buffer will
> be switched to background after synced. A new buffer will be picked from
> the etr_buf_list, then restart the ETR device.
> 
> The byte-cntr reading functions can access data from the synced and
> deactivated buffer, transferring trace data from the etr_buf to userspace
> without stopping the ETR device.
> 
> The byte-cntr read operation has integrated with the file node tmc_etr,
> for example:
> /dev/tmc_etr0
> /dev/tmc_etr1
> 
> There are two scenarios for the tmc_etr file node with byte-cntr function:
> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
> 
> Shell commands to enable byte-cntr reading for etr0:
> echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
> 
> ---
> Changes in v19:
> 1. coresight: tmc: add create/clean functions for etr_buf_list:
>     - Simplified the kernel-doc "Locking:" note on tmc_create_etr_buf_list()
>       and tmc_clean_etr_buf_list() to state only the required contract
>       (caller must guarantee exclusive access to drvdata->etr_buf_list),
>       dropping the over-specific call-path details.
>     - Lock the required code block in create/clean functions.
> 2. coresight: ctcu: enable byte-cntr for TMC ETR devices:
>     - Fixed a stale reading-state / double-free when irq_enabled was
>       cleared between prepare and unprepare: the byte-cntr read_unprepare
>       would return an error and tmc_read_unprepare_etr() would fall back
>       to the normal unprepare path, freeing drvdata->sysfs_buf while it
>       was still owned by the byte-cntr buffer list. irq_enabled_store()
>       now returns -EBUSY while byte_cntr_data->reading is set, so the flag
>       can no longer change mid-session, and tmc_read_unprepare_byte_cntr()
>       additionally guards on byte_cntr_data->reading.
>     - Moved enable_irq_wake()/disable_irq_wake() out of the
>       byte_cntr_data->spin_lock critical section in
>       tmc_read_prepare_byte_cntr()/tmc_read_unprepare_byte_cntr().
>       irq_set_irq_wake() may sleep on slow-bus irqchips, so it must not
>       be called under a raw spinlock. The threshold IRQ is already
>       disabled by the in-lock register write before disable_irq_wake() on
>       the unprepare path, so no wake event can race in the gap.
>     - Added a comment on the byte_cntr_sysfs_ops pointer documenting the
>       single-CTCU-instance-per-system assumption.
> - Link to v18: https://lore.kernel.org/r/20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com
> 
> Changes in v18:
> 1. add a NULL check for the in_conns instance in patch 1.
> 2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
>     previous check for the return value is incorrect.
> 3. add more kernel_doc description for tmc_clean_etr_buf_list function
>     in patch 2
> - Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com
> 
> Changes in v17:
> 1. fix race issue during allocat buffer.
> 2. fix user after free issue observed when remove module.
> - Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com
> 
> Changes in v16:
> 1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list" because we are allocating/freeing memory.
> - Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com
> 
> Changes in v15:
> 1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list"
> 2. optimize tmc_clean_etr_buf_list function
> 3. optimize the patch "enable byte-cntr for TMC ETR devices" according
>     to Suzuki's comments
>     - call byte_cntr_sysfs_ops from etr_sysfs_ops
>     - optimize the lock usage in all functions
>     - remove the buf_node parameter in etr_drvdata, move it to
>       byte_cntr_data
>     - move the tmc_reset_sysfs_buf function to tmc-etr.c
>     - add a read flag to struct etr_buf_node to allow updating pos while
>       traversing etr_buf_list during data reads.
> Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com
> 
> Changes in V14:
> 1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
> 2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
>     function and restore etr_sysfs_ops in byte_cntr_unprepare function.
> 3. Remove redundant checks in byte‑cntr functions.
> Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/
> 
> Changes in v13:
> 1. initilize the byte_cntr_data->raw_spin_lock before using.
> 2. replace kzalloc with kzalloc_obj.
> Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/
> 
> Changes in v12:
> 1. Add a new function for retrieving the CTCU's coresight_dev instead of
>     refactor the existing function.
> Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com
> 
> Changes in v11:
> 1. Correct the description in patch1 for the function coresight_get_in_port.
> 2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
> Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com
> 
> Changes in v10:
> 1. fix a free memory issue that is reported by robot for patch 2.
> Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com
> 
> Changes in v9:
> 1. Drop the patch: add a new API to retrieve the helper device
> 2. Add a new patch to refactor the tmc_etr_get_catu_device function,
>     making it generic to support all types of helper devices associated with ETR.
> 3. Optimizing the code for creating irq_threshold sysfs node.
> 4. Remove interrupt-name property and obtain the IRQ based on the
>     in-port number.
> Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com
> 
> Changes in V8:
> 1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
> 2. Combine the patch 3 and patch 4 together.
> 3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
> Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/
> 
> Changes in V7:
> 1. rebased on tag next-20251010
> 2. updated info for sysfs node document
> Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/
> 
> Changes in V6:
> 1. rebased on next-20250905.
> 2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
>     lemans.dtsi.
> 3. fixed some minor issues about comments.
> Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V5:
> 1. Add Mike's reviewed-by tag for patchset 1,2,5.
> 2. Remove the function pointer added to helper_ops according to Mike's
>     comment, it also results the patchset has been removed.
> 3. Optimizing the paired create/clean functions for etr_buf_list.
> 4. Remove the unneeded parameter "reading" from the etr_buf_node.
> Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V4:
> 1. Rename the function to coresight_get_in_port_dest regarding to Mike's
> comment (patch 1/10).
> 2. Add lock to protect the connections regarding to Mike's comment
> (patch 2/10).
> 3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
> 4. Add tmc_read_ops to wrap all read operations for TMC device.
> 5. Add a function in helper_ops to check whether the byte-cntr is
> enabkled.
> 6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
> from the sysfs node.
> Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3 resend:
> 1. rebased on next-20250711.
> Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3:
> 1. The previous solution has been deprecated.
> 2. Add a etr_buf_list to manage allcated etr buffers.
> 3. Add a logic to switch buffer for ETR.
> 4. Add read functions to read trace data from synced etr buffer.
> Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>     node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>     suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> ---
> Jie Gan (7):
>        coresight: core: refactor ctcu_get_active_port and make it generic
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
>        coresight: etr: add a new function to retrieve the CTCU device
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        arm64: dts: qcom: lemans: add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  27 ++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 327 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 146 +++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  81 ++++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 265 ++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
>   12 files changed, 896 insertions(+), 73 deletions(-)
> ---
> base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
> change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f
> 
> Best regards,

