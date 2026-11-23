Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466385;
	b=gJsUaN0l4A0Ke+6+LjreO7qeHcjRwpg0QRPw3yiW2AyEPPTUC/6BzSFS2yKGsZn9XMNN
	 L1bL8bsPfKFob5+c7fyEMy03a4n4OwjTJqk23rcH4LN1545IzxkFCkI4BhKCb10SJakyt
	 THTlAlHLEdw434i/6QMgWjduHsi3fAxDTUQ7ytyRd+pUSDgFurj735w5f1YuocfGjZkL8
	 YsXhvIM9tl8iVSIQkOQa7x3Ps0LsBUj8FLZ0epi0QLWUJgHGxIkN8K4Uzwgzn7osMNMhY
	 2f7fIRI7njZUnUWc20QUXDXwfJcCuBQ1vm3QbknHKlgk38G1XpYJcpYbzOsnk/jve3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=;
	b=P1P+zXkk4UULwdwYblTsO1PeJF6gHQDq0TK4q1+CEMU/S7ikw6p1ZORa47xLEfzI1B6V
	 Pbgts0ItSEWlkCEPC85huqbt9+RCfrsGhQj34gOBDmxg9Qt5TsXxOaFV+dqzJLpDskZA+
	 7+++fAOCfU0OL+gAxYJfk/bp6E2SiwzTe/CO1UUrBXPRtjgLteepqTX9RlDlp/8ilEB4E
	 e0rFqWW8IcERK+2UX/uAwbyVynFX/X7x9x+2LqJS5mBOiWo4Iyjs32zJ8y5I/HT2Bg0Gp
	 8WUBvdnVO/bL9lpgOWZJZ+xp4NvAh+BWLoBeTIpWMSiijQnsXy6USGrOjMgp0EuvlMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FayhAM+A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KDp4APLK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E560606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E560606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FayhAM+A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KDp4APLK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuOhB2349989
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=; b=FayhAM+AHNEAkIR3
	b8N9FmOqGz50xqkCk3OxEjpXss7cnSc+hkWsGqMr5+5F+exNlH6zrJmRTf13PDBl
	S+Tdz8zo5FIavg5QxQT/LE5mP/6UVBuJ4i8e+Trvikfj9oz7hUOfeUXnHlg0FrKC
	5ZUqYnbBtxMkB1Y5aVmTYgJL6zMAwjZhFNqYd1ElIdCIsIj3jahFnKpD+hHMit7Y
	iplugmpv7hd355++o2C9Qsne7X4Qe/19c+1DnQn90n88YMIB0X30I5J+rzN9M01B
	ig09kUJg8ijwhrrJoFCb/qSbAREJbe4LkuJYxc+dQsldu5RztJOzS71BBoYiIpqH
	Q16kQQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3b9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:39:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383ec96a7deso4247072eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795466383; x=1796071183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=;
        b=KDp4APLK2qxP1LuoiC4ykKW5vIVtDrQOp1pNKBKZVex0wyuXphn9NdgBjC/joXLYOX
         TaLZ0P1PiFCFx7PgoIpH5TeAMHTE2tT9/1xE74EIjS2n52AoscxKK46xT9LO/KtaAa6j
         zt3f3Fq1xkt2hckwKjykXyJd3Lfmsa3Gjdtt2LizsO3hOz/9cat3sy/U3nuEpiz1jyyM
         UQez8pBRfW2+c1Ca+OK8VZK8ICUWmC5zBrCtc+p4rx+gHBHLpEr4bek2b5vWAOylcnKj
         TKNSCYtLYSQ/WjiVJVv9QvBLYXdD3bHIy+B8qkPbUZ1bps4tlSYuSqhk/URd6a0YI45x
         RTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466383; x=1796071183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=;
        b=abkffs9L6Qir8C3YyYnCQn/jYsr0d5x8JAHyOM2Tu0BPrvcantEDyN7XshErCqtoXD
         jI2UwBHHqeaefmirzIINmsg2nIXQORg+65V2gvV6snDC0w2cYncWaXP7sprbyFoaDrJv
         lveAfKgA5vnQZRe0i1FiZWfmE16E7t6VrhefQHcTpkLeahqkZCEQAucNfMqz5CkvN8Zc
         +FZKyMdqN0rJEfKFI0pH6GwsUONHTK8m8jFPNLMLyMkeSH/Nbv66mDo2y5Wdbgygp8Ds
         GVkYx1gLF7+puWzFComo45yf1MGdmsyGQEVvBGGXh5Pb1vaJ0K9Wl4ieEUwAc4wiXDra
         /iQQ==
X-Gm-Message-State: APuU4Z8itR8oqFPD8ZltMwL4mEFGNL+E2NQ5SbEIC5aUZ14KjQgUyorh
	D1KSmOkjSDyGrOqUKUhnqed415S/gQQ5NlDg+WgQ8IIR4i+XC2aVmPpCekWc/1OlL1D430Ogxed
	QNLQRk4ro+se0roDuh8XLk4TIdgkfc/p+FOnuWmhCyuAFWMF3tqKT5ms4B+0uhckr9ez+ayW0
