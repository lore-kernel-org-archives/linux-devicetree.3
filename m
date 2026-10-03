Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3E8382F08
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 04:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002163; cv=none; b=U26qu6gMiGbTHnXWBDzOKH5O0MYVkrhkdYD8zz15yrlQQKO8Mw9XXbzwNOqj7KpIZZk31nuDbZYTXE2df31m2MHYF6gUgmLgOvUC0ZO2R5ZU08WP54npDaIQLUDmENCtKkgukJiK3MuHOu5Y7ZGxxp/f9QLh3nQdUuavxOCZ/eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002163; c=relaxed/simple;
	bh=bCd7eq3BXAnK7U3piXSHOrcMyq5T7wZbV28bkpGeuqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZJd72LH+YH86zvbvkReuPWvWKgItOXnqONAvCMfwWYDvR5iLDNIezqkMh78QBwPRHvb3hcjQSwGoOGjIx+4p9P7M0ipg1pnr7npvWTZIUlE2lbe4C3nonkBM+WhJqwBFW2PssSt7mNv04xPbZhhQncCeq2MoRsks7/GSdPgoC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAuqpBks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bD7kMGt/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAuqpBks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bD7kMGt/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933I1UG3628155
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 04:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Gni+Xpimx1HzcnK+4D8GTpegyFf9CN2x+hfzGZ+jB0=; b=iAuqpBksVolr2wpe
	9IY/VWCYxYWrlYndx1OzSKFhrMY0Ty+2EO7E6f9OcEMY7fIIK2fSrQQGHYFSpc4E
	Wh7OYLcAc9tB4L2lA+AzgyOrLp4/wjPrYiSd1LO5J6FGJjHoS2FxBdZNLK9FOm/P
	JrU35RL60a/qiP5B8/EsmvRtddK6lyPjhQOJIR/D8ZfKtEKjzfzmLv4dyQo0Dt6B
	EPBD1KUul8UmqU3Bwv9vkfimsHDMSjSqwu2aonISrXWSnVrLGnrNURE6sxZMJpvW
	NpLO7AxfTVbXuwXGGykz0pRXxsaojRzC8SUAtkbdMPZaTCajE2405Q/rVehtkm0N
	liytEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa03sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 04:35:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso11161eec.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 21:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791002159; x=1791606959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Gni+Xpimx1HzcnK+4D8GTpegyFf9CN2x+hfzGZ+jB0=;
        b=bD7kMGt/LBS13W1TnSy6Qf/2YTWtvs30h/YBgHqL7qTko+NIF9zlCmF+9sd+qCZMJt
         2LHRULwORtjLXEuEH2Ol56hEhtZ/5I+1QV6Rs2eUyZlCVZTeLteOA2COUFnWt4eHWEJ3
         Cwezu9w4BEbORry5BCHDnBtSS3q/vq8/LiMeMBhuWI5QeblfsHX3/TVsRuUdLGKYUGC8
         nf7ncctjeIXAMQEZCT29y/l+fsZG+nuX5Ka8VEIZuhaCLlczsaITqfBevbvubN6DYm8H
         QeW7caQs7fnd9brJlyiWrGL++3qsJqd90bxQiATjaDrMu7z1EeDax2/bepdKlolr2QAU
         ei6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791002159; x=1791606959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Gni+Xpimx1HzcnK+4D8GTpegyFf9CN2x+hfzGZ+jB0=;
        b=1qsutlrWO38QqW+R5NbJO3zp1JcW2ddd5am4TIKPubQS/UvphWGZIRE2Wz+cfr2acj
         +1SDv83UVDnS9/cL6CPNUR4M0YMwB0UBRWnErqC0lLbOmagwMoE08vHIR72fOSl0VwrZ
         b383cJ3xxHVILXh2AB0O8INrJ+pCy6iOMQulwsN/4hAexcdul1BjCOK/xJEsNVzk8XrV
         DO3HXMX9tWDNJaK69VF075bNwfsnTweXjGby0SYQi3JC5XHfiezrNPnnFH8GnL8tp+TB
         5wQlHj0ysoSHkdAE9EETTlX6pwR8Az1nksvK8omssruVteCRDING9JWB2udzT1XzOIf6
         HhZw==
X-Forwarded-Encrypted: i=1; AKwUvBy0Su1aiJeB6GlCNwXlg1vnVnR94yjFE20FaDlMvAsOKFUAte92HI+a+qtGOQn+1gMqCPq7lljBnDDl@vger.kernel.org
X-Gm-Message-State: AFq9FYLMkRrgFreD9Xu8hV8HQgrPENu/tNaGk+5CzQuHyQOfm59r1pWF
	eIQm+WWPCWYLysVv1BayT/LtNwZujz6DRVnn1RxGqhozYw/B5QPPZw8iLf9s++o4OqPE+p9qhSM
	GTAIb6nAOGQkkrzE24lYDSKJ9oLz4Hzj2ROH2JPrrG1MNDJLw7COjZ2M9hFzwr4No
