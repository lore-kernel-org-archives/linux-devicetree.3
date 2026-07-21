Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFA4434E23
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615658; cv=none; b=jmO0sFjfE75wxD+n7OeOWgN+sx6fluYjO50xRPW33lw4Ywtsv65tDaKKUNuQz3lVBq6aywMtsRJjA3H9jDALYAKBHh/FEnJdTXW+pVuo9qjsw9uFlmwObSzYPG8bKX/Y8QfjonB+YsrEB8J9darGAjvUCI6Ux2dTUTeVsvO+tBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615658; c=relaxed/simple;
	bh=F6NzCnabmdbCDcDfxWZE24gB3jDxtZSzHkOJcvhJD5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESm0Xvc7Y2yGsKkuPcerAP4e//PvPHkNrM5/hcd40Mfd9D46Fzg9dg+oDgEYse58P43CZtb20uGfafSVmHScEpPlIKjM1yGeU+7E08xZS8lwf0PIZdZJCIOCq8CwVPpF6pe94A/YOO8ie3Cnin3kAncxqAO3cUdAsln0Zz+e7bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFdtFdsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJm/sRpf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFdtFdsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJm/sRpf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6SeSp3978764
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8HT7Db/tbeiBIiZX+YQsTZK3oGTftLCA4/l5KIKCZM=; b=OFdtFdskBxQMn6CZ
	FpV2qVxsCGVQqi/V3sY3Q/4ImHfP3E2e9hBBaI7f5I+p4jw9sB1/NM1eVfJMNFXW
	KR3UnWvj+TmlK5io8VV0DW4G4mIhqM8KgjCaaHmUfrCdh+NMwFCGxp+CZW2MG0Jm
	kvc8fO9FAGm2cCRpY2kNK/tsNcpZGAqOXauu2Hi8xBT/QxwHwwpnDDQL/3hDz4LB
	T++x48M9iM506lkyC4ZkvKN/hEE0BC9iQbvQvDjQ32+OGmwHYaSuf9SFNj3/ms6p
	7wpHfapJY6y1Li9hGO2LX8R+zZrdGn9l6CjF6dxC3lDMXSsf375lXrtB/+taoIoI
	ug3a3w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv42smd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:34:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848544a8496so8634595b3a.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784615655; x=1785220455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8HT7Db/tbeiBIiZX+YQsTZK3oGTftLCA4/l5KIKCZM=;
        b=cJm/sRpfGt/JULSaVbYwr0vFTxtEo3GiI7CaIjuyQ7AdM7dEM3d5cTcit/A8kh033q
         L/WxvxpShYPMD5CdzmjriMM6OaW9GxWLmmUtwUC5kEUTS4OExgx0Xv/KKIg5iZJWhqbY
         0gmWDZkpos271isXdsJRcgLNCEe8kzAGXZdWup3e8WoNsUaqp2iwtjfDvIHQAsKWhMaP
         YEtsdDWgbTXr4QVQjGUhPHuyQs2we44MbjmzyoLn88WQnwy66+1VF+Qgf83pg5bQ8+5T
         bYV76le3PQvurQ3QRa+1NQ2Ls/qz5lr2JydbQnvqnR5DbiE109rd9JUcsRMwRhI654yL
         ZYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615655; x=1785220455;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8HT7Db/tbeiBIiZX+YQsTZK3oGTftLCA4/l5KIKCZM=;
        b=smZA0ywJehIG9jcWwNegY3K200agtocg46qQogCcEvZF065jQODU3V5DUN+nVAlA3X
         dE71gxkiXLtK6AxkyVLSYh1B9BJckuNfGBtqydq+U0HOBYoMxbGsogERvyG79OPtKct7
         aOpa4YfFZ1LufyAn/wXZ60pJPis0QHz8w8NW0g/PLiCgJBtApkOjmbGjvP1pqUwzVbAS
         XTQlQaVUdxOc/dBniRFeVg3gRoAOpgn3xQkfsrfgphDLCro5nNuAkjoYj3EJzzCOA+ie
         xpbZYlHDL5J3QQWAupFClbA77nA3Q07u+xBcnXATaqY8b8dSrxoyo5JFOrOlaYRT3D81
         H/WA==
X-Forwarded-Encrypted: i=1; AHgh+RpUMrCdht7LVZnm+FcOTLR/ODPglzz5dLM89Prrm3UDuZ9QcK9GEn3fgkRYxlzfuMvW1ZYEZdo57WF0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxs4GbcQXwj8jMbGMt/m49M0vVFr875zSStlFojFTX7ZL0uCtA
	K/1lzgyrCkdMD3YYVH3aMhFGJoDc7K3Ed9RaRPxInFlA8r7RAXPeuu73dYedRm1I3qI1JnMnnyA
	PJ+UQzMYxxZXDDCI017wNDx1nkZqBSnlKaZz63HCyAHhtR5L95FUdv6spT2Luw0bT
X-Gm-Gg: AR+sD10g1KETy36cCsncxeWEiSSqYTbxTG4huLyBvNRRfxtFI0I55+JdptLngUadm2w
	BcXST5YH9sG2ub9jPBOkSu7l4KB3Z5rdxOs81Q9wq6oTx3LMLhFb1s1Cs0uwR0b+2qS5L/JHTle
	bBN+T9awTorxJdgg9dHdifsW0RBZ3/eKRPlWceJg3tDEUiciqvMf89LKrxK/ZaOXQJhijIeimGf
	oLPPm7R2+KzDluRb+lJOaHGo79QfPtL5Ok/8dNeWFffJgJ3/UK/rg+ij8rIIDkgA5d4zk45pfXd
	YeXkFFG4iQ8aQW2ObDbx1yKTuGK8qaNwhvN2NXqFq8LtMsx6VWCbcEYjCuHmZawcRYTEOH+dtZJ
	JztTy3zE7G7AK4QlIBT8IiKZHTOrJXT9JFG06+kG49xq3QSQhz5TjEZHRX0PPBmJNvk8BDeA93U
	tvld7N5v+HLHttstoD+ZJE5hsxfR0=
