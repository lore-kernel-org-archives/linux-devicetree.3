Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C543D3B637E
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778180132; cv=none; b=R9ZS7GnRbgqFpBy4lJEd5LUW53zNWFzIzaODR7CDJ1P8mJpQtvjD2jxK8AM+P9SwcKmZHYc3zKBsZgZ8ht5xKV4qGg8kBZDoz+th6J3h/WwMuVdK35WwKQsQzU9xi6XxkGfDulwJK4vD8V2VeZOfUOVotI8T3H9JXlTvEv0pYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778180132; c=relaxed/simple;
	bh=5+QjIEY/JT86akbLno686o350DIhsf6rA/JkZCxpcDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgAJaneHfxAAYorzuSZFtNZ8ER6hrSxqheGYfkVaaH8QMttvJCM7sXK3QxzqZ9whtTUuFiNVrS9NbLqOQjEe8FOv23aKz4tQ3lodkhm0v3LODbtLcRp4BkNQxrULXmXMU7tTJI3ueNsaz9lDJhql4lhSTR2Z5IjGcMglBlkL4dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOX8tzJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGNcQoS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOX8tzJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGNcQoS+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647ECa1R1424447
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 18:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+QjIEY/JT86akbLno686o350DIhsf6rA/JkZCxpcDI=; b=iOX8tzJfbuZOt0E7
	qaEzFnsgDoEx3v6oSI/3ple9JXi37sovrG5VnAb4y0W/KkiVdJqOxbEMbB0RA8BN
	7Uc6LeizaPCxok2Lee44M0SkEcXn8/JkDCLqxrCKRBmOxwrh3i3+7GKkSzqQAM2x
	k03fv1Uk/hReHvqsXXRPEyTC6G+o1G36faPYZ7oS6Xein86r8XG263vXlDfzqKtF
	Mpzz84LNAt2wfPeg28krmJGWjcHlGNCKhpiXMRrydHOx+5Ng0rEsHoNr2C645JOv
	+yJuxaoH002VBciCF7cn+cQ/ANdVjp8IX+TGsl9FBouTzxo1eB529zekeoJ2lfIV
	7iPYmA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqftnc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 18:55:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3653638874cso1772924a91.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 11:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778180129; x=1778784929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+QjIEY/JT86akbLno686o350DIhsf6rA/JkZCxpcDI=;
        b=ZGNcQoS+QJaQ+9I6OvY24QK9M8ht6bi0KTmPCOqdP26Pl5RuxmO8a07sN7ogN7X0FV
         y5+ddCZES818ISGXTrhhCfhhwzWzLZQXjIvUDiqqrw/wuE2iMEE6tnT2+MexVwWr56YF
         v4jPCGfDd49ffWgF84sDlEf0FE+f9ev53e2LXvcPcvrKoaeAMpmTqvM9xGtkx2YYlK+P
         hRwAwZ2by2HhsAInkynz7dhDOcVxNWU3/X46ugyoM6pRgll8sj5AYabjoY48/i9H5TwH
         daDzUTMv0lo/ujtjFMeA9b6GG5kGjHWCFmes+xtdTSAIvvEVcBwJSF3/+TOoAJVssgps
         XO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778180129; x=1778784929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+QjIEY/JT86akbLno686o350DIhsf6rA/JkZCxpcDI=;
        b=K6HpZViAzmjuueSxvrZC9FJ06jwSATUA3Tv6IiDLdeJlmEzLxBcCsUrYR2jn384i6H
         IACiyfL57UALUGIkm57VG2r/dbtX/UALFTuysLahOHVKYzd20Vl5Ry8iv8sKig/M3wGw
         /U/EkMf3t1Uwp2Anbp5UbIKAP6yCDBkAMeY9aBZkJpwlDV/Ve7Y07Op7JqV0RfvhJye/
         DCqSLr08RhofCug5UKWzNaRpdc0sxbgq5x2NGW3UF+/0QXiMuh+Ar5LwwThtU1WT92L0
         YhGAvU39gVy2pTRh9kSJvVEAdKyVxhbnVSQIVe1dpnucHLtyKHndUY98Dcj8YqQFvSlT
         o8CA==
