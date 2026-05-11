Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282243033E9
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487441; cv=none; b=scjAs/ntWgVmS31OWCtP89jtSZLpm3Mp8joTaRdMG4+TwSwRLjef6IuIop4fVca3U0k1JvVQvKjlSWrDwvb/uaVG8BIA+7FdHqnXI6SZ6Dt1YM0V3XQYfhJ0srtwjSqQN0Z6Ad6zHpW50B0bukwIMxfVsOAXqury+iN+fZ26JJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487441; c=relaxed/simple;
	bh=aU6bBrDHmv6UBF7zIJHRhguL7uDUb+/D3mcgwsbvang=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GyQPOd11g8QYPVYN8POOlBnYfgkV3cpBUd1oVkOCF9yLpkNOZ2L9FJz8qg5l/8AVsdgDyj9pFfxkmhulzKsoNSwiNwZsmNDJdqxB6DCinWVkkHOvkB/NmNPKHSUPiWitV2iHK/4/Sr2Y7g5wE15Ye1CuC3Sth7DKofEK+H5lb4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUyy+gJS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZIwegDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUyy+gJS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZIwegDE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5towt2715822
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o4cw/D5H9MhKZ1YsCTLjT31xjxLlszhJhwuoO/W+uxE=; b=FUyy+gJSS3kUwpn6
	2q9SW+qCOzCedTO18T8gndf9wmRUdBDmP9565TDl1IeJZ1vWH8PPq1y3XDQlh+RA
	CK07OyW3yL5asBNZuF7XAWGvTmQOlrRjxKaTjbRd8kzPIQwypAaH41A10g39X0ky
	KEjixajvaW3SmpDdGZj6RC0/z2pKcjVkuzZb4OYz+WpNtLZiblQ4YUD1kzBT8BDr
	BB6AAACrE6qRj5RZb0J6BCoOLJAQYbYKWQRviIWhdCTb92aqJe32xP0uusdoFNfc
	BqpoYTgr+J8qUFuGkUHcnFnhprtjKVDpikuSDTrgxmQviRBQLdhqV8DOcuQ+5EDh
	BZWVkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dksuavj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:17:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7aba0af02so43906525ad.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 01:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778487434; x=1779092234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4cw/D5H9MhKZ1YsCTLjT31xjxLlszhJhwuoO/W+uxE=;
        b=XZIwegDEIl3v+RbJiiEYQXrh8A/WfgBl8INM/IrkW/vksS8iC63XqwnK0wLe79J020
         MkiAgNOjOEq503MPCKmo8UBm70ebVpqay2bZi3ADG/9U1jwPbPTH3NyHRneEug6yYt0S
         9/t1c0/7vghLRKpIRi7jyWJkQn8wTakJBvDh8SMtMr265u2SGam+1ttjLyfBTCsUsGO/
         EP3r8qkktLAnkqp/xF+QWON+xnSxrGe5ubPWhu8dsOFJqBUweSGuqNP7ku03XFaE2s9W
         c1b1KlbyPABW4lksB+gOtgPI8SZTw+HsJwfbE6z6hdS3fwLxRdHrs6N028+UXrIbMGJY
         yR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487434; x=1779092234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4cw/D5H9MhKZ1YsCTLjT31xjxLlszhJhwuoO/W+uxE=;
        b=Ik/mHmKSJa5PNzYZwdL0/Z3LMAQB3iBfka08bs6RBYy9Iwy4ioOnVGvRLNM2EXRwT0
         gcl7eouxCbkAXHgOhcc79VrFQ42hT0WOtj9VHoZukUMXNOzS0lN+3BkCV6nzWQZCQy4c
         vyNkodXCjLvHHBTU2cBxFEabT8s7xw7mq8jj84vBoaTUm8C1XLbFP8tXXBe/RLlxJ1Mv
         f0LabJPQh6aCSg5lu3UWYzwf8ESRyCUNq19Qnfnd8OEP3TB7kbDZewHupvQAN+PXh9ou
         QYA6XwxOf+ERdJ36w2xlBKlJK+rvdrnvAQRmO25yHf/TJkZm8fcs780pYZoe3iApqYNq
         FNGg==
X-Forwarded-Encrypted: i=1; AFNElJ84fFidZXOIS1LPIR2vEgKMm7pXA01APsMcz7NsUToN1NbDW/5hQtT0y22xprtajdWmz0YV0D1Om/m6@vger.kernel.org
X-Gm-Message-State: AOJu0YypW6zsKJ6b/Yg/Q/Z8gzSF+7OI2Y8EG5r/b+yQhCHYhsvIaCnt
	6NRG7CylLlX6XiVdJbX8YoshvT4LQGuHXcDMMwYl6Ouv6rL4lCo/6q1GAqyfOBr27H8Pg9o93Sh
	6A7QLeQWnvQNRSlm1mIs4dK1/0H4k0h2xVht79etW9LEtFbZRonQbebLhvBYG1fT+
