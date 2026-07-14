Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D488537DAAE
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027271; cv=none; b=M4kel0DKUTJngwT1JFNUghDDHpeDz0/cKLVukb/T3fcyZRBqAPz3aDFWo4aSIcY54MbyXy4yU33OVZUguVt6V2I9XKGMTuuqvURKaGdTsS9CI4/t7WIik7ai74lVEqr+I9d/AyAT1FwMS1AjxL4vo1qy2vwhuIggswNnmTMLPU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027271; c=relaxed/simple;
	bh=MJkDtCn1ULX+X8cnzGICSgyjuo5+vt0Mc/zlwXPXYa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOMUZBkBLfnUhY1LIeSoR1sn0ndZKzGN1Uc4WCYbTD6DrvMJO3ga+MUEWNhJUADmBEk+mov4PjX+DeQ0pvGPNvGox2X3nKDODmp6MasQ9zWA2M8ktUUokk0VLR1I2eu+5Wt4ND4NZhONS+0d1nj2/irFAa6N42ek0KIHb24ZSmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcyBLojX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FzD+8wnL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcyBLojX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FzD+8wnL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SYkG3954676
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	So3CnGl3aa9Ii3ufK617ccxG419vCDYeqchFUdY6qw4=; b=LcyBLojXTfXgxEyU
	KzhzbUL8aqRvw7idxNQUKYnvLdeWSueU9fw1+SwPCvOEoSMgTgzakuZGB1iZ+62/
	aWCi859bkA+qHmcOY/I6GJU1SmeyuJLc/Zpxke09vBxgANS2GXoR7iEaZu5HZZuJ
	QVHvKspZVN9TWiGDjitafljEqW9hgvD+sLwZLyEPn7LtymrhH+ZP2QQMyXsuzJfy
	wdTFOu5nMOJHwJwYFYniwsqEx8vUd9Htn6G+xzb2tbCJv+PyrViisa7JEkKJkbi4
	PuSpFWG7ml9K2YfDXDWF1kvh1+3ODmhkSYiPorW21HMISu9WxmIND+GHMTbdljC8
	gILjYw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jue94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:07:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c891ed872ddso7420169a12.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784027267; x=1784632067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=So3CnGl3aa9Ii3ufK617ccxG419vCDYeqchFUdY6qw4=;
        b=FzD+8wnL56SjvWSfP61Uavce/Qugpm2jng4PDXspWLabFYIVH+n94N2tezD+eXlCbu
         1h752+zZt6IAT7SubJrSHE3iOL+kT1lGnN/CgUlBaM/BxUOGitI5TtQsz9kjQpvNCcJA
         gNSD+E0+Ukan/RgXt2W7x0F9aeoskWV2w8oXxPu4fu1r/45rCdbh9HrFi757yYo//Krq
         o+8ETE6HvLKj/YRrK/UBy72IxUxa5pjm/Y/90cWjZ3UMzgrORbDmfIUjC5AI4Jdc/Se2
         iTaR29OUH6U8YYCvf2k/NBSyXBaE5pdb7stkJapAf73+m60aCoP5DW70w+0iCLIyxh2b
         WChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027267; x=1784632067;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=So3CnGl3aa9Ii3ufK617ccxG419vCDYeqchFUdY6qw4=;
        b=FLJR5F3zRquKN+qtSFspzCa9PjChtxeffClMVNnXZEehalxeU8RxD8k9nLWbeN77O1
         +8auC1z+EWGiaeXWAKfHDEgEClopg3Hu1lWfaBOigAb+F4Mn9wmlwC8SCsZCQr14ByJd
         pciqXBCCjffx83Cmxp1sCeiHGLpLvzXXtyyR5PG3s0bJYakGg7E7DlFjWOf6w7MDtZKR
         Fu0I/6CWN2g11BVMOFZneDPaKdK4+Lo0tM+BuXrR8FgsGZiHl9M4hnHD8hDjTmFa4qAi
         5GsUt67YdKSGpX0vRsaxYr3lo/G+tkbBJnGlAYAdOxLAJmvthV9MCCR5LPEUFWetb3/z
         uKgg==
X-Gm-Message-State: AOJu0YyyMErm3g/Z/QonNeKASJEndhdP1SmuV8/kw4EI0V47+2Vt55A1
	NEQpuE0JoURZnL1+otzNS14jltfvS1ri5TdSPFrLb2unyb23xiN1d8Lf2PG9HgpCrtJaIqv2D83
	svgD20/ehEY4Qijj4PR11yB0QNUkrjC2/duaUy/5LZboU6L5ANLHwIRL/6eEal7xH
