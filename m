Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4018842E8F6
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533119; cv=none; b=sbNjS8jNGo4mY/QYlDokiOXLewH9ulADLyqRyvpELwDzr9dcMO/Tfb3pl1vueqUhg3l1WxJSFL/NBJoMfU8/h0Pd5WH8F0cWo//SlDps3e+shF0n2UTNjYevMpld5HHZWft+H6e5H7XGJkvbuJvlpg45aZ0HXmLzmgDIFvITELw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533119; c=relaxed/simple;
	bh=PcrQpNv0debNulNrw+/l0fJqHqprwb5hEkIU/oGjK3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3EvJQM0t4R2DctAITOOs1wa57yuhPoo+LDDdnVBdh+vq04+m1C3zLqEAxQKVQe80aD9FTH3O6Kv0xuIjmeObOiYzcGEUnXbq9tZHwEWJIFu+4fdLKWgo9Ex4RTyi+hwxMGv+djUcQ5yRQ+5sC0Ys0S+bsi5+IxX5B3nKZX6jjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDIf2T/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRQNKj7u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDIf2T/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRQNKj7u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB48Gf3319909
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 11:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ndb2tC+bNrjCtaEv2GcOaQRxLg67meiAfqQFQgJb9M=; b=UDIf2T/YdF5UCB9r
	oZ2MjTxUAxBMd6zxDRE3PpC/hkOqQLqXGPCZ9yw4UBXsmIES8WaFccZs4nLf1F24
	ZjwQ0iSmI1ZNMeeChWCVTqdKl37k1e3d8uWE85nRuU2v0nkCFtWOAG7rZ0YzImn2
	2SCp3x3KRCAEMFN8AFMfOUOB8wYdp89yv2wPDaCWM3UQfa6zU+DXvnJYS4W0DJfg
	AXcBnlnuHc26FJZ+Z6g06TC31QLV/dJtRVEnaAV19BaEqN3wz2qbWWmWy3kWK4ex
	QaFDDRhpwSFQ+x3c0Y7HqRQ7WVC6ok44R4X7x8ITy74+vGavO7jkvZaLQhFs7Qnx
	qfn3Jg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmyr932-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 11:11:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so15808635ad.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786533116; x=1787137916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ndb2tC+bNrjCtaEv2GcOaQRxLg67meiAfqQFQgJb9M=;
        b=WRQNKj7uE2l9xN43lopSZuiGfm5rF0H1wxpDIQOBIIXSh0TFG+4l/OILBMDysoLKBi
         rzt/VrUI2WP2+rb9lSZh3B65XEMHq9hXGrEzhKgBSk1b5OraHWHvoCl6QSdDnN06Qc7A
         vXTcm8Rp707wAZHpQYAxySH4YXnq6zCHjdg2Pt2yYn/3i9lOEJcJZda1PQ04slRiG8Fz
         1tZV98MdsXfe9u4DmHLMmOlZqlTf6GSUpeHy6d2jarOmeZUU9em3woShojA6AUFJfzO3
         yX9yJ0db6tnTmOgLmh9wsWwDiXEerpuXvU8w1ztKeAJS095XZVMiHSfuQ4JXbX0mfVhH
         1zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533116; x=1787137916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ndb2tC+bNrjCtaEv2GcOaQRxLg67meiAfqQFQgJb9M=;
        b=Kml9sz2iaffykRFCPGqbAx8kJZqrCei3jvOWHSuhit4scpo2Kr+oBCFS+A16tlZd1t
         ne+UaW93fEMdv/2lswujG64QMW2qCSJg7lieSB7tcmBg+P0Dn8VgFWyFGj2tft/QJKgy
         zVZ+1bZSiFOBXuctlS8Q+K5U+HJkWYA75FuFRGNFLQ+milk5vU14Py9g+UPTDMMwpbs+
         l7mB/U7gt5n8Vz73IzFToIBLW7leUWZ8lNKPABIPWbG5JZMMNKuFnJXPEFT0I3j/7Yu9
         +6pxjs+/XKfTWMW1xXevS+h99foJiWwIaUSEpUV/slSyLlBVbXTDsvzMYwlOIeiN4MA/
         Ekhw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+M7ZVsbbu/rlkrz2wE6vO/FixcTZ1zhl+HbjTCi3CBLs9VufDHIyfo3BEQxNn0gvKyJk5BqTKUSZn@vger.kernel.org
X-Gm-Message-State: AOJu0YxrVLIJik198wWOzT9WEpB8NoO6Q0NBZrRaOfbekf68g+ZeZGou
	BrelFGli68zNjVH7YXp3RJ94ipUr996Nu7RZfR52f/azq1r63W9yxS+FeuZvqmzp9Vk0CVEEyVu
	q59ulSE6pgfBFO6qZjO4kpRdqHSv5hoJvMU5ioJ9+3Q75+0DgQHmbp296y9go9ssB
