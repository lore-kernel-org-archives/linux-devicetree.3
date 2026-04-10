Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB230C372
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775799535; cv=none; b=osaqaIZGW132Oa44BS5OF5+XDX/INvFcrvHuWtSf2NqRIeQmwWBkOioGccDA0tfYQiOAkZUCt56phBq9d1zIvQv4ineHN7sEBKYvtRhsj8MEkgnW2Hidi+oFxTROPCSt/TgGo58zxweTMe6UGjtYKv4NNmW9v95y81Vwe4iAdfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775799535; c=relaxed/simple;
	bh=LCW4faW9nVqAL8dVTUuUS++lxPB3RzrvN4pI/NADuMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcCokOVf3EFWzE539Tll52T6JStAMJ48lQ5o61hG8F4QSd5aDKE1tytInsc766XT8tRi73ezHqt2akJr8gSvjSm+MRm6LVNujuBkv6txjmdSDxfgu9USEWZQHyGAHE9ykWs8qCZFNKWqPOG36oLtAajgobHmd/3XZXqMAzHUMFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANTKfXoU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLoTc9PH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANTKfXoU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLoTc9PH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KOMCq729048
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdha/huLgOL97mCdIIibckuCXn8YgEADP1bOWfW0NnM=; b=ANTKfXoUDjTa3GiV
	TkLZaHVSxEYEt/RtjxZhYtZCae4eOGEaoHIF92JWoTrdTQAyzv5kCxdDoC352XiA
	Rej3rLSXCGMD+lvpY+B2dyP1ZlJx8P7keKgle6FQ9WH5lwQUQ6BCP7/H5j1TsKij
	mW5Gwk4RmrHah0hrYrBK+pMw9cQmt0tMSfNMzCU6V7eOI3AHQysMAeDOv52heUsC
	X60zSYNw+SlVRLv1ffIQZUF90MllJ+4pT65Inj+DC3uRWfiVm1i78ZhjwUrrxgCL
	XVNYEM/zL5F7YhvROuGKl2FZlq1AZ7X1DaPuj9ysAXfkMMgpvWWil3Wv9VWTbwxH
	gNeymw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dek4c98qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:38:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c613194caso912877b3a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 22:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775799533; x=1776404333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bdha/huLgOL97mCdIIibckuCXn8YgEADP1bOWfW0NnM=;
        b=JLoTc9PHFp2LLf6o1kVkwIjc6DdNRq7VcWNJKtw+P1S/Sp+e2SU7mHdsFKwi2Bd5rv
         0u65qFXblSBDMo55Vip/+8HHIT9hDSnKz7T5iTcTvo5GCuTboi9jNJKI5YHaO9HsGm4r
         2boMhLij7kn4OBFSIzTp7tRTJ/1K2lJFJ2a4FZ7dHW2YyOOHuTMv4cKPQzD+cFALgHnF
         znSVoXNC5DG5w1+XQYOtVeaaSV1FE7BYZCvFL1ToyxTxkIAnJ5khURB2NywHJ1EytH6N
         gJlF+YHj+uwBJJ77FqGPXpY90ArD6LoxwO01g5hCb+QiKePmieoF//8jY0Xajb94zrrT
         cZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775799533; x=1776404333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdha/huLgOL97mCdIIibckuCXn8YgEADP1bOWfW0NnM=;
        b=KL6tVu3iNBo40ggkn9Dd83QLbFUyyZ2ENLxqn4LP+B5xmWrCY57sUTusQThygYS+5F
         Ak9jl43xW27ijZadDcn9a1RzmysLmLEY2uDP+ZVgM8obpX9jaYozrKZck2FzzfJ5hiPc
         HzHqptEVPH8w57h2IXJhH58EfIiFfLcYa3CI8sQCSfCdtYR2NVyeicCPx+9dLcvSv54Y
         AQIsJsZFQZ4ZBFFvJKQjrUC5k4hj9R8zqzG97HZbQBoMDKOtciW8+jTG82FuTHKzVhNS
         NzQZwyOq32E4WvdAhS1zJojomcrjmyxa3e+rYDR+oPrXrISuRK1taZTwjZ3cUtehzvOD
         5otA==
X-Forwarded-Encrypted: i=1; AJvYcCUuOgLniphmxsMSf/WagrBwXnl+zNYZzIRiv12H2gOOqrVjqr2noZMsMjy8WhVtXcM5YJzzPmz62SLx@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+46h65+EzzMajZuiYGmS4ZV4+M8+4vdhSK4l2PkKYoTxHjAl
	TlWzNErfuus23+K1HeLjL2ZG5MatHfV197WIfIdhWkSjum4v0ei456M3LMmrbXfnjBJ6UB6YX4d
	oKDTzxCgLItt92szHLLC3cns1trkDlP2fRVoqe+zKNWq2MifOIYJiFOkES0SluVHa
