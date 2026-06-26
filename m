Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0DF3F86E0
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484151; cv=none; b=nJAvnbnlZBbUKtU0icQxZ6qwddvs6xEbbRz+DtmhWkk04qZpd1Xak5AncB6pafcmlEn8Ak7vwQRLa3WdIhw90ILBGgnFFb3KWpSEn3YxkWIc3g3tVbD6OOau5XQrfPSdcz7s+S58XL2ECca1YFl+0WUhs3f15k75M2ec7Z3OnQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484151; c=relaxed/simple;
	bh=AB+GTcl1o/ZMDBuERbDpLhIle+9RFK/hgUm39nWcIxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+mdeCEFwPZ6Y4tjby4I2Su1CKRXeCBNyE3zj8tuLX5Cq+4E4BO5Ezjm5lDHuL5xwGYZtGOmGitD+p50Y3IK7OpL8/cUwtu/dwxUlV4/hYZdeiDCjvZFBlpwVXZTDDJ6+Z1JM+QtgNV5WA8sJmMgJoRY/9fB+20SS63dFQdFptA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWlLs0Aq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8fMmnv+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWlLs0Aq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8fMmnv+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcdVF561409
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 14:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KoXdf7c8yIFK3RBoE1eVqiW81sTwkSyj8rODkD/LDI=; b=KWlLs0AqBc46ktpa
	eifBVrPHksPB6eCH0ohP2IWaIwtquL2DZvv3sPBJudHNtO/RxalGVdCz/N6oI3wr
	kOqwzo6iLCa1Zu9p2t/4o+pYc2nxOCblSZcYlmLMm1Hbw7NhD2ODwsI1wpwPBlU5
	2K7Zg6ChGxpcbDAifgq0qagkev8Wn5aUcPzGKAaNsHOehHZ+0AE8/zQ3zZJiU0Lw
	1f0GCbcJlptG9MDEIvUhbBXAhe/nlX378yph+Nvt5Li7pebt4aWmf6vfFhxOCZU6
	NxgkLXMwYNOSDb0lkNYITkIU0K/fs81lNqeaTuQco/BMxTFODvPCOpM33N8ZjBJN
	t/9MrA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdtud4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 14:28:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-734fbe0e6afso35031137.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782484139; x=1783088939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6KoXdf7c8yIFK3RBoE1eVqiW81sTwkSyj8rODkD/LDI=;
        b=O8fMmnv+cZ95tJO5vd9kGbjxNf9fE1Kv2nvdU4kOvJZzxBzdQ9CWfESSFIOY4CkNg/
         HlEi5xJyDsBsLekF+zC/3Krsh7p5/fMXlCPvfpVtLQIIPp5KbBfb/tGLnxOaIQoXcK5F
         5twX76zqgZgGPt4joLiPe0jl2ObkE+OoqHz//4A31gJm6TY8vjhgc4zK6W2o83qGKzQZ
         zYDcrRViv/4pU/Of5Nc8RNlcEG4z/zTez0aHQVadaaIx77C+QGfSkq7wF9C/hl0b8zD1
         TTd4VwHZOWgUmQXMowl6CZqT11y50HnWkzeSO6ZTHFpzLUiQw1qbuTSIc99WAjvZLevF
         sQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484139; x=1783088939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KoXdf7c8yIFK3RBoE1eVqiW81sTwkSyj8rODkD/LDI=;
        b=StwILDEoqBsZNaljbC1B4slw7SSVVkm97o1WIGOl88GwQmXOM1ex0LLk4zNfphI2fa
         fdqea2nGWaOF1K2aRwc030diCJQ/fgSVsXnJGPJW6jlqIMWgHkFQUxgwYFRAJZRDVf65
         2I0dRhRosApeiJpdjUxh165N+hTAYN2YfZGsUVScSzGv5axc5UMuXyJgKzxiPlGLcm57
         UslHUFPbDWP+6zXkwQUGST6ex/T4IiP8QZKVV+dh+eBd9ZatSchkDaeDW14LiA7CnB5z
         x+4zbnCequdugydYLV+DjFoCTfTucsKJJmzMg9p1HG7SDnDBD+zndCVTae5iO3Hhipja
         pVNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rps4hfXSoQqgK1DykmGP2Y79BW3TqHBnbkzkDnuWqW5vZq8GtWK91F4YFHenAqaRoHG7cyKt+Rjpybz@vger.kernel.org
X-Gm-Message-State: AOJu0YzRo92yXrFAzDdMvk1hZfHsa1YAcfsjIlLrMwsjQW5cfm89rAvY
	VWTr9czcGEZ5LztQg7siO14Kp7RSIzE2o8g3aFX5CWQ+WOXElBT5PdEzoJHuJ+e8qX51Pjqdx+k
	8NC3IyC4YM87YgA6pgP8uPir/TOCmt2qWTWhIDdbHMGOg4PQrsSphyXQfnEisEh2R
