Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688ED43A806
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771314; cv=none; b=Pl43yY5L61uR8HrzzyyX86kOo8l1GkbHa0HDtwruoiyFU8QLqWKBExufkwAg2IqMV79f9bzVvFKFaBiOC7tn6R5Je3BtIE/dhl8SKuc1JXmYdM6US00WzH8uUKVvT3Z3pWRvPmIJCTIeB/avmhX6r7Ew/pC3AUj7XUWg+EonHsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771314; c=relaxed/simple;
	bh=T5URmT5QPTsKHgEHA05PozZ/SXOAu/fwq+audSuKHJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4X4r9prdr6llQ+S1pdog8tgtC4E0Pp4TqOxpBLsb9ZOjJXD7JaZ8PkaFoNWx3Z5mPeU3eGcklkbVlN5ePGoXRWgVXR52+KWhQC7vz8AIKKVA6uFOcFAF/EDnkNQfncUY1mjzweIQo14MRWvf6z+5ewB8n1t0DS4+GHjPgWkXHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA3Vq7jP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1XBe/B0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA3Vq7jP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1XBe/B0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777PJj3352565
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vQaqWkOzHK1y/jY2QvLFmUUxM5MtiKlDNy1JW6tYA2M=; b=IA3Vq7jP7e+LAfsO
	jTObwTxWuKyOsnWCX/DIg5K/uXGsseZWYNX0g+9dbx/97FffQMgVuwKH+Po3ksRk
	NlNvYYz06Reruruukoo66nPnW8S3OndqGE3+vDRGJcJtxmcI1BShFZJG6HqNw3UG
	XEfIWedLdqmjoyRaKjDsWr6x4RDi34kyRJhEqeTjbedC7IM/fK3cgerR7vHqIkAb
	wnqWxjRAIDb54ADLjVafc0OS47U3ErJkK8XXViKWwAc1xNzqUXn1uA4fBSVxA9ZT
	Pi+yGDpuCFARz4koQhm8RBZKKiz/yC8IckAmS09GChXsuHa9P13JwWdktq1Wl+Pw
	zvkiyw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gx32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:55:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fbd0f0367so3716191cf.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771312; x=1789376112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQaqWkOzHK1y/jY2QvLFmUUxM5MtiKlDNy1JW6tYA2M=;
        b=V1XBe/B0+0DdM935H9F+bPyDKaw7iPBVRXoRsVYcjV/+WoMjSbbMQ8eE8sZPjEYZvt
         bLhO+BSsD+YsTwO55sOA1EAtUJDfrHdHkKfLOYID1jeIAv77hCiAFXDTEmPsnQCU8F7F
         r5M4ijwNyUHKRqyDG4JxG8tSjQnvr4rP63LkZgiijotEFGJYcjZoEGWq/0+v7m1hat5m
         Nxin1fwe+e5BxxStDw8W6pomGNfU5Qie6euDiBq+3F0VmksGzsqZb37J/ID9vgNvdm03
         FTqj10zTHdg1q7bzrcoWNGJDlKBmEkUT9GdJnkqNtzjp9NH+hCFu6y/ybTdhQdQ3cZqa
         0sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771312; x=1789376112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQaqWkOzHK1y/jY2QvLFmUUxM5MtiKlDNy1JW6tYA2M=;
        b=TMUIYxyhteth0/t1GKYrpsO5pCq83Zv7PH3MEGlkGetwLeDxa51lyZ5Prjba+AR+/0
         qc4ySBMVFhFFM/jmbR8rbIa7PO0Q+n0eFFgcYQLobfPIS+8dwoxUc413uv05B+pkmYnV
         wMfJvlggcDLWrKJXz1fLB2Fb9oO4TKPo39Tu1T3WLB31NOsQ4Fg3GBS01GbKGi+3OxFY
         CxM6u7fmY8Uh5KNKfqJWV2N0SxYxR46CK2J2FNDxzvOfd76jiKWNen7wvw6iBtp9jmyi
         RNSclQJRA0bOW6jP1m1Wp+GOoWqfH8k7Zv4Lz3EgM0n9XmP+FKjgq6HsqZuvggRXZ7WE
         x/bA==
X-Forwarded-Encrypted: i=1; AKwUvBwLdmMym2rPVwNGZhtKcuyzWoKioade0eOEpe+oUOhqsDZzU3iNoABnETmtAeL0yulWIugVW9dl3XU9@vger.kernel.org
X-Gm-Message-State: AFuF++kBJuFmrV+vpTXuEFv7utffp70hYza7UEJfz6YQSEPvTRJtqhVQ
	pfHZcMXITOojdPFQ+xHJzKeUwJH/4fRdI1NPJki5v5Ps8M12aHcb35o3V+P8NaB6O/zhjWI3vLi
	Gidjlvw8208DLYuZheINAMknWCRaxC7i+kAcjU3YvBXxeF5PHnwWjNFW1xAiPILoC