X-Gm-Gg: Acq92OFf5BVyhxbjQ3533AGYa9ow1iYCt8kHZXYNtsSmQV5tcwdMWjuXAvSy8kQhXeC
	JCpjhucTtox//q0IhjLSw/4EbAGkTII3rZLWuK3MBPdIS+LJC9f0w3vquXHH1WtCWpYyi9SJJTG
	JGO5UGLJGmKPriOI6PxcyleBaJp8yiLfP1W5agjzFyoeydHSIugNrV1cSG23Z/7gutRfthXWu0q
	57gzEWV2eX5gevggbFF5lEgNUPQzAtcaEhzxiXoYI/AWu9WxzX+7b6H6TvMUQhx/Nmi7w5KZDHQ
	XhhjjYrGG2ygYrg/D74orgBGgwts++6a6IrwUrvyJm3NjqJ5CDXPJ3cTDLXXjPAncSz2s5Sewfh
	E0BqsGIaloNhU1zMqXYeohunN0RScYvG2hiQEbyjq4BZPNiXV4GVK8jHD7jRpPRkQzN8lRPAQ89
	+NGk/xOxWJkw==
X-Received: by 2002:a17:902:f083:b0:2ba:6ed6:aa35 with SMTP id d9443c01a7336-2ba798c27fdmr152641485ad.19.1778487433675;
        Mon, 11 May 2026 01:17:13 -0700 (PDT)
X-Received: by 2002:a17:902:f083:b0:2ba:6ed6:aa35 with SMTP id d9443c01a7336-2ba798c27fdmr152641315ad.19.1778487433163;
        Mon, 11 May 2026 01:17:13 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35eb3sm95994275ad.41.2026.05.11.01.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 01:17:12 -0700 (PDT)
Message-ID: <6dd0c0f4-9c40-4e7c-ba4c-e6e86f1fc95a@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:17:08 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: Add label properties to
 CoreSight devices
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R4L1hQuw597DHztAac3ZkaBdjlLbUOv4
X-Authority-Analysis: v=2.4 cv=d93FDxjE c=1 sm=1 tr=0 ts=6a01908a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hetpuf5w24yqYUOSKEEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: R4L1hQuw597DHztAac3ZkaBdjlLbUOv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5MCBTYWx0ZWRfX7LqGjC1yQwbE
 CHydT01+G4jn/PNfHqzjPrznfLkrMTcl54uSV5I9YKt7pkzg3m/IM+EUxocIRq0MED2ARNvSuEr
 gW6gSJnH8EXO8kGuLldgz9JPU7CuAKXUSxYcYTP4NQZTXkOnPoLyWFLgYq/7vUaUJcfc0PT4npI
 fjYbKavc8yAecblrBdXCvfCxzgQ9xk7/4eKNSggsfCr1eeYoHiQXKj1wsm/0WoRh9BMjv/roVjY
 mUx3IFLpikNd1Qe3eM3RiDYqDzVcXYPGUFf1GqQWWSAF1FopejGbyheIsyQEyBAzQfkfsjyuckY
 qwHCvAPI3MjkUf+ab168ha/oYL4t0gv3FeU9DbQz+gWmjtx6DtykNbjLYfEXDAU28nLmFGgd82i
 g9koibFFNzQyRDGC0RBSXa753KQyizIuU2lIPoHXlnpFFLNYqS5K8oXsr+UhLMK+0FtBBXA8cWp
 h7Bb3FvKJBTBmn5HRzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110090



On 4/14/2026 7:35 PM, Jie Gan wrote:
> The CoreSight framework and userspace tools identify trace devices by
> their base address, which is not human-readable. The label property
> provides a stable, descriptive name for each TPDM and CTI device,
> allowing tools to refer to devices by name rather than address.
> 
> This series adds label properties to TPDM and CTI nodes across seven
> Qualcomm platforms:
> lemans
> talos
> monaco
> kodiak
> kaanapali
> sm8750
> hamoa
> 
> With the change, we will have a sysfs node for each Coresight device:
> root@qemuarm64:/sys/bus/coresight/devices/tpdm0# cat label
> tpdm_spdm
> 


Gentle reminder.


> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v2:
> - fix the extra tab format issue in patch 6 (sm8750).
> - Link to v1: https://lore.kernel.org/r/20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com
> 
> ---
> Jie Gan (7):
>        arm64: dts: qcom: lemans: Add label properties to CoreSight devices
>        arm64: dts: qcom: talos: Add label properties to CoreSight devices
>        arm64: dts: qcom: monaco: Add label properties to CoreSight devices
>        arm64: dts: qcom: kodiak: Add label properties to CoreSight devices
>        arm64: dts: qcom: kaanapali: Add label properties to CoreSight devices
>        arm64: dts: qcom: sm8750: Add label properties to CoreSight devices
>        arm64: dts: qcom: hamoa: Add label properties to CoreSight devices
> 
>   arch/arm64/boot/dts/qcom/hamoa.dtsi     | 30 +++++++++++++++++
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 35 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/kodiak.dtsi    | 12 +++++++
>   arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 ++++++++
>   arch/arm64/boot/dts/qcom/monaco.dtsi    | 29 ++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8750.dtsi    | 27 +++++++++++++++
>   arch/arm64/boot/dts/qcom/talos.dtsi     | 59 +++++++++++++++++++++++++++++++++
>   7 files changed, 206 insertions(+)
> ---
> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> change-id: 20260409-add-label-to-coresight-device-b17a2ba6030e
> 
> Best regards,

