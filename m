Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC60342C4FA
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888160; cv=none; b=EMFkkVVjz61Jr8zQi4tJn/yuSIrhxkZMbVCEfnVODfSA0tVF8Xli17Sidnc4mqGxNUq1TByArBaYnW7FyAkU8O6HF40pb2pbfYpkzkBviUtt9ZmfK/aoy5tHLBakiopXztX19InTFFRQWGq67CXEnBR68SlDYMoBqtSRQ6TnLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888160; c=relaxed/simple;
	bh=IU2l499EXoAxlldXkE2GeCQ4P9czIcPp7g5HYeYvGxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dj2Yhi22CJoX1LzAVzOEIgjVKQKcYNiY0UlLT1uRSA/pDutcAno7ila/8gIQ0WM5VAWmLpM6a4JRGsdATlqctuOsVuzeqnlU4X08tp33xKwwzXoXTHfGJxUqNQ/CX1oLkSRhi2BpRgLe3WMXFs73GzBrsoNyPH1Wyl9cSAS7ebg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bots7mYe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gA2VXq3W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bots7mYe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gA2VXq3W"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6YsNK3208375
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4NTUShIkOCxd31gjVb0qpdQwxTtDCadlKBFzz8HyE4=; b=bots7mYeXySrmqK9
	+MtxRaKtc49fFiQ5eGaIDol7mfJVOxkbrzj+KWg9hzLidGDKKaqW1ksxExHl/W3Q
	ozaTk8nAkzf/dzifYNwZetj2FN8IicwYA0Z/LTKPMrFYurSefghBy21s8tPV8R+q
	o5L//j9iaQO2MJx0NI7T04XBfboFmE207PvHpQtmHYKMMGS14GthAX1d8EoWwKC2
	JuyM2KN0Fk5IdfioJryBiYDIYNyraySu3tabzWBGtJdeT8PI+z/66W+C3W8xps34
	7DRDTFyUeew1NTGVOie40RO2QhIOx6LHaNH1duppw8WvM7MNv6ZQVAxTH5x0eFwO
	tNgVpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjh1kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:42:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e58614290so15313285a.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888157; x=1792492957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4NTUShIkOCxd31gjVb0qpdQwxTtDCadlKBFzz8HyE4=;
        b=gA2VXq3WZgF5By6tVRjXHELPLf7Z2LykxQhyoMdutjAuERaIPvuxvgGRzQohMKIR6u
         kN9DoKktKecr0D46cM5qukqdozDvtgGXBq0MomqB2kWEziKpP9nqWQ1jvVwXJh1Xpg+X
         Avxh9wjpflIwtwkpcnAK6P8wuP7yfhxOOnr0Jnn4abHcZuf8OhTfsC1leVMaRbqgQ9uA
         kbm9qGEXuRFqCYk9iph8AmrzGpi28cklULK1wyyWBKryn3/6nVT9gx3p+l3otGhGk5CG
         uZiAo7hVK0Yvc2xHJOWUUq3PtNkELYRMdRe88BBhA94qz3gcwyq8htp6Ju8cPBs8ixGd
         WoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888157; x=1792492957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4NTUShIkOCxd31gjVb0qpdQwxTtDCadlKBFzz8HyE4=;
        b=cGUH+Rksyzed5GGhjI5Na/jWjI/Zo3OTPfoajdFgufE++BVfR59kwL7n+MncFPmEv9
         DbXdr6hHAXrW3mtzyjplzLXBD2FRAiW5f4wNy4nJv0Vnu/siYy9CpguEAivNP/AMV3oS
         0ZOL3v83/6iPlYbH7yFRTgSO9zkNDNxT/GhfnQIiqbGAeuojzkth5hUo6zHdAJxEWhRv
         TH+2XBimYJBi6mmY7BWmX4vLOIKTY2nUwF1uihh5QMCz1q3OkH2614iFJv2HmcZm9xq+
         5evEq4keBwpNWsY13lbOjdEsqa2dJCrxQLR8T8P8dVy+ZzhqiCOHSiTz0dkz+MEApzGQ
         cDVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzjQk4pl73F2J+S/4JuHO69ML0F75fcwxI887vo/oEAzdPhiE2WEkmxfY8WkailucNo+4N6zonR/Dp@vger.kernel.org
X-Gm-Message-State: AFq9FYLtWN4bZZp1wShhWgUpLPUwFBxojoNiNOzNodkmXHb9XB4pTBmZ
	RgDNvCVs8q4EP5x9zhzTwhjVg+3kx9wMtQvl2iOO5vfZy3rt5cOpGg/7zpa3hby9qqhwtHHNywg
	fhqmL5SHDKkF1+zVaOszPGRIWB9vB32uorZfqmldaqjgWHpvVIdTxlS/QclAa4oBI
