Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197FF17B418
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548551; cv=none; b=QpAop4CT7sJnr7RMQaTobw/INRTIhiJFqPbJyjLzXGvwwZNg+uTbEBwzJfj4OVcy3LsHpraGEQ7IgDb118400vIGRYJ4Cq9C8oAWQ8ttq829aUtNqgInSzeRUzT0q7Tv7MMnaNanYflIKDz7JnVEwzZtvfJ3aRkDLHaa1u+PS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548551; c=relaxed/simple;
	bh=xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/WGP+Z4JEFjBEyXDKbiNNsSn7tuq51JRIGDE1zXcqmWWOMmylTn0Cc535fcTRNs2kZ666b2UvfyIhQNxOYQ1uuy058BRnxPC2IWqyJl38sdyAA8Db5TH8xzJ4BuJkY2Xh3QlU5rNSLKB2D4Uf0lyHAs47kFYqTW8eYjEiJS4kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wl/CQ/hB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZQO9AKv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wl/CQ/hB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZQO9AKv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0l1sx1343616
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=; b=Wl/CQ/hBP0Fu5lMT
	6lOYYc/hvH/pdwGGzHOMfboWj6m8iXr66weUAyOyXfvPi9PMKda5r2jSAUHkFP+B
	Elnr05wrYa/jdF8Rhg1a9RPCPSMQfq8kpsWuL7RdRh/I+ISfBpOk3K5htaUrPrRd
	xikhRGImY/75uGgf6dqBdERQQiGvbMgnzczwxUvXpUmVXzDGkV2YZBjgUQ/WcI0+
	1FzIlIy/Si7IMhTDtf2U/qR5P4aTsSnbR3m93FAMZWAFh3ayDV4fUsuzLP03MppA
	5v6opmA9kpTdk/nbJBivTDjaCmQeCdV1rPxBZrly9NJauikQAOEZ1WHLVQIYKDHP
	wE7W7g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qwep7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:15:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84fa3b14ed2so2712789b3a.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 22:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787548548; x=1788153348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=;
        b=AZQO9AKvuHKkIdjYNxhP7fQFEhpOjj2ff0zj+3RwYlFcxCswlIcyya0GC5jg1kpg8Y
         TD9WPy7Cm2WR1zpBh9wBTsHmNj2qxn4hk7Tc7mzOMzMBG4EGJcVLKzolknKZXXxV8tD5
         UHX2RCUaW/VuWQK+U3gnZoVCoZZBd5KrynjJnVUljMYpmA7bFh2GkH6Tawtxcm7LuWL/
         GtV2H7Bmm2Onk12y86DEaPxRarAZipCH1hGkuGvSZCAZcVZ3Gg2aXgDFnQ3+CE9fcW0P
         hOVvhhzGSNEhyOkyzP9aJNzs5GMMb2um5SI3aZbndxmU7myUDItaRKhPiDkAQR6rP7+H
         Nw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548548; x=1788153348;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=;
        b=qwPLv4U0N4rbYXctrk9cOtGUfdyiCLPKVVFlpbrKJpfpCBdk3ga4MuQJes4gBGz136
         wJcriP72k+yU1wFUiqi2xspCZTg0gWTrLyu/RL1Jyym4GePvLIURiK8GpdhRMuwNAnOG
         U4m6rKmsChZb1qh0j1ogSa/01qQD8DCLVtZslSgG/dtwTH+daMruj30tkKpiBYqLOtQI
         WK7qwZOozlbEdxkLVu/vNzqrmS0IbLYp3tiOPTqbk8DRhFnvgXvLjiHBe9mfmRMTn3vR
         9LOZo4IWmzxrY8MWGQmJZcTFK3G1pe3fo3OI4LNZTm6AlsHOl/gZueBPJ/V8dp8KQlyg
         7USw==
X-Forwarded-Encrypted: i=1; AHgh+RqW3tHP1U9zdaqL3SXxSwX7bzRD6WsWxTWBzubx/c6BJkl+J6ma62NVLwQJ2ljXgem3rnyMO3ayFYtx@vger.kernel.org
X-Gm-Message-State: AFuF++llXi29fOViUIQSuaV7eMfqKDqOxHBJGh3Gv2BK+sdVuGDj64zG
	+Q9aj4/IPsNIhRmfTltC6/t5wPr6xmGY7Gm1layirTltZ7NcbZ/Uz6GDLl2tVCbWPGDzz2WlGgg
	LSklageBIrD8w4XeSX4ACzIk71usLZ6sl3H/ALthzuSZSYzBskE4WtzUMWQsegKCRD69+pBVR