X-Gm-Gg: AYBFou00fGov3P2y+4JLx+WOK2Jhqyz3fGfY7C1ZPGy10+AAY1VIXQnIbyjMBlc92zg
	yt2uJ7Il61D/66E5xO34q3WnK4t1VvBM51Th3//GHerxalWye7jHU1DfAsJc7x81q8OQXirMQVo
	Uu2QZoufxLuxASRQM9UszXjMYyUwAyK8IcOCQo9jVI4c9KVhnWOUsxDAdW37RC+n5PQ5jzr+ve6
	t/Xi8Ly73l3hLRcVpdtTNakp8QEKHIGOnJwydN4lsCCl+5BPHyl9vXaNjO75eJp84YVbsFf67Sq
	t2JyYbhriwp9TvQWkro8PDEhr4hCMxtcV5lH8s7n84Qknv1RY99KjvEtxGC+afqNvQL3utA/t6V
	R0kBbJgzY2iqrbgxBV7IyKCiUYMQl/w==
X-Received: by 2002:a05:693c:829b:10b0:351:1251:dada with SMTP id 5a478bee46e88-3511251dc63mr1803022eec.33.1791002158542;
        Fri, 02 Oct 2026 21:35:58 -0700 (PDT)
X-Received: by 2002:a05:693c:829b:10b0:351:1251:dada with SMTP id 5a478bee46e88-3511251dc63mr1802996eec.33.1791002158070;
        Fri, 02 Oct 2026 21:35:58 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.226.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fdb478sm9685244eec.22.2026.10.02.21.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 21:35:57 -0700 (PDT)
Message-ID: <83f9467c-66f3-4ee9-99aa-96e64dff8815@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 10:05:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/15] media: qcom: camss: vfe: Add support for VFE
 1190
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-6-cbbb42e534ef@oss.qualcomm.com>
 <45d79c84-cc76-4bee-835d-ed11ce07bf2f@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <45d79c84-cc76-4bee-835d-ed11ce07bf2f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAxOCBTYWx0ZWRfX2NKTeqS1BJpq
 DGAC3sdiv5oXIKwbzhNpEc9Bk8fEjAsh748cRdOYj1BG36LUBU9kQdxrN7MBgudlddlkkRboaaF
 hC3hJEgAmzzPCC14ZivTlxlG8lMID67R+vySjsBWsexKX1Lx600uKZ24zBFUUody2I3EEQ1Uqr0
 SWBoD4KYcpTJ5xM8Dm34DTCwTFYCiq1UCdYJ+XByol3RMMqF/EzyAN7RRXlh67V86fFWykshppi
 tv8KBNVpSYvfLW+eKARq/tEpRVWdy/FDvKgcoL/KZvCQGjHHViJ/OGfPbbP6vIb/DPoKG3FU2bl
 IrHBaXQg0pmIIrSIWPfa7xDRfCPgiDdA4+DHwhHHKr3w6/FZhQyuzxuQJGUBoEhIa3f2qW/9mbo
 KJdLgYZGK6GvruI8n2iYvVKe228CMSV8TCJ0tR7k7WBSsZlAAuKdDJkVyidO7Jx0U7NNR5ZJbeq
 vE6lh18p34A4SxZhjCQ==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac0862f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=+9gQtCFHUNSz6wH2J7y5Uw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=dIRWhvgA580vZDZgd7gA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: oJMUh6CvuHD0X0ML9uml9GuLtxD6_Fjo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAxOCBTYWx0ZWRfXxibnWXWrcJKv
 sTt79iIwToTycqUToaLAHwadEEADhu1y2Cxq07eULFcQsGTGdPcelY5ICzRe4KsjRYM6XbMV6PS
 5CmDV9LaKzGbni8cVwUXrNIICP4nCYg=
X-Proofpoint-GUID: oJMUh6CvuHD0X0ML9uml9GuLtxD6_Fjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030018



On 02-10-2026 20:05, Bryan O'Donoghue wrote:
> In other words VFE 690 and VFE 780/880 don't share the same write-master index.
> 
> So they aren't the same silicon.
> 
> I'll go and find the Kaanapali thread but the feedback here will apply there.
> 
> Name the files per their silicon version not some genX.c moniker, please.
> 
> It _looks_ like 690 and 780 will need to be separated so, I'd like to move away from this misleading genX notation - it may mean things to qcom but I feel we are burying inappropriate hacks inside of convenient gen files.
Agree. Will fix it here and Kaanapali too.

-- 
Regards,
Nihal Kumar Gupta

