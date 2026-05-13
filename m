Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44364DB54A
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691735; cv=none; b=pePWyudcyovh3a+34aV1+AqNyoMs7KOFbzGKhGqYQJYXX8nIjDy8/PgL5SQHx29Q7Y3HUiisTLTFqI5ujpm4lHMRxjJRIWdtZzwlHFGBmX7Yu/hEfILnjOUwfis3XoiI938QydDI0DpyeibzVBganmAElQ6drQSywzlEk0YBtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691735; c=relaxed/simple;
	bh=vWw8VNMpTozvTsxTcuJrrcpVmar5XpLh1HoI5fCIVwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mijEd2CqHONbLbFYe9h96zV8Xm75rWuGXMZuPvFJeos48J9f6jHdWqMptewen69uSAY3szjZq3IcG9ikeFiqtLyK5nao9Bk1NKj587Bs/TefLzZZ3YnziIHijY9FcnqKTKLwJ9ZIZ0gUm3TFd0l+IDWhwg+hzoEunFqLmNSwt3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwRZJSVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjyzGrYL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwRZJSVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjyzGrYL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF4REP4159634
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Epe/2ttfl7TZzFSqB6s3aukVQ2ELJi+udFPb9frU3k=; b=mwRZJSVhviiSAN7O
	+dPy6BYZtRqNK5TiHRlEYWwo33oPXH28KRXkO3fLIFl8oP8mqsbZ6/K/vPH2g4FP
	iY+aLQ8esUm0nbCHaBB9H35iSHTWjrN0PaDJIkOyxA+wOZNy0KyDnl0INvZYlAZc
	HtMCLt04bs18rofVJ73OYiOakldLt5OkhpR+RHih8NHAkWvFyZSBrvML0sNeYrC4
	J53WCLZCEARze3+WCsT/fRdasYHjx7C0Co8E6TO77OcVUQyLy6DT7Pts+VUwfC0Y
	ng219d1ASQCrh1wtdPjFWHkDYB/G7KXGk2kiWWf8vD2I5X/ieQ9iliYVxeirHJTS
	6YoOyQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91sx2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:02:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso39088835ad.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778691730; x=1779296530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Epe/2ttfl7TZzFSqB6s3aukVQ2ELJi+udFPb9frU3k=;
        b=hjyzGrYLDMwLe29CBF/XgRi6scaPct2/hVu7l+8rRtpezudttk9jsB4w1tHzao0fet
         L3DwpipKvUHYo/bDJ8qXZeXSzJH+xfRmoNVLDVCBzLvgUV+cS78fTAMd7zJGHQbKOF3v
         WCCpIDxQqiKDlimAUJL2MOTVWdwYFga7HYer4xW+HlHtvEvxP52pUJnOGmgE2voJ6mBI
         5Zrw4Hpd2Qq4diuSIdHWYDOQP9YTbT/IVE58zimOe5ggNofoUyvFDOoUlCAujmoS8+Me
         ALeho384gZV+kT6iQAIV0G0yQkCaeS2/PTK6cNm5bxWP1yGW24WwV+yoUyPgzkyKqeA9
         6krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691730; x=1779296530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Epe/2ttfl7TZzFSqB6s3aukVQ2ELJi+udFPb9frU3k=;
        b=GsFOJWiyD5Hxf3IkhtQT7pjpqfp8417k+M5xTwYCpcnyKWPfpYC6lCtS7IhaZvFGfp
         B9Gg02CDx5SxRH42oI5wDELf5o/kpdaKHyuR8mgNlg0DNrrBNuNgyuuvKjvy9TAIPD3X
         jUNoZul1xuY+TRZKyPuk73HLMMjtVli8GGCvVaDMi2mQkMS56GPL20nNpRupRrrh0SoW
         8fWir+tO6/LFT8xMgh5/th1IWKkEUE9mGpNO0pAAa5A9UdW9/qS25Jgms0ujt0UjCxCK
         iIwtF1yAnl+4iaIZ/XUHmIelsndNvO1/eQ/1h9HBsOHymMn6BBuzvcUDCA3fCR8I7xCF
         mfVw==
