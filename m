Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA30348C50
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565613; cv=none; b=m9kguRh8TLKiCuiAJXcT1rA/5LAJWvM3Tr2mn+ncezkd+vxJdFR1B2ftJdg/BMX5e15WaVjftyvnpg48gvAqNn6ePKZFKiSON6c/In6uJi/NFw0iKl71z5Vx/1gnZgrqrCSlcBuYF2iJ1Q9HaMQVv73tj8U3gL5Q513IQslUbq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565613; c=relaxed/simple;
	bh=53tLU7Ps2H+f3dic7QewFLbcTE8+mia5MBui94ExjQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=assBp70iut4dh1vgWjs7qHDyFH0zCA/2n+4O+/CC/VkD8zftuuzCx6TyaWdtEtjaLLk8bVTzhmg7toyqNiDi8UZ/bVmp8eYfdy+RrN8DMOTAKV9Q6xue93z1XlLToTYAAHeSaBjnpc2G2RLpMLDjx0tFiKTKDvCCo8frxGI9uHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avM7V1x0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LY+7qiwy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avM7V1x0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LY+7qiwy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RHAmZh508698
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPeGMbjbBxfKamsqiHMI1B8e3ukxWNHTNoce9CWzzzU=; b=avM7V1x0LBMIdA1j
	V+TIIenhbI+o3uUByBVRniO1G+VXdUZHV2NA9MG0T7atxXSFIKj20HB0G3esSkXF
	xo5ObbrJVd+OZj6PhyKsfMsBUiw+GGno4mEgQ3tzPz2rHN3VY3yxTqwEynZyaSzp
	PiREBMTLg+Suh6XWrO46/F6PcZah9jBaQVxVJUZi49l/aMMdpIt/sooFW9UAV7HW
	q4UdGgqTZxbRgwkwD4AlCmjEnu9rSUSIOdydF44sYbxmwnTEaQzg9v0v/9PsB3sq
	crh5B2f5VUDQOR+LFFOYuHmhs3DXUdRKZrcKj8tsvIvoFC1rvR87mPdzBJnMX1aO
	Fd4ZsA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx693cd9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:20:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9336581a2so39421895ad.3
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 20:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565611; x=1791170411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPeGMbjbBxfKamsqiHMI1B8e3ukxWNHTNoce9CWzzzU=;
        b=LY+7qiwyi/VI+KaYh81VnrEkC54zWPf0yXw1O6CQJsGIGDVtYCKaL0WdMCXJ+BBCVL
         zRycJmwTEUQ+XTD7gfURA6HyCsgOW2603aqPkGSJDZplvxoWv1AiHecCjDN6csDqNMc8
         1ZiH07gms6o7itcSA9MIG18exD/ndTQ3vS/cl5hTtKqMb+Lcj1VZUSjhh/9ZP3Kn9qtQ
         oj2KPYGbnRKRDnRuOafEhH6Llx8Z+eKQ7igEBP74RJWLZp6+yM3w6OA9Mbqfh/LL9PM9
         sBTaf0D6TaYP1nGseraWI3B1Grk/kK1GRr4Q6Z9Sz1l1+rjm/dHCMZ+dE371pXul6Fs9
         tCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565611; x=1791170411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPeGMbjbBxfKamsqiHMI1B8e3ukxWNHTNoce9CWzzzU=;
        b=aA4krhKMG4CdCJDFAG2IM3QO0eVFyKbdqLVnBjpMoTrt/CGDL/g9hizYDoOuJcuWFS
         nw/kKcyF2Xe1mca9N1bUExmGp0pnH8b2RMniv/KolwEqEYusCfJbcab3kTYqfdUhliBy
         ESPg8g1r/s33aY0inJJWmNEcj96ldQLg+TZ7nv3y6WkR9ULXOj1moOWfiRUTQ6QsfNIK
         Tb19OiBTmKutmHQJ2DvGFii7c59yc4mdLi0cXAN0aGIE9k0d1mCICnZlw831Qe7/DCev
         BoX++ovps21vcTElhqZ6EvEimxmiGJodJ4YpeOBYFFgzr1t18bAJ69D6O+TX2KO8Z/64
         IrMg==
X-Forwarded-Encrypted: i=1; AKwUvBxwDkeN5sDp3Le2q+1a22lUhpX0tN7psBBNwCVgkonj8Wv67OlppIv8RZ8HOibLYS99A9afDWVc2JML@vger.kernel.org
X-Gm-Message-State: AFq9FYJyP2dZJsC+QFBS3lkHSwBOnr7tAeeVjEw10hKWN6QIX0vzfPEs
	QeQE5q8B+lSIKbGIxiuujNTB6RB/IuQYGM3Nx3E63vppvRF5qHKuR2Xd/H66ML6r/4GRRTad/LH
	V5yAZ6ija9Pex5OlTUtLMWiOooBo1z5g7JtXcfrI+hf/r861ysGL1geAW+X/4EonxqzUtQ679
X-Gm-Gg: AYBFou1DTYX4j4GaSGeGac5D5/K4/3g/gFQu6cNrCgriQNuYhcu9uBxlGs5lwvOJ3Ca
	Fcc0R6WHrxBxpt2tfBRzcJ/2yoi/4trI7Xg+IIwEVDoYWKA9QTcjOqrmpfXJ2YXt6Vq4L+hp4Jl
	OL9M6APAZu3YBgNZgQKW+Jo9Cu25/YwalrtFeZnBuO3DF2P38RW+Rk+UPnjyMWOSj/dPt0TjTk2
	hQkgzpldX3EGAMrB47z5cevEHMUylIIZtKrCp3OOAH5wr2BPyAQ6lKX3M2+L6l1qQu2BjipCORr
	gKh/EgOzW/FQsfapEcrTNgY7FYVNQOEJBRbfYlD+T0+J8QJnMqsx+pvuKCpuOdeaxGgbFvVaH6H
	X6shbd5vvTVjD9SC059WJWNS87ssIUccZrBOkVyWqMGqeTaKLxJyCRde8ypfAvVKIALLjJA==
