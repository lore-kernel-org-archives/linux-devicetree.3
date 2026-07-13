Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6239A058
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929381; cv=none; b=AaBQLYgiBTLJlBEX54Kb48lerp/Vh8GSwPE9e+ywfLt85yr1J+Cr1bbWHTyGakcwvd+L7s6UJKMT5d3dyzZ61v5OUqLsxy+viB5vE2GJVzWu7NEuRQ+JoUpkUE07p/9zzuN++sKOinUuPpI1M9iSpgnZx+rqWisMi1YMraIXfiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929381; c=relaxed/simple;
	bh=klnn4AulREPLGSwO5Wlck9J41piwEK6D0bTi/iwwsyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G36RhQ4HVuJpEZHJSVK8LX3WCNJfWDOuRwGbmYldlhi8NHrBQJ+gVVf3RUZHTG/AiQNFryaxICmXv2r8hvXrHVrzT/TvvFK5sDiL9BX65tH16MWRgWnzug40ppAMOq4AsdKleWPk/D7V2wqzCIH2WahJKoIyPFk/iTfLbG57MoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pwi7cO27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZO5QagQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pwi7cO27";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZO5QagQD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O375732794
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+PFkhQbhjQ87RJz3EDdUVKiA87gvndBXXidhZE1m3U=; b=Pwi7cO27qcAQPaP8
	itiUBkEmL+IviRPR0kolyEDk9Z7MhWWcIzpVj58JycvUCYEGYN5ZYF6f92SbJ8Uq
	e4/lVT1ffHyyqDszWb8R/9dKfJKqS4sicfLEpzruVDEXKhcOigSQ4vXbY01yPhZW
	cXrNHxaWmeAQANqcFKnbjQ0NnWUI/bSr4dvM5g/BzNq1DBTJY5zg2sLj/zm0+Dbe
	ld3Dx1n7UcaqpaRPEpb8DfMcdsC0PxUBcEL7L9eyhq1N+rBKqjq2/7OXwT93h6oN
	xPnVrKubdSs6xC/cAJ7InVaTAAKknJ7KF4tlv+WCLP5DkXYrcIG8KkCaig2VjhF3
	jg8IAA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39gqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:56:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso57755461cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783929379; x=1784534179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+PFkhQbhjQ87RJz3EDdUVKiA87gvndBXXidhZE1m3U=;
        b=ZO5QagQD4j02flQzFgT9Yb5z/1K6ct3P0HY02hiNIVRBt7eNo+J+mIMNvPVszmrJDA
         WZSp0traecLigpu4uIUrw8plV2i3Y5JGDTSKG1sC7q18SH0R5ESb6mRCuZ++lAjD/CsZ
         bG/FEPydHBqvVh6aHTJYH7lbXGNBwd0edWcSJiPmIwBaaw4cje6FMgHmVvgf2g1sU6Pj
         2y5mnrv1LZpdjI+vF00dpVRK7dCngOjvVasb+wR9tmP8YSoh9nCpApicOnmebOSLrtVh
         gYnUB8wWnrxUjysJRg6JOnTlbt49R+c+jJgYeOLVPY7NnHZlLc1NTUpC5+sV54YH3TYa
         kdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929379; x=1784534179;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+PFkhQbhjQ87RJz3EDdUVKiA87gvndBXXidhZE1m3U=;
        b=rZ4MtLebRpYIhaFWqdvbklp4/mftskCLU4gnTyjzR1PYTEAe7BM5/7mNII8xj86oDS
         nIIQciSIzpRo0fjPHQTdHMt2mHyBZ1kyd2Avw7gM36Ova5qj4xI2ofNxvTs0cPik9EEd
         Q8VcF1++a7Ztc7FDUKlZ10BUNDKumX5e2Hk5l5uZaT/iES7pkdWj87dOoL/jY9MIS4BI
         UqWEIri/bG6n99bGUaMTQ0GuLk+UJsI5esCul4Jt2JhSYbwOmD0r2oCUvGjHvGsg67y5
         Pp3tBAapXadn95Ah8gUbS0E0ddycEWPwNSMVz7RFPtkJkxZTbM0/bNpqmweEdCK3C7M7
         +Sag==
