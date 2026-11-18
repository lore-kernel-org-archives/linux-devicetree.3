Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990040;
	b=b57P+AcwKeDm2ajE9OniKCrAJr1MyAY1uyJl6MEV9kTwFgOqEMG3Z2S3GR22G3kf44zH
	 wTFzJt3YJlT+XqOsUwkWm3qfj9UAU3tWtNF+6rMc45aJ5ZXWylfIeWcuVo+F5Z0UBCRTU
	 8S/6AtzVnvpwMYbhWN5mK65n1UCoJ58J/CegcBoymAm9DzZ2f00u+j6dl7NdqMO60PZoV
	 LPtOxBwZH/TnMtgE+haHFy09HAaCWFjidqvAwJrjT3oVoOdMhLLSsVOabTG75Z4g+zzkh
	 TZ4KZCFUjbhKgoF0XSLfMHNYia7HZ7fi1wXDSWO0A7wJRHSKYYzdLck1TIxrPMe1XEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QkVY5AHVK18FZcn1ra/vmEzvx5ZMyaYWFnvweY5o15g=;
	b=KCWqe+4AVPOuxMEqCMLQfyStQFP9EyMevQyKXBcqvixQkSY7cX47jrxb2JB5wQ3zHWqm
	 dnDpI08LdYX6q/wggkRCkZrzwOWeVDLZcekQW/9OmTIK1aIy8TlUbDcutdjxfswLoePlp
	 c1ENnNKdKRbfsKB4vR4xKaxU+bMUAa2ZtELj6uPYru+S0AvT+bzWLhtfrJJZciIa6ryny
	 SBWEaQ06r0+yZrm6ykX6tTTXiLYWDdxcM4+H2zYSe1xu4Z2HvoRBjQfqWN8evYpBCqNo7
	 HrTnap4HwlnDDYtbAS/hj5h8vroaWeqXlIS8M/NjoBosa/CGFXkZvFvCxvWJ+HLKICg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XV/LeNew";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZkmLnYVW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0719606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0719606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XV/LeNew;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZkmLnYVW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8J2X32383039
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkVY5AHVK18FZcn1ra/vmEzvx5ZMyaYWFnvweY5o15g=; b=XV/LeNewwfUEG97k
	yldzCY5BeInVpnb//uYe7BSxPYCoUq/Ml61abvB39O6M8yeosUHXKNb1EnHduRqx
	cSM7zz+89FalgFEbyp0C3J+TfAHoGVK4Nj+NzcgzKbPgVogVX71fpUAkDyAVibSK
	yAhjdjMOVMzwQYv0BIMxQOkS5aLfSirpKUMkUwFmfE50MF8d9asypIXMuuLPA7I9
	VDHHUYh/meL90Mvpy6wVjpgk/iCvWCy+PETaneKlSWlwTnFn2Ygl8PsU8/ff241a
	sqRtdwshfqTlPpFAmGi3YbjMoP0psCxqEJJkUR1C6C+mMylggGp/9uSEjEPHAbmn
	nP1dIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvat1ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:20:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3c459a35eso837253a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794990038; x=1795594838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkVY5AHVK18FZcn1ra/vmEzvx5ZMyaYWFnvweY5o15g=;
        b=ZkmLnYVWNFOVA9ITI+PkiKDIlG6UD0+MwNW9UOb0Ni8D6XwPFTbFealcIt740d/+23
         iNgXwV8Zd+K7esfT3sKTH58S+Wo1nWvq4O5dYBYnF6rTA/e+oSZMLsvl3pSGsM/+w9fI
         EQSqnQN6OSy2QGO+w1J/tWQSSYrtUdesksxAZ0Jd2fb0ofHl//kvD82xxtXK6TLuEbi1
         XNb4deLOrisvF04qWnmr2quZYSUQ64puoh7gYcDXiH2witRxPUmV+JlDNNvHBJL6itR7
         Uki6VDJJuCPCZIHbS9WoJG4YOWbzwxPxbZVCIZDHrDOznsbt2OBperlmGgIU3vFhaYkk
         fr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990038; x=1795594838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkVY5AHVK18FZcn1ra/vmEzvx5ZMyaYWFnvweY5o15g=;
        b=ZFU16kNj5/OWZYHa3oec5eWPVS2E8LM2/gvpRdUOX/zHMx0Y+Eru0bUmi1UAp/3WFL
         XMv+uaGdADoNM7P1KeBwB2jV6QyL0S+osRHivriiaPU5wZtXjiPTimgT8bFe0NtVHPbm
         +hUnsn+PobDc7fqMKn0aUe0e9MwvutqGBTI0/dZgcsWppSd34G0iGYLro2tmM27yTcYY
         HBLGwo23D8Ww9hS5VN4Wn90BexcaNEIWJwUnd2pSav9z8FHizH+am3Pmpnx4FSfClrxN
         4sy0yUJAUFm2vvC6qn0NW7DkyFHBoiZBy5fOgj3BEqpr49B5donsNlE6kxoDA8XWYnJ8
         +bWg==
X-Forwarded-Encrypted: i=1; AL+hErFtnVmnIvrMQNeE+0Hkd9rE0HKku/rwpYE6Y/3B2pLv842VUhlX1BNKeiBjuzb4v7+j2wfBv8peYzm8@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kbf7cTC8Bgo3dl+DfbguB6ftT8uCvcYXujxiV1/PBdw6cb3Gh
	Cwx8ltVN+Yi8pvd7sYMb4jTpdfAt6E/NuUHZwAzwIMN4LG2Q31iNehy2h9N88tpuL+2skXyn1KG
	61WkyQMI9N02wOuORsHqDrd6FsoHC65T17gfI2crk94IDfcdtTyAz65PBvOPV3QKT
