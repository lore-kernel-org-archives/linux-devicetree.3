Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A462C3F7892
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750277; cv=none; b=e2PpHKVBLRpRdBahGPGFXOMJlIFApyxL02UgU0/U6fHyil42hmgYAZmYURvcjKRSfaJND43S2VPxnt+Ct0GZnvfPt+ULPXkWFlOkjQf54QJulsGHYstV2c+K3lTXl1mlZq+0/gcpK1op7ifqBtO2gtYD/yfJ0AwIGl7rcnri67E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750277; c=relaxed/simple;
	bh=BYDsTpoHZztHpVH/KB9MIt4S85CTFk7lYHBkXkgV+nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ht8QKVlpxu3EvzNaQt5G3sx9xyunwkV19D6u2pT6uvYrtQU9KoGRptY5vMggu+jbjy+8Re1Z5Ky05hDediHuVFOjqIFvmTchIpkJuC3YLZhaBt9B1cV+VdEItXAqFaiQ00PyaJHlTRuXfu2zSY3mf0Rt7rdNiP/CqsyERVu9K+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFBmXjrd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTlSjaeV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFBmXjrd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTlSjaeV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCIuu374880
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DELOI9rOA6Bm04F7WLidIklLxMdtsGlI2iiw3Tgfc7I=; b=gFBmXjrd0bXAHG1r
	R8/tATY6zngKD0xcvCkn3tiCgsi6wIGAwzpH0mjUV3GoGyhMdGGKOmfZ6XtxI9hK
	kObU0MuJ4yFt0gUW1SGU9g1TMyxNIQ7PNBb8ZolH2tcO1LNatYFTNLJf3iOMJQNN
	fzhmQVhxLfgWCsbBH+6trMDyDqDk68AD4aPAey98vgRG7oLGVOelxmRnwZtoK4tT
	lmbrnuq4hasJd8uvcIcZvgwAGuQ1jsAL6/dNxrReTNxeFyQ9VmP6SUmVPr9vl9dn
	2U0y+03fmfLeJl4D5UFfo5+Yx293EF+8KPxUQfj5iTLYOkzTJSFJtu0zNtzNtIKP
	SqL6tA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx9ye7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:17:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso28146137.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750274; x=1788355074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DELOI9rOA6Bm04F7WLidIklLxMdtsGlI2iiw3Tgfc7I=;
        b=DTlSjaeVtToDTGsjIQzVMRta77mFCNInpnfh9JtJPg0e57ujaiu4CjTORBrW3LMDtI
         BdquZSDC8WbYn5jyFQOHeYVLf7QXqhD1N3PFP6pFdrzUbNDdMz+xlIWdn35+llj4aKnG
         9QixYm67lhz5Oy3cqcehelix1LXjYfS/iCcjVTu7BSiYBSRO7TKQFMxgk2QZ/tUZBtoa
         qIamOZjD23sDdPSM/aiAn3Lyn2yX9igLM+lImT6Mls0VRtvrM+QqpFVZeoY7+2Gfub/N
         UBdZ0hQzUgz3ZBBzF7W6zYNgV5a7/+fMpQjBDRaPeFzDrvH0Bo40ZDBsq6aL5Wvv49+h
         /r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750274; x=1788355074;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DELOI9rOA6Bm04F7WLidIklLxMdtsGlI2iiw3Tgfc7I=;
        b=WysgRowyHjSbdgxsUt/ASpTB34uQ6cBOqqSYZk5sPODWLXX0jtKMalNEpdOLjogvWE
         JUHym0vg0N+hvHweWko453SAnzn5AO7/XDgninM2lQFaHqjlFtbq2vnFGWd59i5pKRv7
         xJjMYAhUSkKFxBCI7p7oXGu3zHmBI7GR7Qe1S9kzeQHtN6JeGDBx3TYPTDH7Mbk5NG+z
         DPb06L5f+eRNjfB9PqBiMTeITQ9vN05HPiHL/lfEaeYGoCt3Y4ea6EAGakl4uNPij3NZ
         PQ2CoGfR3jfLvHc4x/qzFPMx+WnhE4YinRwLsT8HmzCEy5WpWb7B/2SygPjXXhYfTVTM
         Dg6w==
X-Forwarded-Encrypted: i=1; AHgh+RqowRD6zbm8VlvzUO0X0p5fdQcRzMP8C8L2hiI14VNi5WWcKMaQeFPXGNeVnxUUsNCKwfEC7Y0GBTyB@vger.kernel.org
X-Gm-Message-State: AFuF++mCH5JQ6uxQIVE5onwDjydJ6vZ0fqLgrWS045PETfHvlFRIQ/o0
	Y1To97zk7YeBaty2Po5mwcFlVq4BtUHBoIzZWwl23las7C7Pe0DhRJck26EYQQO+9qolvBWMOlm
	t8x7ZS1UR31q7tr8FSuqHsY6HB/9CD6UmiWBNr6et6TS07IsCo9Zd2zhJ+M4EKR7Y
