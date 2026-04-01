Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE923DD50A
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037921; cv=none; b=Hdfx4x2Aasu3eYIU8UzaoEJRThQWkZ9Nycx+YpkPiQZnkeIF+wMJ8ftbcVH9YQhkJQtgKxbGemgDPAjN81mduB9x5NryS1RFxMa3YlSxBdc8JCON8rrL3B2n25AipGbIMhK7XKv3gPrEwUyxccYge1WWU7LV4SqG/w8pkJlmFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037921; c=relaxed/simple;
	bh=vznz2tV1Ns0YjEM8BW+T36U+5Yq5ihpKB4pW/NTtzt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJiBHXpLLvZCXxK+Rhu3wCrd/NkhBPE2jaIokb4KreIdDXqptbxT1CmOQaORetTp9XXofUYHAbH1oD9w+Modrl/phGcF3EMZdxBC7TMN1CcXHlA+T8oz5nO7gi29dciY1nwSfYkj7j/ZId6VcCiC6LIcOb62FxnvvWom+g7qxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ebvu3MHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZLEuRZk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ebvu3MHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZLEuRZk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317AVMb1578381
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFk4MckO7vhSCoIPLfehPhdy1cYDQDKTBV4wM3MEXQs=; b=Ebvu3MHVVRZqRv94
	h9nqol5XXQreMdAM0bqRXcIIkvQSv4yp/rRAl81eAeYd5fsBFpgQWD7UORe2VaTr
	VFjMF43Epn0wMZMLHGpoH6dQKtctJjnS+Pq1orJmzU9Zjymsb0HZ1A7BxRgocOxu
	W45Jwb5xzwztOU5Y/V/3M/NDyew4EPjgF7XOD/cgkJjn2y4uMYhaFNL5TJFpJbEw
	JaufdwNSRnzwWbBjyuYm92kQXH97Jz3ydaMmHNQq5nBdDu68a36SdLfMp1koWneM
	0j6r4dcYs03jTlVStAzsIVY7JqER5yKunzjvsV+GGXWG6iR8kyBrFY0NkLobqsgg
	HozjDA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6kufuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:05:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d1d81dad37so13240285a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775037917; x=1775642717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFk4MckO7vhSCoIPLfehPhdy1cYDQDKTBV4wM3MEXQs=;
        b=bZLEuRZkFj+4ym58oED+pLdmM/gxQ5KY/DAwIA9AufmLi+J+8qbxpFoXpYDQluxDR1
         mzUsk/+MpT7wHQH1BCAggesuRaDcBT8Rki/P2APaa0s6hWxuQTWjHvexfYmvJWNZPDTa
         2NR7QFbe2al4HNNc/XtOx4wI+3ifytmzcL8yewz9NBEDWGylqCYHVMJcAoc3lFsq1rC+
         nEed5B5/qcnlUx0iUn5k98ZBYBBU0Jr/Jrx7yYTQECJw2giZYjiUfumaix1RENYDAaMm
         I05ppsC8fPIhcvhmP0gt39p6uJwle07zajdFry9DJdOB0AgJJFofVFMuOZtww3PeQSzx
         z7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037917; x=1775642717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFk4MckO7vhSCoIPLfehPhdy1cYDQDKTBV4wM3MEXQs=;
        b=CcRlAeNKW9o4sES/YXsDECy6NQg12GmU1UOVBcfNVqLceBatmqVm5aVebEnCwWpal7
         KkVqGUfM5YrYQDiSTE92lHNYZmvTFG+g8TdECBi3NIMwr+tKbaRHBfWKGPaWgCYh4u9k
         PDUgdhKto24aBUSZ9Z9yuCpFbNIxG9yQIgqqWjppNtAKeEI2hPC789iQXxWLaqnqBqjp
         0k27/jZMOAJYEy+BwnYNtGYF75Iqv0b1VsR4Br+ZBEatcJAZpEbyaNEP93AuYDdq4fW0
         LuBzciLmJdpip9Pm8VaT/bEcUMewdGqX0hGJiLHFwnI3h3buPZEsD6NrUV84ZWlFgu1J
         fVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkDxosi00PtiRtm3G4YAqIs1gwnG7vNw94fB8sBd/8LPENP49HnAvt4T3ZOItIxJNwOwctoxwV/9v8@vger.kernel.org
