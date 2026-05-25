Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345DA30B521
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700569; cv=none; b=SD6gltk5ZP80Rq++rd+pqCCSI1HerIj6lsGxOsCrjD54EgirOohgfI2X1svQwtFk0sbXntMSmAFizcgzG4diPtLLbS9TzSq+I5C25+EV6swvvCCgQxfAr6MbD4UYpphwvht6CYhxMzldBKSiqxiou75bR95tuMB852RUM5g9Dpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700569; c=relaxed/simple;
	bh=f1Fu0W4/g05J3Xbr4kGQW022COOJPAbs9zyPkKyp5Eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMFgrZDAIUpHY+QSFYa3sk2XU4S9hKLZN2o8oD8YtgwnCYzR6pdq8ms0dfHxiY23VG0UAvH8uSjHZZ6+O/OgBKwuw+xJwqH1pw+Q1jV3/zwJXNlL0FchklOL8U4B1fbZ5Sy1uvL/ZNdbhEUB85sFUtPb8lnCyi3taJIXzyxfil4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwKPDWhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XammMCRK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwKPDWhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XammMCRK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7FspR419389
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1c6/1NCI38NvfAimZ+NOaPQCpF+xE7i5bvHagq3NuSQ=; b=NwKPDWhc83dI+WI4
	mpTmMqX8sh8e0nnx0NKMbFt2VCfCqC7WWv7ZvtsLh4MruPy/eXks98ofEMzjy4yO
	W8gdjsOOUmtFmn/E9iwmdf/Vz1Bg0SJxAlHVFIh5DG5Afopsu9FCvFMlRM8RidE0
	k00paFYAZ5kNXIVM/LoA6y3ZKme6zMFdtBGpgACV3w0ZDzDINtMzxnJ1v0dftu1j
	iCXlPOuYBH7jc3sUvTqPTRoO0iKrWjVMb2KEcCPzGnYQPyxO4yxnrPSmQ+Xg6Jc/
	ajFfo/hzyLUIYf0YZSIz3PwF7sy1Grzn/9oyAglrH2sI+xQD/BGle0gDEN603YFe
	dCFlSg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386p6dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:16:06 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-43b469c6e24so1567045fac.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779700566; x=1780305366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1c6/1NCI38NvfAimZ+NOaPQCpF+xE7i5bvHagq3NuSQ=;
        b=XammMCRKUg4D3Q29SXgpiKn5x4+wtkaX7xrOQ5eLqzdGiPIe3HMjuTwaKl30hFFEAm
         azl3GxBK1mXPzCuArfmXbZ2/+pIsThOe6ZHpATH65woA3tKIIdLoJt4Av11L/fpRrzgV
         T6gIezNVqcLuEaVBKUzZnDiXp538RFY2a7wmzbvH/wvltkuJZpue/GmVZLHfenTN243T
         GgkZnnL8eYtyKclEw77R7eYGGfg9Z/QhB4UtCL3JydKTMPOFEAr+5c9sorE9GxFlmbTl
         JKudCFk1+2xj94uPgGJ6aAK44S2UGO0yFl7ILghoUf1xPtaDfixF/z4Gy8UtmxXOViIZ
         /vhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700566; x=1780305366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1c6/1NCI38NvfAimZ+NOaPQCpF+xE7i5bvHagq3NuSQ=;
        b=L/yXCZZbSDw3+VxGdxIaEXEulBx2riRiqlwO62HpXDLEKmp9qfwT458z6GljJmpvta
         YcIJlYnJOPx+eXj1RbAPMAL1gQ4nbpGlL3tK2es/rXGD4+Gy9UwB7Yj+wMtKqy1gQREk
         OqRds1LUgtnftxDHfrTiQx86meJROlVvNqKE/dhCBWVTZi1iCgdNXXcdwRoWBNo7fQ0D
         UfD94UQ1pBRgliKF2xvAFNCJk1G4kWIMZg1oEpHVPwB+3VDAlGD24E6BUy6zxAtLkoFZ
         srmEqU9s/5I6HquLmXRu1wrPj9X9Z9zKYbJidG7kze5/pjqL+lXWKGrpLH86MgMD8cB8
         Hkfw==
X-Forwarded-Encrypted: i=1; AFNElJ8bcKSuww+3/9McXA6akkKs7ldXl3Kotv54ljXt7jjYW6qxuGQASgiXod7OB/VRvw4q3zFHT4zbnvG8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5CEoPbnSiBEavUxfyAhvFRXkAziWKZtIoEjeVzUyWel8vNmI2
	deg781IM8XC2Y/6SR2eDoW/yChcC6kl7KUtKeqzYhntZE9tnM+Bxzyncb/ywkNNfGPiARVHFaNr
	Npk6lsTYLznGI1e+/NMlSxfwUsXsMqYu2wb5tMvLnMLDa9lt+Uz7B6zRylSWtycuTbrDNh/Hczu
	Q=
