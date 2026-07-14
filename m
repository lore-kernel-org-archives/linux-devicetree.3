Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8271118D636
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016108; cv=none; b=ohjnNgs9d/eQc1Qw0zRk5WB2DFNC5DtNTR6jDR4sL7bvVan4AfxAvWs+i/BhDJdEfu77iAHwzBAhh/9lYxySmJXaNLaxYgMAKSlTq5/Iet6U2qVuZyGWsOlUJYYQSbG/3pIJqgeb1l6ifjxfay4J19P7hSk6AZ313r7Mg/tUouU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016108; c=relaxed/simple;
	bh=7b8uVwS6DoSbkWuLIgz17u9bSuJxmVMI4i3d1rdCqtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bo8+bnh9hWSYrY45V4eR/yXq1n67k24EeVIsuVRT999sbxYWuEwF+LUjHbn5mAc/EF6q4tZPqfCr33B8Vn4KuDy2aOefOBjXTZv9ZmQwKS+vYGaKc2BPbLxCZ2jDsdrP0gX45dgr05nnVWnZTFeBwq7Pp5HlI7GU5mMhTSibQsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2spd5UD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1wnvZOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2spd5UD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1wnvZOO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SaI54005282
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByEUKdaNv7xeQYWQZCJnefEOsRVsi2CBrBMA/VfCn+E=; b=W2spd5UDPQnpQVKG
	rhmL0yuR+ZfQwmzjzSRDIMPskdmmDRIzAc2za1AQ8W6F8Vv5tm6Rhxkifrd+brNl
	1M99ukFeaCDlPVK9ZE1UdauPXOFKWKl/gltf7DGsqRVIjXqIyv/LSbFS4Z0D8I5n
	ms0KiOVLzDzmlxeQkEKGX5HMfzpE0mqfVUUiK3/bhSBSgEJIs/O/yVDn1ofXRqOw
	kkDt2IVBifrE1/S70FrrKDijXZ+V8uDi+PFYMZJniWIDMF+hl3GdordWWHCNALDn
	GAzYdTDRbK/lyYycuX1Ke+sXuSVwtb63pe4vJcBHoZBNCmNgOHeQsMJ+M93XG8DP
	ug/KMg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ctqqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:01:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so88339501cf.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784016105; x=1784620905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByEUKdaNv7xeQYWQZCJnefEOsRVsi2CBrBMA/VfCn+E=;
        b=h1wnvZOOTQs7K+eIN60Zz+uFmH4Wj8ndY/Q3Wmw5uig7xrkWd4jE2+GlXwx8GaxNDL
         ATOmJ6i21lIRPvEuc1aE+k5GQ6kpe7XTz13EFJnu3lufnlxVpSD/88JiCXvvQgvqxcZp
         bRRbXIKWm0iHHaEdpmb9/BtduvL5/uCOTxKm68N6ILW+bMnMOK/XLX4pd9ME8azhC4xQ
         ovjYxPIqURNwfJYL3nGqwERauaJFEpYnKbdJFaTzqcTN28YG/kplfck6Fo1MfQSZKrFp
         dWtg6H/E7WEh4JQAJKj7LdXc+evb7le/JCmnPhww8MMfQ5gTrfvZgbI3mJy0Ch+yZAnk
         O+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016105; x=1784620905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByEUKdaNv7xeQYWQZCJnefEOsRVsi2CBrBMA/VfCn+E=;
        b=IaRnDl9GA0ThvVm+oF/zVtqmrumhYnFIKWWdc2jD7BgMtXjwuFUACRsPtFCmadkT87
         tDANMxFdHPT6UTi4PkzynQJ6ccsiK/9/fVQ20f4VL/1FvzE2TRWVPUkSxETr8rD6qNAF
         Opd5uiOY37TRHV3Cs4G2+5SboBkxOYUqnFN/+fqrhdLWDMPlK93HiI0zisjy2RAa1wlN
         AZpXEKQiczBqUuZuSAJ21HccXF0YgkwJzlOZ8oWsGfj79RC+jS3ooGaUs4XpRbMedpRE
         pubKUcPcQqOdAjod4/lVuRVzgwoCgZJ1OLaQsqtdsqq0eGx/sViB+wSust0m0xXH9GjN
         8GrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/tk6PRiB5MhlKlp6KhTpRhXdI0j/5iKLWZdOKZjKVyAiDFe9ubtJYlAUPsrNLwnY0denecLNF9tvR@vger.kernel.org
X-Gm-Message-State: AOJu0YwfL7IswLo2Te7uak8ncKW4rm+sdzaZt9T+wQhDolSWhklW6QtS
	rwqb+I9rIxvf11wh+mWEZf0R30yslgVrjehysysk8/dC9AG78iqHxFXrMCrCgfRtnEqwKNRQjjn
	x70ugcIbJGvA7GfsOEz4jZRgAsdSYKxKEafer8y9XhyyVZYMGuWMb6PdbdcJKKigw
