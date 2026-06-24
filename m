Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EA33DB311
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782316579; cv=none; b=BUSrmdWhNp1tkEpgczi2L6ISfvegTbQoBSNbyYCeSL6RCQxESd8EOH2x6NwZHLzHd02SClJdm/ifXyGNOb1u5a42xyz1T/ehLZGSx99ZplPUP1HDlT97DwM1GwNtW4ixWK16Lc1PpqgJF1a+WO1UYhQ0G2EWLPyApP3ZFSloHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782316579; c=relaxed/simple;
	bh=OIfIzrv8cXjwoKNsROTB/WmCpERrX7Jeow982/fvBB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8+vzLVb2LsFAGKX4otGuS4Bmo9aMSVkvwo0wYZ6hFchCj/DTXlgDiw/GV9wiyD9GVUxPWc3oykuqZ/NaeKGnmE9I4xnelEByXNUry0ST7ifOBnLQDmmuzJv7mQ6Z1UixH6dyqo4JR9hZPaYosIHMxTq6QxhuwsCZGHYkp4xEp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lz9bvbjO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9rGj5Ss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lz9bvbjO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9rGj5Ss"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OFfYMf3212448
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9bR2ocqQMdp4hN0L3M5pIvBrJtLBQ9RYBOAWa7t2h1g=; b=lz9bvbjOkMHK0fQH
	Xei8RRt14kG6/Iv720DXi/HJzzyo37lfYpLVZZxEtcy6WQH91J/jdMXqWEC6fzgo
	JFIFU2IaCvSIHzIUdphe+qIO0273F56Ram0LvWOzV5XsUpRnglT6KQkWB318PydR
	tWwKuoPJQ237N3ZyTXLZTV8w9WHkaAK9UwkxppH6boguf6GcYDFCHL8f4ifZZMYx
	dQfb1Jn53l6J9GlMUyQarr7WCHkdvJ379xPFv6JHdYesQF26YQYzs83fDozL1k6q
	q/qXUifddppRT2zEUGZP5j87/Me+lkVN2na35gUdMKllpA8IQjYjPYUHYC2Mibzp
	7JgIIQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d451e81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:56:16 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966c4d26a1aso432585241.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782316576; x=1782921376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bR2ocqQMdp4hN0L3M5pIvBrJtLBQ9RYBOAWa7t2h1g=;
        b=P9rGj5SsZH4CL831fL8NWsTJwelZ/g3SDDx6bfdbtSAsvxnNxKqJREkQM9PRGaqvrp
         4da7oKsZPyLnpHmf3kOnDCUoFOO9F8n8aThqb7Rudt7hHu4Sqih5GdivZgVZpGXEmahm
         VSUw6k7yiWwk0+RqUczugjCk7lKTODB0slKHNPPF0O6rdCKQYhR2ScIEbaC4Lj2A/o/8
         BqvyPRZ4EfDzYYD3MsD55HfuLDno/yE6wAE5VOAQXH8a3ZWVSOh/8m4g2kPjKMyVq938
         sY6K1fFh8Te+rahQPQWS5kYxoO4SqDCMTbbGdDDsMY9B1osQPBKK+JiXPzyfbl7zUexl
         PNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782316576; x=1782921376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bR2ocqQMdp4hN0L3M5pIvBrJtLBQ9RYBOAWa7t2h1g=;
        b=K1IJx3oK9fatF0WU5BPX6kjWCUUN1FK6cb5Eqafr3e8jtBWrpckypU/BUsuz8zPiuu
         1v3VZOIOHlNmp+zjXKjIk3zKqhDDhLFRoowViq1Ik195OyhPsr9TrSkGpEmtvEpcz1+U
         6xt8MdzxDAJSQ49Ce9FXP8VO97fhvfumqCuhwgUJWRBBGZvPurdJnud91ZE+1KAxqT7I
         nzf+dXqINrVbkydVwkHJ5uxFfdvXYMpS6ak6QreBr9qPGivA1n95YYQarapq3FmjuUf6
         SdBxOgwM9LhmACA965GMd0dKfGAdpTMAPhQZHblpkNgISJGZrYjDb9rc/+xi5o2dGcSN
         G4oQ==
X-Forwarded-Encrypted: i=1; AHgh+RohZdT2TBCrOVV+kDyepChnSX7taBTnbfKGZSaX0pY/cRytfxPzagBGeian/RxBNtudUyp7Q1hStO8N@vger.kernel.org
X-Gm-Message-State: AOJu0YwA8etNXCGxHI5DHEcgdNWydLlYvroQU2RN3lFR2MLJPlc6uSiK
	HIMpK0iJWBVgU/AMDQPF3uOdxHGhezi5yGPx5TKanBcuTPjFdf5XSFq/4eHUd7DpzLFYNi4KJ5y
	cuVMC/ymCDMvfQ4/VwTn1l4M3umoF6s47qtlCqwfOtOTzXUZtV3uKgRTLfn4g6j9Y
