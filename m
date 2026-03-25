Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5463C454D
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436725; cv=none; b=JOTjT9qDHl1RTkjZgE/DOFOmxNv6ZA8bTuUUzQSc70/OuOyLEQ4TxS+Zy4UfbQf2NXqiTNzgWPMEtvxEcIt7qnNWJHIgy6W7Co2szZ3Q1jGJh4W1Z8TTKM+epJZhDH3siZQxMLlVqMPazykdBWLb3IeRZrpPblmy0djB/8I6QxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436725; c=relaxed/simple;
	bh=DdZ/ZUnusFbhhYOpV5G2tr4SXOKiHGC0MGelaMwo22k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cMI6BZ8WN//8SIAU+U2qlZdoZizBcPctMMOFD95vvnbwVQnplNzNB9ljpC8CJACNoqLa6nxfz9/8CW/GLDORftGaI92mrRuDUSEYIUIPbM8XS/uzzPLUiJHCih4FZITmgyYQjDporTeEGpjang3nFklFooy6hEE6NSR+tU5Utqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KA0XOivC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QD2UxRjv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KA0XOivC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QD2UxRjv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P8rN0s3057468
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hMkn52yKbCKoN1Qw3j17Ra/1lNBzLvJdUY/gin3sns=; b=KA0XOivCcLVniXmU
	V4dr1DE0RRdLHnxxJS26o+5cD3EoZCguDX034Q+mB9RqpsVfTG3rQsmVqi0cCJND
	N1V+vASOeU7b2/s+SwFRoY+uZq85d1zjunlgUqF24nENegz21+w5/yYMsf8Fl0JL
	4lzCYzHIXXZGKIqfB5VaSQajgkDOHKvcuV3FuOPrVVtV3vKM2AvQ5LQTRoNRaXPg
	DNVppfLVmypdFYEfGlKcKNCvnX/ypvvEtGJi8l/w1LqT0peINepBTocLXewWpuH0
	fOyZMk7DRmfVFCW6BBgfQRaHllDiVAkIAbFJH1JKURzs5DD2xU3pS7GRlc4H7HHg
	sd5yBQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1r69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:05:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so43401511a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436723; x=1775041523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hMkn52yKbCKoN1Qw3j17Ra/1lNBzLvJdUY/gin3sns=;
        b=QD2UxRjvIGbNeqhz4atsfqTuaYXSQXzQT2Gy1V64VGMwdfmXgi/Po+mdpsgJyPgm7w
         nqCHdjbbWqmeODOvWY7hPL70EoOWCSwFglMrJsIYpBTjdpL2wMHvacdMW01pZp9nOyNe
         Q1zqkPNCok0+FXqP9bUaBVarZiSPjk559bI4rLMZIbm7dJM6qiDRGTrz/eYDIRqJZCuv
         V+RjdnQ+Kv+YQfS9oCGCG95WkSVPofTwRcz+vIzlVeu6phUUbIk0A3esnwjq6yDXUkHu
         4pjCnRmI0jMzgmxFna2lKdeY+qjiyAI0NTB6BLoMAPrJzC8m03YYH6qodcyEalumBbSu
         KbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436723; x=1775041523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hMkn52yKbCKoN1Qw3j17Ra/1lNBzLvJdUY/gin3sns=;
        b=NycpsXBonDYdPME17HScvlYa2eHz9yzcRgtgsJYR1v93sF4VpDpISfFjOQkqEb7M7c
         GFkiAW74j9fYY1GDxKC7IYg0xF4RaGtgO70pPDE0UhF/GfpLpV7wVMkgBRLz5khCF9bC
         Ec2K7xvfow92+VHCXKIyw0sFv/aBKMssOpBUoBSyaQgO+I3xJngsiTAjP7r7zA+8SE40
         u0bOyXNP+f6x2Ej4IqN1CMp4T7ORNeZTD3TRX37n5wJhfUSq9sD8DDWsrXwV51nkG0C6
         et3s4skzM21ilAWbNVrdbelViTFsJZztMyhou90FCml82glQqrgZiW3IOdzmN2wPvf8c
         r4SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNjcsHhwK+BL5EQyX2CFakVoCTRpidXsYvtMkkriRxZTtqinv8GfDYz0sdGzuI4xs9c7SMmS3MaBwz@vger.kernel.org
X-Gm-Message-State: AOJu0YwMm/dFUyh4Vh20ladVARuUNQTH8lGYFLm6UWJ+92mps/WNXdub
	1QtVH0qRbjlgrBTNu69YRUQAIrwIg0923MduKng9TOnu9Hi2ZsS8AyjWpP0hjisdhOE4Lnw7qpu
	EYuEsmyDzNNYlpBlMg2X9OfhQoKeSb26XL6VAvXPTSbQ9Mioafyc59ZcuwWXF05wL
