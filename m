Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B89F542809
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958433; cv=none; b=Xj2oPzZ7R6sP2haMfIt3UMRUDdSou/+0UWqjT++FRagEuqigTlEvkV8dSUoObl5UF3EavLMKgyJQpVcZFKNWFW5PJcm7dPS6HEr8eK5bV3bUjjzClg4VPqzAQTsAfSvsr6yIbKxcDolO3XIUH/gZZ/QtjWy5VtOAd+SW+CGNGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958433; c=relaxed/simple;
	bh=5zvDAD8QwncMycAOR4YG74kEojERgTGkeiqlgwBM8rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRN9No2T0g1oYyiXo+/K2cARRazQjFF8uHvQgg9heuItqvh2+yF0GJujn0zTPsLPRU8CiEm24WZ/Rqe4sY3+09hZyT6Yf/LtzdfBtpbq9/Ym1YpSjstZHXNsyfu4ME5a4dkqeUHVcLtgupj/QjSP+quNBmK87TZsvxVPVJVXMQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATrI4199; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZYcppyL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATrI4199";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZYcppyL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFlN2171930
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 12:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2auFWGyThip31RO0xFU8IteqpiwOHTvj4F02gD3M7s=; b=ATrI4199W3WUP9cW
	av350UPnDQ00C6XSNySCwcyEi7QoCi8gWE4U8Y+7BFk6n71KPhXTo7UJGFOztNud
	kTLEgOC4qOchS29JFopenQmBi2EfemnvpXdgRMckU7GiscKQg4CRXsav9hHjPDzT
	YNr7Xboil1aeb8MPSvVFO9/cBbstbrYFXr/piuJccVMmR+IAYPbejV9vo0/M/yl4
	rTd+aF8yMLk6CliwQapI4NJW7DUzV4tGAJn/WN98QKPVvkvAb+Qbg4Ptn7ANiNeg
	zD8A7qjbIhccaQ8aLa0KvVtnjvS0nYqt/GPgbIv8tTIusgm7aaVAiyi82U4NA4hT
	wNX7IA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rggget-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:53:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so73967785a.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958430; x=1789563230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2auFWGyThip31RO0xFU8IteqpiwOHTvj4F02gD3M7s=;
        b=GZYcppyLXPyUcirWewdMB/2vZGpv1bGY96pzVhLtY0eYpOp4/i88UPzYECwKR18/Sz
         C3/BXQRPcfYKet6FN97OKVTYxCxqsY8tcYprV0sUNTffw+0VlerOfHeN9B8I5VGAq/b8
         OvQKxqZOfvkHyvsHnR7V4qcM2HYZatMNIPmXy6QDRFqjfgZlZ63+nmVKLqrEwtVm+6xW
         Mg74qfpukOFxokpVXfE0aYi6eiPrwJQBXUHYqreuyAVilMm+eaUwwQWmb8OG2DjJzxxm
         aFbeevJTJSilrTpOMjMKvBz29GiE8xwn22YETr70pYFVv/sCviOYcDjpUkB6s+i8f7t/
         psmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958430; x=1789563230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2auFWGyThip31RO0xFU8IteqpiwOHTvj4F02gD3M7s=;
        b=YRZ6KZfnA4adpyi//Y9RovPrRmyyIkFJ7VOq7wd4BUtqPUTaEWFYpgNPxFVYOsEpsy
         eDwarXazgq+7dN7MtGKijbXoPBvnwlo0YFZXyLcmTh/CKlDHRbvrVDiSRMw6n47vJYL6
         Kc1Ep+qPGr89aF31FwjnuigI4xYcVzIIrvgn/s+VgP6Djj2oLCgldVzu+Vy6g9vpWCMw
         ssZ0I7SG4bLQ8cjyQLmtJ5tGnGoj8oQO4IyCL9FOVvOhufXe4WbfBzqlocWwuQP8S6un
         3973AjYRnQYFUOOs27PSVhwvPv9Zp1F8BLUjHsHDXci1I4VPpsundJ/t0dlGcS4VOvYj
         cjyA==
X-Forwarded-Encrypted: i=1; AKwUvBy5+PwS8V9V2tRdFMtXz3mgw63cxPIRIep1yM/Gro5Oa2L1ta5Qtj9E/oEWSOujfi2QClOXtpKZTmgx@vger.kernel.org
X-Gm-Message-State: AFuF++mIhETvrpWoG/WbBDRixTcMLwr6Avvmqve9VX/+RLdAAiHuDL9f
	B1AxOUTqv0i8eZaevmIpBOJa9A+hi1B8ZE+323wDxwOZSq54N3a0puV8RG67YmIIz1KaEKw4RzJ
	Xo9jLdHFyyRv7JpcHb+VV4FKIB9kzTD2Kcij7961EpL70FRzbr6UmAnLuVyvavvLV
