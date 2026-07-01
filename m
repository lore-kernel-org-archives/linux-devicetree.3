Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91794436367
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903816; cv=none; b=M+jvVX4ULTdH2Y37sXTGoIFtyDQHz0PdeOpNEQaeowhAGgWu1X19rVz5ZjT7yrfS1Xl1B5DX13rKxE3iKMnZaYyfCUeb7fB31sV5xeHT2NGA6UqybDE9ZCVFc+3/hXTkOsWEIL2x5oca8vVmLqH0Tg5gVE9t8MuHAztrbIzRmCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903816; c=relaxed/simple;
	bh=duc1lVQTPIuOy349IWTViqjX5kD6JpIT3NU5S8FU3ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvLpmvmNKjtVBtfNKeYDBEgKcTInlXE88LXTTG8IVBIQj5KklQfOlWwn94LGxdEIt4t2pSIBgBz4lOSwgFVbFabxrB1M7YbIuFgVi5p701iIs/UOv+TCrfOUDp58vUu2SKYIoQ3nb3BAjURHso1tGmNDBMJ1TFZjzV+dL+DlS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T8oSw9ns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2YLTaSj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T8oSw9ns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2YLTaSj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8rB9763048
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 11:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtjHfrwONC8ND7jApAqtB0mekFLCMG+hunm8CdIxnnA=; b=T8oSw9nsa3l8NB4B
	rxmSt79A++quCYOMmyg/4KlP0j70G5bi/hjGWcmm3leiWzzcyTMT3MwOxbZZ8kcP
	imB7YkNTuPvOMgQdGY049Rh2rgUdiqY7RNzeBHT0N0s7x3+pFS1bPsY5ngXvb7Zf
	bpgmwJzajMxEcirTYbcp1kesurebWhN4ebRqZX6MmsGLHqndRIfA31lkYcdzM8C5
	nFc7t68wafhPsZ5iZ35Q6T+co6HATWTBiourZJnCnh8o1ItuMdZYKmAGgz1E7F/e
	yT0Zht6/o68AF88/BO+hM5fq6+gRrg/jc36bU6QCV87AsjWUbK/TYtfIW9el/t9M
	XJpzyQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbsbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 11:03:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so538001a12.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903812; x=1783508612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YtjHfrwONC8ND7jApAqtB0mekFLCMG+hunm8CdIxnnA=;
        b=c2YLTaSj8oBaLG9ZSb82MjOWNNFOcun9UZ3h8xO4ysFasdKZWmeQN5cJ5cUVLMpGMS
         0XvHWFZbaNRmMiEt8Ee8H7eKNRm89LG17SySq0eDj+Xs+kAgiRqIhkRB7GcHozp/tLLU
         tIpYVjjxEoEP+nGxkgOkEwWQ+LQw9GoNPtzlLW/pq57jo6knnHOYNGnZEmzFeBOOCT17
         lP6YgFM7uEuTj0UQTaK56LR96dxPk2OIFFcfEoET/yOvwc2qz5XMT7OhRON3Vnw3hkPl
         vFi937h049au590vmiZQCn3TZM78/dBgyUnv01cwM71oRJ3YeKmMgzWOeZ8K5UJibm9S
         J3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903812; x=1783508612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtjHfrwONC8ND7jApAqtB0mekFLCMG+hunm8CdIxnnA=;
        b=gUZGft+SyglswEqJ5QTBItXNUZdalumAnECya6ELokyC+ANJYHJWX60JA7HguDho4i
         L/lT4a0WX7eNs+XlXSh8PhNtG9MH/9PLVMkbaZy5MGfpiL8kRV20g2cMcNNnZfT7wY8J
         a1XOyrM9LKnZ4HN8jO4Ui+WV55QENYow+xgHwXBNI2BE1H/13yynp2Xux/GOOobkE0Fy
         qSnZEo6fV6uWzI5kwYrTUnPyY8OB1Z3ZlOTYKCMF9nY96XqWok94UnWLWAmdjd3z6qOX
         s4u4jI/ofMPyi8vklBpHMsGUg8XWZwu+Ocd7IFbx4RyXOtiZlitYVC4LgKxhxNyuM6AU
         jCSQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTldfqV7GmIBXy7W7QcHK1UQeIhWBbA7CIwDZey1E3dAQnos8qqZzso13VoddZMd6rfmNhoKvMId5Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzWr9sfCN0gW3LuLV/kiErbQ+T8jcpx9KsHybj9gifYegJ25umf
	TESUzslpPdUJCvcPJXNkXrv75IlGNHDcATqFUPeINaB7JSeduvyjsvACJcLvrM4SwlOuBkICrcG
	fzu2XsC+IQ+HcOq7zAEHV8k4A97fDQhE/jTdBviOCAadeaToFWCvlpNiAFh0j1Z6I
