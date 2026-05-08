Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0770C374745
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267122; cv=none; b=iUbLtI0rlcYcR8oB2zsmkJgiQ3cOzl3rBAXRWkSswmLR78zBENjOw/k8As7/5/a/sB+Ta7QB67J/Y2dgIfHYJkV90M1A1JZK1euxhpsJp3JWIV9dtw8Rv5b9273PeeRK+wjgXSDSTv9N5WEnGeQOj89hhga3gf1dRVidNNFBT7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267122; c=relaxed/simple;
	bh=E0z9P1Rp8PQEbL1EJIqtI4bjCCcH5p3foBuKDocVrXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k82sspgXSscLR5oTLv/29qqFkLzWgjSCl2YdsW0YjQi0SAGBT38p05TVzIss5KOJqNXt11nIXnvlrEHSvbrNa94TryX32VCDXgGXCh9hBxFHT7+ts/rWtQ+CpSYDVNoV/OUsSReSRpx/Eid2CbYFw1SAmT/dJPitknNaMAWvDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TF6gG/d+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYcrU+gI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TF6gG/d+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYcrU+gI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GWMbr2335591
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 19:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsEqcgYOnuyqrkT3DZE/73T6JDxe1/eanTRXk14TS2o=; b=TF6gG/d+cl1gGsFt
	XhGc1rIC66W5UEL5NFsdR4+RuuU8bFY+GIRLMFCrib7bPBt69V/6G6L8HK/RPDBl
	SpFNXkni0CY6RCZbBBPtFl78RellB1feOoxejuN8LPvDWdmXJo72PwkKAjrQFuF/
	0KntqRjDs9vD3s9nuOngaBeUgJo4dV3Ty+hG7x8QW7xI3RddDG07djp+piPA0iR4
	4VWzI3/R8k5kAyya51dI3Y+UjAAhQFJznFhgYHpuZFcn9W7i/VLjl+ZDH4qV8NaJ
	AF0GqD6LSC1lB59M5a7yr/drfkv3ycL4M951YR+ul+9W92kPUEh2Oecz+p8tWrgU
	zB2sfA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1keh8h44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:05:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f3eb8f3419so8791327eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778267120; x=1778871920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsEqcgYOnuyqrkT3DZE/73T6JDxe1/eanTRXk14TS2o=;
        b=UYcrU+gIsPc11+6+yPXAEsf55GsphJz9/hxGos7M8E2p+T4jEQW/25EuxwOm42ciZy
         HGoHwLcthqE6Kk1AFQxcVMKWMhxUCb9J2Mx8acQHkaNfbkJHJ9rNQ01T4pwe2J/hxzNc
         S0QveC7OKx795Bi/wHvFVcV/HgkWjPq26GyzfMZ4qrN7IBYVixvsUMOwf8J/mBSbyHbf
         CqLdDwyxsplZqdkJRoVni7mi1D6Ijq2bdWD/uyvlM05MZr/hyGXahJytExtdu9mMjB0n
         POwcxKkkWdf+4/CaT9VQnHw2DrI5hLPYIXGcsPYym74w5pAPLBKR8y3tCIDdnFV5ehdi
         Y7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267120; x=1778871920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsEqcgYOnuyqrkT3DZE/73T6JDxe1/eanTRXk14TS2o=;
        b=A1ioVTF7JvsELWSKM1+veiX1aSUTDBnfIO3M42Q+N9xNpORDNkZj4bo8A9jDTkOosY
         i3S/+0va9wUij+Z0yTncnevceFBmjpYQ6B779tzt5x+zuEPMgErdx6w+PGxH0sjUC8VA
         YXC8w8SRxg0UsiraKAAswWerEEFwr7EMbxhCE+89xUQF+hntGvB1/3BPwt8zem1QFWfn
         OXjMMjuhl1191q01haACCpHYBjlNWOE++V3FQSXP89QW7H7hmOEg/ThnIsLmDIikb/zp
         avtde4ibpAU/vpZve4e3CTedI0nPW9MkFgQRmHIgVkDZh9PPZf1tKbTCke6fPq+2asrB
         St/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8VoDPgyGI9V/YnWiK+5JwNrObUnT35+keT7zWR9RXqEKSXllqIuKVvGHfdZ0nwOPRQmmp/VV6S2wlJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ1cGNAHtLowK3GP5p/LRBxHpdo9W28VnDg1q0guV2SYatnqE4
	DfZJyYP8A/mIM/nX2t1mhqk35UN6qjS99atgYATkc/Ev3Jei8wZ1l2p27WaihMSFoKS4/rDb152
	2vB8hqSjyMQ2SCQRtrgjOOqoxJ97lONEKAQxkddr4DnXTHSngQIivsxxVt/OW2zL0
