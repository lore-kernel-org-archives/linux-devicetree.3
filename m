Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E83345724
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727191; cv=none; b=VggqHQgd5Q9vRtGtr4rwSIqdLctVcdlNDK+2m95t2M+mYrDK/D6ByMaiLyWSjrifFSYgtz2iGFE+x+JORUbIgLH/FEBwdO2aGKbNl2Adv6IMYmC+YGQyDYxA39XYbTOddU+w6CtcWhvqubMWfawUkrokIWcGtZ/h7faiAHRrRSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727191; c=relaxed/simple;
	bh=/H1BBVdyEfbyljZhJZ/xf3pK2EeBXTnxYB4YYoc7Z+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tif93Vqj072PO8d4emeKGi2ZPQQky1WvxGjyZ3f6clGfjy/1536cGltJbjmDTIgmgTFUzh/QMvAT6NMS6V11cKFa4kJZgUxlpb6po+t74fWm+v2UXR3zb76QjhxCjInVUUtWELQwLyh/GuVoB2t6eJiEYU6RL4GXnYJkVFgoAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RssjBQuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Li3oEfZM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RssjBQuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Li3oEfZM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWO9K1155214
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wwQt8eRAxY30AWCxNoSfQv4m
	5dYVITqKyo7Nd44T5J8=; b=RssjBQuKLaX6D7xm79Md/BZEbVFl8bCwtcCpWUk/
	IONhInnGmXQgKEr0bAOLFhMGXbncw24Vkm99uq6MwNZp4pOZiWxSS3HRxP+sqitO
	Y2cWF2UZXkNV5wPC6EDtDfpPXVOCqR5+PvzWazc5N3of7aGmLLxluXMZuo/IfL6C
	DN8Pk0Xa+0PraCvCWdY8crIfPbRUXKmZU3p3cnpH5yAUzDkzYfxZ28r51jnFW4/9
	aKFwsNboPtGFfLL4X19XxS04cJCkanQu/TLTzFkmu9SwB6ZK84k51K4nFdzbpci8
	oiNRontgbLDHjeHYT5MG6Fpyu+dqrwWC/riUkKrWTpIgdw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt1n26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:33:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9771c8f5045so3169645241.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727188; x=1785331988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wwQt8eRAxY30AWCxNoSfQv4m5dYVITqKyo7Nd44T5J8=;
        b=Li3oEfZMmwDhLGVGPlyTF1bD5YurMQZt1jswCkisbn3k9IRlsUD06yUOOuti0tXSpI
         oHck+050N+FFCIKlBSkjk1/Hysx/ZC709OSpbJqb5eBtDTe/B7uBNliL+0CHpHNLdZwm
         TLOPYPSH9fqNJXKtUnbW5YX96fYq4mJqOIzMMlmYo64JIJFjMccwJpzMEaTT4GME9Thp
         3u320rtUtZulC9swpfbMuw+qiMbHP1sn8cqsxdrCQSVHq2j5MuuK7ENZNMIOX/k1BAw9
         vGQnr/RgyTeUNk4ooY23S7XVg1VvLYlkMWhdmwZgFUQOAOgMPgmhGJTO6EWDawwr8jRA
         K/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727188; x=1785331988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwQt8eRAxY30AWCxNoSfQv4m5dYVITqKyo7Nd44T5J8=;
        b=YQW4rc739Q8YNx+nmZG/pMp8E7DwX9VMEGf6RDlh2E/Dkqk7TywLwCduzOLVjzdD0u
         RaQElQBIjDAuiis8cFJ3ponntBXlUqQPd2FWDTejAjl4oSBVzYv3JDMaj1ccdBjGzAyQ
         HXfctqANxyejI/vRDuKHNYyf7S9hmVPX9M/FhRYByZglwN+8OPBebLRS5jKW4qPkC3gh
         WCrgjcxkyNcOcxEKRXnoXnW6XQ7XffzOAtqdrddVKNHXOJyxzAPxltlqKAY860Noj+xc
         //sto4ZMggE28L94dOmlR0WaOqAvqtOPX60HQ+epAwyA7zlag1qTSywoIkR5wSsVhMri
         8Lqg==
X-Forwarded-Encrypted: i=1; AHgh+RoWUW5BY3De4dFlAng9q8BCelGfxE/eyUu/GP8e9yPPOFxqj9X3OhOQxzL71emF/J/GekXzudxDKnJO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb75o7Yh2WzNbP+coTgv+q1am/MTBcY2ifgbMvUeSIqCHUrZ59
	zJnxj0AAW7y4JWHzRvLP27AmnqQYD3K/NUvLbp0chmUqwyei5HJSHLV3nfwUefgArgpmxv1Ppnw
	8yvj4uedo+/RZlhwumcdFQrjgbdZthiStEDWj/WWNt37FaWTDO+dQGxfO9b7j9CrHFCg8DuOO
