Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ACE360ECA
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 06:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781159207; cv=none; b=jYJH3bXLA6ifgAS0M26rhUg2EtKWEzvTyKYDymWfmsCHMNuHQf0BB4qu9RlV5NcBlv3s7wZDlN0mvreKPz9MJP06sKqUhYY5ohMGKONdrTOlnkZNClkC9LRpB2UtjlRdpc8L+IIpPATBBuGOOxMKxMzrQFufZ0BOHtTDntoEIRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781159207; c=relaxed/simple;
	bh=c0gfVdcZBAPqDm2J1nmV+XKKzpQFZJuvmQtQzLGbkwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7RmDHFg9Z/1Qu8TBe4UotfBE2zsasOGzFjTGeZMEJr13iZ8d9lmXvtVjB9IwbBpc69J6Jp0I1ivpGKER3Ln1cmpOZ8HdB4xrD0NxmkTqLV5BfNaIkO6QDvm2ZAjUe0h8n0cq2OsDt8G3jW7/AtPd4NhnRmi4VIvFAcaO+dzjPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQlzsFro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFSRrgoA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQlzsFro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFSRrgoA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GCFh3843608
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 06:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aw+cER8RUt0S3hhQ6zDmBZRatlG33rHLOaT31tiADIM=; b=VQlzsFrotTXgp53k
	631FHHcQmxxbNfGdK2AUVkZYXhC8KMi1lQ16hXicAlDZpeVAoII6AbzSIVmu2l66
	bF1bWKcJdgyfyW8LS+OC247mvY3MYcvPhkxEVQCuiS02lHv18EsVahPBRVhn/f8N
	x0VcW9WAnOxhlIw65mCYGdIKhPYywHgnXkjWXrKobwvCTOIr1u2iPmRI5s3MauXH
	6RsCbNSDRjiA+zjz7wzwh8C7iz+atF5jy3s5/+eGDlcS8cYQlj5MuBYApG72vFs4
	sc1wC+3/yXb08cefiehufn2Em/b5zRtqstiibzPbCXU3t12lI+ctT9Tc5YCf/8kC
	KfXbeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701xkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 06:26:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304dd917645so9155173eec.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 23:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781159203; x=1781764003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aw+cER8RUt0S3hhQ6zDmBZRatlG33rHLOaT31tiADIM=;
        b=jFSRrgoAO5NS3qXnmR7w+3J9mRgH2fEo4K+6z9zDkF4JW6B34WLrFksldv+/24dPGb
         ovistl9AuVuXrRUmpTyglMacyhWJnnKCfC+paVAWs71EPknHrt2rbhweVOLgpCiIkrX/
         EbpkQB5oHh89ZPvNqRzEbnFAfg2mXRW8LotgNhGANGtx0v2g6ogRvWkam2OH++7PN2hP
         Xso2P7F87Eud0ScO/MlIPpMSIydwDJx7Eecuj3zms7ue08Zm7IVNOhnf26uEnG9D+U+t
         PSFlwswKMc5S3D9InAJjSnw/K6QV5dyQEBFnxz13272yFexP/V6i925o1MzQX5Oc6HAb
         +A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781159203; x=1781764003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aw+cER8RUt0S3hhQ6zDmBZRatlG33rHLOaT31tiADIM=;
        b=CLX8KwlsHXuMN96BYwR9MvjcDHP8Pjo6NwOyskXeorOaZmXShiJxyJ/JxfLnAOVA/b
         QOGhda/4CTHk5TeGFu4vgRBPcmWRaVAvxQtTY9koiq7cXirSbFhm/u6BPbfmrjk9idd4
         s9g+vy1CpEOuf9v3dWNoynXlybcHCHP2vGNDMlUkXDpKkeyKIoUWfwXiXdYMzXJNV9w9
         0Vl1i2BSOBTOH7aH6f3NDLz9IofiOkB9t2kJQ+2VCD8rZ5xakA6kdPHV5BOHpBuWMe9z
         m5FuxfhatSJe3mv5YflbpmsHrD1DLkE+pVFyoWl5jDhYAB+WmLk0m5KVJwSxYydIy6cu
         cDpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3R9WoiitkwpkO9Xvf/QlDsVrlZryt8QSbeQ2roNfPnlkRRgpWW2uTEeJLcZiOE4W2uFFq7l2NaLrO@vger.kernel.org
X-Gm-Message-State: AOJu0YxIIKX7xHc3u03HkSIsszSwmPAiiclFHKsuSz70a1MWo2XrocJ6
	ljL+F4CVX7o7r8KIRyd46nqGljbM46uA6DTJztNvFa1B6KkN1fST/y+7P6h3kGwbUiIOJ0H99x/
	qFiupqbIwLOiBtXH9PwIVf63DxgqcTwGP6yEml2/+6nYCcMYv0qGbht5APzbX1fZm
X-Gm-Gg: Acq92OEzMl11SYJvKrPNQWmSRZFdbGPfnxxI5X9NeWSBE6ZCd+y+rG3JWwM4T/9C7NS
	QJN4poKihPquZVukcKpvA0iCOQ+GHUk5Xf8VWpOSCcPWww10G+8l5HUeVkPJY11uT1dRFwSV//H
	lqO7BF6SWlt792ve98P4zTifhBbR4i1ONZDvjjce800nHvas+FuLofKTNJy/FIHaraui32tzRMN
	M4kExt4hWkNVMA6mg2n9McTzQwG2vUqsiuzAl2iHULIXu9oqkQnm68Lo63rpy6Cp0KFn2wX/bow
	YLLNIDncsk95MvjqTSqtZHqY5GsPKgqPFFJ+4mh/VFkhcSI7X9Byk0gs1i/5ZgbdvTC0/d65+5f
	VXYYLKBLabkDRB86NG34YsC0R6fKeH1i9ErMQOdywN8aq8jIpbGgJiGUaqAQOjVE=
