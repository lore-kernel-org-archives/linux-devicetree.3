Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA72A37F8B2
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641736; cv=none; b=K7XG8q0SDtEcXNWq8Ufv9DUp5SkzpZTV61hcB/rRaOM+GdSiM5HIuy7NrP/uhkYLtGZpAhgB2LnFa6FF4qu9tWLgm5N4dvGLWUUdJIis+jz/N0BYfOLDs05c8is38G7dYEkTF1goxvmJ+1gxEbiAW52cai1ZOIoYVHGiaBKVGu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641736; c=relaxed/simple;
	bh=9WJ50u4QzMs2SwyAxYq9+frDRhcZg12tcQlATK9iiAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njFLKP38dK3Ux/y9SPMesv+J4PQvjWNR9COVfJTI/1FvbnJ44sei2jRIbJ7IQJ+SbgDNFDAmOWzZYgc90g613uLP/LFUrOT9lWtdSaym38sjTpakhQukFcVny01ENLJkMpePNpY5kx/AajAzgtlIBJRJsfHcH9btMvIW3TxTboA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCkVj51h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNiXLPAZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCkVj51h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNiXLPAZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOMul4037067
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIGnsKTjN4ABQBgkJt+01XV05mC3MHNIgAGAmhxucYY=; b=CCkVj51hq8h0BES0
	qHbUb2VtyK5Z5Izkplu83U9nF9Bc0DeIeqQqhQ/b/b6VyFo4jVnWdcCByS/9KcAZ
	LZjjPFhBSi625BMWWJ2enSm3EsB98dSmMTls5G7rFjnRneWwBVr455fd34ZA5ruB
	68Xh9U1vfc+VsQPkNM+ApWrs+CU8IyLs+UHefYCZlHZY8u4QUX0RajZ1WsZFiDbi
	C+KuxJ/uyyWwxAxzyLDIE2UAkfq/h+sFth0LFBiJBtODWjKVXmmM+MMQ5HONrfbd
	v3t23Nk56MuFknV6jqL9X1VhsBiOCJnDQK+IH9FPRkzY79mpL6EH9C5g2X70+IqJ
	0aMYMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1763sut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:28:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91598af506cso502163885a.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781641734; x=1782246534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mIGnsKTjN4ABQBgkJt+01XV05mC3MHNIgAGAmhxucYY=;
        b=QNiXLPAZo4UqRWn6JiOxqPKSyeqwyHBOaXBcNDSnTpl9ZyyOFRQppeYkWEnoE0jhaE
         3sFrZpwCcGR7VjOGhOf1bMc6jIQFzF6Jb2jmc9jqFn0T21gzsR6uySzQN3xxmk5kfslJ
         02aBex/YjkY27bKOLyivWHWvL8DX2eUPXAA2ztb+0/lY4K/4XqrUqn6m5VyTrCV9hrnE
         U1D25ozuZzKoy0p+2c0rqx+un9D6OUKBsfYXubv1CLYnzCehYTGdvmijG9/gYFvhBwi+
         pDvyjj3CsZtWFievw8650NoICfB0FHQN6qgmMI0Wy8mt2eVjHaa8XfUUjfOqbKy5htHp
         GL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641734; x=1782246534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIGnsKTjN4ABQBgkJt+01XV05mC3MHNIgAGAmhxucYY=;
        b=d5EjZ7pWV0jurKXu2c1ZqwkGH1QiXls1z6OrZAXOOCKJWfRNYqn+STEleUX7kqdG30
         xPTBSp5BTmGTsxl8jz3ek7R1EXVy0aon40EuwSyndXUeURMXAz2yWT+o/3YoNttpVHxO
         kC1UGeOtH7h6xguNveZ/nWK9ljamMsq3R4DDIHTET8HUmMgXIIcnsl93bEe6UZTJbdF1
         qDGc5D80cJBTT5FzC6Ri4rgakFxYQRpB8Pb/Ftiym1gKKel+ufV3mSy9TvOtzVErRKEF
         hVlJn3veGTo6Eqs1XKud4svPpYkEX6vfgrpGY60u5nJkr7qPbbMM+8omLNt9DiyngYkv
         I/yg==
X-Forwarded-Encrypted: i=1; AFNElJ9WQY0PuaiBhwcxLsIUryaz/FBcF2BGLpFQSZUVuDlfvQzlki7m4KlAKEiiuZvE8ZXXSC3tRUYZgXSv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoyh2hAsKOh0/uAkB6fX1bHf8lRKBZaqvzlq+rccqFCgv7HCbU
	Z3BHUEfmhQv/4JQ7bkO3Fv1Iy9XOvkNlvNN/Zgz7/ARuVKSnHOUEESA0Zctux+R5mQIl+3k/QDF
	9Jp0S7H4YTJyg+1S6JPmHWZqSZcH8BvgQPn6jThYr6e9g/geOQ2k9RiAdE42L9d83
