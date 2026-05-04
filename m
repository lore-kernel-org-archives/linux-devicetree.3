Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3893A1A3B
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899243; cv=none; b=G+o5VtR2xTMM3EjqgwPicUXbGIvaknY1/fUv97buZNn1onNBeHbevyQmmnIqlQVM3+XC8I03cI/qU9/U075bHmUdWIse6WnNZ4mo/Cp+ZsEaCdr8ibXaJShhpWBmybWjzQv5ccHuu4bUvgj1UrhdHz+8nL9BLI+JE47dxVwQp+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899243; c=relaxed/simple;
	bh=bUE5xlfJ8aUvjxSfillnSt6bWESVidtjA+1zJccVmAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLk2H3a2a0qPhbh8uuuB4BUPixB7rfOHoZAwhOSZjs3Tg/5oD03U1E4ux0qcWgAi/4FfNOHdov2U1K7kWZ5dSVzYBGK/wnjMHazUiyixuefkghBUpBgPrkc49Iavr/y7/S07YlA21kqNCCLLPbJZtLoRBbz4SLhzdwa5/o5dvcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDRtmbkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+njqfGg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDRtmbkw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+njqfGg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B484j770806
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 12:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ix2NDymW/i1FV+tC3k75uMGr7xSTvQjTuPjMK1bZkvs=; b=gDRtmbkwEhkUDzcH
	mjoewCBoxt73SG8T1jqSGd0VmB1AMVGHnh0cZ6lo6CeO+ZjSU541VjSomLatDA6w
	Bse7Z8o/Qe/3ucolMkiwW+cbtR8qr7PNmnhNiQQyfgsB/L9EeobUrQ1MkGaxm1RM
	0JP9E7Dbu+Sz9lz8azWj9gJUNIpPDdHqWgKZxoNc3yMmHqornXVstu3iTKsY5pBQ
	8R6TMnPAAxomOkefcnZ0m2gXjjig4Pr5zLbgBmsB3VB8LxN41/EcMZGN1M0WyP48
	cCJaWLA/Y0TrVobOWelyG0sV5PsCZyulclmYPS8OpxCSaaaUJQXSYHmOG7U6gxd5
	Yyz/8w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejnmeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 12:54:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f6ee26adbso337572e0c.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777899240; x=1778504040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ix2NDymW/i1FV+tC3k75uMGr7xSTvQjTuPjMK1bZkvs=;
        b=H+njqfGgpoodDLyp3nC9wIVkSWesHBKxXIBTNS0piBRuX706cKAwqRd111c5YJvh/l
         dy83gjScWflVFaFBvnTdE7rImdTVXS1R1dHtoHZaCBtBagj2hUxaNK49BwlYj7BOrSJW
         vUbJ9tlGfQWDJU/XQgZF8mVxYSyXwXvTE3iA6E4Cklxd5q+pVYnOXEb2Kj16d7W4wY8W
         20pO6lC45h+DOcqH9Ti3mmKxxs0RmB2JD7pyIWRkoZY0VISPbDn8XHIQzBJheiIejM9w
         1WUVnl0ARLGpL2OEiMvy2sBMHAnCmjtsm7G/XtPBTd0OO+0TAcc1j7PAJczkU/WFZDWX
         WNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899240; x=1778504040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix2NDymW/i1FV+tC3k75uMGr7xSTvQjTuPjMK1bZkvs=;
        b=hrgLzhVF9gH5PQz0/qJMJ/PE9P/a3IMjB9lTlUW9Vlsn87xNZ9upbXz//hZ4Bwssuu
         5I2z00Sp28gsgyO3iFh5j9XcJ+V6VFWnXYgQzRBYzc5nhbtq+vsZlzSbD4r1kHhA7TWA
         LkyI+Ye9QF+ScNlMpeYnRS6NyrNstqX6f6HH7Vtt5/vkd3hIoPXrmSVFOlqPj1m2XaQY
         v8egoNDYFbxgLKQHQjkKs6Wd/6Qzj/a7MLlRI8nIV1DzfP1sS1mgxOaypl/NFRrRd9JC
         wmmPGYcSUjhL+zN+V3csMCwZN6EQK0l8p9TjbxdSJUScA4bAO3eMhFLjIf0jY2N5VPj2
         fGHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zBKNKCa+7kFbL1uR3u9fe9InbBdvWhAKXVo/NVO2hk0LW/28aZfl+pTOifGnZXncH417eQMwstTqE@vger.kernel.org
