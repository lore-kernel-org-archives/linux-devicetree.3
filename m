Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB94334C1
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010793; cv=none; b=gU8zA4Up/PKgmWQUSOsIZ/jhVTX3hcWxBb6+f0+sj7aRYjgvXgHLKoojM4GHh4di8DSyyUDudkQ4jYDOB6VoX998nbUuNngg3yurG33jmVDAoTdHFWyBhoVjFRA06FZ+ItmBCVHilxEB7YObObvpYvY3u1HWhHmOHEmW4AhV4kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010793; c=relaxed/simple;
	bh=DCfnosgwu/FrZqMiH5UhrO0v0ind7PYqih6HdlBm4PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvuu/bIcshCaaSZXFMe75cdpnBO03JoA32vThtt19MYXkdAVWOYwAS1nKaNtNqia3FOb+834U0sAKNz/WJNuvAdLB6AotdyWZBxmSBdNDmW6WuSF7Tg8q9ljdl1fW/e1TM/h3IvT86OprcvJIaq25sY3iIl4lEwHjX5qhjvD6F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZRrEjnM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1resibR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZRrEjnM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1resibR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhXp1871354
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQMZkO/gS0JEQk5Oj8c4mHgy2yd4gw33IkvrUv+5FNk=; b=NZRrEjnMMDy99V/e
	dusxbYqNgJvj9qw1O07hyhTJi3K7mHSodH8zjnjtJ6X8FHIhMSWN0HxkAas6nP3A
	L+9WljRyp6xK4EKjZ3rhV7ROz/5Aljfq5vDbSrphyuvq2LEqxz8RUb4q/sfGm9f9
	4OfCVvhIUScjCkOWMAWX8Dlr+bS/cgqBaW1AZ5A9Zbd23Q062W//SVjO7jrb5lBT
	v77h+yK9jfMt+UHCKSzF/ROtTiSiTeJl01wQtWV4gg7O3UWnIafsnLLxHrlrqT1o
	A5ol+Jv/bFJ+aVjc3ePy9vliDDqYjFdUJxLTh7jNGcpyjtYC3h/yQi45FA+Hai3i
	VUhHKg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud1esb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:06:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so3248606a91.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010783; x=1786615583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQMZkO/gS0JEQk5Oj8c4mHgy2yd4gw33IkvrUv+5FNk=;
        b=O1resibR9XvbxyX/I4yjXAf09YHvQJGK0HsXMtCylwQYxLHEf3xiUtKAT0S/IW6pH7
         rhPQwyzhoCUNP9GgNnjKI5l44ESkMR1SNofe1qWqOOUnR9i4KWPAyRjvEtAbKluBXa2V
         WDMp3pn1DIoIfC4K89XfJ9y3eqO7m9XAfi82SXZJ94vJQNNvoY8nC73odjxiUl9SYjiY
         Ke87oXpVeRJcgDJGdTQEty0SwrMqZogmZT7QDwCBbeTdeE9DFWdyDN1evvErUz+U5ZCb
         eLwgmA4DgTxsmbcbkHAUZ7azombYQRYkyYrQztC7qDt5yhw7khT7HGwr7E9JEvv624nG
         uPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010783; x=1786615583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQMZkO/gS0JEQk5Oj8c4mHgy2yd4gw33IkvrUv+5FNk=;
        b=j3gi/kjmlSHp+HwbZwaqz03IWe2N1pQk/Vy+0a1th1FMITpyKKaL1kZU2FCydG94jy
         uI7PyG1W6aeXu+O33JaFOx2kRdYFPnJA5PQcbGC1SOwcc9YyDIibmEQx1e7OwLd78PPw
         r60ipPemI9j+a4rF7gMjzlfol4pLunwyjZe42NNY1WdQWkX5PLEo+6vzRwjieEJjzNr/
         BgvQIoln9J5B+arLd8E8yWzcnVGHrtVyhOLz8CGworq1gk1PsCP/qFZ4dj2LdIgYhLXF
         KV285VR11kdS8ug6dmzn0jjXFyaE17V6TB2pArYXMKYbcp+CrQDXXIqEh6OM5rOF6x0/
         zHGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0XVHFyxfCqcP9jp+mkZ7B3r+FiQvoDpl0UAkbnezhsZivxI79eXSCCrDS10vcDNCRNJwY24dx7obk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7L8ayXQ4/ZgvhSSEHlB6ysxxSVl/yxE980fXaz0fuMlKEaP0k
	veK8bAnMY8qEiI3eavEtie2X048kPodZEfcs93FgfVYVHh62bgkORrIkrnjZ7UefRlgPzyfUODR
	rqOxIGrm8zAgK2EyJuY/lmKyY+5xAdY8mKBRoH7Ntxq/wKpMRpPNdchUMXZhiLybX
