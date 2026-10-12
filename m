Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5F149BD7A
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818547; cv=none; b=YUlQPizrvEFtNvta7HCTx5rwMw2e8RKA9t/QMSQQr0SSFw/MLZyoUmWbQFUSc1YhypVHdDTLYAdZ7cHSwXEXVzN60jCpN1WEbFNXTTdI/WUFj2ng45LohN76tOtEwU1mSQsEDP3u5z0sx2Tkgo93SulPX7IBqEy077tW/2gYv3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818547; c=relaxed/simple;
	bh=OU/ZOZCUTF1a+9OBByGIJG7+kpK78IpdvczEdEcaEDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYKnp1ZYRfB15qLp34wVBy1k9LC625znDI9n26gJ3HcI6/+kY9x6MA8dTw4TS6XAS8k8348ycMRJG/33PBolX+jJkygDLsRcPOOj4aDnWjyhzT7HyBOExwQdd5MSVLZ+WMsOMGb36MYUBi9t4KycnJDBEP8gmxAflNfMu/5pCR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntRNMBCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmJv89vr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntRNMBCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmJv89vr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07aU1933164
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=; b=ntRNMBClF72bd7xA
	PfTSDtBhmVN2vCR73iYXOFeVA9nzF3GeVu7FaPmbx6E3nCVPDwMdPW4IHvAWHMRb
	mxON3ieGHnygDWPoE66UxkDxeEPEar7p3cgdvu+U/HstUVANz4er6CFmZCRWlyLQ
	dHRdA17Z6JtXlZV24EwXMwniEMSB76WAI9gDgN43jg3nyH4BWOejW3kpbypp1E4g
	B9hHjmo3/jiq2N53gm+CSGiIUPd2pnEJF0Jciw3NBJpo5SCCapFKEJkQ+bAlV3uy
	ygmvPlqmC3IfnotLN18frROtHeo2g8IsH2axE1r3IHWhmSh6bQXmIE8kiiC1qZrL
	nfMGlw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjvjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cba2460f8fso29642137.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818543; x=1792423343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=UmJv89vrtw+qCn25BWa9GQisvFgyO+smlNRoE//j7iI1qOBE2tOeh52chF6jI6u6O4
         kGQ/4v9/ViNCsy57BDkqKblIBYOhy2K0yZS4S+R/+/EGIp5UIYOJnCqJnpS6f9nhYnS7
         OX8sDTNI16Pjbnk2DLzlA3m3lWGVS4THoQPAJkcalMt1sLj3jB5CFGu4ayXU4D/iyzpy
         WvjfU/fbOViGlZ1rBTcV+8c82+MTVgDMykJgB44AQ2CJKCDAgVbvl0khsBz8bn1f3aMn
         snRp/i0FHAWvDpjAyfvy2oK5sqmGU5AHA9E63utcynOr82ML+QmYL/OXt0kkqlwSxij/
         ySHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818543; x=1792423343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=saU0r0Bt7+SIZFOliAhuKXOdaysw96q93JLt1Qt2+J84F3xFtrUvliSFkeTl/llXcj
         qKgVVjRdp6qiuBrrJfaTxoS2Q59cLXaigzFdI0GE30xVf9TN2r/zNoZYU8uJVy3Ov9G0
         qGNine4dujh5f9cH92o5dFzwBDgsOJKbUK5+pqHlcJWL0i/hGdGSxNO6wjly0ulJ5IpV
         f4UQBop4TV+n9SCHCu5h778n0nl/8xIz/NPCD5Qp8f7cCX0MzUsXFib3khWfJXpDO/gX
         sqVXjVY7w9O8bnYfz5nfIjHT3WAiRubfLmvxRpVZ1it60C6VlnUHYsHZadiLny0ndhKg
         faqg==
