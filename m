Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B6A42900D
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786977958; cv=none; b=iBjXA6bsV7E3BOPklcbVzKBYIqQBCCIQtqHDgYs9cqPWJa+lrK+qNCqjQtSiIpilPmYk5a6dA86pPkSvPjp4zP7e8Qx52ndcvOTvleri5EeZ02sXvCpEoM3/sla5v/0ktGlNJ8T76u0T9vz/IEwvSC2ZZm0hmMxlxbEQH5S5uEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786977958; c=relaxed/simple;
	bh=tGAuGTMWkft0nCEFvyEeAqJF3j9/Er3FzDm1kAmEHhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhkzAEnojN7jy9rG84ojpv2AjpBzbDaBMe8pOvpf/WzNPKLlygKNjhUWK28CQWWBk34XAMliIvhF4uGlt3l3ndOKA3bQGW12qHaY4f8l2dyJ4pNo/pzQ1y31IsWUZY8DPhqocj6EWybkkgUk+JnwgbPzu8mElWMSkYpcG34K1SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euxEn9S3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtCYxhD1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euxEn9S3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtCYxhD1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD62UQ2329845
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMqRWim8p8/yAeiNQUyjPRFqoD4JEVRgXdNa5ZqjI9g=; b=euxEn9S3u5zgzabi
	8PIeMIe728TUZlG0v32EutagdjWDta5Ah/viXPCtN5GGQIH+Woovgolv45LwiWTK
	2sT2WDkOG7zcG3y5Y+uSceCCPmDkxKgJOKQyN7ck0XHaO7RWT0M1REdiP+vi7+vW
	M/cDCBz3pka/mzL74QGE46tgUpJ0AW3A2wWs/fif8DFcS2L+sqKQGWKokaKTKuJD
	udVlergFgDqRSex6MqO27/74x7RwFSX3h9Sh4b7FhRrIcbRuqATVjan2qa7U/3R4
	C+U/ZBhdoOi9qgmeesK1GCKztmMIaSHad6vAWxXK5THkHzXSd6G/K+MfkfCuHmrX
	Cuvzdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vght4vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:45:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b81c13b0so20808785a.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786977955; x=1787582755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMqRWim8p8/yAeiNQUyjPRFqoD4JEVRgXdNa5ZqjI9g=;
        b=XtCYxhD1/N6yeLUcGAAmskK2d48xjG66BTe/qHR0Y1u88yGk5IYID+CWUiqmXwqnyG
         uXhpak63S7bkI/YxC2e+HmC1qMbFwb+wtdztarBMi+DZmT40E3gbxrnnyLRzZ82abJd3
         SNVSiEbNe2dO0pn1EB1yja0MwgP2MgmBJAJIQOxoIECfRg6/mG2CFVznrZGunMWgU9FF
         6VaO/sGEQBmPi8IPeUBNNeOh2uTppCJBg7XCKx1SO8mOcm9Yxb1OhkuenlFww4ZRvWWS
         0VoYQc98qw17lu0CMwjdCCG9bQ/hZ8D55t21GnX1HSR85zAIJabnQYrLpYXuPPhjI8QG
         a5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786977955; x=1787582755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMqRWim8p8/yAeiNQUyjPRFqoD4JEVRgXdNa5ZqjI9g=;
        b=m8HLVHURtvtd8xBV2cTnr9jwFsfmurwjEMnrgO3YbGsmTa7gNw1XaVf08NIXy7EX78
         aIk/JbNxR/S56Izwk5V3Ba6Kzh+ejfC/mJ4dAFtzjzjzHxYMNa4KIrmC3+usavMvFQQJ
         m/AstHyaEtFs2f7YjMZtNXiqKJIrkiQmpj9tuIj4P3+7FZ5JTrbFYWzcOd6CrxTj6CXs
         VQMxVX9ccZkqilhsxY06/LpU0I5go3Vy0OU4V7sfuuczJrswxmVWSoqHgXev6Ht+SxcE
         Tr3sA+w5QA7MxIQ1FRorlCp4QuBcSbKMgJbL+HzK1FtsNgiqtBwc+bHGahty1bCSm6ZU
         FjjA==
