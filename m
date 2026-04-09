Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1213BE630
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738478; cv=none; b=V+pF9eEfusE6bh6EiIQbxHleP/t1oIqIcjASjv4LHlP17aAaeV/xdsa37RavgEBarx0ky080izmqfiqBAtfUQaIONdZGWUNAr7aNZA+t6jgLHhHTl5CScY3nQl5kQocXwdiwLOlMtrGf+L2yNS23tU7+Aihx3WrXJDEvRdNY19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738478; c=relaxed/simple;
	bh=jIcG6VH2f3X5MPNz+mmqq26iaNfbbftnboMVLVcU6Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWZEhlXtpz76UgV+DMEyIH4V7AKSZSSS6XWs7CmX8Xyvlb728bZMn+XJ1y4k7bNSIXSzYDl+jUp2iIqIJsih6mwN9kTbcCLK1YrrEb2kdjCh3B336tgPMqW9StxlrIch+l6xHDjXf6Pvkp0Lt2x3Kpo3n1t1Pt0mkGMtzoLYaeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEHu/BVJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agSbRofz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEHu/BVJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agSbRofz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639BvMdH3712758
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 12:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+5arrzvnS3rtZCFNC1+2oTuK6mQoxDzomGnG3jOxXM=; b=mEHu/BVJg+KXny1x
	vPSRoyrKYI5XXWJTlHc/O9kjFj+/Hu0dyjfU1Hnn/tkvEJ3bCOzJ1AS4c2iqiork
	Z7c4Yp99uj47pPtZQJVWt/FAB4VoumofVxyzgUNe29EWZQPJ914iCp1ziVskOKL2
	QD6lWoJ621QS4rL0SAqiljpNY335Z1DlkB+q3UHaKOj5S6f+e/FnMnxPKGDZ94QU
	fcU13AqDxnqxvW+AW2eykVp11cepSzc9Y1sAHT/SaMwuenN+tNoc2FMojBCOU+nT
	bZgLk3kZdYA0N8xyEDjkFF/5WcqqGxox89+FAjgnwr5O5sakONNyMvTA/Ki5Mq44
	6QR7Kw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74c0gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 12:41:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so13170985a.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775738476; x=1776343276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+5arrzvnS3rtZCFNC1+2oTuK6mQoxDzomGnG3jOxXM=;
        b=agSbRofzQBzhalyx4zmqwcqUizqtfu+8dGtapH9Mqno9BYbIEZY7erAVJhRdGT6m74
         7rkhnqbV+y3GrfEz9X7qbDCQc8/SOXyLweZKRqPAqy/mPLqDMHgB9ZChLcbg1vsBePa1
         7gPWBoh12pCcCI+uHVtuNtIK9DxPAkoWieLHyBt9jN2nS8GmouwDZaicAklJ1MJSoI5h
         UJFj9aFFqEZSluwP6SO8KgpSxIgbivole6ujLniXeNCT0i22ohvVR/AMaiBc4LPIzHAH
         /euzSC9RPSNLNL61epmn7764Gi6KmFcIbDNY53iVzJJ6V40mL3/VOb8ATmaXLX4qDAxw
         J28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775738476; x=1776343276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+5arrzvnS3rtZCFNC1+2oTuK6mQoxDzomGnG3jOxXM=;
        b=q2c4RXXntPvdFbdrPlX1sWfKv8tzZqhYZWowmiw9mRmrnat6XZeVCE7/VrfNxewKpR
         DnklI/tnw76JHPTzMuoDAiXpXSCtkd5VXRc1zUxynw56F9PMUcCUDXZDG66TiCusXan9
         pMQbDf78m7T8kZJEcOpnKL6LhzyqkhGjcUzTuVaXzCNxh9XlSpQkZfg0WC/LRx6TY5fm
         cFVpWEoVxWbIgSYrlG3/Atwa2eA9w/fCnyJyk2r43gA7y8yvjHKyINZpVQI/So+uJF+W
         oe89tn6aDAfypC/mkqIlUzVN6Dj9ssPxxdqtG4cf8o0bKOixcnwJBG6tNbnqybU3qpcf
         4A0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjAolXCt3VV+X8mYhKQsukw/AHyLhFeMt7A3+22o2cH2d4FmXG3u/jFFwBcwadKZpferFQ+QHG1IPa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Uwqy2bS0g2xT2GzDRur/CjWCBsz63d3Yb8v/0wO6siI1azLF
	gX6QQrwXf/B2tYPff8z+qPlV0kWoMQEIH+spwNeUKmenk8BX3OgZp/HmXMaX/efunlG6ki+NrRb
	OkVLyZ8PCEtmy4Q3odWgeQvslM/M55u3BlMZO2vVR93PZm0ayMETBX0peFtIueoo/
