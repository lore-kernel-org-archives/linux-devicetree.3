Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80427372670
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783841904; cv=none; b=Oss6y6ssevsifZ0Yoo8pQrHakeUa6MONZx6M3VD1XF5dh1fNb5kJDbSzDcmNB41fpNcuSp15Ac3mBjI85MGCroXNmKGmY1Y3brUHf7Cug7tMX/eY+oPvEcZBhMmOuGV/D8VM1S7rSgRlVBely0RnfQQUQa+cFn2gYNLOghOIxas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783841904; c=relaxed/simple;
	bh=BV8ut0rEeRosEgV3ugjLJI/Faym51YUwOfk3wpRSB5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcMQPqdQIOypca+F3SdaSZB9tXxv0Z8F8znlFVm4QZe+Haep8M4TD3jQZPlLC27w3Be+UhCGIMdbfp3G9hi6wFbvgYi1pUNAbq2rTrTUFnbksOqnaF+vbMnPhJShT7k2x83SxqVHYCUFJ7tcCZI03TTWCphBKjR9lK+SI58s2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHakTebX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QR9fgY7M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHakTebX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QR9fgY7M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7SG7l1857804
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 07:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/P/iZ/D5DHAxKN2T0dtA4DCwWYFUcs5vQTDdDjQhus=; b=AHakTebXl5pMJmYr
	y1sSoySiY/oQ/aCfn9vIuOCO479L4ST7zwQYbW1ZrWtkQPdB57IXb4F6cSATQD7o
	iosKZmuKWNnDKb19my9WiBHalKn5yFLwk2LFfkgUTnqVeG/THvLB+GYGK6TflI2R
	bn9akRGU5cv/Bx/rIvI5b1G05ALkoQBxnf03DAhMBnUGl/ipxCN3RRkR6aHI98ml
	f6kmudYVK+7aqx/9u9KOzF3i4WgtBzzE1643qjeIhvaLEJ5S6ETDI06hFhqldlgc
	5SE4ym1hTV7ntyvLmdMKYqzhPjLArAEAXzlJ1hwJ7ZCYyBil0Q5dhutp//fyvimN
	t7U6HA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcjbe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 07:38:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so736875a12.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 00:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783841902; x=1784446702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/P/iZ/D5DHAxKN2T0dtA4DCwWYFUcs5vQTDdDjQhus=;
        b=QR9fgY7M3obYUHEPhR6QKG9yfH4v0inzAjHEHw8d/V3hExYJyptzHIdHujivIsxBsm
         ElivgQ/JPbP4KY9m6MA0gqGiqsdBgp0OX5nFztcpkipbhy/XgOKrlVoy9/h6Yn/pRuOq
         eFmtnA+Gm0C9YMkw9KO9sxRbG2qsuo6pdbivDv149VcJH+thoyyddUxsTzM5J63xqCof
         puI4s4aukhxXk42hfFsHcwMNXBRwvEtqigmtl6LU24sg6xhzudMXUg/G4QWE9+rfjeUo
         nYq1nwWLFZHjCfu3wmlrhCJzvbnq5Plx8c07HE1lDrKXVQbyHYFmr7aAoWC4cqGBPbcX
         06nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783841902; x=1784446702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/P/iZ/D5DHAxKN2T0dtA4DCwWYFUcs5vQTDdDjQhus=;
        b=p1xJV9XI6M88UPI7ShK+VJOmM8j2mMJuQfEU7mgV75F1Nd6dAkrq4OQRJjHrqCtslk
         bC9pnK1XA3FjfkYVe2DBf8wQN7AmLkWIxHXwputXvrmSz07qn5Glhep9a+q/2PwKNvpo
         xYu6wU23D/Tkc+ZahbX6DLkAd8/fF8pXbSRkqkb7HoFHJ2hdVL4dFPPt1Yo2LeUIj+Sj
         7LkaeUbVcfgrC2ah7499Q4ZWb4AOjAmjRVO8mjx7R/J6QOC2HnTV4RoL8jVirSeIE5Zk
         +ncdG5j9QhkKeYhMvulN0HfyWCoVPslS4SwXetXnoWaq4sogqAFtPolKQiAF/ejcLy1o
         jIgg==
X-Gm-Message-State: AOJu0Yx8XggtJMQaEB2f9JfjduopUEg/8QQ/IrKPvRyOpo9JvMwzUJq9
	CSWYtCQUzQyOa2vJw35E63wLlXjlyuUxiGdRdmIA7St1ErXbT02+SKqOWqqZEI9It91tosRX31N
	5sm7sZEMnK6PYOLASOiPGKGTyJ4QrFwHs8zYGHok14RpttCZnIfUw1jBX602RRB7F
X-Gm-Gg: AfdE7cmDCHB829aABfXnj39oRI8cooPz+h1ox30PUTYX0j3lNfY4BPG7TMkXTj5Mi4N
	vox2dUlVjfK3QP+LyZzOEtAUc4GgAAKf5G/n23zkx3ZuUiATu2phQUjNtCCANunrHtyxqSEk34J
	K+fIo6sjBErx1FVQ15vqr2+o2G9exxPkzRW4cG/JLoLfo0RRb7jf9vnERCs/K0a6fZxXwm9+9CS
	OYN+TI/ZE0XXo7N2XNYHJVsYw0rzYRo7OSFQJbBAqoorWix655c02XTipzGWIfzIQUYUkOw3tuT
	KPfmKy3BI3p4Rm+qM6K+DjpLpfjwI26fGY4+eI7GtZTwh6WOW2uRwAU8Y5yIEkvIeHHoFFGQE41
	rUwdMkIrpSB9MRMM3AJX6txXVC0sA9yaGf+K+2OEQFCRYUg==
