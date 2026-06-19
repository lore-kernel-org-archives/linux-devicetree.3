Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191EC3546FA
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882120; cv=none; b=N3UG6zn2t9M1nJtsBevTKFKNttC8Pf3awjTYDuK/1sTtqEIvBWcSm328IMrqAPcV4uIvCziu+0nFeLdKcf21isA5Z4+qxe/18HetQWMs8V8cCB24cjbjdwXmOJmwiXv2066Oa+273fYLfZazhmAxxbXppvQwYkXcS41e/uMleko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882120; c=relaxed/simple;
	bh=/sLFkoQtI+WbaO+DA0v226vFfEE7WVVyAp/OcA12LRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m48KePGmCIWDDmlnmTGBgfoL28S5w0keur55qeljCP6d//Rz+jc9Pa/BJA8YIbfN0n1RallahOeRonkpvbt7nmDUBRD2TvNOEl40AeqKtyuJgUC+k3Org/Sy9mGmAlDqxiEZYp5WNU45YLeg04Ot5nKBkD5R7RXDC8K2RpVuBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdWn20E6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFzXqcZ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdWn20E6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFzXqcZ9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDCU5O593414
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvm7EW1AZ3kby+gfRTDdQGVNrJ/dblRehYXBCDNmPIU=; b=kdWn20E6Dy7hTtX3
	eUjFJSoMcs9DrxAI+WrgPpm0ktgwPGhUYvgzCpllWZEX2gtSyEHFYhjsKRq6yNaD
	WyEiDBE2KUgtXhOrVqywTMAkNaPa2N8JQBKsI9mfAGf8I9H/ba4Eu/cXQVB/0qdx
	dkj8vW4XXKCZI3smkEY6l02Lhn7CX9KR4bZs/dWSgKAQ6nvkkN+Sr2JhTyH4/AzH
	x0OF5GsS9De8HEyeQZM6u9CzWD/cJYMpDTQtNtm1RWXfjCUyxpaUknp2qdPltjSs
	8N+B6CPN3Qm6Lxrnj9O1CWG+mZAflcN1ZeydwaSHVrbXa1uc6+iVszuyIvZKdSb9
	1CbZuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sbr16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:15:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-920f826bcb4so13874085a.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781882117; x=1782486917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvm7EW1AZ3kby+gfRTDdQGVNrJ/dblRehYXBCDNmPIU=;
        b=IFzXqcZ959hhXiy1ZOpdnJfLRTHg57zIqyhVp1ERRXKcv9e4azaq7m/AMrNp2qglOL
         s/ogXDiZzRUJZ2ds47hYNWc5pRVoXVpO4mCjbEwoMQ7JYSCSNdQyRvHTsU7jJvEkAJzD
         v2BhHhy1nm7SB9i5nbHvFreKkKitSpaql3z0MMavS4zQuHZqe7dwhlZ7uc8BhLfy3Ra9
         JOuH+kSiJiCFbnK+zmkHInnCheK6xn9phQ2SxXEYDrhmIKWvpXKwsFc5VAidl1+ajdcS
         AS6BzAgn6vetcmxbdRGSAsDIPH9UB7eWM4OvvPUNXELjgXcBei9T1V4OKJGO8za3Yhef
         KvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781882117; x=1782486917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvm7EW1AZ3kby+gfRTDdQGVNrJ/dblRehYXBCDNmPIU=;
        b=NPzPrTy6nVdYBNb4xhggAdN3SofXBa9Anwt8W4vLImL2mOjwNYoC+aO3CAnGWaII2w
         F/YeWSwsnhMcqjvSSRq9Kj8O1rnQNiy15Xc3W+ioeZ8Olq8AO2Rhpg2y03RnI26pMrt1
         mrLvm1lKaKiIgO5Yll78NzJQhIEjdQvnofBXNtIzet3fVFyaRbF2o3W5nWoxO0d32Q5W
         yYS6+hw3aDDSDN01vHqgVtlcCwnPLqJeDP7saKxZTjtHw5RB1NM7TQFMGRuy7kxkx1l8
         j3ja9NrEuMuph/YYO8siSB/AQo3jOdGLGwKDaUyq9+A8lpvmBI5elx2TViSCTvoa64A7
         ogjA==
X-Forwarded-Encrypted: i=1; AFNElJ+dNLCDRzMdLLm5rVCR7iKlFCkIYveni90QLvDQaDlZaP4LyCEHrz4jZjO81wxDqd/7Fw1Kx1pWQuCW@vger.kernel.org
X-Gm-Message-State: AOJu0YyaA6O38WHzDaSY/5V1zEoIqbJNw5oP+bNW2wCotkhE4Fp6/gM1
	/mtfviBjoEpPyiMUgRL45pCp7u4qlioq7LRVgNJocSA4XY7Y6X84bJrsyhek9nUB7RC6dYdUz7H
	9/8pJu1MZ3fRth8yicrm6cDQpzA0vhVv+yQb89j6uS0OJHCoIKsIFOxl8EAnbLaNE
