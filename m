Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3384540DB2D
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762446; cv=none; b=I1Ndmf3wsqgh9ppDcMQhd8TOM7BO/C42gyghnC7lB8qE0kdT/muXvu2v4ghsPZo9/4QI7za1+d8LARRFMWps//6CU54mAh8U17RE3Gz9UEqXayeRH0QQlk9fkIyGyuABL+XsfYTqpWceWb+uPbj1mFfpL8MBACWl5PQhPGlUc0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762446; c=relaxed/simple;
	bh=H9594XUyw3POtqMhfAsK0sI0aCBEtIDmlenuukjge1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enG8fz6TKy5POWUfL/iQwms/UQCMZY9YmuX6dwFjbCqSJp6PoaO1QEgkzhVnVu1U2KoNXJT2BOxafGmpls3kSLFUhSom0y8s3XoL0fIhujgCNFxaXqylk6wlLaPWTiEFN989bO5B3VNPhiyy3h4r7oWbG06RkvTAb+ihzeS3rNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfmEw9UP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lwgrmg9K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfmEw9UP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lwgrmg9K"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4ixb4143463
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 13:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DV+TIe+B8KPVpKTDj8vG+10Yx2ThG4j+TkRNvCbR0tQ=; b=gfmEw9UPmfGBTj5/
	RYAtRA/FeKPGUyUxNRJUOhvZm7V6RYrsTQn6DTcfwQjUzLYKV5VeMf+LiPM8l+90
	0FTVd53M2x0T9spGK8ACKb5LjxYTOH4Q9T7HfVGzt9Xah63o19Iiv8tDXHeggv/i
	6LMVORNnT9RHwfxAN6y+wXLvxXIn6MI91JNdyBrX5m1xHjQoy1tDURp/Z34R/sGQ
	jHG69NXTLbURbLj9nEx4xJHt1o4x3h4Akz0u+mlJQyjfIFYXi+g7uM9dGeRLj+B2
	aOCqZXHkslyziE/r8PpOS/HtQ8z5R4icGNPEggzxXUFqmKDd0Pt2k8cbiByu1NDh
	pvAa3w==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxatux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 13:07:22 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb650e79adso3261963a34.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785762442; x=1786367242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DV+TIe+B8KPVpKTDj8vG+10Yx2ThG4j+TkRNvCbR0tQ=;
        b=Lwgrmg9Ksu/t/EoBR3BWAqgafOFOisuOKFHJpDBssqKtoNmtA9fJ9PmF/OqoMV8iRN
         L2yyuTaBFnh146y8YpJ8jYoBZmlUDOWGnIzDLfsw5Ou7876ndaob9DT8TrI03joIjYbz
         m7eBX2n3jfA9uj2DX23TiuF5P2OOaJo4yNgnp3biSyRyJHrMY6P5ydtlevMeVAYcXluo
         DbTKCQzD5YNJBF7ogJC6TZbNrNh/S//f0gvmYO4FlpSL98PK4c07DBE8Av+U9zKloSON
         Awo3Py+qtODHFk5e1ctToMumc5OXKM6xzmAOKtpySSLlMalUBd1Sidv6Qiy38KvpC/6l
         RjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762442; x=1786367242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DV+TIe+B8KPVpKTDj8vG+10Yx2ThG4j+TkRNvCbR0tQ=;
        b=DkO2nJUNIJc4j8lZBDqhVzyRc9FrClOQEUmt7vlWuVsrdiUxhUBIL9pLGsXBqZajL6
         4EXtFwWzYulFCJMn4ybGsabmBu3afO1bawyrsrVbNyw9WA4P2EcsvGm4Vb+RG7TOsuvw
         uZP/vt/iOtQDvHQp0IBAHC1ekkvVPZb+sHBEeAVmj5hpHEe1JjjrcvPf+ld8iurBsd5X
         JF+3l7P6Vswb5nyLNJYexln83dOK2a7SLxGdKPyrlGX407Xsan/JKH6RJ6kAr6d8NGx4
         YwRTTk7UcrUk30pz79I48VyAypdnmJzFbL3RYwWJZFjCCn6LxfI0MMu9XsYPi3ji+Xf4
         UWsg==
X-Forwarded-Encrypted: i=1; AHgh+RqGqU9cm00/inIoJaQMiIfVkFIrQNhMg7tKclgFDfAiU2ayLBS3siR1oopdXxw6BCs2ZSynLPvbI1OX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Zb1pH0K+B9v2ojH1sWvXKmYIYYkIvDVh9d0TtCGyLC1u09Xd
	n/v7KH4as4Fi55aZr5rI9f/gT/ZE3cKlIhXuuNcmkO9EK0EVcxIpY/P17lb5bWxJXmzw9d5UxQe
	pLrA+gAZGSR6RGJj7KPHOSDuTDbWivf/v5hKaup05Vmt192KrJKiRgSgLv0wUMfDi
