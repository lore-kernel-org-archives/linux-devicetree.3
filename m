Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E21846AA8D
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989053; cv=none; b=i2XvygpUPZOhJ9KwRTVYN/v+tMTnT89tIUEDg740NECoJnZOm59h+vikTRVj1ZkqKmUfNYSYdpBc4gu7Eb6o4YOGvwz+K9Kxr2UwbBI0hVaxcXVSjUZQ4q4KrRIqtLJqdd8w4jVTfn65Uk2OCx/meYZcQBJO09mA0WOVE800QfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989053; c=relaxed/simple;
	bh=zZANITfBAADxe2aXB4OWVwHM5pufoz95Xh2AMggtPoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnIvkrTlnUsXEz3Zqil5JZNMby5FTDRsbOxvBbKVu5kFkQys+CCBYZiokb4IXyZh+ZpyJJmOYU3X//LhNsSyETVruokVzYRR/mAvy7oU906NQyn2t78uXszbwIi7rL3JIyN8B3xzr9Vb+bwuU8Pjrw692dkEUMZQLsUGDhB3Dc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7e8JBON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XI4CGvgE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7e8JBON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XI4CGvgE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe9O4419336
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZANITfBAADxe2aXB4OWVwHM5pufoz95Xh2AMggtPoE=; b=i7e8JBONAiXXKK4Q
	lpdqo7alndneFLzoUNWLrBCZuoAeFmIkdBc2ILMSlRq3GNinlG4VAKSptMxAaher
	N4mGx0oY6DbUidSUtvkgwQ+6apktN0UyMA+2LcOR2zW34Lm5ErBmbJIpUhCmrn7E
	19eM1sJ9OSKcwglsEwQHBgOq/hzsjPp7niQUMpTRCE8eynuN5N+WiJBvgMkukvUT
	hlEvsU0CAM4RPqG5vrNCy6MlEcj7GrCKGUC7QB3bRN/RzLP/jG5iPDvHwgdfw76p
	q3wYIb8U5Zhy6mDDCYZaBkOvDEZTxyHFjZqe7WHPOR0zKhw40ng1uKxGHtzPydwN
	ZHjK1w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq8xpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:10:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1927079a12.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789989050; x=1790593850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZANITfBAADxe2aXB4OWVwHM5pufoz95Xh2AMggtPoE=;
        b=XI4CGvgECsv7jX40aXezwpby6V4FeAs5IYMPst4H1oFcrp7lYQAkID4jdbgU63zSeq
         iGTgsDzokTD1kl7xIOarT3/ESqxAq6ELp+h0faLI961X0On+c0OgUzQfgTAVLQr8RNjt
         1tijoNTI/vWvGoWuGRNF34DjZ+zR7BiZW4JHafAjeMciedVduL8IuROPyNfxPn32jugf
         UiWnd880cz0a0Rt5UfpG9DbNweSlPLxVilynA/8v44BxjgOH9z/1m0qnY1UWKTZ/HVHC
         y/rap1Xfk+FoPVHXwolrKmIt8xttg+UQNwylcw59z365XZL337uV8LaHFIYdOaxUxbk2
         TXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989050; x=1790593850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZANITfBAADxe2aXB4OWVwHM5pufoz95Xh2AMggtPoE=;
        b=NQ1bKKncxz63DNRZ7RJ3QS9I+EPxDCWsn6kaAeBrFXXA5/LrlgDqd7xk9xnc/nn6Hk
         xPfwPJM1y1nizzHDSiH7RNdmZGMVfVYelEzuL80JVHMXuRuO7QwoV1qF2oBofl7TPOxU
         v3t/JbCjXhrvnMhbuQm09USzwuAtibEZvURMdpJv7odl+Sm/agC7jEzGgcWrPhJIeEl2
         147DyDmr9fbRrAKd/QudfMVki8PvYeqH5xACdH1fjSc1Iwg0brJChGt/3F7sQUW21RLt
         SOBkn/Ct9N/sleD5dkFPTIZdeYW3Kv7hiaGRRAiuffSHduyzkyNRMai0+Ck+tmzzXOBA
         N92w==
X-Forwarded-Encrypted: i=1; AKwUvBwLXtTZJbLXDt4nnSQh8koOexoyCCAHr+q4pzca+7OVyRHZ1wLtWalxaz2EQHSke2dRSls4bNa4/s1V@vger.kernel.org
X-Gm-Message-State: AFuF++kS99gx0SKeouB9+uzIGTJ9LsEJHuZTNWnvRREPDeh6JUjaaGkJ
	H9CZLI7FPlaTYd7va2fA3EwRZUWUAfhnkNO8SbVJ7VqOSZZnAtQahsbuD+G8aRC09Nve4R2Gn7c
	AVBinF8auLdpa73hzG5el1JiaBmOj1W2PUrshq6LbhRMHI2GZjzN32Py3R2mm9nsc
