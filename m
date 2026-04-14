Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645683B9DA2
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158820; cv=none; b=OHPhFkT3ciXbJWBsqO182MG5MdkYzYQ3sbVHbl63vQ/ZekFcEYcXj96Dxeonz+uE+1EQrb/krj5nz5bKnWaMzjgPfdgontohW6oJkk2x2nCUHA+0JEQCauudJEnop012MeBWppGhs3+fu3xSOtdsUGnq9oHWFIpoaxq8AtuSrS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158820; c=relaxed/simple;
	bh=93oFKmYp7wHHg9yJdPnYfsIe+IsIeNpLTT4yPZpxlT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uk/5ac2KfjBKcplXw+Nkknja7Gghgal+k1fwL1UmYNtQ/3ylCxR0SHLXVFuSopL+/hbCQKSeqoLbCK+8NbYsP4EfPxSn8Lry53edDrX5xoSmrrlIaKjQsku9odFDhyebvT37yh633v7rYE1xGgBgCbyngfjfaI9Wld73gyKy3cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFUxm4fv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OX4apoed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFUxm4fv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OX4apoed"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6erNf2509955
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xSJ7w7ShQoBCDAOFgmsszFWHe8vzZHYcqEZOoHSj/Bk=; b=NFUxm4fvSaB6GSkR
	h5jdRBByJeewET/65y3UAbprGwPta4CQ1HvuCFjdGsqyH7mmZFe2/64ZJzyyjZPw
	/0sWMOyqxVrlczZhvwcK4f3rRyCY6AsRjxrRqsPB0SP5ITwgCwOqvbu47SmTpmI7
	sYgLXgnfB8W1urXOHabnqD1SJbcthUHJUIjues3Ie3Hmfl7V3LcpJRmKkjD2hxWC
	WqmPuKa48RuZH8rwXGvcaSd9hGvUilvHbJh2uJS7vGrk47eDb70UNKtgAoa0lDzv
	EA+/iPenYG9MDnfIvC571VKs6VzCIy/nO5OWdItDEZ69wuVMxFHY+SoaoJr2gwCd
	ZOlN8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867t1r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:26:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b32feb719so7392731cf.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158818; x=1776763618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSJ7w7ShQoBCDAOFgmsszFWHe8vzZHYcqEZOoHSj/Bk=;
        b=OX4apoedPl1jnaVl0NJRfVx3IilxuQB4qOi76wBGK87FBzHUrTkKK9AejCOnJaHg9E
         SPVGtt3jfhdTHRtBN0bs4rZtuU3JqYaKws878r9TK3Zh0kz95QK6o+LXaDlF/oOCDaPi
         sxDPkjHLFDhVdMbhs+MB7Tg15C1xji3gctDzJ7vppL+xIa1TUDKbgLFcqerQ2u+R7/jR
         7z0Pe2sPYP0TRriYXndScBxcxvAfOUCPIgbuXHPEE1eQ2Wo3lZ/2trPt8Z7e9wzd7Wvz
         LUtYa5NtxYFHbGS3Q68xXmpcAcHGSooDg2zFvfXZrqSVj8g6H0eAje4JTHv8y0h5Z8B+
         z8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158818; x=1776763618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSJ7w7ShQoBCDAOFgmsszFWHe8vzZHYcqEZOoHSj/Bk=;
        b=JyFWjIwGpixb/S4Gd22IhIqgno9JRNcwpda9KMx6AwrcxC69MRsAhoOuflGJLHs8k1
         4MN8I7+S7/hMVobDS1nHUSjGnTmtoJGKXoAIwspxvK80BzERMUIculL01wAt+s295UDz
         /n41b1xQEWdzxl+RlJuDk1dwe71Ow5l7twu790XsxhSeZA0+F5vjEHCFSOS3y13xnyJw
         7st+KUBS+WrXQrZnhtU4+3UGxnKDZxGUYsYlBDtoQHcw3eXVShZJeKKqv3d9nSl2BVdg
         TykfYF6scNs0W7gJ+yy6OW3iKMA5OwhQRVMYNvlzXYua1cJzJhFLsJr1Krr1PR6vhtxo
         NnXg==
