Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362F43B0AEF
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218990; cv=none; b=LIkm6XgxF5mVhvjz28BoJVxJrq4BuRVx2wUCfbF9LxXaQsPSVjJhVffGHkVN45sm0UQBrk4LIsTELyj8KBIKtifz5iRkG7xFnOPdJ/Oqm1LlsKplR5gIgBifD0SFjrTrBoRVQKBQP1t/9o/SUnirAZmy9uiiBFDrfAWjrIPjqM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218990; c=relaxed/simple;
	bh=A+nccW2IazB4ajkTWtQmOzHPBcjnUkpm5WIzTX1r3yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHlqcB2Fa6XtsyRP9SsuXhj66Vp0NdROu11U5bp6VmHxrZdXWFMuiz1MCaMwnmkMEZLqTGTJwxaC1Zi+GAbmzEmYJfeR58waEKSnuw83SZSy2kedxBzHnVoPcBloEQNDdBoYvRZbSQZKbFTJ83P2SwEuYWZ2yubXYpwI5Pps6f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfI0OwYh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ItQnsq9/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfI0OwYh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ItQnsq9/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx4d32867811
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWuo1Zx/fMQgxjvOqcKizYLBYVOhpvRSlt5Fgb5W0wk=; b=WfI0OwYhNMwxTkie
	KYzDg7EEqJ7aDWUbrd9Tgbl9afO/RJvtkniTdpjUisn3DaCwZ/zL1sGTLqZUEeJB
	/WK7zlOjs6J4SEKK6DWM2calJZU2RKz19WujuK2tcYELoRqwlJD4x/1OXmlmwuAh
	aG9AP9/NCGx7qVSO/4bAqAIW9Vh+/1pkBO/C/UCgqjtKDU3rzgkTrFqAwAO2Q9j9
	793U/EToMJv7ohlSKO7t95c2NhR+Ncw8aLFWaW1249D1Ne567su3+S56ob/lXzvY
	5HA3yrAd4pBqxHxK8+zG6KP2lxbEkJFaN1H+i8L9KrMgcpMDGi4KXxIYf8W2gqrK
	JumTEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3w95cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:29:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366015bca9bso3874592a91.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779218988; x=1779823788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWuo1Zx/fMQgxjvOqcKizYLBYVOhpvRSlt5Fgb5W0wk=;
        b=ItQnsq9/4c7Df+H4YnldKDmDPzVnLsQshpozBWrrNVRlYWQtS3scUwtHoej/fNDY/r
         sfrC/Qo/+pGRtxh8ISlcaRmMcGkSsd6RIYhnEXOoOxX1vh5Vpn+YBihS+XolsrZTSakL
         KVDtaIrFsG1w8MR1SsOPgKUiYQmwGi0bFGM9PXgSO3a50ClHS2JkhuQuvdeC8Q+W0b+a
         ZsCw8nIrEcHszKqDpgkfLD4rbbkEE929uvc4b1+UKLo7d5o/Wpc06800hCI4EuZScxf0
         /YPxni1WzrTVhyAWwcDqPiv2gGxTRV+FP7kG/a5OhJhCPvTL3LztPaV5v1+2WfEvCvfQ
         Y+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218988; x=1779823788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWuo1Zx/fMQgxjvOqcKizYLBYVOhpvRSlt5Fgb5W0wk=;
        b=dx+7qfRB1jlyxp/XSp7LCeTg5SEHhbQfo0XFDPLzFjkN2kn/z+3j63ChmjIHAXtob7
         vzdVUZVYV6g4344APCWuva82XeeG9eRD30ifx9UrpHCmkBjSQJxYlVow3wEF1IveCV6m
         rfwx/VTgIMEUtcsDEhSwNcGyRmmsej60BPHIHjYvGv2RmRtejH6O9mCcZa6AWjrW+1oq
         yVQ3EtyQq+mhtB8E4YzYY+9q/Znx88Ez/+zX3zm/N2zx8+FNGFBtnYfmxqUxIDAawWae
         U8wwtN+YnqK/R+dApBqdVRXeBJ8lTrm9C3mczEARb5FG9p1KTj72NPxCENtUyB0miqF8
         xjNw==
X-Forwarded-Encrypted: i=1; AFNElJ+vbR+DcwSBrWIwROri9R89L4Xkx6aOINAPtPBhKxeE5As4t5c6F6foP4MhxOSCErlUFe2CkorQXtLz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk0796WrgqO8p6+MhYhDDaguO8T8MNyr1tu44w2TgOOVBugETJ
	qIGljKHtctt/lXiOdOzaSnp2IXDV6QcCgaE01yPu6MTD7RJNiQfwjFsKb3X5ngE8vjmGgHNiGdW
	WBiEuAJB25XOO/JgQk7bO5VQQhI4Rrhtl45atbOToZCVKUbDK5JQPadGOwA0TRkAP
