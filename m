Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055CBA34
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577805; cv=none; b=u0/AIhYQ+61SmvphqRJLgQjtbQSdWax1+hY6LDGdpYH8lIeHUhtsqkSDHMwnT7V8NmjqVyxOlIRy70SldrOAeCaT82pk2Qra7yq5NxUq3x5ZfxLqxlDnQ1LJxJS4HkgCQY+QmasDBVYzP074DOsOPpDSyH7MSsMFFMKpvib2r00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577805; c=relaxed/simple;
	bh=c84EENtMlpj4dcqmfrCTzYWwu1VFPCw85ytM+ZGBn/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCBDZZgk4Et/xk/UmHWcar3VFTmvGMdJTi/G0FbZinDRC2wOaN860Nq6uBra6O7cbE0ZhGRZmkrG6+yw8y+U3+BdUjdDKPlvdTIHT7hHVma7gC+W/goN8+X4JuWcmX0xmh6TzTJZfNajAVou3ku5BU8SrVu5pUDxwE3CIkFTWrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVu7C1jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqQzOAGo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVu7C1jo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqQzOAGo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuxs11880531
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ht/73UpQIIZyUpRTYArGJnPpIGG8cQZGTaPS+SJfDcE=; b=LVu7C1jo62a64VKS
	xh0Nb4RJvu0BxOGQFyVX3Yr4kMrYrY1quBwAs/9hrAwSrKAT8VPfzC2v1NN7DtZw
	Gp5biwo0Du7HEHUOzZOaVwXeTLjYHOKyedkkBNS1fgLbeN19NyIsWEzN5IMLja0d
	Z15Lkc2tfNw03DWcLx1lDXP64huNMtJeyiWrW8YzGygNIJB8Sp/uNwe+7L/do0ZR
	IF1u3+Oi48DWa4bjzOCM9ZeXonhhgila2Xr7wUFg3t43blukYM17w89yxkTuHiUb
	qqAARehG00CH8bFH4IkWqy5QvnIOxXQuuBTBtGnGd9dPk4xjjFEGPPqHWVVwsFqt
	5aSyag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf1dmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:23:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so51088385a.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787577802; x=1788182602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ht/73UpQIIZyUpRTYArGJnPpIGG8cQZGTaPS+SJfDcE=;
        b=cqQzOAGo1DzN4qiNShKmCyRafY32qopunVOWIunnE3U+6Nc9hFcJL2T/X7a0A4/+D2
         4mAX6xsD0eAYNbULzjjQyGB/M3VyKaLfkoa/fzBvyHSrLwUdB9CvqZOavBMNh62FBfM+
         Tzl1JeW6d18WhJHa5134PqJ496kCmNvI5kW81zmbWzRHped7EuDDma0ESM5LtXG+cC8o
         /ARi8ay1wQbiY+LnEk6Brb3YwG9/ZxWfoo7Mr28NipHWKrsrjTDTU81w7kJv72rHt4pX
         fS6eWHRa6Z7wL18f7jHbpxDTrUyacTWP/M7/WUGMvcW+aJLLwzuZXU5TKtgCF6nMfHmO
         wJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577802; x=1788182602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ht/73UpQIIZyUpRTYArGJnPpIGG8cQZGTaPS+SJfDcE=;
        b=CoDPCtlC9/tI+dtbPUtAiizbZtwivnAMf7xz1om/2+NBqGqCK2gQWWY5u1I51/4iEX
         7XA56ofoKHJI5UP573+BrFJ/Kham1lI9lmbJ4Hycby40ytxmMI4zaVyeLYFciPiDLYTb
         g4LdsmYl/dYkVwumxiIwnGE8Elxbn0fN78prYFSF5tDkbkpKoUp2fMvjbtzi+3EXLjQ4
         jDcTcEn8PnroXrlWwpW142H+q7GJBdfNH8KI319FbFmF1w8Zen2L/G5mAvT/3FSforNo
         W08YRGcduOHn3A1fgBqT2GeOww+kA6ENkMyAVtowHCw7TVZK+F/JjmBSrhjmfLmeYZWt
         U7+g==
X-Forwarded-Encrypted: i=1; AHgh+RoUVQJTOdjoTYZkB8O/8usJyqVEcviZpUgkTAK2auPJDMHDgYgVKdWSlb9WznSq23xUc9sftFuKzCjK@vger.kernel.org
X-Gm-Message-State: AFuF++lSNLLaz2ic+VzxYYgOKw9+bBlg+1ZADVx7VHZ+NDUFcLuIVL51
	pisX64Uzj3rhhj1pYqMYtL2lvYNH9AdI8ROK3yRCVYSUidxI8bwzhF+DosutlLPceL/+T1V/i3q
	U9LstC/nCTSqNCiEtGxZIliISmQ5cCL3lJOUaxtIOBGl1TqUaCtQgwkNaLegO77+C
