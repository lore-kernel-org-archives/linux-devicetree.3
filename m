Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027519;
	b=N3pEnSdlVWMMSDQ0yccbrkzfVXKorQnc7ICWXhfuuc0eWBd/hGnjX7MSwyMzjVgPq3kH
	 J7VFvK8Msz1nPGkOb77k/Zb7iq8GoC9sRjVvCFsv+YqI0L23P0zK4xMwLo3JBE8pyAc8r
	 3f54PgzVkCpZSJP9auFvCj9sBC2sIfP5otgkjaBdf8OJCItgoVtl3JC+9KO+8dKbpdXNf
	 prdookN60TPKvboJOStCzfbAwSUxqA8/+5DsQj+FFFCO6Mk2o6j4jD3wqmgBPYYRF1LU3
	 8HfI4gJzwLahc60NGwV0AHHbk+ZkMzcI1n6wFaQ0FGtGZovs6SheI3fwpsDKDQwFgQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=;
	b=oQCYsgW0dgfZxRd0r5Wz0j6jmdxHWKxDeKL+ZybGS0M6B7k/lFoyDUtexZkmZGczdzVn
	 Q/KxLihVqiRuu7TwXR6h0LK6IExsYdBo74qtLKPTFJ7acHQHXkNfvW0HkOxvPLoKWtZwH
	 sbvxkTGZJPPmW+A/Gf44JK74WSHylg0ZyTgevhFbf/nIO8HmUf2KwabBa0RSmrp0C18j8
	 TRppgvgKdvyoMvLPv6xTpwSZjsGnPWS3wx4WsAzcD0Q6JfNeKDQIdLrEkQ5BVV221BLyW
	 he9+C35x9rivGRxSoqqDR/mCP5qr/BC9zNxbUtM7eTHbl2Iwp+CfMbiGAsNz9VOuetg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DyWaPPud;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OItY+r7g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89486606A322
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89486606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DyWaPPud;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OItY+r7g
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvmVG4098830
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=; b=DyWaPPudMv5hXrWD
	yfOs0uowTvmp5SjVQGyCK1Xy7Cg0TbbU/L2fUVWIk6+PCjGCaCcbukFB8GkQONVJ
	Qa7Kqxbl0scWGiN5FKPbYLFr7HmQIMQxOIX4Xmd03gnCDF3YgVBJcRTX6kerdp6C
	kpMXU6j+wuXBIbiDOrB93tJqnj6ImBFNeLKRlRLq6wEJRIcANruTZRpySHyVkncA
	RNqmHEIm+6LPBQZPk7FBUSAD/H/qn6aDghRUg7D6/UG88DOoFycLG7WRaTfAPaE5
	aoWw8TlTd9PJWBSKvCaVRmN8GSQt4KHLePGSkJtQGtq9InN5mDwDpuQYCiKge8cX
	3oyqUg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s91745-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:11:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so158872e0c.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027517; x=1793632317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=;
        b=OItY+r7gTyWXjl/u0sTcwO6VnPryXe0YeKIQGQEhyBL9RTkH3p7fRiUwYg4JTLqqKT
         Q7hcTzXKFNoIdSwF0xHXmFD45lZME4hr+8KOl3L9BGgEWRQXIe5N+RgiUOib88KmKhGt
         TZ9QDj2pUk42l4/4L8UJpsvTB8uQv08zZJVfad0Wh/FAQBJxDVx4OwN5wCkydYlrfzgG
         uJ0ahMUhgPDPLHxU93TaiYZ8oH9P7RTfcP6QbeUSLnPuE6EThunrgYeDm8zUWYUYyaOH
         C12CsXzQ0b4EhcNTYnaYeeOuaja0oqKTZZ6XsD04IsgWuEWP2dGCpggiiPs43/WYxQKg
         L6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027517; x=1793632317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=;
        b=jN20ftM2FBaGvN+jKflE2qHO+eS0Wg0CSZNWHGZ8wwteBFK3zXABZahYYOaF51ayaf
         M5l6XbJA/YxKYH3Rsm7GHoCmDFHFOUemgf2Z46tSxH1e7PceCbTr2u5UtNfbqfYQEzwQ
         abJqe/VIxcbdGjMfYba7e/uwnZH2eM10n464I6d3WuDhQ5uJ7qp9h5OREg0nZ4oKDncn
         MlZUhXfzBJkpeEe/kHechrjTOQrVku+StAFaBJ8Kum/75KhwUvbPUB9r6F/7xLr0lYQa
         TdUOQkUCVbRcXB7GRK55uZtx/KCBwi7nXyXpGl2zNwNqK6cgW5zekpdiJPANY7b6bEu6
         CSkw==
