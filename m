Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ECB388E78
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269712; cv=none; b=DgghkQ27aVB4VOym2Rep4LtlnqHKbnPoEuQ6o7aAPWktxZ87HGQ5FHQN89Ip9aZIheFODp3CfNmTP9VEsAeIW1lFGXvT4no3fR6ydrMbnrTOf0J20F7U7Zdw7YMtrsGZvi+nPVMUNBDC6rUgHKn1y71lURIgO6fKsU17+vmElSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269712; c=relaxed/simple;
	bh=C4IWI5Urz4KtuWZUw5D8TCoVH1+d3S44prv1x9Afu9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAHvbHHM8UIsnXcCgNwZZH+I3SFG23Jq595EHLo9wblo1l0cdKEyf6i9L65jaWql1XRpwzs/jZ4/aeVB+1VOqYCp4yCp8ulGWWY9LftRvDiiV0BPl3AQKEBdgvLcQubQeqUItrcRe+yJghqpVFPkobJRvH3Wdd7Nza/3ADOGphY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjKRB0zm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4hH2wnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjKRB0zm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4hH2wnE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCejSP2476075
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nww5aX/HELUKCVBALV6/EosnyDvF7SxfgMm8lU8E2Wo=; b=kjKRB0zmc5+JAWHz
	2OP7xpsF8MLvUub1WowTKazhWRnlfUhbB7gQPhhD4UPUCj5h4EWgsVCtpcERMD1s
	iSmIq2L08g5mL+qmaPRCa3I7gJL69DaUErDz2m+fzznx8k9UrxG8YDY7FWiA9pge
	a/pesCVSuj5UlFMMCgDiQ5m5U/oI5CEDf0rKpIdLtbS/1kjkwrRuypfxz6QsScLC
	27PboHUGa1QQkxsn81qiyjSWDO0ZK1yXL1rpdhGKHd5uJ/Uke7liJbIusUiB1rcb
	PCQYAE2P/f4acAhIZP2QcAqfYa6RPs/e3/lYeXl0LnhyfrJh9S0dPg3RDJps2hZj
	e34BIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2006k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:41:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2d15c360so32502071cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269709; x=1774874509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nww5aX/HELUKCVBALV6/EosnyDvF7SxfgMm8lU8E2Wo=;
        b=G4hH2wnEE3CstkVko6btI3PMRA6ZNv2Y2vhpQskE2xBEJmzDQ3Ii9EDq923qaJklpZ
         pXEB+9Us4LwM99hue3S17t8qeO1KOX14PceDRH/7yHoMY46CnjjDdHQEbSiZgTZQalZi
         3NMlECY4kLGZVyhgBzdyROC7eLQaOx/O7v3tDiYsX/bDl+1rYF6Q2RKFC0oszlqEX52R
         9VVhlsoIMXXH5X+iDLiJbyCPwx6YDo6Lrwo7PCwfFQizrZssF7Qh2ryXWsp/xMOzMKjM
         g2WzfU4pAyMMasGq9yuzXCnQaNtR9hfMBoE7gw25vFGmz0M4azXJjp7mcEd7MPmjsjnl
         stkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269709; x=1774874509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nww5aX/HELUKCVBALV6/EosnyDvF7SxfgMm8lU8E2Wo=;
        b=buiJ5T/yO+b0WUATOnLUgLvIwSGaM1SkFN5fES/fN0A646I566ykbFq/1KcAumU91U
         Ys4zrBncgWTyCsUwcU0b+AA4Dbp8kFcxAcRsPTDcWK6Z9zBcWSy5xHOLjaaytk2s5FiQ
         rGI6Vguq2whf3Xr5/NhmCxHUio9S78sk8kZbvPRnPaq4ntcV63rJQ6gH6/LNRGF3Q4vH
         HeAuSlhsZz9eSVAhIYpmPhmgxR8Htoc4UcqAD/8Nz+UX4D+s1k1a9lkaAM95n/Gmvo4m
         0eewtmEd6yAsvXzOYPm5okEL6akme5psiHMPwk7Du06F6xLSmKsM6C4MIXrgUA8g1mVC
         ul2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6g8Ig55Yi9Cui0kmLjaDtPWWyFbxfMBZv3N/HYqBm3vY0NU9Ef3faIFn2b27xiiePxysO5MvCgZJF@vger.kernel.org
