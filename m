Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4483B485946
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764423; cv=none; b=OumFECS8pfPIA/TarR3Pam8McRX+iSGOE7uq7uqcSdE7jHHVFAuBf6dRXcL4H2P1PdyZtz0wQZmbZFD1MhXCsqGfBWunPBIITDu2Iakn1/DQbNdYEYENQQO163Gb7o9NcFEBXrFM5sBO/mHc/djKoS8CdLXlchgdsIvCIrGyQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764423; c=relaxed/simple;
	bh=7R77TQqIMmdGoS2eO0kXm9TNz0zOrN2y4HHSkA/2YWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pu5QhsGCk+o38wAWFBz43nQGXdFKivzVQ5DGLIkTWeQuFkDSesXlWVR+bjo7P8kI4V55zmmu73bpPM4DK/SdekQZoQD+9p6038VLi/tIabNdBQ6hAvEdIK4rS5Im6gs8IJqga2rP3txcjv0YDxEsJEE44CKIpbalwen81ogGZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI1nt06I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPatqYKL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI1nt06I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPatqYKL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dVUi4047445
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGZvKGq2A3pM90buZ2VNpRfUMGSk6SlqzeIIAOV+V2w=; b=XI1nt06IC4Gfyq9B
	JaF7mWhGVLDxYdGSxYjijvlM8YeKzgINZOmi8J67i8aHtGJWksB1hEPIV4ig8K9Y
	7sp7uM28bWnzm8YEbZG+EabfsxVJ5gmmuwl8NQPz9WDmbJ0zje11WAEEJyAkBHVJ
	GBnhrWjuTBdj+8llu4FsgTfPySBU0+56wp9sTVcxWv5epg02/kQzbDiyKTKtWENb
	4neqAvUEjWOvc5nxH2sZnbcqnfMiqX8dYXTNJz/PYEf9XewTJlmpt1ZbxDTlJv5c
	ewy6wCextAHBTubv1xxsUA9LSABrAESqb2b1F0Fff3uh8ug/Au7ScgXVwICz539D
	8V2UlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfab5rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf3eeb42cso84407385a.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764420; x=1791369220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGZvKGq2A3pM90buZ2VNpRfUMGSk6SlqzeIIAOV+V2w=;
        b=KPatqYKLTa41CEXSlNOr+4zirS1jeOzOrIvsT8dAbYQJjDACdlKzsFDU3kvpa4okVZ
         3deEjRQc1O094UB3uuuyfJr17RWobZLchQnb+UTt8jipfBTy2yOK6Khtqghpj8LlUwre
         hBXXTWaNDsqTPMV3+zDmzEvtvSf+XlrLdJyIRExORHBeXBi+Oygtt26BejwW3A8QjfIa
         727Lek7HlK2uC7AcxATow0DjDw1yt5t0yeksYGU5ZezGHZI/kMAalcnjIKc4CbPgEN4D
         A+hsesHIt39/tih3aDuA5pIp79Q5Ek+inTad8fKH0acxme1/w1ELcEDjVCgbF9aqE4LI
         jMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764420; x=1791369220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGZvKGq2A3pM90buZ2VNpRfUMGSk6SlqzeIIAOV+V2w=;
        b=S/pSWLAIb7Q1VRxXCHLVi+ysnwJGoY5AqNpEob2CYqb84WHg1pVZg6CWE6ZCixZUuG
         a16+hl8KLMVYCTN41KEFFpkzCkFYfEZv/v93797oQeutvyaWAxKIg4P19YhIjYRpzewZ
         A7vu0mU69ZlvJmQKRDSkmXWx+gQ6s1cwTkGik+oU6/n/Z8CzCqc55qlYktMCU5Xg6l3O
         PreoQ6MQCly3nQSzCgJ3q8It0s9auDog38CHN8VzX76xpP41b+7/jwWj2JZAhxDzcO+2
         Ta98veoT6vBZpFwbdMbzKZ+0zjdG2qfz08F5Dj4rwp+E04UQtzrWau08EqeibUVDSZPD
         xsPA==
