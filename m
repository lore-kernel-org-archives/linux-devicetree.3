Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006546;
	b=XtTMb3/sKwfux/goqQR2LxHLufPTOOn+1nPEt4lhJ+YZ0knuXJYYVkUdiDfQvRionyl3
	 jQFIsdvpy1TPVAAm0oyM1ApbKTYn2QvZGXzwNNBScPNTv9VYu2lccvWSffaqzOBXBDKq6
	 SfB9oYKkoEWsTMIws0lAZxGr3gh68B5eZszixVU0By5XCIGfk4UKT/GneSQcnE/V0knwH
	 rtbEaULzXSKYaImBOsYGs+IcmTz5ybvWmYs/Jo1dnq0Prb1LK6xuun9W16+CySkmUNvJW
	 f+kPI8UDSrsU2EpNcImHCswUrEh7PchWdM+8NB8RbjxdCYBC7VuzJ1DolWRmB1yhj5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MYY+8YGb6eYtDMEbZYRT9DRBab3FZKiNZ4g3q/1h+DI=;
	b=wSZ3fepyZrkhK7jzLK9Ug7/94OQCvJQRkxNrJrtfiUxu5C+OXrTg+eXcHLmqlmR+F0jc
	 Q4npNFwFFUP7NdRe7KXBfjyJaeVotjkYfZg0r3JKZYpK4olzappobTTKnL6OGxuMjNNoe
	 UJKRUrhchSy3mU/4RsfGP1gCnN6Pp7deImef21rP5qWTYCt4K28YTr0KHpID4oXikChWs
	 fTL00uJXc/OXKqtgkv+yM5G6EdpHXsmxDN5AzE7S087+UcINpmdfALVFTV2VH1KaFsY5n
	 ZhWoPyBZgJZH71ofwsHh9I3BPrSfzTNSEk8ptD6Qlpo5Jw/gzkkz+orWyOS8wuvGSYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Da/YqfVa";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE8bBk1u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5393D606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5393D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Da/YqfVa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE8bBk1u
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLEB33769996
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MYY+8YGb6eYtDMEbZYRT9DRB
	ab3FZKiNZ4g3q/1h+DI=; b=Da/YqfVag0HWyElD8UXSKp4EQYe43p36+p2eW2NS
	mopCQ4RLk4WVaqBC+5mxfvJhKPO4ZKc3TFZqQM9ttsH2R5l5JT+HUv15f6zft1Gx
	RTzoGDTRZLLqDtWAIrTjVFdRvZJfAree6EDyx1hIMDi3HdVg1Nsit3DC5szprnnC
	M1dA9CyGzv+BMP29BqYdXguC3/Wh3W4HKj7U3Qyu14zwrw2R8/FkcQmnLdraK/th
	DuX5M67CANZVIkhXl14VJqD3lnzG7lk8rkz4TDhMGV3dNuAsecAofV8fh9rDExY7
	bSi0OwXtZa1pbct239IRuNXnCxCqG2UQ7er0gG+P0Vog4g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9b1pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:55:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1078676eec.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795006544; x=1795611344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYY+8YGb6eYtDMEbZYRT9DRBab3FZKiNZ4g3q/1h+DI=;
        b=kE8bBk1uJoDsFTXBFrfox13X8ReL9GGXwOVDnVqLonqvbUNqqZuzNtf3g0h7dm7W2l
         5DVWfUSxcW7KaollLVMN58rmBdR9r7Eoe6IzHLuRyajs1gShoaiTmfhFUkA1q7+Vi/YU
         Vn3VJpwjzaCqsR13lL7AoW3CjJPh3T3F8ZDblNx3mUHX64IoPGAxxj6+WWJImTz7JrPd
         OeRUWUGbYyUCC5+0lP/zj/COL9fNNRriPij6hSHQx4JFPyuPNKLzAeUGPE8VuHq8XdsX
         Qwan+d/IX8HvKqLgLY8vun9ibY+dWF3N9KDZE4k/x+loVRihg4R6EOjgxtxAULQbJ776
         unzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006544; x=1795611344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYY+8YGb6eYtDMEbZYRT9DRBab3FZKiNZ4g3q/1h+DI=;
        b=AR/nAnIz7hExWULETfWnfcbBV6L/oWAmSwCJMNbGy9G2opdTZqEO0+8yDc5zN4YjPm
         rsT19hRo0iIRMU2g3Gy//Mj5oMC3wfm8YintqEVEOXl821VAJx43l8Q6s2FbJnJdyaQg
         YmtVhu7XtzsmcbEHcDXFaJr1y1DGpNc3hfOhrLkF82cmabXKy0asq/vyUog6uWYU0XFS
         mlB0ibk1w34VV1Ny2Q/pRbxEIguDyNNqCbmkagR60+pd3VKkipQc+rMGZs9KdWASnzvD
         xy5vCfe88if5cv6D5KX7seO++Z8JiOc6jAlBufKDmfRR00+EXc+VGAjlX30UXyivddQa
         r4SQ==
