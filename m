Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C332B43302E
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780429; cv=none; b=hnf5zFshSV4YvEtuwnoQnY92wFaU/Hyqy854V3tyjRaDSqXWFhmjn4ypXjlt/oI0JF16j7+ObcIfpAtCrZHwvlviKaD/9wSF2Of9ZNpXN8YmOW4pQA/IEanIYBegdcJ/QJma3hl2WLIW1jHywVDSR/a9uPPgCa4QHyBsvI1F9yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780429; c=relaxed/simple;
	bh=LwHbaRL7meJ5BgK2SJUYXT64Aczh0owcQAjNNq14KzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyxwmjTMudnoWjkKg1+FxvnTlUlWIx6/UpOdItMb86lT36JKmVR287MCX4a6THy5DrO0/98IN/tyiwBNTm16XkcpZYpv3VqS9snG1uP7BHhGuLo8B9I+1DbFiWYDiH48LM5nCnDxwfW/Oby7f4DeFoOzxe0/mm0I9w9o5pj445g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYAerpfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgC/D+eo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYAerpfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgC/D+eo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gvuc8617258
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 18:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=42DUib38jBSO/OccuRuv4DNA
	e93CWj3U0RdHsNPxIBQ=; b=JYAerpfG8mgDi35J/yd18a5D9Jt4mGvvhi9XlsMQ
	wDT2/MsZA+oTqTPIExTufzQ3jx+xHOvmWNkL4/cKi+Bz3WYwrDbVSLT4bnSZIaxt
	CrUJz/+S2akXNk9Nr82d8/z9c4Ll8oGFKtb+VlbSgKKcnjqhj0G9b1rIyUDHT2Px
	AgIsX6Elig8GlzR0pj0W4xLIR5feKvdw4FjA1bpBBG/ZyhZ9jBSsGCctMh4t7+Ue
	OV7NCZ4tYfEA+Q45448fSJULenpC/wifGUiPdjaVT0ZSrQM2Zv7gVvh01iJYO/Bv
	obZqEBqRDaqeEVljSF7865mH9vsBI/jnAIvQEpR7aVi1UQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftx7m0jyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 18:07:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso40985391cf.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780421; x=1786385221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=42DUib38jBSO/OccuRuv4DNAe93CWj3U0RdHsNPxIBQ=;
        b=QgC/D+eolH5BowtoSPTX/IhVKWHWo1MwnkXe3c+gCvca24s22hYFOiGCzFHwBNOPdf
         hBpt8whe5JhpGzx+eB6z1fUZeH9SqMpzaxORTM8YAcw/1TGMTLJHKqGpLB62+0/VRJOZ
         KRYQ0j75mTbU6EsTVXkG/NoPqcaKPJ737QmocDO8+n/E5Z5/cxO9s57alMm48wGX96IL
         DM81S3mMAoLMAxIiOLSAri0yvvaLYeP1U4FYnihd9rQwT5057SUBCE+Bx5jDnbT8FViW
         pH4BLKw5isH9ifdCXYKJWgp2kpR2dpSlNsFMXeKgpavFz1HkMKofuHbNtXCFEvXuCt6q
         Nm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780421; x=1786385221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42DUib38jBSO/OccuRuv4DNAe93CWj3U0RdHsNPxIBQ=;
        b=NI9/RpoXIp/vAwb7ZIZ9j+DviuwPiFBRb1FAldNbqqtsCwZC9Nv7ZNPqEKAH/xBdsD
         4DYdj7SRpacUwVwgvMEfkluemfr4Qbwq9qZc16/R+UNY2VsNdlfk9aH/mY30E2Vwvtr5
         T+Y7uH3Bu9fcuhEtPp+pcOjV4VhfdPluBxM/cgXzFFRb1PtCF/5NZOaewlFNz14sE0AH
         qW5mKvU6YtiY3Af14PnmrZPTp5oQ+n5/Gag1kRFKvxr4w4hjHao6hYgKP4flVySdbwSJ
         5KpORsiB6Ed+fEYBolhF9dVulqo4qshzeStUzVa1f5IOGTfmlYOwKYYVMZYI9obzJRO5
         Kdbw==
X-Forwarded-Encrypted: i=1; AHgh+RpaL7eZ5DrflljI/iqVA+uloT1Q6lHfEvgNW+8KZgW+CX5AyqaXo2nG6nF0LpsC9u2FzXIMVRlQVMGi@vger.kernel.org
X-Gm-Message-State: AOJu0YyiSRKzwUUKs/OBSw0seGULEcWg1I3QxXsMjTundWMHRrwEB24c
	QDO+WCdfVvFotSoRBAQEiNVgWwFq8LxPIM9eKP+RnS8G/QA4DuPXpMWaGYl53lEx4vCsKSV8UIE
	crVHaDeeYAhESVhJUCb68+uQXmfg+2eRW3aUNeBM9mB8F3lsDRR8pgZGz5fQ/OuBp
