Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C61389E07
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864013; cv=none; b=L3/P9+2ahLAyOY8t4bqNHfATt0XN+evDNFQgAtJVoeHC8sY8bV5XOA+2iVhuzDvYplrCsuaGPtK1DsaMj3ZRTvFmqYOM8/10Q9MzO5G3xfeVb/8JOdR+IlAyHsZmqb9FZ3d+GiL3w71wVBpENW0Ez59Q+hdxoKkj1mUBO/k/4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864013; c=relaxed/simple;
	bh=xs34G7znFw67Yh3gCkVOLBmo/tdjsgdkHpHlus6HV1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nw7N1ZwM3GwLUoVX61uej/uElO70w41XwPZLJ5U5ZrhgvFWGEGww4eGg4SRn1l0UguA0UmwMyqMe/0zPph6vIwcJYGsn8ibrSD5CQ5Gr3sIJOJmSy9XnSG03r7mTd6kcA11nlaZRqDMUZA5DPHlAdL0axrw+a/DEUPiPr8FiBko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+Rhv2Ix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DW4mfkuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+Rhv2Ix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DW4mfkuQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U8PxJh2458333
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CWaXIOeFQ0RWw9uWV4g22gl2iDlz1fpndhsnQ8mBj8=; b=R+Rhv2IxvWE0E9Tn
	48JBIYbPLP0TS2CQ1kJfkFZwxJmO8sTDnIneTNSzj6y+RtDft31cP++mWYZWJjrR
	KNorVcX5Ecw3I2PCbZG1VJGTAST230BO3TkzXalSfYe0HtNsWtkqfGir8FbXH3MR
	OiIIF/90A4c9NgS6xJJZ3fD82FEaA9mBMHI7Ve0aWneO/CkkzuO+8In4NwEKg7UG
	H3RJu8vtxb15QYEvjMZ454xnmZoqIehzyOYJ1cPPhTYX/cPwk/iNWj4iI1kNgLCO
	dMs2Bg6DghdQSke7NZvSjOc/PUFUNtbUYtm88K1smAxEzoQwmIjxRc2Zgc6pAuYV
	coAs5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmrba1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:46:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfbd336c3eso166633685a.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864010; x=1775468810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CWaXIOeFQ0RWw9uWV4g22gl2iDlz1fpndhsnQ8mBj8=;
        b=DW4mfkuQeqq1MF9VYNsVG5Yumh6j7ezkLhrfFKAnsxnA6GfaK6mdLw9UqT1IQqDetg
         gBAzBXcLsGgCm1IHBqjHzTNdgYX3Xw5Cynrxn05YZdAPa2DUtQbXe6+KMLsdVdfP6Q2/
         o7lvES4nwzJgDGO8ZljQck3iEuq4ddX//nLU+EDc9KAK1vfqUnbsnFLWkcy6PxUo9Ic5
         EVi6onbGozBsb69NOxfYSvm1sAjoCXPOFHIvyGJ+S7REz3xcuMrw4uHMPhFE0VNgITn+
         ZySDb11WCzMDgN2pRZlaE6n06z+wqq91a7qlxTBANfl/YnXt94fFq365bpMfLyM+yBTs
         Ei1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864010; x=1775468810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CWaXIOeFQ0RWw9uWV4g22gl2iDlz1fpndhsnQ8mBj8=;
        b=jo9W1+2w1nf24rs0ycwt5xgCBQ3om4X+V7O7ZIYQro/y4p8htCqgdcIawCbKioITvL
         3lNf/I7BbvlPmuepiDWnKxY2+WfKtDNzTL+8VCzpBrSkc2n3S/xUUJQyQakcuTI+WLVd
         UR54StkY6imm1DGNiwgvgje8NrD3IDFfrPjN274Wjg9GFnhMTgp218MyAni+CZu20u6s
         sKNtuoalGv8+EgRcoubolpoMH/4xCgFYF1eO1sk9MB9vPp5GxQv3KY0jJoGGZ7SqbpLy
         l/hVCWNw+jcX9bXRDmNiRiVJ1neaDY+JWsY+uYqNY5OcIHA4i6YHAUbrOg55O8bQIWPF
         K5yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUjmHzHpBgqJCECmSmD/YXg/a6KeaCPTYeQrWUI3czquWBK7D5HQv1SYxPCdQRpC9wLqPm2rclMYxG@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRGR4OZvYP33Gbt3oDZhvzjtJhjCTYqdVQ8WUD8O6wT7wjWn9
	opFOeafWlthKMceDPPqHapFD2CMNhsuRDo16rLxKUVdsqscFk5ZhqwOs3m9nIMfBVX34OUaLCgO
	fRQ0M7CbLWiQfe8hlQtg7N4n6AZvOSL7OQKUFz2wNPqBK5fFU80pgE+sh6xSm0tia
X-Gm-Gg: ATEYQzza11lAKTi50lPmCFId3lr8xpyNd0N4KpKDsKEdyaK9NVKBHB26VEM51WVxZZa
	ttcOEAnEEqBVV/N40OfszG1O5KVQunw5BHmw95sZ3QPdbPscJL0Pe1Jn6JKK7UQ+M2SPiKo0574
	c7jolz8v5SWJpM7qo2og+nGAZXyNP0NWKp7N9U5aiHGDvha5ySujyfpit/46P6grBbGXr9dcKgs
	bzkhIyqA7DQLncjzwdV56Oib/vCj+T+nQol7zZKpiUB+gJVy64V72c1jy9UUPXR2HUZu4uUr7em
	yyg1FrgwiZbd81TjagZl8l/v5NsOT4iIYmSoYvnw/ddPXQH1cPiTGsHd8mJ27Y3v4WVeOGVgKqf
	kq+CqYtPR7lQpVPXZ3A4NQAVF6DgOdR3cLoAfMdpWV3c0wTBfp2HG5+7hqxxd3HImrwzXRhXs2C
	8Uz3M=
