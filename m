Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712AB2DA76C
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859069; cv=none; b=Yw+WuAiRgtHHc+Js/dEdOv0klGo5aycfWTc1em7ZUhXkBwTcHF5WmBwjojLcrUzcp4RbLEoERRrMK6WBEIkH424bvlD84sKK8EHdIdStpLE3hZI+kKQwLn9VT0ICU1INIUP+PjF7CVqSmLG43rTAKpCKP2jKo8kbsoQDFeVErL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859069; c=relaxed/simple;
	bh=WZcQ8IgTTdxHEZHy1H9LTjWO/tGD8l+pU04Q2AgAltQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N51/wYrW8KKMmzraMfCVGoMgcTPPqNWiZvgRpvUZO81KVzdizfNcxwBtmwrIH/NYoL0/C1VJZ5xClwqYTvduIuhpoZajZfD2xENw2zyLlJHZpgrce/Q957ixXPTkqpW1LaVchWqB+ocd4xS8vn4SvGmjVBafnx7L5+JAMUa+D28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PU2hWyNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnPLJRk5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PU2hWyNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XnPLJRk5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MALXlh976182
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PC10pDiG1jjcR+0K11CaN8ksV7qOmFzw+8AOZycWy5Q=; b=PU2hWyNymFdimF+n
	dpLanGER9FI6kB6O7SXldCo29r3O0JZYCRDWVquVcE04dq263BIHoSjkCPd2SQH8
	/ViuIbUoH50JPwL2ogQTQm+Quzgmm0bOYFWov2o9GVv2r3omD3Xncq75vBqjtpPM
	a2yRaQcQ9PmQtgNZAWawiRU/WNlEr4yQIi0qiIEolt2ACbmWNzWlnXSuEsZp9qp1
	b6R63JIjk4Dv7oyZ9yOlBPZ2+S6byirv7bl37mRjiy1KTYKjA9PCg3oGMsT7/qF1
	1F66oJigp6pz6Os3E4xXq8VNisFTuegX7SmTwWSotb4wu2o8MUi20J/qrmmMS2+s
	YgGA9g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenebajb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:57:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb0b93e90so7317001cf.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776859066; x=1777463866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PC10pDiG1jjcR+0K11CaN8ksV7qOmFzw+8AOZycWy5Q=;
        b=XnPLJRk5B0iBA8iaAfQSeZ6zT/BUy8seuzbRM5sZQ7jnaqq4V5GwHP32KAlRHPdnZY
         vtAu4p249mQPUi0j24LycuPnORnOjzGv8sA+/icFiZdMNufC89uAi+rX4l5jwdcq53Z1
         7X97yQrS5DuPwJ30hB3+TzpFTDK4DG7kdvR8moFpwsn4N/QFoFATVjq1BvGISKrnXyVi
         Cg1Nxl/6wdiAFStouQfCrwxVrMFOaORsMXIiCysgMDkoKes527tfE6eeaNU56Wk9RLn2
         Acj3xexFugHYWK25yePl6cA8tfJwJzLvlfvBWFnGImBxfZ8Pqu7yC4khaS95Sjp/BFke
         Wgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859066; x=1777463866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PC10pDiG1jjcR+0K11CaN8ksV7qOmFzw+8AOZycWy5Q=;
        b=kKv/U/uK8qXd333qbmHqb2pmxt7eEP/vCIfXGlz2P3+zlmGvc6q2A143t0DrdxMKAz
         ItV1ImP2rslemqCoZzg/v9mqqIxJw5Augq7Q9Z/nt/rLeku+A5w6ohCyf/HLliwPAMc1
         8RuF3xv2W7r7vtVD8H/pjJKohwfW5LrRfIjwvSvgly5LiVJWVC0PGJpnVDLuPjYIL/Ab
         UF49mYZXzIgiIslOJHcD8LAyO9ooPgxSRqFJPYdPgNFhstJIbYiTfBmcCMGP2ikKjdmE
         1wIalKj1ZOodGUnTpFDjBU5hL7Fff8p8WxbeDHP/LnlVhXFSy2S8PZ4yswDBAyTfPDff
         MHtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rMhG77FKQ8bwhrFhzFji9tctLzQE0gUfx9pdHAeSA8Vek7D1skKPSehJtSsh0qYdu46USZGMOsU4L@vger.kernel.org