X-Gm-Gg: Acq92OE4cEgWik4uG/onsmPkGnzKRwNeLzcGRvU2jJCom6lR226Db2VW4c2ynVfeBAl
	c/tatjvJZlKeNDHAyidzfq+ogzCeXenPIwa0SAn0nEdWBouiCGzUVHcuUY8yEJThMrytvYnXI9h
	8IoKHvxnyeMFAx9+QsiWg9hQxrnBeG1gRkdc5K7VV8LzuaSbU2lUdX7ofWHTjG1SY/afSAh/XAv
	TkjXrIMitglqyGeiJezrzmKAITgdqj5J42nGoX5V6acZ4jMbRONC3/0VLKlXZO7Zk+MPI4Op0L4
	hjaIuoFTShcKS0/lsDyiL04gdgGbj6Uwp0cwfQbCXXwCm/z01IbcJdS40kpPazNI/mODxGJQC3G
	k2wBFWatKtIlK9m+OvXtsqn1VPa3cMvTIRFzv4IpiTv7hgJc/qQf3EEht9fhqFQ==
X-Received: by 2002:a17:90b:5488:b0:368:7398:df8a with SMTP id 98e67ed59e1d1-369233192aamr20632968a91.4.1779218987528;
        Tue, 19 May 2026 12:29:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5488:b0:368:7398:df8a with SMTP id 98e67ed59e1d1-369233192aamr20632931a91.4.1779218986949;
        Tue, 19 May 2026 12:29:46 -0700 (PDT)
