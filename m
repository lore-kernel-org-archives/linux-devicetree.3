Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655454937D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088987; cv=pass; b=tdTfimqls+EJhEA5qMRsWa9dJ8Q5EoabMSGUwhPXa1aODpCizxm1XJeMCxroJR5tYAcc8Drr//DVCm2KK1YaBp95vYr/lHyBheZdcaXym5BeI30cO435qWUOZrOiFTP6uvlMdT8PSd98Cb3D3cybNEd6a6Fa5oRHoOjkqHv937A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088987; c=relaxed/simple;
	bh=Gvr9z8uZ9WkScolJzxXQvpxeADsyQ7B+SdrANzKCU/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktJC25Cxen89lZCYXLOqZjgBek25lqpjIbRirFvsHSbAotZAceDQgz/kvtMOo0MiqrOp925lQAu6o85LoL92gYRpoelUNriqOIRCXBrNcSFqcNH4XL8IGdhcRh7X2wQktQanTlHVnlNXReCzvdFY+ICgLYhhQuBWXMLagCtMwWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdTZP08g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQJ6Nalg; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdTZP08g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQJ6Nalg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjRoH705883
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=; b=BdTZP08g5+gwJ9VH
	KCFil2EltUtb4zHLkQAqIfqPWv2gfvy+bFvVn3Y2Ajhcz19MtLCLiDNrdVKCjg4Q
	bYRPyaTfaCa4lOvb04xT9Sez7eCZm4xDpq5m2iqnFkwryspSOHPu2pUmMHQQbVWg
	pDZPGBYeM/P0+X952PD7meN8oZiHpRV6BObK4ri+OKQLLR3bImB342iDNrbIf7pE
	qzo+gdO3Rx6y1zT6kj1SNCN9IWT6UPf3VEuWPVUgQJ5paZQcbahMmQQe6HuW+MtP
	G0eEdYGc3VBNsSvIIXDLnYApa6vCF52O0wvGUa908j92Cm10L+1xW/rQaJC1EwzG
	QTHjAw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbaubm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:56:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso7239832a91.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790088983; cv=none;
        d=google.com; s=arc-20260327;
        b=b99Tlr9DIfzO1TixVOCQDRmlxWtdBoVnWD5NhkAYsRUYiJT63eUv9xqFFIzwz4TDS0
         m9L4XHBOMMbud0S2Fn9ZyAgh/7enjc3Dgp+VR1UdTJN48C84q2jLY687ZerbSfp24nZy
         JYjnOFq9Z5uCsbFPE4sM3mvTm+ifnP9eiIJ+iPBiJ4Qgk5l1CvFVhQa4Kv/9Yp8Koquo
         SdaFEnLY4O2Jv5MaWmTQOIzMBmIcQsm8DzwhObB7jczstXbrYrsSX7x8MO5nKvbw+gbp
         noVWDDwZfCJbij1Lf3cG4+VOepAxv2ATBoCeh8MuI7rnDiWDmUgzRyzdWjxV7p7nFAbx
         dcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=;
        fh=/dieOuKNyLrjpZoFdT1x7xOl3or6qei/Cy4oqC5g1eE=;
        b=no1W+9GgqZnepW1RrBu1xwAVOaINfK6/asImnArwjn+3u3KwOG7QzTsDEHzOVLf+Yd
         KsBzw3hHnECscOa5lGpXrWe14uN7W011HdsnU/DpDg/Q6NhOD4k0oY2wZA4Q4UrILhjn
         INmgNMwLNWXbKqFXrPgusjjTUGbzbLuQ8351p+kd97/GC05vtT7Kk+JJKYHgfhhwKQbt
         YQ978wSg4NlVfo1ZuwsnCzlixR50uxr6x0jUtHZ0qkuNSsn6WBjP86qi5VyDzF8gZrcV
         ipk4IJrWaFCsrOLQ5TUOucqynQMZsh4OJ5jvWV5tdq8N7LYy84xK8nok5N93kSx/pb3G
         bwzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790088983; x=1790693783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=;
        b=OQJ6NalgjcSZY0MsahuorKX725+Gio+NG3kRuAmQj254pYZ8C5Dx/a5+H1H3YEtjIX
         7fB/1SpzGsJB2/hnfjj0K23BgtGSJmEs1ScsDEAfU8AQwrUmT3vwxGvkfN5ZPJF08SXK
         3ZC8bCZplQtGF8ScGEPThUVddWNoMnvyAjTvec6iCNrM/NbEEbSCRX8LAKdN9vL1Q1sw
         M11QccXXmb66NIcAjh1am1E+0CzYhzQiF0mG6Wf9Q/W+mjsLdexAG5PSJg7sk94oCjk7
         bXWPqdN/DRzyXh+7IsiKqiEUudTPOhTwsJkZj5G/WqbJ0fU2B5/BWinP9zdjVRm0lE1P
         EfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088983; x=1790693783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=;
        b=QvMCY3Fh6yiGLQVywJkxuZ1atirRVb8OJ/8Pnz5f8WnCJr8yQ1eOX7elri8y9dyrZk
         /HGhF8Z5m8S1T3Q18NN9/NG4xFCpfDHdhwry+sl0p5LVle2v7pM/JpXn15NeckS2kN5P
         i+JRImlLLqbHVrSzPVRj7s7ZC1WgeBxPzSz4sfP6uRBQqsRgs0b3hEJqgrKlI0XTIAcy
         FkfirSrV9zBrkjxUJRVu9vanIcRbC5IduubnryJmpM8ZdlKkqhHtl512d+tUk28e4qKb
         hqQnOPVLo1eIN2s/r7ibt1Ralbk1QRMOxCplMQiVhHhImQeQuLf2JAr92PPf7DLszJ0j
         7/zw==
