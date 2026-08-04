Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B213AFD19
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 05:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785822274; cv=none; b=ZRotyEwv48s9wiRYm5ABQFWf6sv7hP1KdjAZMFSYVVBZ+KrmMuyBIa/qIsYD9iRIKID5svsRTyoVvdR/JYpjaBnsPcN6hB3uD19+oAED5jLr0urWS5P+joH9oQ2NoxbgI4NDGm8cZUOCHcwfp3XHWzmljTx/y7YB38rramaWbZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785822274; c=relaxed/simple;
	bh=8e13T+HKOw7TVI5KQwQpf9L+RgEH6OJxg8EWPWSmD9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpZieQO8JyZoNFTd/i8Ymz7OowaGOWkbFcPF/fS2UtyjBlq9xgoPOsYMxDWQscSixrQqat2L8YWlfr+pnVTFJKsZblpBajAVIxcTA/PVjBdRub3ydbEkr0l04xzvak50vNV4Uqpis6Oe765ZYOhIgDUN/hZLJOJNejw8O2znUbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwTBLo4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iyVtBVzY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwTBLo4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iyVtBVzY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67416rlN2027993
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 05:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aawYV5kAKmfenytDI/U9JzQyVoCP49xyxhRjF2TNj/A=; b=OwTBLo4VFEKg1Ofe
	blx1j7JINANM8PRhjWVoTr0Yy43gzYXJQJiDCq4B04bN7BGjC2O/kDDJah5cu101
	OT0bEGmIoIWSKcsBT+ObPWbgDELGddGLsP7E87Hc1VCTY403HbO/vIOUu74xRb9v
	3pbY3Pm5Au77E0+eA599PYr81V1N3MIzKPXIbLSRCVsgGWWJEZCd7dV63/5q8chW
	Yt95R7C+eKiNBfYmeSi7Z3iwdVbr65YOLI//B13eDhh+BozAMmhCzftx6/hB3VQd
	Z5HnsPBwxNTvHg1UWtHL5lQTeceFmUa513ZUb2UWmbq+XtoEsZ0XefREoYfYKZgh
	pt3IXQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu2syhkx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:44:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so43810511cf.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 22:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785822271; x=1786427071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aawYV5kAKmfenytDI/U9JzQyVoCP49xyxhRjF2TNj/A=;
        b=iyVtBVzYTDTcsSQnk0A6plAlU42L8SYSCnAgUzSFmj4Rowrz5WaCc7tAMOmFdUyk22
         R94Qe6hP4SejyyWvPD1H8ClbGNSB+n1c8GCQxU6z3Db9zZQ9OGJ4E3jnq0mVLVy51GFH
         bOxBICnZP7jnP4NmCyucaojD1XieH4flz+az8DinSCOZbN2lYRB9OmDrbMPuqx5VlHm2
         4QxL6qgnCW0R0O1wdsSLOl/LK8VIM+PgYokWRvhwABdvQ1vfX3evykxCXyzBM+RttX8N
         m2GQtBSusgOS252DuXqSz7XRv4HjvhoZNS7aflTXRRkTSdNN8CLYpyf4Lz6KkelVwAZp
         zJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785822271; x=1786427071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aawYV5kAKmfenytDI/U9JzQyVoCP49xyxhRjF2TNj/A=;
        b=Qc3F7WZFQHawwWHRdOMCCLC11OlAU0PAWFnT+uAp3F9klaekufyoj1V6fYJmkiLZxy
         K9BVHEbEKqwvMNTQ64ML8xFIITcsmtAh3YMSPJVuBZnBhsPbNlhGSD/4sWS2dSATpcOT
         uraFqIonR1gc6Qcaa1rk5ulUS0VRvj3rULUtE17QN6bN73nUb+DFYEo+BpR7tWz1Ay6T
         o65UHiv+L5xVNc8VF7ShgRCAm6W+FBO6N5Jjie32oj9k8LzYxgnOTALXRlmWI9zlnuNt
         9xQ0cEmh/rnbGWkXaaLCbit7JovGR8831Hqofih1FmuvT6eNxTx3i7ZbTJBQCsO/rFf0
         m8FQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEfqtWCuHsq50WCDv4BHS9243RQUWompXpV/pTUyOw/630ftVlk0HxFOZEd8E1tzhzIBjlAPy5ugDm@vger.kernel.org
X-Gm-Message-State: AOJu0YyEapvDOG/xsDVkNGc9FmdFBfGdTi35mYjZ1nyPooEPypnKjHcm
	QO7L9+5VEpEdA6X9xhuX504C9Sahh3xpNknAOp5GtvSlOwdDer5NzijMp5DQqSZvYtGnhffHYsn
	e+q6XhMD4PRJn/MFRElyOXx8Dw+9FCLHbU0ejnmsYEt5ix+HQVRV04kd/Tldc9JF8
X-Gm-Gg: AR+sD13XIeGtRc5fwIDaJ+z5EF+qZjUWKjTsr+qEgjf/7tb/iBKtwkunMGa84UyWCw8
	oVFKqfKBt8+RX9ydYeRKtQMs2pY41++taIoKdR5hJ+lnD+AA1wyzDbiPDWrb5L/3n+LZKJqpF0r
	zYeV/Sd69tl+GgdTvaNQ3J3F9uwTWpTVPO5pNYzNF0OC3DH9Gu+TukJR9b3HMXy/V1uDWh+8Kwl
	SE+KSt2eclDJV2Dd/kgqDfdjAIlvQPYbR1WTrOIah+4d+XAtwqxmAJcuiZt7qO2voQ+r6USuqUI
	IVeTVmp2rPG4MP5RJwmr5N86zA6O/aCujTZiU9NqUNLJeOfT0tzQ74CsZ0udpeeWfLfu8gF2AIW
	GcFBv2UxjEn7GxzuTw7w/qtHTt56HQ9AQ/amW96fBpc2hJeLjGSlehQIz2fOzn/OMWC+5qFH0
