Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB944503E6
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388513; cv=none; b=ewOR62LW/3FwySfs6KapYqFXg1tUONyO3jBLX4rS2v2jtNr81dBD+xIJWrVNLE8g1s2sx7euGPCIYNu0LrpLesupnJl79ntHVX72FlApa9o1AHji9Ocd6RIbOfDWUjZs6SQKDFooN2SnsRrjovuObUONc5zdE55RDyjXI8/5NwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388513; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMe/RHFsN79FxPXasCfUeaidWnubtzXtVDvJRLx3Qw8i1JOFBETIGQsKgIQocsaG7Uy87eizVTiAwKnSlZkkxNv0wvgL7f3e2SfOyB06nwE6lhv74TyhF+FYMBQkEcfknnuygwcv7aqMjcFuNQo8/0pqgJtVsI727KPiF2q0Jew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iU9C+2Xu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlybNfus; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iU9C+2Xu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlybNfus"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm2WG901940
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=iU9C+2XukuU9l5wB
	7s+9MUAa6M9vBNYzeczJ1d/iZU3ivcb9ZWwMJQ/go95Mh2volaGzD949fTnVqfp/
	99XQzIHNJkGoOOVphsGyrNeZe9n6aZKsvzmh96BqvUuto40Vbp2ILDEYgWR70abc
	rzW0G4huyQyoGSZbLRF/UERgwuuYV3pd360y4FdCVqdCoEfZb4mVv/rXwd6g3GMc
	ggr6PMxcavao5TPj7iR4KntclDDCahGIu5RLyi6nYPqKAqJuB/mXMkiGAKXEqU3z
	vC6tGx//jAh/tJkBMihQWAijcnFxaK00fV3x8WN8MBNKCmGNvQnWGllDaFaXiPm2
	AcfpKg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrtpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:21:50 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82b8e1ec4so54874e0c.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388510; x=1789993310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=AlybNfus4UR/ThCy1r/9m2szNA9JTewyD7OzyypElzEOuXUjjbcynzdQ3tlQrkJZJR
         rqs84ZUe4LTGYUffeDzXtuJ/qZ18IblN/7dzk0QyjoLGuBlU4Dq3duQcZtYLGMbCIPe2
         eXY2JedLKtsNlljOhVL+JhrZY1Ba3N3I2lfz0eh+XIurlaYb/0zChrsrToQuxbOAxezH
         GNV534/AsuRkBSYGL8oFSBWEVYIGd1hVXn7IKusB2V18KARoGxVzMTllAFwvlNJ9D3ZJ
         CzqjyXIM8kSiz8d4bZX6vsYnrB2YX7ejZkAsNxz8KrszHc8yEaGIZ5S+IuLf50VbsXfz
         Ur0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388510; x=1789993310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=HyvnlLcUc7rcTB1TWaSszchS/xmEtH27e6PWUtmxgUY9+s7wklrDbNIQbNrkTsSqiG
         ae0Gp5n6PdMHHJoeuZFrvk4D7e2Lm0+pCetuFaL7iME0IRW88xLFRlsOpWtg3CVL77JP
         aLO/yhheoo2VcU/o1cYToka6i1+045x+7olBrnozdpsAInsDEPUs+K2616zJ4ba+AaXM
         LhsK0SnOC7qRNd5vx+Rxn+yLID632BUPv7m67L1kcbsZ845NXPA8wo3gD6IcCvd5PCIZ
         cONlJomeBkt5MYfScFBO9vCbPHnOOHYNO4sPyzPhLOOQt5m36ugjd7d4ynZ8nxkO4tvD
         8Fig==
X-Forwarded-Encrypted: i=1; AKwUvBx3zhPWHak0CmLmZo/YJsDK/ICWAFEUCxPxEkqHzHXG0CJ73OpbLl36MhCW1DS1Y92/4WGa9zcLpW0x@vger.kernel.org
X-Gm-Message-State: AFuF++l2GtPH06000Fpo8pdI1UefRRDL5YpXoa0EA2HYGPF2/wEWGIrY
	JWo3sgRUVn5wo3XHwJC0cXPisA2SdUBpBbP/KDKtPeBdSThspPydBPSRTt9MDqHoK61U6a7DAbj
	IhmiEUI7JBgfEGV91zzrPZqBjbNkhMPZKh1mYHvmeJiW0qBiWZUMgSbrcWOd4ezFt
X-Gm-Gg: AYBFou1KspdBqzVC/ik10BSYq7NZRXIWJfBQrG01Ak2IDvFIp9By8aYhv+/YZeXIsqK
	lkEhnOZyyBE/V0jA7S8tzdychfo9XV28DRRHm0JS6FzyMzDrt1QOQy37VeF6YvbcZPBg7gD98hN
	OG0BiqR2AUru1yB61YRw/X9S1T1dm+q8MlfAc1D0V0Jz0YkmCNc/mjrg8trIXs7BdJi7NR3SBK8
	X63j1zzyUY9prDBrfRCr2ey7qwiBbsIvUCauuHKY3UGxK7/Xt/gYA3PmKRfe2iIalGd0caQQrJu
	xF8pr6kOeijELOVq2dHvcBAP/l5SX1rx7bXzM8TaiogZDAC0N16fTRBMEv+cAM66prFLqdwEqDv
	s/CaG0Ylh0iu4C0gkqRE28Q==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr369185137.2.1789388510025;
        Mon, 14 Sep 2026 05:21:50 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr369179137.2.1789388509605;
        Mon, 14 Sep 2026 05:21:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04568f2sm2472223e87.19.2026.09.14.05.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:21:48 -0700 (PDT)
Message-ID: <299ad232-3f79-41fd-8d2f-06f137a039a9@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:21:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/31] arm64: dts: qcom: sm8750: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-2-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-2-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QpFobpkOiWRCoHOq-1D5Wav2fVF-nNkY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfXxu1JXRscDclC
 SMhKlrjSvvuqalAn4O2SYMMwCjxzCgpevsep/WVrZ0geA6xL/fFmHw/Fl4zyNSLKluh1UGn4BC/
 ofCuGrHRW4ev4fCqqFBFylboLuiTCdU=
X-Proofpoint-GUID: QpFobpkOiWRCoHOq-1D5Wav2fVF-nNkY
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7e6de cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfXwwtHwqqyYfiH
 QYH345ErlwMvXSviYL+ULA6YEb+jR2nJ4RBAK3Lka2sb4G8X/jS+2d6g3nA0hS9nVvpIezziNFe
 RK2hf6C/VPVxZ1GiFAQcdQQgO7IpIPdjzp1sQY8haLWomaVQ23hbx8/quRvmPSdxnYEjdLVgx0Y
 TOhD5YhaplaRjYA12fRrQDaaILffRuIM505FUR1ZuzcGrAg8h4oIMpat2jbHaEQW9xvuZLkPgnP
 mjvxb7ofI4fQfj9SakTH74n9TujGjnD9OgPy3z+w5e2Y9iYGZ3W42N5e2vcmTX3dDT4HLJHt/Oz
 J9SFaw/uJP1rFUpgwblUBggmfrneJd9EGq86qUtv/gdHOoHVRHThjxQT+ubqdRZFLJriCNJjeSt
 sy/fvdlH2HStqdcBHha3YmfvQrenJdmVargEW+f+/qQ7nd21jsPA3Ri1zCJ7H+koaM6MlN1tBiH
 xCKOU5L8neQsNG3fDzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