X-Gm-Gg: AR+sD13volKFwtqkrHO32P+ZmcJ/H8KMl8pdIA8pOCwESX5t8YAZjZe9RAHakiNxgPd
	WRNgHFujICgjJI3q3LJjwpBN+yimhvf6dkez/d7q34sKp0Tetrio7bJDIMqJLS4tvh899h+XU56
	PL/3jQ5bNkIx5LgUdY0G+FZqp/hQb2W/kgZeERGhO2EZ1aOIbqwuw7Sv6SSMDrKKoJPztfERA4o
	wLLS9NxSa2447RxehB58nuxtpFohU7CXC5nyrkM2lggTp1hXz1XVdZ0KzCQLmpiRKZodaREmrcD
	sgkaVyuyrVAB8tR+nxTV0F9IEHyf+dJS3k0GPWDcKvMc/3f4bUSs/Bm+J2LQhlRBVdEF5MTBJx+
	VEP9V1mTu587DJWgOaYP8w6+QWiGD5WIjaQ==
X-Received: by 2002:a17:902:fc8f:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2d3456f5f5cmr56902365ad.23.1786533115653;
        Wed, 12 Aug 2026 04:11:55 -0700 (PDT)
X-Received: by 2002:a17:902:fc8f:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2d3456f5f5cmr56901585ad.23.1786533115222;
        Wed, 12 Aug 2026 04:11:55 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d350be1504sm4886065ad.0.2026.08.12.04.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:11:54 -0700 (PDT)
Message-ID: <b7b68db4-a3cc-40a4-8748-527abe08934f@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 16:41:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
 <20260812081856.GF1072730@google.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260812081856.GF1072730@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA5MCBTYWx0ZWRfX3OIuNuymitZG
 i92cHvE/APf7SEz8X4wWIZlg+AMXITOF8j7nKTL6BfHs3XZ3f9Kycc2C1HinFuAIFbw7kbRGCUM
 WNispWWfMAwzRNzAHKaK4euHdYylPvA=
X-Proofpoint-ORIG-GUID: mb5UpkmhbX7zBHPqG-wcm1aXhC6QEsGD
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7c54fc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Tp_YqcUnzpVuw28kZAUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: mb5UpkmhbX7zBHPqG-wcm1aXhC6QEsGD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA5MCBTYWx0ZWRfX0D6KaOpBP8VZ
 zBDvXZE3n64bNsQRS0gezUl1Pl5R2gsZ1AsLlZNRxf8y/Rot/y7zeSynT668H4+UdrpDRGJFmQo
 9F6JRYBjqEir1aElfRp+1EKTTn09D1sR6oXoyye5tSCsMMF4yzlMlfJk+AWHEg422G+sDtBMM2M
 IbSm/PExTClE6Whyw3XAJxb1C9hZONclE5gSWAtqCv+UVWnLae8WleOkznJMv87koGsLe7eE3WD
 ZSfxHgULVfvOV3bvuBQotSREmjrLttcNpi5gDqlj6ZNDKFjWW84jkQuaAU12eDdtohxbliKrkJV
 W9CrXrkZAlkdJIaadK0LRKARsJwwikWadU0U675Jpae+9rLYGVCILwKE+toLC9tOoynuj8GMZ4T
 YcLXkybDolj4wJWcjNWMxm5yCo29dLkqKLjSQ1MTXonyWfJDcluq+sA1kcOaqLYNP/2eybrAmVt
 0nS6Tl0aWYSk+i5AnIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120090



On 8/12/2026 1:48 PM, Lee Jones wrote:
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
> 
>> The PSCI "reboot-mode" node does not define a compatible because it is a
>> configuration of boot-states provided by the underlying firmware. With
>> the new firmware-node based cells in mfd-core, this node can now be
>> exposed as a proper child cell.
>>
>> Add the psci-reboot-mode child cell to the psci-mfd driver with a
>> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
>> reboot-mode failures.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/mfd/psci-mfd.c      | 27 ++++++++++++++++++++++++++-
>>   drivers/power/reset/Kconfig |  2 +-
>>   2 files changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>> index 7affd6bb09dd..7befc4fa86f5 100644
>> --- a/drivers/mfd/psci-mfd.c
>> +++ b/drivers/mfd/psci-mfd.c
>> @@ -14,10 +14,35 @@ static const struct mfd_cell psci_cells[] = {
>>   	},
>>   };
>>   
>> +static const struct mfd_cell psci_reboot_mode_cell[] = {
>> +	{
>> +		.name = "psci-reboot-mode",
>> +		.named_fwnode = "reboot-mode",
>> +	},
>> +};
>> +
>>   static int psci_mfd_probe(struct platform_device *pdev)
>>   {
>> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>> +	int ret;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>>   				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				   psci_reboot_mode_cell,
>> +				   ARRAY_SIZE(psci_reboot_mode_cell),
>> +				   NULL, 0, NULL);
>> +	if (ret) {
>> +		if (ret == -ENOMEM)
>> +			goto out;
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
> 
> Okay Yoda, but why is this okay?
> 
> Needs a comment.

sure. Will add a comment in code.

psci-mfd adds two child cells, psci-cpuidle-domain and psci-reboot-mode.
psci-cpuidle-domain is boot-critical on supported systems.
psci-reboot-mode is added separately as an optional child. For 
non-critical failures from psci_reboot_mode_cell, we want to continue 
the probe of psci-mfd.

thanks,
Shivendra
