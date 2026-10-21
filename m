Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594057;
	b=VyBPGkVSM5KvFI0u1cL++/XzI33KGVjLLi/xKrAElA8MBdRAW1TQXOxvcs2gl+dPuhPY
	 QvdQSDpYZBVOr6NeF1IXWj9tH8DtVXs3dh5VV6Ktr9Sf8dGrI3POXFmlIRPBS/E7KXMMk
	 fZKwEEQ7orQ2D9AYpl1UOBup7Te8gmPAE784JHU5Il3OIR+Z6r2lWenIkqFKwsUMNL9cg
	 ENBQ8c5BwvKlE5XLPjnT43OhoEzTRMaIABgSmp34o8M9Su2rgiOMM07D+64xDVuknvpOz
	 ORfQ6MlI9JflsKohgiWAzN2dsxPYYLoo3z6n5UWSmaQG7LNgg2gDXu3F/BGKsaff3gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AyeYzDYt4cAMFd1jhQBvi9BO1/zfrHrFy98deBZRgJk=;
	b=LkuZiVZ9HM0zRVyIOjG7cU0jdNX0dgwAf91xSHyOzGhLWe4RhsgF08ntIbth5inE4/ew
	 G9+DhTODVPybiU5aKvTfnnNzzUnb1JUrxoyLwi/rU6pr3mH0jjVSamD4KJ7Z4rgsm3bzU
	 2y2X4C2V+JDDxHyanVZJMJSCZp5DVLQAL28fX6ZEpWW9RwgJ985j99uZnB/sMrYG3gPg0
	 llaB21gXjqnOqk5G9oIo0FQtJYXw6bUeFLrftBnZHnwp+ja0eqluEfoIsoJdNto/M0k+E
	 Owb9jJDjWO2kU97R6Jl0j+Fg5/YusZK2mSyMBoRTKOxK3d1gFll9xn8g90umHxbFBUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WQjuwJ7m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O33eyoqK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D705606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D705606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WQjuwJ7m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O33eyoqK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFF2F1903405
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyeYzDYt4cAMFd1jhQBvi9BO1/zfrHrFy98deBZRgJk=; b=WQjuwJ7mva7l4S0u
	1n6h5f1vWLqkLfPrN1jxiFO8cOcbeZNyfrs37ynpbHAbqI8jaMuwuSYKK9QL45hm
	NHLwikBNOpE9tu2ao4ji4SqZU4Ojt9m7aZm06zD3v2GUUrOzzeVpcYIrNbOlo4Et
	oDHBW64tRIgiBxH80KXBauGO9z8n18F/F71R0oFG09L/Q07fHct7on4BamJpjfyA
	ED2yba+o9UZ7nQgatiLUOgyF2gQJTxwrcm1/fPTsJKtW7GyteXqrDSIVPrY8VPnl
	pqenldnqATZdvx3HbnG7MNmMIXw6Ha6+5FsqcG1x/uen/V5Da3eThBbK/Y/SosnF
	zxBCAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4vfqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:47:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so266075685a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792594055; x=1793198855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AyeYzDYt4cAMFd1jhQBvi9BO1/zfrHrFy98deBZRgJk=;
        b=O33eyoqKxzUoNy/Dhjy5H+sbEDZsbHjQFNR9whkoh6+/ohu/4AwfzWv3C02owKHQHI
         IyxR3bb5idg4run51/MsJuXN1/mz0k4FmVgNxX1fh3OEXZ0LT0hRaz6EvuYzFz7wQMFR
         +0G6k+uI4/9tljX5TmLYtJvQctNt7arao/cH/iNMTq55iKTrUiz9rFfKRrr9EJvITkWi
         /aqlZJFdF00uhYdd4rRrFdw9beCovUsTevnF+tOBE66Uu8MNE/Qn31G35F0FaGb8n069
         56FNmfFLofdIjrCzbfahkbQoHCrpW0Ngv3tbGA/3yAE+yYshIGUv2JL0aL1rho01Z7Ew
         CVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594055; x=1793198855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyeYzDYt4cAMFd1jhQBvi9BO1/zfrHrFy98deBZRgJk=;
        b=gGOsncOjxKg4gVN1VgKwsd8WqlFjG8/m0rVxxwhFfzec3sQQ45fZE29uKz8qAa9khK
         gAdf/fXFa/yiMP2Kh9uH2HxpzoH6phGVFuun3aAM+hwgure+U6aoV9YYtgWD8/nT/xEW
         IdTRcy06SjP9dEdCjyADgRpIjsuq+QIQznK2vrxswhL5lOH5TVVMxtgrb9MX9zsnz50f
         Dv7uVO0qgPTjK7i6wVPgO45S3Cf+GkjL6TLCd5DqKEzQCrkB12ZVNI8ALOPDTIBXER0v
         L6yoRGxL8vtd+ha5SgaE6XjLKFG29m595tGJ3dBwmWh6Ef6y133BaDNM/o6boP8NzGFA
         4Aaw==
