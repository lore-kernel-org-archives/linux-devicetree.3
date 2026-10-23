Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757045;
	b=xDCOAwQXgnMYMmwk5f16btlvQf2K+b8qBvXCbfPbw52+ItCsAW/Vs8sDiVF5hEBxxqcc
	 HZlmxyezSW5yCpZB2pElkeAsoXTcnfmbhZTeIqdowsed6oXOp7OcWOStrOWF/mNg7bp9n
	 ft5AklzOVNnVmmOfF7i0tVIlJx/sG5Q9KgH4k7GWMwjjJ/OJ9NQs7YSj6pS5Olsu4MBiN
	 MOPliJOXpsbzRZkjZNJBWMoDHEfKMJA2bTz90oN2qgqquyfZdodtmBri0l/GcxM2pe9po
	 aOZRQYQUgHkcd30JvIV1KGV2oh6QQmPnPeAQXAhyVl4nesbilG4vn7OLaqMSRTPbpVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
	b=cbSv+XLnRiDu4Yy0/E2IRE9Rk1ZkCUNMRUP3rTHTLN04EwFCp6GHGrHNe0Vxy6Q1PCzI
	 NJVbEx9ypkCASbQQAVvKL0CjA2HQl2fyxBFpc7/fspcZf1xcwvJu9inrdV+zbaUIK4MAE
	 jDvloC5jrGygWozX0pZE26wrsqMELhxO2JKQbpndejaulkwed1YSVUlMZtbEMQHXDwEoZ
	 teno9auGWf3rlde21/mWqr2/nvEqRZQwUkGIOH0hO2omYQTYPhng8cnhuum+8ZQG3sbiN
	 gUEfRvH+KxyzaR9oJYT4POkc4CpjWGr5RaSFFVG2dcaaHVi8oSvOIdUoV1YosXqvtvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5L59kEI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LirIhP9K;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27766606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27766606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5L59kEI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LirIhP9K
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZJA980644
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=; b=h5L59kEIQ/3LwFB7
	bNnjdoQed4rRZlG/2nqyWogTvOgQxtmgAFJWoqOGMfgv9Oy2q0L95WZEbPm8CXF6
	gUMwudisky+BO/d/5ARtn9Jt9QpzA9om1ylWvq+SVUHrVF6AWt4uBQ52XhFiALFp
	wisDT7HfLyTQ3wNQHoDSWClIKU8+Zo0wj5fzPJ3ZAfE/VWmELr38uEAClRXF80So
	nPLbPNxiogVq1qvif5iEw2AcvBST8tZQaj5NK4ojlcFJEmEYtUeQIhu+4PXxnYvM
	k7A2AB2gWgZ0cezr9xp8x/YuKn+hmuwotIrTE79J53YP9qX//rK5SvvHBeCK41m5
	z8Y24A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmau0te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:04:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988bf286521so13498241.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792757043; x=1793361843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
        b=LirIhP9KN2mZ8XOO8zljmzmV5LyuC8xKGqcwFlyoFuo8RqNHzA/7i6v1OAhPnWABzB
         oz30IpCL3+SASPDdwJZHiO4zmd2g869bMhD2fbAFqreEuAyLlf5GhN+O5FlMGFuEJLDK
         VQJXqPIP0z9nDqyKSM7BOesVgYYGE4CF+TaEV8KrLcxyWVTs1z8DLB2x3rolA+IhHu57
         fp8DYci4FObIkDjcl10TXMGWpWzRPdY4+CcHXfGfVYW0kPjh3C0ypAcxO7DT1E/9ejgZ
         fDfWWohL7Nl/gZYsrXOvSbgn5pccJQ1dIS0VAjS8CdwqjCA3te0fWOalgGR94GdzGX+1
         Yo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757043; x=1793361843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
        b=Y2Lx+3HSC/FQxoRT+yhnCfZ4qoeaTAcSulx4OMHaQD/117ET51LQItjvTfCmxlnoj6
         Oxw6XoHNg1uHLhhJx0DywjeEp2L/Qt1fqVtSndnuXrzM92eapTGhuxylx0EqYzp1OjDl
         sjij5qThJ5eArl28C9iN+HlZBSTiea/b0nQmMaI5sm0TKrv7iHyZjaZYPANLk1wdTToT
         hF8r2S1+RdO6PkLQaBpAWzKs6pnurFV+tVVvp9/4BMedP6/sWj7tX1H8IynU3tY2gmUC
         5/J7G+2mPvAnnY7U42d51iH8pduCFT3OeA7+CVbLZjxYqVw3bUIextDxxJcKogXfzdcV
         WL2g==
