Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13356483833
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161693; cv=none; b=I+42mjbgntz4dzRfaCpsDjW5QBnpdp0eZXm4voOIlpSmJmcOUqraJ6pHKtb09yWBncSCM1a8+e3DveS0tiblTr5pKddiDAXIMvvqXP6D+mYoZnB4wI80iwrnYU/o/bO27Za+GIS/J/VMYB3OBux29adutX1HP/L31u2W1AjSb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161693; c=relaxed/simple;
	bh=aNpgniYnxQlNL672usor40GA1ROVwhv/hX+i7Cjh61Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c82cpXVd9+XBILuT7uVfQPz8dJa4jX68oZsh2KLOUP5e1mULr1f21LWEl2Ba3eUJXmGfyoDYIYkftSfi4huqgeeH6YKFLVkWYuwxebSfw8wt97Rw0NNbY9pWCn2eoZ94V9h6riyIAERACHddyubWoHi9wHjGR40HG3OH8yeWw6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSHw/GHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyrBczzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSHw/GHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyrBczzK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2kKX3087092
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQe8h5Fz3oGi4SySlQkRPltrsSbsEydraSKFBHs6ix8=; b=jSHw/GHX+7qiVa5u
	iVT40o5K3QNgEYlwEdP3+cc8K+sASk68b7YPP/o4e6MPUaPDN5IGzEYEyGeBDiG2
	NsOPCamSnD4Cr4AaCfZ9ryXB4JD8zmhdJOeN5BuuU1phCLlwJUogyiCcD/AdHPeH
	Ova2kwYXGTQabBBjGIdtVUMpH6SozKunsEYslOdO8l8Ul0FVEu1giD6KMd6MOPFI
	ZhpRSU8zWEnqzcbFca3gz9/p6s4N1wf1w181DjtTCXr1k+jJPjNnVLk8YMNDz3y0
	T2caOHu2IwlCwV8WUX3ivV6PspWV9Hi2G1pgeK5Sxgvf4MpdF8YDK1sCMZtE7FLx
	o8F0bQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8fnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:08:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14388794dcfso866815c88.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161688; x=1790766488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQe8h5Fz3oGi4SySlQkRPltrsSbsEydraSKFBHs6ix8=;
        b=MyrBczzK5v98yOh76bPSdKC2T1QdbRVJvo+T6waguDWYBp6q0gceddoR+siQvBPh9w
         NG90hiRjvz5uFvDkpkKk2pAbsA5dsRLiTmrZkJcKv2OJMwbhDHL01k14xUez380LiTjE
         Fg3cuwqi4LnaDGcHVRfkIqh5KjZjKgFRAMeF5R3g8n1X1fOuz4llUodc5mBrVUe9tE3B
         PbyCZHPfwc84tQoWK6MrzJxzhrqxx4VuRty21wE6tlD5XawHpbUOCcesZ4k9qp+4ZLHz
         kZhlydHCQ5kWM+aSCmdohsxZrFs4kGbw/76La4FKsaNwCE5wjXoHdO8OjYEY+avUIxBE
         Tukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161688; x=1790766488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQe8h5Fz3oGi4SySlQkRPltrsSbsEydraSKFBHs6ix8=;
        b=SHUd9Sz9p7OjG61PbI42TnvUWnhNpThV7BXADSJj2ieFMqn7uedxlUjdk55iP3kz5R
         +tSU8Fcpj+dSDOYiOj+qaxlcBqAQ+zvpBGraIHFGe5S91Z4ygp2+M/4VG4v9iRPyyGlS
         0ZtOgYMYYYsReehm8RkLcFanopR6lkUpuVCsuig0zwSV2VdjqQQASgVaeIqn6fXJB5xn
         T0duPFw+CKDbZPMnhVlDgnroZp4f+Mk42SceRj9GgxDaHlfHwg3jFYtXg2ZW5KsOg9HA
         QlSqTBqMj2vt7atOLnN1G46PjBFJ4b6XsO0PSz2UgirUWvxFjQtqEfowGCoXEOas+5Vf
         L84Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2aoFZHHX8a/YprApU50O5Y4fwOw0ZONS7k3AQntS9djwyxpMwckEK+2OGtIhjH8cwYAhuKUicRNg5@vger.kernel.org
