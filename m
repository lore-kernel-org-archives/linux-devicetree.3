Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7462F242910
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048462; cv=none; b=sAsc8kmnr9DqQhR38DAZAI0jSrTasPsM0sFsunzAIdrUyXxaceNYbV1A1UEhlJJEaOluC+b0lEH016YN1pYjGc663bfrSbnIs5556wiCA0ctSoNB8ea1a9V6O8R+g8ad3zQRPzvPEkcdv2z6vy8bEDmF1I4gaNYia1TK5fVWLW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048462; c=relaxed/simple;
	bh=lm6Is8OqE/SGUt7pxfzgTsyif4RJ5sdb5fi3qSnD4jo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Tul5ewFQRu/WRbEAtooe6cLObEYoHaJLzN8ohb7Xow6WYTJDRNrhI6GNYkZatPZJmiF1EcG3vEqNLZAqcK6Ck3ne7Q8HakDj8GUsVUST+TYXCT26ytXYlQj8cfuGQp4k4O6asAhkxdZ4wd3OkEO7zqbD6hsh3Mbd3JrkVp12c4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzeW/c41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5smdw9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzeW/c41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5smdw9b"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LAtHDQ2126414
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HM94g8R2dXZBcQZBqSknKOLIPm3L587bQbswDd/w+tM=; b=hzeW/c41gJaiJ7b0
	qmEjXbp846iE67uvh38R+fxsb18aTlyhW1NG3fePe0tRqpFYJnjZg6cmSGdx97e2
	J0nUyjyhAnUT+lT9dYhnSrGl/smY6D+K82+IwDrm9B/48ZhosWUPbTJs4QK/9gUy
	wRUzgKVbMRg0grGBLzque1S2XOcXxQ3LQEonEEL72cnTAXX/YfU930QPzIG3y6IW
	rBAE6nDiILV5q/kkrvSU9+RjUgCzrdgL9pnN5BR93U3eCqHpAwyxUVzqz9EmicXH
	fzMWasa1Xo+Unt5bt8r2x7cZf8lho4emIN1QZb+ndtML/hTHonmbr9pjxx1YWvD7
	RNTQpA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewg7mkd79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:27:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso2331044a12.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048459; x=1782653259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HM94g8R2dXZBcQZBqSknKOLIPm3L587bQbswDd/w+tM=;
        b=J5smdw9b0oQOZ8LI5faPpm4DyKaMrntUvKXikbgrFA9ztu5f8jkWiHK13pFO0nLJ6m
         dCLu7d+WNRtyAdUMtcUwAAVXTxn2sjArv39YCfyQAGAk2AbAtGFwU2Ckh3GmUeH/Kufh
         VT5Q+WWhpyOftsNZ3sYk+VyiY3N8tCfa/vIsgYfXxY7XwhxRdaavPOqTRnIeyp8I5+tP
         i0b4pWtZ+lfg6zfaNSIFiJvf5e06BU/1qyNW0AKUMJdVOoY+aPeKmXhMns8QxHBsbCIs
         9nYh04uOUFOkllO76Zn+ixD4gwwpTNs459NYZN/HTOixjHDifRAfi9mCuIOx+V5QERiy
         d1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048459; x=1782653259;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HM94g8R2dXZBcQZBqSknKOLIPm3L587bQbswDd/w+tM=;
        b=qBpRar7cMeYZ7xQZl713M/HPiaiE2AzXx6Yb6r5jsrYlmfBw0aK4ehqGWZ70a1DP3R
         QjBDNHYemE9dEna/N8MsQl7YVSAT8UzQc93YfPis1Ke1GEzszmaVIrfMH8fi+GmQ5DDa
         S4jmlbuAwizqbOF/rfzys3ciA/JJFq+SNVb78zUKxqgyPFm27bUIyv4um8NRMGNyjheu
         avKGFt7NPueAqkq0tY4MQk/ydcNuqQ2vl+rCC/ASnymy7csOo+S+KBx0qzVXtSJjL+yU
         eDMpXC4IqmlDWUtI6RbyndYivQI3gxzm+sMx7tTAMrbGef05POwl+QCIyngOmwb0e29e
         1xaA==
X-Forwarded-Encrypted: i=1; AFNElJ9yYqDXpaKTzzPCZR480WLoXUTcjZHiBZQldwHVtUzjl08CzinUAAKBR88hzajpXMA518MY47Chnwq6@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCA0o8nQQSMDWw4TXmiZ82MjJfe+0cKNeoa8LZm1J9jvid9ag
	jovaYl2dABLXDSRdhJEhs33CGNQMBbcCK7DCuRIMK/8ZySCL980quVE5ycDa18+lqvrNPUxpAjn
	f0pNa3DI566DXZ6BeyrMTSLUVcB0NQEdZDPRNq2/qtVhL7fLnwkxEI0v9G/3cEpGt
X-Gm-Gg: AfdE7cm1UlzRwxYOPMS3Mbl917iMqh/9AOu/ZFmRyufikGMYcN9ZBnsK6Vt6V9thUD7
	m52iCaNDsEs/7Om3yaBUPjWSxqU58Txtpd0NPuTHalH56Z6YbhyJFtfa5eEFYJ3rHT3Kfiy++5X
	+UoIxb7TFHCTgTIc5Kfw2UFgNxWZRCb9nsSGz8KXe2nM0X4OtLNHo+fvqn2qjafBiZtT1hA6h6l
	xo5HySx6bqwEXIt7hZOdcF9UWaGpC+AD/rMZU/GvGEB9M+M4hyHfHRyLmJM2chWDzdYevTHOID2
	6yrnIOljQd0oa1EW6yR67nwFqqFQUHIvwrQri1dpcvlhCWsRGrd2flusClUrCydpPYQbxZFq35J
	8jwuVoPIUMUmHCYiKn+/6WXAC1X1V6sqFFCjbbvde
X-Received: by 2002:a05:6a00:846:b0:842:688f:307f with SMTP id d2e1a72fcca58-8455087800cmr11650747b3a.28.1782048459405;
        Sun, 21 Jun 2026 06:27:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:846:b0:842:688f:307f with SMTP id d2e1a72fcca58-8455087800cmr11650713b3a.28.1782048458971;
        Sun, 21 Jun 2026 06:27:38 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c25fsm5121415b3a.4.2026.06.21.06.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:27:38 -0700 (PDT)
Message-ID: <a38443b7-c7c8-4eaf-920b-9b0563703969@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 18:57:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: clock: qcom: Add Qualcomm Shikra
 GPU clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-4-8204f1029311@oss.qualcomm.com>
 <20260605-camouflaged-seagull-of-chaos-afeaf5@quoll>
Content-Language: en-US
In-Reply-To: <20260605-camouflaged-seagull-of-chaos-afeaf5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfXytzGExv72nxL
 q0U5iza4PdqpOk3hVquuv9acb4LwZmYMHf2eZaT1AOVjdpXk0GCa0QVE/AyWv4I+izqP7R3pwq/
 Bi6npuXEuz1sKKiN7SUaLns2zfCSSxwgSWh8UHccVKW6vPK9XxQUkj0WudqR02jqv8K+P0iEvnK
 3UfSg6Et4B9QaatHwEQRKbu1j2+nUU3qrN5OjP6QQ/MZkZPQ5Slzdzxl0WZL8k82Pi4oEs4oHI3
 xf1cRUuFIgQac5qDa17IpovTM3SMNv91b4PIzTwk5F5s1n5EdiWARfDdC5aGGjFVGSG5YxqK8bS
 RL5n80gsfk+949a7a5a07J8w9Cx6CRJUUkhAm8jVOd9i/+gsibeFjtMnW/3Kv5QmnmbMi7e0VJG
 fssbSCcGQp62ChagH7nzLO4NqwMwt2H2ptfhszkgF8xMQ4rAbeyzgzPqK93cm55FUUXdm9aW7MU
 eSVo9Sq4D6yTM0TkCKw==
X-Authority-Analysis: v=2.4 cv=IOMyzAvG c=1 sm=1 tr=0 ts=6a37e6cc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IDlySeeo0UQRlzYkq3IA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfX3aKa3A0oc6/y
 cGrImXYEiC7XSCgNmreoeUiZegGJRyKGCZe/rmswDS5ckDIaGItiHX6kswA+qRGSnDYVPgzdG8H
 LD/J4HKQXbo8mAmZMEPwRBFzvNNgDiA=
X-Proofpoint-ORIG-GUID: rpVifKiMTh0Fa07lu8UUiTVYzRWIw4RP
X-Proofpoint-GUID: rpVifKiMTh0Fa07lu8UUiTVYzRWIw4RP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210136



On 05-06-2026 03:54 pm, Krzysztof Kozlowski wrote:
> On Thu, Jun 04, 2026 at 10:56:10AM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
>> hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC
> 
> No header file? Are you going to reuse the QCM one, so basically you
> have the same clocks?
> 

Yes, Shikra GPUCC has the same clocks as QCM2290 GPUCC, and re-suing the 
QCM2290 header file. I will update these details in the commit text in 
next series.

Thanks,
Imran