X-Gm-Message-State: AOJu0YyzfuqSWB0hB8PFDMfZcuzxZgsd0GF03NcjxdCh4gozrd8PUF+S
	/K4L3xCSG5I8xhrN/Y2Al2u6SKjLVD0f0kdlMH3E8WKlD8YGG5rWAcEoOTGeicpFyFOPxZYxEKT
	owoGcLJk1QAz6cA7Rw6G8UpokGRTxGEdPhCxSlfKXsWHOSiudsSyYXnY85ITpkgvK
X-Gm-Gg: ATEYQzyS0EPuTdkrx4iLBq8ViBTtME99FV2/XJeOwrggHVfm8V+dFK8BJr+4PwfPmhe
	xVeiYfMSsdkEZYBDyCSNkO47DUriZI0bJ1A+akXd4p9HNDBTO8A27iLhG7bq6127u+AJRODFCCR
	e2nJfghbjiOwTztqOjZLqS+V+6xCzU8INpeIZ2ntddw1j7RV3WfRCH4019Of39TTKZeQ79EpU3t
	lqA5Vez74pw0bDpt5Z8c3yPMGxFMrgSsAfihlfrPY1DfZLKPj58WN7joFE4E5ZP0C7CmSwjZ0Nd
	HxlRWrBFfmoM4MZCcvxD05TB6cfOiuMDHhGjZ1uu6Y+hpU+coZCmOLbSkofVbEEnvyPIt+sUSKa
	KmWxxU02sHLCAbcHdqGb6D3H+f5YCya4mlN9EBV1/i36nBEU3MOxYGxo1Z5cC4Lt+sxSM98SvzC
	mmD20=
X-Received: by 2002:ac8:7d09:0:b0:509:bed:db5 with SMTP id d75a77b69052e-50b37518e31mr143728571cf.7.1774269709471;
        Mon, 23 Mar 2026 05:41:49 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:509:bed:db5 with SMTP id d75a77b69052e-50b37518e31mr143728331cf.7.1774269709055;
        Mon, 23 Mar 2026 05:41:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b984bfdb2f1sm311909166b.19.2026.03.23.05.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:41:48 -0700 (PDT)
Message-ID: <3d20a901-0e73-4c95-8721-cf3b1265bac2@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:41:46 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting
 bias pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1350e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=wBgx0QqB7cFJGvLgnJUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: l0G9LMpIbz-I7Bjnzw6CoCEbCfFNUCnf
X-Proofpoint-ORIG-GUID: l0G9LMpIbz-I7Bjnzw6CoCEbCfFNUCnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfX7WUtmCwKQYLu
 VPx8BDoGGQ+e0LI1GbAUpaFGpT8h+Rdku/lltDftCVUiMKt48uQhI75fXDi9+8ltFxWlpsvsTQt
 qvyHzWoznEgAjAIJRQ62NfaYnu3WgKWN0bCuq+UqfGkAbfk1PjHKH5Y8dk9tgxzZClE55b/RCxv
 b16pmX7De56Ssn4Vpju6tLCUTdKYoJ1zlLkVUKgAIw86Fo5QjV13kYdSwG4J87q+sboXJoqjlDK
 W8QcWcwZGzhjTH5zdp0m9yQsO9ccEIX3swjgRrzmbJNXe/vdujsTwh/5Fhb+eeBWkglaj8QJoQz
 409A1M8NbBTj1++8RZPYVU42xwcEwdaeCvdZI8XxvTpdb2bkiT+ybo4Gtz/YvW2bCvHKO/brM51
 j77wUe75G9Fif5mbljWnrQbKeJCmAUry13B6R+1Pv7sSJTO452UzJbqpggLDlE8DKU2dH3GzV2m
 GZVcmOP++ezEw77dtRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098

On 3/19/26 9:55 AM, Luca Weiss wrote:
> The pinctrl nodes from sm6350.dtsi already contain a bias-* property, so
> that needs to be deleted, otherwise the dtb will contain two conflicting
> bias-* properties.
> 
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/r/20260310-maritime-silly-05e7b7e03aa6@spud/
> Fixes: c4ef464b24c5 ("arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