X-Gm-Gg: AeBDiesEwJ9VTltAQc4SCqPlngoDwmuD45E4quWrTmm/1VnHI5BGMLNpojPuWqKJ6Dw
	bliDhf5r0kmmBa56vpgJ551uc0lgIVUCCiNL55Rjd5/aTTCQaukCfbopceWvZJVn1Lhn3BO1XxJ
	7cmCnFSeuqwj+6WjBwnpkWyAs58nOOfLYpGetIN8GqhOleSNt1POWTwRWPrdNg7zkO6OQ9Fp6QE
	y2Pm6C6rA9HTUxxKCFt00Qu4EV7sjSezaRy+R5L/nbIKD3wydMSjrrTDnT8Sg08gseTdP/s2Asj
	9EO9SeWbQ4D5Qm2AB8i9XIZt8dqg5tcaxWYyCRsKRkCd0FPLQIqQJ6QfXv6y8RHYXx1YRZZjoQ0
	2Dr9PpOduoLT2OCnB7UZNGxoLu+UVDCk6ou09Rqreu7bhk28kV1ldg+R7aMin/i+TWnltFDkkP2
	q8dwg=
X-Received: by 2002:a05:620a:2682:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8dae2489c96mr821420185a.6.1775738476094;
        Thu, 09 Apr 2026 05:41:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8dae2489c96mr821414985a.6.1775738475540;
        Thu, 09 Apr 2026 05:41:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm5705345a12.16.2026.04.09.05.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:41:13 -0700 (PDT)
Message-ID: <80067706-1857-46a0-a281-7f4ff3937468@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:41:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-oneplus: Update compatible
 to include model
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260408-synaptics-rmi4-dt-v1-0-2d32bacce673@ixit.cz>
 <20260408-synaptics-rmi4-dt-v1-2-2d32bacce673@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-synaptics-rmi4-dt-v1-2-2d32bacce673@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d79e6d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hp0kwjZ9wkirG6XhGIUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 61Ny1ORRtUPbrg0m4XwrnXNlFxUUlrpi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDExNSBTYWx0ZWRfXzNzgeutjk9Sw
 9SSxZ8FNYtI1piLXxk2A+FAoq/ooXSUS/GeYFn+D4qGQyhCQdXC+b2OYSrakAREtepS7aJ2EDmg
 xlDL688217C9q8GAdVH/jubTXdVVKGBTbhg9cvrc70g29egW0ovWeZTlvq7EbIZOyjn2f361CAO
 vFj/Xs8VJ1Uq/uN0pRRnyp8n3NcKnYLFQMtyIvzK0VYehYpA0HN3TDgHqg1clqXIW9tnuKL2ukq
 RMO5sX3/y7vcn4Am3aJAmA0MUOSlaw+VIy3yVkZhqx/bwkhGWqf2HuXj4fH6AwGmKUYwZsM4VP+
 Mm/JMl5l5UJnn7HKufY11l9/AVkBlZULkvq6qI6zTCgLrf+OOSSyaB3lY0vxgnrXVEvX3UGMY9D
 TmmYWPMCHO4mF2yFDVSXkimjjsIjGOC2lTetX2INAWLywT1IrxX8Ub0HPKVSHVW5iEiAi3d3Zt6
 ZtDWbCKLjMU3fg4Vt3Q==
X-Proofpoint-GUID: 61Ny1ORRtUPbrg0m4XwrnXNlFxUUlrpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090115

On 4/8/26 7:34 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We know the driver is reporting s3706b, introduce the compatible so we

via Google search AI summary:
"Bon Chef S3706B is a black dinner fork (Roman Euro Dinner Fork)" - the
more you know!

> can more easily introduce quirks for weird touchscreen replacements in
> followup series.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