X-Gm-Message-State: AFuF++kVNsNZ+qG2c20McUfB/KJ+A5tOU7W1x64vNS0jYBgDix5ZYlNe
	HvCKz7yZbkVQwukCC2Rt3LWooxmCVzBkYKUtXg95wqIrjfnU7fyA9rzLNyxOkAL7Ql2G/tkqclM
	Ok8mBoXyOR+vVakBpPthJ5c9d8o5w913/Lj/eD+JbN9YhHXszxXZaORC9YqvdOFIk
X-Gm-Gg: AYBFou2j/jqHPAcEUEPtellsTxHqN9dJpeEdx1ul8jLXPa7Al8jN1u3n5Tkw9sp7zdB
	Qal63vlpBbG0DlDa7O9k4QOjK0Ho/mBteB41roDvX3BuoQsByXOYjQZPpov7PEsygjLxZYW+qml
	S/7MgZEUmzvYHNA0OuQS/FyT40BFneGgktOVTLUaxhd7H+2zypeqnUWr3ykAmdTXoIga0uyXBVU
	1eCsvI+oC/kFyuYX03D8xOomuD5PpEP087lQKLZ4MWidWT39ULW43ze6EJtmAnpRfUOhX2p9GDH
	BUqvFb5HAVEGSeos53NpoD+jQq6wdL9/VWJ2LQmWVg+h65WUo0PwTcGfSA8CYNdtzrb6ROGw0Mx
	9vJGI5QH2DouADTPyVv2MtfwszrU=
X-Received: by 2002:a05:7022:282:20b0:143:707a:8958 with SMTP id a92af1059eb24-144f9176299mr2849954c88.33.1790161687944;
        Wed, 23 Sep 2026 04:08:07 -0700 (PDT)
X-Received: by 2002:a05:7022:282:20b0:143:707a:8958 with SMTP id a92af1059eb24-144f9176299mr2849904c88.33.1790161687339;
        Wed, 23 Sep 2026 04:08:07 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm13917357eec.18.2026.09.23.04.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:08:06 -0700 (PDT)
Message-ID: <18917c5b-a6a6-4b4d-9a1d-452b53add385@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:38:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
 <arJytCJZZnIX835Q@sirena.co.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <arJytCJZZnIX835Q@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX4GNiSZmIcfB7
 kn0QCTCcAHy/7bVSSTOMsjqkhZ9S671qyPDIk2pua9cE0iaxLFgOcp/1jX18+iSR0hNJZ2PHaEC
 5JYaunB6MhmepGX5HfCH+UIycCFMjXc=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3b318 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7yqfin2zcifDTxxPRisA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: W1aKxZTRoaQjCCH6veLlXVHGNb4vH4lL
X-Proofpoint-ORIG-GUID: W1aKxZTRoaQjCCH6veLlXVHGNb4vH4lL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX4JDw4e9Zd/UW
 g8aDJAjEKArDhenTHCOEUULaLm0c9Z4YBo5ArK6/v80aTEigMwkefAdTfIKnlhHZXnJpBsOt9Mi
 u1jN2zMfYaknkEbkwWtUwHA+DBdHODgM6JgB94vLkZ/DwPMYGHnLXV++GtLmN/xaH0a/gFatJuh
 PGhDFmcqJaXMQU564zbwMJWNl3MQQEXJHESYcWU3+IRZtMpoEYDV8JqzyfSERyUgA2UzGSVXnmh
 gbxWz3Lt26oiJ0h+I4KHBWKe76SiYEV+zHk8UXbST7wTuB+WB15znfdIEEz5+IgH/wHUa5Drv8t
 8XTaTF18ZMjgCDP9hIB2ZEauPveWugbkkdL29lf6l5IGxMtU9M0W0tfYkFUCyRDgUEnGAcj433L
 ob5ciycxHUnKZFoDyxBj6vPKVHtCyeV8UqUvYAehmrATO1h74tMsEuop8sRl5NleUIq5/W0QNq7
 vOnzqFKud8Mp16VC8uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044



On 9/22/2026 5:51 PM, Mark Brown wrote:
> On Tue, Sep 22, 2026 at 12:38:11AM +0530, Ajay Kumar Nandam wrote:
>> On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
>> context and cannot use the SMMU. PCM buffers must live in reserved-memory
>> carveouts that are SCM-assigned to the appropriate VMIDs.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

  Thanks Mark, I will fix the binding patch subject in v6 to match the
  ASoC subsystem style

Thanks
Ajay kumar Nandam

