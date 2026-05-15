Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB5F477983
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842991; cv=none; b=eCXM0NLYr2maDTdwjvbRIK4AsgiT1ELnDbS87ez3HKyD45Qz73IzZmvM6grBcP1nfDvlmA+0b/ByH/5n0RJlXgHvJ2uEGrR7H2MXmYLf9SxJh4Rm17g71Ixa3PWFo2lx94STvYdv9YmuHe0+uNUqipcrm0fpbEB0O6GcgW9Hi/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842991; c=relaxed/simple;
	bh=Vl6zDtFGs6rBBfIFaWe6v3rORgX4I6E/hb47YTcF9vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yb2TVtAEZfiXXKNZbrcL36JCFLzho9onf139EQUxjhaOsFnDYei8TR/Kse97/WKbMoRb+5f2JWimjAy7oldbwO9TJg9tI0hgrxXhvkyEswAMkCpsV/XCroV7Ww5LQO2U2xoHXiK7vg8BPSbvQT50MmePiEuJcHkV02w1X+W0ehE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+JWJ8m4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=boQyZilz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+JWJ8m4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="boQyZilz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5843Z3197601
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OenjSLxep1NG29TfqnLhRK7XF8mVv11G5tSLIAuqess=; b=K+JWJ8m4sK1oAh94
	q84JD7XqLEfRORe6lrz0A+YoYwgkSmwAVGrQQ1cHakRrrjUZLGQYXzy+Y/7F8Qr1
	qje7iK+R2RSvOPTv+VlqM7tLnhpoTOVXFMKDMaCIOvke6rtPgyFfnyHVNJN7d5Bu
	JirZrDXTo0HenVTbJE8tRm0SzwT6pWCPjvsHZjGPszLIxEPgf5UyKdBOqCUvz5Iv
	dTU9DY7tJ+eYJJWyM+vHKytOcTCo148gjNzBrEdjt/A9smrFKvYDYkPCdUSObAC4
	6VFhYxSCFNRt6ZoBaoG0EEXdwZ2+YfC8YZ/F2xIvywVZ7CfuNfDD3Nngybp9GCmF
	t5I6aw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qaxt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:03:09 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5755f6c9bf5so702837e0c.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842989; x=1779447789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OenjSLxep1NG29TfqnLhRK7XF8mVv11G5tSLIAuqess=;
        b=boQyZilz7Gff+uAs26z47zNEJInVlGrpv6Nt7QJ3bmduoFNjABy0p7yQSqu0c67pIb
         uaQCcFRUsbfGireIfbKVzgAX9NoNiIjC3NOlXjxqw4zD1i/NbST+yQUq2stYDyY2u/ng
         o8m/14yyR/0xZXKnJYmysdwQLHfXlgKkQrqXis7wWq+HJQDMCq3kYCh75TM5SQB9iEZ4
         GAvgBpI5Ik3MDzswbutZqB35lnoAFzgNbfqPesTzFpNYRVM0VD9gsckUeqlNZPq0bZK9
         Xu07nk/WNqrQoCFcEc364bnHnisd5JG4ntpepwCl/aUAcaQZzZIQAxsdDXi/Y9syLRp6
         jhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842989; x=1779447789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OenjSLxep1NG29TfqnLhRK7XF8mVv11G5tSLIAuqess=;
        b=mC6dMOU3HftMHS2fk06MI2EUuHKBDfmvDjHZgAuE3SwaUsZbY6EibzRfkLJnuljWpF
         xiYPrFEAVMvUNiFTqbZTa66CEUKUrx1ccgOS6Vc5q/dVflAP/aACAkkO4COOLxp8t5Bm
         jHUIklNaLAVRw6N4f5a/s7wpY+L5OesyJfI6/m2fO9Yp+LB2qo5/kiIcZEFnq6ehUzvO
         onCOSwDWa1XP+UzZFAMjBsfIdgG3al0UBRu3K+dnr+cSaHOb/UfwdX4PtqfERhI3Qg8b
         sKh+HjrO25pm2G9zw4hC2iif99jlsejKwsM2D1r572GVJJLewPPM1jZAtpI1WhtuKBg3
         LywQ==
X-Forwarded-Encrypted: i=1; AFNElJ94Uv/sa8p9QU+PADAh4qY/T6K8DrXM977vnyYn2ugsoGHgyn7JKZgGkLWLjkmAlS337HiMw+iCKiPg@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcnrtc181PYQkkjZOxeo6nsWXcy5wXM7KCNjvlbMIJe7ylOyE
	v7QMdEidu6gB4it6DaLmkHfp1C3uWAWRIwYNb7bonAI9oSLttsXPswsjILdRcQ/WpADxBJmO9zN
	6n/uLUZw6Df3WnK2uE4rbS9/Bje3ywUPiY+R4b62e/0SmICBUCYLdMlMc+2Xfs8m7PX8hSHKN
