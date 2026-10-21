Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574634;
	b=N+JsAqvYK34MzJVllUnBgMoYx1LbqmN/aae7Zyh3ZE0hyBlAb0LTXWdf/2F9oDQ2/W77
	 XE0foy5fH94BEYurG4+kphbbTHErQyyJo+0kBj8epvt3HNh02vIuPtwkzY38q5WnWkCCF
	 sNyiNd9N6G2Ec5oMQQE5zo31xlJaaoKWUfA9N84oxEdoGZUoeU880jdgot+GAta2IV7CE
	 j3zIiJTs2WldhqrLB7CKsya9xje+/3yVASFdDnRogdeatCX8KlOOU43kkiUVocn4s1L8a
	 6fUODpPBKvgiWSgKpvdDes3tscGZPtsxahgmnEEGI9CXXAqQiR0Vk7jjrM3+koGqGwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/Ka9h8fsX8IsL44aOy+qAfpa60eGKQuL/LRaUzSn1uA=;
	b=U66RNyZVty3SBUCV4CUan6LkYyy6OSc+jXhyRt7h/2kDUv43fJFMhksknRmcvBBUkUAj
	 qFuxFeABBFIfvpSoi5WDL/rYfl/eX3Z4A1NtQ28p9WrKawSfedJqVHAGH09EXDWiHmdPh
	 51DMvKzUofBGjZb/nF9jicWFnzINyI+jPyztJ4zpNUrY/62duHoP5aHo0gt1H7zJk6jis
	 uJwk7abnS1mklxaE3gGF7pXhi8NViljq4EFXNi15jehyuFQzs7MYMuhGWp3iUGUhS6gBp
	 8zFaMQOgEI/NoAhmVH53YHQhPs7bplxhVlgsqv+aW5EvmWKe0ItWnLO8LG7KklZ/pPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p5GhBL3c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok06dmPK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F16606A321
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F16606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p5GhBL3c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok06dmPK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jJ3r2848239
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Ka9h8fsX8IsL44aOy+qAfpa
	60eGKQuL/LRaUzSn1uA=; b=p5GhBL3cgmAIKO6loMAHo2v0SDF8yHtFFu1gZTru
	6RZ8tfjhGZAp7kjI3yFZ7Zx1q/Ca7UBTlcJMVsQRNAWrpAehwfKBhNqjQOEDKvsq
	peUF7q0WmZkVDEinhMbAoNOWdQHnz4BoXYqRH4ZT/496tq1qf3LpTtUioIP4/oro
	RRwpySuxsQQkd5zOUlBJSKfZFtLcrmLPTXYuJZgNxWEPF9km8o+ZlonwLIppNy8I
	nnklXyZQUlepmPou38QjRa7eJtKesLnTqNcRNaqDX5w4zX9Nz8g+bhCdg9PqWvdj
	YrA397AdFZ7l8Yac+4znTMacz83AZ2bGhWie5e8pKnTLIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9b1h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:23:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b7e7d5f56so11739006d6.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574632; x=1793179432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Ka9h8fsX8IsL44aOy+qAfpa60eGKQuL/LRaUzSn1uA=;
        b=Ok06dmPKo8V6ebagInItiz/FC2QiTEsZve0yNvMYK9dRc0bj+Tg2rxSppnyfbsr9bE
         NJrjAdENn3Bvjb9ugBXFlzpvvxipnf5i8UctCC86wLGmvxm+jEEq4zOV1iTfouh7XG35
         pipr8AgMr3e9m7clJS3OYNvZ+iM7IS5RGEfObYnXbZaLUDviF8yfXD6/lQM97dmAg4Ti
         PEHgRcsArM485M4kNH52wjP13wBU4MN3KwSjFEW04uk/1E/jKQV/q6SUkxtJcFLfgQwQ
         H13+MMAbYZW8w3PcIfvSNvtwRwwCfXWoJO+cUmISLPsyoYOp3led/M207i1+lNIusunh
         7nNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574632; x=1793179432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ka9h8fsX8IsL44aOy+qAfpa60eGKQuL/LRaUzSn1uA=;
        b=Plv4swSXr1Sb2qHRBCThHnJX6C3aMzZx3PfM2bUvRSPPNjEAxn7it50UF2RpEKGLOi
         n4S3c025FkdKCXdGw2PngYKSJ305dVxj5h82+LPCecGiZ4v9yVlLb6ft1F+7CJPWrvii
         5SRQA+1FdhvMbufruuPC2rtfMuoUBTLLlFDSvWhEsQoClJgUJjrsdk/6mEVMlwcdjFon
         JnEgC7P/tUlLjJtVtJYoV2iD8mfJXLRlRGqDnRuwYLlLl436vNS8ucZ4Prgcq8+y9Z9A
         Y7e4f7ONJZntqkJzJFABPkjiCWXin5hrRF7eqHYR6OHgVG+ZTdTLHilragbhBTg5mrAo
         TKyg==
