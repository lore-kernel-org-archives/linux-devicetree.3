Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B25847D95E
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994999; cv=none; b=C58RB37jeUOS3TXuSR4MZgFSpj9Y8OrMmFgs7rGlxSMiwR+kcaA05VwiAVGAqBQtOn9mNKeZ2g821CPEzbrXvLF/E1OvxzqdBLyS8VtDvB7oqeEfSryIeRrADds6BqEbiEhUGiUWpxr9lfxQThd1hctBVaaHZ4M1hARRm4qz7fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994999; c=relaxed/simple;
	bh=saOYySi17G8WfVNXpXK5Fq1yaGVSJ/vCXyaSR4hV5T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtYbWv8cRTFvJTY8RdRuBQbCBZsxx33JVMvi+ZUnUWPmk231NQcTSZFQiwlSnEbCSgVnlsgQNseBymYtVloXh6cM3qRvojS2WYZzfmpdnqGfcWuDA6SjQunME1Bs/hv2A/HmAYOGjfPB5O8x48/730AvTHuxjU97V5P4GxRkLzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4DFLHXV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e31IKTis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4DFLHXV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e31IKTis"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629Ko3V4116930
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3yAMBOi6v9eV+nAc7eVAGvVNWiyX5n7k7tofn0XxxI=; b=I4DFLHXVXlt0GoIW
	dfrRzLqyw6s67krAgqYSt6uR+IDOUqir3lJqb8cjfvc+WfrR06mPcdrVYhASsGpX
	LDWlAIsxrv6nUMWL7UFHqiKKddhfMNNcBJBnT2vbhL1lO1bmKk4ToK3uezaJLgfb
	vL/DWrGi/mTNnY+cPoI8dtbXSokmFzVNVuswHkJ25BRq2wpCA7pwiPvVjqAzsNuX
	FMcUjrXlY84iazu1GnGFSWFmCuDzcq4Psx1TfYpo+zOw7aAYkS173PQq47+nZpsb
	A+bVUvqbOno3MHvb6oI6bCLcJHH5JYvBxquO0tf15x74MISA0/9SUv10GZob+np+
	n23xWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bgp2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:23:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2d2dd52eso1535471cf.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994996; x=1783599796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3yAMBOi6v9eV+nAc7eVAGvVNWiyX5n7k7tofn0XxxI=;
        b=e31IKTis+pyR0Uv+MnSLJ+Tezc3zIYrf6QuUMUxm1jCReG5senjIARjdc4vXbHJMjg
         ivE0r0HLFxIyA/2frK6a0KyTZQ6mfluCvf/VgjsZ9m0DMNVs+px0hov6aYvarN9J3rsf
         rY9+am5JD83ya0fY9Whg8IAsIgS3RMgneFQmEhFwwiXXJxHcRFcgSCI8ybN1doo7NRQO
         C2CJ8apv/gQ/SXWRpZ9u69NnKmjmtc2dQUgg0kN6coqAEJn5bamqn1ZzSIVrmv5YvaCL
         zO+NNwxJuPRSnrPKzPrZPc9nzvQtuLmHzitnpOjCsOTuiDm8wHCrjx/GTAiMKcq/PGyi
         EWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994996; x=1783599796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3yAMBOi6v9eV+nAc7eVAGvVNWiyX5n7k7tofn0XxxI=;
        b=aXlOCgyMl6LHLXwUXPa/ldWKWCTgVeOHoUUntFhM9Vyx74kzcriVy16ZXoPrKQX0CX
         jqCY7lB0BRIpOmKzzLb0OclCs3W61BxM77dbsOmXRIDw6nvbAt4P9SYPZ9Bm9QCXWOUg
         w6PE/O/a/a4+h7a2KIoAkxhuQ+/MAc7veZppNVWDLJWrZZ1ZSR6kxjFtwvK8DW2CUrGw
         MfMvteR9k6AkwJn9rt/AYmk75atcx4tvMOHXEtZB6iYJLwPJ6zSeWI4PO2jzh/Ru9eTk
         AjXVvgj9RLONOsDcyWCkA4X3Nbc0BpiDCi82JdHPsI0Dwx9w/fOrheJDq5bEqvh7HiDW
         bjFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZaGCoIfG5zMYB73DVpFA/iEddKU6nGP6fVOQm58OuyXWwKF6ldwk0xX8tsPCph+i6FoaT9YKo6wKK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0jfeuvXAsYAckQ1uncF/4XLrMej1tTLHZ8XoDWoQV/zCN4zp4
	9sq5kz67H4a+evxoYRXE0mVFJcGWk7hs6na4P7Efn2LF+OJRzqwEmJOd1t7wB1tBHtPv29ObTPC
	IjLLEwxAmYz693VPTFwo9Rbnrs7wFQvooUuCWGOSeFdNas7CBW83HnlCprr3C69xI