X-Gm-Gg: AR+sD10R+Zsl9SJAJr7GG0ciZog5kUnGrHmqiFD6MG1SU4K+reO4VKNf+hQfVs63znd
	dxcVy0iiR8SLmgFfSBimVj785qXMUt/bd79/+ovuotTx7k3na78KBHybsn5uAvUGlX94jyeg/Ay
	6Og/R+Q4NO0IYtK2dHoOZFXNPb8jDbZ6zDQ1BruLPvLgWfeF0Cl7naf0fKib4hsovQ6SBALEb0y
	7lKnd5vTskYGGtG3xKVOCMHUkvwI7MvsMY1AKdFuj4h6FEO/dcZiC6mW3LFuAxSle+DWf2fDV1D
	5A5+YzxKvxX3V2Rt8vuG1/wMZdzBBYfcdE3Lz4/V9s9kDEFycRSN3hwwtcWOQKDGEf4lVXsbsr1
	bPmXWFMk6fh0VT9xwzavQNpkAPkuv1/5DE8/7XGbpe2L0/6qcEBixCt8MQx5ky8hCHZnpD9Vld2
	q+6jEQcpq0bDt0vw==
X-Received: by 2002:a05:6102:148a:b0:738:63ac:62da with SMTP id ada2fe7eead31-74753711ee5mr8596815137.19.1784727187949;
        Wed, 22 Jul 2026 06:33:07 -0700 (PDT)
X-Received: by 2002:a05:6102:148a:b0:738:63ac:62da with SMTP id ada2fe7eead31-74753711ee5mr8596797137.19.1784727187447;
        Wed, 22 Jul 2026 06:33:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6888542sm4239001fa.1.2026.07.22.06.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:33:06 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:33:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v5 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
Message-ID: <6xxh5ttpbkfeuqh2uahxtdls6mj2b5pxosfzcmm4grbrujzfms@prxjeh2l2tqv>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-2-99620e07f505@oss.qualcomm.com>
 <20260721064826.903A91F000E9@smtp.kernel.org>
 <48c3ac2a-ab8e-44c9-9792-f73f88ddb790@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48c3ac2a-ab8e-44c9-9792-f73f88ddb790@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 29ofrXi3EJQKcrtvbGFrhvNEmUNmgUNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfXzYx6ZxzW1IEe
 ke1NEGmxQ1srBKu/yYCZEOBs3FaYHXyZTDqjVfGP6PC5loXv2Rv3KyFMwgkOjsENsoxV6F8h8/k
 sqTv+pTwhAEFC0GgxlK3QDzzlqlp84Q0OV02cZApSDonJxBSX75U+dxEsLD4qFBLnXETq2q9O1n
 9HV8uUgjWfWyB8wf+wr372/t8UQROxlgj1nSdnrdEuDtZl5rpTF4nu44wZxyAJ6IjcN9uHBVPMd
 HhTykthDxww5qcMr+mdjrZHXj+V3dlKRX/8hhnCGXJNE3Gexrfd1VY59/9sbY5hlacV6lO0LJak
 X8d7Edce759YD1flShFfhz6JZ+dqZWHyjvv0rgrKWUDvUxQxKoZnN1EQqUeHDHKT0NaayMFDd9g
 +tsQ4ms96IFpBCtPdtr8g+TemGFSLGu6BD9QEbw7gjE+TLikBzuuTOJEMF8xtGTdioMldHZ9TPv
 Fs/gx1hQ9wt+wTQHMyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX+fqQn7GhI1Fy
 9pstWSlQHdtg5zh54JQ0NI6jVTP0RHNS8Atpcar+CbyGcNGOPPUOus6Hs4K6IvKxJN3UpJS2v3o
 pIOT92sxBSvRvsHqABfLNDtiBkhzSh8=
X-Proofpoint-GUID: 29ofrXi3EJQKcrtvbGFrhvNEmUNmgUNg
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60c695 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=793AhHw_EzWDBmsHl04A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220132

On Wed, Jul 22, 2026 at 06:55:23PM +0530, Gaurav Kohli wrote:
> 
> 
> On 7/21/2026 12:18 PM, sashiko-bot@kernel.org wrote:
> 
> > - [Medium] Improper dependencies prevent COMPILE_TEST coverage and force dependencies to become built-in.
> 
> The COMPILE_TEST concern is not relevant here. This driver is
> Qualcomm-specific and depends on ARCH_QCOM.

A general recommendation is to make drivers available for COMPILE_TEST.

-- 
With best wishes
Dmitry
