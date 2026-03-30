Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE2F399011
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853539; cv=none; b=YAQoIqzxwdaq4EcGIizdQ+OKZIXzGfRQShvSdevsMWgLt4bdoadI4QrQfzyqw39RllwesaSOHoqcuUB7a3JxBN9BCcowFWDnNtORuhy9jfIE8LwK/zPpbXOMAiAxrgXFsQkhykeIStqtresSgnQLhEy4R8dHbuRVHVQHeHUF+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853539; c=relaxed/simple;
	bh=EmDj421TyHr/sfirfrzl5JYdDAMG9Vp7WLhUIhB1Oqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SP/QzTyrbSL9CBpB3jPnwWgRx2l85WiP9DwphM/OqfI4rm+SeDSejiEuzLudyaQfOcVnGWMziSxo7x1dXdl4CU0utHyAq1EA3mLDPosd9B4oXmZeDeN1E3yZZKlncB2dwT/RAxCPwOS43YTdB0Lj+r+w0NAB5JFXuDms0mawFsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+l1yveQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zq/Ue1Uk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+l1yveQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zq/Ue1Uk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4uOrh1649608
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69P+91lyrDDQ/DKIeOYy+Twbri3cK6MdMeGzg9mFaNE=; b=Q+l1yveQ93C0HSow
	mlgwFFcOOuoc89YBzv798i7FKO0FnPPH9UCQ6tqpDgjyxfXHo8jp/kG4vjkdcTSW
	cxE+iH/2RD9JMiODGDtsL0/S3B7mYUVJ3Lc6w+WgW6CvYgRw/M/UunMYPY0T1mtz
	SQlwX+X6dofzWJxhtCkZ99UbwQ2Wpyq6FiDOdTvFy8xUSsRGAd06kTADwU7uR574
	g5E2XjLm5nEmRSNsdm6PRmixfYQu1qxDrpyFCiM9sSu+SJ4xFvmO7/4UhcjEkK1/
	uFpD1eZjTdOzhmtj8PxxAkgX7w7KBtEktg4Lb4JupgOWRvuV8bGDmPEs0DdbXqc2
	UitxKg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672ucv65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:52:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9010602bso2464891a91.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774853536; x=1775458336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69P+91lyrDDQ/DKIeOYy+Twbri3cK6MdMeGzg9mFaNE=;
        b=Zq/Ue1Uky8YYkVUgeYqRycdiYPLS0pEl5+bKR08AvbHv2oqHwCJ5vwiHl6AkmmlxIS
         4ylCrutmNnP4w7zBoguWE6WiSEeO6v2fGJNsbD27iyD+h7W5SeVH8+2EONx1yDUeU6mw
         N7ST4VfvkRyY0ys9rfTDNol1yk3vMCR5QHLgVUOjrnwYzkwNoGX/83XjLdouqzY8K5MN
         OswUTvsJeXfQea/F161972WPZxYEZRfJm8mHqaa4YaA/C5v20uwa67bdt5E0Nhr2O+O/
         ULyyY9Spg/CTBqKpYmqIEI3G9/5AgyW/SVzXjDxsRRI+u4Tkqb5Mif0kBrfgO+15sN6j
         vV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774853536; x=1775458336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69P+91lyrDDQ/DKIeOYy+Twbri3cK6MdMeGzg9mFaNE=;
        b=PtPzyMEMIYFl2Myj7RbqA5ic/wqV5tw5kKqTI+YEptcsL0xul4iXaH8XmAq3jCFB/+
         RQrEpEn/VwjMCN0LBKuDAsoaGFAtQeAchP7cXBuyWqGNEmj4gsyDOz5w6NtFjsvXyNMm
         b2VQSMIb5RfXPzbgJdnBstviKcMMEEWqteOHTS/vIP46S0sQeBj5YmrkVbCX9l3C+Hvp
         uosFPC3Ntrl1MPPHmv4U9E7KxrcPY82zZOSqbybzQIG1QYHifX4rPrNi+8tX0TrHPy1+
         dkdreXueL5edvycTM5RAQHXU5w4EBtFtXM70o92ZKciRS7tzcNmM424cWCEAHwye8t5U
         GkdA==
X-Forwarded-Encrypted: i=1; AJvYcCXCEqa7JTtZudZjmIFVuOrrSihcpA2cCAXjdJj4/TvES0UFLz1mCS5zGBFknqhtp22tclRVIxWCO5vA@vger.kernel.org
X-Gm-Message-State: AOJu0YzvB3CSxhIHOnDH5a0AeF/jSYN42Iod3B3o/zPgg4DALolQ4V1P
	DtP7XwJRewzanvgykEqmWqT+tFKDTIaDsG78m/o3iXwObFDktgXOigKveRcoayYjZD09BuMKz7j
	J6+NnpyBoekJDJX1FzuxY6CzQdHOph5IVI9qom6n0b/cVaKD2V3v7BcuymZ4cSjF+
