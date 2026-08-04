Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C634570C4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856738; cv=none; b=j8QljEaGh/FV5b9A88gRqAdKKqQb/zCKqSfSMvPd1bY9Tg6bHgusb+3yMlWeTgDkKs5gbBVngDCt+RReNsPVC9MgCLUnqKPrH6P4kjvusoOASzTZ2ZOblAnPcOfD4/OXgIIixSmVDtYFrBBRXzlDb7o8CLWXKi4Pe6IvdamQS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856738; c=relaxed/simple;
	bh=CwrnEU3HCA+ZjLyrhS2d/ZHQXLlEFyFQmFNfnlbQTYM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VHc1NCNZOkugbksGhol3/kgzN8viaKll3Rkg85as5UC/6Zdu8J86gq7b2bC3MG/UY2V/kBIJUe5DKjsPqkrIT5EIWOhYvLVl56slITAbZuQqgokekyqW2QD3aG5dvm1IUy/z1iPc4uC3+b5e+YrrOF6l8iXRav6To4RWJHBDIqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgNhnbwk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtV3m0aM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgNhnbwk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtV3m0aM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CWxJb3211674
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 15:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E180SL3QVJYB8O9OiTPj2R0g02zKzvX2cl+FJ8G5vb0=; b=UgNhnbwkMT42EI+T
	YKqvgAngxVINxcK2imdWH8ar9nSFt10ggaB7RHj/lTsRLlEwHmRxECM3Fgk/ee2B
	Xj04l/k0Zg/bXQEQD8brReeZUJJK1qwzSus75H5z08KZkuvmna7veARkSwLateq2
	Lr3xOSK5F6MU9oJrNtop9ud1zd4mZ9ViPVIe5PsQXGzVH6Fr/U2b/h+fS4f44dvn
	h9aKdR0WXnOJFPKe7VN1EIUHDj0NGVW6FkBFMQktj4tgWDkgnJBhC5IdoymVWX+s
	IfwR6FVejmfoJC4iFOTfobElqweveWcmgYxx+1LA8RV9PIJenUC/+OpT9lsppS+4
	+nIXiw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud23hk4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 15:18:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848474825ffso27427b3a.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785856728; x=1786461528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E180SL3QVJYB8O9OiTPj2R0g02zKzvX2cl+FJ8G5vb0=;
        b=VtV3m0aMK+okjV0/mNzrANByg3zIfvZyF0VGjB0KWAICGPsnRA1VEs4Ur87xsSACEe
         ptDtCoKqZsMBpmhrbJyhEB8IW+3Ef/9WkkjR7Rr4pv897dlqbN8iRY4TSU3Hsxq8YAkE
         JgeABCbSz7vH1oCCN50TPZdtHW4NMcK41In/TMylqYMhFdimYPkxBLillY7FnMxm7LwX
         Ta/sc9wiukb80RikKnzPmmaNt3y97mvq158Qs+UeO/DahX+0FdHT+y8N7ffSq9+HEzdE
         yfCJwEW1uaxZjYCvkru/oDVlhYRq41AebvVJ57CdOaNuE5vsz3uiISfdwAMf2ouKPMQK
         XJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856728; x=1786461528;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E180SL3QVJYB8O9OiTPj2R0g02zKzvX2cl+FJ8G5vb0=;
        b=O/5kHpPwyXTyrZRAp/7zKss6jJFIR07zPDmUclIOSFKHKT80QIQs0iG80bG6StheYs
         vt/DSYTwbP5KTokRT5BLNqiZyf1oiU+PD8GyXUR+c6BiwwcHy0WRzU/J5/9GQ5Bj2bSv
         zSRzc9JgkxHqgoBMeqc6VMnZGxUo6SZwdmhYJGd5UJW+Ow431Mf0KscQNjbrT/mhNmVg
         gvrb56wrEKngOF8jdXdGWncxhyQvU2mHd0xGmu8mwdiz6SqFs2RQtwG7wP3XN4vVSQDf
         kh0mqsMO+wr0T2gaQnA8K78g4aGck/TEUwWJNRubT1N9G29wwiV6N6mXx6W0IrtYgn46
         nClg==
X-Forwarded-Encrypted: i=1; AHgh+RqrV171S5KNguu1f/NlDcAaJXf5UGFtAf2DIYl9+sn948wWu+JScTEKfVMv9QR52Og49U/bDgWA9lha@vger.kernel.org
X-Gm-Message-State: AOJu0YxHP7ISk2GXW001iTJZVg1unafe7U4Bj0zxuDK6XDwSZ4htGQtG
	OUyO4X5OkefURP6CfT8+TA2ZpVih3wwOYf3SGUI35jB24oV/9yK+rRhe/oxlZGCFZUMGJlKio1b
	CcWSzDMguqin1XjV+iKUDnKCuP0cHdvveoSN1ZeByFNdk2hqDODimi2/EBifjnnB2
