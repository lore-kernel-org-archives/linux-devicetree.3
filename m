Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4EB4DA53F
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783620989; cv=none; b=ddVT0twONuL6mkUdH0d3pyV/GiG0mlpscJtHq9A9ISkwyp5635rdo441wkQNXEagpaFPQjcnpo3ROSU78lWDLPwXxYpJhezVGIxdmHbDOsLDtPmLE25BpQFuHtLA5dQZvJDjtxU+KYXs3badZ7Tqf4fCYonZTkq2L46BFadMoeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783620989; c=relaxed/simple;
	bh=wqiNn6l+nDl9A1NisYGFeyajtfJ+i8wmLRbKPTQb5bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9uAjJ4459+g9sSCqdyyWi19dGRiG+/aNwj0tzLBUpxNWu4M53SCZfV5FlqKiBwrohirpxYbLyfZFISa5kX2vyq23Dhg3Zb8/wUdQCIw6bjEGJpRJIzLjJ96mPOJQBN5Fm1kLbBf9SkyCq/EXd3iozm21sjhfiLNkaOTonoxFnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkNM5xFW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpISSxF2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkNM5xFW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpISSxF2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXLTn2421978
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9vlF2zZNrxlsHq6GtF5qElMhuMkGK6oe8/BkTAPX8A=; b=IkNM5xFWZ/N7jHQd
	T4n4/bJmwZSR3bydOHT3YibXPF17tJtrblBQ0FRLVV3SSbBWT2Zf4X3Rwby5f/9n
	uyZDTKYdZ4xougsH5v3JTIV/HFZLBk3NKBPquU2ppBZDFSUZ6BF9a9QdLh9sjBQO
	eKfzqJdlIf/3gIWWVSX97oLMMJD5CqNfyaDEdXA4guziwYBJNiVOR7FULfoWOJiJ
	eunGZDEoU98dmsbZv7E0yOW3qu3k0SggAskocKrS5Js8sRoXrojHwdLogdXhoVfK
	icPOtAbr5EZm9NRM47mhDRii1JnKw1WYqZ/mt402XRsO4yElDxOmVOEMYM6N54xT
	5O7aDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj90wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:16:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6cb57d25so2286085a.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783620986; x=1784225786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9vlF2zZNrxlsHq6GtF5qElMhuMkGK6oe8/BkTAPX8A=;
        b=CpISSxF2uv/DlgIBbHBi+FqnjA7Myc4nlyMvhfAuU9EvjGyhQ6IaK553fnDb118k3a
         Q3IRt+VRBIzzuR0QQRO+zBGK8q/hYwIGsifwUmeF3+YcNoOCNaiSv/6DcgvTGK0/U8qq
         O47CV4R5Cv0MTubn+jnjAESNPgpwEcgklH9I5WqqpIUDgoWIWa+HtcXxf9mcLgf32dsT
         6kVrmw29ANbbcO6+nIpA6bpoQdDbSwvgTGq0xUP5GDUly3uLktDtMX55vBGdIXbWCe0V
         X8vyBWnYwQrrKI7555VOZ5bYxULlCzuC8krm7C6p35xQu8PYGB1Fh1bMrRau8ZzSQ7GX
         +Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783620986; x=1784225786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9vlF2zZNrxlsHq6GtF5qElMhuMkGK6oe8/BkTAPX8A=;
        b=mqy1PvMxOLDWRpG3PT2r8RO2Yxf8g7NcD/F32y9FCc+2aFvgrRySgpPiBws6fZwHCe
         sGgOn3O+drASFpH35VAxUYILmeOxJ+VxAt6iMG4xSfNjRdiFX4G4UB62Q8Hm1XYwqgs0
         eZtSSaEJdd6ZRTHjg/3mA+7iJHYKEA+pf/nYZQOK7OZyHi33ZT6zZ8N6k76reU3yzFbk
         ScUWvDDqmM/kJipYjju884iY3oHdD7WtPRhQ2Fz6iNsSNL1DdSjxp+VxuNNDleI48y8Y
         NM2/kkyYXYjc0A+9ase9zexle46y0jSkP+mlpUs+lGOtGJI0VuyHmFIa8CB+1xhx0Mxt
         7NWg==
X-Forwarded-Encrypted: i=1; AHgh+RoOe8XF6v52WkAmEC4hE6s2AgW3mK7FIuu8TXDNVm2tgDDgIQiaPwvXb++pAUIme6mjCO9mxM3javKi@vger.kernel.org
X-Gm-Message-State: AOJu0YyIY/WvfbC/fcw2gNZWHtfo+/Qr5/huFbc2brn/jeVMSSU+dBxD
	TaAJOdAKqazCsu1iKjifeRQbrLOqQ/P2t0Z6j1cOaMD/hh/sLOYEpd18YrRFZguyZpajujICPkh
	4VoJTWs/9lpGm5WNYZ7zzCkKfjz+F7PvGD4mFUSoGtLkwsRbAg+09quHciXi8PaWH
