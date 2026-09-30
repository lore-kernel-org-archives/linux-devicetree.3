Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D0A4825AF
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764407; cv=none; b=c6k/2zaf6So3Doz8UjV/xkAS8MomMK0jgobv3Z2XQdUijF7zE1ayxvgwbVKmEjSEpDbsZcGCZWQUX/JJ/3m/zJw5kHLSkBf++vLfK7zticaXekFIjdBv7tYqmk/jhbdawpD8NAyy6UZxt8XjE1o3iNPIT5EVK1sh0mhgbeVdVYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764407; c=relaxed/simple;
	bh=p0rtOpqJgYOdzRogUQx4C72rBJ6MZuOxyLFNm8hD7RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYXxM3h8yAYbLUVNMrR+BJXqcc3XC72dY2xhrJA+7msgzVhmpGa7XvR07iXws8v2rpL4w290jQQV+sylChOvnpYL8Vt2+NDVKgv3971LhO1uekbRHqwknE0Lcn/zN8kbgdxvftS+Mi/XsQUX1igoDpNdC/fnP61C7MlRFgDXNqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKp3pkBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9UPHw4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKp3pkBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9UPHw4O"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dcPL3330413
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=; b=KKp3pkBlG9NMn4o+
	Ie78eIItC5nrJQHzevcTluOiAL9eL+IM2U1fu2POEr0CPh21TWhoOJoh/3q5xDXF
	oGg+oJlL+dI2NFnXoFUUlMSBjBp60SqqKSFox2b2bJbwcfSM5exKxEUmjtRAGLBL
	KhrNGk++ecMx8H7H+ns1IWmdgdFnVfICtwPauN6XY1twkBNf1rQEAFAl/jCjHkat
	Hw76Q3tvDqvnBY9isdhW8J7IrngXZFJEiUzfcInlBymyWWJftxE58SeNLVzsvFhB
	foH8mUZM6lr89VlWNedjUse0YSfwmOyOdW4+7fjcSwA8Yuv7F2QrZw7oPW894TGp
	Z2qUgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3jvuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c9a1cec69so26827785a.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764403; x=1791369203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=;
        b=I9UPHw4Oiy0auvSlwDAgvpMRNKOkl4CGmhHQYBUJ1vNhgEAf6nSdUrt7TgnJjfVEGQ
         mFctZykjxc2qzkBJlfwcrIB7g4JE2ju04HcQp5G+kVd4cqYcDyv5LTLJEw5MXxug9zqK
         WiCXQayR+uq4Zk6FHAhpTlwUAtAeMtEZpLDpDWmt9vNZkEWI1XJ2TCSxQ1prq7NWMEDR
         bt3O3lK0ljQv/djHBD2Qp++pZPY6qIfTKA42gB23ni48GU2i2H67UgkhlTEjcrSbkxmc
         BZ7Yar++LwPVSRFO8zoNnwjNXtJEtqxDvSiW3Qw9J4HAqmSM4i42Y8IFo62gMMRRT6WY
         yvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764403; x=1791369203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=;
        b=w2kgOtddnl8VZobY4MxIijWpXcbbfgx7dAbgK5w9LZ9FukM3Dk84qY6/gAypcWOV9c
         C4XxsCqPRjiMkAaLE9lcIU63zHuaNU3+2Y0cUtDg3ZVDB6q4uNYg4hvJoOqP24DDSZ00
         4jTM+O4yaF7kyNYGqFH6cTm2aJKHUM6QqX82vL2OtXV3pm/qT1CRhhhcWB3csEV2y3e5
         lMm9iftJMxLutHUI0BA0LNta+CdIRCezWFpG0NqpcKzJrYhGY/YRF1Ot5ZW/or4kChSy
         CyKGCMOcRjDj05R6Ab7Civ5UvHFGBfMc4/ErNolN12Q7v6X20Ueniq1UpMuswTJDnxb7
         GX8g==