X-Gm-Gg: AR+sD10JTO52AyYi3HUujljBGPXJM3kVKLCq940nisJznZBKNlu7AX22IhBy+1rkNWZ
	LnJjwSA+0yviPS+dPhjljl7zgbw/ieJ2yAXDWFQkr+wTh+pxmbHFfS+Rtv4BGH88nyeyE2OPuY/
	2fCXZTjgXm2JELz53Rm07p0CSMMAaNEK6h5y9zkPPcGPS8lYqZo5zcmMH7CT4+wSpk8HJw/NyHj
	SEHCwy3cqEhUredYhp6f65DEYXhHzkwHlAiZrSwCTBAg6XQvs+e2YkaL5Nql22fweK4+5nElbsy
	tXyne+r+1DEF6iGZMxihW5HUFulkIUFdJ3RFAgtmIs7WBF3CJ3PstXLuz9XmKHiYoqeObkJuW4f
	3tFeOZw5eq5HKqcJCoY3+8d2R
X-Received: by 2002:a05:620a:2806:b0:92e:6485:f640 with SMTP id af79cd13be357-937395ae7ecmr1685240585a.4.1787577802104;
        Mon, 24 Aug 2026 06:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:92e:6485:f640 with SMTP id af79cd13be357-937395ae7ecmr1685235085a.4.1787577801667;
        Mon, 24 Aug 2026 06:23:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2fe663esm14943741fa.35.2026.08.24.06.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:23:20 -0700 (PDT)
Message-ID: <bbf024e1-0e0a-4b49-988b-9827120e359b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:23:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: reserve
 firmware-owned DRAM
To: Roman Linev <admin@mswin.me>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260821032541.1856299-1-admin@mswin.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821032541.1856299-1-admin@mswin.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExMiBTYWx0ZWRfX2TQWPwNl4l7F
 bT2dTNB0lhb7mKfH4y5a/3CosoohZGbh+udMSUrCH6F1gJtk2eLOqTvJtLHlZsTX+HSrtk4TOPv
 hSpIdDD0HKBOogVzxbQykBv5KJlggE4=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c45ca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=cPhRdkEELQjuWZljFz4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9wTByv0cUS4inZSQu2xgc9TZOp8mCWOG
X-Proofpoint-GUID: 9wTByv0cUS4inZSQu2xgc9TZOp8mCWOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExMiBTYWx0ZWRfX8sAl3PJhTwO0
 qHBKMo0EkHG2b5lTtmh5k3+L9uKMh7FnMPXBHyNt0QBN2G2ZvBp45yS1R35h70Rwu1Q+Op1td+A
 XvV9Tx/WkEivGbZiS/QWykXAzWYB/RDMQXg4Hz0T1ji+MdKjU08vBe9ylIhQ7uybV86Wq7uy7CY
 Hz0qeP922RlT1EiWnZj1lX5Sy4ReJXSbdIsAfwpLKsbGV81kQk3vcQ3Sihwyhu4Zot6Qv6JiQnC
 quFgue0Dn5uBnjgMSbn3qdd9gHwjdhaGkYArZi52AEZ4eqKUqkUrMuY2V+TjG/08Xj0CwA5fQZZ
 8oq0dA/VGL7SPwEuYJlOcl1Jug5a9go6HX3lHv2sG75+6QEQYctZvN7MYyVBOx8bb9kOtgMIhSO
 Bo6wBafD3Uy5hgx5K8s1JKFDvc5nnkm7B8rSIV9d7/4/WWJZesv8zI1D4f4uHMbNmkxQesvrt4e
 mcztOf5niyQJ0bfExeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240112

On 8/21/26 5:25 AM, Roman Linev wrote:
> sm6125.dtsi sizes reserved_mem1@46200000 at 0x2d00000 (45 MiB), so it ends
> at 0x48f00000. On laurel-sprout the firmware owns 0x4900000 (73 MiB) at
> that base: the downstream device tree overrides the SoC region with
> 
> 	removed_region@46200000 { reg = <0 0x46200000 0 0x4900000>; };
> 
> which ends exactly at 0x4ab00000, where mainline places camera_mem. The
> 28 MiB between 0x48f00000 and 0x4ab00000 is therefore firmware-owned on
> this board while mainline leaves it as free System RAM and hands it to the
> page allocator.
> 
> On Qualcomm a "removed_region" is XPU-protected, so this is not a matter of
> reading stale data: the region is not the kernel's to allocate.

Not necessarily, XPU protection is a specialized mechanism, there may be
other owners that don't like tampering with their memory (hyp, tz..)

> The observed symptom is hard lockups under sustained buffered reads, where
> page-cache pressure eventually reaches the disputed range. Before this
> change the device wedged at a rate of roughly one lockup per 59 MiB of
> buffered reads from the SD card, reproducibly enough to fire on demand.
> With the region reserved, the same workload has run 691 GiB of buffered
> reads with zero lockups.

CONFIG_MEMTEST=y and `memtest=1` in cmdline is good to run to confirm
your memory map checks out

[...]

> +		/*
> +		 * The SoC dtsi sizes reserved_mem1 at 0x2d00000 (45 MiB), ending
> +		 * at 0x48f00000. This device's firmware owns 0x4900000 (73 MiB)
> +		 * there -- downstream laurel_sprout carves out
> +		 * removed_region@46200000 with that size, ending exactly at
> +		 * camera_mem's 0x4ab00000. The 28 MiB in between is XPU-owned
> +		 * on this board and mainline currently hands it to the buddy
> +		 * allocator.
> +		 */
> +		reserved_mem1_laurel: memory@48f00000 {

The label is unused, you can drop it. I think you should just do something
like this:

/* This carveout is larger than on other devices  */
&reserved_mem1 {
	reg = <0x0 0x46200000 0x0 foo>;
};

Konrad
