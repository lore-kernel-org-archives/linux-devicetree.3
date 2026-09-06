Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63F36C581
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709887; cv=none; b=oPs3vD6T7QPDEQ9osaxiFzooGYi5p14TEBd1wB4SU+0ujPGa4BAiWMTbZtfXcUh6Z3SsGybv88w4GUEpqHBGU/TUlgyJcL1IGwVSoAdAsIzAKPXTESr/cFUz9ibNyFGkQl/+jFNRB/KTkHLLz1bWMuEGImNbsT/gD6eOQ0EIljU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709887; c=relaxed/simple;
	bh=aBvKHXJMUyfS8/ReEsoPVCIlZRhVrQR480IPSglyxog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPPJKYDQxtt+u7ZJDhohMuBSO6Ugp1ynoSvo/xG96fuIYCMOhvw91HXOmPmtLyVRNTPtJA39n59kr3dQir75AVS4hi9hfsC9KQ7QHpEiG//QkB2WfsxSmeXu17aI0cP3LN02ZtUfgmz0q6dKr/xckg/BuRXZl0Fwsas0PLu97zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLmEQD6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaPB7chR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLmEQD6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaPB7chR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EWZcB1301233
	for <devicetree@vger.kernel.org>; Sun, 6 Sep 2026 15:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCNnlg4GyeLNFBgZB9Ozm8QTq3ZkWVLYSJhs0FHtgyo=; b=DLmEQD6Ii5g5CD3L
	FCtBjZ9lXnkhOq/YfgNIJf6rThoNoOq8496Ys2s/zcgDEbMM+yVBpkOke5DwMaCH
	RR07zWJd+EyUU5vW1b5yApfl3AuTr1B5Ylbj+jauQmBJMoe2vSLPf//JK1lQ2sLW
	58HyWmyfFkhKNxrRqafZZyW1GNgXU6HAkMU2NqezcGJEoYvrWwPs3k/ui7PoRLaE
	a9hGvrtLnLYVDnuMpNbgXDj5G0JWHWxkDVK48OTKhOOXYotCFKMNvoEkS8PMrfVA
	8u5+iu7zJjM1BzHCCuLc6J7i0wT4VIUSp+hXF1FFSBdLldtRWupyBVrYultfYd+H
	eyrtMA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggba3kqg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 15:51:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3164359a91.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788709884; x=1789314684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCNnlg4GyeLNFBgZB9Ozm8QTq3ZkWVLYSJhs0FHtgyo=;
        b=iaPB7chRrUwVqrsYjyBlwkVRs6HJUO7X9qXMcSumcJ21v2FlE2dm5RabE5wjoWpQ5q
         9fAYNi5bF+D++zq1EJcmoZD7DSHQyTKFOD+1g58CidbtBVStZPdODY4q+myMmD+WmpJH
         26YpgRH8c4aoByizxviOh7rwSUHFCr10KkD2dRM9vnbT/GD4/pEWWIXyEz2JFR7lZ8ZJ
         uoNdc/7ltOmVhEvO/OS0IEaqMmMmy6LTthH0a8/Tln7cDJlqDpF/gRKInGPECL8nRv3g
         sgtrs6hLUC5ZD/Yr+eujXR71iEPvaqPYK6LtESybQooQ//toGOYVN1Wi7+7kb/h9Ctr7
         0I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788709884; x=1789314684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCNnlg4GyeLNFBgZB9Ozm8QTq3ZkWVLYSJhs0FHtgyo=;
        b=TCjsZDRNCL5pHVksnISH9Zk9HoqyQ1iigTSziU4eCaya0iUhqCCHp4YmXRK+rCmyxp
         c6YKIR0VNrhx4LpwVmRVuy71BktOKc3tcUwGwY24yMlVZQ/EcKZ10lcivYGzJtr3DnXy
         sXUcmivkTqKqcBDiFfhXB7wyTGnLxvG0YE4JqGZT1JPnUmmBQ5p2i84H+mhNOSP5uW/D
         N5eLBSImn1YppnRQHP2SMrfsG+llShl3d+nPl4pvOs6/3Bd5T3NaJm5VpM4Awwv/tuP4
         VD/7lsHX9gzin3epwYDiKGVjLSOUb+kdrxgqlueKJDTr/CSE9EqGtBmNr7o9Ke7VhuuK
         hDCg==
