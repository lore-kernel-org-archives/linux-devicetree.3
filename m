Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F87B3D3317
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891362; cv=none; b=Q7uYzNexB5ed3CQsoCb//V5u9AxvuTAouD12hffmMNMcxAiaJr+wTNvz5RZB57wavyNOwSUaSxuWlLHzOLm0Rs2++z4SOHMRsRSSCXtUBrIkuqKuwWa2ec1ELsBSlgW1AFr0PLpgT0BGREeXyzqRRj+IpfUPvnveOe61hDzWZI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891362; c=relaxed/simple;
	bh=aVuVsXFjs7/0gp6/eDzJFJsFZKrvp65ashGjNex6uHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnUFXrvqKNG+gbyYDaeI16PpfdI7HCBfRC261Oko9fEn77DfnLdrcmelduoQ9BHgdZ5PrcDQp6kr4PpyYTQfseQJ2SHScM+155SVPyBmP0lgG3kFqvY7VNKKzfF/AhQA8ygutZ936T6hCXzAG0lu/V/QiFDD8qJDxwN6XG6Gw/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqPly97u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1bYWc99; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqPly97u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1bYWc99"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADeKN2629853
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3WranAQfzhXTtB1r8MBJk7fw0SYatMMlDEmM1ttxlk=; b=AqPly97uwQ+iJdSE
	CwqHiWWuAa++XKTPmlw30ESbj9wW70BAR25d1wUcpXzuf2eFHbsMNJE7c9ZBE4CW
	cE0NRqsJRHbrhF2/Mgk6kRvn8E6602CHzwy7dfrHqOgddt4ujxXYbLojpIeUrzi4
	JHhsg5njhvc5cwv21im5KhKec/Pkb/pr7BBib6R6z3Z+xf/CrdbRfhORclBEsZvo
	k4iKwhAJVjlYu4eeS6I77O+X7KmctzIRWr4OIpeG8MByyeqEf/983OJWx/WtfVxK
	nlWp8hREkBvpof6UbeXXc+NVBVUi4eEf1E2EMXVcWO4E0/4jGQDmHQKMaQb02qOH
	/micTQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em99du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:02:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso411807a91.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890940; x=1785495740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3WranAQfzhXTtB1r8MBJk7fw0SYatMMlDEmM1ttxlk=;
        b=b1bYWc99LH4zHQOg0mDDF8hDRgN3jzOtVeSOJronwfEzr3TfNKJL3GzU0jIeApmWj9
         lfej/P4ZRpKg+Ns+xHz3UdDutH/17iV3pTXrVmuFEJ3/t9tmifLc8f+qr7jzinKig64v
         3Itb30adqV/efiGY4yof5exT5yCmYvBNj5q+2g3pRdbBpHEKgyviwGZgK09seu8/FB2q
         2Aull+h96jKT/C19Bv/YwG93+3uws3yytQUil120a3GWKUpmVuD647k+U3O9wRSmsLQe
         kbG5cnquAV2lqX4YVhuRNijykwd0z/bbqUHsLUW/IPHiDVVQ0oz8bjIZketo01l2ZBlq
         xUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890940; x=1785495740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3WranAQfzhXTtB1r8MBJk7fw0SYatMMlDEmM1ttxlk=;
        b=V6YASqgE6aNFE3DGFUhaY7/sRb0EWVpJ5QCvHj/dVhOyeXfXDcjbRBUvDnnPsCjYaR
         xqLpzm6wSJhBSiwKiPCLvaSMuhvlX3EhpDK61YrAug2h5WtNFxOosyg33R+dkDQ4dd8W
         fvr71Dumgvhx6AsMs1BomJawzQZaw2CtH+JHk73JnbIOrpu1iUVYgu2MPzu/Tncmh1K6
         Rb6vT+qERMO3DSpIdsYosNNeFvju3243BS+63l/wJn+SvfdViLqlxj9YGWsg8NqES0ZX
         9R2bsvsW67TDGREFT+KAir/s2VbO0mDTyocgGMA+0IHqTNyxKX6KdBCgnINjh1Tdbps9
         1yCg==