X-Forwarded-Encrypted: i=1; AKwUvBzYrKqNkMw6j+IQfpqTgGUUSaL0nYU8qBztwtcIMaL29DgbpaigbxsbPocPu6JHAuHb2Rz0oj+hNj0z@vger.kernel.org
X-Gm-Message-State: AFq9FYLp903bteo3DCZcrQiwVUOcbuI6qKXljmE/ApdMemuyizGQgT7V
	5I5vrgsPDGaRtjK6SU00AmzS45wA06WRLV03mQ6cqCRZx+bULpuOhCkHrlNDRwN3nBY700QKT3H
	5YOF4ObRbA6+9UZ/Urgsyj68Iui3vrgSmmNKuzBGDBRhxpwh2z3Vrdu/3ChDELW9C
X-Gm-Gg: AYBFou23nrY807Jj4AQSzd6a/oq+CzjLznuqawJEPYLYDWI/t2KrXIROY5MH1/1JvAF
	ZH1DaxR0Ua9acJrePN38dfsTScJd2+Qdwwkvz7DPWr8wGkIRSr7o4oTJz4f8QxWtP0BsoMvZydO
	E00L167KjknPHgQQCUo+HS19PFv72PUIyKkvbzcXuK+I1LA5JmyhRymbSqTwQ4Qn/2qDQj8utTO
	JeR1chIIH43edTuYDHnYQMjJzGjbfHpiHP8DoXK62P3V3iCFWQtnRpm70LKYzz0pJNaZQTYdkUh
	fU9v1vuiktkaSWq0aAky43FMbfI0TywK+eYVpBCyg7HhCBJw7VjQ7W7Yeb9WoJN31CwEC0Zx91l
	0ogDZpOdCjqMMcA/rSxQ3KkBJE0yTBBkeuEuCJTYWt0vTtJvHIcEVNpv/4gQ=
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr426545785a.81.1792594054706;
        Wed, 21 Oct 2026 07:47:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr426540885a.81.1792594054089;
        Wed, 21 Oct 2026 07:47:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8d9e:b00d:491:1503? ([2a05:6e02:1041:c10:8d9e:b00d:491:1503])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm5814797f8f.22.2026.10.21.07.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:47:32 -0700 (PDT)
Message-ID: <f223c867-fca5-44f2-9cc8-dd3ca99e1387@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:47:31 +0200
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
Subject: Re: [PATCH] thermal: Share THERMAL_NO_LIMIT between kernel and DT
 bindings
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021134243.35103-1-daniel.lezcano@oss.qualcomm.com>
 <CAJZ5v0g5a+0eaULxGG=RFm=JN8Gh3_A=7mGUTmFUiXsxVKvpDQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0g5a+0eaULxGG=RFm=JN8Gh3_A=7mGUTmFUiXsxVKvpDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YrwLkI8yVKi5h1yv8tvRbcpl890c_Un1
X-Proofpoint-GUID: YrwLkI8yVKi5h1yv8tvRbcpl890c_Un1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1OCBTYWx0ZWRfXyCIxwb+3ajS5
 /RayIyKVOjEsLUGbXGZZiy1NTcuxX0SPOZDfK9afA6hX8flf9ykQ/09lftxFTpMWvtsKoQp5usb
 071XmNXbPzRYk93p8EI8ZieSKM5oIAs=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8d087 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1H47zwKHx6KseS8sNJwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1OCBTYWx0ZWRfX8ojrhVDDt+Tz
 nvD3oKSZrC/yqLVwxpAUwoiPUeJpujfuafO863eCc/XdwATcBby10014FjyGlV5djICsDw4fgNg
 LZBIPO+1HfIgWLd2rZRjT1cxACO0RLaMAvmi6kj9vh0sGtaxvkvGWrbNmXvWQGsBB0XpRTIXg7o
 gEasdcqwNMOK6MjECoowFkhnMQhULAr+5G8Iyz+05wZUkVitvsQVOjUBUenqeYOOCYkLBPVw1cO
 c9QKfQOIcM/jzYRfPokJ/UA5JpWIpS1HJs/emyhRucmAWkH9o/Bj+tAtaEgHghjmgBYD4LqMXdX
 ZLMLS4qCT6wwl4AZRZ3CBOzmwfdpWeFJANLbv0hkxf9tvF/2LKu5j/J9kOv28Pqnmsn380oANvl
 6vtYeO3Cr3hQOrPbW5U9CbiCV35htaSvg/bPDG7z9cachfPFaPYwdVwndDMTzz/pM6YIfvkZ+Lk
 PJuIN21k/rY8PQMVXpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210058

On 10/21/26 15:48, Rafael J. Wysocki (Intel) wrote:
> On Wed, Oct 21, 2026 at 3:43 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>> THERMAL_NO_LIMIT is defined separately in the thermal core and the DT
>> bindings, using different expressions for the same no-limit sentinel.
>>
>> Define it as 0xffffffff in the DT bindings header and include that
>> header from linux/thermal.h. Remove the duplicate kernel definition so
>> both interfaces use the same unsigned 32-bit value while preserving
>> the existing DT encoding.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> But THERMAL_NO_LIMIT is also used by the core on systems without DT,
> so why is defining it in DT bindings not confusing?

Yes, you are right. I missed ACPI relies on the THERMAL_NO_LIMIT default 
for the cooling spec