X-Gm-Gg: AfdE7cm19irVdkD3HUwsMoLtd93449e57nuNuImUX/rUGc4FEG1AoE1BOCpQuGHosaj
	JX4/w1bZIVUms2p3uBk0EjkpcBWELyh1Va2z9gWlgj+HxM5fCyvvD9ttAQnPHJakEg5BsNeB5QR
	TWDXKYoMLVVGwk9lx/fUv/ErKiVYKbB1mFpPmrmbdUFGvAlOywdC0KTgpCEaRbcCofaOXFIhiGW
	XFgWnLd3LVpKyAb1FTfRjPfHA03E4b5tb4zKXDUM051vxH7JGCuWvEj0tgAcd1ioSfCJReWx+vB
	X15ZNLq+u8uF2dV5I3J8kKhgLWAe0tOnYj16qlO5XBcIe9mPlvZ9iwA1i75kSUWXTdqtrFLmYve
	7G16ow/nrAwdgSXbtjMoMhlToCpYAPwWXTNkhdune2p+u
X-Received: by 2002:a05:6a20:6a24:b0:3bf:96c6:78a9 with SMTP id adf61e73a8af0-3c34d5284b7mr3759971637.2.1784027267563;
        Tue, 14 Jul 2026 04:07:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a24:b0:3bf:96c6:78a9 with SMTP id adf61e73a8af0-3c34d5284b7mr3759950637.2.1784027267025;
        Tue, 14 Jul 2026 04:07:47 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm140674709c88.14.2026.07.14.04.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:07:46 -0700 (PDT)
Message-ID: <9ef5c476-4f81-47b3-a86f-2dced939cd46@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:37:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/11] arm64: dts: qcom: monaco: Move Iris IOMMUs to
 child nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-10-72bb62cb2dfd@oss.qualcomm.com>
 <20260709150313.9B1B11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709150313.9B1B11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lnDY5Wzw_I1Qu_b2_iNDexL1x_Uf7R7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX2P+kOfI9BKeU
 Cl0aXg6opFRmYOfu+FwatN9zVUjFPgF0q5580bTHRo0gTyIyhXeE2ghDv0edPCljHovK4NzIR5f
 9/BNgUJ8Sz5FyRDBcTZPsbJb0DBIAo2wjsSW+dORu+q7Se/+Px1UfzvJdcy7aGYtPmaQpW21yp6
 SRsJXRpJkCYQVAQK03XL0Y3pgGJSrH0HVf4FoGY06XbHsnuAEHrRrVVW/RNS5r2mzcgYbDbOfI6
 IRNBQn9e70Yv/b+XUCNpUzxA7qhucoyONofSsHTUev6rEYwFOryjHGdwLcxwieWThRdbBb8Rdd4
 LHn7P+ZvePw3mIMX8zbjbLMJvJNZ8Lqu4BAi0wmAc/6CZlDDZ7kvZwlLClmbpLWYvpFpqvnkvIs
 +Op4zKm2smPTTZQUJTjsndTojDBCzo7uQqMC4KDl8gFi6OslR2SbFDzlYbS5b1oBsAfj3d4FdJg
 aTROa2tGEM2JpOTwoHQ==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a561884 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CT2iAjWcw3EbmAiu2KsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: lnDY5Wzw_I1Qu_b2_iNDexL1x_Uf7R7o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX7QPxBmTIHzwG
 u8ZYeQWGnixvwR4FqBPwxqLsnxmgVqQ5O9cQVQPXbMoWTuEJqhowlpu1decmD2UxpVHATwiuBm2
 Qw6T6LUr/Af7GvgaR5iRvnx5R6g0abA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140115



On 7/9/2026 8:33 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Misuse of `iommu-addresses` in a `reserved-memory` node creates an `IOMMU_RESV_RESERVED` region that actively blocks IOVA allocations in the 0-600MB range, rather than restricting allocations to it.
> --
> 
> --- Patch [10]: [RFC PATCH 10/11] arm64: dts: qcom: monaco: Move Iris IOMMUs to child nodes ---
> commit 2ee0f65b225528a8b439c85350380c9a56ad101f
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco: Move Iris IOMMUs to child nodes
> 
> This commit splits the Iris VPU device into non-pixel and pixel child nodes
> to accommodate different IOVA constraints. It adds a reserved IOVA range
> intending to limit the non-pixel stream to the 0-600 MB range.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -831,6 +831,10 @@ video_mem: video-region@9be82000 {
>>   			reg = <0x0 0x9be82000 0x0 0x700000>;
>>   			no-map;
>>   		};
>> +
>> +		iris_resv: reservation-iris {
>> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
>> +		};
> 
> [Severity: High]
> Does this iommu-addresses property block allocations in the 0-600MB range
> instead of restricting allocations to it?
> 
> During device probe, of_iommu_get_resv_regions() parses this memory-region.
> Because iris_resv has an iommu-addresses property but lacks a physical reg
> property, it is classified as IOMMU_RESV_RESERVED.
> 
> The IOMMU DMA allocator then passes this range to reserve_iova(), which
> explicitly excludes the 0-600MB range from the available IOVA pool.
> 
> Will this force subsequent allocations for the non-pixel stream into addresses
> above 600MB, resulting in the exact IOMMU faults and device crashes this
> patch intends to fix?
> 

Yes, thats the intended behavior too. The "non-pixel" sub node is 
suppose to skip the region 0-600MB entirely, and return IOVAs above and 
outside the range 0-600MB.

Regards,
Vikash

