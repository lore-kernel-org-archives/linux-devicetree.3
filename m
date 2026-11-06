Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960952;
	b=3vS9sV/ZVDbSqllmo7Pg18yqvRNGHfGYkC1hT85Vlc+/ByyT3Ozvug00hSnu4xtN0VUZ
	 YpFwot0TIXjD2e5ZnGWVY9aPGmWr+oH8tNfir+lxFcvPUFRwj9yVvgPsxGMbEjmsi52CK
	 kEioyAkXUTK/gZQqYKxHzgExHq1s01xOp7pUOTVWIrneW+fptOiYeN1rn3yOcJwNeB++s
	 8PGZLXzABoHqCmVbSkcajuPGcxSvSdadW3wYHnHEQgU2OjMFqVCzs6TGrOkP6jzKvuM1l
	 lgMyYTAdBnzeBurqCVbEDxTW7dZVIVgfIF9ZF1FD5tT90bSLIfxNrgxv27++7aLasuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8v3tl+9kpgG88CDZ3LlHDDVu3+mvZkT/wB+uI61EvJ4=;
	b=sMTcdLtjgshvWXyCcDrzHlHCgzuKOO1Wd/TLDFmGHK+ys6wlvD8V3YEp7GqSyslAVib0
	 rKprc2Ha+SdY8PTU+mK0d24r4YQaBgZoxFZnEhYpCfq7cU80KZH/kU/1TJ/YTETS7pqgQ
	 PMVAJsMnel+eFFkyek0LZEIYUSYxamQklkrjJm+5Cn/ogwQVZIOqQ+cJRdJQuZnXncuxz
	 5a5+X461mFEi9velc5J9oc9VzDo8M/BC26Wx7aVPRrg5bn9oDgX7Kmmq9BCmMR2NlhCc6
	 +gdcQiMPxo5GwqqUgOYqet5G2LC2GD/ZuFnHCP2b6KrBu2srxyAzRLDf+J03ZTzL0Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GsE8gHqq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JywnPnAr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2AF606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2AF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GsE8gHqq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JywnPnAr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APCUS2076103
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 10:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8v3tl+9kpgG88CDZ3LlHDDVu3+mvZkT/wB+uI61EvJ4=; b=GsE8gHqqxysxGZtB
	tdcgj0qPuOhiAAoIN/KHBNd05iHD+JLRPz1JZVtf+Ll0MKCK9N4IQ0G+XcLLwXdA
	JBxIQA6S2KIn0ckcqAgQw/OPZGFkV98rvw926JDHvaVmzuZT8riBekspFW1N9MVu
	tD+pB6SH72icvAozmO0BagqGlMzin98HjcMb1hTQfg6prYXQHSe4ivlvVUFrsMMZ
	0EctaHdZy/xsKGrihszKOHfYJSzowkVnRIkC4VDKDBlIFSufyoZSmXG0Ocw4tVjn
	Nh8TTFyPp8yVKk4eDmPs41/dOTHkynSG2Dvozq6hzoDCCwzUETGuML0nz1dIUawi
	7dgFeQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcab6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 10:29:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd65285537aso242577a12.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793960950; x=1794565750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8v3tl+9kpgG88CDZ3LlHDDVu3+mvZkT/wB+uI61EvJ4=;
        b=JywnPnArEkOh1xGSV6un9YxbzDB2kytwqviv/Y6PCwiW0Gca0e/E4QNlwyUeG8KMeq
         WrEsEeDevjDNA7LBOfTgUf5eRzJEArDy0eVv5S7zEEsCcx7KveWqpYWAQI1DghJcx9c2
         XXLFpN9aon3C/DZ6mnF/v9X52j/sW3Fwm783RE1a+I88P2AP5ZeptMi0yDZ2JHQKrJ3i
         cDg+whQQf+1G2PRuMPRL37s0DO2qdZu1HtROQr0l88CsadEOlI58CTREdvZkq8291UeO
         gy6aqctj+1jXWHlgmCVaecOyUSmPgxlhdOlZBWZB6yrQbcSJIEw6i52zBOH7zg9oEdPb
         uyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793960950; x=1794565750;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8v3tl+9kpgG88CDZ3LlHDDVu3+mvZkT/wB+uI61EvJ4=;
        b=yCPec67TqHdzBN959A32srM65tuN8a3FFvWGCZ3JYO0DYCTo/GzqSdOyFZJUzH4dn6
         R3f7YTP8AA1szHkr5Ic1dKdARDObU7NmIpl/MwNz1IGP1rg5VTWVSEL8+QwmgXCByfvs
         QFWPquy+7Ne1mkjO9FcL1yKa9zXLQbHlQaTlCKig/vQoNl9SadN9AfuptIWpvt7ckTin
         yZJ0lE9XDLyl5a83gcPGtK71eh7Cj68B0KgiE4uRcr0fNqeNFAsGNs8GSQFGq7Ov9RSI
         oYPbJSHdshEMhBnJ9Z9LviZhsh/ijdVpsA+lOoBIzbZAmcE3uTnUHuu1za5dqSx6s1Tg
         igZg==
