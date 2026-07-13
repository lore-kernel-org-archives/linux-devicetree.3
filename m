Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46C380FCC
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939099; cv=none; b=gAxDjrqhgu3ke3/tiIzVGFdeHWCPrS8JLPTI9YOG0qctZiaPpWS4A5XYCCUfi3+mFuO3QuCLKuwolX+5mVJ9EhIey2HkIcaeROfgxNLFQeXnAOrFyk3MIh3oaMd9ZqGkXusdHrxAjCtu3TMGpZbUjXORosl7E8LwN0dJFYB7da4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939099; c=relaxed/simple;
	bh=PerGdR4tvhaCn0d3HEjuWPNzUn6dNoxrjJS2v0J3DjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bdWDN33IrhaL6XTYTXyEWh8IjZT4gUWgenmzXG1FIxxC+tD4sO6TU6hEay3E+gdqH+tnrACkxcYlZW9nB+2tiFUhkvoFxa8yxQm25XDAD/6xWIHHjRgyYMl6wnF1fENM99CMGYT5k6+VJIp7vTfzJOq4hMMPJf2lmPgQchgEm9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVjhM9DK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ByBLS+kn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVjhM9DK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ByBLS+kn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9RGLp1123141
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WT+2WPVDbqIhVjrVBVIfNAyslbwNDDNswFDG7ueHOEA=; b=BVjhM9DKatZ0wnO+
	ryZZGokaXoG6hwDnyjlSJt7eHV45Pa9qAEKDWENw1lnLYnOYxfD0c1XtK6mnQxmR
	uKlnM5eggD6ogYqNc60gAgeOkLFyFQZces1UDfec/dFeQzu4Aq4un/ijpyMAN0jF
	OpFNzy4eodwZhAHrq+jXXP6eN7rSUgE3AiPMXfjKaylubYJtJ8AWtQWZHOYSJHsB
	JkOFJseotLZUepv6XwMtPIIn/w+YbucKezLYGn2TUYgjBlLDgq6/dhq3uc+RNktm
	V7e7CG/f8aHQRBXXGuQuB45uzs3UAfvK27gfE4N62ti+VKpr1Wjlaw+XLJd06r8d
	PL2A6g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda08gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:38:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso2311949a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939096; x=1784543896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT+2WPVDbqIhVjrVBVIfNAyslbwNDDNswFDG7ueHOEA=;
        b=ByBLS+knQghXQ88RV9fwdM+THI2vD7+g4nP2Estz+f2vZhZW4QiO0dVHN+3K2C50K+
         uMbAWcifGiQPVVBKuHRj5mDBjWKr9PdcPe9BTp+Xujq6V91DRMk5sKsaU0iIM3WCIM4l
         u5Cipx+ACt2o/BMRRxCHun1rq7nV9gK8syBtXS8iDCkLZ9+Pza5wUsrVUTxkTqsD6JQR
         ZQsSn/UJtTN7OG5OJO4aNHHwOTYlcwHg+L9Yu1XGHnqMYbM3ot39vRMJGK6DGuf+mnC/
         lbRZj+ceXJI90WA3qZzN61vJ95KdRSMjVypk7ECGSWwSxt3YBUB6CKDuuDyJiVMkwYCP
         IAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939096; x=1784543896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT+2WPVDbqIhVjrVBVIfNAyslbwNDDNswFDG7ueHOEA=;
        b=HEjA/0Syunhju3NxbjA4REvxf8LADBn3EgLe+h52ZqgYefiw3G0uc+y93N/PLHATF1
         jqGLmsVDFGnzFuywsNYS+1u16E4ZDNZEbwZDoncDbnct5JKVBJryn+1FvrYAKELVHY80
         sxhOb2eXeCcKrZ05pnE+zHIx6nCsQ7aMqJahhqmg+Hd5V3sb/2TZ6GrBihOZR/S3/uFL
         RYiJ2TAp6zWM6pZP1YfINIwFaY2QMbEzyZmUcXzwHEqHqpLPnBFptlfZqUjN+nAsvjL5
         UDNnvScQNNieC03bru6xjTnUvUHldGz6puth0RNgqX58KxMWuk6H1izedtO6R9Eip5Wr
         hLGg==
X-Forwarded-Encrypted: i=1; AHgh+RoK/SPU3e5ZU8Rcr0BiPXfX5k71DCCokFMzhvgYaDp8Qd9fuWT3vqhFjZg51Oj2u8E2kx22eqJID1go@vger.kernel.org
X-Gm-Message-State: AOJu0YyeabrjRl95G3erEnDsfC9MUciBLoHK0uVzBAmaRAbrU6nVySA5
	/yE54eZhWw2wvoLQiFmoG3hPtLvk60jTQP8zgJ6YIkeLaxqFb/J5qy7/bUlU0j7Jx/UkidE4rNz
	xwM0fTGw31xjkQ3sPDsynwjJIZplgdstGw6JRkybsbJeRAEzg+jIlCscqPviMwgIb