X-Gm-Gg: AfdE7clyrwUsjZ/Ij0/O9eCN9ibibvlRM3rPw2trvarAvoeB5NVOMX6r4nwuQ1UD7Yz
	bKN/6Bbp6E7Xl4JGRIKsSD9nPOYdJSDeUz3YOwqix6SM5qxymjgzcS+DpcyrdOKH/vebpHtCnoW
	tozxIaqTZWpmJetQgfMvERBKm+NetSWmywqPbD4I8EFtObM6H+vBGR3/bO3C+YPq9BUFEwBGDFc
	I8Xy+31R8kD4FyPDPBfhjTfANjCuicLh6hTL3Zg82Ohvh/8QAcAwPm7lfG/ZB/6syYQmbIbn3E2
	YLuYqz39XhgesO5/V32+yu4RBGXSEXJVSuU/xP9//vD/OFlXY8/WxCZqwICDzJImu9faELQ64b3
	6L/6N6PGYq2QCzZ3Iu35SsNCMaBEEKvnitfw=
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr444079385a.0.1783620985909;
        Thu, 09 Jul 2026 11:16:25 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr444076185a.0.1783620985462;
        Thu, 09 Jul 2026 11:16:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15db22ed68sm233609766b.35.2026.07.09.11.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:16:24 -0700 (PDT)
Message-ID: <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:16:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX6xnM+i/6AWCI
 nbuKG4k+tz0tAyL6IE3XdzD50DKWlIjIpNRGLFsr2zaM1L8x4DWnu3IqPHYP8CFi4iA/O+NCyjY
 GgnHZ0o6Rc5TQI9QcJKp5oKTiLm/KvXF+khW4PM8pJbHA0pSg92EvDhAlMaPTF1gf8J01UlO7bu
 UezOd4vuRj8DMfEvljuDxVOFCFB+TU/3u8XdcqvCe34y+Wo+wxc9p3rKVyDchc9xxLNzySzcvzM
 q897Elq0EPtIZTgdoxtthcmSchWSxaDGdgOmdpvpPOLgzJxX0fHGX7v+iRRF9N2AAybBqzous3Z
 rSYHWqpr8u2nCEXbh1yUjJ48f68vjJbE5pTwQNb2/Fk5QZVUWNueRZcyotzdV059cNtU6bEsQw5
 OQCSddtNwv9od5pfv6GYnl2JFudjMTvgVgswvxsBJ3Vh/HEOIPUD9dXpmSWevxgN/tXxux2EE2o
 8WFc1gZAOAj/qltPOeA==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4fe57a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=02blghMF5h8Ooo6bNK0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jOmSHHrDovMyKfHKVi-dBkg4VIiOXwo0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX9tWa0tSymQ4J
 sblcpFaN/BzbWA4RTCNrSIugmdjLEv5FoKHCC4LguNeVkhGWTxgHkauCRTD9xXI+dQOlzFneh42
 Pk4EVoqzi6G3nLJhJEQfmiVFt3Q8JG8=
X-Proofpoint-ORIG-GUID: jOmSHHrDovMyKfHKVi-dBkg4VIiOXwo0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090179

On 7/9/26 9:33 AM, Dmitry Baryshkov wrote:
> On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
>> On 08/07/2026 13:19, Konrad Dybcio wrote:
>>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
>>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
>>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
>>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
>>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>>> [...]
>>>
>>>> OK, I can see how this thread is confusing.
>>>>
>>>> The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
>>>>
>>>> Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
>>>>
>>>> OTOH we_want_ to make the top-level binding into a bus, we've discussed that several times.
>>>>
>>>> To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
>>>>
>>>> Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
>>>>
>>>> That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.
>>> I think this needlessly increases the amount of combinations we'll
>>> have to keep supporting down the line (with a ton of compatibility
>>> boilerplate code)
>>>
>>> Konrad
>>
>> Fine.
>>
>> Lets drop the bus idea then. I'm happy to close the conversation as
>> peer-nodes.
> 
> It think, this would close the path for upgrading existing platforms to
> split the driver / bindings. If all IFE / PHY / etc. are subnodes of the
> CAMSS, it is easy to play backwards compatibility tricks and
> reinstantiate devices on the fly, pick up only certain resources, etc.
> 
> If they are sibling nodes, it becomes much more complicated.
> 
> I might be wrong here. Maybe we really should try a simple (heh)
> experiment. We have your series which adds CSI PHY as a first class
> citizen. And we have existing platforms where CSI PHYs were packed into
> the camss node (and camss driver FWIW).
> 
> Which way of representing device nodes makes it easier to migrate
> existing platform to the CSI PHY driver, while keeping compatibility
> with old DTs (yeah, ABI, old DTs must continue to work)?

Quite frankly, I don't consider the existing (meganode) description
any valid, and would vote to rip it the second a replacement is
available. But once, not N times.

This is not to blame any of the original implementers, this might
have seemed like the right idea for the tiny subsystem on msm8916.

Konrad