X-Forwarded-Encrypted: i=1; AL+hErETDgGDmjNPUORo7VKDSCsZHPZimH/IzmyX9sa/54NS3Wc2rpu5lu5sbmQNOLMqP+kIDSkAVSB6M2l5@vger.kernel.org
X-Gm-Message-State: APuU4Z8vXiyuDWMGP+HGGUscqkVDrSw8Rzbh8Ee56h4cHOlKzJr3lynQ
	FkPOpeKyFOK2LSvMPatNdIrmFcF9MuTZepoGEx2w2EV87inJCCOr1UOYGvOG4YoSL+CyT+coaLY
	RQZ1hwrtrJxK0MIjSmC3nUUenIvN0+m+9RMr7Kl6mZS0FUE3uIzs1+YHqKcH9/vNs
X-Gm-Gg: AZFdTZdWC1iP5pKtIP7XrhmBIrLdDX9FQrE1SOQ2mzFhLetXTC1bzEe3fHeL8snv6d3
	CB3CQ1vuOohFU7BSkaHmuMRBpRqU84yIxM6TjVgH++cto1XRuctWpOwrQezy0l5TT2I62dlvUZd
	vhMYZUqLxIoe+DGqA/L34Q9pMFEWm/O086jQteUN6imdNz4/g9m4Cwi6qh5YhyBxATJl5hng3Ly
	3KZ03zICZpJCNtC0a2Bnd8hIT+2LcnqyVMIEfK+X+br9uTOjmainEpK2Ww+hX0jJ5ilXoXTlpoZ
	SFarfMfo/h8JwHfhhXNX/wLIJQRrQ7sTC7F8dgBPykqVq0vlX8SW3h7D2BEpfbiU87jIDqODSrD
	cybnvAfgno8xjOT7mg6eW7rEaBNoHvluKTA/Il5MdcfDW3nJzUXkNP+1KR9IY6Us9inMEX89eq5
	l0
X-Received: by 2002:a05:693c:880b:20b0:36f:202c:48 with SMTP id 5a478bee46e88-38280a3ad37mr2646222eec.14.1795006543344;
        Wed, 18 Nov 2026 04:55:43 -0800 (PST)
X-Received: by 2002:a05:693c:880b:20b0:36f:202c:48 with SMTP id 5a478bee46e88-38280a3ad37mr2646202eec.14.1795006542621;
        Wed, 18 Nov 2026 04:55:42 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm8359166eec.26.2026.11.18.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:55:42 -0800 (PST)
Date: Wed, 18 Nov 2026 18:25:34 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
 <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MSBTYWx0ZWRfX1lycKw/LIOCh
 kqHKkaNQEQE6sGzIpgrPtiuof5eIlWQcf/R9nql9We5HxvHDCi7ivsCdjnlyxeqL7ZPiGev4U9l
 AiRF5jOwjuP62rZXQr/OD4uYuVemLBg=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afda051 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8YlygH76LDUTcj7JEisA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MSBTYWx0ZWRfX4VcDz+6m3pqN
 DD1baVLGc8ToK4nnU9cZkR840GsIfzJ5Ubq3S8FOBu0iKK4ClhahxgXeBeZjn+2ZVbM3jY6UH+A
 pDNKJnVGHJNeO93wGG4SVnEDeddxbEchxrGvEfQE7zp//OQGbWd7PGcpJtzy/mSJhI5f9/rAKYF
 q1dqsuGDQgqJXlzaA9Pit9wGuFSmdmNjJPp/i1BKn+/c3MKilG43KY+5v2PZwujnziaA89HmAri
 eVSZ7DRYbv3bSSmrdqlnDsLnBm9DVC0beKWPHiR9XtHlNypmKhcREJZrU4pOGuMMbGyfh2xDU0D
 vILMOi16+kXPLGhRP0G+eXcuvL8bpa8c7EEEYvHYJJAUkW6r0tUipgy6ZYYQxNRKtsldDXa440f
 v1EWzby49TTnsVZxW5VpKxOj93pSKfzZEdAXZ0aegRVey9HRsAnl160WF1lUgoPsVPcXvK6o4F4
 8ldNFd7xVnSafgJhvDw==
X-Proofpoint-ORIG-GUID: 0ZIor_cRlzhCUans92ZUEHu99nG8V8wM
X-Proofpoint-GUID: 0ZIor_cRlzhCUans92ZUEHu99nG8V8wM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180051

On Wed, Nov 18, 2026 at 04:35:55PM +0530, Vishnu Santhosh wrote:
> 
> On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
> > On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
> > > The RPM message RAM is shared with other subsystems, and parts of it
> > > are not accessible to the APSS. It is expected to be mapped as Device
> > > memory.
> > > 
> > > The "mmio-sram" compatible makes the SRAM driver map the region as
> > > write-combined (Normal Non-cacheable) memory instead, which allows
> > > speculative reads into the protected parts and results in XPU
> > > violations.
> > > 
> > > Add no-memory-wc so the region is mapped as Device memory.
> > > 
> > > Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> > > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > Why only for Shikra ?
> 
> This XPU violation was seen only on Shikra, and only with Linux
> running at EL2 (KVM). It is not seen on Shikra when Linux runs at
> EL1 under Gunyah. So, I kept the change to Shikra.

Thats not explained in this commit, why this issue not seen under
Gunyah ?


-- 
-Mukesh Ojha
