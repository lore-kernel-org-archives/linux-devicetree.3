Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC9F46A618
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117295; cv=none; b=VaVV3qXRbgaR16PJbXWxSbpr0fNiDqQ/DGNIXMp9v5oABDv8TONG8CkrfQkyKUvHRYdkjZbMm/JQuNCEP2yJxZhSS1p3ewC2VryeP75I+Uiy/z+711Rvp7uO51ZkNwk+5+H3riTMtvrNrTG+R5rCfRGs5CjsxmwVTQtO+iD7Zs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117295; c=relaxed/simple;
	bh=WOULuRrXNU3vZP8q+kBbGKURV7ZcqLCFI5WsNJDmWMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuj0wQFufc92wuJKheDhXHRcKGF2DDyyNJsXgUaGBrGLTn2J1aiEHPzhVCuOJrukwzsUq562EcKm8LXg1GS0CNKTrV1ahQKELf369HVPikag8rWfTW7xqQsDI/D8EkkQ4rN/dH0I6MN95PsaLr+R7ugQScNtmn72BOuNMy5JA3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIj8rRs9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBo8OEtg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIj8rRs9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBo8OEtg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kwKv2311617
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2k3ItUaVcXqldvvdP/S8//Dy6WIBqjQIGB/tc6VDfRc=; b=UIj8rRs9mOx/hNIG
	I9NFzg7htWvzpcFpzgPpHuddUcYgjzxMc8P2VX3Ve5TYOuUYiQKlMqRGJnsIcISc
	0tQxiyS2A48MeZoyUVnRPsfJQpQx05Qd0B9P1KTvNmHX9wSy+BZgclhj84O0HBkx
	1OrEW1TTPZvsGRoODzANq2e0EX6h/BcZ0G2nd40SVfCLmv5SzhcmVP/ahq00FLZU
	2lYS+S3ZnVXXHGAt6FazyPLFHh90e9PiMDaxWBxttiRFJSrsLLDn891urVPRGXQi
	1gHHayGxGesOAleesPOCFlRddSO9fuS/rRTSlI4m0CJ/2CwkdDE+YHhx7FZmer2u
	UxkEoQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchm8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:01:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1377064a91.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 02:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117292; x=1789722092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2k3ItUaVcXqldvvdP/S8//Dy6WIBqjQIGB/tc6VDfRc=;
        b=OBo8OEtgXbTluVqUSqWkgT+MhgKF76BJ04+j6mQgS20lSKQWHYHOFRhxmWEE/E73vT
         81p7W+9V4KsdudIbQC+CwlQy7hCNEYLiEcJ7/7XkLVR9XCklZ5oD6bRWhRVH4NBxztr9
         4snBBHjb9oA8Q5UM6NhnwZLDpweFXnoCla8DTiMXH/AtXdMssyl8z0q076riho5ydXur
         65xnUUsfNMvmlOw6ouMJUO+BYtz1AAsN/2uxVej6L5UuaA9MhvYwUXzCPhN57P+dl6Jy
         mTk6laCfpFwwGDUGJ7/P8xWwiHoo79f8JkL3E9uEpZA8uzGH6MbzIdd4BTm++mkvcjuX
         ydfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117292; x=1789722092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2k3ItUaVcXqldvvdP/S8//Dy6WIBqjQIGB/tc6VDfRc=;
        b=sJm9x5DcnX7oN2I5p42qIMx1w9C6D0VCMwdP6vo8xCQcjwCQwDiq/Eiwjy12TkqYNF
         6UNa/rnlFTN8KcxJJS7GHDzs7TaptOtZ5WxCqnSxqmCE4GIpmmL/Wc+RWyYBz/j6BN1L
         FsKjwLr1D/rRaSI1ffn+a4H81h7Gf2TgrghEbnwWXKhnWeoB1qyrLL76gnWBNl13W58Q
         o1eWwRsj266+cKbTLQpdmrxeSjPwprRejjrgoFm62bF2VMMnWonO5CS5PRbxm0oYDEkV
         WgsowKBfv4SC6Ec/j8IlO3JZJW99tEUheJkJ2q3wmiVxwBjybZVxy3LMfQCKgxs1WAO3
         ufJg==
X-Forwarded-Encrypted: i=1; AKwUvBxyKiPPB9/A4OFN3+SrlpjpXKPp5vI/sWTyuT8yqF+K2M7JG1PEMFriilVUllhGLQTqJEzWpVAkY05e@vger.kernel.org
X-Gm-Message-State: AFuF++mW9NZR+TNGWKO57ti0AYkJa2xpMnVkYqqsruY2C0otXho03OWs
	5v5lE8W/NqVM5PIxTnjyJUH+xqsuJFUzc3uVFdGOXTHXdlB8H8gt6AcbZoqlw9/0D3faFAZvE3P
	dkYDs25xaKFdJSykbFTLbzaXZut7JxoJ8k7WnDPCyx7cPfzrDcVMEesTH3lpjVKXB
X-Gm-Gg: AYBFou1UvVgDV2uZKR/ZDMWo9SljSq40ocRMjRsHrSRpe6SjVKwIlBnWlUggQ2zpfto
	YmKxJq2egDUvDowKflmroVJLnERcwMxoXVEii0a9uQdP/nyohW2+liCRfdUdpoM4S8bCHHkpKsJ
	FmP229T/FV4ltTIDuM5clZCu6Imbit5/AfXDeeAT4WmXIdeQFIXFnXWxdiQ0ziHL+1KKzsL3Pit
	K4V29zVBcBPPDtfJG8pwDlI+e0qeS8gwEIyRo5b+IqkiiyKMFFzQBbugLQLHePsIiRcByhcNewo
	b2oXKbyZjhnvJOBZ3Q85zfHYLFVgzYYn6fWXVU1Fo8X5PL3KQGbUZ1UV/ktGv0U6L2HdrlLWUUb
	O0VR1HjxZS+HFRwVdGjn9YuPY1+aS