X-Gm-Gg: AR+sD12AJ0IryUkk3umdVG9xtveUNb8sElWQU+JiosxgeK/GovEVV1e0BXma6Ebb+sN
	JtlqgX5UAaqCbhfhYL96XNSS+8ujnlJKD8QoE0sGiryUFr1shhY1P1rZnmz5uzEwjHpq7nPVHtx
	Ygn2F+5/Dg9CxT9yz2GF5cb6JJEx42ycejJs3/F/9giMnn6sd4Xrr3WAbrf7O6IqgsNa+auPhg/
	vMuFEtMaEOBKrqnJ4LC9lJgpNUpdzg61bhWYYK0GAKh81thXx++h6YDOL97BPXZXuGA47q5bz7b
	uEhjrjnL2fIY1oxeoRIZQhwmlohQtEbtG8g9ogJ/nahULfxZt6mVP5KAvXlPck93v24SBuKflJz
	5P4ZW6cjnOpYBiH/hYM2XZDmQ
X-Received: by 2002:a05:6102:3166:b0:783:73ba:7df6 with SMTP id ada2fe7eead31-78373ba9fd5mr278614137.1.1787750273437;
        Wed, 26 Aug 2026 06:17:53 -0700 (PDT)
X-Received: by 2002:a05:6102:3166:b0:783:73ba:7df6 with SMTP id ada2fe7eead31-78373ba9fd5mr278603137.1.1787750272973;
        Wed, 26 Aug 2026 06:17:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b235csm376838866b.44.2026.08.26.06.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:17:51 -0700 (PDT)
Message-ID: <0d493aed-acb5-4905-83a2-6dbd6349cb49@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:17:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for
 Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
 <6b2f4411-9c38-4b82-b605-6b9a047ab973@oss.qualcomm.com>
 <ao7mrrW_ob77EAIp@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ao7mrrW_ob77EAIp@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ee782 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=P5qJYf1CprfF32mA9rkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: a1xtVlhYd2xUrMzB_bdSSJreJkWWk43y
X-Proofpoint-ORIG-GUID: a1xtVlhYd2xUrMzB_bdSSJreJkWWk43y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMCBTYWx0ZWRfX78NdIq62iSav
 DcUgeKjSE+iB8yht6GX8xYXGc4bmjrDBF3WyR4u1ufDaH28AVOjacSZkObpG3WnynMFGZePRDD0
 p/VCvNKch92v+GcMGXORSHgqCfMOTMA90wGORmBeuxummmuKgsU9ihLXHAh4zuqeQpOWGlu3SGq
 gn8ej1MqOLAtRsxEF8ISOSkPEDVOLt2tbZRYmbyZEBsLf3WyppF6pyUyJhacRCrBw563J8cmVqe
 ALKoMiB7L5PbnMgGavxcsWPBl/b4MY6DNMWAaPXW0q9+MDeAoLNmGeVuS60rDcBtHrl47MWR3sY
 Q3yGDgc9k7JHgBDMf3066GA3sxx81n0OrPJFD6hJ/OdXqTM4jMWB5lu+IAJVBCJybByRU1ET1mE
 gRwM9Gus1vNQKJuPVMmaPKc4ezdkT8dYQYQJL8yF6zSrTcDOUbyRop0uR1WFO5MdD7L7/ZvvTRJ
 Mr9NywPdpbvUTuALEXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMCBTYWx0ZWRfXyJq4fBR5nPO7
 YekUscbNt7t9+mkQxm2sqIJxt+VgSmN4aLHnfVCb58omvLNpX0pfkMpKKzI3dCmy8Av/CeDNBNn
 JnzZEbJZuqMdmMNU4R1gEVHMk4qpwVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260110

On 8/26/26 3:14 PM, Shawn Guo wrote:
> On Wed, Aug 26, 2026 at 03:04:33PM +0200, Konrad Dybcio wrote:
>> On 8/26/26 12:27 PM, Shawn Guo wrote:
>>> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>>>
>>> Add the nmxc.lvl RPMh resource and register it in the Nord power domain
>>> table. Nord supplies the NSP memory rail from this dedicated resource
>>> rather than from the shared MX rail, so consumers need it exposed as its
>>> own power domain.
>>>
>>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>> ---
>>>  drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
>>> index 96e4bd2f5a14..717c44d1c39a 100644
>>> --- a/drivers/pmdomain/qcom/rpmhpd.c
>>> +++ b/drivers/pmdomain/qcom/rpmhpd.c
>>> @@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
>>>  	.res_name = "mxc.lvl",
>>>  };
>>>  
>>> +static struct rpmhpd nmxc = {
>>> +	.pd = { .name = "nmxc", },
>>> +	.res_name = "nmxc.lvl",
>>
>> The commandDB sources suggest this shouls be nspmxc.lvl instead..
>>
>> Can you dump /sys/kernel/debug/cmd-db?
> 
> root@qcom-armv8a:~# cat /sys/kernel/debug/cmd-db

[...]

> 0x300a0: nsp3.lvl [00 00 01 00 c0 00 00 01 80 01 a0 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
> 0x300a4: nsp3.tmr
> 0x300b0: nmxc.lvl [00 00 10 00 c0 00 00 01 80 01 a0 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
> 0x300b4: nmxc.tmr

Alright then

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
