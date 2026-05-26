Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B0430AAB8
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781148; cv=none; b=WkyfHQAkZUSGbYC4BfCmx5FDSWlXp4YLKe1mxH6yqQyBzzh8g1JdsPzuZSwHvQ4XaXzAKwzfnGNBsgiaMzvGYE+CrpUP2dbsmseLx08L5s63ORIhugq5z72QHC3KlXCeZRvVxv+Q0LCYGFnSyYJld7pOKP0dsylckRfXZtTkGgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781148; c=relaxed/simple;
	bh=jYUeaFDseK5Fp/dghgWSFxLEk0CVbLZJPTFDMbNLqd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L36GEun3JkvCzAmcrIPgQhW5fsEe2QL17yRhdEiiWo27VXUNPEBqDzPma9pN2borrMNxlwuNafX+VSUOYt+d0UYbMXHrwu89174Cp1RBv+9obDT/GIif33n1HYGf+Qiuk3aWBBtZtUBf/aA2nDs3WX2RCooMHODnrzaUzBfExfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cx++b8XC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eL1Wo5KG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cx++b8XC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eL1Wo5KG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q4GE81004567
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCbmsmXWy3W9IyGvQLLiDoQQ9qJebEIMsm1jE0eJTlI=; b=cx++b8XCklPhciSK
	vr7SPUArL25TyFtMsFY688yzED1l6e9vNXiiRuGZnfUCIFiJOOffJnzWEYCehc7n
	y7LyM9HHHCK+dSNnRq4aiDdZybFLKn1mPJ/O4qpbbwFbJwniJ5Q1ToNdbmhLZqH8
	WMCq4FzqpfcXxCigDNmwfCZYxZ7rPxvAA8saV+QVS5vfh/echtNWsa8F0uzPDL9W
	bUKF2rPANg+dcmDWY0Hi6fjHSKQE3EAQpu7fOTh8xj4hWKRKbMhu2a59MVoFCMjb
	BZVortQPraM1qcd96N3g3YjS4I1CK8vVaVKofuiBY4YjNYXv3qFFMIuaxi58qLtY
	wz/uAg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm02a34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:39:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so11380857a91.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781146; x=1780385946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCbmsmXWy3W9IyGvQLLiDoQQ9qJebEIMsm1jE0eJTlI=;
        b=eL1Wo5KGgud6YWinsHdOLLIvmKYW8OQoJDV8RbtI+3DzCXRdYvkxdXSK7uzFc1xyBq
         sQrlV4syDSNoaqGBj37bqlvS/kpvVmsIwMqstT8/xbd3Hw4Zf2hfqngq8Y4cYzMxcJHP
         sEbAb+O8M0ibVVhOpZp458FzJe8mtPfObukUQE/sTosGXkkt3djbfAGF8jSSCNSu4vUu
         pNHTSUteqji69GJdw4UWiWGWAXMnZ81g+n7eZ2WokyX6QGSDW6mYxrddHd9dB47U0DMw
         rbgGqE/Rn+8+bWtcA5wceM07PmtsKACbHIF7sEJu05iAuF+LkgVimWp+NlDHm6/ytfEq
         jWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781146; x=1780385946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCbmsmXWy3W9IyGvQLLiDoQQ9qJebEIMsm1jE0eJTlI=;
        b=q5uKe8SIbRWg7fMCutQnwKGRqOqXnTNZjJBUe6Z/yfNHql10gbSfo8AuHylSarLBuJ
         3jZ83ijHdyi8ePsstoHcInBeSmDZDmMdaV6skQHf2Ofc+Vf4CEaXJC7ilwMprqb73I9J
         iCbZ3D+4cJGc5FL0ZfdVGnGNrae3GCjb76eX2kwhhoY9pUrPixZM8MPYlTii+W6JYPVY
         F5WDKjqHAM5ysUlp9hhofWBnldjvFCyhTjrpsUhkJpgT8+2oI/JedOmdm84/8oqXFeAu
         Ng979AuXhrj91czbRrQi+zNEpVUXxywGP2Jdm5fAX6iGdLSTNE9Q7AD+ctk8BsnTd14G
         kqNA==