X-Forwarded-Encrypted: i=1; AHgh+RpSUcCqTrkAzKtJwemxdN0TvQTtVkH6ppYVa3smDViCFM1IM4qOeFT4WzLuRylippw1nzr/JLrNqqNv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu6JERXD6nabnAobjc2sSt4WNZt5S3Sgeg4Jgm1vZZ2Wgt+URZ
	OiKjtRdbSVQB6uOu4eP27fudD2+npNUrzVAloiqjrWNuHSWAudC2jlqqPXGGtORqNN9Uvgm0dYG
	B9DltdGgkvJ3aql1CPj7/e3r/rTbXtaRgtrplJgg+G8dfXmZG60iBEAJqeQWjsRIq
X-Gm-Gg: AR+sD119/7YjtuW3F131Wa4pLvGsFe/v/MuDAtCHDJGaAPKQoZKxIiGDJRnPCxR/Hyg
	aNYkDd6HZ+ZOcp8ZfC+MxzabBCE9gRo+thHHnFVBgmub048Q3/irday/8kVMMj6fHS1WAP0maOR
	HRJ3f5Mj9EcqolQWhSmHe8PkHLjl7RhX1XjpOLk8d0falThRvawNthovuFHjWqozbix2SslT3y8
	YpM3E7CAZsDCVk6J4O8dSXO37N4HrmBYEppB3zIW9GC6MRMZSPRXG6CkdbmzLQrOtC09+nMplYL
	lTTfrJXVl9rA3DUJaHJO8UJEPIx+2AbgF5fNG6zHIypf+rL7GPNF+zl9KiszY1z1RmiSQgwaUJb
	6pgcqHNR4ka7qOYBoVr9TlETpvVo=
X-Received: by 2002:a17:90b:3b49:b0:38e:8896:4024 with SMTP id 98e67ed59e1d1-38ec688dad1mr6724425a91.40.1784890940198;
        Fri, 24 Jul 2026 04:02:20 -0700 (PDT)
X-Received: by 2002:a17:90b:3b49:b0:38e:8896:4024 with SMTP id 98e67ed59e1d1-38ec688dad1mr6724391a91.40.1784890939701;
        Fri, 24 Jul 2026 04:02:19 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041bec23sm1264186a91.15.2026.07.24.04.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:02:19 -0700 (PDT)
Message-ID: <fd1f6228-02d4-4dcc-9dfe-f4d304598660@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:32:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>
 <amM_ViJcG0jbDNmB@monoceros>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <amM_ViJcG0jbDNmB@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwMCBTYWx0ZWRfX0zl6y6Rshnfz
 6/zIk7lym9P25xVSI4x/fWrFI65Tuzhp8/DiJF42myZk1h+jlXSGsvCp2sK8UEwikeAN3hf+jm2
 iOjuvHoFqm4j7VpIY0SLnRS4sof/pFE=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a63463c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=XH_em5C6Qgemdf-nh0kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: iyY9zsS5eRm94tfYBasYRUF6F5vjcn3U
X-Proofpoint-GUID: iyY9zsS5eRm94tfYBasYRUF6F5vjcn3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwMCBTYWx0ZWRfX+1jg4JxS+EBT
 rQTR5/7O9vGA87lsRXqO7zpHJSL9P4QK4epNqJ0MlZo4LtCm0BW2Bbz2qqmaURaPqkTZ+riTYmQ
 yWgMWxxnrOZClqwwUUD1G3Lepi+rF6zVdVl/VrebLuxI/fM3CdZG9vnXRUrf2Z+RUp1xW1RtPHK
 YzNAUYqNPU8KrnWxt5HK4aV67AMgHrP2aVvgBbDEpdhA+Mt9AD2Ve4Qy2Qq1qhgl9CiaVdfu4xR
 yr5/KWXIGtFKIs+fhhiEsVHQ583nNV+hDVVHrPucJDJhjYxW3/7bQ3JS7OtK8copLczufuxYuHm
 vPkXZA1i3X80by6NcuPfCH6HZBRFag5bAyf6kqeyiea259VKp03Pp37geleKfxt1LhzzB2Nl8x+
 K4kii2lKcdDt9Y9nWevZZI/DtNVtug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607240100



On 24-07-2026 04:04 pm, Uwe Kleine-König wrote:
> On Thu, Jul 23, 2026 at 09:15:52PM +0530, Imran Shaik wrote:
>> +#include <linux/clk-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> 
> <linux/platform_device.h> already provides of_device_id and
> <linux/mod_devicetable.h> is supposed to go away. So please drop the
> include for the latter.
> 

Sure, will drop <linux/mod_devicetable.h> in next series.

Thanks,
Imran