X-Gm-Gg: AYBFou2RUVk0kq0GNM/QoSRGoObq7R7gQAq2O9szimhaIAfIOZCS89s8e+Sx9p6il49
	Ql7F7Thl44EhuXymoarWsnByJcqI14oPCFzbTQV0w6xXTXvU0ryGP0DYiMzUNPx0NdIXPXMqd57
	l319vt+AsSGn6yGALb8Dy0mLbpZAuxCNp88KCpznFJ0gjsEXPaMAEz8EO81NC8ek2D8v1YWqQ97
	N8zt5r9vnWm+no0X68CNXm7fRJJY6/WYZ+8gbywb9xV2zBJ1+4xfSPv0c/rxVVoviBRYAtFZLUY
	98ZJB7br02WW7hGyUiFNvvVdkY6ofuEwxaxRHianG/fRvFTmLuYw87V1bo+qLYVxvKqdfZQhvVy
	GIncyppE0XZOL2tAmTUnGGA==
X-Received: by 2002:ac8:7c46:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-530646007demr130253261cf.1.1788771311659;
        Mon, 07 Sep 2026 01:55:11 -0700 (PDT)
X-Received: by 2002:ac8:7c46:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-530646007demr130252791cf.1.1788771311100;
        Mon, 07 Sep 2026 01:55:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6bee8e8sm4381581a12.23.2026.09.07.01.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:55:10 -0700 (PDT)
Message-ID: <6f14d260-b8c2-438f-957c-8a169e19bce7@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:55:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: ideacentre-mini: Fix the second M.2
 3V3 rail
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-5-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-5-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e7bf0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gxl3bz0cAAAA:8 a=SWV_-4jX4OqQSRabqnkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: wmnh6UY_aTvbqHCo4m4UOFcbguQlUz5L
X-Proofpoint-ORIG-GUID: wmnh6UY_aTvbqHCo4m4UOFcbguQlUz5L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX799yBxM+niMC
 asmVu1K+mBFogDMT+Nv2403qfmNXP3eFO61RRJgQxd8Mm6SXfoRpipupHJLlVkAqeMRCslQ0B9C
 YG775vJmDsKq2AmVIsjs4qgOlxRDFp0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfXxFCSvMG09K1K
 hJifJiMJc2TkCU+j4Qn0qqdGg7YTnf25oWK/uiX8vGF12fxJ/RtwE2svz7kFopHgYhnMBRtPfbR
 Q6mDIayuWBn8aguYUMtRtXbt+fRx99i3QvzCA/BikKWVLbsS/EkNQMfFo5lU+/4IC7zc5Z1pQP9
 sC4wNS4oVxo9D0Syc+aBAQpIcJ4kVvR87gBTlboy7ygEDzPsI4YKYZS2SrgVE961KcS1x5a409g
 xEu1FMjeFIiRyny4bAujnocDsXM2DIqZi0WTIKp69hYcMN9ohLKJ3WUxrJkfD+jX61O/oKA3Q/1
 LZO8xlN/3Gd+d30ARilvgElexfScWjYhFmeRLPZOfrXzW1yaMudZaBVtg56Appffu9JwUbtQm7Y
 y5IdNIUteK0GmekOahHo1jv19pFhzAzfj9yNa9HzPV81Ku7a5ktLhTjXAb8Iw6JLc1Kbx3ROrRC
 HzjwxfhUJll/O3ooc7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070096

On 9/5/26 11:29 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> TLMM18 only enables M.2-1 on pcie6a. The second slot (pcie3) is gated
> by PMC8380_3 GPIO5; both regulators previously pointed at the same
> TLMM pin, so the DT had no effect on that rail.
> 
> Switch vreg_nvme2_3p3 to the PMIC GPIO, add its pinctrl state, and
> keep a 2 s startup delay plus always-on.Without the delay the pcie3
> slot fails to probe;

This is really strange..

> always-on is a stand-in until an M.2 power
> sequencer exists. Both slots work on Purwa with NVMe SSDs.

I suppose we have the "pcie-m2-m-connector" compatible, but it's
not bound by default

> 
> Tested-on: IdeaCentre Mini 01Q8X10, Purwa (X1-26-100)

This is not a standard tag, which checkpatch should warn about

Konrad