X-Gm-Gg: Acq92OGc7Bw9p1TLW1yz9b5xMI7IXUC7YaNETKtD2PwIdjT4znB1Vt3wfl+kDdiNJ1J
	eZ3Q0BBc6ghqmXw0DBdO7K4/nWVikNOmuv0CQtkcZWrrz0WDFrvufSqNcrBciSmI1ajj8wHG0oN
	pAenj0tU9Ee62S+B4NLHn2cFVvKvoZx3o6Un7DoV08i51bpvToA1k/hLceFG4b2D40sYJ50V/dD
	6smGcQCdqNWBteOYLbPqGeQ34iMxFQF1F+kAbgFUWXOj84+NuO1ptl3t5GVhSd69bAkMH5lfbwO
	gycMGekeVTtaXQjzaFDyONhSKfTFNYbq8uoCKW62KNgrQ7FTxZDD+ld8D//6DgVaDzvf9N5PWrE
	beYRSA99GW0//Djz2oNoZRx37CvcAJIKKz92WhEdvaBEsUmsu
X-Received: by 2002:a05:620a:1a1c:b0:915:6437:bbb7 with SMTP id af79cd13be357-91d8afc9d5fmr205225485a.14.1781641733952;
        Tue, 16 Jun 2026 13:28:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1c:b0:915:6437:bbb7 with SMTP id af79cd13be357-91d8afc9d5fmr205222185a.14.1781641733464;
        Tue, 16 Jun 2026 13:28:53 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm128000175e9.5.2026.06.16.13.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 13:28:52 -0700 (PDT)
Message-ID: <5d57d386-011d-4d5a-8f14-901019f3f961@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 21:28:51 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/13] ASoC: qcom: Add QAIF shared data structures and
 variant interface
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-6-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260605103739.3557573-6-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nMp58qj72VxeZQgRn1DNvqto9qo0R4Nu
X-Proofpoint-ORIG-GUID: nMp58qj72VxeZQgRn1DNvqto9qo0R4Nu
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a31b206 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=GhtPtFKKuhF9vAp-TgIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwOCBTYWx0ZWRfXx1lQh+9IBUYx
 hTzGOTYbPgTzevJen1AcUBi1eEcZsM2w9/7Q378D0FWm+Tf98AfXFPqm+GvcE186Vt6xHXvJ6wt
 i7sINyq9d2wSHa0Cxoij3OjhQnVcHCQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwOCBTYWx0ZWRfXwgrOza14nFok
 luGkpV6y2kG/HOqUS67GJa+fDjSRlmajsYZXtQHrKp0mhrZ7sxRFf2OVXsjPKuLIKhDC3NbPnpF
 wveW35Yorv+XF2HoV7tRgDZCQuPY27PwpeEeZd99kt4dQVQPYesD/ECXppoM4QBTxx5/Q7Nt/lR
 6gGVJgLry41wvrUmK2u4I3ZmdMnQjdOhmpGBoeUQTWJuQ/uS5NNDe+AL8hABms4XHxVteErZ4Xl
 0k/pYe3zk0lg7qncQV73MitKY8RcM8vvSx22SozYWLiY0hrgdTE6OoNw413+p1FmJ7z7pJQ87EC
 BrvdTTsW9RGEZSOUMyh8anhQhhOpoC5MDQGZhPYlw0qBbkU5H3TQQJCYn4gMG/0Ao4l9FMpFIup
 cr9sk8CeRl2t/+tsQdoFcHl6Ruu+D23uhquG/CVUcigPor4R3K0cKgVGJrCh2t2p3AX3eQU+WTU
 OTBHS1ftCoV2jz4LltA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160208



On 6/5/26 11:37 AM, Harendra Gautam wrote:
> 
> + struct reg_field cif_rddma_shram_wm;
> + struct reg_field cif_rddma_active_ch_en;
> + struct reg_field cif_rddma_fs_sel;
> + struct reg_field cif_rddma_fs_delay;
> + struct reg_field cif_rddma_fs_out_gate;
> + struct reg_field cif_rddma_intf_dyncclk;
> + struct reg_field cif_rddma_en_16bit_unpack;
> +
Why do we need to use reg_field?, currently this patchset only supports
one SoC. reg_field makes sense only when there is change in bit
positions across SoCs and if we want to leverage from existing driver.

--srini