X-Gm-Gg: AR+sD11aUtQDzGlao+AZKMwDabphZjj4EbPvo6eFJQ7JyC8gVxEaotiQ7q5mXn0fTuc
	dUnSxCQAYfCiz52RjOcZBg3Opsw/QMPf/8E7M/Y/13Ns5/R/mEnIcgU14Lz9s+WNZK6SyxMKICN
	l1kUhOzwEgV6ju0dVPuwd3I2yMx6ZW5GdJxBAPFjeiqrqQViaLxmUpGn45AkUqOgkyQVLf8LoK0
	cgTkFwAw3qBI1qAH8ImoSNj2/+XF1JqglMZwziHVc0Pt5x05A1LG+WjBjTN3oiAFtE5mZBO3WaC
	xbRvi85yEELEz5w6rT36KthZcBElRnQHTCRz/PleRJYCUJAZwxof4XIMtTHgCsjygUhbRFeBlwD
	33A9lxCEwoIkaQXDFnHEpDp/3voJsU8lMvw==
X-Received: by 2002:a05:6830:67f6:b0:7e6:e022:4b44 with SMTP id 46e09a7af769-7f196f1c52bmr16096636a34.15.1785762442274;
        Mon, 03 Aug 2026 06:07:22 -0700 (PDT)
X-Received: by 2002:a05:6830:67f6:b0:7e6:e022:4b44 with SMTP id 46e09a7af769-7f196f1c52bmr16095923a34.15.1785762437054;
        Mon, 03 Aug 2026 06:07:17 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18ed3c81fsm7306578a34.5.2026.08.03.06.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 06:07:16 -0700 (PDT)
Message-ID: <f18569ad-3e39-4d48-9ed0-968af4e31c40@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 18:37:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 06/12] power: reset: Add psci-reboot-mode driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        lee@kernel.org, mfd@lists.linux.dev
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-6-889281373870@oss.qualcomm.com>
 <20260803101117.C91CF1F0155B@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803101117.C91CF1F0155B@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GolGyqmqREAmI1DqVljFQDQIMAiCYkWo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfX3geygYTGD9fN
 o2dzg5o0tvP4AikRyc9j43jdrHiBUREOIyNvbErgnh5ucxe6S+suRx/hf2U1imPo/SZ4MvpUdA6
 uC0jbVcgZ10mPB8+5HCYnP7B0eyByFeR4yLxyFWKbrBlAyjtKTswFsln9Ic5NqjB+wevSlHIjDh
 LeXDRYb2CHI/iOFKERkoaOadyQNNu7F7+D3Iahx0hGNMr1qzlWwTni27cBgNaY7hjTg9pbZlpQ3
 Nr8sEhNfuqrnlEuT4Wnl0bDW5mAcR64Z8VVet++iyofivPQ0X1bC1nIlvKnepy3KnspBwEMdxsc
 9Z5LjMf+CXQc+as9V/nOJc+EHSGO2aICOa7c05YTnbGUgNW6eCUnNUHkxwcopn0gv3+5SU6Z+O8
 fbo00lVjZMTyzJ4qMoN9ai+hwAS2XU0DeeHkpb+Wf5Fq4CrvPSMra+iQcRCr2dd6+zNo2SKC59x
 p+9JLJwyI+S8atkZqag==
X-Proofpoint-ORIG-GUID: GolGyqmqREAmI1DqVljFQDQIMAiCYkWo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfX4/LC9OCNrmsT
 KtqG4cn0qpP3If1lWQSMAceO/jSvFS7dD3Bu9fWpIggrB9q6BgzcFSN0FmdM6lIGdTL43E7fcfK
 UzfhfXNjmIUk2DCsZ4vd5InfkNK4pAE=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a70928b cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=-TrfgTw52sERH2XDXHIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030118



On 8/3/2026 3:41 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The `psci-reboot-mode` driver is completely unreachable and non-functional because it is never instantiated.
> - [High] Standard 'normal' reboot mode commands are entirely ignored by PSCI due to an incorrect `data` check in the restart handler.
> --

[snip..]

>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
>> +				  const u32 *magic, u32 count)
>> +{
>> +	(void)reboot;
>> +
>> +	if (count < 1 || count > 3)
>> +		return -EINVAL;
>> +
>> +	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, count));
> 
> [Severity: High]
> Does this work for standard "normal" reboots?
> 
> When a standard reboot is triggered without a specific command string, the
> reboot_mode framework translates the NULL command to "normal" mode and calls
> this write function to configure the reset command.

No, write can be called only if a mode entry is found that matches name 
"normal". And there is no mode name defined here as "normal".
> 
> However, in drivers/firmware/psci/psci.c, psci_sys_reset() skips applying
> the command because it checks for a non-NULL data argument:

> drivers/firmware/psci/psci.c:psci_sys_reset() {
> 	...
> 	cmd = smp_load_acquire(&reset_cmd);
> 	if (data && cmd && !panic_in_progress())
> 		psci_handle_reset_cmd(cmd);
> 
> 	psci_handle_reboot_mode();
> 	...
> }
> 
> Will this cause standard reboots mapped to vendor-specific commands to be
> silently ignored?

does not affects.

> 
>> +}
> [ ... ]
>> +static struct platform_driver psci_reboot_mode_driver = {
>> +	.probe  = psci_reboot_mode_probe,
>> +	.driver = {
>> +		.name	= "psci-reboot-mode",
>> +	},
>> +};
> 
> [Severity: High]
> Is this driver ever instantiated?
> 

this is probed as psci-mfd child.

thanks,
Shivendra
