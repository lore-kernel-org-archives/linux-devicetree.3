Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794272977;
	b=BI9iV6JwYorTM+gqYPpiRnNqLi4pV1+5eWZFddaOQqvgLwqIEjKB0kUxZ+mwg+f6fi8O
	 6Hi8l9ykGJKhpInxptROXwj4+OrHIFFUZ87gYzLC5yR5rU634jq1NswRsOPQi9HtJbAtT
	 640ukg2Y+034gUGFw0Z2eCwYT1dZMi9N5wlUaVxrFZcWYcutmtVkiU17K/OPdj51EIgLX
	 SiEPWsogQ7TtOzAO3aqGLEPAssRidoBtDTlwWAG6/tII2yF4gguc7ohfvAVpXQEyRe3VV
	 lEyi9W6GHI2g8RuA8UJqDzS8+AB2JoXXZ9cc2obaLr2SFCc1flspb5POthxqcYaOb5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
	b=gxzBWTcXBKLiCg1dEFrM1wGQ4peST8TZ+fV78Ovg9yuoL8S5JxMCpkg3Nm0TchUv1zrd
	 3Isw37U3rO6RYZcppQBN69p2wDq7g4DMuguo2f7vSIAA3ckfAWuozCf6dqDoygzEILIBm
	 FTtadlykn3BB38VtjFrDVuv6WIMGOBqLP6LlHuXshc4NdwkOrWYEM7yFaB6qr5u4I0UUi
	 mPJVg2A4hKRnI7TWyXRMoX/3L/WhFzIfR7Fn+7bJxxOKNeKn4aZLzRSuBgj+9zUGcupRP
	 aoUTyh8QSfrjWXOsKuV5yMnQXRcF00uXVlPtAwsHyAdpcnNioP69Ac6WGoASUeEVjcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Px7FysZ0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i/K7LI0f";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8C606A330
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E8C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Px7FysZ0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i/K7LI0f
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j3ri1850257
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=; b=Px7FysZ0MEyB1p42
	YwwdorVfIUZwtRGk5wcyOWnl1KQ8OzUWiiOdai/ABaU4EqQB3al+osZ0gWnEgQDK
	wPlgwV2cnhf9m34vPX38E3VtudabuDgtZFGdAqUiqfDz91Y88w2HHlOigXS/1+xr
	6WMBGYsgGkWIgXQ5TUh3OQv3OlxPSX/vRUpISq5YFD/WU+OiSvq41kaErdXas6Q5
	MwX2h380INakGywuEpDJEXpFiFbZTWnhJBa4dNbniLFUhpG6IpFFF7m3duQ66VAI
	euqjjLc1DrFV3AKRZoGmqKijWh0sXFLXknnFe9Bj+xLqiCMOvHHBRz4VzqmUUxgO
	O2sFHQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5twnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:09:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so1193042b3a.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 17:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794272976; x=1794877776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
        b=i/K7LI0fqN0zaSPKz5yhPJWQCMOSmD2kSJlxdEmgU0JYAGZnqL7svgRS805PDdrA3q
         mFiK5stFJr6oc+03rZUfJq+8oJqCaYsOrBhyGr/p2VBNFrmeNcHvCKWpbS/Baoi5SI4f
         dng1xBcRwMUNZ7SlecnwgjzA4a6hChj34SQp+F8arfGCYRX45dFZA92XSNApk5p5PgQH
         gl+bjBAKeg6eIicDtk1WyiHG8vqrGVnzf/zpXAOvAWuT8PkqdtZ4EZF3V1T5miLoS5EA
         G+6Ywfw7rFYClS/4M+NZCSgVZirQ4t6imbnpv+km0IXHAZ47/Qkhg5O/3F7QSlc63qtP
         bPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272976; x=1794877776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
        b=VmHAAm29Gia+S/H4InZ4+n83p0ze8VraMdJ8Uvwt56O2En7dmYCiqrNGmw1Sxx88Rd
         r0vJnqhk/Ua960XGviu9rOxAJX4W5n4s6RT2fXidlPkyPFWJxxcNx3lq74t56Xs12VYJ
         PdyelpTvaMTcM23mldSdm11H1F1Yy6px0buYn7keRpdDQGjC7+HANBPwz11vI1cC99Nm
         borzIjfW5dP9dpobx5fNPiltKAb0kb5nxZwp3mYkzN0MlCOwc8nTUtZSCp21vCUfrbD1
         UFf2VZB/ho5q4DVSwvm5ztdwIj4/rpGFRaAmAyeC33Elo3KTUBUBSbQzh7yT6eFpHJvk
         GQlg==
X-Forwarded-Encrypted: i=1; AL+hErFtvjwcWipxqeulmg2brSFj8BDeDs1aHrSwFe2Wx5Fh1x2LaVSEMF2HeG0ToJ5vD1AWCCVfCJjqajgo@vger.kernel.org
X-Gm-Message-State: APuU4Z+9NAgQh8GFl4QcuRf2IUVve+ye+bKUE0k9A3QMQym6R6Y0Z/x2
	/qGLnTHz/ZMeXW+aYZlBAS5xXit32mBcCcsNJNi048vun+GnmXA/kyeEt79zpdUScBYMntVfzxj
	8Dbq3aHZA95f4jXYq7kJ8aajRXTT+HEjT7lDgB98pOdrxmY60uQByEFcBi9Nd0u3z
