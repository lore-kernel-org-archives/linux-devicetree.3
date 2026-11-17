Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913306;
	b=0yKsdQhXghvEHqW2XbmpDHMHIYWh28FM0nk5/oEDOQUf7V5PhQ2d2oA+yLoOZF8rNfEN
	 +Gpi9MDtSHCIuKlMd2BB9KZEynR6ApZ1xVVc7qtc/2CbTbEr3hhn7Qs/JpxyU/KarCBRq
	 pD/wjmzEFu9YthQ6x+VRdXd8s5lxUU5xaXHNF/YEbLMLp+uemI5HPuyk5GSaE99Q3mP0r
	 woI2siK5CJ96xnjd3p4u8CLnL3mfHwEQxN9tuc8qGTFnBngEU/B3FqDJOgEtn44PMP8B7
	 HchRlBTSMNDp1sRgM28xZJ/pW6ouSXMSGu3hc/oN6V1Zi1KZbCmow2JLa4aLghYn1GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
	b=kO6NRQrlkczy/lMV9BzpLVAFh2Ng0XNuJhaT8JMIQAvQqr/WK/FoUQom1Pv9TQQO6GnQ
	 TaKMw3eJhKqHSzz71T3ZYiVoAnEI9av9Phpncc9QtyJ5iwP/WltqiInn7QVq/l4hiVfkJ
	 QC4EWDDd0fAEtujk96BECqh+rQylroMi9d0bgOo+nNKvpPEphYS4q+9fWWbTar7rhn6l0
	 Win+w808WOQsO26rHxEZMpmRYW+Haz67nd2w5NsZw5V92Y/VL7erJstn1dVmj2djn2Z6x
	 rbs5iHV7CKE3Q5xsWI/pLD75l5KeNMbItB9mtJdqx+TkaNqJg9VU5FVli9Yf7/3YG4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=muo0knjk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci9ranhs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69325606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69325606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=muo0knjk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci9ranhs
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAdaZW1279195
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=; b=muo0knjkPJLHmOJ+
	SeIMK/MkrZFvRSOzz9zyW7mOiP7Aeux59PJGrr2af/T8TJNfWp6wS3vQwgJXcXNN
	X5KtFXC2c/g/N9JMosketbN5Gs5gjhboYbfe2ZwTcxnTEMeWPxKecaH9rEQIRgpS
	+SSCs0MMEOwVkjhBAEpcb0sZwt3WlKRZ7b+Ef3kFUB+xNV2JqYiGIYLGeTPFItYT
	aPNQK0Z4C62hgoMi0sWVHbEuCu7SHu2bnaH8bu6+iHjElppP7JY6JFANxsoeqlAu
	q82163jaV1Yzn/+tnx/BpA5f4xhhLW95lGhlXjgxcmQsTjxUq36QVyA2qfzg1KOf
	zF1sFw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc802ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:01:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so3165383b3a.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794913304; x=1795518104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
        b=Ci9ranhs+b0XxSps2j7HeGr1p8VkSfvyGMTC63ssG6lQ5sfQbJX59mBuvrgv0O39TH
         Tv4o1PFWS/N2KFikkfgfp3xE1O+1Y09FWPFiTm6ovLXhQVEJ8EiJMzZSVH72ZHiSo9Wc
         mp+mnwHX7V5vQlQsECsoOeAq0MZjZhnSvybMwT8eMHwf1QBw7XFM314c5z8wNuF1r1zf
         1aC0i1MwQtzSrWlczThNnFK7UYaakuaZCa/vun/JgU3hrckeIABCj/wjL0gLUOpCdKL8
         1ArhEWsPYFuLOY+JgnY6wpfZmI47qFfP8W0kMgLoGcBmcWwd4uW0UpEp6u/s+4cEDaz0
         DMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913304; x=1795518104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
        b=vjAiWZ9cIkCWSesmwFiyP49nQ8SKGnUS7yQhcvC6Amn024MntAD7h4qZu2gX0wg+ZI
         HTuZWLKNVysu3+NDps9/5nCcmvDqzWiPF53RC7nrhRIzgu6UBVHZK1Se5d9xE/6lp4Fd
         WL01oUd0y42NZIYavLYrzueesseSg5eXxWi4zXBJqCuFH9XxHpkgPgQmskMmXPl6uAvt
         fX7IJwsAJlDkO9R3Ju7yy+dU/plBBuKYZr+NOVznjYQuBLf/N65Wt8Rz09j6uBV/M2J1
         xnhqKS8TJPn9WQwBMlr8yDVMeBvHa5EAL0cXb2L+P6mOU/4nGX9XLIHYQNdc7wGEAI9N
         LKDg==
