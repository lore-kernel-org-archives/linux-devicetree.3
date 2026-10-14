Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7293DAACD
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958545; cv=none; b=l+wjo/9vsP7nc5zC4WBrbDa4fRLXlIcza9VuPUwYt2iColQ1ksyj5qjSqoBwKzqd159X6DjCjIsCpPUzxwOe+orx1fDS/8pvKvrBBRYgiXv/P9u4tNtU/VdytnM7JiyY3FG+r2A+rmk4+zBfZazsWT9+UPKnt++Z6askW8/n9uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958545; c=relaxed/simple;
	bh=MAVOekCHS5n6Q2kXcuSC3PNN37t1MTSzZ9hGE5LmGc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g24L177KyGxulQmF7LqG2FlZguv4idrktKB0EWs8qPupxAKcZRgkpm5UBxgG3Ze/tFPfPUNGXUtSJQ+hg+VWEYZHzz1TBnbGRN1lTMm5RMGW7tCL5itw9osqwSw1zQvPGNjXYmKhQqy5JvbgmPefeh0zanLX/PNL+Do+zQD4SE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePdjSEtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ano4nqxG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePdjSEtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ano4nqxG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2fMgD3000890
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8meCWJ8H7If11rY8aq323lYK+Pky/xe8poRUEzVL7Y=; b=ePdjSEtpeDFOBSGt
	1k6xOZCDit0L8b4B+FKCXcKCtSxaXGy4dp6tLpnFsabPNDG3wGM8pOFmPwKyEnuG
	ZxKfkJ4g48XZYrdxOinUdnm67KsmSGO/fDXNmNUwb0EfV2aUtwSOsMCrIL8Vb4kk
	46AgGaQxIcCUNgf+N8+8Q8Us1SlBB0i6+nidNk20qUyQyLwtU3cse2dpSfgcOkmJ
	5b6W2mcM/9OWlwcvmAbEzJfb6MBV+gShx/u3FDWwwV5SZMud8u5xRimy/zUHSDN7
	jODv2pvFDzdAY3kl1IhJf9j6EafY7QsGCfrfJCbj7qkXKKuZXv4yQ1g5hT593MJk
	oejGYg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbetg1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:15:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3515266f6eeso1104826eec.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 23:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791958543; x=1792563343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8meCWJ8H7If11rY8aq323lYK+Pky/xe8poRUEzVL7Y=;
        b=Ano4nqxGyAtilPZx4YQqZ3qMnb25zGFOlgXzZungOiUtE9rHfQ6XcIDpE69qk+Zxb4
         R5AMy+4ug6yi9raiaz2yRHeyqTpVTjyyluCIZJaTpJSaRAYtq8qe7ub8W+YrZDjegb5S
         +UykG0f+8dTxZOUmtB93BetHgL2YcYOdwPHPmiAwxProF30fS/VuqhKvSr6RBJMy27ak
         d+JKjbbcurJ6oyT1cHjiJSvu9niV+PoMn0CLmrNS5cN/DJ+RvyJVePykvVEfkxh0/e4K
         r3yk8oUWZ1Hh2x/lD3mDTpYOaeLt6CaRLZhwj4x201C+sSsXks8wa01PtLYf/hmE3+r+
         eOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958543; x=1792563343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8meCWJ8H7If11rY8aq323lYK+Pky/xe8poRUEzVL7Y=;
        b=SxWnfy4rfHMDZNHdHqVl5uleiqSfbKmTkZo7IQ+YI+wfb9iQ11GaI7GrfPCX1d36kS
         kA8Of5rfzPoTwQTNw171d/KNvEY5BDWyYJsA143agnBis9vWXQAEEE8/K4KHGyxDbA47
         uke60cig2zzvDugqDTSoyofmGQhw2UIakXtwaniuFI3wEXvewQVA+6Pm6mX/g7gEAwit
         QBqf50kOrsjLYis2Y9jhjWAOZ0exrWXBG9P5cztp38oHQOCrIZXDGY1yV2WZA0H+VxAt
         WNygEIzR1Nxer/VkdqvsUqNBUR4qQgdj0/yi+0We/+4XpTi5Ni7BYj+eNr+3C+7sY2IG
         jIdA==
X-Gm-Message-State: AFq9FYIIz7Y0eMp8oYz8MQcQLSg0Q4fraOttOSu0wkIL/H0jwxVfH6TT
	FXaX9E7V2hqeJinsPRacrYBSGL9vvTcgmvEfeZkOoHgkPA4AEqf8chFVinidsUXgBDHJyqvRzvZ
	CyIHDfgYpyDTO8jqGOi+mS4JFkpQcD5vA0yJEGFsuI12cZhH4z4MkAQGlbVeYpCiP
