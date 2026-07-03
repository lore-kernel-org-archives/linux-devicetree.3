Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD6038A729
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062571; cv=none; b=UYWQg6diHFmokE0GSVnlS6+JSM988vDhtKzSNaZzR6FeZkqtZIQuzTO3o2NeHbd9EpcY5TSDmmMRQaZrbrFG/cRMqHbS132iEcoQGPeaPdlhAosC0FZ+D1uM9u+V/JxQEYjLuP213aMba8+A7kbCLn4ph3gEMcBISfQ2NaHCwBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062571; c=relaxed/simple;
	bh=g68P9A+dHxeL+ip9hbd/hg7B855lI6NTTBSWmJGzM5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khPGU2ku2LaJLVKTlik+fZLqH4ltea6ypTJeyHOwJ/B05SpIIqBZzwICAf9LpfdIdbK4Jh+S7MKI8um20FduIwyca8HNta7WIC4HLDU33EO8o2T0knR0g57vknLru45MRPTwiHOrAKRdmriUWb+UyrYH8VSPsQeij5u9R4A1KVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7WEMdh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfgCORDQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7WEMdh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfgCORDQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rwkf3126415
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7h7txza+udYa7xb1ypArvnZ7qpe+WLyJsm/FYYt7b6A=; b=m7WEMdh71Psqfl5n
	7u3F9JF0IqWCcTOWexl6N0VvRfy5oMrOvc/BXkcpiHesjCL4ScP/VvOT+UlU3En6
	awFbxrql5gP2jK+D1nmlz49QZ4/l6UwYMeU5/cO3NbZOD0X7xH/69k6IcrBHZ/Bh
	8IlbLmIOXwy8cY19TnzkI7tecD/acGItQG6quWhy+q9jAdOzjolN0VOBxeENHrp7
	98rvlNpETm6rqijSe/TOfkS5RsUKTANtNzT5UDlua9bkBZNEOYcpGx7U9qCOBoXx
	bVqNiua1i39nlJsiNcT6TlmAG8TQdgqMyio4Eq4dA4JfVmxgFes4EVoxM0fr7EDl
	v8dyWQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnk84u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:09:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f2747d334dso797306d6.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062568; x=1783667368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7h7txza+udYa7xb1ypArvnZ7qpe+WLyJsm/FYYt7b6A=;
        b=KfgCORDQHktzNq4L1ngDUajDOA8mc4bkKDoSAo9W0R8OU/BCL+B3QqCSLnp1ZBAyIw
         8FN/uyTXRZCND9aw5BIpxkle5U8bi4iJAt/69bFvsYRcSGVYPdDH7zdu5d8SrfyVi5hD
         D7cJRbjjiR7KKQojEaaKo5FlyKvO7XNJ19pvV+tA7eVZYDsIKu0qi5mn2Wa/zT6qD4N3
         XRS5yAIZoyOwFjGfGwFzteSe8VnqvaaaIFuWOs2T0a+7EAIo74ctwNrRK+hyO9kE8twk
         vUuK1GmZ0c+wKKBdpJhkuDTJcVA2GNlNkhZPx0WFznvVEg8pNzo8kguHU8nhBCn7MvsY
         xjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062568; x=1783667368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7h7txza+udYa7xb1ypArvnZ7qpe+WLyJsm/FYYt7b6A=;
        b=E6zvs5hq+Y+EDraVemvZJNVlhbsBPY4e8oLsmRZmHMvjhuL/wJ6VkKqhgAtNJa6Aa+
         PtFl/kx0S/Q3tOIwncfaoiqvrVHR2DLf5STcfxW/F8mlAr1Ak/JfXf6F9xqNrlFerJa1
         1MflpKl9EFSNSCm+cSkF0PMrG+rhNZxG5RmGL3CmlHBKQ6HwrBUadzqkpOqMbhYIvPpc
         8lTNgkajb9+j2Xt1ZhGMy3qpb34WdRYrLu3u25B3Z8tx3SA50hrhOhEnvY3K8HfAGqZn
         82MNI3unFZdZ8EPKPP4xwydH+uHVKlnSRg6QqH8n+HOWPPIGqN0cCLNs86aPh/EEj6QW
         tCWA==
