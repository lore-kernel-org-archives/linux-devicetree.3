Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120927478
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787110054; cv=none; b=r+Oqcgai4Aslh+/ZH7kKbnaW43NaldvBWEIzkWITzXVuUsrTrQWaVPDph7/jgDIM4BMe0nMM9KhVvMuZ+0db9Fmq0LoqpM4+0tHVO7P87fB1y72iUD0e6sbXzs8GMnMxaGrSMW3VrCdxED1aLYlpWA2WsXtiNZKRHEQ7SzTJNRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787110054; c=relaxed/simple;
	bh=f54dCrKBMBUTcwTzrWW/ZicJAj+V6SrXt0TqVGYGChY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+QK2Cs2bx8SHw62bKyfAaEmame5+v7QDBQ8l8NoJRBMBlNjsb/bbLhnl8GBu/UqLJkOrURutD50aEGSYZUJUNzvKfdQ2Jen8I9/u+TV+4Cl1N7nA3jfrUI2w9iZ5W/OGND0lfCz9BWMvg6TRt6MaeLaYRaxr7gYHqGffu4jsU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2ifR37d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGnW2Ph0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2ifR37d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGnW2Ph0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J2lcEs1954729
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9MFSVxotXlCBa73yynGBBxMfalpY0DT0tWa7BXWNpg=; b=B2ifR37dfY5kBpzw
	WsZwYjey3p33qcNKTDzEP4pb+Diu+wJMM2ndmX85T9mU+vlzbm/KlVat/fqqf7mL
	327IeHZp3PMbJuDTjZ1pSVA/2ILXdK6hW5pscYGW2AviKN1AoDS7+1ajRl4XCyTU
	aGUzlP75GK1TfZuo79x4IzQgxgWnbUBA5dFJqGjcCLe1mXCb3IMpZbtckYyrTPgo
	g4H6yg+ERZXQG85IiYorXw857LtUa5C5kBT+FExQfmMGCo2+8F3EA0l/gEFtqrfM
	JXw/xjNPyjMwLGLFZXvplpAyfFzP8KZE6atIiRjSai+PAH726r3KIk2BWZqHNlRE
	xGA0BA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk93jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:27:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso7689245ad.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 20:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787110051; x=1787714851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9MFSVxotXlCBa73yynGBBxMfalpY0DT0tWa7BXWNpg=;
        b=hGnW2Ph0T2sgpSwL5X0OpdlJDVivv6bZJxIcXJIgepO0xVI/KZ6ZDXbODGBp8rBhFE
         18ylNbixtwqWVLwykRmcRRc0DIdVaEV7En9aSiRuIvk/UA892frPgeaQWhtOLmL2fN5z
         YoZx4u8IpCXCfxbvI3wTwHS02MEUgGiPOjrcGRi930viByiPQSrNwWcb6/MZRPERFE1p
         6MzaDXDzEcBj/bAhz71u5LVREXEXolEDsDGOzaB+g3KhIcgb2EkyWCdpFs6nqvVpQF08
         XvtVC9XXkWck3SeU3LgGyM0/auqfzMSHhsjQszgzBujcl5TZrItf6vFEFxNtMYZeZLSc
         dP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787110051; x=1787714851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9MFSVxotXlCBa73yynGBBxMfalpY0DT0tWa7BXWNpg=;
        b=IBD0uZ/Iqoava+xtsUXRJnmIMLmxnqdEIb/IGtDszCB4PYXq6sIDMV/DoPlY4TgPPM
         s2JWto1D3Ggf7hrN4qt038mDWb6gQQqucaSKIaEDuT8/e7dFf9AlsFufbtD6iIRTB2C/
         6LwDk60RpDf+1vKW+dPyiEUGd1Jzaj0BxG8ZrAFGbwPPvwiNVcqmaXzWk3Zw7DZLwTeI
         3OC15vZ7ERGbmGK2AcgDtK/d8l2Ps4MEy5qS4MHI7EFHwvNUNposcyhOL//d+1DXJMV2
         B8PsX63fD0Fgro5nUo8bYkgLoR7NAtaR0ghik183VKrqwop5gicDsf5yusg01BvL2y0t
         TXyg==
X-Forwarded-Encrypted: i=1; AHgh+Rq86YU//Rf1+0mz2ka1Xv7R5m9m3I0A3TBR/gyfGaZvHA1S285mmdK1qR/NVnUd1SPBRTKecv8sH83i@vger.kernel.org
X-Gm-Message-State: AOJu0Ywom3U5ApxrMw5Kw63d1BOxaMjcU+vus8b0rTGR+W4arVIe5Pef
	gCpmB4ozhHMuAFT4FgYnPcUblLjywtStDkF42ri3ylvFlyW7OufR/fcpvG9jGOKrVjgSQMSCuZL
	v8N1O2Ct8wGT1yksXeHkDM53Qjdyg1Gb0aZuTysPt6AcSfRwJ8COPfKU36ZkrDPTa
