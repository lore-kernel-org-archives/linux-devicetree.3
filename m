Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990141;
	b=EWSLN4ipK2HRuJIETzb4kV+3xfudEzxzxL5YxHatgVVFxhZ27UqWS1Xm2sPClcrBOQd4
	 qA3u0m0FSCpROL/bvSCnF3bMFHrAZPYjnIUhzp+e6bPaIoBsIuqt4PuEv77ip+QfLedQb
	 uy8L3Br8ex9vvbZaMe2xpsFVZ7rzBhK2LT/HC7XrCGIjITGwSBE8/XqMHvgFMILjr+YAW
	 ONtdGw8RDQIU70So0LIqTQ9NgvKrAqdnb/81kiCDhH60123TBrvdnK8vEBSdnQE9RCdkY
	 oFrVlYtOK6coh8c73EtqLWjJ8DF7hkiDopsKsWtCw9ZoLDiRNa8zAkBkSuNnNkcFJCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
	b=kXni5DvC2M3hJ7rSaY0rm3Jje3vNcZ3vzaf/yLcEfsceO+rAhe3VmuWc/KUrHiv7wq4q
	 TvIW9OpZiKKdQc6wDPtZwnQphfF6Q5pPduV3ZJpOnNbZA59cF/qP3eDXyuu9LHFkPnhzq
	 kvRTqWcAzRYutMpF0D1r/3HzLpcfpfTiOOXc0dL37a4rWgkcGRgEMQIFt0x2Y7HzH4H5M
	 Cqy/bJ+5ZQH4kXFQdYRmo0NhDwtEHpq89Ie4gkhpxmjbuKpJ0RduONABKSQXVKpQpI1mB
	 O7vw/4GorQ+fovKAQUJP0GfuFN06cYaiTPeKiL7RnwO5XXE2f4xOm8ww5e6FN4nsEJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8K5NNlF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRVJje8i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C23606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 18:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C23606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8K5NNlF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRVJje8i
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HtBT33066233
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 18:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=; b=P8K5NNlFrrqItXqT
	n2b3FmqBmj6ylC9Gr3Gt8NTQwaMlnX7fCC8bp8Sj1yOXonXgIE2PF5WlAVOv7HmW
	IWG+C6zqEbbpHE7BjV39imBno+jh0rixVHexhC14kUiB689iu0y34vNW1rVWjCkA
	UNsrHgBbRmgu+ocu+pnBymNw5w5+vBFbiR1ofhh18TNlu4rxRLJE/e8t+FBBtoMR
	itEx4AAupsvsEfART7q93Bkaz8Cl6P/AsVtFgiqtsYGoNMt/dO9J9PTn3rm0U1pd
	TjzZXvgOBsCzneB0bYvRci4+84zcfSd8gjJbW3Qa5imgOegHSihi2QV5wefEbeVm
	Bt1eyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcc5yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:35:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so1361573eec.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 10:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793990139; x=1794594939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
        b=YRVJje8iJR8KypXihWsw950bZ/rMZnOH+LCBxidyHoqR3yVK1NOaTLpQ1jymCkq/SQ
         JqdpnbFbpDQgTerjMpc1ETzz/N0q5OfwURf54t6qtn4TMItlFSkGpMoULrT/xFfjl1Mh
         C248QVXrwL0LrHpjHUMrDhu+waJDmaiHkljde1YuZyyAtdo6Wj+gXFu7SloO3APniPEd
         ncWTwX/7OwM/DkrYyI4hu3oKO90ZyLBRMdaE6SpD7zdtsBidx0iPZYu8bQdquPi1lAfb
         bULgD2N3h71d1PQRFs7jAAKj2pUWKUZ6a3SWZYryKHnkfB1SvFz9xDayA245/j+SnKrh
         xyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990139; x=1794594939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
        b=NWFteKrwPvMudgM5nmOb5uSFruAWa/s9bwzWBci3AYbw6/Ezoc3LBFebnv784Hfrbg
         Cgbon6a2tWXmcs+bVPd/1jineqgz4j/CLx0ieHZzSTsDpUZowjx2QTCbXtZ0dnaYIMs1
         24QaebG3QCCdiPCq/rmfO4RSC6IvhZOUMPgzSJ0vhLLn7CJB+5hBJHWad2UzDuTAGRfP
         3BZCCkQwZAUD0Za4U0A43dNoH9DBXVTuQZvDg9a/Nv53MqEg+4PFKOelWB7Gan3piOs8
         b7ZNFshstdhcjBtChh1TBV51f2skIRUnRJ0rwJ5yg8EZhDDvv9DhaSL7QIpvCHdxxytC
         mBWA==