X-Gm-Gg: AR+sD11m3S80kjBG3J0bRxZzGxQrEYENwVScn8qEbV+0lkvbF4y2z8oltp9mv9QP7RU
	Itu7VHHPiOPbg/KbPVZwmQ38oaqBrMkYhm6XMZF5I4nQI9aQBXon+itCLw8AI9qJ56gXGpt0D05
	qanvQZp8oYCPvMnvQuLhA8GItQwvDgFcf6u4JShGhh9CGLFdtOxd530vJH5CuYUrl+AyEiZzflb
	GRpPhT5o1+rFxxVAiRQ0ZxvvBdJDuFw7YCNxJgd16ArQdBHWpvEr3yym4YiIIVHsyt5WRTlt8Dz
	eFobGsCc1rV3WZCIcaMPEl81bJFFatpDTiOBQU+6gL2HFkltmnTDi6ohHrkRGSG00xYUzXjwXh3
	r/EyV/Jg1qBDAZncOKWVlnZzZUaPZ+ZViSKbHmFiv44PY+z+NjycgN90FxItyHX9+XeTxeJB0Ym
	wS0axOY9T4uMdk+A==
X-Received: by 2002:a05:622a:2611:b0:51a:8696:cb38 with SMTP id d75a77b69052e-52b56670997mr241805151cf.7.1785780420835;
        Mon, 03 Aug 2026 11:07:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:51a:8696:cb38 with SMTP id d75a77b69052e-52b56670997mr241804201cf.7.1785780420185;
        Mon, 03 Aug 2026 11:07:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f812ade92sm13853431fa.23.2026.08.03.11.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:06:57 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:06:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback
 compatible
Message-ID: <sxn52bn2zcy6blv4rzkdwpthr3s2ozlzarex3iclk7ail4uhx7@czy6k5krxuex>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
 <20260803180021.20368-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803180021.20368-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MSBTYWx0ZWRfX70BAkMVqWwDW
 8XpB2wj5Sm8J3Jn6fViFfZ8mSHNE9fRd3T9JliIylE0vOXKzlvx4l99JSJ2J0LV5x3gcZxLYKZO
 kg+tTLG0JAk7vsYyIeD2L+ZDnSgQyR0KNFqf1UiLv4wAHnhRzAP2nct+i+LwdnFU+VnQ+9LXVY/
 GAcxzVV4sZE9RjPZuhnMq7F20Svn9jhWTTyI0giGqDe4HqoYVTsZrlp4xqZ0LkHf9nsFq4TFqm5
 oZSlcu/Z7Hd7s9eND/NC/5qMsmVg3uNeHCWFz8ilkWBUjNwZrKIkBePSlL8ntgmOF6BbPJDYRKT
 +k9jw8del1XeHKZ8Tu/cKE2VbbnJ0Utnx1A0pTGRCBBCAHutv34wMA07rOjDzCPzlVCQrzyLgrI
 D9wkUEx4Q+9Im1AYYvT8Ezc6MJsA2Y7EDi6IwkOUUNcIVNmA8IIaGk1rmVV3fmSi+bDiMoYUwqI
 fVBYCHXl2iuHK6qeUuA==
X-Authority-Analysis: v=2.4 cv=TIt1jVla c=1 sm=1 tr=0 ts=6a70d8ca cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gIi9JqMhTtM_ZK88ZZIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: fBE0JrXL0UgNrH100vg2y6vg06DXCojx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MSBTYWx0ZWRfXzQBnbSxevfGm
 GC2b35ObIFEAi2IuDWDJqmIUjvSNcQOy7noS0KpFKClLDmIfj3GETvbt56pyYAXVrvierKaE5/G
 4QwYj4CUD89faqrT5WMaYXf29t0t5M0=
X-Proofpoint-GUID: fBE0JrXL0UgNrH100vg2y6vg06DXCojx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030161

On Mon, Aug 03, 2026 at 11:30:21PM +0530, Mukesh Ojha wrote:
> Following the dt-bindings change that expresses the SDX75 MPSS PAS as
> a SM8650 MPSS fallback, list the SM8650 compatible alongside the
> SDX75 one so the node validates against the updated schema.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