X-Received: by 2002:a17:903:1ad0:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2df94906031mr61070965ad.3.1790565610600;
        Sun, 27 Sep 2026 20:20:10 -0700 (PDT)
X-Received: by 2002:a17:903:1ad0:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2df94906031mr61070885ad.3.1790565610128;
        Sun, 27 Sep 2026 20:20:10 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e13c8sm33820715ad.25.2026.09.27.20.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 20:20:09 -0700 (PDT)
Message-ID: <fa853efa-918a-461b-af98-06bf59040b70@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:20:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Introduce Maili SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
 <20260922-maili-dts-v1-3-ac2b1b76bfd9@oss.qualcomm.com>
 <20260922233119.9674D1F00898@smtp.kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260922233119.9674D1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX1xOhhAGmorjy
 nl1af5bzAHFWlSRVSK38+6SGhGY26pQqwMmNBlVMOPpwfYgtdED3/wBK7zwmLDRcCIfztiZ0B0X
 X8O7JPhuDAypvwo/eDHysdkjbbMjZew=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfXzavUMIzRenrI
 58NMJ3+OSArT8VZ3pEkPPkiYJnFfRHvnlUnyMqp+mDurPZRPFKw8U7g2eNTihXhrylIsnZrGBTu
 16NJ+XhD4jlFPyTdweF8aXuWWsirEc8h+lR2iowhMnUSeisUliIe1V0D+LriYFTJPA/h0ostfrt
 5MJgt0AwpLUT+C+Sab6B119LB1/oDgAiNFCg7uzaF95wTV11iPw7M97XbpdUrJaz4hAWaqPTC8q
 eczfKr1f3rgcN1JsLqZFfwWV9maoaCzTLjr9P9ynHOt/34LJUHOJw2Vm1ydNs7mPGlUb6XOpfkN
 8j/EelwEQ2s0L84LRxEJysBAiJJU6pol84Ng3bg7bi1fSjk4JYo/6gLrSxj6NYOeeWdODpF3MiC
 wVEytyxLlI/gRttjBQ/wm5mn1d9UY0t7L1UHbH2qUDncwDI+lDmq+6RYvo8nYoKN2FoCsIghnVH
 Sqztmop2sI54Bt7uPVw==
X-Proofpoint-GUID: zTrlz3vfaak1Rbh4Dll5sDyaRLyFDV2Y
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6ab9dceb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n0sZffVvZfifOZd3MnoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: zTrlz3vfaak1Rbh4Dll5sDyaRLyFDV2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013



On 9/23/2026 7:31 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dts: reserved-memory overlap between mpss_mem and other regions
> - [Medium] dts: invalid topology, all CPUs share a single l2_0 cache node
> --
> 
> commit 81315838a00d887952d320c67bfae01521f7328e
> Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> arm64: dts: qcom: Introduce Maili SoC
> 
> This commit introduces the device tree file for the Qualcomm Snapdragon
> Maili SoC. It defines CPUs, PSCI idle states, interrupt controllers, timers,
> reserved memory regions, interconnects, and other hardware peripherals.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
>> new file mode 100644
>> index 0000000000000..886d307e536be
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/maili.dtsi
>> @@ -0,0 +1,6956 @@
> [ ... ]
>> +	cpus {
>> +		#address-cells = <2>;
>> +		#size-cells = <0>;
>> +
>> +		cpu6: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "qcom,oryon-3-0";
>> +			reg = <0x0 0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&l2_0>;
> 
> [Severity: Medium]
> Does this topology accurately reflect the hardware? The l2_0 cache is
> defined later under cpu0 but referenced here and by all other cores, implying
> all CPUs across all clusters share a single private L2 cache. Each core or
> cluster must have its own topologically correct L2 cache node for the
> scheduler to make correct migration decisions.
> 

yes, it match the real hardware topology

> [ ... ]
>> +		pdp_ns_shared_mem: pdp-ns-shared@81f00000 {
>> +			reg = <0x0 0x81f00000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		smem_mem: smem@82700000 {
>> +			compatible = "qcom,smem";
>> +			reg = <0x0 0x82700000 0x0 0x400000>;
>> +			hwlocks = <&tcsr_mutex 3>;
>> +			no-map;
>> +		};
>> +
>> +		dsm_partition_1_mem: dsm-partition-1@83500000 {
>> +			reg = <0x0 0x83500000 0x0 0x5180000>;
>> +			no-map;
>> +		};
>> +
>> +		dsm_partition_2_mem: dsm-partition-2@88680000 {
>> +			reg = <0x0 0x88680000 0x0 0x1700000>;
>> +			no-map;
>> +		};
>> +
>> +		mpss_mem: mpss@89e00000 {
>> +			reg = <0x0 0x89e00000 0x0 0x10400000>;
>> +			no-map;
>> +		};
> 
> [Severity: High]
> Does the size of mpss_mem intentionally overlap with the following memory
> blocks? The mpss_mem region is defined from 0x89e00000 with a size of
> 0x10400000, spanning up to 0x9a200000.
> 

the size should be 0xe600000, will fix.


> This engulfs the subsequent q6-mpss-dtb, ipa-fw, ipa-gsi, gpu-microcode,
> camera regions, and partially overlaps camera-2. Memblock reservations must
> be disjoint to prevent early boot reservation failures.
> 
> [ ... ]
> 

