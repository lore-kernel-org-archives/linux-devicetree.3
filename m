Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963541;
	b=Oq2y9lakwfkQCd4fZ2mzZ3EPI/nKHESyhqyD4yLAM+s0BbgU8PGeTA7yeUqS53KKQZr9
	 ZVcATEoDFw7vHLuV1Y5ovA5Dv3vL7SAuBiwjyEjzAOqPd4V5im+T+pUU5qtIuWAHmcUwi
	 3fsLd/YASaEJq2amOBOzwEpz22OK1GnPu/X/yUoPhUqoXCVz66RBpL5GBaxlUC27T6CKA
	 FO5zziF+MwJmlmJHNuD8Q7ObaAxe292gRgGe75DKNmcAq5RvjxqIOI2vAufmndcLix+a5
	 ZWuinKDEJxR8LIdKWDf6f++3Juk2PgQqAvSqIfGoY1wVuNMe1xW/40BMkq3oODFGBWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=;
	b=sXOumCv8WiJGuGIE0rhQAtvM3lz8/AOWXvAGu87TjywFrF0HI70ZvZIqwlcBwhHzlkyK
	 FoHIP2vdAn2usPuSoO7pO8OriHPfzFltzUYNQeaS9uxq1VOHBkmh9r9j8Wfdhwn/Zd6zg
	 6lebqLYCtEl2Ei+gRdtUZP1LYKT3CKfYdeGHZ93/B1BipSyW24uLKCRL8XY9McT9iUPUn
	 fXNVOYj0atJ3uuO32cn5ebQeE1HmR81aWTPp2kmjudH66cPyFt/zxXJnnz4fkJUTV9oOK
	 eqRueqApQTBKzZHAyqnB5+2J/B/RPHDTFemGstDGxGn///rgFXzAiqh92z4u1P8I2wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m77hjIec;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cDkfHMaF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFEE606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFEE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m77hjIec;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cDkfHMaF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APCAw444212
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 11:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=; b=m77hjIecq+EtZy7I
	UWrtloMxqxzCaZ/Hsoy+bKxsZ3BAEYaC3etLDzVq/+WCa+BrCbFBVlEUEXHSQPrJ
	xp8ppoXjWPv17Sd/k6/oPBKojUd/9U0fyuUcgzrkK0wfuj0atyypUIEXNVOpfC/B
	OpvOUpgkkNKYoMvu01v9FzG+IlNiTuiWVJ8d1rwI9zi/Pu20hDUmAtft1D/Nlf4c
	ew+lUx4FJwbeuByDkuoJpkhrGVBy+1XXQch/J1Nh9v56aMH4GxmYRo4SNiGVIeh0
	OVSgEcN7K3HIosDobFX/uw89oOiOz9Nem1PwBQiStyJC7NnbrUe9B+NihPkVEBPw
	g5HWDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9tj16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 11:12:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945e8a244bfso10670785a.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793963539; x=1794568339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=;
        b=cDkfHMaFJKtAcJEtgzsmZx7PCwN8S5MHNPfY2AxbF1StCQA5fBpYlNbfvvC3S+byLg
         x0SJ9NhOBf+pTNXpNG/dGzKL0wOvxbZLFHeT08+OMLXZb5xAVeBFj99ukq/52/K8otGN
         5qXSJ54TLPwO+xvLQWXjULP2ikHLP+ATwI3inVs/bOD0+SzG6LmCsaA613y4fRWfvfg5
         lO+L5D5RSyxifm41zES+M7q94p/W7KmKiJs0nlqjO7/EiT+vT6x+t2b43q9TODcIWUmh
         Ia8vbrWOM06HClAh3/gPeiFFt6VmUmoifPL5THCg6CJre7NlFnNiFFUkZEDvDCUKg9xI
         JPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963539; x=1794568339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=;
        b=ifkwN76HByFvnm0DNqzz4qFa4U48WlutKmi42+MsDzR4pwRggfNhpk3Tg0xnqMh0U4
         RHbkv+e1jAJoxavCecz7Maslcea2SJIKU0wVa0NYHy8MzF669crrSLP6ScBtBtcbz46B
         ara1+FhxSnNqYNf1Vc/1ms8I1NhcRIF2IvS2bL6zvcsv+w4Y7lGHUvGzVKmJRKMoeTkX
         7Zk35SFLjWWgm9/hYsc3oAYWJKsyLc0OE5TyDeDfFIDJqL2EOi6VsiCyP/zalgFioy6R
         EdgyBiSNkCc6bM2ezU1ygpJ84C7b/UcxLkbJe//B0OEpACm6ZZV+rDL7vebkpTR29oxd
         I7iQ==