X-Forwarded-Encrypted: i=1; AHgh+RoDYZqGb5liFnNrq+P57xlxJvqF0YiteA/GWM/Dc27UzHVqbQrTQ7C+m8SPqwc0KdkzUmd6b51M0Yb/@vger.kernel.org
X-Gm-Message-State: AOJu0YxWLCZA2MOvNe7YMT/biKx+pUN+SyjECtkPNKTEm3GPlQnF1x08
	uTTLgzTp7Wc4eptDczAdVtwNJLnIgkfKFzc6bz8aCjmzQrhAyVZpEFL8L2CtvfrhsWkyAZzU8C2
	9pyIQUQy7nQvvap2wfxChhnrYTbmeomyN9ro3TyoVW8xG6mnmC6aU7IWB1FKd1tAk
X-Gm-Gg: AR+sD10COA5hIYCCQjzQ4Rs7sObGBnaOUbsLPhkHWRX27htyJwzcnG6qbl+Gzhk325Q
	KvpvQcl6p8I2XM4ykAvD4ShW8dC5Nnp5iKKoD3nWU4OhMAXJF1hFCIoSOuIDBxrCpS8y44Ysv53
	tXx1NvidOEERS6mNbpu54sXvKkLrErIJpvsf2Btn5c+sOD2+/Vj5f9VmUxfE6h7iqdVmrimbS4V
	xs7I8x80IZaaVg7yBGTtJz9in69hGoP8avvOz7GFV1Dt6Mkc11dKMTgWLr1dZBKiCLY/3QeevNO
	1f0b/ZfWJbbFRouYwcSPGi1zriSJpVpAxAm9pIB7axnrZWdK4ndmtbDRqTVg1mIPA2U56adiAt+
	B51ssvzlXS1EPnOh9XvlTLUtt
X-Received: by 2002:a05:620a:a19:b0:936:f9a6:3813 with SMTP id af79cd13be357-936f9a6387emr335649285a.0.1786977954985;
        Mon, 17 Aug 2026 07:45:54 -0700 (PDT)
X-Received: by 2002:a05:620a:a19:b0:936:f9a6:3813 with SMTP id af79cd13be357-936f9a6387emr335646985a.0.1786977954558;
        Mon, 17 Aug 2026 07:45:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b73a24sm39987666b.31.2026.08.17.07.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:45:53 -0700 (PDT)
Message-ID: <93fe0515-2b16-40c8-9deb-985226e3e548@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:45:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
To: Sreeshankar K <sreeshankar0910@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260816081213.5495-1-sreeshankar0910@gmail.com>
 <20260816081213.5495-3-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260816081213.5495-3-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a831ea3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=Z0LeWUw4VpMA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExMyBTYWx0ZWRfX2yQwhO7W8u/F
 dsloRXyRU8bKjsMZxvgk5zG6Uo8ibiL+wOI2lC+gp+cWpkZfO2hU/s3VpDU/zd1IfbteQowPAv2
 hRjU9bAIb5lWF3Z48Ok8uDNSCWAg/dc=
X-Proofpoint-ORIG-GUID: uRi2Cbos00KfjYnjQAqtklGjEEEoZbPv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExMyBTYWx0ZWRfX6Lp2F6fGMEPZ
 yW22z217XNIsHqUtBL0P7JbkRC8kxeCoQRvT5nxQMfS1pNQEsndudAgdjY+aiW29BwEnIQWjK60
 gMOmuDNoWVou3krhSkwm5+XQA3MYyT1hKFznpILb9St6R02CzncM9Fqqs4UYPviIX8z/kEWx8DM
 ibx9r99YNCdTVjhKWn26H/NMC49qmTrXwKgC8fsoWRK+unojpBXckoghmDR1/NysUsZ25H43C7C
 tGB+ZvD7BiDnLKuDMXFVVQQBogdYRexlXPu46yWyEnhVi8ha81Hfl8oSv0FYjC4V+pFJ/32PhKo
 RiAGuozAShly09P/i42tkChCHj4AC2GQKSwpXRDRXj3ZqkIimkjV6a7AOIcJoyPazqe3wHtjS7k
 krEE+VfyDmhJ8VHD+KdX91Ow13ntDclVFSN+mzrWG4LEedNC9j8lzfKw734nz9ceHmnepmj+gOj
 4Gt9IIhp3gZUqJEFlng==
X-Proofpoint-GUID: uRi2Cbos00KfjYnjQAqtklGjEEEoZbPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170113

On 8/16/26 10:12 AM, Sreeshankar K wrote:
> Add the ID for the Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
