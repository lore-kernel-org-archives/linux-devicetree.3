Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446960;
	b=VIvggbPTICvw3WZARskXQetKTMX2nDPNSQm5UllJqPjn8kwMW1L5S+/Oj+Ige0QwLz7X
	 tzoYxN9eGRi03nM3PNU3bMr7paqcxZXQG9/2XWcd83lmB/KwRvA3w+RmpVKUImRhahWyb
	 oCn11lNRy6MtjJ6eudpySY0HjW4fvUsN1DwMXossrQw6xD3QuzmMm8mAjI9tVkUXEH5SU
	 ldsAZUSN4FneYdLELQM251rgN8wpLx4n4gOOTRvqAXs90ffPXAqjzD4+SiolqtXaSSgrE
	 NpQ3mKdjKSjRgzmTOQJkNjtBcJCP6WB00tTBKXDKKiGNu5/ZFsISOvcUnSDyOjB08mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aH5skaSph01CHMF172DkDm1ty6zFx0XB3p8KLyJRcPQ=;
	b=45Bv1KvTr0+C/7EawPLrd1kMH0BSGtEtMEK/Q1wtizzAoXaz/BPyIf2mDFGXXLYQfyEa
	 JpL9PT7dEvLQpoNwFc7HkBDIzfFjuOuV/CSZTuzWRNSAbmmyJGHXHegW3ZXdhY7p8ta0m
	 h2sxCRp7MrdgSxyXseZMowIR/RZY5cjzP53+oGaLmeZsnAvVUUaBGbndU71EoWIWlqIUE
	 3TRpb/+71LHTH/QaoLsFn3d9aNPUEst//PgOG5SWHuswC61pZ2zT9y8QsXvsRoLQYej1C
	 4D57MA4bEzVFIOuxnowfinlVQ/PWN+o6E+VvPgAQd+IAwl0VDTURj6CBtkpGl6TXYjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Zn//tdSi";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCsMCOlg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F7C606A32D
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F7C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zn//tdSi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCsMCOlg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKuZU2622068
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aH5skaSph01CHMF172DkDm1ty6zFx0XB3p8KLyJRcPQ=; b=Zn//tdSib6wwKJZO
	PcGbi567sXU8PqUTuXI05h8BhjcFldG1sAH98T+5PnDVfOCU6IquHB61JLm7MxiD
	abYTfWomy+Zzmxu4yqK8zBrOsKOBZk7a9DK8AkkTc6PyL1tJSsx6Mf9DeifC9cVY
	YUyhgaU9VKqlYVGds+PRbop9RS3KLjFhbGF/Q04kJXqeD854tI2+dGYLE/aBhwXH
	QFgKC9dmaDJfDFEOrYmGt9EOj84Su8bCUH16K9vHAOpR+4a4+abEzhT7fiaqdPER
	f+31Jmw7b40Nxanm7ho6KVbmfXUEtIy+k9HbggPKbfAnORA0wso8HIPrp6RL3zsz
	/RlCwQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa12n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:15:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fcce67c4so558029a91.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446959; x=1796051759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aH5skaSph01CHMF172DkDm1ty6zFx0XB3p8KLyJRcPQ=;
        b=JCsMCOlgur8rZV/YmfhIhODnj6iIoClFNylVOI52cVK417p7uXIE2uUCp1RxDvZSeO
         rowX4fnYBFQQhL5vv4lNMyE5HiA0oj+Robtn6wDUIbfBtMmC4fzTHdhdSCMNTTxTsGbZ
         dClxD8HxPXkxrNo5tBs5FUzpqzbNJMyLsg3AD31QIBuLMhL67tYYjVWOSgEe2/kv9CPP
         oUUYwETQ93HDMugbcm6weBtKkORKkTa3YsK9N9BcfTDbGoqDzF8cmCLiqRgMZGbtER2F
         OwvB4ueT4DOFe+CgtiNACMHNAtJnLmENnjoDYVXzNHlAAfS3VobFrWMsQIPBBD2upUi0
         A5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446959; x=1796051759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH5skaSph01CHMF172DkDm1ty6zFx0XB3p8KLyJRcPQ=;
        b=mKMe+17htOfssHN0hjcTvWwgHS0eXPVoKvi3nNznWxYJEk29MXtupq+g2SNZgZ1yxK
         n2r9nhRAoO1z/ytoKxU5J88tCZglXu7bVQJck0ptb4Q9NxFs/x8lZfdFNFAzM25WJ2F6
         3w1j6GCNRcFSDfRg2RBuFNS7R7Hk09eqyyrPZf1QZNcsA4vuSWUuiyONoLjiEsjqLsPD
         IGDVy4Xb3eg+dislwqwAx2mHT9GzVsKzRdOtlVKSIbJcKCbBurxs6MeJkXrI93zho8rk
         U85PfQTNyPSTafUHqmXcj2SMqNdZH1qD3/7+M53w3uyiRe0f2ETl7sYB7UGDR10ACxEt
         EMNQ==