X-Gm-Gg: AYBFou0dbBJijNUOTgkMWttmRIc5Dy01ExOWuiBAWyxYoXZd3iDTypOTlkbgIW+66N2
	i7U5xcuI7IUQ/UBfb3vsljmVwbLm1JXkWwWZ7FdyUWvWXve0F9rdCoBBBRSUb40qWPo3lrhgElj
	H93EE0AnipBCYQTY8yX2tr2eWsvBPPTusS2W+iWXQB8hdUeBDLrmXUQg0RI7AHfTK09Q1/+SUX3
	/vo3VZ+D65KyJ8jc9QCXSvaXGNRbGhRvakkvBbnlLLmWbZRUWrun1BmHzQmwjUg9+CE9SKYboC1
	KLlVoM4v4uP6Zc5XG8dIlg1b346AHyrnVpDCf8O5U+UhDBapZ9p3yMnDDv7w0T9XWvnC1NJENhm
	rnSxC+IRZZBq1IOm8uM8edg==
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr2255090785a.6.1791888156723;
        Tue, 13 Oct 2026 03:42:36 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr2255079985a.6.1791888154559;
        Tue, 13 Oct 2026 03:42:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c36fe6dbc61sm63300166b.30.2026.10.13.03.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:42:33 -0700 (PDT)
Message-ID: <8a5e7e29-4c15-4547-a6b2-c6ed529b13f6@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:42:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Make the ADSP remote heap
 no-map
To: Benjamin Kelenyi <benjamin@wendy.sh>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001085247.1897991-1-benjamin@wendy.sh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001085247.1897991-1-benjamin@wendy.sh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sQzZ2Z6a9qpXWoBTClkUnXwMajvzzzQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfXwpXAiBU7/2pC
 zagOWcRRE/xe2AVXNbtyaZp2wGRisz80wTNu0J9xhhPAWDqYJXGCaS3K7IRp7Uxq7jXxt3UafNE
 4CrO64k3v41PU2Rfv4NZvezS1avzRIz6d6Yr87nbV4d+WTQ7rxdsegfunrR5dxVt+zfF71Qy7h7
 vsruP3TS493mRDVfIRP3a9koje3fkR2YmjivDUSB6zjbeQPrZuidiInJtnad5CDKD2EzO6sxKKM
 liegG/15i2xY8xyMWiSyHAOg89pg1OjaIatk22QpTOuNfFCPVzE/4MlvdiAgDHAmIDzlfOG5eNd
 zF+Jg/VIO0YfAA1Fx241CDVUTH4NreuAPbfpTPBW4MZ6bSJj/5y6nElhR8xwaYK4H6IXGe9DgIQ
 NkKExdIOibmLy0Zhb0SZhXKSNpilU12qvI6fN81cIngTu5/lDq9at9WnO6GLqz0I62mQ68dC700
 PHeG1iIH5TRNuWD1KXA==
X-Proofpoint-ORIG-GUID: sQzZ2Z6a9qpXWoBTClkUnXwMajvzzzQL
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace0b1e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9KSy6GpRFk5DsmjdiqEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX5vxmTolM5PM2
 T99ENVQ9NS5AQ5Lvu4AdxGRbW+912ExgcFIFyI2VryvOmGXjNTyuaCOgLJDc0+XhRCrMkVGVd6a
 IT5IVk0pCZj8wKR7tcMGjFAB3ctbAv8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On 10/1/26 10:52 AM, Benjamin Kelenyi wrote:
> The ADSP remote heap is declared as a reusable CMA pool. The ADSP has no
> IOMMU, so fastrpc hands the whole region to the DSP with
> qcom_scm_assign_mem() when it probes, while CMA keeps lending the pool's
> pages to movable allocations. Once memory runs low the kernel touches a
> page the DSP now owns, and the board resets without an oops.
> 
> On an Arduino UNO Q (QRB2210, 4 GB), writing and reading back 3.5 GB
> through the page cache resets the board within seconds. With fastrpc
> blacklisted, or with the heap declared no-map, the same test passes
> repeatedly.
> 
> Declare the heap no-map, so the kernel never uses it, as the other
> platforms' remote heaps are.
> 
> Fixes: 3fbf3b85bf86 ("arm64: dts: qcom: agatti: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260908070331.2189A1F00A3A@smtp.kernel.org/
> Signed-off-by: Benjamin Kelenyi <benjamin@wendy.sh>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
