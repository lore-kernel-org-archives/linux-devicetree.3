Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DAD3D1CA0
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861074; cv=none; b=aGobTS4bQgs6xsIIsc/VfxDamp5UXjbkJhu2HCuiHOzQtvzzPsu6OPGMiXsea5PKS0SEwnhmtkw1XbuQXMc+nXjh+y/wAmFKaGpxTCR+b3SK7RqIBRy9zMgdYFiW7s6P07fXSlUMfC4SBu9Gx410S3STpoBF/r1S0kIWF7/Sqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861074; c=relaxed/simple;
	bh=IDlEeuHzxHj9ZO1GlwcxnPRo/I4fE2o8P9OAQl5PRy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KijjsVqWJ8S+qx5Z4RAnYWiuIyRRwT+Psk66LKQTtgkyeecdvGE16tvYK4S/tWSv9GuHz8aCw1ZuLxJELJjC/E1EcUSgBgRpE92Ozgq/EYcezkdWcWsh/nNZYmTUnY3iTpUxf2ApTfGKfjSH8l+cpHTJm93iUG3ogxY/9MgI+60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzoc9u1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMJkvZYH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzoc9u1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMJkvZYH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MA9oQG2000978
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ftRI+Wwm+la8ONR/zppm5Qx0bLf2lP/aQLOmdyuyKuM=; b=lzoc9u1ZN8uoKgNp
	ZC85vr68nWU2FNkKFZf5XYf+X5xbD5FnOvVAeKmNi9zEVzZ6pRfc5wMdjnAvNiC+
	I3CsvcxalWKwaYbao0k/CLto5GCkgc96ET1o8t3wdYX0Gcx5KiD701Gg1DFvsvy+
	+kmApaziU0aNCPRDP5QhAzbxU/05jzKs/xqwAAC25PWDD+OmcQqwyt0omQr1ACzC
	dM66TiVrmwuN0LRCZvIHtKmlNPXHLIT/Ml8gy7S7ve68zLRnHO8irxJoR2dKTFoy
	V79JvO3Kjudm1ZoOso1OZMf/qCSDIjkMM+gSa3ry/OJdyC/u+9RTEViMoINxXbvX
	VB71ag==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfbe54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:31:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82d40278103so3636083b3a.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776861072; x=1777465872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftRI+Wwm+la8ONR/zppm5Qx0bLf2lP/aQLOmdyuyKuM=;
        b=KMJkvZYHtqFZfBRlFB95kgL8mqJj/zMSum5PG3KkxrEwm+QhcEY3XWZH6rz2gZ0SEB
         EBqvX8MbRqQKuwvaHScyPAabUt8Qmz8c7nv57KJWkhWUkDvi/tAArYzzHRloB/XjawsX
         l9iXXJwcNZEOtNkw9zeQE8J5MVJh6ShsOfC2jKkxH/VKns6zFninsEXCwfOnGugo+OLY
         ycNGLmDxuQ3qNdw6YKewbjzziYDCpzL6h9vV7dt7X/PIGrKJvTI8QkXmVavDn+JLbfvj
         pfusoti1/gCy868xo9R8/pqCFr/lOj5uabYVMlnWAD2B1YSzyiLL2eDMunE0lDVTW07p
         TLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776861072; x=1777465872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftRI+Wwm+la8ONR/zppm5Qx0bLf2lP/aQLOmdyuyKuM=;
        b=IoAdhTHeIxBjaVP/5Z2qZYWuOjE0THoxqojm2vTiYtyptHKMuiNkoTTbIqnQNz5nyo
         FwXay3fDkFt0eLzsfk29qh/o55iaDq/XzR2qqFwrQzBuGcVOX64HvXWbqSn1M4UC5yUM
         s4sEbuR4wPuK4qVihckZgM8UgZk4AJEdvx29RO6OL59km0eMEpKnuJS9/cfxSQfYnCvf
         YPRLUS3iqf4naULavsXUqkB4xPzAffT/hCxHY/4U+Fx0aMJZqSWSAMyQQNdak+/w5vHD
         1fA9ePulMpQ/wTplqDlIdRF3GWRAZ7WHUZfrdQzlRkCju/4EgT3AbVebKGcWe6GOM0EI
         Jm/g==
X-Forwarded-Encrypted: i=1; AFNElJ+3Y3ATzscVRHQUv/mnY3S3V07F1AOMTwg8feHRQFQ0Fik2aG3esexk+zdi5girPmOcU3zStua0mK6O@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6pRFw7LU5KgdE8I/b5ALNLz7jsn9wV+jgRCVnXigA87z1DDqq
	zqWkahZrqTRv2oBSKJW99q3yKwXHrpPGuGT/bz0gqGobu+aw/rIfONi+IgzBxLFm54wF0wOO7ei
	Qi9Trz2wcbyMsn1Gx3OYfXGfuPrMkd/pqtnI293QCPz0+Fdi2Vb98/pjQPpLioXI8
