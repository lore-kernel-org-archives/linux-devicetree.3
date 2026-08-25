Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752823E1204
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646480; cv=none; b=fNfFZYrPQEsPeDEOtE9olY84V43Mm3mBLedhOC7DKbE8kwBbJqxiFm1s6ZGrWsvq59eQwcgrsiKceRijEZYhkC+cuOpfF2yanasxYOlI4q85bH8YgPcfv6a2MtmyAd1MvmWjb+kv7CWNsFeATvfgfPFqNusi3jpVIWyV9WymmQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646480; c=relaxed/simple;
	bh=phVtok+ObHFJ1au6qUh5rNrwq/TE1QKw2vCdkhVllwA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ggk1NQT1trCbpXerKK448lHP4SeavH/PcfvrGHWmR5ewBfrcbEdmwBB54JWusKbaZARCFOKk5KqApUCI2WOF+i5z0e+EEypMFnb/bLHLZPd86FQWfbbiWotVpCU5HcLeCuudjT/MpgpJD2j5dP8b8Btqv+edvf4uLaJeJlf19Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjjH7AWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bcWb0l8L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjjH7AWH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcWb0l8L"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88EPA1934833
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+q7F1y6fnZGUuGCnDxg2E2aPK2KeY9/J3jStlZtmz0=; b=RjjH7AWHHkMXBUQv
	1QpW7MoQLRT/Dabjx07OlOC2LEg9SCUSdvUweL4CjQhSq7c2sKkbLbaq1l+TehZQ
	tzCge/ERGQdQptiorMXQZm5JVuAt46JPBtu8y4U7f1loDG4tVleZ7WhJt/wFjJSj
	ordiMj8Xu6dAA9BobfF3fPO+G2T0PFeGYOm2fPhk+u1hSztWbNbkgZ+tGzPDAM/s
	JMNrzIZlOxJaWsyeUUrS+DzR2jULSMZDx1FAtSy6A/RvqiE8Fch+rLDGSqExi/Gf
	KCeuUR/ws8Yopy8OtKiqUGC1uW5puSMO5Udjnq3Unl2kBjIJAVShCEKysKwNSgrV
	04U1hA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqs5vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:27:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so9825130a91.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 01:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787646477; x=1788251277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+q7F1y6fnZGUuGCnDxg2E2aPK2KeY9/J3jStlZtmz0=;
        b=bcWb0l8LHSpdbz0VDjfZh/hG1eiNFOrqKCfcekwJYa9ySEy+QTq6f009bCwRpE3+UB
         jQtYLuwHXHeYXm6qHTFYoqSFz+pv21j6Wu1BZ1kjzxtJX6wdUqsL+lEFIHE2ZYw0QRtx
         qd1y4H/ldOfLuxA5R066Q1X3iIVn6KveE31cENBISBGlMUMYh2GHIfl8aNMLd7AHCVHb
         BSKtddDouFJ+BxBe5xhK0zkngiD1arz/YxfU7bU9/+qRKTQtFkjPRvSU/6C7swpFcndW
         4yCvwkBApIy90wJPKu593hM62ASzjSZr3MIXlyMSbrrrN2sJI38PLziOZLtaa9hnwK1n
         MVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646477; x=1788251277;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+q7F1y6fnZGUuGCnDxg2E2aPK2KeY9/J3jStlZtmz0=;
        b=r6ImUWCwBq8cGWG3l/FlHmp8RHiw1gwPWf7xTZUUmGnUdrc1zMMz2VxmqHtpr67aQU
         /vdfQ5vnzkkoOMuVC+jEM0fRdglLlA9+17D6eR6hrKykNB1D2dxIjF1xSBsDNh0ZWeaU
         qz4slgU8p+mBMFwdJ+n1X579y4VlajHipbf/2uno7rPYtcxhF0BTgr0i7cvXCCswp98C
         URbK/tMExC9pgRM6QbVSv8/zeEw5KapZnU/cpb8G87B4VvZQy4YsAQmE5MacFKseqecT
         VtJA+zWss/wvhrK6xvzD4MYsPKxqfusL4LiXVRY5b8QNvlhv8XnZafgipaQk/BxrESlV
         EPnw==
X-Forwarded-Encrypted: i=1; AHgh+RoL6axekS62S3PUEdgMsjl1c4FIUDsLabdMdYrtlH60HQ6Mny/8N7/4ly1t/R+LPlfUokiYDHPX2L4d@vger.kernel.org
X-Gm-Message-State: AFuF++njCE0/jglrkUIaJ4e2M0oXhecaTZHkPJL1zre1Tlf+4shylGBV
	JJzmXjEbstKOIMxdsbzae13jZE7pyjjSi/o9GQg4SsBavTnWBBP9xmurWgavujO241P+pykZ0Z7
	Ocg7puTUEZ6FZlIa9Hq9+dmEkCvqk+vuK6uXal37JSBZlwWN0r4OQS3Waj784o1Bq