X-Gm-Gg: Acq92OFmbdBBtic9aFpGdhoU8pcdtJGKy22xIuKcwiw+tpx8UlXbOHdkBKr8UKLdeGE
	/NgmWhM514Svt/xwUpT54StuA9okgzsuN5RFtRoKLQXHGov+U08MAjrxT/BT2mwQKIbgWj055Th
	GaQ4Fwu8I/ud2vg9HF1SqI42djicMqIdGC12XAYakkCLa/yS3vVd3o6hjrYWLK2oLAg6qeqiL83
	dxy69Z9Yi2lyjcswe2d4IrW8NgQaZUZDzGfBaOluFDo/U7mZKStb5UezmCph8fKbRR60JhnwWGd
	DswsKfbxFFtEzhI/Bhf032kwxvW0AaFqkGQZAWUsM/8dGf0KdHfFzdftTN6g84hqnKz/eOj8TMu
	X4g3b4RSEqYq6wYW+xlcRkbOB9yvAtOcZrHBZJu5qjzhx0LpJ1Jio5z/dGiVE/9Y+k4wvzk/tgS
	daNz0=
X-Received: by 2002:a05:6122:4d0d:b0:575:1954:4396 with SMTP id 71dfb90a1353d-5760c09b062mr782001e0c.2.1778842988780;
        Fri, 15 May 2026 04:03:08 -0700 (PDT)
X-Received: by 2002:a05:6122:4d0d:b0:575:1954:4396 with SMTP id 71dfb90a1353d-5760c09b062mr781963e0c.2.1778842988242;
        Fri, 15 May 2026 04:03:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1116sm210293066b.10.2026.05.15.04.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:03:07 -0700 (PDT)
Message-ID: <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:03:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 96uafW-66uF3Oi3aSQqqfhLJ_UvZnWto
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06fd6d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=grNNkQCBMd6X2WQm2_UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMSBTYWx0ZWRfX8Jo7MUzmnoqv
 h2Gv/rk3QK9grrpmGyBEv/JT6sVojCRbpCiyv+VJZFgKPOLtyIusiJQES2v7iFo82zqYPPOBWqq
 ZZjlh+0c2wTkfCksVsj3WFx6zBoUbKMNwN5FNdnljkXKDArCTKtyIe/6MexHliDfSsFyolToUPT
 LdriK1guRm4gbrg+PbcJP+0yeT/9V0VePkp3hh2qQcg4+vsu1T70DC9XETMKi+ipgTnqgbz7TXe
 e2KmyhVXdmqEO0SPV319m54KSPQwxMXsgqqBWcAw544IbLgg6d3HBx7H9FWj93BOKrzpEs3VzPF
 Tt22lOHKUFZgrjEgHuxDgbw3L/y8OtVQk0ay79Hzvo3WO4z1ieFWKiCGM579HlMKKM+DiRdgpMh
 f0F6DLuU4Zu0gV/dtzbbAwvofC+d04KMgXMh6+xxNH9a4E2lFMHzQDhD5EDrpBzud9oDUAULLvm
 zUCf1jrSFbPpNk9rCtg==
X-Proofpoint-ORIG-GUID: 96uafW-66uF3Oi3aSQqqfhLJ_UvZnWto
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150111

On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
> On 15/05/2026 14:00, Konrad Dybcio wrote:
>> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>>> C630 isn't stable enough. For example it might reset if display device
>>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>>> value to make C630 work in stable way.
>>>
>>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>> index e41200839dbe..e6c67016552a 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>>       status = "okay";
>>>   };
>>>   +&cluster_sleep_0 {
>>> +    arm,psci-suspend-param = <0x41003244>;
>>> +};
>>
>> Is it better if you do hack in a
>>
>> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
> 
> Any clarification? Then I can try hacking it in.

This will send a message to AOSS to intrusct it to prevent CX from
collapsing

You'd need this somewhere early enough so as not to crash

alternatively, the good ol'

diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
index 6d5bbeda0689..2fea94618839 100644
--- a/drivers/interconnect/qcom/sdm845.c
+++ b/drivers/interconnect/qcom/sdm845.c
@@ -1786,7 +1786,7 @@ static struct platform_driver qnoc_driver = {
        .driver = {
                .name = "qnoc-sdm845",
                .of_match_table = qnoc_of_match,
-               .sync_state = icc_sync_state,
+               //.sync_state = icc_sync_state,
        },
 };
 module_platform_driver(qnoc_driver);


should give you a similar result

Konrad