X-Gm-Gg: ATEYQzwnmyIVzYwvU88FlO3lM+Xiu217VyJNBeQiRJrlKdRGC6gY/LM1o8YkvrdaqiA
	fPRAFB7i2f7/0NrZA84mqCD1hTlE4j8B2SQE+FZTzKTnFXQXZfktbXtWNa1tj/gem6MXKjTQElp
	edm7uWHb4CJhMVKjR9Eaq3wytIhItL4VZ57AUO2UxJT3sY6SBO33UoYoP80ioOA40yUUD1h/ckN
	5lbpA1f0SCm3f04/eoqmw3dhYPhaqsWA6eJk9DnPT9xZ8RPSBApNE8sggWypFHMs0dCQsbF2luX
	EKfNqVhGd4B4K+s92r4CljPt4km1H4xVi409jklK1nAOJt5PzeKc7288GRUQR/Zox/Cn73jcxf8
	FHbhaWtYafSdTVzWoRs7L+w+FssUeqOwsCxyGj9tZrLMh0wTl8mjAUAlGx64GTD/2hzMYs3bqAI
	e4qwKQKbjrVYcYWeCHN5i4dsjdrfINNiafHw==
X-Received: by 2002:a05:6a20:e293:b0:39b:87f0:758e with SMTP id adf61e73a8af0-39c87779bf9mr11974522637.8.1774853536447;
        Sun, 29 Mar 2026 23:52:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:e293:b0:39b:87f0:758e with SMTP id adf61e73a8af0-39c87779bf9mr11974472637.8.1774853535822;
        Sun, 29 Mar 2026 23:52:15 -0700 (PDT)
Received: from [10.79.196.200] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916ba75esm5324404a12.6.2026.03.29.23.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 23:52:15 -0700 (PDT)
Message-ID: <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:22:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference
 devices
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qBM4RHyHdsp8NwLANUvTEBTeW4N7TXY9
X-Proofpoint-ORIG-GUID: qBM4RHyHdsp8NwLANUvTEBTeW4N7TXY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA1MiBTYWx0ZWRfX040Y3ZvaItI4
 nLAEq2ql8E2IDxIc2Tz4P8/7z8R67MMFgRTXPty9c5cnWHky4VIKAzXUzHPCRC090pR1OxpbPbf
 0NIUVYhE74z4kCHvHUh1ksGo6rRvyF7W9ayiFTowwpWaZ6RzahMTiv05tSUOwBqje8+hn4Wfu+l
 Zvt+ie8jNBBPuM3Lb9LqPSc2LBua01/LOO3PfM7MrGrdjGiP347Bhhlj31vuDKrPlZjFKwcrgw1
 nB1/pZe96s1sqNtKJy85YUIVPtsCFF742gp5sNa8d5krPmj2/bJb4np3Tu6NRgem+0OQsUc529n
 Xse/dAr2xzl8/p6OS4t7CxQSD8WPoKGL1v0YFPGw8+KlAPXDPGB5ukPfbnyeG3qBI/K1RRGuN4I
 gmAZkD3P+fJCdZ1NLwb75GklIKtZw74WP8Fsfnpz0WyYulTKtOOeHOO3AWA3H65rElLMZTsYRH3
 k3Pl/8dPqShtD5qrChw==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69ca1da1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yVnEH6U5_fyVt_M49LYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300052



On 3/29/2026 7:52 PM, Akhil P Oommen wrote:
> On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
>> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the EC.
> 
> Just a question, is it possible to force fan to run at full speed
> constantly? That would be helpful to keep the passive cooling minimal
> and get a more consistent results while doing performance profiling.
> 
> I see that you are registering a cooling device in this series. So I
> suppose we just need to update the cooling sysfs nodes.
> 
> -Akhil
>

Hi Akhil,

Yes, that is possible. The cooling device registered by this driver
exposes the standard thermal sysfs interface. You can force the fan
to full speed by writing the maximum cooling state directly:

  # Find the max state
  cat /sys/class/thermal/cooling_deviceX/max_state

  # Set to max state (force full speed)
  echo <max_state> > /sys/class/thermal/cooling_deviceX/cur_state

Where X is the index of the cooling device corresponding to the EC fan.

-- 
Best Regards,
Anvesh