X-Gm-Gg: AfdE7cmYvM2AFBPsPIpAc/LkhmVBnXsk36PHrulXOmqtM1+9nD1n6s+yavDuGBG0rgG
	pnExFvZLy4XjDWbN+AxdNe2Cd5cC2WtmEnFLp8rtZ32JBAliAYKPGc6KTT1OqiMZHBmkiZ9wt6e
	3mK7lA+Y4HpKDdeFbVGsKvAEAwczDeIWYtgmRYmE6slEQ1vpN+hBjk6k7GIHpVP8qOWei0lyltD
	SuPHDIY3cREc8Sj8wWoi6NAImCZcxINNWBHJifhOP6VV276tju323wVKBGHeI0pUyVbzPqT5noi
	v/YBnZ96GF3OvZnFJpgBUNoYGd0kcTJwF4IPZT6aqQ4CGS5JdUsnhyzEAra/cjS4gDw6YsxrLQJ
	+UZOsg73TcVllY0wrkjyFmTVLtPjqjaakEsx1Mg==
X-Received: by 2002:a17:90b:562f:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-38dc78226bdmr8508854a91.8.1783939096431;
        Mon, 13 Jul 2026 03:38:16 -0700 (PDT)
X-Received: by 2002:a17:90b:562f:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-38dc78226bdmr8508811a91.8.1783939095990;
        Mon, 13 Jul 2026 03:38:15 -0700 (PDT)
Received: from [192.168.1.8] ([103.211.19.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm64789674eec.21.2026.07.13.03.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:38:15 -0700 (PDT)
Message-ID: <15c00c07-a5a9-4413-9ba1-261de775d3f2@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 16:08:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: sashiko-reviews@lists.linux.dev, Bryan O'Donoghue <bod@kernel.org>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        Frank.Li@kernel.org, devicetree@vger.kernel.org
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
 <20260713-shikra-camss-review-v5-1-db53be15dc4f@oss.qualcomm.com>
 <20260713094112.DF9AD1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260713094112.DF9AD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfXwCqobGP30Dni
 4g+MES+gR4/s+77biK1nkEAoPObmfea4iWZVl2itzpVD6efswWHvggOieb13VFDcTV1T6db1/AP
 ZUGxYDntCLnrwZ1pwpYjYECw/GAP2nw=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54c019 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=PqZB0zJ+pwaroKfoAs2U/A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=hEZd4A0f3F9c55QM8isA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: VCFvLPzauf4J5AIIfgnx0frT5ho1ITDY
X-Proofpoint-ORIG-GUID: VCFvLPzauf4J5AIIfgnx0frT5ho1ITDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX2eTyAzw24bGu
 yvHzBZvMVuPcpVI1FjQzai8r25dWZk0y9EeF3iGjN1CyrpczzkIbiWNAQrN+nlwndfGC2KhxnBB
 Yd3MTp+7JeAZDblowss9DOJYA/S0FV7ObDt7Xyeq3q4TzJ97AB7A5GDJVGTQM9kXqhxJd5yQCX8
 u6jtS/2mdPdLCxCH6WSqc+Vy/u0eWbNVbZaMo4T9Y0hVhkxD36myt9W+MBS7ondK4YWGvYQvU6c
 7R3vH9Vb3DbJ7Hv0svrRZS2KAoUKUHGsXXU+/fSofepZaPSoyjzZa0pGo4WlNZl82JNIIg9T5EL
 IqGztMcRnNebEXDsxZdMG/YRqMaYuSF2dGWGomVeaKifctKjGFVoK64L1VnVoJlnUjcrw1G4346
 Btyg44D3eAVt1bSTlWRw8F4Td2MkGo4Sc+LOjLAPa9Xeeg4+c1wFwwnjOJWSDOO9n5/p0cJAUvj
 /2+AnN0T+YSLy/qmsPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130109



On 13-07-2026 15:11, sashiko-bot@kernel.org wrote:
> This commit documents the Shikra Camera Subsystem IP, using qcm2290-camss
> as a fallback. It updates the compatible string list and changes the iommus
> property to allow either 1 or 4 items depending on whether the CDM and OPE
> blocks are present.

The oneOf was chosen to preserve backward compatibility with the existing
QCM2290 DTS. Shikra requires only the VFE SID, as discussed in v1. 

The existing QCM2290 DTS with 4 IOMMUs and the new Shikra DTS with 1 IOMMU
both validated correctly against the current schema.

Hi Bryan,

A gentle reminder to pick this patch for the 7.3 merge window.

--
Regards,
Nihal Kumar Gupta