X-Forwarded-Encrypted: i=1; AKwUvBxhams1WIJv0eElHWMtIWqceVzp06RlauS8izklP2XmEyrsaeRFgYUFb3E+o9OvyOihHJ/zoFL9dN0X@vger.kernel.org
X-Gm-Message-State: AFq9FYLGJz9Q9OfxegIUewwrATO81TQFVKI7OEdlilRU6XLuYDhWi9/b
	W7WK4EDG1DxDHZyxU5flS5pxp4Ixl84OLHek7t/Jm5PC3RqfLW3mZ/B8OmsbLY2pbFpUulkANCM
	BhgD4GkSTIQzqbBwq7p7t2XxQnrlkaBl11hRIygsPRHaJhokDzlrW0tbKCl2c7odd
X-Gm-Gg: AYBFou2OWphOniN8aucBA5xgKgcGV9PZi42T+Vfh/6zUkh1YG4S0LuK6DFe6Spj96gJ
	NFBOy0SsvGkpQ1FzW4cJR2xjjXsdVU51XUbgB+dXN+1He43ASjT5i6Ar0HvGjXGjep2FFC8EvE0
	1W6Hx3SPPUm8EJk4cH573UR/BIY3Q9lii9lE99Vv5XLio4SSY9ciA6Nvy6ZB84dAvjl6Q+oLD5D
	qTqNUYuQEQ9bGHm9Cqq/o/boEtcgjnBZqi6S7GJqAIX3GDHyrPiCQXoRNoWkYXeVtUDQrp8hOx5
	+cR21Y83WaUDsyxNYYNpXpTjmxu/gxMA4nLvUmWguwcZXpjuB2ZodhmuyCsBypKhSqg4fsn/y0U
	KhTvNRKL/B9HW25jp
X-Received: by 2002:a05:620a:4542:b0:93e:f0b9:505a with SMTP id af79cd13be357-93f57faf951mr311699085a.58.1792574631932;
        Wed, 21 Oct 2026 02:23:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93e:f0b9:505a with SMTP id af79cd13be357-93f57faf951mr311694685a.58.1792574631307;
        Wed, 21 Oct 2026 02:23:51 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eedesm3949754f8f.14.2026.10.21.02.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:23:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:23:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <cvz5m7jrudw3mhjmmf7aikj4kx4n7ooxjhye4n3u2mwnegsm5j@c5id5su5nd5v>
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
 <063f95f7-8499-4b3e-8641-05d2fb352214@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063f95f7-8499-4b3e-8641-05d2fb352214@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX7oqKtX9ISRJI
 /tzQ9VVke+sjDhg36xzAHfYcPcJ9O4R7E7UR6cJAA3ipFzRwXoq0u8TVkCvdp+4KHP8iN6bliu+
 1gttvCQkqLG80tvZWvI5VYCSpxGgl3Q=
X-Proofpoint-GUID: U_0TiCgWFUogZu8Jm-qctsyTUhMxOCtC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX8D1pLRzKsJBe
 5u/c32R0vSU0DFIW7LjR+FghQDS4IEnAAT+/Be0ejkMg3JvgJiFNy2Zf6BK/MVdwq51oly2tv+Z
 hM24Kscqyr0vSYcwoEaaY1FrxlXltL7+Kxiex4MZ7jYqul1qyhPqCNopDua2inoxkmMnQK34XSI
 EcH/k2m668K6wLKrDMTdtEivsn2GaFTCQlVzndtwuv2BQmthXNe3YKIthR5f7w5ZyQMuXTbgd2X
 Ld9QDikFzibbarfwpN305y2cSqp6Rv6+EdffxezLBpwkx+qUuhU0TvnMNqLGb5w3uV+i3XF1MXj
 byj50GiReaDBxIv6XEww8q7QP8JfeYOBlcU4Rq4xG0HZHYV6SHzVk2IeN7Dlqk5Ahb7AMlhqxrk
 QeksmZ7FSW1em8sXlMEc5vevou1r42XSq/Zd3zP0ymFHXCPDRlmxRS+nL/VuKdxFs6oPWBRTcgW
 mo3QnwQzCeK8d1HPuaw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad884a8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=D3NtdokKTziOo_a1GeEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: U_0TiCgWFUogZu8Jm-qctsyTUhMxOCtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 26-10-20 10:40:45, Konrad Dybcio wrote:
> On 10/16/26 1:17 PM, Abel Vesa wrote:
> > Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> > the ADSP remote heap memory region needed by the Audio PD.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> > +			compatible = "shared-dma-pool";
> > +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> 
> -> "0x1 0x00000000" so that 0xffffffff is also a valid addr
> (off-by-one)

Will fix.

> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks,
Abel
