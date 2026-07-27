Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B3137C118
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162568; cv=none; b=M5ZnHSeVi8Uoe629hNYv93zSQ9OXYLEx9ut4sLITWVYJcTz8Su/NMQb8fQUd5vGQ4tRkNd6ouN+xu26VSd3MRiCc+9PlEUKf00vybFsSg1yhUpD0ZLLCTrHTpfEcnmKwsbhMlf6NVrX/HtEvuVXeb4I9uLraODWeeXjzQ2shPtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162568; c=relaxed/simple;
	bh=J7IX+1KghniSxNDYNpWepXmIVwOWXvgTqOG/Q+D9toE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbheVHBxkES/yZkzXOKsUH0Q9Dtmjw/NKhaPocSkhM7YczDw6WKz33e2q4QLdrBzmHP2WRn24m1sR3Gh+bsyNtvDsG7lfMeXbd5oIxYzXOsohpu02pDn0SnVU1X/3xjQ1fXbFuYMDdm/sLaV7Yi4l36Ex5pMND/QcWHk4wiuFwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X76h5AoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLcwerxH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X76h5AoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLcwerxH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaNx3905434
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3d7mjgyASnzKilsU1gkGLtUoMNYzl0sK0MnMEljMfyA=; b=X76h5AoPP/fCkjOV
	acb7UwIkiv6e9CbJsydRaXSOBI/t0rrsb+pITesWyuqGHAcm3xxy/0wlOT5VVVk3
	Bnl7ZAGc/tbWqwe/L2FwhBAGP1SIjXHjxiRO0y3LZ3yZE6qlTcu1MAdbh04dyRMx
	v7YLwHN3MClUYNFd1QiZ6VK2uGfIwDIivBcExXA3IUqLpEacZ+PDq1q3qlv6dhsR
	xmM6SR/SHJsakYAs5qAoyfwTQYoEWZ0aFJo0qlTj/k6iOAQpBUsZrnq2tQ/rmtMF
	Yj17Yi+BRRQYOxxYWcNBsMmpussZcMuWSyoIBHLCYkK/oFUfR4HPSrwEqBeKh2nd
	GDgB0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uks3bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:29:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9d953b71so3699931cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162556; x=1785767356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3d7mjgyASnzKilsU1gkGLtUoMNYzl0sK0MnMEljMfyA=;
        b=ZLcwerxHSvGPHe4x3AkGLOPePsva4i6Vqcs8szOGfOGUbLYElgGlDkbXPZg/UyNW00
         EcJltiFbNMKgm3pzOw4YUqsOzwRxdGL6WqHkClRWyvAK9eKnoE1S3gjFU+Sn4tmzV7za
         J7/lVtfqIf2NAi3VsynaYhl7qvQM9bhjo9otet7Y5pXu+RoE9VNFXzbmRqoFXjUragbT
         qbsT86icmoWHP7zAcNMpjcihFfjjzyKX5p+VR/GPjkcE02+HZfiwjUbphrsEFbG9eiMM
         57CihpfLXW3/pD3xK9aUafJrf65T6CO30mfghJdMyF+dlUSGtYvPlF6AhF0Nr56pD/FL
         CF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162556; x=1785767356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3d7mjgyASnzKilsU1gkGLtUoMNYzl0sK0MnMEljMfyA=;
        b=NOprHzXvArijBAeF7TPpedUaaTtVwQKOAnSLu/5QQty+9830EUyPTTHVCCUphlQAmH
         z7ImApbjY+nfHPedaA0d17eVKuq4IlTEDgNDkN0/nnaI/3VpoGnfRbjWRMj5GZgJe7Ow
         h26K4A1Yn0d/oExembzP7NS+fazp6veLc8ftPsf2QA/hFr10Qtv+yLR+4tg5/Mn3PQCB
         LGAttUVri5KBBTp6xeL1kloiOkfFizcJTZhh6Ny105ayIYl2LearDYWptq1qvhfb8n4b
         vTkyegQVOLbW9B6Fgvv/CEwUkDrmWnGYDiZOqKnKVfPNeHEqSvfz9MxpTnPf/i8HkaBV
         4kVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rotv2BWiJkhr8xgZibmeCncehWVfKp//+qNww5Xt4JfGPXJ54q7Mao+Utd/T+FP3u6P9TfyQ9TLafMJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxLVN5tJBXfbX0jv1fy5rXdCxzkTPesC3hFJS8deYuqEJK7j0Cz
	9OylDmyWWnBhWiIZ/XzXTAu19dOBueuto1NCbe7jQGbuDT/5F6pvyCuQCpKs1QxvaBIZA/SnOlF
	EMzQU1zL+lzOoi3tRThrVrZ7d16eXyK4mN31U7baq0jGfD+euxofFkf3tW70k09hH
