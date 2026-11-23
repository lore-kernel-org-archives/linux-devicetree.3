Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413362;
	b=WnHgC0sVYHXVWbjpExEDf+mcwTU/lH+fwYTpUOVrZ5VanZMkGyOofV1dS1SToHXHuuwC
	 ZDSKq3zTTLSJy6XFUAIoFIEF2PoYrZo2dyWCeC96TA1z9AlOXSo6PnmMkykH9gxT8dwNX
	 YkNE3kuVLnYdF9zyYdv6EgAh7mzOJxKSk8yZRrthEhwjzjaGwQ6cBVnlqcOh3Trkr4TWi
	 w/xNLvWEfegKl2LDuB26dg+8/5365MPKKap9gXthydA1SnV5oCR/CdR62E8sZu31e6Asu
	 2hKppeQGSBZWyX73EbaRA1e8bpEGGBKJ9vg+o+8lQreu5M8MhM80Xob/8gtlLpWrI/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=;
	b=qiAk+72561iRo46tX+O/SJzdAOf7KvmlXOigf1rnPFzSUMLmrWU57q7dg16q62vekjWS
	 8eWtv8D0sTlSJQFc36Y40hn1s3vD//vh0u73EVN+coqQH3utSd/hoauwWI17qCS11h3BZ
	 MV7ac/Rhwz27xGJozfcliYFJVW7USLZiJ7H+n3GkVfMJ90rMc2mN8n4cJIVrAgD0AVQtH
	 vPb5eX6oHQyHfLpS9pt3xByY9b90tC9/2OtYT0kyRmE7hygTxybf8gGAuXghEW9vZ/912
	 U4mUcFL4gV6bqpgP/8lLPRnwOj6sToY4xwewAwRLSoLgHRGbJEhYso8uIEVRez7ixew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOE0gCfq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fzwss8ob;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9143C606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9143C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOE0gCfq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fzwss8ob
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50sU8831198
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=; b=eOE0gCfqpxyV5Qso
	NqjyiJlOEjj6QZP03opjEcqTIIF3/iUfHD23DRD7g5EN84ZeYG8I9c38ZB2x8hGs
	ybK+DOGS4oQ9XZwhNH3EtCCUjOc5Fi3pbbBGeaqwTP2GdaEAbiMkNuNYuBrVjLbx
	HnBoZkXB5KPipz7ZBrnSrWJkhXWg7RvBvZ7jAJwv/OMFUyK6JcrXIpKpDe6kidX3
	55XgWd6oaHPkRHQOOIYEJJyyDqpjJhuAXGG9QaACzBLFiMp184CSqS5O22hXfpnX
	VIVH4aeoVUrMBBgtQY6074VBR2Fyt0i1963xQiNoFGIEiOoyfV+n0NM+ob7CCoPw
	bgQfkw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx05c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:56:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f052777c7cso26146455ad.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413360; x=1796018160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=;
        b=fzwss8obbkxIFCEOKHiMc6eaZiNBCNNSrqlpvZi5UEPoPQcArnsdchO49GpiXFz73X
         +59TzXQMFbX9W5hDhzBnzCIfRAZxBwQUfbb0jMOVqxN5BW3+CPDN8qRP09pfWw0AXhvP
         3k0PI2od8zL575EVO7UMC+qfXQ94VKlG4daCPbTUuebx/leqbPDyaXCrt5YijDxW05P/
         6GM6Br0FS5Y3NPij9d9pJvT8lauNC5ob5P44vKy/5ussCPjBl0I8cTTZL3FDnkkadx1P
         l9of+InPcOLDTmrLSoV1oyjAI0S/yEkG7jrElIW/WNb9A5+1cr9REio93+GsKlSspFgK
         vQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413360; x=1796018160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=;
        b=oeWjAOxY3imD6SS67k1rPx1s02xDb83XDC1cKgvlb9y8K5TxwCugPXI6sYuvjFFatE
         X6b2EsQeI5adGE9Szo9DcExUFXGe6JFeAs2MO7yUl6T+1L92jeAjELKU/S+u3Mwkuiln
         rLDF+bXCv7b290NUpVPxwK0Biv/ebNnhFhqedACVBw4utxe0aT20YLtn/Cv7QsohcV+v
         YG8M7EHheK2bzHVDce9Xkn/bo5dmN3EwYbTywPGbgMwgnAk86wXHvZkYW3PKaI7IuOR8
         sUE0c92mM3zOrlTuYm7a/uuGPNJzcQx84BlHg8aCFGsiNjkDihfOtRISbmiOwOxn/yzi
         mESw==