X-Gm-Gg: AR+sD10Bpw8NMzWHmjYtgIi+aYzkaPkGFxE1WFPUZftP79pvpy6cFjbNfQoHGFjPh+B
	Buauh7Wy4LPxN2/1kl8TbrBTGnPM3PoRtqhiqlNLukwbORTAuQMPUYNAHrnOtkZGe8vk+pVTl8G
	nJatA/V0PCCumKrbojcaSwAbdpSP/Et4oY0f6JFHbz8rqFe63NlspOk9owc7UtINDWAWRk3xOu9
	f6ul2EnFlGYqKX1ZOV0XqHQQmrVcPWrLE7k0EYMQ9kHqZyeejsFJSeJ0D1/NlfkYQu65p9ygXJ/
	OhbwR3U9j+gliX1ZEVG63pFue57kPtx+7GRspzfa1r3pS5tgbl7Br7TC5YOHVA2L0d/G3B2LYwG
	vpzsjun/aWpipoZ631vJjBBK6xTL2fsME84x2+4CkpdZxr3zue58tAGzk1bkoTj8=
X-Received: by 2002:a17:903:230b:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d670c27184mr417203775ad.8.1787646476952;
        Tue, 25 Aug 2026 01:27:56 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d670c27184mr417203025ad.8.1787646476449;
        Tue, 25 Aug 2026 01:27:56 -0700 (PDT)
Received: from [10.133.33.92] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761bdesm25924885ad.1.2026.08.25.01.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:27:56 -0700 (PDT)
Message-ID: <e1223b8f-9a1e-4093-9dc0-299c674aec49@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 16:27:45 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/15] arm-mpam: Add basic device tree support for
 resctrl
From: Yin Li <yin.li@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t0omyfKeoTPZDZTK8JWeafWnNfw8UaER
X-Proofpoint-ORIG-GUID: t0omyfKeoTPZDZTK8JWeafWnNfw8UaER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MSBTYWx0ZWRfX5QcQQTFJiM1v
 h88Olz/qj7jkhEWAC/PO4OoAZ4pNN/qnEeKyUtPv0aKanQVe6AO/8tdPqchQxoP+qg6mTNu0lRf
 pRoKU8uJZHWsV+Z4/x3FHt9gQ/ZrE77dOZ3XxUv0Py///4IUAWxzSOTg+6dyZLaqUmO6J6ujDRi
 uH1etu+1hYDwGQQqTeDML2XzP35oIiH/aEDXTaW4xuS929glmLo4URMkfiRcozpV9F9VjMkmxQM
 t97RlQVC+yT1qsZcSU+MmUF1RLhqfwAbJ5cOW1S0CiFnpWbcGKm47PO04ndSK0D8qR2L4+NPp4X
 PhPLZevZEN5GUpoht03cwqaD4Yqh/EA8J5fRICv0kJx9gd7DMwm4BVIdJqf7KEDJsxQwXfoiD8O
 Hnh235imxwfFYOSf61CDO6Y9LAC6CBnygQoJJr7WB+mL1nc7aJ6E22DqPeHIkQpJ68H6XXIRI6s
 XXGSfzdMYHrBZMMtWoQ==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d520d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=VIS1g5ZynMs3Vg3ehMYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MSBTYWx0ZWRfX0SCoJMlLvUd2
 gnDxV7dNhCheJySlYpqdhGTmvEc6CcAlKWeXb9TIZHsosz41fFxgTqHrW30QDEavP2IJPtlkMpX
 cdNAMxF1TCy9rtCsY64wPzE+uTz+15U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250071



On 8/11/2026 9:30 PM, Yin Li wrote:
> Notes for James, Shanker and Rob
> --------------------------------
> This series builds directly on your not-yet-upstream MPAM snapshot
> patches from the mpam/snapshot+extras/v6.18-rc1 branch. Two things I'd
> like your guidance on:
> 
> 1. Do you mind us picking these up and continuing to extend them? We have
>     kept the original authorship and Signed-off-by intact and documented
>     the inherited-vs-new split below. If you would prefer a different
>     attribution arrangement, or have your own plans to upstream MPAM DT
>     support, please let us know so we can avoid duplicating effort.
> 
> 2. The fixes to the inherited patches are kept as small, self-contained
>     patches on top, purely to make review easier. Since fixes to
>     not-yet-upstream patches would normally be squashed into the original
>     commit by its author, please point out which of these you would like
>     folded back, and we will reorganize accordingly.
> 
> Rob kindly provided some early off-list feedback on an earlier draft,
> which this series has tried to address.
> 
> Add Arm MPAM resctrl basic device tree support.
> 
> Arm Memory System Resource Partitioning and Monitoring (MPAM) with
> resctrl requires device tree (DT) support as a prerequisite before any
> higher-level functionality can be enabled. This series provides the
> foundational DT binding and parsing support for MPAM, laying the
> groundwork for subsequent features such as MPAM Firmware-backed
> (MPAM-FB) partitioning.
> 

