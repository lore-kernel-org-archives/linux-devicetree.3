Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699146;
	b=YyTDGXCy+qE31WqiUE6NulNonmu4DGPhD/ggKmjyJzyBLkvR+QA0nGS4mmCy9tQutbJE
	 P2a/aKi27UrSqsn51tx0NK8M3i0JRuahCNGZSQcLV6fObfGq1Zdz581GTDP3ktrf6vNwm
	 g9Exb8JLK0RAGz8GKB+UsVVAT58U1dbYS3NMW69YdyVLsipXn3JcUzaQIt5o6WItS2dW5
	 L01xKbQjOWgpevuv5yutJh2U7oGlmUUZfSvYNgpmUczVFTas8fNDypAlzJmLiB7SBXcKR
	 P2k4XqfZE5uhsvvJnBQKU5QcAXNzQcl7+z54xto/5v/JPS6EJ6I/mwJeNz/ak7i4GrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
	b=kjV7H/5IRo4Es8EqcLNYa9qjvYrM2Z0I6Vod6diTNWeuY18unXI+0vpw8q2LnECArizC
	 6z7OZ8gYhjmAmYaMYToK/0Oov0lxMXyB/ungjZByNXNAatBS2VnyUc83+Y9OvlRVGvAPU
	 QKIt8nrTeGm8Tsna3B2UqahJBDSWMijS0lSIJU4Vz13RAcMaJUzlduYdefPtEu5ed1Pw1
	 3/YzJ6LmMaw96arJOZmBN9IjzKThLYNZ2nzPZNvABC1BH7FE4IANp6CxRlP65kebABJbT
	 l8XZIzSFTAyBOBZhZLmjWCrphjMVQO18Or0WXKVyhLHttldkR5G4hhi9XYZwIW8nCBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fom/uN9J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzKArjKr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BFD606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0BFD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fom/uN9J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzKArjKr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352mr32449132
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 09:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=; b=Fom/uN9JKIhHz1B0
	mZDkLS6DR6brE5JpHk4qmTzxX4+ts65C7+kAr8BmO1VKNVXxxMWko2pyxly1QL/y
	yA6/ZPYOLqUE1642Syd+Wed00Pti/DAwoQ1fQ6snCDfHq8zjUi/VLf6dsDvJNKoI
	chWhvzsjRoD7PEDStUM/TCvpxocx7/uShEpNOB1/Mc+CL6pkzQVIQ4qeqTX6TaQA
	nSOeOvohEfjJXfWPFzMILkCfATfCgSmipQS3q9AhJVxGYJ2oDO44mVSnzS2nHhEF
	RXEs6rkCw8vF3L9PThXHBqOnpzDg2ewiZgiStyHoyNh0faUw3jJ2WjXrKQLojs/o
	tE0a4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cs2ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 09:45:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9821ca96fso63044305ad.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699144; x=1794303944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
        b=IzKArjKrXiSJUGeHRy1S63+WyyjzqNrLX+8THr+ned7T1hGmHOB7+bWqSGinK7YKGc
         XpBPvrZgFeRTvcK3w5ZZlzsJHI2Yya2R2iZgWQyr1pY6HyEb806LLQ9Xgen28eK3598c
         7TxFRa9HioCxC+BDBgzhO2spqnxABZL+IeZKlP2CNvIUc9Ar7gwW1gqSMNPMLp5JtpCN
         QHvUk/UJXC9MX4Uw7OF2bV0ByYG6J4yi8PJlrUShc5GdwC3cFSNGkz0rsESmrFR+c/Ok
         cYt8kCUyI5DvWlkkJHL2t2Ja5fqwV905jLdO4lst62SBFJLB0pEa6aAeHwR60ZFd109w
         W7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699144; x=1794303944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
        b=AseG8StcdRJXY6i2XmvI7dMOlvMOkCkPAPKjLTR4OIiAzHGtWZsptCOpDrhOQ/y8I5
         RWQKo+h7zK0R8hx5V6Qs5NayzxTuXuGsczI5CBylQiBT1cKg5v8TgIetytgjj7UeXTa4
         Up+tnz8hGpjYA9SojFJGNJfwoVQXzWU9QvB6VegHK+l0piICMdLTl6f9aSbS3fJQ/V9i
         VN9bJzNX+rrAmIXRAAGL6IPdAVM+9eekZM9T2pkIRpxLXe5OvFka0y7yNdWYecorzCUz
         Au7dYIvywYfbKgczSwHTzoaJ7m3OomIibvVWNk8kftvhQaeIkT0fzgTa4aLSVi5oDY9a
         lRPg==
X-Forwarded-Encrypted: i=1; AKwUvBxMY82rISDzozsUgvi0MnXmgPXvJCuXDcWkBJWpHHBvTe2Q6hG/mkgddEljYcCgGiizDKULxk8EaKxk@vger.kernel.org
X-Gm-Message-State: APuU4Z9admZJ9EOwxNyM6AXQ712G04DnICdsnDb9jmHjQxHZZV27Oq/j
	0RMGe6M6A3uTeuYT/WrZf6Er6fPvXEYY12YKg/9ugTyXtzOhweKH/KotHdrPfDVWOhOPdIJSb/f
	yFhiCj4hRlCS3ttwFBEWQ2tB07W2v2wsxFBAu6T1ZN9TbzPl8Ewe8LL2UZNP0xSln
X-Gm-Gg: AYBFou087DsY4aR80Lim41prEztfgUJIpSYFq3OqaQgH2AYIjzwr6OIhsl/chPyBuJ/
	9RO00+t+P88sb8VCLob7+JPoKApDydy/JCxwZd3xJ4R3PfxV1JQgRcZ3l1riGw2EjZvDu2qU1p6
	f4CJbOa9C6Gi1EJvGeJvD/hB0LWhS+oIsicl3KAHYplcYcdWI1TRObRr4bUfCdnbYQ/xr1yTCir
	IXuQZlkKlMCCQxxWKEcI6FD78ZFpYzd31QhrXtCDuVCj7oGMCH6d8B3m7wU/K1bvZ6ksaZZeIG5
	rlUWEqLMX7MXf+WDmILP/rKsVR5VIfurhnNCRUGsuZZX1pEkTLKxGi8CjO4EcnF7rfZPlmIK4M9
	DBtdJ9mnxxmYUUh7PVWqoiyBcL/WwTarXeSiIVTujpOF8r1SXQEDUXn1DbIPTwpsoXA84mwc85B
	E=
X-Received: by 2002:a17:903:228b:b0:2e8:3190:73a with SMTP id d9443c01a7336-2eb364892f4mr119896005ad.58.1793699143781;
        Tue, 03 Nov 2026 01:45:43 -0800 (PST)
X-Received: by 2002:a17:903:228b:b0:2e8:3190:73a with SMTP id d9443c01a7336-2eb364892f4mr119895795ad.58.1793699143296;
        Tue, 03 Nov 2026 01:45:43 -0800 (PST)
Received: from [10.218.22.181] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3927e856sm37288925ad.50.2026.11.03.01.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:45:42 -0800 (PST)
Message-ID: <20e8628b-4664-4b61-bf4c-bd25d7cd6775@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:15:35 +0530
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
 <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Content-Language: en-US
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
In-Reply-To: <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9ad48 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8PPq-ilK-3aRn1NlK84A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: KOkKTRMeyo0BB8oFGBcwGLrTC1zUxH6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX6qLIlhiDWVh4
 CoRJz3v3bp0QIEFHVQGwN0MYJvsP7zh94RBazhLDEN40A4387v9b8OKMsDgT8GQyLabkMqzMI/Q
 pYeuRBjGm5bpDcxforTs7ljWdApkMYyvdcQ48AupWOFs43v9kYzwbNuPr7fv/RBoZWwU21ccU76
 ENMVVDFKLQuGix0bX/d+SqUCK7Injn4gfrQSf7enkHYSTFeeQRXjXoqHArUXrHHx6hTTv4Yz5AX
 ANIgociWrxku3o2DWpAvrPIxFs/ltBWy5/r3Z/H+P9dJIY5xxsi8O3BSl4JAnZmJpvJNn5fAVWf
 sgigOnbCJD9N1iWD+RkRJu0bMV5HplcOruq9rsmkJTNe3RtopvlIh2h3pufDqdSUQcEbxHRzFGT
 iYJ2jpe9N+me6HrAAvRDjhlLOLhBvfSQGorOnsIk12nOTqvf1fA/Y80K+IvTBUNl0dHoY0GzsP8
 2L1Qh2IZIkX/Tq+jbtQ==
X-Proofpoint-GUID: KOkKTRMeyo0BB8oFGBcwGLrTC1zUxH6e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX3NlCfzMgl1cr
 c/k4QeoFYVjkRn25pz7uvJm7HB6ahP4mTBapn301THEsErFprCWdVmuUYvqLI4NxHly9lc9dTK9
 7W7beRSUZSTMJXvGgWZp8ahOE//D8SM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030038



On 10/20/2026 5:29 PM, Konrad Dybcio wrote:
> On 9/11/26 7:03 AM, Dipa Ramesh Mantre wrote:
>> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
>> when it reaches high temperatures in shikra.
>>
>> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
>> reach 115°C using the QMI TMD cooling device framework.
>>
>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -				nsp-critical {
>> +				nsp_alert1: nsp-alert1 {
>>   					temperature = <115000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
> 
> No "hot" points? And no throttling at all until 115?

For this target, no throttling is required until 115.

> 
>> +
>> +				nsp-critical {
>> +					temperature = <118000>;
>>   					hysteresis = <0>;
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&nsp_alert1>;
>> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> 
> Please align the arguments so that we have:
> 
> <&foo bar
>   FOO BAR>
> 
> instead of
> 
> <&foo bar
> FOO BAR>

Sure, I'll update the alignment as suggested in the next revision.

> 
> 
> Konrad

Thanks & Regards
Dipa Mantre

