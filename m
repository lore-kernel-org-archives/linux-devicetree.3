Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080264E0B88
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677516; cv=none; b=rxxNtH7pbmmovwZylN4uPli/kk7mZn9t9BVgHzQzHUDwrgA3gTXB37bZ1N5H9u5FfaeKvvPfYawvgeyHbEknNWNsqhGhENz+AOp7O+UznFTFoFDKidCWcuANKbAT7iCxqlkjvLTYHr5N95qNbc7OMciVzeMPdXTpVdy0tQsgZrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677516; c=relaxed/simple;
	bh=Wi5x/Ouh/PeM1Z3PGzen1AuGIANL006sy5SnhuPr6aY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1Y0+y9Wgy7EF6ArTR8831qVLDz4sic0ErYgT/RvEecdaeyL7Y8ljEH15DXwQ2ggjMzwJTfWKDQtH3o2/ElgIP0leIGCK3l8oZen4AwGvog4MG+Z4DlTW89c4+tlA1O9cr4Iv+JqrWjrt1AsXYMx7aTqxbjSTMHrlDU/xGfuO2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDMSa4iS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/1E+sad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDMSa4iS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/1E+sad"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5Hr91007115
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=; b=bDMSa4iSiT8ItOZL
	qDlgE27bojSoam9G3l2wvgy1LHpWPkfn/+L27JL7XSP8tIMNBAM+VShnfQHvx7Sx
	HklycHyYEAS+3ywN8aA4DhZgIuPY9gcZiWa+ZsZWTxoYqwzkYWakBN/wBGvr3ExG
	UXvuMj/DMufQL1miacolNxE7jnHau+Fc4lsKaoVMm8hC1WEMYUL4bDNwOx/mmfIM
	WFqRC3Nxyqq5aUKNEqWDCMW9/M2bY8K7PCsh1b3z0cIefy6TcappZDautpQo2jPe
	GeupFN0+uoSdyO2Obeczcr4nrwTxCH7Z/yd85WiPhbNaIMSqp7chdUYyaDhQP7Yx
	j0JWsg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttscs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:38:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so861365a12.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789677513; x=1790282313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=;
        b=a/1E+sadoxy9zywO9bH+nyv5JAK7j0m7ajPQ3EImaMKr0LhrWztcYBbpbaG6HvdCIa
         A5vtG55/vZXkv/BqwITrfkr/kLYvceIfpZpRLmsM7y4OXJ4qxrL5qnIF+VlID7hSErUV
         B9uzZ8omnrE7jznMkG6GhN4NxmqziGED95xZXPG7LMa7NLj2qJHKQZUSNFvNgxN5/Hwd
         FOhvsPN+QSLTujMhw+ar+bO6tP0/7yNjRrfhknKZ+UFr581WgzJ9UrUHg7xI7nHG+fLd
         AEXJLIB9BSlVdj28kfu6x3HqUGMm0PazZaOVAo4CyYiMn2Kg6MHHe68XG5WWJjKKCvcJ
         aRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677513; x=1790282313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=;
        b=inH5IO02Rx/ZwLrWix4GOhNwyTQZOXNREtxkdfdu9//pdzLGYUmSzI+UCoXoG+jtdU
         v2jZSoZ18g8Xotw9RokZEogXhrIjKXqfbhc/ofcS0FNYdSNsSl7x9HKERD9L/mTE5GQf
         o6Qdts8Ld0VMi4rD0KQRiSaUSi9VSHbMSZgc3xnQmcUQ4g8nDL5GJtX+3nlBeXCUwhIj
         7Fcj2doQvU+gXPTictxJC22/tkXVWgGJkD+7P7+Oz2YxqOO64WFzQTn4Z41j+ywz0e4c
         zMIgCYqClQsPH63Keez6nLh8ZjSk80lMW75ERTlqcW96yyE0kTHflvUuzHhkujlNYX6H
         XFOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCN6SrGG0KHe1GRzeE5LEYoVtNdmeYT3yvMwmvtYT+jVGRp9hVHq0mZ7hDavMPRHV1H3SRaI33jO6C@vger.kernel.org
X-Gm-Message-State: AFuF++l3zPfYmo4drSU4uP/cMUKZa5IuR6SV12uJUgaIMk/EJVvVMplu
	YpQljU0ejz/6VHFVln8Pim8n6s7SkJItw+xyhENss/q6sSiCirMmY4m3tQUpjUIljb1Hhod/fO6
	+lGzAIzwaYNmkn5EakzJHEoKC08BGUYZnWVZsk8CmwE2o4dw10lcUPn3i6anPMbYu
