Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027526;
	b=bK1oaMaKVM/KdKi41Zzr4TR3Yd+p1ZYEN3hlN0kLJJh8g5FrwPzepyTYcvcf1rji5J7k
	 15GB4+MMbwBsANYAdlIxfFwMYWE+pKLFRtoajUQCuikzxsXP0kJiuK5X0qA/1dXuN74N0
	 TQTAdGQEUbtXrCpyApGKYcQLHF3Onq8558U2qwSIJJ7BiKoxRS6c4L4Vb6dLAByRi5HBs
	 uh80TkeQAP4xkKZv0G++y9YqYc0GUiw7k3pziJWseY0cm5rO0u3Jp9scjN9GktxuMUUXr
	 izuHoHrN40ryRJ7IL0kj4X1XVVj1625lyoSVfCD9hhRhmoQIfCzuTpdUGPkVG27C8kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=;
	b=cvvSnpEGM2xbcMcOeCm0wM8deYC5xlC7JWtwpLjznhBp1Rnx323oQ2Iyy+pawziSV+a0
	 50kfksItPGXkgpcQF8YlNpGeynpXKm2Ne+XyIHwEjYI56nhh80EToYzalmjBar7sdE4ED
	 zWl9XuRmJ5QHMbsuq7iuAApfYSWXy+DTkTOjyKcnglywyAhl1YdGB/TuPQWV4o7Kc4Zkb
	 PhEXfwVkr9jACK9XcDeHTMD+VDedAw9Cu3D/KBl7SnMErHNRQEV3VvTQULAlH+m6iRaJm
	 H5H3qX7yWG6/8ZAAOKDqsaWpWSn2g2YT0gQ65R15N4ybxyefffZZq07l6XAoCJaMt5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mefbt2FT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeQel0Di;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48A7606A32A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48A7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mefbt2FT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeQel0Di
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwAIZ3074883
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=; b=mefbt2FTJ+upAxLN
	veJjYdu1o+tJ9DEyyULCLvgjWnzeQ4HqySarcMoTaumrnuDxegpMu2/HiaO7vVoa
	hlD0/EDATR46YBTmcUzKQiWp/SjWY0wrBfpTF54+iYvLd0HK674EvvT4FTf4CH+/
	llKx/zkg+2rA3+mMU4wjaSuaGoT1bsE80Hdo09NYnZXoA1d9f4RpyblIrE4qfczP
	ntows3NPP5GEidW7B8k4AcQJXkUjuwS+QKI8Jblg797qaefN5K8syAqBo5UB+ARj
	a9ytIOEYtPDLlP5Mz3kMUDvlsi+JFjYNH0L2581wkkQhnrxnbgz/uileMB6/A3v8
	SXwQUQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdb1s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:12:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf97f74492so106689137.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027524; x=1793632324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=;
        b=BeQel0Di6yLoDXltTsS8fdXhHZHmjNg+0zOlfIBacjXcMdS1RBVmQp8aSh4ATXrjzN
         k3FSnEw33Bt8tr0mwx9BRatHAtVtgMy/vXcDCoKlGB20TRyrfs9Cgk9Op8v2G7CunQnD
         LeM4yN9KQxD/LjqdH9FH4nmj3lJiC+VwnGFIKknJxUuMO9ustAnclJiEG2FSThUuFFxw
         haYdhrfxf5EIx04exMSjs/yGtb2Jp/jPrQ3YdbPfaRT0n+q6177tZ+ftl+3Y7q7vMcSb
         c4Ij5pulfVk/EB0I5UDQolpAhLTSjAuh1CEevARb+uOS+KaGfXfEeT6N3HsDp1qpr9Q7
         FhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027524; x=1793632324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=;
        b=2Kg4k9doBNMyQg7xmfmtvYENqO1g3l3p1vb+X+oTuIHxjxzNaeNSLxUrWSuGrtn6IE
         zOykXcf490vPzdWrzwJq897XI4z/YLRoPbnfoZuwC0J0Dk/TLZXreTKhjnEafqZ4/q67
         YqdC1RnmhEmxEuWeciV1E60w23TmtQOPhNc0CwwKoCR/ShEJuW828rTqmdNH52DdWqN6
         4DEb5K67StJ+36lpzf0dxBitB84ZxsQEB64xC/3xgIxjyyhjbKuRw/eaEODwC/43gYYp
         YG4GcXidTbDtPrMhBH4NZEOmNw+FlOPecHwcKPk/UmnCy0U3QdjISJQOg9AHfXyaSWho
         pgYw==