X-Gm-Gg: Acq92OHWEL3ULvPNTrERgvwO+tHqA0hh+t1XflRxws7BlNsf7nCJnM6U9oOq1wzXL8A
	kvTRy3wW+eNMchtnDd6KCT1Ouh8isbRhXLYfpXK+k5c4irebDE3HsQo02Dw1t5nVKi63BR3bkcL
	vH9MfhmKWZQ/6+QAqhWSs1HyPid4ZJTEvgMFpRDTR4M7SqtwGa6WjQOtdHt8le5//l1yhsNofrA
	Haav1eDeb/2xGve+8r3LuRY1pMMBkR+a41iE5PjbhzM8kOvcUthoGWQQPs6zhBaO/VZ7DKVVsmR
	cogaehiX1wPeaQX2FPH8qcT/BpLdF/+VnUsVz8kH+a9gehTOQReIKhv5fNSO6BDH99f0db5a6AC
	nVuuFrugqDLhX2woZlboX7bWmJxJ0KaPi8EwEBeduXD55JHZXHt8oJ0/5iW+OCyyn5Pq3h3L5iL
	jUz/xPCxcG4UzZtkVc
X-Received: by 2002:a05:6870:8586:b0:439:c2da:7dd2 with SMTP id 586e51a60fabf-43b5b046657mr7968670fac.31.1779700566319;
        Mon, 25 May 2026 02:16:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc4:b0:83e:3050:d0b with SMTP id d2e1a72fcca58-8415f0f095emr12883061b3a.1.1779700148333;
        Mon, 25 May 2026 02:09:08 -0700 (PDT)
Received: from [10.133.33.202] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8419a140893sm2855272b3a.46.2026.05.25.02.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:09:07 -0700 (PDT)
Message-ID: <b7cb43c9-53ca-4829-99a8-cd2fbcd5a201@oss.qualcomm.com>
Date: Mon, 25 May 2026 17:09:02 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] dt-bindings: soc: qcom: Add Maili soc related
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
 <5k7sh2yooj4yn4wtpifyamaw2dglk6xwbix623rvt6i2idkxr5@63rbo7ncduym>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <5k7sh2yooj4yn4wtpifyamaw2dglk6xwbix623rvt6i2idkxr5@63rbo7ncduym>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -gYUFvbkyjYn9KBjJ3gTYYBqtVNv5Iux
X-Proofpoint-GUID: -gYUFvbkyjYn9KBjJ3gTYYBqtVNv5Iux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5MiBTYWx0ZWRfX+EG6SOT/+3NU
 NTLl/HcY4CuPTeoBfyaVaoth0qK8jMDM5TsdPc/3sWuvbUhvETKUFto8sgdGMgBi7LfURCTf7BV
 FQjjROlyNGgPo1MmZVxTJr8BLDkamatvE5HwLyInMmuUyFF/FoSjwzg4irU3Z3BxYINwDi2BEQ0
 tYHmVLpmy+uZ+HJxEYAv+jt0Fd27inPpXJsKtnfYsrnTI02DXUA6J8GPcK0Is53t6Kwf5uZLJ4v
 VCwm5Nm7DEwOvFiMxz1VKciqJHORac8BiA6/p9CYJSTYKm4NePAqqNJSiUywwahLnSu/e8cNFRA
 lBWhv7SzjyzhraXLtZEMFHSpmgdSMAAdizIdxSJCcPseINgEAYLAw6avA1vB4MIGaMwopSdZ70d
 RNXlXEfjW17VxeiDp6iXPP9aXdr0NfubBaqIpwrPG3XtscfWvWcCzn2esUcjzXQQ60Lab4WOcFt
 opnPMco8gk2ht2kryww==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a141356 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1JtG_qnnveiJe4rXrqQA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250092



On 5/25/2026 4:35 PM, Dmitry Baryshkov wrote:
> On Sun, May 24, 2026 at 11:29:43PM -0700, Jingyi Wang wrote:
>> Add soc related bindings for Kaanapali Platform including aoss_qmp,
> 
> So, are you adding Maili or Kaanapali bindings?
> 

sorry, typo here, it should be Maili as title describe.

Thanks,
Jingyi

>> imem and SCM.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>> Chunkai Deng (1):
>>        dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel
>>
>> Jingyi Wang (2):
>>        dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
>>        dt-bindings: sram: Document qcom,maili-imem compatible
>>
>>   Documentation/devicetree/bindings/firmware/qcom,scm.yaml      | 2 ++
>>   Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>>   Documentation/devicetree/bindings/sram/sram.yaml              | 1 +
>>   3 files changed, 4 insertions(+)
>> ---
>> base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
>> change-id: 20260524-maili-soc-binding-2a2287fce578
>>
>> Best regards,
>> -- 
>> Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>
> 

