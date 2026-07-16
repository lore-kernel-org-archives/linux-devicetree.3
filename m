Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFE33914E2
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222106; cv=none; b=t03JzsKwPqgSefLIggCA7ihK63ENPO6TrQWOLyUKsqDMUQfy5b7siTWcuPZ4WAovGKPKVil2HveO8w5hfnlUAqX3NfBozqh+9ZNFD6Fr1jbgNQNC3h5t4DmiQLGLSy+WZ6dc4vTb4neuQUp8qCKKPJrL+2m4kerMmlwWt+Y6ul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222106; c=relaxed/simple;
	bh=IzH9dKAWjL5zhJjN5S+5gYaPgx1jmtqrXKu+U7DRhMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciJngwjE84+8gNRRtMg6skr71/wsBeN5a5Z+TpiwzMLJZBbMP5RQ74esxrwLZHS93pfod3GlVPlXBwBWxLTdaWdDtZdTjsLFlBkt1GD81X9/VwM+tvycZMRGidhQFdfnlnZq/IGNW7MEDmfwYFfXd7VdDNPDZ/FcgdYpzSqYvdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9E1JaYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpbuPEPv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9E1JaYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpbuPEPv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSfFs3127446
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eCSuOl0qpTiHN7PLLWqEAZSElKaYF63jWpG2kIdrh1w=; b=j9E1JaYlmWhs5V6o
	ekfId9XEmJhHMKFAqmBebUmX4BnT07cXPsXhYmZCCRHO8vhpTRPMlR6ndO9owqpi
	YS/6bJlVFEeqEDsuu5kHYELKcU5FYyEkUZlaXTpZDC7KNIX16uQsxsrhegwjnyE/
	aj/KRTEphYcaRS7G2i3mtUQgd3sKhwtw3mK9JjCR5o6brQV73/SV/6D77+SnXZbD
	3E/vDb+dyUhKbwKQ6ZxCPe7S15cUjMXqt1lLt08Krnx/SQhxFweILEVBXToGIjGy
	EHMrbx+HZ15YNt5sb/j3IXmfALj4elJfffU/UN8K67IbSvk1ufrhDSdcIk1RjhxD
	QO3nqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7tptq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:15:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe75b7dbso17068771cf.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784222102; x=1784826902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCSuOl0qpTiHN7PLLWqEAZSElKaYF63jWpG2kIdrh1w=;
        b=fpbuPEPvIrCQDL0KCh+jSxeMMyrSsJInCApOzPVhvzrsRuSqAa/6i2bOvCi65+pKly
         woQj629aJxtKwTNtHY00fQp0z/WI+VuiAzaYSr5C8drO2RsZrx3A90j5Scicns2qyLXR
         fzUwso4SYqX9q8SqzUxZO8Rf+fYZBser1QScnrkA+4oMllgRfCWc/amYmVykPsXpnu9c
         Wofw5JlP+qydReKqfThsiTxxbRWfgu3feuUFNGM1edVCniFT2dxzZM9dMEkLVOH03shV
         Eplxafvd2PNc1USnWn0iHd8r8QBGVKlAvJpgySCEiKfoyfOFGV79Msi29C2ccoKJ3H+C
         NSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222102; x=1784826902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCSuOl0qpTiHN7PLLWqEAZSElKaYF63jWpG2kIdrh1w=;
        b=X31RIPZWeevBz9UPPvSZ36xJmOmpH8AGnPTAzJ7RjCsTSj6vni7tlKMJwEk931iwxF
         lNa/CRbiA2i1tZNM3+tzkcpPEmmCdZUX4kTcaIm42jNZKPXF0i/7uu5WDh54Ph25CjjZ
         +jkgQyW+BXwWY4wG4KwH1j0ViIZ2Qj0aZl8J0+jF78GUARVharst7rF1Y682v0gdiCiX
         x8WafBRR4hocWlNT+lQI5Te23oKq0TnkcLcunTe06hA9dhlxspRn8RBPsn85qcr/hswd
         QHwCWkr1ZmV3a35Rou7H17NTmaaanbiy0Ap/wEF3eLBOrE9Tkts7lbQMs15Z/lsm9V3k
         B3Hw==
