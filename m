Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A523B95F9
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149482; cv=none; b=Pg2h+ySOhECBAFpZs2u/xSNj3gwiTAOJapma63Pw01DaIYKYWt9inP17FGgWyXfNsQrEEj7g1pHh11pckb8WTfM8I8Ly4bjwZKOvjQ9VQJAo9uPqMz/dgZHC7jhBmeAuixMScM3Z+TjCQz3h1HoY6ew3k/M39ckOf2jLLPntH/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149482; c=relaxed/simple;
	bh=by5hsC14pplzTKqn0dF8kWhEyEi5Si/jDZEGyYEFLl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ub/9x5R9G/LRGPTh5xKa6i1g9mOVEusDfrNnDUQxpa6BIwghOzX1tpTwZbUXvL27SXdAHrawsdgCBXtJjoirNe8mcRvM+eOB7mGGQbC9jsoXxk7WBmCvahXM1h1CdRrk3WrvTSW+3IIqmwY1A219gUGSp/Ywh/WKplFewhN2rJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkixAGCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fISaT/Vq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkixAGCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fISaT/Vq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEJYcg027675
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtsOjETQ5Ny0zIYiYUrPBSIvRAKOEzvAcJAprxh8wuI=; b=OkixAGCvtWDZsSVv
	OHu1Blv7QCIrnq2cVAEE4iQONA6hjGqziCF637Js8LcGjWC8g7NLTKoJgNWeSiLb
	W02AyW6jtU7oqB9Vnwv8PUoHcXxpjGUkmO4Rzu7itwDpKZp2GgpE7WOlLNE2ZXY1
	n3JY+O6KNnS1jjG2G5oLJdDprHoQ8ho1JOsg2P8LFfW45z+WnrtPoOSDB8Lsby5z
	EcJfc3Wub+ujHj8gGSfjkwDGp/JjsGtgFI3sXPwB57F10bH7mX3yy2fVxq1sCq5I
	BebyfaPJvTz6G6TVTfPNBxDgxulaxCXSPVPPNo8+PXvWzHkOLW2BiLQcB6MbkQn1
	TBaBCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d00sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:24:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so24362485a.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787149479; x=1787754279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtsOjETQ5Ny0zIYiYUrPBSIvRAKOEzvAcJAprxh8wuI=;
        b=fISaT/Vq92jhqLNx1EiIF78Xm+7vNvhZUUUtflDxJRn9jXUzTMu46cyIhvivmYnFfD
         aKkt5OMN15gVXTbS9H2O1qYpNG6M+2h+pbtisKqmZODhZbosEGFcA1P4CNNApdLu4a33
         50Aqbb5bXvBXkF77G2ozWNMuermOZp/JyKfMrzoUIZABsfgGAIPR9qrkkKZ4jdYEnFDh
         2miVmO7yTytlHVzKJdcALJCqEzjS1XIAI5+91ka6EeipA2850Y/9pzMYAregDC0OrLMw
         ZWflX97E+s0BHIuwK4AsmDYtOszxUOvbB0o1v/3n95H2MOH9fcQrF2htkW40SyA+InQs
         kYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149479; x=1787754279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtsOjETQ5Ny0zIYiYUrPBSIvRAKOEzvAcJAprxh8wuI=;
        b=j7NTH/m4plGUBtSuUC2CmOw9WAP2/b6+IXfT+RT0g8yHWbq4ofnbHLK+tfLRnr+ZF8
         Yd9hTyDSpEHnZ2+gHNr4RnCilKAbDaErrFolxRZQeXs2bDsaBG6c+W1QpO3Ef+gjzwv6
         9lzZL4DfwhNMuzEhFaydt5gNjKDsgEj7zHLPsMvz9qtTOfNQYwgTqPkcx894IZoHlqif
         AfGJr2M4LBH6/XhQ4M6eW2B7mtFInCTBAIlYVRB+Z/o+B1j+sONlqX8A0VOokC8yGnsz
         F3rqgm5jgYypiCdRdi0CbxNirS5ChSNT3QIEhzS36VKU2JyceajJVs49I/pidtQ7jlwZ
         nVWQ==
X-Forwarded-Encrypted: i=1; AHgh+RojpyVNJEka3TAog2wSUODl26yF2zgj07HhLZUSHz+s1V3MGVtQaC6V4mw/w8UY+DAeQedHQTIeDTBh@vger.kernel.org
X-Gm-Message-State: AOJu0YxR6ikTcgT/jDwoyD/n2XI+HYci4IRRYrcYz2UxntKatLashgmA
	MsQgLQwSwJIfHMrqLtvAqmfG1nYlf2lzefbn7ZqgGtFlDeaP/mZBwJKgzbpsdov2AtNzMr2+BTo
	koo52EbTgIfazncmNkx8s1i6MmnkLjMAPBieKLI5/wj6tBLlykxyLI970ye74AGuH
