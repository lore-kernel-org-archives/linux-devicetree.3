Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC1938D6B5
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 06:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975297; cv=none; b=i0jF0ImjkMjrUBDkgAscheZ27lkBGTHTNURe60ZUb9JGCr7hD1aOhbG2AtzJstVb3gowUp+QbV2rGBr6NywQHzbZjOnCgzo5TPp2Z1yEvAICPZoqjKy2B9AnBVujMJnpvSURzSVJqdKVxGuTIthriQaEcpf3apXqm3Jy5HrAA3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975297; c=relaxed/simple;
	bh=k3OMu/kG3Qb3bQIzJDCFvOqhRe1SvLCI9dnjLJ43KV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeIAEIE4drQeb6DjPvRUZxr8bYtSiqZPfEEyV8J8fYUlEB8A0EaErPEr86qlCr8Q1zyK2QBzJD3f3VIikngC5jPZdFnONncXFV0227zkAtMl7s6M3lDzBbKWEDSaadl0JACTPsYMqHvacwr7fBtCp/sQjGp/trAhGqemDD24UJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSQTflF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ui2/p9i0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSQTflF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ui2/p9i0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621Kj9i2960710
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 06:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xL54Sy2yQPlXBg5Pq6yC+W2EIfKsiwbAkMZux+PXiAY=; b=KSQTflF1Oo+kkin+
	jQuhJ5/tyxM/cbm2hPNZ/2I3lad6QYDlwsjVvnPQq9No0OE9H8tinINH0vm6lm9t
	Ug8Zxgz1jhfi81zWt2L3ipWwdWEWxTXjuBSZ/RZ3eTpjljkOe1rfVueu4t6v7Pv2
	I15xdMzalBaHfF2CpEJTCuDyayh/hN1uNfbRc+h4/Oj4yzg5U0//NguCs3NjMMPc
	O4iEBs6ub34FdOnsJGJx4UgSah33jdMji9FcYX+R/9wvOZl3VUq/q+RDfxdFpJxn
	WHnhv2a+H6yM0kDCfsYxanjF+hgHRz9nkrYMoAjlcwZIlQik+7m6frRnQKpgndiB
	o09VKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mjv51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 06:54:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca1f16e391so22262895ad.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782975295; x=1783580095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xL54Sy2yQPlXBg5Pq6yC+W2EIfKsiwbAkMZux+PXiAY=;
        b=Ui2/p9i06X8W6itB3ItpARtmla0ZGX5FrUKDZ0AU5d7QBHzAZzqk7H6HumYZ7FBjOI
         Qqv8FQEkW1DBQdd3JKT7gWkfCp76SGD5jRlRATVj48kcv+eDgz0pblRwdyuYKOxssKje
         6PXxqpKoa3LhVmMqtDYX42Nw+iAKr7ixuzpkQ1njflrds6oWpcTOi1Q5l0Wd5zmz8ouO
         r1bBli8TTeAgX3TXXLmIUray20Boge82eh8RzxV31XIqHXeU+0sRB7n07oZ1VU5tw1bs
         zVYsCQg6siDMjzs5Q+eaMYaM83FBA1zj2IxQqdPmpXwLCLWKa/s7Gnv3GuwEeEActQvv
         SXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782975295; x=1783580095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xL54Sy2yQPlXBg5Pq6yC+W2EIfKsiwbAkMZux+PXiAY=;
        b=nIgyTLBUQZAODA+TFZp51XFaYk/qA7V5OB+JDG1eL8qt0ZY7vvH/zhtTOXY0nOaALs
         zurMF0pM0Qb+1rO8573lLHySC4SWjyxk3kLItBXNFPGVrJFcQr3QxU13AgyicfDw0fZj
         lZZdKjiyJFi1PEF09170NyXUfxN/p6F4ZW2Wlqq7ifyA8THNfjU3nVVWuje/5TJJojq9
         BT405wXftwd3pghYthwkA7fBETXDp4M3zqWDdfB+FXf5EuanERz1Kd1Gu3lrgX0/IrGa
         N+4c5FRnXcqZHyATyq0WbHeh4xV+N2oo45CxLOR6CuizNzJfysFWuj2CUke+YlyjgM3Y
         +Drw==
X-Forwarded-Encrypted: i=1; AHgh+Roco54A60YsjmonpYhsRzX4FgbqR53TJvXtpjkjPMbhW+YR58p/aUaHuijCmaVhiG9L27mud15mfGH5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ye3xdoHkCECgNaQ2NGysK9pRvmlMgpXuSVB9CPt9g/tFVlbo
	tK+4Dvh+ykwh4BF6Iq0vA6KUO844s4zvlb6wI00OPkQljpTBpKX+Q68szJF5f+epxXPr4N7GeiX
	PRgGsYUpXluqhei7o+zvfyg2UmyE2rf13KCJ1zISYJ5nvU3Zckt5nOMeOlrowFAEN