X-Forwarded-Encrypted: i=1; AFNElJ93/dKYekrS71QxqOoo/UB86rzkQGdVq9828mOcjhvYcrQAOrujYOrV5SwobXVQkZ0ULAg6qhooBx2D@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ZFo8ivGf2Stp57xqq6bcJU0sHTvbYUeJNOPeXZYk+WRHvvXg
	dps6wuGJrw4PKNLVUREWuUdI8FwDbGUfZ263RVkLFusziaoMZE9TQXY8i/lTSPfQB5/JhDjfGSL
	lKazqgf0yIFhNbpihMBg2XnEqxZNsIHv9TTEJw4tlNcuWB8UyNq5PaR+GPZZqSLyB
X-Gm-Gg: AeBDiesszRSvdMoUJrbIe7H1lYa3Jef5dwm5y7RpL2a+Kc0HvUu70/js5LL6Cragspi
	2UkWHNI8+d5Dqo6M/BsPZvUEpsfK3eZUwQbk+FcKMTcxC6gdn6HAGkLe7ztQ07zUXF9bN9AWNT9
	5BDHOkj2vrXBAInSp+OxMxe52TTZRSzmW61onZTiv2gGyW3NEYuV4qKrTkEgkhobk3Am/0m6Kn8
	LsYc5XPEOsq79SOOqF31h6WwXilx0+Pw14FUSkfVO3OwJMcE/oCQHPMUw9dOOnBR34W9TDq9r8W
	Uy3MIByrjOxh/uPWS4qDaRr9hALSRr7UZo7esssP18wrlMr01rppSdLM9c2ALcr1Z8iRkftCrqf
	VqMIwFxjBIC2h8LSbpWyCTJoRLtPvQm2ziwSZzUBdUs8qhegr/NC5vOqeL+6ws7JVlsRoLk8oUf
	c+ELCdFFW24PMK0Q==
X-Received: by 2002:a05:622a:351:b0:50b:5286:f757 with SMTP id d75a77b69052e-50dd5cf408emr165073171cf.4.1776158817692;
        Tue, 14 Apr 2026 02:26:57 -0700 (PDT)
X-Received: by 2002:a05:622a:351:b0:50b:5286:f757 with SMTP id d75a77b69052e-50dd5cf408emr165073061cf.4.1776158817264;
        Tue, 14 Apr 2026 02:26:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6db92792sm371663966b.0.2026.04.14.02.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:26:55 -0700 (PDT)
Message-ID: <a9db0ace-e93c-4d2e-b9fd-b669b0f82d27@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:26:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: power: qcom,rpmhpd: Add RPMh power
 domain for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
 <20260414035909.652992-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414035909.652992-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CL3DxHWrJvlO5Z3x-eELnU_eyQytXVwE
X-Proofpoint-GUID: CL3DxHWrJvlO5Z3x-eELnU_eyQytXVwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NyBTYWx0ZWRfX2CE06uf5bJwM
 rEE8RDSTDn9xx1TaGMndDNBeFxe201G9P77ePAivR8Wy8+6BvedNfsGEfeBmnyYiKi2ro7abAnh
 812HfRN7I7e7ucqVRHiM9DN9Pu3Ps32SzGi42jF+xMvvVf59384qsxlWNruFK5ZufO+ETtz0Iik
 IUzLasZx/VMRBU3EwmlGIlNDRa61nJwoLdiCxuEG0TVQrHfzGjqc40IRxaw/wbiHoom10IZtsMS
 5OTbMF+JxNc7ppdmrYs4AY6N+SRQCIdx8lTlRr6NW8zI56vLjrZeqnITwwBxlEKcvEwUMWsexYz
 R0kx15zFuKvQBEdyhCvsmBVOtwNmnk0pvchcb+xuZKlqQNaJaIe9I4a3Yvn36H3AY+xf9mTqsp6
 +VHceJRmQxGJ6FL/1GMvEnAteubKc94XDxhkavPix40dBKZiPDrtBsXJrJgJTpiev0KXUBvFF6x
 MnpdPXvrn0i1vpU3fBg==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69de0862 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TW-xpW1wIl9TmZx4k8IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140087

On 4/14/26 5:59 AM, Shawn Guo wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Document the RPMh power domain for Nord SoC, and add definitions for
> the new power domains present on Nord SoC.
> 
>  - RPMHPD_NSP3: power domain for the 4th NSP subsystem
>  - RPMHPD_GFX1: power domain for the 2nd GFX subsystem
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