X-Gm-Gg: AZFdTZeKZdndGQ+shVbHBGTWM21uS7N80aRIR8pHSfVdx4Xv+L5eIuF7cFKzVuQKx43
	utJiJlRPrvDfwoAo+jfj/pr85ix1zI7fLk9Z2/p1pQLOOz6Uyic6t4psxyAbEifM71E6BPP7f6n
	cDNCqqBuPYB8q7TBTVk3OucfbrkWU9Bo/GRsQTC6XcH0tFQtyEmH7mpsNmh5TciH58ed03Uj8qn
	BBem8yAPdjjvH3BwFcSkfIep9Y0TMvqoP7gYaho4ol7eP+l6Do/eUCUEOI+yI+2MwTQwQEKKHMt
	YxFkLS4lwUjDFJ2LjOkFt3y7dGvWanr5GD/hLPWByeT/U9GWpLO8OgzxmQj5JogFZQWyqRG59xk
	m956JGtiIwZd5dwKqrPMBIsy6k0h42mBMfFmVAUoV8U80K0gH31DxKft9KErCWKE5SJJUcmWCsS
	h0jRPWNpdPjPrjrJY2b59EGIdVfQSDEDKIzViB8FLn9gM7wLC5UKrDTfXxbjZIe09tffUUT+J9d
	Mpk
X-Received: by 2002:a17:90b:5643:b0:3b3:a74d:f848 with SMTP id 98e67ed59e1d1-3b3d076335emr1655093a91.15.1794990038037;
        Wed, 18 Nov 2026 00:20:38 -0800 (PST)
X-Received: by 2002:a17:90b:5643:b0:3b3:a74d:f848 with SMTP id 98e67ed59e1d1-3b3d076335emr1655077a91.15.1794990037633;
        Wed, 18 Nov 2026 00:20:37 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac292c53sm8037771a91.7.2026.11.18.00.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 00:20:37 -0800 (PST)
Message-ID: <36bd7e8b-8319-41ca-8d47-eebabc6f02ec@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:50:32 +0530
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
Subject: Re: [PATCH 0/2] Enable ICE for UFS on Qualcomm Glymur
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd5fd6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=knTtAJwehH_nPzmuHUMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: rxo2p6onIZv5iJaxcj330JTqFMZfAeAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMyBTYWx0ZWRfX5T4swjlKvgNT
 Oobt6Q3ct+ZNlZv/IEv7yIM4pK4AQXXTlD1wW9NyqVukMpM19B7ebg0DatR6KDdGaBYeZdT2edy
 ifg+T1K9f65BhueLfeK/kZp+OWkNnZOsd+giR3lYeE1VN6WnsoNk0Di9ytC2S97bUb3M6PxHepP
 3NeA+fshan8yDs5/pYaZ0YepxsIdmYrkYoRxEUaXX03PW1eQY5D7OtYhn/EerVQJdp+JqkCx/8D
 6I+jA1oM9sfD2z0bSYNMb211Pqcm8QD3emmgRdv0cuiV514MZdtxcXGw4vr+3kOOWBOXPQWgf9m
 zJcSxm1onfJ5H/sWPWgtuRiPcH/AIgDirj5JPhNu++IxBpxSGwKRCP6N1jgRpjwp3cjOjyFYYAx
 LPWI8p1h+FmtwTaqYJrDYATP2LL0qX9H0p2pijqHVFO5D9M3jgctCQ8OC2WoDPmpKOkLN3Db2qz
 LDfZ5L2kuoXUQwr8lWQ==
X-Proofpoint-ORIG-GUID: rxo2p6onIZv5iJaxcj330JTqFMZfAeAQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMyBTYWx0ZWRfX8pMreed3RwA8
 3QjkNkcRrNhRgGpmcDgs2gxonGE86HtFGHpd8kytmvLnSnhTtqYonJQ2UR2WLfBlBfuS0dNZu6o
 j98FokrT7gdVubiQlr6hKynvk3Z1sns=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180033



On 11/18/2026 12:30 PM, Wenjia Zhang wrote:
> This series enables the Inline Crypto Engine (ICE) for UFS storage
> on the Qualcomm Glymur platform, including the Glymur QCB board.
> 
> The hardware reports ICE v4.0.3 with Hardware Key Manager (HWKM) v2.
> 
> Patch 1 documents the Glymur ICE compatible string.
> Patch 2 adds the ICE node with its registers, clocks and power domain,
> and connects the UFS host controller to ICE through the qcom,ice phandle.
> 
> Dependencies:
> Patch 2 requires the UFS nodes added by patch 1/3 ("arm64: dts: qcom: glymur: Add UFS nodes")
> from the Glymur UFS support series [1]. Its patch ID is recorded as a prerequisite below.
> Board-level UFS operation also requires the QCB enablement and PHY support from that series.
> 
> Validation:
> - Observed ICE v4.0.3 and HWKM v2 during probe.
> - Standard-key and wrapped-key tests passed
> - checkpatch --strict --no-signoff: no errors, warnings or checks.
> - Targeted ICE DT binding validation passed.
> - Glymur QCB DTB compilation passed.
> 
> Prerequisite:
> [1] https://lore.kernel.org/all/20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com/
> 
Hi Wenjia,

Please drop the prerequisite and dependencies from the cover letter. The 
UFS series is already in linux-next.

Also, I can't apply this series on top of the latest linux-next. Please 
rebase and resend.

Thanks,
Gopikrishna
