Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62160362120
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789312856; cv=none; b=BAqKI3Wye2hZ7MkvQxbgC7TdtVPlhtBR0eiIrZRgDpOBuhFTonIpejjVZtEMmIK/9B83HBNMu6Wp5lhmOQhsRyu5zULfEQeDOXjkDIMGixSz6XEbDNJgJO+05BRYHy1SK6BR2HgOBzFNoW/u24vZBfsZ8onZGa4TDWWPN8YduzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789312856; c=relaxed/simple;
	bh=t6s/awq4RoqBFyOqvzNKS/rkyBda1l+Yp9s4hTmPxgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9llMguJavZ/JFYN3qVq0VTKt4b5jpy1M91Uv8/FFyiSmewuaRtpAL//IgkkyGXEUflgGCxMa96hC79ssu5hIc6Lk9U6VehZxBnnpWr35WfLRNeImwviMLUiz3EL68OgdSkyznMeZ0g6bpaJ3sEaSQyufiTF3VL7P6sO59EHCCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESO4Uu9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVyl2CEU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESO4Uu9h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVyl2CEU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE0HuC2481216
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 15:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6s/awq4RoqBFyOqvzNKS/rkyBda1l+Yp9s4hTmPxgk=; b=ESO4Uu9h2cfPvt6d
	Eu5FFCSNztSvxXt70SCxpeGJI9tEVzTKu3mHfycBSkZ/Ll9bNNhwqHRXIOep8SlR
	gXkvYTyyWSoCQzrBQZPltKc8mDKGz6rqTo1Ukyd2HKRs/JwCLJg04X114sT3TxAr
	A6ZAYdtHXcLQ5hkwBBhC2/WuOoT9baNM0JFmITwUnA8QU4wIvVciegvIW8hmiX5i
	rlWV/8xv8OWe90rXbaKzvOSRtUnqhbXOw6TyqdN5squYvTFBt5cqKXB6NDFsEFyR
	Z/AAnTZJKsXatujA+h1kIrzWgI4hiqfBPdgeSMxpGZMHH+PMt3DGMTeReBoh/ok9
	s+c1vg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dkj90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 15:20:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dcfed75f77so34255745ad.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 08:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789312853; x=1789917653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6s/awq4RoqBFyOqvzNKS/rkyBda1l+Yp9s4hTmPxgk=;
        b=GVyl2CEUU9k5aUZO/CfI2gOTNAOk6I+8GhZNjXHXNDppgodTCPQ5RC0drusRz5thCG
         IcpEC2brw9vvj86TPl7B/2VOjP1sP3Jgy9ZpGoXGDJoce79c2t5QPriGtoNAhaiQdDso
         lSDMyPa4258YcVOw9m02ltOj2BA1x3CF+Y7M+5IfQQ7eyAQkPGcwpLLIFGhfVIbQOS2Y
         4mtpjDbJ7qNJwyclQB+zGPF8vlvW4SgGx+g1MK4AS2Jwjj4nvLDJ0vzpALZUaXAFyF6P
         7c5CiGBDlpcoAuEl2ForipZ5Q/zolIvhRw+SZHY3INzGPDoXP3OP/W135o+sG0htfNx9
         d/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789312853; x=1789917653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6s/awq4RoqBFyOqvzNKS/rkyBda1l+Yp9s4hTmPxgk=;
        b=Mk5QHs5PHNx+qgxuv9Qt8v9yVAHlKkFeN8Zlt4qVzhUtGfimTDGp57OmVZhR36i/Rk
         5ayeC84Kwxfr4GE0rvRzFw9ZqGQVnu32HddvUDj2LHQ+WOrj6UVBqaMwBdGts1dkcZuQ
         NH6uBlp/+5lfr42eR2a4OiaTkfxf3MYy09pZuVpafDnZ441ESX3PQ1kQvy1g8emSmnHs
         9m3jlmQfds/a8nHg9ctOFoNiH8fUBCIr/AbCzl780N0EqMsxP/nZoqfkzcGq3n8Vw9ZA
         92OsifKfREHfmMRt6aUFGAWfT2ECND3emm5wumQ7C9/dTwFcODHdbtOhMugB9Q5QGJFX
         OR0A==