X-Gm-Gg: AR+sD10GT1jq/VqePYkztlfEH3lj4jvJVbViXJ+xCv/jLAzRzuB2ZRrn1zqTSrQXvr0
	tiT0qiBmbaS4sPRUEzFfOdhrGTU23Vgh9qw9zbpBGOp5WBNERo1wpqQd+O+MTRtXnWq6jwr9uXm
	NdG2XpJJvFcO4NTozN44qacmRrVR9YbNPl9s2Y48Y4CHT8OofsY7kmtjUAt+tAyVaOt6QNC8AXV
	ZeehgymmvG5wMkIPSDWbfsGJ5wcLgFFXOTqmwGQCJDZg0aFnPoiTgeEYmrnzcwsvCP9pLgADuQD
	BfNpDmnnSEk53hj2OUiZ4UzUSXAOdZMgO8/Mtg4Dej5kK1T/Z/sCvoJEssFVfMM/OluW0D0aOS2
	+GJEzevC6Wrf33cFxGHw0/biGRXOPLvaq9BM=
X-Received: by 2002:a17:903:17c3:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2d0ca165189mr158754595ad.0.1786010783111;
        Thu, 06 Aug 2026 03:06:23 -0700 (PDT)
X-Received: by 2002:a17:903:17c3:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2d0ca165189mr158753755ad.0.1786010782680;
        Thu, 06 Aug 2026 03:06:22 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm38499323eec.1.2026.08.06.03.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:06:22 -0700 (PDT)
Message-ID: <639adb25-2495-476e-9b8d-d07d34c12895@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:36:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] media: iris: Create pixel and non-pixel context
 banks on VPU3x
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-7-da52b5228dbd@oss.qualcomm.com>
 <4lhoiiuaiathwqscyvm2ruqfqnz2bzjbfe7s7tqbcxfcqphjas@u7vvrj2scxi4>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <4lhoiiuaiathwqscyvm2ruqfqnz2bzjbfe7s7tqbcxfcqphjas@u7vvrj2scxi4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX0NcBbiOHOLjV
 BoR2DBS3Yt3o+liRxE5Q5yPautOXNlGVA7OVrPBOQPe6Csz8luinTzeHXlkO15L/REZsC3cQWv3
 w7uSlCt8A3A1H+Zjd58aBPTQBfIO9R67VxgprMdVjhF5gZk3QHRmGsyJtnpXwJAg4P/pi/pkdOB
 pW7y2aSjifXVPz1i92wUkNYbZmwQIMI1hFctHmqLfSkzXG4qO44eLBI+kCcoDUUx7QzwtGPOiWy
 BLxI5KnmHBpnYnGxFNz1V0sVMoC0kr00RrtaX3/r/d8igrh0jeCK0wtNzfdBnVttXD3xNnvbIed
 fHn9qxJ2YxpeTttxvazepZ2gZPUaUBiqrtBzUMGx+1eMGBu8luG3XG5QS7nfa1hmJw7tgSmawS/
 iqeJdxiPW/KtBiuaMd1THxcKwsQVyCv3fskjRUYbKNNbQ7nTl8VZ5EtQlPZpXMis3m1TKR7Pqt5
 kolApzXZgM2KiqfYjTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX+HUtH1y001NI
 QPqPzBWyJdr0pkFoRD7iypP1zkRvLP2kgjEvJKo03yrIfI+GGy4Km+5oYnjgDHplCze0XdYH5v7
 jVCpcBMqGXOY+nDbi3dMVxBno467xy0=
X-Proofpoint-GUID: jDuIqcXWUhTY3ixM95hqy35uxV2_9kIz
X-Proofpoint-ORIG-GUID: jDuIqcXWUhTY3ixM95hqy35uxV2_9kIz
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a745ca0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=fMNUo35Ht3zVPTVqK28A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060079


