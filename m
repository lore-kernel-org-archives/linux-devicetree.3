Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ACE2750FB
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922355; cv=none; b=KH8tfupGP4rTyBe0nHXWKbUaOaKGqzNEOm7oewij+h0dJ4MsJPQm+Q7vz8vOIEHEizjRHCczQLkTVVz0hFtcNW4cqHSGPURRXqjQuW7FWdxMeOzNO2ATplJ6E6tBzNVdba5RMkbxMDoy5apkf4o7JseV/t1GtqYW+GhUiIh24TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922355; c=relaxed/simple;
	bh=HX+M/Ttq0ZpyquSodBklBR55Op7ZDdKhqWQKfRdMHG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSNLxbcRyegaHzkT9TI+/LQ1GY+eCPMWSMzFWdN569q3yAyl5Jn0IqnSgFJm3q2LFMvHi/nkWCB4tyZItyPscXXmyJfXN2DpnEzl5W3IFig9uUILmo41z3fMOc4m7I8lgKsa5LO3i0HgzRS/jdj5J3DXZTSdWRmjn9Ei2bjB8vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSRhJ2SE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxI+daC+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSRhJ2SE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LxI+daC+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AJvJ217288
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OiMBJyfncjVPEQgB7zWBcHtyC1QxrTuPfMovNL1aoRg=; b=VSRhJ2SEK+dupp55
	HeiuTk+fTYSsonaZgXiTwhr9URGuJafBsi5zy1RLSuptCGqrGJLKZjCpbRVL0jr6
	nPSH+Wj8gP6MAvUJYepH9FKqc6oUtFh5996IjBvUo9x5zHsIqgf9+TLnETQaRJ6Y
	8u3BwIgNYSV1ENYxVtEbsjmHzTTz69L854MXWcfKXGH7hhcJGRgBm3XgkS0XUv/u
	88a4VGws+7FeO3ftt5wXrSltdFoCV/KyYSgyUdKm3PW51TcqAaPVhFweqlDJ5Cm6
	u95weUWW/VP6Zu14XM1JHxgjtDnSBtfXfkaU1nT5T1/ksPKCMKPD5DWnYosW7qOK
	3DIOHg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr4fx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:59:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so3915571a12.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 22:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783922352; x=1784527152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiMBJyfncjVPEQgB7zWBcHtyC1QxrTuPfMovNL1aoRg=;
        b=LxI+daC+EEhQd987Eb1pHWggag3M04VuF6mgkN3TyWFxm3dvrECrbxK7pjNo1LqoMB
         ZP4U4rXWZl9meyHE7kGwJxXKsWquz7ZianYon3ixKk3jrk6Nh8255kqQraxeRRycjz/4
         ErlMF9S9asMalwnS78t5RIabv+unSPV4sdN23DlGt8f4P0K4aivQepQvrBara+sfjAC6
         v8rlMcI8AAJXbhJ9A8QzTDOtcSLEKG3085LIVLncX9AxiElvfT9TA2VmSDd7c6r0wP3e
         pBg5oISh4rtrw6bn/eg5PRWYCNEXAWxzIktt+wUrSsLGTh1bQX3iqA9zl7KJy37T4d0T
         Z79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922352; x=1784527152;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiMBJyfncjVPEQgB7zWBcHtyC1QxrTuPfMovNL1aoRg=;
        b=IRrIUB2xFWMlCCTlpeVBCQ/EpTtHTcJ/Jjdp+321+AO4+Ky3+1zMczqRDdTfuKYOLp
         X0NAk8vP0FXvTFRZtxsLHrLHZKP6CI72w2nICxKO8bedeDMfiR1ZM5m/TjgyBSLyKgZ6
         kAgHH5ZWlCajNdznumVWa52TiyGXWEMHNxgrwjs4qzvLexfLOzAFdbn1Rs7GONEpcBaZ
         2abm05nTxXFaVNmlsoeQbSQ4jgejO9SNECN18DJajqJOVQ15Cyp5xphW4pKZ5lL85esJ
         HsgMOfg9v+5F9SjOUD/9MDXR9RwGZ/UWu5InOC+d7SfJw28ZgcOtCemz9vbJhskJbP2r
         +uTg==
X-Forwarded-Encrypted: i=1; AHgh+RrUErOMeUGUU1KeX4pUGL01xiCc2RQ4vybFt2JTIj8DP4soxMvQBRSNkksHiI6sj4cwcWLBOHCB5AMu@vger.kernel.org
X-Gm-Message-State: AOJu0YxVBS1apHtpFdP5rCtmBFrjBJU9qjE+L41/TayhuYp3XHgSCue2
	kIj96bDAseW5FsO1zn1c16s3O42urgbR4bNsTPN4hloAIAdCX0b1tQQTQ0CZ0qQJwoAnd64XhPH
	JaZGsF3p61tBpWvyxbJPnpnejMvS0nX8EWJ7nDuR1g3qhYtMkuTmQw0pU2CafqCDU
X-Gm-Gg: AfdE7cnra8vocMry1oe8OWfNHKTLwd9oC8/4kYe4WkI+K/Ofbh7q5/46Oq7FldJ0u+W
	irillyf/IipenANvB3tcIIbXdzF7KF+IwHnthgiadtxgAWWmZbU+/qa+EvSfG8xlbORs3GNSzmL
	MJBXrm7ybLNAHnF8fTvz1FmuM7KVYONzW6yWuEsbW530Yje6W8EFTZ5S3JrIXiZUgI7fSSogAya
	nyE2ZnFJnTZG6CJ7IfjIwbDKDGRo1zRvk3Iovs7shIfCNnzRi++AQhET9ERg0eo/tpTEWGrVcY3
	mUqs7bJBcrxAIAhpdRPg0ASk94pp/dmxN89Y0hnqw6fySW8WcXbwz0U3d2n2FtTL/0/lljOkpIj
	ZkT9u5gHHKVWex71SuaxYi4xWk/gm5VmoZKnFRDvHzQFk