Hi all,

Just a friendly ping on this RFC series.

In particular, I'd appreciate any guidance on whether this is a
reasonable direction for upstream DT support of MPAM/resctrl, before
spending more effort preparing the next revision.

Any high-level feedback would be very helpful.

Thanks for your time.



> The patches are based on earlier work by James Morse, Shanker
> Donthineni and Rob Herring, with fixes and additions on top:
> 
> Inherited (authorship preserved, with fixes noted in each patch):
> - dt-bindings: MPAM MSC binding [1]
> - cacheinfo: expose cache-id generation from a device_node [2]
> - arm_mpam: device tree support for MSC probing [3]
> - arm_mpam: memory controller MSC support on DT platforms [4]
> 
> New on top:
> - standalone fixes extracted from the inherited patches (device_node
>    refcount, cache-id sentinel/type, RIS index range checks, MSC window
>    size, accessibility return type, foundling MSC creation, cache-id
>    error path)
> - dt-bindings: schema and example fixes
> - arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace
> 
> DT affinity model
> -----------------
> An MSC node is nested under the device it partitions or monitors. For a
> cache MSC this is the cache node, so the MSC's CPU affinity is derived
> from its parent cache; for a memory-controller MSC the parent is the
> memory device, which is accessible from all CPUs. A per-RIS fallback is
> also provided: when an MSC sits under a generic container with no
> affinity-bearing parent, affinity is resolved from an explicit 'cpus'
> phandle or an 'arm,mpam-device' phandle on each RIS node.
> 
> The Kaanapali DTS patch is for local enabling and verification only and
> cannot be upstreamed: the platform is already upstream with a public
> device tree, and production firmware does not allow the OS to write the
> MSC registers, so this path only works on a local test setup. The MSC
> nodes are disabled by default, serving as a reference example for other
> platform DT authors.
> 
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
> To: James Morse <james.morse@arm.com>
> To: Rob Herring <robh@kernel.org>
> To: Shanker Donthineni <sdonthineni@nvidia.com>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Ben Horgan <ben.horgan@arm.com>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> To: "Rafael J. Wysocki" <rafael@kernel.org>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Reinette Chatre <reinette.chatre@intel.com>
> To: Fenghua Yu <fenghuay@nvidia.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> Cc: trilok.soni@oss.qualcomm.com
> Cc: aiqun.yu@oss.qualcomm.com
> Cc: ganapatrao.kulkarni@oss.qualcomm.com
> Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: driver-core@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Cc: trilok.soni@oss.qualcomm.com
> Cc: aiqun.yu@oss.qualcomm.com
> Cc: ganapatrao.kulkarni@oss.qualcomm.com
> Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> 
> ---
> James Morse (2):
>        cacheinfo: Expose the code to generate a cache-id from a device_node
>        arm_mpam: Add device tree support for MSC probing
> 
> Rob Herring (1):
>        dt-bindings: arm: Add MPAM MSC binding
> 
> Shanker Donthineni (1):
>        arm_mpam: Add support for memory controller MSC on DT platforms
> 
> Yin Li (11):
>        arm_mpam: Fix device_node refcount in DT resource parsing
>        arm_mpam: Fix cache ID sentinel from ~0UL to U32_MAX to match u32 return type
>        arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
>        arm_mpam: Fix ris_idx type to prevent range check bypass on truncation
>        arm_mpam: Fix MSC MMIO window size to use resource_size() instead of end - start
>        arm_mpam: Fix update_msc_accessibility() return type to void
>        arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices
>        arm_mpam: Fix get_cpumask_from_cache() to clear mask on error
>        dt-bindings: arm: Fix MPAM MSC binding schema and examples
>        arm_mpam: Support MSC accessibility derivation from RIS nodes
>        [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches
> 
>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
>   drivers/base/cacheinfo.c                           |  19 +-
>   drivers/resctrl/mpam_devices.c                     | 401 +++++++++++++++++++--
>   drivers/resctrl/mpam_internal.h                    |   2 +-
>   include/linux/arm_mpam.h                           |   4 +-
>   include/linux/cacheinfo.h                          |   3 +
>   7 files changed, 638 insertions(+), 43 deletions(-)
> ---
> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
> change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
> 
> Best regards,
> --
> Yin Li <yin.li@oss.qualcomm.com>
> 

-- 
Thx and BRs,
Yin

