Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F6A3B27EC
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785389704; cv=none; b=jmn3D12f4/tS2M3GJYQjGLiJAWA4vZHcWTc4Q2luG+4y2tWtxpfMNZJ9kfhg6UvjEbTTt6pcs4A9z57hya3iGs0bOXRJG38VKN01BqpidtfsJDAXYiHf3WGftDDX6zpm5HXZUvPuYZhhKC28hICY/j4chkcsr3r/3b7YlONOj9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785389704; c=relaxed/simple;
	bh=Ms4Nfskcnhq/wm03qAo2m5NydjTBb5cn4qE/+3+mS3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXZHNwmuiwCD5sIC0YI2akzMK2AFJtaSh+I8fcrskdSM4cJcejTSuGWCg44raEOHxvWXeULdpg42HXLdjl6JUn0Xx7wA2VVwwUcdkhgKGqsPGzI0ZGPqxMVDebBmfB3X3V85qICpmsjIF2VFpLJdoODsMFf7HJ6ht/NWuFmzJGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzizE/rh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkyB35T6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzizE/rh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkyB35T6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U5Lg4s3923821
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=; b=hzizE/rh/XEp9dlS
	Azy0hiB6Zwl0iRJeAjCz8wPoNhni9YxFyn1n1baTZ9dydxl9easl9g3uEw4asx0/
	nYbG1ryH0NL4egFs64R7Y97IfFs4HkJTJsgAwi0Ol4zZGG8jhvSdIaauRM14ztbR
	knqqmX9I7pjFvZ6LWIl7B4bNzVwDmXXqs2F5Sq4MtV49/oFj5+qmCAr/EoU2jSRU
	WVVozHDopj4fes116hliJIXxsUUtIG43ISqsAq6kTGv7yr2fvOL/Xia0xDxihHYI
	SGBBw7biqX3FU5G6Xu6hx/O5z5PtYiWDjHs18yCoV2TxEAI/lgp/aV0CIY4t/vo/
	N8LdeQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr0d1r1h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:35:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485d853b08so3605978b3a.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 22:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785389700; x=1785994500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=;
        b=DkyB35T6K70ChGbLkZuI9kLCgnbn8i44VaLhL4lGPvqxaQNTdDow02H5U38PdaaA2+
         zFntSszbEhuTQZ3B8WFIV6ECF1h6UBHEisUxrUUa70Rth5djOKmQ+aKQLWngBCl4WqnC
         74AfptiZZmmK3KKiV7RQHi+obwSAurXqkCFfNtXkePdKKsbHXn2zpdG+NuXuMI1YS1eD
         mjRNh/hgak14poKiID1X3toSNyJAOYXdULZX4TTCNFBujQT4iJsa8H/nL9fo5k1o64PW
         sIMqVRV0TVfhI8pbQq2tX+fGux1RtX6yT95S2v4cAmPyH7BGJwwz8DsOtqsOtq+DW1GG
         neow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785389700; x=1785994500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=;
        b=nZR7f6FWM9wjU/3B6ST5BDn788e2mUclOlqQr8TgpU5T4sXrREnuVlkDec9Gke/d9C
         4ite57NtqkBHWE+IVCF4eRxTrO3v5tauK3PxnGKDcZG1kyNRO3Up1HOVcn3Pt6lpiP9h
         1TwyH9AL7Ua/6b2NLoJyOGJ8B+/r8Uh1l8khj/rpGDg9iSR/No9GPgvNGHNvajKulzkW
         OZFpSefVBLGR1jik8suqYEzUs8z4Flya6swuJlk7fbMiZakX+CHEQyTEedI1DFLhZ9Sq
         D1FK0RBtIllqMb/tF1fugrH46tRX5VWPGaNjHw+QccRFdErM0BXadc/WyVStSEW3tqp3
         mqxg==
X-Forwarded-Encrypted: i=1; AHgh+RqFZTOUAtu9ESkcsDhU8jZR1ByWGDM9fJ5gSrAOFvUvYOdtA3IoDkF0VHmHmEg9ox9n7tLWBib5Dd/6@vger.kernel.org
X-Gm-Message-State: AOJu0YxwCjtaU2U7kxE90p+M+mIsMJps8ZNZah0bUkbUZ7UQILoS3Ugh
	POhDK8Rf0liX9EdEUXgGbo1bLruoaBr7Jr1CCQfOly47XIjs2OHmmdZI87iUddl2jdSqFZNnzHF
	TX2O37J31l5rmBVL3NK7sEL6cEyOgKBP9th45ZPlrMCrIJIXUhr6iWq6iBlp9bMm0