Received: from [192.168.0.106] ([183.82.206.76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb121ccasm17088440a12.29.2026.05.19.12.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 12:29:46 -0700 (PDT)
Message-ID: <28ffeef1-a225-4abd-a471-9e3fa48325af@oss.qualcomm.com>
Date: Wed, 20 May 2026 00:59:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/16] firmware: qcom: Add OP-TEE PAS service support
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260518072856.22790-1-sumit.garg@kernel.org>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260518072856.22790-1-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5NCBTYWx0ZWRfXwONuZVykR2iM
 n9sAp9au/2pdMNQ0S+iYdKu/S8ulyeSncUmZgI8x6imQ9nO8iJP0TOt3nfBA2WZHOKx9FjkPSbz
 hq5/IrVKxb2Pl9VNcD+QqkdCjf32Q1afRc3NQJjJSiNuR2n+1ZcVzJyKKNRp8Jw88g6k1jcInHq
 Ezl7n4vs3Er42RVstvq301SA8v0LFQ88WljNLBmtHHWEFGqnTxulmg2OOq+UVJKzT8ahuEiv1r9
 VbQ4fMgawbXLNGIFV6I2bLg6ba4OS9IzN1GCWePL65/jnGAcU9lNlp7eOJb4Vymvb0gSseMaY1R
 FwG/EkqAzHsxwt9ez4Zgugi051A1BBxnnP3X9/u+l1iyhdOJ/xJrIV1h4kJSWhFv0xN5lDHdvsq
 2JrTOdQ3JL+rk4dV5u7ZGUIUW1xsBO40tQ0iAF2oFm07SrGPoBe9Ad9lw12rbOtrV78EZNrv3yL
 ODvj4ZST5AOI28ircPQ==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0cba2c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=/tSNrZwvc+uambTsRZdH8Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j_IXi3UCvUtYR8Je0D8A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: VMc59DI-txddFIRSUIJuqBMica29C9f0
X-Proofpoint-ORIG-GUID: VMc59DI-txddFIRSUIJuqBMica29C9f0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190194



On 5/18/2026 12:58 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> The TEE PAS service ABI is designed to be extensible with additional API
> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> extensions of the PAS service needed while still maintaining backwards
> compatibility.
> 
> Currently OP-TEE support is being added to provide the backend PAS
> service implementation which can be found as part of this PR [1].
> This implementation has been tested on Kodiak/RB3Gen2 board with lemans
> EVK board being the next target. In addition to that WIN/IPQ targets
> planning to use OP-TEE will use this service too. Surely the backwards
> compatibility is maintained and tested for SCM backend.
> 
> Note that kernel PAS service support while running in EL2 is at parity
> among OP-TEE vs QTEE. Especially the media (venus/iris) support depends
> on proper IOMMU support being worked out on the PAS client end.
> 
> Patch summary:
> - Patch #1: adds Kodiak EL2 overlay since boot stack with TF-A/OP-TEE
>   only allow UEFI and Linux to boot in EL2.
> - Patch #2: adds generic PAS service.
> - Patch #3: migrates SCM backend to generic PAS service.
> - Patch #4: adds TEE/OP-TEE backend for generic PAS service.
> - Patch #5-#14: migrates all client drivers to generic PAS service.
> - Patch #15: drops legacy PAS SCM exported APIs.

Testing this on IPQ9650, which uses OP-TEE backend for PAS service.

Feel free to carry below tag for this series.

Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650

Thanks,
Vignesh

> 
> The patch-set is based on v7.1-rc4 tag and can be found in git tree here
> [2].
> 
> Merge strategy:
> 
> It is expected due to APIs dependency, the entire patch-set to go via
> the Qcom tree. All other subsystem maintainers, it will be great if I
> can get acks for the corresponding subsystem patches.
> 
> [1] https://github.com/OP-TEE/optee_os/pull/7721 (already merged)
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/sumit.garg/linux.git/log/?h=qcom-pas-v6
> 
> ---
> Changes in v6:
> - Rebased to v7.1-rc4 tag.
> - Patch #14: fixed ret error print.
> - Add Kconfig descriptions for PAS symbols such that they are visible
>   in menuconfig to update.
> 
> Changes in v5:
> - Incorporated misc. comments from Mukesh.
> - Split up patch #11 into 2 to add an independent commit for passing
>   proper PAS ID to set_remote_state API.
> - Picked up tags.
> 
> Changes in v4:
> - Incorporate misc. comments on patch #4.
> - Picked up an ack for patch #10.
> - Clarify in cover letter about state of media support.
> 
> Changes in v3:
> - Incorporated some style and misc. comments for patch #2, #3 and #4.
> - Add QCOM_PAS Kconfig dependency for various subsystems.
> - Switch from pseudo TA to proper TA invoke commands.
> 
> Changes in v2:
> - Fixed kernel doc warnings.
> - Polish commit message and comments for patch #2.
> - Pass proper PAS ID in set_remote_state API for media firmware drivers.
> - Added Maintainer entry and dropped MODULE_AUTHOR.
> 
> Mukesh Ojha (1):
>   arm64: dts: qcom: kodiak: Add EL2 overlay
> 
> Sumit Garg (15):
>   firmware: qcom: Add a generic PAS service
>   firmware: qcom_scm: Migrate to generic PAS service
>   firmware: qcom: Add a PAS TEE service
>   remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
>   remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs
>   soc: qcom: mdtloader: Switch to generic PAS TZ APIs
>   remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
>   remoteproc: qcom: Select QCOM_PAS generic service
>   drm/msm: Switch to generic PAS TZ APIs
>   media: qcom: Switch to generic PAS TZ APIs
>   media: qcom: Pass proper PAS ID to set_remote_state API
>   net: ipa: Switch to generic PAS TZ APIs
>   wifi: ath12k: Switch to generic PAS TZ APIs
>   firmware: qcom_scm: Remove SCM PAS wrappers
>   MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
> 
>  MAINTAINERS                                   |   9 +
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso      |  35 ++
>  drivers/firmware/qcom/Kconfig                 |  21 +-
>  drivers/firmware/qcom/Makefile                |   2 +
>  drivers/firmware/qcom/qcom_pas.c              | 291 +++++++++++
>  drivers/firmware/qcom/qcom_pas.h              |  50 ++
>  drivers/firmware/qcom/qcom_pas_tee.c          | 476 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              | 302 ++++-------
>  drivers/gpu/drm/msm/Kconfig                   |   1 +
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   4 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  11 +-
>  drivers/media/platform/qcom/iris/Kconfig      |  25 +-
>  .../media/platform/qcom/iris/iris_firmware.c  |   9 +-
>  drivers/media/platform/qcom/venus/Kconfig     |   1 +
>  drivers/media/platform/qcom/venus/firmware.c  |  11 +-
>  drivers/net/ipa/Kconfig                       |   2 +-
>  drivers/net/ipa/ipa_main.c                    |  13 +-
>  drivers/net/wireless/ath/ath12k/Kconfig       |   2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c         |  10 +-
>  drivers/remoteproc/Kconfig                    |   4 +-
>  drivers/remoteproc/qcom_q6v5_mss.c            |   5 +-
>  drivers/remoteproc/qcom_q6v5_pas.c            |  51 +-
>  drivers/remoteproc/qcom_wcnss.c               |  12 +-
>  drivers/soc/qcom/mdt_loader.c                 |  12 +-
>  include/linux/firmware/qcom/qcom_pas.h        |  43 ++
>  include/linux/firmware/qcom/qcom_scm.h        |  29 --
>  include/linux/soc/qcom/mdt_loader.h           |   6 +-
>  28 files changed, 1119 insertions(+), 320 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> 