X-Forwarded-Encrypted: i=1; AL+hErHhq9Hez7nN+WjaT28cvPnRkswWnoI3zHcclwMR8vATBRG2VKaaN4MXB/wxmXZrkctEjpeCtucXG5hl@vger.kernel.org
X-Gm-Message-State: APuU4Z89Hi6qGgQgdnp9ovwEhBrdsJQRQnHjqBMhzwX7ClAjzzp6uviL
	EQvzq70cho6v4O1tLbofhUZgw/iVtdRdOHIBNPcHkzGfHYkhJnnyUJK/UphJRGX+BRz+3ustM7N
	Wyr8Ql5M8xnddo7VGDDT57D9+UKwmMtP0VJohli1eHISSB6QiaUOkSbJLyyHC/l8A
X-Gm-Gg: AYBFou174JFeDCCVoIMTtmN28Gf2AefZXhE4HRifG/wPRSroJjwFX61jNYu5gC+RqXk
	rDPcgRLCzbIvRHQ6pmFQ7q93X5zGfBcAwwMqBI7+YzOiSy88NFdosCJuhulRcIrF6L4uutzwkaD
	jK+UkPs3TyUraan4devHw8ZjIhjIqkQ+o5mnb6M/qwJrfgXqZhlL44ksCOSOK6WtklW1IQPWGxG
	r94TlKFl2EudSbplIqoWL0jhGHiFfKQGyC3qhe+UyebA4hNz6D6KeydZuVBA4NkbjVyZdwmx/bU
	cYMxwvmCOGFzW1e1uJwvh/2843YTRaPASh1/cu6j5D4/KJAPnCZDZYd80HRqzjDwkPi19V4RvJj
	tlvoLD/haFgKaJyp8j4X9pabheirFynkQnCeLJWWUBs2LXnfEXhdua6DY1yXZM5Q5Fr3lC+vSdR
	KJ/EwBYWainMtkgzFn+fpbD1zrszRIhL2a7nTSbV5Y3B5hlQ==
X-Received: by 2002:a17:902:ce8d:b0:2df:9057:8bf4 with SMTP id d9443c01a7336-2ed40c7730fmr25500345ad.43.1793960949533;
        Fri, 06 Nov 2026 02:29:09 -0800 (PST)
X-Received: by 2002:a17:902:ce8d:b0:2df:9057:8bf4 with SMTP id d9443c01a7336-2ed40c7730fmr25500135ad.43.1793960949057;
        Fri, 06 Nov 2026 02:29:09 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da1652sm3898885ad.74.2026.11.06.02.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:29:08 -0800 (PST)
