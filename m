Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2060A1D5ADE
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 02:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783390552; cv=none; b=kFme/tmD6YSdLCgW40RdNxt12d/E4oU2eYnlZpTAgx3lQCDds+3gN7izaCEeEDeA40hykQzFD8WuUQlLVEHtghxQJ5ABLERgdF0ps1QlRl19CAhX9jYNSNbBeA+SCGzXN+c0+RH3i+F6UXiFEOW65jJPvnxaNA4oR8i0//MhKDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783390552; c=relaxed/simple;
	bh=Bjn54ZUW34SNRnEwg2ElNY0d6raSsJDb2udOML5/kNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlKjlKVZc5hH1jP6fR43chkbxvn3eqosrPz4Swaj33eNTdvvomC/yhb7nSLVtybjw6PL4HQk+Th9sOtjFEOGbKxBYyi0oV9rGAfg+TFOMv4IbasybJJbKn35ihl/uOUZQ27E9YSzVFc46juG1ulhtM3KqLYn415ed+WyUpt3DvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPt3COnI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOISY/f0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPt3COnI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOISY/f0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEF9B1639590
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 02:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/S7rIucDxKPuRZHRHeHkcqkXwmrFQkHAWC9DJ06eh1Q=; b=pPt3COnIvSeysidr
	GoXJO16VwqTy0xAGVExenMUR4vaJ71Ccvm1rlYv3zlK2m7uGl07JyXqQNS3NOdkt
	b8RPd1QfBBN8r9LFd/7uH/ZhPkO6X6SlyIAAOaLNqHMZNEdJBbE7Kic7UOt7He/1
	nZ2ytVwvKBh6OCXrAVMxW4bzV7HUt4vUFtslGyGiaeeXqqg+Dt457edn67qjmR0X
	D4ntVRIfzKpqPjTKy2zr6KaUsLGoHdaAHPM34IGd8+N9/WcsvUkmyFl9j8zaOGuF
	yQ1B2u5ZNj7hk2jWm1b43kDuiSQorZqxhQ7WARkC1vDij4AeHXeA97HqRPLRHlNW
	my4GbQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r3naj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:15:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c894391f000so9281767a12.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 19:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783390548; x=1783995348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/S7rIucDxKPuRZHRHeHkcqkXwmrFQkHAWC9DJ06eh1Q=;
        b=EOISY/f0hUEf3ZHf4iEtDszJs17aW1/klDIpfx56107fq+xHGB7Kig/yhXxfMm/+tK
         bc/fwvcrsdhzMjZofGatWxhYN1GeMPbtkiB8+h4Kl0jRsaygopNKE3cbcvVEDjF/Njb8
         HIRbZeOITerTavu6Qm02Unc+HmIxnYCFfTDLD4abIxjawgNiC7bbRiLFwU4zliEn9/7q
         m++WtuQLYJJLf7UAQmdTYA/j2B8EzOujKImlF5tSSZuzAe9GqvseugLJSAcP3A8iqpaN
         ENqkeSaDOpUDNho5bAbpizJAMOxn0DFIyQqD3kQrY0WdcCTc0h0VZ0Kt08RnCwsOpMNv
         zqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783390548; x=1783995348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/S7rIucDxKPuRZHRHeHkcqkXwmrFQkHAWC9DJ06eh1Q=;
        b=fR6oCS4tPwTQxKydHNNTt0VgKQJtRsQMQhINZMeiFt5dOmqau2VesVA46jGyMqSPds
         djdyfpL4nvKW/rxtJdBZNgnhor2JZ2JuTVkyQOri/ceRHgH+Lg7TGD1s25nByvh4rc29
         g/SDFZMj/pSdK+3hSsRNegVjIdJuLnG4JQAa7QGmpPMLLY6ik1CUfkAqLql5Q0/pnYMQ
         8Zt7J5rL3lzoGbJaU3K5JRnOm7cUgdwlb28KnER/UenF+uRBWqo5BiT+u9BWKFQCa2jV
         fVERHuvJHyh94/2SLq9Vi6nK0gZk9kkrqYApa1h6GMhhtSMrYZp7jg6XReVBnI0zTqX2
         N/iw==
X-Forwarded-Encrypted: i=1; AHgh+Rpl1yBBldDlksSZxBAxmFFGbGWEilACgW+qyqnYSfBxeDiJybpXr1xxn8/5Duc9ANW8KvCnzvRke7aH@vger.kernel.org
X-Gm-Message-State: AOJu0YyGI4+3bGxISDRDmJ30kpYoGk+Fp19CwW5HgpBo7pqO7iG7A6xa
	H6hOnV5zPh/CaHHF5l6XpNJd4jiKP2hkR6AnYOA3I3CVo1j3BuVHMX83iK6OmVEYtH2OyTk5GIK
	Ohb0UEftAIOWq9MoElBk5XSOo2mP45AVqo2L87cuy7zyJnJgIBj//yj4oYRw6Cm57