X-Gm-Gg: AfdE7cl1zBVyoapHf/APu99Hpn0gF4lrun8qLMwLgwzHXsWj+aDQ2ErDXf1Dcbtl4Tj
	7vSM+t6mBin8xXo5Xjprv37MO2TZ3YlWKGjW+Y96vnAuV/zZFC4SyIqDXluaA/C0wxWYTxhzBLt
	m/9m+p7J27nlPSItBL+12+wj/VPoqEcIe5m841NWrgLMH/BRIx06qD2TRtrKwvQmNAilBrPQdvB
	Qydb0kY0bZKjCSxZYMxRn1JRi5Mx9+WjR/IpPM8+F0BR8V7MVfW1tnxfbCTnt6rGB4fXrslYmtH
	nc00WEFhxNCSPyjJ+FUcSuYf8y3nObINpWoJ98i079FzPtA8zuvcHillaSBuYfBPqqs1IA3TNJS
	/Q6vmHKb4HuisDH1JPt4zaJB7Z42ws7KFQEo=
X-Received: by 2002:a05:620a:470f:b0:920:6579:bee8 with SMTP id af79cd13be357-9208b292196mr366920885a.1.1781882117214;
        Fri, 19 Jun 2026 08:15:17 -0700 (PDT)
X-Received: by 2002:a05:620a:470f:b0:920:6579:bee8 with SMTP id af79cd13be357-9208b292196mr366911785a.1.1781882116580;
        Fri, 19 Jun 2026 08:15:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a844f855fsm96816066b.4.2026.06.19.08.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:15:15 -0700 (PDT)
Message-ID: <a0e7c439-e377-4607-9468-d7c1681ded4d@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:15:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: Add thermal mitigation
 support
To: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Umang Chheda <quic_uchheda@quicinc.com>
References: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
 <20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com>
 <d99447c8-f140-4ac1-85e1-a235c37eecde@oss.qualcomm.com>
 <CAB8MRjTAbpwcrD==eZuaJdaprQoEsgr2L1EEU6x+gEu8tAVijQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAB8MRjTAbpwcrD==eZuaJdaprQoEsgr2L1EEU6x+gEu8tAVijQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 96srIv86WQEtU7X2hvNu_47kGSXu2qOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfXwqlwRtJof1ch
 0tgj71uQzzKgkZ4/xg1TDoS/PyKICVtmQZ25DQwwawh+WFewdKD07BKjiaHs/8oZE/GyXqEuYXF
 TwmaLhX0CT3CwchbxNYs4eWOUtBcTPnV1bn58gfDenI4oM74kqonhHjGlQJ5bYhwxnhB5mHnO7b
 y3ywWnhhcMNXFj1tx3DeqyaEgAiqvjQLSF6utTe9w/difh583hYqNGLfCMgWlUm/tKDB8VztU2x
 H51KGRX/hgDFVoflThlfS+DwIHjJd7UjCO/+AsxeuRR9XNieJkw2Ec+nvUKeK5EPP5BUCX+FCQZ
 UJzcxRL6/5c3s9A2bAGA5QdjhUydbCgSY5p469tUtZvi79wzd5+LE6J7sWCuXkTl5K77CWL/068
 d2+1xPFbn/zWt7bnJg1F+0SfuXlAYMvBkMD4ztuu8XHXyWHudn48MeLqNsY3ZFyUMWxqG+ViEKy
 H4I+ixxwFaPpti6QJvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfX7RamYGghITkb
 7SCb1jAqPSMzI07jg5ghw9ZrRRJIEQj7vdkQLnaYVq5XmcjtRAxSuVe4JWmkaG8POmT7xm+UZV6
 Nn0CT5kK3y+Bm+QIG0O/ub8t+2+m/BE=
X-Proofpoint-ORIG-GUID: 96srIv86WQEtU7X2hvNu_47kGSXu2qOe
X-Authority-Analysis: v=2.4 cv=KbzidwYD c=1 sm=1 tr=0 ts=6a355d06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2tevii4blPheqIWeYmQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190144

On 6/11/26 1:32 PM, Dhruvin Rajpura wrote:
> On Tue, Jun 9, 2026 at 3:12 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> wrote:
> 
>> On 6/9/26 11:16 AM, DhruvinRajpura wrote:
>>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

[...]

>>> +static int qcom_battmgr_parse_dt(struct qcom_battmgr *battmgr)
>>> +{
>>> +     struct device_node *node = battmgr->dev->of_node;
>>> +     int len, ret;
>>> +
>>> +     ret = of_property_count_elems_of_size(node,
>> "qcom,thermal-mitigation", sizeof(u32));
>>> +     if (ret == -EINVAL)
>>> +             return 0;               /* property not defined, thermal
>> mitigation disabled */
>>> +     if (ret <= 0)
>>> +             return ret;              /* real error, propagate */
>>
>> Does battmgr really expect the OS to house this information? Can we not
>> retrieve it from the running firmware?
>>
> 
> The firmware exposes only a single maximum FCC value via
> BATT_CHG_CTRL_LIM_MAX, not a set of discrete throttle levels.
> The thermal mitigation levels represent a platform policy
> decision - how aggressively to throttle charging at each
> thermal state - which varies per platform based on thermal
> design, battery capacity and use case requirements.
> 
> That said, if the preference is to avoid DT for this and instead
> derive levels programmatically from the firmware maximum, we
> could generate N evenly spaced levels between 0 and
> BATT_CHG_CTRL_LIM_MAX. However this would reduce platform
> flexibility. Happy to discuss the preferred approach.

Following up on what Krzysztof brought up in the other branch of this
thread, does battmgr only allow to throttle the charging current, or
are there toggles for e.g. power too?

And does the reported max limit current adapt to the selected PD voltage
level? (I would assume that's a stupid question, but never hurts to
confirm..)

Konrad
