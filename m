Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666C83644CE
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776933078; cv=none; b=RGcbctQGLST9bHWqrxHBQkCqpyvbMN6ghX4kfFWJiz6lWta+x2U+IPamjxZ/JVfYk+EzaJqeyHNv4Ct6gJt2WmForMOnpB/XS9nJpys8TDbXQGc2byQMoX14Exg5f5BXvtpTMnzNwZQ4NX8XQZMV5StSuKm0h1oSLy7c/JbV82Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776933078; c=relaxed/simple;
	bh=lBmOK4eZJ8NrHjfkfe7zSAgJJi6DL6t5htHWOy+87hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vi96ChvPD6aDDtDjhoGkAAPD3o6NQcKX67RZL46mickrXw60Mo8KkOzsJhRQwtPjm6eZ1Lkw/BINpdfGlGFuY2KgKMqnp9pzs/SErTGvT6UvsV032K26ab5XIUDDo4nyemznJLjJnJbEmgBV7Mg/ffveCsCE9Ilyw8q7GPyxdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYIOUhFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxvTIt8F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYIOUhFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxvTIt8F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N5lMxw2630200
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsaHclOtgL9XWUK5PCgmoPoDrTaZEdbkamKHFbrfq0I=; b=QYIOUhFZM2ysYAo6
	dYa2j17DRAzejDZKM9wsOg0ygHcwdJVX4G5LbXtQUkW9Jtpx4P9erqblKaCHUz4s
	xCSRSjCba5Lo8U+8ccE6/l/iXgPrrKgunbMaNllvmXenPU3rij6UbPB6kKsdGGYH
	w6VOuwKL3HjwAGEDzK9UBBXvl+d1yEffDgS2Fr2qkLHfPblpU9mAGdRdCiLR3gOW
	AGPX1RNidflFaJ9iHf7RZ/2e3zE8UjWLh6TvaELPHE3ZcpCJGV9KVEj+MX8BPh75
	O1gXbmUfCddsZLzDtFlnVLNYZbIuUYYZ80i8vE0rRqgHw3kneCeX48y3V2UCzlfe
	h75jVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rahb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:31:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso6275371a91.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776933075; x=1777537875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wsaHclOtgL9XWUK5PCgmoPoDrTaZEdbkamKHFbrfq0I=;
        b=kxvTIt8FTUwlr41jwQxk9xdSscJhqInuFtcDDpsmex4w7SWpGri6KkEm7uO7W0dxZZ
         yGTJ1wAniAkHiesG3PY/X5XgzjmsL3QFFi+ffKFOYaxGCCpVFfcPLCkA/6edOE6FWRRb
         jDSDCI+CEWRQJDeJ/xNWzLr2yLCG7W4XjqLm5F5/CXzIduV/6UvVdOFXBqWal7l7eaeL
         cYycx6d07UKLq7nyCsip8dYfC3+65WaNCxUET+vFJWp/o9wobbhX4oJFAf7P+LGBmF5K
         SvhdfrCdz7CRFp8Hw9yg2JlqK92rDrAnNR9HSw9HbOk9l+PkGVw84brqFPIsb/FEKXh8
         7eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776933075; x=1777537875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsaHclOtgL9XWUK5PCgmoPoDrTaZEdbkamKHFbrfq0I=;
        b=FH6bmIr8prYbRArBAHJWXS2i50fYUV50KQOXfmKFd/uEQQ3nuHIy5IoB/LrYEwOwwq
         /diIZrwiJy6u/IrDYaV89/e/AJglAhMSovxaC/OIo9kBDdvqrCh3z/99nVMuSd2oxikg
         kEUZKoX8BCrwNbl1yRBQsDD4/pi2wujE5EIp0NgL0t7i2bTiB4L6LRkQC2ylPivPk9q8
         tElys0mtI+nAPJigQM9qXFSsrSdEbvg0Co641Gf9mBnRAG+F3rxwE34EihOGewxjoFs5
         NwKyPZx6j5SBOfMlgOjF1ktGgDqzlUru84YHZpW7V6ostWyLEVRWmcF2bQrunMqtREyg
         WTEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OdNhMUd9MVQLh6O5P1kDbuN95boxbjqlAdgp+6GnnWV7mjAPBPaTdhG7+N4apcYyFA/17CPpng5R/@vger.kernel.org
X-Gm-Message-State: AOJu0YyPrHcyKhcuq8Ntgw7HDXCXCkNTOHgk7v0Xqug9MdrQ4GqciuGs
	69eSvpbzbosRLfk0p/e+pacCitMsMNIyQxl0bft+QskBy3tPLsmznSFrQt2hvbdgxnN6wKjWH3S
	LxELcCESwWDkMUylMafXP75M2gZLd8YQbw5zQiSmaQRK2qqs/xp3ORIUTiQAZCFbg
