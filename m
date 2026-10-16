Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8D8495AD8
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154143; cv=none; b=C4jVpt/9fj3rznO5UiR5Xu+pYe3NDY5TBqGmq0PHUHpQei2QpYkSQtptYdWksN9wWa5Bk0Poe52dqjTINhNmRQg/27dmCu4YGNRrSn4WFKRguCAmqRU29bnEedJat9IDyZ/yX6Zo4HU+viewmSKQ4NmED1zTjSfUNbbKx22kZIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154143; c=relaxed/simple;
	bh=+t6dshiwg0k2lvBeYJnIPtUGTCv/MJX/wKhxUVf2VfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9u36tUti6zogyXqwNP7+q7tiG1VCEADo2hrCk5FuZT1Yejvr+VezjSw7RtEn6oJb6D+yqYAKRMq9ou8ObrYOZr/mcs5fk0ubIKRU9budbZ+VCKriWd5Y01igabu38RTS6wAwvXmpESkOaAjD0KOjHv9HOanOHYfgGeGpGvCj0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbqxDIsp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kpV7As+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbqxDIsp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kpV7As+v"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAATsw3069379
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDV7CVjOSiyTwKyte/cvf6mHtD43N/X0AGHKK6OXI8A=; b=CbqxDIspWJc82/Br
	YdeqAbaY1uVfAN7+BVpfVMWEIktZahTVC57FYB1w8smrQyP1vRQT32QGiPqST3at
	0IRfN6ABvss4inCnjBBQwJNwPbXr2u52KOZvWGhJ8KQv3+N2J4dj+uOtX6F7AMID
	ttf3ekLADbLa+kC72Kkv1qfu6VcQ4kWyx0hOz2f+SZn4A27x5H2OaXiV/D0MbDJJ
	HrXGjAoMiwu4QsACereQyb+vYl64q0Kzx1W5Woie9UNosKWhKx9zv1npk7jkKb7x
	Hx221WIL49TP7BwLMS7o2Iy1M02V6Sb2InUKMHAcgo00astXhEoULVHgsKZ3FImA
	jIylEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262a0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:35:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso97306385a.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792154137; x=1792758937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDV7CVjOSiyTwKyte/cvf6mHtD43N/X0AGHKK6OXI8A=;
        b=kpV7As+v4rDMD8zHWRchaLI9w+kFkqQ8zblVKhPBaheqWsHRc3DtsQ5tpfxx4RX0Kp
         zys2T2Sh5WX5LPHA3Unrl47nCmvFXWAOvymOCd+iEBhlDmY+vnepAxMlfp3enveDulAA
         afEb7Yqx+SXBwcnwUbweZL/GjXjPxMjTse4OOFNY4sZ/UQdy/bHc5DMJMajpBbjsDoe7
         LJL0o/8e2pQ2NwRyHR7F/9AF0NjhneQS0twvtkVr9d8XvIBoi63fwID9mEtYTsc8cJuW
         Myhg+zBJSC52Nv9KJZWXtngjPrrrchehNZsUC6JN/Mk2zq+tlb8301TO0VDvS07vrdqP
         Xs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154137; x=1792758937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDV7CVjOSiyTwKyte/cvf6mHtD43N/X0AGHKK6OXI8A=;
        b=IbxzilHLMmPH5S1LTrudMrOsIsl1/iVunYsC2uJ/CRYznAdpeJSgM+f/kLIGaKMJLK
         xZfdWSXCgvl3lXkGrQqmCI+vceXKGL491kdrH5sBa1Gcq3mgNl1Ii0PAq6zyApqZIOlN
         B9r299+d2IpxkWOVaLVRoZDcC4gI3MS3itl5vlqOWDCL5CwGOt+9qTuzcYSPljaQm8P8
         LzAtJ5WtlMFE4AGqkHkA0LyKg/BoPyiqXnY3yaA2CovRL2YPAiNe4MC/9ur/uzy5QLtr
         Qktnozu0K03OaRBfoM1LpGTIKWN5+uTu2x8P/V2kmYMaC4HaDBpUB/Qq5MjnvYWHcO99
         tEQA==
