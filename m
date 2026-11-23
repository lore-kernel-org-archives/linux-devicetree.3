Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447362;
	b=OPPZwhLxu02yUwpdRjnAuG1vL7S1qGLz5+Fpt5wj7A3aaB6thlwwjdYGCHie9Ub2nLUX
	 d8hOnVwyIMlvQyePtcDD9r2H1UARAIbXtz09r5J/643rZ74nLEgkx+uWceKMW48phyBT+
	 4uEZMdO8nQgkGDSehBA76KPkZCjhluqi8dG7RI8nBdL8rIhEzW/pzB6kzHXefCBo80VmA
	 DULrwDGU2YuiTqBKen9COp656+nFUeMumTgi+SlpLkjstuRD/hqpaqdYcRGYpREkkBf6b
	 0jabekctlX+/azzJP6uTBG1TFaZHL0s5lGq5Vz8E8SDmbMXUHeD+yzm/KYHIifIaeFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
	b=5o77LOFejDvf0yyjYMdJUZKzqLxGNHALxZy+g235vY2cVg+eJv8mX5HvZQY1pyRH6Jvj
	 dSOOKMdjPVUS4QjFUJmSeXYvMzzuOKj24R8RlPeiJF46x8wR45GEqWN4kybR/mlw1OXdk
	 8g5nnwkWS0NPC7DcIPgTMymCvJq5ss+1KcvZQYQmXKGy5Y7vaiqxWoew7QHsXxMQDOQV1
	 p4PbRe84wjZguQChKnYGFUUhhk4Z4tKuLRkeOThI2BhY+L/MLgG6DrBlFJrJR1HbfZOYv
	 Fvk8h1yUuWLoTLdHHPiykSWZiu1sf1LlILlE1vrrnz8UsTUFrB7f/SJEJdLsSdkxATQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hGlKNPG/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVmvZh4Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D5C606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D5C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGlKNPG/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVmvZh4Y
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLGTb1461376
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=; b=hGlKNPG/fxzm3rld
	gNryU850G1nqO933oknVTgPAvtA4pSrWcdSaZXW/reONdtMatxVdc+s/x9VNbi+W
	7NHeqx0AeA/hlEPBrScxqHg98CKOl63zCsTd2NUjjknfyy8iS3qTXpk9NbhdBrol
	c/m6r8pFhlMPxaPhiRKw1XwM/4fKyxfe0vMyc7WDZSkeaC0AT3SaJ/sJIxbK+lca
	OeNqvpHPTMwXSRkmrEBOnbciyKxDZiw/hEF6d8Ykkz1CGy2zfk1RcVf371SG4q+h
	NsgzTbs7/XiIsTwmz2Evn6XQUdcoFLfsdWnrM/3HyXEMI61nuwPA5Iv8Gc8YUSpL
	HlHhSA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a1yy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:22:40 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0e878f574so52439267b3.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447360; x=1796052160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
        b=fVmvZh4YiAxrcY/nA1nEKHGYeo2VD1jUFnoBWwYqf0C5HJFDamb/XMiuffKCNJPELF
         lSGbokLqKRCReXQvOz7FyCBVJKredJPxaiOOvM9Kk6zBuzg2xypv4dmm1Y9TB4s9h5Xe
         H+E0lc7xo1uPfxeTxH2hEsPYPgnNrlrDEURZ7ajJBwJhYs+5XDxwc+OqtcO3zlJMem+W
         THN02TQrxTWCTU59Jpw9JhsMzgWxx/o6yCZcTR13mIC7z9jk580BKG50Iw59IQ5e9etm
         WcJ4lGAgn1rIokJMr+gawpIP4dwQJduVZc1PIyaxzbDcu29ZyoyqTP8wRxw3mdLgdtTJ
         /oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447360; x=1796052160;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
        b=DM8chOOtOloimUl9MqE4j9GSmymcqZREJABf1XInepAkIKwIxnID+YgBrkyPRGg7ub
         L1Ysi2Ej4k/RaCz1//6zdnSdijJeW9W2q+pvurnD1j7QMzrZWRMSiuz8Z+ag8pZ+9RX0
         IdeD1+vaYz1hpwEQGXwidLow1dMoxCTbf8S3dWi26qtgcYajibzeL0hluXFf+DegxBVN
         KDSW+BxGlvPwj6ij8d3CmH++hliS/9RIotrlF0KQiZNqbgmTWNIehSL6XMwTNisSJkDM
         DewAvixySXQ4TRnkiST6Ux+jFJkFz+XjSRySFvvpq0Hk7v2I+g0ChyB+Cuh3poKGAI48
         60Gg==
