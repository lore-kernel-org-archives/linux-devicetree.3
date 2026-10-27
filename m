Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089947;
	b=AmxozAC4PBNs0eITPJttnhP2q5wP8DyHdwkHv+FMUDRGUPeY6Sq7Ad97fzyjP4eUqnXx
	 5oV49eGM7Hy5ekT9Lz936xe/SD5rD7Dz5RuZt9Z+yDNAUMlsVYymt49auotsgDlgv6bob
	 eGeDXS0Ld9WXRz1Ozfh0+NPufuqKwqDfCvfmoo+sW/PpkRF2lpkQSe8L2OIDiUIHMqRrE
	 coURDDAVEMxPiE1YanXDG9cZnOKn427S06OMOoH4ZD2eaq9NU3b2aBaLqoVUZshJH3k0+
	 mwpfX4YCD5OxRcq3RWjroakh1rcdq5ebdC0g5tBJIF6ljEDUz3SjJONwaF8otQy2xDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
	b=1NEexYyPPD9neemUeCye2L6KRORI3qEKrhNlJtA4OovxappznM2tvB7hT5wtnSGM6p2f
	 mFjowdfQuDqWMEPn8Km7qnn+5xhB364vO6zk/athnp8TACTzJNE0PglycEg2SRpH4gpFD
	 5OMgmJtb/Z513JnUr0hf4Lgkqt7HJzFGkO/FlCwz8bN4qwm+Z/XHkaBIYtB5tC7hmka+7
	 B9LdTuaFpMpsNg1rjNTx4wh2aNW4MTp/KT7lBOjNSBP5Dd3cw4J5NxzErvboJQvK2ER6Q
	 Ut28vnfQV5Hqlx9Csax1vvBUiv5+mfm/DfhZWedHfaRNvSHhxz1utnI1TesdD2S+ssg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQt2Um62;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnY56bfR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CE9606A325
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9CE9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQt2Um62;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnY56bfR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJT23950134
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=; b=TQt2Um62gtkMeC33
	k22+7dsfMQTEI7Kgd83HTKTwp4H7RqL923gCm8XxzINjxyHejBhRbEmmmaC7Vfum
	PevcXHhi3S+pCtKRgZRshE+q5XdPhT7KIssVXYeJkO8QbghKB5k2RocHTIoXHMWj
	EgSdBXIKJXMGmlitoV+fo7wKULJQ7O/qPd8wDwDnPvBqWfKC9cT4/xkIe+W7X5Eb
	Jeh71G3cnVriK+q1nLXLxwZo4yyqYXNE74OhipIao6TGexJ9/yzKB3Rr9P4vijrr
	+M2hobyAxe5bgWJBnCFyAQtVykzuqmRSrTmCby97G5eDXt4T3/W417ZUqJ9sufJW
	Tz8p4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54jv1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea0fe07201so26514385ad.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089945; x=1793694745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
        b=AnY56bfRrCjM2X+JiPn3aPRTTPsA5KeKrsovbhCMsJLIHXhb41gw8xszL3bd9mIaee
         +iJ9Ni42lbtqzAgaibnqS6Ik/Wh1hVjUgDz0tC8Jeu4YrdyFXT0oIDeBoKOOTkPjEsK/
         UWH3N9TLtPr++rHMtDXfDWN1Mzoaz0eoHV8uxX5xkpK0Pi0pYhp4vKRqi2NQgXLpuw8g
         iEFDveqBxt8K/cQd1aFwZ35wK0xFjFzQp66BtSE/8/qq+uRfRpj9WXk+cEXtsvrI0QTX
         axnOXjELhUXwDfKPb932aJm6QlMSYwLwfH2SX+rXxStzNKxLdw0A2baCCrKhtifpq4jV
         En2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089945; x=1793694745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
        b=k2OvSYS/rLL8sTcEPCMvhyfhMTARbhqHgoQlH6cr4PZPkXIElCxDhwyz8aEEsIW2DP
         LmPaALh9YDKhV1MAGHo7x/Dvx+jhIZeV3YJ6ObVZfRP1dwNle65/xpxDXG2FlT9T1WR2
         DOY4IX4J8WDRNy8PQ8T+XGBUGhbQdqiAl2SONS5WQuXcBj6haa36x3/5IfOF3OfiNDO3
         ljcMoDsGG6elqcQ5qLEj/4cAG6oUpw3VF/GIh3STki4TvujEf/QXaHtzPIc/d60FZXlK
         1ISS/JwCvRNC+6uVeMPlCkhvGx48IOyDmp8Z/HTxQR71rqzmn7iCpfMoSuBEQiylLevB
         a2NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNePASGtDOSmgDCFOlotxLFw/obLbf+sn9nmN3ec1o2Vo8qLZ1cVY238r3TcpxvJtvKsij4mp7LT54@vger.kernel.org
