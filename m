Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B8647D928
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629119; cv=none; b=h39lscP4H7FiaZSJX4tIJN7ot+DUBnxXvvRcmbrXzJ5P2ContPne1EK5eig1jyCQ7quU06ibj0UKijBRVFbGPh48TrwNcQFwpdvBQt0Snsl0dt8Ast3SLHTmOcZ8zVUtsyKYFCzEfFT6gUAH3+9oAFzu8Ogh5TU88dnK8zLyywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629119; c=relaxed/simple;
	bh=pkiXZAo1OSd3Q7dIx2lrjjazMtFtNk7a2Wikcl4puOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umyPidxdccyjtdX2dbYG5jQuqvwJ+IGk3msPodwIASbgSHOzI2lILGuBBmeqBkMnRLIOAxG2ZMlDy8opcqi+VwsSmi31IV1SCQtsv0QTyO3jHtaSQrK4ApBf74dpovZ8zyBVV5JcCxvn/JMPYJTD2CjRvK09v2EUFg63lvG5wxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHJlWRre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g++b2EHo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHJlWRre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g++b2EHo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LA6lOc4107084
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQN8SBsDUQeybJAOaRVq9P7dww95pQx11Qz/2/Tev00=; b=OHJlWRrewAuLkteR
	lb16fd0YnNhjkg6euvBMYdC8GHtIhcr9e9O5lXptvH8WAuwoaKaB1ZgtGJ0uZdQQ
	2sabnFU34d+eAu5MA2lGRkx5GeSGnsQRRitD+4/DvjGVRMoYOsqmAYBMzCp6DxfL
	WGS/PG9B0lcavxmt+D1d16XqNnMqliaVC42OeiHc8WKWNXenunSHr21BELAEq8x4
	5YcJhj4iOgF/WXdxGfWnRipiCBRV+4V4DCCEgDZC5cggtjNyvg+QUzyd5rAmkFec
	CPBWdEN/UBl5pQrA1++DDZUYefywrdgPW/IkbwBs8t5QJv5dsF5wPvLs6z9IpSz+
	u+9wPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqnapmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:18:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so14873111cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784629116; x=1785233916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQN8SBsDUQeybJAOaRVq9P7dww95pQx11Qz/2/Tev00=;
        b=g++b2EHoniBvAe61UwzXE1J+/w8fjDWlMUKTVTz9qt9dYZuj5F75hNuouix51o8/xP
         p65rsYJrBrSYAc/w6BxhXmcmd9fMSSKztG91FG5zlfJLJYNaD26R0IKwRb4IvCCPckgf
         3Yq5qlMLRtjLtISJZJdvSy+pFGxXWbyUw45bENbNKNKEdRvmtdPl68rPebSk6WEl/J5n
         AyyxpNHiJjTjbx13G8uf/nsNcJqq2Ue+wtYQX9pLg5wu3g45Ec0FmVHejZyc0ektZDgP
         SDlC+AE4O1EIjMCRqc5BDYC9S0QyZW6C4eUmTmH3bRk6kQBP0d7o6wFBhzg8xj+bZpuU
         fFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629116; x=1785233916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQN8SBsDUQeybJAOaRVq9P7dww95pQx11Qz/2/Tev00=;
        b=ElOINegTZHkrpx0h77KYCXl2laIsUYRKcpigtAcF/la1Afn14duelqhsq952I4P+z8
         qgkFeJ48ZM1geq2tkiK3ugXz0dGgDgvS7//qP7Zl9RUr0sCN/FCFmwN+ipPM2HHS4cp6
         mhoOCvkT0w2sZJDiEyQHph6ndp0VxBJdbo6w30X4A8oLcQan8p3KdlOGz5o3VcNOlXEp
         GqbAPUU2XJ2iiVoI1fIxP1iAJc1gSR/K1QtdvL5QXHgHzRg0aBCWsEnhD6E1BnvNmbiB
         H40NptZetJ6VW5SFklY305pPortuV37lqzbvLdp3rr0phOv1l1Sry5SW5EPHbq/ZSM6q
         IqhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4W2RbwaifMgFL2nMytykOGJZId0U3kl4YE02QrqmYM/N+w633A84CLbnomCy8FhuCMLpvmQMicOY0@vger.kernel.org