X-Gm-Gg: AfdE7cnSmwGvB1XYJUP4x/kUkusEQcsA1anVSbOPgm8NaTkfzBt6SwuZYh/C4+Hetjo
	RS5G7K9KxNI5WVMNiSwch+NaqhRaoTjdJAw7lJ6hRzAD6Z2q4ErFAigWrBDQAF1OeoIQ6CR+Q3o
	UkFoJgjC1H/AqfevFiP63Bap0DTM5y/4oELeTo+3Qd9nP3zSGchQWBYKvq0Ra57CCVDYOPUFNpO
	ltP1pRhPuMBqNqOArXJXDDMBEW/rIQkJf1ucHQ2Y9uZkA+/A4BpKMv4UgljV5RW4P70d8WdfPMK
	Ik0h7ZbG4OF0ijXoQJx1wZrDMnwgW//DvAVxsbjEBV9zWiWI4i9cx80d0+j/0H28VKfAnGorzG5
	Tiy0veuFTXYCFXpYbzhiqUo4XQIOLKuO1K7rLqDINew==
X-Received: by 2002:a05:6a20:5491:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3c08ed1f10amr4146389637.23.1783390548040;
        Mon, 06 Jul 2026 19:15:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:5491:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3c08ed1f10amr4146347637.23.1783390547600;
        Mon, 06 Jul 2026 19:15:47 -0700 (PDT)
Received: from [192.168.50.84] ([76.176.60.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a92eccsm2175748eec.23.2026.07.06.19.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 19:15:47 -0700 (PDT)
Message-ID: <46af10c8-8400-4131-ac87-b3f17350bb65@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:15:15 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
 <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
Content-Language: en-US
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
In-Reply-To: <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDAxOSBTYWx0ZWRfXySpLQhNiCe93
 i46+ys7r57WhEQLPtMEcpuFbs1eNR0Ck/2LQLACMxIBw76QvGotZQIMG0dBWQ3eu984spfOIf15
 TkDmRthdVzuRKK6pHAx5NseEfPhgYuzr13Cd0FOKewdXsFZY+qgJy0OhZMXnSwPXCDb9Ot33zGI
 s5jNqGg9tf+NF+pLVxlRilVaC4ndJsF2OeOEgQdrvxxIsueWhoPAFX0STfcCoWtVV9RMKvNBHHU
 pAQWW6+gFMBlqDHoRtZfvn1w0ebYYzilQ7TaM9ykSb0i6KtPwh7phJbMJscsNm+rEr4uefkMlYZ
 sDY1eVF8NX5CTd5wE44t3uIgvYbxsybZA9e0oEApAhx/1b2zNKwSvY+QFc0MoBbUd7sNPcFHLY6
 n4oJOXZxrGMtEyHmJd4AVVipSLf1uziP1rACjuiSdMpWxqE58Vj6o68Lv1Hhuv3rzvzPCsJrxpb
 g0K0jrep9K0LW1KCzLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDAxOSBTYWx0ZWRfX6KnT0dQO4APP
 j4QvrOlyOMynN8BMMTAIeZdSh980bES8BwPJH74BBjzQsLmQQSKH2Vy3ugQsgJn1aLgoLSqDOO9
 p4li9XdZJ4rH9cIopTaEtTRKZ1B802Q=
X-Proofpoint-GUID: sDgpdlU58v2VPInxrghFNmC9Ac9mtU82
X-Proofpoint-ORIG-GUID: sDgpdlU58v2VPInxrghFNmC9Ac9mtU82
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c6155 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=0ISbvMpsx/t7i6H15JfNAA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=fFv3aZm-RBs7SO91p5wA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070019



On 7/6/2026 6:57 AM, Pavan Kondeti wrote:
> On Tue, May 26, 2026 at 01:12:58PM +0800, Shawn Guo wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
>> new file mode 100644
>> index 000000000000..0c7ffe9e415c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
>> @@ -0,0 +1,1918 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +&firmware {
>> +	scmi0: scmi-0 {
>> +		compatible = "qcom,scmi-smc";
>> +		arm,smc-id = <0xc6008012>;
>> +		shmem = <&shmem0>;
>> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
>> +		interrupt-names = "a2p";
> 
> I believe this interrupt source is GearVM firmware via Gunyah's
> doorbell, correct? How do we know that scmi0 instance's interrupt 
> is GIC_SPI#963? Are these assumed to be constant/fixed through out
> the life time of this SoC?

Yes, this interrupt is a Gunyah Rx doorbell VIRQ for SCMI a2p completion
from GearVM to Linux. It is allocated by Gunyah RM from the platform's virtual
IRQ range and patched into the DTB by Linux bootloader at boot stage.
 
> 
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		arm,max-msg = <10>;
>> +		arm,max-msg-size = <256>;
>> +		arm,max-rx-timeout-ms = <3000>;
>> +
>> +		status = "disabled";
>> +
>> +		scmi0_pd: protocol@11 {
>> +			reg = <0x11>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		scmi0_dvfs: protocol@13 {
>> +			reg = <0x13>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		scmi0_rst: protocol@16 {
>> +			reg = <0x16>;
>> +			#reset-cells = <1>;
>> +		};
>> +	};
>> +

Thanks,
Deepti

