Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7473845A8
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 08:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033270; cv=none; b=nnVg8yEEC4HV+oyF3wf26nhvAmzDZZ1NTGVs3CV7zubdEjIL9N4rsMl8douTJYjvQtTsIo1GFyQlp83YVEwk18L6Tahsdh5ZUHTA0iij952No3zPxYLeNp48UiyHWI031n/syFa3tfB1AyltIClfG/HnGiZCUMrhHNWVK1K44Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033270; c=relaxed/simple;
	bh=TX4xEpaQ/e1F2tRjatBv6OxfilxbIVJHdKohGUqKjZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFGF5Nky/USg7D2Va+/MnkY9Hkh3A5aI3h4ynERbmoLEWhekl7a3QYd35OseXPmUIbo+9WePTWtwA2Dq89q2zbZGs3PFAV6SK7232gs2ZTh99zX6m9csvQaVy/XsV63tirZBUNeuYfh/NwYB8r50Pko1iHykNb0sQ38IwqdkOxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuES1o4/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNtW3tug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuES1o4/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNtW3tug"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314J6H23363899
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 08:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOf53C+cySBUC3ZvRQc5wsypqqs1qjwALbh2yOuPXq8=; b=nuES1o4/JLd3O0x4
	k34X14l276LxRvj+VWLdGNOtH5VhmLXMTD5Zpx/rtrSoV0kbbtQmr1XmPhZ6qGkC
	oPfoQTKYN5jc8vv8SDZ5/R3sVAxpYG+oCouAmf5rdjI49t6OrYanqTg/1xtUy+r4
	kv8X+1XeNw5a8kyI890FbPNYj723N4IYbD4wVyH4uGfqMlc18ROrJ55AxhqgJlMT
	t19QAQDhww/BYEprDcs81JGC0BGDMYksCYEIKiJi+yBHc78ir385g2jEoDSdPyPw
	DXIkUiILLdJsxByQ617Hf6FY41gh0GVz/o3NkkarO1y20sA+7I1ynrOvBIzYi9wp
	tZW0nw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8nddjgwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 08:47:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c613194caso4674667b3a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775033267; x=1775638067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOf53C+cySBUC3ZvRQc5wsypqqs1qjwALbh2yOuPXq8=;
        b=ZNtW3tugu4iTYO6hwfxqgEamTztv9UCZKWIC6sWKeRPGPTpF6MiFipS85vE9rMxfHQ
         tlkVAZSbzQFcu35Dk3uaguKbSg88STLx6XFQFlfbe+l7XTnhhEmmvbk2bztt0jtdFuo3
         iTj5UNR8CrlcWRGg1b8wD+I0avPFQftufDgJeFzUus+fNY6Fr1JhrwZBtPwufnUYYe6g
         9188Qq5OmiwQP/afy6e2/xpk+rB6kX1rzZiX0SJpQPuITzD5O4N/82WqYPh4oFKYxECZ
         CVKBvXLf/h6L8JHD2L5ry2YIMVpUZucaTPrJUR5kyoMXN1OHO354yaKf21yusAMJRfZ+
         uUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033267; x=1775638067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOf53C+cySBUC3ZvRQc5wsypqqs1qjwALbh2yOuPXq8=;
        b=qxkkQZ+st+nf6nAtU5N7Srx89xDnliwFEeI82JUniTYuw6HBaVIg9OtKZEVMiEqitH
         JfUEINKBOk9gBO17V8wG+RmdhAXLR+yNF9Tao9J76pFS4wujVNl5CZbYnKe0Te6AINIH
         CH6LaUo9dgmi2058oAuf23D5T1ZJJOw4c3iYvKYtQvYDDM01euxxDnPWq0whDXJEQnNx
         kooftzywR3oBnaKJrS+axXC3Bcyd6fKbUOiFGTZWekPlohdeK8c8LR1ZsDRFG2DDdl4B
         VJvY1oLQf4PMK+/WdWfW+xupT5OpV4q8M0bMF5LHfyzPDykzGp86LgYsx+RfxVwSRwEg
         76qw==
