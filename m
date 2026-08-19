Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C8F450400
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136484; cv=none; b=AHpuJWHpfTsiRBJOcDNwIV2jY/Lnc2CXeuuCGMERa/PtzlLNJv7HQeltpcQLrf9K04ZpKUrTbAR7MoS7pymvaQcL9RNLsSZuQ2Gp+j8PK08WtR1kmRWyHDSLpwCP6paH8xzDpnDl7M6oNu804AF5wjSxN/b2VtdpuRcHSBTWpgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136484; c=relaxed/simple;
	bh=FUuzGlbsn8ufCv/IA3RWn2pkSKetBeDEHFVYUqWYrYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhGWJRJ8Tz0DZrAPRtGa8IE1UiJhBSXIydXzkx94QzX+ofaE99uU6D4wao9MVkdJmrcv4LHuKTsoLRGYOiLDz3uON9TmCyVcC1Qv8N5CiTiTavOgY4t1LSlB0uzOp/655SY8ehSnm5qHmPo0z4ANWEVZe1ayXGEHdAHVfpg8VRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkYfleZu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5uOPcvv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkYfleZu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5uOPcvv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7nXE2947157
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpFviTRfVrdR4kvLbeMZlBUZAdoSnygtaFshHvRPayM=; b=WkYfleZuXmswwkgv
	HYQV86f8R6zFFyYamHjDGN+YngYOFq3fAuQJYR1bCXkvbAXc3SpfjazC8jYmvbPP
	w7nRDb3oQ60GyYBSW19+tnYfZW8eQj2mb3q/4YNHuX2N5tbYnt9ryBB75LtXWcXK
	8fewi7EkiImIi6hHFwItxrokiAAl+0mrLhQTcjVQgR8HlJshs5U/qRCNUbt/F0Cf
	3X5bdceSwYoj6Kl0I6ual3tE1+34nvUBijNCkpvxrWTjh5hhWAYuXIt/3vzz4z3x
	WHG1bX01k0DdzDiGdbCvld1RMvOoPCCuubNmYpVT06V5AQMnV7R4mzBMsT3krP7j
	VbgVGg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkasnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:48:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so2977471cf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787136480; x=1787741280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpFviTRfVrdR4kvLbeMZlBUZAdoSnygtaFshHvRPayM=;
        b=E5uOPcvvaKjc85rWikQ5C+7e1YlKnLCb4V/BVVV8wEV1bbXjlxW3wTun7CIAcIqv5I
         GsczNNlmkhbrzZnSdHxDF5E+MfA6BWVSst7Gpa/KCf96msPz6Jk7edaIbjK+a/jona2y
         d+5+YdJBUyvmH8pFc1LgPs1X/JgmcIMJ4u0wjI4HHqWBHgLIIoCz/pugC9kmgOki5Dii
         FKUTnD2W9szgc7wdGq9ntp08pbqBTAsVSuPQm+3IoGySj33uXGsXhhucC44oNA/s9wXe
         BRdaC71pCtfUcXJ6VVC3MOS5iy2MdilHAwcMeiW3xzonC3nEUC9D7ePi6G3McyPRPeTg
         vZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136480; x=1787741280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpFviTRfVrdR4kvLbeMZlBUZAdoSnygtaFshHvRPayM=;
        b=AYURWj9IPfVS3YO4Ebpt8xxx13AU9wFJKDDQF2gve+i4Q+RfLP63jEiMVyON/wIb5g
         n1CvL71lyFNYRSuBTuVKJA+HjcYnQnEM1MHJ2c5vQZfIQB2ujpPCfOY2uNmc7Y0GH3dQ
         Ejy7YWrAwgjvLAllqSoh62uriYDc27P1wN9eTnB3eIVzk5Dw7mqPO8HT/g64gsk1K37P
         LXj6I68WjQkeQwLtFa2ratVQyUL5s3Wh0EP/30puGiiSS0pUTatD6DHTC51gqtStLoZR
         LJ6OKPCrSu2+IPyAe7Lu0Mp1AHgwnzWJliLUzetpR4CuZ67SZ6ThGbn1jwjH4qJD27QH
         WZDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+cm4DwibDQzMeTsmQ0oBqIgfrrq7/+IBv+Lk6FBditMnA9FpkYrYJeEPq1unKn1/R29udoPD7pvsI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4G9Q5yc68ZaGygBKL6MseynaIsOmKzJbI/KNXBstZqSAi/EYo
	Ku8kQz7IsQSjXo8zPs52vATG39/od6OhwbvezWU8kyy1Xn4g8LnUHHnl4fiB7RtnNT/Tx+3U4Fx
	ZqeSsPLlw/GWhk7EpghklDOOCUCgFCmVCDM02nPzWfbe8qjJ1LKhbxhUDf/39vECc