X-Forwarded-Encrypted: i=1; AKwUvBwX7NpLDGAUbkeMGmBebn/+UOYDJvIfgI66EegjsRhi4fI/cYZIxi3WVH8KF53BxcBHl8m7Q/1vXPDR@vger.kernel.org
X-Gm-Message-State: AFuF++kYYREmEL8oiBS6wrgfYPKthy+TAU25iHOvKJPiixs8Dv6lab/L
	b47CIuiCRXE3hz7XBVD6ZElWcllFh/qtDhjr1ajK99qh7Ssf+jggdx4FPZWEUYlCz3JAgCpDPL3
	Ckg9FGhe1uPrMhe6IXzEO/bhOKVWnAQeVD9FqB7wMYxocoLy9JZgKcpfm2cBA1tGv
X-Gm-Gg: AYBFou2DPQjnK5G+4yHJ7V8r7V40H+ZL9RIQic05zyZkbhp+stELhIRQ0n7Xbc/8EKj
	DBMHFoZps5un9J5mDkqGGh7qOY6N0RSU1zVKvektd8uTn60NoU6dmarefET0HqQ/OOKjn+VpVZp
	1Tme9ASTeM6rPXkfdYfSjt+omsyldcNVRX8Ys3L+6iBNe2q5iHpI/iu4Pb/T2VvQ86iFbBPp4IP
	lSCB/jx8EgSscF35HUnlM7Hd2CpnX45JdpGomzaw3JKUl48KePFfgLdQSYDt9jnvypJzm9RJQ73
	+p9JZEHHEfr+pCXjQIZtsGi78FqINqNrhwz1sn0+YLq5BmrvYatRom40eCIlNL787laT01BcXDs
	zrWsOFCSRT826EdW5r6cQ0A==
X-Received: by 2002:a05:620a:84ca:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93ca9756a48mr144982585a.4.1790764403203;
        Wed, 30 Sep 2026 03:33:23 -0700 (PDT)
X-Received: by 2002:a05:620a:84ca:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93ca9756a48mr144978585a.4.1790764402614;
        Wed, 30 Sep 2026 03:33:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm671766a12.1.2026.09.30.03.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:33:20 -0700 (PDT)
Message-ID: <3439bb37-0aab-49d4-99af-8c2b22fc4adb@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] arm64: dts: qcom: monaco: Add Iris context bank
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
 <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Cq3kr45zlMOHSSpC9HHccv4jOMMhp-ZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX+qbYEIzP1Da6
 wTsLa1nmrN5/hNWhfKQkqP7dB5sINswjyDYXuYpZXOK5fklZjvuJ8sfMHDLquU6R8+ENf7ZHBLI
 cgGAaTwpqiAZ4PmfujuEAN6IdjlX+dfmZNfEcRpz3kfb1BRf+rEhF810ZRVu/ZLoLdThuCbf+E5
 R3ODYkdQegkWJEfvzUA4sI6OjnyAmo7cTy2e3BX1CrgpG+6GT/2T8w80UsYhvyH4MCTF3wrECy2
 hm6tT7Mxyn6+jziX0MkiPMMzEUsA8KKxxE4b67EGt8sbiYWqwmj6tO0qPs5l/rB4r2hG1/RdKOt
 e1gSZWqNExKvoJlenyUZtaUFbEfgRL2qKFi3hOX4ddpNOWwx28GLhb28hRpNZckXRhb4wnEYidc
 XUt0f6NlXhxI5idewTT1mv77VEs8gkQyTYMrkDGJRdfhj9MVqP17+jDILRE2Qp2AWYWorHg1A5t
 qgn39J/ENkCULUIkTNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXw3t0seBrCzo+
 YAdoAKKpeRq0//WE3Xbr/hN10b54RC8zeI6lhTnttiFKikyIkkq/dQjnzyWY06ciCloTHFbJtA9
 EdwVcLr8f47UTMJZodQotTE1Z35yzzk=
X-Proofpoint-GUID: Cq3kr45zlMOHSSpC9HHccv4jOMMhp-ZQ
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abce574 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
