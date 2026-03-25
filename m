Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F3D3CEBA7
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438599; cv=none; b=N/JnFlzMGsqUNkhQz9Bn1wEIIbcvdVxN2mA0egw5QzL3zOol0TF13av3+66b93RZjbxBOO5lka2sajgytW8UeRDbWr9u6/y6s8jFRC7TJDe9mLTMmS+kPN7Y4eV0q2ls/wKYKF1mAGCEqRSVaO+0lUt9Mxgz1h7F1Mq6QQ3HMYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438599; c=relaxed/simple;
	bh=z+8i3GYxmPysMPaCb7ZxvnZe2fGGVA4EZxOB9hfujIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkCE6J78zR4yNXhy8T2wUFFXSvsT0Bx19XMOKH8BIS3ORG3Mntk5LYGDphdaydL6cJW7EoCZIha/QWGKTeR8KbH+CQjUey2a+L6Mf50tzhe6yBtKjtIXimrS191y9pU+jGppPv6TXuiva4xvAjEJhf18i8MMilK/pVV1/Dv8Z2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fivO+lZt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdL4ybDU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fivO+lZt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdL4ybDU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGedm052095
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCdNH+n+g6mJ9mJTkyKqJkhT1JA5zvNKqGn8D4J1dYg=; b=fivO+lZtWQ3iroMH
	Czs7q6AyDLwyV0ZJVVbIywxPWiA1c/F2Qz8tVdRekRFKX7Wd+NIXGwRMteFbPAF9
	WwSuQ5BhHBw4jylxharxZ1bG49i19d8B+YWeaFFRWljBEpzt8Iw8DHT2WhtEOZz5
	KQBOYkd/5iX5ru5qfDl8Cm0kxZvVCcXCyZ6ohF8zyY291GFiHV33/Upw1k3MinE8
	LDXh5MAaxgVxACL9P2u/D9Ao5KBFM+PtG1WWOqSmDKeEoA/ZhqY/mAcmV7+hzCGZ
	Lc6o3Dn0ukUqC1vYudr2TUB9sCdZhIG//CaGKnFlyt2t6WQ2/tBXWEwukHeF7E1Z
	MgqTaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1ugj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:36:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so329587121cf.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438595; x=1775043395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCdNH+n+g6mJ9mJTkyKqJkhT1JA5zvNKqGn8D4J1dYg=;
        b=LdL4ybDU46khP4GsIkNocBsQRMD7pC53oQJPIjfvQwG8U1+sdIBlvqPU4Ncce8WBZH
         U2MXjGn86Xm6zij8/sWoVIUBUAQIaTv6SQM9TCFazwt44xP/hsnIKKbtfgQOliQe5C7H
         POSHhWd0h0UPHe+ucQghZtcRiYtpOg3d403sy/q2leWgQELsBPJmS1e4Yh+/aYhCXx+Y
         mnD56WrbF86anLy9kcIe5UwkSv/os9LyoMAN0QGbbP05fUroJi/nHw3rgvrW4IO4vLTx
         TOmqtmitwM4nrML09EKL0Egl2Y1ee0EqxzTOyE2qqqgBwS6d9HwuOawqASc/FXkWYkbh
         Ex5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438595; x=1775043395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCdNH+n+g6mJ9mJTkyKqJkhT1JA5zvNKqGn8D4J1dYg=;
        b=tFxzAlYdpKOdz/mDAjmEhBAlr5LrAYvExzkGnF3pM7lUxl+auh0BLoakhGuJ1xZIR5
         5CGciY6oZPG9IVQawG85s6bjre7QsANc16iSAAvklejAw1WAB9oS1y5RIRne/Vn2pwhV
         Lsj/H29aYUrthqSa0MwnaDvsu6QJny2T1B6cD0mdWd+kvDdkW9ue5rj9nodWgszNC3nn
         jswuTbDX6D3JK7GFWGsJH8wQEyp9FcgkTehYVCj18Aom0aSQTPIGsRzsdrvgQRQbbFXu
         g1Mq+E2Cxl+uF15eQiy4vmah2jH7yslfixlZeg58V/EIlxCNFZKvo/1GVTLrhuRyaT6k
         LO4A==
X-Forwarded-Encrypted: i=1; AJvYcCWz6VTBspVLKAFEk8mm7nUGetX7+tiFn87s8DCZHbPvuIyD97qlWBY/MfUKpBztaW+b3yItH298X1Va@vger.kernel.org
X-Gm-Message-State: AOJu0YyH8gflt3SftUyate2Dzljo2AtMmcHqp0LV0eJ+Hq1iDF98dRnE
	LgR4kE71/nJ5CJtaLvg8BcGjuLg/fXZAa7TLjf4z3AWJRSndADc09eE16fPGlgcPBbsc8sfXmFx
	LGuwYV8iOjh5l3+t/7zKAozBXs/cu6/0e4zYlXIsTQJk4tV4ovXABQ+4jV1e74mDv