X-Forwarded-Encrypted: i=1; AKwUvByMfpOl5v1kNGghG8ZdRgNgaJUJigXbjnjvYqIZ49GtTB3st0oMRDG4gUvnLMRYeEiqvr16IFd08S8L@vger.kernel.org
X-Gm-Message-State: APuU4Z/dRGmVoy/It1xybpfY4pLCtb4U2UyRuiwYWUPIayZsFAe6fIEV
	zEv5UvFAIAF9R8kTPRpXnzdIcDdzX+mvkG3tDxiduGvjkqHkWCxaU6fMJuE3MIZ2kI1V4v4USVQ
	eqAKTueUbHdPHMzDKP24rSEtZfh8AfWl4S9KPFxOOoqxNU481m93ECl/VaYOp6oto4AxmqDXp
X-Gm-Gg: AYBFou3FiO/szneuN3QsUeThVM3Ft/YEfTEH5hXoW3o+IK41L3CzAGwW4yuxIGFQ3xm
	mY2C+fC5tZmY8TRrcX6BX72CIIQDz59zTig8cHpPjPYutxhOGTitGRS+bLO96ueSj5vscHnqirC
	AI876TDIl1mqsEynC/RVag6e6ktOaekA56vJN+nSaocRHrCX27fImUOfyuJGan9O4TllC6OslEW
	clhK01uuAxJm5pPoC0VchP/X0ihmsMaNl1DAPMmSJJwCPTprbM8LoJYvkeJlju9yymMyslrSiN7
	6MsY31PCTdihNewHDg2Em1P6IUoX+kK7OrPmUVQWot0OjOaUKFYM+Cj12fipcTXWEn9tpKsnMum
	iWMW+V4CVVr172drU+aZKSk2k31Q3l/CIPKW4iu4tc6RqfqZnlcraTEvRK/1a2iFcTkQ+pA==
X-Received: by 2002:a05:620a:a7ca:20b0:93c:c96c:a5b4 with SMTP id af79cd13be357-945f3548e05mr299336885a.4.1793963539312;
        Fri, 06 Nov 2026 03:12:19 -0800 (PST)
X-Received: by 2002:a05:620a:a7ca:20b0:93c:c96c:a5b4 with SMTP id af79cd13be357-945f3548e05mr299333185a.4.1793963538744;
        Fri, 06 Nov 2026 03:12:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3566f7fdsm73268566b.31.2026.11.06.03.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:12:17 -0800 (PST)
Message-ID: <72bed879-9f21-4823-a1ab-7d8613d70dea@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 12:12:15 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: Drop undocumented
 'qcom,ipq6018-wcss-pil'
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103225845.984564-1-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103225845.984564-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX8AN/heFjmJDi
 3yOutw0KsswkeLUN/Ac+pyrJcF6Xw/xbxDaAzkZkD3hxTAdI0JQTNJFGKvdhEdWGT4xsDF6OL57
 4iu9s/nvL4aO4N3WXXUuY7ySBSaLgDY=
X-Proofpoint-GUID: M_BxfjJGu4bhunhrq-6gUmWtQ6PnDce2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX3P4yZgTq183W
 W+0Uu6381uhcwZsIHet15oK/+oHcHH107AOIAqPqJ4gJPW4EmA5qIYB4uILec08KY+72IKyHLDa
 WeqSmqD/Jfc99RDIJTgX+flVNtqMvQ2+5QrfE5RtaXOUQFBolSJ7hKqcG5htDlU+JI6tj0FKDFP
 N9W53rL5yoNbprypYEHnLMqPjlLFHvJ/jAJtjdd+X6+Ol/ezL6nw5wveVG/h927v2hFmXorZNSp
 vF+l4ImSun/zDKPz2s5qcVrs9mLlZrBLmGbGrJhKvt/AOFWSWMOVzpLxHJnsmkgzqGt7sUwaD1A
 oNvYo/S/YK80TMCoYOPoNAUjkfV34InsMT47vHKlOk8tAKEIluoAPV+seYZEl0Y/1r/ncSxtAld
 mAh2IhEVnjT1jkY9YdNJJ9LWHGPrdyFYNK3YSzfsY/GSen4TaOwtvWZ/eoU58b4j2L43yUIz0IC
 kYVnmJXqvENt9zP7o8g==
X-Proofpoint-ORIG-GUID: M_BxfjJGu4bhunhrq-6gUmWtQ6PnDce2
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedb614 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BGlS9vUawJadlalJgwIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060044

On 11/3/26 11:58 PM, Rob Herring (Arm) wrote:
> The 'qcom,ipq6018-wcss-pil' is not documented nor used by any driver in
> the kernel, so remove it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Alternatively, remoteproc/qcom,q6v5.txt can be converted and this
> compatible added. I have a WIP patch if someone wants to pick that up.
> ---

I would gladly use the opportunity to make sure the next person that
touches this validates it on hw.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