X-Forwarded-Encrypted: i=1; AKwUvBz/7204WpeYRph+po5rCRbtMBg2tPpfH/P1OlqevuBAez/n561Kvc2CND18G4NQF7KngYt9fIrwtEua@vger.kernel.org
X-Gm-Message-State: AFq9FYK2av/r1NhrAJfLTgo3hXV5hSQqYy5fAaZhm8Sf2lmi7+7+YmTU
	1nXVHFX1NRrJ+OgKn1UUCv24MFfWdjHtmvELNmJ8noOoiX2qdwaJVPE5KIxvT/XjjvKYA3HgeE5
	GzvGPN1lLAtml1pDVrp4KJQ7DG/j1v1RSp2veDAJcgURkxwOeYyWtgOFnqo32dvsL
X-Gm-Gg: AYBFou0gdyTPMCedeeUWF8IFg2B0mgoKlu1MwwwZJ7QVuinERhZY96WXD/5vtpaIA2I
	dVjihXy1H6qOreflKdyFB6T3sGTvkAnFsGmgwVFvGYMR+zf6fAgiPQygOnCJZhtjadUVBpLMrRA
	kwUHyakQkGses4ibDa9hzE6JGjEZsY1bvASgo2RMBmLbjFErsBt96TD6kVyhvD39Q/OpGCu4y+2
	NaB6C4NgCu5V7Mcx6TIzsSxulIgvtpXpOFlAFNDg2XcJhFUM7sw6lVj1du9Ir6w6pzHexFCgv/a
	wzGxpRuaB537FpxgbzQMl70+DXz73mUL6LoQgrtVXe6Rt1gNgPq75OW7Skda/KHdyFrCKTxvtHp
	To066nS4BsBdL9gwKVDMATQ==
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr718393137.0.1792757043104;
        Fri, 23 Oct 2026 05:04:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr718339137.0.1792757042539;
        Fri, 23 Oct 2026 05:04:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432c96badsm977598a12.14.2026.10.23.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:04:01 -0700 (PDT)
Message-ID: <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:03:57 +0200
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
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Yin Li <yin.li@oss.qualcomm.com>, Ben Horgan <ben.horgan@arm.com>,
        Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
 <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb4d34 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=u5pNeYj4kXT91oPWfH4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX2ZE44uT/MhTv
 mnGWFB6sXtqYwk56L3vSoF5rhDkJ+rdcuW4KIG5k6jSOOzW1Ovkj4OM6g4LjpP9nNbfwBb3/em4
 2Em/YURlZac0kWadjoCAZy4mV9D5oJY=
X-Proofpoint-GUID: dExkZsSryXT2fCnob-1Hx2k8Pbz83Dw4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX2RHRoS4nbcjP
 uOc4HutcSmbecIjDkxNNCJ6W9pWu5MnQgpuVn0b+2wKGgfO1AVtlccHyax2HxIR7LfnX0Wyic/W
 dyBzHhf+T8ySUtr+40nFLf6DHp1W+rRVMIgtOkV8/1BZL+GxJ/PT3t6MzqdGFb89gt+cuOSgRD/
 OOlE5E+DLJ0vhvg+uM1B5S0Xggtrjk7HtUUWmZq4O6/VfTmY+jv63R1B/ZGyS+PiaUMGxGqLyWv
 qFBgSU8UePBuVG61BviJFXgEfJR/ots7kjmGejzTNRrwW1SUw6O4672JBHYFuCHZh+6FPqixNr0
 xtnhxUTXlqRdKfk9VZdUZ52KBs2YQ2x6G2uI7/gcBAZp8UqSt/wh+Hz2oaVsbjqi1Pe6gnVcVhb
 ESld5uR4PoicF7aMwXnJZn4APEEQ1ETzgyyh2YQEVOyGEqJKGzOHmhV9l+cMeDs18cSq5B7Cv5R
 6sV+KtFQAu4QrKp/Xlg==
X-Proofpoint-ORIG-GUID: dExkZsSryXT2fCnob-1Hx2k8Pbz83Dw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

On 10/14/26 9:09 AM, Yin Li wrote:
> 
> 
> On 10/13/2026 6:37 PM, Ben Horgan wrote:
>> Hi Yin,

[...]

> Hi Ben, Konrad,
> 
> The original 0x10000 reflects the per-MSC register block size as
> allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
> use "how much register space is allocated for this block" rather than
> "what the last used register ends" to avoid holes.
> 
> We'd like to update it to 0x321c to give other platform authors a more useful reference, without exposing KNP-internal details such as address holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, and — as you noted — the registers from 0x3000 onward are domain-specific; since we have no domains, those aren't used either. So the actual footprint we need is smaller than 0x321c, but showing the full 0x321c gives other authors a complete picture of the allocated register space.
> 
> That said, this patch is marked DNM and is intended as a local
> verification example only, not for merging.

If you don't intend it to get merged, you can even put 0x12345
in there. But for future submissions that will have the intent to
be merged, please stick to the 0x10000 size

Konrad
