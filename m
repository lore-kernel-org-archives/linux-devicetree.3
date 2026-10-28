Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188962;
	b=S27fuztjA9ApMOS6lr7qy4UzQy2AKq58dknobFLk9x1+IydlFHVKFnuZmopy/ecR91Kp
	 wirtU/ErfeBPD6sTmkCSYYw2sHYT9PQQ+jM1hbMYrOPxSx8h9/hTEgy1XNdqiK4yjD8jZ
	 AZKhYw6BmgUfkNQxFtSaZ1vS636I97KRCuayVP4YSWOZBsnwNnIwHE5Db2E7oPrBoL1J7
	 iU617Cb4SKV5anBlTRgRaqPbetTGu9M0OJLxVjwlDusJoA6f19eAnB+xZFKWQbcpKGwc7
	 v7PY2aqBwy3WT5dqjabEDS9h/cXkmjvaRjJaG9wgGuq+BtOklHtDq8XY5kdMXyWeB5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
	b=KANxN/jfPUt6bamDn4+gD1Ichs1oL22Gktwanz6IJKA85ONh2cKNI3YuiSFHY1A9L+3Z
	 5CedX7OV4PeBy3AZU+Y4Nov0n9yTov5AbOEnE7kdp6KBDFzitxyFBcuh0+HVpPOfPFxs/
	 jgzZg4gHb/BLB13GKsiex/0yTwlg+qBTSNnVLRpBLeJA1p7WnzzeCIS/IM0NzCL3ClTYT
	 zBuukLg+5oWdJbbWvdhgE1sIO4OFMoAmICDD+jp1umyhPs0C9MmuAIbNAFvQbU+O94s3N
	 86QjEU9A/auyPdnCxwQH/44Ru1+AzQC0gJ7SZRCYHG1Vl9I5Ku33ldVisnstBPCv7og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtHnINnJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gNgwrDPV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2B5606A322
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2B5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtHnINnJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gNgwrDPV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe5Qt2105969
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=; b=mtHnINnJIejV7VQr
	7XTk20uGRV2y/3Te1QAhRDX2iZ5DlHcXVE1IPb/I5sk80IV03hjICUm0v+XdboOL
	b0+QbELzt0N1/AWIqSBWtUzaEi29PIkXKRsdiua9fHWiIZNZ9kvp/tddr33rdd9Q
	1jaZENQnCG2vsEFsy9F4G/MXv/wjKUgziSuDPbNzaZ+XEADcwV4ZvNdRohVzdHDz
	wPlBvpPQgtNpSTOF0y+QyE1CWRWIHdKD90E3tTmdck7jvapy8s2Svh+r2LGTxVhO
	TuhUegkuK5agRkpK7wKAmQTCfBxZcsC4qyupOf4Etfhq34joM52wkBcYcNwl3WRi
	D1IdtQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pudqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:02:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so585946a12.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188959; x=1793793759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
        b=gNgwrDPVmw3EOOcmt0a0VCRussjhGWGFjzhtGYG1j1MQIJJSQwoELeNtVYxp9PkiQK
         mIjyI7sp2PfkBUG0qavfBqxh/2vPjYmtw4agzepVpA8A81YZk0dpnFxdwdKTgxGPMuZW
         RWt5Xbqa8aN9Sr1DP03s3yT8aYcP1VubD9WOinbfv2n29jtuHuleL9H7EHKFJvjhAbvz
         bJwjspbfr9ui8Wk+Io0LZg5H19+0Xrana4lIhtBjFFhoV23wzyC2fZdy1JWQWfjbquke
         VowSvM8zfxwAJO+OHy8CV9aR7l28QxRCyG/HBIl5XAfHgAxYJoTz0Hr+Zz15rxFrlT5D
         TI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188959; x=1793793759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
        b=YqAabK6nFQtS6qKmuvI7/OdfZ2wM3LkyErv5fE9CqRmGeL6O+wDTDK/fSXYNp+7Ynw
         sZBQpObqR00aN2vBQmf+V2b458R4ZQNm/8tJqK/xO35e+kibKct/yCCRvfaH+rmcZ89G
         6qGW0T+5P0dcyDF5oSFKXwi9MJZgrGB7IBg/8msY6Ui2Tars5Km9GWNaF+XoR/RNt3HV
         QdV3XeMqWFmhVGOVJCcnE+IXacmaR0G0X3AKdwRdUGOoUMLaa0k3pBdDNfKHZzyvX/0c
         bO+eC1AS20IB1o5KAGqcxBz8VyzxZCtecTD6DTfoMCVRL+Qo4dsOMWqMgRpzSxxLE8Gb
         Uksw==