X-Forwarded-Encrypted: i=1; AKwUvBz+LjktR/d/SUc/F5OIuh7sgfE/mVEB8I5N/HIyljWuJFL8fT5znu7x4Ho9QpzsWVUpSw2d6/DEKaua@vger.kernel.org
X-Gm-Message-State: AFq9FYJvAm/v/fW549X25dhxM+HS3TWuUEcc7xkCgQhxjUsez10tYvJe
	MScw3eZwCLEzcwI1aQXNPwXDi09o+EJMALxWpj5AV5f0GOnjr1jPw43PBiSCEd4GgO+y+GWqobo
	6QGTEJ78tPXa9+K3U+hwBTROSkxN4dZxiL/wOEVI3qi92ZIEOimmKyUK2mWb6HAoY
X-Gm-Gg: AYBFou3Xndypjh5jTey+YOCABoAf9Xh8lFyzVXOqUXRNQU1PeZDcTxbjcIapS+p3NPs
	H05E7CpKEqm5ig1bPvgQgESioyLhllA5F6TjUmBbqvAPXhREwzzARDYit0qdFqqf/Lm1KRBKXeO
	ksa7U6U1uGYU705i1Rux1a4c7JOXYtrOokWyy2IrrweQkYfvwdy2frww4HahnCV3y9vE5WpCHCH
	qQ9lxIDYm213MALnv3R+CWr7yrcKuheitEoDMI94lDaTyH6d82xel2Kb+KBgNp6tmF+O2aYWJyD
	9KTEmW/drEJHd6eAVgGXMAj5SLZ5sKP9N79CQGT3Kxb8L7sKM+LJ1LoWh5W90TLFpPc3a2g1n8+
	f7DpAepsIqRz3jaEqnbD61g==
X-Received: by 2002:a05:6122:8617:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec2506ae8dmr2821921e0c.4.1793027516473;
        Mon, 26 Oct 2026 08:11:56 -0700 (PDT)
X-Received: by 2002:a05:6122:8617:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec2506ae8dmr2821858e0c.4.1793027515922;
        Mon, 26 Oct 2026 08:11:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm327506866b.59.2026.10.26.08.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:11:54 -0700 (PDT)
Message-ID: <3650f273-d361-497b-8db8-7d5ca96283aa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:11:51 +0100
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
Subject: Re: [PATCH v12 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX84bCNbivvQHv
 AJ1S1WFIicrK46f2K4t/Zcfp9hNyLo5pSHvlbRMxev0SYz9dehCqhbnJlJLkxK8N3NZwRwTONmx
 KGYx/92V0i3Tcu3dhs3VUHrVjDRdSpe3pmHRlnFADR9w3+L5f3hCEKSx3Far8VB7B13UPLXquXY
 /NsTWXI+6zlyVkeCx33vE4YS4jxyaWvt7MPWgKu67p2q7Mz8tNKf5cWFoiB1Onn4ZqtNf6ysgQB
 KuesuuWtSUbWKHM+qdB1/EBbb9fmXSuGnAEG5d0JTOEfnCmSDwPK10WcZE2Hkr44aO06HAvuZjz
 LhdkboTesQQciQslXfRsowa3U2uGnYAla8bBuViPc0hZgDfOvpyYASqc5xjQgsAGcsFbXh4z2u4
 VwXL8u5rT/1KzPLsMAc/rJYVy7r1Ms0tKFTC2bGKUCYjWuBluDwSkgLz7j4t3OhGV6JKTsqzpOy
 WpSyawZ1KSm3D4hQbxA==
X-Proofpoint-ORIG-GUID: nvn9PSrSbA_iCfAjcG_UJngfipf-YoYH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX8PqFIw+sU8fe
 Tux2jbGfDB6RUYzdL9CKs9qPntIPGVwdeBp3jvs6Lhwqr/PBOYiKcXedFL74yAnyfOPFjYleMm1
 LV3fmvSIDoWW0f9NMuM4kDeeVR081vc=
X-Proofpoint-GUID: nvn9PSrSbA_iCfAjcG_UJngfipf-YoYH
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf6dbd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-W0wxAWcNmATYll7EfoA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 8/23/26 9:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