X-Gm-Gg: AR+sD12cbm1xJg+Iz8kxm9XoBJ49KW+U/CMwDJ2qUyaPxP7o8ALmpHhCN+1liQelHi3
	wrgpEs9fonFpdmd2Z5jjGulSwwF/FcqBIKlp//wY0crW5PkFD5mI+gKPhy3bGQ8Em2ZzDjpZJCp
	3Nz2CWJLo6v6/3CWUkCP9mIPXrFDU0EyLDIKoCfAAbQQAa9R+OPapydEQs5NC9dRd83S08mSLUK
	ORzz0CrzKBp7QxvIy7S3op+kn9pmcLOeru87KugghOEHzYQcwpoIx73/MG/bFKaT84bnEtkJbz+
	HipkwmfoGgZCKEdPrNSYKOzXh8XfU9SdL9rVscV2v1MaDJXBlrtYPVHGKhgh6AYhrLxmQPSEXgj
	XjEcc/g7MaT6+T4h89bdyue8DqR4ePo6y3Fc3kQ==
X-Received: by 2002:a05:6a00:3912:b0:84e:354:422b with SMTP id d2e1a72fcca58-84f2dbc97c1mr35113b3a.2.1785856728536;
        Tue, 04 Aug 2026 08:18:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:3912:b0:84e:354:422b with SMTP id d2e1a72fcca58-84f2dbc97c1mr35041b3a.2.1785856727675;
        Tue, 04 Aug 2026 08:18:47 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe5702bsm5531130b3a.16.2026.08.04.08.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 08:18:47 -0700 (PDT)
Message-ID: <c1f8b5bc-6d50-42bc-b671-7e91d76cb975@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 20:48:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com>
 <20260730-organic-chimpanzee-of-excellence-ebbcca@quoll>
Content-Language: en-US
In-Reply-To: <20260730-organic-chimpanzee-of-excellence-ebbcca@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QPfBu6_-eIaoxII4quUaQyDE8vlJVEZn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEyMyBTYWx0ZWRfX6EltyE+Vm2mC
 /wFRE9x4+bb3Jlwp6WRCGsRhh1Y9ZbQ/+W+G3oJDmlDZ7beHqrIhZJCMNqVMgCYkGxJFLBf/BHl
 jgXYYaxVgaONvG9gG7GS6+R4bfC8n80=
X-Authority-Analysis: v=2.4 cv=XIkAjwhE c=1 sm=1 tr=0 ts=6a7202dd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4pVsCTw3SaIgFaj2y6QA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: QPfBu6_-eIaoxII4quUaQyDE8vlJVEZn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEyMyBTYWx0ZWRfX4pUFilCb8969
 UCayGm+L3TrSYo04iX1nHJBW4pvnKSISuv6Vgv5uU7XmHESx07fHOw/2lYysPVZ4YxcTQw1Butj
 UsrW8rMkBqF8B6YtdSbu+Sl0Dx8bGj0VIE96Lgnej7nuPcS+1Lln9bp5m2Ck04GX9fBqXWMqKi5
 rnMdxGfFVCwIj6Thhx2JXUCxxF1g0FOJcozIx5upoCLz0/uREcjJWHN+Vu7x7FzeihNMyorXqM1
 qgkSW4/MDGvQzbKyhU/UcqKkejNii8VA6Lwt4BsYMKj85THlmAOy6kW2GRtbV8sNLQmnCfBDfXZ
 QflPoDzVCDaoIYFYrXVFJ+nbgF/+Wt6kyRETNovzjaoSzZgbxtreFzTQrqjU+qciHusKinGm8r5
 xH8QxWLxJuaHqLCzmnJbu1S/IgHUJqV5Pkt3HyYgOsChFs6LROw8k7PpM9LBvq5ZGZkSU7YebxA
 Z/wTBUgCuP4KwqwPhZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040123


On 30-07-2026 12:53 pm, Krzysztof Kozlowski wrote:
> On Wed, Jul 29, 2026 at 02:21:01PM +0530, Vishnu Santhosh wrote:
>> The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
> No, it does not. Look:
>
>    $  git describe
>    next-20260729
>    $ git grep bam-dmux
>    No child node shown

The commit message overstated this. The dt changes are yet to be merged.
I'll correct it in v3.

>
> Why isn't this part of Shikra remoteproc commit/patch? How any code
> could pass validation otherwise?

By the time the BAM-DMUX support was brought up and validated, the
remoteproc changes was already in a stable state. Therefore, the
bam-dmux change is being submitted separately.

>> node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
>> does not list bam-dmux, so any DT adding this subnode fails schema
>> validation.
> Fails how? How can I reproduce the error?
>
> There is no bam-dma in this binding example.
>
>
> Best regards,
> Krzysztof

Did you mean bam-dmux (the property this patch adds)? If so, I'll add
an example with a bam-dmux subnode in v3.


Thanks,
Vishnu