X-Gm-Gg: AR+sD11EMwv3XeGRUwJ4GTn3jKnd/uY4R2O3C4khkMtIAhs5tGIdG5opDTgHE7FtS2p
	Fabb9BsA81oyJKC7y9JgRFvR1Yw/Vl6E9R1+virZfbfmaDkXUvIYxpFyk7kdqghcGpUI/osvEJJ
	q/3v1FUg+kV2BpxzJy9OK0Tkm9RawhHnOgQQYJ/GnSYsTrWV95r0LSQqZ+Mt41BJarIjFaye8TE
	r+FTwx1VJBekPlrv6l+RA77PR/NACtmGBeP83YlYPrzHersrJuSTG4DhLtywqGZi5Y27YMHPZ8l
	ZGAE4ZoD2nBIdqnDblRW57f2jFY7JLIFO09/3xPPtD/0aQjANMYXcavMOA2lgRXU8iB0sD2zY3H
	LHPbMKKi6GGwIKYR5uLQlvFx9
X-Received: by 2002:a05:622a:aa03:20b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-529cfe240e9mr2323071cf.6.1785162555977;
        Mon, 27 Jul 2026 07:29:15 -0700 (PDT)
X-Received: by 2002:a05:622a:aa03:20b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-529cfe240e9mr2322681cf.6.1785162555456;
        Mon, 27 Jul 2026 07:29:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f151fbsm662235066b.56.2026.07.27.07.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:29:14 -0700 (PDT)
Message-ID: <6313c8b8-8a17-41ec-95aa-b0d7bb8c7923@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:29:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: Add compatible to the PCIe
 Root Port
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
 <20260727-b4-monaco-evk-m2-v1-v1-1-5429cce68599@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-b4-monaco-evk-m2-v1-v1-1-5429cce68599@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o5bK2CWry_huO_sFKR8g4vjDmGlhDBpa
X-Proofpoint-ORIG-GUID: o5bK2CWry_huO_sFKR8g4vjDmGlhDBpa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfX1lj96NLryDDx
 NVineUqYZGIAFEMTvv4Lf10lOCTNujlyGIaKRO1Zm9XSFGE9Thx7eTbon7AbcYIAO+IDqeYWA5t
 rTuQRz73baZ7n/I1EoZXjpuxaw6SDDs=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a676b3c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=23UZmRNxtACLiwkAMCgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfX4WXCIpKtNs7h
 sr6LDA0WCTqPvdNiXq1mx7LVUe+mSMgVPfpGRaO2PGgiyzUR/F/gJCQfW3wXGc1qRnyKEHQZzA0
 GqsAWcrB+sBTffRJ3Bm9P6Y8PsKwtq+hSL9V/trddvkdVYkGSeQPndPk7JqhNYGQBuhZhtz2jd0
 GmDYSvapQu9DziTYxGvjiXpZeEA8ul7ztOLcKRt3D6DXYl0+MZq60RugTzu5N0tQanApjwqjHZa
 Z6JlQpnrIDODBQRWb9Ql2J1lVoaYyvDB3UmGsMQWrZoEzUOIzNrfogbBqgzQ2NSW69pLJn7HrFf
 FQzn9NBGzG/pqL/Uu4wBWcJ2Rp/g9twrTFdi1d/Oqu7tw5FMyXTsSIR3c23NrHv0GEhkB5Ak0jl
 uEoV8rtVCLNXqoQrrLiCKdVg2mMm9GW99LHaeawdCrdQjjStk3YUiy0QTdTIsoJyZtw1vZjUKFo
 5BP8dy35rynkVly0lmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270137

On 7/27/26 4:16 PM, Wei Deng wrote:
> Add 'compatible = "pciclass,0604"' to the pcieport0 node in monaco.dtsi
> to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
> bridge device. This is required for downstream DT nodes (such as M.2
> connectors described as graph endpoints of the Root Port) to be matched
> to PCI devices.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