X-Gm-Message-State: AOJu0YznR+kQS+GFNoET8TdnL0REuXCEa9LLcNMXh/EAUr18+tVnD7Ix
	n+23akf17Wx0ia/GScU0eAMQ+19ZeC3ma3MUv15oYzGk3Zw3S5YiARiHNMUOJZPRg+5dz5Jy0Kd
	sNBLNLZL3EDMU4IB6JwGj8KGV8dut6dN/PwBJCH4rEK+wKoQMUpr/57lSy5RKWQsBfN6kCEC2
X-Gm-Gg: AfdE7clJha/rvqgET2mV/pVwuJ91QwXoUQflCVeK77ns+NiCm/cUqAVVNABCbq8H7vx
	hvdSKYuDYqdedbuaKZFgRblRxpU6aBXlfbDJlK9LnsIKGdSrGMoMp1dZ5PhlNJfEAol09EqdxhG
	whGyiKQ8qEvWV9OpHgG1lap6GY03mv7OzqpV+xj71/4kk+5PYc5sDAdkiy9w4gpZBDKtuIgFSLa
	NF2FtwPIwTMWgqfrWjXwuwYJ3YZfSZHgS0003D27UC2uDxZr29dCbhtyEJdbrfPoZKzaxkN1dUi
	OP9IJNFKCuBYl13ClI0CIkrxQvdB+GyN4w9fTJpauTnGp6tjoGvmJ9LPXFi9CLahKBWa6q/ytIS
	15/Ns+4HYZYRjyJAGM3dRsLo6
X-Received: by 2002:a05:622a:2991:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52672ed4ebcmr15924481cf.3.1784629115873;
        Tue, 21 Jul 2026 03:18:35 -0700 (PDT)
X-Received: by 2002:a05:622a:2991:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52672ed4ebcmr15924321cf.3.1784629115471;
        Tue, 21 Jul 2026 03:18:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1ac6ca516dsm86967066b.25.2026.07.21.03.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 03:18:34 -0700 (PDT)
Message-ID: <f15fb988-09a7-48c8-aaa5-2a5dec3a1d15@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:18:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Kaipeng Zeng <kaipeng94@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260721082410.18275-1-kaipeng94@gmail.com>
 <20260721082410.18275-3-kaipeng94@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721082410.18275-3-kaipeng94@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwOSBTYWx0ZWRfXxJt9FQtPC2Ii
 eMSU638WKcjcuLz6OrnJdCu/LIfls01yZRyi6IJTNMjpPXD9/w/sc3XXxQkwXUbMPAixntSs4U/
 S8Q+jD0nyOBWzUp1PNsSDoFrKSDdT1OYWJKM4dlIOuFZ6Vx1zNa4HRUqhuESVvm6GjZWKDKukfY
 MjlwZdRsWJFrR3d0mbJuAkrXVE5munFBV4KwemR8HdBQafhTQuhlXGA+Ns8PYP4fxV+4yx/kOcu
 FSIR1fWz03tzCU0Xl1fYH4RHW57Lc1NiiqN1xlX8vD7nVLvjDQpYVGRNXBnI0F9uvhvisMbOm7B
 4f+NyBxutUCEJG/xf42zSShTa+TIkvsoU/Q2Wp+FYqPYyQxZcmnLKBe3tQCZaLhwysYiE0jezi5
 LgKQbFRQvnyI64l5QAhxgskPomHI3KXzcxmsRmimdBrOrtxbBOmVbK71TzYsx+2g6M1YAsUHMu5
 Rn4VXqz9P28YHQtIngg==
X-Proofpoint-ORIG-GUID: gOtHz5RfHGTNORdzHjxV_Dsz_R292FuH
X-Proofpoint-GUID: gOtHz5RfHGTNORdzHjxV_Dsz_R292FuH
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f477c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=_OVoRcir2XhzUFdSYwcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwOSBTYWx0ZWRfX475ZoZkxR4si
 0gtNAgP9JG/hJRM4gro78+8UrSULxObwNxHrvnBf1dYlalMlxFfhZwBNrhJqSON5Mg2ZmRx6yvd
 949tMhCG2vbd9AVd3ujxz1Idl/nT8io=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210109

On 7/21/26 10:24 AM, Kaipeng Zeng wrote:
> Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
> It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> This device tree implementation references nodes from the x1-crd.dtsi.

[...]


> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	status = "okay";
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	ports {
> +		/delete-node/ port@2;
> +	};

What happened here?

Konrad