X-Received: by 2002:a05:6a20:a124:b0:3c0:b62a:2b8c with SMTP id adf61e73a8af0-3c110a4f0b0mr5099881637.70.1783841901574;
        Sun, 12 Jul 2026 00:38:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:a124:b0:3c0:b62a:2b8c with SMTP id adf61e73a8af0-3c110a4f0b0mr5099867637.70.1783841901133;
        Sun, 12 Jul 2026 00:38:21 -0700 (PDT)
Received: from [192.168.0.106] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm25040628eec.28.2026.07.12.00.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 00:38:20 -0700 (PDT)
Message-ID: <6ce122cf-c985-484e-94df-776e12085948@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 13:08:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI
 TLMM
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
 <20260708114924.1069239-5-prasad.kumpatla@oss.qualcomm.com>
 <20260708115754.E16EC1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260708115754.E16EC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDA3NyBTYWx0ZWRfX4d9dW8q1oUVH
 uLrtR6oMjKAxMHPhWt+Seo39FyAjjjE1L4R9Hvlz08sxIyhikNpMoFjiy4HVmFmwaaiUC0JiZQ2
 miJPyTBACYP+imU5qb5TyuXbyvFtPNLl0yUc1eRGrMqm2lv6RadX5pOdKVYkGVjCyEORf2zyddA
 jGbc/Gc195/15fJjgl5Iynx2jKN+0fwr96qNbu7gmLQL+7igLLrxq+4syMKk3EQFQMp8dl8qPR8
 SEhgpVFhAbnO1RODiDNImtCLOv259bVYOkVD2wPDDj7nqHTWr0ZnzRaCuw3XCJtAZsUZdbzBDml
 ZPjFILNkoCQ9fHcgrgLXYw/wliydeKdL4SD27DFFuWfKxRylxPFsbGzDS+hA7atK8f0brfGT2Cp
 VOtf3Si4/kiH5YIaLfLaD2XTtwkAGNaBlHq5tCtDNI2GMCo6FDHIhA0YIz/zvMBIVQrVNYXyvv0
 VKXUjpu0nC8IgU2HGEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDA3NyBTYWx0ZWRfX9NAJ5ArRyUIe
 ketAQbGJxz2qAHN5QkRw+iHEdQUfC8FG3DEnaVi41qc94lqVNFCqb2t8WCBpEYh5f/kSiBU4UM4
 4N/Cbxm74jt6zxbY4JOVjEZiOsr0psk=
X-Proofpoint-GUID: CnDhV5GmLFHv7X7B7d9XgxktqTiHjUKH
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a53446e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sFkXs5fRGYWMjOD9uhEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: CnDhV5GmLFHv7X7B7d9XgxktqTiHjUKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120077


On 7/8/2026 5:27 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Premature destruction of `pctrl->lock` mutex before pinctrl device unregistration creates a use-after-free window.
> --
>
> --- Patch [4]: [PATCH v1 4/4] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM ---
> commit 38f7bb1223fcfb1f3a3b0698eedf3998e066c226
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
>
> This commit adds a new pin controller driver for the Low Power Audio
> SubSystem (LPASS) Low Power Island (LPI) of the Qualcomm Hawi SoC. It
> supports 23 GPIOs with various alternate functions and includes a custom
> pingroup macro to handle test_bus mux slot offsets.
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
>> new file mode 100644
>> index 0000000000000..7036bf4c66920
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
> [ ... ]
>> +static struct platform_driver lpi_pinctrl_driver = {
>> +	.driver = {
>> +		.name = "qcom-hawi-lpass-lpi-pinctrl",
>> +		.of_match_table = lpi_pinctrl_of_match,
>> +		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
>> +	},
>> +	.probe = lpi_pinctrl_probe,
>> +	.remove = lpi_pinctrl_remove,
> [Severity: High]
> This isn't a bug introduced by this patch, but does the core driver destroy
> the mutex while the pinctrl device is still registered?
>
> Looking at the core driver drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:
>
> drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_pinctrl_remove() {
> 	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
> 	int i;
>
> 	mutex_destroy(&pctrl->lock);
>
> 	for (i = 0; i < pctrl->data->npins; i++)
> 		pinctrl_generic_remove_group(pctrl->ctrl, i);
> }
>
> The core driver uses devm_pinctrl_register() to register the pinctrl device,
> which ties its unregistration to the devres teardown phase that occurs after
> lpi_pinctrl_remove() returns.
>
> Could this create a window where the pinctrl device is still fully registered
> and visible to the system, but its lock is destroyed? If an unprivileged
> local user reads pinctrl debugfs while the device unbinds, could this
> trigger a kernel panic or oops by operating on a destroyed mutex?
>
> The same pattern also appears in the err_pinctrl path of lpi_pinctrl_probe():
>
> drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_pinctrl_probe() {
>      ...
> err_pinctrl:
> 	mutex_destroy(&pctrl->lock);
>
> 	return ret;
> }
>
> Here, the mutex is destroyed in the error path while the devm-registered
> pinctrl device is still live globally until devres unregisters it.

Thanks for the review.

Yes this looks to be core LPI driver issue, Not related to Hawi pin ctrl.

Need to address this issue as a separate patch.

Thanks,
Prasad

>
>> +};
>> +
>> +module_platform_driver(lpi_pinctrl_driver);