X-Gm-Gg: AfdE7cm/iw/7tNFlWMAqSHyWOIFYjzrM2H3yme3s5v/I7owOO44CMAHHEHnmnxB04CD
	rqbePVbpGan5FXKIIouwakOTUfjS0IZSy99dku3PBqsoj9wmw/wKQMA5WeGuuBY9D7CcyGrGeTg
	lP9PbE7az8w00TNsV76bpzeLK6DC1l4c2SjbX85yllNL0C+ULBfPpCrlY6qhxDbCqpLGZ2EsjWQ
	WTtYONhJv46GzV1oQonacE370+MbQFH29HYdLuiO0rmSwLA2PV1bhr5hfnGgwuRBUlfz37B+iPP
	ZxcH+JUboaNPf9KZF8DQ8IbHE7G/AAeyqZilPDJD9nnaKW8wjNzdHx/GMiy1MceD6VgMr86We1Z
	/5P7BdtOR8/ZVqXVeI84e7MSwDiM4gL50CzQ=
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr46801111cf.8.1782994996260;
        Thu, 02 Jul 2026 05:23:16 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr46800541cf.8.1782994995674;
        Thu, 02 Jul 2026 05:23:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60545dcsm122833966b.3.2026.07.02.05.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:23:14 -0700 (PDT)
Message-ID: <a2e5d6bf-e2d7-4252-8e91-1355c481d35a@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:23:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/14] media: qcom: Pass proper PAS ID to
 set_remote_state API
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-11-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-11-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s9jXnAT2F_My_Ahz_wSQBX0iz0BK-MjT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMCBTYWx0ZWRfX7Q11N42PdMZF
 IcASGQ34ww4u2rw++JklmlBjasJPiOY55Qx3TtMjbi6/4XgiKJ5HnbMM6y8E8sUkkcyf5aPipeI
 aitVRy4h0KBOupJJHUxzBrtSuJLp+nk=
X-Proofpoint-GUID: s9jXnAT2F_My_Ahz_wSQBX0iz0BK-MjT
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a465835 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=d_vIauj3UwZ4nLxAXMoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMCBTYWx0ZWRfXx6jO/ZoQeBUS
 1rYKOEqt9Q+tbrOF9uWiRf1tdqHRziNdxXcEH/SOGzX1OkvAEm8AcEwUU1AK6RzmONrIKZAHe/E
 1MhtTL17yFqlGDifCaMpzzC8J8e3QuX8FHjyaduTUWo9TFu2kSt1s16oX1Lby1ri9kM9TzCn3MO
 UxoQGdRqQp80NFpdAlTZCgWJusus56iQMZfrYtrIg+leNfv9TYrxTk3Wi8f0kEbMdDEkluB8BXn
 BUAHCObRVC+PRvrs11mNLlsUzmFpQvVo9i4DdcvMKJbm2ZeZ4KgG3riqBLAr2ZTpzOsnQsM6js3
 n2JTZOYDNXdiRmGwm9TEFQJNNZqXJF90IWYiBv5g/fXDB1PJMpI4kITRNGlpSB2ZO5YQQnpr0NA
 Y15U2UVdYQaEBFG6KG1uX1bTV10C5s3TaqH49ZIz1RXPiuMGsajYQ7aGd2ZDBf++7rG19z0LfEH
 JXV5p+r5qXR6xaxuqtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020130

On 7/2/26 1:58 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.

It's apparently not ignored, but 0 is assumed to mean video for
historical reasons

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
