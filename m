Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB85357D12
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972227; cv=none; b=iFiilABd7uUZeqcl4To2uPumqpPO1SRVjvQ84LpJMxK1daKSyXPq/NT71+9hdbRrr8Iln4v9BQKglHfSfuaOq5bo0FRmJZRIpVervz3u0PLwC5DNTzQme6AgN8/qupcX+KhCYV+l8AWkEMHQwrQYEWfenspFlB6EQspaPHUhJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972227; c=relaxed/simple;
	bh=Za+5766RAtEJJPh6njpQsTKgzNJxRSFfxFO6pDVF9Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=or2LU9OHhupxLbzCGKWJuGuBKX2tq4H+80ojnk0FwZsV0Ol0q/CW4cEywVdksuwglTIJPXqsvx+6bHKU6yjym0BYn3gF+mivXipXX2l5tVqCkC5XYYgaxJuWCyy3ZoP5wDRt0T0xGZ9mLXtGr3H9GPCzIMXcYWkODQx51j60DH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyBk6hsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tnnivk2o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyBk6hsU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tnnivk2o"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9S8u2435350
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ucGZQxg2reJFI939JSAKmdJkAoKn8gx0mJoRPr4qic=; b=LyBk6hsU5QfSEQIl
	a7iKaaVJ5egLKv+CBOviDq4gAmwGWqnQFRWUdVXsrX8zU2EvXLEiI0U3NkuXTQB1
	5XJrafTzPcublpd/6SMcJd9MpBINSDU0ImV2FVCq0QRMZKUUFTm1Gdv3lR+1vD2e
	ibmSEsZG9iGnKsHvxw2JdzmMOIAAy0KolV3IbxmFe5PTM5no8OE1IxDcdkhMldRp
	Cem6cuxLQeiuu9BmOsMrOPW1XbChhmz/FX/W+FSWa8Q18kT2W41Mbih0RZM0er3s
	ICvrBCD6y0CsVOMNM4j7L4tqvce9Jc3bgALNRi7wCk3OY56Y3NEZg7FEHzCZW3fw
	aDwIXw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavtew9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:50:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so382691a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783972225; x=1784577025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ucGZQxg2reJFI939JSAKmdJkAoKn8gx0mJoRPr4qic=;
        b=Tnnivk2o94jB5duXJg/VdtGOOxZU1S+8CpLvl2eSRKHgcxRfpYT1/KqADLHL0RaVs5
         dgkGd0a5pOcWikRmk5YQtGX5/AKxLiEknTjWw9AnoG8mcO4K+yTLzv9+WAXWZmzmAABn
         988EeuX0LfICOf3WizjyATOatGlMzHf2c0125eC/9H3epKzcrOxDmHriXwkvwwHc3kwd
         JpZstxRGjlm03QvdilbUtrINhKGp32lsijBSdJ13uBr3ElwntAKaRXmXWeX1PNiibZRZ
         4CS3oqiOASHCdXr7ENy24/Sa//JcRzJ/wCyZ5yBoitzoU1FFzHF9n4HzW3aHC6hf3OJ/
         6JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783972225; x=1784577025;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ucGZQxg2reJFI939JSAKmdJkAoKn8gx0mJoRPr4qic=;
        b=Jrn5sGIiH/Ms43KDUobDdaiLNxvaU4tH102ceSI5YqIjOeuiKj0ywuVkuZPeRFtyQM
         GfzZ3jkCY3CbKb4SeoH2NjCR20YpTn4jp3p3rJDdWY6AUxErSrxr1DQ5BVdlrTTUaLN3
         8mRAsohgSffDp7kGbB6IJDoeX4xtMoJmOEhySr65Lavr2GFBh7avuJKofL9wtRGeu0MO
         lQB/GiCPpbjdFVuHYuxUIfrVPpu5TRKRoAgqJfAGgqsAPqPKYyASq9u4rVbAR+YkrNqc
         443Vhg/5CD4HyIOiSC+4XYDkCIwS/q9a64IiiPCjYst5zLFMawtJRZnpLE0IidnzsErH
         38pQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqtpj+F0i1nAVTkp3a2L6qbwDiwrfAKTQP0IkLij+VmJsybCSdox/JW/5u95AMs1vPMGmlxqS6L4uFq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy51wOPBNyyqAZJnphsa9m2ySgQmcqtZ4cjMqCk/TWZaA/eUzS5
	HPRkv+1FIyxF8eYSxsiRH1kBznmB/r7B36LzGcroL1244g42MfHrrcxiMA7t8PALVcQacrsgw2h
	JrjMJGlC9MYaD4k5deLmD0QTc9elYI60Eh2erEtUEv++fuh2M6f6RC8tTXWeYKdYc
