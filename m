Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168237;
	b=TSC2oYOIx9uL2h+KrTn/RnZes+wjLzPNZG4b5hMDr6y2ZCSN0j9SC0W4qZeZ21qogHAY
	 giZ+0DqNFqrOIRNkfFMwVsNb6XJXNPaEnXvOrVAOXpfwHkjx0LHilrGFbBReqBNlNoiVg
	 lt1mmrJdSDASHwEVcyTplYh5THBYuFZ3Z3g/SFJw2ZeEgqL3UjAcezmo8ajF3E2+5L+BD
	 JW7JmySLbxx6F+hBgD+zkp3u3MWS+4u0juigcb/zjTE732lfN4JIxcDNj2s8+KFUGOVOG
	 OH5kbXcwU1UL16L28lf2sSr2KCZNs85HBR790npe9Q+aiIa5OtgoreQ3uH2AD4gkO0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168237;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zB5SsH8VsIf4nEkhNxqYqoKowJRLv4fFPfgAoBW0n/k=;
	b=xf2I5d6iNGc1WVQQ+wphM1ZkuE2jUL/Qc4UcNJbV0t9OShslQDBTZcjD0b/99ZendI+I
	 Iq1FspbQxstqhYlESo+j8YG5IF32OimTUH5ZY7iLfmS57KJcV/L/PrHkmjmbSl6p+xnW1
	 3rmWrpwOR9kfsvrvPdFxmC07gbPSpXmmMkagJqDUjWPRSPyGMYoRsGAs3MDN2TviN5DBH
	 CQK9g8SNlQ+xMdRVmjhqxy/n4DX+o8wEIt3ucGlMPxD+LAypR7+0AFdTun0HyAszZUvWo
	 Q+PbREcHL8HaYlb/jYbhSHUO0lo1CCdvsrHbxs6dUzgev9PKaaTcvFEfmI3goaOvGmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BjP37kBy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2d2+sYW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343C606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4343C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BjP37kBy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2d2+sYW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7esdh2019486
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zB5SsH8VsIf4nEkhNxqYqoKo
	wJRLv4fFPfgAoBW0n/k=; b=BjP37kByTAgTjiRHlga37NpG013SpZl6UoEWvm+p
	0c4jvbTuj6WUhgfQLXs2osAictIUffdVBS8R4s+FN9m5WswyTXcU1tSfiTksZVqs
	wFRqvOrp9aJ5GWKkWIc9N1sGv2sMOdNPy73cigCk/KXROlEAJiOF1iyfKUUd+O6X
	52uXpYWNSI9v9kX8fTRYZUhUt2a5FdHFhFmsKSMk8pN4hcWFlL0QObmVqFNpzK0b
	7WFLOslTFiUuDFU/8jbSaPF8rCFSpnADDvorZyhMKzdm6VBuca7VV+uJb1TaAT8+
	V9C3OwIiYwyE5eC0N84taumnN1VAawPIclzBrqocdtUUqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj95je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:50:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94975041698so458589985a.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168235; x=1795773035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zB5SsH8VsIf4nEkhNxqYqoKowJRLv4fFPfgAoBW0n/k=;
        b=H2d2+sYWFgy4UKXRt3qbZFezZSnu/0RLSj6UdVzeSBZh7MTjSk3ZnaxEF3qjJmDZYE
         61/VRVr+x70kmENpjg5rel1IB3UYdHTJn0kErNgPktZIk9FM+CJGFvTfpR8kEBSxCizX
         0lIS+OChY6exupc1hj4/R9C2fIp53JNlvDz1PtwBHIOC8zbDHL1LqMYbxaPy25UakWcZ
         +o2ri+h7+xGFd+aKDBnsRHjX39CG1PNAsAFO0nx/nJ2fssQTEKo8GvrrqOcYNMfMRD3p
         zIGqYooWbtRRziCwJyW2C3JRDNiqJwc7ApWgyyNGvhL2iRRGOdbbjRUYMYIOOE9TKjtr
         IOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168235; x=1795773035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zB5SsH8VsIf4nEkhNxqYqoKowJRLv4fFPfgAoBW0n/k=;
        b=ubHHwfXrjYXiWXBTGqokENlNt1hOPRAl/frGPA0Sv2PPXZGaeszSQunNEYcJnuTyZH
         cDWwXZ3KbHGIKyiHnQ5rx+AFIXm+DvnGZnpAhf69j7uIS+AL3pDgGob1dVSVCkLG6EbH
         BTLoYWh9rPBX39F57FDy8fGAOSs2lSS3ILNXTB7uPzgl3MB5XESLcrxBuzmPC6Ad/jKS
         un4KLKer8xlEDuwz8JmmII45ibTL/gOYAyTozvPSMXzpEA2uMBbem+dFns8pbqZu5JSv
         Bqfv013m3odmCJvvbyDrLUntF3b5ZnFe35Kx6IuFdOzmg/6qfng7/3uFPUR8vSQDzYzw
         A9qw==