X-Gm-Message-State: AFq9FYJZQYXxc/Ac8CojV6X8P4ConcNWqaYJiW3dUhvE2soyIWY1Uwd5
	KBJK0oBlOK5/AjHjtCwlUYkkriALpQEOgUyiatZIhNWLygijQ+POKhrFW8rRmedwgTfHSDcVJ/6
	fEYuRfhDNJai5PeDSy6ozsTrUDZRBqGN2+9+U3z9QqNu7Z70RYV6RaFRrJJoA7CS6
X-Gm-Gg: AYBFou1xD0kQhmJjD3kBN6RsvE+13koVSRJqufIj3s9Wspf5GB9g/NgwYcy+AW3hmo/
	i6VW2JKS2m0IjfMqxnF8XsV/bypbWNbGDGIhpn9yVewfT0499T3JJQD3Bjg7btZxMOtw7MyDSvR
	waLyZQb9CU960cz1ZW9NaMAvFuv9bnyy1HKzqIdwfi+Z0gQU4bEZtlpBVzRDzL6el0Qv9HR4Q2h
	3MJDcF4Ttw3zNgj2yrOVUvlzF8SgLgUqnSAmd81maHidwVbEHOoX8HbGc8ZG0rsNyVXnUY6rgGU
	vtteXzipPsdFnUzBrD9LoaEmWfj6oDAc2w9Sq+Cw95oXn+CzWfvrhd59QtDN1RyvbRmIEAmwkM3
	bEPgXdkklaMvg/BKnGNcJdgpdFwY9j/2a9Q==
X-Received: by 2002:a17:903:1a4e:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2ea9c7fa255mr69647955ad.34.1793089945431;
        Tue, 27 Oct 2026 01:32:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2ea9c7fa255mr69647855ad.34.1793089944998;
        Tue, 27 Oct 2026 01:32:24 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ce0f45sm5545525ad.70.2026.10.27.01.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:32:24 -0700 (PDT)
Message-ID: <37a69bec-db13-4acf-82c9-854fdc441ece@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:02:18 +0530
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
Subject: Re: [PATCH v1 3/5] ASoC: qcom: q6apm-dai: Add 32-bit sample format
 support
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-4-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-4-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXy8WflqXK/8vN
 uPtwWh1eN8jJ+V4Tn7cstenXEpHglL3SdAEvIr+Qaxa6fiDNz1OBB3OYkkS3QNXketS57dHQ4v5
 HyIyjqhAz+I5xUVHpExuPflfmt5d4tg=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0619a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uxQCGOQySBFxhreOsTYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Dqvn0DX6G_99krDg3wkyJmHD_nUMxBk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX0UhW04lj6dq4
 e8sShNCN3qVa1Q0zNWUH67oi3wBnyClc9dbXIM1o0Q3A5g11RpCzWc2kyhnOXMCObeid2RR4Rk1
 30AZOg5AAO4B5K5g8PIImfMrt9kVMYHf/s1MeS+KApgIlg4CfzF0fDe0czEb+GgnSQT3cIx2hYv
 oXAYvAv8tuRpCxvLNMnB+FLuFDcFx7dHVrdIW4n+zwYEw27TW764D56an+wgEDR1WY/8PP4dz3h
 /ZVe5CU6gMyPedRLpEdNSC3gfhusjW7IPqsExn2NC5KI/HK9P0IhgxeP/R0PE7ehAIvzCbRwDAm
 PrXGR6ZbdDVB7EJhrpSjqSLkwxYXh2kfbhsno8ARECHtNkhEqytktc4qsI/NnYudzlH4QZftfdM
 oOvf/vxdOQZrc/MBBXaqNQHfEIkk+pksUK6BdEtnHU9aZeJvUwVqiwJyPTsQPqlWC+fd/RcqPIs
 IHmwROu0GzBFnvc8apg==
X-Proofpoint-GUID: Dqvn0DX6G_99krDg3wkyJmHD_nUMxBk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033


On 10/22/2026 3:13 PM, Karthik S wrote:
> Add SNDRV_PCM_FMTBIT_S32_LE to the supported formats for both capture
> and playback hardware descriptors, and handle SNDRV_PCM_FORMAT_S32_LE
> in q6apm_dai_hw_params() to set bits_per_sample to 32.
>
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

LGTM.

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