X-Gm-Gg: AR+sD12DFQD5Z2UAq8pyqFnValTDIBW1+kAEVcV2kKw3YoVnT1WKimxVS7Oc8/T4JQt
	HFYU71xsfrHzk8M4JxnCGtDvKU5b5IDqBmpBDr7lbqxE3C0evwn2EPHiyGlMWo6npzVOe7vyI3M
	rWRBe20z8+c2So991xU7Dm6XnmOVeDkOa22VSNd8CYPSPKKweepgPL7hX6OD4m2VW2akO7W6xEv
	Kmc8cbUx1S+apEZ0FajoTv61BNqe5y3jGu/2eSEZ/9yy9j9Rsw9G9rRyJ/I5KQ1LTTpPDld5UJ+
	pVT9Y0YdU0KHHeDqglX3fv0TX36gJdq2Y/VRcnjlMqXETUAwyA+w6Ms+3sRAR07uwccRA3FKHtT
	sTXbyw+Q5qwffuGUE7SwezzbU
X-Received: by 2002:a05:620a:278c:b0:936:6e2f:a34d with SMTP id af79cd13be357-9371e6bcc32mr337088085a.3.1787149479313;
        Wed, 19 Aug 2026 07:24:39 -0700 (PDT)
X-Received: by 2002:a05:620a:278c:b0:936:6e2f:a34d with SMTP id af79cd13be357-9371e6bcc32mr337083485a.3.1787149478778;
        Wed, 19 Aug 2026 07:24:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b47885b280sm579454e87.30.2026.08.19.07.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:24:37 -0700 (PDT)
Message-ID: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:24:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <c547f8c1-7a49-4cdf-b1d9-22f00c6035de@oss.qualcomm.com>
 <20260729023654.3840494-1-wei.deng@oss.qualcomm.com>
 <20260819141353.96467-1-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819141353.96467-1-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExMSBTYWx0ZWRfXy3P9oYcxR2Cm
 gOlrunioeNI0pOzBSQu0YGcvv+3N05fwJA94fsnmFRoEuv8Jud27IWUWBlM3sEdMejeOY9H5HXh
 1PvQWZlsv5X9WauZvelmjl00lvFUgmqrc+u6bwUDZzxeN24BllnVuUq07iIM3/DjrCR3TsMNXCy
 HVPlkVbZBKK93SsFan8wXWNUtWUN9xi2NqxV/+9jr9eOb5YwgzgxYRGzE07rx9jyJ16ZBP+Q+tt
 wbP7UmVdmIDuKx4eQ7Ga2YA9txQph45NpZcSxS6pmuQM6bNgm48QLtB8cchRUVJtTFWub8nunB8
 YScSd0mKdD3C3eY8ATNEVay6Bwga9mXQClRjA7ukax74IeiS0q8lCyrEcId14VdXnaF2z2m7Obm
 clm45jCrpCWXu4m8KRbPrzOKWI8is4gnQwFTPIUAwLqLoms1byoCS7ZC0Oq72XJr4tVutDUsnEf
 0jbTsbHf+EeOjitHGQQ==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a85bca8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ya91ShjpW29wvZP1Js8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: RbLZkk6s0IlCVN30TUKRH5CZO2qdg7I8
X-Proofpoint-GUID: RbLZkk6s0IlCVN30TUKRH5CZO2qdg7I8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExMSBTYWx0ZWRfX7MU+EfXhhWHx
 cWxeZ92avrQ5CK55Np7ZBXz1f036dfj2hL+eB4qQjKL7qRP+JRAA6ASb84a7GYNvPRPORvuqTfG
 0aYqiLQuvXy7sBBLBOjRKaYogP6zeJI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190111

On 8/19/26 4:13 PM, Wei Deng wrote:
> On Wed, 29 Jul 2026 08:06:54 +0530, Wei Deng wrote:
>> Fair point. I will move the port/endpoint anchors to monaco.dtsi in v2.
> 
> After testing v2 on qcs8300-ride-sx, BT init broke. qcs8300-ride-sx has a
> soldered WCN6855 and no M.2 Key E connector, but the pending series [1]
> uses of_graph_is_present() to detect whether an M.2 connector is present.
> Since of_graph_is_present() only checks for a 'port' child node, the empty
> anchors in monaco.dtsi caused hci_qca to incorrectly enter the M.2 pwrseq
> path on all monaco boards.
> 
> v3 moves the port/endpoint nodes back to monaco-evk.dts. Please review.
> 
> [1] https://lore.kernel.org/all/20260720-monza-wireless-v5-1-69ec6743543c@oss.qualcomm.com/

The series should test of_graph_get_remote_endpoint() instead

Konrad