X-Gm-Message-State: AOJu0YzwBIsIe3Iuzd4LLxSb/QifazTERtExl9+x80R+0V/l11R86SEF
	dDjSysNxrnznTJRJyNHlr6XAO4CZtOIEt78mad5NjkoAXgc5PFf8cvazoG811B6dZup0kodaO4W
	kb47N1R68fSpPo0ewJpT3zmNKW+zAbLaoN4giY6/Rjd1yQ0ZsL5mQW5wT33isErgn
X-Gm-Gg: AeBDies0167XsgbTojs1561Gl/avO3J6HVAg/h9bh1xy8XL65hVmEb35cG4WntOJsuF
	oIfXohbh26X4Ak9QhnxR1EvlQ0NxIlxokseeBKmm3MhkCWoMzTqUtnA0+QXqeJRlcX87zZJ8mRu
	IlDVr2hCD6Ra156VLhSFo9wi3jlxkYoJAZuJNKtKeJj0f8GliSqktdFyNctrPMWmNHmO4hjWTXD
	cbp74C5GQHn7XLkJJFChHTph34l0QuxFbjEyoYArk+0JR4JYJ4JelzxNf5q9isebuP9PWZWCNnG
	8M0+eF1GnhKY1U4yX85CLxIZdgxmVTAuFxGsX+VlE/4Pj+bAdi1T/Y04vCXEBLgyzrVv2ExGpmB
	IakIsQOKXTvFe6qWh3+j/6JHhu0ZEl7qMg09KeEPZu6Q4cCRzaZMIpVvhLKUiNfeCMMeTKpzymD
	CtpfnTzoAYNtJv3g==
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr222103331cf.0.1776859065790;
        Wed, 22 Apr 2026 04:57:45 -0700 (PDT)
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr222103061cf.0.1776859065311;
        Wed, 22 Apr 2026 04:57:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm546618566b.6.2026.04.22.04.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:57:44 -0700 (PDT)
Message-ID: <f578fb1a-5087-442a-845c-db07ce3a9931@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:57:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add interconnect provider driver
 for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
 <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExNSBTYWx0ZWRfXyilVar4QQ9Ml
 QfnqNRBzdeegrOqm9/j7WSdm135PVctja1JOeCddi5pMKGdPpRHvQrk05DFrZh/+gJ6MKN3lOqF
 j/O78xuBTgGZmNJ2OOp4Px3hyBUIOZrYU5w93YPEC0Llj/knXjq+K4rkHaiOUhruVOAYHWHPOw+
 s0zLx4/bpfQRlzkBwDvcBWjvy580DMEaXT216nXmBFPTCvUsvwtNuzRq52D5oc9C/aLNKrpx+wo
 IGPGzUGNUKX5QzguTF8hhyxNG8TeUMZngXsN4UC6yB7EEkRdz0MnKDK2Fs5BtI8H8bHvb3uGKbP
 O8zNClujacpKfslZ1B8zSAgXmPghlyrPmt5hdWK6K53KgcDFHwV8yNwJzav+F+epx5oFeiAjYsd
 X8GH+Azz4CUXGt4GvRDVHadHA/ai3rARHsfUD+tBIClbOdi4+oAuIkG3bTfpxUgIsO1LhMYUtYN
 sNbznOXFTsE94X6XJTQ==
X-Proofpoint-GUID: PwWLC3tKfpPGBikRxDpIvdWVQKRnkDK6
X-Proofpoint-ORIG-GUID: PwWLC3tKfpPGBikRxDpIvdWVQKRnkDK6
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8b7ba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=miiGjHqzieJubTSf79EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220115

On 4/20/26 4:13 AM, Shawn Guo wrote:
> From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> 
> Add driver for the Qualcomm interconnect buses found on Nord SoC.
> The topology consists of several NoCs that are controlled by
> a remote processor that collects the aggregated bandwidth for each
> master-slave pair.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
