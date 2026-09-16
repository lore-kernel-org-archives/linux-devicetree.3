Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296734582E7
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545935; cv=none; b=oRlORc9Sp6rqUx2kv1UYefMek4DUQTaYq/wa07UtSq8pb5j1oAEv5FPQfZ892+N1q6DJiqTr6XTgliEK+e9KX9XFXll0RzB5SgtqCvKAk9aHt9WmljHnM6pto+tuOoNe3mjHpC8COpuTbOhyXzej1+lgI9x0/xLwCJHKdGZW5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545935; c=relaxed/simple;
	bh=PcoDdCIrr83oRm7NwUejbqInnkYFw14JsuggRsrAzaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BcDN70O4bZhhg1AibhRh7g49Dzbz3Kje9HM7SGQnJt3FiaIBkw1WQU34tUtteDi4Celc2ihflzcYCJGlwuaDp7XYwsybSU4wCMrvI0G87cLHPsCcNkxFSI10vWuj+igDcHxfuTxhiOevxHHo8qqC+tkCVq+SeWG6Ki1c1Y9FiPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnKS+OX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WApN8GGP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnKS+OX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WApN8GGP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68k042264852
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMtG0dE9KOzOS0Ul5d7vnn6cTO8RBI5Lu4clV+yWEr8=; b=RnKS+OX6LY6NAIDV
	eTAXl2puL2Z+1bukV8UZufyeIOEq3wY96Me19W3U7ezAvYd3PwQYrWqY2mR3oX/d
	XdWxreS2yeXYCJGP7eoiaWlJzFYojxZNEHyqEhCelupeqTKrc9kw7flPfIAfDSXI
	E/LX9bGO7fAoofS4Cj531erUqEPL3+J6KWUwg/k+LtOJUCW5zTif4BGNqmT4buYw
	mUzajS3SKVyg2MWhPs4PHG5+UYkeqiJ6L5CPmuTgVkoY482HktOIELAgyRBNcP3R
	TrJqfHpTREoqbWnQF224ivLyloMpwQ5G0xt5+JIzcZZsTafrhgCgrXbZ7/sNYFE/
	LBWBEA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftuhqtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:05:17 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c21c2859ceso2919141eaf.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 01:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789545916; x=1790150716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMtG0dE9KOzOS0Ul5d7vnn6cTO8RBI5Lu4clV+yWEr8=;
        b=WApN8GGP1xIpF1SAVEpzK5DaDe4ich9pWJfHCXI5KHW/dp7bJfDN5aqZB3OD4rrReK
         b01uUxGePef/HvT+FCHqzo4ZrWg+a17R8WMdYWSvXKoYKvPheMeMyqwDMzDjg6caZ/n6
         NTbDhu2MQCKaOtaeq7sd9dv4IRoMUwhgmr8p6sqcQkEX+M+YA2fTQYKUzeLhdXz4INgF
         EMcYff00LRdRjrjekmG56oNb/0yU45SvkSFONREPV/nG7M/LTcZdFHg6EbCLKrt1Qmn2
         PABOvUmXSR1TcT3Jz3maLrn/BdikHdc/HZwLSZSQivqLaBSiK3hwkl/PacWt6l7WVpKl
         5mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545916; x=1790150716;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMtG0dE9KOzOS0Ul5d7vnn6cTO8RBI5Lu4clV+yWEr8=;
        b=0e8KznY2PIyaEGKnopB8YbIMkMT2rVaHF8btGclXgWXNk3WJ0jn5l2yLkBCOjel9rc
         CxevzXmDF9TTwEE8mSLvW5AzsKfMQcj8n+LkpkqL1oN+1FDpNfkoqX7GiOPWg+Dm1u22
         hx0WCVY5eQR8GZ5GeFEA4MrsZmgDglj5X37n3khToUwO3gOw+fiDmNGPrumXYaS+OXBk
         j2kP6pHS2Su4maqfLj4SQZMGhuTwhD94jBhufK17CALIvDvJb7K1hJiP1qzDSdUEopMS
         4+xo6leRXNacpNkm81E2GizA4olS5kSjngduusUrVmXNzBIhaQqtQlo2CzB2I6QxwLfe
         1aSg==
X-Forwarded-Encrypted: i=1; AKwUvByzjh7sojAZmtpMB7JsAMBacKl/Nx30IjCWaQI86temCpB+4gqJp7ANWr4TSXf5kX3VMZoCSFKg/qVz@vger.kernel.org
X-Gm-Message-State: AFuF++kCbhqEZLYSprsWMD2D0Luf+jVfhhflUIvNjq58K7R9tPEqA+aB
	Xsuw19kbIuj8/IBt/9x2Nn2vgil0R8sBbM5ZKttCRPm1KL7mjpgBjXpBqe1t3X3/UR3YT126m7l
	WfWflNEUlXd0DZHhWJZl/iIP+DTL4ztU4U950jx4kU6br8TYvzocjWGa/ky/tI2/6
