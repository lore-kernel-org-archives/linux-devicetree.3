Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC6409101
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820678; cv=none; b=gKQdpDCHaA3KYe7jd/Bexlbyi/XNVckQZVBDl4/iVWUQv5raYy1fj77e8fBPgqWSMT7+nkvxgxb+oX4qNygzzdSTllgdRgrmm96JonsS2s1PH+ZnljT5tXY1hyLsUrtp9YqNvbKUBM5tmldePZcL13u+99kYvmNXtrWc8GhXzeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820678; c=relaxed/simple;
	bh=yRLwbmZehOFQbJdCz/SPTD5FHiCCv8g1D/InIpDlBlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJxLrqb2SCvmVaFWK37rPoKYxmmHwy8L9he8g2bsZea6csW8ts/ohvan3QQ9S4PvIvTa6SnCYKS5lsRfV0XbvsMaM2K3i/Xmk8SZBaZKiORffau8CD5Mkz4Joz+fs0btSJ/CvqWlBI8xUT0a7/W2HzaIb0BKHaOMSLwyTGL2F00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZDaydgr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTWPrOTP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZDaydgr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTWPrOTP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxY61605154
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHC2Rgq/cf45xzQp1L/2Fd/3fsuR1ecn+pwz/JQ+FLc=; b=EZDaydgrj/oZl7jO
	7pgkx864g3sxB4SbG9D4WWfOKy0H+mxmVtQ2JxnHlv1j5lYg0XOSC0nCyJAyIN1z
	ThwirOWEYIn7jQ6s0UOmH3mQ96XZSa5xO0+EBNS+p9u45mx1y7QChlekmNXYV8MC
	rBspFsSwOC7xwwxa3gdgZ00NkL7sZnawPm1NZJcCk+Y3AkETkdUywFOx5tR/h7jl
	4jxfOT8A2RfbwJ3lxFia9Pdj/1bnqJT7+xn9huipNIs5YLJ9hZPatZPxTYz9Jcr5
	dGyWgNu5sNDrNFVmpfsJ8dY77wkKnYdtMUKFlxGXvSIYG7/3z0MuiLlJYiPiwdGI
	k8biPg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfjgwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:57:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so3239506d6.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782820674; x=1783425474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHC2Rgq/cf45xzQp1L/2Fd/3fsuR1ecn+pwz/JQ+FLc=;
        b=KTWPrOTPCjL0RY4eAlfuW3iMDGyCNniShrqTyXiQudzSVDjTtWcsSRyUysts3c3g/G
         +EIopceymEPhxVbIrkzSstcjPFuOJ9aBCS0YDZn/b66VOk2qheudDRI5qZlyDsqQEDkh
         Dtd5zp71usiR/dNL+/AARKCc4855d4Qj4jb/NXXnMhHHBy9cVmnErUqX6enHwo8s08tr
         lGq/qjemJuuIWy7wPsNUJ8FgFQztSfydPQzTRrIEmOpceET4ZegpqC97TSJtlSJMZvGE
         SJK5nesmEsp6NwEyxlfzAezDhWbHPg+Kq4Mi0aonUvyy9wzJGAvVyhfE/BpflWFPOI0A
         HU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820674; x=1783425474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHC2Rgq/cf45xzQp1L/2Fd/3fsuR1ecn+pwz/JQ+FLc=;
        b=BH0jFhLg+/0beiqxqcGk2m4Eq+KQ/GHyAo6MN/wUop3UVxfdtyT4JffoeD7ZlMz1vM
         HZTXvGBnIs/pbT1cV/RK11BSEoHh3z5bkVFLvEMOo0UK1ohi9QKLWQc2sdTlqiFZU2xE
         Siq/K9U3nrS5tZ9gCGZ6JYy5/kxBTGUWhpJupsRgBKVOCPJbHtdMiZ0d8vx1u0LOHj5j
         Hj1YW20SkS9L/IM/CgeiQ8+RyySDov/AdOS/i2UFheUee/m4KfmEZjoMdV+Qg2CrZv+1
         OsHtBh2j6lu7W+5ds1xMbkXIXnCff2wuOcdIuWxDKUC77MRMB8FcUt3n+PLNwUzfTcma
         jj2w==
X-Forwarded-Encrypted: i=1; AFNElJ9b6FxfqD0CVp4VjT6FnM4kgmG20auSBLf/2X7vmocywaH/k30ICIssu0O8mO0z1aBBlPOmYde78Y3P@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYDjMYNhXj2WbzQD0paYBHuQcggXVwaNPWupKSLL6NlZEJeRQ
	Ex9lK9qrH5Pe8DxqcnMfjlV7DnR2Cksvrd6hlWIqlbooJQShgL1YjD+qmIY2vJ627paVg05G8t0
	xU6SPaf0961ioBYvcrBnvy5nSnvucVsq5xTfL9OFGumu/rlYQiTn/hh5TMp6r2xyy
