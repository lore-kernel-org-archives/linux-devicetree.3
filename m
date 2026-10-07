Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA77472F97
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368332; cv=none; b=epgbyd9haqkHutaEF4RK4AFBPf18SfLFQzLOqAJhCLcer7NmJxuxxXzayIYWQ5b2rzvUSte1e0ss+Lq2LRRH88eErdldqNx1xekXXoxOeku510PAhvO9OAOUCe2MwHBfNxAuzeclBnawAfcu00I2bBX63ufqRoARJs3y+QU/HVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368332; c=relaxed/simple;
	bh=0tAFdlpsP/xrqn/sPZkXuGFYqrfRYlRx8gKvjexmNnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Va24ztyMI3LmL1436SiCR6HKruVEDYJEhmzDkLaWFW2ZsAExiadtl+PdqcvWUk26MmThw1aqmBXhAQxOF8l48jcvAK3YCk94OZXL0ksnn0+m2yb+gg4GESsl2LsPI8XuTsnXrXf4feLtO5E9mQTm94rKGx9B807vvyLwA2mYSiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz/a26ko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XeeKw7O1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz/a26ko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XeeKw7O1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmGS3686144
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 10:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdDgnRU3NVC8pLT6LKmoyDAgBsbTkHtw5cLkuU4+x+s=; b=bz/a26kogg7pvygk
	JMGOJzgFcCT2PlTAwrtLobdJz1k0whyTRQn1Nd4/kumzpbaGbGV5Q4SQGRdZ/jLY
	XHgAofQXYAOfBKaqwHE/y+C5yNpGm/3l8yIby+LWcjkAPqK1mIWb9qbtdeZam1kM
	0gWoL83AAjOFtssperng+tMhF8bemEUXwyF4XwsL/k24lR0IEhFgCRcXYsqH1J3Q
	JoDhlSlaSdpPies/ALeZxdvjTo9rZmFna+tz4HyNYcorXa5v8JGAQ0xiWzNtqC7r
	mcAynbm9fyfTFrt2a6DE2fR2fzdZbbQs/VGG4bcI7RkqQE5G3oBCloWgL4RQ8Z5r
	7Y2vSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609n1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 10:18:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so37805685ad.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791368320; x=1791973120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdDgnRU3NVC8pLT6LKmoyDAgBsbTkHtw5cLkuU4+x+s=;
        b=XeeKw7O1CYay2KxhaumkCpTAz8ZHowqSLu79ZOK1+Q//2LqzL+ZVYWMu2nOL/NHo04
         FFy8HMVSup8lt84V2V9ABhAsc4sO4PowwSAsiOXwcZ0x/DQ8zy0BsQPf1vZUfIeHK42X
         FX1mCwNud/t6JXKq7PfNf7kZweqEpC4pnumWHDm9M/W42+Hg6VzcSiHJOMYji8stOR29
         U9l41gMIHPsQQJ8ui2ygjfIb6Xa1HXUKhnv60HfVv7vUpkMQ/1ktzaXDMwSFjfhWXwRv
         QE/UE2U91YBkM0EIYM6M2xZu8c0Sv+9+0PETJZW0kjs/NcWFn4L0f0LLf4woAySNGk/L
         qaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368320; x=1791973120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdDgnRU3NVC8pLT6LKmoyDAgBsbTkHtw5cLkuU4+x+s=;
        b=hc6JxrkqmZLnFeRVDfk8omh5KZ7pD081bv1Coh3bGF+hKwdzD+czuZmb0KldtkVk4K
         MbedLXEso82umZqjLqVpAbGoXuSIe2YdDE9k00BSHOYdyphCYMj22mkwUSxj8Q92CabG
         x/AiGPEG8jFMKJJleQJcF9GTPP+1xF0JCCaTvT0G8fFtnopW2r2oKChYYpk6rydVwKRL
         SvGUOQwaHoNKv5HTwWIDNMEpAQQIuUuqdPo7t/3tzmqANj7DoCS/vkI44bBkvkTiQEYe
         y+Srvqmy469NcAPio4Br9a0gzH0aplL6DAUHau488J7dTgdrZyLaefVv+NQaSY1q1VoX
         9NLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXKoq9kAGHeTjxw10QAPMPmufe/Xk6I/kE0esK8b1w5eMjBuB/NZcT5alwG3NL+dm92PLWQu1Ae/ya@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4nSEeqH5BZz4X3xdfsLdZV9Gd1QDQtHCcle5IDF/QiHDt7SBn
	08LYlcxZzSDdQWVLPAx4tpbK5uuIBlxIPMOWNvGP6/Rwo/yePyxhcglD3vIXGwMSSxj5OKnxjN8
	Ir5y9M6WVloEHf8yH4x4pROBXTxo9knFn2WZA1glecJSWrwowCWmYAXCOyZzA/fopiRKkRSlY91
	0=