X-Forwarded-Encrypted: i=1; AKwUvBysqsZBtYT40cprcyOCAv8tAHoCU1vCg71BWI1e3xN4az428R773fWFL6IL/cfjvc2LDK5DSirjOtyD@vger.kernel.org
X-Gm-Message-State: AFq9FYKf6TYhnbG/XPhz3NhsowsQmyqHu+6m3vhOgsY2Aqx15cEjtKla
	DiON8a5jzZMzpjMf6619A2k19XKZ/hIb1FWV/fD4AaDgbrB5L0c8ghXuuvr2JE7E3SNW0tbBpwB
	u+K7uCVHJGlSuMudzY4aBYhAdtNnnW7b22LV6DcCAa8XE/AhuPTENjjHczcGJxDL8
X-Gm-Gg: AYBFou1eANaNZDzZqQLn1rh/UuBRnjdQbMEkk8CkhMphMLU8iBj77wt+mlVK92oBOpC
	yYxld2GAYcoltPqwGYLw69pWXZvlVW1gMEqrNq2gBhnqUWZzFK4KyTf9LqY72ZEwY3VDI2HmAUt
	6um3nHIT4P8XGwVtLOkLtvGZrUSCq+gIszngGjBiCcAkMq1tMov9/HQl/1h+LM3RV4IaMoRL+1G
	gYG7rbxRkAG2cCeywbuRt8wH9mm7vb+oJym9ollWSIKPEiW7CvCoRF4wQdQlGrHI3/Q5vjBlVlZ
	Acu2QCe83nbbYF7BwvtYtl5NRbQJoVJhTvlD0Pdy2fCPSrlbbpI+QT9FhfnxfCO8S6mUYJfR8z/
	y/WipJM8ssFoAGVYPBO3Mbg==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr4094557585a.4.1792154136715;
        Fri, 16 Oct 2026 05:35:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr4094529985a.4.1792154135803;
        Fri, 16 Oct 2026 05:35:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm67074066b.54.2026.10.16.05.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:35:34 -0700 (PDT)
Message-ID: <fa8940eb-45ce-4778-88fa-5502dbd686c1@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:35:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook: Drop the CMA
 region
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad21a1a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IoKEEaSRBiMpOdyFCbAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MCBTYWx0ZWRfX2XS9ar6u7F+l
 zMKQo+8vgCdozA24NPmX0OVyOKwNkbyAVWOLfawMScXNtIlDQ7jqHJRCG3+8BwBbqQi3u+4ld75
 kLFCQZfpfTxQW5zEsVqulaOKMXXKyrqCl7HuVqESNKdh1H8YJekKOR0TacxR1RxRLPuHCH2oyUo
 6yJXhy6kQiEYVERkWbxPKq1tes0EIBfeJkfghAE0xxD277omzG2LRT5YcO9wCLFrynbvDtE8JGO
 gT14CgDOnSsMUhKwc+rcRcUOKqnIRVZ2YTyu7hhghRZuEtPe3XCmKAPeCHh9uct07Jiak2rTNk6
 H+QxqyRCMzlv8Sg0Jhq+qsZMBDXB+ziuvn1TiZUXOqfoIlZFNJorU/WkufB6hOCpRQzoIjp7Bwj
 PmteXgzo5VOTgJRdyLCUuFMnnyea8reP/xtuXV1hqOLMDJwKuMrPG+ved8Au3nHEHUJY7aXFfYg
 Coxx1WUCJz8O9QNlriA==
X-Proofpoint-ORIG-GUID: PcLTxel1wK58T0_uXF8d5eNtD3cQsoHC
X-Proofpoint-GUID: PcLTxel1wK58T0_uXF8d5eNtD3cQsoHC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MCBTYWx0ZWRfX7VQCCXXJgZ7h
 SnxusReHAtnLBad3wcKjXFFsCg+13rClu5pqiRS4mSDFgyBV8oyZVelnBFhPY8z8dBMWA2rnBXJ
 oKiFsD/XZKec45ewL93DCkTS/Zw/wVc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160050

On 10/14/26 3:55 PM, Abel Vesa wrote:
> The linux,cma reserved-memory region was carried over from the X1E80100
> boards, where it is needed because the PCIe SMMU is reserved (owned by
> the hypervisor) and PCIe devices such as the WCN7850 WLAN end up doing
> DMA to physically contiguous memory.
> 
> On Glymur the PCIe SMMU is owned by Linux and the devices behind it are
> attached to translated IOMMU domains, so there is no need for a large
> contiguous DMA pool. Describing a CMA size in the DT is also more of a
> use-case policy than a hardware description. None of the other Glymur
> boards reserve one, so drop it from the two ASUS Zenbooks as well.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16

Konrad
