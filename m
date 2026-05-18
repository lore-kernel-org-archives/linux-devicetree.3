Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5443CF661
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090637; cv=none; b=eBTxDQo0iLCeqTBKz8LbmWvU4Ocr8xi9ls+TZpzcc1trOYxqP/tvL+tV35eTtB2kjaZnISN/e6diA5UkG/G+D86ukx4kVXM7Uvzp/c8GG20vaKuSpMvFhoNh3W5LIGc3eoYepnJAUAVwhmNu5wwHf9I5fjvb2K4eNcwrCc/Er1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090637; c=relaxed/simple;
	bh=e42XBPD10MnyssBj+iInx905f6nD7LR/IYxUEpTUH+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7bdCl1q2Xpe+ltZsn61Us+jWB/U7aYmwvMtUl9Uafvf/6sTm/Sd67uBXOAsPHhrb9GV8bXSF7CuOapMLb3Rg12+LCdiWdEIVHJO6MlE2qBHKof/6wQGOzL+/CVrsqGR/WOcHCnpUW7AE8X6B5JWxX6oObODOEStE+Kc2vyT/GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb+4VQqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9qzpSmX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb+4VQqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9qzpSmX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I4kGDZ2216526
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJBnHUl957hvKo+iTLPq/Vl5eWX75Ini9s2OOopk20Q=; b=gb+4VQqk4SDMUVAP
	8X2nIptoppQf4gkU6AIYiy4R0F3qV/gQYIl1eEqsnfKjXrOAq/EJbLFCAWM6p3id
	J6ajsxsIGRYxC3VbhLhACTWgUq42gvRyWnstqSPUD0VHRgUL6gLejmBBOQ1lK2K9
	aJW99VWZsoeVSnENfGjQt4JLpypoSS2skuMVDCMnorY0zlgs56UnWDyjjcaAOGRv
	q8H6DP1QmtLBDBAJn/YzuTsfZyd08vqulpz8vgYF6vbXUeHPFfZVhkfBzQqEmPaQ
	LQp0LlFrWV7qOG9UZ9sMX9gIz1UMn7EjHdUTpplvl+vk23PsrsQw8SAjI0ruy0sH
	Ho5Fhw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7w7hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:50:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-910552aaff2so19274185a.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779090631; x=1779695431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lJBnHUl957hvKo+iTLPq/Vl5eWX75Ini9s2OOopk20Q=;
        b=N9qzpSmX7FI2E7/3x9w5qM+R1cLO1wmWCIMKkKaiplYG+9qcwGD8NoeVUCFGRa+Wx/
         u80TAG1fT7dyER57tFl2pgsrppoCHdACYyY9rOUvNjWvlK7GB0gPhNyOlwqxvCt2CXr1
         omCtBsG4VizmQjeRhdTM+U2IkE09VmDVFBbnC/hXJj7zenp3RTTHnpWe3Xa1EZfW0yoM
         IEpWTLraLkcCmKzyBktv/kB22sLygA4i5z3WWUO7613+jODRJgNhKWzMMiDEbYKTQ1Pq
         LmVYjmezaEz0UmzC4trDmufbAsf1jDqWfkNT+xNUUZaxOImdRHULmiYqztYRGNECaN5G
         lWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090631; x=1779695431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJBnHUl957hvKo+iTLPq/Vl5eWX75Ini9s2OOopk20Q=;
        b=T7s/u4oIedz4kombyySM77jJKXsBHb8zYaY1egYy0Y5hAOt8orAV/N6cZUoFp5BST0
         7y+OvKuMzt2vZt5Ny6L6nJo0APgIkfmE1zpb7b/PrK/HUGkr6/cVnuo+DXZIDu6eCnFZ
         e++Vu256t+CX1UuUXRfZbDLNN+4xnVP90DCimT8YgLwCy/RNoYEbJ9KVP6hEDBk9p4T6
         c2ZMWvSPdlHVPPl7K0TqWXzQFL5o0ibDBHh4yCYXowfND0+AaR45pAK84hrwo9s0MOGk
         wEWEanwytbTQluaPUZpDo0nnDjMqQidwWbLBa6O52/JMCn6qoee9sVkKumjTVqjEI42T
         LpAA==
X-Forwarded-Encrypted: i=1; AFNElJ/wmax2x5tGq9sD0duyhhevfRbeVnfa0UNX4T/pdmn3SeinmXmtVIScwp+Yr1Thfmdnjc9HRCCEkBTP@vger.kernel.org
X-Gm-Message-State: AOJu0YxykLUjU5Hrav29m7To90gzOhVuTObH31IWwIoaNYIfuEgMsnOu
	AW/76G4iXxS1+MXCVorPhVHsH14zKtae+9v79p3rZ0xzO0yyyTf+KzlUGqs7F4pG6qxR5VAidOM
	818UwXvDiMZEolr5e+EfBQyVKtgEEwrP+0UxceZtmTaFW2FEk4JwlacR7mD1Rnz4v