X-Forwarded-Encrypted: i=1; AHgh+RocP+KLGXrHTNfpfECNwhRUvk2THq2QlyUmFef26Ha0hYT8ap5gTQX3SQn+vi6U2mTTNzxae78hUbPm@vger.kernel.org
X-Gm-Message-State: AOJu0YxvIZxt/upvULrKPbpX+1Ngwt4k5NitBertLQCEy8ox2hHdE8Zm
	ve80tJ+6bMX+mkw/I0wOVnVGgRoE7thVpMJjQgPhK7TSpiBtQF+ph3nVUs38KDVQ8vAZ7/N1hSg
	HJvTO88tzCmp0VrRIzuhS4Q5D3Rq6bKGqBaCNROJoY8Aig+QOuWrsHJ72Zj0SEp8p
X-Gm-Gg: AfdE7cl6geWeKzuwduzgynx/p0mtYlKjdz3xMDQMny+eLgWrR7q1l5a1xcKMcvq+F3G
	7hg/r/UNPsYUIRliuXsmZc13oscUF7yz/FIWad1/F3AqgAGS6F4gRLCBYNKl6K+TA0BJAjEzoC8
	ZGmZFIZR72EzwMd43GA5CT1Pdicsq/B6U7g9kl0fdf+1NGUsuacwwjJoyMnCiF9Fk4PCAQipuwR
	Nn7MQZ2rBAwS/RlG5bAOPdfvdk6iYl1hwVzu0r0Mf4rOI+3NA6qfBY9rLjvl8uiI6trDzqM/O5t
	p4RRYM++59fFgAQDVUyFADkbpiPz31QaUD3KmIMwxdZybAwfD0cTLU+zopU6+lfWeOCkza2Q/XM
	Daob1KtfdzIX6b5vp75klyUzTY9ubywamtN8mNAVG
X-Received: by 2002:a05:622a:d1:b0:51c:ee7:c355 with SMTP id d75a77b69052e-51cbf2c12f5mr78769931cf.68.1783929378877;
        Mon, 13 Jul 2026 00:56:18 -0700 (PDT)
X-Received: by 2002:a05:622a:d1:b0:51c:ee7:c355 with SMTP id d75a77b69052e-51cbf2c12f5mr78769851cf.68.1783929378539;
        Mon, 13 Jul 2026 00:56:18 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm82823935f8f.20.2026.07.13.00.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:56:17 -0700 (PDT)
Message-ID: <aeadaf73-692e-4d31-9a3a-ec6b4db9ea96@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 09:56:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
 <20260713-rproc-v13-2-41011cbcda3e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260713-rproc-v13-2-41011cbcda3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4MSBTYWx0ZWRfX0rZpllVD7RKr
 JdkzdqBvOxijt0HZ1Bk+4zM2LBJQM0LFPrA4V/6u/98Wd74yN4SCcZotSdZ8Z6s+rm+JZrjXotx
 6s9iu3lSEyr2FycgqtJA936/EE6pe5GyE1FmIuIaZiYLbk6iwX7ugEX0TzEqwiVqUoJHIP4q8Uo
 3SEIrpq4TdJ5Mp3xOkeK2AMaOOkTnv7s0mtI3zzxiVZEo0LRVcc640qjj2764xNkqFqsf2m9wsp
 ANUv7nPFY5UMbJOWFDOP6PYuocxygJg07AjAaZ644/BX1BQMF/PvmpL3OuvP00uAy+l6ex98Vip
 6N53fq9R57rLil9dEUjzCODAmGtto1E5eesGdlUid31Ji0esU5Mfzy16jtKaxOy1Q4mUCAwqOLT
 Ig8Mlfh4Ddo5mhZ1q5B9gZgLEk/Uo7xx1CQYpX6QtNgCZS90o77M1NXh+MzaUUeZaFxH59GANhz
 /rbaqimYZCP1i+1f55w==
X-Proofpoint-ORIG-GUID: tbGJWAjkidi_qsAr2UV7nOQINIM15B1n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4MSBTYWx0ZWRfX5x1HhT9PZwwM
 pgRNnyRU5PcQTODScd0wdNBxcp0s+xb+ayatvE98qMDBsXK0prG5PY0isIvLVXEKixs2jfg730B
 H6BrFdXwySlI0NaotMmkR8S4kHyW6PI=
X-Proofpoint-GUID: tbGJWAjkidi_qsAr2UV7nOQINIM15B1n
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a549a23 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=G97aMpG5GzAg4TnEwcsA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130081

On 13/07/2026 08:32, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> 
> Add new binding document for hexagon based WCSS secure PIL remoteproc.
> IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.
> 
> Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Dropped ipq5424 support ]
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

How did this appear here at v13? That's a v13 so all your tags are
expected to be given in public.

There is no such tag:
https://lore.kernel.org/linux-arm-msm/4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com/

Not mentioning that YOU CANNOT test bindings in a meaning of tested-by.


Best regards,
Krzysztof
