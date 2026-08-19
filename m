Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA2424D64
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136598; cv=none; b=GX1BkK36FZV85E1cbsz4uAuCUlPiGQHjuHvW/1o0wIqULbP2ph+ugu7VLtKBcXeHZdH44bHRomgTtCTpXKK++46tPnSWvJPbAG+PV0gTQbEchYudBIKCZnhtnDqp6rssk50wCRUITOMvxLlX6liOEEchs59dMtFbLuAblw7IvY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136598; c=relaxed/simple;
	bh=9JmnZS221d1JvBIZa1qatSGslsbr7jijkIxa2eLbfU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRzXY8lWi7+z4lUG/hKPXuH0w18YS0lSJkCSXNoateiX8if1+HlVXULS+fjDtUxIRn/NhXFjA9WR+QGIoh6TSpmwzY448+wJBBd6gucxfC7TbguqjmNHwtp5a6ScHIycadOHniJWyRHbJ9VwZ1IfBynGFoHnDGY0f/5RBDqZFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkcWv+nr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S79TSadU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkcWv+nr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S79TSadU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8Ciq3216598
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Fk2HY9/VfTuFyn+rHfbA339bwk0GHoT8EcRN9jbuZk=; b=GkcWv+nrQT4q+r7g
	AYMgYkfBcKdlTa5ZaIPLp4aJKqgsdaZ1uTtWpvKuh58mpMShav4FkTSIqfgJWSwk
	c6Vev4edzWPRb/CRBwxvtkJXX6oHOmXqzjAn7DNA0Suzh5QHc9xct+gJhyXTOAn2
	/t56TvAQN2JkoRcoZ+wOrrgxE3/+7Suu8357/rWAYNyybpx0jaNuVljYE+lfdOvR
	SYWeIIgMEN1Lsmm7Gm5+BJ02ywGN38qWPcqTaHFv29dgucA5yVZfQfIV7dRJiqeN
	VEoaoQLNiClrZYC5pe58pYQJ42rSfk95kl3OURhUNWvqla3vtJjYTAAnpt5Ne50H
	GnTocg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm2sbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:49:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so1461621cf.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787136595; x=1787741395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Fk2HY9/VfTuFyn+rHfbA339bwk0GHoT8EcRN9jbuZk=;
        b=S79TSadUQQHwmTXRO0wh3+Gh8sWtdP3jPXBZqI6H2wZwKK0HEGQGvfQ3TfMMLDXfSA
         vVd8kifuDe0Q/gLptu4lltJS34EcFhgFA9XqlGBfKaFxPbTzcsFYF2GLgCXwKDqMgn5n
         AwD4HzZPt6qHeijl92yVP/OrN8JTuTSFFJ7pvpF6AmekMAkcxREoM10LrvGRi3Gp4otQ
         o1phv4S0Na7kjvUFfU9Mdx0mrR6zsHvC3tLeCJirqI55VemYk+/Pp4t9SJ+nqUbh+By2
         jzSX7eEKT2XGh9ygM7z51XFzr0tsqMU5ubEZkq0geUxWPb47gYX9k00nOLvasgwpbLt3
         quLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136595; x=1787741395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Fk2HY9/VfTuFyn+rHfbA339bwk0GHoT8EcRN9jbuZk=;
        b=ACZHKhJP4z+/tma2Ao01wLkpqH5T3ILmRL+cIWKqNiDo+N/is84PNcet1+C28mpUDs
         l1t0/cTQ+aFj5DFJFyriRbxFEG0YF62ljpegMy/VSaA6fjZXOTahVEJ0A+srktiq7FfO
         Smb4vYrDsgWRrH64sN/2nkYGxRwCRR4/BcrLuuWBiJaf0Z0u2YE1XiCbfRGPKhtSXLJi
         WuDQjhnStZuxlD+W3Iu4wHlAfTGEFFI7JQHX5prL9Hh5N2HNsBZI+L/p18X1RhPwCX6S
         CetzyjNpOJMC7ostEhQDIM/e49MVbMZMfU+U0FDh81Rk/CkNxyS1kV9xsPCwm4cVCtmm
         6cSg==
X-Forwarded-Encrypted: i=1; AHgh+RoY22MXrFhzPmxo3fIoX41wv69Hm6ItVutZiNtnzZp4xK+t+Hn6Nfuh+Sm96zCIPdja/NMAbNP9VGjY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QnbX/mwGgCwbXzMh8FR4gBU2D4hYnFmqj5MFYh9RE5lIR5gs
	7V7tLnGi+j3342dVDoZ3z3Gn+DMt6u8vwCOXr9ib6qZ+XAAqF4R8Tcdovv94fjj1VtXODVyaT9J
	SaC5QST0eThQ5pPcHfLz1SzG4GFgvNVVwPJ58aUaNDXmCno7Z+19XojG2+quVqELQ
