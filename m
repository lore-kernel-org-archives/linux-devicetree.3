Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3EA357CE8
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470224; cv=none; b=Q2wq0wKsiOy8Bv7qpmt3+WJOtieAefK+4IJwnFx5xPRWMFuxYneVX+bBccoApkYYFBgd430dwdtmwxcSYcqXqPYW17J4QCNxI1DO/K5HZxvTh5OM+lJK2M4/ck1ax7uK5FexioWWh+sfkJvgEIpVS3f37McqBL6uASehx3mJzzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470224; c=relaxed/simple;
	bh=U+hd1nq5Ba9sKgpCIAr9hKLqwF2P52OkoE9q+pl5LXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNNGUdH0hclJH04S1qO4GaUfyT+YRzxr478L3yWjZj5ZmpLssOjaU1lfreplH2/yaQgEwsOujkiLp14OPkKDIaMoYgRsnc6Ck5KgA2o5+76Nz86o8d5NACHKbANx3g8IcH7GkdrORg0l2CzTSkgKiOR3OAvKEBxs66S4j3awobI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB53vQW7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmCVLSsV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB53vQW7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmCVLSsV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGanju1733031
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sclBxpHfctQ6QwGlU6dwiPzIZrTCVf6A9WUqY/ePdZU=; b=ZB53vQW7z9jabqQ8
	kgT28do1vkOHhEdOIgPru97GG4AP1cUWLReg75tBDiOVExo7EeOAmYVBm4veb7Yt
	3Ycvg/CwAaPQN1waWIhCYhHoO0B1zP4Qlc2G6SPBD6/6bnmUpIsfZkFXoyx4UbCJ
	TIT7QZWc2FRARdZFrV160XtL23c5RaAQua6el+5BCTX+Ld3TGqv9xMrU/MfJHNTi
	sYlAxOzpzrSRaSVkeGWxZGFCbwHDshAG311FuICxN++O4JHKdskdQKGcCKNU1T+L
	9GEGg2EM96TjueNSqmyhEzJjENXuSsZeEexLMryJEBJrKKbmnGV92QOdUlr4FFMy
	q+I/iw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eattq85y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:17:01 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7bd49a2467eso141494187b3.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779470221; x=1780075021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sclBxpHfctQ6QwGlU6dwiPzIZrTCVf6A9WUqY/ePdZU=;
        b=NmCVLSsVIl5mQjkJ0VRym7ndk7SzIwjwefqN3NQKuGPhERfQLu8DgP12atthDT/ZUH
         4Gc2C6y4S1+PWOmdKMQr8U6e3CyMFq68CybuY7B/Nqg3C0sriXoK32ycHySJCSKJ4MPD
         1+JRGb8tUCa5bpurAkczkS8hswHmqje2Z+Avref15I2PPGGQYCFyrHiQf+tF3NsYl4b6
         sBBbkko0brW4lNpQHiotYYJfwRbo7VFS8LC1DSq95q5sAT9OaG8NPg7e1UJmroCWfvRV
         6zsbtn8Kx8KeNWzizofaSieIAzB2nBo63A87YaK/TFK38m45TwA4FrOU6omHmU4F7s5q
         tMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470221; x=1780075021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sclBxpHfctQ6QwGlU6dwiPzIZrTCVf6A9WUqY/ePdZU=;
        b=Q/tAHWNVelf2bk6lp9t/unmUAv2qdf2c60iH6N1tjFKmTdc0/IeZyAbVJ6dqqINmFy
         I7RBs68j1fiHBTucGcihDZMsu4tmdZ4SWxUt32ygdsPZEqV3j5jXwmCN/px7WctpQE4U
         oeLd6W+NzO4soicXyZAK2ItwwI0rNP+AKq6XqUDlxmvdc6DK+GvIXQQ10Ee0+txQ36OE
         Lbqol0V/JjmueHAHxs5H9e23aZ31rFbfg4S2eXA2kiV/VzM+W9lepwgokyOM+Ic8CXGV
         0MADtgOFhGLVxs0LnhcuESsGewCU3RHylO1zomy+SMFKH11juRaS8CAh2yn+JXGUPnJw
         S5FA==