X-Forwarded-Encrypted: i=1; AL+hErGYHUc2OeQIGLhi9PK13zBrbHn8cW2lx/N4BJVmSg3QZJY8N32tOnSolzRZEvher6ZRmfd4c8UpKOoc@vger.kernel.org
X-Gm-Message-State: APuU4Z8H8t2B0f0Jee4NIjGQaWg3cLmxwrjVL6z0yBbfzzgcFeZJjfVA
	aIevV19VV1ceutklUxkPmKXRRaxuJCLWQL4xQseCqRKBaBfFf4H6r1wbnANZPkZwCE/cWg0zu/O
	ORq/AwJKq5iH9bsy8uW7BtZ1crRPV6Sv4R8RAoV1Wf1tf+Cpe99diW9nhzrv39+KY
X-Gm-Gg: AYBFou1xJi7sXef4FaK2TV5GrQMsG2T89IvlLpirCGJeymET0pk7tGg/4EK6S2QYz8U
	22HXl+9QvMYKxLV25vuRemGSGxT96yHtB8c9QZ6Bvdi4M9F9FtRIvgd0/lpyJXBUVoQcBAtYQr8
	378qfteTE4JZmV0wB2ndBya71tZLHt9RIz+iKpl3qw/NOrj+B1LvqrUTAMJE7jSCo1W5G5cKfT4
	cC3sARL9pUAjstxG5Z7a0DU7WhoJqXvMYdFnqYVivUfR32w83Zph2t+yVd2UMRZ+tIYL8I5C7Wk
	t2c+3a6u45nT0W29uNuWd38YFYQUccFchtEzpr/Tbj+ameRg9DIe3xjAqNMkCGaIh/i1Yj/+ajk
	d9Zju6ZTngVQipmQUQvuRemAd/cTtCWFjtZt1c+12Itjb/Td1QocgfgtoVWbkiVbLiL3nZlM+aM
	IH4LxK2LYyZmav1gQ=
X-Received: by 2002:a05:7301:fd0a:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36f774f5c3fmr4397672eec.38.1793990139020;
        Fri, 06 Nov 2026 10:35:39 -0800 (PST)
X-Received: by 2002:a05:7301:fd0a:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36f774f5c3fmr4397636eec.38.1793990138362;
        Fri, 06 Nov 2026 10:35:38 -0800 (PST)