X-Gm-Gg: AfdE7cmp7/vEjjpAiQP0wC21aUzVn5462iJkyahxSRg+mKhSl9JBGtinGK9n33mNmDI
	54P/2Zx8aUjgpO2y8zwGNvzAvTBKmXlPZRl/HHAjvr8i0M2Eo9Xyr0c+6IYPJOeWAUjbLMXF1vO
	+5pnH9QIB2VWsg/9zKqeEx7ENqlKTdRIc70RhcrC5j/3ICvQe2EFxI5yO6EfwWG8wctY6L/hH62
	W45Bp3Zl5zNXxu1/uRxjjoKj3eb3dBdwKl5eLBGM3ScEfk3+WL3HvVoO68jWsOrNKvTTZIPXKBa
	cdpM00AnpOkPn32z/PF9jCwhhtkKu8u9mp9yQMCdN3ETHraTh+eYfDlzNu+aIwRw3pdtKRyeuY3
	mxZv8aoX83buYcpP4YZwtqCUBRqJ7iB91qRMer14BWQ==
X-Received: by 2002:a05:6a00:4294:b0:846:2f5b:c00 with SMTP id d2e1a72fcca58-847c08f548dmr1073476b3a.54.1782903812444;
        Wed, 01 Jul 2026 04:03:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:4294:b0:846:2f5b:c00 with SMTP id d2e1a72fcca58-847c08f548dmr1073416b3a.54.1782903811899;
        Wed, 01 Jul 2026 04:03:31 -0700 (PDT)
Received: from [10.206.103.168] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm3710047b3a.33.2026.07.01.04.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:03:31 -0700 (PDT)
Message-ID: <3bdb4ba0-4309-4377-9528-936ee616e3f6@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:33:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfX39rKWyr5su3Y
 xVU8SAXbVpwko3xbsF9nVV9P48DauQR+czhoxGOkCQgvMr8eL7XTSs00pWpzBd7vmUERKq589JW
 WOPXJhDk9ylLDNS3oOCZTCrSX2Nvfd0=
X-Proofpoint-GUID: u6kqkRSSNKbyVc5VD3wp3Jv-Ukt-ag1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfX+DU0pTXY9DkN
 CObPlc8nn0oBrQx7egPQ+Fr3yQJuVorUlLNoaBx46o5hHv1X2PiclZgZYKPzFBvQJRNEvBK1qd9
 hOGhQnh1EeknCv2AuCJbVtVKteZUD0+7DV12W+C+U9GFwvtc4b/DpULrzMNZ63SGZgr5t3niDzY
 wXyJbbW4FGCWRc4vU3IZup/uDXlNx09GVq4hKUbTQ+JBMNFBFGvb/c+8O9HYEdrSwEWvtSxiUZ7
 j/RGYcv7yxDwttj3mV2zZUUFJabpDi6MWTvhvPsrRjMkWyKl4oVlLwGvvbvNztPd6CUy8vpJyjX
 oj1ClN1shPMXldUUCZ+lKlJ8FD7LaiTaNwmWFB3JonOzTOd+ct+vCwk2J3rlZsP/ZO105GI76Xx
 zfCQPCnzVtV1aOUjL8Yxxu4HezD07fVONH3zh0oq3oBpnRaJM7bnNi4qmjI8GikIeCnKSut6wHJ
 mdgq1Agxggljo2CUhqQ==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44f405 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BqbkvxNZUh3vXpf7O68A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: u6kqkRSSNKbyVc5VD3wp3Jv-Ukt-ag1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010116

On 01-07-2026 15:35, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..f403f542aa00 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
> @@ -663,6 +664,14 @@ smem_mem: smem@ffe00000 {
>  			hwlocks = <&tcsr_mutex 3>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
> +			reusable;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0x800000>;
> +		};
>  	};
>  
>  	smp2p-adsp {
> @@ -3845,6 +3854,9 @@ fastrpc {
>  					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> 
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

> 
> ---
> base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
> change-id: 20260701-glymur-audio-83621043d143
> 
> Best regards,