X-Forwarded-Encrypted: i=1; AFNElJ/k/1XdCXjZwzcoc1FmLqmIjX/qPwfsfaXiZ35fZGtKKBAQEdfZZ/V3t4H97TV342ZN3TrrlyyQuAAA@vger.kernel.org
X-Gm-Message-State: AOJu0YwrBo3CCnlhNQWjWjjFwUoPlMonP24Q+cgVGZ/rwMGM0H8Vvzlz
	SHMGHyH0Ktnw9B4Fi8Us6UgwrsjJjSGCUCcetKUMGD3LSMZFw32Uo/iS50Ve2Zi8m9tg//RWEN1
	OEqxtzd1IotgKlEWMXGu1PKUG6bdjrnu4cMjK4+d0nQT7r+YJ4fON5Vz5se+y9aXM
X-Gm-Gg: Acq92OG/PI0TXl17GoGsWz3l0Aq3+d1cYqkI/jdR1NqwflYZzZCkqLp/TjaKpU/v+hA
	svBgDW531OcewnOJfHIH4eo/l7q3Q6N/wp6dDIyPuBlQEow7Wl6qlcba1FXk2fACXhr90C8LjFN
	DibETtmDLONB0Ujxl9oodkaTQpbp64T3vyebQ03bTMPY24goLlBSVVK89rEJpInpLoRCRp/IoUx
	pbNB6KtEsWBOkmB5T7+Mf8ut+OptClpbQ3sN8a9anKjSJsYC+hArJepa9GkVNcpceRBlWT3krm/
	gRbnRZg2/VxFiGdABhxhhFxwJIaJTz/Vztf5lqjeW7X2Ejl99y5U5tIM8YMSDZImuw++cCuGD/9
	/lxht9r8ifc7gqolwmZxQAAmKu0cr6e7IXzJZ7xaygZ4J5fGqLf6BKOMqq8ciB1/foM4ZV3YSxV
	k/bTnpq/cjDQ==
X-Received: by 2002:a05:690c:4b0c:b0:799:198d:8c5a with SMTP id 00721157ae682-7d335fbc537mr53940647b3.34.1779470221240;
        Fri, 22 May 2026 10:17:01 -0700 (PDT)
X-Received: by 2002:a05:690c:4b0c:b0:799:198d:8c5a with SMTP id 00721157ae682-7d335fbc537mr53939907b3.34.1779470220720;
        Fri, 22 May 2026 10:17:00 -0700 (PDT)
