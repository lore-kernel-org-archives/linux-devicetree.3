Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F873F4831
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004798; cv=none; b=t8vPlpRpAl2TqmCoP2OyZDNu3npGB64EfmiHfLq9Ahyo5n/JkzBeSlXjH9Ccs8buXz6ytNDsy4cbCPgYksTNXmyX5/LBGxzdnbgRn3pkY3dhDQPJPAvutQ5CrhwA7zLHKKiiWKMRj/KiK5wyDY+EOXR3Ul15aZ3EYV5yCPuprY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004798; c=relaxed/simple;
	bh=CAjqhcwHNRKbnaa42UOt+9U/v/DS7PZzAyfZXlMPn7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZiAjHVOMiDAkDwMHwd44JG9HitPdxsr7wNLmUdKuJT23WDj5e5MbArJp0CnRVMel4VinRs8Elk41jr78P/+Ykh7WX1nz3+I7TAy+rwiPs9mUMdO5iYvn35B1wqtKjisPV2qoOIPmHWW8OwW4J0hekoVzoPVphJJAnD8KjH9luU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7T1gOB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZxOq59Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7T1gOB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZxOq59Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wjsX1070736
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rjz4TdIkbhPe8Log7jOIfVb7
	EDRtwrsk5hrRZrQvDfY=; b=V7T1gOB+g8hmwNXEVaw11V5+GkSf4rEzG6wjXXBH
	vSrI735ls4c1tZCqvdASzqXBheTECE2BmTSKdchcDrC6CTiLfL6XVBGSTutg59d8
	9BGItOcKkNmKTP+bCKSQuGij9gT10KmZ2WFr2q1rpfmeFS91JvrrvxQy+VeGD+Fq
	YSyWhH5+/YqLX/d9t1VG7MgiLEXd64PGdJXkLtRLqLsS06kgGUt7M/xqMCelSv6A
	kVxWrIxQ44v14rytvM24Zr9hCknweeEA1m1rUV7NgjtPEscXUBgupNDexvYJBOkf
	uT5ny1qa4irqBbFvuyl2v4adSGMBtEnEbFgg//N6cBwSCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuch12r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:26:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so203273785a.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786004786; x=1786609586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rjz4TdIkbhPe8Log7jOIfVb7EDRtwrsk5hrRZrQvDfY=;
        b=RZxOq59Q4juQ/hcbZc8voghnTAc/xsmhHYbYMQdKNttrLLXoBPo21F8wLvFGyV4KZj
         gsOAEEct932H9Vdwr+VT3IwSkjmi8zjFYrCV0HdMGzpfmnMQJntTa8Ot7SB28RU/u/cT
         R0oY7QQ+m3uvQA3pvXiH4xOnaoQEDb0JquMfs0cyDs8hafNBOyIUG5wA1SrFkmTkTe/s
         JrbzsojvkCe8ajfaD2G3EDE7Etk0RJpgIhErYrZ68R24It3XQxR7SI52VGikE9DJacgV
         /gsOe58j1KkZwKxI8ULCODFaNgst5IOj3vjHV9lwBzi+xvCjG+UxgzLxICREgV0oYE4w
         ++wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004786; x=1786609586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rjz4TdIkbhPe8Log7jOIfVb7EDRtwrsk5hrRZrQvDfY=;
        b=p7ax/5qF4Gtpca+nrmgA4A9vZd5xuoal2vo4FeQQ5hVclLwQS6hoN5e92JFONK5Mya
         /7B/vlDBaqBfeGMJtayIsLuJHm22g6i4wx/pYM5dYu5xTBWoS+cd0C14FBuD9WZqkTp4
         rzEQp799dStnFliLV2wTlNvxkDTODw7EO/o40c3RbCyBtQCI/iTr3mTx5id/3FBTrZpw
         AEYz3OWBQIMCcRfe4tjtxn1Lj1TzbRNLzRC8dAC3hwNzhZB0nR9UixeEljIpb0O2hK/+
         AJxTxOQdvBXJy6xAjpEVlIQ/LycCBDGWCYe7f24wo6JRi+XIVQy5eayK8gIxKXOGC8uh
         3IAQ==
X-Forwarded-Encrypted: i=1; AHgh+Ron5BK5MxxY5ceGuQjXvkDwj0bGqK3XOcRl1k6H3NksCiPq+m7RSw84+ck7oPob8R5RstHDGj/LwDeJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwFbroYKa0P8Vd7Wq5YX7PROBN4MObXq/e0gcVz1Nfk/VWJ5wYg
	YUDoyssDk2Kyaz2YxvnwNWQgeuFOo/tdZl393OHBuKgwWOjT0ZQDbhYILu9Iz93S6CsgtrE0u0x
	CWdbnzSt2XAwVRO+Iehaft/IoqreuCS+ThLlslvq8ejNdEJTLOaKCvx0i7WEznrac
