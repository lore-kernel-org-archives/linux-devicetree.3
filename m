Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA83D3E4C90
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371771; cv=none; b=mTxF4JPnKQsXFZ2lxXRs9osmSQ+a8HBMMRLDHDbEq/PFJJE7DtfUgyldqh8i63zHGWm/DDP1elWCL6ap/WKaCTh84bvgEqUpQ+5bitRj7KBbrc6IgENHmdKFMETm7xlWM/sqad7HE3YLXRGFGmT/88gNaslD/qUBIWDreQ6Up+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371771; c=relaxed/simple;
	bh=+Xgv1A1tyIYQo04kYDL62oQ7DJQJ0ukUjIS2GQ6e9qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+6KV4APi7WMsvC0NEFvkEQqNAyO1tf1r9axTyd8XhhHKiaV2I9hfIp147i0nYl+/7S6WSoqdWrWyMKLNnKX4X6F6Gs/eMD/YwgsBjEDCuVOWHl6EHUr+Api8IzzVPbsl5mR/2hFxQw0QDfDe0rXinwalNHJ0L0y9CYDmFhsP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlfTLmEN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwOZjCtI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlfTLmEN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwOZjCtI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ifoS3368748
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XFGQubof2OTfl6Uw+DrwikAF
	xXdv49oU0NYc0i9jX/w=; b=hlfTLmENbKHejq5c1PsnEbjD2RXRw1g/Z8l8GOsk
	1N/60IDHZdDJWYDBInBuKi/3JwnsIF8ct4QE6t5av2o3CqYtqE7E5LZmn2oxboVt
	/dbnre4p3qAfPT+rAcoPPg6BuZ6w/1ZbY2vvIy8VDo2puWelh/ZTS7gttlARs+DB
	2m9vSHwFnvHranCE94fLyuvzuszqD9zB1yeRNTi4Jr7hmiKhmIGy2kQHVyePgUgo
	e+OwQJbQ+IBVhnKRLuaSlkB99QjwKDIT+JEI8cPOEhzycVPp5OgeORtwPzToA59W
	pLaaEftUhvTgwQ2rXQNR0n6A3pW3oWwSHe+9H+aGq7fPuA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5k78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a07b5b5efso267041485a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371768; x=1789976568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFGQubof2OTfl6Uw+DrwikAFxXdv49oU0NYc0i9jX/w=;
        b=QwOZjCtIxfQfQuu0dtOXzJjivyG00elaqHqlEaAAFtjggmHGWdtgtXIyyoij2ZPpUp
         vvY0UKaz6YSl1k89EGh3XDpY+1/BCTZTuoNS9doN1QmQMxCf9GwtlTLMa+8/6RAKMSqw
         5PcQr1PehMUB7yAUUecmPshoXmxNdqMEUUGadUw3KJzsMxU70/RlDgxqVvGURehkUIPA
         ZpBevrjFZEhFzYDpGxlUg6/w5ob7UlgA7nxPLi8YRaV0iofOY0AFTjmRFzjy8l4a50qU
         jzqkm9S21nEYbeRYt1eUcYrm5PW/tWl90Lk3Sb/ArkCRn0P5sYlo6x78yoWcoNN+fuzp
         1SMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371768; x=1789976568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFGQubof2OTfl6Uw+DrwikAFxXdv49oU0NYc0i9jX/w=;
        b=Px3XZiEp6hO32Mv4MxgAkMGCFk+qSBDVB1j1pSRXxICKpL4T9OHTQYZjlRgzHheUn+
         cNzzsgY5oX1NMLDe1G8nPI4fkFrJ5TZVdHf7rqUJtvXcUJr51LGzI+PAR9s/4B8xPcuK
         9PG4SbAkymeHIIqKKUg37zasjfDa1S2HL0vKPd4rM5V9cuwe3WVamNGQrAEACD7hJCnr
         7JZg1UuXe6QgNa/+uDnqLuLKPvmy3D0kqzgUGo093z5Lorf6HbDhTrDIVjJfgDRbUXs5
         ZePfnWJKpl5F3V02yig72uUklsLa/9CCoxPe47OjJXxB15ozurvb5aTa1FB4gvKrAB+h
         umUA==