X-Forwarded-Encrypted: i=1; AKwUvBx6bq0VCNUKnscEfAI1BRN/NGyjgwOpirnLS8W0omXmP8TnPH67/DTljmGHH8RpozHKyfSN6zpWg9EL@vger.kernel.org
X-Gm-Message-State: AFq9FYJcHmufZO3/moxB7vaRS0WzHnAin/0yFkhwnzNQPH/0LYdvKqR8
	ZYFbiLtvBWD1qm/gGM3vCJLv+oe0Sd/Cw+LchVf7nIUbQedfDUmbf776MZLDQ+vAkJubsoXZJK/
	AY+1abYlxbwvFZ2jsi9xsaCGcJbRTangt7nWCeUjIF4dzXXVNVSeGm9LBXz3Z4ZzP
X-Gm-Gg: AYBFou0WmKQg88LmYPfUDHtXt36hfKlXnL42xLJFpNMYNHFM/htjstoYdsjdq+xXbVz
	TdLtdzqbjToUMSNaKwh82Q6WcH37G+Qste+dhgZ2hIC+FxwbHk0hiHx58qWM3yaPRewikDDvSXf
	qr4NJ6n0PZBORfGMqkbTUNw2jaT7E2ewf4p/bAjytFMiZJiboBTqvr614p/YR9gbOQShwwk7O/w
	Q49hg4F2k4O3KWiO9zVmKJQlJo/BerLuhK72zsUK0SFUwjc6TG65HaGuDgqZX2azcyaHJk7irbx
	coVto4+NA3w1tsYyJDc67+AJ6yDaSPdDUxxZ2s1frGTkUX0g7BDYtqTkMYa/dDlsMBPiEK6VfC+
	oDC/bTK9RPQvmNzmJ2PREyRBjC3G3SBB5tjJvjqJh378PFitXVTnd0LfT8joDlmaMVh2/Up/XRk
	ytxb9c6rUM2FwIm9IXeLj39bWxVxIaGPf9hUKa
X-Received: by 2002:a17:902:fdac:b0:2e9:5714:6072 with SMTP id d9443c01a7336-2eb003ecf3bmr21396845ad.44.1793188959512;
        Wed, 28 Oct 2026 05:02:39 -0700 (PDT)
X-Received: by 2002:a17:902:fdac:b0:2e9:5714:6072 with SMTP id d9443c01a7336-2eb003ecf3bmr21396155ad.44.1793188958907;
        Wed, 28 Oct 2026 05:02:38 -0700 (PDT)