X-Forwarded-Encrypted: i=1; AKwUvByuK+80FctajqliANVR4k23wULRhevmWl0qYm2fsxXWqJG50ZXm0PQqL9qfokpvAsx1oPROXsezSI1q@vger.kernel.org
X-Gm-Message-State: AFuF++lXN4sRHqua05DWviswxGQGjXbsWaoBuFmIG1nTjN7nf0We0KOg
	f0UMX3v8hz+32zH+qrcuDgz/ZqWVlhvjfBGZLF9rN688FV57saNWtr3/VeKF5BFty/Hxhg2Klmc
	15zWCsZJ07D+xs6yMHSuZfx6gEEyOWbTFAm0HqV63jDeMTPhi0NomADUjhoO+aZD3
X-Gm-Gg: AYBFou3zSheiEDihHrIGLFfB9+yMz5+O71693tJqvEqA1125/bIsrZNAI/OLcST/p+Z
	vpcapOfqFXYTSYY1mYDrwf0XwXFJUyOvHx9AnTXPnnzPrWGSHjNakJ7F7Q01IP2j4uYJtqtH5Hs
	qoGHle6G7uHl3qaVpO6Jp48YlphK8ULCahNdLEWXfRuHwJmmSMwcriCoFR2IcnMRLdi6Qa5Ow0V
	f50kDegZHXHseiD7B4PM2I5tcDzZPMk1Rwy2ioKbTRKfMyKcWSycJnOsxi4CLSpMg8ktdKcce3y
	ewD3ZajGysVTgkIF8serTZq/W+rQi/Hr/Guk+EUgq/EDld2xufybzcFHpCWPCgGdfhGhj4ytkdG
	3RCmQtXqzgWfszCi+P2fj7AzOuhELJA==
X-Received: by 2002:a17:903:1a67:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2dd2a35dd20mr223181795ad.17.1789312852781;
        Sun, 13 Sep 2026 08:20:52 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2dd2a35dd20mr223181195ad.17.1789312852339;
        Sun, 13 Sep 2026 08:20:52 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.233.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm9983061eec.9.2026.09.13.08.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 08:20:51 -0700 (PDT)
Message-ID: <71c309f7-3017-4c2f-b2df-82cd1a8019d1@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:50:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Enable SD card for Shikra EVK
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
 <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Jjq4QOjXBEWuq_5kVeUYhgj9kNn_SctR
X-Proofpoint-ORIG-GUID: Jjq4QOjXBEWuq_5kVeUYhgj9kNn_SctR
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa6bf55 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ygYGJKfEQ+goyyaro2Znww==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UvUgRuKAC70QvhXwD9sA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxOSBTYWx0ZWRfX4/RUsNzUza5W
 UfVl9n/I2ajZP/UoUGi5uZV2ppYRTFXVdQmz2XJnDQkLk6UI8enJL+XgEQ1ywXYffjwkVZ0r/+/
 2AOWzgkTL//zOVGqSV4QHx8NlGWZT5Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxOSBTYWx0ZWRfX/LflB4PezNFZ
 IAr2wYMfLcvVa18gV1GDe+yBMqxBNxJaO81BNfyF9WlPOvlbrJPc4gF2lEoaSWW6jSRYlZizaks
 JdvgHxD9DQyrjgO9snsx487GQv4GzZApgJx1nKMmX5BAJQMYfEP3FYFgWf6+kVAw3IUX1hPEqdq
 xEaE2bLq8nWldVr3RzUVAr+pTVMuayq2Ucf839ZK/3BxSlNagBYc1nZNGAgUwlP0YzTC+sdpoLb
 ucCeXMIerCjez9LWlRLQW6GC2ARTGN83i4Ly2sXJ6NTASUpdJgUVAQ4cEEmo2cl6sFHhfct3pE4
 wS4d/acpTjAmohrL+hIkp1wApaub8zl4SH0brN96FKHh/wzPZfnZLb9JLKbWCQsANOmOGsET6Xi
 n/aZdhP2Asd8o6c98flRaUvVePB4Wsf+qofnojWZexsvXSiHE/Hj4QY76ftJEZ1OgeefPoQmn81
 Bv+Il5wnQKTlezhIIqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130219

On 9/11/2026 3:09 PM, Monish Chunara wrote:
> Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
> vmmc/vqmmc regulators and gpio-based card detection for each board
> variant.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