X-Received: by 2002:a05:7022:128c:b0:137:64ad:a62e with SMTP id a92af1059eb24-13842400ef8mr899963c88.30.1781159199330;
        Wed, 10 Jun 2026 23:26:39 -0700 (PDT)
X-Received: by 2002:a05:7022:128c:b0:137:64ad:a62e with SMTP id a92af1059eb24-13842400ef8mr899942c88.30.1781159198714;
        Wed, 10 Jun 2026 23:26:38 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.107.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13842fa5f9asm919602c88.8.2026.06.10.23.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 23:26:38 -0700 (PDT)
Message-ID: <5a3aeed3-a141-4691-a8f0-fea03aaf59a3@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:56:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/13] Enable I2C on SA8255p Qualcomm platforms
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <ahEObi9ubGaTEcwK@baldur>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ahEObi9ubGaTEcwK@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c_WAttGEMlFVs75PBN44Srq3xaL7Cw7S
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a5524 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=uEP1mZ4tISDvfoPjOx4BnA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uETz73-oS2rKXqHautkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA2MSBTYWx0ZWRfX8RldxyO7xmYf
 A7xZAyIMG4SS3vgOkf4iVsapO0bmsVWbkViIM2AenHjGdXRAyZZOVOabM6uIW4zIn/BpdB9zle+
 uqJA5NgyAGsxJBxKbh5z9pEUVenQx7CDoFWf5bMiXwlvn14bgwzvxpTGLzptVl3qzbnd/cwcIB/
 1wkqUKnRrhuo/lFyI5zvppJkNbOAAXCGNL8R+Up+uGEc6eLlBEQymIgvdVYiiDfoLd8JTVh2t+L
 Y0knj9W7Z4DshCsjxFucm4ufHewaiFR3klv6OmEomVPBWokVU+yOWkewXMX4WZzPkmujUZsZeTL
 3XI7Dy4L1vzcdqGIACzbSu0J2mauKH98WJzF7QjU576eA85+VNSuAtntb6Om+HOTfUF7aT2F9I5
 58G7lXgblk4EHOmnR1Z1YTTPR9rzD7Q97muYqbq/BrPdFBAA+wbNvOn9X7CSYE+/bWo4XLfUTxd
 0awcvt85dfpVVeJsuPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA2MSBTYWx0ZWRfX4p+cHZfEXY8T
 DJfhJYkEddhjp/YHOBVEhNMIEi4uA5hTtl7wcf1GIENOHTidHFf65yYKczgPZLNeYbCNXOhj8cP
 a9kKYZaG1AyA8DHm4LM1i+U7yTMXuno=
X-Proofpoint-ORIG-GUID: c_WAttGEMlFVs75PBN44Srq3xaL7Cw7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110061

Hi Andi.

On 23-05-2026 07:49, Bjorn Andersson wrote:
> On Fri, Feb 27, 2026 at 11:45:31AM +0530, Praveen Talari wrote:
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM.
>> The driver requests resources operations over SCMI using power
>> and performance protocols.
>>
>> The SCMI power protocol enables or disables resources like clocks,
>> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> such as resume/suspend, to control power states(on/off).
>>
>> The SCMI performance protocol manages I2C frequency, with each
>> frequency rate represented by a performance level. The driver uses
>> geni_se_set_perf_opp() API to request the desired frequency rate..
>>
>> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
>> is obtained using dev_pm_opp_find_freq_floor() and the performance
>> level is set using dev_pm_opp_set_opp().
>>
> @Andi, I've merged the soc-patches through an immutable branch into the
> qcom-tree for 7.2, please find this at:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260227061544.1785978-1-praveen.talari@oss.qualcomm.com
>
> Regards,
> Bjorn
@Andi
I hope these I2C patches can be picked up now.

Feedback is welcome if anything further is needed.


Thanks,

Praveen Talari

>
>> Praveen Talari (13):
>>    soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC
>>      path optional
>>    soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
>>    soc: qcom: geni-se: Introduce helper API for resource initialization
>>    soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and
>>      geni_se_clks_on()
>>    soc: qcom: geni-se: Add resources activation/deactivation helpers
>>    soc: qcom: geni-se: Introduce helper API for attaching power domains
>>    soc: qcom: geni-se: Introduce helper APIs for performance control
>>    dt-bindings: i2c: Describe SA8255p
>>    i2c: qcom-geni: Isolate serial engine setup
>>    i2c: qcom-geni: Move resource initialization to separate function
>>    i2c: qcom-geni: Use resources helper APIs in runtime PM functions
>>    i2c: qcom-geni: Store of_device_id data in driver private struct
>>    i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
>> ---
>> v3->v4
>> - Added a new patch(4/13) to handle core clk as part of
>>    geni_se_clks_off/on().
>>
>>   .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   |  64 ++++
>>   drivers/i2c/busses/i2c-qcom-geni.c            | 324 +++++++++---------
>>   drivers/soc/qcom/qcom-geni-se.c               | 270 ++++++++++++++-
>>   include/linux/soc/qcom/geni-se.h              |  19 +
>>   4 files changed, 491 insertions(+), 186 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
>>
>>
>> base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
>> -- 
>> 2.34.1
>>