X-Received: by 2002:a05:620a:7109:b0:8cf:d441:c7c4 with SMTP id af79cd13be357-8d01c7f643cmr1077005585a.4.1774864010381;
        Mon, 30 Mar 2026 02:46:50 -0700 (PDT)
X-Received: by 2002:a05:620a:7109:b0:8cf:d441:c7c4 with SMTP id af79cd13be357-8d01c7f643cmr1077003085a.4.1774864009953;
        Mon, 30 Mar 2026 02:46:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7340cae2sm2493762a12.11.2026.03.30.02.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:46:48 -0700 (PDT)
Message-ID: <8ac10933-0bf4-450b-a7b6-59731dfe4cd6@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:46:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
 <vcj9b-49PycEnk8KeGcgXAaN09KfYZnW7g0LayiEPie9p-4krmMDfNO6Nx4DLgwoKHdKJughl7zoxvmKVkqOag==@protonmail.internalid>
 <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
 <0322e0b3-bce8-4415-90b2-d14445986e23@kernel.org>
 <r767islbwq2a3m6rf4wvl4hxzafdsw74jhev7jjz665kfymn56@vcn4p233n74f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <r767islbwq2a3m6rf4wvl4hxzafdsw74jhev7jjz665kfymn56@vcn4p233n74f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NiBTYWx0ZWRfX5rEnkuWsAj/r
 7Fz1WmrNPf7bMJbKSBguvL7vfGQtmiy/Yj/c/6FUnbke8eeyN/HxnBNqlNtfN9YVDSsnU4idmNG
 9MKVk8tITkvux5T9iNIp2asDCaEHx5xto0zRrLnSrapV2sKbflWGPda2mqLYTxKNb0OzULRDnMN
 oGtNu5s3iitar0xhtAHjH5bM/ddZ9YfV3FxlCHeQ18fu5h2N6/ARyKRaYc5QjbhunSWTjSnmki9
 1tBcKiYBpQuqFQ1+yQuNfNZ8nmmVDaIPskv34dDoyl2/NX9shBwMYloDUNpKfryF2TGldGOf0qW
 CImVzWzz89Gbl7nZErTpm7veXqRKAJMQGkGhCu6YNNe8I/7YNUyfZmw/7eiLe2h4WRkNvTs32iE
 FPmkoRbaW1WYW4KtiEFS/QfImQmU/v7bllp+fVXnUZ9gBlZC8zbq7dUA/iDBbh56e5pqgIcwWWq
 Xbq6RnGOqtIgTp+4pXQ==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca468b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1V8kSKjNecEwgvKTtA8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: v2Xzi7NLXawTNb9GJ7bq4kBHFj18CR02
X-Proofpoint-ORIG-GUID: v2Xzi7NLXawTNb9GJ7bq4kBHFj18CR02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300076

On 3/29/26 12:54 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 27, 2026 at 11:40:51PM +0000, Bryan O'Donoghue wrote:
>> On 27/03/2026 23:23, Dmitry Baryshkov wrote:
>>> On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
>>>> On 3/28/26 00:29, Bryan O'Donoghue wrote:
>>>>> On 27/03/2026 20:51, Dmitry Baryshkov wrote:
>>>>>>> That's just not true. If you read the camx source code you can see
>>>>>>> split/combo mode 2+1 1+1 data/clock mode requires special programming of the
>>>>>>> PHY to support.
>>>>>> This needs to be identified from the data-lanes / clock-lanes topology.
>>>>>> And once you do that, there would be (probably) no difference in the
>>>>>> hardware definition.
>>>>>>
>>>>>>
>>>>>> In other words, I'd also ask to drop this mode from the DT. This
>>>>>> infromation can and should be deduced from other, already-defined
>>>>>> properties.
>>>>>
>>>>> It still needs to be communicated to the PHY from the controller,
>>>>> however that is not a problem I am trying to solve now.
>>>>>
>>>>> If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
>>>>>
>>>>> I'll aim for DPHY only and we can come back to this topic when someone
>>>>> actually tries to enable it.
>>>>>
>>>>
>>>> DPHY may be the only supported phy type in the driver, it does not matter
>>>> at this point, however it's totally essential to cover the called by you
>>>> 'split mode' right from the beginning in the renewed device tree binding
>>>> descriptions of CAMSS IPs to progress further.
>>>
>>> Okay. How would we describe that there are two sensors connected to the
>>> single PHY anyway? How would it be described with the current bindings?
>>>
>>> --
>>> With best wishes
>>> Dmitry
>>
>> Assuming you add endpoints to the PHY i.e. that is what Neil appears to be
>> asking for and I personally am _fine_ with that, then it should just be
>>
>> port@0
>> port@1
>>
>> if port@1 exists, you know you are in split-phy mode.
>>
>> Its actually straight forward enough, really. To be clear though I can write
>> that yaml - the _most_ support I'm willing to put into the PHY code is to
>> detect the port@1 and say "nope not supported yet", since like CPHY its not.
> 
> SGTM. But let's define the schema for those usecases.

Let's perhaps also add a short example for both a single- and dual-sensor
cases in the YAML, even if there's no plans to support the latter
configuration now

Konrad