X-Forwarded-Encrypted: i=1; AFNElJ+zurRwoPwdhOvNcxECAuD6ioM5peS0kqb6AipsMGJQlucKgTSN5RVU1VpU9Nj759zYQ8TRk9dMOb2z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxazt4cT6alVVbmDXIN6G1cz/Hz1WUmBd8YFrCwNWwq2FBKGNz/
	yQaaTXd/L07zWRogm7uHTDcYcFn4k8hGESMPLbXTW7qinX9JvNOCS6DhMn6zS3NKp0SXVsxnsfb
	A9zZVnEIhhEAMEdRKANWZZHkXkOyzO2zMAbjW5eBncKqF5yvkCeKbLyIe+l6FCNgR
X-Gm-Gg: AfdE7cm2CYZpOUZRiw3f6XGl/WTfJ6r0WbpxhBt1r7hDfbT/w8ZELHyP2iVGBgTmKYK
	6KnIFoQDxVohcBbXTPf4VI20Im91fdWS3fSHPTBF6Vn0TineUvQZLo8viJMFnxmFQrXcx7bmkDn
	9aFJu0uGt9tE9rrfWao0IcYdLhN4LIx07VRgFOoMYqs6E2gdqeDkBItrV8HRfoFRHASOZ4+0wcA
	thha8uOnE76FVBFg4/r5vCG5nLIWTYrIMv4x9nixF5N7pB0zd63j2gjd5JsbeZmcQold877Qzdf
	Rb71IPAk8hkQ1M9evEovafcY2clHslrWOTm55XCMe+GPgIoUjGmsu4QJB30ykm3BYSrKGz9MfVF
	ANVPx7c3t5ntabjnizLIifaAUvapy+2lTE3A=
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr96521711cf.5.1783062568253;
        Fri, 03 Jul 2026 00:09:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr96521421cf.5.1783062567659;
        Fri, 03 Jul 2026 00:09:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290794sm236901566b.38.2026.07.03.00.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:09:26 -0700 (PDT)
Message-ID: <d35dcc4c-7155-49c5-9283-a66174deadac@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:09:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/19] arm64: dts: qcom: agatti: Add missing CX power
 domain to DISPCC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EVt2uSeX5WD7ZGqOuCYUgYK0zDtvvLL3
X-Proofpoint-ORIG-GUID: EVt2uSeX5WD7ZGqOuCYUgYK0zDtvvLL3
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a476028 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=aS16L__B_HUEhUwf3xkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfXyGBuUDvPEqJ5
 rJwXknx/dRIHi6+WjLQNq+o3CL4QgYAsWHWDBhwlomEaldrdJvB5PuPPNU42IYna+ctyyFKfRUe
 eDidafU6NQSjFV0xo87/Nd/NputJQJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfX8eZ1jkm879uf
 mg+BnlIrriG+SG+Z4jP8WgjB7z60XtQuSSFEEdieZc2envlOxPcMFmU5olgzIUeFSRjeE81Z4r8
 7eqQWThY9fDTVIz2npk8TTE2yTJPGoAlMsgvaPFKXu1TGBtf3GhPjgRtIccQEaExzB2Jnq8QfGO
 cp84Ri9GsYRxWwEnEez1sOPYqiIkCthZeWoyHwjF0XUUd9RvNmwxifKBUSYoK5fEF7SmoXa+o7v
 R9IKKmaUaFAFRKb5+F4J3XIuIaiRKVT0fDn5byKGBxhJaQYfke9GI+YigQgFnFpAj32BQtOKN+M
 07icMoIn8l6KaTCrClwAaf0cIpvBjKj3f1psJ/sYdu/kBgvDKJU8KXqVb3bHULwQnNx2HxlHNEY
 UBgBctDMG0wA57Zc/NcAUgAsr9OXYV8GaETz8cNkc+B7trQfmzqv4pNz9yOz/MJi0a4JPz37FtW
 CHVAoYhBGsCeWyEAiJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030066

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Add the missing power-domains property to associate DISPCC with CX rail.
> This is to ensure the genpd performance state votes on GDSC the to get
> propagated to the CX rail and to avoid the rail under-voltage conditions.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Fixes: a2b32096709d ("arm64: dts: qcom: qcm2290: Add display nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