X-Gm-Gg: AfdE7cmEoMKjz8fWoLu1ux4Reg6uofk2dcC2njKHxIomDNmOOBEE1XEbW/fzJhEtL3v
	KUZFIsr1zzF91G+Pp0GyVzqyyVOHuz2A7ujwzJ6wDgsEAhNjo6MLlG10zIeeVJVVfKL9MiKsZlI
	U3TW/SAn5PXODvgFGmp4FT5Upj8RY2hilwyxMd3W/XcZ8jF2K1uPD8Vo/0EzEEbL8G5+BMtwIXC
	us6oESxS17mDQkm2zzMDO0et9ZtIiZ39VtiOY+OAIxEVQrgX8Z3FuZAxML6cli7Y7MiL1Bts2l9
	+0a8VMsCrQiX2PUriBDx7UezGIyTbtrBwf7AuMdsuUQbRSVmji41Ep7cZQkMhJBSIkKl+74ad/m
	k5a9mXeSBZjT5xJtbfQv9tYE9EkemHzXmdVtFhQUr
X-Received: by 2002:a17:902:cccf:b0:2ca:329:3da0 with SMTP id d9443c01a7336-2ca7e682ae3mr51357005ad.3.1782975295396;
        Wed, 01 Jul 2026 23:54:55 -0700 (PDT)
X-Received: by 2002:a17:902:cccf:b0:2ca:329:3da0 with SMTP id d9443c01a7336-2ca7e682ae3mr51356665ad.3.1782975294853;
        Wed, 01 Jul 2026 23:54:54 -0700 (PDT)
Received: from [192.168.1.6] ([182.77.29.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9e94ecsm8786515ad.61.2026.07.01.23.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 23:54:54 -0700 (PDT)
Message-ID: <9e2f649f-63c7-4058-92c8-55960c96ced4@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:24:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
 <20260630165700.1886608-3-monish.chunara@oss.qualcomm.com>
 <f5b75410-cf75-4bfb-872b-81b6180e386e@oss.qualcomm.com>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <f5b75410-cf75-4bfb-872b-81b6180e386e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KcUd3vLr4RVHjxSAmjhGQPZ6-uOffymD
X-Proofpoint-ORIG-GUID: KcUd3vLr4RVHjxSAmjhGQPZ6-uOffymD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2OSBTYWx0ZWRfX0yIWcgEXLNWC
 gSVczEaHePzLlrwT+TXfYLFN7johE2IVUq/TA/REEn24Le3MdqlUp+D3bfbGSLW1ZokJAUuEwqL
 keyHzqPDr18rYDic5RSEAEuoRkEYNt8gwb/KPEl46kXhERPXKNbYGeHPYz6tkcgpik7yANumdRE
 Z7FkVE0GxFRy/BFlu/IkqGrsiI+Sg5x8FSCtgU7EmSAII+zzJfQ0MPNu9nv/TiUDoZvkUxWC5VM
 5aBeswSKl+0uvndiR970Oc4fef+kHOq+h9RtTQKQg1eOVZkzJ9a9qLuawL9Y52YAC5NW55iwRXv
 LOFXIsCmgJr5rOiKO3r/xBrzyLZ65WMM6W+59oNpwBR9K/+Wi2tQ1e38AVwpfCt/A9dkKAiKVA2
 +GGmKaOtmu7PpFGJ2rMtCrzWNr354hvETtULgZZpfsroiB8yK+gkQrh3RJ674PyRisnOVm2X+Gh
 7TMlhpV9MLHz0pw9HjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2OSBTYWx0ZWRfXykQW4PVdcPu2
 x4IRY+FnY+EDf1pQuKDWHHguYFE+IHs3vDLF/sdP9Fa2arbrry5Cv/p42GQbfwA3/xHwIis1Hgl
 ssd8MYJTwU7lVeikABNvffyQLtjA8RQ=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a460b40 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=1qKOYMtCOh3zOq8T1Y2cZw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uQbOR76-EmcejrgPhaIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020069



On 7/1/2026 5:08 PM, Konrad Dybcio wrote:
> On 6/30/26 6:57 PM, Monish Chunara wrote:
>> Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
>> vmmc/vqmmc regulators and gpio-based card detection for each board
>> variant.
>>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++++++++++++++++
> 
> Move the commonalities to evk.dtsi and only override regulator
> in the board files, please
> 
> Konrad

ACK, will re-arrange.

Thanks,
Monish