X-Received: by 2002:a05:622a:5c0e:b0:516:d699:a99b with SMTP id d75a77b69052e-52b567d89e7mr277824821cf.40.1785822270913;
        Mon, 03 Aug 2026 22:44:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0e:b0:516:d699:a99b with SMTP id d75a77b69052e-52b567d89e7mr277824501cf.40.1785822270355;
        Mon, 03 Aug 2026 22:44:30 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5ae9fsm646835966b.7.2026.08.03.22.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 22:44:29 -0700 (PDT)
Message-ID: <cff2cfb1-619b-4f93-b6dc-f7f34a66bdec@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 08:44:25 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <qje2bZKWSzkQQGDw0traOE7SqoXhCBLeDrilCooH6Vh6cYeFWAh_VyhqspJuzVs3iA4ye2U75aZHsVGorNPjPQ==@protonmail.internalid>
 <476aee61-015f-4793-9be7-a102c1c3e811@oss.qualcomm.com>
 <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
 <mpiuqkxaq4bvz4pc7iug3aoar5jkxz4tpetbg72olrzfar4zlc@w7sgfwfksl4r>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <mpiuqkxaq4bvz4pc7iug3aoar5jkxz4tpetbg72olrzfar4zlc@w7sgfwfksl4r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TIh1jVla c=1 sm=1 tr=0 ts=6a717c40 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3JPs_qAUubFRTmJlbQsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA0MyBTYWx0ZWRfX55HS8F1rT/kO
 hUHyLJJkftfBhqU5ukYiccqMIPJXFE6VRqzEeHyX3qag+M/iLwqxTvkeemnzimYjUpF4pvdbrEC
 Womk5PyT9lsfjt5b03zJjRWvGTu+rEg=
X-Proofpoint-ORIG-GUID: fnR_0WSsxyl5YynO3iCLsRQnr8sDYkHH
X-Proofpoint-GUID: fnR_0WSsxyl5YynO3iCLsRQnr8sDYkHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA0MyBTYWx0ZWRfX5Izqai9vsqLb
 2aT2COEPl3U8aSWS71+Vl5qT04KFuSnAGzOHjofAFYud7yFTNepX3FCZZJQ09FABTedpxKp6fnV
 je13xvgBQr+34qAXurwZzzGgpQ/NFLGNV46nM25RUE1YAdCx6cANcfP/q+x/Im8+jVqq8LdXxoR
 y9w+2A/Z42OQHywfMdKmvffOQAJNC763Y8WBFsVCpo5dPuIzqyetLD8MNsHMdO8ZYPYSB0DU4U/
 zQZ+Mf2W0hKqsw5aFxuAIssJ7uW+uEe5HELIQZ0lvbSejWOss6mKfVHWpT90BmbX6vSyckBlyYP
 76UuEifVwp8muPfZZ+J5rtSsvo8uSFjZUp9ss1P+KJPR8SnzvxC85OSxH0m5h8fooBfOl04BrBs
 e9w/mh5xwfHfVwhkEzwZ4FF/h1vlDCr39lxcHH8NigI72h2yKuQwFNxGrnerIFLetafgsTnJLQT
 tb0yExXBsbKzzYh0HGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040043

Hi Dmitry,

On 8/3/2026 10:09 PM, Dmitry Baryshkov wrote:
> On Sat, Aug 01, 2026 at 11:04:10AM +0100, Bryan O'Donoghue wrote:
>> On 31/07/2026 20:30, Gjorgji Rosikopulos (Consultant) wrote:
>>>>> Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
>>>>> please drop separate mmcx vote here and let it come through the
>>>>> titan_top (it might require camcc driver and node modifications).
>>>>>
>>>> The change was requested by Brian, most likely in connection with
>>>> upcoming migrations. I think he would be able to explain the exact
>>>> reasons. As far as the facts are concerned, this is not currently
>>>> necessary for the driver to be functional.
>>> In the documentation we have this jpeg block need only TITAN_TOP_GDSC power domain.
>>> However Bryan request to ad MMCX and MX.
>>> As i can see same is for csiphy. Maybe is better to sync with Bryan.
>>
>> Check hamoa - I believe it is the case there's a separate vote required for
>> MMCX/MXA.
> 
> Assuming TITAN_TOP gates MMCX to the whole camera block (please correct
> me if I'm wrong), why do we need a separate vote on MMCX? I might be
> missing something here, sorry.

Honestly i really don't know, i am trying reach to correct people(find proper documentation) 
for this. From what i have in the jpeg documentation only power domain which is required,
for jpeg core is TITAN_TOP for sm8250, i did not check the other platforms.

~Gjorgji

> 
>>
>> I'm prefectly fine if all that is required on kona is titan_top_gdsc but,
>> basically I'm asking _you_ to go verify the difference and come back with an
>> answer.
>>
>> "Not required for Kona we checked" - its not about being asked its about
>> checking what's actually required, I'm highlighting this because sm8550
>> perhaps and hamoa definitely are different.
>>
>> All of this is in the power-tree documentation. Please find the place where
>> the power-rails are stipulated for venus/iris and then check to see what's
>> required for the titan block and represent all of the necessary rails in the
>> jpeg@{} such that jpeg@{} can run standalone without any of the rest of the
>> block switched on.
>>
>> I'll trust your diligence in that.
>>
>> ---
>> bod
> 

