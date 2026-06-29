Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119574218A6
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743987; cv=none; b=edWn/nA+a2z6xYZ4VgFX26J6f/n3HHISeoVAJpugYVVL0IbRkfgXbT3X7OePwpX0BAz82TVcauEQmRIw/wu64WgTxHdnOpl3iAN5dCZ7bPTgu4dVtZcErvxHGfBMnU6V74YS7tAUzGa4XPejhyKhcFeClq7lTWg1AcEAOatV0TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743987; c=relaxed/simple;
	bh=liqOCMe7OXo3zkQgVlcw1Eu9AkfS2Wd8nUtDi/XIQpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoi28D/KpVLSF7Bn0La0kiz3K9Pe8GUk9uYq87tnY/LWAAJJvqza5EKTI4wmYg7XofioeVOXjqE8cdagIs6zruuIIq1pvFMnarbn0oXkdDYwf7YJ028k5lnNQ47KKHkUPyOLFSboaV7x5Kq9GGievHaT3mL5H1E6NUZaSVOS81A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTnjNB9X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnvG0nc+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTnjNB9X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnvG0nc+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATE2H2579129
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bbBHtidWhRPmnInLMwZken1KORMptwNsSz5+Ls2hA0=; b=PTnjNB9XAbMirFlE
	ndJIFRNsKyu6sxsLjqv+9bRKNiPVTf/hBFDVxe2UEejUOn2LQrHHBd9wZhajwVbv
	wTotbYxEKMU1fO9xaDJDDciJCM3WyiKRx4pxw2d4AUQ7R6Rq5k/HiWOIYo+zAmAA
	KmrhOQdGd26U/m7rE5BqRONr8l08AjDp8asqoLZ5Eeps2DCmDCqb4mi/LR/3cC1A
	dSHsDdFFi3ElSt7QrnXeaAyQeDgImOejXoO4dfBTe47Csvh0nymhNZqeaJ10IlZz
	D+HczX6IfotlQ8S+2VU0DCy1mJImtyqz/Rz5wVKzwZJb1wZHpbGB0bi4FS2rFYJ+
	1Vx/Hw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hurx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:39:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92c326f6e7aso82436885a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743981; x=1783348781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bbBHtidWhRPmnInLMwZken1KORMptwNsSz5+Ls2hA0=;
        b=NnvG0nc+W3NQhTENNoZ64kIF4WCjBPYaFFbgGSUWRiRjlWKq+LXgfkLjUf45scGSRV
         kOkbeUSxIIGSNSZLHmXeZurQq+aCiQHyarUzCYhXyXeEiz6KrzWwWdxF8r3JPH9rBiUH
         NnZ7UPHE1EsGF1PSkikZ7bjAkDXKGu+eUj7dYC8KzdofcJEkauVR/FnszqMHfczJ4ZSa
         WAqexQAtkdqsL2ZjuRVgPVHv7gQ9sKTF0E/gLBO+C3/fbtl4T724u76Ng1LDtzQimFTU
         nIubUD6ac8XUhfCRrjEc3p5tnN/CdEDw4BG1zdyjHq98bybHNBQLyvAX5aNYTJsaJAiP
         /QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743981; x=1783348781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bbBHtidWhRPmnInLMwZken1KORMptwNsSz5+Ls2hA0=;
        b=W+SmmiJBsvlhAGApOcpoZVcqN2qv+Bn3Pc5JkXaljLnfkQu3tATkEApkQPrb8WTBYE
         tsvNZ9L7NMMOEEc/w4IOzYtzyQbmE0hmf0geUt2trsj4xwNHsX9II9KC8PnloIiSKNPp
         oDOi89SKlwTqfNKMrEUrLnMjxhf45C8iGJ07cJ0J7hmMDDVZXBHA4bsiT0S1raHrPUs6
         iCarSJI5LMAxq/nJQpYIcNgSV9u9eEoXnCVWbWLxAf5/nwpabiaPaf3+UeSzE29qypuw
         X/uKCWCfDBPi1QiRKOESsgNrcv+Zt0d+itdHGOdGLNU4jD09EMwbkJ/mWNOPsAiEu0KR
         AjbA==