X-Forwarded-Encrypted: i=1; AL+hErEHXy41pcx/OKG49YQrB8vaVNf/pl8pCSWmI23gD+/shZDAa9+Dk3as6Grsm0T6jvgiWnvRRGNfdBBY@vger.kernel.org
X-Gm-Message-State: APuU4Z8dIo/ly8veds4Z36mu1BAF+PwTU9Y8jRlDYUc04mJMVEx2M/qC
	3IPbdfNCeT9wOGhHMVL7KOsn+uoPmTaIl58RP+5rZ/uCCx0z9Vm+UQtae5uQkA0u6/uQ2jsZ1af
	MjGOx7iQC1vrnnGiR7Y8ScxifoibERrEfSF4ioSN5BNGy29AJgxqN72INozvIyBJg
X-Gm-Gg: AYBFou3BJ6J2tGz4bz3Fv2hjzZYP8vZ+5RofofpLa/H3m3eBvH+GiWJqbkr100vQQRv
	+7whtjhGqx4KIbaELt+isM3pw79urYK8LnpidY2FHJ/4pfHxYoW6dUbJr1SV4sS62Bxi8CuHN3e
	o0EfYiPXzSM3bZJsnEe9DtWEb3EhHZrGvxDTB3kDefzZkOh1EC5AhoIQlWZr2OQ4E6h+GqwdrEU
	jAmGYUXRQW7K14PgJADkeUnADRlhyoGRNnHFvoRc1/884fwKJWeRBHvZ8DgG+ZwiWCUM+6N70Ds
	jDxgUjHIL57tHWGsoX7WwP2cXFqoEV/WlbT6A8zJYl2YmqvrttesyaaOnibL+xD2kA+fbGCgl17
	34vzMZnWaOMlZp90ByMTwPAEzfQuS3i1Zut6M/2wMaBkP0XA8gJ3z7dAm7yuKRGGx
X-Received: by 2002:a05:620a:6401:b0:949:589e:4bd5 with SMTP id af79cd13be357-949b35ce47fmr569788985a.23.1795168235221;
        Fri, 20 Nov 2026 01:50:35 -0800 (PST)
X-Received: by 2002:a05:620a:6401:b0:949:589e:4bd5 with SMTP id af79cd13be357-949b35ce47fmr569787385a.23.1795168234664;
        Fri, 20 Nov 2026 01:50:34 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm4302232f8f.38.2026.11.20.01.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:50:34 -0800 (PST)
Date: Fri, 20 Nov 2026 11:50:32 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: nord: Add GPU and GMU nodes
Message-ID: <l5jxkp2xknjjk72mpf22blpxnou6ufkaswhehddtpgyowly5qv@6ngdwriwkeny>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-3-8d6d9908b7c5@oss.qualcomm.com>
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
In-Reply-To: <20261118-nord-gpu1-v2-3-8d6d9908b7c5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b0017ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=O8GIW4uRg8gWTlYuajoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX7T3rTpka1PjM
 gcKEGgNmWR15oT9d1PcfHZyzrtIE66riPwJbYsXYjSbmhzPeN1BwbgIqSEmSbhqCcsq6mQY8Ydr
 coqVM1NsSwy7OinaR0vTmS5FEI1M28Y=
X-Proofpoint-ORIG-GUID: xeFzotWFZTHhHdZHxtav205R3Iey4_Mj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX1OmqsO2/1/7W
 MBKFL7b4vfTEktxbOQywSwUHkACBlKkVtekFF9CjyWa18n+9FT24T/ZK4dYHom1FLTGfqo0Cqlb
 CKAysUfQAHh4fD6Eif5X7HpO/8KDH0OMMSAjcoDtQiXkCPJtc5MWpuSWWF810qTkrYntZ6+Mufw
 /lTQvesb9+3Tlx2OBwdHNjRdjuxEyzcqZQGdENHYhPargLTHDKf17TF4iPtMdb+yFD8fi5VIZ3u
 VcYa4M/c9ODa0xcxIsyvWkpxprV+KDBKnCfyrdODI3gW3Y5+TI7KAQSdnpv/O5u5meyAvfnEONN
 jbkHcs4nwewJj0sKmCIfpTxQuMczjhMQATgTqiE3eGUnXog5GMcbTxRDeEH06XD97euZ19wrf1x
 ZKi1BleaoJdhyE/eese+RtVpIvIvH5VK0juGe4TIr/jgOK7p+ixTECjzKX9r4MNTST9GQvEN8CQ
 oTvCc4tb7C0CNIwQmYg==
X-Proofpoint-GUID: xeFzotWFZTHhHdZHxtav205R3Iey4_Mj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038

On 26-11-18 04:30:06, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Nord SoC integrates an Adreno 753 GPU as its primary GPU, belonging to
> the A7xx Gen3 family, along with its Graphics Management Unit (GMU).
> 
> Add the GPU and GMU nodes together with their OPP tables. The GPU sits
> behind adreno_smmu_0 and uses the gen71300 zap shader, while the GMU is
> clocked and powered from GPUCC.
> 
> Following the existing Nord split, the SoC-invariant properties (reg,
> interrupts, iommus, zap-shader) live in nord.dtsi with both nodes
> disabled, while nord-embedded.dtsi adds the clocks, power domains,
> interconnects and OPP tables that are only managed by the OS on the
> Embedded (non-GearVM) variant.
> 
> Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
