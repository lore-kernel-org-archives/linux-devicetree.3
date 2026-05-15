Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363833FE363
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847144; cv=none; b=mFJTKsr0sKzS5w62GsGRkP8Dr7Gnvp3lTfBp8/qHYLeBGpX3kyWl7KQ0gycujWsbvTXcy/N+vBaYR/TEwiAe1weblGN2n623SqQ8IksiSyrKR8xhUtbSZWWaacqjpRSB4CMXjasJDV8DHKy5CSkioS8WmkgVD5+UvFidmsSvX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847144; c=relaxed/simple;
	bh=Ka3qm8iBE8n8zjZnG+YFbup1oVW5hThp/IzT8vNc3vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVkUs/Fhga9EjYD4QHkjWDa98xgo2OticdEgAsG+P4++P7oKUmR+FaAr/r4SbaDcNkNbXmDaBCrC8sH3ybupWpGR3abQmQtxkxODWVYcyzxzHN292eNmn9ykubtRGLX6jJwHRLxgWqQwfLTz06rtmBTX43rMwaZDPbRsg7rLiKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3e5JxII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eaypbQj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3e5JxII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eaypbQj3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBFvm2654865
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=; b=B3e5JxII3qlc+mbV
	iDmDtSmXezgny0Jg3dyc74B6ICWqVk0iyyOTha7tl+tWOj2dvZLFlVPXcrxl/E5y
	N+UlCwhmOqJOJMtu9238g8MTuPA7KjW+Kr154C6rTJdFQK2g5zxonNXH14d+eGVy
	LBimhj9sZkfm9NXndRTQTDgO+/MNMRldPXfkhNmQiBlL29lDK+DFEYzIalspp/41
	0P0H2T/A3i/6vnyt+pYDApQV0xXbJyKaBnZBH5QGeF+IHOXGynuZe8RhXFhKethg
	l+PX7jn2nZpeUEech5ow8rx8b4uelrbUeGebGe2ONr+l71wtrpraSAAMQjygcnN0
	AnMyRQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu7sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:12:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-631bec27874so428629137.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847141; x=1779451941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=;
        b=eaypbQj3nFCQNOl9bY+gXDCyu1Lb+ZF9dpsGEYAug9g6MUvOEXMHddVN84ejgWikHX
         XHTQ9U9/gRm1AGBef3pMZe5qKAIXvl203bVwcGvWH4vC0NBBsxzfq9nB7x43XyXFj9Dp
         Gs633Qj//HHKwJ6ftYLBL6QFp4rjBDAs6pD6OcHQelHToSqODAvZXa/tE9lmGG1bSKQ2
         WTViyiCpOg4hVxJC3Qcr6emKAFiSz5DBCmUc9nuc2YENMJsNkeWQXn6rPVt+gK1aWqxw
         ltcsIciQfGGoWu3XaFBTsbx1Ja4R0nlkc9ehSo0QZJi4eHQzZnmp4Uj3yyGLsBawaojF
         kuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847141; x=1779451941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=;
        b=Tw0XwGpq4RuJF/ifLIMS2n09LesrDsjcVhVQ6czETBBSvA0NEzZcH7jNBd/In5qja8
         tREEGQONO8RPptTAbGlQrEdQQyDx6sGqgjSFJVIAxR+tTft8D1uNBxOKo9SILuftkFAA
         ywhmvr5QHNXIBvx2sQxi5mhhFOrzSzX9FAtkyGs2mLTIh4xD91xrWCALhij4OCAZXnsZ
         gm2EB2D8Vqn3qHH0VKCRL5efR9j6JUOTHRzWHMyjJcYGrUdsJg76P2kAljKoA30A7wrm
         CEyfi4sv7uWe+vjxxvb3pOUKjlMXLwMpCDHi8qrOzo7JHagoqkhz69OqJxKKQs2Ujl02
         SYUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MEJdqWoL5aTu/pr6BdS5yVgRwdpfM+pEEh9q8k8BVKdfurTbmq/ckep9pvppsR/O4cvN2CJj8C17O@vger.kernel.org
X-Gm-Message-State: AOJu0YzXCjic8vfMJz570i3G6Yh6mO8FnTWtWKs4Zxx/GWpLccGrnrFV
	0zuP3Q4aTQPqVLucHH1pG4L+rFe+7J/1yyccMGJfh9heAQh9ZrTsgmN8aqu8LcBIPn8EsMkTKgj
	0oM+nV8I2UFp0nzFm3qRuwqAc6OUnps5MZEv/9LX0YQYF0+QE0ujAVHx9DZkSAbI+
X-Gm-Gg: Acq92OEIh514bAHUepio6EfXlrbH25OIRRaAItEPpaqnXtTojBS82OK7hHEe2aNE7ip
	Wn89mcyw/GUyabyQpu5JoulBNsTL1OrnZJle/Mi09DQnQYIR3QukvcDNVSfp2URCueWIextyXIN
	8Jo191YxsxBHo0jDCkVPFLroznUqinbxqSo/1CV9QFtdxmA9hZJjeEkbUG6xFmYzHjvMBmQ1EXQ
	sTyaXX8qO/sMTFmoi+sFFlTnJeuGPnjaJ5M36LTfZhwcCEHm+qVyrGFj0+cu4IRusc+edP6KgQU
	IRlsj4Z/UWOmZwc6rZGFy6ncz3qAMMrlhcOKqj63KVpg5YPxFEk+v6Lypniz3sdEde3xnRUOL+U
	czS3X9EE/le0mIOPKJSZoCAo6Yg0rRtEXMZ9nnCAMtk1vrlxcFydaZLn/nTVJB7MYZwLP6SHJmR
	KjgfQ=
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr582275e0c.0.1778847141533;
        Fri, 15 May 2026 05:12:21 -0700 (PDT)
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr582252e0c.0.1778847141135;
        Fri, 15 May 2026 05:12:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c631e2sm214670766b.28.2026.05.15.05.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:12:20 -0700 (PDT)
Message-ID: <34f80a3a-1b8c-4c2e-8773-c0169518df60@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:12:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y9MUpe9O0n7mUWwzdwuHfKMUWU2JCdY7
X-Proofpoint-ORIG-GUID: Y9MUpe9O0n7mUWwzdwuHfKMUWU2JCdY7
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a070da6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX+s/6EjSyqI52
 a7M412s4JRXqewTtBjVk48PoLxU+HDTl60VxGj2sMD7CWiXPpkuGuTMEluKDh0ZvN358PZ6XTWw
 sh8begZaaCc7iR3w/RR/cghrYsB7tYZy765cu2Gj4Zx9DNuoOyq2i6pyHqqWTF9J4fpFA7Qwtod
 Up16vQaSGaIyd7MZFlXRCq9FvKsPGVZAw9WQ0iyObJQfSuk1HEUx4VrVP5G4TFQfLN0NhKXXICG
 q46P6mV4u4FpYfq0LKOBaoEorHERQ4KxPiJzXuofWgvXqPoaOyYSYcc2Xcr5sOldja0gEGahoHx
 aAprVhQyYnk3cQfdAPdQ4pjS90BcWoeTjqb9jRavEkBSXYL9ObinBboU3u1Ov12QuejD51ZaBfq
 RovmsUk/3paQUq4lfzeADAfQgrTkIkFAKLe8zZVbwoMiItFr6Ctqs5lH7bmApfHtvRWIIlqRxB9
 8WQtU4E61nEwyfcKdQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