X-Received: by 2002:a17:90b:1ccc:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39d77b1d2afmr11533133a91.19.1789117292374;
        Fri, 11 Sep 2026 02:01:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1ccc:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39d77b1d2afmr11533077a91.19.1789117291898;
        Fri, 11 Sep 2026 02:01:31 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm8427739c88.12.2026.09.11.02.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:01:31 -0700 (PDT)
Message-ID: <c6687aae-1959-473e-999d-a86582d3a258@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 14:31:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: shikra: Enable USB controllers
 and primary Type-C support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
 <20260911-usb-shikra-v7-v8-3-851ee4bc0eec@oss.qualcomm.com>
 <x2kka6ouwalb54bv4hxszoq2qdbctp3gx7qholeerxvbicrxwb@ww5rf7tnjaog>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <x2kka6ouwalb54bv4hxszoq2qdbctp3gx7qholeerxvbicrxwb@ww5rf7tnjaog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3c36d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BJegul65ukCT-9LGgkMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNiBTYWx0ZWRfX2rezVQLxLqYC
 b2LzeA5WfPgjk1ZlHlKHnq2w4ZKEvcvkkGVCDw3hUBiI7x1/V1Yc1K12EOrd348IQx2OzyUqHcZ
 0+5gG1zkTd0z2okmL8d/87A0Mr1nYeZXO3gwkWLXeC/oDeuj28HIDs0DMRP/NJlr80793Og19WR
 bmS5aQeOUXUzOfKGOtqPvs/Rf4zZdAnJp2qLs0fQvKdNY/MpkJIFUpX/cMzEBjTdyRb7UNEV+xm
 01ucvHcdU6/Nqdry7ozW+LqreX9XIowXVN2OVV3MYcnsf6alc1ygpeXiQZMwUaylqBirTTeQOZd
 J+pEjfZk6GWnXcLGR8OQbsJpoosna2pYvaXXrznlVsYKmr2Buf/71NIAnotqnzwnPdXQYLE+qc6
 0/QD1pw9UJveW00ZFIyZBXleiM2aLJ1j3mEHSRfX9xosy/C0jJ+T8HBBpfTVABMan36U3Fh0dM9
 /1xGpO1aRoDOfaXG5sg==
X-Proofpoint-GUID: jCT78XlVW1OBDpDzMIJfOBLRMUeetERW
X-Proofpoint-ORIG-GUID: jCT78XlVW1OBDpDzMIJfOBLRMUeetERW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNiBTYWx0ZWRfX+SFyJp1yUcoI
 cqvfRMVbJkx8LOUlNvAFRzPLSPHaG+HtBzy6B1mXQq/WHCQpv5uGG+uNKIDUzFdrnG33lxxzS6q
 w40gqNSvNWsDCrIn4bE+WGIcCh/MtyI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110126


On 9/11/2026 1:29 PM, Abel Vesa wrote:
> On 26-09-11 11:37:20, Komal Bajaj wrote:
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Enable USB controller nodes across Shikra platform device trees and add
>> primary Type-C controller wiring for CQM/CQS variants.
>>
>> - Enable USB controller blocks for shikra-cqm-evk, shikra-cqs-evk
>>    and shikra-iqs-evk
>> - Add Type-C support on the primary controller for CQM/CQS boards,
>>    including role-switch and connector integration
>>
>> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 43 ++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 41 ++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 43 ++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 12 ++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 23 +++++++++++++++
>>   5 files changed, 162 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index b112b21b1d79..286ea46d0c36 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,14 @@ chosen {
>>   	};
>>   };
>>   
>> +&pm4125_hs_in {
>> +	remote-endpoint = <&usb_1_dwc3_hs>;
>> +};
>> +
>> +&pm4125_ss_in {
>> +	remote-endpoint = <&usb_qmpphy_out>;
>> +};
>> +
>>   &remoteproc_cdsp {
>>   	firmware-name = "qcom/shikra/cdsp.mbn";
>>   
>> @@ -57,3 +65,38 @@ &sdhc_1 {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&usb_1 {
>> +	dr_mode = "otg";
>> +};
>> +
>> +&usb_1_dwc3_hs {
>> +	remote-endpoint = <&pm4125_hs_in>;
>> +};
>> +
>> +&usb_1_hsphy {
>> +	vdd-supply = <&pm4125_l12>;
>> +	vdda-pll-supply = <&pm4125_l13>;
>> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy {
>> +	vdda-phy-supply = <&pm4125_l8>;
>> +	vdda-pll-supply = <&pm4125_l13>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy_out {
>> +	remote-endpoint = <&pm4125_ss_in>;
>> +};
>> +
>> +&usb_2_hsphy {
>> +	vdd-supply = <&pm4125_l12>;
>> +	vdda-pll-supply = <&pm4125_l13>;
>> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
>> +
>> +	status = "okay";
>> +};
> To keep alphabetical order, please move usb_2_hsphy above usb_qmpphy.
>
> Same comment applies to other files.

Thanks, will sort alphabetically.

- Komal