X-Forwarded-Encrypted: i=1; AKwUvBwttmxJnrnaZGdYCRxVQ7hIXSGbA4Essiw0KbumP5OkMKjl/TuNMo6EElLi0SzBnkBFDYJJe0lj1O87@vger.kernel.org
X-Gm-Message-State: AFq9FYLhEo2kv8SSHo+NNWY+oTqupRCPxFtBCL+dwv+jZr7fJPWDRK6f
	yWAFaCvpVMKJWfI76W5WzsFKbOhENohib9ltPRX7twAbrKan+VH3b48EUJmTuMO5K3exIi9oXa+
	IBPsGS23S+a25GndapiGHXwt7FfC6JD4Vx1PNUhUg0cCARDgoYsFOAPqhJ/K3bnTF
X-Gm-Gg: AYBFou2afnug9e43DvxCFQqqJUI9BgsAKCyPzsq01hz2Zt3qTVaBf0H21CR69Ny58oi
	KKHfwIv0W/gvhmKtopKrty7zb6OxESreA3kxF6NSSjEYLfsfnS9nDpQHPLVd5DaMkdSLUBsf9fi
	phwbX7ClIotL8Ca6oq0SZRCrj7sCy4BEyZlQhiMGNI7ERjiWTd6yer/Hqx+yq4g5cKUZEy2oN59
	TkcwE1LmMkelHYZdZlz9EyFwaHyAMHv9bQcg8vOE5EY+aRfZVLO5NF7UCGwzNz81qxUxfIfaO6c
	u+c0QSp8pimlVQOtDJXJU81NJhM5UUpmx1Qo5uRacoTd5sEEbuHM6eiZkAtF7tKxgHpkdN24ceQ
	yzuM57g9zJcS73GcDQDePkg==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1457739e0c.3.1791818543020;
        Mon, 12 Oct 2026 08:22:23 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1457723e0c.3.1791818542546;
        Mon, 12 Oct 2026 08:22:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm478161866b.38.2026.10.12.08.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:20 -0700 (PDT)
Message-ID: <f7b698e2-e8cf-4ab7-a08a-40c15c18818c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/38] arm: dts: qcom: pm8941: Remove superfluous empty
 lines
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <5c6619742e9203c7c54abecd7e714ed2906650a6.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c6619742e9203c7c54abecd7e714ed2906650a6.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX0sAJ5iqFq1a2
 848PoiDE2FZJQVlGFl0KLXUYyMhFnG2wOLxWcQ0D1tLs1agsBpCmi9wHOqN6iHQL1iWFsZL4U9A
 Xdmg0rD+y+GvJSvzMqzUBYuUwjZwpicNsoFdgvSozwwnRufxDFwD8PZjm6ynh1g20xG1GFUTXG0
 89XrHMJ446A0vPoy2n2d65YP0vLqGMHNuEgA2G6pOqYNdvp2qEDnSGmlbuGhVFT6edzxdBvOHOc
 JrSo61Ff/qHLgm8vlMJi3tyh84p8V82WHIJtgpFxkRD1Jes8qIVy6dehgcSyOnpzcmUqctJAYO9
 OMPPACqtOm7+u6msrBHFjFk++w3utNhniiodsOhFvoPctvF5hBOSe95rJfFYbiOzKYeIXAzmAW0
 UhwLeP+oO1ngYoP2qsZiauLMTb2kbpA/2+JdxT32QpZ3vsnqFVydOaywJ5tGlg0Jg83pLC6zFUc
 NhLv0Gnbrr6Sjc0HgSQ==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6accfb2f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=bwAYAckmPWK81loY6icA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX9Qot6fjOA7Z7
 GqWIP/tHXBrYjRr5I6o3w81kZnlcs4YPK9o8uSNGY8EO21TeqD1j5pQdlDoR2gS4mznUKI7yNeO
 Z8/3NaJTzLOsXPtE2fT28fK6nW5xDcU=
X-Proofpoint-ORIG-GUID: NmGEm03IUENYtmFkv00yrcP5XrKBDoYK
X-Proofpoint-GUID: NmGEm03IUENYtmFkv00yrcP5XrKBDoYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start of node definition or multiple
> empty lines. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