X-Forwarded-Encrypted: i=1; AFNElJ8ABUh12YSYrHIL/K9sNWQQYs/GNarWGxdRICQAs46IwoS4txj0J9pikcLWecWpcCN9cFbxyvdfS45E@vger.kernel.org
X-Gm-Message-State: AOJu0YxS/uUi/nBiN3Cjul245GMOw54wVtJ0UO9NeLGBg/9Ozw3Vrrwt
	2UCmQyZq6NCBRCIDnaGr7jNeAzR4pJkhwkJaag41XS8NQZX+OQk3l56zfUOtXrJCwbRVGmus5wD
	ILUgwbXboBxQbS4KVBgz5tp9DGaf1tuNRQvmatJHz5hiZFZI9C23lo19fa/ECu6WF
X-Gm-Gg: Acq92OGi4HxMY3YCl8vTn+TwdFmKkelvnkhR/mxSZ3lKC0SOEra0GUMMDHFNe1vMtjX
	qlsaNCM6zAWa3+v7huepI7+FDKKH7U7IeeTVPy0inHt5ON+LKwZ6Tb+rkcQYZyFunCcmhUEE/L4
	AfskQBYVu7nvDQ3Hx6AhUEUGcmSAbxvzcoAoC+LyKunkEcviu1FVUC9rbzlAhC/Iik9an8GF3UO
	wRMcLyXIiqsKNO1U+KGNHhUsaolEPt2bBnyBX8pwxlh5PtsOwlK/1UkW8y2Pdv0mvqkac8ibCwN
	L9Lotx6L+iOZ3uJAN7nOrpHnXcjJvidbylNzV/RCmKukD4OYEitPZeL0DByzVM5TG2IkwHK7+fM
	zgHjethM2anDdQtqYBYCrXA0E8tUo+nUYNZAomz4XeIK7eRlno6E=
X-Received: by 2002:a17:90b:4a07:b0:366:102a:5754 with SMTP id 98e67ed59e1d1-366102a5edbmr3643914a91.15.1778180128686;
        Thu, 07 May 2026 11:55:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a07:b0:366:102a:5754 with SMTP id 98e67ed59e1d1-366102a5edbmr3643889a91.15.1778180128238;
        Thu, 07 May 2026 11:55:28 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.202.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-366478fb189sm140126a91.16.2026.05.07.11.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 11:55:27 -0700 (PDT)
Message-ID: <fd1503f8-52d4-43fd-9003-9eebcc475827@oss.qualcomm.com>
Date: Fri, 8 May 2026 00:25:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add Shikra compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com>
 <20260504-ingenious-bison-of-defense-5e16ba@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260504-ingenious-bison-of-defense-5e16ba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fce021 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=GlSZ2Rd4KtbczYCFEJIQVA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=R2oHQpLJbn4m8KOwb_wA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE5MSBTYWx0ZWRfX0RFhTWJ9DOXy
 KH6N5wAGRgkyY/ieaGihMC7woVRINmnu1Xi31egbRonVKXOyLa4hNweLC4BLlp/Rb+uv6LZCCID
 klVLHVd6euKgzopGd8QRLEZEcV+le7Nt4xJz36ei33eAfWuHtmtvcks8wOAP1Aj2TmDPDBOFTMc
 wg8B2lCNNRN3XLJBJd5w3Abgw9s+KzHa3HQSOsFezXepjbl3omKS2ze9e3CNEPZbm48z7wumXqd
 QfTAzd48eNK/mEBY83jku2K66xwiQFARJ0SpGOQwtp9U+Gvhtj388QW290vJ5ZGWLCZSmyIQhYY
 7uJKKpKkJ8iIiU/jv/zQElUavQdEbyrQa6/61se/mzK1p+pyZaFnBs7Zw1vfyrL0V/ze6FDchOl
 6WDTQyfh3NrlMwiH5pX6KM9yBBNEbycr6nfq4ZQ497ZGoZsXTUqe3+Vb7ffumtNJnc7wSLg34lH
 vQ3/Xo2toudThVq8F+A==
X-Proofpoint-GUID: ASwmsTGZWnevB7arpOA3LkE64eErAQ0j
X-Proofpoint-ORIG-GUID: ASwmsTGZWnevB7arpOA3LkE64eErAQ0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070191


On 5/4/2026 4:36 PM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 11:40:59PM +0530, Komal Bajaj wrote:
>> Document compatible string for the QFPROM on Shikra platform.
> subject prefix - it is "qcom,qfprom"
>
> Here as well: s/Shikra platform/Qualcomm Shikra SoC/

Will update in next version.

Thanks
Komal

>
> Best regards,
> Krzysztof
>

