Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3437248C8BB
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158099; cv=none; b=uZR2mKtnGZX2gbviJC4Y9edZzCfHqnpQe/VDH7Rzv5dUgt23cxLIjiQptaXjAP/s6XkF6wQa2UxUO5dWRndZOakRRFbBTjXbocGAqK/YGTsX1AurUmjk+6R1KIZUhV8P8WJA5+yreoBy1uk22oR+80jLx0k1nX3gaaXTuJ8gqF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158099; c=relaxed/simple;
	bh=BLvf00UtNzx1Q8OgLRxZNA9yulqs3sNezxSotsJsrhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpWLLadW8Tw7ZTsetsB0ib+zGCwEz/AVGxALiBIAKrW+vLnbJveoKij/epIUBVoYyirJZkU/jSd6FFci8WBqHhSrotRuw7aYi9UBOtznvoWNs5a6dvkBSGlpDYVlKOoal9x74Cqw2XmVxnaygG/r/utnEZ7nLFmo6rdQCK0nKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKfW7CGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2dFDc6w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKfW7CGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2dFDc6w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2Mt4191242
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmibFEIIw49ivCvhUFbLNM5g96gOBCc8eFuIKSPykPw=; b=DKfW7CGpTlpH01Mz
	tzUVLVr92fMFbLyAoRYztIhzUn1D9bMmU2pdiCtG9mlAtmshakEUfQNbLT9MlHDz
	f08I0QqCKzWpOhZERJhbJIwJxN45h52AUYytlkD94243bh50rpmN/qMug4K3MBRI
	GJvB55ToNJl25xhAaqEciyLW+3SkkVhJY0ok+gUHJbjPlWnIn4qwOvtVEQy1Pyqf
	0fU5SehtYU+TsLrVQDl7e1a5nfgLaUzKQ7r5/e7Bi4438N10w0qg94crVxsqB3zB
	nO7SQK125pSbaF2wsQjhjtyzazdnP4ZcbzO6JX8EhTC6P0aX45AdR+xt5akEi95h
	+kT2xQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esc0k9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so50679e0c.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158095; x=1787762895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmibFEIIw49ivCvhUFbLNM5g96gOBCc8eFuIKSPykPw=;
        b=g2dFDc6wKUPj2iUAgu5Ke2r9Auaa9PFa9eYlz5zR68i1dl7XewW6Uro+bp64BJwJyH
         DxKYY0VkFmU4ZQyXAMz8pD2ls3PBHDaAV+dRaorUzgfL6kbOcPC+hY/lejY/1kH3UyaD
         SGdzZFsgVggb2d/cca98mMyt8yEPD1P1Mu0tIVfgVCWX7vZ3Ls8nAgpXiG4pRYZfo02F
         eIgCzR96Aocg9RNRBt1LMgpQXTaoW/zD2Gcv/uscfBpA1ONBSEcX8cIrRTp4/Xsf44qw
         DkTaIXPBOsQHNEpXTf8t3ubZfGMRjgfmPElSaJT+V4Z1E/FWY1z2lcTLLi/QlpyUiUcb
         crPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158095; x=1787762895;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmibFEIIw49ivCvhUFbLNM5g96gOBCc8eFuIKSPykPw=;
        b=sWZ6WG9EhA00zVObGPNuw8EjCqQAuhYNF0WqzIrQGjGEIU7tA5jDfpEAfwhI4WeH1U
         BguSc0/Jta5GpoVckhsaL9GQgbyTJPVIjpxIlEp+CtRM3pccAjENNIiJ1gCjajDQU8F/
         ynAQFWsiaePxax/bWCLVIjgoNTVFiHQXRZJg+QPq7IY0z7V8frgM5hQaCh/cVRlAWBTi
         HEFazZJdLOtgQPSffaGzAAbfrJS7Hbc0TaWVDuYNsFTpP4sOxqHoGxJY6L0FQ+KVPG4g
         ut2ecAKNCi2UaIo5xL91W5D9wuF4iDqK1W7gvOs+qHTJQCqQvKr5w1awVyVsbUYRYbaf
         P9bg==