X-Forwarded-Encrypted: i=1; AHgh+RozL2ARDf3YCu0GOitqtnajSNG3HKhX3KBa79r2+gBc4kYa2cpG+/8dGWkbSXiamHk7QjIKWFfFGxxx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+nRbEDbKpEGe4HsJem/k54d79FCedBtMFx0s7w1bfpvuW49vB
	7Q42ohvb2WQSsWIbGQbb1wrwHoNhL+LbUAppqlFear0kRV2Q3Ji//x289axyqw3IiR+HhEmPIq/
	hBHEDY3bArFOTCPcNXzX9q7Ilbu1PnFiLSbCbJ7H42MTJydvDTP2mMehZvx7fDbHf
X-Gm-Gg: AfdE7clx0yARI40KcMILdNxcVN+4HWHrK0aIJl/Vvn06G46W16EPGKp0+A5YstIAQEf
	0nzddIIs6A5pAhq9D46AC2ZzKijnvnYKrMEe9Smz3bsQC9spVKxuqNF2GtwiVWPRpGpKIbARILd
	6u6oPC3bd4CuXNuA4teBq42lQTBxUqFRRlGymu/oLR1IgH/8E2LML1w3BGGdFGpmWLebEZRgzel
	jR52MaJipaw++e1ZAjO1kam1IFso/k/G1pr4Ld7ZLjqWqgO4I7dWsnzGRJ0XqF2XUGcFqWeGg5u
	HFRg3azMHXJ8JnQ1cEeZfaks6127WGpor4V4guWayjVbM57npvubHrN07xR4Fpwih9sSjgfWS5L
	IqywfyRAXECkjDKdXXB6mp0TK
X-Received: by 2002:ac8:5889:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-51cbf0e84aemr183175461cf.3.1784222102111;
        Thu, 16 Jul 2026 10:15:02 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-51cbf0e84aemr183175181cf.3.1784222101716;
        Thu, 16 Jul 2026 10:15:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16aaee2aa9sm26832166b.39.2026.07.16.10.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:14:59 -0700 (PDT)
Message-ID: <90769e77-c311-4a4f-be37-09065e217f55@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:14:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX8lqzoM/NQbzq
 u1xLEiTNG6gTarJkxZmDaTWOheqhAvcPcGEMgfI0bWhYfZoKxfVrDSN4T1nCvFTJOHVmoEWN6WR
 Fwtff+jfn2PspaEXkT+ZB4J0iTFGMLA=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a591197 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZCp_6w5NnSzxskP9NWEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX0l2xEr14nAQ5
 LPh5wjpYrybsaFn0wn2g1d/bp80UIVUHWNexeeJ039RCKhBsUI2pq99vWhx4pqOz2wLde6uBOSZ
 mvj/GnTQV0wif1x5c3s1MiqnyW1OP/DsgjVreAWtL7BkCqsGDaxhRPWlNE3HC1bbJQjPB2F7Uxl
 IdA6oWEEHpdwIQs03Xfelm/k9m5X4Nm/Z/mCndaUvl1ZclmeWUrSCfomdGPteV+gClZwFVu0UsZ
 Bm5xajPpnrWa24r/wMMayyENjE2qR5+qCXEwx5lLyP5YrKpgjVm/UT0j4aqts2mKQf8Sr6XIRae
 9EOjt+hwEFS8hTRaJCxzawNKzLW9LuGyhQtky0rXw5QeayKxUBOAqAd75HUVle8hiLayaCbHUvb
 ASgJ2Rdb/VZ8preJ4A9c3Y+MRFnX0ugNg8v/5+cpVKiKs7PLi+jkr6hrjqhGQPL9lca3q9qeWu3
 4/CLGeSOahk/K4d5YAQ==
X-Proofpoint-ORIG-GUID: hWKV7-_RqYQVsRBVmbUJBl9NOhTcJyKB
X-Proofpoint-GUID: hWKV7-_RqYQVsRBVmbUJBl9NOhTcJyKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160176

On 7/16/26 4:26 PM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add initial device tree for the Qualcomm SA8797P Ride reference board,
> which is built on Nord GearVM variant.
> 
>  - Configure UART15 as the primary console and UART4 as the secondary
>    serial port
>  - Enable UFS storage support
>  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
>    all sourced from SCMI sensor protocol on channel 23
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +&scmi3 {
> +	status = "okay";
> +};
> +
> +&scmi11 {
> +	status = "okay";
> +};
> +
> +&scmi15 {
> +	status = "okay";
> +};
> +
> +&scmi23 {
> +	status = "okay";
> +};

Why only these ones? Can all of the SCMI servers be enabled?

Konrad