X-Forwarded-Encrypted: i=1; AFNElJ9gkdqvoyop5IY4lCMDVn8BJ+tzWIk04I4dtvvqlU1EsktAonI3iGgEDHzcVnEeJdcwJBQI5d/3tK3J@vger.kernel.org
X-Gm-Message-State: AOJu0YyOX2b75LvMkEaODawfVOXhcZ2iAJ9j9JVsOk4IV2g1XGEoPQaC
	1uD5lVGhacdHslXFgAaI1S/fRZ+v2bNz6wGOyqlMLXMb7XT9aczv1zfk8PqUw+I5XISkj/9I7Xm
	eo6WzJvqW60dkQmfnS261+7hdWpj8PvxqLYtlJpz1NGI5QVTLywpM4xhvCPMvNoN2
X-Gm-Gg: AfdE7cmjeiNK839V1Rxqe34zowsUNJ9RrAYq5h0c5sdPjgrEGJGK8wSXOEBygBXp4l2
	e+VMLeV4vnSKx1nPv3N3JSyvZpsdWCWoVRjmhXyOubf+UQ5rzIs3snQB+wSv57gQ1VItyLbzQwN
	iec7KlY0A1kutNdeIpMwF/POAw77Q89STJlZNjKo/GrbHVz7Xs9gXYEEGyiKicojdBTdjUJEEQI
	YGdh3rTzPwOsDN0kvYKWrnlkwcFL5M8vGSBFM1wwZPif1hXyJcI9fUOEopQNePbO0sgKPq0Wyh2
	cUtjxQ3e9k7gJndsgrlilZPQj/xemTHoPJceZLBF2KtDtCESbHqnYuXcPmGmVGhQzhu9CnIkekp
	tJUEp2MOxmnpXK5+U/L2ZJVkDYr8jf7iR8VE=
X-Received: by 2002:ac8:7e84:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-51a72a8dc41mr164992961cf.6.1782743980700;
        Mon, 29 Jun 2026 07:39:40 -0700 (PDT)
X-Received: by 2002:ac8:7e84:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-51a72a8dc41mr164992561cf.6.1782743979990;
        Mon, 29 Jun 2026 07:39:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12376df39asm449075466b.16.2026.06.29.07.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:39:39 -0700 (PDT)
Message-ID: <021fa1fb-7033-41d9-927a-5322be71768a@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:39:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX9zcaVH9wAKDV
 FKhlRntuTsnbDXQTlgabalaN6vrunCdiSremWlhUWZEbR0qtsj6yi3PFdyEt3V4YLZGtkGvHq92
 r+kbjWsgfMvJ5px0RjIO3JMgoodkAug=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX48jHVAS1zpGj
 Y/Ip+JiC7tT1A6741HFFv61hG6gQ7ANituB6K4DRx5l9pe/zIxVLm/nkQui8kytMpOA5iee2jCF
 /W4aDKJvPFuckz1T0n8owg2gWSXz9pxMfrAP1XufU0wWLSVTev7u4kjUXIBNttGaCFq38VTAlLf
 zuYlgZV79L5cmYHjM2UlEEKawwBBKDwJrkdqRyZIzAniueIjePUd5TnF3ymLZlu4Lu1EMZW6zM7
 vB4tJYXFzUGPPA2udZUVeZ5zv2nos3pNsohk6dY4e/aIaY5FQPR0O2kcMMhIDICINR/lBlZts9J
 PlxLgOM66PJloQVTZXMh765QkahdlQOXcBnjHzi+SoD41zM7gKbRRN/RU9weeru39SVeMKuTLl8
 2ZheWuDC3VEUElBuWvhTP3r/wr5+5TaP8MMjQooemMl+YtjGBOhITcN+WfJ7WLcq217ou0cpBsU
 Eoa5IpSRleMRlJh4hrg==
X-Proofpoint-ORIG-GUID: L-P7zFTPjMff56AzFhr7BTdUaC3E6kOt
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4283ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2wNq6JH_cIzNK18R0_EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: L-P7zFTPjMff56AzFhr7BTdUaC3E6kOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122

On 6/8/26 3:10 PM, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
> IQS EVK board.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

[...]

> +&remoteproc_mpss {
> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";

I think cqm-evk etc. could make more sense but I guess this
is already shipped, so might as well

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