X-Gm-Gg: AfdE7clTe0yKwcifUCC4EPn4y01rlC5kQrxq+dlEDT9kYtjBcPKvV2RefWHfzZEJKc+
	RF6+7wMPEcVlwiwcC6rbr1RjwL54t8Ggdx+LoAZKGizu4pNbyf6OtMv/xIhl3j8sXg+SPJ6ormC
	HqnMlWnhQUKo9uBp1aHRrHuOALSpmF0NHi2BhIM10CPVg7Lzmq/oLTphZFek6FQz0jTRliJoNV4
	ucEzpPmF1Vyj3yaYzzE4IFHKNvb4LQ0Ixcn7Yd6ELL9OAvIyK9a4WN39+LjGX/NDEAJMcxRM6Wy
	vKREw0AOpanLMa4YZGdZ+l7iMRBoevEfAOg438AFK886JoRASNvS6fDCHvxiFoDGIJQtny/lfCO
	lBzfJ/wle0c16dYoFvWsFSF1WlkWVRreRPZjhCO/2VDvjn64dAgzxtOhn0p5ZpYQnful3o3U=
X-Received: by 2002:a05:6102:292b:b0:631:af51:7d8e with SMTP id ada2fe7eead31-731162122femr2076156137.17.1782316575669;
        Wed, 24 Jun 2026 08:56:15 -0700 (PDT)
X-Received: by 2002:a05:6102:292b:b0:631:af51:7d8e with SMTP id ada2fe7eead31-731162122femr2076134137.17.1782316575223;
        Wed, 24 Jun 2026 08:56:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:fce5:aedd:3ea4:36f? ([2a05:6e02:1041:c10:fce5:aedd:3ea4:36f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm8495036f8f.6.2026.06.24.08.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 08:56:14 -0700 (PDT)
Message-ID: <ae0ec05e-607b-4022-a006-2eb1a283144d@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:56:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
 <61765401-3397-497d-a0ca-e9bf9d76cc6a@oss.qualcomm.com>
 <5b0f1f39-ddaa-4a2e-ab29-34aacc9ff672@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <5b0f1f39-ddaa-4a2e-ab29-34aacc9ff672@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEzNCBTYWx0ZWRfX9VaMD+wBPHIE
 Q3L6OGTguhij9mIaZohUFsgaWL82sxkl++eS+jfeGvbAjbnRj5i8AFD20o/0ajjyIatKuKlV0ly
 bLnXuzuGLQAFRFVLA0HJ1AQ1Vhhg3tY=
X-Proofpoint-GUID: 8j3z5lithRIWi3Rp_X07UGiIyEw42R5i
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3bfe20 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Zihj0RZBmKQ52BXb7y4A:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 8j3z5lithRIWi3Rp_X07UGiIyEw42R5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEzNCBTYWx0ZWRfX7eUckQBSLJ+W
 Df4zyFWF7XTeiWlxAskPQ9bIH9tr25K8K9oTly90PYM5Rtcn9pS1yG55+2hk4gAfmyLOsNSsIx7
 pTfz7Mvl7sALJmvIF15wCJwYh7bpEwZ9k5AS0RZ5wOtgbOXQoOsOFCLROiGo/2etGfbAfuMTFNO
 DZRkFJIKQDHv1WNAYcTeG1IRXL3S8DfsA3EApyatwwbXPUEKagI4MYBFrA3nQL3iYWni+w7CtjR
 YP6fw9eFEoMjF3z6ThjvygdlnK0q3xutLaX3yuiDA9MJO9lVMu3V2L7xiiyarHqXUWjVgGnUsAw
 QiA8HxFECj63CXIi++19hWU/tOi3ypAP5lfGhoPUwTfsV0uvwnqmGovxc4GATwLhtpmaKT+WnYB
 RD8hya5ZamnKCtgdM+oU9mEet6iYZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240134

On 6/24/26 12:42, Krzysztof Kozlowski wrote:

[ ... ]

> Therefore I still do not see the need of tmd-names. You know the name of
> cooling device, because you have strict one-to-one mapping.


There is one remote proc with one or multiple cooling devices attached.

We describe those in the remoteproc node with the tmd-names.

Anyway, we should be able to list the tmd names in the driver itself if 
we ensure a consistency with the index by defining them in a shared 
header eg. include/dt-bindings/firmware/qcom,cdsp.h

#define HAMOA_TMD_CDSP_SW 0
#define HAMOA_TMD_CDSP_HW 1
#define HAMOA_TMD_CP0UV_RESTRICTION_COLD 2

In the driver:

struct tmd_name {
	const char *name;
	int id;
	bool disabled;
};

static struct tmd_name tmd_names[] = {
	{ .name = "cdsp_sw", HAMOA_TMD_CDSP_SW },
	{ .name = "cdsp_hw", HAMOA_TMD_CDSP_HW, .disabled = true },
	{ .name = "cpuv_restriction_cold", HAMOA_TMD_CP0UV_RESTRICTION_COLD, 
.disabled = true },
};

...
	for (int i = 0; i < ARRAY_SIZE(tmd_names); i++) {

		if (tmd_names[i].disabled)
			continue;
		devm_cooling_of_device_register(rprocdev,
			tmd_names[i].name, tmd_names[i].id, ...);
	}


In the device tree:

	cooling-maps = <&rproc HAMOA_TMD_CDSP_SW min max>;

I think that is somehow what Konrad and Dmitry were suggesting

Does it sound better ?
