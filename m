Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770F13033FB
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 02:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780628360; cv=none; b=p8HnEcAYLySAPKRTjbW+7i9ahGHMpPBC8/HC+Lh6xv2uJp9vgvyC689IOqZvr0hSaqoe8nIDk39QEpuOLdG0vlmKPDWtnUmiBRF3y4YTCdpnl45K2OC8Clt9eVaJEMUZC1qX2QjJPHiIbhB0q7mQ84uLy1/MzmDqc9mVb6brrC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780628360; c=relaxed/simple;
	bh=VOucmpp7u0ZahopuZiU68ypHeYHXw+R6ma8WFhPcgXY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FQVOfjQc4qvQf5wlo5zcp6ENtaUt0GNEOtoSX9mIKj+pLuqMl0bJ1hZVHE1KxUsHZeY+GJWFMdjIfhrgUkZNTEX+qqy7oObFCIPNI3X1dNqMT3bx6XWY4xFFIPINCZax4vJA1VKbdqkhqSskEBPw3WZtLqjUDWEYErPOrCQmLAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVE2I4cL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRGQR+QG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVE2I4cL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRGQR+QG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65525br6820574
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 02:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SAdx1Eq9kdE+KZ8PMnuzkZszkmDD5iaQbJxqQjTed+Q=; b=kVE2I4cL476C5EbE
	kBXhNsOXQjV40efQ6pAErLTepAj8WF/3btyLp3wTm/aQk7qPsoUh4EzBMT6RKM0U
	YOTp4WdPF3e6GyLyoaXDWVM5TLpECbWVhfTz3krXC6kIMTCeA9mkfSxTSrKhsTXq
	6PxLAxW1iFlJODMDNaNJTOhJeHVmWEvLtxQEu9QETyW5scTkmyZvq3S3VwspbCvR
	7j4kEFAbSZz7SRfEAF7g5hz25C+IvGcpLWPBF9dKbMnhmbRs5BWcSgVNWaH5XXjE
	g+b1FfKF9fLyXhK5QCOVSX3Q8ElNHRZA1GCpaM6AvIbEBpI+rPTInvovytJhXqri
	5E/9ww==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekncbg58a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 02:59:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-307625ee07fso903892eec.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 19:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780628355; x=1781233155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SAdx1Eq9kdE+KZ8PMnuzkZszkmDD5iaQbJxqQjTed+Q=;
        b=QRGQR+QGrFbw3gP0rq1W0b+yDWgnFeVSh9y893OkPK7YzNFrdQLp0zF5Ignl1jejBg
         jSI0cZ1oYJQunNGSPVXHcrLK37hC38EQBnacS1nMI9OqHriDRXQeUd4Vke5siPXILq93
         yz5LtQQIgnkHNI3iLTwpRUcn/6We0bh0vR0mTVkE5lPO8E+sD884O3iFF7FEEcXeoqqI
         cMsg4Q8y9p32ng2fOcoy+4kYkuA4GJd1M1wRYtLfuP3WbeNPUYLgKij1lx4873uDfsbF
         KVDxXui7PNjaWCuCi3ZAm5Yxx1tfsUSmuY+rRPGRJsTr/ct6+XJak6vnlgn9FyPvJK4p
         VgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780628355; x=1781233155;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAdx1Eq9kdE+KZ8PMnuzkZszkmDD5iaQbJxqQjTed+Q=;
        b=Kfze8/16Az4gr+scu7HtBunWimsNRtn8PdFGf0nC5rzkW3j6qOcOsYobSHwf0RWvka
         ALoFTPnDHXFvJAgZcJ9K2BlM77QfSBdhAZADp7nZvt00PlpRBReoctLfdqYhF3GX+qnr
         hrCVSrFd3WvVl16uIfhKYnNEztEzrCzKeBAXk5RHmZXj3zYBinJmHuWLvzQEG1D705GF
         k8FPrk07hIVO0rZaL89AeaQrxDYpBY+dNRAVyo5CGvPE4EDzZWGituAyhTfajK7NwWUT
         n07+NbiFE66D1EsBtlOy2B7BQ/jQgWYE7CwvEK+GHkP49SCRNIB3YMzT9pmMYnLs8evD
         1sDA==
X-Forwarded-Encrypted: i=1; AFNElJ8tTgx/3VLEdZZyYBnR73TYM1dZRPRLdd55eJiDMIzgaXFRX3CKoUhHDfZmzGKoL5+Fhqpy32E2hrM9@vger.kernel.org
X-Gm-Message-State: AOJu0YygoxBhLGEQ1LV6GqWCqqsY/pRKelxYsX8UJqsWgV0qG++oVO5I
	GjgCdMw52ynPpYD271M2mG6z1P2eDMSJn4gsuxs84GuAmAmCY2Dn9ilHF4pGSHuBfrsSuz/rwzf
	6KYKNUx75sF2f0+EQgh/p9LZ2LGxO0jgewlubsA05Ha0aSDshWTt4H9dG35ja4wdw