X-Gm-Gg: ATEYQzyrWhSD36GyZxxDf1PGAWyQj+My5FSyFaaZiwsVGNBK+i0Ci2+prSQ5JCAkbvt
	lP3A4asrwlUTVeqR/EkPwfst081+PAU0O5vc0hADlV1ziSWYnBDyqw7Rcy/CofQv/sKU0zyfSD2
	okHn3nA9tOm9QQqnsZicelpnqIGAsBSY3t7rgRJcHGY07UX450IR/acIN7An4n31yW/jvwXSfji
	RSmxUkypQeHJ+XFwzLekyXbPWvUwNf4naBm7P5KTm2Ln1TjfYVvTLWJLVDY7L5bVKnxumWy1Kvy
	RPPQBPPKgDlCDsszafvlBPAggJDKgPbvIgvRj8wl0PIAXpVJQxGsgYtJm3XjCXkoiD/+KY5Yr/7
	f/a8UsMljP5O3NA/bC5HJsZDbJR/gEEAMDdt7D0TLu9yXyhKC
X-Received: by 2002:ac8:5a95:0:b0:50b:4491:a2c1 with SMTP id d75a77b69052e-50b80e90f59mr47306541cf.63.1774438595519;
        Wed, 25 Mar 2026 04:36:35 -0700 (PDT)
X-Received: by 2002:ac8:5a95:0:b0:50b:4491:a2c1 with SMTP id d75a77b69052e-50b80e90f59mr47306041cf.63.1774438595091;
        Wed, 25 Mar 2026 04:36:35 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-487172f909asm25777975e9.6.2026.03.25.04.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:36:34 -0700 (PDT)
Message-ID: <544debd5-bb7c-4b89-8641-eb63a107155b@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:36:33 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/13] ASoC: qcom: q6apm: move component registration
 to unmanaged version
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-2-srinivas.kandagatla@oss.qualcomm.com>
 <981a6253-5005-4281-88fb-3ef6361dfb76@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <981a6253-5005-4281-88fb-3ef6361dfb76@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Sz5gaZPLZeusYewrxtVPxdf77V8xou8e
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3c8c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3rt7OP6hf4PjYIihl4UA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Sz5gaZPLZeusYewrxtVPxdf77V8xou8e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfX/3D9ogVM1bJq
 7qy+MHt4ZVjjVTA3/w/RMIb8DzxFDL0SFj1GN6navuX9Q9jLaO2VtodzcY3oc5lkgZ+SnlbbbJW
 d40jJfK3lNqvZi8D6uz4jqIlyDXIwsdlniIfqKY0G8ewCmYF7d4TQnNcMlzKL8rs+zspSIkqP6q
 8MOVwKJjQi8CwI7CTFXSWmUTQvCTCbdPCu6DAfoY1zjdOzzqoXzgmY+jZV2PtVmATroRbJeCz/b
 jv3D6HXQgppj4wwyuEYye6/ABXW9lEJKwbY9rtBJd7awUOXUqid4Ko1sGJV+sujMXojN3igtOe8
 gOQNMI3JcMyKEsxcrIxcbNjgUs7mz/xmCgJSsJclEqtpEjTu4KWq3YbK8Ld3DMFDdfVyRyICTEq
 /Ql/Q84+y/UEYcKMs2/QHpzgRG0CLItR/xyFhAtVdPeLOK1A/OyXPxyJ8X5FnSji1DXDjGjOneC
 iQQpcVIUYcOlZxsH3Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250082



On 3/24/26 6:04 PM, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 10:38:33PM +0000, Srinivas Kandagatla wrote:
> 
>> --- a/sound/soc/qcom/qdsp6/q6apm.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm.c
>> @@ -747,7 +747,7 @@ static int apm_probe(gpr_device_t *gdev)
>>  
>>  	q6apm_get_apm_state(apm);
>>  
>> -	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
>> +	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
>>  	if (ret < 0) {
>>  		dev_err(dev, "failed to register q6apm: %d\n", ret);
>>  		return ret;
>> @@ -756,6 +756,11 @@ static int apm_probe(gpr_device_t *gdev)
>>  	return of_platform_populate(dev->of_node, NULL, NULL, dev);
>>  }
> 
> Given that of_platform_populate() can fail we now need unwinding for the
Yes, will fix that in next spin.
--srini
> component registration here with the removal of devm_