Received: from [192.168.101.236] (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c73ff33sm11043207b3.45.2026.05.22.10.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 10:17:00 -0700 (PDT)
Message-ID: <581cc180-b993-4b86-81ae-17822a35a1fb@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:16:58 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to
 256 MiB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        laurentiu.tudor1@dell.com, alex.vinarskis@gmail.com,
        linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
 <ac559877-f4f2-48d7-b00c-4cf24fc64489@linaro.org>
Content-Language: en-US
From: Michael Scott <mike.scott@oss.qualcomm.com>
In-Reply-To: <ac559877-f4f2-48d7-b00c-4cf24fc64489@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3MiBTYWx0ZWRfXxUya2pdEsp6w
 Gfq7Tzd24nIAOX7zHTtRp5uoE45FfKUaNgZFbPpkN5J2AzSecVuV4BV9+yxihXXn7qUwGfQSAit
 CGF1Vv4f9BRQoD8kJOd0eTQcaXsf2iVf9AuTJzejUtAMaLKkrOZ5+SL69+5S1eENu4t+EmPyHGO
 ZKXL6WpG1cYw86cuNp2Vvhu7Y1UKX+Jh3z9vS6G8ykW/7pVnMeG8trlPKP+CFhD9x1Hh3R64lbQ
 xmZq+UYVYxN1ZGJw8vdUac+AIfJRQ9kUWWRMph/IP8nBHJ7/JhvlWOlcr8IjpZ9BeHlwxwDlKW6
 6yfLk6l8dLvS28YLkvVb+CPnq4twZYlYCjaWBfKn6cQpQFbvT8XoIwgeUPDDsho+AxS2yZCg+5s
 4HVzX7YDuZhimNcHUyOsNhAEFHqlayub/4dzVbEQtSBKssiSfwsZVZiJZ4ZLhVNSDq9xT5cKG45
 HR0lhtOrrP/VUbaaSGw==
X-Proofpoint-GUID: ks9n0IvLcWc7l-YtQC_s5q-2ub_MBd9A
X-Proofpoint-ORIG-GUID: ks9n0IvLcWc7l-YtQC_s5q-2ub_MBd9A
X-Authority-Analysis: v=2.4 cv=S/zpBosP c=1 sm=1 tr=0 ts=6a108f8d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=87SNHxiu0QhxqWoJ-3IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220172

On 5/21/26 5:04 AM, Bryan O'Donoghue wrote:
> On 21/05/2026 02:09, Michael Scott wrote:
>> The 128 MiB linux,cma reserved-memory pool on dell-thena is too small
>> to support the camera pipeline in parallel with the normal Linux
>> desktop. On a freshly-booted system with GNOME running, the typical
>> runtime consumers — msm DRM framebuffers (Wayland triple buffering on
>> the eDP panel), qcom_iris video codec buffers, qcom_camss VFE
>> pre-allocated buffers — already occupy ~100 MiB of the pool, leaving
>> only ~25 MiB free.
>>
>> The libcamera "simple" pipeline handler used by /dev/media0 on
>> dell-thena allocates four ABGR8888 frames at 1920×1088 = 32 MiB total.
>> That request fails on the fourth frame:
>>
>>      ERROR DmaBufAllocator: dma-heap allocation failure for frame-3
>>      ERROR Allocator: Stream is not part of /base/.../camera@10 
>> active configuration
>>      Can't allocate buffers
>>      Failed to start camera session
>>
>> resulting in gnome-snapshot's "Could not play camera stream" and any
>> other libcamera-mediated app being unable to actually stream.
>>
>> Bumping linux,cma to 256 MiB (a 0.9% reservation on these laptops'
>> typical 27 GiB RAM) leaves ~150 MiB free at runtime — sufficient for
>> the libcamera buffer set plus headroom for video playback or other
>> CMA-hungry workloads in parallel.
>>
>> Tested on Dell Latitude 7455: with the 256 MiB pool, CmaFree at
>> GNOME-desktop idle is ~150 MiB, gnome-snapshot streams the OV02E10
>> camera cleanly, and `cam -c 1 --capture=2` succeeds.
>>
>> The companion board files dell-inspiron-14-plus-7441 and the upstream
>> .dts variants inherit from x1-dell-thena.dtsi, so this changes the
>> pool size for every dell-thena-based laptop in one place.
>>
>> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi 
>> b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
>> index d6de4da02dcd..714988a81384 100644
>> --- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
>> @@ -167,7 +167,7 @@ led-camera-indicator {
>>       reserved-memory {
>>           linux,cma {
>>               compatible = "shared-dma-pool";
>> -            size = <0x0 0x8000000>;
>> +            size = <0x0 0x10000000>;
>>               reusable;
>>               linux,cma-default;
>>           };
>
> How old is your version of libcamera ?
>
> With CONFIG_UDMA=y you don't need a contiguous memory area at all and 
> you will get juicy and delicious GPUISP.

I have CONFIG_UDMABUF=y enabled.

>
> Instead of allocating in the kernel just use a better version of 
> libcamera
>
> ┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 
> 21, 13:03]
> └─[$] <git:(0.7.0-multipass-v0*)> zcat /proc/config.gz | grep UDMA
> CONFIG_UDMABUF=y
> ┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 
> 21, 13:03]
> └─[$] <git:(0.7.0-multipass-v0*)> cam -v
> libcamera version v0.7.1
> ┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 
> 21, 13:03]
> └─[$] <git:(0.7.0-multipass-v0*)> qcam
> [68:50:10.493478857] [438859]  INFO Camera camera_manager.cpp:340 
> libcamera v0.7.1
> [68:50:10.511134091] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
> 'ov02e10 10-0010': Unable to get rectangle 2 on pad 0/0: Inappropriate 
> ioctl for device
> [68:50:10.511201590] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:402 'ov02e10 10-0010': The PixelArraySize 
> property has been defaulted to 1928x1088
> [68:50:10.511206069] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
> 'ov02e10 10-0010': Unable to get rectangle 1 on pad 0/0: Inappropriate 
> ioctl for device
> [68:50:10.511209559] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:413 'ov02e10 10-0010': The 
> PixelArrayActiveAreas property has been defaulted to (0, 0)/1928x1088
> [68:50:10.511213778] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
> 'ov02e10 10-0010': Unable to get rectangle 0 on pad 0/0: Inappropriate 
> ioctl for device
> [68:50:10.511216590] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:421 'ov02e10 10-0010': Failed to retrieve the 
> sensor crop rectangle
> [68:50:10.511219559] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:427 'ov02e10 10-0010': The sensor kernel 
> driver needs to be fixed
> [68:50:10.511221746] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:429 'ov02e10 10-0010': See 
> Documentation/sensor_driver_requirements.rst in the libcamera sources 
> for more information
> [68:50:10.511327474] [438863]  WARN CameraSensorProperties 
> camera_sensor_properties.cpp:538 No static properties available for 
> 'ov02e10'
> [68:50:10.511330599] [438863]  WARN CameraSensorProperties 
> camera_sensor_properties.cpp:540 Please consider updating the camera 
> sensor properties database
> [68:50:10.511334089] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:617 'ov02e10 10-0010': Rotation control not 
> available, default to 0 degrees
> [68:50:10.511340912] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:502 'ov02e10 10-0010': No sensor delays found 
> in static properties. Assuming unverified defaults.
> [68:50:10.512362985] [438863]  WARN IPAProxy ipa_proxy.cpp:196 
> Configuration file 'ov02e10.yaml' not found for IPA module 'simple', 
> falling back to '/usr/share/libcamera/ipa/simple/uncalibrated.yaml'
> [68:50:10.512372828] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
> 'ov02e10 10-0010': Unable to get rectangle 0 on pad 0/0: Inappropriate 
> ioctl for device
> [68:50:10.512377464] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:881 'ov02e10 10-0010': The analogue crop 
> rectangle has been defaulted to the active area size
> [68:50:10.512386578] [438863]  WARN IPASoft soft_simple.cpp:104 
> IPASoft: Failed to create camera sensor helper for ov02e10
> [68:50:10.512505275] [438863]  INFO Camera camera_manager.cpp:223 
> Adding camera '/base/soc@0/cci@ac16000/i2c-bus@1/camera@10' for 
> pipeline handler simple
> [68:50:10.548026157] [438859]  INFO Camera camera.cpp:1216 configuring 
> streams: (0) 1920x1088-ABGR8888/sRGB
> [68:50:10.548323081] [438863]  INFO IPASoft soft_simple.cpp:258 
> IPASoft: Exposure 1-2242, gain 16-248 (1)
> [68:50:10.548402247] [438863]  INFO SoftwareIsp software_isp.cpp:278 
> Input 1928x1088-GRBG-10-CSI2P stride 2416
> Zero-copy enabled
> [68:50:10.636862424] [438866]  INFO eGL egl.cpp:288 EGL: EGL_VERSION: 1.5
> [68:50:10.636899299] [438866]  INFO eGL egl.cpp:289 EGL: EGL_VENDOR: 
> Mesa Project
> [68:50:10.636902112] [438866]  INFO eGL egl.cpp:290 EGL: 
> EGL_CLIENT_APIS: OpenGL OpenGL_ES
> [68:50:10.636904768] [438866]  INFO eGL egl.cpp:291 EGL: 
> EGL_EXTENSIONS: EGL_ANDROID_blob_cache EGL_ANDROID_native_fence_sync 
> EGL_EXT_config_select_group EGL_EXT_create_context_robustness 
> EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers 
> EGL_EXT_query_reset_notification_strategy EGL_EXT_surface_compression 
> EGL_IMG_context_priority EGL_KHR_cl_event2 EGL_KHR_config_attribs 
> EGL_KHR_context_flush_control EGL_KHR_create_context 
> EGL_KHR_create_context_no_error EGL_KHR_fence_sync 
> EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace 
> EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image 
> EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image 
> EGL_KHR_image_base EGL_KHR_no_config_context EGL_KHR_reusable_sync 
> EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float 
> EGL_KHR_wait_sync EGL_MESA_configless_context EGL_MESA_gl_interop 
> EGL_MESA_image_dma_buf_export EGL_MESA_query_driver 
> EGL_MESA_x11_native_visual_id EGL_NV_context_priority_realtime
> [68:50:10.643064652] [438866]  INFO eGL egl.cpp:332 EGL: GL_VERSION: 
> OpenGL ES 3.2 Mesa 26.0.6-arch1.1
> [68:50:12.667202273] [438866]  INFO Benchmark benchmark.cpp:89 Debayer 
> processed 30 frames in 228802us, 7626 us/frame
> ┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 
> 21, 13:03]
> └─[$] <git:(0.7.0-multipass-v0*)>

Good point about the libcamera version. I debugged this on Ubuntu 26.04 
(v0.7.0+patches). I tried testing v0.7.1, but it caused a crash due to 
API changes with other parts of the subsystem.  I checked the diff of 
upstream between v0.7.0 and v0.7.1 for the dma allocator code and I 
didn't see any changes, but I wasn't looking at the software ISP changes.

This highlights that "I'm doing this wrong". I'll move to a cleaner 
rolling distro where staying current is a lot easier.

The GPUISP support looks great!

Dropping this patch as I'm not understanding the full allocator story.  
Sorry for the noise.

