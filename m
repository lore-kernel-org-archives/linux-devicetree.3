Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D516A2DB795
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207626; cv=none; b=sGyadiuXP//UZ9pKdFmBitbjHwnGJOUQsCTPmXu8x9KHoqJQRcbtdjvhutYJ/LpIIJT5pN76MZkQmFZOgd6ALgbhkR5XydDSqzdbVHdY2K/UEz4We+rFJ789o4gpW4QRQT8zHQFTpzl3Ly4GFGWSpi5Q8icn2gY4uDYXbOZe6cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207626; c=relaxed/simple;
	bh=X2VXeMBaIxyZUt/YcVufegZfY5Be+3VO95uEcUTh0N4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/7uUOveXCtFsZwm/ApZ4zXr79tuYpjUFeq2qFtjzzgJN6RN9K3+zpvF0Y9wtjaX4gFmkqo0v7MOF0RjkqNeEnp01cussw5Zz1ZyBD0bEMrREyv/jQRsk/A4zNDNUunHqnzjthFZpVoU/bCrGGO7kQftOwsep/08KszsERLYfFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1rytX0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTxvMKAR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1rytX0P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTxvMKAR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63331tdI1380694
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 09:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O5YFDe8MFBUG75m/VVzNofZ9EsQEjcB7NmOeE9w7w40=; b=J1rytX0PjoSiJRDB
	YEtlUo41CHvxqy3DVcRqJxkwMcLU/sAE2kO0kHLWW79DmaHlKm3Ufix2P5pjt56n
	NhIM7p/JfE1Q4CVyZFfL6U7vgEMl38xMZSTXpgI53xTGhk2hesnDVIUsfP5/ZYpf
	SgwHrfJkq1hdux9Lda/kXnzTEHUfKfA8ZQ0WO0fR/rAv5gbg4r2B/NO2hPt4DNBu
	ljvWb4WRrdMHIav24514Cl5nEkvYYUsk9Mv0mKGE0ZBC5H6bINKfx9SwBvGUHzki
	gAEzfWjFmAmbrKBXlynkEtrTz3cAN0SKraQ8JQnJ72jUc/Etp+2wgRpwJiLPXKzj
	zk0xPQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myhcmd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 09:13:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so1812179a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775207624; x=1775812424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5YFDe8MFBUG75m/VVzNofZ9EsQEjcB7NmOeE9w7w40=;
        b=FTxvMKAROD17gIJ0IIWT2dTFjW9MVqlO5Kw5demwAbLdPjW4wejubB2aED5G2C4bhJ
         bchcXme4F4mrppgwegBlVRnrCypgZGw+FsSpZfDant/sWTZXjkSgvptpZSXfQeIQeB2A
         S7zJ6jmLEPU3AyfVHwePxaAg6faJsEB1VowArypGxv8Mj5tmA5etS3lICCpvtmPXspS4
         dT12tUTZ57Wdn7aYWuI5zeDGJr3PKEt2i1Qnm0ls3jBD7KdbStkzf78oiX8JEmRi4UeT
         UldrDQF2Lzp+ndvs6PlB74uhMVlDp0PMbhOQTjQIphGtxlEXyqoy8ZayGfDpBnONA0cn
         RfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207624; x=1775812424;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5YFDe8MFBUG75m/VVzNofZ9EsQEjcB7NmOeE9w7w40=;
        b=d9a7ATG64sAgKPPjRekfddnmAmhhLlFF0v0HEaG/OCq4db7sPlmD3PvvRhqC41qpih
         SvdbQVrRJ1cG+yIdSGI3jtC5SkqebSWTcaUM7Zkq9VXjE/qGFoAwbodyfwMVkJMrOH+G
         xUSplGLvc0GSO7ZAxDtqxIgokEFZbV/W2MFUUV4JX6ZeR31lPIpePc6pi66VQlyfkV5f
         hHOHhlRGET5EvAOw35h10H0lo3XpOo8VdwC0bxqe9/ws4BQuCnEVekPyc1Y9OvJn3btD
         ABE6iMNxe/O/qIs1AW9tq1BwNPB2ONkevoNc0/jyNYH/y5aT9rhJSR+nwk2BVOaoIh1D
         1O8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVx2q9qeEWxU/HkasZiHuc3YNuw4U1WkJb6kqiV3loLHJIKCKssYqoebT96rXq4Fiy/oOvBOTpARs0r@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs/o+ud0aHignjvAWHazwkx96QSfZPZupzsWFSHPj1QnnpmPhp
	08x1tAqHm+zu1Q2zxkcx9KqlB6OUSVajnWrd3QSxz73zRoJN5OCEKtf722z2K56FCdlo83ncRRk
	jI2vOvkVgUJ+DsK/cJdmzMhxKQH0Nm8BIGrg98tN1hzKBJdikCbu6VozdJhqEC0G5
