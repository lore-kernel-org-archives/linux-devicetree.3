Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAC748A2D1
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122508; cv=none; b=SkfyxlvGKc38bq9QutGMOfUCbt0LBTF202g9nCxtwUc5Q0XuZV1yXe0lRCfy0vpg+YispcuQl0kaoczhq2ed+XznaUDQJylzxoIs3bHQpET0/q0i1PA1oLnRo2qcL9Wl+04u/5j5EL2jx35JHm3cUUWhQCI1vqZcmayLP4LmLSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122508; c=relaxed/simple;
	bh=0wyFjk6+HsLkh0IWAAfHqhQH/saWyrsDjN+FLese9gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gj2kMArEPIa59Wdhd5rmhuIJpi/492ngWSos5GDWlF8zO16EA2Dqv54uDoPOziHaafMjRjzzQUEGt7fT0MBb2XL5hhc9naI9xM4bWj0LBxZlGeepKCkzIGW+rNzKChdOXlbji9XlQfvwUYUwKem6hu+SWOcVAgK258LTZzksE8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXq4Gun5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEqyKRU8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXq4Gun5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEqyKRU8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IDdVfg2892697
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wrVlxV2ZYKRyaZUFJ64W1+7jk91kePK3xZ/2YeTQmo=; b=nXq4Gun5XcmOC5dK
	Mh4iQTzfSmdrY+wgULxisEUfKzQfDG7UDajUXs/gdYGfua2IDz00AY9tjkcE65/R
	junGhwRNh1RMCGjrImutOIPiDR58esbE44e2C6N8Slb2V5Kl+pw8iyvQhKQ3I1dg
	sAnvIHm4/N07gJzusBIBJjAEtoWaIDizjft2u49QjI+ADKs0ixM4Ct9Eo108ESjK
	UOY0dfLUBWfKjy7kjFZzYmmpd3Ju61ZFY/aAXoTihVLq2j4GNEC81tEfnsYD7D7z
	e5LawrUW6fWSCWZnD+x3gjbdQjiOzx961j36m89GJdFoM4gLF/SR5swWhq+DQqUY
	frFksg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1a68t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:41:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so2234531a91.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779122506; x=1779727306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5wrVlxV2ZYKRyaZUFJ64W1+7jk91kePK3xZ/2YeTQmo=;
        b=kEqyKRU81OIYfYjPS98wAMvZYVTSbmswNpRAQeFsLnRgkXhrM9YFMUsfI6DnlyAZgK
         gGkiJpIF7h9E9hEWgtfNTFDR/XRZmIvPm35oMA+840SNaJ4NktKZe4tgOxCVZVN+uunc
         PecX3rWo9jNXup8xMZilrQbiZCV8SUEAmCcr/vtSmKWMJNSrePzJLc+kkQrECo4TFg5i
         lQph1iAu6YU/jZCMg2QZfnYM5LKOJMNRGBjI6XceVyjLKm/EpeIteU8cRgjJ+w4Y0ZaK
         xQRPDyLumSTjHY3PURTfU1muZ7Xbh+812OxFx+XIZT+jSxDtedyA1WXYYxYnoEs3OJjH
         75LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122506; x=1779727306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wrVlxV2ZYKRyaZUFJ64W1+7jk91kePK3xZ/2YeTQmo=;
        b=SH38If/KNKe0p/ErSq8gnxVeY+48MME7BQJluq2d4dYDEc3vuFFalUb7YfWQFd6z/V
         M66/C0UEFFxAk3Vd06URJs2ueok//VDTLv3RUGyW2r99bE7fuvaAKkS/LYrZcoGXomoi
         IBwTsxMICi6hAfomQ1BDs1IYW31WspXpLW37SHAPRIgyAYnfe9+6ypHtWY20kdPCr9AJ
         8Ka7bcmIjDK1Qrqw77yWCRTVSPPjtBB883ZBXs1I/VPzwPKnf53tnHM+N6Qazs6M8tby
         s8wPtAwa5aTGVifUusV1z/SEW8Ok/g75+j/t/QgnwgK5WyHUbRwvWSAi5OR9VPIpQgnz
         ghYg==