X-Gm-Gg: AR+sD12qqHyDRwzkmAYtAZM0BFXUdGN8PNXOkTd3heM+w5d3gboRgqbASgdfA1uPNHM
	1HibU/GaAE/tGWucC+NEar7lk86HOA5U726Dj7tUNdIRoGw1dHEJOcps1c3Qa39AJd+hiMsf1RP
	L3rra55ZBMX+XLql64ALrI58dhCcuMtSksVZKOxG7QsqLJH7ZhLuIa4B2Ynh7seEUQFWx5NW6LR
	VUrVM/U3eXTROA1nAAv2uNeDHhFyHJcFJCSXWVdAeRHCj1CsTqmu8814ClSYQ4vXPs/QD3l1gBy
	9bQFhGlsGyLDA1ejVORwlmu42RkPgoopvrgyf4BInz+PqV1poanGVKZYAgPldn7trjGM8+x2Ve/
	YjAjtP0t2UXQ8iFk8J81TcbVT
X-Received: by 2002:ac8:5a47:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52dd58ead16mr22933911cf.2.1787136480279;
        Wed, 19 Aug 2026 03:48:00 -0700 (PDT)
X-Received: by 2002:ac8:5a47:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52dd58ead16mr22933611cf.2.1787136479944;
        Wed, 19 Aug 2026 03:47:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c27999asm54338966b.53.2026.08.19.03.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:47:59 -0700 (PDT)
Message-ID: <2542334c-a849-4200-89cd-773350b5220d@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:47:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
To: david@ixit.cz, Alexander Martinz <amartinz@shiftphones.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260810-dw9714v-v4-0-a227cb1d29bd@ixit.cz>
 <20260810-dw9714v-v4-2-a227cb1d29bd@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-dw9714v-v4-2-a227cb1d29bd@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a8589e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=o0BvLoxbr0_xRDxOL00A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX9tFAyYEFAOLO
 7xeuPwInHazEvm6Rm8bXtLsBo0NvNAcb5Kw32dCUefxXKrTWg5oBDjSFSdgIEBlJNcz8LISZCMd
 2JUrk3f7PW4rV5CrXaCIhfGFE0FpZcikxp9cOc0FbnaKKnaig7765dpKIy534/sVEf7eODfAexH
 5ZPwK2g9iqyMVsdypWoIwtpIG0kzHAnD1zYHgJUciCIH6Jcl7SnnasumbjuU80epdaj0svuK0ME
 O4OBqLw9z+41durM0pvx7EKSHTen9aiqWKHtSC5yxC66Oe64pNo71MubjtXz+eSbd2beOfMZhoz
 5epZHAJsNMwBBhNcdB3Tx44kXJQaExQ0AfAjr5f/sSrPMrcd/OMgG3dT2omo8ahwddIrKTN380Z
 FRM+eXZBe9LEEO3KwfsBM4n5jTg8ZZPOaUgXPK+r3T/YsRAz1UzeOdvAHb/Mq20M6QXA/yfDBwj
 w7apQi5VHeQwcFHVukA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX1YWCFQ5+c39t
 zsaXacK01ZuJSwMbn/fRytf3rFEPW5WQ32ors1msUiTZGf0mvIUhPFpQG4AO3/XfpAkmwh/WskA
 Nv/rfl7ndG5hE0My1DWaGVl4g7vf+K8=
X-Proofpoint-GUID: ZDkr-AhEYpbIL8T8n27YA2cZeeEMLjTu
X-Proofpoint-ORIG-GUID: ZDkr-AhEYpbIL8T8n27YA2cZeeEMLjTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190083

On 8/10/26 12:22 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Main rear camera uses Dongwoon DW9714V actuator. Add regulator and
> actuator node.
> 
> Since the actuator sits on the CCI I2C bus, whose 1.8V side is fed by
> vreg_lvs1a_1p8 and there is no place to describe that, keep it always-on
> for now, until bus-supply exists.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