X-Gm-Gg: AeBDieuZ5tMc04TjGmlbbPuTD3qSFXVeuD2oHynJlB2X0AmkyOeTW0QaSk76hVIDf0e
	FhTRDPlM3SCG2NRKsMjnySHrOHnR5k01LspLuu/Er1VrfHmokvBzwfbz+7mVsBLXOkIM8zxbwW/
	Q35k2uArNqb16r9Thv/+EYK10p3ESxDYzcdHmM8d7OffZhB1eEfNKgO/b3SaiQGIxA3OR0zfHXA
	0jjparb13mpXsaZ/yiVJIr/e3+2BTcjnwFZ+D+X2bFepygkDhH8A761/qZtChDq5u22HSge68k/
	qY5UY6gYhKPomNaMBpy8c5S7SINRh8wMI8BgvZHULd7mspxYXSX8vhyqMTUH+94kzqFZ5QmIjgH
	ultp8rpH7PqoWEpU55KSLaNfGLcS4wahicigw8Ine6NOCDqEhZ+ZO4FdeZQ4j16R6rsB8H55I0M
	Mb0bj0JFNJum0MZYpxQq0=
X-Received: by 2002:a17:90b:52c7:b0:35b:a44f:b80 with SMTP id 98e67ed59e1d1-35de591e934mr1457559a91.1.1775207623327;
        Fri, 03 Apr 2026 02:13:43 -0700 (PDT)
X-Received: by 2002:a17:90b:52c7:b0:35b:a44f:b80 with SMTP id 98e67ed59e1d1-35de591e934mr1457527a91.1.1775207622493;
        Fri, 03 Apr 2026 02:13:42 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f50e9sm5182277a91.6.2026.04.03.02.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:13:42 -0700 (PDT)
Message-ID: <5a606f7d-6665-4b0c-bbbe-32538b2315b6@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 17:13:37 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vuwaOCrcXe9WPHYMidZkOlXj41jW9vxP
X-Proofpoint-ORIG-GUID: vuwaOCrcXe9WPHYMidZkOlXj41jW9vxP
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69cf84c8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=0McBQ3JIi2lqW2-U6ZoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3OSBTYWx0ZWRfX7CKiAVvzsXg3
 ssUWkyvLndtqB6RaZoGue2aQTHOPvWio8Fp1V5jO6BYO4RE5ftCJM7073EpDmkt0zH6aIfjk67i
 OUj0BNS/ZYpSZ7CA5aoAUa49P0qkvJKQZKJgwyjl+yy4Uhvqo2dzYtda7KTssTCPRPrMgUu4vmT
 EwBmlX+xUSSYzcGSaESBKOtTL8dscb8sfS9Q9jWGcfeAjXlJNQ292kbUfqTXU1A2HyuvgYHDI41
 ICgHhusk1iInt2FZiGXTn9afm4gFrMSAxJ6M1/qJuq/JEBVhgvjcLlfwa7czqw3QfX3jbT4CUNq
 XSOb+yeCEv90Bem87e9BBRsPc9AWWCGi8hnwXtxeJg0i7KanVWULrpPNrMrHWNxjQdXBYyQNWLe
 X8moN985DHPJiOnYFLWS5oFGiPe3mj0xaGz8ZRwn14IOV3ayWpMH2Ad8Dyrzc4KcwW0ReIyheAF
 wTqBXxj1+b897czE2iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030079



On 4/2/2026 11:53 AM, Raj Kumar Bhagat wrote:
> Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
> AHB only supports IPQ5332 WiFi devices.
> 
> The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
> configurations. To enable the IPQ5424 device:
> - Add the necessary hardware parameters for IPQ5424.
> - Modify the boot-up sequence for ath12k AHB to accommodate the
>   requirements of the IPQ5424 device.
> 
> ---
> Changes in v4:
> - DT binding: dropped copyright update as per discussion in v3.
> - DT binding: Used DT binding from v2 and retained Acked-by tag.
> - Link to v3: https://patch.msgid.link/20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com
> 
> Changes in v3:
> - DT binding: updated copyright.
> - DT binding: Dropped Acked-by tag as copyright is updated.
> - Rebased on latest ToT.
> - Dropped ath12k_ahb_ops because qcom_mdt_load() and
>   qcom_mdt_load_no_init() now have different number of arguments.
> - Link to v2: https://lore.kernel.org/all/20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com/
> 
> Changes in v2:
> - DT binding: Removed the redundant example for IPQ5424, as it is similar
>   to IPQ5332.
> - Added driver probe data structure to eliminate the redundant switch-case
>   logic in the ath12k_ahb_probe() function.
> - Validation completed, hence changed from RFC to PATCH.
> - Link to v1: https://lore.kernel.org/all/20250130051838.1924079-1-quic_rajkbhag@quicinc.com/
> 
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> 
> ---
> Raj Kumar Bhagat (2):
>       dt-bindings: net: wireless: add ath12k wifi device IPQ5424
>       wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424
> 
> Saravanakumar Duraisamy (3):
>       wifi: ath12k: Add ath12k_hw_params for IPQ5424
>       wifi: ath12k: add ath12k_hw_regs for IPQ5424
>       wifi: ath12k: Add CE remap hardware parameters for IPQ5424
> 
> Sowmiya Sree Elavalagan (1):
>       wifi: ath12k: Enable IPQ5424 WiFi device support
> 
>  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
>  drivers/net/wireless/ath/ath12k/ahb.c              | 36 +++++----
>  drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
>  drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
>  drivers/net/wireless/ath/ath12k/core.h             |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
>  drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
>  drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 93 +++++++++++++++++++++-
>  11 files changed, 231 insertions(+), 21 deletions(-)
> ---
> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
> change-id: 20260331-ath12k-ipq5424-cddb63a46a97
> 

only nit in patch 2/6, so for patches 2-6/6:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

> 