X-Received: by 2002:a05:6a00:3e1a:b0:847:7128:ecf6 with SMTP id d2e1a72fcca58-84c295013f2mr16926703b3a.40.1784615655064;
        Mon, 20 Jul 2026 23:34:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e1a:b0:847:7128:ecf6 with SMTP id d2e1a72fcca58-84c295013f2mr16926690b3a.40.1784615654625;
        Mon, 20 Jul 2026 23:34:14 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af317c8sm6490249b3a.30.2026.07.20.23.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 23:34:14 -0700 (PDT)
Message-ID: <7d5b6862-2222-4d40-9d16-7f21f158608a@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:04:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
 <581659e3-9168-42b2-b715-943808d9ae2f@oss.qualcomm.com>
 <782d626c-2545-4719-9833-efbc9ba82871@oss.qualcomm.com>
 <uxw2bm46atdaiyvyozfjvu2hlrc3lwqyvzsl4mt6o4jvx6bwds@nfc3dfzhrkxv>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <uxw2bm46atdaiyvyozfjvu2hlrc3lwqyvzsl4mt6o4jvx6bwds@nfc3dfzhrkxv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6ZW7aNjw3epsNExsdo6ZpVSG8FN1Y2Ik
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NiBTYWx0ZWRfX5A8wdRFMbpU1
 k0bciA2djXeKu3aYIgXOv6ap4POSM30xdD71LJO5TKwSYNcHVa/u2lCRlGEBLOmDYln3lSkfdAR
 q/oL+4bjkf2BlHYz/N+FVqfZrL/PBCDTatiZZHOJJOi0Kh60eS2BkDZV+tdi1hDVbc/vy477ocZ
 /iM8U5gbJ6fYBMil53axPGfLLev+vP96BPzAmv2WmAeTOJwAejCMLEdDbA8/ShXVZMng2tmS+QO
 9cPDnM6DlOvIsC7pv8F1uF5rDbjnH37haPe9vjl5nt+fgLtT2JhZ1vT5OmiQ9GvejxvSrphIHIf
 PD2nTyOFihQJNxL7c3NSEoANpR3Q49U9N2Gq8ww0obw4k2fXpMAdexYKlqpRwuoFccfxHa5oC8r
 0r3JTUO4HcMynoqpWTE7BkVdq8ImLaqHFNWRXQCpkGg0Ayo5babHiBOwsQdAABL1JvEd97j6Bwy
 0Wdf35K5Fq1ZOdmVROw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NiBTYWx0ZWRfX9BdaGryV6CBc
 k2MLJo5KZvQ+4aOcEPR9+nOK1YpEripiPp69AOCyeq7yXEfV7BZdPpT1A+5TyqHvLVbCKLuu9+I
 /65A5NzfmWyrnVbtlbdySxIPmEA3aac=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f12e8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Jw4dN-lKl6bU9YhBcSkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6ZW7aNjw3epsNExsdo6ZpVSG8FN1Y2Ik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210066



On 7/21/2026 3:27 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 08:34:36PM +0530, Gopikrishna Garmidi wrote:
>>
>> Hi Konrad,
>>
>> Thanks a lot for the review and for catching these
>>> On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
>>>> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
>>>> with CPU cluster 0 removed, leaving it with just cluster 1. As a result,
>>>> the PDP mailbox and SCP low-priority register windows are updated to
>>>> match the reduced CPU complex. Everything else should work as-is.
>>>>
>>>> Add a label to the Glymur cluster0 cpu-map node to allow its removal on
>>>> derived SoCs.
>>>>
>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/glymur.dtsi  |  2 +-
>>>>    arch/arm64/boot/dts/qcom/kalambo.dtsi | 29 +++++++++++++++++++++++++++++
>>>>    2 files changed, 30 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index 55d91c696a3a..f2feef362be5 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -275,7 +275,7 @@ cpu17: cpu@20500 {
>>>>    		};
>>>>    		cpu-map {
>>>> -			cluster0 {
>>>> +			cpu_map_cluster0: cluster0 {
>>>
>>> I doubt the code that parses this will be happy about not
>>> being able to start from 'cluster0'
>>>
>>
>> Good catch, you're right. parse_cluster() in drivers/base/arch_topology.c
>> walks "cluster%d" starting at 0 and bails out on the first missing index, so
>> deleting cluster0 and leaving only cluster1 means the topology never gets
>> parsed at all.
> 
> How was this patchset tested then?
> 
> 
Hi Dmitry,

This is a silent failure. On v1 the board boots normally and all 6 cores 
come online, so a functional smoke test passes with nothing to flag. The 
problem is only observable by instrumenting parse_cluster() in 
drivers/base/arch_topology.c it walks cluster%d starting at index 0 and 
stops at the first missing index. With cluster0 deleted and the 
surviving cores left as cluster1, the scan finds nothing at cluster0 and 
stops immediately:

DBGTOPO: depth=0 looking for child 'cluster0' under /cpus/cpu-map -> MISSING
DBGTOPO: depth=0 no child 'cluster0', STOP cluster scan (parsed 0 
cluster(s))

parse_dt_topology() then fails and the kernel silently falls back to the 
default topology — which is why it wasn't caught until I added these traces.

For v2 I'll re-add the surviving cores as cluster0 so the scan starts at 
index 0.

Thanks,
Gopikrishna Garmidi
