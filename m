Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C8A42B336
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328447; cv=none; b=HLwScPsxq5asgTp4dL2oGK91ZoTNB7EijzXVxft3TGcTKv6u/jWfVh6ZijgenBxWBM8Q5FL3ljIoRff/sxufbQPMtTFzmb/C2M9RTZZufrNX12f8+PDRz+e8sGwWlpIodM6+DI9kvfNA9IKXFIJDy6C0u+uAvy4fpYw68shuo+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328447; c=relaxed/simple;
	bh=iNalMqxBJuKl0rvyboZOvliwzef4oPKxKnxNjSsH5SA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQ9Tr9R7gdJoIW6F3sinAYMjLTEByp/veDbvWfAFXaugGVNEV3UWhFHtaBnrCRtamEfQJkZYdTindBSQnUldB/Ky2NdmZiGdOiWPT2YPun9cKcAb5v4yBVSqTuczWo/Ws3XvtXgKqTwPWaRSchtfL76ZN741qBQ3RzNlUYdgWFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rlpxhtlr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEMcc9PA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rlpxhtlr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEMcc9PA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Ze13615523
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNalMqxBJuKl0rvyboZOvliwzef4oPKxKnxNjSsH5SA=; b=RlpxhtlrzEyY/bep
	qrirL3MP0GWC4Y8C6Grlx2vXXVY2Zh2rRAEeh4KhiFijkwAug+ZMIAgyW1aFAjyC
	QPZ8RSlmo/v4WBAzPYxWUC4rJnLJ/nvzRqjR/wTkV5yoUN3pO9iipFSHomoJUZZ6
	Q0l4t9ir1+uZ4jwKgrI4ViGnDHyUHwfMV5OAkwduvxW3sJcMmBWEZjSIt70Ox4kJ
	IuEZyH8id4AXiClWKVjt+Dz7qkCbZVqDyLxGAxOd0w2FZii9aWg9/dek989RNGow
	HpqX+CnPD0Xi3vlIqLh8nd+68Y+A+T1mWCN9edYNNBPkivzpHSmr5nu19P2F0g+C
	8rMVcA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3dd6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:00:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-846f50381a6so2169896b3a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328436; x=1783933236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNalMqxBJuKl0rvyboZOvliwzef4oPKxKnxNjSsH5SA=;
        b=iEMcc9PAnrKbEBf6IM0ugXOXL1j1s8QhdGlE2gaZuJATc4cT68N5macwPtHhR6uaTX
         4v3Xy7uJIWAdlfS8UwSdot0h1/ndWKXJu/eHs8d+F0jkp538cIb0iqWwcmgFw9LfirO/
         uUHI0RJX8kYdeajWLemu2Hn6iTwi9jiX5wkksHaSYXX7MlwFOPFeDjZRFiuNEjzZi3Eu
         HDA+43FzygmsC25XFYQU94UR4v51ZHeyvl63u6DHrt3XjFvOQLc9D7EduoP2CEAdOHq/
         sUcr0xp8IpufTlKFaW/OGlxCFl5rlB2veemLV90T8KmAa1Aqff6hj2hd7X0S1X/365f6
         LQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328436; x=1783933236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNalMqxBJuKl0rvyboZOvliwzef4oPKxKnxNjSsH5SA=;
        b=tMjS/rH8Qbpp1riHrIQgCRYG4sF3kpRGsU9scxQSO1739PIIT08x+Re6BiSHLNgtsI
         SkxLHwXVA68v7WmtGpBTCZnwa6WMk/r+qHO0wGGcDepZaTxEIicwo4ihMPkg7d81FZNN
         3enizIr/T2J0M3m6ENFv7jCmh69e7Bpxd9g2UE+mCqdmbNp///xg6e1BJeMS9vwQ3EUE
         LxfpiAoC2+DjsogPxkvUdk6+S1EBAbKXMgzsGaylUkc5cbsNJ+Qq0dXMak33CKXQTFZX
         LD+b6CDfc8jQb3dNSJoQgPtNkA7BYXmIh3mr6xU/MBjTzq09LlB2d440acHUz4JHtaOg
         yIPw==