X-Received: by 2002:a05:6a21:3a85:b0:3bf:99fb:db96 with SMTP id adf61e73a8af0-3c110be06e4mr7512429637.49.1783922352242;
        Sun, 12 Jul 2026 22:59:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a85:b0:3bf:99fb:db96 with SMTP id adf61e73a8af0-3c110be06e4mr7512404637.49.1783922351644;
        Sun, 12 Jul 2026 22:59:11 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm112959204c88.14.2026.07.12.22.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 22:59:11 -0700 (PDT)
Message-ID: <6326fa2d-b42f-406a-b4ed-3f8b2c35723b@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:29:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <7GAZnP6jPoRrcDnaVzeaB98cONLhtvbiEXV1yD5MJJrA9pCnC9lmlSiCGA8vlDezSXADjmFiqo3ZdClO5SxCFA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
 <JSezSF-U8ovzmiyYmssD6k5kLWpRmD9rhrVrKPD1NLY5xKvjkGwoNBtuKpc8t8LhkFj4TSb9T8-gUiOXny-VWw==@protonmail.internalid>
 <f0fa6acb-2d70-4154-96e0-09e88af129e3@oss.qualcomm.com>
 <1c652464-32b7-4411-8ed2-2885234513cc@kernel.org>
 <95a091d8-1b6b-4510-838f-2cd26ad54eff@oss.qualcomm.com>
 <wyheslzmyi3wsocqtvjpiqjsd5kl5m6at4e4rxoa7tj3ej4cju@vpua43i3rtpe>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <wyheslzmyi3wsocqtvjpiqjsd5kl5m6at4e4rxoa7tj3ej4cju@vpua43i3rtpe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2MCBTYWx0ZWRfXw54+doxS2Cmr
 oVxEAnMYGT7G5m3d2ZPyQEu8YcsREmYkg/2SkTSO4LTToPwlsFHSOJGnb1MFrEztbbeCvXJnqOg
 P7XKRcSt/SE4EG7CRRzMpyGTSyq06Wg=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a547eb0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=su9Nt3zpQreRNCexbPwA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Mi_ZfAlJw4LklP3-PKWTHcAVt1pgaFBs
X-Proofpoint-ORIG-GUID: Mi_ZfAlJw4LklP3-PKWTHcAVt1pgaFBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2MCBTYWx0ZWRfXzokPw54AuISZ
 0a5eAtOje+4HiO6ZGjM2gQwePH1WmslZSpsTEi6LUVX0wNWDOfnCKXAKIqkVyJwIDTrru3Mom+i
 lbAW+zG9lMjz0rNs8GU9HtyPqAWpuYFPhOHOcW4HPffmlii2EsEbncJ36h98DOXkKA6o94dM5tr
 ajpWKlnXh++JpRj0ksJUEn4ioVD98oRetX4DS7D8gK7vHvvbKHQkneFmegsBAoW4+uRw11F+cJP
 nLfYxdu8ibugBgCSehoBAPhbXrRVVN2z8cq2qqx+v8a8c7tAscGUf5lLRr+EVN4dPBSksv7OOJc
 Fei+H8aQiWCJVqvefIlQUqCHD2puHqZ8DNOdzI4IyW05viE1l8PQzmcitFYxxnSAbxHWtoDVY1G
 6QWw2EQfThhHpYRRahOBKaM1R+HUrmZPBWHU/pMPosWPhz6TAfNMuZI6WG+/3uwDzPKosB1LiDb
 gqTHAIQlEmMc8cPHBhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130060



On 7/12/2026 5:54 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 10, 2026 at 07:32:35PM +0530, Vikash Garodia wrote:
>>
>> On 7/10/2026 7:08 PM, Bryan O'Donoghue wrote:
>>> On 10/07/2026 14:36, Vikash Garodia wrote:
>>>>> What's the addressable range with sub-nodes ?
>>>>>
>>>>> The original problem you were trying to solve was the total addressable
>>>>> size - this other problem here segmenting the linear allocation space is
>>>>> adjacent but not the same thing.
>>>>>
>>>>> Without digging through all of the patches here - my question is does
>>>>> the original sub-node addressable space problem get resolved in your
>>>>> proposal here ?
>>>> The proposal solves both the problem we have so far - total addressable
>>>> size as well as which segment (or range) in that is_not_ addressable.
>>>
>>> So if I can distill this.
>>>
>>> You're proposing two objects in the DT one for each relevant IOMMU SID
>>> and then the driver will register two different devices to get the full
>>> range addresses ?
>>
>> yes, alongwith the _non_ addressable range specific to that object, to avoid
>> the device crash.
> 
> If one of the subtypes can address the whole range, why do we need a
> separate subnode and a separate device for it?
> 

One range for all streams cannot be applied here. VPU streams need 
different ranges for different one, for ex.
pixel stream - 0-3.5GB
non-pixel stream - 600MB-3.5GB
secure non pixel stream - 0 - 600MB
secure pixel - 0 - 3.5GB

Regards,
Vikash