X-Forwarded-Encrypted: i=1; AFNElJ/vpobfWGR1RNM1ceKJDDQ+NhxR0XfhfTPOBMwy0YmFeVDoEbIq4KWCI1fxOzh9vBo5x/iRZFwbLJz/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Kv5sOgk8Xi3/NiQW55DEFAblTNVq0+3zB9vJQa+eVoIv/xpG
	O7u1aeGvqqhBYMhGgRetsnrM1aD7EdsHXfkiaWz1oH2xqRJGz0syAB4Rf8GXSdxvp+22rgUOB6C
	luiydg8EOoZbIt3Z5OBJTsuiM0IJtHDDTrFEfAM3R8FyGKadYNt+gIji3Gh0qx2FM
X-Gm-Gg: Acq92OF6xmf4N5IYcxbzsuBlfuw0vddL7MA5ksfnMELUQJUu6TuFl5RL+DV4mxfQcNG
	9/ClPRKjHPKfOiT9P8h/JOvmR6UkVuZ3ztO4zktwYbf0z7Scuh2woSMcl3VNy+hNZOtuYyV1zhl
	MPSoqIalivweuTsf2acKKTaTwLwERL41CF960T5unNPwQ1pnWKwNFNM5EIQTWiGjIbfFEHHweuS
	/aOi2k371x7U5uPwp64iLWTn6sRreqFzpXpZTZ6cs4MbR3yQaAazZOU3x2bJAZw52pFVadGJ3sZ
	vPHcoD8o5JOubA88OR4EwOm0aL4d70FTP4H8KI57EJAmgYpOHSnS9IsCRPaxyDhTqmHT7Rc8XcO
	4okZNHkrc5T04bJrd8nfV7MP2WUKENsGQa2jqsURkGs270vxiwLxA/viR
X-Received: by 2002:a17:90b:1c82:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36951c9fad8mr15054682a91.20.1779122505873;
        Mon, 18 May 2026 09:41:45 -0700 (PDT)
X-Received: by 2002:a17:90b:1c82:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36951c9fad8mr15054630a91.20.1779122505327;
        Mon, 18 May 2026 09:41:45 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.226.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36959f52fe4sm5744383a91.5.2026.05.18.09.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 09:41:44 -0700 (PDT)
Message-ID: <f604833d-b333-4514-91fa-3cf95f99f9e7@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:11:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <CAMRc=Mde7Y3CQ3yi=U+999JyHTNacebiK8jJhHuYBGaqn59yYg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mde7Y3CQ3yi=U+999JyHTNacebiK8jJhHuYBGaqn59yYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g3GwqghsRVeYclQYcDbRnGBbU5csp_KI
X-Proofpoint-ORIG-GUID: g3GwqghsRVeYclQYcDbRnGBbU5csp_KI
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0b414a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=y87zbT2qfcRNAzJ9VcpEUA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GJNFty8P_8wqzycR5nsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NCBTYWx0ZWRfX2aJI7g1kBjYx
 lvVt1/g6CDOjlBN7nITH2+dIgmqQI9DEW6Mz/zqr8HvS/1Q4t06TkFAeXPcEfIM/h00D1lBtVSW
 B5WgZH4CCwcz9P+JmRMA7Nlu7XITc9OlfJr/y8FyCnhu2cBFp0OniEzs+S/3Ii2cKNK/65Ya3em
 ECwNZOticLgcXAvu0IHKQbhlsNAFh+hu6Tx9xXWJozndyIsoPaQ4VLGfZD+2CQersNgQUERCHGs
 rIOO3PRdo0C0Wg5Um3VMNpvRU8daoc20p4TpgJjTNAJq2rdMtrPFkJUs8v7h9LxOsFT2kTz7xBv
 wjnAFp/vBaygNExEDzJW8zf2NGLJXAWXxL7/ImbgSipLYvSz2fsbedqCeqA4yzyjxUTpxGqstre
 79TgmvKYnDzC8yz1N/GXnmlJZL1lTVLSoBEg10d61yxA81aVVpMEd1EAZWQKgjI9A/Vgf8R4TW8
 5K3Sw6teGQ0iw7DWOZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180164