X-Forwarded-Encrypted: i=1; AL+hErHjVlhQrjXjSKYwgK1VzRYdl7v30d3u6fjJqQF+9nKiYbBe8m0P9Q655K8Qe7ScAp4m97pZ6uKNTmQb@vger.kernel.org
X-Gm-Message-State: APuU4Z+0+I1gTsVZJZ+UlGE1Q1UQU0+WhRiluvN43MO89iyIbhHavIdZ
	Pe4QQoz0105STlybF3+d78UsWDpBoM8xTojaAej53/x1txYS5qOi9HYo2HSfm+P8pe/mUUWxlN7
	nsa2vtzNdfNb3TSONB/PrWE/vNRnk9Avc2CFKuY0WvRQe+eeyl0CpJdM0cQiobpnH
X-Gm-Gg: AZFdTZcUise6um4Pm/6JEc+UN8sbLofCfhw/JcZQNPzD2hGea2QfyaTuY6er3VQh9Ly
	hVgOPtbxhwTb5dRYtpPfwtrLRrLEpWBi3jWEPJjvEMnb8M+s6RViCiIHTyBXU9kRkAHn907b9nr
	MMbuQg2WlCBSLGE/c0c4AlY3WvLvBPEqX3f0pfrv+nwA/fVGCQg5Rnj+3nELhVVfovJjTnm2BpM
	ymJqYpeBSrryEFVurmo18KhZ8uyoeOdWhUBOywqSqqMgFsKk+yIMAj9kBZBX2kn+8RAwdWKwPca
	aiXYCL1cIRzV79rWUMQFUCCtb+unoE9QyM/1XVfDtm+RsvtLI1aNIDimL94qcsmGQwedisrzcsH
	sx5PNrMjPkPgBF65BToSF39KmPMuDQLJBAf7w9D9wdgQfBDl1LJjnKeQqDD96oSjha/tyLJZvwl
	M=
X-Received: by 2002:a05:690c:38b:b0:8b4:f6be:d2b7 with SMTP id 00721157ae682-8b518e8aa37mr47795377b3.6.1795447355041;
        Mon, 23 Nov 2026 07:22:35 -0800 (PST)
X-Received: by 2002:a05:690c:38b:b0:8b4:f6be:d2b7 with SMTP id 00721157ae682-8b518e8aa37mr47795207b3.6.1795447354440;
        Mon, 23 Nov 2026 07:22:34 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm22927144f8f.51.2026.11.23.07.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:33 -0800 (PST)
Message-ID: <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:31 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXy+MDGyXYf0ln
 gGTiM7jFRShFzk9lx0nnGwNKt949KJeMRytAhdSHnoijPKBTuegCwbg2GQMkBCM9V5mY6MMLERb
 XELmtONF80UEh4EXSfZHoTojc2Q3hnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX3edgGFkxkOne
 7ru8bcbjOKpWEB3TxkAW5P0tu4XBs48J2DdvtklX+OG8TvyeFt9BWUZzb7wlpwr3FxcE5kufKGe
 exZH88VB5ko7DVjg1D48SjNcdvCOZEeTUhNuEYLe4eUJLrsx8F1Yv+Ml/qCgE57B1oilE5bs5JL
 GipY5ucrux8CIpjyvic5jR2PP5ODFnuzYwB12vxJtrHL1/keW46HRNCAunYB4/L2vwNSO2RpXVn
 sDmEcT0ntwuBKdA9NvpQZg/V0HZCC9ZSSiual6GB8n3Uagp48e7tOfGQdKyTgMrEjlj8bZ2o3Ka
 k9UGBNRLkJQ7K9RxcrO5BPxBQqHBoE0KJTyAQpyHjAI5zRjOd3/p+klcj95dtjg0lt9fSZwvyNC
 6bqxjMEu9hwx7XvM1x5qaxUFf+aw2QNjNS9QWZSx0PFUyVzwIMipVHShhv78Az88vN+aI5jrxX1
 k/to1zVOyVyLC+XHaJw==
X-Proofpoint-ORIG-GUID: qlvTaw03IvvL7PNlM3HPnRtg2fbr6gRq
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b045a40 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SaS78iIXIhQ6CdhXs3EA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: qlvTaw03IvvL7PNlM3HPnRtg2fbr6gRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 23/11/2026 16:17, Konrad Dybcio wrote:
> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>> currently used only in the socinfo.c driver.  There should no and there
>> is no in-tree DTS user of these, so none of these constants are really
>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>> that part matches the concept behind DT bindings.
>>
>> Driver have local copy of these defines, thus these can be dropped.
>> This has no impact on in-tree ABI, but any outside users would be
>> affected.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> I think we can move it altogether, to prevent a situation where one has

We cannot move all, because some are actual ABI. I could try to leave
these ones only, but that's a bit too much work, IMO, that's why I cut
everything at ~450 value of ID.


> to take time out of their day to analyze which one of these is right..
> 
> To me, this is the same case as e.g. glymur-ipcc.h where the values are
> some foreign constants that are specifically NOT bindings



Best regards,
Krzysztof
