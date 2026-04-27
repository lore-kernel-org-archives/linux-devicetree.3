Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4574306D26
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290195; cv=none; b=Guz/5n9IAISwE1d5OYBgcCb0RaWD9CoBSClWa+b/dnP0nvOd6+8x9fTD6g53sewHb7OyzFD8uh0DVRA9zrUdf98wEL9Tanip9kwFML4mWrooweqmqziw3jc2BXJg1DmptH2pzOdqEvb6PLRoeJQeVM64YsaLt9jyVOy3bH8334g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290195; c=relaxed/simple;
	bh=G5RUyLgIJK0StdQqxCt6rJ32QTdyUmfptQjJ8okcTvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCvv1bFo8DX0wsMc2hZ6BEDK/2VlvuWahgCwcH/biEV5qTT+pQb5WzD8kN29woZIQkI7LRskAUcUfJ5xnhsAwKo3a09tSTWODCpobvsYNB0PZt9vXq0xae3cVItYGvoaBYPWwIRnz+DYVGrR58PIAqh4Rd+S3fjVLv5R2IlhsEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJ2IfnCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBHvqZEZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJ2IfnCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBHvqZEZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3nDx3123516
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ua7ycgRvwIZDbc9nwX1KfGg9u2x0xaBDwDwKsygwWIE=; b=CJ2IfnCweOKNz5aP
	fRC8HHsl5dxMGnz0CZU0YcJ1m6hR3rLst7lMC7iZvnMHmIXM+0NLzul0SnOLwI5P
	qq7yXWAtCkwcaG8sHhyfKMsS8GEZ9H77C1vQMvemkxqCZaJEg/+0dIYkkSzAhOcq
	rFbttvM9m0i8HnLu4OIK9rMjf+yC+RQSls1SU22B1tm3ZGUKgvMORk3XRfgRsvN/
	Ee3gEPeopAdVcpLRc0xWA+y6V7LfC95vb1O9CmxdSmqND1Wr44UWoMDxeTW7BJ6W
	NJho7RsmJytXLkpIGB+wuryEtakIKxwYZsJyD6/O8dpLbxGcNz+Is0tB5ZVS9Z2x
	qpb+hg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qggafs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:43:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b02ea0c595so18660656d6.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777290192; x=1777894992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ua7ycgRvwIZDbc9nwX1KfGg9u2x0xaBDwDwKsygwWIE=;
        b=PBHvqZEZv5cB9Y7/f2AElrWf2YqRjVwPEmy6xHhu9qJ1DXgzIUruW53JIxDlbTaUPa
         1BDk0zVhHnwDHXV7nbsCpCiV70ju46Cp6peGjyqzkh5AyPK6nGwsbJvXmNBdgcRpE9Qh
         Bjd6+U39TQXsO5rBqBxo8MO/gzCEpWGx2nya+dnsT6IcJOXpPXcklsxDqW5PmKOQWqMR
         9iIrO1Y83Kql5PP5fexKW5dNz78uokGwmNSqOkpJsTWOU3YeomXMcV+RinUNtPvFxmYp
         w+tVsUzvYyZPCgFuP9uP7oOYhoqv6SBdk4nHE5qo7kTcgapBCS1MIRNCM7sJRYDiqCPI
         YgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290192; x=1777894992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ua7ycgRvwIZDbc9nwX1KfGg9u2x0xaBDwDwKsygwWIE=;
        b=rr1P/NFcpdr7/ZzlZ7aRqyQPqPBxKovoU5aRJAOiBchs/6NRhyvHtA6J/UiP89y3In
         hTGds9MyiM5Mfhg7qc1aahOPwBhq7C/aPuMAL2IV7/w/i+YEUJQXQSy2KpfkUUSVZ/Fv
         Yf9v23oXnIaw58A4FUFeUeUTerF430DBoybCF3fisFsHkbwmx+9WL0vE2p8SEa1PKtS+
         JMczi7lGgZoGad9ytYu/Q2Fq9n/OW7rQvIsLZUnVBYE4lD8qsGt8JwpMX2OG0VgvjrRd
         MFLBmTPxVjc/A2gyD2OqxezSpJGS11yo/d+eOQ2gRs1fZ5dVGV9IGoeFqIJ8uIkxcqmy
         9rJA==