X-Gm-Gg: Acq92OEvJ+PxEMCQATSHJHgcdm5dBn+kGn29J+O/A9XGbF73Eg94PI4qLEauSKdAQib
	ZSgYg4phSQ8VVn14AkrtLo5F7UXs28C4RWZcia/QuWtq23Dyoq0JyBAxb6uhXBnazTK6Pu3ANNT
	KyZkrti2xb81wKWpPllfI+tQBhJKUQ0C0G8p4KBxcWcKwgYUMw12bRWZPdAuImcTcQQcUOMZkm8
	MqmPfHxtpSMIZQuxt6SoiA4F7/pNJI2tPQqHIgg0ucYrYzDAK8SVnC+HFxSx70YcGFTwzt32nz6
	zgXMJJDjTEGBEWMj+d/JcQpl+BN9lNtF3UejUDH8tGsZsqO7MqkLPzS42FWIPFlZ5J0jFAGDXce
	SFqaC+p1JVk7jvzQRIjaYZRhBxzt6YDntJxd8ywmZI3UXQ/nGbaFoPQi5La+y
X-Received: by 2002:a05:7300:3250:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-3077aea9ef1mr834983eec.8.1780628354842;
        Thu, 04 Jun 2026 19:59:14 -0700 (PDT)
X-Received: by 2002:a05:7300:3250:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-3077aea9ef1mr834955eec.8.1780628354259;
        Thu, 04 Jun 2026 19:59:14 -0700 (PDT)
Received: from [192.168.1.57] ([76.86.21.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm7105120eec.29.2026.06.04.19.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 19:59:13 -0700 (PDT)
Message-ID: <1433c48a-5df4-40a7-80ab-348caea588cd@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 19:59:11 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <21facbaa-c001-4e82-954d-f2f6838d41b3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <21facbaa-c001-4e82-954d-f2f6838d41b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OauoyBTY c=1 sm=1 tr=0 ts=6a223b83 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=0jxUCcn++d1AQalQnBt6jA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e2-Id0N-X15YFAlKe_oA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAyNiBTYWx0ZWRfX+yqD6Rt1KlDs
 rS512e0k71mobGrit84yCB9HfGuWt1LlDqHzLkEe8GrmS1aQoahi2PEqphImH6Dp/k8l0FdD2pK
 boFsUcW7+zEEF4WEdDlBH8SH/E/4/ppZdjv3F8juaYeSU/IT4n+pKV6khhALvxE3H7dU3VFnLv2
 PChH9SCd4Nw9p3/ZM9frdIrabKN91rT72de2RzVTIdDS4soOU5LB0FzWoFj6B9MEjFC00KwL/cK
 JJguQEy1ByOJNNYMRCBV0pdY1mGJV+nG4p2JQPs0HqISsasAegZIX8GgunEETIpZYR5Qseh5y5v
 LONRWIUQA3+GPv1r1+JVdcnK9BiL1Adt8QQBhhl3H36YcJd6UQixIzIrQUxyVNyFHZRUNUr/1ce
 AMT7lBc2drAXMY9RTRL7d6eoI+Wtl0dGzztvZwgw3o9jLn5Ztj8FKp3wJNdS+HroF0DBqMkw6wl
 xDDK67U7qzwQRlaE9aA==
X-Proofpoint-GUID: qp4ofddvQhj2AqZ1yVfZKQY4EwJ9Z6yE
X-Proofpoint-ORIG-GUID: qp4ofddvQhj2AqZ1yVfZKQY4EwJ9Z6yE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050026

Hi Bryan,

On 6/3/2026 2:46 PM, Vijay Kumar Tumati wrote:
> 
> 
> On 6/3/2026 2:18 PM, Bryan O'Donoghue wrote:
>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>> described as subnodes, then likely none of power domains are needed 
>>> to be
>>> repeatedly described in the children device nodes, since this 
>>> information
>>> can be obtained from the parent device by the driver.
>>>
>>> Technically 'power-domains' property can be safely removed, I believe.
>>
>> The policy is to describe the power-domain dependency fully since DT 
>> describes hardware not software architecture.
>>
>> Also for a very practical reason a sub-devices can probe/run 
>> asynchronously of the parent device being active so in fact we do need 
>> to describe the PDs fully.
> This makes me think. When the PHY devices are made the sub nodes of the 
> top camss node eventually, we can discuss for somethings to be avoided 
> in each child, which we can come to later but for now, you need to add 
> the top AHB clock as well in the PHY node, Bryan.>
Sorry, scratch this comment. You are indeed making PHYs as sub nodes to 
the top CAMSS and not independent nodes like CCI.Just looked at your DTS 
series and realized. I will let the discussion about enumerating TOP 
resources in every child node continue in the other thread. Thanks.>> ---
>> bod
> Thanks,
> Vijay.

Thanks,
Vijay.