X-Gm-Message-State: AOJu0YwlUGiC6Yjs8wBIlglUB3+vlvTEqk/txOXyXpDqN6GvtK4W5Laq
	slnsK+/YsKWfChYEoh6y7mB0fmGtSzjVVljedhO5TUqLnHXUDU2rSfN4GB8yUijGCBNLCwewA7P
	ZkiXDWRFZoBnkuw5zLzH7fjKIF91YG5VnzxLBoUKWsJTtvCpMeK3tom4mProTBgdX
X-Gm-Gg: AeBDietNHub6ubk/LXBX6yajJjhvPutCh8jJuUqHx2ENqzGCn7FVt6t47xw6Qw9+XUr
	GwADwMq+PC0JRmqbaOrBx1FIvUOz4W/OJDDTjQrUgvLSovXu41wme5MGBnbsTs+N2gbciyvt7cM
	O/g4wmIr8yCWIXD9cCwwc9cLXsusX/GUT6CehK9R7fStzV63BhMDDePftbGEim1Z/IUTi5OP+37
	BQSt8uIAe5ru4mCElY6nuvkjCpbWMJYcb3kOCc3aixEdk4no8jzyohlUUuPDFAu6QLvKAYi5l37
	dsYXugNifCy/fbfydFs7/kyXZyR4SiYot1lsienlX1XsCrG6wbkfBNLVo/7dkkqn8kzC4ZYaNkd
	0c6MCxKMry+pGd2ppaHkZINX/xgN5yHFIIeWPYzPTDwoxI22jEFKJFuKC3WkbNj4tA2CcuZAGq0
	bo4dp63CzMv4JlfQ==
X-Received: by 2002:ac5:c912:0:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-5750c517e6cmr1271333e0c.1.1777899240575;
        Mon, 04 May 2026 05:54:00 -0700 (PDT)
X-Received: by 2002:ac5:c912:0:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-5750c517e6cmr1271322e0c.1.1777899240208;
        Mon, 04 May 2026 05:54:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1dd343108sm139715066b.63.2026.05.04.05.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 05:53:59 -0700 (PDT)
Message-ID: <0edacb23-a132-4f9c-be4f-ea3326c8d8a2@oss.qualcomm.com>
Date: Mon, 4 May 2026 14:53:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: monaco: Add monaco-ac EVK board
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-4-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427170505.1494703-4-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEzNiBTYWx0ZWRfX5n3HpZmd2n0a
 Raw0OGYQZo7O3BekxW7vaoo7/UuzcfZk+Zj9LEAXd5ChTP0Hcf2v7CZRp51ICyyEkkaagi9ni8N
 fyWS+I21yI/lokmS/PzQLzGF3nW+uIrYIFsIJVpQ7Qxjv0LURG1yiewkSZmrNUKPJS8orHgIOsq
 NXh4RJv3FzuqnwOzPa5UVG2yXzt3BYVPMyTmFmAT2C2n0+OvphKE7TGsHWll5VEO+C9noMg0kQw
 6jbMT++pakz4rtyMYb2zhzSqD3SI+gOgEg2uuEiwCa/FiTC0fXXrRP6J6h3q2L8bWEqvrS7H5wq
 o7ZOHk4gb4TDXXxBI9V3uzy5E4c1zDjOaBUzmtu2wMoc3pzofwcC5c1Sg0cFJzZR3IqncaNZFSY
 /jXJt7ptWlu3ZaGF8ioEFMoSc9nA1l0K+SYeneDKeUCR99JbMB8oYj95SGcvSnMxaSNieWgqa/3
 g1sid0FTrK7nNqOKfgA==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f896e9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=1dUBD55Cnpq4SFnWJt8A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: tYwpRqQTyhixyQ65Dxd-dWMiwCm-PmSI
X-Proofpoint-GUID: tYwpRqQTyhixyQ65Dxd-dWMiwCm-PmSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040136

On 4/27/26 7:05 PM, Umang Chheda wrote:
> Add initial device tree support for monaco-ac EVK board, based
> on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.

[...]


> +&apps_rsc {
> +	regulators-0 {
> +		vreg_s4a: smps4 {
> +			regulator-name = "vreg_s4a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s9a: smps9 {
> +			regulator-name = "vreg_s9a";
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};

Since these are on a PMIC that is present on both full and lite SKUs,
are these rails also connected on the other one (perhaps with a
different voltage setting)? Currently they're completely absent

Konrad