X-Gm-Gg: AR+sD12ymCIDim0zlWkZFbFwtlWY6KmzoKVZ5lC5SWyVWQNIU+ED8BhFQ10PgClpbyc
	2WRgLGKomfRnIUEYWSqo82EjznYlYIe4JhagOQPoE/8b+vcs2awDbWqHEe4nBCLbRH2FIrsaf8G
	hqxeCQle11RD/1+ZCybbA3gsGuJ2U6A/xt62oAl9Nj1s6bj+gOl6shMhVO6EwP+fWKwIYuRjqGc
	2UUxiOow7cOOiHGJpJhmvx2qTO1zod4vmX7CEQgJd4JCmFjYGDmCw6dWx38Z+XwI4PHqMWG0UU5
	kuDVl2KEcg2VuJx5KXdmPsZ+QK75fH6cZlGhX/0B6xNNoQ823aOpsKyhwIA4hI6jC036XiPsous
	fovjhmTv/ckzqjW1S2QQUUbzo/G8SPlML
X-Received: by 2002:a05:6300:278a:20b0:3cd:51ff:1b14 with SMTP id adf61e73a8af0-3cd51ff1dd5mr14316442637.4.1787548547883;
        Sun, 23 Aug 2026 22:15:47 -0700 (PDT)
X-Received: by 2002:a05:6300:278a:20b0:3cd:51ff:1b14 with SMTP id adf61e73a8af0-3cd51ff1dd5mr14316404637.4.1787548547495;
        Sun, 23 Aug 2026 22:15:47 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d37d9sm23580957eec.14.2026.08.23.22.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 22:15:47 -0700 (PDT)
Message-ID: <e917c8e9-0fd6-d61b-a2bc-0d81adbe464a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:45:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org,
        robh@kernel.org
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
 <20260818160351.4E8F51F000E9@smtp.kernel.org>
 <4rk2qpalwmwtzcmmn6leezboybfgp7buuevap7pclcbf2f5mfz@zvadm7y5e7uv>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <4rk2qpalwmwtzcmmn6leezboybfgp7buuevap7pclcbf2f5mfz@zvadm7y5e7uv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0NCBTYWx0ZWRfX/e2jCoNZHLIe
 o2iMb3OWMuxIw/jGeZ1zbJCfaB1VM5+BL0nF9CKEzVFhp/QW9wilEIthdM/A3g9PFdd0dQ4VCnT
 Bqb+p+uWWqL/vhbNaCw0riItl9a2W2yBhqqOH8h42V4LNR2mFhNireMOhXibjzqsSweXuGE35nU
 vD/CEUYK/5oiwNoftU+oLCIYUYC8FLxtGWmUBNucha9eHXVIe7LX39m+5JfxOQq2/v1ZsLexqgJ
 BGu259YN53GB7NsPj9vhhYY+gR9onirrEuD2qs9wmlXHb4FVhMn2yO+NTKOIgo7BGceaLuq6C9A
 E/Ev7hYSWMho9EdOVPluRBLHIDP+bgi9bJRIPOk9OLzjh3My/c3DwEdHg7JLxv/mdjHzVtlw7a6
 0uu/Rhwx5HZgJEF63DVSSV7hV/aRJ5DenhHZQbi1yFlPVBO4otxCNH06AyDUSFspIEOspWdAy+4
 L0KEy6aLgxDLX4HI55g==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bd384 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=vvLq9R5Q7EL3J8ZDTOcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: eceB8_9HgFDv1qnuO8jpC0DDOzQEfcrb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0NCBTYWx0ZWRfX0Wi8AFOmk+Fb
 PxKgsoDEwzG40LOpoBZ0fQxX+qF3wjZ49LDjqLunSA9o6P9eQ7iGXFkPfNBqBJQXVu6g6lWXnmz
 MrN7EqD7CkXDlelENMTTEriDsp5qKQM=
X-Proofpoint-GUID: eceB8_9HgFDv1qnuO8jpC0DDOzQEfcrb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240044


On 8/19/2026 4:17 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 18, 2026 at 04:03:50PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [Critical] Calling `dma_sync_single_*` on an IOVA managed by videobuf2-dma-contig violates the DMA API and can cause severe memory corruption for non-contiguous DMA-BUF imports.
>> - [High] The DMA synchronization logic for output buffers is fundamentally broken: it synchronizes the CPU cache before the hardware writes, uses the wrong API direction, specifies a zero size, and omits the necessary sync upon completion.
>> --
>>
> Please respond to Sashiko comments. Also, this PR is missing
> corresponding change for the venus driver.

I will check sashiko comments and fix in next revision if those are genuine
issues and add this change into venus driver also if applicable.

>