X-Forwarded-Encrypted: i=1; AKwUvBw6x5WNMKrnFYjbFIdkHLc0/Wf8T/TscjLeyez7VCY6y4kGOCpYGMJ7TMrSbabhtee+5sx2rFzzIirM@vger.kernel.org
X-Gm-Message-State: AFuF++mpTEZAPNHDeblA0A9nxJMXUPChIA47NAfPd2YVZlvWqDSPCvZb
	h8Rb1N2tSlGs1imWnTS5iI3Zrmi+5v1X5wjHVpPwy6i0kgKHrzO2d2nVs+8kRnIoop0o8nC3zvy
	2C/gzWOmqueKIcXozP56ZFiElOPbG9gsHEYmY9/e2ffGbSP6a2YJb0x/5VoYKX3nXm2gCxgPUbk
	h0DGrOvCFp5xMKuJbRbD08hHv8+oVAzOePP1adCTs=
X-Gm-Gg: AYBFou0Al7jKxak0IDVhS9GBFXQ2WsWcXA4dXo2e7Vmk3AIXVQd7QX3FCeoQ7QoUjjb
	yhyPwtx6AnFDalMusPmuPP7E5a6FCf//v2oaFRjon522ZIWbbOyUI4mEjvun4Medy0/uJxFKCOw
	asS1x0rW39nTVfCJfgwPNhppA7s0kDDnDmUqZuhShswM8Keunt8ev83vMAeQ==
X-Received: by 2002:a05:6a20:7fa3:b0:3d3:adad:f173 with SMTP id adf61e73a8af0-3ddec65dc53mr1956417637.21.1790088983226;
        Tue, 22 Sep 2026 07:56:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa3:b0:3d3:adad:f173 with SMTP id
 adf61e73a8af0-3ddec65dc53mr1956375637.21.1790088982664; Tue, 22 Sep 2026
 07:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com> <f2fdd3f9-4412-40b9-a4a4-c777ff023663@oss.qualcomm.com>
In-Reply-To: <f2fdd3f9-4412-40b9-a4a4-c777ff023663@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:56:11 +0800
X-Gm-Features: AcwNN1UKlLikVQy96fk9vqNUhC2Valt1AREowrLvxseRUePla1hTGuyeYqMVWxI
Message-ID: <CAFkd8huSqbHBirAshizAUNUGFQ9VU8k-1RMxjVrODMi-GE2vRw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add bwmon node for Nord
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pushpendra Singh <pussin@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxNyBTYWx0ZWRfX7bx32rtbv0IF
 ZEpEek+p7NFLbWpTK33ssq7VT1cTYnV8jICWQSgKJXboHzNs3czP+THwH0zMvv+eKnCNOl0BDG2
 Ab3mBp59iC/ro4Aj69W+uWLA5QK7gBAivNFI/xwTG4KJFeKw6GXVwc21+x/s8wNLz2s6zOsXS4k
 MIuVyUf9qiRZFw752Nn1vV2eDzLyRg8CmTJYfCP4EcB8sTGsIgTjqxSgJy0X+7m1HqAecIYXQqF
 nOH1+C8yVjcjrEWcFeHOROTAWVJUiHAeiY/DrPVZDPAoi3b7WovCAmSielLYT9bBuISfLcg1JFI
 2G/4nCCMwTpVVhqxlmSgq3ixT6Z3VetDhVOD1CEQjxXTNFLOG62wlohK/vgUfHPWs7gBQ8FKq1+
 HddsL+4CvLRUNTYC2/HG2+prFjaxct3mkqW6YmY1rpw+F9teQsiMLzanxtPz5hkqvjRlFSr7tay
 fYmgRDKhT+oZGD3fNqQ==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab29718 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=oTPx0ikOrH0KZUEDTLAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxNyBTYWx0ZWRfX/qZClEBuHObJ
 IqPe4Lgf5GGkajdVJX24xUdgLEYyPuLBpW5HEGRiLL2iqC4pcXfPEnPe/BDkXvDJfGjbjhcJmTQ
 FkVAp7tiSJsyFrMncfzQpj9HF2kWBF4=
X-Proofpoint-ORIG-GUID: I4gtnByoRtdxXTjgJbgCZ6JjEoTT3e6D
X-Proofpoint-GUID: I4gtnByoRtdxXTjgJbgCZ6JjEoTT3e6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220217

On Tue, Sep 22, 2026 at 6:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/22/26 10:04 AM, Shawn Guo wrote:
> > From: Pushpendra Singh <pussin@qti.qualcomm.com>
> >
> > Add BWMON nodes and associated OPP tables to enable dynamic DDR/LLCC
> > frequency scaling.
>
> [...]
>
> > +             bwmon_cluster2: pmu@1014400 {
> > +                     reg =3D <0x0 0x01014400 0x0 0x600>;
>
> len=3D0x500 for all the region is 0x600-long, but the docs say
> it starts  0x100 earlier (with registers actually starting
> at +0x400 like your node here) - unless you want to solve that
> discrepancy in the driver, but i'm not sure it's worth the
> hassle

Oh, good catch, len should be 0x500.

The address is intentionally shifted by 0x100 to remain compatible
with the existing driver.
The driver expects the PMU registers at this offset, so changing the
base address would require updating the driver and could break
compatibility.

>
> otherwise
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks
