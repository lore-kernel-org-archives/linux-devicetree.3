Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C00426D29
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684743; cv=none; b=bVEQvfeT+6eC1xLhUmKptt6VCRxuAobozPKea/WG6NBSzES23IPEX7CbpjBc+AVa+Xi+TsweMGVnGNgMX2M5fr2kilAtcsdEg6cnK4WN0uE4ZUmjQWTsYrT/Bwx1qfp8CxWFB6wPyUapDqogOVNrUdijK5j6h16XLxeZviiEK94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684743; c=relaxed/simple;
	bh=o9MiqHPzrfvvaVbBYodqlmER0VtUGWx3b6VUioTVW0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebxnVEiucRP106fpWqqbmnAAeOJUq3XUpeJBz5IIYqlM85+L/tDf0tU86GcgAeidekyiMYuFSdBRAN1HgkOXJTwM131iiyl2aiyQVSc71VY9oYWOYLgDfhOstkFqEyEeFvys+vlp2FMq0ZCA1FtnP8o/kqHuhy8Qc3bVqjELfP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMMokzzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTgc+xtp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMMokzzb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTgc+xtp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmU69605079
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOVzTAGLJd1q5QSig/Oj+JpLd6wyrrESgMmKd5o1iXI=; b=VMMokzzbWZIWJWm6
	taq4lnl+/Wv8Kj58W5IH9luLrR3QxyHKNqYVvGqxMuptiueBURogYIboWpleIYv8
	byKvjIS+vE9iP/LhJUFQeOt7QA/orzc/l3MeKS8JdAOT7MdkFzDinB+N4VFQAnFg
	ucJvNjvEOfTPxqHoOHiTvFwfPdp1NrrD5nvRoVF52DFBuLufvGE2uh9yqf31hz40
	r/T2/rqHOiAB6s5xJvbfMy1jVgQL1VDHGlT7u5cvzuWADEUjBSSA/j+yESMwOh7o
	mlJfXYpnybpHHQw84vKRb645xidAPIj0MCtmTT/8GWB4vYELRC+pUIXQrY7gtq85
	BQIyTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanweabj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:58:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8c689b5fso9123991cf.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783684736; x=1784289536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOVzTAGLJd1q5QSig/Oj+JpLd6wyrrESgMmKd5o1iXI=;
        b=hTgc+xtpQD18M6JTr65uDFAmoam0rmm5og+RvY4YfOtJwY4uRjVQD4zxYt9CPXXZV2
         cuy/p602Zs6JoQtQwyM9yjQEtC6VMTOa06V5OGbEy2U2t2d0sLyLuU63EJexJsM8+k5i
         VNwbwXgnr0ud6+RMvfOBWPmwJrt6z4P221kjGEZIL/J0f5IW2UYulR17cM5wX6Jl/qq4
         ubbEvOJJlTHZfDvFs6WyHEkkW0B472RdRf7PGQzM2YPOdl7xjnbJ88YIhz8smVI+sERU
         JMQbOrtREiDc2jThz5tY3Ns80W9Qy0zuSZZtd4fxrOlRU1NIrG4Lck0hUlz2eEvbDTxD
         sDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684736; x=1784289536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOVzTAGLJd1q5QSig/Oj+JpLd6wyrrESgMmKd5o1iXI=;
        b=D/DSbNcsAUyIJIjtk3I60Qyv5p48VIM/pgdQk6mcpscrMrfHq/f6dTWj2/E+Vug95z
         mtuxyyS2di3vIObw/73fuYmYLRMTE5xyoehdy00u0QnZ1+lFaGzMeBs+7bjC0IQ2NCCg
         bvv+X7iEOaba+0fyDu5QiWMeHuMUSP6qg+jJZVZ6z4sgDjmrJdlWyOlrvFQSEOjm+dIV
         /y57M1O8OtxvEUrAi2tp028nn3basr1Ti62nRPW3xLThWHFP1PuxhZt4oI+v5z1MSTjF
         OXWqwEJicRrBpvdIr/WxM6LzsGYpxoEbycjH8a/Dion/Vg/SDU1/ULdEFN2SamTBe5Qx
         NIGg==
X-Forwarded-Encrypted: i=1; AHgh+RpUnILEaum3HoScvXcwitu5da+uYXsmIc2k+jSMP4L9iwbSHdNDAlHX0RjLAMTGTl3kt2T6YCcymg0m@vger.kernel.org
X-Gm-Message-State: AOJu0YwuTiR7PFAtHyOOfvvYORlvLYIalTopjErjG1YI8GvyPXtR4Lsf
	mdPbJItJC2+KgOYcXjzzzqUMf6cBJshZo4pS7naS1a2ACZPJ2MXU+Mwpfsg6k25PJ6CftewLebI
	ND7R71DRYE0YrXkhQNx6zwPGGzFd3pH7NhMYESWqiZSakTaq34+gRqlUrgeVSKuFQ
X-Gm-Gg: AfdE7ckgqJtK4gNeur92kwk7nBQ3RfsLxfe1EOXzQumyeFs8i3nJx15kNcXl/Q0mMVB
	hRJhK9W0uSBAZ5qpDhqYbHpsLXQOePiPDP71nyJAaVmz5lXFXLM4kplBQHIWv8Lxyjg5dc4xRta
	fZOL/BXti/pmFqceADFatwlfuez+21fk8G6N7Zxcwdcmgro3hqW3Akwy9wA78AL3ftVMlGd7qsO
	/lRZvcluhsAnzzE5L90V0UeHs01C+muE1ICx4mrR7BTykECRFEykn1L9SeGuk4NCZbt37IJmqAR
	v3/8/e42JQTQENrI34mPcVEOXcdBGeE+OXNZD04DbgusWB2aZQw7y8jcfkuwTgn8po5iu63iT96
	kPkUYNXCqaEnkKimzm8enYkVCryaf7bI1nuzD7ho+USg=
X-Received: by 2002:a05:622a:1104:b0:51c:10aa:9cd with SMTP id d75a77b69052e-51c8b456c27mr108997391cf.38.1783684736588;
        Fri, 10 Jul 2026 04:58:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1104:b0:51c:10aa:9cd with SMTP id d75a77b69052e-51c8b456c27mr108997211cf.38.1783684736115;
        Fri, 10 Jul 2026 04:58:56 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ac41d7ceesm3801427a12.23.2026.07.10.04.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:58:55 -0700 (PDT)
Message-ID: <4c5b596b-1fc2-47de-a856-55621b038ca9@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:58:53 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50de81 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=IryoidPqrvUGrfnqEI8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfXyZVH8L90sWMW
 WU91ohMlfvt3XeKL4w/4CqoEZklwY56wGtoBoDeRN9fChRIYBklOg8dc2ozM9lNfvK2tmbnbOld
 nAKwLwDo1A+gX/TClivv1XzgtPMLhVmGEaDFNkIuivFjAKm1Zt3dYPstGIZ0Szv5Mbm7XJGv21g
 ncr8KhyHbW1NMaYoKtx9Y6qnHdJsMoOVW+xDpkK/JqndKgPVRjb2tpZD8h4Ibv6bbb93JxZnGuF
 cq0wVwsH8Nr0riZqMckUU5Q72cqMcldr/0hB9UDnCwowxlmYdYWjqAtb3kP/RczitNIyO0TCq+H
 MuwE7KH5ShQedZvABteEVd45rEuGF+v1t2M/WRNl2Q2h8Nn/5pmR+yLWksaJ4p0v2zgtwC29SM9
 Nf0xo0YTM2C18YiRtLGcVe8jfS9nfmUJv/39skHNMNb49w8WVJzIEHjHVBnVyeve7WW3+IHReFy
 bW5qcDHwsm78eGouwAQ==
X-Proofpoint-ORIG-GUID: WHC7Z0LyzTo4dmtRcs3zKwDE2IpbuNM8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfXy/ViPdJbns1k
 l2jLwsdX0EX2+VgtRXdIFdYlg62a9j0WhchoqZf7HP9l55hO1KA8vsqz3mqhMvyEVHOB0wemEFu
 bKbiRB8d8BvTeoNecxCD+PrfmXQ1u3s=
X-Proofpoint-GUID: WHC7Z0LyzTo4dmtRcs3zKwDE2IpbuNM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100119

On 7/9/2026 1:30 AM, Bryan O'Donoghue wrote:
> On 06/07/2026 08:11, Atanas Filipov wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Use devm_of_platform_populate() so that child nodes declared under the
>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>> platform devices. This is required now that CAMSS is modelled as a
>> simple-bus and ISP blocks such as OPE are described as child nodes.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Looking at my commit logs I see this isn't my commit message ..
> 
> Anyway.
> 
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index 2123f6388e3d..95e655a8b6aa 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/of.h>
>>   #include <linux/of_device.h>
>>   #include <linux/of_graph.h>
>> +#include <linux/of_platform.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/slab.h>
>> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device 
>> *pdev)
>>       if (!camss)
>>           return -ENOMEM;
>> +    devm_of_platform_populate(dev);
>> +
>>       camss->res = of_device_get_match_data(dev);
>>       atomic_set(&camss->ref_count, 0);
> 
> Just drop this patch entirely and model JPEG as a peer of CAMSS. I'll do 
> the same with the CSIPHY and Loic the OPE.
> 
> Modelling for subnodes is nice if you have the idea the camera block 
> should be a bus.
> 
> But for what reason ? As you pointed out it should be possible to both 
> compile and run JPEG without the compat=camss node on sm8250.
> 
> Making the camera block a bus is a nice idea for "reasons" as this 
> thread has shown, its a problem to implement with an upside we struggle 
> to define.
> 
> When the facts change, I change my mind.
> 
> You were right to argue to have this as a peer node. Lets do that.
> 
> ---
> bod
Thank you for the feedback. I'll make the necessary changes in v5.
~Atanas