X-Forwarded-Encrypted: i=1; AKwUvBwLdYP8pW4PfFDmRgbGB23Vs7Bb7ATBWsd4yCRzd4uVmfNlP+A8YDq7Yg0YXnDOZPuSsqpC0CTuYaZC@vger.kernel.org
X-Gm-Message-State: AFuF++n6v7yVh7eacwMKoRE9+bSDbWN1yJnq4wNPuWbJDwsONpq6JZwx
	YIp0wfE58LiLJIHl0+KQfir2WHY48i64+pGGkJeRFeZXMnQI4DQb9vZSGwIhBAqbsGsTPlV5I0u
	DALr6spEJyvYp1ChLLG9bvvYbLk99DIikN2RSi3AEMUAruleFHQOssnfQitIXilj/
X-Gm-Gg: AYBFou01EjfkX03BLivy4WLvxoAdc1qowPkbzstNFAIZcuX102utKdDExMkmobFCyqe
	Xa7mXzvTkgBdMEWhtffNtZKnlyZgDuXOdqxo8qI9bFHLHsF1U+wRF8BVZT1JgZxPZA81EyKE5Qs
	9gw9skeAChbuskEBPhj62rMQ+2ylMsSuivQuSM4FADpwQg0Ng1MxHL9wYM8ynxTTV5CYyJ/qEOv
	TSIS92n8T87ifiSY0b/LzUXzFldbJ6SYuUMVWKlpLoe0BSt1G7/gWpcz90iEFaNeSUDwza+OPCl
	nDk/Lsx8GnuuJhD5al13N0tPYNQkeFoZ7OVg0Q9aFFof/Q8DlghSkMfeslaPkQwUOeDboPsMhuB
	HSuGkA0h9qp+YoMo=
X-Received: by 2002:a05:620a:4710:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93a18551fc3mr544133385a.8.1789371762854;
        Mon, 14 Sep 2026 00:42:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93a18551fc3mr544130885a.8.1789371762350;
        Mon, 14 Sep 2026 00:42:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e69f053b7sm217241795e9.9.2026.09.14.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 26/31] arm64: dts: qcom: sar2130p: Add domain idle state
 names
Message-ID: <iongvsbeork4xzzumcbyur22lom3dthddcwevq52tneeooqx3z@dqojykfp6nbs>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a578 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX6kry4soyW7lY
 RKMftdInj99Gh/umLftDX9s5amEuKJYub/A2Zvmwd+KOUoaTQ7S/NSAf+WVf5XgWZKSpk9lDwjX
 sVrB0TaBVmokigOaPfbuELQ1VLZi+A9tx2Bbs1SB/vpnK/RY+3aiFU8uZMJCwSRZxQU7KjCQmgO
 qLPDCWwGYb8yS470aS9vNcB/AnYkfSFehZl4Z4MJYoHTzQHB4GVOiLmYHrT2tvqH0rxykkHvKTS
 4AVFFy7isDbFk+QfNMqrEI9GoDJJHY7/rFoKM5EUQd3MSiDCo3ZZliaVQcZ9cGHpo/N9a+ESsNZ
 QzXdGYxAqfuhiAAQB/z+15+jBMKFqIdC95mlW/OVdcDSoBhXgD/9gMy5yaiSndvGETuWeYFxTOv
 IBXAeQDv+HWBXg2lHEHiEFS6viWC1KPzYl7qponxUf06DICA/vjzQsGhpozZIsaegtzg224Jy1F
 3mEn//Rp6dRQ8aC89+A==
X-Proofpoint-ORIG-GUID: jt_JqtM09gNubQsDGa9pKTPOoLMtLmS-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXxb2mYpbZOYYJ
 dlgIjYaweFthjf/VMREwe/H8M2nu5SwImR6x8cgQaiKg9PbMa7gDqKQ95rGT0dueTRgyrSsRuCJ
 FJ1jmhXXj5XysgcU5NPGzbiIchJrdeI=
X-Proofpoint-GUID: jt_JqtM09gNubQsDGa9pKTPOoLMtLmS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:58, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