X-Gm-Gg: AeBDieufUxhpo44yt5a83s0OvVP81DMY0iCQ3ibRxdFfLHHBoruqIfcCuyhp9dKi0Zb
	CxmnvvbhoxXub4zj2JpRzD3B2kX2pI/LQOvy7IfXDF0xbMNC0E5KSH3F5uWWj7ZLM6jICCTrXDW
	o83PZ/oik5Z0VijiKXxdRuWmoaLd8f6BoRArx/rlmKw9tbxVyOQNj4etZ70sgacucDyuba8uu8y
	rjHMiYjljIhJNaEpyXRByJASo1ENWQZR+yYWhZ1KxS37vNnMEj+15w/Y29vgt2moGYprEh7EllN
	nUzbF7MArpBj/zs00TkOfsY4fCzAVRODQYOpM2LUfQp0g8aLDTiMqmHXx6SBb57L+gQfF6pLC3o
	b05VZ+0u2kcQrnp7lPI9EvZrpzgme1U5oFpIXDYDL6RGGtd//ibYw38qMq3M=
X-Received: by 2002:a05:701b:2704:b0:132:1de0:1295 with SMTP id a92af1059eb24-1321de01ba5mr3350176c88.17.1778267119719;
        Fri, 08 May 2026 12:05:19 -0700 (PDT)
X-Received: by 2002:a05:701b:2704:b0:132:1de0:1295 with SMTP id a92af1059eb24-1321de01ba5mr3350154c88.17.1778267119163;
        Fri, 08 May 2026 12:05:19 -0700 (PDT)
Received: from [192.168.86.243] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm4131518c88.4.2026.05.08.12.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 12:05:18 -0700 (PDT)
Message-ID: <4e132e7c-ffa0-4954-876b-67b53870e832@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:05:15 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CJIamxrD c=1 sm=1 tr=0 ts=69fe33f0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kHdJLIi08kw_CshnY8MA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: U0LohGAOMGs7EUsCWUDOQStEaryqvI59
X-Proofpoint-ORIG-GUID: U0LohGAOMGs7EUsCWUDOQStEaryqvI59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX9aeJp0eBg/mZ
 cfI0h5zKzFI3COYJCiNmCtwNS4A2uRXL6cpG4BFu6CAJfYojGnTXcA3LDScxMQtqd7l8q8EFgmR
 Orxh0UQ378uIG2U5JRUN39GDuTJS+zU9hcTYj2eTKa2/O1SRmZXTBcfwzlJGgtNixVVE9j/+UcG
 GHofEd+nCy1yLKXOpx/sioQuZ/m6hQSPgmcs64nVkH+slA5UoHSKh6NR1P4IYUinKyF3URxl/pn
 R6snxZtx4sRYQ9vpGY2YwXlDhhdz1lbU9lZoUX9e9b93yMR4U5zZ7+ohALCW3Z4Boym/sQTh2S3
 bhVdYaEQs0tRic1K20gHBpU1kwIRKlGx7gAWcn934Zb2APquKVWKmsRy0AxILwI+VEmDy3Xt9UT
 QHHjCOp6G4hHKyJsnXuXMp/pT/lorwKyK4auslRKUA7AJav0HshVAjxNwJjw8xHXwJ5l9Zp9wgs
 gJ/mz/y25r8JDQbEIgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080190

On 5/8/2026 11:59 AM, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE),

Gunyah has open-source version as well. Can we make it little less ambiguous? 

---Trilok Soni