Received: from [10.133.33.208] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae64564b5sm21513925ad.5.2026.10.28.05.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:02:38 -0700 (PDT)
Message-ID: <6c74dab3-f00d-4567-b9c8-c8164867e8b0@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 20:02:29 +0800
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
To: Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
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
 <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
 <20261026122300.GA3598537-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261026122300.GA3598537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZTUjhWemCotv1h82R4OqQuVZ_P3wi_xC
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1e460 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JqYqai5FAWh4DW1MJkEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX5rm+9dumzWki
 UZxPzp/BSNVDzBlDtKxxcpsG7w+SHDE0xucw62Re9f7EBRZzkk6sj9Esr+KHO0u0PqLcvQHnT+j
 fQKWnUQfe7zY2JFK4y8+nzL5JcR1N6Tvyc0Uwrky01Sg2nRs4SJZPeGHo4ubnRzKyWyMdnYTClz
 Zl+OijCXxpfB+Fxyi73MbqVIvynjRhZKiKi0c9q6Ic9OXF27Fmix20VoGlHdpHMKi/GWQdH1F0m
 I6Rcoiy+XtygZhXsVL9ccJ90d6uLIbneLB1Iz1tC0apQj3INyAc+LmVrMI7S8macVS3y29wfd0p
 7zSCO31I3oWgOMosZyvJfyzCVexNryTv+3orxhFEI7YB0ctdbcOxp5LctQmPrtwixq8WpefFaXA
 cU4OO4dGa35gXQOFks5vwdpNWr6Xy5o3exl398Trf9DurOLtyjO/GukT8EQ0pHDfy3vssQWY+lv
 /8gzbWAuUQJlCr86waw==
X-Proofpoint-GUID: ZTUjhWemCotv1h82R4OqQuVZ_P3wi_xC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX6jmE1SVGUO63
 QQ674aWrmIAdSAMdjTfvgQdhg3/7p6N6iutsIFgvyLNcV7LugjnBRyRKIKd/tQuN7FyAS5i0Tf1
 ivX3VRnShPiJtGUw+reOHLmvmvWnPXc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280047



On 10/26/2026 8:23 PM, Rob Herring wrote:
> On Fri, Oct 23, 2026 at 02:03:57PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 9:09 AM, Yin Li wrote:
>>>
>>>
>>> On 10/13/2026 6:37 PM, Ben Horgan wrote:
>>>> Hi Yin,
>>
>> [...]
>>
>>> Hi Ben, Konrad,
>>>
>>> The original 0x10000 reflects the per-MSC register block size as
>>> allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
>>> use "how much register space is allocated for this block" rather than
>>> "what the last used register ends" to avoid holes.
>>>
>>> We'd like to update it to 0x321c to give other platform authors a more useful reference, without exposing KNP-internal details such as address holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, and — as you noted — the registers from 0x3000 onward are domain-specific; since we have no domains, those aren't used either. So the actual footprint we need is smaller than 0x321c, but showing the full 0x321c gives other authors a complete picture of the allocated register space.
>>>
>>> That said, this patch is marked DNM and is intended as a local
>>> verification example only, not for merging.
>>
>> If you don't intend it to get merged, you can even put 0x12345
>> in there. But for future submissions that will have the intent to
>> be merged, please stick to the 0x10000 size
> 
> Why? That just wastes virtual memory space. I know it is "infinite" on
> 64-bit and *only* 96 bytes of PTEs, but still.
> 

Hi Rob, Konrad,

In v4 we settled on 0x2000 for the Kaanapali DTS. This reflects the
actual register footprint: the platform does not implement
MPAMCFG_MBW_PBM, so per the MPAM specification the feature page is
permitted to end at 0x1FFF. The remaining space up to 0x10000 is
reserved for this MSC on the Kaanapali hardware. Compared to 0x10000
(the full block size as allocated in the KNP hardware), 0x2000 avoids
mapping unused space as Rob noted. Compared to 0x321c (the full MPAM
feature page per the spec), 0x2000 more accurately reflects the
platform's actual implementation, while still being grounded in the
specification rather than an arbitrary value.

We have now posted v4, which also reduces the binding and driver to the
minimal set actually used on the platform: aside from Kaanapali, there
are no other concrete platform users, so memory controller MSC support,
RIS child node support, and related properties (arm,mpam-device, cpus,
interrupt-names) have all been dropped.

https://lore.kernel.org/all/20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com/

Thanks,
Yin

> Rob
> 

-- 
Thx and BRs,
Yin