X-Gm-Gg: AfdE7cm8BlNQwoRZxV61pNRJpYQowggH8xz2y0AQaQ4Nrn+qasD8ZeME8rsLMcLysDJ
	gVJzPPyFajWTq04kNaSkFKwEyc5O7uOsGxIxEqp7AjqOmsJngXRsET1QpC2H7LsZlWprRnqD+mu
	wOKYpqyt91dxnk2sf7GEgmRWHWFthzZxH8Ditb0dIBnmB8sJRnlznn2mTM6TygrrLvzC9oE1631
	SR6fry0tJHduxeDjeQ6rXsHOhbQleAW5UfqWFzDK2Xw1Vc6dZ0QBQ7QUwsz/O3LSPH3Fif9C7Z9
	/feuTxENe7seXGm/J9TdVMJts4y8igXZ2mlZqcRQJdoiEQkybvRZWFsKu2eNMnValaSlth3sfh5
	5gTUvLnS2Rq1ysSlURvn/q7jbGS+irfchqRDHag==
X-Received: by 2002:a05:622a:4c0a:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-51cbf2bbab5mr119189471cf.64.1784016105394;
        Tue, 14 Jul 2026 01:01:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-51cbf2bbab5mr119188931cf.64.1784016104831;
        Tue, 14 Jul 2026 01:01:44 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-69cd295663esm968385a12.30.2026.07.14.01.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:01:44 -0700 (PDT)
Message-ID: <88171d36-976a-41a0-9cc4-70a8c3be6a6a@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:01:43 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] ASoC: dt-bindings: qcom,sm8250: Add Hawi sound
 card
To: Mark Brown <broonie@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
 <d67a4f47-82b4-49d5-b851-d3388651e660@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <d67a4f47-82b4-49d5-b851-d3388651e660@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nrzkihaW40Gg6V-4iImOhOFssueek2Op
X-Proofpoint-ORIG-GUID: nrzkihaW40Gg6V-4iImOhOFssueek2Op
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX+jJd4UvRwxZb
 KPMnjeBehhvzSlL+YfDG5h2DdSI3D8SnGbYJnLUr/3917iJHqgPovJwwrA9HT4c7x4bZmFd9ZpK
 vNiSKwCJFA5b6Z6i3toZzlPluj2owkM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX12jRauMSpowZ
 3Jy9ep08hfJz7cpt3VTIV1k+EEShBFMl4Kb/TjCclErvWpmrdsymV4+1kW9o7gsNnwLWfkk0/3Z
 bM7l0V/Z9Xtb8d7ggrmbyuFYMUIC2mG5JOxftXT5TsLlpurays/krjTQimsGLeftOKnABpVHIU1
 0vrrycOjApiFcoVsT59/xuuPoUsxCiHlHIk75fPrEfWXlvGxrL7x34TzFwbSWQJoDP25Is2Xgfc
 MPDXKaZbQBVg9V/DnsY4Xsbdn1A6nGKg+Nzor8/gXVDGBlM6GFPt2xL+oFcm3sYwZLQQ79/JDTp
 GSzABAtgHGIUr+JOjRggchNgji+QEMCfutO9XGh/RIZcaYAOQW2vXbDQIsRp5ucxyt8Bp1WezP8
 wp4SClbjEEEkcxFbmXNYLtdimDy4DEUZxEX82zSoLxaMMP/srUg4Ir6eKowY6Y/VojKqmgfZRnP
 wm1N3FFnlIEQ8lu7GHw==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55ecea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KJAHXRm5T7kSH1rCH1oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140082



On 7/13/26 8:22 PM, Mark Brown wrote:
> On Mon, Jul 13, 2026 at 11:39:05PM +0530, Prasad Kumpatla wrote:
>> This series add support for sound card on Qualcomm Hawi boards.
>>
>> This series depends on:
>> 	- https://lore.kernel.org/all/20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com/
> 
> Which is a not directly legible link to "ASoC: qcom: add AudioReach TDM
> backend support" which itself has a dependency on some further in flight
> stuff also specified as a link to some random message ID with whatever
> pile of problems that has.
> 
> This isn't directed at you specifically, this is a general problem which
> seems to be getting worse and worse with the Qualcomm patches.  There's
> multi-level stacks of dependencies, the dependencies are hard to follow
> and nothing seems to be moving at any great pace so I'm ending up with
> my review queue clogged with things which don't even apply due to the in
> flight stuff and it's hard to figure out what's going on.  Can you all
> please coordinate with each other and try to get whatever is at the
> bottom of these stacks of dependencies in?  If you have to send changes
> based on some in flight things specify those dependencies in so they're
> readable from the email.  Right now it just seems like there's a
> constant stream of stuff being thrown over the wall without any review
> going on.

Sorry Mark about this mess and I agree with your statement about both
reviews and flood of patches with multiple dependencies send by
different engineers.

I will try to fix the review side (bring in more people) and make sure
that some of these series endups in a maintainer friendly way.

--srini
> 
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.