X-Forwarded-Encrypted: i=1; AFNElJ+8Uh+LupEt+KBIn+W0vmyC4ua2NDt9VYqYQimvIBN47dtPb4hPx5b9FKcLf5A2B1b6B4Kot+D6X1x1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3+R+Ck3U6Ilng0S3EoRmlVcRd71MQ3Y/5mxjkW96DTXsJqGkg
	+INKryhWcb+ETfdgsJeBYZxDWIcHWR0/UmIyrlWuDLAKhb4TsxQYSu2VdeSy9Q247eFxlO9HC5h
	OoaZjOOdw+MF9hKvXp09HUJ2kTL5xAh200zAX8i5VUVuLR1X1PTtnsv/AlZ/fbnnp
X-Gm-Gg: Acq92OGilWp3xw46iJ9usQUUviaDPTqwBipKo9QzdX7ztUVjRBIxOZVBDIdGxj1TIYk
	t6tvFUhMIX4NKDkBKPH4jvkpEMs/1Q7mc2q1+d0YTlc+aYEVLOKefj2J9a8MJfNrqUtTXKiGE16
	eLpT4Vti2tISHJNwLIEeccY2JVjdhdxy80vy/MxHaSjctHPjXRN/NkHplW9V3ZGhDoLBfLE37GZ
	LaG9q5EoivBwokwURIe7c5HqA5jhSWoopqpkmwNM9vlH/7gbtlelo2Z3kYFc4zUK/YzfYJQK1GC
	FaZ+OenGbcE9Sdi8j9Blqlsxqb4+SwYwdpEnruIQlknlP6QNx/SIOYWGdVk6m5X3EjybSodaIBF
	/n48pz9ouq7kzLn0lZYWWRI2CxAqjx2/XwrH4DPpd4m7y43rEubIrCgGGDKk7n5O89SI=
X-Received: by 2002:a17:902:f551:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2bd30210db5mr41157565ad.21.1778691728388;
        Wed, 13 May 2026 10:02:08 -0700 (PDT)
X-Received: by 2002:a17:902:f551:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2bd30210db5mr41155195ad.21.1778691726554;
        Wed, 13 May 2026 10:02:06 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bc83101ee1sm141611295ad.79.2026.05.13.10.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 10:02:06 -0700 (PDT)
Message-ID: <b328450e-1bd5-4e3b-83cb-36ab647da657@oss.qualcomm.com>
Date: Wed, 13 May 2026 22:31:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/14] media: iris: Add platform data for glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
 <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
 <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
 <wequp7ogk2az3d7yzfxn7wwlr6k5ng2jwrg6anaidseteuwlev@v47yoo4j2gbz>
 <ad875fcf-531a-49af-b58e-575185c12d77@oss.qualcomm.com>
 <j5uphbr37xxv5fnmt63g2y2ulykeyovxq2ovw5dxikswrppcqh@vrwmxccsrbjw>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <j5uphbr37xxv5fnmt63g2y2ulykeyovxq2ovw5dxikswrppcqh@vrwmxccsrbjw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3MiBTYWx0ZWRfXy8Hzgs04c4jB
 gEzMX/KJ75rJ4kto3iONGqFMzcp9roNXt3/1dCkjiJqxGprNO2/QznTVsfnHo3IXuSRgVxbrn4b
 O+WnGxaqvWhx6PTJXJG5xf0oDVbDJpW8nK+2WZXm1woy8V+YiQvdn/tj5gZt0jQI/DGXTHuS/sv
 8nCTTSs20Ub3S0Pkid2SpQ5AHSrmbNnOYHdjtR2h3WHbKHvMP2rpeAB1UbnQKy4DSdQ1iDBmCKk
 zFOuVQjtMeWM+TMTyL0ZurENEVyyspDCg7I0dca1+G5LHuf58Wf9xfltBmlwPhxWzC0CzdZFXRz
 WvPDhYD7nlKNzz/6cbs6BhyjeJ4hX6nWb0JMjLtPVs2GQ8viPSlqcFZbzGewjM183bAq4VV230D
 tPbKYZR/tvx3FDTjTKJivjoWCGvPPw==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04ae92 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BiA4-BlHbpJUGHtcRRkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6A5wOOwtGLfN31GB7mSY3b_sENDF5MGh
X-Proofpoint-ORIG-GUID: 6A5wOOwtGLfN31GB7mSY3b_sENDF5MGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605130172