Received: from [192.168.0.3] ([49.205.82.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm10347444eec.10.2026.11.06.10.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:35:37 -0800 (PST)
Message-ID: <1ad8a442-278b-4db3-97c7-82e0a77b201b@oss.qualcomm.com>
Date: Sat, 7 Nov 2026 00:05:31 +0530
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
Subject: Re: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for QCN6432
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aRQPmOSqdPFwM2m5Yfp56o4CR8SBylU0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfX2C3nrWvc3WlX
 rfb+YZUw9FSrmkIOwh8WI2EDzwP4CtTYoK7VltihmaDuZNqpGu2tlet/3VRrsqW5u75EKQRnB26
 vGBYVVqYY9N4y4+bcvFAjyfmZd8m3eDf8S6ZWX3MVAMqryFVOvXVoiJ5RE1n9z63fGw3aRqxFcK
 zRkGhwP5IF+rotb7R86eggVp5eCbNnJ0QBtSUAPzfN3hECq9nP10Hp2A0iPUPu7hnMekVUO4Fml
 uthyDbU4D8gV4xbQgm6LTBmH1wIRNnrasZ1OL2QPH+ZFm+ntu850l5xHFhYPY48FZSsbryVan60
 cySZ+ioZ3LKF7MCTyQl5jUKsG7cqr4LUHYukJa3u8Y4v2/oKkennZKhOEfDwenbhcvNx7XpkE7i
 I+Lo2e1RyhV+jGf8x1rdtws5WHLqV6C1tjembjYIgQ8ZYhIF4wadrUw7++6xyovhkWfmOTWBqqh
 A6i6wKaGgcJ/czqIvWw==
X-Proofpoint-GUID: aRQPmOSqdPFwM2m5Yfp56o4CR8SBylU0
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aee1dfb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Yi4Dc0+RdECwe4ym5Eh06w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Jrv9ZmiOdEm1SHuq7XcA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfX8jewiccRjZlo
 7RcOqLNqw5OY6K0Hs0WRgsdNMvrKdAnObjB7Sn2e3bT59zh4epBVnddAhkzhlJcmuCIyyyclLig
 NnL7Cw3raQ+3R8xJQPJIGsqNV8+iXLY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060074



On 23-10-2026 12:31, Aaradhana Sahu wrote:
> QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
> registered as a platform device (AHB), and remoteproc APIs are used to
> boot and shut down the device, similar to other AHB-based devices such
> as IPQ5332.
> 
> However, PCI APIs are used for device setup and register access. Since
> QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
> AHB/PCI approach is implemented.
> 
> Overview:
>    - Patch [1/17] adds DT binding documentation for QCN6432.
>    - Patch [2/17] refactors PCI operations and MSI config structure to
>      support different MSI configurations.
>    - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
>      for QCN6432.
>    - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
>    - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
>      QCN6432.
>    - Patch [9/17] adds support for unified data-region memory allocation.
>    - Patch [10/17] moves MSI config to pcic for better abstraction.
>    - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
>      specific to QCN6432.
>    - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
>    - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
>    - Patch [15/17] derives QMI service instance ID per protection domain.
>    - Patch [16/17] add userpd ID mapping per device.
>    - Patch [17/17] adds support for QCN6432 in the driver.
> 
> Changes in v3:
> - patch 1/17: Update the commit subject and change the file name.
> - patch 3/17: Initialize qmi_max_chunk_size for QCN6432.
> - Link to v2: https://patch.msgid.link/20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com
> 
> Changes in v2:
> - patch 1/17: Update the compatible string from qcom,qcn6432-wifi to qcom,qcn6432 and remove the | character.
> - patch 11/17 and patch 12/17: Fix resource leaks on probe error paths.
> - patch 16/17: Move the NULL check before the loop.
> - Link to v1: https://lore.kernel.org/linux-wireless/20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com/
> 
> ---
> Aaradhana Sahu (10):
>        dt-bindings: net: wireless: Add QCN6432
>        wifi: ath12k: Refactor PCI operations and MSI config structure
>        wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
>        wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
>        wifi: ath12k: add support for unified data-region memory allocation
>        wifi: ath12k: move MSI config to pci.c
>        wifi: ath12k: Add platform MSI support for CE
>        wifi: ath12k: use CMEM write for PPT on hybrid bus devices
>        wifi: ath12k: Resolve userPD ID per device
>        wifi: ath12k: Add QCN6432 AHB support
> 
> Sowmiya Sree Elavalagan (7):
>        wifi: ath12k: Add hardware parameter for QCN6432
>        wifi: ath12k: Add hardware ring mask for QCN6432
>        wifi: ath12k: add hardware registers for QCN6432
>        wifi: ath12k: Add hif operation support for QCN6432
>        wifi: ath12k: Enable MSI interrupt support for DP interrupt
>        wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
>        wifi: ath12k: Derive QMI service instance ID per protection domain
>   
>   .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++
>   drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
>   drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
>   drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
>   drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
>   drivers/net/wireless/ath/ath12k/ce.h               |   6 +
>   drivers/net/wireless/ath/ath12k/core.c             |  10 +-
>   drivers/net/wireless/ath/ath12k/core.h             |  24 ++
>   drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
>   drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
>   drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
>   drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
>   drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
>   drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
>   drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
>   drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
>   drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
>   drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
>   drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 143 +++++++
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
>   25 files changed, 1214 insertions(+), 109 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