X-Gm-Gg: ATEYQzyxZnQi2cjsu4FegI+sMv3Qfcw4L1esbx9lXoGw0QoHfMUx43DzE0VZRRY9Rcb
	of5jafOE9UtM/LIR+WENphBhlTrYO+umxWFx+a1orXTOpHA4oa6/2tpTl5ZVaw8/8A3xzg9A4JU
	Zeituw91G2SY+N/3n3qW5sWv+gFPgcppW49Vc7ELv/J64m3c9PIAEhFmoiXIX9neXz53NWGotzt
	4hjSz2kctD7A/cciQ9JhH3DZZw9U2OEr6jpr2UCUIr8Q8mATuYZFQQUckVv4/VTOWghuXwyDHwB
	6TRC/9C8iRZ+A6qxbZJnefCZNDAMuKVJNRoVl6x4MV63weavMvqQAG65pcuIawVJQK4EsTm1W6R
	2mU6C9vrrdDJTI2pHFz/9tfLHoqSoPcz+7wwrBB5Zy6Yu7I9haW/ZmQ==
X-Received: by 2002:a17:90a:fc45:b0:35b:e4d5:efeb with SMTP id 98e67ed59e1d1-35c0ddb2b13mr3005196a91.33.1774436723033;
        Wed, 25 Mar 2026 04:05:23 -0700 (PDT)
X-Received: by 2002:a17:90a:fc45:b0:35b:e4d5:efeb with SMTP id 98e67ed59e1d1-35c0ddb2b13mr3005165a91.33.1774436722567;
        Wed, 25 Mar 2026 04:05:22 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0e8ffa83sm911900a91.4.2026.03.25.04.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:05:22 -0700 (PDT)
Message-ID: <dbdc6ffb-7fd5-4223-92cd-9c1335d7441c@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 16:35:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: kaanapali-mtp: Add PMIC support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-2-70bc40ea4428@oss.qualcomm.com>
 <yz2lrc26oi2nm3hcr6x3fcst33xy63dqb6fild5l22tropffkw@og76e5s6futn>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <yz2lrc26oi2nm3hcr6x3fcst33xy63dqb6fild5l22tropffkw@og76e5s6futn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uJonZojq1ItGHKDc9VH15OwcQMVNI9b1
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3c173 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IV-LjLlVNDjyXHgx9hUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: uJonZojq1ItGHKDc9VH15OwcQMVNI9b1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX7G4u3ZCrtRUt
 tVJQ3TFvonnqO3JJupJmapxksy5Z8TDEXBMKjaifNFTltv+liKV6YM6UQziCZBAUisq4Tyt+aFa
 u8NO7cEXYTlNAbRkRO0++PkN6TqjlBcBocSt7od7spy6uTHlmkh+NRg7H0SzLfuLdyaTOKrpf4n
 3Mh0kQ+VG8i9GmxuTXbxOFEZ5TDNz7LpTawhJPTljwg8fYLDoYksKXs0wCW/XGH/LZp9uHhpbjs
 ZskM4EGfnZCzJOsJwstrw+JPngjGTkyO59zamnmHYGpvKR6/x34iEpfe1M4sExypUP0P5iIL21l
 cH4a1/qqbC76sCn4NK4pq11ficFrSOVPsFWf3PGOtJ/43DRuH6xegaukQnfaUxC6etBwTop/0ZD
 ZtNFWucRoKXz/83f5wJjXcaAXzAKju3FYHQ+SgYsPDYh0zyZA2R51GbikqyZji25uS8GuDPJGph
 AaBchprUrG5oiFiJnBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079

Hi Dmitry,

On 3/24/2026 6:43 AM, Dmitry Baryshkov wrote:
> On Sun, Mar 22, 2026 at 11:19:42PM -0700, Jingyi Wang wrote:
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> Include PMIC files used on Kaanapali MTP boards. Add configurations for
>> keys (volume up and volume down), RGB LEDs and flash LEDs.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

...

>>  	};
>>  
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		pinctrl-0 = <&key_vol_up_default>;
>> +		pinctrl-names = "default";
>> +
>> +		key-volume-up {
>> +			label = "Volume Up";
>> +			linux,code = <KEY_VOLUMEUP>;
>> +			gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
>> +			debounce-interval = <15>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +	};
>> +
> 
> This is not related to PMICs (and doesn't use PMIC gpios).

Usually volume up and down pins are both under PMIC, and it seems best to enable them together,
so we end up enabling these in PMIC patches.

Since this patch is already applied, maybe in the future, we'll add them under the main board
enablement patches, or perhaps should there be a separate patch for input pins ?

Thanks,
Jishnu

> 
>>  	sound {
>>  		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
>>  		model = "Kaanapali-MTP";
> 