X-Forwarded-Encrypted: i=1; AFNElJ9T9e3Ju2eSpwLhejjwoWMHsVUxlNR/210ivQtlcksjeMTMxPpIek6aXSU5HlP/pqXHkqaXBZd/uaVl@vger.kernel.org
X-Gm-Message-State: AOJu0YyLD1aeQrcw+h9jAlFR/B3uH9YBAsvojoJZtm5YqLXPhFSBrkeO
	nIBg4n2uPOgdkr9hZZWDv3Vqq7sSnHzyGHS42lZfKHB3ReTweDber/LpixJBmiH72MdAgJBP7TV
	h8zXXYaGnYStqEOkoZYyzHE2YYaKbCmmtzc1hE/LVcUMsfbvB6gcXIDIJNl1Eb3Vh
X-Gm-Gg: AeBDieu71Jqr5p9VlZSA2zhD3EwaPeW0nJREKlb9jp3cEFNWlqQXJjQ2NburX8EauNy
	gCkjSlqciZJYc+PpWUtCj8y4GZF6zrirOg1DgZaHXcxxItQ1J+k8KbPEsOQJON59uqepnOLJYNM
	P4Z1if7FThhEkeCsZKHF8Zm3E3h8kfgdj2RnBIsg/chKvi/bBWIm1KM+9bfUFAWo7RSOcBftzkM
	3VU5VrmUjRuOzbedGCvg0WBeHtXtRCn/8MMWI/w2Jwd/wo7QJJOZvtrm/f2ermNSzipouyX+2I5
	dvv56k/vOTwbB5LcHaVjtbS30ttXr+a1d1LZ1Roen2Aie6o3NPDQrYnVYgmPUqgdxzYXNSsbNcN
	WKeA14mbPOYYXlKtvs9zbl64OVxGDFSdqN9kuJHekFxSNNTprVCwjSzw9/VUjrkfaBgW2iP4AXe
	TcsWpyv8vNRcx8/w==
X-Received: by 2002:ad4:5c8d:0:b0:89c:d5f4:7b34 with SMTP id 6a1803df08f44-8b02818ed3emr485060316d6.4.1777290192152;
        Mon, 27 Apr 2026 04:43:12 -0700 (PDT)
X-Received: by 2002:ad4:5c8d:0:b0:89c:d5f4:7b34 with SMTP id 6a1803df08f44-8b02818ed3emr485060036d6.4.1777290191679;
        Mon, 27 Apr 2026 04:43:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba523a90fa0sm1032592566b.31.2026.04.27.04.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:43:10 -0700 (PDT)
Message-ID: <c037803d-d33f-47a6-8db2-736c7b49092b@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 13:43:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb2210-arduino-imola: Drop modem
 support
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        bsatish@qti.qualcomm.com, akhiverm@qti.qualcomm.com,
        nicolas.dechesne@oss.qualcomm.com,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260427112833.1160332-1-sumit.garg@kernel.org>
 <20260427112833.1160332-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427112833.1160332-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNCBTYWx0ZWRfXzvKHL0jOnQhk
 cqQJtzdynnEHbML4tv4TPjBCfVimlR203l7hti+xkkmomVFnSCwBr9tCa150ZzH8B1goPY5m7pk
 0ZJOT6pVn+o6aLsaK6yN+EplFNpdtcrBuvMHSAWLqI/Es8u02Yx51B16ib8bm+1RndkQhc9xW+3
 gxQhP+Jp2CR5TV7aNihMms73Y4b5rKscmI8aMe/jBR9K2CieFxPQ8Efdv7Gtr7r7A7LSLY01vPk
 3mfAixUq1Ha+J/6H1NbrlU39U3cVowoutRS4hLUnRkH8Ps83FqhLG6iI9r9ABvW6w9Owg0Dd0hZ
 GMeHsAUrDXZxCeXS7YUAfWWQAWdF9nXNg4LiQR2FS2QtKrrQaurPuimQy/KxS1IWU+VMa46+YnK
 CIDFqOtgLhaMHnD/DV/YnNMbyK+OWTkD26V8T7YCtXVJc5DB/V7fLP2mvlhwZubYaunQxuf0KfV
 /udL9eMfAdcJnWzTwcA==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef4bd1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EaRx9XN6qIJLkwU4gIUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 8D0xkAv8FY-6J7tqNV5CB44Ics1uoN7f
X-Proofpoint-ORIG-GUID: 8D0xkAv8FY-6J7tqNV5CB44Ics1uoN7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270124

On 4/27/26 1:28 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> QRB2210 has modem fused out as it's only available on the mobile variant
> which is QCM2290. So let's disable modem support from Arduino Imola/UNO-Q.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

On previous APQ-y SoCs, the remoteproc was still physically present and
served various functions (among others, GPS, IIRC). Is that not the case?

Konrad