X-Forwarded-Encrypted: i=1; AJvYcCXgFwVyJJDx+njZvDXbXrTblNjcRvbdgp01vN9LoJ3UZiiZjBhX0rbq2qnZzy9baqX3tns875jjX9te@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2nj68/kPhfVhfoSEmr+4y/NmuhLDSu4mygtt0TlcsS/brHaBC
	eLSr0Ai2mtwImFWyke9eBizxkkE/BG2DS/AfBfU7wZ6dSKGyZUbq2ZN5GWD0sfuir1k3mF0BEnR
	33AVwDBINIOXajR1ik6TfX2iUdGAOfsEeK1DAYIl40khZNOHRMFiqvP/ZHEBpkvNn2Uy7ECI4M7
	M=
X-Gm-Gg: ATEYQzwWq2VbI7bQK5pr8sMj5nHZZHGdIHec3ZyKcHSwqpcSRxMwBWwpYStLKBH0DNf
	L30rdBW6/sZgbfAjfOPxmTXFQLrbLvcks2oEMMAT+DsJzH/kDNwSF61e46umU4c9mcfF+1C4JpQ
	B5wGzNzJrDbfjmItJSU0qdGACJPbZODt+GTTt9Q3UVaC84G5pjTdbZeOmBb2pLK4m/Ar9gP54RX
	KpTwaYHCvnCLc/ElbYA703PLBYY184ltxZ7WNhwYQzt/R7ioCRD2ExFzreXmz4jGxE/5cU4q7a/
	wVpMM823eUi46ryevMMa+CCjvSNKekZb5ReQOmCmJze0X+WPJs/ruym6rWgsjQSOz0U+aExBzRn
	Vr/lF6zAXXINchplvOu7m/MGDmoA1ITfy3wTROkjd9Sdoot9pbQT43VaRZBLv9d3y26wIqHRObb
	3mJCfpf4mV
X-Received: by 2002:a05:6a00:4fc5:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82ce8abd4a1mr2864441b3a.46.1775033266532;
        Wed, 01 Apr 2026 01:47:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fc5:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82ce8abd4a1mr2864423b3a.46.1775033265940;
        Wed, 01 Apr 2026 01:47:45 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cdaa4c3basm4834883b3a.37.2026.04.01.01.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:47:45 -0700 (PDT)
Message-ID: <c49bab8b-5a1f-4a2d-90ca-9c630dae91e2@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 16:47:39 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 0/7] coresight: ctcu: Enable byte-cntr function for
 TMC ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZfUQ98VA c=1 sm=1 tr=0 ts=69ccdbb3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=McKvdGT4-egkKetyGfIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 7uWWsbYUl9Xj87EcZ22K-vMWCF7GSZD6
X-Proofpoint-ORIG-GUID: 7uWWsbYUl9Xj87EcZ22K-vMWCF7GSZD6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA3OCBTYWx0ZWRfX9ktsh4y3MyYK
 gZCrI8/vpYLiytmU9EuYxatO7+1/YLSbueGhItUgDO7CORsWcb+r7frpgPGYHS9RaR8SHz8MWBs
 +T6wKjPytvSd7ZzTFXHez4i22fvrL4B4DJBzc/6xS0CGjBlfQsaMixRa53N2Eo75Zs4/1gHVj9O
 CW2fhs3+OAlU1fmrigv0WpIZV/erG6QCWFLeUpilKuvssSiO88qhA1306r/ApSY51y59IHzlYgR
 lqd4Y0m1L8akEmgk27je+vs2WRxA8hohwa8KDPBnPdPtuOsYR3MBbY9i/7+sDTtdrN6fQODbqYb
 iBfjl7WjGkgu4RTswEVRZ3xmNRApBB5EaveJGDAcUIXmlq0qcSWay0SwAbdZjbIwr99UMCoDKEU
 0pYA7jaN9rWoE/MMeY2+T1nhHabJeuatekTd9jvuVo+cRHXrN7LHGrhkw9pkXoteXTs4lxiRwbr
 VMWeQxNWg97kUDxZEdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010078



On 3/23/2026 5:49 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 
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
> Changes in v16:
> 1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list" because we are allocating/freeing memory.
> - Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com
> 


Gentle ping


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
> To: Suzuki K Poulose <suzuki.poulose@arm.com>
> To: Mike Leach <mike.leach@arm.com>
> To: James Clark <james.clark@linaro.org>
> To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
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
>   drivers/hwtracing/coresight/coresight-core.c       |  24 ++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 286 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 123 +++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 226 +++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
>   12 files changed, 789 insertions(+), 72 deletions(-)
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f
> 
> Best regards,