On 8/6/2026 2:37 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 31, 2026 at 11:52:22PM +0530, Vikash Garodia wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> is restricted to use 0-600MB of IOVA space, while the pixel stream can
>> address the full range.
>>
>> Implement the context bank hooks for VPU3x. iris_vpu3x_init_cb_devs()
>> creates the "non-pixel" and "pixel" devices from the matching device tree
>> subnodes, and iris_vpu3x_deinit_cb_devs() unregisters them. If creating
>> the pixel device fails, the non-pixel device is unregistered and its
>> pointer cleared before the error is returned.
>>
>> Wire the hooks into iris_vpu3_ops and iris_vpu33_ops, which cover the
>> platforms whose device trees are converted to context bank subnodes.
>> iris_vpu35_ops is left unchanged, as sm8750 still describes its streams
>> with "iommus" on the parent node, and the fallback in iris_get_cb_dev()
>> keeps it working until its device tree is converted.
>>
>> Backports are intended since the first DTS of 8550 binding schema.
>>
>> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
> 
> Drop

how do we backport these to the prior kernels ?

> 
>> Cc: stable@vger.kernel.org
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Tested-by: Daniel J Blueman <daniel@quora.org>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c | 38 +++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 3dad47be78b58f6cd5ed6f333b3376571a04dbf0..623a0f8a7982c0b5c2e3741a34c1367e9aaf4e27 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -254,6 +254,40 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>>   	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>>   }
>>   
>> +static int iris_vpu3x_init_cb_devs(struct iris_core *core)
> 
> What is 3x-specific in these functions? Can they go to vpu_common
> instead, as they seem to be applicable to all generations. And also, if
> they are common, do we really need callbacks? Can we just call these two
> functions directly?
> 

I think we can even do a direct call, thank you for the input.

>> +{
>> +	struct device *dev;
>> +
>> +	dev = iris_create_cb_dev(core, "non-pixel");
>> +	if (IS_ERR(dev))
>> +		return PTR_ERR(dev);
>> +
>> +	core->np_dev = dev;
>> +
>> +	dev = iris_create_cb_dev(core, "pixel");
>> +	if (IS_ERR(dev))
>> +		goto unreg_np_dev;
>> +
>> +	core->p_dev = dev;
>> +
>> +	return 0;
>> +
>> +unreg_np_dev:
>> +	if (core->np_dev)
>> +		platform_device_unregister(to_platform_device(core->np_dev));
>> +	core->np_dev = NULL;
>> +
>> +	return PTR_ERR(dev);
>> +}
>> +
>> +static void iris_vpu3x_deinit_cb_devs(struct iris_core *core)
>> +{
>> +	if (core->p_dev)
>> +		platform_device_unregister(to_platform_device(core->p_dev));
>> +	if (core->np_dev)
>> +		platform_device_unregister(to_platform_device(core->np_dev));
>> +}
>> +
>>   const struct vpu_ops iris_vpu3_ops = {
>>   	.power_off_hw = iris_vpu3_power_off_hardware,
>>   	.power_on_hw = iris_vpu_power_on_hw,
>> @@ -261,6 +295,8 @@ const struct vpu_ops iris_vpu3_ops = {
>>   	.power_on_controller = iris_vpu_power_on_controller,
>>   	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>>   	.set_hwmode = iris_vpu_set_hwmode,
>> +	.init_cb_devs = iris_vpu3x_init_cb_devs,
>> +	.deinit_cb_devs = iris_vpu3x_deinit_cb_devs,
>>   };
>>   
>>   const struct vpu_ops iris_vpu33_ops = {
>> @@ -270,6 +306,8 @@ const struct vpu_ops iris_vpu33_ops = {
>>   	.power_on_controller = iris_vpu_power_on_controller,
>>   	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>>   	.set_hwmode = iris_vpu_set_hwmode,
>> +	.init_cb_devs = iris_vpu3x_init_cb_devs,
>> +	.deinit_cb_devs = iris_vpu3x_deinit_cb_devs,
>>   };
>>   
>>   const struct vpu_ops iris_vpu35_ops = {
>>
>> -- 
>> 2.34.1
>>
> 