On 5/13/2026 9:33 PM, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 08:00:39PM +0530, Vikash Garodia wrote:
>>
>>
>> On 5/13/2026 7:47 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 11, 2026 at 09:45:01PM +0530, Vishnu Reddy wrote:
>>>>
>>>> On 5/9/2026 2:35 AM, Dmitry Baryshkov wrote:
>>>>> On Sat, May 09, 2026 at 12:30:01AM +0530, Vishnu Reddy wrote:
>>>>>> On glymur platform, the iris core shares most properties with the
>>>>>> iris core on the SM8550 platform. The major difference is that glymur
>>>>>> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
>>>>>> one. Add glymur specific platform data, reusing SM8550 definitions
>>>>>> wherever applicable.
>>>>> This leave me in confusion. Having two cores, each with its own set of
>>>>> clocks and pm domains, I'd have expected that each core scales
>>>>> independently. I.e. if the load is pushed to the core0, it requires
>>>>> core0 clocks to go higher (while core1 clocks can stay at the low freq).
>>>>> Or, at least, the clocks would be set to the frequency corresponding to
>>>>> the max of the workloads (if for some reason the cores should stay in
>>>>> sync).
>>>>>
>>>>> However, I don't see it in the code. All clocks and all power domains
>>>>> seem do be scaled using the common workload. If my assumptions were not
>>>>> correct, please explain it in the commit message.
>>>>
>>>> The OPP core logic sets the rpmhpd level and clock rate based on the OPP table
>>>> defined in the DT node, where the clock frequency and power rail level are
>>>> tightly coupled together. Since vcodec0 and vcodec1 share the same power rails,
>>>> independently scaling one clock high while keeping the other low is not
>>>> straightforward within this OPP framework.
>>>>
>>>> Do you have any suggestion on how best to handle per core independent clock
>>>> scaling within these constraints?
>>>
>>> This would require more plumbing and driver changes, but:
>>>
>>> 	iris: video-codec@foo {
>>> 		compatible = "qcom,glymur-iris",
>>> 		clocks = <only-core-clocks>;
>>> 		resets = <only-core-resets>;
>>>
>>> 		/* or core@0 */
>>> 		codec@0 {
>>> 			clocks, resets, power-domains;
>>> 			operating-points-v2 = <&iris_opp_table>
>>> 		};
>>>
>>> 		/* or core@1 */
>>> 		codec@1 {
>>> 			clocks, resets, power-domains;
>>> 			operating-points-v2 = <&iris_opp_table>
>>> 		};
>>>
>>> 		iris_opp_table: opp-table {
>>> 			compatible = "operating-points-v2"
>>> 		};
>>> 	};
>>>
>>
>> clock source "video_cc_mvs0_clk_src" is common for both the cores. It would
>> not matter if core0 is scaled for a specific workload and core1 is scaled
>> for different (let say lower), as the common PLL would always generate the
>> higher of them.
>>
>> Infact, going with the approach of exclusive scaling would be an issue here.
>> The later core scaling command would bring down/up the corner for other
>> core, and could lead to under/over-voting.
> 
> Are the dividers between mvs0_clk_src and the branch clocks really R/O
> in the hardware? Can they be scaled to account for the different
> workloads? 

dividers div ratio is pre-fixed in nature, does not vary with workload.
Again, you need to look at the source clock, rather than the ones at 
different core. Even if they are scaled differently, either in software 
or hardware (assume for now, hw does), the source would always pick the 
higher of the scaled frequency corner.

> The commit message should capture the details of the
> interaction between cores:
> - Can either of them be turned off, while retaining the other one
>    running?
> - Can either of them run at a different frequency than the other one?
> - etc.

Lets capture these details in the patch which enables the power sequence 
for the dual core.

> 
>>>>
>>>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>>> ---
>>>>>>    drivers/media/platform/qcom/iris/Makefile          |  1 +
>>>>>>    .../platform/qcom/iris/iris_platform_common.h      |  5 ++
>>>>>>    .../media/platform/qcom/iris/iris_platform_gen2.c  | 99 ++++++++++++++++++++++
>>>>>>    .../platform/qcom/iris/iris_platform_glymur.c      | 97 +++++++++++++++++++++
>>>>>>    .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
>>>>>>    drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>>>>>>    6 files changed, 223 insertions(+)
>>>>>>
>>>
>>
> 