X-Gm-Gg: Acq92OGVoWx7sRjGJpi5QFtf5Ahcpdjh4MrXwKV0a8boSecEczPpvdkObOyjvDWdufJ
	jJ8uXIMHxysN+U2M+8HVyX9D16gtljEpdON1f238wIkBBe/ut+rtOoiptloFR+nFDbhHwtxbQur
	9/BZ31MyYtBItcYsId3lMWCljWNxiJ/1PdHoCNVC9n30LnjaxaCv+hh5bFzypg0A9oCsx3vSH6s
	xD6diXQdZWbEZcQ1zWIZyvDqSxhPfAsl5ijoMeL0e8Oo2NIFZuAUv85RbkrOB0jbJRLgYAtWmEd
	5ea/ux5MWJbbPJqnXoCsfXhuGlUVLpddl+fIQ1rOvwd1UWz/d4ru89YLfksWU5fusmoi76vQcJ8
	rlkdzD4nVAHhhOZh9wvjHbpf466ia79WHoi5ItkupXbWxrQYG0aI87kPikOpJd7E7WATdA2ZT+o
	/Tp+c=
X-Received: by 2002:a05:620a:1996:b0:8ee:7878:af34 with SMTP id af79cd13be357-911cda511e2mr1481346485a.1.1779090631523;
        Mon, 18 May 2026 00:50:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1996:b0:8ee:7878:af34 with SMTP id af79cd13be357-911cda511e2mr1481343685a.1.1779090630941;
        Mon, 18 May 2026 00:50:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6834ba6af5dsm4592787a12.14.2026.05.18.00.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:50:29 -0700 (PDT)
Message-ID: <a7278ad1-8315-4efa-86a3-c42307ba041f@oss.qualcomm.com>
Date: Mon, 18 May 2026 09:50:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt: arm64: qcom: sc8280xp-blackrock: amend usb0-sbu-mux
 enable gpio
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
 <dlpgdby6m5zsl6onu7rqzzatbq3jiqm5r5gvtxoh5k6lmuzqzo@gk4clmoa762b>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dlpgdby6m5zsl6onu7rqzzatbq3jiqm5r5gvtxoh5k6lmuzqzo@gk4clmoa762b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3NCBTYWx0ZWRfXyc4hIJY1PavD
 NfzpeoDEYqNQAWokBnp4AjHFHdJiKNhqxHc/8Nn4lCLUOKVuku+nkjpO3O8LiNdH1Mn3ZVxZ47e
 lgfCa6BPqQS5BiKz++oYr8wzXNKAeEnXwwL0y+23TAped9T7GEk5nCEnBY0uCfoehUjepbikYZq
 rd9cC4D1xjQNzfecoQk2bFPEjaXF0naDyYRkpcnh6ysxl+fBffpH/k0CU08YHGh6wxsK+OcKc28
 rzScJ7wtVcF5YoQoaSN1EY8b7n/L0pMdK/scfEqrt60+B7M2ACmQFO/QDUX1DA7JCSq/JDggDx5
 XaqvFmZiUIqRo4dv7+5Zsphz5iD3hUUHaAhfxroZ/sO6sOmP7UkTfleC0KW3o5J1EzkVXfYmWQv
 iSJSZcNAJtnDZAdsXnU8IhdClOSCtUxlFWPpQPrJPl4rkJ8/eyXvg6X3gQcfX++f0BlAkVJUtFr
 Tfl/Zke5mIr6B+c/DJQ==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0ac4c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8 a=S0HaN-TvR45hvm6jBKcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: ZS3Gs04N9u-AQnHkDlP2NNchvEZQTyVU
X-Proofpoint-GUID: ZS3Gs04N9u-AQnHkDlP2NNchvEZQTyVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180074

On 5/17/26 1:59 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 10:53:56PM +0200, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> The usb0 port didn't switch to dp altmode, investigation into DSDT
>> UCS0 device resulted into GPIO 100.
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>> This patch amends the enable gpio for the usb0-sbu-mux to the one
>> found in the DSDT file for this box. It shows a list of GPIOs in 
>> a certain order, and it has 2 buffers with conflicting values. 
>> The one deviating is in the second buffer, at the place where one 
>> would expect the GPIO for the select pin of USB0 (by pattern 
>> application from USB1). The GPIO previously used is also there, but 
>> at the end of the UCS0 buffer structure). Changing it resulted in 
>> a working dp altmode functionality on usb0.
>>
>> This debug effort is a result of work / testing of the 4-lanes patch
>> [1] on all available devices. Independent of it, it enables dp 
>> altmode on usb0, and with it, also 4 lanes, making it even more useful.
>>
>> [1]: https://lore.kernel.org/all/20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com/
>> ---
>>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> P.S. Might it be that you need to set both GPIOs? Might the other GPIO
> be related to USB4 tunnelling?

On the CRD8280 schematic, GPIO_100 is N/C and there's a comment that
at some point SBU_SW_OE_N was moved from 100 to 101

Konrad