X-Gm-Gg: AYBFou3Xf0kSsYfNnlm3UgDkYZ2NgfbO/w8B0WM6INHJp62TbN1gSvMdCQJ0hcephYb
	rE8MtucyepOnxNqJiDvuUS2mSbgkSfMK7kYdYRG7SF0wHFoSPnHqm8zWlg7H8tOEakU+EOP8bQ/
	9ZByih65GfM9DURt62Fe01PtCjgtKN1H6sXqlT635P0sOOUoc9JqxlDBwF2YQl1fLCcSUqELzR8
	Yfhb+maB4WFVMb4q5u5z/TF5HVbzR1cEYtz2KlTHfAuDww5nxYq2jgp9sq/rSXKo3xvQXjJcSNE
	M+Lud57I6q0MLicNpTwln2Kppw/CIBKhcww/+AGxO26KtEVDrnPnkzYmGad3xbrFRx+e+U+pWtP
	XfnS84bmSI/WUtUQISRrsat+86gqjSw==
X-Received: by 2002:a05:6820:6ad0:b0:6b3:6236:6fa with SMTP id 006d021491bc7-6c7d1cbf597mr1540864eaf.21.1789545916585;
        Wed, 16 Sep 2026 01:05:16 -0700 (PDT)
X-Received: by 2002:a05:6820:6ad0:b0:6b3:6236:6fa with SMTP id 006d021491bc7-6c7d1cbf597mr1540838eaf.21.1789545916104;
        Wed, 16 Sep 2026 01:05:16 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395bf6e8esm4914471c88.0.2026.09.16.01.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:05:15 -0700 (PDT)
Message-ID: <5ff87d08-c263-4b9d-a18d-c8da8fc0de1a@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:35:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
To: Mark Brown <broonie@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
        Saikiran <bjsaikiran@gmail.com>, monish.chunara@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        lgirdwood@gmail.com, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk+dt@kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
 <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
 <3pybhkqdvve2ct6burnhav3utis6nljz7ncheqcrs7v55ullz4@nek57empeoca>
 <086f8e7c-0afa-45d5-bdb2-54ac5f79eefa@sirena.org.uk>
 <xmjovrqonged7m77zlx4gbz6xvfksygbw7g4vgv2stlucvqoy6@uie3qdhdtkoe>
 <aqg-JSTrbg-xR69l@sirena.org.uk>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <aqg-JSTrbg-xR69l@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwNCBTYWx0ZWRfXyw8qjPfCv7LC
 z6SdbVL1115fgbAdmgMKez52MVqZwmE9jSc52SFn+gq+i/3Oir2bMo9xrGnZIqTFVDzze3xA/U3
 JbtKO5DzRbIXg0FgiQYmeYOQcWfO7JtszkhEQFHGJnEfjZh6p/jUYcH4r59ndTU1tEyDbse6FTr
 zl6p3Ci93lnEtnAU3N7Hs/QmuMLlJeuUFY+j6JgfaJ2a7qzMR6pvX+oRg/SuhtFsOhJM6kEsCeE
 eWpVWm1PB6QGYxpGzOvNLmuLzuH7QZRXsmjbu3DFrq5M8KFRK/oY7ni6EA2iv9uwyKbtBl0NIsb
 XNTwxISvfzUlWdeZsDgOiPcITxPHU8rrh9986OoF1oq1DtcOIEYXWKySmxRiF4MyW9xvs6AXXi5
 BXoiM5b/ETCGaZz08cy5o3coqN1FHdUKI1ojEXevArm+GfB2wB3VrKg0sLR9Q7d14271Llk9P4V
 jgz1neqx9CdBCaoDBBg==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa4dbd cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=_IcSBqDZdpl3-7frVEAA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwNCBTYWx0ZWRfXwcBn8VKJzI8y
 CzqPBpGd9DlS6v/dVOmHmjFciMK0zP39oF4joYxSIh9gf9phXwaROXRH+ulzPiAEv31GtwZOqjl
 ghYDN4Uetdb7We8l+KZ07Ndr3DnboZM=
X-Proofpoint-GUID: lnDJ0roC363dB-HnJR3ZMJiYco_hOaaf
X-Proofpoint-ORIG-GUID: lnDJ0roC363dB-HnJR3ZMJiYco_hOaaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160104

Hi Mark,

On 9/15/2026 12:04 AM, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 02:34:21AM +0530, Kamal Wadhwa wrote:
> 
...> 
>> 3. If we can avoid turning the regulator off itself, so we may not need this delay
> 
>> point 3 - We evaluated this for UFS - but the problem is that the issue happens in
>> the defer probe path, so if we avoid turning off the regulator, it leads to long
>> error prints appearing for the regulator being left ON. So we couldn't take that
>> path.
> 
> I think Rob might be thinking here of something like the runtime PM
> autosuspend delay where once the final reference is dropped we wait some
> time before we actually implement the power off in hardware, thus a
> quick power cycle would never actually get implemented.  That does sound
> like a good idea if we've got issues with quick cycling, obviously the
> actual delay would still be needed but if you've got quick bounces
> happening routinely then a delay like that would allow you to avoid both
> power off and ramp delays.

I'm working with Kamal for upstreaming this series.

If I understand you correctly, instead of the approach in this driver
change (only setting the existing variable "off_on_delay"), you prefer
having a sequence somewhat like this:

1. Regulator (if configured in DT for this new behaviour) gets disable
   vote from its last enabled consumer
2. Delay timer is started
3. If regulator gets enable vote before timer expires (quick bounce),
   clear timer and return without touching regulator HW
4. Else, disable regulator when timer expires

Is this what you meant?

If the above sequence is right, where would you prefer it to be
implemented, in the regulator core file or our regulator driver file?

Thanks,
Jishnu