X-Gm-Gg: AYBFou2c+dJuD2ufdEuEsmchi0DJ4s0YNrnwsqYs17QO/sCjv5+rayX6FQBIySv/Lc2
	PB/ENc94tEcy7LK9PIhyXOo9ZbzD/40E6nY4HpF7CykP3n0CyNw/B4mlpqOu8mLoN/gl+CFfkNY
	o6f4zQMa1nagJcZhi2xGiSOrSrQS0tzzKNX8SZsAneG7V9naqeYTNTnN3tSS2ganOm2Cfr+npnI
	rrI5sWy1cPa8UI1Qb0K7ly5c8Rti+H2k87mcPrNzMwVRAHK8eG+42JbjKHbC1x7gOeobW4ZqZOt
	35skJFmWgN0I7dLo5zgRzuCSju6BKEczdGiJselXLgHT65SQbx9rjybNFk2clk1d3TqXgRSSUeA
	JliBdgySiWlG0uCUOl7qI8+iBnzaZ
X-Received: by 2002:a17:902:d990:b0:2e6:25e3:b363 with SMTP id d9443c01a7336-2e625e3bc79mr937145ad.37.1791368319884;
        Wed, 07 Oct 2026 03:18:39 -0700 (PDT)
X-Received: by 2002:a17:902:d990:b0:2e6:25e3:b363 with SMTP id d9443c01a7336-2e625e3bc79mr936765ad.37.1791368319398;
        Wed, 07 Oct 2026 03:18:39 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a558c2sm7495745ad.74.2026.10.07.03.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:18:38 -0700 (PDT)
Message-ID: <a821cc9f-a2ed-4a43-a7d1-1597f50f95f5@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:48:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
 <20261006-glymur-dtfix-v3-2-44e2bc5370c2@oss.qualcomm.com>
 <20261007082748.bcdhzhqsrl25nimu@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261007082748.bcdhzhqsrl25nimu@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U5Homg5rLFLv3MFVRo3hGDLXiav9G-bA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX74+BFmJ+rs9C
 MxypfOnuRfYX8yKEUJJVklfTBK6khFC+CD/yEmuv1LJiBU/Q9dKjqJjIuFremZT3p40zQ+D3fi/
 eAaqIzsEN8kVNBexIF2mq10tFy4OQYc=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac61c81 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SYeg_LyZQ0ZiSJgYx_IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: U5Homg5rLFLv3MFVRo3hGDLXiav9G-bA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX/rZ/fzlL9D3t
 ESqief2n7Kyg1X7S9Yedn01tKWdOkE+T5GUiBRiPRqe3MuXygR9/W9fHUzGGXCrqNxt6uc+4n9i
 IYu+4GsYeocXxtmVpUUiBHBPeSP4atfXWbG7sDGPmmwwdrPQY4L1twmsUQwVZe83NAdslNRRWsd
 /ytwYjJ+qUzoBDPEm/28gcYdawjaM1u9abGD8h8QRyZ5bXhWuLUnQEpqtZYIM4Wytd3QTEXTAGO
 E5e+naT81l3hEvIsNaoYltAZ4WwZESJgdwPp99wHzdW3b4GXf/VrnQhG+i1+7F91kH92QvMS0dF
 fSrEobneDiJdFsOKPCsZeMyusxGRbiyjFzpMzYgJDHD5r9ipfgkHJrbuQGN8aLChHRmdxAQC1uU
 pxk4oR1YZiFopXBXG427z7n1YzsGJQrmKYbkGrbyRRO8U71RFeORq/gE8laXcL8+YUDbdTc70YU
 1Xpd7ldEFusysiRBZ2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070040

On 07-10-2026 13:57, Mukesh Ojha wrote:
> On Tue, Oct 06, 2026 at 03:56:07PM +0530, Ekansh Gupta wrote:
>> The reg value of a compute-cb node must match the SID (the lower
>> nibble of its IOMMU stream ID) it is associated with. In the cdsp
>> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
>> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
>> 14, which don't match their SIDs and leads to SMMU translation errors.
>> Fix the reg values, and rename the nodes accordingly.
>>
>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> If it is possible to cover all the SoCs like Hawi wherever this issue is
> there ?
ack, I'll send out a separate series fixing for all the other platforms.>