X-Gm-Gg: AYBFou2JuoHt64wt22+aNgopwRZ3Df9vo7gcYN1mu22iWEWodOaKVwmtjaZtFaRp2qc
	ww5CqyrDr0isRGm9SpC1dM/oWGnuuM2mW8kXxIwqHybHzpuYkuzl+wC7sSaxGUurFJhyV/ebnQQ
	azcFFzqI6mueOWqIp4wNCwvt3G8O2TUlwelyyd7PcCxKWi5eqBLWgXoM/AgNlIAQyBv3PcsDADW
	Ao/zFzUgv4l0gOPhAwRSrFL12pG/x27OmagSoOC0/qdbQ2HWRg3O3EH3PCsrw4Gs924vhfpcLDm
	DWTLp8rlOnKlNP15zIyesTyqTAhy0b/P4RGkWgJAFa21xx7f+p76NTHGCMAU6pGwTaC0Og/Rl2j
	I88g+8f4cJW/oTbP5lZ1XUQ==
X-Received: by 2002:a05:620a:8086:b0:939:b0cd:2c3c with SMTP id af79cd13be357-939b0cd2d81mr1456660085a.3.1788958430284;
        Wed, 09 Sep 2026 05:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:8086:b0:939:b0cd:2c3c with SMTP id af79cd13be357-939b0cd2d81mr1456654885a.3.1788958429723;
        Wed, 09 Sep 2026 05:53:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm788860766b.58.2026.09.09.05.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:53:48 -0700 (PDT)
Message-ID: <e4615794-843b-4351-9a1c-c69da5d36044@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:53:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp: Mark FastRPC context banks
 as dma-coherent
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260909-sc8280xp-fastrpc-dma-coherent-v3-1-d38184e8cf9d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909-sc8280xp-fastrpc-dma-coherent-v3-1-d38184e8cf9d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfXxffr2kiW6yb4
 tZ6WaIQoZMcnxn5f020eJsMaPJ/ES5R1ctcL+mW3mdN2b7KHHfoQnvEy1P5tX5S3oJ/AWrVLLhb
 NNQS0lqxp412XEjqcmjEugh7MweY08E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfXyJr9hYQAiCnJ
 AaYwnZsOXvNCnlnbHpmcJTXTt5obp1MjB0V9F96u15Gcp4jgBs0HCsZIUbjFbjm1kg+5Iao2Y50
 e7HekMgIqDl9MFG8ZU2APYKkPCgDuOrboDjcN4N0gsiJjHzxym5c1ZT04qj96EXgZFXed/jtK9S
 bfK4YgSusNWnUwh7va9A1+KuvZwwF1dXZguPplHHdaWLp039Dt56S+Cqfuja+poW0+d/WAAsJSu
 NZte9z7G9T2bXCv++hH7Uz6elLMlvvERXI5r6ZvxmxucJTm4ANzZ+Zg5cut6CU85s7j4e82o7HF
 S+8XzIktEpaOSdPVsBor425drnW3s4eCLwLGqd0UC56E6Rgf3nfl8CzBhdxLL1rFp6RBDdO+Tat
 PL+1zQPGwvWwRmbV9NkGF95GtOfdMxGwPcSCkKVm0rDki1xKUMLo3ySgwHW7Of4CwUloUYOt/wX
 1L3m14cIo0WpSZtMhGg==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa156de cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=bns6x2SeDOD8hvPZ-0UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: g62RpbgrHf7u-dpecc3v6xFhRHnMwB6u
X-Proofpoint-ORIG-GUID: g62RpbgrHf7u-dpecc3v6xFhRHnMwB6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090144

On 9/9/26 10:08 AM, Xilin Wu wrote:
> The FastRPC context banks are DMA-coherent on SC8280XP. Describe this in
> the device tree so that the DMA API uses the appropriate coherency
> attributes for their mappings.
> 
> When FastRPC allocates shared buffers from the system DMA heap, the
> missing property can cause intermittent failures while loading DSP
> libraries. Both fastrpc_test and the QAIRT platform validator can fail
> with DSP loader errors such as "mmap hdrs failed" and "bad address".
> 
> Mark the ADSP, CDSP and SLPI FastRPC context banks as dma-coherent to fix
> these failures and allow QAIRT applications to run on the CDSP. It also
> matches the behavior of the Windows driver.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