X-Forwarded-Encrypted: i=1; AL+hErFKYPh9ljvTrhZWnmSkSOJ961Wq/607m8fWYP/c4i8NtceDmMxsr9LxMDWbjSxXZSYQ1Jth8aa9nehd@vger.kernel.org
X-Gm-Message-State: APuU4Z/hfpaViaazTGlTXlpxk9IauMZck71b5TdfWYBU//cN5buT6XVA
	WFgx3/hXkOFtfCnkVSZbDdOwOl7dyeZRGEsLsxCa/e0YQLwam2sdjs64nNKQJbp9yeILBK/Gdvd
	hi+8ElNKUtpNZAivApsW/kBFAkIEKgdu4LNeWwr7skGSmmsIHXC5qW9A3YyKj3KH9
X-Gm-Gg: AZFdTZf3LsscAaUfCmyFbLnCMB0Lv1Oj6dLOdhiQlMksggfXka+XRQrBkncqNKlK2+U
	Af9PcKG/fPEDHUjI0WRTBExHdiWxtw9d08GNYiyFMsXRlZ5vQoGhczwSDcTXrrY4VRbX7KmkjqC
	tPa9iWir4Q8CbQH69OY1dL+wsbKmaWDNk+yuZWB1kNq3fwhI7zPD4auOmPabqHcrRpxnwfegjBV
	qYIbieRqMj9WqANz8pF6FOEvicch8Z1b9eD0SKJ96eZUZ7M25UE5mV948AcSdXCMGi6ezZHfxGn
	RtycQ2rgb+8LcXDMuWl8NXmdkILuOHg8Z5WNd7u4jKFW5FRHCw3+ZCXP0bj05ss5vrqqECx7jDO
	AxNbRElGd7i+4SNRU6m/YqcgMiNhb9tWT4wS7CgkMLqY+ZMJXbmXpqY/KnAkK+pMOMoZZLZuG8u
	SGHg==
X-Received: by 2002:a17:902:cecb:b0:2f0:45a7:5d10 with SMTP id d9443c01a7336-2f045a76530mr96395625ad.8.1795413360126;
        Sun, 22 Nov 2026 21:56:00 -0800 (PST)
X-Received: by 2002:a17:902:cecb:b0:2f0:45a7:5d10 with SMTP id d9443c01a7336-2f045a76530mr96395405ad.8.1795413359684;
        Sun, 22 Nov 2026 21:55:59 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215d7sm45538685ad.65.2026.11.22.21.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:55:59 -0800 (PST)
Message-ID: <a643aca3-e1de-468c-96ad-d87745c40574@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:54 +0530
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
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
 <e707a3ce-7e3f-480f-9166-3f048b02e7e3@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <e707a3ce-7e3f-480f-9166-3f048b02e7e3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b03d570 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZqXg7yOw1P01-A-HOdwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: -zJe3mmvInRnAFk8xZyBZlkZ7sAgvyam
X-Proofpoint-GUID: -zJe3mmvInRnAFk8xZyBZlkZ7sAgvyam
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX/kknSAjeeTX2
 3LEKNCk8lgGw44o+ZPhkQ6uI2SGVzNuUdKTuE0mZv/sYEo1vcIcO3dNvxY2tJNsl/4jQ5X3HI7G
 aEkU9R202S4P3suegtiUUGy2oOZxV2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX+3fOkJn3T7HJ
 UEiC7ybHtodBkwSE4na1S2m8ykyoaU4D729J0qHrrUCJ80d+hWiepvKNBH3+05P/sq+Z+Jr1x5L
 w76zeEQ+AyxyKtPJwzBWCDThRoeaNr4eFXKNtOGApuzIHNLIKkaEP0TrzM3E55oDv+1w+wJ4Uf5
 QBadI/k3l60mLNbjlURRiYQC2wE2SYQ98KHmXt1QjFzTX3LRrao3blStCKmHolUw6q//IBFO+aa
 YRhAeE7OYLwj5K9MK2CgFSkkpNzP49wVuXfdADAtlT0lXLOKPTYqgcnUaGb9yH7AOUGCEO87lH4
 sVA1yQTeYnvXIs79VHjn8bS7sZ0fy7rt9z0TsPoQl5W6Wy6iGII86naptSpVhA/SNkE8HNnOINy
 9nwDlnaRLO5EuojvJvyBJcLKMI9gD/W17g2DJiWrBx4Ps/0U+pmOspCLlxNzP7NQM9DEZaN3b09
 a08gixZJgzFtE7RvjPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 23-11-2026 07:16, Bryan O'Donoghue wrote:
>> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
>> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
>> X1E80100 CAMSS resources.
>>
>> Signed-off-by: Nihal Kumar Gupta<nihal.gupta@oss.qualcomm.com>
> 
> I mean this is a bit of a convoluted way of describing this.
> 
> You have one less CSIPHY Hamoa has four Glymur has three according to this patch.
> 
> => Fixes: tag
> => A commit log that says this
> 
> Talking about the ports doesn't really describe what this patch is doing.
Agreed, I will simplify the commit log and describe the actual resource
difference. I will also add the Fixes tag.

-- 
Regards,
Nihal Kumar Gupta