X-Forwarded-Encrypted: i=1; AKwUvBzLCWmnvN33G4pZOOK1OB5PDiIvcCzu7l76IDNlRtNkZ1APN4PzPFcbW1hvjiBmjaAwX4YBtnK3Yeiw@vger.kernel.org
X-Gm-Message-State: AFuF++m4HYw7UTxh2hR3hOsJcAoi8R+fzgv6y9mGJV+qeRBAFC6sZxcB
	WH5Tz/XicRbhRK1Pp1QmMZOvDbcKOmteFWb7m8jpbjbVaWsynRjuNY/wAufLyHcDg6IciPnqbBg
	vwacqXL9cZqdww13qRk+9qkrVPS/SDc/sPXeDAc/E0ED8DkZUZmjNnNpx+qXJVPJD
X-Gm-Gg: AYBFou3MJpzWfsoJHp7gZy3AEJt8NuEcergKfz8CsFrhTQ62jLeeoLhjmMMZvPquNrL
	l8nL5OUFFpFsgL/W1OoidJE2AlbdOSS1/+EXoBCbMS34XK9qps7IwemEWM+e823m9pg8Eh8RPZl
	HG2D9xkPPil5EH0F5WlGcNq0JWVC05oA1vABQ7xDFEpNVsdEtmjmPT9+I+gCXe6bKfPz6fPOSkF
	goesIBuzzQF5/AK5lbwJKFhDZfShsPwfdQLa3Ms7loLnkw9TvX9kOyHi3LseN2z2YXwh06gZlse
	MDQ/JGK6wjgMbB904tlRXZbD6fVlCmXPcsSd75R79xVCQwDg0Mmrfa/XQM0A1+bMtkFRcQXspDM
	PY+O9DlzT7nhkTStx4Uk7Qg==
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr145338885a.6.1790764419693;
        Wed, 30 Sep 2026 03:33:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr145334485a.6.1790764419199;
        Wed, 30 Sep 2026 03:33:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm671766a12.1.2026.09.30.03.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:33:38 -0700 (PDT)
Message-ID: <255658f9-cd6b-418e-989e-60daa36ca498@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] arm64: dts: qcom: sm8750: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-13-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-13-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXxZsKw1ZS8gUS
 74wEv++kMvycHxkYDgs5Vf2p4QaD7LNg/axHsU8l9sPvRRkoFh523u4QuaxKdz/BcNax12h+eWJ
 rVBzfSY/+DetZuGY+Aj7gJ3/i8NpIXK5Z3ixlHCFsIFMITu9Tu+eKwPn156DbjO2ZEp4EZXTWCe
 t9KTI3dG5wvGdF/6+3OkPHfuo8+e2DSrafaz6F8Hg57A/p7KwPrr4RqxmAgr/RG1yB2tdwzl1yB
 clvQbtpAv10cKYvN8+x+uoPc4OwcmwSlMS3Yvaq0NmTMtqEjv6fHXaIHNL4WPoiG+8eeyL8hqbT
 QR2Oe6FF/UMfkN16uo83Quv93NVPUj81Mgn5E/T0QLXj6oke7cpJAU13qqWwMPn4a4hRSOOOLGn
 4PU6hgvFAkEiWC28qenuXSyB/7Xl/9rKJtKfGnIJZ86IMd5N3/J/PS4k4MDxPau1J8M+ot+ePim
 a7eA9d+WL+9n52U/8XA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXxQcD6FgzDopb
 rfBxo+S95jFO3SDZtFuphU+9h8mgEYt53d8NpAESi2d5umH722ulDSD5v0osQg26dF7Fg+lKLVS
 8sXnDZy0DsF4kLHYplTOVL8pCsyKj7w=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abce584 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1JodX89Cn1hQu38_N2Q2d2Q3kGNhoUM8
X-Proofpoint-ORIG-GUID: 1JodX89Cn1hQu38_N2Q2d2Q3kGNhoUM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