X-Gm-Gg: AfdE7clUrG6irLijI71s73+QpOvSG6YSqyxltG0MolSmESZ6nntOrGBZ7hOL2+Axxv4
	h0yxlZZWoBSwzvjU+KgjCYf+s26joRJK10hztzgCrXEOMeai2AjIgpbwEPVmBkk2BGcNXsM8JBK
	Hg5BoRLHTPXMLwvByN2dyhCNU0ZG85i72i4L6sUKWiALbJ5bQ4hWD0cnGyjrBT3D97EpsFC38Cv
	QUpmGRfI9hOcYtNZBWU1B4HQLmNpb18Y0Y9+e8s/U4sTkHiJq1L/bZZdnOVn1LKvstsj941lBOW
	lXDS9FpB7s/ksDTJdKvOLhn+cBYn7QmKvuF+EqnvgKIIiOMuaBF/jngnOM8x/mXgmizt6esmpUk
	/qcaMNOD/WS7WJ7OF/2mwG3mUW21MLBGpyss=
X-Received: by 2002:a05:622a:112:b0:517:6162:daf5 with SMTP id d75a77b69052e-51c107273f0mr30701241cf.3.1782820674211;
        Tue, 30 Jun 2026 04:57:54 -0700 (PDT)
X-Received: by 2002:a05:622a:112:b0:517:6162:daf5 with SMTP id d75a77b69052e-51c107273f0mr30701081cf.3.1782820673689;
        Tue, 30 Jun 2026 04:57:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12891785f2sm112558966b.61.2026.06.30.04.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:57:52 -0700 (PDT)
Message-ID: <3ae18832-4eea-4f99-91a6-17d250dbf917@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:57:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-2-ab2bb40fd490@oss.qualcomm.com>
 <57f3407f-3371-4db7-87cc-218f7360ce3f@oss.qualcomm.com>
 <5941078e-2376-46a4-b9e2-9686de1ca991@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5941078e-2376-46a4-b9e2-9686de1ca991@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4cxdG2ASBOYl2LySBcmFgGICNlKMGdOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfX5vyRfnU+h5Yt
 bxNvnW8itt8kg/Qq5Ahde9F2+x+IqJm+8IOz+VOO+YLONj/L9HSL7juoGaAt7w1TIK29E+y7omo
 /tjUdMiKOu9xHnCCiDR+8ZdStgMENvea3zlTfL67/xfYUE5RnAXf15WZK9B4QZWGQaGJrGy5J6Y
 4et8FPSkQAR56g5YMBBZWjYRDQAbn0FkY6X3VyX1IuMOpD7SR4I67m1zVRtSV9Dhg1YqywHvYZS
 KcCHVVyWc4PMJifeWQSwYk7cEzEi4XbmfIk/EnEmrUIr4E/MyCpMdKvd7ygLY79EHWmx1frZc/A
 sWzjcbBt4rrIWrgU9C8y5MpjzX2fPFvbHie6cGfN1batSsCJos1lFs7Mpe32O045V+mQRpEEiI8
 Jp2uPxc1q5NOS1lDmm7YFWAI+lgIieyLnCFYeocSCDQqcP8yypGKJSXTPJH2hehiDoeV4IiV3vV
 +PcdGCM1mqEnQ4gbdLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfX6ZHmeSAAPJ3n
 tpIAH4iq/Gopfa4PId7ZlOblvQBm9NBUdtXf5WyAKKnSAIO2eC1wQVUk+elwx8M/y+/MTGXHgwo
 Uk20Pq7PBX2VejXzPc/bCm7AwBIe6r0=
X-Proofpoint-GUID: 4cxdG2ASBOYl2LySBcmFgGICNlKMGdOx
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43af43 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YLglQ_YvAg-cOnyBpDUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300109

On 6/18/26 12:21 PM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 6/15/2026 9:26 PM, Konrad Dybcio wrote:
>> On 4/30/26 10:58 AM, Jishnu Prakash wrote:
>>> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>>>
>>> Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
>>> pmm8654au_3) on the Lemans platform.

[...]

>>> +		pmm8654au_0_adc: adc@8000 {
>>> +			compatible = "qcom,spmi-adc5-gen3";
>>> +			reg = <0x8000>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
>>> +			#io-channel-cells = <1>;
>>> +
>>> +			channel@3 {
>>> +				reg = <ADC5_GEN3_DIE_TEMP(0)>;
>>> +				label = "pmm8654au_0_die_temp";
>>
>> Are these labels namespaced, i.e. can the label be just "pm8654au_die_temp"
>> or "die_temp"?
> 
> From what I see, there's no functional issue with updating the label to either
> of the names you suggested. We made it this way at first as we thought it would
> be useful to have the exact PMIC instance name in the label of each channel.
> 
> Do you want any changes in the labels? If yes, which convention do you prefer?

I poked around sysfs - let's stick with the existing ones, since
all we get is this label, without a "nice" way to identify which is
which

Konrad