X-Gm-Gg: AfdE7cmcLkCBkLfeaWpMSzdbaqbkwShhBK6xKgsUTjxFQFtpz0ISJ+nv9wLSXg8kC7m
	VkBifYlBwQZgpb7yAdZ5CI4zenYoM5B2+OTrmpiLkcdtEY3HzF5W0JUM+mth9/VjFTW4IUBvsFx
	lo4+9XAIu21AGyfJzWEXXgJizwwLKiCiaktCqFxltb6MCZOoPh3g7d8nQ8Wey4KbRXzzqEeV9s4
	yuwwvb8ju9bX7nHkpbqEIu/fflkl3NrcDyCAQvU8CWJpJNpKodnmWbp45GsXnLCRlcLpzB1S3zX
	I9FPc15OlpqbAn98wBlrlYeyTpZM2eH704lWuO97Hic8kM4YAP2N1Dzqt38NqwqJU3AAxeWMXqv
	iCxyR7c3FyX98X+FJfDDssyqOEgx1U4ehwOg=
X-Received: by 2002:a05:6102:148e:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-73433e3675amr1248996137.1.1782484138847;
        Fri, 26 Jun 2026 07:28:58 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-73433e3675amr1248986137.1.1782484138384;
        Fri, 26 Jun 2026 07:28:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd36adsm2993408a12.27.2026.06.26.07.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 07:28:57 -0700 (PDT)
Message-ID: <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 16:28:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
 <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
 <ajjmXMKdWzae5qqk@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajjmXMKdWzae5qqk@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e8cab cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wUXJofhvmvxpLSIlt_IA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDExOSBTYWx0ZWRfX0DiiZs9aD4SU
 em/RIJDCdR/SLpYUsm+50h/r8h6ycX90Y1Y1TXFMF2hVmDjF8AS6OLypGkTmVW5QaGHsPKoYPdN
 md0pfKZXaO3sRHNb50z+Pw0UbkPtgff6pYJCLWX7TeMdB4zwzFaClXmkR4HDJcXkPgIaojoLlpD
 D2T78vS6BBMPv6EfOu0fjr1Si3+o+QnVahroVQoQ/faJCE8ul70qQ7sQ2+FJzcoL1JIVVamqhbc
 UYc0OMldtR6BoUjrhERZIVuGxSzCrYnuRrHpa8cFcP89cHJlJaeh2mQ7mU1NvVsuYDc78uSBOMT
 RgOYwGxucNQOCktZnVsbFEhKkmdfI9O3gbL3DQIl2VkI2cFfIolNLBnnYpn85//Dh2HpeuQ3vAg
 pM5ZKpNEiVoWTsL0/vIDtkeXEDn8geohkBUzX9W1DpkVa/VmtOQbbqOhH6p26Y6YsqJGwsM6ckO
 hswhyQlkURZne+1esrA==
X-Proofpoint-ORIG-GUID: FioEazcwSHyM7xVwtxo8zWUAaLc4fgWC
X-Proofpoint-GUID: FioEazcwSHyM7xVwtxo8zWUAaLc4fgWC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDExOSBTYWx0ZWRfX5Y9Nnh5KuWZ0
 aMtQJ6wpnGsgJvufrmuLFdIBOyx2JddssSumVk62nBg0qBOweGw3necTUQbE1nLl4qBonDpSrA8
 G6btFq8xRl79CdEAkDyKi/Mnq2Hwwgg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260119

On 6/22/26 9:38 AM, Abhinaba Rakshit wrote:
> On Thu, Jun 18, 2026 at 03:04:57PM +0200, Konrad Dybcio wrote:
>> On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
>>> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
>>> an optional OPP-table.
>>>
>>> Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
>>> platform.
>>>
>>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
>>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> @@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
>>>  			clock-names = "core",
>>>  				      "iface";
>>>  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>>> +
>>> +			operating-points-v2 = <&ice_opp_table>;
>>> +
>>> +			ice_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-75000000 {
>>> +					opp-hz = /bits/ 64 <75000000>;
>>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>>> +				};
>>> +
>>> +				opp-201600000 {
>>> +					opp-hz = /bits/ 64 <201600000>;
>>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>>> +				};
>>
>> Since 75 MHz and 201.6 Mhz require the same power level, is the former
>> OPP any useful?
> 
> Yes, both use the same power requirements. However recommended by the ICE team,
> the DT should include all opp/freq supported by the hardware.

Is there any reason at all where the OS would prefer the lower OPP?

I think you at one point mentioned some dependency vs the storage
controller's clock frequency

Konrad