X-Forwarded-Encrypted: i=1; AHgh+RowiEQlkovzI7893xLIXKomxhyTQw2vB9Vy7C8QrZ4Wejde24xnET3zI61e1NcI6t4v+hHk1RNccdpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxTIbe81cN4Jnwx1g3vOap/cm/mvzWUNGM1u2ooZVjD6eZo8y
	ApWDJQznrH4pe1hYLmCvhXne/gL4tMA4kq5TG0DWD0JN4QZEtXkU7eii6Lyd4lDxaeP3tTmZDkR
	6UQowjA79LcCqVHhhfudUbrx80RLyeVRvHRttZI7ZcmdT2MFsIKiz1QeHLthCUhQR
X-Gm-Gg: AfdE7cmxFmWXqb/xd4DDyB6bdlzq7pSpwG5hCWAJZQozyhQMNxd5SEP4La+VwcbdUkw
	tXcYCaCgm2AyEFj4xIxgP7EiQG0N1s3EbkuuEXy1e0bFJBwYogMPcalJcOr/d59zyo7/SNVFpZ3
	8bx/8orkmH0zFLJCwUd9wXNPXZoGokgtukw8nP3FylzBwU63ssowauHhvTsR0q0gaSvokcKa+//
	9/wrms6mSVxnlGY8gZmZRsNdfCk4h5OS38B4AOjRWW2+K5vDAQFBkf0/Zn4f2ffAOGmS+XuomL/
	iEu+BR3G9FfWvu87uyehfyydR3D2jQAoLh7Jtrinla1qxqSHAG9QVBUWmUAUDiSeHEViOR+hI75
	bNd0U9TXtrZlmn2/6nTGVPlN7dmF0KAqKTRst9XH6
X-Received: by 2002:a05:6a00:808a:b0:847:c014:864e with SMTP id d2e1a72fcca58-847f6ef68ecmr8402792b3a.30.1783328434388;
        Mon, 06 Jul 2026 02:00:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:808a:b0:847:c014:864e with SMTP id d2e1a72fcca58-847f6ef68ecmr8402581b3a.30.1783328432453;
        Mon, 06 Jul 2026 02:00:32 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6952a0dsm3504494b3a.0.2026.07.06.02.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:00:32 -0700 (PDT)
Message-ID: <5602dd52-73cc-4951-8995-8ad72a9b7465@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:30:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-1-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-1-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX8qO2B68K53Dn
 JHd+kJzKs0cpkCru1sqjoIHF1toSk3GoJUCteWyQCk6JwiV2Oze+l384MK6VFqqfaGWEMStuIbN
 Bp7NVV4+dD3jQdISpqA3mwMJUtzSigI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX9sAo27oFEiWb
 tqdDAWs+hgFckjo/+j3DQ3J5+eMHBJ7oEdmQikF0It3Dcvk+5fgaPjsqCxG3Dl9/EP0xARrciIk
 UI8EjxAmeX4+fuBFh/pRjtpzx/PzCITUPS0DcoUPLwGUoUdfhpc6hX+m4esRbi0ZXs7aQfLnJSP
 MAaQ6guaI5+KWVN2Rgr44QDXz+0gNoMpF5YlOBfg1Tji27DyVEIqBG0vtqmkv9nJG8S+8H5uVNp
 nqqMF9ZUMqR7NFl0Ve0XP4vgUUhnW0Ltc/A9DcCQCOoQDcgp7HRRKiEgery8hoehoBEHaY1iPa2
 zGlsaW/ixGuEdWdZ506Y/IMx2aBXTHbEID9Sgelwy5wbonjXwbxpO0mfdGl9wli5Vr5+OZA/Nye
 Bk4QP9wxbZzOpL6x4avWtzSalmtMTnsajW5m7FKJXIp3zNanrEc2eNx2oeGCzDhTw6FQ7Htertq
 0nxblOixFrHDSGMlLdA==
X-Proofpoint-GUID: rAuVN2-dwS45pC6jYpPix9o2ICGRvkFK
X-Proofpoint-ORIG-GUID: rAuVN2-dwS45pC6jYpPix9o2ICGRvkFK
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b6eb5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lf3haRiuEmTuc57r_SoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060090



On 7/3/2026 4:43 PM, Sneh Mankad wrote:
> Document the compatible for Shikra.

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik
