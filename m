Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E778825B091
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783245376; cv=none; b=Yv/jRaAQ/aHCldhtjV/NhgTJWtdIXiSECMBzug0fJZ47nucA8G40SLl8ACihtSToDTNziREsGmFwghHjl0OheowAAwgRh+RY66DFhwbImCIUV9zeJQ+t6jgUkzsKr7mDfoY0oxP1FORWT+QjpgMIE5zlw9dHqqxdts/F/JOtN38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783245376; c=relaxed/simple;
	bh=wZydx+D7+eV35VMeFKNwwx7xhnLkiOd3Pqlp0spAh7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ya3jfCKlbFZavnkYLRZDdOTRR38NW369Cki1evnUCcJaTDhhvO/T0GJcRF6VKGIF+zOPyY//2TvppR/W68FmCT1uJ51h54H/9+2Dep+WYewaDsSR4jO5GNd/pp7W/hSyTRK9Wh5ihzhhKP52MnYykuEqLHjWvS7XZ98bMiJToiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9iDBty7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJUVZ+2u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9iDBty7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJUVZ+2u"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664KY7JB3952408
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 09:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qez+BIm+WNGrqobZFOyyBrQ8p8mWTuln4FzUBmn1x2g=; b=A9iDBty7BwcCDgrj
	obxijsZW+M/rwRFDYVUFQHbhkEGOAnuqZKGsmTsECOmKS0FE3CMI34EozXNGIj87
	JTJ3+8Y8fSYUulkLXd1+XCs2pLHfeinK+1WNL4mFq1N2KC9kVL50y57sCRC8q4XN
	VzR61ed9eubtEoLHSR2VMDCjwx2j0NZOHGSqc5jm5ATOdLlOl2HrwbKVldezI4mN
	lVj0om/3jtfUweFUBRWNkffYepokyQLdp2LcmIAVdmu+T3uEyyn9GDe66xY8gB4L
	LWDK26qBspZoYBUizgT6+CNvsSfK4U5EaHQqzl8JtCsj++rqQSQQwEIS5l1rHwZ2
	IOnGhQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8ujew6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 09:56:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9d8549d55so15527435ad.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783245373; x=1783850173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qez+BIm+WNGrqobZFOyyBrQ8p8mWTuln4FzUBmn1x2g=;
        b=CJUVZ+2uxVk/eg4IpVjDHAbXkmcXGPho8Z5LK95PS+7M1bDmO+OXc1pb59wqlGnmHA
         YzXYwkEM8fizoM+H5PjK2AUhrUHf+1MGdbokjCSEgHR06ubdDwHedw+7k1pC2fomp6tv
         bC4Lj9pwQWXDP9N0ywL04U6ZZc57ZV0qaSOUZFBTt580tmYsCk8pIu4GA/lUULyXjZFs
         pD7cpDeod7/b60SapBgI8WidB9QmswVqjlkzksPF88ARPd49O+5iiBDkzOSpllT30HZ6
         8Z7IYGsmGKRYaYh7ra6fKaCa9XYtR4WpDlZx3Lx9J9/1st4wBVq/ScRx6AwNvGdV5oDU
         F6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783245373; x=1783850173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qez+BIm+WNGrqobZFOyyBrQ8p8mWTuln4FzUBmn1x2g=;
        b=il0t+h6EDprt7ZmfVfza3yXgK5tbdSVuXFFYHpJ3KYEcmjqJRAEWHMX3dmIUL2Q85u
         Zw+tctKT99K8n7hNEnhHltR2krY6JOOu2EadgMQGPGiVtO1gmYO0T4OREqwwVvX7FeKV
         r8WpfJRYt1SV7ORvCxt6N11LzqzaM5ygod5n/nVirjrO9ZGU11qCJTE6guUjBbwSF76E
         QNBMPg/KjPof1eLKRv2tKtAxD8ElF9f/dtb1CvXHGwC8o3YqD6g2aZ2c761uS0iLiPWG
         gNdsix3DPx52Fbsm4lUnNmwREEK/VqeKvKv6YfYiwEhu5q1s6dg+XlYkcRLH5s5tCE02
         XLMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtjzEV46jXH5hef1JFUo8KNsgooJuap5h9jSWap95qWl4JWxf77yOoNxRUTUcsIFJjNhHv1lDMdaCX@vger.kernel.org
X-Gm-Message-State: AOJu0YzVD+eogonElpKrGJ9OUxM4olPKJGOEQTxlfJVnNdio1DOcX1oZ
	gaSRkhCjsfPYSIqVKPVM/E4IXRIzLN0NLAgMyZLsyPfkwHbkv/1jHPCBS/GtBVZE3CNfHShJRFw
	eDSshx1N5RHo9iOB2TKswo6zb+2TYEl9v1eTSMctQrhhOqBh0DudK0BxpI8G1Dofz
X-Gm-Gg: AfdE7cm1AK35VZEwR2LPFVVWDUI+MwfIiyXAJfPrChYjZtBZ4RRkMYceIVg9o/AepO/
	CuQvvkATcI7OGaz8q0rxLcCJ5yejkQ7ZzHKp+t0S1rG0mkL/iNWmReWlRcrEnlVcmyXzuqGy8T6
	RKEtM5kPhPqBF5RF7nC9pTaEN+sESOEPOXO435rqG2ZnPQ0FzaSdDKFbWZbN++aA8RtSTGTe3hy
	JELtPMwpvdg3kwtSvPJBPPAzIpnAofkHq8hKbUggKdODa3tEZ6FeaNOD43KrtG6fTwDNHTON1lu
	vgeT0S93fwZ2Y/GWmcn4J/Wpm847Sue9HuezWANiZfjY4P9Ei4XTaT8sSn3X8FvbAyS81VhhXtv
	YFyuU2wA3SP6Sg61YqSDgkowg4EU5n8Szb0qzfY31yQ==
X-Received: by 2002:a17:902:f78f:b0:2cc:9763:e607 with SMTP id d9443c01a7336-2cc9763eb2cmr2054065ad.27.1783245373148;
        Sun, 05 Jul 2026 02:56:13 -0700 (PDT)
X-Received: by 2002:a17:902:f78f:b0:2cc:9763:e607 with SMTP id d9443c01a7336-2cc9763eb2cmr2053695ad.27.1783245372660;
        Sun, 05 Jul 2026 02:56:12 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm60691241c88.10.2026.07.05.02.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 02:56:12 -0700 (PDT)
Message-ID: <6383bfc4-e193-4eaf-a44a-b9a0233068db@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 15:26:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] remoteproc: qcom: pas: add support for TMD
 thermal cooling devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-4-3882189c1f83@oss.qualcomm.com>
 <20260703-accurate-feathered-mammoth-11eaac@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260703-accurate-feathered-mammoth-11eaac@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nIs-y8mBwfzqo3bY-Ys0CM4gbAy7ixvX
X-Proofpoint-GUID: nIs-y8mBwfzqo3bY-Ys0CM4gbAy7ixvX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDEwMSBTYWx0ZWRfX8znJKVLVVj8/
 yLjCMnRoyL9ooOZVmElh6MIkgC0+SukCfrzcBioRdnkyZO4PDxjwaeLY4l2xVtRBlCLj1/xfHRJ
 LnsJJBA33zzCgR9R4B/BE14oo/Y+AyE=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4a2a3d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UwBSoYOfm8cr69mLPLIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDEwMSBTYWx0ZWRfX34EpIls49Lhk
 cNdCQjW1RsXEx056vcby9lckN1g4gqkwcKugFO0veDzxMmc06W+n9wLgDBNhlcoO4ps43llRnmi
 8BM2exjOGVB1zs/LpRn78F5fiyW9aRgNXUmvMiYKocRWc4msBzkCnE1kL1H7LsxjQq8Egg3TIaY
 xU3qUv5OvtPgBSiuEB71EzhPy5dt+v72RHHMr3RSQtjER7FWJI77+wUyMXJFVsQfJ6JSI/x5DLy
 UoC0ntRtwg7jizrkcsPY5q1dWg8a6TRkz6vNRjRWz67m4JkRvbj+XKOWLlpy46O+hEKaYDdwU/Y
 x+Pqew12vkoqmpK2vZCMqAgjATy2qZnleD4Ur7R15bbQ2UqNoShh/4+vNQHIGff3D7VxLBeDEby
 jqFnNc1IGOp8Up7SRdE+IVrqBGL1C0MwaB8PSbMIFdOSE1RJBdFUKDPsnS7P4dPivEp3/SCF3bI
 e/zdkzkf4U5F5W6ZHHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050101



On 7/3/2026 1:26 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:33:07AM +0530, Gaurav Kohli wrote:
>> +	tmd_inst = qmi_tmd_init(pas->dev, desc->tmd_instance_id, tmd_names, desc->num_tmd);
>> +	if (IS_ERR(tmd_inst)) {
>> +		ret = PTR_ERR(tmd_inst);
>> +		if (ret == -ENODEV)
>> +			return 0;
>> +
>> +		dev_err(pas->dev, "Failed to initialize TMD: %d\n", ret);
> 
> You already print error msg in qmi_tmd_init(), no?
> 

thanks for review, this looks redundant. will drop it.

> Is this probe path (looks like)? If so, why aren't you using
> dev_err_probe()?
> 
>> +		return ret;
>> +	}
>> +
>> +	pas->tmd_inst = tmd_inst;
>> +
>> +	return 0;
> 
> Best regards,
> Krzysztof
> 