X-Gm-Gg: AeBDieui7NUm5IyBsBBwDL8SunchdYacXrtPdntcDOAdF23exz/jN/fZFbQ1L0tw83G
	/t1YxG9VscXEt2x8RkFAVcCq0LIq1O2C+QVbqb+UWE1lxn0sjFSKSplcqwCffVCZ5Pa/ZHhwJ0/
	T6gB2GY86iqMLh7DAX5NzSuv6e/Gmz10XpRS+PvTbdQPePGi5Lhyt+lX6yF9th7W1K8aM1ZBJe1
	JEYnaE35eEtHCs5gXQSGAJob1SUKtx2caxPVy/0fcH76XyAn8yyhhTveV68NxQOV+lwSinmBLw7
	HL6hvyi5ydSdkTpn31xNDjKrmQpXrxFaYiX+vv23iX/71wlYm4P6nv5Rkh0/BS+9ENxNVRmtegr
	/XXs7UL0gOYLFW+6tRISATqN3sI36xsoODzuzSjFLYdW10HwidzwJbGLtA6vGxg==
X-Received: by 2002:a05:6a00:e08:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-82f8c8fb888mr23014178b3a.25.1776861071773;
        Wed, 22 Apr 2026 05:31:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:e08:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-82f8c8fb888mr23014131b3a.25.1776861071210;
        Wed, 22 Apr 2026 05:31:11 -0700 (PDT)
Received: from [10.206.104.135] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9e0f40sm18564102b3a.17.2026.04.22.05.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:31:10 -0700 (PDT)
Message-ID: <8eef8d68-b059-469e-9004-39bfe44667cc@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 18:01:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
 <82a32de4-82c9-4494-838d-48900dca49ad@oss.qualcomm.com>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <82a32de4-82c9-4494-838d-48900dca49ad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fg5A21xyHRFdFFErt2xCOcCkKawdXPHZ
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e8bf90 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fCkYvREgeGE0EZizEysA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyMCBTYWx0ZWRfXzdOyPO/BrjaC
 cMhWNFHFgXVoj8xmYRfhQNLXwgFkWPF+W8x9BHVQeoXzUiEkZWi/iNKEcbj35UF5mOQmla+t7Ym
 QDLRd2m9sMfnJEFThSunOyWVZlHt9KzlBSspU5wXFaAvJTlqTimnoFNZso0B9MVYuJrL+G8qZgK
 R85TEdNYOYqwc7lpec1tmTPNocAF3QiOOsQEgdIpBB4X8gbyaKULkVEboeYOkeHzGvVdcCBky+S
 rvuiyoUF5EasXJmE0e3nFmdKfBzDsb01VrkuZucGEqx3UJrCo/Altv1p2dxn72/mJNYzFtjFdSc
 Stb36iCLn0IhOanlcKus3VtVvIk5xYIl9wgAgdO0sytl1YrXrQX6/acr6VRQ8NzNzrgC2pAQOCP
 BYBUCZgCe3jRitJTmKbl19NeHo5g1nZQtobsC2Pbf2kdbX1SZDnjhA1PqRxUOVb7ok49duEPtL9
 4GnOydRORCX/A7yzFEA==
X-Proofpoint-GUID: Fg5A21xyHRFdFFErt2xCOcCkKawdXPHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220120



On 4/22/2026 4:19 PM, Konrad Dybcio wrote:
> On 4/20/26 12:00 PM, Mahadevan P wrote:
>> Add the mode-switch property to the QMP combo PHY so that mode-switch
>> events are routed to it, allowing the PHY to enter DisplayPort Alternate
>> Mode. Expand the DP data-lanes assignment from two to four lanes to make
>> use of the full link bandwidth available in this configuration.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index e393ccf1884a..0c180e49816f 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -789,7 +789,7 @@ &mdss_dp {
>>   };
>>   
>>   &mdss_dp_out {
>> -	data-lanes = <0 1>;
>> +	data-lanes = <0 1 2 3>;
>>   	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> 
> There was an issue with this on a similar kodiak-iot board:
> 
> https://lore.kernel.org/linux-arm-msm/zjmf27y5i6ypba3nvsxxceuxn6yogp46lmtrjua37qa4ibrleq@4qv5s2wirgdh/
> 
> Have you confirmed (through debugfs) that 4 lanes are in use when
> running this on r3g2?
> 

yes
root@rb3gen2-core-kit:/sys/kernel/debug/dri/0/DP-1# cat  dp_debug

         name = msm_dp

         drm_dp_link

                 rate = 540000

                 num_lanes = 4

                 capabilities = 1

         dp_panel_info:

                 active = 3840x2160

                 back_porch = 80x54

                 front_porch = 48x3

                 sync_width = 32x5

                 active_low = 0x0

                 h_skew = 0

                 refresh rate = 60

                 pixel clock khz = 533250

                 bpp = 30

         dp_link:

                 test_requested = 128

                 num_lanes = 4

                 bw_code = 20

                 lclk = 540000000

                 v_level = 2

                 p_level = 0


> 
>>   };
>>   
>> @@ -1391,6 +1391,7 @@ &usb_1_qmpphy {
>>   	vdda-phy-supply = <&vreg_l6b_1p2>;
>>   	vdda-pll-supply = <&vreg_l1b_0p912>;
>>   
>> +	mode-switch;
> 
> This should be moved to kodiak.dtsi
sure
> 
> Konrad