X-Gm-Gg: AYBFou0QXq8VqV0VllackDGBIQlMkVEtUQSkjnCIScwpYtLTRH5xglJF01kD55KPd4H
	82o3lPsT5nmLuu2WNRzzFLDIpeefNuyQeOgqm7fN7VK37nBSgLrPieUAD0tlHxsSYtJbG+FGHdf
	YXKKEkCkRE6B+GyyytiZ9p6JtBElUn413zoH2rRBf+TRaovb1umFf28/6U4KsYZr0mNuY0Lrn/Q
	5hZi9mtS80yY2H6Czf/Ir6CY72WC/QKrX/PEAqGBGrIPTs5h6J/Ls09rsqna5fq/UIQwusRXc0h
	lb5IaLln80rivqVPiZTLQvtD2g9D9THvdYjw3qEYfRBgkNoQrpFlxZk3pp322nL8Iz7XfuFpNyr
	gCBCiHFuwdVE2SpMEufa1aJMwMjx+Zig2o+KJd6W7i6Xl5Lbw/TXngQ==
X-Received: by 2002:a05:6a20:4306:b0:3d3:adbf:777d with SMTP id adf61e73a8af0-3dd8c4cc8b8mr304665637.25.1789677513439;
        Thu, 17 Sep 2026 13:38:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:3d3:adbf:777d with SMTP id adf61e73a8af0-3dd8c4cc8b8mr304613637.25.1789677512941;
        Thu, 17 Sep 2026 13:38:32 -0700 (PDT)
Received: from [10.73.236.146] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c00ede586sm14590388eec.10.2026.09.17.13.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:38:32 -0700 (PDT)
Message-ID: <71568eb6-8123-4ed3-a2d3-4e33e4880bf4@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 13:38:31 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] optee: riscv: add RPMI TEE service group
 transport
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-1-1d1d35c2a859@oss.qualcomm.com>
 <a9d9aac7-cb2d-46fe-a220-40f61f615b89@oss.qualcomm.com>
 <786a1460-c660-4de7-bb07-debdbd6a4661@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <786a1460-c660-4de7-bb07-debdbd6a4661@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI5NSBTYWx0ZWRfX96ogYEGpmiqn
 1VcpXNJGeUSEdJvsYyMS3Hq7xrkc62GHSYaQQSrE5tD9WM9Go8eLnTpsNVeZRW15CNS2cDQcJUL
 DNDOymw12tmzJ/JgHqYw2sHa4bwIAe7LlZe3DAKLxYl7HNOnDMVrdoKvi5+lh6D9QpYvRwKSPkf
 cMUqBnLY2dcImU9kPRRCo2NkwbmRQWFY7xg2GD5tKNKw3xKupqac1GdwTTYzrcN0UZMwAPpEUCj
 EGxpYL9rdVD5VmQo4soFdX3DuyMWiKMfXm9iQ3cXXmPvXsHtj3lJujtpQm+AuH9doi9r2pRvl1n
 6h6eCr/hF2iEc5XOH7Fk/D9LibYRYtZUacuAls0LpnwWhq8q9E5ICuF7Ngj7EW0jsTe0bHJb5tr
 BROzRWZF6ok8t6Pa2LvmAdVIcHv8BOpXrVXVrwqaamMggEiFbb5iOTUBnJt9RimA77c56kJhFaL
 VY/gxMJWTx4DPzSO31A==
X-Proofpoint-ORIG-GUID: suhHHk-jme79O24l9Dxme3cxMK5paqF-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI5NSBTYWx0ZWRfX6ep9dmNlM7My
 +eLlw7p4G0AQafwJ6pvFsYyTa6SJT/zK8mUcP754bbLMa1VSHDOGd04+y5Ygru57l/I9OfD7tEF
 JUcDohQNlklpc0+JsePO7TD2eMjqcvw=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aac4fca cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5Hg3Q6Ij0jR0fJQLcq8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: suhHHk-jme79O24l9Dxme3cxMK5paqF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170295