X-Gm-Gg: AfdE7cnaecqfIZvd5kNtcaid4/6VT7uB8RTuRSWF0ObaY35KqlTe5SHOwykE8Uu/xTo
	XC6okPhupiewtgLOZmavxdNMTGCPQcAcZoVIEdKICm1NFxjXQgSS4nnokTUrhFSiY8PG1jvsU06
	MIagKx0sylLGnkVU/ldHaIsSOWPvLJLKVFKPxTuhDwb0WT2n7jqCWOfwlXKUZDtDxm9lpZprLSe
	YIqCtEf4CjquM/0ghBdQCeCl4qDYVrUpgfXyGgTK+pOahxCKdpe50V8R0xWQA1XPodZjwLBcoJE
	Ut4NfgBj1RnSufVE5Xe6BxkK9AFtEjc4DttXoNiV8mkPkcte5zWbkt2HORTdQIh7nZoxLtC4oZR
	Zi55mKtZtX9Esid4RaqlHlQUh85dTZmaRs8k=
X-Received: by 2002:a05:6a21:6e43:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c0f08602bbmr16998101637.2.1783972224692;
        Mon, 13 Jul 2026 12:50:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e43:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c0f08602bbmr16998079637.2.1783972224229;
        Mon, 13 Jul 2026 12:50:24 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm57081837c88.1.2026.07.13.12.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 12:50:23 -0700 (PDT)
Message-ID: <2d9d6724-a3ea-42ad-8cb3-ef08fd0882be@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:20:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
 <clfy5lvz7vm3ogw7pvyyidiujqcjxftx55p67szwgc6ivsq6r6@xrrcbfdkqkjo>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <clfy5lvz7vm3ogw7pvyyidiujqcjxftx55p67szwgc6ivsq6r6@xrrcbfdkqkjo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fTMHWt-ZrJqSbotm4OG1BavTSssHRNvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwNSBTYWx0ZWRfX8EM+tktRTg2S
 FO6UVt8V2+e/8hf03Fb2YjLKSewzY3SSr/lCiz6slylKN3o9XW2iunPwjP2MyUEGiahixS66TuW
 BhSRclD4DpWDq1pyJIU2WdZP9BMvfnX8lCaxJRk+9Fs3gXxqjQqBJcq6Ow+k4DmdIyzwfmm4r2R
 8w/dNjJ8kiyhRfoXoyiL+rjjNkXBqgx4MpIabyXj+kFGR0vvLVW/Au09Ok0Q84ZWLEl4TdPV7TN
 tW9I8QInxlRei4sfzTfzkQJWCNg8QnX7vWs87bGaYpOxdaQ9j3IG9MvAQzLmsglp+76/oALX48K
 w6TXJyiVUlKh97ZkTXXUJ2+uSmwShMENaLU3zhrvjFUW+MSjG4x/z80ljgl5KhmjuEv4ltrNY4X
 fwm+uZ/a6L7yxpaVZM81n6HzFZLj5LbVLbxUoEFOeDLLPHbl+tddpnDluoREu6cjCZ9fJuHELVg
 F6bvaCFKQJY6vMkFWAA==
X-Proofpoint-ORIG-GUID: fTMHWt-ZrJqSbotm4OG1BavTSssHRNvK
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a554181 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=yNfbWwvibup9Ri9izU+P7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JoE_KpbED9LNO2fW3XkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwNSBTYWx0ZWRfX26RvYiOMNbw5
 JC05IMB1wR2MSAaVb3W6YBuiCDry9hRrv390w+oBGtAZeitlg4djWfIO0QBiaSJLSdEo83yDwph
 m569AehauoahPFTsv7m17FmcocSq0Dg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130205

On 7/7/2026 3:53 AM, Dmitry Baryshkov wrote:
> On Sun, Jul 05, 2026 at 01:44:23PM +0530, Akhil P Oommen wrote:
>> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>>
>> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
>> shader firmware path.
>>
>> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> index 1374afd9d14e..b280d8e845b1 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> @@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
>>  	};
>>  };
>>  
>> +&gpu {
>> +	status = "okay";
>> +};
>> +
>> +&gpu_zap_shader {
>> +	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
> 
> Should it be gen71700_zap.mbn?

Downstream uses gen70e00_zap.mbn as this fw is shared between Eliza and
another GPU. But, for upstream we can rename it. In linux-firmware, I
will keep gen71700_zap.mbn as a symlink to gen70e00_zap.mbn.

-Akhil.

> 
>> +};
>> +
>>  &mdss {
>>  	status = "okay";
>>  };
>>
>> -- 
>> 2.54.0
>>
> 