X-Gm-Gg: AR+sD10h5Cdi0gpy39ugX8QQhCXhjZnAdQAGQU3v2YEYFH4vssVSE80DysTBw5IDIU3
	+HGqhF9A+ZKtotPPG46d3wHs0OiTV9ammVfbSPX3pJmS2e6Us4xcq40h53XE8BKJZzy54nD6BSv
	WvISUxdbYrctYRo/vcDrOIyvLP71lxewqDPy5TtL6PxBZsvHfzRD9KLuV/jW2HrdclMD1Ko7vCs
	ByM7kEaciR3zjCrQzNRRUDQRTfWkkU380JbFaSD6FCe8xIuqh20ECgg8NG3/t7Jvp/afAnEVE0u
	Wu+cSatcxe94SDu0GNWHEwH4ACk12DHw9zHmOLr+fiu7mc9maoSDyWWebi3MlOpbEmaO908ZELm
	91tnMJ5Oc/dYKV1E8H/ph/fPL9pU=
X-Received: by 2002:a17:903:b83:b0:2ca:e5c:7fcf with SMTP id d9443c01a7336-2d5fd5eaca9mr31892915ad.3.1787110051017;
        Tue, 18 Aug 2026 20:27:31 -0700 (PDT)
X-Received: by 2002:a17:903:b83:b0:2ca:e5c:7fcf with SMTP id d9443c01a7336-2d5fd5eaca9mr31892105ad.3.1787110050597;
        Tue, 18 Aug 2026 20:27:30 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb49755esm23186825ad.17.2026.08.18.20.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 20:27:30 -0700 (PDT)
Message-ID: <e8704537-90dc-4774-9fa0-56f2e8b63f0b@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:27:21 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
 <db2a18aa-f5fb-4ee8-8747-05fcf740749f@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <db2a18aa-f5fb-4ee8-8747-05fcf740749f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a8522a4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=hXMCaxYEdCLwTpMgVTgA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAyMiBTYWx0ZWRfXwAHMMOjhJyxN
 gF7TLztrKR3xkHGSyabzjoxDkGun9QkvRzu1VBi8hOLo6FrZcu7I9OJ6JHEf1CPweXQiLmQ0dA2
 5yA8L+MhKpWfkOgVXiEjiLYauD8TbvAzdkyA/9xzjJG3dMdGk4TcYJpXpw8GW87ri4Gnvm/WkHi
 IramCD35WgXveLOQLf7FN0n4UIfLSGNxGFviUXewK6019Cc5+tzsAcJxcFYrPsMkETXS8odmMgL
 Td8irj73hbYKkkVLnAzd99sn90BlNf/iB2p1fSOGZJGjN1sd2Ux3L4qDtdn3XfZrXWcwP92mHxi
 d2f6ZFUoPyWAOXQ73eKQBJQh4Ue69eyCbjPf6UJtanJ98sr06qqDggByCfxxTpOCmV92aZYfSEc
 PAivQb7jHG5nwOEIWM/rU0VBTCUz0hHdwKDBYEaYx1et+VvrNxxqMfT8nyEVOqeNdXEXPV9q013
 zmUBaUMNLXwoVwkG9ZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAyMiBTYWx0ZWRfX/bLikApNu1vh
 Y3wTDQGp8E/iARfzyhXP4dao0A6K3SOo/gidG0VUiVcQtFjT05icEs0klLKWPxBWdTMRqemWMa3
 hRneGgOhccPn9csivSrNnBQror8exmg=
X-Proofpoint-GUID: hxMRXCGNCbFE8c3wbqHjyjuVvLPGlco2
X-Proofpoint-ORIG-GUID: hxMRXCGNCbFE8c3wbqHjyjuVvLPGlco2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190022



On 8/17/2026 10:14 PM, Konrad Dybcio wrote:
> On 8/17/26 4:13 PM, Konrad Dybcio wrote:
>> On 8/13/26 9:44 AM, Yongxing Mou wrote:
>>>
>>>
>>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>>> powers a subset of SSPP blocks.
>>>>
>>>> Can they operate independently? Does INT2_GDSC need to be
>>>> powered on after CORE_GDSC?
>>>>
>>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
>>
>> Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
>> be enabled itself if CORE_GDSC is off?
> 
> (I didn't quite know how to parse the list of states you provided in your
> reply so I asked again)
> 
> Konrad
Sorry, here INT2_GDSC can be on only when CORE_GDSC is on. And power 
sequence is:
Power down sequence: MDSS_INT2 > MDSS_INT >
Power up sequence: MDSS_INT > MDSS_INT2
