Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703547;
	b=JdioJbSrYQ5riGl8Mhc4hliFKPUFg9e3bnxXhc8VB2hUXir9SmIh61iXSiYpbcc3ouEv
	 0lBfV6lt+XCnhhZ5C9M3eagSJ2oWPtcIpF4LxunocpMVO357VLzgJeq5Q19YGninJltCD
	 WU8XN8wA+mUd7N/Tpbe29zGFSxT6fXynOIrULUruTCoMSbc9V9N28qLIAHiriQ+Vmb6cS
	 z/QfnwO/wic52nvb/w8yvskOmHwJUS9J2D0F5l8D0h6UvMoXHvPpG392sli25zDZ15rXz
	 IUDWSrykkT7AkGATgYRt4ReVJzstJ+waag6mOZVt/3Ctg3BIU7nGwrA4AzTNk0nf2Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=;
	b=eXMa/CDchopvdTqjrz2H2ocgLqeLXBY3Vim7vfqkSouY+TsCm+mCG9zykjgjilRHT5Ma
	 oRjjU6Af8jDRAkl+tOagMMJF/I7SY5zltvIRewo23pyGU1mP5qmvARG8+c7WuLAegc395
	 KByQFOAYH+0fVeptzaYkFO2/toHAL/ZqH643p4nMaNRIXm5vijPP/EcKbQKpjDqA6PkKM
	 DaRO2BAzhTmlew/Wz6crlBDIZmZAw/ZQUwNHSo23T92KuVAl6o7hIcU7qS6WHLOlNPf2u
	 ARXvX7VoKL9xcwA5KPgxxg/3qykBkhV4L4t2OixAQlwIKfCRFzbiAX4VnQJPwaSOTlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0mpAT0T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WVBusSot;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E10606A69D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E10606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0mpAT0T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WVBusSot
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEValI3144201
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=; b=N0mpAT0TtY5YNQRC
	yRTjq2/3yaeQ1fJtJ6mVsoATk9OntYF5m6Ui+p6CWjC+lPP6ni5NscReuFeKerdF
	s+5YOug+xzU+qIYcD0IdA/kKw1+Ft8bZmy7O5vR3gbrAzdGjRaD+Onrm8R3iWcgV
	GiZZlkxd1IUCwAV4CmHJwnQ/cprXwz8jZPD5QgJD7WnL2BResJI2mzRxI3fd5XGE
	7TreBur+Z60yJ3PeBxMhFTNpMVHY7arBv9LmGdG79GSukqc2JYaqXCGXgu7s5cu+
	+eVurKvvrB7kqZwfscRsxZUhVKbcg5QJKo5h7u1C21qcu7Sh1zkYmcq2w88CQJBV
	ZBIxcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvsqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:32:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536540909e5so15662171cf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703544; x=1796308344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=;
        b=WVBusSotwYjhCFmAeRtn8ThCTc43hAuqZ5TiEtU5Si6p08g/RFcCxCqujRcOfAjnyv
         +ZuF238XV0yXN70bwAjhOTgulz+Z03qw5YvwrQNdfgQQy1GrTeBU3jaW/b3iHqWdX/s9
         YVUI+hj+PRes6qQ3W4AAU4LBPZ276Y//EIqyh739jvxd5i/Med88fSL3zy+igWaWCVoW
         hRZRLBZBA7lPedroZs/C3oDc0LHbCxCcuwT2uFpbJI4p2jmFeMnFEAoml8XpyHI+RrPf
         +ByPorwmT7pAkWlq3OH5NuDWnrIYcufgepg/4A3+MvskZjVkjLmfNwo8B88CrLsZd+w1
         qchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703544; x=1796308344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=;
        b=o8wQByl85/oF4M9F5qTqhCjtperrL0cBfJuFIvPdmdYZYjPJIvtZb+yRGmuDtpgY9F
         hw6Zb3zKSyzNHp7Jm5C7ktkTP/cA/5FjagIJhtOPfGOiUBL8CeN8VTl5zME58iXE8Iuc
         CFaH1g+ao34IXKlG6Jsb+LjIjM8UU687oOr7SIWmwj5s9pxmL14wnul2DwP+Nlpj2fGF
         Al8GjQJmZpigIvGDxK4Wft+NEPgdygicIoR9dIydSKz7pHbfyNBFLHJYS9cohg3KDILY
         PUiaJXbIAMiKJ09USsbW2M91ZALloKEjdKfdeEn7t/AU80348xxRg6dtjRkQY/U8kmZv
         nJzw==
X-Forwarded-Encrypted: i=1; AL+hErHEQNPa1TltFyRV2AIHnKYMW67hKQAYrS/IXksxywQQwRWdPDBREemjqv1d1j19zIgeebbbuZPjANDR@vger.kernel.org
X-Gm-Message-State: APuU4Z9TqzvCPrckdm0B8QWQjdN1klp6M5h4jr1HL/VNt2GysYw2hz6P
	6XvV2fiUG2o3Xt1gpGM9YiJzjXT7YkM6aTsaffazbebPaia/yULgslFKMn7URRoAHmXjPTMWmYj
	adDEe2XX7qEPaWPVqqaUH3SqmeDzNIxmGwc8vLPuzR8Wpq8JRJaEsTGCzlHMxiE4r