On 18-05-2026 14:27, Bartosz Golaszewski wrote:
> On Thu, 14 May 2026 16:25:49 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> MFD core has no way to register a child device using an explicit firmware
>> node. This prevents drivers from registering child nodes when those nodes
>> do not define a compatible string. One such example is the PSCI
>> "reboot-mode" node, which omits a compatible string as it describes
>> boot-states provided by the underlying firmware.
>>
>> Extend struct mfd_cell with a callback that allows drivers to provide an
>> explicit firmware node. The node is added to the MFD child device during
>> registration when none is assigned by device tree, ACPI, or software
>> matching.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/mfd/mfd-core.c   | 30 ++++++++++++++++++++++++++++++
>>   include/linux/mfd/core.h | 14 ++++++++++++++
>>   2 files changed, 44 insertions(+)
>>
>> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
>> index 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..cc2a2a924d6d3044e29a9f864b536ee325ed797b 100644
>> --- a/drivers/mfd/mfd-core.c
>> +++ b/drivers/mfd/mfd-core.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/acpi.h>
>> +#include <linux/fwnode.h>
>>   #include <linux/list.h>
>>   #include <linux/property.h>
>>   #include <linux/mfd/core.h>
>> @@ -148,6 +149,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
>>   	return 0;
>>   }
>>
>> +static void mfd_child_fwnode_put(void *data)
>> +{
>> +	fwnode_handle_put(data);
>> +}
> 
> Ah, this seems to answer my previous question, but...
> 
>> +
>>   static int mfd_add_device(struct device *parent, int id,
>>   			  const struct mfd_cell *cell,
>>   			  struct resource *mem_base,
>> @@ -156,6 +162,7 @@ static int mfd_add_device(struct device *parent, int id,
>>   	struct resource *res;
>>   	struct platform_device *pdev;
>>   	struct mfd_of_node_entry *of_entry, *tmp;
>> +	struct fwnode_handle *fwnode;
>>   	bool disabled = false;
>>   	int ret = -ENOMEM;
>>   	int platform_id;
>> @@ -224,6 +231,29 @@ static int mfd_add_device(struct device *parent, int id,
>>
>>   	mfd_acpi_add_device(cell, pdev);
>>
>> +	if (!pdev->dev.fwnode && cell->get_child_fwnode) {
>> +		fwnode = cell->get_child_fwnode(parent);
>> +		if (fwnode) {
>> +			device_set_node(&pdev->dev, fwnode);
>> +
>> +			/*
>> +			 * platform_device_release() drops only of_node refs.
> 
> Which is a separate problem we're discussing elsewhere. It should probably drop
> the fwnode reference it holds, not the one of of_node.
> 
>> +			 * Track non-OF fwnodes explicitly so they are put on
>> +			 * all teardown paths.
>> +			 */
>> +			if (!to_of_node(fwnode)) {
>> +				ret = devm_add_action(&pdev->dev,
>> +						      mfd_child_fwnode_put,
>> +						      fwnode);
> 
> What if the device never gets bound to the driver? The release will never be
> called, this is why it's wrong to schedule devres actions for unbound devices
> and one of the reasons for patch 1 in this series.
> 
> What I suggest for now is: in tear-down path: see if the cell has the
> get_child_fwnode() callback and - if so - drop the reference. Add a big, fat
> comment saying that this must be removed if we decide to switch to dropping the
> device's fwnode reference in platform driver core which may happen soon.

Ack. sure. lets me work it out.

thanks,
Shivendra