X-Forwarded-Encrypted: i=1; AL+hErF5pTrInkwdazO2EwrJAPKew6GB+4YByNq7EFBcDJwr91u1sYC+65Iq1hHhY6Ydd0spWjVeiv0LCiLX@vger.kernel.org
X-Gm-Message-State: APuU4Z8UjeBo54nnN/5nBZg7CuvQTeUxihxM6e3Map1/wd78NU7gW5nP
	8kfvM6O8DWu1O6BzXNa1gy6X0g4P/Iu4kCtWlz3wZoNxZZQWG9OANeeWjrxiy8ecnqCS8JCdlTk
	5zQYSZ6CKktI7w7/u9sPuv95BlwmxaBQz69QtL+l+MHn4zUtGcJKQZNHSQhMv25k3
X-Gm-Gg: AZFdTZfY3fK4CtajVDaHoJtuBvB5fKaJX5R+BSsfevfjDbDDMkAgQcrGb4av6EtIZ/B
	Vz7Zk/67Cqkb8FitkpbpndtrJtrLH5GFCc88KST0j548SeLFumAViafe8Joi8jyJw7a5dWZ3MS2
	MMvPHsXCEECyDKn0GN37gBb579/5pTkChU9LIKALHDYTOzTlWCbWy6rvkTq+STkX2RAd2zj/e2H
	JlSX5S3WjNG6OTkUleFH5oRdFuKAnkU5cq6V7UWyX4KMQhG2VSFm3zxewRHqrH8WI/KAPcatak7
	onvedmbYSQzwke0Bd/+5JPRppZyjksZ3dIeGo0pNGyAp4cA2SX7usZSXXxkUpADeRAcqb3MQPah
	v39YI8y6zO1urGlbI0FpjCfuUPDmdtjgxV4grrJGk70GPqLVzrxWaTn4lc9SU+HUXmPPnh8I=
X-Received: by 2002:a17:90b:1dcd:b0:3b3:bcc2:490 with SMTP id 98e67ed59e1d1-3b41c7c77f8mr17890617a91.1.1795446959103;
        Mon, 23 Nov 2026 07:15:59 -0800 (PST)
X-Received: by 2002:a17:90b:1dcd:b0:3b3:bcc2:490 with SMTP id 98e67ed59e1d1-3b41c7c77f8mr17890551a91.1.1795446958492;
        Mon, 23 Nov 2026 07:15:58 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cd368sm5502638a12.8.2026.11.23.07.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:57 -0800 (PST)
Message-ID: <5b7fa9d6-f813-4de7-9170-a4c21fd845e8@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:55 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm6350-lena: Use QCOM_ID_SM6350
 from qcom,ids,h
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
 <20261123-sm6350-msm-id-v1-1-99482c9ecc48@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-sm6350-msm-id-v1-1-99482c9ecc48@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MPuPLhdgDe3CMMEVp9SrU0MY3xPlD5Mm
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0458af cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ecAgE6h4Pg4Z-y-LirQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX/F31XsIKoNg6
 q2S/qzZ9E7qHkjMc4E7MQyJkJED/ErGDwSPXQQ5KuYHha744UShSQlsrLTf2qsmLylsKJD2nrz/
 5AsjA7zlEZoweVXKVVCnn9A/6mjdX7A=
X-Proofpoint-ORIG-GUID: MPuPLhdgDe3CMMEVp9SrU0MY3xPlD5Mm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXzoSE5DJRbIvY
 bI2z2qxS/kFm4Rd7Gy7DwEwHf6/B4tldbm5CHAg+bkE0FAOjAWQi7YL33zCRAmOOaXIWuf7VRv2
 nImB7t8HjwtpEFF5e+WJBIsem5Ozovwqxu7D9DUIaX9NVpiPgmptgvIMefRO6dDQuTny27xrkPY
 eDAj66LpLxf1FiTN2h8vef3ejQ279AEaRhUipkLMcnTS8atGfSohvmBvB1g3ef+CjVhmY1vLopM
 58jsQFt7PW/8TFDGx7U72qqO6heDOgZutmdRLE74uqUF+MhXu8JOAB5gFuVfuFpHgrLwG5b2KC8
 1IwuaayUKlJzSvsOA8HgXG7GEinyDRtxKykegNe274idzFvsPJbusXo7ABLyFpFKVsQ7pn9IRP4
 kuyTxqT2Am4EteyO9Muk/zj//0kJbnLkNT6K5sg6Ihv7Dn65tOje5k9N+d5P/uzkKKLpYPozJSQ
 PX8klIA56sqgByPg/Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230060

On 11/23/26 3:46 PM, Luca Weiss wrote:
> 434 is just the value behind QCOM_ID_SM6350, so use the define to make
> the meaning of the qcom,msm-id property clearer.
> 
> Also while we're at it, drop 459 (QCOM_ID_SM7225) since the Sony Xperia
> 10 III only shipped with a Snapdragon 690 5G, not a Snapdragon 750G 5G,
> therefore the second value of qcom,msm-id is not needed.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