X-Forwarded-Encrypted: i=1; AKwUvBzgtKkm9F58bH/9SQYoRzePTAtxm8J71P5DBSV5vivRS//frihz3mdOTN6uQANrlB/1Qd3CgSoMr0Eb@vger.kernel.org
X-Gm-Message-State: AFq9FYK9qm330kY7pBQejaTElhdrNOOM7EW5TIZiKNVOzH8YwShZBO1k
	vR3MTnL4vVu6oIQwM1ZQMDp2kLp2MY1T48dsbgc+K4H0PKVy5CA6okP+wkzCcPX3DEfRh1kyFqL
	3LhYKft+KWQi+dwVL/CspK32wIlXg3dMvq72iLZVzRk1IP0oTMh/aAlWJceNOOmLj
X-Gm-Gg: AYBFou3l+ETzt5VdqQgZrAn7YhYta4jOBbikkYCApAkbdzbIezzZI2ir8ePqG7MnRUP
	egMNkEOEZYMsgiU00KEflPKnIkUkzOv6B34Hlj5EPjQWHeBObgP8oZwlSRh3efCE8I/aRHMg2fF
	TtacunvNOxVCTzC5azRNLd9kf8PnMAEVPqR62bRbaoubakwFI0TgyPleMuYhfzzp8blIlvGeIcP
	0/P8Eu7uWhLN/+wVpq58jy1reVtgFqCi9MlMDXVjJjaKScU0++OOSU0KQjCIRDjYiD+kimlEq81
	hqPHxHFPUER9kinalVUV2YlG3iSgas4dPw4mJ9ntZwPxhXJbG7ArGtvSOtugxHaR3WCsqoxhjez
	w43iE9XMc0RTv130pJ4/0aQ==
X-Received: by 2002:a05:6122:106e:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5ec230f8433mr2339068e0c.2.1793027523910;
        Mon, 26 Oct 2026 08:12:03 -0700 (PDT)
X-Received: by 2002:a05:6122:106e:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5ec230f8433mr2338960e0c.2.1793027522944;
        Mon, 26 Oct 2026 08:12:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm327506866b.59.2026.10.26.08.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:12:01 -0700 (PDT)
Message-ID: <436398ee-4bae-42ae-9137-1a4d7d0582da@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:11:59 +0100
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
Subject: Re: [PATCH v12 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-6-09271f583dc6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-6-09271f583dc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OP8UZdIcFueXHCqsBIGep2tJcPJ60KVl
X-Proofpoint-GUID: OP8UZdIcFueXHCqsBIGep2tJcPJ60KVl
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf6dc5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xhZcOr--89cURCpmMK0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX4pIjbrMHnuN3
 q6vkB4HXpPqE+iYEDM2fmAEBGt4RDZVQvCtj+SNYeBcvOBJP2XZjRmHXvGTDQdq+Z2cHtn3S0/b
 EAv5JeHICTjjCnfg2JXToLM04o1kZjI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX/NDpjHMAT2Uc
 lC+ZxuVQEUI1AltQGIV+VGZ/NDSG/+r2p0OcI7C9aHTjSyRom+CIFGzOsOlp4hXrO8XphmE9kq7
 ltDGEvYc+06Qd/Fp53gcXhiivXxohaBUUjwU9dn8L7h46+CX174sIuGSauMmUDdWJ7z0Cs1sRQ4
 5H5EwAQxoKDqiE4AB4Du6btgb7hhRuf8AiqNWRk65/WhyCCibOS8WnAHsV7oSEiBSYG0o6nGE9u
 dub2cG6MM9nya65FsvtefRfM6kDog6Q9Yn5gWoqmivj1aisTKdES3eVf0XBfK6A5aDn+HWW5H5A
 S0G6BqVBno8POBY/pFfJwzKWxnnJ0kA3yT9ihYgKGfVHvshWilpcbDS2fSp8Z49bYrxcKucLeAf
 a519ofg1u2BhBs8sv+K8ssc6d8wwtgijxsfEikxtNwq3qbdx67rUur+SHUVCx0tvYU/ooy1mRI8
 m6y4IATDt4FibhQTMZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 8/23/26 9:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS device nodes for LeMans platform.
> 
> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