X-Forwarded-Encrypted: i=1; AHgh+RqJi485RjDTKf553Af+RNkMhOK/iZnh1JjunCT8tGVen+TOYdhvuR021P8Df5S3IxNKo8wtIHKItrCW@vger.kernel.org
X-Gm-Message-State: AOJu0YxPMQoettoelcqeSoTt2VkIi46fl5OpnzztGL4D630mQyF9owfA
	H8SPK0VueBK0I2UWqyrnlITjJIHdmf4/Gw89oed50PsZuHcJSPsbCO/4fepoBFvYw+Zf3fNWFS/
	QGRuRpe0T5pAhMOFDYGbe2M54Ln4Wpf3eSbNs/FyaDhKXVqeUp7bQoELmckI9EgSz
X-Gm-Gg: AR+sD12IVJAxT/OYHeWQnGEuZ7IcdwOd4dssYMjY39C8CLas60DG2GwaSEITrz73/Or
	ahCJ137sFEPOSQYqKIrW5ncY2uzjc89gtz4Q81e826JTM0KhuAC4UDrxJgV3sutnPsffGOj0xXS
	QYcgH9i1lf5BvNJ045sueccMZgMVvn0NdNnxeilMcPFwC4I0fxPIb6yIpJpucJ/3y92vgDIWCIv
	mHBKBeixLcBPGtEyjd8t0Q44wJKhhobZq2YH2e2SGXSv6nhWJ72MqDAvCql5nz6gWpLhY0oWnX6
	U4VdgtLwKqi1ALKT2Pv4djN1rWlKEUb0ybUIDYaMN8cJbyXQaIzrLwNR7NwSoY0b/REdxnOJG7W
	0nT9cCjEoapQuBUY2aIBlnVmv
X-Received: by 2002:a05:6102:8024:b0:772:cccb:f7eb with SMTP id ada2fe7eead31-777fb1adaf4mr859235137.2.1787158094431;
        Wed, 19 Aug 2026 09:48:14 -0700 (PDT)
X-Received: by 2002:a05:6102:8024:b0:772:cccb:f7eb with SMTP id ada2fe7eead31-777fb1adaf4mr859227137.2.1787158094040;
        Wed, 19 Aug 2026 09:48:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0d5f70sm1234818a12.13.2026.08.19.09.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:13 -0700 (PDT)
Message-ID: <34c4fcfd-d436-45fc-91fa-db3d4d030c62@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] arm64: dts: qcom: sm8450: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-11-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-11-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3vnTn4TMEpTPYapMPMf69d_DnOmqypXD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX6udIDeFqx7x4
 ATKwBmmLfWCMa+4XcRgQNviToNfdQ0nG00DJZwCE3Rkv3O/PFIzuFewOJeFWZTp6GrGXOOnEtB5
 Qyalxg2LziNGnE+2IvMrmg6ehlSplQ4=
X-Proofpoint-ORIG-GUID: 3vnTn4TMEpTPYapMPMf69d_DnOmqypXD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX75rjs2WCBDA4
 RI6+4HNqTM3Aq6YweTijICyffrq6PgV4QsGZWoVzw5/wTWWsHmhdR3LRiWjmiu+ucUzYRmICMhW
 L33yi7RFCrSETi6KEDjmRJSIZNzu7WoGP9M9VDD96vwMM7sjRZj9WV7jAG2235iw7VpWkH7eNPu
 0Nawdlys3VNS9jwh8KZc2Mswx9gKaAZqIu+EG9vrprXV5zyNzYix2YcAZX9YCpyLas2QGh3/jTH
 S91Sb1tMC46avMoEH56oIiOWH662PczoUojFrHnWDEOyOxyDJ1TW1CeaOAk3ZYS40AZm/aSwJkR
 RYpz27Md53hjNvWbiYavWD9kar4YyEl3Uv4+/4rLKRiZRgI/4TOC2hCfk7rhJn4+9b3td5S4BMy
 H0UrVxy7rqNy9b5f+OI6idLwpORL/g0pyI+k8mO0ijhZefpVX4F6Zyk0l1YMOqG2U/1nzDhtrC2
 q7yHeIq4pR9vnC6T3aA==
X-Authority-Analysis: v=2.4 cv=b6uCJNGx c=1 sm=1 tr=0 ts=6a85de4f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
