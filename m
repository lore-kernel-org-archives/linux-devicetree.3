Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8BE471253
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813296; cv=none; b=Z4iw1h5EfDLG+WeiOfRt7qDEYYd8nVffBeDq1CUP72fT+abuHRXFrh9EdcAQoYBMuC6Qch/GR9w9GoJnHIoycLWVhF4D4ODywWezIK/CTQqZr8efc2bt4Vb4nKQkH3F1rVvB/O/3wbvI2wcqJVGTFBDbl5RmLrGuaTZfddc3zk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813296; c=relaxed/simple;
	bh=Z2UrH0wyQBTZ917v/3gXQdeCvruhadYDbZbcpPU/kSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpaMpC19pFgsGHS6g5C205AL2sXjU7bQeNJE8YsydtGsl3JK779tkXXg/WddG4P+8mmwRN17vQowyn8Ggt7X3F/kfeKgE5uwonqEUyQAynEDbRohkYM2Qgsortwns+28sR/c0cUklvfvy6PqXkRXoIT5pr9wWuqDlTPUk45DYHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcVEBWCu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ams0NGl9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcVEBWCu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ams0NGl9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCw2SG3952085
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIgmdf54NbogG/48l7NlCZuTIEYiNwBZtthxtqWw4qo=; b=HcVEBWCuCZ1oJMnq
	06sYT8ragu/lECaIKsJyRqh+jOAe836k2EKTs17/uwqU8Q98DTDR0D6YCLXYKZDm
	rH1vOcrXwlKKiSm1IOb3Y6PiqMxfoMrNz95WjHrskTe8zkX8nSmGvfV5RXHdpP4c
	DrhEHxW0gfkIuqfH4n8gU5GrJvBdG73BRMQROKpqXeUifrV4OAH2T8+NM2H2fmE0
	HToP8nlekWTAFGcpcdOwwz0IfMgHxhruapjthWnhRELb3VCl9JyWuGb5ylSTQaj7
	lZ/NDpSM/9BnaeuLc91M6KtchlMZA/+E6Fjf9OUlBZjnAbPhwNUPPxOQ2/ygWJod
	hmDEhA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu8baj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:28:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so17674921cf.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813293; x=1785418093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIgmdf54NbogG/48l7NlCZuTIEYiNwBZtthxtqWw4qo=;
        b=ams0NGl94N1oIn7eQfCQS30A+GTPZeNW+iGBloHJYIEHzfYWGB2JNTbvcZjAG0Mrf8
         qP9KAQU8lWd4DOh2qtQ0sRAtSgwCuaB1IzEkO5/1Vkiyro6OYsACAwMfAPi9itLvCgZO
         T7h5PG0I1pEAyNeZk36H2NyFXnjfjKtqzlxk7YQRM8f2JUCPdGAWYpbL4wuPus68kPCv
         5lhWLvzdSuO11K8KQUPRBLA+wqPE5HvL3hD/VXRG15k1fYNDcuGffTd4271mmb9VWHzg
         8Uj3RNVGSXKfkHM0LrNqHGSRMDOfRdcAGZ4RkRlb/ATuMjcgbssuYkm6o+1iVR3k0TQT
         1OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813293; x=1785418093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIgmdf54NbogG/48l7NlCZuTIEYiNwBZtthxtqWw4qo=;
        b=VtwNYgZ4fZrze6XEUOuuHHcqVMlJH7/EyCWHwUggwuvQvjosG1KcP8+pEG4EJUyrJM
         y5v3TkM5r0t9Kp4523iNJNGlmlgyhj6Q1/FVm7M2vNZCON6cCzZoK9n3zyEm4fImA/EO
         I3+ovNSI/Z8sBkT6tX84mq/VTiOqgDSTCNtHMLiLM/jPNNvGCfGD5ZMEb4AgrBKMU1Aw
         T2wYMuxE2h99cVkxnxCfInIdXLyhe1EtdGhCdfNcyLidDp8nlYRzZQNxbzHSO/X1lLky
         OAOF+FSQYhgehsnSzP3/Z/zIKBzpu51kEuyOIlb/2hSfbrnLxgG5cYAK7hYNs4EWfO/S
         ie+w==
X-Forwarded-Encrypted: i=1; AHgh+RpFsUNDq2f+VHEzu6XpqF53W48ZnPp57iLtXc8IPE/dd29+i31+qicM+xhIBfx3xiHGYPGPxxnkuBlY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4+qj4o4FVb6KoA/j2qaCd6H01xwUOsx0oAlShLxse7L6r1Lmc
	1L7bBfQiGNtRcQIUtAAuS9kVSxRfxU2FyqG4TEcYMNO+WuD6qRHsyExVZiKEqvBwJiF8A0Q+X8F
	kKWiKP7/COrtnpU2ynb6qcdrOWxR2nGe3gf+Wxst517s3ft1fVgEC9uxIyYiTnHFH
X-Gm-Gg: AR+sD13H9VN2U30Du4qWOaSXMAEjllDTX0vy7tuYvn4YsPXSQIhNOdRcVDHX3zLWYoj
	LmCkny7O9tN+AJCgRTykTaQrI9v6nEZFx453+Hzv9Dmh7Tlmtkr8NXPNt4Ml7yNrnt1cJeG30Q6
	85KAkbTR4WvadJZNMs1YzrU+n7DQJf73O1zUS9O/wEfgW1Tjodv+LJ6a9uZWuo0JrwtdSXH3+s4
	Us8lvSp2PYu5X+05nvOKWiqBdxI2z+DgJFf425tLAktB2Qdi6ifhktuC0QXZLRLk+lf71H+A8Uv
	8a78wS4AyE4rDnerrL0mWwG0paqbPh5IRKrtkWQWNy8bzeFKfwYo0CL8+1wmD2Sy5xhCMJgZDwQ
	QTNLQBj070m6bA0sL8jpLDIfzeTk=
X-Received: by 2002:a05:622a:580c:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-5283df4fe14mr26718331cf.65.1784813293433;
        Thu, 23 Jul 2026 06:28:13 -0700 (PDT)
X-Received: by 2002:a05:622a:580c:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-5283df4fe14mr26717821cf.65.1784813292870;
        Thu, 23 Jul 2026 06:28:12 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm15724988f8f.35.2026.07.23.06.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:28:12 -0700 (PDT)
Message-ID: <8d7ee8d0-66bb-4420-9e1d-615557dac277@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:28:11 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
 <dd22171f-7444-4c17-bcc9-f337fe9677c3@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <dd22171f-7444-4c17-bcc9-f337fe9677c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jecf9LJlaRMWiATl41sQRqB7pUNElGOR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfXz67rviGcKkOM
 NGNu88QdjR/TjJQDrLhQtkRvaQAkILHJVOuCv3JCnx9XRoJCgcObz6uhK5psgFTFby8KotVyuqf
 +ZxjAutZWtptb097aqDBDvD7fsvDeJHzY8gwNGWvBS51OeNA747CgBHxZmS4CRzs21mxw9IvFmM
 gKVP1FRKGH6Loh+9W7WmPNre3Qw/zMoEdsckhnC1A6PdqmsyS0OClcCgzCFbAnY32EBsfFqqIjf
 2JSc9XAY/TaAwJ9qXmI0VhLPjmuyP5jOIUKhyiGMuDcAVovWCYBUYJrTlW5ac2H48tis5SjQMnR
 +jmzNDrvzJwY129MV9BTuyWylOIG0duivD4VHSoh0oKp7QQxkn2JbTfKUK39na4kfB3CksAzyjJ
 +VB0YE5+kOUBV27uIpprYtAMnuaRYrNctbk62Dil1paLtvlhuUzaaC7oLsbARCa4sP1jmaBL7oU
 Xute2svQe2rHzO+u4Ww==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a6216ee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=S3N3vgEnnI5FTr6QbakA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfX1QqVbQAgvR5Q
 JFG5YOf58qS3SoYu8XBlkvGg+x0iGCkq9ya5NahDptxsrIv081zEKaSr3GR0xSDbZLNT5c45EV0
 DU+sH9cyq0F2btsEeNICHg4THTA1SsE=
X-Proofpoint-GUID: jecf9LJlaRMWiATl41sQRqB7pUNElGOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230132

On 7/23/26 10:14 AM, Konrad Dybcio wrote:
> On 7/23/26 1:42 AM, Srinivas Kandagatla wrote:
>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>> mic capture and jack detection via the SimpleJack SDCA function type.
>>
>> WCD9378 codec can be wired up in 2 different modes.
>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>> each of which has dedicated control and data lines.
>> "compute mode" on compute platforms such as Glymur is enumerated as
>> single standard MIPI SDCA class device.
> 
> Does this require a different hardware wiring, or is that just a
> difference for the driver? If the latter, can we choose whichever
> mode we want (i.e. use compute mode on the Fairphone or use mobile
> mode on a laptop, depending on what the OS supports)?

AFAIU, Its not possible to change it because its fused and this also
brings in some physical bus level changes to soundwire aswell.
Ex: on compute we have one control lane for 2 soundwire masters driving
4 data lanes. on mobile every soundwire master has dedicated control and
data lanes.. Bottom line is its not possible.

However w.r.t to driver given that is same IP, I wanted to explore if we
can have a single driver for both.


--srini
> 
> Konrad