X-Gm-Gg: AR+sD10IYBPK5JCz7ixHYpFbTRpeaeEQvgMRVyX60l5ATVyZsUzlWXXGZU8chrCeeKL
	YGyTbxuWfj1mkPQJeDpYLP36q4QEPClVzSBXkYsl5XEDfONb81bBwRo/s7NZkDsbMKcwZwoXbHL
	q+b2P3hWZqniJyrf21qjTo8VAhHRCWNuIhEpOznhpFLlA9nRMEMnd6/LfwzLRAoB+5tnk0Yc9vC
	xj6QB1RsB+yGh0VYibh0DSRDEU1jpSvAUWWSYU/3fLejeLrJqu6Tz2SELhmRdBfAgoMjUZnia3p
	gqNYwoMR2jbbTMFqiuS+JEZOvt7sNIZxFNPBKf0QerfiGxxs2dAP1/hRDwzjVyVSiFTFn9ahMBY
	D8gqwHa6Xt7LW1Ax3VmKuPgN/BLmOag==
X-Received: by 2002:a05:6a00:4c84:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84ebc3cf6d6mr1338807b3a.35.1785389699852;
        Wed, 29 Jul 2026 22:34:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c84:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84ebc3cf6d6mr1338773b3a.35.1785389699398;
        Wed, 29 Jul 2026 22:34:59 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm2342241b3a.31.2026.07.29.22.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 22:34:58 -0700 (PDT)
Message-ID: <02b51d6d-0b65-4723-b1b5-307726c76fa7@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:04:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
 <qTmyhh5ukxu4BQAZXvNyyUvZxucwjv6bNoe2v30cfjsdhuzg3ud5DZzGmSBlYICc_POjXS2sSvhbRop0i67mxg==@protonmail.internalid>
 <8210513c-288b-4d02-9688-1de10e40d9f9@oss.qualcomm.com>
 <25ef6b91-62b4-4e8e-bc8f-8400dc293273@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <25ef6b91-62b4-4e8e-bc8f-8400dc293273@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAzNiBTYWx0ZWRfX8xX6wztWvnNo
 L0a1c0I9J/N8LGY2Ia+YGk20nT+ts0pkBf8s7Qig7fLTIeAN4Gpu3JRexrN9bH5ZwbgWA1wOhY8
 r7a9U9G6IfGj3bYuc9M3HJ3O7AXuKwsRkc0ES1iC4TxlRgOJQtqqMq/dKk4DOQnEZbXiaSBEZEM
 WEYFwV75rvp2IvwX9GteNz7UjLoPU+ig2FTke9cRmXWkTsTRo+tdAEmWyJuxyvBu4Lvpb02rfBc
 VSfwO6v4O2XepXFP/RbH1l66EyvwN7w5NIuOULLSKfNCxhfcXXEiD7OlA2xZ3UU2qUw+Oex0IzO
 y612c0O0JKe4Y0h5h/6oWSSCoFtwvVFosVlca1LXKHNFwABx+qKCHoBRPWuLBw8D3If4eheBXiV
 /LZmT16nMT43cq4HYnb6pbvVAo4QIeLwUSjIFVDD4BkEcd2b77+QHOG9O+6ip6lDpXyxDoAPciO
 mdie97LfwC3UsIIXTwA==
X-Proofpoint-ORIG-GUID: 3iFzmh2vdCh04b2wlHcXM2h07fP6ADcw
X-Authority-Analysis: v=2.4 cv=FLYrAeos c=1 sm=1 tr=0 ts=6a6ae284 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=U0KInS6uA2ESEJLtUTIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAzNiBTYWx0ZWRfX3Jov/i5yYS5l
 JbdS56LRhwTJ9+Zj7y45pCyQ0EOhrR2m61URrZHpFbDtn9JisKkiHpkOJuHk7sfgAW0pLk1+71E
 3tNO9xJQnLuqZGMVon87a+joeu1FkrU=
X-Proofpoint-GUID: 3iFzmh2vdCh04b2wlHcXM2h07fP6ADcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300036



On 30-07-2026 02:01, Bryan O'Donoghue wrote:
> So I don't think this model is in-keep with established DT practices - if a driver needs to parse a property it needs to have that property in the device node it handles.
> 
> So with data-lanes per existing camss bindings in the IFE/CSID node everything though should work as-is for you.
> 
> https://gitlab.com/Linaro/arm64-laptops/linux/-/tree/arm64-laptops-v7.2-rc2-camss-v11?ref_type=heads
> 
> https://gitlab.com/Linaro/arm64-laptops/linux/-/blob/arm64-laptops-v7.2-rc2-camss-v11/arch/arm64/boot/dts/qcom/x1-crd.dtsi?ref_type=heads#L947
> 
> &camss {
>     status = "okay";
Thanks for the quick response, Bryan.

Confirmed working.
Root cause: I had data-lanes only in csiphy4_in_ep, not in camss_csiphy4_inep.
CAMSS parses its own endpoint — with no data-lanes, lanes_used=0, vep.bus_type
stayed UNKNOWN, bus_type check hard-failed with -EINVAL. That's what led to my patch.

Dropping it; fwnode_device_is_available() fix going via your patch as Co-developed-by.

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur-CRD and Monaco EVK

---
Regards,
Nihal Kumar Gupta