X-Gm-Message-State: AOJu0YzP66NHZildCjEqsoroT1Y1GiabZrtbD6cIZbI1X04AiRywC2o/
	Qxp6UpPDEL3TguldbDB76f7w4hXm2pDlVMUBsdLvKryeBJTL3DzGLNzeq9OGOKLvFGIyg832Vi/
	wbfjcZ1A63NwBCGJRyfC03NdB5+jKkc4sxF/tj3rpIRsv9in9f/iAt82QUg3+JNVpm5T8nNJM
X-Gm-Gg: ATEYQzzUeWMv6nYsmkcL7UACuOzhStSat1gFhbmLjobsh+1pGbKkmXgCJQMZ1ucWjMT
	NUvHDmgN2zJPqip4eAleypxO8+N+Ik8LwtcRSqGkmomcW1OJygir1SwUgnkJPbprHeRRil4pfYv
	ZU6O0pycDqJ0PA3mUWY3biBYAku3j68nkIyidlgmEtJuNrDAEwBLK+0njmRuprIi4MGejt5n+uV
	kpNKx80J15TlGlwFudUwTrbQ+4N5U5OeoW6PoSCmJYRGO8LZ5r3YD5B7CwpO/oVRNw6uD/3v9qE
	QpRgFbHEiVNDCAsF2qlxW5DuCTtGVCrKR3vbo8DVfzWpz0tyL8P8cc2+47rsepkKM2vQ+4gE0/H
	elRCyT4EIoa50R9espsm1hFg1aB2EC9ueiIV7dcVnwa8EE4zdi9JbbjkbDeN1izeht1LOSB85KZ
	NN7Fs=
X-Received: by 2002:a05:620a:6891:b0:8d2:394a:d3ed with SMTP id af79cd13be357-8d2394ad88dmr30623485a.5.1775037917066;
        Wed, 01 Apr 2026 03:05:17 -0700 (PDT)
X-Received: by 2002:a05:620a:6891:b0:8d2:394a:d3ed with SMTP id af79cd13be357-8d2394ad88dmr30620785a.5.1775037916700;
        Wed, 01 Apr 2026 03:05:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66d953b351bsm853986a12.30.2026.04.01.03.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:05:15 -0700 (PDT)
Message-ID: <2971b14a-eb0c-4c5b-bcb4-dcf8f6759a31@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:05:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Hawi
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Stephen Boyd
 <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-1-c40963041078@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-hawi-spmi-v1-1-c40963041078@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69cceddd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1ITcerkRxF6bofEJBuUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MSBTYWx0ZWRfX5rxD1An32V9g
 rfR0+DIl3HED+fKirnqi2j8p9YvoVmhwi9aAQmGaIDsfhOvMfHKmgxRXAlZbk/jYR92NJh4R9MS
 vwu2HLgYB9QEUnIsXSuMryIHqueSB5TVJlMjyPi8gOks4qfv6i1ycrtf5fhzgt/6Wng9qvK+gCv
 gSxu3gNFBYNH2Vpc9CZIgOjUzdW1hP60DaZ2SYzL+phWFHMZRlRkqa4XKo7WUzt9+RNk+q+Rzo5
 mngovj+KYnpU5UhmOoWFjXkqPpXaVuB+i117dmkQTDFSxEy9lAdNSXWvlFZyl97Ju5EPJdKqCdS
 CucuzDZkl+nVVGPzh8gDfpsy5ahcjyIW5Va6NTflv3PWL+IKjLWRvQnI68oxkIMyg/4v7UNnCGJ
 RIQlS+db4SG4EUatlrsZcbaCZwN6vhZGnym9hPpfjzqMPgNSVoCdAuppJ8B48UJIXom/Kg4nAsm
 rjwUJyyJuvI0b5D23Mg==
X-Proofpoint-GUID: AJhg5KL60czP45idTwbZhXBIXiqlEG7_
X-Proofpoint-ORIG-GUID: AJhg5KL60czP45idTwbZhXBIXiqlEG7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010091

On 4/1/26 11:41 AM, Fenglin Wu wrote:
> Add a string for hawi-spmi-pmic-arb which is a compat of
> glymur-spmi-pmic-arb.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Considering the driver change wrt the failure bits, I'm on the verge of
calling these two compatible.. I suppose one can argue either way since
the end result is mostly identical

Konrad