X-Forwarded-Encrypted: i=1; AL+hErH6hls5/3EtGsFIfDb5B3l529nGxvTSLOchhvPvhc8tsRrEHKsLH84pAUtNNqN8c5NiSWixRGapl1Ay@vger.kernel.org
X-Gm-Message-State: APuU4Z+zuGlS984xw7UdokbVoTHa4d76NxfxotQytN/ISFnNFXgvXKpb
	DyUVXjXlvuxCCgscMf4z2JOI3ORj27cMmp3FEqpevnblf5aEyJ2qhuZ91MrCoJa3nhpnikKyJ7R
	D9h/IfNsSmsI3lvaVBYBNCJA/qwQ1mvnREY+jzu2u3p/7nc4bI3kjkViortm7YRrK
X-Gm-Gg: AYBFou2SNSSsLHeed3T3vsrt7xu+y68ymcnOsJP2mZhQvh9j/phhBrI7DhkGUjVM8Fq
	2OwKCJnVMKVt98+rpVtAa9r2omGu+VOf97Y7xlr/L6EkcYmjb6VxeBy8Xp/1Zfcaznawv8zVnE/
	aHWb2RAi8NBvqCA5tM3v8q82lwEFCMeUEV9ZqjUJFbViGrrFY/9a9889vMW4DdV1ByUXoMhHHse
	egoSO1JBj0owpe5NgZpFtdHbmks+kl5Je30Afm7pjtPNjrn8SWRyB+Udbh7YtmjW+cDkS1Uxt0t
	aJxpKKLi7/UnxvLM5E5XUYhbr3PE63QblwesmYu1gsd5Y95+oByOJ07fcbEdGzW/hcHcffBSv4e
	2R2AplFIClu7L9Sr6ujn80bE2f1K5vrv/eC0RIfFI+FFBZCSydw5dFS5VoK0MxCE3955OX9xd
X-Received: by 2002:a05:6a00:3773:b0:89e:8915:24a2 with SMTP id d2e1a72fcca58-8c42858750fmr1991710b3a.29.1794913304386;
        Tue, 17 Nov 2026 03:01:44 -0800 (PST)
X-Received: by 2002:a05:6a00:3773:b0:89e:8915:24a2 with SMTP id d2e1a72fcca58-8c42858750fmr1991679b3a.29.1794913303862;
        Tue, 17 Nov 2026 03:01:43 -0800 (PST)
Received: from [10.219.2.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b648sm4805369b3a.46.2026.11.17.03.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:01:43 -0800 (PST)
Message-ID: <2e247391-ab5b-477b-933e-0e396e0920d2@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:31:37 +0530
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
Subject: Re: [PATCH v1 1/3] arm64: dts: qcom: talos-lyra-evk: enable audio
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
 <20261117104303.435294-2-karthik.s@oss.qualcomm.com>
 <2e7767be-ed88-41fc-962b-7c4bd728e856@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <2e7767be-ed88-41fc-962b-7c4bd728e856@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc3419 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=HA4giugNgv4V6a54TBAA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfX00SdsQuiRfi1
 7hDBAl2TGD9uPELum8PTm6WbWC8SUbZjHoEy9zQmUqpth6rw4rPHRmlUYO18FJd703KIRnFILw7
 fk576aCQY6S9d/gH2UeLZ075WkhAzF8=
X-Proofpoint-GUID: ojZeYtjpwElCHTmo2q9qnMfs9XqMeoTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfX95bvosW2Gx6d
 QzB6XAcf7qTELAjtTdHZItVm3THwJXadXME+sguTiOfgXQSLXJs+R8Af92tMOcsgux/sLa6gh4F
 Hqo5yrzD0uTnwynDVkzOdBKRN6UYhSpKwoEL0sRClT5YQrFCENBjbcn90wfT5mCebNaTErwY6Yx
 NECIEACq0/o6jVWnSi4nGgg9DBoyrhEZmh/Kr8HSHrHEKSu60RlZiNy1rkmZe893QZWOipWSztA
 oWeo8j5kuU+HAV0hEWe8lg4asJL4tmoj1qoHfWiIXJWOcQcGYn8pm3bsdg2Bd8wW76Ua/6u36D0
 SSykLZqlTmVaSubh26gTUgb5nVFbMQ3GSd99YN8dupoNTfMGGjR6g+2/0a8X9nxsoweGdxaJLLc
 Skq5bPnJ/C7qvJtdIRGTZOsSmAoAmboBeXHC4ggG0jEk+0eD+VlfLn87jnNpYScFaKLXhVv9sUY
 ARRxFF+HiojydamW8Vw==
X-Proofpoint-ORIG-GUID: ojZeYtjpwElCHTmo2q9qnMfs9XqMeoTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170043



On 11/17/2026 4:20 PM, Krzysztof Kozlowski wrote:
> What is happening here?

hi krszyztof,

git send-email seems to have picked the wrong patchsets, i will resend 
V1, sorry for the confusion

Thanks and regards,
karthik