On 9/16/2026 2:23 PM, Amirreza Zarrabi wrote:
> Hi Trilok,
> 
> On 9/16/2026 3:30 PM, Trilok Soni wrote:
>> On 9/12/2026 3:15 AM, Amirreza Zarrabi wrote:
>>> Add an OP-TEE transport for RISC-V using the RPMI TEE service group over
>>> the SBI MPXY mailbox framework.
>>>
>>> Request one mailbox channel per hart and use the channel corresponding to
>>> the current CPU when issuing a TEE request. Probe the RPMI TEE service
>>> group and required memory-sharing capabilities before registering the
>>> transport.
>>>
>>> This provides the basic transport and discovery support needed by the
>>> following patches.
>>>
>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>> ---
>>>  drivers/tee/optee/Makefile                 |   1 +
>>>  drivers/tee/optee/core.c                   |   8 +-
>>>  drivers/tee/optee/optee_private.h          |  34 ++++
>>>  drivers/tee/optee/optee_riscv.c            | 312 +++++++++++++++++++++++++++++
>>>  drivers/tee/optee/optee_riscv.h            | 141 +++++++++++++
>>>  include/linux/mailbox/riscv-rpmi-message.h |   1 +
>>>  6 files changed, 495 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
>>> index ad7049c1c107..925b8ec7ef68 100644
>>> --- a/drivers/tee/optee/Makefile
>>> +++ b/drivers/tee/optee/Makefile
>>> @@ -9,6 +9,7 @@ optee-objs += supp.o
>>>  optee-objs += device.o
>>>  optee-objs += smc_abi.o
>>>  optee-objs += ffa_abi.o
>>> +optee-$(CONFIG_RISCV_SBI_MPXY_MBOX) += optee_riscv.o
>>>  
>>>  # for tracing framework to find optee_trace.h
>>>  CFLAGS_smc_abi.o := -I$(src)
>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
>>> index a52c1f498b99..63f1725e646e 100644
>>> --- a/drivers/tee/optee/core.c
>>> +++ b/drivers/tee/optee/core.c
>>> @@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
>>>  
>>>  static int smc_abi_rc;
>>>  static int ffa_abi_rc;
>>> +static int riscv_abi_rc;
>>>  static bool intf_is_regged;
>>>  
>>>  static int __init optee_core_init(void)
>>> @@ -245,9 +246,10 @@ static int __init optee_core_init(void)
>>>  
>>>  	smc_abi_rc = optee_smc_abi_register();
>>>  	ffa_abi_rc = optee_ffa_abi_register();
>>> +	riscv_abi_rc = optee_riscv_abi_register();
>>
>> Isn't it growing rapidly now? We have two register calls for the ARM,
>> one for the RISC-V. One more region specific ISA I am aware of and it
>> may have op-tee support in future? It is time we fix this logic
>> in the better way. 
>>
>>
>>>  
>>> -	/* If both failed there's no point with this module */
>>> -	if (smc_abi_rc && ffa_abi_rc) {
>>> +	/* If all failed there's no point with this module */
>>> +	if (smc_abi_rc && ffa_abi_rc && riscv_abi_rc) {
>>
>> This is started looking ugly in my opinion. 
>>
>>>  		if (IS_REACHABLE(CONFIG_RPMB)) {
>>>  			rpmb_interface_unregister(&rpmb_class_intf);
>>>  			intf_is_regged = false;
>>> @@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
>>>  		optee_smc_abi_unregister();
>>>  	if (!ffa_abi_rc)
>>>  		optee_ffa_abi_unregister();
>>> +	if (!riscv_abi_rc)
>>> +		optee_riscv_abi_unregister();
>>>  }
>>>  module_exit(optee_core_exit);
>>>  
>>> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
>>> index aefe1e6f5689..8d22d65e087b 100644
>>> --- a/drivers/tee/optee/optee_private.h
>>> +++ b/drivers/tee/optee/optee_private.h
>>> @@ -171,6 +171,31 @@ struct optee_ffa {
>>>  	struct work_struct notif_work;
>>>  };
>>>  
>>> +/**
>>> + * struct optee_riscv - RPMI TEE communication struct
>>
>> do we need to name it optee_riscv? we don't use optee_arm anywhere in this
>> code I believe. 
>>
>> More later...
>>
> 
> The naming convention, and even the file structure, will change in v2.
> This RFC currently mirrors the _internal_ FF-A implementation, which is neither
> required nor ideal. We are moving away from that structure.

Thanks. 

I also don't like the growing registration calls and complicated "&&" checks
above. 

---Trilok Soni

