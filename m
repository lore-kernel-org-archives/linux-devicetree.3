Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20EA33469C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686165; cv=none; b=TW3cwwURiAnB+NZvtwVRqAo+nuapnanzvJ1DSSHNebG14o/5l/QFdAScPsY9gvaXDn1ZR4vSjqAc+M+t7nUd0ixg/SRHndZA06ceZxlRM/IFyK+9jRtp4NLpiHIvGNyXhR3PtT2sZ9m62M3DkWjkHK3IMXi8ThDL4ppkSj5y63g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686165; c=relaxed/simple;
	bh=/HC0rRJ7UJC1OFGA2sIIA2bvHGwVrJfXIcgr34IAgqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHJy2rXWx6eI90t71HHhtS2PZiByIrr32XJsB5EDy8wp9RmeAoPTmr3lXE8x4EKMfKpsXfteouNXFex0RvpJYXYhNLb0qTRqpVIiTk0zKJd9nhbnAk3m+g6iKmTsKzOdHi5lFuEefKgaLCW9UhZY8o9v9/wyHzMLsGogTk9e43w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXE7vLj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6cNbe9m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXE7vLj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6cNbe9m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jejs3007137
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=; b=hXE7vLj3yu7n94+G
	2NSWc/Fje9lZq+7gEbw4ryS8rUQZeq1Jnkz6s9BIeQgmQQboDMIpATq4fN7WEAHi
	lDUwhBnUF+LXUiMGZmyWsR7eWTWh6jDUrkLuHqnlx0jtMV4uGw+/RknDesx24Jdt
	VqSsU+X3fWOvt+lJC7fSW96xxijDGr5oj3DkAzJtaf27PByg1ZO5P1pO015LWGqB
	9fOZpCbZDYnT1nSpdMWhQ2J/s+4bdSzfEyGWocGG7D4At3DJBt0QXUiwTgXOGQUH
	wOLDA/GoNbQYa+6cg0SN28f6OkYLLWLXIK85mKr0MzaFGG/WrSNVjrY4GQK4R1cv
	zea15g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0h9x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:29:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc6899bfb1so55421405ad.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686163; x=1779290963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=;
        b=b6cNbe9msD0sJxJCWsp18UZSeYQWh5mSIf/ugcLExqRzQVodpFRA+kFSeRdQeADlYG
         Tr8HDkP7j7fPJKGRwHhCE2a42pghdt/gpPIItQP+fKD7lzljwYIVtWfBPaDPsjtfDY9h
         2YBpLWVQkr1hhGJXF22KlPqf4OhudBV2u4VsckVF6t0Q18s9QiezMpTyNKjCYrvYN8a+
         HZvEa5R6noWaJFiZ/3FYNw5i1lYDvkrTz3hxajqeHYxf9sm4SwsKx7aOrCmOOHJzqGFY
         XwDKchajq0zmGgMjjzatb5BdjzktFQsmoW88bWrM6zRNxVus7e5RxDQX1BcPTFWN/2sZ
         56yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686163; x=1779290963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=;
        b=gMMmP3L15Ol5QDB5wE28KkZe86xoY56lCJXwvsdq5R2HQYyZTsfPX2SFzVlmr2IEWz
         fwu8hpYQNxZvIlE6OV4jsgvFUgGptCOx42BKK3vB1CBkJK/6QB/L7naXPpVE5Efm8Zsr
         0yyPg3fKI+eIGaVdi+WitgWKvWno38M6KsoMGZbyqWN2JdJ9bCYYcqlohSlse4kvBcWK
         CfFyVeLkGWYZZnyj7B1D43us4FbNWCN6bg9c9+iLXC0GOzWIw8Xa9CIAtiBbfnOyA7fu
         RPmRgqfO3vy8E7OmTkVfgpM1tFnx1UD1tatodpgArM7EQsOIa7y5VIXWda4jv7B17LXR
         w39g==