X-Gm-Gg: AeBDieuJ8Rz6mTHebaJxXBUf1agv1eTuSLUEiZPgBAonqWRXA+SJ49MGAFwAzbSLkXi
	I2w/+WbHk4xAYlWAgCcczlbRfCmeoTN24dFBEAK479u0aXCPlgyy2eaI3SrdP+N6F36ETpTksLX
	wz/AuurBFa3D9sr0eycm5e7evoZfIdrJNS3IGS/Hg39HuT8U1J2js37DzyONRTINOSvu1cp8S+V
	p+k6EUzu2boY1rWHvTiqEkmDaCQklHSggRDDnWLPXXdLZoThuKGSgH87IIJXRIhGvJqfAKNLxD9
	7H10lMq/0kOUjpqaQcSaXysuc6HsO0dOoYgC48SZFCCphR2Tv4YscXFhRFnGt402hhsGdpvBFNp
	eFbboTKiC7izwTkL9X2o+bEVboLoS7yf1lURSqHsM1Y5z5/nORoT3Dex00vW1
X-Received: by 2002:a17:90b:164a:b0:35b:96bb:47ba with SMTP id 98e67ed59e1d1-361404c0ca8mr25344744a91.26.1776933075336;
        Thu, 23 Apr 2026 01:31:15 -0700 (PDT)
X-Received: by 2002:a17:90b:164a:b0:35b:96bb:47ba with SMTP id 98e67ed59e1d1-361404c0ca8mr25344689a91.26.1776933074843;
        Thu, 23 Apr 2026 01:31:14 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fb7118esm9676930a91.4.2026.04.23.01.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:31:14 -0700 (PDT)
Message-ID: <3d0dc6fe-f8b0-4d7e-8be5-68e1c3f47b8e@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:01:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add memory-region for audio
 PD
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260419-talosaudio-v2-1-3a3b5dd67dd4@oss.qualcomm.com>
 <a50ad3be-a4d4-42d7-8680-0e7fdf01443f@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a50ad3be-a4d4-42d7-8680-0e7fdf01443f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4MiBTYWx0ZWRfX9EUqbHqUjxvx
 IwspVV7Ti/gg5HTbGw2NzE69rpL00Tk4K2mJ0FtrCgA0bDvhg/PU9XpJ4OIGONtTUXbxmz0Y0cN
 0Md9oajeg8Ia0vcqsFyqAW/NzsdjDXgzD0XJ+XuQzt/txdptUSqR304ZkDnLvxYaWITeqcvqZyP
 TFqdv3AEYrYBwVRSZc9Ac8DoO8TBwtSbYZQf0TNaxE7LrIhCjVrY0+zrPMQg2l8r4klfB6hRUqf
 pALYJSpwoXU9kDlAIp9IBT02HFlahfKLWjNpDK7KX4XjRzXAKoa7l/lGFcJmYHucRqXGMqv3dyo
 6ljPCLTDxBRmDzB2pAbjBURFNEhhFXLWpaZ7RqAvARASA7m7OGNaP9nQvdBezwAWX8YpIoAT8ov
 cqA+aVKE7V4mwsBQ4PUdNMC3rJLSCyUiAgGqngtYaT1oTioTzMfA93Uj+yQHZnp+mYascNNeYuA
 A8kb7U/R4uN42iprZQQ==
X-Proofpoint-ORIG-GUID: MF2ZMwAhlvokOyokxgLL2_qjP5WiTy37
X-Proofpoint-GUID: MF2ZMwAhlvokOyokxgLL2_qjP5WiTy37
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e9d8d4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SvBIBT611XFeX68nN2kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230082

On 22-04-2026 17:39, Konrad Dybcio wrote:
> On 4/19/26 9:41 AM, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Reserve memory region for audio PD dynamic loading and remote heap
>> requirements. Add the required VMID list for memory ownership
>> transfers.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Fixed VMID list alignment.
>> - Link to v1: https://lore.kernel.org/r/20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index ff5afbfce2a4..f71b327c7ddf 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -11,6 +11,7 @@
>>  #include <dt-bindings/clock/qcom,qcs615-videocc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/dma/qcom-gpi.h>
>> +#include <dt-bindings/firmware/qcom,scm.h>
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>> @@ -657,6 +658,11 @@ pil_gpu_mem: pil-gpu@97715000 {
>>  			reg = <0x0 0x97715000 0x0 0x2000>;
>>  			no-map;
>>  		};
>> +
>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@97717000 {
>> +			reg = <0x0 0x97717000 0x0 0x800000>;
>> +			no-map;
>> +		};
> 
> Is this for the QLI-QCS615 memory map, or LA-SM6150? I think it's
> right for the latter, but I'm not super sure.
> 
> Plus, like we talked in another thread, I'm not sure this matters (dep
> on whether UEFI reserves it?)
Yes, there is not entry in memory maps, this needs to be moved to
dynamic address range, like it is shared for kodiak, I'll fix it in next
spin.

> 
> Konrad