X-Gm-Gg: AYBFou233SO4refqfnj7l+3LsrYq40Y/irWuMTkKG+caeHPD0Q9tGyI+tYrxIKuDugq
	IG8lKxwAabEN37ogOc2nOYDrcdbqc/oDDPhBcx50mqRAi9PYtgoJsGlfn4b3FWA5Mjd8y7v/v0M
	xe3kfS5Przas99wSM6x33KqVqM8afZzh0F8id28Na2sWryvfmkT81WdHkohQ9OoIQvxUJEVguFL
	zTME6sBkDxuYHzDfy+tCPW3zE7AelpofYldFh0SUwciz9LRtdzkB91vC9dfzcqwmPKXjoQ0yo4K
	fX4Ima8CFT1yIrIXVPozX5/2IZtueTM3+bc4UPKYx1fvbOuAw5HbR4/jbUYSaD1JshUG7oi9rkj
	o5IDcEo3XU55kHGF6KLSXduzUUyc=
X-Received: by 2002:a05:701b:260c:b0:144:f85a:a188 with SMTP id a92af1059eb24-16a56ab4575mr18163582c88.2.1791958542679;
        Tue, 13 Oct 2026 23:15:42 -0700 (PDT)
X-Received: by 2002:a05:701b:260c:b0:144:f85a:a188 with SMTP id a92af1059eb24-16a56ab4575mr18163555c88.2.1791958542148;
        Tue, 13 Oct 2026 23:15:42 -0700 (PDT)
Received: from [192.168.29.80] ([49.36.81.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm51565161c88.12.2026.10.13.23.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 23:15:41 -0700 (PDT)
Message-ID: <406a393d-56ec-4143-bdea-2d46c5a4d1bb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:45:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only power
 collapse state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
 <0afbd549-3e9c-4b06-928d-34b2912754be@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <0afbd549-3e9c-4b06-928d-34b2912754be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WlY_vMZexIxFRNY4BXdJxEpzR734h8ZK
X-Proofpoint-GUID: WlY_vMZexIxFRNY4BXdJxEpzR734h8ZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNCBTYWx0ZWRfX6vVKw4PDZ0k5
 uj+74lbKXvs9aDvmfbBLWrJ9qWbuDQeOKwfQdcq5oHV8tCCTUTYFbssezPkJVrcuZfxLKL3127b
 m05plCDTzwKlQClxipq9wjFBquYCZ/ZsufkERm5ejJxBNsyWIM3bV2RfJ4ZdIGbOzTF/Sl8/F8e
 5Al4a7olDWSucM+WpviHAUJ2jV8D7NHanEC738s0SlRZyfAYXM/IYzLOPBwyebC1S4POTBXCguA
 tXQuXdUPIilvyQxAoCz3JfZCdA80ZJuQ8p5K6lJuUHZv2rLUE6jrf7r3SVHXrpKXOP9XiiYuKc4
 KpkfKzdVI64Z+SQXDKkUJYuYGOo/clIPmLFET1sMHpEcaiLRi0A5xcEZJLu9z7I034u3Kki9qU9
 bCvFDswPE8+gcAQZ1FgVOjgP/fgeggGVOeDoz1d3QM/2Jc9XYWN7/Sp6Qrs3aDk03RU5Dm5+Z2r
 TI5IYtHABLACMMu8/5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNCBTYWx0ZWRfX6H5a1Ue1XWXW
 7SrpuWK9geOheqb1tWFrGgcCy+hRgaZL6g9A43vYPEPee7Z2/Z2+Dw/oK0YqX+YTyV4c/oYszZt
 7LcuUfTEqtARMo0PSrRQPIGb02KZ2U0=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf1e0f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=84Ru73zTo6JNcb5XwS6KEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AO_i1zjuEiQEncmG7N4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140024



On 13-10-2026 14:38, Konrad Dybcio wrote:
> On 10/5/26 5:29 PM, Maulik Shah wrote:
>> To achieve SoC low power mode like chip rail power collapse (CxPC),
>> the Monaco EVK board with four PMICs requires coordinated power-down of
>> CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
>> collapse state is reserved for system-wide suspend (s2idle).
>>
>> Add the system_suspend domain idle state, mark it with system-state,
>> and reference it from the system power domain.
>>
>> Assisted-by: Codex:GPT-6
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> index 539c9c80a808..b2978be6823d 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> Why is this board-specific?
The deepest state is only supported on the Monaco EVK board with four PMICs. The monaco-ac-evk.dts is with two PMICs and do not support the power down of SAIL.
>
>> @@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
>>  		};
>>  	};
>>  
>> +	cpus {
>> +		domain-idle-states {
>> +			system_suspend: domain-suspend {
>> +				compatible = "domain-idle-state";
>> +				arm,psci-suspend-param = <0x4200C344>;
> Please keep the hex numbers lowercase
Ack, will update in v2.

Thanks,
Maulik