X-Forwarded-Encrypted: i=1; AFNElJ8ueqCsK+G8+v0PKPu4joCfOLqIfkRahnefRRX5F7A04dI71qdFboOfBKcJwxjKxutSCXgrC1ZAQGlE@vger.kernel.org
X-Gm-Message-State: AOJu0YztkHh+jsAHdV7v2BRFG693KiQYHq+PMu09ury/CvclIy1C5lT7
	+QO9IPdlCiEGypQ4WpJy/L+livFAT220M0EI4QY4thI18d3d6r55dN2vJg3nzBS0+ZdypqoNk5L
	8xbvHtxuhqgdARzRHmEsqTX7fKtii3pF16fJUBVrCazFiGQXxYRVh8w5BDjwNFDyC
X-Gm-Gg: Acq92OHoAaneYhXBT6Z/d6/X+USta0Xgxc5LD/kAUwH4vFYaIuqt8iVQ0dDy5+q03+K
	AXXdAndDG09a/iEbm4WnaNMI/gcMkESxZt+s3f3j4CPTpjKaxdYNiXVDZHsxFhop0PErJh0l5HL
	I7IF+zSlDNBgKWK75uMNFQn/pSIQDE8mUyykp5ZwyqG1LNk7ZgNBQBf07PbSw1mu4mnfphmWVdz
	pcotaUDStpyc1Q5m94ATAgK14S9cE6Aq8lCYlsgZWA2+101d1kMMKODXcPR//SLn6j8QizvIwUm
	QLc2/G5kFI41Fa2DYlJL5TR2MsBruWk2dDrDzFdJk2U5w0ofxrQUCyQUhvma0010YZPVWlSRR3C
	/sRpJ8UkBERc0oCtsnDUf75mbXfla7BzG8fU1HoPRSx06Rp0xIwnDfeZEszlr25gLnzD/2w==
X-Received: by 2002:a17:90b:5188:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36a678479d6mr16527211a91.21.1779781146316;
        Tue, 26 May 2026 00:39:06 -0700 (PDT)
X-Received: by 2002:a17:90b:5188:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36a678479d6mr16527167a91.21.1779781145837;
        Tue, 26 May 2026 00:39:05 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b91c6sm9474650a12.14.2026.05.26.00.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:39:05 -0700 (PDT)
Message-ID: <dfe1ab42-ca78-4a2d-9ff9-899c5274a01e@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:09:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Document IPQ9650 Compute DSP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
 <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
 <f214d60d-a0a5-4f5b-bb65-8ea9d0bc858c@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <f214d60d-a0a5-4f5b-bb65-8ea9d0bc858c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a154e1b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=LDztB-CtngGDq4veg7wA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: xZgPMY4bokZnL226I8_TOWPIEwk6wae0
X-Proofpoint-ORIG-GUID: xZgPMY4bokZnL226I8_TOWPIEwk6wae0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfX8fqmr5lAZk4w
 1AnxkMmAuOSSBBhFpS7dMEYyupm6k9kL6aIVf6DMntVNtzoJlJt48Pqco2G58DFdhqzmCihS0E+
 eiuB6NrW0na8VwLXyGMQGsI7lM+SYuNRftRR8d7gbs81iwpbzSmlxG0u8j+7SJ6xxzDeKFKsGaC
 ThNKBQ0W3TMmr8Jq0RVU/XVdkd8i+igil8V0T6Y4YuYcfZ33p0Nf1ukx3P8Iil8akGBXbVUA4IO
 xcE0ETR78g1PBfakD1iuLuwoepiKvRnZrV72+bQEtyc4VI/9QvBA9yEkuLAMZ5ktXfq7T+1yFrR
 rNJ34OBVv2Es0a5XHquyscmO6Q3PAcLChOtyoW70wkP8FnqhYnJvXaoYvQ6VJbJIb3HG0QhhMSx
 kd1Ioxy9j3AuFijZ9JdYCVyWn/I4eJjr6YHORSMbQ4jbJnGSOw/E5mw6WwCkssmWZ8vbFrfcHJg
 WCGUxb/FdngHwdhkzkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260064



On 5/20/2026 3:36 PM, Konrad Dybcio wrote:
> On 5/19/26 9:26 PM, Vignesh Viswanathan wrote:
>> Add device tree binding documentation for the Qualcomm IPQ9650 CDSP
>> Peripheral Authentication Service (PAS). Unlike existing PAS
>> implementations, the IPQ9650 CDSP does not require power domains or an XO
>> clock, requiring a separate binding.
> 
> Your other patchset made me believe there should be a pair of required
> supplies instead

Yes, this requires a pair of supplies (cx/mx) but does not use the
"power-domains" property like other PAS implementations.

I'll rephrase this in a better way in next patchset.

Thanks,
Vignesh
> 
> Konrad