X-Gm-Gg: AYBFou1oGc9/mGGpajPxxiOqs2YyVFcFGlAK96Pw0SP2jTndfbLx3f3RbvkyP7HIjQF
	eSwvTTs5sdiES83ANQMoMNWo+EppdSx/r4Xp1HOFrlWI8ozpTx8ju+lWKxemhyTqSZk/klqAqeY
	oBWmV23i71D11uEpdxkkZbsaS6fxEAx3CxFYCNtqPhtv528mZEZH8U6IUSXfrRl/+ef6htekJnq
	AenELfk2wlXtFrRMAScKkH8FrX1bprmBO0pziStsy0l1ZIgtZ5H6yNaeqnBu45AzCQBfap/Ar6K
	jnjoBq98sTZM5jYgkz7ClSwCS75pfO/4Ic3d7ZHwiwnalgz3pdFMEefXHMlKA2KjcywxGp2TIe3
	pRDDpg6QPlxigL+u8y9rmNVykhTeLdNPPqUJMo18d8dXOU66qMJvGTR/POMDC5iuQYiuwqg==
X-Received: by 2002:a05:6a00:464e:b0:89f:9ea6:1dd9 with SMTP id d2e1a72fcca58-8ba864bfac4mr1173061b3a.38.1794272975369;
        Mon, 09 Nov 2026 17:09:35 -0800 (PST)
X-Received: by 2002:a05:6a00:464e:b0:89f:9ea6:1dd9 with SMTP id d2e1a72fcca58-8ba864bfac4mr1173013b3a.38.1794272974879;
        Mon, 09 Nov 2026 17:09:34 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e25esm246899b3a.37.2026.11.09.17.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:09:33 -0800 (PST)
Message-ID: <eaef1b2c-687c-4dbb-a50f-a40ef1c72f8e@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:09:25 +0800
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
Subject: Re: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <42b832c0-5cbd-452f-a9f3-50355a008533@oss.qualcomm.com>
 <dc798bed-85b4-4d47-87c3-f0e0f156ed0a@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <dc798bed-85b4-4d47-87c3-f0e0f156ed0a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfXwBhGMxoPlijj
 Kg8aegkNaFXoejOuD9xtcyVLId8t/c3rKJjgHmJFhC/OHGYLSrbMtTyWWl3HaLZPD1XP5A6Y9xu
 cLWeejf2LPbUDNz6+oSFYByTn3MEpfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfX85S/8m+O1J0R
 W0j+8cy/T6QPfYCMEVpIczKu6bn0L9hR9cjCWwJKeVQ4t9G/OF26kFRhsKaTgRNExH2nm2lviUh
 PQGIFPu/tJqFGfFe78VpH401eVuXegCKzkYRThrywdnpHqqERxAQ4qIGvCBFNttHY6cBPA8MlSV
 ZzP+IqO19AoVREnkpPW48NY/g+ytiQ9CzuexVI4ZzUCA28YCEOKnNbeNkJV2r5btxNylaX2qfCq
 Xt5Qqz1v+QbM6ORzhD00WrF2Q9SWpqg1hxKcz0DtvAwbDuRShm7YYkqZ30nD7LpoGT0bFDC0wwF
 cvM9pjNCNEqcy6mcYDwbHKL5dw2TQIuw5uwx6WwcOttiXzJB8HBvpvr1jSh8pxPviC7mTtDTnK2
 NMwjPulYWH9Dgj0VjDWxNU8SsVWqfb560eczPRlCipe6gpw8F9WkniVBsB7HAlCkrgFOw8ATdJK
 x8qRRQq406jd/AN72eA==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af26ed0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=MgS9wdN22aEW9VH1XIcA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: qFgtDndMdq9whM5nXAoc9KvjXfIbmL-6
X-Proofpoint-GUID: qFgtDndMdq9whM5nXAoc9KvjXfIbmL-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100004



On 11/9/2026 6:46 PM, Suzuki K Poulose wrote:
> On 09/11/2026 01:25, Jie Gan wrote:
>>
>>
>> On 7/10/2026 10:38 AM, Jie Gan wrote:
>>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only 
>>> allowed the
>>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>>> forces the device onto the AMBA bus, where the driver must read the
>>> peripheral ID from the device registers during probe. On several QCOM
>>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>>> never probes and its trace path is unavailable.
>>>
>>> This series drops the "arm,primecell" entry and turns 
>>> "qcom,coresight- tnoc"
>>> into a standalone platform compatible. Without "arm,primecell" the 
>>> device
>>> is created on the platform bus and probes through the platform driver by
>>> compatible string, bypassing the AMBA peripheral-ID read while 
>>> remaining a
>>> fully functional Aggregator TNOC that allocates a system trace ID 
>>> (ATID).
>>>
>>> The series is organized as: binding first, then the driver support 
>>> for the
>>> platform-bus compatible, followed by the per-platform DT fixes that 
>>> switch
>>> the affected nodes over to it.
>>>
>>> - Patch 1 (dt-bindings) drops "arm,primecell" and makes
>>> "qcom,coresight-tnoc" a single standalone compatible, and updates the
>>> example node accordingly.
>>> - Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
>>> match table and renames the itnoc-specific names to generic tnoc names,
>>> since the platform driver now serves both the Interconnect and 
>>> Aggregator
>>> TNOC. It also restricts the ATID-unsupported handling to
>>> "qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform 
>>> bus is
>>> no longer wrongly covered and correctly allocates a trace ID.
>>> - Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
>>> traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
>>> fixing the probe failure on those platforms.
>>> - Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
>>> "qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
>>> tn_ag_* endpoints show aggregation), so it should expose a system trace
>>> ID rather than being treated as an Interconnect TNOC.
>>>
>>
>> Gentle ping.
> 
> Apologies for missing this. Please could you resend it based on v7.4-rc,
> as this doesn't apply cleanly on coresight/next

Sure, will send v7 to rebase the patch series.

Thanks,
Jie

> 
> Cheers
> Suzuki
> 