X-Forwarded-Encrypted: i=1; AKwUvBxiXSu9XcSGXhjMXPuB1tteh7LOgriRgWc3TpYBCD5U0hfN/avV1MCR1DlDwtPm2nIFFjSzbv76wjMB@vger.kernel.org
X-Gm-Message-State: AFuF++k4yoJWZiLCEe8Tv7Gx+eypm/AH6LpQeiQI/YS31fa+1p19rOP4
	tYOejuYd7AsL4wO1CcGet1w4JzYT9GbUq01NJNC1Yjz2retRuDplwwVw5ft1vNTWCbM1AIJOT1X
	IS2WXMc0YgaWq1jyWtlfDesbSfEECNR85PgYf8HDNx7KVa4aOeB7jQRZV8p0NdKk5
X-Gm-Gg: AYBFou0JFxUpThqNri+nJN3Fxezh5XSn1Hx2vE14zo07mQ2VrRM4M8P4aV6KXXRFe8h
	EP+gTZtsHyp/VhuXuC1fTfKIV6oBFjqKqWSBYPj+OuFIpExbFodVLBGpBpUfKJB1bcpcA3hAdQF
	jn17nJH+dp0/C/5M8sJtcoyP2/iLZuMxI0+Nm8IlBVocD1Vl42psOTGvPO6KJYd6l0Fh8YgOc4F
	IM++mKuWQA4G0MicjQKYqdQO7ikurUwrjRuYEJzazwppZ8tLOtHLaWMpZOD7VdRvzrLteT5S+gU
	OCSubTvxJYccoKCk84yiXoZXFwNmQNAxHB8PaEPh7w7oC+6sJWoJ43UxokTjHEkSBjB8JC8YRHc
	lGUJPdool12sq6xqlTS4/WUt42liv
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr27450034a91.3.1788709884245;
        Sun, 06 Sep 2026 08:51:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr27449993a91.3.1788709883853;
        Sun, 06 Sep 2026 08:51:23 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm19755723c88.11.2026.09.06.08.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 08:51:23 -0700 (PDT)
Message-ID: <3a2f535c-7ccb-4b50-a6fc-f73ec02d4acf@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 21:21:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfX0SkaRv29RdPR
 mdYLR7EteY7KOzTIJksTvr0ej8yEcLaHVIhWze4+RtL62bgwWhi59Ulwhl2ZzB5jYNe0dpVbX0i
 OPcn3HB6yFf9h6ieDPe98+uJWoP59U11OQkQnnzOOm54nSz5cQyzv15V0VcXN7z0ExFWybryqgt
 CJpv2wxGxNoQkH2Of901x2rg8sBXcXsWsvUsseGABMloN8LpnxSI+vSxK6phb9MxvnK4pBFHWk9
 E38ZFPo5TS4nBf1Ysh9wHtxotn7gboXyuT5zMCvANXKgmyNcs1OEzNk46vpCg2YM3lRUcNMgtx4
 62PTSOsI/4alWo/gxaBTQhVa37MlmsYYtES7p3f0/Ubha7cby8HZdDydLftKsC0hf2gerEgNFQR
 n6O9PVARG7cetDirCVuNYnNlPovgaUnxY1WCVf/FGSh0I19jDmfcLuKc01FEvCK+zNKCs6hkmmW
 qVYCHo4jMcci4sNiLPw==
X-Proofpoint-ORIG-GUID: TrvLGvBSvfhN74ma02ARLtUcG35wXdoO
X-Proofpoint-GUID: TrvLGvBSvfhN74ma02ARLtUcG35wXdoO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfX41rxAB/pX15/
 LuaBLaz1WYCCTt/Fz/7UvSEFMqo0Hq7RG+asrmczfKtXwNdWMpmi3vN84wEgeD+Zg8vgeG9bALm
 cEUSgWPeQYEibX+DNLhZuwe8nO0F6ro=
X-Authority-Analysis: v=2.4 cv=Tf2mcxQh c=1 sm=1 tr=0 ts=6a9d8bfc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0VQvOID68a5ICqMF5fEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060176



On 04-09-2026 02:14, Bryan O'Donoghue wrote:
> I've retained the callback indirections give us scope to add in another type of
> future PHY including potentially adding in the 2PH later on.
> 
> This driver is tested and working on x1e/Hamoa and has been tested as not
> breaking sc8280xp/Makena and sm8250/Kona.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

For the series:
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

---
Regards,
Nihal Kumar Gupta