X-Gm-Gg: AeBDiesvKfy0i6ky3kj4N3lph79dnLnYCdfk5sQlVGbFWIxHQinl5iSjo/S5aZb3VQO
	ySMUjUP2iAFvxBE66cXAVrXe/Ge7CEbtk9mLFYPrSBfc7VH225s1Mn/zp+8ALzatlR1+wnsQlCW
	Hp7UQaJvOTPguGs567H2OA5tRViiVMa/Lz13ansIgJlUBQfp6BswRw05PzEhK6WM6vCIsADI5SU
	MGemvkhGyKVp25Fgca9rbDUpAtut/VsdWh4y6Jqq+Yq2eGfzt+veG3fR+ohODsGnHfXPc8drjT4
	W3Givb5YTJ6W9Cx4CktlqaV+sQRPNwnVqvolqjm7o76Yknsg9VcRiec61aagjWniVkinkx7YcKj
	PYLYHFFdbrd3vvO1jSOQmBaIM7ALM7pYOzP2MT+L5b02biQ==
X-Received: by 2002:a05:6a00:4b0b:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82f0c2278e7mr2077421b3a.23.1775799532776;
        Thu, 09 Apr 2026 22:38:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0b:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82f0c2278e7mr2077404b3a.23.1775799532254;
        Thu, 09 Apr 2026 22:38:52 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c500415sm1372404b3a.51.2026.04.09.22.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 22:38:51 -0700 (PDT)
Message-ID: <1c203ea9-c674-43b6-a2e5-87054a9e3b83@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402070854.2804291-1-karthik.s@oss.qualcomm.com>
 <4d08f16e-856a-46ae-8a41-334ec4d32952@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <4d08f16e-856a-46ae-8a41-334ec4d32952@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA0OSBTYWx0ZWRfX6tGY9tmboRSJ
 PUgpZnzyl9MgC3CHbWkPqDTQaa/I1mqkKGoCCl5RmgAYcC/GmQ+ZcihsBUmDHuy422dZ7brzZxs
 DNDMphKqawiPqx3MONIEHiX5yS66AJmjdJkP/AfNvh7BdoeFddAY60hla9jOET8w4igpYSS0TaF
 fpwIHit/W9HU/cGEyXR2SxkjQJpe/+Gc+n9QLWGg8A5+KBjqUPc7f91NBTGWQHXii/sp/wBLB/n
 iNIKEFGD0F/ykw7X6QNY0F/ObCP/a1jZ+w7+2wQae+x2fFDP5XERbqWyQin/zjZgohnFuSHJikl
 yQclUJeseMkSPQ+hSE+HZ80Frg3dUMgMTr2fgpNza/Wdi9DzSBhUfYMeiQQQuZLMbmG4AOd3sSG
 w3Ku905L+xWMKDyvNBLwRj3SuZN5lpZn4dKB9gvIk6cW0C+hKiYqd2iNBXxkGaQk5Lq+g3S8YAe
 4xdEGbeK3banqdahCFw==
X-Proofpoint-ORIG-GUID: cgiKY21RP56SZR8S27uzlA7KFu2gxd_F
X-Authority-Analysis: v=2.4 cv=fZmdDUQF c=1 sm=1 tr=0 ts=69d88ced cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SEM4ifAqo57pbrxDZScA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: cgiKY21RP56SZR8S27uzlA7KFu2gxd_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100049


Hi @Krzysztof,

On 4/2/2026 12:43 PM, Krzysztof Kozlowski wrote:
> On 02/04/2026 09:08, karthik.s wrote:
>> Add has_always_on_supplies for managing regulators. Indicates that
>> the codec supply regulators are always enabled by the system and
>> must not be requested or enabled by the codec driver.
>>
>> Signed-off-by: karthik.s<karthik.s@oss.qualcomm.com>
> Please configure your Git.
> 

I have configured Git as you suggested :
user.name = Karthik S
user.email = karthik.s@oss.qualcomm.com

>> ---
>>   .../devicetree/bindings/sound/qcom,wcd937x.yaml     |  6 ++++++
>>   sound/soc/codecs/wcd937x.c                          | 13 +++++++++----
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 

I have run the scripts/checkpatch.pl and fixed all warnings/errors 
indicated.


>>   2 files changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>> index f94203798f24..d89fff1f7171 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>> @@ -28,6 +28,12 @@ properties:
>>     vdd-px-supply:
>>       description: A reference to the 1.8V I/O supply
>>   
>> +  qcom,always-on-supply:
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.

Current description in dt-binding:
Indicates that the codec supply regulators are always enabled by the 
system and must not be requested or enabled by the codec driver.

new description in dt-binding:
implies that the codec supply Vdd is on always on rails off the 
board/hardware and must not be requested or enabled by the codec driver.

please let us know if you are okay with above changes

Thanks and Regards,
Karthik S