Message-ID: <7081fda5-7636-4d64-bb42-545b40957bc5@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 18:29:04 +0800
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
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bOsFqeOeMKQyoLYkc-NwNMwxVZ4enHV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0MSBTYWx0ZWRfX0QT93EegNNcZ
 CTVhu/7/od2HL+h8Ll/2Si6Lq7n4zYHJRyLRFHAtipKxLkdTCSnwjUr6w9kV67ryg5Ue2tzxNKg
 owcchDJKY0itpF3fHK+Yjtq71uDX071OMyz1tY8gwUVLjV/416FaBrb/tlO6JcWVBXCy8uUlWtH
 rygASCdw5uOlA3bWDGVHS0xJB1Bsenghqleb0uDlPfjoQzIajS9yHwvEdgch3Jw2Ot30xdMlczq
 YBwk7NWZuB77FPwfneZYstqfZrw91GQWeqvadcBtbxYXTR4K/mfDzNRADz0TgNC8Of8uWKZUasr
 RCv3U+hkUjiFpfvCh6IhB7ZZV9QVMTeYMQzq1R8L4XP2Yw65uGxollPAg44um6R+y3pE35rFG3W
 ZkunUuudD5DxAYMtArI7Q3Dhevqv/S+jqP8NmzRpgK4AGBsekInsEVSmd8GYQyPF+JDb2aJMjd8
 +KVRGZ9fLN/E02UPDuw==
X-Proofpoint-GUID: bOsFqeOeMKQyoLYkc-NwNMwxVZ4enHV9
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aedabf6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=L-72yP8G5ZwXlaZ1uZYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0MSBTYWx0ZWRfX9xOHYT2+rFQO
 0tKE5tJ5aDfrisWRb0sQVbch2ECb0u02XV6bA1kN6LasKfdap03mxodB0LUlUSivycwQcsAe8UG
 SQgLHcBQTwW/jIgXnsvqmLiJwIG4low=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060041



On 10/23/2026 3:01 PM, Aaradhana Sahu wrote:
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
>   - Patch [1/17] adds DT binding documentation for QCN6432.
>   - Patch [2/17] refactors PCI operations and MSI config structure to
>     support different MSI configurations.
>   - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
>     for QCN6432.
>   - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
>   - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
>     QCN6432.
>   - Patch [9/17] adds support for unified data-region memory allocation.
>   - Patch [10/17] moves MSI config to pcic for better abstraction.
>   - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
>     specific to QCN6432.
>   - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
>   - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
>   - Patch [15/17] derives QMI service instance ID per protection domain.
>   - Patch [16/17] add userpd ID mapping per device.
>   - Patch [17/17] adds support for QCN6432 in the driver.
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
>       dt-bindings: net: wireless: Add QCN6432
>       wifi: ath12k: Refactor PCI operations and MSI config structure
>       wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
>       wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
>       wifi: ath12k: add support for unified data-region memory allocation
>       wifi: ath12k: move MSI config to pci.c
>       wifi: ath12k: Add platform MSI support for CE
>       wifi: ath12k: use CMEM write for PPT on hybrid bus devices
>       wifi: ath12k: Resolve userPD ID per device
>       wifi: ath12k: Add QCN6432 AHB support
> 
> Sowmiya Sree Elavalagan (7):
>       wifi: ath12k: Add hardware parameter for QCN6432
>       wifi: ath12k: Add hardware ring mask for QCN6432
>       wifi: ath12k: add hardware registers for QCN6432
>       wifi: ath12k: Add hif operation support for QCN6432
>       wifi: ath12k: Enable MSI interrupt support for DP interrupt
>       wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
>       wifi: ath12k: Derive QMI service instance ID per protection domain
>  
>  .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++
>  drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
>  drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
>  drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
>  drivers/net/wireless/ath/ath12k/ce.h               |   6 +
>  drivers/net/wireless/ath/ath12k/core.c             |  10 +-
>  drivers/net/wireless/ath/ath12k/core.h             |  24 ++
>  drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
>  drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
>  drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
>  drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
>  drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
>  drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
>  drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
>  drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
>  drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
>  drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
>  drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 143 +++++++
>  drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
>  25 files changed, 1214 insertions(+), 109 deletions(-)
> ---
> base-commit: 2d57db8fbf72b1872e7411e917166bd12ed5bc98
> change-id: 20261015-mpp-bringup-75f457bef8ee
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