X-Gm-Gg: AZFdTZf3uKclnsMqxGiahXoR7okqO/Lb8iXFhLkiMxe+Y4xBlumWfkbtGCk7X8cUc2Y
	qjbdL40bl/0ABTxwY/vL7mz9ETIBVHL/mH9FVF/YSVequSf5DrrtCc3JLnBNnkmVM8Geq8MxErQ
	wPS5GWubpgCgrkLITd0eXAQCJ3GRyTcN5T+jfeOoZ2uaXb2koTZnQTUxBJKFqggwKPW1cc7xgWe
	1JgxBzs88EHUaKPxzXf0vssaN0PYFSl1gSwhVMMiSMPAumRF0SdgsCscEX+V5B2y6HT+rYGiOIh
	QmLxrl0uGxRY7+JgY7yTz+Oxos3xaVbz02ey1ZuSLKWmtCv+3tEHtwJulJusENRg9biA6HwNi5M
	CeTjB/ef+RfjCiOSu0wXU5XMPRhU928xy64EQMJS3SSnd7knS0jcv19OyRD1RGe+fkLaCrNecyA
	Jr/pg=
X-Received: by 2002:a05:7300:ae04:b0:384:7a8f:3bc1 with SMTP id 5a478bee46e88-386a8562bb4mr6348377eec.17.1795466383299;
        Mon, 23 Nov 2026 12:39:43 -0800 (PST)
X-Received: by 2002:a05:7300:ae04:b0:384:7a8f:3bc1 with SMTP id 5a478bee46e88-386a8562bb4mr6348357eec.17.1795466382794;
        Mon, 23 Nov 2026 12:39:42 -0800 (PST)
Received: from [192.168.1.136] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm35843638eec.16.2026.11.23.12.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 12:39:42 -0800 (PST)
Message-ID: <e4059318-2301-4362-b308-ba915ca8310a@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:39:41 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/7] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
 <20261123182847.143892-4-elson.serrao@oss.qualcomm.com>
 <sashiko-outbox-229871@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-229871@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfXzTkZiMQCPR8B
 LgJH33C9IbVa35DCKd2r6JNpkFFP7jSMu+LdBksCgU11FY0ig7EJB9xOpvQhf+A0Js/iMEzK62p
 jd1TByG7erFqy+00GtMQZtB0U3oFIwA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfX8PJVAZVIskaq
 S3hohZ7D5n6VUGCpHelJWuwMBNQAuivRchgE8ZMvWhP6akeitRe9BGeEW2cZwdQMr/sszjeDoAk
 Zz7AHAUfzV64Tv+6fEIOP63s/rc31o17Ra6akMm073x7N/RGP1TW8MVK18P046U1wgbsXNfFWy8
 T7+5NtG9fnNKOGf2DzMPkg3IOQp/a3kIUpwzZxXxxwv/CX77yxoNt8l2C/+O7+83y+cceqn+h0a
 ZHg8hH9Or0/kHFsVcFX0JSIFnGfV0NQen4Iv9ayG2YLtv57o7G/NrWbrYcspdcfvJJJgCcPzxd7
 ka1Snoc1WJSyjI4lB95JlhNKM4cVfxED15Bczu0HjFVihFfpq+NAJFPViexstTJa+h+GEgFegJN
 nqeqZZnSuFdW9NfTGVcAUHY7NnabAJb39Bg1GZKPxhLBM2Qqm8xR2yH6sVfHmwaqZ2Jm/0lZGC2
 uTDohKet1fhq4tHkZkA==
X-Proofpoint-ORIG-GUID: -7Of3v34hALhCi1JAwDkGaCquxVhnCik
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04a490 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PwTwPomv82BVMpG07ZAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: -7Of3v34hALhCi1JAwDkGaCquxVhnCik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230082



On 11/23/2026 10:48 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: misc: qcom_eud: eud_probe() fails when secondary path is
>   disabled in DT
> --
> 
> commit e2fd91a7c0ed5f3452a494a0a91ef1ddd34b1c26
> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> usb: misc: qcom_eud: add per-path High-Speed PHY control
> 
> This commit adds per-path High-Speed PHY management to the Qualcomm EUD
> driver so that the PHY associated with the selected UTMI path is
> initialized and powered when EUD is enabled.
> 
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c

[...]
>>  
>> +	for_each_child_of_node_scoped(np, child) {
>> +		ret = eud_init_path(chip, child);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	/* Primary path is mandatory. Secondary is optional */
>> +	if (!chip->paths[0])
>> +		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
> 
> [Severity: Medium]
> Does eud_probe() fail on dual-path SoCs when a board disables the secondary
> path or its USB controller/PHY in Devicetree?
> 
> for_each_child_of_node_scoped() visits child nodes even when they are
> marked status = "disabled" (unlike
> for_each_available_child_of_node_scoped()).  In Addition, on dual-path SoCs
> where the SoC dtsi defines both eud-path@0 and eud-path@1, if a board leaves
> the secondary USB controller disabled then of_graph_get_remote_node()
> returns NULL (failing probe with -ENODEV), and if the secondary High-Speed
> PHY is disabled then devm_of_phy_get_by_index() returns -EPROBE_DEFER
> indefinitely, preventing EUD from probing even for the primary port.
> 
The binding defines both paths as required for dual-path SoCs (e.g.
SM8350). The eud-path nodes represent the UTMI topology between the
connector and the corresponding USB controller, not independently
optional hardware resources. Therefore, disabling an eud-path node or
the resources required by it is not a valid configuration for a
dual-path topology. Probe failure or probe deferral is the
expected outcome in such cases.

Thanks,
Elson