X-Forwarded-Encrypted: i=1; AFNElJ+8MLMHTUJPiYqNnUryyS4x1l8vV2GY/JhIRGB7rRLJs6MxiwuYb+GTgBz7DXQSC5zQlxMvgtsXypq0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk2j8U/RblIHz0BFwmeKXparlI9sWlwT+x+5BxpAUzOwxcO8FP
	37oPBH0wvKVoz+OFIC1T170KgQrrQ2axe6EKRuo7PFb0rSDMPLfKUaAXF0cyyJ0WQmuFg37Cyv5
	7YUmZ2ffobms2l5xud7oSc5NRcqy05JWih57xTr70Z1+ANj1Vl7Wwj55uoQo5KRUJ
X-Gm-Gg: Acq92OFdmZMI2W0OSLuSTZ8/Ic2w2AIpjopmjpohb/8ALb3nXt9frR6nfPPkbSV0TCr
	LCMs2kqrSjReo4U46Lns0nGRor80EOMCnBhvKb0YfOFZLdhD2yiPj7F8LMjXyOnQH8+sOM25fQu
	/z+uXmfY9Fzr3Vjk6YmvZLuR9F6osjE9UBR3/O5MfjzkkP2pjTIDhsrnTEx+GNySMnLj5X51G86
	xpskG7FkTlCJimA1WbNsMrrocAKziD2/UjODyFA2c1A/hNw+0wWy1ULwyTGV6o1zwXGUjNkzy8X
	yDhZPVzimlOeC7o84TbZqFrPmDUPM+WGKmcqw3WVyL1jCg+IwSvo9iuPT1Q4x0wdzEHc0AIw030
	uiqUgfOWtz6dl23j/mQ0hD+sYpdpHPSDz3JRe6ivVox218GbJdQ==
X-Received: by 2002:a17:902:d2c5:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bd276e23b7mr45318945ad.34.1778686162688;
        Wed, 13 May 2026 08:29:22 -0700 (PDT)
X-Received: by 2002:a17:902:d2c5:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bd276e23b7mr45318595ad.34.1778686162197;
        Wed, 13 May 2026 08:29:22 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bcfsm168295585ad.38.2026.05.13.08.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:29:21 -0700 (PDT)
Message-ID: <dc78ab37-c62f-489d-9497-998ec11080d6@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:59:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX/m931cfdx9H3
 oOG7bGX1hbvdn4ZF5lHPFaJ0gOV4oULWgxEzzTwH5TJ8O/jncqD/mPQEELCU0h7YKZ77xx/tTxM
 IIhJidJYQkMMNiVZEOqBMA2wxQroZAeXR9BCMn1kAHIWaztvwjInsGudaE3x34/rBua09H8Lc94
 J0jY8vkWxr/FTh+PL3T+E5g6534UGuEpfOLdghmU/8MvlCNweTYyPxk50eniCTC0Kcb3DHk1FIk
 gEu/mXdT7rJC9AIOpzMaUgA8NdhNjDfQMhol1mknHu9FLIOKVQGbNyZ7O+zgasbs6/sUNYVhDQO
 UhENhmqReaq2Gh2q3LMUeb++ExLQey9o3s4bvOA8JBY+20Wihd6IUaHaq1ern1/ZxG1f1cR8eIU
 38oO0ktafnpDRc5fzpZd26iEzGrho53L5Hh4Eu3ywkVJhc9MZ18ruepl1eKF/Z3m8/hMclMpDbA
 SQ7rEXDaVO8Uuhbcuqg==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a0498d3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=QCtv3gAnLEb/jX3y9W1wMg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DeNt0BJpUpdqGQuxoTYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: dra3pH_PDmK5Ce5Jztck5gU-c0-ezbru
X-Proofpoint-GUID: dra3pH_PDmK5Ce5Jztck5gU-c0-ezbru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158



On 5/13/2026 7:53 PM, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Since CX and MX rails are already ON when APPS
> is active, explicit power-domain voting is not required similar to Milos.
> Hence extended the Milos camcc & videocc documentation bindings for Eliza.
> 
> The patches have been tested on Qualcomm Eliza MTP board.
> 
> Changes in v3:
> - Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
> - Dropped the defconfig patch and included the drivers as m from Kconfig itself.
> - Update the header inclusion in the milos.dtsi.
> - Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

I missed the ordering of clocks in the milos.dtsi. Please help review
with the latest series.

-- 
Thanks,
Taniya Das