X-Gm-Gg: AZFdTZfGTzaElmgYZrpJIBAK4+b6ZNp4gEt1aYcrPVilKt2dlNIu+QGGvFc1u43XxWE
	iABhIul56CxyNndvmcv11nYKzLVc4pGVytlKNrqcDtnnbALKxKrB450hRbjWEvxh145/UH+7joM
	ftERIcZz0gVN9vnAknaytF5pjXOPexvOjht8XHI3Fljue6D1PCkMXjfyI2BsyZ6reAwGtfswHzc
	Z06NDiU9MOfPCgBXVgD2clthdX4DtZMJCTIIm/Eg51raAfic0wpcWwOn8kV9i4FlZ89EFKkBF0u
	6xQVicqhNhTk8EXWlfaPy2fwhrOra/3FlyaMk1AiuD8iRTadpimgccCo+vnJRf4qPyJQ7PDPyi/
	NCrkhbYZgQlAKwLdXzB3P0ec+Tk5JeEZ10ZWD95rzlaX7l3NEKoA2FXFlbDydUZ2JLMUHd88=
X-Received: by 2002:a05:620a:6695:b0:949:a3e7:e0e8 with SMTP id af79cd13be357-949bab1195fmr3255779585a.4.1795703543623;
        Thu, 26 Nov 2026 06:32:23 -0800 (PST)
X-Received: by 2002:a05:620a:6695:b0:949:a3e7:e0e8 with SMTP id af79cd13be357-949bab1195fmr3255776485a.4.1795703543156;
        Thu, 26 Nov 2026 06:32:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e79f2sm9938527a12.15.2026.11.26.06.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:32:22 -0800 (PST)
Message-ID: <61abce04-a112-4afc-91fd-9591a9de25a3@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:32:19 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Make the ADSP fastrpc remote
 heap no-map
To: stoicoci.mihaita@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-sm8250-fastrpc-remote-heap-no-map-v1-1-68ce6470e82c@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-sm8250-fastrpc-remote-heap-no-map-v1-1-68ce6470e82c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ep5gG8_4mgYf38JcNFGT_NfKPknzjffk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX1CG+yLvc6ZaV
 fXEIwAeM8les4lJRZseDpfy9i1+EzzEzYbn9JXAPls8HOlUOvKix+2rbzETDPIUFtyFubtunfbr
 87fy/0xVEHyqwusjvuma8yWjQ6GIEkQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX+loI5uY/pY5f
 iFLmZOBD0zkJRcsvkJszKmSIF3zZcKukE2MbIzFcd1mzDJ1b6p83dpXAHNLWQji+/j+opYiDeiv
 H95BhwO7GtJyw1wc/WJAE4IVILsGiaLahpWe3d4B8v4VoGUBnBeFGIHuTr/jJWJ2BMnNKL7Q32n
 o9K40qhcGGYnCFNv5Yv9A8W0O2kwsecDBcl1GvRzSAwxDBvRPBU0yBKlcpcjmuoA+8N9QcEEhB0
 qo9GY50pk+apW6zaMvANgaiPjo1WNaVJn5OoYPwvG4zQ5nyYHFAcSWezufFYu0V8I+kbWCUUXJz
 7TtcLDywgaAfted+9Z9pQV+em59b7+53f72vjnGAfPFMbkU6VSrATNI9/iK4jTsrztCiJb4qbTs
 SqArRutrj9B0Nzv1jOJYWmyPkqGWJrj/fHvWX8fwmaPH82dPhnIYSfsd82Lr11GtwtDWFezdHa8
 BZBjhITxCPAS0qUkBQw==
X-Proofpoint-ORIG-GUID: Ep5gG8_4mgYf38JcNFGT_NfKPknzjffk
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0842f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_ROeunYG8wwyJrT_Ht8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/23/26 9:54 PM, Stoicoci Mihaita via B4 Relay wrote:
> From: Stoicoci Mihaita <stoicoci.mihaita@gmail.com>
> 
> The ADSP fastrpc node hands the whole adsp-rpc-remote-heap region to the
> DSP when it probes: fastrpc_rpmsg_probe() calls qcom_scm_assign_mem()
> with the qcom,vmids list (LPASS and ADSP_HEAP), which does not include
> HLOS.
> 
> The region is declared reusable, so it is a CMA area and its pages are
> still lent to movable allocations (page cache, anonymous memory). Under
> memory pressure the kernel then touches pages that the hypervisor no
> longer maps for HLOS. On a Lenovo Tab P12 Pro (TB-Q706F, SM8250) this
> reset the device within a few minutes of heavy use (browser video,
> Flatpak installs). Nothing reached the kernel log or pstore, the PMIC
> reported a PS_HOLD reset, and the TZ diagnostic area showed a fatal SGI
> on a different CPU each time just before the reset.
> 
> Mark the region no-map so it is never handed to the page allocator. With
> this change the same workload ran with the CMA area fully used and no
> reset.
> 
> Fixes: 531ce288b6dd ("arm64: dts: qcom: sm8250: Add memory-region for audio PD")
> Signed-off-by: Stoicoci Mihaita <stoicoci.mihaita@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