X-Gm-Gg: AYBFou0vuuKgjWpNKIi53YWVwrxaxjVIMVMvOEu/YIaif+L/gyoIbU1HbiMpdfDWhLe
	T35x0e1VJBJx0sb5kKGCV2hPbbmezNXV+R/yq3nmEvfDxZhn/6/5n8aNKvJSJQO3/1CQLIw8/eI
	YrqafF7RlqpCgRjgRuE3VXU16vydgp8Z9R4eIl/djCqvbEFky88n+WJgOtufvWhWgIUlltTIYf+
	KMzctxUDwMpAhV0YtURcxzgmrEqM1bmsCE3RsacWAYHz7yQwaZXBHvWuRIGjD1seh3u2YGUEPAO
	SIvKoR9W5R9Nb2SulYHz/79Jc9Uen5DYQfk00zZpQzmJatCSBwrm5xp/ixYH79PJbl8NYGnQd/A
	wMoTO9zvg9+GuNF8pE82MLyCHKKvT5d6qfw==
X-Received: by 2002:a17:90b:3fcc:b0:39e:6c69:34d8 with SMTP id 98e67ed59e1d1-39e6c6936a4mr9598899a91.60.1789989049676;
        Mon, 21 Sep 2026 04:10:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcc:b0:39e:6c69:34d8 with SMTP id 98e67ed59e1d1-39e6c6936a4mr9598852a91.60.1789989049167;
        Mon, 21 Sep 2026 04:10:49 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm34170227c88.15.2026.09.21.04.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:10:48 -0700 (PDT)
Message-ID: <f2324e26-88a3-4411-acd5-9645552c4a14@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:40:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] arm64: dts: qcom: Add t-power-on-us property for PCIe
 root ports
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
 <d5821380-3006-4eb6-86fd-977d6e17a8bd@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <d5821380-3006-4eb6-86fd-977d6e17a8bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uv8Dg4KoacrVEy915r17FK4MYir7bqXk
X-Proofpoint-ORIG-GUID: uv8Dg4KoacrVEy915r17FK4MYir7bqXk
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab110ba cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=LDKDF4IIlJaBd5xfOUkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2MSBTYWx0ZWRfX1LZNK26EVpBH
 mqGBvGdOvj3bUadGDKT56HkJXNAYS1EtqRcd6tpq1NmYZtFT0/1Ntunr0QlFbZtMg5jVqej/Wiq
 OivSUIP4rgVRHcD1fO5+ii12w0FFCpDcqePJh/DksD8P4DxG3C0gCGAPsBYwl/W0wAmdxfN/8IC
 1FDWjlmhZAGOKp54Obq42F/CP7QkGobsvNydYCIoVLIqIj4gk1OGQshYixmye6V3nFwCLj9ukIL
 by7qDmQogG5P5/eAUvFSiammSBM+b1Ws8Xa68okUL9to50OIv/hjWP2HMmRaVTdjAqjw2EH1bnm
 yBKKDTPLqw567N3xOEGLKaQpjKrjjSXQCeyWvNgGUJIeWI3u7o7Y/S/ieBlh8QZxzWOmQ9fjQ2Z
 zUSkjhPLOpwszy8MXGtNMbTdSx7wOiSbLc0i9qH2XsMxDB0ATaVq3U6P+z3COr364ua1EZ9E4Bp
 uin1YDWXJKXikXJH+rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2MSBTYWx0ZWRfX0Z9dgpXENF8o
 4aU6XsgCGkMlfQ/ZWVtdJqhaIkOuyvMLiOL86K7PqEceVs6CTpr+6+i2xEI3WEq3NZpJf1xVnhu
 MZGCK6lMTEIg9Djd19WVb2q/5EMVEY4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210161



On 9/21/2026 2:09 PM, Konrad Dybcio wrote:
> On 9/11/26 8:50 AM, Krishna Chaitanya Chundru wrote:
>> The Qualcomm PCIe host controller driver added support for parsing the
>> -power-on-us property[1] from each Root Port node and programming it as
>> art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
>> this, T_POWER_ON was expected to be programmed correctly in hardware or
>> by the bootloader, but not all targets support this, which can lead to an
>> incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
>> behavior.
> This is a good problem description. Does it have observable effects
> that could also be mentioned here, beyond perhaps lspci reporting
> an odd value?
we haven't seen direct problem till now, but we might seen some issue due to
incorrect LTR_L1.2_THRESHOLD value.
>> This series adds the t-power-on-us = <80>; property to the PCIe root
>> port node(s) on the following targets, so the controller programs the
>> correct T_POWER_ON value instead of relying on the (currently incorrect)
>> hardware default:
>>
>> - kodiak
>> - lemans
>> - monaco
>> - hamoa
>> - glymur
>> - talos
>> - sm8750
>> - kaanapali
> Because you said "currently incorrect", it clearly applies to all of
> these platforms. Are other ones that we support in the tree also
> affected?
yes all targets  will be affected, not sure about ipq platforms.
I added mostly active targets which we are currently using, I can extend if
recommended.

- Krishna Chaitanya.
>
> Konrad