X-Gm-Gg: AR+sD109q4sBaWmxqEYlpHQtUUVDevhxowLWVWJ0nsgFVW+tHcdG0TVUlCPXx5PPw16
	ngJoIqdcY0f7Cd75nG3/oCp515aJag5+Sc8Q3oi6KDEKB7w9/l9Ln2p9ak87VYFx2M2k3VsFTpO
	HJI8oE78D8JoBAcLbuuo+W7wKsPek9aHOgyavIeW+iTfHtUssJdmxsPFx8em17Vt1YuIuDVqM/3
	bQGhhLIR/N385TeNLvN2iIhfzo3PxnHyYJdlT2tAuTj7BvO2iydlwAy76yp/RZkXwtAO/n3BTus
	fikQagzyrpN+O/lZT/Mj/XC8HEqzAYIITee4WD7f+cDuIXbfL2F0nfHW3jA/IfW8BD0rh8zHbcA
	HA1FaGsK+Gfd9jfFbyX6yw4eY
X-Received: by 2002:a05:622a:491:b0:517:5d21:9899 with SMTP id d75a77b69052e-52dd61c060cmr25953481cf.5.1787136595362;
        Wed, 19 Aug 2026 03:49:55 -0700 (PDT)
X-Received: by 2002:a05:622a:491:b0:517:5d21:9899 with SMTP id d75a77b69052e-52dd61c060cmr25953141cf.5.1787136594890;
        Wed, 19 Aug 2026 03:49:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c5a0764sm55511766b.30.2026.08.19.03.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:49:54 -0700 (PDT)
Message-ID: <bc7bf942-d01f-4dc7-a031-f31e41172cbe@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:49:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: monaco-arduino-monza: Rework fan
 cooling map
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803-fix-fan-monza-v2-1-c10af16c552c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260803-fix-fan-monza-v2-1-c10af16c552c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oHviEaVVZ2uSgjJXn8-tqfeXddry0pos
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a858a54 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8p1H0VLlgo4WrugqKUYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: oHviEaVVZ2uSgjJXn8-tqfeXddry0pos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX/IPOJWic5+60
 rw96HYlNqD+vy1g7tKo6bqdF2vv9z0oBOhz9Z1fgC5eAe2azVzrzQPpjfWg7BcscUHdzDYs7CWE
 Q0HZL+QZGu7kCjI/U+/qMZc2Oy/ymXNCg8qWbjC0B5FuQtkOHBpeSAA7Qu/bEK3g2fbQW/1pHR5
 rYKWNYCgaIgyfDTwQw0LVSF6hOT7PBlVw10Tt3NTYq2d4GUkzqtj9Co7KGVjnFaatpvePqJt2Yx
 1ghARilS5uvxSDyV1CFofVmzYPbZasS/ZoQ3KyAqQJEQuIV3fKJwHBLtBl57KBsfqq4bnL3Xx6z
 88ATBRwVZUlx/U1b0ghFkP6cS4vz37PHGOh3H10g5HqXLsa/6ch7lY6koyFAHix6iQGX3WoMK1q
 wPSGgpUeSJBPNxeHBWVAK9vAcSXeIyEMpNDODwSudAb1A2iRxQlJGevZZckQcZC2RtlkDGGiKye
 Pr8ghkfeZpMP7ARrWeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX8h1wewhrTt2V
 WQkFwLiuXiEiw9/U9IIn4Ms/WXQCL7K0KQQRcqvi8yel4a+lzCDS3p2Vqw55J9m8oym5VTb5+P5
 GU1XpjDV4opz16D4CQwYltBcn3PB8zk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190083

On 8/3/26 1:55 PM, Loic Poulain wrote:
> The fan thermal zone previously had a single "active" trip at 32C mapped
> to the fan over the full cooling range (<&fan 0 THERMAL_NO_LIMIT>). With
> the default step_wise governor this only ramps the fan one step per poll
> according to the thermal trend, so the fan speed tracked whether the
> temperature was rising or falling rather than the temperature itself.
> 
> A visible consequence is at boot/reboot: if the board comes up already
> hot but thermally stable (temperature above the trip but not rising),
> step_wise sees no upward trend and leaves the fan at a low or zero
> cooling state, so the fan stays slow despite the high temperature.
> 
> Replace it with a ladder of active trips that each pin the fan to a fixed
> cooling state (lower == upper in the cooling-maps), turning the fan speed
> into a function of the actual temperature band. The multiple trips also
> give the tsens hardware several thresholds to raise an interrupt on, so
> the fan is re-evaluated whenever the temperature crosses a band boundary
> instead of only when leaving the single operating point. The zone is now
> purely interrupt driven, so the polling-delay is dropped.
> 
> This also shifts fan enablement to a higher starting point: the fan now
> first engages at 50C rather than 32C as the fan was spinning almost all
> the time at such low threshold. The values are picked based on empirical
> board testing.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