X-Gm-Gg: AR+sD105GcSg9IIF5Ng/GPU1F29UXgAosfTP9P5uXputqDHy+DzaM9vdMVUsub/MJEP
	tVGG4nvyGvEAPQ4XYULUqKLiz98MZhijSu/We+WnO2Kc10t/cOR4Vz4T8o780HBxfzkuC5Rjr/Y
	1OjMMKvMUB/Nnh9FT/ypdp48/CJUdO8G42v0xvNHV98CWvm7O6dnQoFI4hBZiFuoL5JwG5Dv0/8
	YzGlVRHp0TLVGtaJw9V9GCqSSOXWblm6lgCvvyhaYt97mHkwYPg/QouQnhU3mTJvxuZKOPGysYm
	H+Id/bsH0PMgNGKfpdk91GLfFhzP8GjSrljz3I/KEtr9IPF3iILH1wP//8jNXQYtFlarDYmnS4s
	W+DphPOssETdJk4fb+5iR5kVsUIZOSSxqPBxWLjQEKu+sDJPLIZ5ib37FBKwzt5k=
X-Received: by 2002:a05:620a:2620:b0:92b:c6cd:7f6c with SMTP id af79cd13be357-936491104c3mr1311811085a.34.1786004786302;
        Thu, 06 Aug 2026 01:26:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2620:b0:92b:c6cd:7f6c with SMTP id af79cd13be357-936491104c3mr1311807885a.34.1786004785935;
        Thu, 06 Aug 2026 01:26:25 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a5662d5sm351902885a.35.2026.08.06.01.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:26:24 -0700 (PDT)
Date: Thu, 6 Aug 2026 16:26:15 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM
 compatibles
Message-ID: <anRFJ8wZ12LxOUzm@YUANJIEY2.ap.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
 <20260805-hamoa-come-v3-v3-1-20463c43eae1@oss.qualcomm.com>
 <20260806-angelic-translucent-shellfish-3307c8@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-angelic-translucent-shellfish-3307c8@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2NCBTYWx0ZWRfXx8EnkFh3cDO4
 rQ6eRSJgVoDtjG6u392mqrm4L9tIo5wpINTa6PwFmx8Vf0Qm7C3UjGvrctsKRbJAGXZluz8ZF8e
 i6HtFApa3chw5yLiTIR7S8eqo31/nkU=
X-Proofpoint-GUID: tIylYR7x9_m0dwPTFP1rujW1b6e2UnjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2NCBTYWx0ZWRfX139xGVjR5CSd
 PLHk4NFbS87j52b5TH1J3s9B/VKBI5HjYbb89vslp1mFtSgeEcR4EadbXVqVFz5TAlKabR8le2O
 xLHfaF/vhROMFeEi7Z5E8vXL5WX2bN//DmLNeN/4rhhcFtoxr6fnwP/chkppRO3esdT9jM3eI9Y
 KLgQ/LrxZBu8LD/nHPlmsC2UfzH/EHfH11bK3U7sGIMk2kL0625i5rIQFVn7tqqmWlX4QEeH7/3
 Y4A4apn5rsbx19dbP2XLHNJwJ8br/ECCtMphWDjT+2BI7vjWmZwH3vjhUQ6zusFIzbbv/4b8cKD
 yLff4r5HgHK4P1kRNyE/gqgPlsviabKHxlRbYJed8kAxtqLp/OIS38YwsipUWiuibpx8jMuT/wP
 wfqjcjqvtZy2bPcNQiLGDr+soXLIXw/KM1/3Zw7sRFeSgkeQ/Tha4ifbsyrSgQrze3BzzV/jJxd
 QdraUcP7YWMeOmBv7ww==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a744532 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=xBnWZG0RdbNwyBiSnqgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tIylYR7x9_m0dwPTFP1rujW1b6e2UnjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060064

On Thu, Aug 06, 2026 at 10:04:23AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 05, 2026 at 06:30:00PM +0800, Yuanjie Yang wrote:
> > The compatible strings for the Hamoa and Purwa IoT SOM platforms do not
> > match the naming used in the official hardware documentation.
> > 
> > The documentation identifies these SOMs using their IQ product names
> > rather than hamoa-iot-som or purwa-iot-som style names. In particular,
> > there are no SOM products documented with the names:
> > 
> >   - hamoa-iot-som
> >   - purwa-iot-som
> > 
> > Update the compatible strings to use the correct SOM names as described
> > in the hardware documentation:
> > 
> >   - hamoa-iot-som -> iq-x7181-evk-som
> >   - purwa-iot-som -> iq-x5121-evk-som
> > 
> > This aligns the DT compatible strings with the official product naming
> > and documentation.
> 
> These are already released, so marketing reasons are not enough to
> change the ABI.

Ok, will drop patch1 and patch2 in next series.

Thanks,
Yuanjue

> Best regards,
> Krzysztof
> 
